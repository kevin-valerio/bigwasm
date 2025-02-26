use Value::I32;
use anyhow::{Result, bail};
use clap::Parser;
use std::{mem::size_of_val, path::PathBuf};
use walrus::{
    ConstExpr, DataKind, FunctionId, InstrLocId, MemoryId, Module, ValType, ir,
    ir::{Call, Const},
    ir::{Instr, Value},
};

const SIZE_OF_FEEDBACK: i32 = size_of_val("COV=999 ") as i32;
const OFFSET_DATA: i32 = 1000;

#[derive(Parser)]
#[clap(author, version, about, long_about = None)]
struct Args {
    /// WASM blob to be instrumented
    #[clap(value_parser)]
    input: PathBuf,

    /// Output for instrumented WASM blob
    #[clap(value_parser)]
    output: PathBuf,
}

fn main() -> Result<()> {
    let args = Args::parse();
    let mut module = Module::from_file(&args.input)?;
    insert_data(&mut module)?;
    let debug_message = debug_message(&mut module);
    let mut index = 0;

    // For each function of the blob
    for (_, func) in module.funcs.iter_local_mut() {
        let builder = func.block_mut(func.entry_block());
        let mut new_instrs = Vec::new();

        // For each instruction, if CFG instruction, call `debug_message`
        for instr in builder.instrs.iter() {
            if is_edge(&instr.0) {
                println!("Found {:?}, adding callback", instr.0);

                new_instrs.push((
                    Instr::Const(Const {
                        // pointer to the text buffer
                        value: I32(OFFSET_DATA + index * SIZE_OF_FEEDBACK),
                    }),
                    InstrLocId::default(),
                ));
                new_instrs.push((
                    Instr::Const(Const {
                        // the size of the buffer
                        value: I32(SIZE_OF_FEEDBACK),
                    }),
                    InstrLocId::default(),
                ));
                new_instrs.push((
                    Instr::Call(Call {
                        func: debug_message,
                    }),
                    InstrLocId::default(),
                ));
                new_instrs.push((Instr::Drop(ir::Drop {}), InstrLocId::default()));

                index += 1;
            }
            new_instrs.push(instr.clone());
        }
        builder.instrs = new_instrs;
    }

    module.emit_wasm_file(&args.output)?;
    println!("Instrumentation complete, written to {:?}", args.output);
    Ok(())
}

/// Returns true if the given instruction represents a control–flow edge
fn is_edge(instr: &Instr) -> bool {
    matches!(
        instr,
        Instr::Br(_) | Instr::BrIf(_) | Instr::BrTable(_) | Instr::IfElse(_) | Instr::Loop(_)
    )
}

/// Loads the `debug_message` function
fn debug_message(module: &mut Module) -> FunctionId {
    let debug_message_type = module
        .types
        .add(&[ValType::I32, ValType::I32], &[ValType::I32]);

    let (debug_message, _) = module.add_import_func("seal0", "debug_message", debug_message_type);
    debug_message
}

/// Insert our string into the data section of the bob
fn insert_data(module: &mut Module) -> Result<()> {
    let cov_data: String = (1..=999).map(|i| format!("COV={:03} ", i)).collect();
    let memory_id: MemoryId = match module.memories.iter().next() {
        None => bail!("No memory found in the module"),
        Some(id) => id.id(),
    };
    module.data.add(
        DataKind::Active {
            memory: memory_id,
            offset: ConstExpr::Value(I32(OFFSET_DATA)),
        },
        cov_data.into_bytes(),
    );
    Ok(())
}
