// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

////////////////////////////////////////////////////////////////////////////////
// Engineer:       Davide Schiavone - pschiavo@iis.ee.ethz.ch                 //
//                                                                            //
// Additional contributions by:                                               //
//                                                                            //
// Design Name:    Interrupt Controller                                       //
// Project Name:   RI5CY                                                      //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Interrupt Controller of the pipelined processor            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

import riscv_defines::*;

module riscv_int_controller
#(
  parameter PULP_SECURE = 0
)
(
  input  logic        clk,
  input  logic        rst_n,

  // irq_req for controller
  // abet removed irq request to ID/ctrl
  // output logic        irq_req_ctrl_o,
  output logic        irq_sec_ctrl_o,
  output logic  [4:0] irq_id_ctrl_o,

  // handshake signals to controller
  input  logic        ctrl_ack_i,
  input  logic        ctrl_kill_i,

  // external interrupt lines
  input  logic        irq_i,          // level-triggered interrupt inputs
  input  logic        irq_sec_i,      // interrupt secure bit from EU
  input  logic  [4:0] irq_id_i,       // interrupt id [0,1,....31]

  input  logic        m_IE_i,         // interrupt enable bit from CSR (M mode)
  input  logic        u_IE_i,         // interrupt enable bit from CSR (U mode)
  input  PrivLvl_t    current_priv_lvl_i,

  output  logic        irq_software_o,
  output  logic        irq_timer_o,
  output  logic        irq_external_o,
  output  logic [14:0] irq_fast_o

);

  enum logic [1:0] { IDLE, IRQ_PENDING, IRQ_DONE} exc_ctrl_cs;

  // abet
  // struct 18bit irq_lines
  typedef struct packed {
    logic        irq_software;
    logic        irq_timer;
    logic        irq_external;
    logic [14:0] irq_fast; // 15 fast interrupts,
                           // one interrupt is reserved for NMI (not visible through mip/mie)
  } Interrupts_t;

  logic irq_enable_ext;
  logic [4:0] irq_id_q;
  logic irq_sec_q;

  Interrupts_t irq_lines_q;

if(PULP_SECURE)
  assign irq_enable_ext =  ((u_IE_i | irq_sec_i) & current_priv_lvl_i == PRIV_LVL_U) | (m_IE_i & current_priv_lvl_i == PRIV_LVL_M);
else
  assign irq_enable_ext =  m_IE_i;

  //assign irq_req_ctrl_o = exc_ctrl_cs == IRQ_PENDING;
  assign irq_sec_ctrl_o = irq_sec_q;
  assign irq_id_ctrl_o  = irq_id_q;

  // abet Output irq lines
  assign irq_software_o = irq_lines_q.irq_software;
  assign irq_timer_o    = irq_lines_q.irq_timer;
  assign irq_external_o = irq_lines_q.irq_external;
  assign irq_fast_o     = irq_lines_q.irq_fast;


  always_ff @(posedge clk, negedge rst_n)
  begin
    if (rst_n == 1'b0) begin

      irq_id_q       <= '0;
      irq_sec_q      <= 1'b0;
      irq_lines_q    <= 18'h0;
      exc_ctrl_cs    <= IDLE;

    end else begin

      unique case (exc_ctrl_cs)

        IDLE:
        begin
          // abet when idle by default no IRQs active
          irq_lines_q = '0;
          if(irq_enable_ext & irq_i) begin
            exc_ctrl_cs    <= IRQ_PENDING;
            irq_id_q       <= irq_id_i;
            irq_sec_q      <= irq_sec_i;
            // abet need to update output lines
            // decoding irq_id to one-hot
            case (irq_id_i)            // Decoded as
              5'd03: irq_lines_q.irq_software = 1'b1  ; // software
              5'd07: irq_lines_q.irq_timer    = 1'b1  ; // timer
              5'd11: irq_lines_q.irq_external = 1'b1  ; // external
              5'd16: irq_lines_q.irq_fast[ 0] = 1'b1  ; // fast 0
              5'd17: irq_lines_q.irq_fast[ 1] = 1'b1  ; // fast 1
              5'd18: irq_lines_q.irq_fast[ 2] = 1'b1  ; // fast 2
              5'd19: irq_lines_q.irq_fast[ 3] = 1'b1  ; // fast 3
              5'd20: irq_lines_q.irq_fast[ 4] = 1'b1  ; // fast 4
              5'd21: irq_lines_q.irq_fast[ 5] = 1'b1  ; // fast 5
              5'd22: irq_lines_q.irq_fast[ 6] = 1'b1  ; // fast 6
              5'd23: irq_lines_q.irq_fast[ 7] = 1'b1  ; // fast 7
              5'd24: irq_lines_q.irq_fast[ 8] = 1'b1  ; // fast 8
              5'd25: irq_lines_q.irq_fast[ 9] = 1'b1  ; // fast 9
              5'd26: irq_lines_q.irq_fast[10] = 1'b1  ; // fast 10
              5'd27: irq_lines_q.irq_fast[11] = 1'b1  ; // fast 11
              5'd28: irq_lines_q.irq_fast[12] = 1'b1  ; // fast 12
              5'd29: irq_lines_q.irq_fast[13] = 1'b1  ; // fast 13
              5'd30: irq_lines_q.irq_fast[14] = 1'b1  ; // fast 14
              // TODO {1'b1,5'd31}: irq_lines_q = 18'h40000 ; // non-masked
              default: ;
            endcase
          end
        end

        IRQ_PENDING:
        begin
          unique case(1'b1)
            ctrl_ack_i:
              exc_ctrl_cs <= IRQ_DONE;
            ctrl_kill_i:
              exc_ctrl_cs <= IDLE;
            default:
              exc_ctrl_cs <= IRQ_PENDING;
          endcase
        end

        IRQ_DONE:
        begin
          irq_sec_q   <= 1'b0;
          exc_ctrl_cs <= IDLE;
        end

      endcase

    end
  end


`ifndef SYNTHESIS
  // synopsys translate_off
  // evaluate at falling edge to avoid duplicates during glitches
  // Removed this message as it pollutes too much the output and makes tests fail
  //always_ff @(negedge clk)
  //begin
  //  if (rst_n && exc_ctrl_cs == IRQ_DONE)
  //    $display("%t: Entering interrupt service routine. [%m]", $time);
  //end
  // synopsys translate_on
`endif

endmodule
