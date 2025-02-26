/* Automatically generated by wasm2c */
#ifndef TOZ_H_GENERATED_
#define TOZ_H_GENERATED_

#include "wasm-rt.h"

#include <stdint.h>

#ifndef WASM_RT_CORE_TYPES_DEFINED
#define WASM_RT_CORE_TYPES_DEFINED
typedef uint8_t u8;
typedef int8_t s8;
typedef uint16_t u16;
typedef int16_t s16;
typedef uint32_t u32;
typedef int32_t s32;
typedef uint64_t u64;
typedef int64_t s64;
typedef float f32;
typedef double f64;
#endif

#ifdef __cplusplus
extern "C" {
#endif

struct w2c_env;
struct w2c_seal0;
struct w2c_seal1;
struct w2c_seal2;
extern wasm_rt_memory_t* w2c_env_memory(struct w2c_env*);

typedef struct w2c_toz {
  struct w2c_seal0* w2c_seal0_instance;
  struct w2c_seal1* w2c_seal1_instance;
  struct w2c_seal2* w2c_seal2_instance;
  /* import: 'env' 'memory' */
  wasm_rt_memory_t *w2c_env_memory;
  u32 w2c_g0;
  u32 w2c_g1;
  u32 w2c_g2;
  wasm_rt_funcref_table_t w2c_T0;
} w2c_toz;

void wasm2c_toz_instantiate(w2c_toz*, struct w2c_env*, struct w2c_seal0*, struct w2c_seal1*, struct w2c_seal2*);
void wasm2c_toz_free(w2c_toz*);
wasm_rt_func_type_t wasm2c_toz_get_func_type(uint32_t param_count, uint32_t result_count, ...);

/* import: 'seal0' 'debug_message' */
u32 w2c_seal0_debug_message(struct w2c_seal0*, u32, u32);

/* import: 'seal0' 'input' */
void w2c_seal0_input(struct w2c_seal0*, u32, u32);

/* import: 'seal0' 'seal_return' */
void w2c_seal0_seal_return(struct w2c_seal0*, u32, u32, u32);

/* import: 'seal0' 'value_transferred' */
void w2c_seal0_value_transferred(struct w2c_seal0*, u32, u32);

/* import: 'seal1' 'get_storage' */
u32 w2c_seal1_get_storage(struct w2c_seal1*, u32, u32, u32, u32);

/* import: 'seal2' 'set_storage' */
u32 w2c_seal2_set_storage(struct w2c_seal2*, u32, u32, u32, u32);

extern const u64 wasm2c_toz_min_env_memory;
extern const u64 wasm2c_toz_max_env_memory;
extern const u8 wasm2c_toz_is64_env_memory;

/* export: 'call' */
void w2c_toz_call(w2c_toz*);

/* export: 'deploy' */
void w2c_toz_deploy(w2c_toz*);

#ifdef __cplusplus
}
#endif

#endif  /* TOZ_H_GENERATED_ */
