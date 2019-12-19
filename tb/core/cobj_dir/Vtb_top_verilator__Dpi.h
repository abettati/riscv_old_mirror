// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Prototypes for DPI import and export functions.
//
// Verilator includes this file in all generated .cpp files that use DPI functions.
// Manually include this file where DPI .c import functions are declared to insure
// the C functions match the expectations of the DPI imports.

#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif
    
    
    // DPI EXPORTS
    // DPI export at dp_ram.sv:72
    extern int read_byte(const svLogicVecVal* byte_addr);
    // DPI export at dp_ram.sv:76
    extern void write_byte(const svLogicVecVal* byte_addr, const svLogicVecVal* val, svLogicVecVal* other);
    
#ifdef __cplusplus
}
#endif
