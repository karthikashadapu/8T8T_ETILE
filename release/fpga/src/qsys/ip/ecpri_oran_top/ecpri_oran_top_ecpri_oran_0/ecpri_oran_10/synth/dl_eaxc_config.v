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


module dl_eaxc_config(

clk_eth,
rst_eth_n,

dl_axc_id0,
dl_axc_id1,
dl_axc_id2,
dl_axc_id3,
dl_axc_id4,
dl_axc_id5,
dl_axc_id6,
dl_axc_id7,

axc_id,

rx_u_axc_id,

dl_axc_id_intr
); 

input  		 clk_eth		; 
input  		 rst_eth_n		; 

input [15:0]  dl_axc_id0		;
input [15:0]  dl_axc_id1		;
input [15:0]  dl_axc_id2		;
input [15:0]  dl_axc_id3		;
input [15:0]  dl_axc_id4		;
input [15:0]  dl_axc_id5		;
input [15:0]  dl_axc_id6		;
input [15:0]  dl_axc_id7		;

input [15:0]  axc_id			;

output [15:0] rx_u_axc_id	; 
output 		 dl_axc_id_intr	;



// Internal Wires and Registers
reg [15:0] 	rx_u_axc_id; 
reg 		dl_axc_id_intr;

 



 
always@(posedge clk_eth)
begin
	if(~rst_eth_n) begin 
		rx_u_axc_id <= 'd65535;
		dl_axc_id_intr <= 0;

	end else begin
	case (axc_id)
            dl_axc_id0: rx_u_axc_id <= 16'd0;
            dl_axc_id1: rx_u_axc_id <= 16'd1;
            dl_axc_id2: rx_u_axc_id <= 16'd2;
            dl_axc_id3: rx_u_axc_id <= 16'd3;
            dl_axc_id4: rx_u_axc_id <= 16'd4;
            dl_axc_id5: rx_u_axc_id <= 16'd5;
            dl_axc_id6: rx_u_axc_id <= 16'd6;
            dl_axc_id7: rx_u_axc_id <= 16'd7;
		default: begin
                rx_u_axc_id <= 16'd65535;
                dl_axc_id_intr <= 1'b1;
            end
	endcase
	end
end

endmodule