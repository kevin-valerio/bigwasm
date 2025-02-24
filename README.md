# bigwasm

### Overview

**bigwasm** is a proof-of-concept tool for instrumenting WebAssembly blobs with runtime code coverage capabilities. It
targets hosts that implement a `seal0.debug_message` function with the signature `[I32, I32] -> [I32]`. 

The instrumentation is achieved by inserting a callback to `debug_message` after each control flow instruction, allowing the
host to capture coverage data outside the typical sandbox constraints. This works well on ink! contract, since the WASM host propose this function.

### Why should I pay attention to this PoC?

1. If you control the host functions **or** have a function that allows passing data.
2. If you need to collect coverage data from a WASM blob.
3. If you want to fuzz a WASM blob as a black box.

### Usage

```bash
cargo run -- fixtures/dummy.wasm instrumented_dummy.wasm --offset 100000
```