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

 module lphy_ss 
 #(
   parameter    
   //DSP parameters
   NUM_OF_ANT        	= 8		,
   NUM_OF_FFT       	= 2		,
   CPRI_ETH_DATAWIDTH   = 128	,
   XRAN_ETH_DATAWIDTH   = 128	,
   CH_DW 				= 8		,
   NUM_OF_PRACH 		= 2     ,
   CAPTURE_DMA_WIDTH    = 512   ,
   IQ_DATAWIDTH 				    = 32 	              ,
   CPRI_FRAME_DATAWIDTH       	    = 64  	              ,
   ECPRI_CAPTURE_INSTANCES          = 2                   ,
   DSP_CAPTURE_INSTANCES            = 30                  ,
   LPHY_DSP_CAPTURE_INST = 8 
   
)(
 
input clk_dsp                  ,
input rst_dsp_n                ,
input clk_csr                  ,
input rst_csr_n                ,
input clk_eth_xran_dl          ,
input clk_eth_xran_ul          ,
input rst_eth_xran_n_dl        ,
input rst_eth_xran_n_ul        ,
output rst_soft_n              ,

// input from oran ip to dl lphy subsystem
input                                     xran_demapper_source_valid        	 ,
input     [XRAN_ETH_DATAWIDTH-1:0]        xran_demapper_source_data         	 ,
input     [15 :0]                         xran_demapper_source_channel      	 ,
input                                     xran_demapper_source_endofpacket  	 ,
input                                     xran_demapper_source_startofpacket	 ,
output                                    xran_demapper_source_ready        	 ,
// input channel number from dl eaxc id config of ecpri oran subsystem
input     [15:0] 						  rx_u_axc_id						     , 
// input channel number from dl rtc id config of ecpri oran subsystem
input     [15:0] 						  rx_rtc_id_dl						     , 


input                                      lphy_ss_ul_sink_valid1               ,
input [IQ_DATAWIDTH -1 :0]                 lphy_ss_ul_sink_data1                ,
input [7:0]                                lphy_ss_ul_sink_channel1             ,
									       
input                                      lphy_ss_ul_sink_valid2               ,
input [IQ_DATAWIDTH -1 :0]                 lphy_ss_ul_sink_data2                ,
input [7:0]                                lphy_ss_ul_sink_channel2             ,


// ifft output to Dxc ss
output                                    ifft_source_valid1               	      ,
output   [IQ_DATAWIDTH-1:0]  		 	  ifft_source_data1                	      ,
output   [7:0 ]                           ifft_source_channel1             	      ,
output                                    ifft_source_valid2               	      ,
output   [IQ_DATAWIDTH-1:0] 			  ifft_source_data2                	      ,
output   [7:0 ]                       	  ifft_source_channel2             	      ,

input   [31:0]                          ifft1_busIn_writedata           ,
input   [13:0 ]                          ifft1_busIn_address             ,
input                                   ifft1_busIn_write               ,
input                                   ifft1_busIn_read                ,
output                                  ifft1_busOut_readdatavalid      ,
output  [31:0]                          ifft1_busOut_readdata           ,
output                                  ifft1_busOut_waitrequest        ,

input   [31:0]                          ifft2_busIn_writedata           ,
input   [13:0 ]                          ifft2_busIn_address             ,
input                                   ifft2_busIn_write               ,
input                                   ifft2_busIn_read                ,
output                                  ifft2_busOut_readdatavalid      ,
output  [31:0]                          ifft2_busOut_readdata           ,
output                                  ifft2_busOut_waitrequest        ,

input   [31:0]                          fft1_busIn_writedata            ,
input   [13:0 ]                          fft1_busIn_address             ,
input                                   fft1_busIn_write                ,
input                                   fft1_busIn_read                 ,
output                                  fft1_busOut_readdatavalid       ,
output  [31:0]                          fft1_busOut_readdata            ,
output                                  fft1_busOut_waitrequest         ,

input   [31:0]                          fft2_busIn_writedata            ,
input   [13:0 ]                          fft2_busIn_address             ,
input                                   fft2_busIn_write                ,
input                                   fft2_busIn_read                 ,
output                                  fft2_busOut_readdatavalid       ,
output  [31:0]                          fft2_busOut_readdata            ,
output                                  fft2_busOut_waitrequest         ,


input   [3 :0]                          pb_ddr_csr_address            	,
input                                   pb_ddr_csr_write              	,
input      [31:0]                       pb_ddr_csr_writedata          	,
output reg [31:0]                       pb_ddr_csr_readdata           	,
// from radio config
output [7:0]		                        bw_config_cc1		            ,
output [7:0]		                        bw_config_cc2		            ,


input 								    pb_avst_sink_valid              ,
input 	[63:0]						    pb_avst_sink_data               ,
output								    pb_avst_sink_ready              ,

input 	  [189:0]                       oran_rx_cplane_concat             ,
input 	  [67:0 ]                       oran_rx_uplane_concat             ,


output 			coupling_pusch_avst_sink_valid_l1 	 			,
output [31:0] 	coupling_pusch_avst_sink_data_l1 	 			,
output [15:0] 	coupling_pusch_avst_sink_channel_l1 			,
output  		coupling_pusch_avst_sink_sop_l1 	 			,
output 			coupling_pusch_avst_sink_eop_l1 	 			,	
																
output 			coupling_pusch_avst_sink_valid_l2 	 			,
output [31:0] 	coupling_pusch_avst_sink_data_l2 	 			,	
output [15:0] 	coupling_pusch_avst_sink_channel_l2 			,
output 			coupling_pusch_avst_sink_sop_l2 	 			,
output 			coupling_pusch_avst_sink_eop_l2 	 			,



output 			coupling_prach_avst_sink_valid_l1 	 						    ,
output [31:0] 	coupling_prach_avst_sink_data_l1 	 							,
output [15:0] 	coupling_prach_avst_sink_channel_l1 							,
output  		coupling_prach_avst_sink_sop_l1 	 						    ,
output 			coupling_prach_avst_sink_eop_l1 	 							,	

output 			coupling_prach_avst_sink_valid_l2 	 						    ,
output [31:0] 	coupling_prach_avst_sink_data_l2 	 							,	
output [15:0] 	coupling_prach_avst_sink_channel_l2 							,
output 			coupling_prach_avst_sink_sop_l2 	 							,
output 			coupling_prach_avst_sink_eop_l2 	 							,



// Traffic MM Slave	
input  [16:0]   pb_mm_bridge_address			                                ,
input           pb_mm_bridge_chipselect			                                ,
input           pb_mm_bridge_read				                                ,
input           pb_mm_bridge_write				                                ,	
input  [31:0]   pb_mm_bridge_writedata			                                ,
input  [3:0]    pb_mm_bridge_byteenable			                                ,
output [31:0]   pb_mm_bridge_readdata			                                ,
output          pb_mm_bridge_waitrequest		                                ,

// from oran
input           xran_demapper_cplane_valid                                      ,
input           xran_demapper_cplane_startofpacket                              ,
input           xran_demapper_cplane_endofpacket                                ,



input   [31:0]  short_prach1_busIn_writedata          								,
input   [9:0]   short_prach1_busIn_address            								,
input           short_prach1_busIn_write              								,
input           short_prach1_busIn_read               								,
output          short_prach1_busOut_readdatavalid     								,
output  [31:0]  short_prach1_busOut_readdata          								,
output          short_prach1_busOut_waitrequest       								,

input   [31:0]  short_prach2_busIn_writedata          								,
input   [9:0]   short_prach2_busIn_address            								,
input           short_prach2_busIn_write              								,
input           short_prach2_busIn_read               								,
output          short_prach2_busOut_readdatavalid     								,
output  [31:0]  short_prach2_busOut_readdata          								,
output          short_prach2_busOut_waitrequest       								,

input  [3:0]    long_prach_lw_bridge_address_l1  		,
input           long_prach_lw_bridge_write_l1    		,    
output [31:0]   long_prach_lw_bridge_readdata_l1 		,
input  [31:0]   long_prach_lw_bridge_writedata_l1		,
output 			long_prach_lw_bridge_waitrequest_l1     ,	
output 			long_prach_lw_bridge_readdatavalid_l1   ,
input  			long_prach_lw_bridge_read_l1            ,


input  [3:0]    long_prach_lw_bridge_address_l2  		,
input           long_prach_lw_bridge_write_l2    		,    
output [31:0]   long_prach_lw_bridge_readdata_l2 		,
input  [31:0]   long_prach_lw_bridge_writedata_l2		,		
output 			long_prach_lw_bridge_waitrequest_l2     ,	
output 			long_prach_lw_bridge_readdatavalid_l2   ,
input  			long_prach_lw_bridge_read_l2            ,

 								
output  [31:0]  coupling_pusch_timing_ref   			,
output  [31:0]  coupling_prach_timing_ref   			,

// from ul rtc id config to prach top
input [15:0] 	rx_rtc_id								,
output  short_long_prach_select                         ,


input   [7 :0]      lphy_ss_config_csr_address       	 ,
input               lphy_ss_config_csr_write         	 ,
input				lphy_ss_config_csr_read				 ,//new ipxact
output 				lphy_ss_config_csr_readdatavalid	 ,//new ipxact
input   [31:0]      lphy_ss_config_csr_writedata     	 ,
output  [31:0]      lphy_ss_config_csr_readdata          ,
output              lphy_ss_config_csr_waitrequest       ,//new ipxact

output [55:0] radio_config_status ,
input  frame_status_counter_reset ,

output reg                                        lphy_avst_selctd_cap_intf_valid,
output reg  [IQ_DATAWIDTH-1:0]                    lphy_avst_selctd_cap_intf_data ,
output reg  [2:0]                 				  lphy_avst_selctd_cap_intf_chan , 
output  ul_start_pulse_latch ,

input [31:0] interface_sel ,

output       dl_input_hfn_pulse  ,


output wire								pwr_mtr_ifft_hist_done_intr_l1,
output wire								pwr_mtr_ifft_hist_done_intr_l2,


input  			[5:0]   	        pm_ifft_threash_mm_bridge_address_l1		,
input  			         	        pm_ifft_threash_mm_bridge_chipselect_l1		,
input  			         	        pm_ifft_threash_mm_bridge_read_l1			,
input  			         	        pm_ifft_threash_mm_bridge_write_l1			,	
input  			[31:0] 	            pm_ifft_threash_mm_bridge_writedata_l1		,
input  			[3:0]    	        pm_ifft_threash_mm_bridge_byteenable_l1		,
output 			[31:0] 	            pm_ifft_threash_mm_bridge_readdata_l1		,
output 			         	        pm_ifft_threash_mm_bridge_waitrequest_l1	,

input  			[11:0]  			pm_ifft_hist_mm_bridge_address_l1			,
input  			         			pm_ifft_hist_mm_bridge_chipselect_l1		,
input  			         			pm_ifft_hist_mm_bridge_read_l1				,
input  			         			pm_ifft_hist_mm_bridge_write_l1				,	
input  			[31:0] 				pm_ifft_hist_mm_bridge_writedata_l1			,
input  			[3:0]    			pm_ifft_hist_mm_bridge_byteenable_l1		,
output 			[31:0] 				pm_ifft_hist_mm_bridge_readdata_l1			,
output 							pm_ifft_hist_mm_bridge_readdatavalid_l1			,
output 			         			pm_ifft_hist_mm_bridge_waitrequest_l1		,

input 	wire 	[31:0] 				pwr_mtr_ifft_config_csr_writedata_l1				,	
input 	wire 						pwr_mtr_ifft_config_csr_read_l1				   	    ,
input 	wire	 					pwr_mtr_ifft_config_csr_write_l1					,
output 	    	[31:0] 				pwr_mtr_ifft_config_csr_readdata_l1					,
output 	    						pwr_mtr_ifft_config_csr_readdatavalid_l1			,
output 	      						pwr_mtr_ifft_config_csr_waitrequest_l1				,	
input	wire 	[3:0] 				pwr_mtr_ifft_config_csr_address_l1			    	,

input  			[5:0]   	        pm_ifft_threash_mm_bridge_address_l2		,
input  			         	        pm_ifft_threash_mm_bridge_chipselect_l2		,
input  			         	        pm_ifft_threash_mm_bridge_read_l2			,
input  			         	        pm_ifft_threash_mm_bridge_write_l2			,	
input  			[31:0] 	            pm_ifft_threash_mm_bridge_writedata_l2		,
input  			[3:0]    	        pm_ifft_threash_mm_bridge_byteenable_l2		,
output 			[31:0] 	            pm_ifft_threash_mm_bridge_readdata_l2		,
output 			         	        pm_ifft_threash_mm_bridge_waitrequest_l2	,

input  			[11:0]  			pm_ifft_hist_mm_bridge_address_l2			,
input  			         			pm_ifft_hist_mm_bridge_chipselect_l2		,
input  			         			pm_ifft_hist_mm_bridge_read_l2				,
input  			         			pm_ifft_hist_mm_bridge_write_l2				,	
input  			[31:0] 				pm_ifft_hist_mm_bridge_writedata_l2			,
input  			[3:0]    			pm_ifft_hist_mm_bridge_byteenable_l2		,
output 			[31:0] 				pm_ifft_hist_mm_bridge_readdata_l2			,
output 			 				pm_ifft_hist_mm_bridge_readdatavalid_l2			,
output 			         			pm_ifft_hist_mm_bridge_waitrequest_l2		,

input 	wire 	[31:0] 				pwr_mtr_ifft_config_csr_writedata_l2				,	
input 	wire 						pwr_mtr_ifft_config_csr_read_l2				   	    ,
input 	wire	 					pwr_mtr_ifft_config_csr_write_l2					,
output 	    	[31:0] 				pwr_mtr_ifft_config_csr_readdata_l2					,
output 	    						pwr_mtr_ifft_config_csr_readdatavalid_l2			,
output 	      						pwr_mtr_ifft_config_csr_waitrequest_l2				,	
input	wire 	[3:0] 				pwr_mtr_ifft_config_csr_address_l2,

output wire								pwr_mtr_fft_hist_done_intr_l1,
output wire								pwr_mtr_fft_hist_done_intr_l2,

input  			[5:0]   	        pm_fft_threash_mm_bridge_address_l1			,
input  			         	        pm_fft_threash_mm_bridge_chipselect_l1		,
input  			         	        pm_fft_threash_mm_bridge_read_l1			,
input  			         	        pm_fft_threash_mm_bridge_write_l1			,	
input  			[31:0] 	            pm_fft_threash_mm_bridge_writedata_l1		,
input  			[3:0]    	        pm_fft_threash_mm_bridge_byteenable_l1		,
output 			[31:0] 	            pm_fft_threash_mm_bridge_readdata_l1		,
output 			         	        pm_fft_threash_mm_bridge_waitrequest_l1	,

input  			[11:0]  			pm_fft_hist_mm_bridge_address_l1			,
input  			         			pm_fft_hist_mm_bridge_chipselect_l1		,
input  			         			pm_fft_hist_mm_bridge_read_l1				,
input  			         			pm_fft_hist_mm_bridge_write_l1				,	
input  			[31:0] 			pm_fft_hist_mm_bridge_writedata_l1			,
input  			[3:0]    			pm_fft_hist_mm_bridge_byteenable_l1		,
output 			[31:0] 			pm_fft_hist_mm_bridge_readdata_l1			,
output 			 				pm_fft_hist_mm_bridge_readdatavalid_l1			,
output 			         			pm_fft_hist_mm_bridge_waitrequest_l1		,


input 	wire 	[31:0] 				pwr_mtr_fft_config_csr_writedata_l1				,	
input 	wire 						pwr_mtr_fft_config_csr_read_l1				    ,
input 	wire	 					pwr_mtr_fft_config_csr_write_l1					,
output 	    	[31:0] 				pwr_mtr_fft_config_csr_readdata_l1				,
output 	    						pwr_mtr_fft_config_csr_readdatavalid_l1			,
output 	      						pwr_mtr_fft_config_csr_waitrequest_l1			,	
input	wire 	[3:0] 				pwr_mtr_fft_config_csr_address_l1			    ,

input  			[5:0]   	        pm_fft_threash_mm_bridge_address_l2			,
input  			         	        pm_fft_threash_mm_bridge_chipselect_l2		,
input  			         	        pm_fft_threash_mm_bridge_read_l2			,
input  			         	        pm_fft_threash_mm_bridge_write_l2			,	
input  			[31:0] 	            pm_fft_threash_mm_bridge_writedata_l2		,
input  			[3:0]    	        pm_fft_threash_mm_bridge_byteenable_l2		,
output 			[31:0] 	            pm_fft_threash_mm_bridge_readdata_l2		,
output 			         	        pm_fft_threash_mm_bridge_waitrequest_l2		,

input  			[11:0]  			pm_fft_hist_mm_bridge_address_l2			,
input  			         			pm_fft_hist_mm_bridge_chipselect_l2			,
input  			         			pm_fft_hist_mm_bridge_read_l2				,
input  			         			pm_fft_hist_mm_bridge_write_l2				,	
input  			[31:0] 			pm_fft_hist_mm_bridge_writedata_l2			,
input  			[3:0]    			pm_fft_hist_mm_bridge_byteenable_l2			,
output 			[31:0] 			pm_fft_hist_mm_bridge_readdata_l2			,
output 			 				pm_fft_hist_mm_bridge_readdatavalid_l2			,
output 			         			pm_fft_hist_mm_bridge_waitrequest_l2		,


input 	wire 	[31:0] 				pwr_mtr_fft_config_csr_writedata_l2				,	
input 	wire 						pwr_mtr_fft_config_csr_read_l2				    ,
input 	wire	 					pwr_mtr_fft_config_csr_write_l2					,
output 	    	[31:0] 				pwr_mtr_fft_config_csr_readdata_l2				,
output 	    						pwr_mtr_fft_config_csr_readdatavalid_l2			,
output 	      						pwr_mtr_fft_config_csr_waitrequest_l2			,	
input	wire 	[3:0] 				pwr_mtr_fft_config_csr_address_l2	            ,

input  			[9:0]  			pm_stat_ifft_mm_bridge_address_l1			,
input  			         			pm_stat_ifft_mm_bridge_chipselect_l1		,
input  			         			pm_stat_ifft_mm_bridge_read_l1				,
input  			         			pm_stat_ifft_mm_bridge_write_l1			    ,	
input  			[31:0] 			pm_stat_ifft_mm_bridge_writedata_l1		    ,
input  			[3:0]    			pm_stat_ifft_mm_bridge_byteenable_l1		,
output 			[31:0] 			pm_stat_ifft_mm_bridge_readdata_l1			,
output 							pm_stat_ifft_mm_bridge_readdatavalid_l1			,
output 			         			pm_stat_ifft_mm_bridge_waitrequest_l1       ,

input  			[9:0]  			    pm_stat_ifft_mm_bridge_address_l2			,
input  			         			pm_stat_ifft_mm_bridge_chipselect_l2		,
input  			         			pm_stat_ifft_mm_bridge_read_l2				,
input  			         			pm_stat_ifft_mm_bridge_write_l2			    ,	
input  			[31:0] 				pm_stat_ifft_mm_bridge_writedata_l2		    ,
input  			[3:0]    			pm_stat_ifft_mm_bridge_byteenable_l2		,
output 			[31:0] 				pm_stat_ifft_mm_bridge_readdata_l2			,
output 							pm_stat_ifft_mm_bridge_readdatavalid_l2			,
output 			         			pm_stat_ifft_mm_bridge_waitrequest_l2	    ,

input  			[9:0]  			    pm_stat_fft_mm_bridge_address_l1			,
input  			         			pm_stat_fft_mm_bridge_chipselect_l1		    ,
input  			         			pm_stat_fft_mm_bridge_read_l1				,
input  			         			pm_stat_fft_mm_bridge_write_l1			    ,	
input  			[31:0] 				pm_stat_fft_mm_bridge_writedata_l1		    ,
input  			[3:0]    			pm_stat_fft_mm_bridge_byteenable_l1		    ,
output 			[31:0] 				pm_stat_fft_mm_bridge_readdata_l1			,
output 							pm_stat_fft_mm_bridge_readdatavalid_l1			,
output 			         			pm_stat_fft_mm_bridge_waitrequest_l1        ,

input  			[9:0]  			    pm_stat_fft_mm_bridge_address_l2			,
input  			         			pm_stat_fft_mm_bridge_chipselect_l2			,
input  			         			pm_stat_fft_mm_bridge_read_l2				,
input  			         			pm_stat_fft_mm_bridge_write_l2			    ,	
input  			[31:0] 				pm_stat_fft_mm_bridge_writedata_l2		    ,
input  			[3:0]    			pm_stat_fft_mm_bridge_byteenable_l2			,
output 			[31:0] 				pm_stat_fft_mm_bridge_readdata_l2			,
output 							pm_stat_fft_mm_bridge_readdatavalid_l2			,
output 			         			pm_stat_fft_mm_bridge_waitrequest_l2	    ,

output wire							duc_ddc_lpbk_en			               

 ); 
`include "../common/def_param.vh" 
 
localparam    NUM_INTERFACES_LOG2 = (LPHY_DSP_CAPTURE_INST > 1) ? $clog2(LPHY_DSP_CAPTURE_INST): 1;
localparam    ANTENNA_DWIDTH = $clog2(NUM_OF_ANT)  ;
 






(*preserve_syn_only*) reg				rst_dsp_n_1d	    									;
(*preserve_syn_only*) reg				rst_dsp_n_2d	    									;
(*preserve_syn_only*) reg 				rst_dsp_n_3d	    									;
(*preserve_syn_only*) reg 				rst_dsp_n_4d	    									;

(*preserve_syn_only*) reg 				rst_dsp_n_2d_dup1										;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup1										;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup1										;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup2										;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup2										;

(*preserve_syn_only*) reg 				rst_dsp_n_3d_dup3										;
(*preserve_syn_only*) reg 				rst_dsp_n_4d_dup3										;

(*preserve_syn_only*) reg 				rst_dsp_n_5d_dup1										;
(*preserve_syn_only*) reg 				rst_dsp_n_6d_dup1										;

(*preserve_syn_only*) reg 				rst_dsp_n_5d_dup2										;
(*preserve_syn_only*) reg 				rst_dsp_n_6d_dup2										;

(*preserve_syn_only*) reg 				rst_dsp_soft_n_1d 										;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_1d_dup1 									;

(*preserve_syn_only*) reg 				rst_dsp_soft_n_2d 										;
	
(*preserve_syn_only*) reg 				rst_dsp_soft_n_3d_dup1   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_4d_dup1   								;
			
(*preserve_syn_only*) reg 				rst_dsp_soft_n_3d_dup2   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_4d_dup2  								;
			
(*preserve_syn_only*) reg 				rst_dsp_soft_n_3d_dup3   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_4d_dup3   								;

(*preserve_syn_only*) reg 				rst_dsp_soft_n_5d_dup1   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_6d_dup1   								;

(*preserve_syn_only*) reg 				rst_dsp_soft_n_5d_dup2   								;
(*preserve_syn_only*) reg 				rst_dsp_soft_n_6d_dup2   								;

wire 									rst_eth_n_dl_sync									    ;
reg										rst_eth_n_dl_1d										    ;
reg										rst_eth_n_dl_2d										    ;
reg										rst_eth_n_dl_3d										    ;
reg										rst_eth_n_dl_4d										    ;

reg 									rst_eth_n_dl_3d_dup1								    ;
reg 									rst_eth_n_dl_4d_dup1								    ;

reg 									rst_eth_n_dl_3d_dup2								    ;
reg 									rst_eth_n_dl_4d_dup2								    ;

reg 									rst_eth_n_dl_3d_dup3								    ;
reg 									rst_eth_n_dl_4d_dup3								    ;

reg 									rst_eth_n_dl_5d_dup1								    ;
reg 									rst_eth_n_dl_6d_dup1								    ;

reg 									rst_eth_n_dl_5d_dup2								    ;
reg 									rst_eth_n_dl_6d_dup2								    ;

reg 									rst_eth_n_dl_5d_dup3								    ;
reg 									rst_eth_n_dl_6d_dup3								    ;

reg 									rst_eth_n_dl_5d_dup4								    ;
reg 									rst_eth_n_dl_6d_dup4								    ;

wire 									rst_eth_n_ul_sync										;
reg										rst_eth_n_ul_1d											;
reg										rst_eth_n_ul_2d											;
reg										rst_eth_n_ul_3d											;
reg										rst_eth_n_ul_4d											;

reg										rst_eth_n_ul_2d_dup1									;
reg										rst_eth_n_ul_2d_dup2									;

reg 									rst_eth_n_ul_3d_dup1									;
reg 									rst_eth_n_ul_4d_dup1									;

reg 									rst_eth_n_ul_3d_dup2									;
reg 									rst_eth_n_ul_4d_dup2									;

reg 									rst_eth_n_ul_3d_dup3									;
reg 									rst_eth_n_ul_4d_dup3									;

reg 									rst_eth_n_ul_5d_dup1									;
reg 									rst_eth_n_ul_6d_dup1									;

reg 									rst_eth_n_ul_5d_dup2									;
reg 									rst_eth_n_ul_6d_dup2									;

reg 									rst_eth_n_ul_5d_dup3									;
reg 									rst_eth_n_ul_6d_dup3									;

reg 									rst_eth_n_ul_5d_dup4									;
reg 									rst_eth_n_ul_6d_dup4									;

reg 									rst_eth_soft_n_1d										;
reg 									rst_eth_soft_n_1d_dup1									;
reg 									rst_eth_soft_n_2d										;
reg 									rst_eth_soft_n_3d_dup1									;
reg 									rst_eth_soft_n_4d_dup1									;
reg										rst_eth_soft_n_3d_dup2									;
reg 									rst_eth_soft_n_4d_dup2									;
reg 									rst_eth_soft_n_3d_dup3									;
reg 									rst_eth_soft_n_4d_dup3									;
reg 									rst_eth_soft_n_5d_dup3									;
reg 									rst_eth_soft_n_6d_dup3									;

reg                                     rst_eth_soft_n_dl_1d 									;
reg                                     rst_eth_soft_n_dl_2d									;
reg                                     rst_eth_soft_n_dl_3d									;
reg                                     rst_eth_soft_n_dl_4d									;
reg                                     rst_eth_soft_n_dl_5d									;
reg                                     rst_eth_soft_n_dl_4d_dup1								;

reg    [5:0] 						   dl_c_slotID_1d						;
reg    [3:0] 						   dl_numSymbol_1d						;
reg    [5:0] 						   dl_c_symbolid_1d						;
reg    [7:0] 						   dl_c_numPrb_1d						;
reg    [7:0] 						   dl_sectionType_1d					;
reg    [9:0]                           dl_c_startPrb_1d                     ;
reg                                    dl_c_datadirection_1d                ;
reg		[7:0]						dl_c_numsection_1d						;
reg                                    dl_xran_demapper_cplane_valid_1d     ;

reg    [5:0] 						   dl_c_slotID_2d						;
reg    [3:0] 						   dl_numSymbol_2d						;
reg    [5:0] 						   dl_c_symbolid_2d						;
reg    [7:0] 						   dl_c_numPrb_2d						;
reg    [7:0] 						   dl_sectionType_2d					;
reg    [9:0]                           dl_c_startPrb_2d                     ;
reg                                    dl_c_datadirection_2d                ;
reg		[7:0]						dl_c_numsection_2d						;
reg                                    dl_xran_demapper_cplane_valid_2d     ;

reg    [5:0] 						   dl_c_slotID_3d						;
reg    [3:0] 						   dl_numSymbol_3d						;
reg    [5:0] 						   dl_c_symbolid_3d						;
reg    [7:0] 						   dl_c_numPrb_3d						;
reg    [7:0] 						   dl_sectionType_3d					;
reg                                    dl_c_datadirection_3d                ;
reg		[7:0]						dl_c_numsection_3d						;
reg    [9:0]                           dl_c_startPrb_3d                     ;
reg                                    dl_xran_demapper_cplane_valid_3d     ;

reg                                   pb_dl_scheduler_inj_sel           ;
reg                                   pb_dl_scheduler_inj_sel_1d        ;
reg                                   pb_dl_scheduler_inj_sel_2d        ;


reg                                   pb_fft_inj_sel           ;
reg                                   pb_fft_inj_sel_1d        ;
reg                                   pb_fft_inj_sel_2d        ;

reg 								  xran_demapper_cplane_vout_ul		;
reg 								  xran_demapper_cplane_vout_ul_1d	;
reg 								  xran_demapper_cplane_vout_ul_2d	;
reg 								  xran_demapper_cplane_vout_ul_3d	;
reg 								  xran_demapper_cplane_vout_ul_4d	;
reg 								  xran_demapper_cplane_vout_ul_5d	;
reg 								  xran_demapper_cplane_vout_ul_6d	;
reg 								  xran_demapper_cplane_ext_valid    ;
reg [23:0] 							  xran_demapper_cplane_dout_ul		;
reg [23:0] 							  xran_demapper_cplane_dout_fo_ul   ;
reg [55:0]                            xran_demapper_cplane_dout_prach   ;



reg     [15:0]                        rx_timeOffset_1d                  ;
reg     [15:0]                        rx_timeOffset_2d                  ;
reg     [15:0]                        rx_timeOffset_3d                  ;
																	    
reg    	[23:0]                        c_freqoffset_1d                   ;
reg    	[23:0]                        c_freqoffset_2d                   ;
reg    	[23:0]                        c_freqoffset_3d                   ;
																	    
reg    	[15:0]                        c_cplength_1d                     ;
reg    	[15:0]                        c_cplength_2d                     ;
reg    	[15:0]                        c_cplength_3d                     ;
reg    	[7:0]                         c_framestructure_1d               ;
reg    	[7:0]                         c_framestructure_2d               ;
reg    	[7:0]                         c_framestructure_3d               ;

reg                                   c_datadirection_1d             	;
reg                                   c_datadirection_2d             	;
reg                                   c_datadirection_3d             	;
reg    [7:0] 						  rx_sectionType_1d					;
reg    [7:0] 						  rx_sectionType_2d					;
reg    [7:0] 						  rx_sectionType_3d					;
reg    [3:0] 						  rx_c_subframeId_1d				;
reg    [3:0] 						  rx_c_subframeId_2d				;
reg    [3:0] 						  rx_c_subframeId_3d				;
reg    [5:0] 						  rx_c_symbolid_1d					;
reg    [5:0] 						  rx_c_symbolid_2d					;
reg    [5:0] 						  rx_c_symbolid_3d					;

reg [3:0]							  	rx_c_num_symbol_1d;
reg [3:0]								rx_c_num_symbol_2d;
reg [3:0]								rx_c_num_symbol_3d;
reg [5:0]								rx_c_slotID_1d ; 
reg [5:0]								rx_c_slotID_2d ; 
reg [5:0]								rx_c_slotID_3d ; 
reg [7:0]								rx_c_frameId_1d ; 
reg [7:0]								rx_c_frameId_2d ; 
reg [7:0]								rx_c_frameId_3d ; 

reg                                   xran_demapper_cplane_valid_1d        ;
reg                                   xran_demapper_cplane_startofpacket_1d;
reg                                   xran_demapper_cplane_endofpacket_1d  ;

reg                                   xran_demapper_cplane_valid_2d        ;
reg                                   xran_demapper_cplane_startofpacket_2d;
reg                                   xran_demapper_cplane_endofpacket_2d  ;

reg                                   xran_demapper_cplane_valid_3d        ;
reg                                   xran_demapper_cplane_startofpacket_3d;
reg                                   xran_demapper_cplane_endofpacket_3d  ;

wire [LPHY_DSP_CAPTURE_INST -1 :0] 				     lphy_avst_source_dsp_capture_valid               ;
wire [LPHY_DSP_CAPTURE_INST * IQ_DATAWIDTH -1 :0]	 lphy_avst_source_dsp_capture_data                ;
wire [LPHY_DSP_CAPTURE_INST * ANTENNA_DWIDTH -1 :0]  lphy_avst_source_dsp_capture_chan                ;

reg  [LPHY_DSP_CAPTURE_INST-1:0]                     avst_selctd_intf_shift_valid; 
reg  [LPHY_DSP_CAPTURE_INST*IQ_DATAWIDTH-1:0]        avst_selctd_intf_shift_data;
reg  [LPHY_DSP_CAPTURE_INST*ANTENNA_DWIDTH-1:0]      avst_selctd_intf_shift_chan;



// dl scheduler output to cu plane coupling for scheduler loopback
wire                                dl_scheduler_source_valid_1        ;
wire [IQ_DATAWIDTH-1:0]   		    dl_scheduler_source_data_1         ;
wire [7:0 ]                         dl_scheduler_source_channel_1      ;

// dl scheduler output to dfd ss
wire                                dl_scheduler_source_valid_2        ;
wire [IQ_DATAWIDTH-1:0]   			dl_scheduler_source_data_2         ;
wire [7:0 ]                         dl_scheduler_source_channel_2      ;

wire                                 	cap_prach_out_l1_valid          ;
wire  [IQ_DATAWIDTH -1 :0]   	 		cap_prach_out_l1_data           ;
wire  [7:0]                             cap_prach_out_l1_channel        ;

wire                                    cap_prach_out_l2_valid          ;
wire  [IQ_DATAWIDTH -1 :0]   			cap_prach_out_l2_data           ;
wire  [7:0]                             cap_prach_out_l2_channel        ;

wire                                    cap_ifft1_out_valid          	  ;
wire  [IQ_DATAWIDTH-1:0]   			  	cap_ifft1_out_data           	  ;
wire  [7:0 ]                            cap_ifft1_out_channel        	  ;
                                                                
wire                                    cap_ifft2_out_valid          	  ;
wire  [IQ_DATAWIDTH-1:0]   			  	cap_ifft2_out_data           	  ;
wire  [7:0 ]                            cap_ifft2_out_channel        	  ;


wire        xran_demapper_sts_frame_vout ;
wire        xran_demapper_sts_prb_vout   ;
wire [33:0] xran_demapper_sts_prb_dout   ;
wire [31:0] xran_demapper_sts_frame_dout ;
wire [57:0] xran_demapper_c_plane_metad  ;
wire        xran_demapper_c_plane_metav  ; 

wire        scheduler_pb_sink_ready      ;

wire                        	scheduler_source_valid1      ;
wire [IQ_DATAWIDTH -1 :0]   	scheduler_source_data1       ;
wire [7:0]                  	scheduler_source_channel1    ;
wire                        	scheduler_source_valid2      ;
wire [IQ_DATAWIDTH -1 :0]   	scheduler_source_data2       ;
wire [7:0]                  	scheduler_source_channel2    ;


reg scheduler_source_valid1_1d ;
reg scheduler_source_valid1_2d ;
reg scheduler_source_valid1_3d ;
reg scheduler_source_valid1_4d ;
reg scheduler_source_valid1_5d ;

reg scheduler_source_valid2_1d ;
reg scheduler_source_valid2_2d ;
reg scheduler_source_valid2_3d ;
reg scheduler_source_valid2_4d ;
reg scheduler_source_valid2_5d ;

reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data1_1d            						   ;
reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data1_2d            						   ;
reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data1_3d            						   ;
reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data1_4d            						   ;
reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data1_5d            						   ;

reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data2_1d            						   ;
reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data2_2d            						   ;
reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data2_3d            						   ;
reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data2_4d            						   ;
reg [IQ_DATAWIDTH -1 :0]   			scheduler_source_data2_5d            						   ;

reg [7:0]   scheduler_source_channel1_1d    ;
reg [7:0]   scheduler_source_channel1_2d    ;
reg [7:0]   scheduler_source_channel1_3d    ;
reg [7:0]   scheduler_source_channel1_4d    ;
reg [7:0]   scheduler_source_channel1_5d    ;

reg [7:0]   scheduler_source_channel2_1d    ;
reg [7:0]   scheduler_source_channel2_2d    ;
reg [7:0]   scheduler_source_channel2_3d    ;
reg [7:0]   scheduler_source_channel2_4d    ;
reg [7:0]   scheduler_source_channel2_5d    ;


wire [13:0] 			        ul_frame_status				 ;

wire    [IQ_DATAWIDTH*NUM_OF_PRACH-1 :0]ul_prach_avst_sink_data  ;
wire    [NUM_OF_PRACH-1 :0]     		ul_prach_avst_sink_valid ;
wire    [(NUM_OF_PRACH*8)-1 :0]     	ul_prach_avst_sink_channel;


wire                                  	fft_l1_source_valid             						;
wire    [IQ_DATAWIDTH-1:0]   			fft_l1_source_data              						;
wire    [7:0 ]                        	fft_l1_source_channel           						;
wire                                  	fft_l1_source_ready             						;
wire                                  	fft_l1_source_endofpacket       						;
wire                                  	fft_l1_source_startofpacket     						;

wire                                  	fft_l2_source_valid             						;
wire    [IQ_DATAWIDTH-1:0]   			fft_l2_source_data              						;
wire    [7:0 ]                        	fft_l2_source_channel           						;
wire                                  	fft_l2_source_ready             						;
wire                                  	fft_l2_source_endofpacket       						;
wire                                  	fft_l2_source_startofpacket     						;

wire   dl_scheduler_lb_en ;


wire									sync_in						    ;

wire [63:0 ]     						prach_timing_ref; 
wire [63:0 ]     						pusch_timing_ref;



wire dl_scheduler_source_endofpacket_1        ;
wire dl_scheduler_source_startofpacket_1      ;
wire dl_scheduler_source_ready_1              ;
									   
wire dl_scheduler_source_endofpacket_2        ;
wire dl_scheduler_source_startofpacket_2      ;
wire dl_scheduler_source_ready_2              ;

wire coupling_data_inj_en                  	  ;
wire       ul_input_hfn_pulse                 ;

wire c_hps;
wire hps_valid ;
wire [1:0] filt_flush_en	;
wire blanking_dis;

wire [10:0]  cp_len						;				
wire [3:0] 	 fft_size				    ;
wire [1:0]   ifft_l1_control_reg	    ;
wire [31:0]  ifft_gain_l1			    ;
wire [3:0]   ifft_shift_l1			    ;
wire [15:0]  ifft_mux_const_l1_reg	    ;
wire [1:0]   ifft_l2_control_reg	    ;
wire [31:0]  ifft_gain_l2 			    ;
wire [3:0]   ifft_shift_l2 			    ;
wire [15:0]  ifft_mux_const_l2_reg	    ;
wire [1:0]   fft_l1_control_reg		    ;
wire [31:0]  fft_gain_l1			    ;
wire [3:0]   fft_shift_l1			    ;
wire [1:0]   fft_l2_control_reg		    ;
wire [31:0]  fft_gain_l2			    ;
wire [3:0]   fft_shift_l2			    ;
wire         ifft_fft_lpbk			    ;
wire [31:0]  long_prach_version_reg		;
wire		 Pb_enable					;
wire 		 Pb_select					;

oran_rx_uplane_conduit     oran_rx_uplane  			;
oran_rx_cplane_conduit     oran_rx_cplane  			;

wire num_cc ;

reg [47:0]  config_value  ;
reg	 		hps_valid_1d  ;
reg 		hps_valid_2d  ;
wire 		hps_enb		  ;
reg 		hps_latch	  ;
reg 		hps_latch_1d  ;
reg 		hps_latch_2d  ;
reg 	    c_hps_1d	  ;	
reg 	    c_hps_2d	  ;
reg [6:0] 	count		  ;

wire [7:0] 	hps_framestructure ;
wire [15:0]	hps_cplength       ;
wire [23:0]	hps_freqoffset     ;

wire ifft_l1_control_ifft_rc_enable_l1      	 ; 
wire ifft_l2_control_ifft_rc_enable_l2      	 ;
wire fft_l1_control_fft_rc_enable_l1        	 ;
wire fft_l2_control_fft_rc_enable_l2        	 ;

wire [3:0] ifft_l1_rc_bw_sel_ifft_rc_bw_sel_l1    ;
wire [3:0] ifft_l2_rc_bw_sel_ifft_rc_bw_sel_l2    ;
wire [3:0] fft_l1_rc_bw_sel_fft_rc_bw_sel_l1      ;
wire [3:0] fft_l2_rc_bw_sel_fft_rc_bw_sel_l2      ;

wire [31:0] short_prach_time_offset;
wire [31:0] short_prach_time_offset_bias;
wire [31:0] short_prach_startsym_bias;

wire ul_start_pulse_latch_int  ;


wire                                    blanking_source_valid_1          ;
wire    [IQ_DATAWIDTH-1:0] 			  blanking_source_data_1           ;
wire    [7:0 ]                          blanking_source_channel_1        ;
wire                                    blanking_source_endofpacket_1    ;
wire                                    blanking_source_startofpacket_1  ;

wire                                    blanking_source_valid_2          ;
wire    [IQ_DATAWIDTH-1:0] 			  blanking_source_data_2           ;
wire    [7:0 ]                          blanking_source_channel_2        ;
wire                                    blanking_source_endofpacket_2    ;
wire                                    blanking_source_startofpacket_2  ;

wire duc_ddc_lpbk;
reg duc_ddc_lpbk_en_1d;
reg duc_ddc_lpbk_en_2d;

assign ul_start_pulse_latch = ul_start_pulse_latch_int ;
//assign sync_in 					= ul_input_hfn_pulse;
assign sync_in 					= ul_start_pulse_latch_int;


// num_cc based on cc2 enabled or disabled
`ifdef NUM_CC_TWO
 assign num_cc = 1'b0 ;
`else
 assign num_cc = 1'b1 ;
`endif

assign oran_rx_uplane    	 = oran_rx_uplane_concat  		;
assign oran_rx_cplane    	 = oran_rx_cplane_concat  		;
 
assign lphy_ss_config_csr_waitrequest = 1'b0 ;//new ipxact
assign hps_cplength = {5'b0,cp_len} ;

assign 	 pwr_mtr_fft_config_csr_waitrequest_l1 = 1'b0  ;
assign 	 pwr_mtr_fft_config_csr_waitrequest_l2 = 1'b0  ;
assign 	 pwr_mtr_ifft_config_csr_waitrequest_l1 = 1'b0  ;
assign 	 pwr_mtr_ifft_config_csr_waitrequest_l2 = 1'b0  ;

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
	
	
always @(posedge clk_dsp)
	begin
		rst_dsp_soft_n_1d 		<= rst_soft_n;
		rst_dsp_soft_n_1d_dup1 	<= rst_soft_n;
		
		rst_dsp_soft_n_2d 		<= rst_dsp_soft_n_1d;
	
		rst_dsp_soft_n_3d_dup1   <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup1   <= rst_dsp_soft_n_3d_dup1;
		rst_dsp_soft_n_5d_dup1   <= rst_dsp_soft_n_4d_dup1;
		rst_dsp_soft_n_6d_dup1   <= rst_dsp_soft_n_5d_dup1;

		rst_dsp_soft_n_3d_dup2   <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup2   <= rst_dsp_soft_n_3d_dup2;
		rst_dsp_soft_n_5d_dup2   <= rst_dsp_soft_n_4d_dup2;
		rst_dsp_soft_n_6d_dup2   <= rst_dsp_soft_n_5d_dup2;
		
		rst_dsp_soft_n_3d_dup3   <= rst_dsp_soft_n_2d;
		rst_dsp_soft_n_4d_dup3   <= rst_dsp_soft_n_3d_dup3;		
		
		
	end	
	
altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_eth_dl_rst_ctrl
(
    .reset_in   (~rst_eth_xran_n_dl     ),
    .clk        (clk_eth_xran_dl        ), 
    .reset_out  (rst_eth_n_dl_sync 		)
);

always @(posedge clk_eth_xran_dl)
	begin
	    rst_eth_n_dl_1d 	 <= ~rst_eth_n_dl_sync;
		rst_eth_n_dl_2d		 <= rst_eth_n_dl_1d;
		rst_eth_n_dl_3d		 <= rst_eth_n_dl_2d;
		rst_eth_n_dl_4d		 <= rst_eth_n_dl_3d;
	end
	
always @(posedge clk_eth_xran_dl)
	begin
	    rst_eth_n_dl_3d_dup1  <= rst_eth_n_dl_2d;
		rst_eth_n_dl_4d_dup1  <= rst_eth_n_dl_3d_dup1;
			
	    rst_eth_n_dl_3d_dup2  <= rst_eth_n_dl_2d;
		rst_eth_n_dl_4d_dup2  <= rst_eth_n_dl_3d_dup2;
		rst_eth_n_dl_4d_dup3  <= rst_eth_n_dl_3d_dup2;

	end	
	
always @(posedge clk_eth_xran_dl)
	begin
	    rst_eth_n_dl_5d_dup1  <= rst_eth_n_dl_4d;
		rst_eth_n_dl_6d_dup1  <= rst_eth_n_dl_5d_dup1;
		 
   		rst_eth_n_dl_5d_dup2  <= rst_eth_n_dl_4d;
		rst_eth_n_dl_6d_dup2  <= rst_eth_n_dl_5d_dup2;
		    
		rst_eth_n_dl_5d_dup3  <= rst_eth_n_dl_4d;
		rst_eth_n_dl_6d_dup3  <= rst_eth_n_dl_5d_dup3;	

		rst_eth_n_dl_5d_dup4  <= rst_eth_n_dl_4d;
		rst_eth_n_dl_6d_dup4  <= rst_eth_n_dl_5d_dup4;		
	end		
	
altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_eth_ul_rst_ctrl
(
    .reset_in   (~rst_eth_xran_n_ul     ),
    .clk        (clk_eth_xran_ul        ), 
    .reset_out  (rst_eth_n_ul_sync 		)
);

always @(posedge clk_eth_xran_ul)
	begin
	    rst_eth_n_ul_1d 		<= ~rst_eth_n_ul_sync;
		rst_eth_n_ul_2d 		<= rst_eth_n_ul_1d;	
		rst_eth_n_ul_3d 		<= rst_eth_n_ul_2d;
		rst_eth_n_ul_4d 		<= rst_eth_n_ul_3d;
	end
	
always @(posedge clk_eth_xran_ul)
	begin
	    rst_eth_n_ul_3d_dup1  <= rst_eth_n_ul_2d;
		rst_eth_n_ul_4d_dup1  <= rst_eth_n_ul_3d_dup1;
		 
   		rst_eth_n_ul_3d_dup2  <= rst_eth_n_ul_2d;
		rst_eth_n_ul_4d_dup2  <= rst_eth_n_ul_3d_dup2;
		    
		rst_eth_n_ul_3d_dup3  <= rst_eth_n_ul_2d;
		rst_eth_n_ul_4d_dup3  <= rst_eth_n_ul_3d_dup3;					
	end	
	
always @(posedge clk_eth_xran_ul)
	begin
	    rst_eth_n_ul_5d_dup1  <= rst_eth_n_ul_4d;
		rst_eth_n_ul_6d_dup1  <= rst_eth_n_ul_5d_dup1;
		 
   		rst_eth_n_ul_5d_dup2  <= rst_eth_n_ul_4d;
		rst_eth_n_ul_6d_dup2  <= rst_eth_n_ul_5d_dup2;
		    
		rst_eth_n_ul_5d_dup3  <= rst_eth_n_ul_4d;
		rst_eth_n_ul_6d_dup3  <= rst_eth_n_ul_5d_dup3;	

		rst_eth_n_ul_5d_dup4  <= rst_eth_n_ul_4d;
		rst_eth_n_ul_6d_dup4  <= rst_eth_n_ul_5d_dup4;	
	
	end	
	
always @(posedge clk_eth_xran_ul)
	begin
		rst_eth_soft_n_1d 		 <= rst_soft_n;
		rst_eth_soft_n_1d_dup1   <= rst_soft_n;
		
		rst_eth_soft_n_2d 		 <= rst_eth_soft_n_1d;
	
		rst_eth_soft_n_3d_dup1   <= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d_dup1   <= rst_eth_soft_n_3d_dup1;
			
		rst_eth_soft_n_3d_dup2   <= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d_dup2   <= rst_eth_soft_n_3d_dup2;
			
		rst_eth_soft_n_3d_dup3   <= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d_dup3   <= rst_eth_soft_n_3d_dup3;		
		
		rst_eth_soft_n_5d_dup3   <= rst_eth_soft_n_4d_dup3;
		rst_eth_soft_n_6d_dup3   <= rst_eth_soft_n_5d_dup3;	
	end	
	
always @(posedge clk_eth_xran_dl)
	begin
		rst_eth_soft_n_dl_1d 		<= rst_soft_n;		
		rst_eth_soft_n_dl_2d 		<= rst_eth_soft_n_1d;
		rst_eth_soft_n_dl_3d        <= rst_eth_soft_n_dl_2d;
		rst_eth_soft_n_dl_4d        <= rst_eth_soft_n_dl_3d;
		rst_eth_soft_n_dl_4d_dup1   <= rst_eth_soft_n_dl_3d;
        rst_eth_soft_n_dl_5d		<= rst_eth_soft_n_dl_4d;
	end	
	
always @(posedge clk_eth_xran_ul)
	begin
		if(~rst_eth_n_ul_4d_dup3)
		begin
			xran_demapper_cplane_vout_ul 		<= 'd0;
			
		end
		else
		begin
			xran_demapper_cplane_vout_ul    	<= (((~oran_rx_cplane.rx_c_dataDirection) & (oran_rx_cplane.rx_sectionType == 'd3))?xran_demapper_cplane_valid & xran_demapper_cplane_startofpacket:0);
		    end
	end
	
always @(posedge clk_eth_xran_ul)
	begin
		if(~rst_eth_n_ul_4d_dup3)
		begin
			c_framestructure_1d					<=	'd0;
			c_framestructure_2d                 <=	'd0;
			c_framestructure_3d                 <=	'd0;
			c_cplength_1d       				<=	'd0;
			c_cplength_2d       				<=	'd0;
			c_cplength_3d       				<=	'd0;
			c_freqoffset_1d     				<=	'd0;
			c_freqoffset_2d     				<=	'd0;
			c_freqoffset_3d     				<=	'd0;
			xran_demapper_cplane_vout_ul_1d		<=  'd0;
			rx_timeOffset_1d                    <=  'd0;
			rx_timeOffset_2d                    <=  'd0;
			rx_timeOffset_3d                    <=  'd0;
			xran_demapper_cplane_vout_ul_2d		<=  'd0;
			xran_demapper_cplane_vout_ul_3d		<=  'd0;
			xran_demapper_cplane_vout_ul_4d		<=  'd0;
			xran_demapper_cplane_vout_ul_5d		<=  'd0;
			xran_demapper_cplane_vout_ul_6d		<=  'd0;
			xran_demapper_cplane_ext_valid		<=  'd0;
		end
		else
		begin
			c_framestructure_1d					<=	oran_rx_cplane.rx_frameStructure;
			c_cplength_1d       				<=	oran_rx_cplane.rx_cpLength   	;
			c_cplength_2d       				<=	c_cplength_1d   			   	;
			c_cplength_3d       				<=	c_cplength_2d   			   	;
		    c_freqoffset_1d     				<=	oran_rx_cplane.rx_frequencyOffset;
			c_freqoffset_2d     				<=	c_freqoffset_1d 			   ;
			c_freqoffset_3d     				<=	c_freqoffset_2d 			   ;
			xran_demapper_cplane_vout_ul_1d		<= xran_demapper_cplane_vout_ul	   ;
			rx_timeOffset_1d                    <= oran_rx_cplane.rx_timeOffset    ;
			rx_timeOffset_2d                    <= rx_timeOffset_1d                ;
			rx_timeOffset_3d                    <= rx_timeOffset_2d                ;
			c_framestructure_2d                 <= c_framestructure_1d             ;
			c_framestructure_3d                 <= c_framestructure_2d             ;
			xran_demapper_cplane_vout_ul_2d		<=  xran_demapper_cplane_vout_ul_1d	;
			xran_demapper_cplane_vout_ul_3d		<=  xran_demapper_cplane_vout_ul_2d	;
			xran_demapper_cplane_vout_ul_4d		<=  xran_demapper_cplane_vout_ul_3d	;
			xran_demapper_cplane_vout_ul_5d		<=  xran_demapper_cplane_vout_ul_4d	;
			xran_demapper_cplane_vout_ul_6d		<=  xran_demapper_cplane_vout_ul_5d	;
			xran_demapper_cplane_ext_valid		<=  xran_demapper_cplane_vout_ul_2d | xran_demapper_cplane_vout_ul_3d | xran_demapper_cplane_vout_ul_4d | xran_demapper_cplane_vout_ul_5d | xran_demapper_cplane_vout_ul_6d;
		end
	end





always @(posedge clk_eth_xran_dl)
	begin
		if(~rst_eth_n_dl_4d_dup3)//rst_eth_xran_n_dl_5d
		begin	
			hps_valid_1d <= 'd0;
			hps_valid_2d <= 'd0;
			hps_latch_1d <= 'd0;
			hps_latch_2d <= 'd0;
			c_hps_1d	<= 'd0;
			c_hps_2d	<= 'd0;
		end
		else
		begin
			hps_valid_1d <= hps_valid;
			hps_valid_2d <= hps_valid_1d;
			hps_latch_1d <= hps_latch;
			hps_latch_2d <= hps_latch_1d;
			c_hps_1d	<= c_hps;
			c_hps_2d	<= c_hps_1d;		
		end
	end


 
assign hps_enb = hps_valid_1d & ~hps_valid_2d;

always @ (posedge clk_eth_xran_dl )
begin
	if (rst_eth_n_dl_4d_dup3 == 1'b0)//rst_eth_xran_n_dl_5d
		hps_latch <= 'd0;
	else if(hps_latch & count == 'd7)
		hps_latch <= 'd0;	
	else if (hps_enb)
		hps_latch <= 'd1;
end

always @ (posedge clk_eth_xran_dl )
begin
	if (rst_eth_n_dl_4d_dup3 == 1'b0)//rst_eth_xran_n_dl_5d
	begin
		count <= 'd0;
	end
	else if(count == 'd35 && hps_latch)
	begin
		count <= 'd0;
	end
	else if(hps_latch)
		count <= count + 'd1;
end

always @ (posedge clk_eth_xran_dl )
begin
	if (~rst_eth_n_dl_4d_dup3 )//rst_eth_xran_n_dl_5d
		config_value <= 'd0;
	else if(hps_latch)
	begin
	        config_value <= {hps_freqoffset,hps_cplength,hps_framestructure}	;
	end
end


	
always @(posedge clk_eth_xran_ul)
	begin
		if(~rst_eth_n_ul_4d_dup3)
		begin	
			xran_demapper_cplane_dout_ul    		<= 'd0;
			xran_demapper_cplane_dout_fo_ul 		<= 'd0;
		end
		else if(c_hps_2d & xran_demapper_cplane_vout_ul)			// M Plane
		begin
			xran_demapper_cplane_dout_ul [7:0] 		<= config_value[7:0];
			xran_demapper_cplane_dout_ul [23:8] 	<= config_value[23:8];
			xran_demapper_cplane_dout_fo_ul [23:0] 	<= config_value[47:24];
		end
		else if(~c_hps_2d & xran_demapper_cplane_vout_ul)						// C Plane
		begin
			xran_demapper_cplane_dout_ul [7:0] 		<= c_framestructure_1d;
			xran_demapper_cplane_dout_ul [23:8] 	<= c_cplength_1d;
			xran_demapper_cplane_dout_fo_ul [23:0] 	<= c_freqoffset_1d;		
		end
	end	
	
	always @(posedge clk_eth_xran_dl)
	begin
		if(~rst_eth_n_dl_4d_dup3)
		begin	
			xran_demapper_cplane_dout_prach    		<= 'd0;
		end
		else if(~c_hps_2d & xran_demapper_cplane_vout_ul)					
		begin
		    xran_demapper_cplane_dout_prach[15:0] 	<= c_cplength_1d;
			xran_demapper_cplane_dout_prach[31:16] 	<= rx_timeOffset_1d;
			xran_demapper_cplane_dout_prach [55:32] <= c_freqoffset_1d;		
		end
	end

	
	
	
	
	
	
assign xran_demapper_sts_prb_vout  			= xran_demapper_source_valid & oran_rx_cplane.rx_sec_hdr_valid;
assign xran_demapper_sts_frame_vout 		= xran_demapper_source_valid & xran_demapper_source_startofpacket;
	  
assign xran_demapper_sts_prb_dout[7:0]		= ((xran_demapper_sts_prb_vout ==1)?8'b0000001:8'b00000001);
assign xran_demapper_sts_prb_dout[15:8]		= ((xran_demapper_sts_prb_vout ==1)?8'b0000000:0);
assign xran_demapper_sts_prb_dout[25:16]	= ((xran_demapper_sts_prb_vout ==1)? oran_rx_uplane.rx_u_startPrb:0);
assign xran_demapper_sts_prb_dout[33:26]	= ((xran_demapper_sts_prb_vout ==1)? oran_rx_uplane.rx_u_numPrb:0)  ;

assign xran_demapper_sts_frame_dout[7:0]	= ((xran_demapper_sts_frame_vout ==1)?oran_rx_uplane.rx_u_frameId    :0);           
assign xran_demapper_sts_frame_dout[15:8]	= ((xran_demapper_sts_frame_vout ==1)?oran_rx_uplane.rx_u_subframeId :0);        
assign xran_demapper_sts_frame_dout[23:16]	= ((xran_demapper_sts_frame_vout ==1)?oran_rx_uplane.rx_u_slotID     :0);            
assign xran_demapper_sts_frame_dout[31:24]	= ((xran_demapper_sts_frame_vout ==1)?oran_rx_uplane.rx_u_symbolid   :0);          

assign xran_demapper_c_plane_metad = {dl_c_numsection_3d,dl_c_slotID_3d,dl_numSymbol_3d,dl_c_symbolid_3d,dl_c_numPrb_3d,dl_c_startPrb_3d,rx_rtc_id_dl}; //6+4+6+8+10+16
assign xran_demapper_c_plane_metav = (dl_sectionType_3d==8'h01 && dl_c_datadirection_3d==1'b1) ? dl_xran_demapper_cplane_valid_3d : 1'b0;

//assign ul_prach_avst_sink_data 	= {scheduler_source_data2,scheduler_source_data1}	;
//assign ul_prach_avst_sink_valid = {scheduler_source_valid2,scheduler_source_valid1}	;


 always @ (posedge clk_dsp) begin
    if (~rst_dsp_n_6d_dup1) begin
       scheduler_source_valid1_1d   <= 'd0;
	   scheduler_source_valid1_2d   <= 'd0;
	   scheduler_source_valid1_3d   <= 'd0;
	   scheduler_source_valid1_4d   <= 'd0;
	   scheduler_source_valid1_5d   <= 'd0;
	   scheduler_source_valid2_1d   <= 'd0;
	   scheduler_source_valid2_2d   <= 'd0;
	   scheduler_source_valid2_3d   <= 'd0;
	   scheduler_source_valid2_4d   <= 'd0;
	   scheduler_source_valid2_5d   <= 'd0;
	   scheduler_source_data1_1d    <= 'd0;
	   scheduler_source_data1_2d    <= 'd0;
	   scheduler_source_data1_3d    <= 'd0;
	   scheduler_source_data1_4d    <= 'd0;
	   scheduler_source_data1_5d    <= 'd0;
	   scheduler_source_data2_1d    <= 'd0;
	   scheduler_source_data2_2d    <= 'd0;
	   scheduler_source_data2_3d    <= 'd0;
	   scheduler_source_data2_4d    <= 'd0;
	   scheduler_source_data2_5d    <= 'd0;
	   scheduler_source_channel1_1d <= 'd0;
	   scheduler_source_channel1_2d <= 'd0;
	   scheduler_source_channel1_3d <= 'd0;
	   scheduler_source_channel1_4d <= 'd0;
	   scheduler_source_channel1_5d <= 'd0;
	   scheduler_source_channel2_1d <= 'd0;
	   scheduler_source_channel2_2d <= 'd0;
	   scheduler_source_channel2_3d <= 'd0;
	   scheduler_source_channel2_4d <= 'd0;
	   scheduler_source_channel2_5d <= 'd0;
	   duc_ddc_lpbk_en_1d           <= 'd0;
	   duc_ddc_lpbk_en_2d           <= 'd0;
    end else begin
       scheduler_source_valid1_1d <= scheduler_source_valid1		;
	   scheduler_source_valid1_2d <= scheduler_source_valid1_1d		;
	   scheduler_source_valid1_3d <= scheduler_source_valid1_2d		;
	   scheduler_source_valid1_4d <= scheduler_source_valid1_3d		;
	   scheduler_source_valid1_5d <= scheduler_source_valid1_4d		;		
	   scheduler_source_valid2_1d <= scheduler_source_valid2     	;
	   scheduler_source_valid2_2d <= scheduler_source_valid2_1d  	;
	   scheduler_source_valid2_3d <= scheduler_source_valid2_2d  	;
	   scheduler_source_valid2_4d <= scheduler_source_valid2_3d  	;
	   scheduler_source_valid2_5d <= scheduler_source_valid2_4d  	;
	   scheduler_source_data1_1d <= scheduler_source_data1		;
	   scheduler_source_data1_2d <= scheduler_source_data1_1d		;
	   scheduler_source_data1_3d <= scheduler_source_data1_2d		;
	   scheduler_source_data1_4d <= scheduler_source_data1_3d		;
	   scheduler_source_data1_5d <= scheduler_source_data1_4d		;		
	   scheduler_source_data2_1d <= scheduler_source_data2     	;
	   scheduler_source_data2_2d <= scheduler_source_data2_1d  	;
	   scheduler_source_data2_3d <= scheduler_source_data2_2d  	;
	   scheduler_source_data2_4d <= scheduler_source_data2_3d  	;
	   scheduler_source_data2_5d <= scheduler_source_data2_4d  	;
	   scheduler_source_channel1_1d <= scheduler_source_channel1		;
	   scheduler_source_channel1_2d <= scheduler_source_channel1_1d		;
	   scheduler_source_channel1_3d <= scheduler_source_channel1_2d		;
	   scheduler_source_channel1_4d <= scheduler_source_channel1_3d		;
	   scheduler_source_channel1_5d <= scheduler_source_channel1_4d		;		
	   scheduler_source_channel2_1d <= scheduler_source_channel2     	;
	   scheduler_source_channel2_2d <= scheduler_source_channel2_1d  	;
	   scheduler_source_channel2_3d <= scheduler_source_channel2_2d  	;
	   scheduler_source_channel2_4d <= scheduler_source_channel2_3d  	;
	   scheduler_source_channel2_5d <= scheduler_source_channel2_4d  	;
	   duc_ddc_lpbk_en_1d           <= duc_ddc_lpbk;
	   duc_ddc_lpbk_en_2d           <= duc_ddc_lpbk_en_1d;
    end
 end


 assign duc_ddc_lpbk_en = duc_ddc_lpbk_en_2d; //To enable DFE Loopback
 
assign ul_prach_avst_sink_data 	= {scheduler_source_data2_5d,scheduler_source_data1_5d}	;
assign ul_prach_avst_sink_valid = {scheduler_source_valid2_5d,scheduler_source_valid1_5d}	;
assign ul_prach_avst_sink_channel = {scheduler_source_channel2_5d,scheduler_source_channel1_5d};


assign coupling_prach_timing_ref =   prach_timing_ref[31:0] ;
assign coupling_pusch_timing_ref =   pusch_timing_ref[31:0] ;


always @(posedge clk_eth_xran_dl)
	begin
		if(~rst_eth_n_dl_6d_dup2 & rst_eth_soft_n_dl_4d)begin
		  
		  dl_c_numPrb_1d					 <= 'd0 ;
		  dl_c_startPrb_1d                   <= 'd0 ;
		  dl_xran_demapper_cplane_valid_1d   <= 'd0 ;
		  
		  dl_c_slotID_2d					 <= 'd0 ;
		  dl_numSymbol_2d					 <= 'd0 ;
		  dl_c_symbolid_2d					 <= 'd0 ;
		  dl_c_numPrb_2d					 <= 'd0 ;
		  dl_sectionType_2d				     <= 'd0 ;
		  dl_c_startPrb_2d                   <= 'd0 ;
		  dl_c_datadirection_2d              <= 'd0 ;
		  dl_xran_demapper_cplane_valid_2d   <= 'd0 ;
		  
		  dl_c_slotID_3d					 <= 'd0 ;
		  dl_numSymbol_3d					 <= 'd0 ;
		  dl_c_symbolid_3d					 <= 'd0 ;
		  dl_c_numPrb_3d					 <= 'd0 ;
		  dl_sectionType_3d				     <= 'd0 ;
		  dl_c_startPrb_3d                   <= 'd0 ;
		  dl_c_datadirection_3d              <= 'd0 ;
		  dl_xran_demapper_cplane_valid_3d   <= 'd0 ;
		  	  
		end
		else begin
		  dl_c_numPrb_1d					 <=  oran_rx_cplane.rx_c_numPrb		;
		  dl_c_startPrb_1d                   <=  oran_rx_cplane.rx_c_startPrb   ;
		  dl_xran_demapper_cplane_valid_1d   <=  xran_demapper_cplane_valid ;								
		  
		  dl_c_slotID_2d					 <= dl_c_slotID_1d                    ;
		  dl_numSymbol_2d					 <= dl_numSymbol_1d					  ;
		  dl_c_symbolid_2d					 <= dl_c_symbolid_1d				  ;
		  dl_c_numPrb_2d					 <= dl_c_numPrb_1d					  ;
		  dl_sectionType_2d				     <= dl_sectionType_1d				  ;
		  dl_c_startPrb_2d                   <= dl_c_startPrb_1d                  ;
		  dl_c_datadirection_2d              <= dl_c_datadirection_1d             ;
		  dl_c_numsection_2d				 <=	dl_c_numsection_1d    			  ;
		  dl_xran_demapper_cplane_valid_2d   <= dl_xran_demapper_cplane_valid_1d  ;
		  
		  dl_c_slotID_3d					 <= dl_c_slotID_2d					  ;
		  dl_numSymbol_3d					 <= dl_numSymbol_2d					  ;
		  dl_c_symbolid_3d					 <= dl_c_symbolid_2d				  ;
		  dl_c_numPrb_3d					 <= dl_c_numPrb_2d					  ;
		  dl_sectionType_3d				     <= dl_sectionType_2d				  ;
		  dl_c_startPrb_3d                   <= dl_c_startPrb_2d                  ;
		  dl_c_datadirection_3d              <= dl_c_datadirection_2d             ;
		  dl_c_numsection_3d				 <=	dl_c_numsection_2d    			  ;
		  dl_xran_demapper_cplane_valid_3d   <= dl_xran_demapper_cplane_valid_2d  ;	  
		end
	end
	
	
	always @(posedge clk_eth_xran_dl)
	begin
		if(~rst_eth_n_dl_6d_dup2 & rst_eth_soft_n_dl_4d)begin
		  
		  dl_c_slotID_1d                     <= 'd0 ;					
		  dl_numSymbol_1d					 <= 'd0 ;
		  dl_c_symbolid_1d					 <= 'd0 ;
		  dl_sectionType_1d				     <= 'd0 ;
		  dl_c_datadirection_1d              <= 'd0 ;
		  dl_c_numsection_1d 				 <= 'd0	;  
		end
		else if (xran_demapper_cplane_valid & xran_demapper_cplane_startofpacket) begin 
		  dl_c_slotID_1d                     <=  oran_rx_cplane.rx_c_slotID     ;					
		  dl_numSymbol_1d					 <=  oran_rx_cplane.rx_numSymbol	;
		  dl_c_symbolid_1d					 <=  oran_rx_cplane.rx_c_symbolid	;
		  dl_sectionType_1d				     <=  oran_rx_cplane.rx_sectionType	;
		  dl_c_datadirection_1d              <=  oran_rx_cplane.rx_c_dataDirection;
		  dl_c_numsection_1d				 <=	 oran_rx_cplane.rx_c_numberOfsections   ;	  
		end
	end
	
	
always @(posedge clk_eth_xran_ul)
	begin
		if(~rst_eth_n_ul_6d_dup2 & rst_eth_soft_n_4d_dup3)//rst_eth_xran_n_dl_5d
		begin	
			xran_demapper_cplane_valid_1d 			<= 'd0;
			xran_demapper_cplane_endofpacket_1d 	<= 'd0;
			xran_demapper_cplane_startofpacket_1d 	<= 'd0;
			xran_demapper_cplane_valid_2d 			<= 'd0;
			xran_demapper_cplane_endofpacket_2d 	<= 'd0;
			xran_demapper_cplane_startofpacket_2d 	<= 'd0;
			xran_demapper_cplane_valid_3d 			<= 'd0;
			xran_demapper_cplane_endofpacket_3d 	<= 'd0;
			xran_demapper_cplane_startofpacket_3d 	<= 'd0;
			
		    c_datadirection_1d                      <= 'd0;
            c_datadirection_2d                      <= 'd0;
            c_datadirection_3d                      <= 'd0;
			
			rx_sectionType_1d	                    <= 'd0;
			rx_sectionType_2d	                    <= 'd0;
			rx_sectionType_3d	                    <= 'd0;
			
			rx_c_subframeId_1d                      <= 'd0;
			rx_c_subframeId_2d                      <= 'd0;
			rx_c_subframeId_3d                      <= 'd0;
			
			rx_c_symbolid_1d                        <= 'd0;
			rx_c_symbolid_2d                        <= 'd0;
			rx_c_symbolid_3d                        <= 'd0;
			
			rx_c_num_symbol_1d                      <= 'd0;
			rx_c_num_symbol_2d                      <= 'd0;
			rx_c_num_symbol_3d                      <= 'd0;
			rx_c_slotID_1d                        <= 'd0;
			rx_c_slotID_2d                        <= 'd0;
			rx_c_slotID_3d                        <= 'd0;
			rx_c_frameId_1d                        <= 'd0;
            rx_c_frameId_2d                        <= 'd0;
			rx_c_frameId_3d                        <= 'd0;	

					
		end
		else
		begin
			xran_demapper_cplane_valid_1d 			<= xran_demapper_cplane_valid 			;
			xran_demapper_cplane_endofpacket_1d 	<= xran_demapper_cplane_endofpacket 	;
			xran_demapper_cplane_startofpacket_1d 	<= xran_demapper_cplane_startofpacket 	;
			
			xran_demapper_cplane_valid_2d 			<= xran_demapper_cplane_valid_1d		;
			xran_demapper_cplane_endofpacket_2d 	<= xran_demapper_cplane_endofpacket_1d 	;
			xran_demapper_cplane_startofpacket_2d 	<= xran_demapper_cplane_startofpacket_1d;
			
			xran_demapper_cplane_valid_3d 			<= xran_demapper_cplane_valid_2d		;
			xran_demapper_cplane_endofpacket_3d 	<= xran_demapper_cplane_endofpacket_2d 	;
			xran_demapper_cplane_startofpacket_3d 	<= xran_demapper_cplane_startofpacket_2d;
            c_datadirection_1d                      <= oran_rx_cplane.rx_c_dataDirection    ;
            c_datadirection_2d                      <= c_datadirection_1d                   ;
            c_datadirection_3d                      <= c_datadirection_2d                   ;
			rx_sectionType_1d                       <= oran_rx_cplane.rx_sectionType        ;
			rx_sectionType_2d                       <= rx_sectionType_1d                    ;
			rx_sectionType_3d                       <= rx_sectionType_2d                    ;
			rx_c_subframeId_1d                      <= oran_rx_cplane.rx_c_subframeId       ;
			rx_c_subframeId_2d                      <= rx_c_subframeId_1d                   ;
			rx_c_subframeId_3d                      <= rx_c_subframeId_2d                   ;
			rx_c_symbolid_1d                        <= oran_rx_cplane.rx_c_symbolid			;
			rx_c_symbolid_2d                        <= rx_c_symbolid_1d						;
			rx_c_symbolid_3d                        <= rx_c_symbolid_2d						;
			rx_c_num_symbol_1d                      <= oran_rx_cplane.rx_numSymbol			;
			rx_c_num_symbol_2d                      <= rx_c_num_symbol_1d						;
			rx_c_num_symbol_3d                      <= rx_c_num_symbol_2d						;
			rx_c_slotID_1d                        <= oran_rx_cplane.rx_c_slotID			;
			rx_c_slotID_2d                        <= rx_c_slotID_1d						;
			rx_c_slotID_3d                        <= rx_c_slotID_2d						;	
			rx_c_frameId_1d                        <= oran_rx_cplane.rx_c_frameId			;
            rx_c_frameId_2d                        <= rx_c_frameId_1d						;
			rx_c_frameId_3d                        <= rx_c_frameId_2d						;	
		end
	end


	
// address decoding
 always @ (posedge clk_csr)
begin : PATTERN_BUFFER_SELECTION
    if (~rst_csr_n)
    begin
        pb_dl_scheduler_inj_sel            <=  1'b0  					       ;
		pb_fft_inj_sel                     <=  1'b0                            ;
    end
    else  
    begin
        case(pb_ddr_csr_address)
			4'd0: 
			begin
				  if(pb_ddr_csr_write)begin
                    pb_dl_scheduler_inj_sel  <= pb_ddr_csr_writedata[0]          ;				
					pb_fft_inj_sel           <= pb_ddr_csr_writedata[2]          ;
					end
				  pb_ddr_csr_readdata        <= {29'b0,pb_fft_inj_sel,1'b0,pb_dl_scheduler_inj_sel}  ;
			end
			
			default: begin
			        pb_dl_scheduler_inj_sel <= pb_dl_scheduler_inj_sel          	    ;
					pb_fft_inj_sel          <= pb_fft_inj_sel                           ;
					end			
        endcase
    end
end	
always @ (posedge clk_dsp)
begin 
    if (~rst_dsp_n)
    begin
        pb_dl_scheduler_inj_sel_1d            <=  1'b0  					;
		pb_dl_scheduler_inj_sel_2d            <=  1'b0  					;
		pb_fft_inj_sel_1d                     <=  1'b0                      ;
		pb_fft_inj_sel_2d                     <=  1'b0                      ;
    end
    else  
    begin
		pb_dl_scheduler_inj_sel_1d            <=  pb_dl_scheduler_inj_sel	 ;
		pb_dl_scheduler_inj_sel_2d            <=  pb_dl_scheduler_inj_sel_1d ;
		pb_fft_inj_sel_1d                     <=  pb_fft_inj_sel             ;
		pb_fft_inj_sel_2d                     <=  pb_fft_inj_sel_1d          ;
    end
end

assign pb_avst_sink_ready = (pb_dl_scheduler_inj_sel_2d) ? scheduler_pb_sink_ready : pb_fft_inj_sel_2d ? ul_input_hfn_pulse : 0 ;


assign coupling_pusch_avst_sink_valid_l1 	 = (dl_scheduler_lb_en) ? dl_scheduler_source_valid_1			 : fft_l1_source_valid 				;
assign coupling_pusch_avst_sink_data_l1 	 = (dl_scheduler_lb_en) ? dl_scheduler_source_data_1		     : fft_l1_source_data 				;
assign coupling_pusch_avst_sink_channel_l1   = (dl_scheduler_lb_en) ? {8'd0,dl_scheduler_source_channel_1}	 : {8'd0,fft_l1_source_channel } 	;
assign coupling_pusch_avst_sink_sop_l1 	     = (dl_scheduler_lb_en) ? dl_scheduler_source_startofpacket_1 	 : fft_l1_source_startofpacket 		;
assign coupling_pusch_avst_sink_eop_l1 	     = (dl_scheduler_lb_en) ? dl_scheduler_source_endofpacket_1      : fft_l1_source_endofpacket 		;
																										            
assign coupling_pusch_avst_sink_valid_l2 	 = (dl_scheduler_lb_en) ? dl_scheduler_source_valid_2		     : fft_l2_source_valid 				;
assign coupling_pusch_avst_sink_data_l2 	 = (dl_scheduler_lb_en) ? dl_scheduler_source_data_2		     : fft_l2_source_data 		    	;
assign coupling_pusch_avst_sink_channel_l2   = (dl_scheduler_lb_en) ? {8'd0,dl_scheduler_source_channel_2}	 : {8'd0, fft_l2_source_channel }   ;
assign coupling_pusch_avst_sink_sop_l2 	     = (dl_scheduler_lb_en) ? dl_scheduler_source_startofpacket_2    : fft_l2_source_startofpacket 		;
assign coupling_pusch_avst_sink_eop_l2 	     = (dl_scheduler_lb_en) ? dl_scheduler_source_endofpacket_2      : fft_l2_source_endofpacket 		;

assign coupling_prach_avst_sink_valid_l1 	 = cap_prach_out_l1_valid   	    ;
assign coupling_prach_avst_sink_data_l1 	 = cap_prach_out_l1_data    	    ;
assign coupling_prach_avst_sink_channel_l1   = {8'd0,cap_prach_out_l1_channel};
assign coupling_prach_avst_sink_sop_l1 	     =  1'b1	                        ;
assign coupling_prach_avst_sink_eop_l1 	     =  1'b0                          ;

assign coupling_prach_avst_sink_valid_l2 	 = cap_prach_out_l2_valid    		;
assign coupling_prach_avst_sink_data_l2 	 = cap_prach_out_l2_data      	;
assign coupling_prach_avst_sink_channel_l2   = {8'd0,cap_prach_out_l2_channel};
assign coupling_prach_avst_sink_sop_l2 	     =  1'b1 		                    ;
assign coupling_prach_avst_sink_eop_l2 	     =  1'b0    	                    ;

assign dl_scheduler_lb_en = 'd0;




dl_lphy_ss
#(
    .NUM_OF_ANT             (NUM_OF_ANT ),
    .NUM_OF_FFT             (NUM_OF_FFT )
)
u_dl_lphy_ss
(
    .clk_dsp                                (clk_dsp                            ),
    .rst_dsp_n                              (rst_dsp_n_4d_dup1  & rst_dsp_soft_n_4d_dup1  ), // Added Soft reset
    .clk_csr                                (clk_csr                            ),
    .rst_csr_n                              (rst_csr_n                          ),
    .clk_eth_xran                           (clk_eth_xran_dl                    ),
    .rst_eth_xran_n                         (rst_eth_n_dl_4d_dup1 & rst_eth_soft_n_dl_4d  ),
	.rst_soft_n                           	(rst_soft_n 					), //rst_oran_rx_n[0]
    
    // Input from ORAN User Plane Output
    .avst_sink_valid                        (xran_demapper_source_valid         ),
    .avst_sink_data                         (xran_demapper_source_data          ),
    .avst_sink_channel                      (rx_u_axc_id     				    ), // flow_id
    .avst_sink_ready                        (xran_demapper_source_ready         ),
    .avst_sink_endofpacket                  (xran_demapper_source_endofpacket   ),
    .avst_sink_startofpacket                (xran_demapper_source_startofpacket ),
	
    .xran_demapper_sts_prb_dout             (xran_demapper_sts_prb_dout         ),
    .xran_demapper_sts_prb_vout             (xran_demapper_sts_prb_vout         ),
    .xran_demapper_sts_frame_dout           (xran_demapper_sts_frame_dout       ),
    .xran_demapper_sts_frame_vout           (xran_demapper_sts_frame_vout       ),
	.xran_demapper_c_plane_metad            (xran_demapper_c_plane_metad        ),
    .xran_demapper_c_plane_metav            (xran_demapper_c_plane_metav        ),
	//C-Plane
	.xran_demapper_cplane_vout 				(	),
	.xran_demapper_cplane_dout				(	),
	.xran_demapper_cplane_dout_fo			(	),
	 
	.ifft_rc_enable_l1      				(ifft_l1_control_ifft_rc_enable_l1    ), 
	.ifft_rc_enable_l2      				(ifft_l2_control_ifft_rc_enable_l2    ),
	.ifft_rc_bw_sel_l1      				(ifft_l1_rc_bw_sel_ifft_rc_bw_sel_l1  ),
	.ifft_rc_bw_sel_l2      				(ifft_l2_rc_bw_sel_ifft_rc_bw_sel_l2  ),
	
    .input_hfn_pulse                        (dl_input_hfn_pulse                   ),
	
	.ifft_source_valid1  					(ifft_source_valid1 				),
	.ifft_source_data1   					(ifft_source_data1  				),
	.ifft_source_channel1					(ifft_source_channel1				),
	.ifft_source_valid2  					(ifft_source_valid2  				),
	.ifft_source_data2   					(ifft_source_data2   				),
	.ifft_source_channel2					(ifft_source_channel2				),
    
	.cap_ifft1_out_valid                     (cap_ifft1_out_valid                ),
    .cap_ifft1_out_data                      (cap_ifft1_out_data                 ),
    .cap_ifft1_out_channel                   (cap_ifft1_out_channel              ),
						
	.cap_ifft2_out_valid                     (cap_ifft2_out_valid                ),
    .cap_ifft2_out_data                      (cap_ifft2_out_data                 ),
    .cap_ifft2_out_channel                   (cap_ifft2_out_channel              ),

	
    .ifft_l1_busIn_writedata                  (ifft1_busIn_writedata              ),
    .ifft_l1_busIn_address                    (ifft1_busIn_address                ),
    .ifft_l1_busIn_write                      (ifft1_busIn_write                  ),
    .ifft_l1_busIn_read                       (ifft1_busIn_read                   ),
    .ifft_l1_busOut_readdatavalid             (ifft1_busOut_readdatavalid         ),
    .ifft_l1_busOut_readdata                  (ifft1_busOut_readdata              ),
    .ifft_l1_busOut_waitrequest               (ifft1_busOut_waitrequest           ),
	
	.ifft_l2_busIn_writedata                  (ifft2_busIn_writedata              ),
    .ifft_l2_busIn_address                    (ifft2_busIn_address                ),
    .ifft_l2_busIn_write                      (ifft2_busIn_write                  ),
    .ifft_l2_busIn_read                       (ifft2_busIn_read                   ),
    .ifft_l2_busOut_readdatavalid             (ifft2_busOut_readdatavalid         ),
    .ifft_l2_busOut_readdata                  (ifft2_busOut_readdata              ),
    .ifft_l2_busOut_waitrequest               (ifft2_busOut_waitrequest           ),
	
	// loop back scenario
	.scheduler_source_valid_1          	 	(dl_scheduler_source_valid_1		   ),
	.scheduler_source_data_1               	(dl_scheduler_source_data_1		       ),
	.scheduler_source_channel_1            	(dl_scheduler_source_channel_1		   ),
	.scheduler_source_endofpacket_1        	(dl_scheduler_source_endofpacket_1	   ),
	.scheduler_source_startofpacket_1      	(dl_scheduler_source_startofpacket_1   ),
	.dl_scheduler_source_ready_1            (1'b1		     				       ),
	
	.scheduler_source_valid_2          	 	(dl_scheduler_source_valid_2		   ),
	.scheduler_source_data_2               	(dl_scheduler_source_data_2		       ),
	.scheduler_source_channel_2            	(dl_scheduler_source_channel_2		   ),
	.scheduler_source_endofpacket_2        	(dl_scheduler_source_endofpacket_2	   ),
	.scheduler_source_startofpacket_2      	(dl_scheduler_source_startofpacket_2   ),
	.dl_scheduler_source_ready_2            (1'b1                   	           ),
	
	.blanking_source_valid_1                (blanking_source_valid_1        		),
	.blanking_source_data_1                 (blanking_source_data_1         		),
	.blanking_source_channel_1              (blanking_source_channel_1      		),
	.blanking_source_endofpacket_1          (blanking_source_endofpacket_1  		),
	.blanking_source_startofpacket_1        (blanking_source_startofpacket_1		),
	.blanking_source_valid_2                (blanking_source_valid_2        		),
	.blanking_source_data_2                 (blanking_source_data_2         		),
	.blanking_source_channel_2              (blanking_source_channel_2      		),
	.blanking_source_endofpacket_2          (blanking_source_endofpacket_2  		),
	.blanking_source_startofpacket_2		(blanking_source_startofpacket_2		),
	

	.blank_prb_flag							(						),
	.blank_prb_intr							(						),
	
	// ddr based pb output
   .pb_avst_sink_valid                      (pb_avst_sink_valid 			    ),
   .pb_avst_sink_data                       (pb_avst_sink_data  			    ),
   .scheduler_pb_sink_ready                 (scheduler_pb_sink_ready 			),
   .pb_dl_scheduler_inj_sel                 (pb_dl_scheduler_inj_sel_2d			),
   
   .bw_config_cc1                           (bw_config_cc1						),
   .bw_config_cc2                           (bw_config_cc2						),
   .ifft_fft_lpbk_en					  	(ifft_fft_lpbk			 			),
  
  
  .cp_len 									(cp_len 							),
  .fft_size									(fft_size							),
  .ifft_gain_l1 							(ifft_gain_l1						),
  .ifft_shift_l1 							(ifft_shift_l1 						),
  .ifft_mux_const_l1						(ifft_mux_const_l1_reg				),
  .ifft_mux_const_l2						(ifft_mux_const_l2_reg				),
  .ifft_muxsel_l1							(ifft_l1_control_reg[0]				),
  .ifft_muxsel_l2							(ifft_l2_control_reg[0]				),
  .ifft_dc_sc_en_l1 						(ifft_l1_control_reg[1]				),
  .ifft_dc_sc_en_l2 						(ifft_l2_control_reg[1] 			),
  .ifft_gain_l2 							(ifft_gain_l2						),
  .ifft_shift_l2 							(ifft_shift_l2 				   	    ),
  .blanking_dis                             (blanking_dis						),
  
  	.pwr_mtr_ifft_hist_done_intr_l1					(pwr_mtr_ifft_hist_done_intr_l1),
	.pwr_mtr_ifft_hist_done_intr_l2					(pwr_mtr_ifft_hist_done_intr_l2),	
   
   .pm_ifft_threash_mm_bridge_address_l1		(pm_ifft_threash_mm_bridge_address_l1		),
   .pm_ifft_threash_mm_bridge_chipselect_l1		(pm_ifft_threash_mm_bridge_chipselect_l1	),
   .pm_ifft_threash_mm_bridge_read_l1			(pm_ifft_threash_mm_bridge_read_l1			),
   .pm_ifft_threash_mm_bridge_write_l1			(pm_ifft_threash_mm_bridge_write_l1			),
   .pm_ifft_threash_mm_bridge_writedata_l1		(pm_ifft_threash_mm_bridge_writedata_l1		),
   .pm_ifft_threash_mm_bridge_byteenable_l1		(pm_ifft_threash_mm_bridge_byteenable_l1	),
   .pm_ifft_threash_mm_bridge_readdata_l1		(pm_ifft_threash_mm_bridge_readdata_l1		),
   .pm_ifft_threash_mm_bridge_waitrequest_l1	(pm_ifft_threash_mm_bridge_waitrequest_l1	),
   
   .pm_ifft_hist_mm_bridge_address_l1			(pm_ifft_hist_mm_bridge_address_l1		),
   .pm_ifft_hist_mm_bridge_chipselect_l1		(pm_ifft_hist_mm_bridge_chipselect_l1	),
   .pm_ifft_hist_mm_bridge_read_l1				(pm_ifft_hist_mm_bridge_read_l1			),
   .pm_ifft_hist_mm_bridge_write_l1				(pm_ifft_hist_mm_bridge_write_l1		),
   .pm_ifft_hist_mm_bridge_writedata_l1			(pm_ifft_hist_mm_bridge_writedata_l1	),
   .pm_ifft_hist_mm_bridge_byteenable_l1		(pm_ifft_hist_mm_bridge_byteenable_l1	),
   .pm_ifft_hist_mm_bridge_readdata_l1			(pm_ifft_hist_mm_bridge_readdata_l1		),
   .pm_ifft_hist_mm_bridge_readdatavalid_l1			(pm_ifft_hist_mm_bridge_readdatavalid_l1	),
   .pm_ifft_hist_mm_bridge_waitrequest_l1		(pm_ifft_hist_mm_bridge_waitrequest_l1	),
   
   .pwr_mtr_config_csr_writedata_l1				(pwr_mtr_ifft_config_csr_writedata_l1			),
   .pwr_mtr_config_csr_read_l1				    (pwr_mtr_ifft_config_csr_read_l1				),
   .pwr_mtr_config_csr_write_l1					(pwr_mtr_ifft_config_csr_write_l1				),
   .pwr_mtr_config_csr_readdata_l1				(pwr_mtr_ifft_config_csr_readdata_l1			),
   .pwr_mtr_config_csr_readdatavalid_l1			(pwr_mtr_ifft_config_csr_readdatavalid_l1		),
   .pwr_mtr_config_csr_address_l1			    (pwr_mtr_ifft_config_csr_address_l1				),
   
   .pm_ifft_threash_mm_bridge_address_l2		(pm_ifft_threash_mm_bridge_address_l2	),
   .pm_ifft_threash_mm_bridge_chipselect_l2		(pm_ifft_threash_mm_bridge_chipselect_l2),
   .pm_ifft_threash_mm_bridge_read_l2			(pm_ifft_threash_mm_bridge_read_l2		),
   .pm_ifft_threash_mm_bridge_write_l2			(pm_ifft_threash_mm_bridge_write_l2		),
   .pm_ifft_threash_mm_bridge_writedata_l2		(pm_ifft_threash_mm_bridge_writedata_l2	),
   .pm_ifft_threash_mm_bridge_byteenable_l2		(pm_ifft_threash_mm_bridge_byteenable_l2),
   .pm_ifft_threash_mm_bridge_readdata_l2		(pm_ifft_threash_mm_bridge_readdata_l2	),
   .pm_ifft_threash_mm_bridge_waitrequest_l2    (pm_ifft_threash_mm_bridge_waitrequest_l2),
   
   .pm_ifft_hist_mm_bridge_address_l2			(pm_ifft_hist_mm_bridge_address_l2	),
   .pm_ifft_hist_mm_bridge_chipselect_l2		(pm_ifft_hist_mm_bridge_chipselect_l2),
   .pm_ifft_hist_mm_bridge_read_l2				(pm_ifft_hist_mm_bridge_read_l2	),
   .pm_ifft_hist_mm_bridge_write_l2				(pm_ifft_hist_mm_bridge_write_l2),
   .pm_ifft_hist_mm_bridge_writedata_l2			(pm_ifft_hist_mm_bridge_writedata_l2),
   .pm_ifft_hist_mm_bridge_byteenable_l2		(pm_ifft_hist_mm_bridge_byteenable_l2),
   .pm_ifft_hist_mm_bridge_readdata_l2			(pm_ifft_hist_mm_bridge_readdata_l2	),
   .pm_ifft_hist_mm_bridge_readdatavalid_l2			(pm_ifft_hist_mm_bridge_readdatavalid_l2	),
   .pm_ifft_hist_mm_bridge_waitrequest_l2		(pm_ifft_hist_mm_bridge_waitrequest_l2),
   
   .pwr_mtr_config_csr_writedata_l2				(pwr_mtr_ifft_config_csr_writedata_l2),
   .pwr_mtr_config_csr_read_l2				    (pwr_mtr_ifft_config_csr_read_l2	),
   .pwr_mtr_config_csr_write_l2					(pwr_mtr_ifft_config_csr_write_l2),
   .pwr_mtr_config_csr_readdata_l2				(pwr_mtr_ifft_config_csr_readdata_l2),
   .pwr_mtr_config_csr_readdatavalid_l2			(pwr_mtr_ifft_config_csr_readdatavalid_l2),
   .pwr_mtr_config_csr_address_l2               (pwr_mtr_ifft_config_csr_address_l2),
   
   .pm_stat_ifft_mm_bridge_address_l1            (pm_stat_ifft_mm_bridge_address_l1     ),		
   .pm_stat_ifft_mm_bridge_chipselect_l1	     (pm_stat_ifft_mm_bridge_chipselect_l1  ),
   .pm_stat_ifft_mm_bridge_read_l1			     (pm_stat_ifft_mm_bridge_read_l1		),
   .pm_stat_ifft_mm_bridge_write_l1			     (pm_stat_ifft_mm_bridge_write_l1		),
   .pm_stat_ifft_mm_bridge_writedata_l1		     (pm_stat_ifft_mm_bridge_writedata_l1	),
   .pm_stat_ifft_mm_bridge_byteenable_l1	     (pm_stat_ifft_mm_bridge_byteenable_l1  ),
   .pm_stat_ifft_mm_bridge_readdata_l1		     (pm_stat_ifft_mm_bridge_readdata_l1	),
   .pm_stat_ifft_mm_bridge_readdatavalid_l1		     (pm_stat_ifft_mm_bridge_readdatavalid_l1	),
   .pm_stat_ifft_mm_bridge_waitrequest_l1        (pm_stat_ifft_mm_bridge_waitrequest_l1 ),
   
   .pm_stat_ifft_mm_bridge_address_l2	         (pm_stat_ifft_mm_bridge_address_l2	    ),	
   .pm_stat_ifft_mm_bridge_chipselect_l2	     (pm_stat_ifft_mm_bridge_chipselect_l2  ),
   .pm_stat_ifft_mm_bridge_read_l2			     (pm_stat_ifft_mm_bridge_read_l2		),
   .pm_stat_ifft_mm_bridge_write_l2			     (pm_stat_ifft_mm_bridge_write_l2		),
   .pm_stat_ifft_mm_bridge_writedata_l2		     (pm_stat_ifft_mm_bridge_writedata_l2	),
   .pm_stat_ifft_mm_bridge_byteenable_l2	     (pm_stat_ifft_mm_bridge_byteenable_l2  ),
   .pm_stat_ifft_mm_bridge_readdata_l2		     (pm_stat_ifft_mm_bridge_readdata_l2	),
   .pm_stat_ifft_mm_bridge_readdatavalid_l2		     (pm_stat_ifft_mm_bridge_readdatavalid_l2	),
   .pm_stat_ifft_mm_bridge_waitrequest_l2	     (pm_stat_ifft_mm_bridge_waitrequest_l2 )

);

  ul_lphy_ss
#(
    .NUM_OF_ANT             			  (NUM_OF_ANT ),
    .NUM_OF_FFT             			  (NUM_OF_FFT )
)
u_ul_lphy_ss
(
    .clk_dsp                        	   (clk_dsp                            ),
    .rst_dsp_n                      	   (rst_dsp_n_4d_dup2  & rst_dsp_soft_n_4d_dup2                ),//rst_dsp_n_3d
    .clk_csr                        	   (clk_csr                            ),
    .rst_csr_n                      	   (rst_csr_n                          ),
	.rst_soft_n                            (rst_soft_n					  	   ), //rst_oran_rx_n[1]  
	.clk_eth_xran_ul					   (clk_eth_xran_ul                    ),
	.clk_eth_xran_dl					   (clk_eth_xran_dl					   ),                  
    .rst_eth_xran_n_ul                 	   (rst_eth_n_ul_4d_dup1               ),
	.rst_eth_xran_n_dl                 	   (rst_eth_n_dl_4d_dup2               ),
	
 
	.frag_disable                         	(           						),

	.input_hfn_pulse                      	(ul_input_hfn_pulse                 ),
    .output_hfn_pulse                     	(                                   ),
    .lte_sfn_sf                           	(                                   ),
    
	.bw_config_cc1                        	(bw_config_cc1						),
	.bw_config_cc2 						  	(bw_config_cc2						),
	
	.frame_status                         	(radio_config_status                ),
	
	.ul_frame_status                       	(ul_frame_status					),

	. lphy_ss_ul_sink_data1	                (lphy_ss_ul_sink_data1				),
	. lphy_ss_ul_sink_valid1	            (lphy_ss_ul_sink_valid1				),
	. lphy_ss_ul_sink_channel1              (lphy_ss_ul_sink_channel1			),
																				 
	. lphy_ss_ul_sink_data2	                (lphy_ss_ul_sink_data2				),
	. lphy_ss_ul_sink_valid2	            (lphy_ss_ul_sink_valid2				),
	. lphy_ss_ul_sink_channel2              (lphy_ss_ul_sink_channel2			),
	
	
	.scheduler_source_valid1				(scheduler_source_valid1			),
	.scheduler_source_data1					(scheduler_source_data1				),
	.scheduler_source_channel1				(scheduler_source_channel1			),
	
	.scheduler_source_valid2				(scheduler_source_valid2			),
	.scheduler_source_data2					(scheduler_source_data2				),
	.scheduler_source_channel2				(scheduler_source_channel2			),
	

	.fft_sink_valid_l1  				  	(ifft_source_valid1  				),
	.fft_sink_data_l1   				  	(ifft_source_data1				  	),
	.fft_sink_channel_l1				  	(ifft_source_channel1				),
	
	.fft_sink_valid_l2  				   	(ifft_source_valid2  				),
	.fft_sink_data_l2   				   	(ifft_source_data2   				),
	.fft_sink_channel_l2				   	(ifft_source_channel2				), 

	.fft_l1_source_valid             	   	(fft_l1_source_valid        		),
	.fft_l1_source_data              	   	(fft_l1_source_data         		),
	.fft_l1_source_channel           	   	(fft_l1_source_channel      		),
	.fft_l1_source_ready             	   	(fft_l1_source_ready        		),
	.fft_l1_source_endofpacket       	   	(fft_l1_source_endofpacket  		),
	.fft_l1_source_startofpacket     	   	(fft_l1_source_startofpacket		),

	.fft_l2_source_valid             	   	(fft_l2_source_valid        		),
	.fft_l2_source_data              	   	(fft_l2_source_data         		),
	.fft_l2_source_channel           	   	(fft_l2_source_channel      		),
	.fft_l2_source_ready             	   	(fft_l2_source_ready        		),
	.fft_l2_source_endofpacket       	   	(fft_l2_source_endofpacket  		),
	.fft_l2_source_startofpacket     	   	(fft_l2_source_startofpacket		),

    .cap_fft_l1_in_valid                   	(                ),
    .cap_fft_l1_in_data                    	(                ),
    .cap_fft_l1_in_channel                 	(                ),

    .cap_fft_l2_in_valid                   	(                ),
    .cap_fft_l2_in_data                    	(                ),
    .cap_fft_l2_in_channel                  (                ),

    .cap_fft_l1_out_valid             		(),
	.cap_fft_l1_out_data              		(),
	.cap_fft_l1_out_channel           		(),
	.cap_fft_l1_out_startofpacket     		(),
	.cap_fft_l1_out_endofpacket       		(),
	
	.cap_fft_l2_out_valid             		(),
	.cap_fft_l2_out_data              		(),
	.cap_fft_l2_out_channel           		(),
	.cap_fft_l2_out_startofpacket     		(),
	.cap_fft_l2_out_endofpacket       		(),

    .fft_l1_busIn_writedata                 (fft1_busIn_writedata               ),
    .fft_l1_busIn_address                   (fft1_busIn_address                 ),
    .fft_l1_busIn_write                     (fft1_busIn_write                   ),
    .fft_l1_busIn_read                      (fft1_busIn_read                    ),
    .fft_l1_busOut_readdatavalid            (fft1_busOut_readdatavalid          ),
    .fft_l1_busOut_readdata                 (fft1_busOut_readdata               ),
    .fft_l1_busOut_waitrequest              (fft1_busOut_waitrequest            ),
	
	.fft_l2_busIn_writedata                 (fft2_busIn_writedata               ),
    .fft_l2_busIn_address                   (fft2_busIn_address                 ),
    .fft_l2_busIn_write                     (fft2_busIn_write                   ),
    .fft_l2_busIn_read                      (fft2_busIn_read                    ),
    .fft_l2_busOut_readdatavalid            (fft2_busOut_readdatavalid          ),
    .fft_l2_busOut_readdata                 (fft2_busOut_readdata               ),
    .fft_l2_busOut_waitrequest              (fft2_busOut_waitrequest            ),
	
	.ifft_fft_lpbk_en					  	(ifft_fft_lpbk				 	),

  
	// ddr based pb output
	.pb_avst_sink_valid                		(pb_avst_sink_valid 			 	),
	.pb_avst_sink_data                 		(pb_avst_sink_data  			 	),
	.pb_fft_inj_sel                         (pb_fft_inj_sel_2d					),
 
    .fft_rc_enable_l1      				    (fft_l1_control_fft_rc_enable_l1  ),           
	.fft_rc_enable_l2      				    (fft_l2_control_fft_rc_enable_l2  ),           
	.fft_rc_bw_sel_l1      				    (fft_l1_rc_bw_sel_fft_rc_bw_sel_l1),         
	.fft_rc_bw_sel_l2      				    (fft_l2_rc_bw_sel_fft_rc_bw_sel_l2),         
                                                            
                                                            
	.cp_len 							  	(cp_len 			),
	.fft_size							  	(fft_size			),
	.fft_dc_sc_en_l1 					    (fft_l1_control_reg[0]),
	.fft_dc_sc_en_l2 					    (fft_l2_control_reg[0]),
	.hcs_bypass_l1							(fft_l1_control_reg[0]),
	.hcs_bypass_l2							(fft_l2_control_reg[0]),
	.fft_gain_l1 						  	(fft_gain_l1 		),
	.fft_shift_l1 						  	(fft_shift_l1		),
	
	.fft_gain_l2 						  	(fft_gain_l2 		),
	.fft_shift_l2 						  	(fft_shift_l2		),
	.time_ref_out 							(pusch_timing_ref					),
	.ul_start_pulse_latch                   (ul_start_pulse_latch_int				),
	
	.pwr_mtr_fft_hist_done_intr_l1					(pwr_mtr_fft_hist_done_intr_l1),
	.pwr_mtr_fft_hist_done_intr_l2					(pwr_mtr_fft_hist_done_intr_l2),	
	
   .pm_fft_threash_mm_bridge_address_l1			(pm_fft_threash_mm_bridge_address_l1		),
   .pm_fft_threash_mm_bridge_chipselect_l1		(pm_fft_threash_mm_bridge_chipselect_l1		),
   .pm_fft_threash_mm_bridge_read_l1			(pm_fft_threash_mm_bridge_read_l1			),
   .pm_fft_threash_mm_bridge_write_l1			(pm_fft_threash_mm_bridge_write_l1			),
   .pm_fft_threash_mm_bridge_writedata_l1		(pm_fft_threash_mm_bridge_writedata_l1		),
   .pm_fft_threash_mm_bridge_byteenable_l1		(pm_fft_threash_mm_bridge_byteenable_l1		),
   .pm_fft_threash_mm_bridge_readdata_l1		(pm_fft_threash_mm_bridge_readdata_l1		),
   .pm_fft_threash_mm_bridge_waitrequest_l1		(pm_fft_threash_mm_bridge_waitrequest_l1	),
   
   .pm_fft_hist_mm_bridge_address_l1			(pm_fft_hist_mm_bridge_address_l1		),
   .pm_fft_hist_mm_bridge_chipselect_l1			(pm_fft_hist_mm_bridge_chipselect_l1	),
   .pm_fft_hist_mm_bridge_read_l1				(pm_fft_hist_mm_bridge_read_l1			),
   .pm_fft_hist_mm_bridge_write_l1				(pm_fft_hist_mm_bridge_write_l1			),
   .pm_fft_hist_mm_bridge_writedata_l1			(pm_fft_hist_mm_bridge_writedata_l1		),
   .pm_fft_hist_mm_bridge_byteenable_l1			(pm_fft_hist_mm_bridge_byteenable_l1	),
   .pm_fft_hist_mm_bridge_readdata_l1			(pm_fft_hist_mm_bridge_readdata_l1		),
   .pm_fft_hist_mm_bridge_readdatavalid_l1			(pm_fft_hist_mm_bridge_readdatavalid_l1		),
   .pm_fft_hist_mm_bridge_waitrequest_l1		(pm_fft_hist_mm_bridge_waitrequest_l1	),
   
   .pwr_mtr_config_csr_writedata_l1				(pwr_mtr_fft_config_csr_writedata_l1		),
   .pwr_mtr_config_csr_read_l1				    (pwr_mtr_fft_config_csr_read_l1				),
   .pwr_mtr_config_csr_write_l1					(pwr_mtr_fft_config_csr_write_l1			),
   .pwr_mtr_config_csr_readdata_l1				(pwr_mtr_fft_config_csr_readdata_l1			),
   .pwr_mtr_config_csr_readdatavalid_l1			(pwr_mtr_fft_config_csr_readdatavalid_l1	),
   .pwr_mtr_config_csr_address_l1			    (pwr_mtr_fft_config_csr_address_l1			),
   
   .pm_fft_threash_mm_bridge_address_l2			(pm_fft_threash_mm_bridge_address_l2	),
   .pm_fft_threash_mm_bridge_chipselect_l2		(pm_fft_threash_mm_bridge_chipselect_l2),
   .pm_fft_threash_mm_bridge_read_l2			(pm_fft_threash_mm_bridge_read_l2		),
   .pm_fft_threash_mm_bridge_write_l2			(pm_fft_threash_mm_bridge_write_l2		),
   .pm_fft_threash_mm_bridge_writedata_l2		(pm_fft_threash_mm_bridge_writedata_l2	),
   .pm_fft_threash_mm_bridge_byteenable_l2		(pm_fft_threash_mm_bridge_byteenable_l2),
   .pm_fft_threash_mm_bridge_readdata_l2		(pm_fft_threash_mm_bridge_readdata_l2	),
   .pm_fft_threash_mm_bridge_waitrequest_l2    	(pm_fft_threash_mm_bridge_waitrequest_l2),
   
   .pm_fft_hist_mm_bridge_address_l2			(pm_fft_hist_mm_bridge_address_l2	),
   .pm_fft_hist_mm_bridge_chipselect_l2			(pm_fft_hist_mm_bridge_chipselect_l2),
   .pm_fft_hist_mm_bridge_read_l2				(pm_fft_hist_mm_bridge_read_l2	),
   .pm_fft_hist_mm_bridge_write_l2				(pm_fft_hist_mm_bridge_write_l2),
   .pm_fft_hist_mm_bridge_writedata_l2			(pm_fft_hist_mm_bridge_writedata_l2),
   .pm_fft_hist_mm_bridge_byteenable_l2			(pm_fft_hist_mm_bridge_byteenable_l2),
   .pm_fft_hist_mm_bridge_readdata_l2			(pm_fft_hist_mm_bridge_readdata_l2	),
   .pm_fft_hist_mm_bridge_readdatavalid_l2			(pm_fft_hist_mm_bridge_readdatavalid_l2		),
   .pm_fft_hist_mm_bridge_waitrequest_l2		(pm_fft_hist_mm_bridge_waitrequest_l2),
   
   .pwr_mtr_config_csr_writedata_l2				(pwr_mtr_fft_config_csr_writedata_l2),
   .pwr_mtr_config_csr_read_l2				    (pwr_mtr_fft_config_csr_read_l2	),
   .pwr_mtr_config_csr_write_l2					(pwr_mtr_fft_config_csr_write_l2),
   .pwr_mtr_config_csr_readdata_l2				(pwr_mtr_fft_config_csr_readdata_l2),
   .pwr_mtr_config_csr_readdatavalid_l2			(pwr_mtr_fft_config_csr_readdatavalid_l2),
   .pwr_mtr_config_csr_address_l2               (pwr_mtr_fft_config_csr_address_l2),
   
   .pm_stat_fft_mm_bridge_address_l1            (pm_stat_fft_mm_bridge_address_l1      ),		
   .pm_stat_fft_mm_bridge_chipselect_l1	     	(pm_stat_fft_mm_bridge_chipselect_l1   ),
   .pm_stat_fft_mm_bridge_read_l1			    (pm_stat_fft_mm_bridge_read_l1		   ),
   .pm_stat_fft_mm_bridge_write_l1			    (pm_stat_fft_mm_bridge_write_l1		   ),
   .pm_stat_fft_mm_bridge_writedata_l1		    (pm_stat_fft_mm_bridge_writedata_l1	   ),
   .pm_stat_fft_mm_bridge_byteenable_l1	     	(pm_stat_fft_mm_bridge_byteenable_l1   ),
   .pm_stat_fft_mm_bridge_readdata_l1		    (pm_stat_fft_mm_bridge_readdata_l1	   ),
   .pm_stat_fft_mm_bridge_readdatavalid_l1		    (pm_stat_fft_mm_bridge_readdatavalid_l1	   ),
   .pm_stat_fft_mm_bridge_waitrequest_l1        (pm_stat_fft_mm_bridge_waitrequest_l1  ),
   
   .pm_stat_fft_mm_bridge_address_l2	         (pm_stat_fft_mm_bridge_address_l2	    ),	
   .pm_stat_fft_mm_bridge_chipselect_l2	     	 (pm_stat_fft_mm_bridge_chipselect_l2   ),
   .pm_stat_fft_mm_bridge_read_l2			     (pm_stat_fft_mm_bridge_read_l2			),
   .pm_stat_fft_mm_bridge_write_l2			     (pm_stat_fft_mm_bridge_write_l2		),
   .pm_stat_fft_mm_bridge_writedata_l2		     (pm_stat_fft_mm_bridge_writedata_l2	),
   .pm_stat_fft_mm_bridge_byteenable_l2	     	 (pm_stat_fft_mm_bridge_byteenable_l2   ),
   .pm_stat_fft_mm_bridge_readdata_l2		     (pm_stat_fft_mm_bridge_readdata_l2		),
   .pm_stat_fft_mm_bridge_readdatavalid_l2		    (pm_stat_fft_mm_bridge_readdatavalid_l	   ),
   .pm_stat_fft_mm_bridge_waitrequest_l2	     (pm_stat_fft_mm_bridge_waitrequest_l2  )
   
   
   
   
);


prach_top
#(

    .NUM_OF_ANT             				(NUM_OF_ANT 						),
    .NUM_OF_FFT             				(NUM_OF_PRACH					 	)
)

u_prach_top(
    .clk_eth_xran                       	(clk_eth_xran_ul					),
    .rst_eth_xran_n                     	(rst_eth_n_ul_4d_dup2				),	//rst_eth_xran_n_ul_4d
	
	.clk_dsp                       			(clk_dsp							),				//clk_prach
    .rst_dsp_n                     			(rst_dsp_n_2d_dup1 & rst_dsp_soft_n_2d), //(rst_dsp_n_2d_dup1				),	//rst_prach_n

    .clk_csr                       			(clk_csr							),
    .rst_csr_n                     			(rst_csr_n							),

    // Stream Input               			
    .avst_sink_valid               			(ul_prach_avst_sink_valid			),
    .avst_sink_data                			(ul_prach_avst_sink_data			),
    .avst_sink_channel             			(ul_prach_avst_sink_channel		    ),	
    				  	  

    //PRACH OUTPUT CAPTURE             
	.cap_prach_out_l1_valid                 (cap_prach_out_l1_valid				),
    .cap_prach_out_l1_data                  (cap_prach_out_l1_data				),
    .cap_prach_out_l1_channel               (cap_prach_out_l1_channel			),

	.cap_prach_out_l2_valid                 (cap_prach_out_l2_valid				),
    .cap_prach_out_l2_data                  (cap_prach_out_l2_data				),
    .cap_prach_out_l2_channel               (cap_prach_out_l2_channel			),
	
	.sync_in								(sync_in							),

	.pb_mm_bridge_address                	(pb_mm_bridge_address     			),
	.pb_mm_bridge_chipselect             	(pb_mm_bridge_chipselect  			),
	.pb_mm_bridge_read                   	(pb_mm_bridge_read        			),
	.pb_mm_bridge_readdata               	(pb_mm_bridge_readdata    			),
	.pb_mm_bridge_write                  	(pb_mm_bridge_write       			),
	.pb_mm_bridge_writedata              	(pb_mm_bridge_writedata   			),
	.pb_mm_bridge_byteenable             	(pb_mm_bridge_byteenable  			),
	.pb_mm_bridge_waitrequest            	(pb_mm_bridge_waitrequest 			),

	
	/* .c_freqoff_ul							(xran_demapper_cplane_dout_fo_ul	),
	.fft_size_ul							(xran_demapper_cplane_dout_ul[7:4]	), */
	.short_prach_m_freqoff_ul				(hps_freqoffset	                    ),
	.short_prach_m_fft_size_ul				(hps_framestructure[7:4]			),
	.valid_in								(xran_demapper_cplane_ext_valid		),
	
	
    .cPlane_coupling_en_s 					(c_hps),
	
	.short_prach_lw_bridge_readdata_l1  			(short_prach1_busOut_readdata				),
	.short_prach_lw_bridge_writedata_l1 			(short_prach1_busIn_writedata				),
	.short_prach_lw_bridge_address_l1   			(short_prach1_busIn_address					),
	.short_prach_lw_bridge_write_l1     			(short_prach1_busIn_write					),
	.short_prach_lw_bridge_readdatavalid_l1			(short_prach1_busOut_readdatavalid			),
	.short_prach_lw_bridge_waitrequest_l1			(short_prach1_busOut_waitrequest			),
    .short_prach_lw_bridge_read_l1                  (short_prach1_busIn_read					),
	.short_prach_lw_bridge_readdata_l2  			(short_prach2_busOut_readdata 				),
	.short_prach_lw_bridge_writedata_l2 			(short_prach2_busIn_writedata				),
	.short_prach_lw_bridge_address_l2   			(short_prach2_busIn_address  				),
	.short_prach_lw_bridge_write_l2     			(short_prach2_busIn_write    				),
	.short_prach_lw_bridge_readdatavalid_l2		    (short_prach2_busOut_readdatavalid			),
	.short_prach_lw_bridge_waitrequest_l2			(short_prach2_busOut_waitrequest			),
	.short_prach_lw_bridge_read_l2                  (short_prach2_busIn_read					),
	
	.long_prach_lw_bridge_address_l1        (long_prach_lw_bridge_address_l1  		),		
	.long_prach_lw_bridge_write_l1    		(long_prach_lw_bridge_write_l1    		),
	.long_prach_lw_bridge_readdata_l1 		(long_prach_lw_bridge_readdata_l1 		),
	.long_prach_lw_bridge_writedata_l1		(long_prach_lw_bridge_writedata_l1		),
	.long_prach_lw_bridge_waitrequest_l1	(long_prach_lw_bridge_waitrequest_l1	),
	.long_prach_lw_bridge_readdatavalid_l1  (long_prach_lw_bridge_readdatavalid_l1),
	.long_prach_lw_bridge_read_l1  			(long_prach_lw_bridge_read_l1),
											 
	.long_prach_lw_bridge_address_l2  		(long_prach_lw_bridge_address_l2  		),
	.long_prach_lw_bridge_write_l2    		(long_prach_lw_bridge_write_l2    		),
	.long_prach_lw_bridge_readdata_l2 		(long_prach_lw_bridge_readdata_l2 		),
	.long_prach_lw_bridge_writedata_l2		(long_prach_lw_bridge_writedata_l2		),
	.long_prach_lw_bridge_waitrequest_l2	(long_prach_lw_bridge_waitrequest_l2	),
	.long_prach_lw_bridge_readdatavalid_l2  (long_prach_lw_bridge_readdatavalid_l2  ),
	.long_prach_lw_bridge_read_l2  			(long_prach_lw_bridge_read_l2  			),
	
	.short_long_prach_select                (short_long_prach_select				),
	.ul_frame_status                    	(ul_frame_status[12:0]					),

	
	.timing_reference						(prach_timing_ref						),
		
	.avst_sink_c_valid                      (xran_demapper_cplane_valid_3d         	),       
	.avst_sink_c_endofpacket                (xran_demapper_cplane_startofpacket_3d 	),
	.avst_sink_c_startofpacket              (xran_demapper_cplane_endofpacket_3d   	),
	
	.rx_c_rtc_id                            (rx_rtc_id								),      
	.rx_c_dataDirection                     (c_datadirection_3d						),
	.rx_sectionType                         (rx_sectionType_3d						),
	.rx_timeOffset                          (rx_timeOffset_3d						),
	.rx_cpLength                            (c_cplength_3d	                        ),
	.rx_frequencyOffset                     (c_freqoffset_3d						),
	.rx_frameStructure                      (c_framestructure_3d                    ),
	.c_m_plane_sel                          (c_hps		   						    ),
	.rx_c_subframeId                        (rx_c_subframeId_3d 					),
	.filt_flush_en                          (filt_flush_en   						),
	.rx_c_symbolid						    (rx_c_symbolid_3d    					),
	.rx_c_num_symbol						(rx_c_num_symbol_3d						),
	.rx_c_slotid							(rx_c_slotID_3d							),
	.rx_c_frameid							(rx_c_frameId_3d						),
	.long_prach_version_l1_reg				(long_prach_version_reg					),
	.long_prach_version_l2_reg				(										),
	.Pb_enable								(Pb_enable								),
	.Pb_select								(Pb_select								),
	.short_prach_time_offset				(short_prach_time_offset				),
	.short_prach_time_offset_bias			(short_prach_time_offset_bias			),
	.short_prach_startsym_bias				(short_prach_startsym_bias				)
	
); 

// for dsp capture

 assign lphy_avst_source_dsp_capture_valid =  { cap_prach_out_l2_valid, cap_prach_out_l1_valid	,
										 fft_l2_source_valid		, fft_l1_source_valid		, 
										 cap_ifft2_out_valid		, cap_ifft1_out_valid		, 
										 blanking_source_valid_2	, blanking_source_valid_1 	};

 assign lphy_avst_source_dsp_capture_data =   { cap_prach_out_l2_data	, cap_prach_out_l1_data ,
										 fft_l2_source_data			, fft_l1_source_data	, 
										 cap_ifft2_out_data         , cap_ifft1_out_data    , 
										 blanking_source_data_2		, blanking_source_data_1 } ; // scheduler_source_data  ;
 
 assign lphy_avst_source_dsp_capture_chan =   { cap_prach_out_l2_channel	[2:0], cap_prach_out_l1_channel		[2:0],
										 fft_l2_source_channel			[2:0], fft_l1_source_channel		[2:0], 
										 cap_ifft2_out_channel			[2:0], cap_ifft1_out_channel		[2:0], 
										 blanking_source_channel_2 	[2:0], blanking_source_channel_1	[2:0] } ; // {($clog2(NUM_OF_ANT)*DSP_CAPTURE_INSTANCES){1'b0}};                


//Interface selection 
   always @ (posedge clk_dsp) begin
      if (~rst_dsp_n) begin
         avst_selctd_intf_shift_valid <= {LPHY_DSP_CAPTURE_INST{1'b0}};
         avst_selctd_intf_shift_data  <= {LPHY_DSP_CAPTURE_INST*IQ_DATAWIDTH{1'b0}};
         avst_selctd_intf_shift_chan  <= {LPHY_DSP_CAPTURE_INST*ANTENNA_DWIDTH{1'b0}};
         
      end else begin
         avst_selctd_intf_shift_valid <= lphy_avst_source_dsp_capture_valid >> interface_sel[NUM_INTERFACES_LOG2-1:0];
         avst_selctd_intf_shift_data  <= lphy_avst_source_dsp_capture_data >> (interface_sel[NUM_INTERFACES_LOG2-1:0]*IQ_DATAWIDTH);
         avst_selctd_intf_shift_chan  <= lphy_avst_source_dsp_capture_chan >> (interface_sel[NUM_INTERFACES_LOG2-1:0]*ANTENNA_DWIDTH);
         
      end
   end

   always @ (posedge clk_dsp) begin
      if (~rst_dsp_n) begin
         lphy_avst_selctd_cap_intf_valid <= 1'b0;
         lphy_avst_selctd_cap_intf_data  <= {IQ_DATAWIDTH{1'b0}};
         lphy_avst_selctd_cap_intf_chan  <= {ANTENNA_DWIDTH{1'b0}};
      end else begin
         lphy_avst_selctd_cap_intf_valid <= avst_selctd_intf_shift_valid[0];
         lphy_avst_selctd_cap_intf_data  <= avst_selctd_intf_shift_data[IQ_DATAWIDTH-1:0];
         lphy_avst_selctd_cap_intf_chan  <= avst_selctd_intf_shift_chan[ANTENNA_DWIDTH-1:0];
      end
   end
   
 // Internal signals for LPHY_SS_Registers outputs
    wire frame_sync_frame_config_dl_start; // DL start signal (1 bit)
    wire frame_sync_frame_config_ul_start; // UL start signal (1 bit)
    wire [15:0] dl_input_config_dl_input_sample; // DL input sample (16 bits)
    wire [4:0] dl_input_config_dl_input_sym; // DL input symbol (5 bits)
    wire [3:0] dl_input_config_dl_input_sfn; // DL input SFN (4 bits)
    wire dl_input_config_dl_input_rfn; // DL input RFN (1 bit)
    wire [15:0] ul_input_config_ul_input_sample; // UL input sample (16 bits)
    wire [4:0] ul_input_config_ul_input_sym; // UL input symbol (5 bits)
    wire [3:0] ul_input_config_ul_input_sfn; // UL input SFN (4 bits)
    wire ul_input_config_ul_input_rfn; // UL input RFN (1 bit)

// Instantiate the LPHY_SS_Registers module
    LPHY_SS_Registers lphy_ss_regs (
        .frame_sync_frame_config_dl_start					(frame_sync_frame_config_dl_start), // Output, 1 bit
        .frame_sync_frame_config_ul_start					(frame_sync_frame_config_ul_start), // Output, 1 bit
		
        .dl_input_config_dl_input_sample					(dl_input_config_dl_input_sample), // Output, 16 bits
        .dl_input_config_dl_input_sym						(dl_input_config_dl_input_sym), // Output, 5 bits
        .dl_input_config_dl_input_sfn						(dl_input_config_dl_input_sfn), // Output, 4 bits
        .dl_input_config_dl_input_rfn						(dl_input_config_dl_input_rfn), // Output, 1 bit
		
        .ul_input_config_ul_input_sample					(ul_input_config_ul_input_sample), // Output, 16 bits
        .ul_input_config_ul_input_sym						(ul_input_config_ul_input_sym), // Output, 5 bits
        .ul_input_config_ul_input_sfn						(ul_input_config_ul_input_sfn), // Output, 4 bits
        .ul_input_config_ul_input_rfn						(ul_input_config_ul_input_rfn), // Output, 1 bit
		
        .reset_config_soft_reset							(rst_soft_n), // Output, 1 bit
		
        .bw_config_cc1_bw_config_sel						(bw_config_cc1[6:0]), // Output, 7 bits
        .bw_config_cc1_cc1_disable							(bw_config_cc1[7]), // Output, 1 bit
        .bw_config_cc2_bw_config_sel						(bw_config_cc2[6:0]), // Output, 7 bits
        .bw_config_cc2_cc2_disable							(bw_config_cc2[7]), // Output, 1 bit
		
        .prb_blanking_ctrl_blanking_dis						(blanking_dis), // Output, 1 bit
		
        .cp_length_cp_length								(cp_len), // Output, 11 bits
        .fft_size_fft_size									(fft_size), // Output, 4 bits
		
        .ifft_l1_control_mux_select_l1						(ifft_l1_control_reg[0]), // Output, 1 bit
        .ifft_l1_control_ifft_dc_sc_en_l1					(ifft_l1_control_reg[1]), // Output, 1 bit
        .ifft_gain_l1_ifft_gain_l1							(ifft_gain_l1), // Output, 32 bits
        .ifft_shift_l1_ifft_shift_l1						(ifft_shift_l1), // Output, 4 bits
        .ifft_mux_const_data_l1_ifft_mux_constant_l1		(ifft_mux_const_l1_reg), // Output, 16 bits		
         
		.ifft_l2_control_mux_select_l2						(ifft_l2_control_reg[0]), // Output, 1 bit
        .ifft_l2_control_ifft_dc_sc_en_l2					(ifft_l2_control_reg[1]), // Output, 1 bit
        .ifft_gain_l2_ifft_gain_l2							(ifft_gain_l2), // Output, 32 bits
        .ifft_shift_l2_ifft_shift_l2						(ifft_shift_l2), // Output, 4 bits
        .ifft_mux_const_data_l2_ifft_mux_constant_l2		(ifft_mux_const_l2_reg), // Output, 16 bits
        
        .fft_l1_control_fft_dc_sc_en_l1						(fft_l1_control_reg[0]), // Output, 1 bit
        .fft_l1_control_ul_hcs_bypass_l1					(fft_l1_control_reg[1]), // Output, 1 bit
        .fft_gain_l1_fft_gain_l1							(fft_gain_l1), // Output, 32 bits
        .fft_shift_l1_fft_shift_l1							(fft_shift_l1), // Output, 4 bits
        
		.fft_l2_control_fft_dc_sc_en_l2						(fft_l2_control_reg[0]), // Output, 1 bit
        .fft_l2_control_ul_hcs_bypass_l2					(fft_l2_control_reg[1]), // Output, 1 bit
        .fft_gain_l2_fft_gain_l2							(fft_gain_l2), // Output, 32 bits
        .fft_shift_l2_fft_shift_l2							(fft_shift_l2), // Output, 4 bits
		
        .lpbk_en_ifft_fft_lpbk_en							(ifft_fft_lpbk), // Output, 1 bit
		.lpbk_en_duc_ddc_lpbk_en							(duc_ddc_lpbk), // Output, 1 bit
        .c_hps_c_hps										(c_hps), // Output, 1 bit
        //.lowphy_interface_select_lowphy_interface_select	(), // Output, 32 bits
		
        .prach_pat_en_prach_pat_en							(Pb_enable), // Output, 1 bit
        .prach_pb_sel_prach_pb_sel							(Pb_select), // Output, 1 bit
		
        .long_prach_filt_flush_en_lprach1_filt_flush_en		(filt_flush_en[0]), // Output, 1 bit
        .long_prach_filt_flush_en_lprach2_filt_flush_en		(filt_flush_en[1]), // Output, 1 bit
		
		.prach_sel_short_long_prach_sel_i					(short_long_prach_select),//input, 1bit
		.long_prach_freq_offset_long_prach_freq_offset_i	(xran_demapper_cplane_dout_prach [55:32]),//input, 24bits
		.long_prach_version_long_prach_version_i			(long_prach_version_reg),//input, 32bits
		.num_cc_num_cc_i                                    (num_cc), //input 1 bits                         
		.hps_valid_hps_valid                              	(hps_valid),      // output 1 bit                
        .hps_config_frame_structure 					  	(hps_framestructure),	// output 8 bits         
        .short_prach_freq_offset_short_prach_freq_offset  	(hps_freqoffset),		// output 24 bits 
        .ifft_l1_control_ifft_rc_enable_l1                  (ifft_l1_control_ifft_rc_enable_l1  ),
        .ifft_l2_control_ifft_rc_enable_l2                  (ifft_l2_control_ifft_rc_enable_l2  ),
        .fft_l1_control_fft_rc_enable_l1                    (fft_l1_control_fft_rc_enable_l1    ),
        .fft_l2_control_fft_rc_enable_l2                    (fft_l2_control_fft_rc_enable_l2    ),
        .ifft_l1_rc_bw_sel_ifft_rc_bw_sel_l1				(ifft_l1_rc_bw_sel_ifft_rc_bw_sel_l1),
        .ifft_l2_rc_bw_sel_ifft_rc_bw_sel_l2				(ifft_l2_rc_bw_sel_ifft_rc_bw_sel_l2),
        .fft_l1_rc_bw_sel_fft_rc_bw_sel_l1  				(fft_l1_rc_bw_sel_fft_rc_bw_sel_l1  ),
        .fft_l2_rc_bw_sel_fft_rc_bw_sel_l2  				(fft_l2_rc_bw_sel_fft_rc_bw_sel_l2  ),
		.short_prach_time_offset_short_prach_time_offset			(short_prach_time_offset),
		.short_prach_time_offset_bias_short_prach_time_offset_bias	(short_prach_time_offset_bias),
		.short_prach_startsym_bias_short_prach_startsym_bias		(short_prach_startsym_bias),
		
        .clk												(clk_csr),//input wire
        .reset												(~rst_csr_n),//input wire
        .writedata											(lphy_ss_config_csr_writedata), //input wire [31:0]	
        .read												(lphy_ss_config_csr_read),//input wire 			
        .write												(lphy_ss_config_csr_write),//input wire
        .byteenable											(4'b1111), //input wire [3:0]	
        .readdata											(lphy_ss_config_csr_readdata),//output reg [31:0]
        .readdatavalid										(lphy_ss_config_csr_readdatavalid),//output reg
        .address											({lphy_ss_config_csr_address[5:0],2'b00})//input wire [7:0]
    );
	
lphy_ss_config u_lphy_ss_config
	(

	.clk_dsp              		(clk_dsp),
	.rst_dsp_n            		(rst_dsp_n_6d_dup1 ),//??
	// .clk_csr              		(clk_csr),
	// .rst_csr_n            		(rst_csr_n),	
	// .csr_address          		(lphy_ss_config_csr_address   ),
	// .csr_write            		(lphy_ss_config_csr_write     ),
	// .csr_writedata        		(lphy_ss_config_csr_writedata ),
	// .csr_readdata         		(),//lphy_ss_config_csr_readdata
	.rst_soft_n	     	 		(rst_dsp_soft_n_6d_dup1),
	.frame_status    			(radio_config_status		  ),
	.auxN_tx_rfp          		(frame_status_counter_reset),
	.dl_input_hfn_pulse	 		(dl_input_hfn_pulse),
	.ul_input_hfn_pulse			(ul_input_hfn_pulse),
	
	.dl_ul_start				({frame_sync_frame_config_ul_start,frame_sync_frame_config_dl_start}),
	
	.dl_input_config			({6'b000000,dl_input_config_dl_input_rfn,dl_input_config_dl_input_sfn,dl_input_config_dl_input_sym,dl_input_config_dl_input_sample}),
	.ul_input_config			({6'b000000,ul_input_config_ul_input_rfn,ul_input_config_ul_input_sfn,ul_input_config_ul_input_sym,ul_input_config_ul_input_sample})
	
	// .short_long_prach_sel_reg	(),
	// .long_prach_freqoffset_reg	(),
	// .long_prach_version_reg		(),

	// .rst_soft_n	     	 		(rst_dsp_soft_n_6d_dup1),
	// .bw_config_cc1				(),
	// .bw_config_cc2				(),
	// .blanking_dis				(),
	// .cp_length					(),
	// .fft_size					(),		
	// .ifft_l1_control_reg		(),
	// .ifft_gain_l1				(),
	// .ifft_shift_l1				(),
	// .ifft_mux_const_l1_reg		(),
	// .dps_value_l1				(),
	// .ifft_l2_control_reg		(),
	// .ifft_gain_l2 				(),
	// .ifft_shift_l2 				(),
	// .ifft_mux_const_l2_reg		(),
	// .dps_value_l2				(),
	// .fft_l1_control_reg			(),
	// .fft_gain_l1				(),
	// .fft_shift_l1				(),
	// .fft_l2_control_reg			(),
	// .fft_gain_l2				(),
	// .fft_shift_l2				(),
	// .ifft_fft_lpbk				(),				
	// .c_hps_reg		            (),
	// .LP_filt_flush	            (),
	// .lowphy_int_sel	            (),
	// .Pb_enable		            (),
	// .Pb_select					()		            
	) ;




endmodule