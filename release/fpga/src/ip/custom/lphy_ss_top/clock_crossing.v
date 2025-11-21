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

//Description: Clock crossing for CDC 
//             N-bit clock crossing using an handshake synchronizer
//             Input NOT sampled @ every out_clk cycle
//             Sampling period depends on in_clk/out_clk ratio

module clock_crossing 
# (
   parameter W = 32
) 
(
  in, 
  in_clk,
  in_reset, 

  out, 
  out_clk, 
  out_reset
);


input wire [W-1:0] in;
input wire in_clk, in_reset, out_clk, out_reset;
output wire [W-1:0] out;


(* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION FORCED_IF_ASYNCHRONOUS; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON; -name SDC_STATEMENT \"set_false_path -from [get_keepers {*clock_crossing:*|in_ready}] -to [all_registers]\" "} *) reg in_ready /* synopsys translate_off */ = 0 /* synopsys translate_on */;
(* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION FORCED_IF_ASYNCHRONOUS; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON; -name SDC_STATEMENT \"set_false_path -from [get_keepers {*clock_crossing:*|in_ack}] -to [all_registers]\" "} *) reg in_ack /* synopsys translate_off */ = 0 /* synopsys translate_on */;
(* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION FORCED_IF_ASYNCHRONOUS; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [1:0] in_ack_r;   
(* altera_attribute = {"-name SDC_STATEMENT \"set_false_path -from [get_keepers {*clock_crossing:*|in_r[*]}] -to [all_registers]\" "} *) reg [W-1:0] in_r;
always @ (posedge in_clk)
begin
    if(in_reset) begin
        in_ready <= 1'b0;
        in_ack_r <= 2'b00;
        in_r <= {W{1'b0}};
    end else begin        
        in_ack_r <= {in_ack_r[0],in_ack};

        if(~in_ready & ~in_ack_r[1]) begin
            in_ready <= 1'b1;
            in_r <= in;
        end else if(in_ack_r[1])
            in_ready <= 1'b0;
    end
end

(* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION FORCED_IF_ASYNCHRONOUS; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON"} *) reg [1:0] in_ready_r;   
reg [W-1:0] data_out /* synthesis ALTERA_ATTRIBUTE = "disable_da_rule=\"D101,D102\"" */;
always @ (posedge out_clk)
begin
    if(out_reset) begin
        in_ack <= 1'b0;
        in_ready_r <= 2'b00;
        data_out <= {W{1'b0}};
    end else begin
        in_ready_r <= {in_ready_r[0],in_ready};

        if(in_ack & ~in_ready_r[1])
            in_ack <= 1'b0;
        else if(~in_ack & in_ready_r[1]) begin
            in_ack <= 1'b1;
            data_out <= in_r;
        end
    end
end

assign  out = data_out;

endmodule
