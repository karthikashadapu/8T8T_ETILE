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
//`include "struct_typedef.sv"
import typedef_struct::*;
module radio_config
(
    clk_dsp              	,
    rst_dsp_n            	,
	
    clk_csr              	,
    rst_csr_n            	,
	
	clk_eth				 	,
	rst_eth_n			 	,
	
    frame_status         	,
	
    auxN_tx_rfp          	,
    dl_input_hfn_pulse   	,
    ul_input_hfn_pulse   	,
	
    lte_sfn_sf           	,
	
    csr_address          	,
    csr_write            	,
    csr_writedata        	,
    csr_readdata         	,
	
    rst_soft_n 		 	 	,
	
	
	
		
	
	
	ul_req_disable		 	,
	
		
	bw_config_cc1		 	,
	bw_config_cc2		 	,
	/*	
	dl_eaxc_id0			 	,
	dl_eaxc_id1			 	,
	dl_eaxc_id2			 	,
	dl_eaxc_id3			 	,
	dl_eaxc_id4			 	,
	dl_eaxc_id5			 	,
	dl_eaxc_id6			 	,
	dl_eaxc_id7			 	,*/
	downlink_eaxc_id_concat        ,
	uplink_eaxc_id_concat         ,
	dspba_cnfg_param_concat        ,
	
	/*	
	ul_eaxc_id0			 	,
	ul_eaxc_id1			 	,
	ul_eaxc_id2			 	,
	ul_eaxc_id3			 	,
	ul_eaxc_id4			 	,
	ul_eaxc_id5			 	,
	ul_eaxc_id6			 	,
	ul_eaxc_id7			 	,
	
	ul_eaxc_id8			 	,
	ul_eaxc_id9			 	,
	ul_eaxc_id10		 	,
	ul_eaxc_id11		 	,
	ul_eaxc_id12		 	,
	ul_eaxc_id13		 	,
	ul_eaxc_id14		 	,
	ul_eaxc_id15		 	,*/
		
	ul_axc_id_intr		 	,
    dl_axc_id_intr		 	,
	ul_rtc_id_intr		 	,
		
	cu_coupling_status	,
	cu_coupling_version  ,
	coupling_err_clear	 	,
		
	
	loopback_enable			,
    
	short_long_prach_select ,
	
	timeout_cntr_intr_cplane,
	timeout_cntr_intr_uplane,
	timeout_cntr_intr_clear	,
	timeout_cntr_intr_mask	,
	fifo_full_intr_mask     ,
	fifo_full_intr_clear    ,
	timeout_intr_idle_ms	,
	fifo_full_intr          ,
	
	lphy_ss_conduit_ports_concat
);
`include "def_param.vh"
//`include "../../../quartus_projects/ftile_1588_sr/def_param.vh"

input 				clk_dsp           	 ;
input 				rst_dsp_n         	 ;
input 				clk_csr           	 ;
input 				rst_csr_n         	 ;
input 				clk_eth	          	 ;
input 				rst_eth_n         	 ;

output  [67:0]      frame_status      	 ;

input               auxN_tx_rfp       	 ;
output              dl_input_hfn_pulse	 ;
output              ul_input_hfn_pulse	 ;

output  [13:0]      lte_sfn_sf        	 ;

input   [6 :0]      csr_address       	 ;
input               csr_write         	 ;
input   [31:0]      csr_writedata     	 ;
output  [31:0]      csr_readdata      	 ;

output  	       rst_soft_n	     	 ;



output  			ul_req_disable       ;


output [7:0]		bw_config_cc1		 ;
output [7:0]		bw_config_cc2		 ;

//output   dl_eaxc_id downlink_eaxc_id         ;
output   [127:0] downlink_eaxc_id_concat       ; 
//output   ul_eaxc_id uplink_eaxc_id           ;
output   [255:0 ]uplink_eaxc_id_concat         ;
//output   dspba_config_param dspba_cnfg_param ;
output   [321:0] dspba_cnfg_param_concat       ;

input				ul_axc_id_intr		 ;
input				dl_axc_id_intr		 ;
input				ul_rtc_id_intr		 ;

input [31:0]		cu_coupling_status	 ;
input [31:0]        cu_coupling_version   ;
output 				coupling_err_clear	 ;

output [1:0]		loopback_enable		;

input               short_long_prach_select;
input               timeout_cntr_intr_cplane;
input               timeout_cntr_intr_uplane;
output  [1:0]       timeout_cntr_intr_clear;
output  [1:0]       timeout_cntr_intr_mask;
output              fifo_full_intr_mask   ;
output              fifo_full_intr_clear  ;

output [11:0]		timeout_intr_idle_ms  ;
input               fifo_full_intr        ;
output [109:0]      lphy_ss_conduit_ports_concat ;

// Internal Wires and Registers

reg		[31:0] 	c_hps	   				;
reg		[31:0] 	hps_valid   			;
reg		[31:0] 	hps_config				;
reg		[31:0] 	freqoffset				;
reg 	[31:0] 	c_hps_1d				;
reg 	[31:0] 	c_hps_2d				;
reg 	[31:0] 	c_hps_3d				;
reg 	[31:0] 	c_hps_4d				;
reg 	[31:0] 	hps_valid_1d			;
reg 	[31:0] 	hps_valid_2d			;
reg 	[31:0] 	hps_valid_3d			;
reg 	[31:0] 	hps_valid_4d			;
reg 	[31:0] 	hps_config_1d			;
reg 	[31:0] 	hps_config_2d			;
reg 	[31:0] 	hps_config_3d			;
reg 	[31:0] 	hps_config_4d			;
reg		[31:0] 	freqoffset_1d			;
reg		[31:0] 	freqoffset_2d			;
reg		[31:0] 	freqoffset_3d			;
reg		[31:0] 	freqoffset_4d			;

reg             short_long_prach_select_1d      ;
reg             short_long_prach_select_2d      ;
 
wire	[67:0] 	frame_status   			;

wire            dl_input_hfn_pulse  	;
reg             ul_input_hfn_pulse  	;
	
reg 			auxN_tx_rfp_1d			;
reg 			auxN_tx_rfp_2d			;
reg 			auxN_tx_rfp_3d			;
wire 			auxN_tx_rfp_2d_pos		;
wire    [13:0]  lte_sfn_sf          	;
	
reg     [31:0]  csr_readdata        	;
	
wire    [1:0]   rst_oran_rx_n       	;
wire			rst_dsp_soft_n			;
wire			rst_soft_n				;
	
reg     [14:0]  sample_cnt_15       	;
reg     [14:0]  sample_cnt_15_1d    	;
reg     [14:0]  sample_cnt_15_2d    	;
reg     [14:0]  sample_cnt_15_3d    	;
reg     [15:0]  sample_cnt_14       	;
reg     [15:0]  sample_cnt_14_1d    	;
reg     [15:0]  sample_cnt_14_2d    	;
reg     [15:0]  sample_cnt_14_2d_dup1	;
reg     [15:0]  sample_cnt_14_2d_dup2	;
reg     [15:0]  sample_cnt_14_3d    	;
reg     [4:0]   sym_cnt_15          	;
reg     [4:0]   sym_cnt_15_1d       	;
reg     [4:0]   sym_cnt_15_2d       	;
reg     [4:0]   sym_cnt_15_3d       	;
reg     [4:0]   sym_cnt_14          	;
reg     [4:0]   sym_cnt_14_1d       	;
reg     [4:0]   sym_cnt_14_2d       	;
reg     [4:0]   sym_cnt_14_2d_dup1  	;
reg     [4:0]   sym_cnt_14_2d_dup2  	;
reg     [4:0]   sym_cnt_14_3d       	;
reg     [3:0]   sfn_cnt             	;
reg     [3:0]   sfn_cnt_1d          	;
reg     [3:0]   sfn_cnt_2d          	;
reg     [3:0]   sfn_cnt_2d_dup1     	;
reg     [3:0]   sfn_cnt_2d_dup2     	;
reg     [3:0]   sfn_cnt_3d          	;
reg     [9:0]   rfn_cnt             	;
reg     [9:0]   rfn_cnt_1d          	;
reg     [9:0]   rfn_cnt_2d          	;
reg     [9:0]   rfn_cnt_2d_dup1     	;
reg     [9:0]   rfn_cnt_2d_dup2     	;
reg     [9:0]   rfn_cnt_3d          	;
reg     [13:0]  lte_sf_cnt          	;
reg     [13:0]  lte_sf_cnt_1d       	;
reg     [13:0]  lte_sf_cnt_2d       	;
	
reg     [31:0]  frame_config        	;
reg     [31:0]  frame_config_1d     	;
reg     [31:0]  frame_config_2d     	;

reg     [31:0]  dl_input_config     	;
reg     [31:0]  dl_input_config_1d  	;
reg     [31:0]  dl_input_config_2d  	;

reg     [31:0]  ul_input_config     	;
reg     [31:0]  ul_input_config_1d  	;
reg     [31:0]  ul_input_config_2d  	;

reg     [31:0]  reset_config        	;

reg     [15:0]  sample_cnt_14_limit     ;
reg     [15:0]  sample_cnt_14_limit_1d  ;
reg     [15:0]  sample_cnt_14_limit_2d  ;

wire            dl_start                ;
wire            ul_start                ;

wire    [15:0]  dl_input_sample         ;
wire    [4:0]   dl_input_sym            ;
wire    [3:0]   dl_input_sfn            ;
wire            dl_input_rfn            ;

wire    [15:0]  ul_input_sample         ;
wire    [4:0]   ul_input_sym            ;
wire    [3:0]   ul_input_sfn            ;
wire            ul_input_rfn            ;

reg             dl_input_enable         ;
reg             dl_input_enable_1d      ;
reg             ul_input_enable         ;
reg             ul_input_enable_1d      ;
reg             tti_pulse               ;
reg             tti_pulse_1d            ;
reg             tti_pulse_2d            ;

reg             dl_input_sample_cnt_14_sel       ;
reg             dl_input_sample_cnt_14_sel_1d    ;
reg             dl_input_sample_cnt_14_sel_2d    ;
reg             dl_input_sym_cnt_14_sel          ;
reg             dl_input_sfn_cnt_sel             ;
reg             dl_input_rfn_cnt_sel             ;

reg             ul_input_sample_cnt_14_sel       ;
reg             ul_input_sample_cnt_14_sel_1d    ;
reg             ul_input_sample_cnt_14_sel_2d    ;
reg             ul_input_sym_cnt_14_sel          ;
reg             ul_input_sfn_cnt_sel             ;
reg             ul_input_rfn_cnt_sel             ;


reg             sample_cnt_14_last 				;
reg             sample_cnt_15_last 				;
reg             sym_cnt_15_last    				;
reg             sym_cnt_14_last    				;
reg             sfn_cnt_last       				;
reg             lte_sf_cnt_last    				;

reg  [31:0]     ul_req_disable_reg     			;
reg  [31:0]     ul_req_disable_reg_1d     		;
reg  [31:0]     ul_req_disable_reg_2d     		;

reg [31:0] 		blank_prb_flag_1d				;
reg [31:0] 		blank_prb_flag_2d				;
reg 			blank_prb_intr_1d				;
reg 			blank_prb_intr_2d				;

reg [7:0]		dl_ul_bwconfig_cc1				;
reg [7:0]		dl_ul_bwconfig_cc2				;

reg [7:0]		dl_ul_bwconfig_cc1_1d			;
reg [7:0]		dl_ul_bwconfig_cc1_2d			;
reg [7:0]		dl_ul_bwconfig_cc2_1d			;
reg [7:0]		dl_ul_bwconfig_cc2_2d			;

// iFFT and FFT input parameters
reg [10:0]		dl_ul_cp_len					;
reg [31:0]		dl_ifft_gain_l1					;
reg [3:0]		dl_ifft_shift_l1				;
reg [15:0]		dl_ifft_mux_const_real			;
reg [15:0]		dl_ifft_mux_const_imag			;
reg [3:0]		dl_ul_dc_sc_enable				;
reg [31:0]		dl_ifft_gain_l2					;
reg [3:0]		dl_ifft_shift_l2				;
reg [31:0]		digital_power_scale_l1			;
reg [31:0]		digital_power_scale_l2			;
reg 			ul_hcs_bypass					;
reg [31:0]		ul_fft_gain_l1					;
reg [3:0]		ul_fft_shift_l1					;
reg [31:0]		ul_fft_gain_l2					;
reg [3:0]		ul_fft_shift_l2					;

reg [10:0]		dl_ul_cp_len_1d					;
reg [10:0]		dl_ul_cp_len_2d					;
reg [31:0]		dl_ifft_gain_l1_1d				;
reg [31:0]		dl_ifft_gain_l1_2d				;
reg [3:0]		dl_ifft_shift_l1_1d				;
reg [3:0]		dl_ifft_shift_l1_2d				;
reg [31:0] 		dl_ifft_mux_const				;
reg [31:0]		dl_ifft_mux_const_1d			;
reg [31:0]		dl_ifft_mux_const_2d			;
reg [3:0]		dl_ul_dc_sc_enable_1d			;
reg [3:0]		dl_ul_dc_sc_enable_2d			;
reg [31:0]		dl_ifft_gain_l2_1d				;
reg [31:0]		dl_ifft_gain_l2_2d				;
reg [3:0]		dl_ifft_shift_l2_1d				;
reg [3:0]		dl_ifft_shift_l2_2d				;
reg [31:0]      digital_power_scale_l1_1d		;
reg [31:0] 	 	digital_power_scale_l1_2d		;
reg [31:0]      digital_power_scale_l2_1d		;
reg [31:0] 	 	digital_power_scale_l2_2d		;
reg				ul_hcs_bypass_1d				;
reg 			ul_hcs_bypass_2d				;
reg [31:0]		ul_fft_gain_l1_1d				;
reg [31:0]		ul_fft_gain_l1_2d				;
reg [3:0]		ul_fft_shift_l1_1d				;
reg [3:0]		ul_fft_shift_l1_2d				;
reg [31:0]		ul_fft_gain_l2_1d				;
reg [31:0]		ul_fft_gain_l2_2d				;
reg [3:0]		ul_fft_shift_l2_1d				;
reg [3:0]		ul_fft_shift_l2_2d				;

reg [15:0] 		dl_eaxc_config_id0   			;
reg [15:0] 		dl_eaxc_config_id1   			;
reg [15:0] 		dl_eaxc_config_id2   			;
reg [15:0] 		dl_eaxc_config_id3   			;
reg [15:0] 		dl_eaxc_config_id4   			;
reg [15:0] 		dl_eaxc_config_id5   			;
reg [15:0] 		dl_eaxc_config_id6   			;
reg [15:0] 		dl_eaxc_config_id7   			;
		
reg [15:0] 		dl_eaxc_config_id0_1d   		;
reg [15:0] 		dl_eaxc_config_id1_1d   		;
reg [15:0] 		dl_eaxc_config_id2_1d   		;
reg [15:0] 		dl_eaxc_config_id3_1d   		;
reg [15:0] 		dl_eaxc_config_id4_1d   		;
reg [15:0] 		dl_eaxc_config_id5_1d   		;
reg [15:0] 		dl_eaxc_config_id6_1d   		;
reg [15:0] 		dl_eaxc_config_id7_1d   		;

reg [15:0] 		dl_eaxc_config_id0_2d   		;
reg [15:0] 		dl_eaxc_config_id1_2d   		;
reg [15:0] 		dl_eaxc_config_id2_2d   		;
reg [15:0] 		dl_eaxc_config_id3_2d   		;
reg [15:0] 		dl_eaxc_config_id4_2d   		;
reg [15:0] 		dl_eaxc_config_id5_2d   		;
reg [15:0] 		dl_eaxc_config_id6_2d   		;
reg [15:0] 		dl_eaxc_config_id7_2d   		;

reg [15:0] 		intr_register  					;
reg [15:0] 		intr_clear  					;
reg [15:0] 		intr_clear_1d  					;
reg [15:0] 		intr_clear_2d  					;
reg [15:0] 		intr_mask 			 			;
reg [15:0]   	intr_mask_1d					;
reg [15:0]   	intr_mask_2d					;
reg [31:0] 		prb_blank_ctrl  			 	;
reg [31:0] 		prb_blank_ctrl_1d  			 	;
reg [31:0] 		prb_blank_ctrl_2d  			 	;
reg [31:0] 		rsvd_3  			 			;
reg [31:0] 		rsvd_4  			 			;
reg [31:0] 		rsvd_5  			 			;


reg             timeout_cntr_intr_cplane_1d            ;
reg             timeout_cntr_intr_cplane_2d            ;  
reg             timeout_cntr_intr_uplane_1d            ;
reg             timeout_cntr_intr_uplane_2d            ;                    

reg [15:0] 		ul_eaxc_config_id0   			;
reg [15:0] 		ul_eaxc_config_id1   			;
reg [15:0] 		ul_eaxc_config_id2   			;
reg [15:0] 		ul_eaxc_config_id3   			;
reg [15:0] 		ul_eaxc_config_id4   			;
reg [15:0] 		ul_eaxc_config_id5   			;
reg [15:0] 		ul_eaxc_config_id6   			;
reg [15:0] 		ul_eaxc_config_id7   			;
					
reg [15:0] 		ul_eaxc_config_id8   			;
reg [15:0] 		ul_eaxc_config_id9   			;
reg [15:0] 		ul_eaxc_config_id10  			;
reg [15:0] 		ul_eaxc_config_id11  			;
reg [15:0] 		ul_eaxc_config_id12  			;
reg [15:0] 		ul_eaxc_config_id13  			;
reg [15:0] 		ul_eaxc_config_id14  			;
reg [15:0] 		ul_eaxc_config_id15  			;

reg [15:0] 		ul_eaxc_config_id0_1d  			;
reg [15:0] 		ul_eaxc_config_id1_1d  			;
reg [15:0] 		ul_eaxc_config_id2_1d  			;
reg [15:0] 		ul_eaxc_config_id3_1d  			;
reg [15:0] 		ul_eaxc_config_id4_1d  			;
reg [15:0] 		ul_eaxc_config_id5_1d  			;
reg [15:0] 		ul_eaxc_config_id6_1d  			;
reg [15:0] 		ul_eaxc_config_id7_1d  			;

reg [15:0] 		ul_eaxc_config_id8_1d  			;
reg [15:0] 		ul_eaxc_config_id9_1d  			;
reg [15:0] 		ul_eaxc_config_id10_1d 			;
reg [15:0] 		ul_eaxc_config_id11_1d 			;
reg [15:0] 		ul_eaxc_config_id12_1d 			;
reg [15:0] 		ul_eaxc_config_id13_1d 			;
reg [15:0] 		ul_eaxc_config_id14_1d 			;
reg [15:0] 		ul_eaxc_config_id15_1d 			;

reg [15:0] 		ul_eaxc_config_id0_2d  			;
reg [15:0] 		ul_eaxc_config_id1_2d  			;
reg [15:0] 		ul_eaxc_config_id2_2d  			;
reg [15:0] 		ul_eaxc_config_id3_2d  			;
reg [15:0] 		ul_eaxc_config_id4_2d  			;
reg [15:0] 		ul_eaxc_config_id5_2d  			;
reg [15:0] 		ul_eaxc_config_id6_2d  			;
reg [15:0] 		ul_eaxc_config_id7_2d  			;

reg [15:0] 		ul_eaxc_config_id8_2d  			;
reg [15:0] 		ul_eaxc_config_id9_2d  			;
reg [15:0] 		ul_eaxc_config_id10_2d   		;
reg [15:0] 		ul_eaxc_config_id11_2d   		;
reg [15:0] 		ul_eaxc_config_id12_2d   		;
reg [15:0] 		ul_eaxc_config_id13_2d   		;
reg [15:0] 		ul_eaxc_config_id14_2d   		;
reg [15:0] 		ul_eaxc_config_id15_2d   		;

reg [2:0] 		eaxc_intr_rsvd_1d				;
reg [2:0] 		eaxc_intr_rsvd_2d				;


reg 			rst_dsp_soft_n_1d				;
reg 			rst_dsp_soft_n_2d				;
reg 			rst_dsp_soft_n_3d				;
reg 			rst_dsp_soft_n_4d				;

reg 			rst_eth_soft_n_1d				;
reg 			rst_eth_soft_n_2d				;
reg 			rst_eth_soft_n_3d				;
reg 			rst_eth_soft_n_4d				;

reg 			coupling_error_clear_1d			;
reg 			coupling_error_clear_2d			;

reg [31:0] 		cu_coupling_status_1d				;
reg [31:0] 		cu_coupling_status_2d				;

reg [31:0] 		cu_coupling_version_1d				;
reg [31:0] 		cu_coupling_version_2d				;

reg 			coupling_error_clear			;

reg  [1:0]		ifft_muxselect					;
reg  [1:0]		ifft_muxselect_1d				;
reg  [1:0]		ifft_muxselect_2d				;
wire [1:0]		loopback_enable				    ;
reg  [1:0]		loopback_en					    ;
reg  [1:0]		loopback_en_1d				    ;
reg  [1:0]		loopback_en_2d				    ;

reg [3:0] 		ifft_fft_size					;
reg [3:0] 		ifft_fft_size_1d				;
reg [3:0] 		ifft_fft_size_2d				;

reg [11:0]		intr_idle_ms					;
reg [11:0]		intr_idle_ms_1d					;
reg [11:0]		intr_idle_ms_2d					;

reg [31:0] 		rsvd_0							;

reg [23:0]      long_prach_freqoffset_1d        ;
reg [23:0]      long_prach_freqoffset_2d        ;

wire  ocm_capture_enable         ;
reg   ocm_capture_enable_1d      ;
reg   ocm_capture_enable_2d      ; 

reg [1:0] filt_flush_en_1d       ;
reg [1:0] filt_flush_en_2d       ;
reg [1:0] filt_flush_en          ; 

dl_eaxc_id downlink_eaxc_id         ;
ul_eaxc_id uplink_eaxc_id           ;
dspba_config_param dspba_cnfg_param ;
lphy_ss_conduit lphy_ss_conduit_ports;

// Output Register Assignment
assign frame_status     =   {tti_pulse_1d,lte_sf_cnt_2d,rfn_cnt_2d,sfn_cnt_2d	,
                            sym_cnt_15_2d,sym_cnt_14_2d						    ,
                            sample_cnt_15_2d,sample_cnt_14_2d}	; // {1'b1 , 14'd0, 10'd0, 4'd0,5'd0,5'd0,15'd0,16'd0};
assign lte_sfn_sf       =   lte_sf_cnt_2d 				;
assign dl_start         =   frame_config_2d	   [0]      ;
assign dl_input_sample  =   dl_input_config_2d [15:0 ]  ;//16
assign dl_input_sym     =   dl_input_config_2d [20:16]  ;//5
assign dl_input_sfn     =   dl_input_config_2d [24:21]  ;//4
assign dl_input_rfn     =   dl_input_config_2d [25]     ;//1
assign ul_start         =   frame_config_2d[1]          ;
assign ul_input_sample  =   ul_input_config_2d [15:0 ]  ;
assign ul_input_sym     =   ul_input_config_2d [20:16]  ;
assign ul_input_sfn     =   ul_input_config_2d [24:21]  ;
assign ul_input_rfn     =   ul_input_config_2d [25]     ;
assign ul_req_disable   =   ul_req_disable_reg_2d[0]    ;
//assign rst_oran_rx_n  =   reset_config	   [1:0]    ;
assign rst_soft_n		=	reset_config [0] 			;
assign bw_config_cc1	=   dl_ul_bwconfig_cc1_2d		;
assign bw_config_cc2	=   dl_ul_bwconfig_cc2_2d		;

assign lphy_ss_conduit_ports.filt_flush_en =    filt_flush_en_2d            ;

assign dspba_cnfg_param.cp_len 				= 	dl_ul_cp_len_2d							;
assign dspba_cnfg_param.fft_size            =	ifft_fft_size_2d						;
assign dspba_cnfg_param.ifft_gain_l1 		= 	dl_ifft_gain_l1_2d						;
assign dspba_cnfg_param.ifft_shift_l1 		= 	dl_ifft_shift_l1_2d						;
assign dspba_cnfg_param.ifft_mux_const_l1	= 	{16'b0 , dl_ifft_mux_const_2d[15:0]	}	;
assign dspba_cnfg_param.ifft_mux_const_l2	= 	{16'b0 , dl_ifft_mux_const_2d[31:16]}	;

assign dspba_cnfg_param.ifft_dc_sc_en_l1	= 	dl_ul_dc_sc_enable_2d[0]				;
assign dspba_cnfg_param.ifft_dc_sc_en_l2	= 	dl_ul_dc_sc_enable_2d[1]				;
assign dspba_cnfg_param.fft_dc_sc_en_l1 	= 	dl_ul_dc_sc_enable_2d[2]				;
assign dspba_cnfg_param.fft_dc_sc_en_l2 	= 	dl_ul_dc_sc_enable_2d[3]				;

assign dspba_cnfg_param.ifft_gain_l2 		= 	dl_ifft_gain_l2_2d						;
assign dspba_cnfg_param.ifft_shift_l2 		= 	dl_ifft_shift_l2_2d						;
assign dspba_cnfg_param.hcs_bypass			= 	ul_hcs_bypass_2d						;
assign dspba_cnfg_param.fft_gain_l1 		=	ul_fft_gain_l1_2d						;					
assign dspba_cnfg_param.fft_shift_l1 		=	ul_fft_shift_l1_2d						;				
assign dspba_cnfg_param.fft_gain_l2 	    =	ul_fft_gain_l2_2d						;					
assign dspba_cnfg_param.fft_shift_l2 		=	ul_fft_shift_l2_2d						;	
assign dspba_cnfg_param.dps_value_l1		= 	digital_power_scale_l1_2d				;
assign dspba_cnfg_param.dps_value_l2		= 	digital_power_scale_l2_2d				;

assign dspba_cnfg_param.ifft_muxsel_l1		= 	ifft_muxselect_2d[0]					;
assign dspba_cnfg_param.ifft_muxsel_l2		= 	ifft_muxselect_2d[1]					;

assign downlink_eaxc_id.dl_eaxc_id0   	= 	dl_eaxc_config_id0_2d			;
assign downlink_eaxc_id.dl_eaxc_id1   	= 	dl_eaxc_config_id1_2d			;
assign downlink_eaxc_id.dl_eaxc_id2   	= 	dl_eaxc_config_id2_2d			;
assign downlink_eaxc_id.dl_eaxc_id3   	= 	dl_eaxc_config_id3_2d			;
assign downlink_eaxc_id.dl_eaxc_id4   	= 	dl_eaxc_config_id4_2d			;
assign downlink_eaxc_id.dl_eaxc_id5   	= 	dl_eaxc_config_id5_2d			;
assign downlink_eaxc_id.dl_eaxc_id6   	= 	dl_eaxc_config_id6_2d			;
assign downlink_eaxc_id.dl_eaxc_id7   	= 	dl_eaxc_config_id7_2d			;	
	
assign uplink_eaxc_id.ul_eaxc_id0   	= 	ul_eaxc_config_id0_2d			;
assign uplink_eaxc_id.ul_eaxc_id1   	= 	ul_eaxc_config_id1_2d			;
assign uplink_eaxc_id.ul_eaxc_id2   	= 	ul_eaxc_config_id2_2d			;
assign uplink_eaxc_id.ul_eaxc_id3   	= 	ul_eaxc_config_id3_2d			;
assign uplink_eaxc_id.ul_eaxc_id4   	= 	ul_eaxc_config_id4_2d			;
assign uplink_eaxc_id.ul_eaxc_id5   	= 	ul_eaxc_config_id5_2d			;
assign uplink_eaxc_id.ul_eaxc_id6   	= 	ul_eaxc_config_id6_2d			;
assign uplink_eaxc_id.ul_eaxc_id7   	= 	ul_eaxc_config_id7_2d			;

assign uplink_eaxc_id.ul_eaxc_id8   	= 	ul_eaxc_config_id8_2d			;
assign uplink_eaxc_id.ul_eaxc_id9   	= 	ul_eaxc_config_id9_2d			;
assign uplink_eaxc_id.ul_eaxc_id10   	= 	ul_eaxc_config_id10_2d			;
assign uplink_eaxc_id.ul_eaxc_id11   	= 	ul_eaxc_config_id11_2d			;
assign uplink_eaxc_id.ul_eaxc_id12   	= 	ul_eaxc_config_id12_2d			;
assign uplink_eaxc_id.ul_eaxc_id13   	= 	ul_eaxc_config_id13_2d			;
assign uplink_eaxc_id.ul_eaxc_id14   	= 	ul_eaxc_config_id14_2d			;
assign uplink_eaxc_id.ul_eaxc_id15   	= 	ul_eaxc_config_id15_2d			;

assign coupling_err_clear 	= 	coupling_error_clear_2d			;

assign loopback_enable		=   loopback_en_2d					;

assign downlink_eaxc_id_concat = downlink_eaxc_id ;
assign uplink_eaxc_id_concat   = uplink_eaxc_id   ;
assign dspba_cnfg_param_concat = dspba_cnfg_param ;
assign lphy_ss_conduit_ports_concat = lphy_ss_conduit_ports ;


assign lphy_ss_conduit_ports.blanking_dis  = prb_blank_ctrl_2d[0] ;
assign timeout_cntr_intr_clear = intr_clear_2d[1:0];
assign timeout_cntr_intr_mask  = intr_mask_2d[1:0] ;
assign fifo_full_intr_mask     =  intr_mask[2]     ;   // csr domain
assign fifo_full_intr_clear    =  intr_clear[2]    ;   // csr domain
assign timeout_intr_idle_ms    =  intr_idle_ms_2d  ;


`ifdef OCM_CAPTURE
   assign ocm_capture_enable = 1'b1 ;
 `else
   assign ocm_capture_enable = 1'b0 ;
 `endif

// HPS Address Decoding
always @ (posedge clk_csr)
begin
    if (~rst_csr_n)
    begin
        frame_config        <=  32'd0   						;
        //dl_input_config     <=  {1'b1,4'd9,4'd13,16'd17905}	;    //-35 us
        dl_input_config     <=  {1'b0,4'd0,5'd0,16'd0}      	;    //0 us  // 32'd29800;
        ul_input_config     <=  {1'b0,4'd0,5'd0,16'd0}      	;    //0 us //{12'd0,4'd2,16'd22980}; //13943 actual value
        reset_config        <=  32'd1                			;
		c_hps				<=  'd1								;
		hps_valid           <=  'd0								;
		hps_config       	<= {8'd0,16'd352,8'd192}			; //{8'd0,16'd352,8'd192}
		ul_req_disable_reg  <= 32'd0							;
		freqoffset       	<= {8'd0,24'he4}					;
		dl_ul_bwconfig_cc1	<= 8'd14							;
		dl_ul_bwconfig_cc2	<= 8'd14							;
		
		dl_ul_cp_len		<= 11'd352							;
		ifft_fft_size		<= 4'd12							;
		dl_ifft_gain_l1		<= 32'd8192							; //16s13 format
		dl_ifft_shift_l1	<= 4'hc								;
		dl_ifft_mux_const	<= 32'h0							;
		dl_ul_dc_sc_enable	<= 4'b0								;
		dl_ifft_gain_l2		<= 32'd8192							; //16s13 format
		dl_ifft_shift_l2	<= 4'hc								;
		digital_power_scale_l1	<= 32'h7fff						;
		digital_power_scale_l2	<= 32'h7fff						;
		ul_hcs_bypass		<= 1'd0								;
		ul_fft_gain_l1		<= 32'd8192							; //16s13 format
		ul_fft_shift_l1		<= 4'h0								;
		ul_fft_gain_l2		<= 32'd8192							; //16s13 format
		ul_fft_shift_l2		<= 4'h0								;
		
		dl_eaxc_config_id0	<= 'd0								;
		dl_eaxc_config_id1	<= 'd1								;
		dl_eaxc_config_id2	<= 'd2								;
		dl_eaxc_config_id3	<= 'd3								;
		dl_eaxc_config_id4	<= 'd4								;
		dl_eaxc_config_id5	<= 'd5								;
		dl_eaxc_config_id6	<= 'd6								;
		dl_eaxc_config_id7	<= 'd7								;
		
		//intr_register  	    <= 'd0                          ;
		intr_clear  	    <= 'd0                              ;
		intr_mask 		    <= 'd0                              ;
		prb_blank_ctrl      <= 'd1                              ;
		intr_idle_ms	    <= 'd160                            ;
		rsvd_4  		    <= 'd0                              ;
		rsvd_5  		    <= 'd0                              ; 
		
		
		ul_eaxc_config_id0	<= 'd0								;
		ul_eaxc_config_id1	<= 'd1								;
		ul_eaxc_config_id2	<= 'd2								;
		ul_eaxc_config_id3	<= 'd3								;
		ul_eaxc_config_id4	<= 'd4								;
		ul_eaxc_config_id5	<= 'd5								;
		ul_eaxc_config_id6	<= 'd6								;
		ul_eaxc_config_id7	<= 'd7								;
		ul_eaxc_config_id8	<= 'd8								;
		ul_eaxc_config_id9	<= 'd9								;
		ul_eaxc_config_id10	<= 'd10								;
		ul_eaxc_config_id11	<= 'd11								;
		ul_eaxc_config_id12	<= 'd12								;
		ul_eaxc_config_id13	<= 'd13								;
		ul_eaxc_config_id14	<= 'd14								;
		ul_eaxc_config_id15	<= 'd15								;
		
		rsvd_0				<= 'd0								;
		
		ifft_muxselect			<= 'd0							;
		coupling_error_clear	<= 'd0							;
		loopback_en				<= 'd0							;
		filt_flush_en   		<= 'd0                          ;
	
    end
    else
    begin
        case(csr_address)
        7'd0:
        begin
            if(csr_write)
                frame_config    <= csr_writedata        ;
            csr_readdata        <= frame_config         ;
        end
        7'd1:
        begin
            if(csr_write)
                dl_input_config <= csr_writedata        ;
            csr_readdata        <= dl_input_config      ;
        end
        7'd2:
        begin
            if(csr_write)
                ul_input_config <= csr_writedata        ;
            csr_readdata        <= ul_input_config      ;
        end
        7'd3:
        begin
            if(csr_write)
                reset_config    <= csr_writedata        ;
            csr_readdata        <= reset_config         ;
        end
		7'd4:
        begin
            if(csr_write)
                 c_hps          <= csr_writedata        ;
            csr_readdata        <= c_hps         		;
        end
		7'd5:
        begin
            if(csr_write)
                 hps_valid      <= csr_writedata        ;
            csr_readdata        <= hps_valid         	;
        end
		7'd6:
        begin
            if(csr_write)
                 hps_config   <= csr_writedata        ;
            csr_readdata        <= hps_config         ;
        end
		7'd7:
        begin
            if(csr_write)
                 freqoffset   <= csr_writedata        ;
            csr_readdata        <= freqoffset         ;
        end
		7'd8:
        begin
            if(csr_write)
                 ul_req_disable_reg   <= csr_writedata        		;
            csr_readdata              <= ul_req_disable_reg         ;
        end
		7'd9:
        begin
            csr_readdata        <= blank_prb_flag_2d         	;
        end
		7'd10:
        begin
            csr_readdata        <= {31'd0, blank_prb_intr_2d}   ;
        end
		7'd11:
        begin
            if(csr_write)
                dl_ul_bwconfig_cc1   <= csr_writedata[7:0]        ;
            csr_readdata        <= {24'd0, dl_ul_bwconfig_cc1}        ;
        end
		7'd12:
        begin
            if(csr_write)
                dl_ul_bwconfig_cc2   <= csr_writedata[7:0]        ;
            csr_readdata        <= {24'd0, dl_ul_bwconfig_cc2  }       ;
        end
		7'd13:
        begin
            if(csr_write)
                dl_eaxc_config_id0   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, dl_eaxc_config_id0  }       ;
        end
		7'd14:
        begin
            if(csr_write)
                dl_eaxc_config_id1   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, dl_eaxc_config_id1  }       ;
        end
		7'd15:
        begin
            if(csr_write)
                dl_eaxc_config_id2   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, dl_eaxc_config_id2  }       ;
        end
		7'd16:
        begin
            if(csr_write)
                dl_eaxc_config_id3   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, dl_eaxc_config_id3  }       ;
        end
		7'd17:
        begin
            if(csr_write)
                dl_eaxc_config_id4   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, dl_eaxc_config_id4  }       ;
        end
		7'd18:
        begin
            if(csr_write)
                dl_eaxc_config_id5   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, dl_eaxc_config_id5  }       ;
        end
		7'd19:
        begin
            if(csr_write)
                dl_eaxc_config_id6   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, dl_eaxc_config_id6  }       ;
        end
		7'd20:
        begin
            if(csr_write)
                dl_eaxc_config_id7   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, dl_eaxc_config_id7  }       ;
        end
		7'd21:
        begin
            csr_readdata        <= {16'd0,intr_register   }       ;
        end
		7'd22:
        begin
            if(csr_write)
               intr_clear    <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, intr_clear  }       ;
        end
		7'd23:
        begin
            if(csr_write)
              intr_mask     <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, intr_mask   }       ;
        end
		7'd24:
        begin
            if(csr_write)
               prb_blank_ctrl    <= csr_writedata        ;
            csr_readdata        <=  prb_blank_ctrl          ;
        end
		7'd25:
        begin
            csr_readdata     <= ({8'd0,long_prach_freqoffset_2d})     ;
        end
		7'd26:
        begin
            if(csr_write)
              intr_idle_ms     <= csr_writedata [11:0]      ;
            csr_readdata        <= ({20'd0,intr_idle_ms   })    ;
        end
		7'd27:
        begin
            if(csr_write)
               rsvd_4    <= csr_writedata        ;
            csr_readdata        <= rsvd_4       ;
        end
		7'd28:
        begin
            
            csr_readdata        <= cu_coupling_version_2d   ;
        end
		7'd29:
        begin
            if(csr_write)
                ul_eaxc_config_id0   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id0  }       ;
        end
		7'd30:
        begin
            if(csr_write)
                ul_eaxc_config_id1   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id1  }       ;
        end
		7'd31:
        begin
            if(csr_write)
                ul_eaxc_config_id2   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id2  }       ;
        end
		7'd32:
        begin
            if(csr_write)
                ul_eaxc_config_id3   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id3  }       ;
        end
		7'd33:
        begin
            if(csr_write)
                ul_eaxc_config_id4   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id4  }       ;
        end
		7'd34:
        begin
            if(csr_write)
                ul_eaxc_config_id5   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id5  }       ;
        end
		7'd35:
        begin
            if(csr_write)
                ul_eaxc_config_id6   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id6  }       ;
        end
		7'd36:
        begin
            if(csr_write)
                ul_eaxc_config_id7   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id7  }       ;
        end
		7'd37:
        begin
            if(csr_write)
                ul_eaxc_config_id8   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id8  }       ;
        end
		7'd38:
        begin
            if(csr_write)
                ul_eaxc_config_id9   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id9  }       ;
        end
		7'd39:
        begin
            if(csr_write)
                ul_eaxc_config_id10   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id10  }       ;
        end
		7'd40:
        begin
            if(csr_write)
                ul_eaxc_config_id11   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id11  }       ;
        end
		7'd41:
        begin
            if(csr_write)
                ul_eaxc_config_id12   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id12  }       ;
        end
		7'd42:
        begin
            if(csr_write)
                ul_eaxc_config_id13   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id13  }       ;
        end
		7'd43:
        begin
            if(csr_write)
                ul_eaxc_config_id14   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id14  }       ;
        end
		7'd44:
        begin
            if(csr_write)
                ul_eaxc_config_id15   <= csr_writedata[15:0]        ;
            csr_readdata        <= {16'd0, ul_eaxc_config_id15  }       ;
        end
		7'd45:
        begin
            //if(csr_write)
              //  eaxc_intr_rsvd   <= csr_writedata[1:0]        ;
            csr_readdata        <= {29'd0, eaxc_intr_rsvd_2d  }       ;
        end
		7'd46:
        begin
            if(csr_write)
                coupling_error_clear   <= csr_writedata[0]        ;
            csr_readdata        <=  {31'd0, coupling_error_clear}         ;
        end
		7'd47:
        begin
            csr_readdata        <=  cu_coupling_status_2d         ;
        end
		7'd48:
        begin
            if(csr_write)
                dl_ul_cp_len   <= csr_writedata[10:0]        ;
            csr_readdata        <=  {21'd0, dl_ul_cp_len}         ;  // 11bits
        end
		7'd49:
        begin
            if(csr_write)
                ifft_fft_size   <= csr_writedata[3:0]        ;
            csr_readdata        <=  {28'd0, ifft_fft_size}         ;
        end
		7'd50:
        begin
            if(csr_write)
                dl_ifft_gain_l1  <= csr_writedata        ;
            csr_readdata         <=  {dl_ifft_gain_l1}         ;
        end
		7'd51:
        begin
            if(csr_write)
                dl_ifft_shift_l1   <= csr_writedata[3:0]        ;
            csr_readdata           <=  {28'd0, dl_ifft_shift_l1}         ;
        end
		7'd52:
        begin
            if(csr_write)
                dl_ifft_mux_const   <= csr_writedata[31:0]        ;
            csr_readdata        <=  {dl_ifft_mux_const}           ;
        end
		7'd53:
        begin
            if(csr_write)
                ifft_muxselect   <= csr_writedata[1:0]        ;
            csr_readdata        <=  {30'd0, ifft_muxselect}         ;
        end
		7'd54:
        begin
            if(csr_write)
                dl_ul_dc_sc_enable   <= csr_writedata[3:0]        ;
            csr_readdata        <=  {28'd0, dl_ul_dc_sc_enable}         ;
        end
		
		7'd55:
        begin
            if(csr_write)
                dl_ifft_gain_l2   <= csr_writedata        ;
            csr_readdata        <=  {dl_ifft_gain_l2}         ;
        end
		7'd56:
        begin
            if(csr_write)
                dl_ifft_shift_l2   <= csr_writedata[3:0]        ;
            csr_readdata        <=  {28'd0,dl_ifft_shift_l2}         ;
        end
		7'd57:
        begin
            if(csr_write)
                rsvd_0   <= csr_writedata        ;
            csr_readdata        <=  {rsvd_0}         ;
        end
		7'd58:
        begin
            if(csr_write)
                ul_hcs_bypass   <= csr_writedata[0]        ;
            csr_readdata        <=  {31'd0, ul_hcs_bypass}         ;
        end
		7'd59:
        begin
            if(csr_write)
                ul_fft_gain_l1   <= csr_writedata        ;
            csr_readdata        <=  {ul_fft_gain_l1}         ;
        end
		7'd60:
        begin
            if(csr_write)
                ul_fft_shift_l1   <= csr_writedata[3:0]        ;
            csr_readdata        <=  {28'd0, ul_fft_shift_l1}         ;
        end
		7'd61:
        begin
            if(csr_write)
                loopback_en   <= csr_writedata[1:0]        ;
            csr_readdata        <=  {30'd0, loopback_en}         ;
        end
		7'd62:
        begin
            if(csr_write)
                ul_fft_gain_l2   <= csr_writedata        ;
            csr_readdata        <=  {ul_fft_gain_l2}         ;
        end
		7'd63:
        begin
            if(csr_write)
                ul_fft_shift_l2   <= csr_writedata[3:0]        ;
            csr_readdata        <=  {28'd0, ul_fft_shift_l2}         ;
        end
		7'd64:
        begin
            if(csr_write)
                digital_power_scale_l1   <= csr_writedata        ;
            csr_readdata        <=  {digital_power_scale_l1}         ;
        end
		7'd65:
        begin
            if(csr_write)
                digital_power_scale_l2   <= csr_writedata        ;
            csr_readdata        <=  {digital_power_scale_l2}         ;
        end
		7'd66:
        begin
            if(csr_write)
                filt_flush_en    <= csr_writedata                 ;
            csr_readdata        <=  filt_flush_en                 ;
        end
		7'd67:
        begin
            csr_readdata        <=  {30'b0,ocm_capture_enable_2d,short_long_prach_select_2d }  ;
        end
		default:
		begin
			frame_config        <= frame_config         ;
			dl_input_config     <= dl_input_config      ;
			ul_input_config     <= ul_input_config      ;
			reset_config        <= reset_config         ;
			c_hps			    <= c_hps				;
			hps_valid           <= hps_valid        	;
			hps_config    		<= hps_config			;
			ul_req_disable_reg  <= ul_req_disable_reg	;
			freqoffset        	<= freqoffset			;
			dl_ul_bwconfig_cc1	<= dl_ul_bwconfig_cc1	;
			dl_ul_bwconfig_cc2	<= dl_ul_bwconfig_cc2	;
			
			dl_eaxc_config_id0	<= dl_eaxc_config_id0	;
			dl_eaxc_config_id1	<= dl_eaxc_config_id1	;
			dl_eaxc_config_id2	<= dl_eaxc_config_id2	;
			dl_eaxc_config_id3	<= dl_eaxc_config_id3	;
			dl_eaxc_config_id4	<= dl_eaxc_config_id4	;
			dl_eaxc_config_id5	<= dl_eaxc_config_id5	;
			dl_eaxc_config_id6	<= dl_eaxc_config_id6	;
			dl_eaxc_config_id7	<= dl_eaxc_config_id7	;
			
			intr_clear          <= intr_clear          ;  
			intr_mask 	        <= intr_mask 	       ;
			prb_blank_ctrl  	<= prb_blank_ctrl 	   ;
			intr_idle_ms  	    <= intr_idle_ms  	   ;
			rsvd_4  	        <= rsvd_4  	           ;
			rsvd_5  	        <= rsvd_5  	           ;
			                       
			ul_eaxc_config_id0	<= ul_eaxc_config_id0	;
			ul_eaxc_config_id1	<= ul_eaxc_config_id1	;
			ul_eaxc_config_id2	<= ul_eaxc_config_id2	;
			ul_eaxc_config_id3	<= ul_eaxc_config_id3	;
			ul_eaxc_config_id4	<= ul_eaxc_config_id4	;
			ul_eaxc_config_id5	<= ul_eaxc_config_id5	;
			ul_eaxc_config_id6	<= ul_eaxc_config_id6	;
			ul_eaxc_config_id7	<= ul_eaxc_config_id7	;
			ul_eaxc_config_id8	<= ul_eaxc_config_id8	;
			ul_eaxc_config_id9	<= ul_eaxc_config_id9	;
			ul_eaxc_config_id10	<= ul_eaxc_config_id10	;
			ul_eaxc_config_id11	<= ul_eaxc_config_id11	;
			ul_eaxc_config_id12	<= ul_eaxc_config_id12	;
			ul_eaxc_config_id13	<= ul_eaxc_config_id13	;
			ul_eaxc_config_id14	<= ul_eaxc_config_id14	;
			ul_eaxc_config_id15	<= ul_eaxc_config_id15	;
			
			coupling_error_clear	<= coupling_error_clear;
			
			dl_ul_cp_len			<= dl_ul_cp_len			;
			ifft_fft_size			<= ifft_fft_size		;
			dl_ifft_gain_l1			<= dl_ifft_gain_l1		;
			dl_ifft_shift_l1		<= dl_ifft_shift_l1		;	
			dl_ifft_mux_const		<= dl_ifft_mux_const	;	
			dl_ul_dc_sc_enable		<= dl_ul_dc_sc_enable	;
			dl_ifft_gain_l2			<= dl_ifft_gain_l2		;
			dl_ifft_shift_l2		<= dl_ifft_shift_l2		;
			digital_power_scale_l1	<= digital_power_scale_l1	;
			digital_power_scale_l2	<= digital_power_scale_l2	;	
			ul_hcs_bypass			<= ul_hcs_bypass		;
			ul_fft_gain_l1			<= ul_fft_gain_l1		;
			ul_fft_shift_l1			<= ul_fft_shift_l1		;
			ul_fft_gain_l2			<= ul_fft_gain_l2		;
			ul_fft_shift_l2			<= ul_fft_shift_l2		;
			
			ifft_muxselect			<= ifft_muxselect		;
			loopback_en				<= loopback_en			;
			filt_flush_en           <= filt_flush_en        ;		
		end
        endcase
    end
end

always @ (posedge clk_eth)
begin
    if(~rst_eth_n & rst_eth_soft_n_4d)
    begin
		c_hps_1d				<=	'd0;
		c_hps_2d				<=	'd0;
		c_hps_3d				<=	'd0;
		c_hps_4d				<=	'd0;
		hps_valid_1d			<=	'd0;
		hps_valid_2d			<=	'd0;
		hps_valid_3d			<=	'd0;
		hps_valid_4d			<=	'd0;
        hps_config_1d			<=  'd0;
        hps_config_2d			<=  'd0;		
        hps_config_3d			<=  'd0;		
        hps_config_4d			<=  'd0;	
        freqoffset_1d 			<=  'd0;		
        freqoffset_2d 			<=  'd0;		
        freqoffset_3d 			<=  'd0;		
        freqoffset_4d 			<=  'd0;		
		ul_req_disable_reg_1d  	<=  'd0;
		ul_req_disable_reg_2d  	<=  'd0;
		
		dl_eaxc_config_id0_1d   <=  'd0;
		dl_eaxc_config_id1_1d   <=  'd0;
		dl_eaxc_config_id2_1d   <=  'd0;
		dl_eaxc_config_id3_1d   <=  'd0;
		dl_eaxc_config_id4_1d   <=  'd0;
		dl_eaxc_config_id5_1d   <=  'd0;
		dl_eaxc_config_id6_1d   <=  'd0;
		dl_eaxc_config_id7_1d   <=  'd0;
		
		dl_eaxc_config_id0_2d   <=  'd0;
		dl_eaxc_config_id1_2d   <=  'd0;
		dl_eaxc_config_id2_2d   <=  'd0;
		dl_eaxc_config_id3_2d   <=  'd0;
		dl_eaxc_config_id4_2d   <=  'd0;
		dl_eaxc_config_id5_2d   <=  'd0;
		dl_eaxc_config_id6_2d   <=  'd0;
		dl_eaxc_config_id7_2d   <=  'd0;
		
		ul_eaxc_config_id0_1d   <=  'd0;
		ul_eaxc_config_id1_1d   <=  'd0;
		ul_eaxc_config_id2_1d   <=  'd0;
		ul_eaxc_config_id3_1d   <=  'd0;
		ul_eaxc_config_id4_1d   <=  'd0;
		ul_eaxc_config_id5_1d   <=  'd0;
		ul_eaxc_config_id6_1d   <=  'd0;
		ul_eaxc_config_id7_1d   <=  'd0;
		
		ul_eaxc_config_id8_1d   <=  'd0;
		ul_eaxc_config_id9_1d   <=  'd0;
		ul_eaxc_config_id10_1d   <=  'd0;
		ul_eaxc_config_id11_1d   <=  'd0;
		ul_eaxc_config_id12_1d   <=  'd0;
		ul_eaxc_config_id13_1d   <=  'd0;
		ul_eaxc_config_id14_1d   <=  'd0;
		ul_eaxc_config_id15_1d   <=  'd0;
		
		ul_eaxc_config_id0_2d   <=  'd0;
		ul_eaxc_config_id1_2d   <=  'd0;
		ul_eaxc_config_id2_2d   <=  'd0;
		ul_eaxc_config_id3_2d   <=  'd0;
		ul_eaxc_config_id4_2d   <=  'd0;
		ul_eaxc_config_id5_2d   <=  'd0;
		ul_eaxc_config_id6_2d   <=  'd0;
		ul_eaxc_config_id7_2d   <=  'd0;
		
		ul_eaxc_config_id8_2d   <=  'd0;
		ul_eaxc_config_id9_2d   <=  'd0;
		ul_eaxc_config_id10_1d   <=  'd0;
		ul_eaxc_config_id11_1d   <=  'd0;
		ul_eaxc_config_id12_1d   <=  'd0;
		ul_eaxc_config_id13_1d   <=  'd0;
		ul_eaxc_config_id14_1d   <=  'd0;
		ul_eaxc_config_id15_1d   <=  'd0;
		
		coupling_error_clear_1d		<= 'd0;
		coupling_error_clear_2d		<= 'd0;
	    intr_clear_1d            	<= 'd0 ;
		intr_clear_2d            	<= 'd0 ;
		intr_mask_1d            	<= 'd0 ;
		intr_mask_2d            	<= 'd0 ;
		intr_idle_ms_1d				<= 'd0;
		intr_idle_ms_2d				<= 'd0;
		

		
		
	end
	else
	begin
		c_hps_1d				<=	c_hps				;
		c_hps_2d				<=	c_hps_1d			;
		c_hps_3d				<=	c_hps_2d			;
		c_hps_4d				<=	c_hps_3d			;
		hps_valid_1d			<=	hps_valid			;
		hps_valid_2d			<=	hps_valid_1d		;
		hps_valid_3d			<=	hps_valid_2d		;
		hps_valid_4d			<=	hps_valid_3d		;
		hps_config_1d	        <=  hps_config			;		
        hps_config_2d	        <=  hps_config_1d		;
		hps_config_3d	        <=  hps_config_2d		;
        hps_config_4d	        <=  hps_config_3d		;
        freqoffset_1d         	<=  freqoffset			;		
        freqoffset_2d         	<=  freqoffset_1d		;
		freqoffset_3d		    <=  freqoffset_2d		;
        freqoffset_4d		    <=  freqoffset_3d		;		
		ul_req_disable_reg_1d	<=  ul_req_disable_reg  ;
		ul_req_disable_reg_2d	<=  ul_req_disable_reg_1d;
		
		dl_eaxc_config_id0_1d   <=  dl_eaxc_config_id0;
		dl_eaxc_config_id1_1d   <=  dl_eaxc_config_id1;
		dl_eaxc_config_id2_1d   <=  dl_eaxc_config_id2;
		dl_eaxc_config_id3_1d   <=  dl_eaxc_config_id3;
		dl_eaxc_config_id4_1d   <=  dl_eaxc_config_id4;
		dl_eaxc_config_id5_1d   <=  dl_eaxc_config_id5;
		dl_eaxc_config_id6_1d   <=  dl_eaxc_config_id6;
		dl_eaxc_config_id7_1d   <=  dl_eaxc_config_id7;
		
		dl_eaxc_config_id0_2d   <= dl_eaxc_config_id0_1d;
		dl_eaxc_config_id1_2d   <= dl_eaxc_config_id1_1d;
		dl_eaxc_config_id2_2d   <= dl_eaxc_config_id2_1d;
		dl_eaxc_config_id3_2d   <= dl_eaxc_config_id3_1d;
		dl_eaxc_config_id4_2d   <= dl_eaxc_config_id4_1d;
		dl_eaxc_config_id5_2d   <= dl_eaxc_config_id5_1d;
		dl_eaxc_config_id6_2d   <= dl_eaxc_config_id6_1d;
		dl_eaxc_config_id7_2d   <= dl_eaxc_config_id7_1d;
		
		ul_eaxc_config_id0_1d   <=  ul_eaxc_config_id0;
		ul_eaxc_config_id1_1d   <=  ul_eaxc_config_id1;
		ul_eaxc_config_id2_1d   <=  ul_eaxc_config_id2;
		ul_eaxc_config_id3_1d   <=  ul_eaxc_config_id3;
		ul_eaxc_config_id4_1d   <=  ul_eaxc_config_id4;
		ul_eaxc_config_id5_1d   <=  ul_eaxc_config_id5;
		ul_eaxc_config_id6_1d   <=  ul_eaxc_config_id6;
		ul_eaxc_config_id7_1d   <=  ul_eaxc_config_id7;
		
		ul_eaxc_config_id8_1d   <=  ul_eaxc_config_id8;
		ul_eaxc_config_id9_1d   <=  ul_eaxc_config_id9;
		ul_eaxc_config_id10_1d  <=  ul_eaxc_config_id10;
		ul_eaxc_config_id11_1d  <=  ul_eaxc_config_id11;
		ul_eaxc_config_id12_1d  <=  ul_eaxc_config_id12;
		ul_eaxc_config_id13_1d  <=  ul_eaxc_config_id13;
		ul_eaxc_config_id14_1d  <=  ul_eaxc_config_id14;
		ul_eaxc_config_id15_1d  <=  ul_eaxc_config_id15;
		
		ul_eaxc_config_id0_2d   <= ul_eaxc_config_id0_1d;
		ul_eaxc_config_id1_2d   <= ul_eaxc_config_id1_1d;
		ul_eaxc_config_id2_2d   <= ul_eaxc_config_id2_1d;
		ul_eaxc_config_id3_2d   <= ul_eaxc_config_id3_1d;
		ul_eaxc_config_id4_2d   <= ul_eaxc_config_id4_1d;
		ul_eaxc_config_id5_2d   <= ul_eaxc_config_id5_1d;
		ul_eaxc_config_id6_2d   <= ul_eaxc_config_id6_1d;
		ul_eaxc_config_id7_2d   <= ul_eaxc_config_id7_1d;
		
		ul_eaxc_config_id8_2d   <=  ul_eaxc_config_id8_1d;
		ul_eaxc_config_id9_2d   <=  ul_eaxc_config_id9_1d;
		ul_eaxc_config_id10_2d  <=  ul_eaxc_config_id10_1d;
		ul_eaxc_config_id11_2d  <=  ul_eaxc_config_id11_1d;
		ul_eaxc_config_id12_2d  <=  ul_eaxc_config_id12_1d;
		ul_eaxc_config_id13_2d  <=  ul_eaxc_config_id13_1d;
		ul_eaxc_config_id14_2d  <=  ul_eaxc_config_id14_1d;
		ul_eaxc_config_id15_2d  <=  ul_eaxc_config_id15_1d;
		
		coupling_error_clear_1d		<= coupling_error_clear;
		coupling_error_clear_2d		<= coupling_error_clear_1d;
		intr_clear_1d            <= intr_clear    ;
		intr_clear_2d            <= intr_clear_1d ;
		intr_mask_1d            <= intr_mask    ;
		intr_mask_2d            <= intr_mask_1d ;
		intr_idle_ms_1d			<= intr_idle_ms;
		intr_idle_ms_2d			<= intr_idle_ms_1d;

	end
end

assign lphy_ss_conduit_ports.c_hps        	=  c_hps_4d[0]			;
assign lphy_ss_conduit_ports.hps_valid 		=  hps_valid_4d[0]		;
assign lphy_ss_conduit_ports.hps_framestructure 	=  hps_config_4d[7:0]	;
assign lphy_ss_conduit_ports.hps_cplength       	=  hps_config_4d[23:8]	;
assign lphy_ss_conduit_ports.hps_freqoffset     	=  freqoffset_4d[23:0]	;

always @(posedge clk_dsp)
	begin: DSP_SOFT_RST_PIPE
		rst_dsp_soft_n_1d 		<= rst_soft_n;
		rst_dsp_soft_n_2d		<= rst_dsp_soft_n_1d;
		rst_dsp_soft_n_3d		<= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d		<= rst_dsp_soft_n_3d;
		
	end	

always @(posedge clk_eth)
	begin:ETH_SOFT_RST_PIPE
		rst_eth_soft_n_1d 		<= rst_soft_n;
		rst_eth_soft_n_2d		<= rst_eth_soft_n_1d;
		rst_eth_soft_n_3d		<= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d		<= rst_eth_soft_n_3d;
		
	end	

always @ (posedge clk_dsp )
begin : PIPE_DELAY
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
    begin
        sample_cnt_15_1d    			<=  15'b0   	;
        sample_cnt_15_2d    			<=  15'b0   	;
        sample_cnt_15_3d    			<=  15'b0   	;
        sample_cnt_14_1d    			<=  16'b0   	;
        sample_cnt_14_2d    			<=  16'b0   	;
        sample_cnt_14_2d_dup1   		<=  16'b0   	;
        sample_cnt_14_2d_dup2   		<=  16'b0   	;
        sample_cnt_14_3d        		<=  16'b0   	;
        sym_cnt_15_1d           		<=   5'b0   	;
        sym_cnt_15_2d           		<=   5'b0   	;
        sym_cnt_15_3d           		<=   5'b0   	;
        sym_cnt_14_1d           		<=   5'b0   	;
        sym_cnt_14_2d           		<=   5'b0   	;
        sym_cnt_14_2d_dup1      		<=   5'b0   	;
        sym_cnt_14_2d_dup2      		<=   5'b0   	;
        sym_cnt_14_3d           		<=   5'b0   	;
        sfn_cnt_1d              		<=   4'b0   	;
        sfn_cnt_2d              		<=   4'b0   	;
        sfn_cnt_2d_dup1         		<=   4'b0   	;
        sfn_cnt_2d_dup2         		<=   4'b0   	;
        sfn_cnt_3d              		<=   4'b0   	;
        rfn_cnt_1d              		<=  10'b0   	;
        rfn_cnt_2d              		<=  10'b0   	;
        rfn_cnt_2d_dup1         		<=  10'b0   	;
        rfn_cnt_2d_dup2         		<=  10'b0   	;
        rfn_cnt_3d              		<=  10'b0   	;
        lte_sf_cnt_1d           		<=  14'b0   	;
        lte_sf_cnt_2d           		<=  14'b0   	;
        sample_cnt_14_limit_1d  		<=  16'd17790   ;
        sample_cnt_14_limit_2d  		<=  16'd17790   ;
        frame_config_1d         		<=  32'b0   	;
        frame_config_2d         		<=  32'b0   	;
        dl_input_config_1d      		<=  32'b0   	;
        dl_input_config_2d      		<=  32'b0   	;
        ul_input_config_1d      		<=  32'b0   	;
        ul_input_config_2d      		<=  32'b0   	;
        tti_pulse_1d            		<=  1'b0    	;
        tti_pulse_2d            		<=  1'b0    	;
        dl_input_sample_cnt_14_sel_1d   <=  1'b0    	;
        dl_input_sample_cnt_14_sel_2d   <=  1'b0    	;
        dl_input_enable_1d   			<=  1'b0    	;
        ul_input_enable_1d   			<=  1'b0    	;
        ul_input_sample_cnt_14_sel_1d 	<= 1'b0 		;
        ul_input_sample_cnt_14_sel_2d 	<= 1'b0 		;
		dl_ul_bwconfig_cc1_1d			<= 8'd0			;
		dl_ul_bwconfig_cc1_2d			<= 8'd0			;
		dl_ul_bwconfig_cc2_1d			<= 8'd0			;
		dl_ul_bwconfig_cc2_2d			<= 8'd0			;
		
		dl_ul_cp_len_1d					<= 11'd0		;
		dl_ul_cp_len_2d					<= 11'd0		;
		dl_ifft_gain_l1_1d				<= 32'd0		;
		dl_ifft_gain_l1_2d				<= 32'd0		;
		dl_ifft_shift_l1_1d				<= 4'd0			;
		dl_ifft_shift_l1_2d				<= 4'd0			;
		dl_ifft_mux_const_1d			<= 32'd0		;
		dl_ifft_mux_const_2d			<= 32'd0		;
		dl_ul_dc_sc_enable_1d			<= 4'b0			;
		dl_ul_dc_sc_enable_2d			<= 4'b0			;
		dl_ifft_gain_l2_1d				<= 32'd0		;
		dl_ifft_gain_l2_2d				<= 32'd0		;
		dl_ifft_shift_l2_1d				<= 4'd0			;
		dl_ifft_shift_l2_2d				<= 4'd0			;
		digital_power_scale_l1_1d		<= 32'd0		;
		digital_power_scale_l1_2d 		<= 32'd0		;
		digital_power_scale_l2_1d		<= 32'd0		;
		digital_power_scale_l2_2d 		<= 32'd0		;
		ul_hcs_bypass_1d				<= 1'd0			;
		ul_hcs_bypass_2d				<= 1'd0			;
		ul_fft_gain_l1_1d				<= 32'd0		;	
		ul_fft_gain_l1_2d				<= 32'd0		;	
		ul_fft_shift_l1_1d				<= 4'd0			;
		ul_fft_shift_l1_2d				<= 4'd0			;
		ul_fft_gain_l2_1d				<= 32'd0		;	
		ul_fft_gain_l2_2d				<= 32'd0		;	
		ul_fft_shift_l2_1d				<= 4'd0			;
		ul_fft_shift_l2_2d				<= 4'd0			;
		
		ifft_muxselect_1d				<= 2'd0			;
		ifft_muxselect_2d				<= 2'd0			;
		loopback_en_1d					<= 2'd0			;
		loopback_en_2d					<= 2'd0			;
		ifft_fft_size_1d				<= 4'd0			;
		ifft_fft_size_2d				<= 4'd0			;
		prb_blank_ctrl_1d               <= 'd0          ;
		prb_blank_ctrl_2d               <= 'd0          ;
		long_prach_freqoffset_1d        <= 'd0          ;
		long_prach_freqoffset_2d        <= 'd0          ;
		filt_flush_en_1d                <= 'd0          ;
		filt_flush_en_2d                <= 'd0          ;
		
    end
    else
    begin
        sample_cnt_15_1d   				<=  sample_cnt_15       	;
        sample_cnt_15_2d   				<=  sample_cnt_15_1d    	;
        sample_cnt_15_3d   				<=  sample_cnt_15_2d    	;
        sample_cnt_14_1d   				<=  sample_cnt_14       	;
        sample_cnt_14_2d   				<=  sample_cnt_14_1d    	;
        sample_cnt_14_2d_dup1   		<=  sample_cnt_14_1d    	;
        sample_cnt_14_2d_dup2   		<=  sample_cnt_14_1d    	;
        sample_cnt_14_3d        		<=  sample_cnt_14_2d    	;
        sym_cnt_15_1d           		<=  sym_cnt_15          	;
        sym_cnt_15_2d           		<=  sym_cnt_15_1d       	;
        sym_cnt_15_3d           		<=  sym_cnt_15_2d       	;
        sym_cnt_14_1d           		<=  sym_cnt_14          	;
        sym_cnt_14_2d           		<=  sym_cnt_14_1d       	;
        sym_cnt_14_2d_dup1      		<=  sym_cnt_14_1d       	;
        sym_cnt_14_2d_dup2      		<=  sym_cnt_14_1d       	;
        sym_cnt_14_3d       			<=  sym_cnt_14_2d       	;
        sfn_cnt_1d          			<=  sfn_cnt             	;
        sfn_cnt_2d          			<=  sfn_cnt_1d          	;
        sfn_cnt_2d_dup1         		<=  sfn_cnt_1d          	;
        sfn_cnt_2d_dup2         		<=  sfn_cnt_1d          	;
        sfn_cnt_3d          			<=  sfn_cnt_2d          	;
        rfn_cnt_1d          			<=  rfn_cnt             	;
        rfn_cnt_2d          			<=  rfn_cnt_1d          	;
        rfn_cnt_2d_dup1         		<=  rfn_cnt_1d          	;
        rfn_cnt_2d_dup2         		<=  rfn_cnt_1d          	;
        rfn_cnt_3d          			<=  rfn_cnt_2d          	;
        lte_sf_cnt_1d       			<=  lte_sf_cnt          	;
        lte_sf_cnt_2d       			<=  lte_sf_cnt_1d       	;
        sample_cnt_14_limit_1d  		<=  sample_cnt_14_limit     ;
        sample_cnt_14_limit_2d  		<=  sample_cnt_14_limit_1d  ;
        frame_config_1d         		<=  frame_config        	;
        frame_config_2d         		<=  frame_config_1d     	;
        dl_input_config_1d      		<=  dl_input_config     	;
        dl_input_config_2d      		<=  dl_input_config_1d  	;
        ul_input_config_1d      		<=  ul_input_config     	;
        ul_input_config_2d      		<=  ul_input_config_1d  	;
        tti_pulse_1d            		<=  tti_pulse           	;
        tti_pulse_2d            		<=  tti_pulse_1d        	;
	    auxN_tx_rfp_1d      			<=  auxN_tx_rfp         	;
        auxN_tx_rfp_2d     				<=  auxN_tx_rfp_1d      	;
		auxN_tx_rfp_3d      			<=  auxN_tx_rfp_2d      	;
        dl_input_sample_cnt_14_sel_1d   <=  dl_input_sample_cnt_14_sel      ;
        dl_input_sample_cnt_14_sel_2d   <=  dl_input_sample_cnt_14_sel_1d   ;
        dl_input_enable_1d  			<=  dl_input_enable     			;
        ul_input_enable_1d  			<=  ul_input_enable     			;
        ul_input_sample_cnt_14_sel_1d 	<=  ul_input_sample_cnt_14_sel    	;
        ul_input_sample_cnt_14_sel_2d 	<=  ul_input_sample_cnt_14_sel_1d 	;
		dl_ul_bwconfig_cc1_1d			<=  dl_ul_bwconfig_cc1				;
		dl_ul_bwconfig_cc1_2d			<=  dl_ul_bwconfig_cc1_1d			;
		dl_ul_bwconfig_cc2_1d			<=  dl_ul_bwconfig_cc2				;
		dl_ul_bwconfig_cc2_2d			<=  dl_ul_bwconfig_cc2_1d			;
		
		dl_ul_cp_len_1d					<= dl_ul_cp_len						;
		dl_ul_cp_len_2d					<= dl_ul_cp_len_1d					;
		dl_ifft_gain_l1_1d				<= dl_ifft_gain_l1					;
		dl_ifft_gain_l1_2d				<= dl_ifft_gain_l1_1d				;
		dl_ifft_shift_l1_1d				<= dl_ifft_shift_l1					;
		dl_ifft_shift_l1_2d				<= dl_ifft_shift_l1_1d				;
		dl_ifft_mux_const_1d			<= dl_ifft_mux_const				;
		dl_ifft_mux_const_2d			<= dl_ifft_mux_const_1d 			;
		dl_ul_dc_sc_enable_1d			<= dl_ul_dc_sc_enable				;
		dl_ul_dc_sc_enable_2d			<= dl_ul_dc_sc_enable_1d			;
		dl_ifft_gain_l2_1d				<= dl_ifft_gain_l2					;
		dl_ifft_gain_l2_2d				<= dl_ifft_gain_l2_1d				;
		dl_ifft_shift_l2_1d				<= dl_ifft_shift_l2					;
		dl_ifft_shift_l2_2d				<= dl_ifft_shift_l2_1d				;
		digital_power_scale_l1_1d		<= digital_power_scale_l1			;
		digital_power_scale_l1_2d		<= digital_power_scale_l1_1d		;
		digital_power_scale_l2_1d		<= digital_power_scale_l2			;
		digital_power_scale_l2_2d		<= digital_power_scale_l2_1d		;
		ul_hcs_bypass_1d				<= ul_hcs_bypass					;
		ul_hcs_bypass_2d				<= ul_hcs_bypass_1d					;
		ul_fft_gain_l1_1d				<= ul_fft_gain_l1					;
		ul_fft_gain_l1_2d				<= ul_fft_gain_l1_1d				;
		ul_fft_shift_l1_1d				<= ul_fft_shift_l1					;
		ul_fft_shift_l1_2d				<= ul_fft_shift_l1_1d				;
		ul_fft_gain_l2_1d				<= ul_fft_gain_l2					;
		ul_fft_gain_l2_2d				<= ul_fft_gain_l2_1d				;
		ul_fft_shift_l2_1d				<= ul_fft_shift_l2					;
		ul_fft_shift_l2_2d				<= ul_fft_shift_l2_1d				;
		
		ifft_muxselect_1d				<= ifft_muxselect					;
		ifft_muxselect_2d				<= ifft_muxselect_1d				;
		loopback_en_1d					<= loopback_en						;
		loopback_en_2d					<= loopback_en_1d					;
		
		ifft_fft_size_1d				<= ifft_fft_size					;
		ifft_fft_size_2d				<= ifft_fft_size_1d					;
		prb_blank_ctrl_1d               <= prb_blank_ctrl                   ;
		prb_blank_ctrl_2d               <= prb_blank_ctrl_1d                ;
		long_prach_freqoffset_1d        <= lphy_ss_conduit_ports.longprach_freqoffset          ;
		long_prach_freqoffset_2d        <= long_prach_freqoffset_1d         ;
		filt_flush_en_1d                <= filt_flush_en         			;
		filt_flush_en_2d                <= filt_flush_en_1d          		;
    end
end

assign auxN_tx_rfp_2d_pos = auxN_tx_rfp_2d & (~auxN_tx_rfp_3d) ;

always @ (posedge clk_dsp )
begin : TTI_PULSE
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        tti_pulse   <=  1'b0    ;
    else if((sample_cnt_15 == 15'd0) & (sym_cnt_15 == 5'd0))
        tti_pulse   <=  1'b1    ;
    else if(sample_cnt_15 == 15'd100)
        tti_pulse   <=  1'b0    ;
end


always @ (posedge clk_dsp )
begin : SAMPLE_CNT_15
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        sample_cnt_15   <=  15'b0   ;
	else if(auxN_tx_rfp_2d_pos)
        sample_cnt_15   <=  16'b0   ;
    else if(sample_cnt_15_last)
        sample_cnt_15   <=  15'b0   ;
    else
        sample_cnt_15   <=  sample_cnt_15 + 1'b1 ;
end

always @ (posedge clk_dsp )
begin : SYM_CNT_14_LIMIT
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        sample_cnt_14_limit <=  16'd17790               ;
    else if(auxN_tx_rfp_2d_pos)
        sample_cnt_14_limit <=  16'd17790  ;
	else
    begin
        case(sym_cnt_14_2d)
        5'd0    :   sample_cnt_14_limit <= 16'd17790    ;
        5'd1    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd2    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd3    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd4    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd5    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd6    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd7    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd8    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd9    :   sample_cnt_14_limit <= 16'd17534    ;
        5'd10   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd11   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd12   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd13   :   sample_cnt_14_limit <= 16'd17534    ;
	    5'd14   :   sample_cnt_14_limit <= 16'd17790    ;
        5'd15   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd16   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd17   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd18   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd19   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd20   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd21   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd22   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd23   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd24   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd25   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd26   :   sample_cnt_14_limit <= 16'd17534    ;
        5'd27   :   sample_cnt_14_limit <= 16'd17534    ;
		default : 	sample_cnt_14_limit <=  sample_cnt_14_limit               ;
        endcase
    end
end


always @ (posedge clk_dsp )
begin : SAMPLE_CNT_14
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        sample_cnt_14   <=  16'b0   ;
    else if(auxN_tx_rfp_2d_pos)
        sample_cnt_14   <=  16'b0   ;
    else if(sample_cnt_14_last)
        sample_cnt_14   <=  16'b0   ;
    else
        sample_cnt_14   <=  sample_cnt_14 + 1'b1 ;
end

always @ (posedge clk_dsp )
begin : SYM_CNT_15
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        sym_cnt_15  <=  5'b0    			;
    else if(auxN_tx_rfp_2d_pos)
        sym_cnt_15  <=  5'b0    			;
    else if(sample_cnt_15_last & sym_cnt_15_last)
        sym_cnt_15  <=  5'b0    			;
    else if(sample_cnt_15_last)
        sym_cnt_15  <=  sym_cnt_15 + 1'b1 	;
end

always @ (posedge clk_dsp)
begin : SYM_CNT_14
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        sym_cnt_14  <=  5'b0    ;
	else if(auxN_tx_rfp_2d_pos)
        sym_cnt_14  <=  5'b0    ;
    else if(sample_cnt_14_last & sym_cnt_14_last)
        sym_cnt_14  <=  5'b0    ;
    else if(sample_cnt_14_last)
        sym_cnt_14  <=  sym_cnt_14 + 1'b1    ;
end

always @ (posedge clk_dsp  )
begin : SFN_CNT
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        sfn_cnt <=  4'b0    ;
	else if(auxN_tx_rfp_2d_pos)
        sfn_cnt <=  4'b0    ;
    else if(sample_cnt_15_last & sym_cnt_15_last & sfn_cnt_last)
        sfn_cnt <=  4'b0    ;
    else if(sample_cnt_15_last & sym_cnt_15_last)
        sfn_cnt <=  sfn_cnt + 1'b1  ;
end

always @ (posedge clk_dsp )
begin : RFN_CNT
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        rfn_cnt <=  'b0    ;
	else if(auxN_tx_rfp_2d_pos)
        rfn_cnt <= 'b0     ;
    else if(sample_cnt_15_last & sym_cnt_15_last & sfn_cnt_last)
        rfn_cnt <=  rfn_cnt + 1'b1  ;
end

always @ (posedge clk_dsp )
begin : LTE_SFN_SF
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        lte_sf_cnt  <=  14'b0   ;
    else if(sample_cnt_15_last & sym_cnt_15_last & lte_sf_cnt_last)
        lte_sf_cnt  <=  14'b0   ;
    else if(sample_cnt_15_last & sym_cnt_15_last)
        lte_sf_cnt  <=  lte_sf_cnt + 1'b1  ;
end


always @ (posedge clk_dsp )
begin : FRAME_LAST
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
    begin
        sample_cnt_14_last  <=  1'b0    ;
        sample_cnt_15_last  <=  1'b0    ;
        sym_cnt_15_last     <=  1'b0    ;
        sym_cnt_14_last     <=  1'b0    ;
        sfn_cnt_last        <=  1'b0    ;
        lte_sf_cnt_last     <=  1'b0    ;
    end
    else
    begin
        sample_cnt_14_last  <=  sample_cnt_14 == sample_cnt_14_limit_2d ;
        sample_cnt_15_last  <=  sample_cnt_15 == 15'd16382            	;
        sym_cnt_15_last     <=  sym_cnt_15 == 5'd29                     ;
        sym_cnt_14_last     <=  sym_cnt_14 == 5'd27                     ;
        sfn_cnt_last        <=  sfn_cnt == 4'd9                         ;
        lte_sf_cnt_last     <=  lte_sf_cnt == 14'd10239                 ;
    end
end


always @ (posedge clk_dsp )
begin : DL_INPUT_FRAME_SEL
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
    begin
        dl_input_rfn_cnt_sel         <=  1'b0    ;
        dl_input_sfn_cnt_sel         <=  1'b0    ;
        dl_input_sym_cnt_14_sel      <=  1'b0    ;
        dl_input_sample_cnt_14_sel   <=  1'b0    ;
        ul_input_rfn_cnt_sel         <=  1'b0    ;
        ul_input_sfn_cnt_sel         <=  1'b0    ;
        ul_input_sym_cnt_14_sel      <=  1'b0    ;
        ul_input_sample_cnt_14_sel   <=  1'b0    ;
    end
    else
    begin
        dl_input_rfn_cnt_sel         <=  rfn_cnt_2d_dup1[0] == dl_input_rfn          ;
        dl_input_sfn_cnt_sel         <=  sfn_cnt_2d_dup1 == dl_input_sfn             ;
        dl_input_sym_cnt_14_sel      <=  sym_cnt_14_2d_dup1 == dl_input_sym          ;
        dl_input_sample_cnt_14_sel   <=  sample_cnt_14_2d_dup1 == dl_input_sample    ;
        ul_input_rfn_cnt_sel         <=  rfn_cnt_2d_dup2[0] == ul_input_rfn          ;
        ul_input_sfn_cnt_sel         <=  sfn_cnt_2d_dup2 == ul_input_sfn             ;
        ul_input_sym_cnt_14_sel      <=  sym_cnt_14_2d_dup2 == ul_input_sym          ;
        ul_input_sample_cnt_14_sel   <=  sample_cnt_14_2d_dup2 == ul_input_sample    ;
    end
end

always @ (posedge clk_dsp )
begin : DL_INPUT_ENABLE
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        dl_input_enable <=  1'b0        ;
    else if(dl_input_sample_cnt_14_sel & dl_input_sym_cnt_14_sel &
            dl_input_sfn_cnt_sel & dl_input_rfn_cnt_sel)
        dl_input_enable <=  dl_start    ;
end

assign dl_input_hfn_pulse = dl_input_enable & (~dl_input_enable_1d) ;
/*
always @ (posedge clk_dsp )
begin : DL_INPUT_PULSE
    if(~rst_dsp_n)
        dl_input_hfn_pulse  <=  1'b0            ;
    else if(dl_input_sample_cnt_14_sel_2d)
        dl_input_hfn_pulse  <=  dl_input_enable_1d ;
    else
        dl_input_hfn_pulse  <=  1'b0    ;
end
*/
always @ (posedge clk_dsp )
begin : UL_INPUT_ENABLE
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        ul_input_enable <=  1'b0        ;
    else if(ul_input_sample_cnt_14_sel & ul_input_sym_cnt_14_sel &
            ul_input_sfn_cnt_sel & ul_input_rfn_cnt_sel)
        ul_input_enable <=  ul_start    ;
end

always @ (posedge clk_dsp )
begin : UL_INPUT_PULSE
    if(~rst_dsp_n & rst_dsp_soft_n_4d)
        ul_input_hfn_pulse  <=  1'b0            ;
    else
        ul_input_hfn_pulse  <=  ul_input_enable 		;
end

always @ (posedge clk_csr )
begin : PIPE_PRB_FLAG
    if(~rst_csr_n) begin
        blank_prb_flag_1d  <=  'd0            ;
		blank_prb_flag_2d  <=  'd0            ;
		blank_prb_intr_1d  <= 'd0			  ;
		blank_prb_intr_2d  <= 'd0			  ;
		
	end	
    else begin
		blank_prb_flag_1d  <=  lphy_ss_conduit_ports.blank_prb_flag           ;
		blank_prb_flag_2d  <=  blank_prb_flag_1d          ;
		blank_prb_intr_1d  <=  lphy_ss_conduit_ports.blank_prb_intr			  ;
		blank_prb_intr_2d  <=  blank_prb_intr_1d		  ;
	end
end

always @ (posedge clk_csr )
begin
    if(~rst_csr_n) begin
		eaxc_intr_rsvd_1d		<= 'd0;
		eaxc_intr_rsvd_2d		<= 'd0;
		cu_coupling_status_1d		<= 'd0;
		cu_coupling_status_2d		<= 'd0;
		cu_coupling_version_1d		<= 'd0;
		cu_coupling_version_2d		<= 'd0;
		
	end	
    else begin
		eaxc_intr_rsvd_1d		<= {ul_rtc_id_intr, ul_axc_id_intr, dl_axc_id_intr} ;
		eaxc_intr_rsvd_2d		<= eaxc_intr_rsvd_1d ;
		cu_coupling_status_1d		<= cu_coupling_status;
		cu_coupling_status_2d		<= cu_coupling_status_1d;
		cu_coupling_version_1d		<= cu_coupling_version;
		cu_coupling_version_2d		<= cu_coupling_version_1d;
	end
end

always @ (posedge clk_csr )
begin
    if(~rst_csr_n) begin
		short_long_prach_select_1d <= 'd0 ;
        short_long_prach_select_2d <= 'd0 ;		
	end	
    else begin
	  short_long_prach_select_1d <= short_long_prach_select;
	  short_long_prach_select_2d <= short_long_prach_select_1d ;	
	end
end

always @ (posedge clk_csr )
begin
    if(~rst_csr_n) begin
		ocm_capture_enable_1d <= 'd0 ;
        ocm_capture_enable_2d <= 'd0 ;		
	end	
    else begin
	  ocm_capture_enable_1d <= ocm_capture_enable ;
	  ocm_capture_enable_2d <= ocm_capture_enable_1d;
	end
end

always @ (posedge clk_csr )
begin
    if(~rst_csr_n) begin
		timeout_cntr_intr_cplane_1d <= 'd0 ;
        timeout_cntr_intr_cplane_2d <= 'd0 ;		
	end	
    else begin
	  timeout_cntr_intr_cplane_1d <= timeout_cntr_intr_cplane;
	  timeout_cntr_intr_cplane_2d <= timeout_cntr_intr_cplane_1d ;	
	end
end

always @ (posedge clk_csr )
begin
    if(~rst_csr_n) begin
		timeout_cntr_intr_uplane_1d <= 'd0 ;
        timeout_cntr_intr_uplane_2d <= 'd0 ;		
	end	
    else begin
	  timeout_cntr_intr_uplane_1d <= timeout_cntr_intr_uplane;
	  timeout_cntr_intr_uplane_2d <= timeout_cntr_intr_uplane_1d ;	
	end
end

// intr masking
always @ (posedge clk_csr )
begin
    if(~rst_csr_n) begin
	 intr_register <= 'b0 ;	       		
	end	
    else  begin
     intr_register[0]    <= timeout_cntr_intr_cplane_2d ; // & (~intr_mask[0]) ;
	 intr_register[1]    <= timeout_cntr_intr_uplane_2d ; // & (~intr_mask[1]) ;
     intr_register[2]    <= fifo_full_intr      ; // already in csr clock domain
	 intr_register[15:3] <= intr_register[15:3]	; 
	end
end

endmodule
