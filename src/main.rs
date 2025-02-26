use Value::I32;
use anyhow::{Result, bail};
use clap::Parser;
use ir::{Block, Br, BrIf, BrTable, IfElse, Loop, Visitor};
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
    
    let mut index = 0;

    instrument(module, &mut index);

    // module.emit_wasm_file(&args.output)?;
    println!("Instrumentation complete, written to {:?}", args.output);
    Ok(())
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

pub fn instrument(mut module: Module, index: &mut i32) {
    let mut new_instructions = Vec::new();
    let mut blocks = Vec::new();
    let debug_message_type = module
        .types
        .add(&[ValType::I32, ValType::I32], &[ValType::I32]);

    let (debug_message, _) = module.add_import_func("seal0", "debug_message", debug_message_type);
    for (_, function) in module.funcs.iter_local_mut() {
        blocks.clear();
        blocks.push(function.entry_block());

        let mut visitor = AllBlocks {
            blocks: &mut blocks,
        };

        walrus::ir::dfs_in_order(&mut visitor, function, function.entry_block());

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
                        new_instructions.extend_from_slice(&[
                            ((
                                Instr::Const(Const {
                                    // pointer to the text buffer
                                    value: I32(OFFSET_DATA + *index * SIZE_OF_FEEDBACK),
                                }),
                                InstrLocId::default(),
                            )),
                            ((
                                Instr::Const(Const {
                                    // the size of the buffer
                                    value: I32(SIZE_OF_FEEDBACK),
                                }),
                                InstrLocId::default(),
                            )),
                            ((
                                Instr::Call(Call {
                                    func: debug_message,
                                }),
                                InstrLocId::default(),
                            )),
                            ((Instr::Drop(ir::Drop {}), InstrLocId::default())),
                            instruction.clone(),
                        ]);

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

    module.emit_wasm_file("toz.wasm").expect("unwrap");
}

struct AllBlocks<'a> {
    blocks: &'a mut Vec<walrus::ir::InstrSeqId>,
}

impl<'instr> Visitor<'instr> for AllBlocks<'instr> {
    fn visit_block(&mut self, instr: &Block) {
        self.blocks.push(instr.seq);
    }

    fn visit_loop(&mut self, instr: &Loop) {
        self.blocks.push(instr.seq);
    }

    fn visit_br(&mut self, instr: &Br) {
        self.blocks.push(instr.block);
    }

    fn visit_br_if(&mut self, instr: &BrIf) {
        self.blocks.push(instr.block);
    }

    fn visit_if_else(&mut self, instr: &IfElse) {
        //todo!
        self.blocks.push(instr.consequent);
    }

    fn visit_br_table(&mut self, instr: &BrTable) {
        //todo!
        self.blocks.push(instr.default);
    }
}
