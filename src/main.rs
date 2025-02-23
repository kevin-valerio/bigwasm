use walrus::ir::{Instr, Value};
use walrus::{InstrLocId, Module, ValType};

use std::error::Error;
use walrus::DataKind;
fn add_cov_data_to_wasm() -> Result<(), Box<dyn Error>> {
    let mut module = Module::from_file("dummy.wasm")?;

    let cov_data: String = (1..=500).map(|i| format!("COV={:03} ", i)).collect();

    let memory_id = module
        .memories
        .iter()
        .next()
        .expect("No memory found in the module")
        .id();

    let data_id = module.data.add(
        DataKind::Active {
            memory: memory_id,
            offset: walrus::ConstExpr::Value(Value::I32(100000)),
        },
        cov_data.into_bytes(),
    );

    let data_segment = module.data.get(data_id);
    if let DataKind::Active { memory: _, offset } = &data_segment.kind {
        println!(" offset: {:?}", offset);
    }

    module.emit_wasm_file("dummy_modified.wasm")?;

    Ok(())
}

fn main() -> walrus::Result<()> {
    add_cov_data_to_wasm().unwrap();

    let wasm_file = "dummy_modified.wasm";
    let mut module = Module::from_file(wasm_file)?;

    let debug_message_type = module
        .types
        .add(&[ValType::I32, ValType::I32], &[ValType::I32]);
    let (debug_message, _) = module.add_import_func("seal0", "debug_message", debug_message_type);
    let mut index = 0;
    let size = 8;
    for func in module.funcs.iter_local_mut() {
        let block_id = func.1.entry_block();
        let builder = func.1.block_mut(block_id);

        let mut new_instrs = Vec::new();

        for instr in builder.instrs.iter() {
            new_instrs.push(instr.clone());

            // After every control flow instruction, insert the debug_message call
            if matches!(
                instr.0,
                Instr::Br(_)
                    | Instr::BrIf(_)
                    | Instr::BrTable(_)
                    | Instr::IfElse(_)
                    | Instr::Loop(_)
            ) {
                println!("{:?}", instr);

                //			(i32.const 0)	;; Pointer to the text buffer
                new_instrs.push((
                    Instr::Const(walrus::ir::Const {
                        value: Value::I32(100000 + index * size),
                    }),
                    InstrLocId::new(instr.1.data() + 1),
                ));

                // 			(i32.const 1)	;; The size of the buffer

                new_instrs.push((
                    Instr::Const(walrus::ir::Const {
                        value: Value::I32(size),
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

    module.emit_wasm_file("instrumented.wasm")?;
    Ok(())
}
