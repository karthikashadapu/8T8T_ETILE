

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

`timescale 1ns/1ns

module idle_time_counter_top(

input 			clk_eth_xran_dl   				,
input 		    rst_eth_xran_n_dl 				,

input           clk_dsp                         ,
input           rst_dsp_n                       ,
// input from oran
input           idl_time_cntr_cplane_in_valid      ,
input           idl_time_cntr_uplane_in_valid      ,
// from radio config
input           dl_input_hfn_pulse              ,
input  [11:0]	timeout_intr_idle_ms            ,
input  [1:0]    timeout_cntr_intr_clear			,
input  [1:0]    timeout_cntr_intr_mask 			,

output          timeout_cntr_intr_cplane        ,
output          timeout_cntr_intr_uplane   
);

(*preserve_syn_only*) reg				rst_dsp_n_1d	    	;
(*preserve_syn_only*) reg				rst_dsp_n_2d	    	;
(*preserve_syn_only*) reg 				rst_dsp_n_3d	    	;
(*preserve_syn_only*) reg 				rst_dsp_n_4d	    	;

(*preserve_syn_only*) reg 				rst_dsp_n_2d_dup1		;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup1		;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup1		;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup2		;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup2		;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup3		;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup3		;

(*preserve_syn_only*) reg 				rst_dsp_n_5d_dup1		;
(*preserve_syn_only*) reg 				rst_dsp_n_6d_dup1		;

(*preserve_syn_only*) reg 				rst_dsp_n_5d_dup2		;
(*preserve_syn_only*) reg 				rst_dsp_n_6d_dup2		;


wire 									rst_dsp_sync			;

reg                                     dl_input_hfn_pulse_l    ;
reg                                     dl_input_hfn_pulse_1d   ;
reg                                     dl_input_hfn_pulse_2d   ;
altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_dsp_rst_ctrl
(
    .reset_in   (~rst_dsp_n     ),
    .clk        (clk_dsp        ), 
    .reset_out  (rst_dsp_sync   )
);

always @(posedge clk_dsp)
	begin
		begin
		    rst_dsp_n_1d 		<= ~rst_dsp_sync;
			rst_dsp_n_2d 		<= rst_dsp_n_1d;	
			rst_dsp_n_3d 		<= rst_dsp_n_2d;
			rst_dsp_n_4d 		<= rst_dsp_n_3d;
		end
	end	
	
always @(posedge clk_dsp)
	begin
		rst_dsp_n_2d_dup1 	<= rst_dsp_n_1d;
	
		rst_dsp_n_3d_dup1   <= rst_dsp_n_2d;
		rst_dsp_n_4d_dup1  	<= rst_dsp_n_3d_dup1;
			
		rst_dsp_n_3d_dup2   <= rst_dsp_n_2d;
		rst_dsp_n_4d_dup2  	<= rst_dsp_n_3d_dup2;
			
		rst_dsp_n_3d_dup3   <= rst_dsp_n_2d;
		rst_dsp_n_4d_dup3  	<= rst_dsp_n_3d_dup3;		
	end	
	
always @(posedge clk_dsp)
	begin
	    rst_dsp_n_5d_dup1  <= rst_dsp_n_4d;
		rst_dsp_n_6d_dup1  <= rst_dsp_n_5d_dup1;
		 
   		rst_dsp_n_5d_dup2  <= rst_dsp_n_4d;
		rst_dsp_n_6d_dup2  <= rst_dsp_n_5d_dup2;

	end	

always @ (posedge clk_dsp) begin
    if (~rst_dsp_n_6d_dup1) begin
       dl_input_hfn_pulse_l <= 1'b0;
    end else if (dl_input_hfn_pulse) begin
       dl_input_hfn_pulse_l <= 1'b1;
    end
 end

 always @ (posedge clk_eth_xran_dl)
begin 
    if (~rst_eth_xran_n_dl)
    begin
        dl_input_hfn_pulse_1d  	<=  1'b0  				;
		dl_input_hfn_pulse_2d  	<=  1'b0  				;
    end                        
    else                       
    begin                      
		dl_input_hfn_pulse_1d  <=  dl_input_hfn_pulse_l	 ;
		dl_input_hfn_pulse_2d  <=  dl_input_hfn_pulse_1d ;

    end
end
 
 
 // timeout counter for cplane 
 idle_time_counter #(
  .CLK_FREQ (390625), 
  .TWIDTH   (12)
 ) u_idle_time_counter_cplane
 (
  .clk       (clk_eth_xran_dl				),       
  .rst_n     (rst_eth_xran_n_dl				),
  .in_valid  (idl_time_cntr_cplane_in_valid	), 
  .start	 (dl_input_hfn_pulse_2d			),
  .idle_ms   (timeout_intr_idle_ms			),
  .intr_ena  (~timeout_cntr_intr_mask[0]	),
  .intr_clear(timeout_cntr_intr_clear[0]	),
  .intr_out  (timeout_cntr_intr_cplane		)
  
 );
 
 // timeout counter for uplane 
 idle_time_counter #(
  .CLK_FREQ (390625), 
  .TWIDTH   (12)
 ) u_idle_time_counter_uplane
 (
  .clk       (clk_eth_xran_dl				),       
  .rst_n     (rst_eth_xran_n_dl				),
  .in_valid  (idl_time_cntr_uplane_in_valid 	), 
  .start	 (dl_input_hfn_pulse_2d			),
  .idle_ms   (timeout_intr_idle_ms			),
  .intr_ena  (~timeout_cntr_intr_mask[1]	),
  .intr_clear(timeout_cntr_intr_clear[1]	),
  .intr_out  (timeout_cntr_intr_uplane		)
  
 );
 
endmodule
