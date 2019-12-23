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
// Author:                              Francesco Minervini - minervif@student.ethz.ch                      //
//                                                                                                          //
// Additional contributions by:         Davide Schiavone - pschiavo@iis.ee.ethz.ch                          //
//                                      Andrea Bettati - andrea.bettati@studenti.unipr.it                   //
// Design Name:                         Interrupt generator                                                 //
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

module riscv_random_interrupt_generator
(
    input logic           rst_ni,
    input logic           clk_i,
    input logic           irq_i,
    input logic   [4:0]   irq_id_i,
    input logic           irq_ack_i,
    output logic [18:0]   irq_rnd_lines_o,
    output logic          irq_ack_o,
    input logic  [31:0]   irq_mode_i,
    input logic  [31:0]   irq_min_cycles_i,
    input logic  [31:0]   irq_max_cycles_i,
    input logic  [31:0]   irq_min_lines_i,
    input logic  [31:0]   irq_max_lines_i,
    output logic [31:0]   irq_act_id_o,
    output logic          irq_id_we_o,
    input logic  [31:0]   irq_pc_id_i,
    input logic  [31:0]   irq_pc_trig_i,
    // software defined mode i/o
    input logic  [31:0]   irq_sd_lines_i 
);

`ifndef VERILATOR
class rand_irq_cycles;
    rand int n;
endclass : rand_irq_cycles

class rand_irq_id;
    rand int n;
endclass : rand_irq_id

logic [31:0] irq_mode_q;
logic        irq_random;
logic [4:0]  irq_id_random;
logic        irq_ack_random;
logic        irq_monitor;
logic [4:0]  irq_id_monitor;
logic        irq_ack_monitor;

logic        irq_sd;
logic [31:0] irq_sd_lines;
logic        ack_flag;
logic        irq_sd_lines_changed;


// struct 18bit irq_lines
typedef struct packed {
  logic        irq_software;
  logic        irq_timer;
  logic        irq_external;
  logic [14:0] irq_fast;
  logic        irq_nmi;
} Interrupts_t;

Interrupts_t irq_lines_q, irq_lines_n;
Interrupts_t irq_rnd_lines;


assign irq_ack_o       = irq_ack_i;
assign irq_rnd_lines_o = irq_lines_q; 

always_ff @(posedge clk_i or negedge rst_ni)
begin
    if(~rst_ni) begin
        irq_mode_q  <= 0;
        irq_lines_q <= '0;
    end else begin
        irq_mode_q  <= irq_mode_i;
        irq_lines_q <= irq_lines_n;
    end
end

always_comb
begin
  unique case (irq_mode_q)
    RANDOM:
    begin
      // UPDATE LOGIC:
      // random irq word id stored and updated every time 
      // an interrupt is taken by the core

      irq_lines_n = irq_rnd_lines;
    end

    PC_TRIG:
    begin
      // TODO generate individual irq lines
      irq_lines_n = '0;
    end

    SOFTWARE_DEFINED:
    begin
      // UPDATE LOGIC:
      // generate individual irq lines for the sampled word
      irq_lines_n.irq_software = irq_sd_lines [3];
      irq_lines_n.irq_timer    = irq_sd_lines [7];
      irq_lines_n.irq_external = irq_sd_lines [11];
      irq_lines_n.irq_fast     = irq_sd_lines [30:16];
      irq_lines_n.irq_nmi      = irq_sd_lines [31];
    end

    default:
    begin
      irq_lines_n = '0;
    end
  endcase
end

// RANDOM INTERRUPTS PROCESS
// Generates a random word irq_rnd_lines [18:0] at a random time. 
// The generated word is stored in irq_lines_q. 

initial
begin
    automatic rand_irq_cycles wait_cycles = new();
    automatic rand_irq_id value = new();
    int temp,i, min_irq_cycles, max_irq_cycles, min_irq_lines, max_irq_lines;
    irq_random     = 1'b0;
    irq_rnd_lines  = '0;
    while(1) begin
        @(posedge clk_i);

        wait(irq_mode_q == RANDOM);
        min_irq_lines  = irq_min_lines_i;
        max_irq_lines  = irq_max_lines_i;
        min_irq_cycles = irq_min_cycles_i;
        max_irq_cycles = irq_max_cycles_i;

        temp = value.randomize() with{
            n >= min_irq_lines;
            n <= max_irq_lines;
        };
        temp = wait_cycles.randomize() with{
            n >= min_irq_cycles;
            n <= max_irq_cycles;
        };

        irq_rnd_lines = value.n;
        irq_random    = 1'b1;
        irq_act_id_o  = value.n;
        @(posedge clk_i);
        irq_random    = 1'b0;
        
        //we don't care about the ack in this mode
        while (wait_cycles.n) begin
          @(posedge clk_i)
            irq_sd_lines <= irq_sd_lines_i;

          if (irq_sd_lines_changed) begin
            irq_rnd_lines.irq_software = irq_sd_lines_i [3];
            irq_rnd_lines.irq_timer    = irq_sd_lines_i [7];
            irq_rnd_lines.irq_external = irq_sd_lines_i [11];
            irq_rnd_lines.irq_fast     = irq_sd_lines_i [30:16];
            irq_rnd_lines.irq_nmi      = irq_sd_lines_i [31];
          end
          wait_cycles.n--;
        end
    end
end

// check if signal changed @posedge
assign irq_sd_lines_changed = (irq_sd_lines != irq_sd_lines_i) ? 1 : 0;
// SOFTWARE DEFINED INTERRUPTS PROCESS
// Samples irq lines (word) as defined by software

initial 
begin
  irq_sd_lines = 32'b0;
  while(1) begin
    irq_sd       = 1'b0;  
    ack_flag     = 1'b0;

    wait (irq_mode_q == SOFTWARE_DEFINED);

    // blocking wait for a valid sd_id
    while(irq_sd_lines_i != 0) begin
      @(posedge clk_i);
        irq_sd_lines = irq_sd_lines_i; 
        irq_sd    = 1'b1;
    end
    
    @(posedge clk_i);

  end
end

//Monitor Process
initial
begin
    int pc_value;
    irq_monitor    = 1'b0;
    irq_id_monitor = '0;
    pc_value = 0;
    wait(irq_mode_q == PC_TRIG);
    wait(irq_pc_id_i == irq_pc_trig_i);
    irq_monitor    = 1'b1;
    irq_id_monitor = irq_min_lines_i;
    while(irq_ack_i != 1'b1) begin
        @(posedge clk_i);   //Keep the request high until the acknowledge is received
    end
    @(posedge clk_i);
    irq_monitor    = 1'b0;
    irq_id_monitor = '0;
end

initial
begin
    while(1) begin
        irq_id_we_o = 1'b0;
        wait(irq_ack_i == 1'b1);
        irq_id_we_o = 1'b1;   //Give the write enable to store the core response
        @(posedge clk_i);
    end
end

`endif
endmodule
