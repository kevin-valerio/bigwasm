use Value::I32;
use anyhow::{Result, bail};
use clap::Parser;
use ir::{Block, Br, BrIf, BrTable, IfElse, InstrSeqId, Loop, Visitor, dfs_in_order};
use std::ops::Deref;
use std::{mem::size_of_val, path::PathBuf};
use walrus::ImportKind::Function;
use walrus::{
    ConstExpr, DataKind, FunctionId, ImportKind, InstrLocId, MemoryId, Module, ValType, ir,
    ir::{Call, Const},
    ir::{Instr, Value},
};

const SIZE_OF_FEEDBACK: i32 = size_of_val("COV=999 ") as i32;
const OFFSET_DATA: i32 = 100000;

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

/// A struct containing a list of every blocks
struct Blocks<'a> {
    blocks: &'a mut Vec<InstrSeqId>,
}

/// Visitor to visit each blocks
impl<'instr> Visitor<'instr> for Blocks<'instr> {
    fn visit_block(&mut self, instr: &Block) {
        self.blocks.push(instr.seq);
    }
    fn visit_loop(&mut self, instr: &Loop) {
        self.blocks.push(instr.seq);
    }
    fn visit_if_else(&mut self, instr: &IfElse) {
        self.blocks.push(instr.consequent);
    }
}

fn main() -> Result<()> {
    let args = Args::parse();
    let mut index = 0;
    let mut module = Module::from_file(&args.input)?;

    insert_data(&mut module)?;
    instrument(module, &mut index, &args.output)?;

    println!("Instrumentation complete, written to {:?}", &args.output);
    println!("Map size: {:?}", index);
    Ok(())
}

/// Insert our string into the `data` section of the blob
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
/// Loads the `debug_message` function
fn debug_message(module: &mut Module) -> FunctionId {
    let debug_message_type = module
        .types
        .add(&[ValType::I32, ValType::I32], &[ValType::I32]);

    let (debug_message, _) = module.add_import_func("seal0", "debug_message", debug_message_type);
    debug_message
}


pub fn instrument(mut module: Module, index: &mut i32, output: &PathBuf) -> Result<()> {
    let mut new_instructions = Vec::new();
    let mut blocks = Vec::new();

    let debug_message = debug_message(&mut module);

    for (_, function) in module.funcs.iter_local_mut() {
        blocks.clear();
        blocks.push(function.entry_block());

        let mut visitor = Blocks {
            blocks: &mut blocks,
        };

        dfs_in_order(&mut visitor, function, function.entry_block());
        for block in &mut blocks {
            let instructions = &mut function.block_mut(*block).instrs;
            new_instructions.clear();
            new_instructions.reserve(instructions.len());

            for instruction in instructions.iter_mut() {
                match &instruction.0 {
                    Instr::Br(_)
                    | Instr::BrIf(_)
                    | Instr::BrTable(_)
                    | Instr::IfElse(_)
                    | Instr::Loop(_) => {
                        *index += 1;
                        new_instructions
                            .extend_from_slice(insert_callback(index, &debug_message).as_ref());
                        new_instructions.extend_from_slice(&[instruction.clone()]);
                        println!("Instrumented {:?}", instruction)
                    }
                    _ => {
                        new_instructions.push(instruction.clone());
                    }
                }
            }
            std::mem::swap(&mut new_instructions, instructions);
        }
    }

    Ok(module.emit_wasm_file(output)?)
}

fn insert_callback(index: &mut i32, debug_message: &FunctionId) -> Vec<(Instr, InstrLocId)> {
    let offset = OFFSET_DATA + *index * SIZE_OF_FEEDBACK;
    println!("COV's offset: {}", offset);
    vec![
        (
            Instr::Const(Const {
                // pointer to the COV data buffer
                value: I32(offset),
            }),
            InstrLocId::default(),
        ),
        (
            Instr::Const(Const {
                // the size of the buffer
                value: I32(SIZE_OF_FEEDBACK),
            }),
            InstrLocId::default(),
        ),
        (
            Instr::Call(Call {
                func: *debug_message,
            }),
            InstrLocId::default(),
        ),
        (Instr::Drop(ir::Drop {}), InstrLocId::default()),
    ]
}
