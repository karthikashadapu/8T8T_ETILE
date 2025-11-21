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


module oran_ptp2gps_conv(

clk_tod,
rst_tod_n,

ptp_seconds,
in_valid,
out_valid,
gps_seconds

); 

input  		 clk_tod			; 
input  		 rst_tod_n			; 

input [95:0]  ptp_seconds		;
input         in_valid                    ;
output [95:0]  gps_seconds		;
output out_valid ;




// Internal Wires and Registers
wire [95:0] 	gps_seconds	; 
wire [95:0] 	timeoffset 	;
wire [47:0] 	ptp_sec		;
wire [31:0] 	ptp_ns		;
wire [15:0] 	ptp_fns		;
reg  [47:0] 	gps_sec		;
reg  [31:0] 	gps_ns		;
reg  [15:0] 	gps_fns		;


 
// PTP Seconds 
assign ptp_sec = ptp_seconds [95:48];
assign ptp_ns  = ptp_seconds [47:16];
assign ptp_fns = ptp_seconds [15: 0];

assign out_valid = 1'b1 ;

assign timeoffset 	= 'd315964819 ;
//assign timeoffset_1 = 'd315964818 ;

assign gps_seconds = {gps_sec, gps_ns, gps_fns };

 
always@(posedge clk_tod)
begin
	if(~rst_tod_n) begin 
		gps_sec <= 0;
		gps_ns <= 0;
		gps_fns <= 0;
		
	end else begin
			gps_sec  <= ptp_sec - 'd315964819 ;
			gps_ns 	<= ptp_ns ;
			gps_fns  <= ptp_fns;
	end 
end

/*always@(posedge clk_tod)
begin
	if(~rst_tod_n) begin 
		gps_ns <= 0;
		
	end else if	(ptp_fns == 'd0) begin
		if (ptp_ns > 'd999999993)
			gps_ns  <= 'd6 - (1000000000 -  ptp_ns) ;
		else
			gps_ns	<= ptp_ns + 'd6;

	end else if	(ptp_fns == 'd26214) begin
		if (ptp_ns > 'd999999993)
			gps_ns  <= 'd6 - (1000000000 -  ptp_ns) ;
		else
			gps_ns	<= ptp_ns + 'd6;	
	
	end else if	(ptp_fns == 'd52428) begin
		if (ptp_ns > 'd999999993)
			gps_ns  <= 'd6 - (1000000000 -  ptp_ns) ;
		else
			gps_ns	<= ptp_ns + 'd6;
	
	end else if	(ptp_fns == 'd13108) begin
		if (ptp_ns > 'd999999992)
			gps_ns  <= 'd7 - (1000000000 -  ptp_ns) ;
		else
			gps_ns	<= ptp_ns + 'd7;
	
	end else if	(ptp_fns == 'd39322) begin
		if (ptp_ns > 'd999999993)
			gps_ns  <= 'd6 - (1000000000 -  ptp_ns) ;
		else
			gps_ns	<= ptp_ns + 'd6;
	
	end
end

always@(posedge clk_tod)
begin
	if(~rst_tod_n)  
		gps_fns <= 0;
	else if	(ptp_fns == 'd0)
		gps_fns <= 'd26214	; 
	else if	(ptp_fns == 'd26214)
		gps_fns <= 'd52428	; 
	else if	(ptp_fns == 'd52428)
		gps_fns <= 'd13108	; 
	else if	(ptp_fns == 'd13108)
		gps_fns <= 'd39322	; 
	else if	(ptp_fns == 'd39322)
		gps_fns <= '0	; 
end
 */
endmodule
