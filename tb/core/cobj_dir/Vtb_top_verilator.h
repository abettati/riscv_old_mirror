// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vtb_top_verilator_H_
#define _Vtb_top_verilator_H_

#include "verilated_heavy.h"
#include "Vtb_top_verilator__Dpi.h"

class Vtb_top_verilator__Syms;

//----------

VL_MODULE(Vtb_top_verilator) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk_i,0,0);
    VL_IN8(rst_ni,0,0);
    VL_IN8(fetch_enable_i,0,0);
    VL_OUT8(tests_passed_o,0,0);
    VL_OUT8(tests_failed_o,0,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__clk;
        CData/*0:0*/ tb_top_verilator__DOT__exit_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__instr_req;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__data_req;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__data_gnt;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__data_rvalid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__irq_ack;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__is_hwlp_id;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__hwlp_dec_cnt_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__instr_valid_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__is_compressed_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__is_fetch_failed_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__illegal_c_insn_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__clear_instr_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__pc_set;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__pc_mux_id;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__exc_pc_mux_id;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__exc_cause;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__trap_addr_mux;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__is_decoding;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__useincr_addr_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_misaligned;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_multicycle;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__branch_in_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_en_ex;
        CData/*6:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_operator_ex;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__bmask_a_ex;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__bmask_b_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__imm_vec_ext_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_vec_mode_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_is_clpx_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_is_subrot_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_clpx_shift_ex;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_operator_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_en_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_sel_subword_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_signed_mode_ex;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_imm_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_dot_signed_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_clpx_shift_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_clpx_img_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__apu_en_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__apu_lat_ex;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__regfile_waddr_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__regfile_we_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__regfile_we_wb;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__regfile_alu_waddr_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__regfile_alu_we_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__regfile_alu_we_fw;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_access_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_op_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_we_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_type_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_sign_ext_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_reg_offset_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_req_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_misaligned_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__halt_if;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_ready;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_ready;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__lsu_ready_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__lsu_ready_wb;
    };
    struct {
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__instr_req_int;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__m_irq_enable;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__u_irq_enable;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_irq_sec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_save_cause;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_save_if;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_save_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_save_ex;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_cause;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_restore_mret_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_restore_uret_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_restore_dret_id;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__debug_cause;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__debug_csr_save;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_hwlp_regid;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_hwlp_we;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__perf_pipeline_stall;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_req_pmp;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_gnt_pmp;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_err_pmp;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_err_ack;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__instr_req_pmp;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__instr_gnt_pmp;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__irq_pending;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_is_clpx_ex;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__core_clock_gate_i__DOT__clk_en;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__offset_fsm_cs;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__offset_fsm_ns;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__if_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__branch_req;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__fetch_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__fetch_ready;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__is_hwlp_id_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__fetch_is_hwlp;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__hwlp_dec_cnt;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__hwlp_dec_cnt_if;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__illegal_c_insn;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__hwloop_controller_i__DOT__pc_is_end_addr;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__CS;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__NS;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__do_fetch;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__do_hwlp;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__do_hwlp_int;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__use_last;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__save_rdata_last;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__use_hwlp;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__save_rdata_hwlp;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__hwlp_is_crossword;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__is_crossword;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__next_is_crossword;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__next_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__next_upper_compressed;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__is_hwlp_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__is_hwlp_n;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__fetch_valid;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__L0_buffer_i__DOT__CS;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__L0_buffer_i__DOT__NS;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__deassert_we;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__illegal_insn_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__ebrk_insn;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mret_insn_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__uret_insn_dec;
    };
    struct {
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__dret_insn_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__ecall_insn_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__pipe_flush_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__fencei_insn_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__rega_used_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regb_used_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regc_used_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__branch_taken_ex;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__jump_in_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__jr_stall;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__load_stall;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_mask;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__halt_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__exc_ack;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__exc_kill;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regfile_addr_rc_id;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regfile_alu_waddr_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regfile_alu_we_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_en;
        CData/*6:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_operator;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_op_a_mux_sel;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_op_b_mux_sel;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_op_c_mux_sel;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regc_mux;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__imm_a_mux_sel;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__imm_b_mux_sel;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__jump_target_mux_sel;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mult_operator;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mult_int_en;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mult_sel_subword;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mult_signed_mode;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mult_dot_en;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mult_dot_signed;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regfile_we_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regfile_alu_waddr_mux_sel;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__data_we_id;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__data_type_id;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__data_sign_ext_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__data_req_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__data_load_event_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_regid;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_we;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_we_masked;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_target_mux_sel;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_start_mux_sel;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_cnt_mux_sel;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__csr_access;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__csr_status;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__prepost_useincr;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_a_fw_mux_sel;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_b_fw_mux_sel;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_c_fw_mux_sel;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__bmask_a_mux;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__bmask_b_mux;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_bmask_a_mux_sel;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_bmask_b_mux_sel;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mult_imm_mux;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__bmask_a_id_imm;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__bmask_b_id_imm;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_vec_mode;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__scalar_replication;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__reg_d_ex_is_reg_a_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__reg_d_ex_is_reg_b_id;
    };
    struct {
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__reg_d_ex_is_reg_c_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__reg_d_wb_is_reg_a_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__reg_d_alu_is_reg_a_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__is_clpx;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__is_subrot;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__mret_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__uret_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__dret_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__regfile_mem_we;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__regfile_alu_we;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__data_req;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__hwloop_we;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__csr_illegal;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__jump_in_id;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__csr_op;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__mult_int_en;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__decoder_i__DOT__mult_dot_en;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__ctrl_fsm_cs;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__ctrl_fsm_ns;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__jump_done;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__jump_done_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__jump_in_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__branch_in_id;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__irq_enable_int;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__data_err_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__debug_mode_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__debug_mode_n;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__ebrk_force_debug_mode;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__illegal_insn_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__illegal_insn_n;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__instr_valid_irq_flush_n;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__controller_i__DOT__instr_valid_irq_flush_q;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__int_controller_i__DOT__exc_ctrl_cs;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__int_controller_i__DOT__irq_id_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__int_controller_i__DOT__irq_sec_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__regfile_we_lsu;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__regfile_waddr_lsu;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__div_shift;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__div_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__adder_op_b_negate;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_left;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_use_round;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_arithmetic;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__is_equal;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__is_greater;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__f_is_greater;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__cmp_signed;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__is_equal_vec;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__is_greater_vec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__is_equal_clip;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__cmp_result;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__f_is_nan;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__sel_minmax;
        CData/*7:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_byte_sel;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_reg_sel;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_reg1_sel;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_reg0_sel;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_through;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__cnt_result;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__bitop_result;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__div_ready;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_op_a_signed;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_popcnt_i__DOT__cnt_l1;
        IData/*23:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_popcnt_i__DOT__cnt_l2;
    };
    struct {
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_popcnt_i__DOT__cnt_l3;
        SData/*9:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_popcnt_i__DOT__cnt_l4;
        WData/*159:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_ff_i__DOT__index_lut[5];
        WData/*159:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_ff_i__DOT__index_nodes[5];
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__RemSel_SN;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__RemSel_SP;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__CompInv_SN;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__CompInv_SP;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ResInv_SN;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ResInv_SP;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__Cnt_DP;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__Cnt_DN;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ARegEn_S;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__BRegEn_S;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ResRegEn_S;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ABComp_S;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__LoadEn_S;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__State_SN;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__State_SP;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_subword;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_signed;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_shift_arith;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_imm;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_subword;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_signed;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_shift_arith;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_carry_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_active;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_save;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_clearcarry;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_ready;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_CS;
        CData/*2:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__mulh_NS;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__data_type_q;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__rdata_offset_q;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__data_sign_ext_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__data_we_q;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__wdata_offset;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__CS;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__NS;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__csr_we_int;
        CData/*6:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mstatus_q;
        CData/*6:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mstatus_n;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mcause_q;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mcause_n;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__ucause_q;
        CData/*5:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__ucause_n;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__priv_lvl_n;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__priv_lvl_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__id_valid_q;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCMR_n;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCMR_q;
        CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__pccr_index;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__pccr_all_sel;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__is_pccr;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__is_pcer;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__is_pcmr;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__MODE_rule;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__data_err_state_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__data_err_state_n;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__select_rdata_d;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__select_rdata_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__transaction;
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__state_valid_n;
    };
    struct {
        CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__state_valid_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__data_rvalid_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__instr_rvalid_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__data_req_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__data_we_dec;
        CData/*3:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__data_be_dec;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__print_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__irq_timer_q;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__timer_reg_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__timer_val_valid;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__rnd_stall_req;
        CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__unnamedblk1__DOT__use_sig_file;
        SData/*11:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_addr_int;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__clpx_shift_result;
        QData/*35:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__genblk1__DOT__dot_char_op_a;
        QData/*35:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__genblk1__DOT__dot_char_op_b;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__pmpaddr_we;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__pmpcfg_we;
        SData/*11:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCCR_in;
        SData/*11:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCCR_inc;
        SData/*11:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCCR_inc_q;
        SData/*11:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCER_n;
        SData/*11:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCER_q;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__EN_rule;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__R_rule;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__W_rule;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__X_rule;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__data_match_region;
        SData/*15:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__instr_match_region;
        IData/*31:0*/ tb_top_verilator__DOT__cycle_cnt_q;
        IData/*31:0*/ tb_top_verilator__DOT__exit_value;
        WData/*1023:0*/ tb_top_verilator__DOT__load_prog__DOT__firmware[32];
        IData/*31:0*/ tb_top_verilator__DOT__unnamedblk1__DOT__maxcycles;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__data_rdata;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__instr_rdata_id;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__pc_id;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__pc_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_operand_a_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_operand_b_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__alu_operand_c_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_operand_a_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_operand_b_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_operand_c_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_dot_op_a_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_dot_op_b_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__mult_dot_op_c_ex;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__regfile_alu_wdata_fw;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__csr_rdata;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__lsu_rdata;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__fetch_addr_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__fetch_rdata;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__exc_pc;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__hwlp_target;
        IData/*23:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__trap_base_addr;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__instr_decompressed;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__hwloop_controller_i__DOT__j;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__addr_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__addr_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__addr_int;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__addr_real_next;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__rdata_last_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__rdata;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__rdata_unaligned;
        WData/*127:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__L0_buffer_i__DOT__L0_buffer[4];
    };
    struct {
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__L0_buffer_i__DOT__addr_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT__L0_buffer_i__DOT__instr_addr_int;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__imm_i_type;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__imm_vu_type;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__imm_b;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__jump_target;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__regfile_data_ra_id;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_target;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_start_int;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_cnt;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_cnt_int;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_a_fw_id;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_b_fw_id;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_c_fw_id;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_b;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_b_vec;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__operand_c;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_operand_a;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__alu_operand_b;
        WData/*1023:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__registers_i__DOT__riscv_register_file_i__DOT__mem[32];
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__registers_i__DOT__riscv_register_file_i__DOT__we_a_dec;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__registers_i__DOT__riscv_register_file_i__DOT__we_b_dec;
        QData/*63:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_regs_i__DOT__hwlp_start_q;
        QData/*63:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_regs_i__DOT__hwlp_end_q;
        QData/*63:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_regs_i__DOT__hwlp_counter_q;
        QData/*63:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__id_stage_i__DOT__hwloop_regs_i__DOT__hwlp_counter_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__operand_a_rev;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__operand_a_neg_rev;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__bmask;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__adder_op_a;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__adder_op_b;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__adder_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_amt_left;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_amt;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_amt_int;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_op_a;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_right_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shift_left_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__result_minmax;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__minmax_b;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_r1;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_r0;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_r1_in;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_r0_in;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__shuffle_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__pack_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__ff_input;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__bextins_result;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__radix_2_rev;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__radix_4_rev;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__radix_8_rev;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_ff_i__DOT__sel_nodes;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ResReg_DP;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ResReg_DN;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ResReg_DP_rev;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__AReg_DP;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__AReg_DN;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__BReg_DP;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__BReg_DN;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__AddMux_D;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__AddTmp_D;
    };
    struct {
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__OutMux_D;
        IData/*16:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_op_a;
        IData/*16:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_op_b;
        WData/*71:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__genblk1__DOT__dot_char_mul[3];
        QData/*33:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__genblk1__DOT__dot_short_op_a;
        QData/*33:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__genblk1__DOT__dot_short_op_b;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__data_addr_int;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__rdata_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__data_rdata_ext;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__rdata_h_ext;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__rdata_b_ext;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__csr_wdata_int;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__csr_rdata_int;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mepc_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mepc_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__uepc_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__uepc_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__dcsr_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__dcsr_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__depc_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__depc_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__dscratch0_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__dscratch0_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__dscratch1_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__dscratch1_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mscratch_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mscratch_n;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__exception_pc;
        IData/*23:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mtvec_n;
        IData/*23:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mtvec_q;
        IData/*23:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__utvec_n;
        IData/*23:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__utvec_q;
        IData/*18:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mip;
        IData/*17:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mie_q;
        IData/*17:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__mie_n;
        WData/*383:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCCR_q[12];
        WData/*383:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__PCCR_n[12];
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__perf_rdata;
        IData/*18:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__irq_req_n;
        IData/*18:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__irq_req_q;
        WData/*511:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__mask_addr[16];
        WData/*511:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__start_addr[16];
        WData/*511:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__RISCY_PMP__DOT__pmp_unit_i__DOT__stop_addr[16];
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__ram_data_rdata;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__data_wdata_dec;
        IData/*21:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__data_addr_dec;
        WData/*127:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__ram_instr_rdata[4];
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__print_wdata;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__sig_end_d;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__sig_end_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__sig_begin_d;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__sig_begin_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__timer_irq_mask_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__timer_cnt_q;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__timer_wdata;
        IData/*18:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__irq_rnd_lines;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__unnamedblk1__DOT__sig_fd;
        IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__unnamedblk1__DOT__unnamedblk2__DOT__addr;
        QData/*35:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__adder_in_a;
        QData/*35:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__adder_in_b;
        QData/*36:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__adder_result_expanded;
        QData/*33:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_mac;
        QData/*33:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_result;
        QData/*32:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__dot_short_result;
    };
    struct {
        WData/*67:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__genblk1__DOT__dot_short_mul[3];
        WData/*767:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__pmp_reg_q[24];
        WData/*767:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__pmp_reg_n[24];
        CData/*7:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__dp_ram_i__DOT__mem[4194304];
    };
    std::string tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__unnamedblk1__DOT__sig_file;
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*4:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT____Vcellout__cs_registers_i__irq_id_o;
    CData/*1:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT____Vcellinp__hwloop_controller_i__hwlp_dec_cnt_id_i;
    CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT____Vcellinp__L0_buffer_i__hwlp_i;
    CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound2;
    CData/*0:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound9;
    CData/*4:0*/ __Vtableidx1;
    CData/*5:0*/ __Vtableidx3;
    CData/*6:0*/ __Vtableidx4;
    CData/*5:0*/ __Vtableidx5;
    CData/*0:0*/ __Vdlyvset__tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__dp_ram_i__DOT__mem__v0;
    CData/*0:0*/ __Vdlyvset__tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__dp_ram_i__DOT__mem__v1;
    CData/*0:0*/ __Vdlyvset__tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__dp_ram_i__DOT__mem__v2;
    CData/*0:0*/ __Vdlyvset__tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__dp_ram_i__DOT__mem__v3;
    CData/*0:0*/ __Vclklast__TOP__clk_i;
    CData/*0:0*/ __Vclklast__TOP__rst_ni;
    CData/*0:0*/ __Vclklast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__clk;
    CData/*0:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__data_gnt;
    CData/*0:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__data_rvalid;
    CData/*0:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_ready;
    CData/*0:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__lsu_ready_ex;
    CData/*0:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__lsu_ready_wb;
    CData/*0:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__instr_gnt_pmp;
    CData/*0:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__valid;
    CData/*0:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__fetch_valid;
    WData/*159:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_ff_i__DOT__index_nodes[5];
    SData/*8:0*/ __Vtableidx2;
    WData/*127:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__genblk1__DOT__prefetch_128__DOT__prefetch_buffer_i__DOT____Vcellout__L0_buffer_i__rdata_o[4];
    IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound1;
    IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound3;
    IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound4;
    IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound5;
    IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound6;
    IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound7;
    IData/*31:0*/ tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT____Vlvbound8;
    IData/*31:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__alu_ff_i__DOT__sel_nodes;
    IData/*16:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_op_a;
    IData/*16:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__mult_i__DOT__short_op_b;
    WData/*767:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__pmp_reg_q[24];
    WData/*767:0*/ __Vchglast__TOP__tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__cs_registers_i__DOT__pmp_reg_n[24];
    static CData/*0:0*/ __Vtable1_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__offset_fsm_ns[32];
    static CData/*0:0*/ __Vtable1_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__fetch_ready[32];
    static CData/*0:0*/ __Vtable1_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__branch_req[32];
    static CData/*0:0*/ __Vtable1_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__if_stage_i__DOT__valid[32];
    static CData/*3:0*/ __Vtable2_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__cmp_signed[512];
    static CData/*1:0*/ __Vtable3_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__State_SN[64];
    static CData/*0:0*/ __Vtable3_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__div_ready[64];
    static CData/*0:0*/ __Vtable3_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__LoadEn_S[64];
    static CData/*0:0*/ __Vtable3_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ARegEn_S[64];
    static CData/*0:0*/ __Vtable3_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__BRegEn_S[64];
    static CData/*0:0*/ __Vtable3_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__ex_stage_i__DOT__alu_i__DOT__int_div__DOT__div_i__DOT__ResRegEn_S[64];
    static CData/*1:0*/ __Vtable4_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__load_store_unit_i__DOT__NS[128];
    static CData/*0:0*/ __Vtable4_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__data_req_pmp[128];
    static CData/*0:0*/ __Vtable4_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__lsu_ready_ex[128];
    static CData/*0:0*/ __Vtable4_tb_top_verilator__DOT__riscv_wrapper_i__DOT__riscv_core_i__DOT__lsu_ready_wb[128];
    static CData/*0:0*/ __Vtable5_tb_top_verilator__DOT__riscv_wrapper_i__DOT__data_gnt[64];
    static CData/*0:0*/ __Vtable5_tb_top_verilator__DOT__riscv_wrapper_i__DOT__data_rvalid[64];
    static CData/*1:0*/ __Vtable5_tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__state_valid_n[64];
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vtb_top_verilator__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vtb_top_verilator);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vtb_top_verilator(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vtb_top_verilator();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vtb_top_verilator__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vtb_top_verilator__Syms* symsp, bool first);
    static void __Vdpiexp_tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__dp_ram_i__DOT__read_byte_TOP(Vtb_top_verilator__Syms* __restrict vlSymsp, const IData/*21:0*/ byte_addr, IData/*31:0*/(&  read_byte__Vfuncrtn));
    static void __Vdpiexp_tb_top_verilator__DOT__riscv_wrapper_i__DOT__ram_i__DOT__dp_ram_i__DOT__write_byte_TOP(Vtb_top_verilator__Syms* __restrict vlSymsp, const IData/*31:0*/ byte_addr, const CData/*7:0*/ val, CData/*7:0*/(&  other));
  private:
    static QData _change_request(Vtb_top_verilator__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__10(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _combo__TOP__13(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _combo__TOP__5(Vtb_top_verilator__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vtb_top_verilator__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(Vtb_top_verilator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vtb_top_verilator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__1(Vtb_top_verilator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _multiclk__TOP__12(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__11(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__3(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__4(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__6(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__7(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__8(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__9(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _settle__TOP__2(Vtb_top_verilator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static int read_byte(const svLogicVecVal* byte_addr);
    static void write_byte(const svLogicVecVal* byte_addr, const svLogicVecVal* val, svLogicVecVal* other);
} VL_ATTR_ALIGNED(128);

#endif // guard
