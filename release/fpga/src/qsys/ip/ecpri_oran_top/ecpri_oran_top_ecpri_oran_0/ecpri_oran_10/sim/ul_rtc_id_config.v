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


module ul_rtc_id_config(

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

rtc_id,
rx_c_dataDirection,

rx_u_rtc_id,

ul_rtc_id_intr
); 

input  		 clk_eth			; 
input  		 rst_eth_n			; 

input [15:0]  ul_axc_id0		;
input [15:0]  ul_axc_id1		;
input [15:0]  ul_axc_id2		;
input [15:0]  ul_axc_id3		;
input [15:0]  ul_axc_id4		;
input [15:0]  ul_axc_id5		;
input [15:0]  ul_axc_id6		;
input [15:0]  ul_axc_id7		;
input [15:0]  ul_axc_id8		;
input [15:0]  ul_axc_id9		;
input [15:0]  ul_axc_id10		;
input [15:0]  ul_axc_id11		;
input [15:0]  ul_axc_id12		;
input [15:0]  ul_axc_id13		;
input [15:0]  ul_axc_id14		;
input [15:0]  ul_axc_id15		;

input [15:0]  rtc_id			;
input rx_c_dataDirection		;

output [15:0] rx_u_rtc_id		; 
output 		  ul_rtc_id_intr	;



// Internal Wires and Registers
reg [15:0] 	rx_u_rtc_id				; 
reg 		ul_rtc_id_intr			;
reg 		rx_c_dataDirection_1d 	;
reg 		rx_c_dataDirection_2d 	;
reg [15:0] 	rtc_id_1d				;
reg [15:0] 	rtc_id_2d				;


always@(posedge clk_eth)
begin
	if(~rst_eth_n) begin 
		rtc_id_1d <= 'd0;
		rtc_id_2d <= 'd0;
		rx_c_dataDirection_1d	<= 'd0;
		rx_c_dataDirection_2d	<= 'd0;
	end else begin
		rtc_id_1d <= rtc_id;
		rtc_id_2d <= rtc_id_1d;
		rx_c_dataDirection_1d	<= rx_c_dataDirection;
		rx_c_dataDirection_2d	<= rx_c_dataDirection_1d;
	end
end
 
always@(posedge clk_eth)
begin
	if(~rst_eth_n) begin 
		rx_u_rtc_id 	<= 'd65535;
		ul_rtc_id_intr 	<= 0;
	end else if(rx_c_dataDirection_2d == 'b0) begin
		case (rtc_id_2d)
            ul_axc_id0: rx_u_rtc_id <= 16'd0;
            ul_axc_id1: rx_u_rtc_id <= 16'd1;
            ul_axc_id2: rx_u_rtc_id <= 16'd2;
            ul_axc_id3: rx_u_rtc_id <= 16'd3;
            ul_axc_id4: rx_u_rtc_id <= 16'd4;
            ul_axc_id5: rx_u_rtc_id <= 16'd5;
            ul_axc_id6: rx_u_rtc_id <= 16'd6;
            ul_axc_id7: rx_u_rtc_id <= 16'd7;
            ul_axc_id8: rx_u_rtc_id <= 16'd8;
            ul_axc_id9: rx_u_rtc_id <= 16'd9;
            ul_axc_id10: rx_u_rtc_id <= 16'd10;
            ul_axc_id11: rx_u_rtc_id <= 16'd11;
            ul_axc_id12: rx_u_rtc_id <= 16'd12;
            ul_axc_id13: rx_u_rtc_id <= 16'd13;
            ul_axc_id14: rx_u_rtc_id <= 16'd14;
            ul_axc_id15: rx_u_rtc_id <= 16'd15;
            default: begin
                rx_u_rtc_id <= 16'd65535;
                ul_rtc_id_intr <= 1'b1;
            end
        endcase
		end
end

endmodule