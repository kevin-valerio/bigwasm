use anyhow::{Result, bail};
use clap::Parser;
use std::{mem::size_of_val, path::PathBuf};
use walrus::{
    DataKind, InstrLocId, MemoryId, Module, ValType,
    ir::{Instr, Value},
};

const SIZE_OF_FEEDBACK: i32 = size_of_val("COV=000 ") as i32;

#[derive(Parser)]
#[clap(author, version, about, long_about = None)]
struct Args {
    /// Input WASM file to be instrumented
    #[clap(value_parser)]
    input: PathBuf,

    /// Output WASM file after instrumentation
    #[clap(value_parser)]
    output: PathBuf,

    /// Offset at which to insert the coverage data (default: 100000)
    #[clap(short, long, default_value_t = 100000)]
    offset: i32,
}

fn insert_data(module: &mut Module, offset: i32) -> Result<()> {
    let cov_data: String = (1..=999).map(|i| format!("COV={:03} ", i)).collect();

    let memory_id: MemoryId = match module.memories.iter().next() {
        None => bail!("No memory found in the module"),
        Some(id) => id.id(),
    };

    let data_id = module.data.add(
        DataKind::Active {
            memory: memory_id,
            offset: walrus::ConstExpr::Value(Value::I32(offset)),
        },
        cov_data.into_bytes(),
    );

    let data_segment = module.data.get(data_id);
    if let DataKind::Active {
        memory: _,
        offset: const_expr,
    } = &data_segment.kind
    {
        println!("Coverage data inserted at offset: {:?}", const_expr);
    }

    Ok(())
}

fn main() -> Result<()> {
    let args = Args::parse();

    let mut module = Module::from_file(&args.input)?;

    insert_data(&mut module, args.offset)?;

    let debug_message_type = module
        .types
        .add(&[ValType::I32, ValType::I32], &[ValType::I32]);

    let (debug_message, _) = module.add_import_func("seal0", "debug_message", debug_message_type);

    let mut index = 0;

    for (_, func) in module.funcs.iter_local_mut() {
        let entry_block = func.entry_block();
        let builder = func.block_mut(entry_block);
        let mut new_instrs = Vec::new();

        // Process each instruction and insert debug_message call after control flow ops
        for instr in builder.instrs.iter() {
            new_instrs.push(instr.clone());

            if matches!(
                instr.0,
                Instr::Br(_)
                    | Instr::BrIf(_)
                    | Instr::BrTable(_)
                    | Instr::IfElse(_)
                    | Instr::Loop(_)
            ) {
                println!("Found {:?}, adding callback", instr.0);

                // (i32.const <pointer to feedback>)
                new_instrs.push((
                    Instr::Const(walrus::ir::Const {
                        value: Value::I32(args.offset + index * SIZE_OF_FEEDBACK),
                    }),
                    InstrLocId::new(instr.1.data() + 1),
                ));
                // (i32.const <size of feedback>)
                new_instrs.push((
                    Instr::Const(walrus::ir::Const {
                        value: Value::I32(SIZE_OF_FEEDBACK),
                    }),
                    InstrLocId::new(instr.1.data() + 2),
                ));
                new_instrs.push((
                    Instr::Call(walrus::ir::Call {
                        func: debug_message,
                    }),
                    InstrLocId::new(instr.1.data() + 3),
                ));
                new_instrs.push((
                    Instr::Drop(walrus::ir::Drop {}),
                    InstrLocId::new(instr.1.data() + 4),
                ));

                index += 1;
            }
        }
        builder.instrs = new_instrs;
    }

    module.emit_wasm_file(&args.output)?;
    println!("Instrumentation complete, written to {:?}", args.output);

    Ok(())
}
