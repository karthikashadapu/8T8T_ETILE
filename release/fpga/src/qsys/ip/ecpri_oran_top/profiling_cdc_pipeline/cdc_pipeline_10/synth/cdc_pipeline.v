/*
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename : cdc_pipeline.v                                                  % 
% Author   :                                               					 %
% Function : Generic block that supports multiple width and number of        %
             register to be added.                                           %
% Interface: Supports N number of bitwidth and D number of delays            %
%                                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
*/

`timescale 1ns/1ns
module cdc_pipeline
  #(
    parameter 
    DW       = 1,
    DELAYS   = 2
    )
  (
   input                    src_clk,
   input                    dst_clk,
   input                    rst_src_clk_n,
   input                    rst_dst_clk_n,
   input      [DW-1:0]      datain,
   output reg [DW-1:0]      dataout
   );


   generate
   genvar i; 
   
   // No pipeline stages 
   if (DELAYS == 0) 
      always @ *
         dataout = datain;
   
   // single stage pipeline
   else if (DELAYS == 1) 
      always @ ( posedge dst_clk )
         if (~rst_dst_clk_n) 
            dataout <= {DW{1'b0}};
         else 
            dataout <= datain;
   
   // 2 or more pipeline stages
   else
   begin	   
   reg [(DW*(DELAYS-1))-1:0] data_pipe;
      // Input pipeline Stage
      always @ ( posedge src_clk ) 
      if (~rst_src_clk_n) 
          data_pipe[DW-1:0] <= {DW{1'b0}};
      else  
          data_pipe[DW-1:0] <= datain;
      
      // Intermediate pipeline registers 
      for (i = 1; i < DELAYS-1; i = i + 1)
      begin : PIPE 
         always @ ( posedge dst_clk ) 
            if (~rst_dst_clk_n) 
               data_pipe[DW*(i+1)-1:DW*i] <= {(DW*DELAYS){1'b0}};
            else
               data_pipe[DW*(i+1)-1:DW*i] <= data_pipe[DW*i-1:DW*(i-1)];
      end
      
      // Output pipeline Stage
      always @ ( posedge dst_clk ) 
      if (~rst_dst_clk_n) 
         dataout <= {DW{1'b0}};
      else  
         dataout <= data_pipe[(DW*(DELAYS-1))-1:DW*(DELAYS-2)];
   end    
   endgenerate
  
endmodule

