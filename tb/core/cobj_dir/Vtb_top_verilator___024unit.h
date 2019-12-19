// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_top_verilator.h for the primary calling header

#ifndef _Vtb_top_verilator___024unit_H_
#define _Vtb_top_verilator___024unit_H_

#include "verilated_heavy.h"
#include "Vtb_top_verilator__Dpi.h"

class Vtb_top_verilator__Syms;

//----------

VL_MODULE(Vtb_top_verilator___024unit) {
  public:
    
    // PORTS
    
    // LOCAL SIGNALS
    
    // LOCAL VARIABLES
    
    // INTERNAL VARIABLES
  private:
    Vtb_top_verilator__Syms* __VlSymsp;  // Symbol table
  public:
    
    // PARAMETERS
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vtb_top_verilator___024unit);  ///< Copying not allowed
  public:
    Vtb_top_verilator___024unit(const char* name = "TOP");
    ~Vtb_top_verilator___024unit();
    
    // API METHODS
    
    // INTERNAL METHODS
    void __Vconfigure(Vtb_top_verilator__Syms* symsp, bool first);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
} VL_ATTR_ALIGNED(128);

#endif // guard
