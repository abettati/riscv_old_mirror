// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                          //
// Author:                              Andrea Bettati - andrea.bettati@studenti.unipr.it                   //
//                                                                                                          //
// Additional contributions by:         -                                                                   //
// Design Name:                         Interrupt demux                                                     //
// Project Name:                        RI5CY, Zeroriscy                                                    //
// Language:                            SystemVerilog                                                       //
//                                                                                                          //
// Description:                         Send interrupt request to core choosing one option between:         //
//                                      - Random;                                                           //
//                                      - Standard;                                                         //
//                                      - PC value-triggering                                               //
//                                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
import riscv_defines::*;
import perturbation_defines::*;
`include "riscv_config.sv"

module riscv_interrupt_demux
(
    input  logic        rst_ni,
    input  logic        clk_i,
    
    input  logic        irq_timer_i,   
    input  logic        irq_rnd_i,     
                                       
    input  logic [4:0]  irq_id_i,      
    input  logic [4:0]  irq_id_timer_i,
    input  logic [4:0]  irq_id_rnd_i,

    input  logic        irq_ack_i,

    output logic        irq_o,
    output logic [4:0]  irq_id_o,
    output logic        irq_software_o,
    output logic        irq_timer_o,
    output logic        irq_external_o,
    output logic [14:0] irq_fast_o
);

`ifndef VERILATOR


// struct 18bit irq_lines
typedef struct packed {
  logic        irq_software;
  logic        irq_timer;
  logic        irq_external;
  logic [14:0] irq_fast; // 15 fast interrupts,
                           // one interrupt is reserved for NMI (not visible through mip/mie)
} Interrupts_t;

Interrupts_t irq_lines_q;

logic       irq_q;
logic [4:0] irq_id_q;

// Output irq lines
assign irq_o          = irq_q;
assign irq_id_o       = irq_id_q;
assign irq_software_o = irq_lines_q.irq_software;
assign irq_timer_o    = irq_lines_q.irq_timer;
assign irq_external_o = irq_lines_q.irq_external;
assign irq_fast_o     = irq_lines_q.irq_fast;

always_ff @(posedge clk_i or negedge rst_ni)
begin
    if(~rst_ni) begin
        irq_q       <=  1'b0;
        irq_id_q    <=  5'b0;
        irq_lines_q <= 18'b0;
    end else begin

      // choose irq to serve
      if (irq_timer_i) begin
        irq_id_q <= irq_id_timer_i;
      end else if (irq_rnd_i) begin
        irq_id_q <= irq_id_rnd_i;
      end else begin
        irq_id_q <= irq_id_i;
      end 
      
      // decoding irq_id to one-hot
      case (irq_id_q)

        5'd00: irq_lines_q              = 18'b0 ; // cleared
        //---------------------------------------------------                        
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
        default:;
      endcase
      
      if (irq_lines_q)
        /* assert irq */
        irq_q = 1'b1;
      else
        irq_q = 1'b0;   
    end
end



`endif
endmodule
