// ================================================================================
// Copyright (c) <2017>, Intel Corporation
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
//     * Redistributions of source code must retain the above copyright notice,
//       this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Intel Corporation nor the names of its contributors
//       may be used to endorse or promote products derived from this software
//       without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ================================================================================

//Description:  Idle Event Counter
//
//Interface description:
//
//
//Assumptions:
//            

`timescale 1 ns / 1 ps

module idle_time_counter 
#(
   parameter CLK_FREQ = 390625,   //clk frequency in KHz
   parameter TWIDTH = 12
)
(
   //Clocks and reset
   input  wire                                           clk,         //expected 390.625 MHz based on typical usecase
   input  wire                                           rst_n,

   input  wire                                           in_valid,
   input  wire                                           start,

   input  wire [TWIDTH-1:0]                              idle_ms,      
   input  wire                                           intr_ena,
   input  wire                                           intr_clear,

   output wire                                           intr_out
);

// ---------  Variable Declaration  --------- //
   reg                                     valid_1d, valid_2d;
   reg  [TWIDTH-1:0]                       idle_ms_1d, idle_ms_2d;
   reg                                     intr_ena_1d, intr_ena_2d, intr_clear_1d, intr_clear_2d;
   reg  [$clog2(CLK_FREQ)-1:0]             us_count;
   reg                                     ms_pulse, intr_trig;
   reg  [TWIDTH-1:0]                       ms_count;
   reg                                     intr;

   always @ (posedge clk) begin
      if (~rst_n) begin
         valid_1d <= 1'b0;
         valid_2d <= 1'b0;
      end else begin
         valid_1d <= in_valid;
         valid_2d <= valid_1d;
      end
   end

   always @ (posedge clk) begin
      if (~rst_n) begin
         idle_ms_1d         <= {TWIDTH{1'b0}};
         intr_ena_1d        <= 1'b0;
         intr_clear_1d      <= 1'b0;
         idle_ms_2d         <= {TWIDTH{1'b0}};
         intr_ena_2d        <= 1'b0;
         intr_clear_2d      <= 1'b0;
      end else begin
         idle_ms_1d         <= idle_ms;
         intr_ena_1d        <= intr_ena;
         intr_clear_1d      <= intr_clear;
         idle_ms_2d         <= idle_ms_1d;
         intr_ena_2d        <= intr_ena_1d;
         intr_clear_2d      <= intr_clear_1d;
      end
   end

   always @ (posedge clk) begin
      if (~rst_n) begin
         us_count <= 20'b0;
         ms_pulse <= 1'b0;
      end else begin
         if (us_count==(CLK_FREQ-1)) begin
            us_count <= 20'b0;
            ms_pulse <= 1'b1;
         end else if (~valid_2d && start) begin
            us_count <= us_count + 1'b1;
            ms_pulse <= 1'b0;
         end else if (valid_2d) begin
            us_count <= 20'b0;
            ms_pulse <= 1'b0;
         end else begin
            us_count <= us_count;
            ms_pulse <= 1'b0;
         end
      end
   end

   always @ (posedge clk) begin
      if (~rst_n) begin
         ms_count  <= {TWIDTH{1'b0}};
         intr_trig <= 1'b0; 
      end else begin
         if ((ms_count==idle_ms_2d) && start) begin
            ms_count  <= 12'b0;
            intr_trig <= 1'b1; 
         end else if (~valid_2d && ms_pulse) begin
            ms_count  <= ms_count + 1'b1; 
            intr_trig <= 1'b0; 
         end else if (valid_2d) begin
            ms_count  <= 12'b0;
            intr_trig <= 1'b0; 
         end else begin
            ms_count  <= ms_count;
            intr_trig <= 1'b0; 
         end
      end
   end

   always @ (posedge clk) begin
      if (~rst_n) begin
         intr <= 1'b0;
      end else begin
         if (intr_ena_2d && intr_trig)
            intr <= 1'b1;
         else if (intr_clear_2d)
            intr <= 1'b0;
      end
   end


//Output signals
//
assign intr_out = intr;

// ---------   Code Ends Here --------- //
endmodule
