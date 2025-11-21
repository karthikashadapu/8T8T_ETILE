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


module ul_eaxc_config(

clk_eth,
rst_eth_n,

ul_axc_id0,
ul_axc_id1,
ul_axc_id2,
ul_axc_id3,
ul_axc_id4,
ul_axc_id5,
ul_axc_id6,
ul_axc_id7,
ul_axc_id8,
ul_axc_id9,
ul_axc_id10,
ul_axc_id11,
ul_axc_id12,
ul_axc_id13,
ul_axc_id14,
ul_axc_id15,

axc_id,

tx_u_axc_id,

ul_axc_id_intr
); 

input  		 clk_eth		; 
input  		 rst_eth_n		; 

input [15:0]  ul_axc_id0	;
input [15:0]  ul_axc_id1	;
input [15:0]  ul_axc_id2	;
input [15:0]  ul_axc_id3	;
input [15:0]  ul_axc_id4	;
input [15:0]  ul_axc_id5	;
input [15:0]  ul_axc_id6	;
input [15:0]  ul_axc_id7	;
input [15:0]  ul_axc_id8	;
input [15:0]  ul_axc_id9	;
input [15:0]  ul_axc_id10	;
input [15:0]  ul_axc_id11	;
input [15:0]  ul_axc_id12	;
input [15:0]  ul_axc_id13	;
input [15:0]  ul_axc_id14	;
input [15:0]  ul_axc_id15	;

input [15:0]  axc_id		;

output [15:0] tx_u_axc_id	; 
output 		 ul_axc_id_intr	;



// Internal Wires and Registers
reg [15:0] 	tx_u_axc_id; 
reg 		ul_axc_id_intr;

 
always @(posedge clk_eth) begin
    if (~rst_eth_n) begin 
        tx_u_axc_id <= 16'd65535;
        ul_axc_id_intr <= 1'b0;
    end else begin
        case (axc_id)
            'd0: tx_u_axc_id <= ul_axc_id0;
            'd1: tx_u_axc_id <= ul_axc_id1;
            'd2: tx_u_axc_id <= ul_axc_id2;
            'd3: tx_u_axc_id <= ul_axc_id3;
            'd4: tx_u_axc_id <= ul_axc_id4;
            'd5: tx_u_axc_id <= ul_axc_id5;
            'd6: tx_u_axc_id <= ul_axc_id6;
            'd7: tx_u_axc_id <= ul_axc_id7;
            'd8: tx_u_axc_id <= ul_axc_id8;
            'd9: tx_u_axc_id <= ul_axc_id9;
            'd10: tx_u_axc_id <= ul_axc_id10;
            'd11: tx_u_axc_id <= ul_axc_id11;
            'd12: tx_u_axc_id <= ul_axc_id12;
            'd13: tx_u_axc_id <= ul_axc_id13;
            'd14: tx_u_axc_id <= ul_axc_id14;
            'd15: tx_u_axc_id <= ul_axc_id15;
            default: begin
                tx_u_axc_id <= 16'd65535;
                ul_axc_id_intr <= 1'b1;
            end
        endcase
    end
end

endmodule