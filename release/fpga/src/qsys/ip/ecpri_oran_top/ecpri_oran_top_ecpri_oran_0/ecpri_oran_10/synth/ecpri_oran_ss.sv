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

module ecpri_oran_ss
#(
   parameter    
   
   NUM_OF_ANT        	= 8		,
   NUM_OF_FFT       	= 2		,
   CPRI_ETH_DATAWIDTH   = 128	,
   XRAN_ETH_DATAWIDTH   = 128	,
   CH_DW 				= 8		,
   NUM_OF_PRACH 		= 2     ,
   CAPTURE_DMA_WIDTH    = 512   ,
   IQ_DATAWIDTH 		   = 32                      ,	
   CPRI_FRAME_DATAWIDTH    = 64  	                 ,
   ECPRI_CAPTURE_INSTANCES = 2                       ,
   DSP_CAPTURE_INSTANCES   = 30                      ,
   ANTENNA_DWIDTH          = $clog2(NUM_OF_ANT)      
)
(
 input 			clk_ecpri_tx					,
 input 			clk_ecpri_rx					,
 input 		    clk_eth_xran_dl   				,
 input 		    clk_eth_xran_ul   				,
 input          clk_csr                         ,
 input          clk_dsp                         ,
 input 		    rst_csr_n         				,
 input 			rst_eth_xran_n_dl 				,
 input 			rst_eth_xran_n_ul 				,
 input          rst_dsp_n                       ,
 input          rst_ecpri_n                     ,
 
 input  [9 :0]  ecpri_csr_address      		 	, 
 input          ecpri_csr_write        		 	,
 input          ecpri_csr_read        		 	,
 input  [31:0]  ecpri_csr_writedata   		 	,
 output [31:0]  ecpri_csr_readdata     		 	,
 output         ecpri_csr_readdatavalid		 	,
 output         ecpri_csr_waitrequest  		 	,
 /*
 output         avst_source_ul_valid         	,
 output [63:0 ] avst_source_ul_data          	,
 input          avst_source_ul_ready         	,
 output         avst_source_ul_endofpacket   	,
 output         avst_source_ul_startofpacket 	,
 output [2 :0 ] avst_source_ul_empty         	,
 */
 
 output         avst_source_ul_bridge_valid         	,
 output [63:0 ] avst_source_ul_bridge_data          	,
 input          avst_source_ul_bridge_ready         	,
 output         avst_source_ul_bridge_endofpacket   	,
 output         avst_source_ul_bridge_startofpacket 	,
 output [2 :0 ] avst_source_ul_bridge_empty         	,
 
output [31:0] tx_ptp_fp_bridge 					    ,
output tx_ptp_ts_req_bridge 						,
 
 input          rx_pcs_ready                    , 

 input          avst_sink_dl_valid          	,  
 input  [63:0 ] avst_sink_dl_data           	,  
 input          avst_sink_dl_endofpacket    	,  
 output         avst_sink_dl_ready          	,  
 input          avst_sink_dl_startofpacket  	,  
 input  [2 :0 ] avst_sink_dl_empty          	,  
 input  [5 :0 ] avst_sink_dl_error          	, 
 
 input			ecpri_ext_sink_valid			, 
 input	[63:0 ] ecpri_ext_sink_data    			,
 input          ecpri_ext_sink_sop     			,
 input          ecpri_ext_sink_eop     			,
 input	[2:0 ]  ecpri_ext_sink_empty   			,
 input          ecpri_ext_sink_error   			,
 output         ecpri_ext_sink_ready   			,
												
 output   		ecpri_ext_source_valid			,
 output [63:0]  ecpri_ext_source_data   		,
 output         ecpri_ext_source_sop    		,
 output         ecpri_ext_source_eop    		,
 output [2:0 ]  ecpri_ext_source_empty  		,
 output [5:0]   ecpri_ext_source_error  		,
 // clk_tx from MAC Stable - ready signal  - from ethernet     // check whether it is for status 
 input          tx_lanes_stable                 ,
 
output  [21:0]   o_mac_ptp_fp            		,  // changed to 22 bits      
output          o_mac_ptp_ts_req        		,    
input           i_mac_ptp_tx_ets_valid  		,
input   [95:0]  i_mac_ptp_tx_ets        		,    
input   [21:0]   i_mac_ptp_tx_ets_fp     		, // changed to 22 bits
input           i_mac_ptp_rx_its_valid  		,
input   [95:0]  i_mac_ptp_rx_its        		,    
input   [19:0]   i_ext_ptp_fp            		, //changed to 20 bits 
input           i_ext_ptp_ts_req                ,      
output          o_ext_ptp_tx_ets_valid  		,
output  [95:0]  o_ext_ptp_tx_ets        		,    
output  [19:0]   o_ext_ptp_tx_ets_fp     		, // changed to 20 bits
output  [95:0]  o_ext_ptp_rx_its        		,        
output          o_ext_ptp_rx_its_valid  		,


//input   [95:0]  tx_time_of_day_96b_data         ,
//input   [95:0]  rx_time_of_day_96b_data         , 
// from radio config
input           rst_soft_n                      ,
// oran output to LPHY ss
output                                    xran_demapper_source_valid        	 ,
output    [XRAN_ETH_DATAWIDTH-1:0]        xran_demapper_source_data         	 ,
output    [15 :0]                         xran_demapper_source_channel      	 ,
output                                    xran_demapper_source_endofpacket  	 ,
output                                    xran_demapper_source_startofpacket	 ,
input                                     xran_demapper_source_ready        	 ,

output                                    xran_demapper_cplane_valid             ,
output                                    xran_demapper_cplane_startofpacket     ,
output                                    xran_demapper_cplane_endofpacket       ,


input   [9 :0]                            oran_csr_address      		 		 ,
input                                     oran_csr_write        		 		 ,
input                                     oran_csr_read         		 		 ,
input   [31:0]                            oran_csr_writedata    		 		 ,
output  [31:0]                            oran_csr_readdata     		 		 ,       
output                                    oran_csr_readdatavalid 		 		 ,
output                                    oran_csr_waitrequest  		         ,

input   [3 :0]                            fh_comp_csr_address      		 		 ,
input                                     fh_comp_csr_write        		 		 ,
input                                     fh_comp_csr_read         		 		 ,
input   [31:0]                            fh_comp_csr_writedata    		 		 ,
output  [31:0]                            fh_comp_csr_readdata     		 		 ,       
output                                    fh_comp_csr_readdatavalid 		 	 ,
output                                    fh_comp_csr_waitrequest  		         ,

/* input   [2:0]       up_arbiter_csr_address          , 
input               up_arbiter_csr_write            ,
input               up_arbiter_csr_read             ,
input   [31:0]      up_arbiter_csr_writedata        ,
output  [31:0]      up_arbiter_csr_readdata         , */


input [95:0]   						      oran_tx_time_of_day_96b_data			 ,
input [95:0]   						      oran_rx_time_of_day_96b_data			 ,
input       						      oran_tx_time_of_day_96b_valid			 ,
input       						      oran_rx_time_of_day_96b_valid			 , 
 

// coupling pusch sink input L1 from ul lphy SS
input 									coupling_pusch_avst_sink_valid_l1 	 	,
input [31:0] 							coupling_pusch_avst_sink_data_l1 	 	,
input [15:0] 							coupling_pusch_avst_sink_channel_l1 	,
input  									coupling_pusch_avst_sink_sop_l1 	 	,
input 									coupling_pusch_avst_sink_eop_l1 	 	,	
// coupling pusch sink input L2 from ul lphy SS                                       
input 									coupling_pusch_avst_sink_valid_l2 	 	,   
input [31:0] 							coupling_pusch_avst_sink_data_l2 	 	,	
input [15:0] 							coupling_pusch_avst_sink_channel_l2 	,
input 									coupling_pusch_avst_sink_sop_l2 	 	,
input 									coupling_pusch_avst_sink_eop_l2 	 	,
// coupling prach sink input L1 from ul lphy SS
input 									coupling_prach_avst_sink_valid_l1 	    ,
input [31:0] 							coupling_prach_avst_sink_data_l1 	    ,
input [15:0] 							coupling_prach_avst_sink_channel_l1     ,
input  									coupling_prach_avst_sink_sop_l1 	    ,
input 									coupling_prach_avst_sink_eop_l1 	    ,
// coupling prach sink input L1 from ul lphy SS																			    
input 									coupling_prach_avst_sink_valid_l2 	    ,
input [31:0] 							coupling_prach_avst_sink_data_l2 	    ,
input [15:0] 							coupling_prach_avst_sink_channel_l2     ,
input 									coupling_prach_avst_sink_sop_l2 	    ,
input 									coupling_prach_avst_sink_eop_l2 	    ,
		 
input [7:0]		                        bw_config_cc1		                    ,
input [7:0]		                        bw_config_cc2		                    ,


input        						    short_long_prach_select 			    ,
// input to coupling from ul LPHY ss
input  [31:0]  coupling_pusch_timing_ref   			,
input  [31:0]  coupling_prach_timing_ref   			,



// to fifo status monitoring module in DFD subsystem


//input var ul_eaxc_id                    uplink_eaxc_id                          ,
input [255:0]                           uplink_eaxc_id_concat                   ,
//input var dl_eaxc_id                    downlink_eaxc_id                      , 
input [127:0]                    downlink_eaxc_id_concat                        , 
// from ul rtc id config to prach top of ul lphy ss
output [15:0] 							rx_rtc_id							    ,
// from dl rtc id config to dl lphy ss
output [15:0]                           rx_rtc_id_dl                            ,
// channel number to dl lphy subsytem
output [15:0] 							rx_u_axc_id							    ,  
// to radio config
output                                  ul_rtc_id_intr                          , 
output                                  dl_rtc_id_intr                          , 
output                                  ul_axc_id_intr                          ,
output                                  dl_axc_id_intr                          ,

//output var oran_rx_cplane_conduit       oran_rx_cplane                  		,
output [189:0]                          oran_rx_cplane_concat                  	,
output [67:0 ]                          oran_rx_uplane_concat                  	,
//output var oran_rx_uplane_conduit       oran_rx_uplane                  	    ,


input                               ul_start_pulse_latch                       ,

input   [7 :0]      oran_ss_config_csr_address       	 ,
input               oran_ss_config_csr_write         	 ,
input   [31:0]      oran_ss_config_csr_writedata     	 ,
output  [31:0]      oran_ss_config_csr_readdata          ,
 input 				oran_ss_config_csr_read						,//new
 output 				oran_ss_config_csr_readdata_valid						,//new
 output 				oran_ss_config_csr_waitrequest ,

// from lphy_ss
input    			dl_input_hfn_pulse     	 ,
input  [55:0] 		radio_config_status		 ,
input  [95:0]      	tod        				 ,

input       		xran_timestamp_ram_read  ,                           	                 
output [63:0]		xran_timestamp_ram_readdata ,

output              timeout_cntr_intr_cplane	,
output              timeout_cntr_intr_uplane	,
output              fifo_full_intr
                           		           
);

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
(*preserve_syn_only*) reg 				rst_dsp_soft_n_6d_dup2                                  ;

wire 									rst_eth_n_dl_sync									    ;
wire                                    rst_ecpri_sync                                          ;
wire                                    rst_dsp_sync                                            ;
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


reg     rx_pcs_ready_1d    ;
reg     rx_pcs_ready_2d    ;

wire                                    ecpri_sink_valid                  	 ;
wire    [63:0]                          ecpri_sink_data                   	 ;
wire    [15 :0]                         ecpri_sink_channel                	 ;
wire                                    ecpri_sink_sop                    	 ;
wire                                    ecpri_sink_eop                    	 ;
wire                                    ecpri_sink_ready                  	 ;
wire    [2 :0 ]                         ecpri_sink_empty                  	 ; 

wire                                    oran_demapper_valid               	 ;
wire    [63:0]                          oran_demapper_data                	 ;
wire    [15 :0]                         oran_demapper_channel             	 ;
wire                                    oran_demapper_sop                 	 ;
wire                                    oran_demapper_eop                 	 ;
wire                                    oran_demapper_ready               	 ;
wire    [2:0]                           oran_demapper_empty               	 ;
wire                                    oran_demapper_error 				 ;
// side bamd output from ecpri to oran
wire    [31:0]                         ecpri_source_pc_id    				 ;
wire    [31:0]                         ecpri_source_seq_id   				 ;
wire    [15:0]                         ecpri_source_rtc_id   				 ;

wire    [15:0]                         oran_source_pc_id    				 ;
wire    [15:0]                         oran_source_seq_id   				 ;
wire    [15:0]                         oran_source_rtc_id   				 ;

wire    [15:0]                         sink_pkt_size                         ;

wire                                   tx_transport_c_u                      ;
wire                                   rx_transport_c_u	                     ;

wire                                    ul_arb_source_valid_out         	 ;
wire    [127:0]                         ul_arb_source_data_out          	 ;
wire    [15:0]                          ul_arb_source_channel_out       	 ;
wire                                    ul_arb_source_sop_out           	 ;
wire                                    ul_arb_source_eop_out           	 ;
wire                                    ul_arb_source_ready             	 ;

wire    [119:0]                         ul_arb_frame_ctrl_data          	 ;
reg     [119:0]                         ul_arb_frame_ctrl_data_1d         	 ;

wire    [15:0]                          tx_u_size 							 ;
wire 									tx_u_dataDirection					 ;              
wire  	[3:0]   						tx_u_filterIndex                  	 ;                  
wire  	[7:0]   						tx_u_frameId						 ;                    
wire  	[3:0]   						tx_u_subframeId						 ;                 
wire  	[5:0]   						tx_u_slotID							 ;                     
wire  	[5:0]   						tx_u_symbolid						 ;                   
wire  	[11:0]							tx_u_sectionId						 ;
wire 									tx_u_rb								 ;                         
wire  	[9:0]   						tx_u_startPrb						 ;                   
wire  	[7:0]   						tx_u_numPrb							 ; 
wire    [15:0]							tx_u_seq_id							 ;
wire    [15:0]							tx_u_pc_id							 ;

wire [3:0]tx_u_scs_sel            ;         
wire [7:0]tx_u_numberofsections   ;

reg                                     xran_demapper_cplane_valid_1d        ;
reg                                     xran_demapper_cplane_startofpacket_1d;
reg                                     xran_demapper_cplane_endofpacket_1d  ;

reg                                     xran_demapper_cplane_valid_2d        ;
reg                                     xran_demapper_cplane_startofpacket_2d;
reg                                     xran_demapper_cplane_endofpacket_2d  ;

reg                                     xran_demapper_cplane_valid_3d        ;
reg                                     xran_demapper_cplane_startofpacket_3d;
reg                                     xran_demapper_cplane_endofpacket_3d  ;

reg                                    c_datadirection_1d                   ;                                  
reg    [7:0] 						   rx_c_numberOfsections_1d		        ;
reg    [3:0] 						   rx_c_filterIndex_1d					;
reg    [7:0] 						   rx_c_frameId_1d 						;
reg    [3:0] 						   rx_c_subframeId_1d					;
reg    [5:0] 						   rx_c_slotID_1d						;
reg    [5:0] 						   rx_c_symbolid_1d						;
reg    	   						   	   rx_c_rb_1d  							;
reg                                    rx_c_symInc_1d                       ;
reg    [9:0] 						   rx_c_startPrb_1d						;
reg    [7:0] 						   rx_c_numPrb_1d						;
reg    [11:0] 						   rx_reMask_1d							;
reg    [3:0] 						   rx_numSymbol_1d						;
reg    [7:0] 						   rx_sectionType_1d					;
reg    [11:0] 						   rx_c_sectionId_1d					;
reg                                    rx_sec_hdr_valid_1d           		;

reg                                    c_datadirection_2d                   ;
reg    [7:0] 						   rx_c_numberOfsections_2d		        ;
reg    [3:0] 						   rx_c_filterIndex_2d					;
reg    [7:0] 						   rx_c_frameId_2d 						;
reg    [3:0] 						   rx_c_subframeId_2d					;
reg    [5:0] 						   rx_c_slotID_2d						;
reg    [5:0] 						   rx_c_symbolid_2d						;
reg    	   						   	   rx_c_rb_2d  							;
reg                                    rx_c_symInc_2d                       ;
reg    [9:0] 						   rx_c_startPrb_2d						;
reg    [7:0] 						   rx_c_numPrb_2d						;
reg    [11:0] 						   rx_reMask_2d							;
reg    [3:0] 						   rx_numSymbol_2d						;
reg    [7:0] 						   rx_sectionType_2d					;
reg    [11:0] 						   rx_c_sectionId_2d					;
reg                                    rx_sec_hdr_valid_2d           		;


reg                                    c_datadirection_3d                   ;
reg    [7:0] 						   rx_c_numberOfsections_3d		        ;
reg    [3:0] 						   rx_c_filterIndex_3d					;
reg    [7:0] 						   rx_c_frameId_3d 						;
reg    [3:0] 						   rx_c_subframeId_3d					;
reg    [5:0] 						   rx_c_slotID_3d						;
reg    [5:0] 						   rx_c_symbolid_3d						;
reg    	   						   	   rx_c_rb_3d  							;
reg                                    rx_c_symInc_3d                       ;
reg    [9:0] 						   rx_c_startPrb_3d						;
reg    [7:0] 						   rx_c_numPrb_3d						;
reg    [11:0] 						   rx_reMask_3d							;
reg    [3:0] 						   rx_numSymbol_3d						;
reg    [7:0] 						   rx_sectionType_3d					;
reg    [11:0] 						   rx_c_sectionId_3d					;
reg                                    rx_sec_hdr_valid_3d           		;

reg [7:0] rx_c_framestructure_1d ;
reg [7:0] rx_c_framestructure_2d ;
reg [7:0] rx_c_framestructure_3d ;

reg radio_config_status_402 ;


wire 		xran_timestamp_dl_valid ;
wire [63:0] xran_timestamp_dl_data  ;
wire 		xran_timestamp_dl_sop   ;
wire 		xran_timestamp_dl_eop   ;

wire xran_timestamp_ul_valid   ;
wire [63:0] xran_timestamp_ul_data    ;
wire xran_timestamp_ul_sop     ;
wire xran_timestamp_ul_eop     ;

wire [55:0] xran_timestamp_radio_config_status ;
wire [95:0] xran_timestamp_tod ;

reg [55:0] xran_timestamp_radio_config_status_1d ;
reg [95:0] xran_timestamp_tod_1d ;
reg [55:0] xran_timestamp_radio_config_status_2d ;
reg [95:0] xran_timestamp_tod_2d ;
reg [55:0] xran_timestamp_radio_config_status_3d ;
reg [95:0] xran_timestamp_tod_3d ;
reg [55:0] xran_timestamp_radio_config_status_4d ;
reg [95:0] xran_timestamp_tod_4d ;

reg    [3:0]                            ext_scs_sel                         ;

wire [15:0] 							tx_u_axc_id						    ; 

wire                                    rx_sec_hdr_valid                    ;

wire                                   c_datadirection                      ;
wire    [7:0] 						   rx_c_numberOfsections		        ;
wire    [15:0]						   rx_c_rtc_id							;
wire    [3:0] 						   rx_c_filterIndex						;
wire    [7:0] 						   rx_c_frameId 						;
wire    [3:0] 						   rx_c_subframeId						;
wire    [5:0] 						   rx_c_slotID							;
wire    [5:0] 						   rx_c_symbolid						;
wire    	   						   rx_c_rb    							;
wire                                   rx_c_symInc                          ;
wire    [9:0] 						   rx_c_startPrb						;
wire    [7:0] 						   rx_c_numPrb							;

wire    [11:0] 						   rx_reMask							;
wire    [3:0] 						   rx_numSymbol							;
wire    [7:0] 						   rx_sectionType						;
wire    [11:0] 						   rx_c_sectionId						;
wire    [15:0]                         rx_timeOffset						;
wire    [7:0]                          rx_c_udCompHdr                       ;


wire    [15:0]                          c_cplength                        	;
wire    [7:0]                          	c_framestructure                    ;
wire    [23:0]                          c_freqoffset                        ;


wire    [9:0]                          start_prb                       		;
wire    [7:0]                          num_prb                         		;
		 
		 
wire    [5:0]                          symbol_id                       		;
wire    [5:0]                          slot_id                         		;
wire    [3:0]                          subframe_id                     		;
wire    [7:0]                          frame_id                        		;



// input to uplink arbiter
wire                                    coupling_pusch_source_valid         ;
wire    [127:0]                         coupling_pusch_source_data          ;
wire    [15:0]                          coupling_pusch_source_channel       ;
wire                                    coupling_pusch_source_startofpacket ;
wire                                    coupling_pusch_source_endofpacket   ;
wire [1:0]                              coupling_source_ready               ;  // from uplink arbiter

wire                                    coupling_prach_avst_source_valid        ;
wire  [127:0]                           coupling_prach_avst_source_data         ;
wire                                    coupling_prach_avst_source_endofpacket  ;
wire                                    coupling_prach_avst_source_startofpacket;
wire  [15 :0 ]                          coupling_prach_avst_source_channel      ;
wire                                    prach_avst_source_ready                 ; // from uplink arbiter


wire    [15:0]                          coupling_pusch_tx_u_size 				 ;
wire 									coupling_pusch_tx_u_dataDirection		 ;              
wire  	[3:0]   						coupling_pusch_tx_u_filterIndex          ;                  
wire  	[7:0]   						coupling_pusch_tx_u_frameId				 ;                    
wire  	[3:0]   						coupling_pusch_tx_u_subframeId			 ;                 
wire  	[5:0]   						coupling_pusch_tx_u_slotID				 ;                     
wire  	[5:0]   						coupling_pusch_tx_u_symbolid			 ;                   
wire  	[11:0]							coupling_pusch_tx_u_sectionId			 ;
wire 									coupling_pusch_tx_u_rb					 ;                         
wire  	[9:0]   						coupling_pusch_tx_u_startPrb			 ;                   
wire  	[7:0]   						coupling_pusch_tx_u_numPrb				 ; 
wire    [15:0]							coupling_pusch_tx_u_seq_id				 ;
wire    [15:0]							coupling_pusch_tx_u_pc_id			     ;
wire    [3:0]  							coupling_pusch_tx_u_scs_sel              ;        
wire    [7:0]  							coupling_pusch_tx_u_numberofsections     ;

wire    [15:0]                          coupling_prach_tx_u_size 				 ;
wire 									coupling_prach_tx_u_dataDirection		 ;              
wire  	[3:0]   						coupling_prach_tx_u_filterIndex          ;                  
wire  	[7:0]   						coupling_prach_tx_u_frameId				 ;                    
wire  	[3:0]   						coupling_prach_tx_u_subframeId			 ;                 
wire  	[5:0]   						coupling_prach_tx_u_slotID				 ;                     
wire  	[5:0]   						coupling_prach_tx_u_symbolid			 ;                   
wire  	[11:0]							coupling_prach_tx_u_sectionId			 ;
wire 									coupling_prach_tx_u_rb					 ;                         
wire  	[9:0]   						coupling_prach_tx_u_startPrb			 ;                   
wire  	[7:0]   						coupling_prach_tx_u_numPrb				 ; 
wire    [15:0]							coupling_prach_tx_u_seq_id				 ;
wire    [15:0]							coupling_prach_tx_u_pc_id			     ;
wire    [3:0]  							coupling_prach_tx_u_scs_sel              ;        
wire    [7:0]  							coupling_prach_tx_u_numberofsections     ;

wire [119:0] pusch_metadata;
wire [119:0] prach_metadata;

wire 									prach_arbiter_request					  ;
wire									pusch_arbiter_request					  ;
wire                                    ul_request                                ;

wire         							 avst_source_c_ext_valid							   ;        // avst_source_c_ext.valid
wire [63:0]  							 avst_source_c_ext_data								   ;        //                  .data
wire         							 avst_source_c_ext_startofpacket					   ; 		//                  .startofpacket
wire         							 avst_source_c_ext_endofpacket						   ;   	  	//                  .endofpacket
wire [2:0]   							 avst_source_c_ext_empty							   ;        //                  .empty
wire         							 avst_source_c_ext_error                               ;


dl_eaxc_id                 downlink_eaxc_id                      ;
ul_eaxc_id                 uplink_eaxc_id                        ;
oran_rx_cplane_conduit     oran_rx_cplane 						 ;
oran_rx_uplane_conduit     oran_rx_uplane 						 ;

wire [15:0]		dl_eaxc_id0			 		;
wire [15:0]		dl_eaxc_id1			 		;
wire [15:0]		dl_eaxc_id2			 		;
wire [15:0]		dl_eaxc_id3			 		;
wire [15:0]		dl_eaxc_id4			 		;
wire [15:0]		dl_eaxc_id5			 		;
wire [15:0]		dl_eaxc_id6			 		;
wire [15:0]		dl_eaxc_id7			 		;

wire [15:0]		ul_eaxc_id0			 		;
wire [15:0]		ul_eaxc_id1			 		;
wire [15:0]		ul_eaxc_id2			 		;
wire [15:0]		ul_eaxc_id3			 		;
wire [15:0]		ul_eaxc_id4			 		;
wire [15:0]		ul_eaxc_id5			 		;
wire [15:0]		ul_eaxc_id6			 		;
wire [15:0]		ul_eaxc_id7			 		;

wire [15:0]		ul_eaxc_id8			 		;
wire [15:0]		ul_eaxc_id9			 		;
wire [15:0]		ul_eaxc_id10		 		;
wire [15:0]		ul_eaxc_id11		 		;
wire [15:0]		ul_eaxc_id12		 		;
wire [15:0]		ul_eaxc_id13		 		;
wire [15:0]		ul_eaxc_id14		 		;
wire [15:0]		ul_eaxc_id15		 		;

wire [11:0]    intr_idle_ms_timeout         ;
wire 		   coupling_err_clear 		    ;
wire [31:0]    pusch_cu_coupling_status		;
wire [31:0]    prach_cu_coupling_status		;			
wire [31:0]    cu_coupling_version          ;
wire [31:0]    coupling_statistics_register ; 


wire  [1:0]       timeout_cntr_intr_clear		;
wire  [1:0]       timeout_cntr_intr_mask		;
wire              fifo_full_intr_mask   		;
wire              fifo_full_intr_clear  		; 
wire ul_arb_output_fifo_full ;
wire [2:0]fifo_full_status ;

reg dl_input_hfn_pulse_l    ;
reg dl_input_hfn_pulse_1d   ;
reg dl_input_hfn_pulse_2d   ;
wire    [12:0]      ram_rdusedw                 ;
wire                ram_rdempty                 ;

wire    [31:0]      timestamp_mux               ;

wire arbiter_cfg_ctrl;
wire arbiter_cfg_ready_i;
wire [1:0] arbiter_prio1_pusch_priority;
wire [1:0] arbiter_prio1_prach_priority;

wire [3:0]decomp_fsoffset  ;
wire [3:0]comp_fsoffset    ;

wire [31:0] control_xran_timestamp;//new
reg rst_mac_n ;

 wire         avst_source_ul_valid         	;
 wire [63:0 ] avst_source_ul_data          	;
 wire         avst_source_ul_ready         	;
 wire         avst_source_ul_endofpacket   	;
 wire         avst_source_ul_startofpacket 	;
 wire [2 :0 ] avst_source_ul_empty         	;
 
wire data_dummy_bit 							;
wire data_dummy_bit_0 							;


wire empty_dummy_bit                       		;
wire empty_dummy_bit_0                          ;
wire [21:0]	tx_ptp_fp_fifo_in 					;
wire tx_ptp_ts_req_fifo_in 						;

 wire         avst_sink_sc_fifo_valid         	;
 wire [63:0 ] avst_sink_sc_fifo_data          	;
 wire         avst_sink_sc_fifo_ready         	;
 wire         avst_sink_sc_fifo_endofpacket   	;
 wire         avst_sink_sc_fifo_startofpacket 	;
 wire [2 :0 ] avst_sink_sc_fifo_empty         	;
 
 wire [21:0]	tx_ptp_fp_fifo_out 					;
 wire 			tx_ptp_ts_req_fifo_out 				;

 wire         avst_source_sc_fifo_valid         	;
 wire [63:0 ] avst_source_sc_fifo_data          	;
 wire         avst_source_sc_fifo_ready         	;
 wire         avst_source_sc_fifo_endofpacket   	;
 wire         avst_source_sc_fifo_startofpacket 	;
 wire [2 :0 ] avst_source_sc_fifo_empty         	;
 
 reg         avst_sink_dl_valid_1d          	;  
 reg [63:0 ] avst_sink_dl_data_1d           	;  
 reg         avst_sink_dl_endofpacket_1d    	;   
 reg         avst_sink_dl_startofpacket_1d  	; 

 reg         avst_sink_dl_valid_2d          	;  
 reg [63:0 ] avst_sink_dl_data_2d           	;  
 reg         avst_sink_dl_endofpacket_2d    	;   
 reg         avst_sink_dl_startofpacket_2d  	; 

 reg         avst_sink_dl_valid_3d          	;  
 reg [63:0 ] avst_sink_dl_data_3d           	;  
 reg         avst_sink_dl_endofpacket_3d    	;   
 reg         avst_sink_dl_startofpacket_3d  	;
 
 reg         avst_sink_dl_valid_4d          	;  
 reg [63:0 ] avst_sink_dl_data_4d           	;  
 reg         avst_sink_dl_endofpacket_4d    	;   
 reg         avst_sink_dl_startofpacket_4d  	;
 
 reg 		avst_source_ul_valid_1d           ;       
 reg [63:0]	avst_source_ul_data_1d            ;
 reg 		avst_source_ul_startofpacket_1d   ;
 reg 		avst_source_ul_endofpacket_1d     ;
 
 reg avst_source_ul_valid_2d          ;       
 reg [63:0] avst_source_ul_data_2d    ;
 reg avst_source_ul_startofpacket_2d  ;
 reg avst_source_ul_endofpacket_2d    ;
 
 reg avst_source_ul_valid_3d           ;       
 reg [63:0] avst_source_ul_data_3d     ;
 reg avst_source_ul_startofpacket_3d   ;
 reg avst_source_ul_endofpacket_3d     ;
 
 reg avst_source_ul_valid_4d            ;       
 reg [63:0] avst_source_ul_data_4d      ;
 reg avst_source_ul_startofpacket_4d    ;
 reg avst_source_ul_endofpacket_4d      ;
 
 
 
 
 reg      [2:0] cycle_count ;
 reg            u_plane_packet_type ;

 
 reg rst_ecpri_n_1d ;
 reg rst_ecpri_n_2d ;
 reg rst_ecpri_n_3d ;
 reg rst_ecpri_n_4d ;
 reg rst_ecpri_n_5d ;
 reg rst_ecpri_n_6d ;
 
 
 assign avst_source_ul_bridge_valid         	=  avst_source_sc_fifo_valid               ;
 assign avst_source_ul_bridge_data          	=  avst_source_sc_fifo_data                ;
 assign avst_source_sc_fifo_ready         	    =  avst_source_ul_bridge_ready             ;
 assign avst_source_ul_bridge_endofpacket   	=  avst_source_sc_fifo_endofpacket         ;
 assign avst_source_ul_bridge_startofpacket 	=  avst_source_sc_fifo_startofpacket       ;
 assign avst_source_ul_bridge_empty         	=  avst_source_sc_fifo_empty               ;										
 assign tx_ptp_fp_bridge 					    =   {10'b0,tx_ptp_fp_fifo_out }            ;
 assign tx_ptp_ts_req_bridge 					=  tx_ptp_ts_req_fifo_out                  ;
 

	
assign  fifo_full_intr = (fifo_full_intr_clear | ( fifo_full_intr_mask )) ? 0 : (|fifo_full_status) ;
assign  fifo_full_status = ({ul_arb_output_fifo_full,prach_cu_coupling_status[13],pusch_cu_coupling_status[11]}) ;// fifo_full_status


         
assign downlink_eaxc_id = downlink_eaxc_id_concat  ;
assign uplink_eaxc_id = uplink_eaxc_id_concat  	   ;

 
assign oran_ss_config_csr_waitrequest   = 1'b0 ;

/* altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_dsp_rst_ctrl
(
    .reset_in   (~rst_dsp_n     ),
    .clk        (clk_dsp        ), 
    .reset_out  (rst_dsp_sync   )
); */

/* altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_clk_ecpri_rst_ctrl
(
    .reset_in   (~rst_dsp_n     ),
    .clk        (clk_ecpri_rx        ), 
    .reset_out  (rst_ecpri_sync   )
); */

always @(posedge clk_dsp)begin
		    rst_dsp_n_1d 		<= rst_dsp_n;
			rst_dsp_n_2d 		<= rst_dsp_n_1d;	
			rst_dsp_n_3d 		<= rst_dsp_n_2d;
			rst_dsp_n_4d 		<= rst_dsp_n_3d;	
	end	
	
always @(posedge clk_ecpri_rx)begin
		    rst_ecpri_n_1d 		<= (rst_ecpri_n);
			rst_ecpri_n_2d 		<= rst_ecpri_n_1d;	
			rst_ecpri_n_3d 		<= rst_ecpri_n_2d;
			rst_ecpri_n_4d 		<= rst_ecpri_n_3d;
			rst_ecpri_n_5d 		<= rst_ecpri_n_4d;
			rst_ecpri_n_6d 		<= rst_ecpri_n_5d;
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

/* altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_eth_dl_rst_ctrl
(
    .reset_in   (~rst_eth_xran_n_dl     ),
    .clk        (clk_eth_xran_dl        ), 
    .reset_out  (rst_eth_n_dl_sync 		)
); */

always @(posedge clk_eth_xran_dl)
	begin
	    rst_eth_n_dl_1d 	 <= rst_eth_xran_n_dl;
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
	
/* altera_reset_synchronizer
#(
    .ASYNC_RESET(1),
    .DEPTH      (4)
) wrapper_eth_ul_rst_ctrl
(
    .reset_in   (~rst_eth_xran_n_ul     ),
    .clk        (clk_eth_xran_ul        ), 
    .reset_out  (rst_eth_n_ul_sync 		)
); */

always @(posedge clk_eth_xran_ul)
	begin
	    rst_eth_n_ul_1d 		<= rst_eth_xran_n_ul;
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
		rst_eth_soft_n_1d 		<= rst_soft_n;
		rst_eth_soft_n_1d_dup1 	<= rst_soft_n;
		
		rst_eth_soft_n_2d 		<= rst_eth_soft_n_1d;
	
		rst_eth_soft_n_3d_dup1   <= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d_dup1   <= rst_eth_soft_n_3d_dup1;
			
		rst_eth_soft_n_3d_dup2   <= rst_eth_soft_n_2d;
		rst_eth_soft_n_4d_dup2  	<= rst_eth_soft_n_3d_dup2;
			
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
        rst_eth_soft_n_dl_5d		<= rst_eth_soft_n_dl_4d;
	end	


always @(posedge clk_ecpri_tx)
	begin
	    rx_pcs_ready_1d 	<= rx_pcs_ready;
		 rx_pcs_ready_2d	<= rx_pcs_ready_1d;
	end

assign o_ext_ptp_rx_its_valid = ecpri_ext_source_sop && ecpri_ext_source_valid;

always @(posedge clk_eth_xran_ul)
	begin
		if(~rst_eth_n_ul_6d_dup3)
			ul_arb_frame_ctrl_data_1d			<=	'd0                         ;
		else
			ul_arb_frame_ctrl_data_1d			<=	ul_arb_frame_ctrl_data		;
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
				
		end
	end

always @(posedge clk_eth_xran_ul)
	begin
		if(~rst_eth_n_ul_6d_dup2 & rst_eth_soft_n_4d_dup3)//rst_eth_xran_n_dl_5d
		begin	
			c_datadirection_1d						<= 'd0;
			rx_c_filterIndex_1d						<= 'd0;
			rx_c_frameId_1d							<= 'd0;
			rx_c_subframeId_1d						<= 'd0;
			rx_c_slotID_1d							<= 'd0;
			rx_c_symbolid_1d						<= 'd0;
			rx_sec_hdr_valid_1d						<= 'd0;
			rx_c_sectionId_1d						<= 'd0;
			rx_c_rb_1d								<= 'd0;
			rx_c_symInc_1d                          <= 'd0;
			rx_c_numberOfsections_1d                <= 'd0;
			rx_c_startPrb_1d						<= 'd0;
			rx_c_numPrb_1d							<= 'd0;
			rx_sectionType_1d						<= 'd0;
			rx_numSymbol_1d							<= 'd0;
			rx_reMask_1d							<= 'd0;
			
			c_datadirection_2d						<= 'd0;
			rx_c_filterIndex_2d						<= 'd0;
			rx_c_frameId_2d							<= 'd0;
			rx_c_subframeId_2d						<= 'd0;
			rx_c_slotID_2d							<= 'd0;
			rx_c_symbolid_2d						<= 'd0;
			rx_sec_hdr_valid_2d						<= 'd0;
			rx_c_sectionId_2d						<= 'd0;
			rx_c_rb_2d								<= 'd0;
			rx_c_symInc_2d                          <= 'd0;
			rx_c_numberOfsections_2d                <= 'd0;
			rx_c_startPrb_2d						<= 'd0;
			rx_c_numPrb_2d							<= 'd0;
			rx_sectionType_2d						<= 'd0;
			rx_numSymbol_2d							<= 'd0;
			rx_reMask_2d							<= 'd0;
			
			c_datadirection_3d						<= 'd0;
			rx_c_filterIndex_3d						<= 'd0;
			rx_c_frameId_3d							<= 'd0;
			rx_c_subframeId_3d						<= 'd0;
			rx_c_slotID_3d							<= 'd0;
			rx_c_symbolid_3d						<= 'd0;
			rx_sec_hdr_valid_3d						<= 'd0;
			rx_c_sectionId_3d						<= 'd0;
			rx_c_rb_3d								<= 'd0;
			rx_c_symInc_3d                          <= 'd0;
			rx_c_numberOfsections_3d                <= 'd0;
			rx_c_startPrb_3d						<= 'd0;
			rx_c_numPrb_3d							<= 'd0;
			rx_sectionType_3d						<= 'd0;
			rx_numSymbol_3d							<= 'd0;
			rx_reMask_3d							<= 'd0;
			rx_c_framestructure_1d          <= 'd0 ;
			rx_c_framestructure_2d          <= 'd0 ;
			rx_c_framestructure_3d          <= 'd0 ;
			
			
			

		end
		else
		begin
			
			c_datadirection_1d						<= c_datadirection						;
			rx_c_filterIndex_1d						<= rx_c_filterIndex						;
			rx_c_frameId_1d							<= rx_c_frameId							;
			rx_c_subframeId_1d						<= rx_c_subframeId						;
			rx_c_slotID_1d							<= rx_c_slotID							;
			rx_c_symbolid_1d						<= rx_c_symbolid						;
			rx_sec_hdr_valid_1d						<= rx_sec_hdr_valid						;
			rx_c_sectionId_1d						<= rx_c_sectionId						;
			rx_c_rb_1d								<= rx_c_rb								;
			rx_c_symInc_1d                          <= rx_c_symInc                          ;
			rx_c_numberOfsections_1d                <= rx_c_numberOfsections                ;
			rx_c_startPrb_1d						<= rx_c_startPrb						;
			rx_c_numPrb_1d							<= rx_c_numPrb							;
			rx_sectionType_1d						<= rx_sectionType						;
			rx_numSymbol_1d							<= rx_numSymbol							;
			rx_reMask_1d							<= rx_reMask							;	
			
			c_datadirection_2d						<= c_datadirection_1d					;
			rx_c_filterIndex_2d						<= rx_c_filterIndex_1d					;
			rx_c_frameId_2d							<= rx_c_frameId_1d						;
			rx_c_subframeId_2d						<= rx_c_subframeId_1d					;
			rx_c_slotID_2d							<= rx_c_slotID_1d						;
			rx_c_symbolid_2d						<= rx_c_symbolid_1d						;
			rx_sec_hdr_valid_2d						<= rx_sec_hdr_valid_1d					;
			rx_c_sectionId_2d						<= rx_c_sectionId_1d					;
			rx_c_rb_2d								<= rx_c_rb_1d							;
			rx_c_symInc_2d                          <= rx_c_symInc_1d                       ;
			rx_c_numberOfsections_2d                <= rx_c_numberOfsections_1d             ;
			rx_c_startPrb_2d						<= rx_c_startPrb_1d						;
			rx_c_numPrb_2d							<= rx_c_numPrb_1d						;
			rx_sectionType_2d						<= rx_sectionType_1d					;
			rx_numSymbol_2d							<= rx_numSymbol_1d						;
			rx_reMask_2d							<= rx_reMask_1d							;
			
			c_datadirection_3d						<= c_datadirection_2d					;
			rx_c_filterIndex_3d						<= rx_c_filterIndex_2d					;
			rx_c_frameId_3d							<= rx_c_frameId_2d						;
			rx_c_subframeId_3d						<= rx_c_subframeId_2d					;
			rx_c_slotID_3d							<= rx_c_slotID_2d						;
			rx_c_symbolid_3d						<= rx_c_symbolid_2d						;
			rx_sec_hdr_valid_3d						<= rx_sec_hdr_valid_2d					;
			rx_c_sectionId_3d						<= rx_c_sectionId_2d					;
			rx_c_rb_3d								<= rx_c_rb_2d							;
			rx_c_symInc_3d                          <= rx_c_symInc_2d                       ;
			rx_c_numberOfsections_3d                <= rx_c_numberOfsections_2d             ;
			rx_c_startPrb_3d						<= rx_c_startPrb_2d						;
			rx_c_numPrb_3d							<= rx_c_numPrb_2d						;
			rx_sectionType_3d						<= rx_sectionType_2d					;
			rx_numSymbol_3d							<= rx_numSymbol_2d						;
			rx_reMask_3d							<= rx_reMask_2d							;
			
			rx_c_framestructure_1d                  <= c_framestructure      ;
			rx_c_framestructure_2d                  <= rx_c_framestructure_1d   ;
			rx_c_framestructure_3d                  <= rx_c_framestructure_2d   ;
			
		end
	end

 

always@ (posedge clk_eth_xran_ul)begin
 if(~rst_eth_xran_n_ul)
   ext_scs_sel <= 4'd0 ;
 else if ((tx_u_pc_id <= 16'd15) & (tx_u_pc_id >= 16'd8) ) 
   ext_scs_sel <= 4'b1100 ;
 else 
   ext_scs_sel <= 4'd0 ;
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
		dl_input_hfn_pulse_1d  <=  dl_input_hfn_pulse_l;
		dl_input_hfn_pulse_2d  <=  dl_input_hfn_pulse_1d ;

    end
end
 

							
assign idl_time_cntr_cplane_in_valid = xran_demapper_cplane_valid  ;
assign idl_time_cntr_uplane_in_valid = xran_demapper_source_valid  ;


assign tx_u_pc_id			= ul_arb_frame_ctrl_data	[46:31]		;

assign tx_u_numPrb 			= ul_arb_frame_ctrl_data_1d [7:0]		;
assign tx_u_startPrb 		= ul_arb_frame_ctrl_data_1d [17:8] 		;
assign tx_u_rb 				= ul_arb_frame_ctrl_data_1d [18]		;
assign tx_u_sectionId 		= ul_arb_frame_ctrl_data_1d [30:19] 	;

assign tx_u_seq_id 			= ul_arb_frame_ctrl_data_1d [62:47]		;
assign tx_u_size			= ul_arb_frame_ctrl_data_1d [78:63]		;
assign tx_u_symbolid		= ul_arb_frame_ctrl_data_1d [84:79]		;
assign tx_u_slotID			= ul_arb_frame_ctrl_data_1d [90:85]		;
assign tx_u_subframeId		= ul_arb_frame_ctrl_data_1d [94:91]		;
assign tx_u_frameId			= ul_arb_frame_ctrl_data_1d [102:95]	;
assign tx_u_filterIndex		= ul_arb_frame_ctrl_data_1d [106:103]	;
assign tx_u_dataDirection 	= ul_arb_frame_ctrl_data_1d [107]		;

assign tx_u_scs_sel          = ul_arb_frame_ctrl_data_1d[111:108] ;
assign tx_u_numberofsections = ul_arb_frame_ctrl_data_1d[119:112] ; 

assign pusch_metadata = {coupling_pusch_tx_u_numberofsections,coupling_pusch_tx_u_scs_sel,coupling_pusch_tx_u_dataDirection, coupling_pusch_tx_u_filterIndex, coupling_pusch_tx_u_frameId, coupling_pusch_tx_u_subframeId, coupling_pusch_tx_u_slotID, coupling_pusch_tx_u_symbolid, coupling_pusch_tx_u_size, 
coupling_pusch_tx_u_seq_id, coupling_pusch_tx_u_pc_id, coupling_pusch_tx_u_sectionId, coupling_pusch_tx_u_rb ,coupling_pusch_tx_u_startPrb, coupling_pusch_tx_u_numPrb};

assign prach_metadata = {coupling_prach_tx_u_numberofsections,coupling_prach_tx_u_scs_sel,coupling_prach_tx_u_dataDirection, coupling_prach_tx_u_filterIndex, coupling_prach_tx_u_frameId, coupling_prach_tx_u_subframeId, coupling_prach_tx_u_slotID, coupling_prach_tx_u_symbolid, coupling_prach_tx_u_size, 
coupling_prach_tx_u_seq_id, coupling_prach_tx_u_pc_id, coupling_prach_tx_u_sectionId, coupling_prach_tx_u_rb ,coupling_prach_tx_u_startPrb, coupling_prach_tx_u_numPrb};  
    
assign ul_request = pusch_arbiter_request ;             

assign oran_rx_cplane.rx_c_dataDirection          = c_datadirection         ;       
assign oran_rx_cplane.rx_c_filterIndex            = rx_c_filterIndex        ;  
assign oran_rx_cplane.rx_c_frameId                = rx_c_frameId		    ;      
assign oran_rx_cplane.rx_c_subframeId             = rx_c_subframeId		    ;       
assign oran_rx_cplane.rx_c_slotID                 = rx_c_slotID				;           
assign oran_rx_cplane.rx_c_symbolid               = rx_c_symbolid			;     
assign oran_rx_cplane.rx_c_numberOfsections	      = rx_c_numberOfsections	;
assign oran_rx_cplane.rx_c_sectionId              = rx_c_sectionId			;    
assign oran_rx_cplane.rx_c_rb                     = rx_c_rb					;               
assign oran_rx_cplane.rx_c_symInc				  = rx_c_symInc				;
assign oran_rx_cplane.rx_c_startPrb               = rx_c_startPrb			;     
assign oran_rx_cplane.rx_c_numPrb                 = rx_c_numPrb				;           
assign oran_rx_cplane.rx_c_udCompHdr              = rx_c_udCompHdr			;
assign oran_rx_cplane.rx_sectionType              = rx_sectionType			;
assign oran_rx_cplane.rx_sec_hdr_valid            = rx_sec_hdr_valid		;   
                  
assign oran_rx_cplane.rx_timeOffset               = rx_timeOffset			;     
assign oran_rx_cplane.rx_frameStructure           = c_framestructure		;  
assign oran_rx_cplane.rx_cpLength                 = c_cplength				;        
assign oran_rx_cplane.rx_reMask                   = rx_reMask				;         
assign oran_rx_cplane.rx_numSymbol                = rx_numSymbol			;      
assign oran_rx_cplane.rx_frequencyOffset          = c_freqoffset			; 

             
assign oran_rx_uplane.rx_u_frameId      =         frame_id		;   
assign oran_rx_uplane.rx_u_subframeId   =         subframe_id	; 
assign oran_rx_uplane.rx_u_slotID       =         slot_id		;     
assign oran_rx_uplane.rx_u_symbolid     =         symbol_id		;   										
assign oran_rx_uplane.rx_u_startPrb     =         start_prb		;   
assign oran_rx_uplane.rx_u_numPrb       =         num_prb		;  

assign oran_rx_uplane_concat = oran_rx_uplane ;
assign oran_rx_cplane_concat = oran_rx_cplane ;   



 
always @(posedge clk_ecpri_tx)
	begin
	rst_mac_n    	<= rst_csr_n;	 	
	end
 
 
 
 ecpri_oran_top_timing_adapter_0 timing_adapter_3_0 (
        .clk               (clk_ecpri_tx),             												  		//   input,   width = 1,   clk.clk
        .reset_n           (rst_ecpri_n_6d),           															//   input,   width = 1, reset.reset_n
        .in_data           ({1'b0,avst_source_ul_data,o_mac_ptp_fp,o_mac_ptp_ts_req}),           			//   input,  width = 88,    in.data
        .in_valid          (avst_source_ul_valid),          												//   input,   width = 1,      .valid
        .in_ready          (avst_source_ul_ready),          												//  output,   width = 1,      .ready
        .in_startofpacket  (avst_source_ul_startofpacket),  												//   input,   width = 1,      .startofpacket
        .in_endofpacket    (avst_source_ul_endofpacket),    												//   input,   width = 1,      .endofpacket
        .in_empty          ({1'b0,avst_source_ul_empty}),        											  //   input,   width = 4,      .empty
        .out_data          ({data_dummy_bit,avst_sink_sc_fifo_data,tx_ptp_fp_fifo_in,tx_ptp_ts_req_fifo_in}),    //  output,  width = 88,   out.data
        .out_valid         (avst_sink_sc_fifo_valid),         												//  output,   width = 1,      .valid
        .out_ready         (avst_sink_sc_fifo_ready),         												//   input,   width = 1,      .ready
        .out_startofpacket (avst_sink_sc_fifo_startofpacket), 												//  output,   width = 1,      .startofpacket
        .out_endofpacket   (avst_sink_sc_fifo_endofpacket),   												//  output,   width = 1,      .endofpacket
        .out_empty         ({empty_dummy_bit,avst_sink_sc_fifo_empty})          												//  output,   width = 4,      .empty
    );


qsys_top_sc_fifo_0 u_ecpri_out_store_n_fwd_fifo (
   .clk               (clk_ecpri_tx),               //   input,   width = 1,          clk.clk
   .reset             (~rst_ecpri_n_6d),             //   input,   width = 1,    clk_reset.reset
   .csr_address       (),       				//   input,   width = 3,          csr.addres
   .csr_read          (),          				//   input,   width = 1,             .read
   .csr_write         (),         				//   input,   width = 1,             .write
   .csr_readdata      (),      					//  output,  width = 32,             .readda
   .csr_writedata     (),     					//   input,  width = 32,             .writed
   .almost_full_data  (),  						//  output,   width = 1,  almost_full.data
   .almost_empty_data (), 						//  output,   width = 1, almost_empty.data
   .in_data           ({data_dummy_bit,avst_sink_sc_fifo_data,tx_ptp_fp_fifo_in,tx_ptp_ts_req_fifo_in}),           //   input,  width = 88,           in.data
   .in_valid          (avst_sink_sc_fifo_valid),   //   input,   width = 1,             .valid
   .in_ready          (avst_sink_sc_fifo_ready),   //  output,   width = 1,             .ready
   .in_startofpacket  (avst_sink_sc_fifo_startofpacket),  //   input,   width = 1,             .starto
   .in_endofpacket    (avst_sink_sc_fifo_endofpacket),   //   input,   width = 1,             .endofp
   .in_empty          ({1'b0,avst_sink_sc_fifo_empty}),   //   input,   width = 3,             .empty
   .in_error          (),   								//   input,   width = 1,             .error
   .out_data          ({data_dummy_bit_0,avst_source_sc_fifo_data,tx_ptp_fp_fifo_out,tx_ptp_ts_req_fifo_out}),          	//  output,  width = 88,          out.data
   .out_valid         (avst_source_sc_fifo_valid),         	//  output,   width = 1,             .valid
   .out_ready         (avst_source_sc_fifo_ready),         	//   input,   width = 1,             .ready
   .out_startofpacket (avst_source_sc_fifo_startofpacket), 			//  output,   width = 1,             .starto
   .out_endofpacket   (avst_source_sc_fifo_endofpacket),   		//  output,   width = 1,             .endofp
   .out_empty         ({empty_dummy_bit_0,avst_source_sc_fifo_empty}),         	//  output,   width = 3,             .empty
   .out_error         ()          							//  output,   width = 1,             .error
);



// ecpri instantiation             
ecpri_hwtcl_top ecpri_ip_inst (
		.mac_clk_tx                                     (clk_ecpri_tx),                       //   input,   width = 1,   mac_clk_tx.clk
		.mac_clk_rx                                     (clk_ecpri_rx),                       //   input,   width = 1,   mac_clk_rx.clk
		.clk_tx                                         (clk_eth_xran_ul),                    //   input,   width = 1,   clk_tx.clk
		.clk_rx                                         (clk_eth_xran_dl),                    //   input,   width = 1,   clk_rx.clk
		.clk_csr                                        (clk_csr),                            //   input,   width = 1,   clk_csr.clk
		
        //External ST Sink Clk
        .ext_sink_clk                                   (clk_ecpri_tx),                       //   input,   width = 1,   ext_sink_clk.clk
		
        .rst_tx_n                                       (rst_eth_n_ul_6d_dup1),               //   rst_eth_xran_n_ul_3d  //   input,   width = 1, rst_tx_n.reset
		.rst_rx_n                                       (rst_eth_n_dl_6d_dup2),               //   input,   width = 1, rst_rx_n.reset
		.rst_csr_n                                      (rst_csr_n),                          //   input,   width = 1, rst_csr_n.reset
	
        //eCPRI CSR
        .csr_address                                    ({6'b0,ecpri_csr_address}),                  //   input,  width = 16, csr.address
		.csr_write                                      (ecpri_csr_write),                    //   input,   width = 1, .write
		.csr_writedata                                  (ecpri_csr_writedata),                //   input,  width = 32, .writedata
		.csr_read                                       (ecpri_csr_read),                     //   input,   width = 1, .read
		.csr_readdata                                   (ecpri_csr_readdata),                 //  output,  width = 32, .readdata
		.csr_readdatavalid                              (ecpri_csr_readdatavalid),            //  output,   width = 1, .readdatavalid
		.csr_waitrequest                                (ecpri_csr_waitrequest),              //  output,   width = 1, .waitrequest
		
        // eCPRI IP - Output to Ethernet
        .mac_source_valid                               (avst_source_ul_valid),                                          //  output,   width = 1,  mac_source.valid
		.mac_source_data                                (avst_source_ul_data),                                           //  output,  width = 64,  .data
		.mac_source_sop                                 (avst_source_ul_startofpacket),                                  //  output,   width = 1,  .startofpacket
		.mac_source_eop                                 (avst_source_ul_endofpacket),                                    //  output,   width = 1,  .endofpacket
		.mac_source_empty                               (avst_source_ul_empty),                                          //  output,   width = 3,  .empty
		.mac_source_error                               (),                                                              //  output,   width = 1,  .error
		.mac_source_ready                               (avst_source_ul_ready & rx_pcs_ready_2d ),                        //   input,   width = 1,  .ready
		
        //eCPRI IP - Input from ORAN IP - Mapper IF
        .avst_sink_valid                                (ecpri_sink_valid),                                              //   input,   width = 1,  avst_sink.valid
		.avst_sink_data                                 (ecpri_sink_data),                                               //   input,  width = 64,  .data
		.avst_sink_sop                                  (ecpri_sink_sop),                                                //   input,   width = 1,  .startofpacket
		.avst_sink_eop                                  (ecpri_sink_eop),                                                //   input,   width = 1,  .endofpacket
		.avst_sink_empty                                (ecpri_sink_empty),                                              //   input,   width = 3,  .empty
		.avst_sink_error                                (1'b0),                                                          //   input,   width = 1,  .error
		.avst_sink_ready                                (ecpri_sink_ready),                                              //  output,   width = 1,  .ready
		
        //eCPRI IP - Output to ORAN IP - Demapper IF output
        .avst_source_valid                              (oran_demapper_valid),                                           //  output,   width = 1,          avst_source.valid
		.avst_source_data                               (oran_demapper_data),                                            //  output,  width = 64,          .data
		.avst_source_sop                                (oran_demapper_sop),                                             //  output,   width = 1,          .startofpacket
		.avst_source_eop                                (oran_demapper_eop),                                             //  output,   width = 1,          .endofpacket
		.avst_source_empty                              (oran_demapper_empty),                                           //  output,   width = 3,          .empty
		.avst_source_error                              (oran_demapper_error),                                           //  output,   width = 1,  //upd   .error
		
        //eCPRI IP - Input from Ethernet - Demapper IF Input
        .mac_sink_valid                                 (avst_sink_dl_valid),                                            //   input,   width = 1,           mac_sink.valid
		.mac_sink_data                                  (avst_sink_dl_data),                                             //   input,  width = 64,          .data
		.mac_sink_sop                                 	(avst_sink_dl_startofpacket),                                    //   input,   width = 1,          .startofpacket
		.mac_sink_eop                                   (avst_sink_dl_endofpacket),                                      //   input,   width = 1,          .endofpacket
		.mac_sink_empty                                 (avst_sink_dl_empty),                                            //   input,   width = 3,          .empty
		.mac_sink_error                                 (avst_sink_dl_error),                                            //   input,   width = 6,          .error
		.mac_sink_ready                                 (avst_sink_dl_ready),                                            //  output,   width = 1,          .ready
		
        //External ST Sink - Interface - Non ecpri pkts (cm or ptp) - ext_sink_clk
        .ext_sink_0_valid                               (ecpri_ext_sink_valid),                                          //   input,   width = 1,    ext_sink.valid
		.ext_sink_0_data                                (ecpri_ext_sink_data),                                           //   input,  width = 64,    .data
		.ext_sink_0_sop                                 (ecpri_ext_sink_sop),                                            //   input,   width = 1,    .startofpacket
		.ext_sink_0_eop                                 (ecpri_ext_sink_eop),                                            //   input,   width = 1,    .endofpacket
		.ext_sink_0_empty                               (ecpri_ext_sink_empty),                                          //   input,   width = 3,    .empty
		.ext_sink_0_error                               (ecpri_ext_sink_error),                                          //   input,   width = 1,    .error
		.ext_sink_0_ready                               (ecpri_ext_sink_ready),                                          //  output,   width = 1,    .ready
		
        //External ST Source - Interface - ext_sink_clk                                                                  
        .ext_source_valid                               (ecpri_ext_source_valid),                                        //  output,   width = 1,     ext_source.valid
		.ext_source_data                                (ecpri_ext_source_data),                                         //  output,  width = 64,    .data
		.ext_source_sop                                 (ecpri_ext_source_sop),                                          //  output,   width = 1,    .startofpacket
		.ext_source_eop                                 (ecpri_ext_source_eop),                                          //  output,   width = 1,    .endofpacket
		.ext_source_empty                               (ecpri_ext_source_empty),                                        //  output,   width = 3,    .empty
		.ext_source_error                               (ecpri_ext_source_error),                                        //  output,   width = 6,    .error
		
        //Interrupt
        .err_interrupt                                  (),                                                              //  output,   width = 1,                                  err_interrupt.conduit
		
        //Sideband - Output signals to ORAN                                                                                                       
        .source_pc_id                                   (ecpri_source_pc_id),                                            //  output,  width = 32,                                   source_pc_id.conduit
		.source_seq_id                                  (ecpri_source_seq_id),                                           //  output,  width = 32,                                  source_seq_id.conduit
		.source_rtc_id                                  (ecpri_source_rtc_id),                                           //  output,  width = 16,                                  source_rtc_id.conduit
		                                                                                                         
        //Header Information - Output as conduit                                                                                                   
        .source_msg_type                                (),                                                             //  output,   width = 8,                                source_msg_type.conduit
		.source_mem_acc_id                              (),                                                             //  output,   width = 8,                              source_mem_acc_id.conduit
		.source_op_type                                 (),                                                             //  output,   width = 8,                                 source_op_type.conduit
		.source_element_id                              (),                                                             //  output,  width = 16,                              source_element_id.conduit
		.source_address                                 (),                                                             //  output,  width = 48,                                 source_address.conduit
		.source_length                                  (),                                                             //  output,  width = 16,                                  source_length.conduit
		.source_reset_id                                (),                                                             //  output,  width = 16,                                source_reset_id.conduit
		.source_reset_op                                (),                                                             //  output,   width = 8,                                source_reset_op.conduit
		.source_event_id                                (),                                                             //  output,   width = 8,                                source_event_id.conduit
		.source_event_type                              (),                                                             //  output,   width = 8,                              source_event_type.conduit
		.source_notif                                   (),                                                             //  output,   width = 8,                                   source_notif.conduit
		.source_concatenation                           (),                                                             //  output,   width = 1,                           source_concatenation.conduit
		                                                                                                              
        //Sideband - Input from ORAN                                                                                    
        .sink_pc_id                                     ({16'b0,oran_source_pc_id}),                                    //   input,  width = 32,                                     sink_pc_id.conduit
		.sink_seq_id                                    ({16'b0,oran_source_seq_id}),                                   //   input,  width = 32,                                    sink_seq_id.conduit
		.sink_rtc_id                                    (oran_source_rtc_id),                                           //   input,  width = 16,                                    sink_rtc_id.conduit
		
        //Sideband - Input from ORAN
        .sink_concatenation                             (1'd0),                                                          //   input,   width = 1,                             sink_concatenation.conduit
		.sink_msg_type                                  (8'd0),                                                          //   input,   width = 8,                                  sink_msg_type.conduit
		.sink_mem_acc_id                                (8'd0),                                                          //   input,   width = 8,                                sink_mem_acc_id.conduit
		.sink_op_type                                   (8'd0),                                                          //   input,   width = 8,                                   sink_op_type.conduit
		.sink_element_id                                (16'd0),                                                         //   input,  width = 16,                                sink_element_id.conduit
		.sink_address                                   (48'd0),                                                         //   input,  width = 48,                                   sink_address.conduit
		.sink_length                                    (16'd0),                                                         //   input,  width = 16,                                    sink_length.conduit
		.sink_reset_id                                  (16'd0),                                                         //   input,  width = 16,                                  sink_reset_id.conduit
		.sink_reset_op                                  (8'd0),                                                          //   input,   width = 8,                                  sink_reset_op.conduit
		.sink_event_id                                  (8'd0),                                                          //   input,   width = 8,                                  sink_event_id.conduit
		.sink_event_type                                (8'd0),                                                          //   input,   width = 8,                                sink_event_type.conduit
		                                                                                                            
        // clk_tx from MAC Stable - ready signal  - from ethernet     // check whether it is for status                                                             
        .tx_lanes_stable                                (tx_lanes_stable),                                               //   input,   width = 1,                                tx_lanes_stable.conduit
		
        // clk_rx from MAC Stable - ready signal - from ethernet                                                                   
        .rx_pcs_ready                                   (rx_pcs_ready),                                                  //   input,   width = 1,                                   rx_pcs_ready.conduit
		
        //1 step ptp signals
        .ptp_offset_timestamp                           (),              //  output,  width = 16,                           ptp_offset_timestamp.conduit
		.ptp_offset_correction_field                    (),              //  output,  width = 16,                    ptp_offset_correction_field.conduit
		.ptp_timestamp_insert                           (),              //  output,   width = 1,                           ptp_timestamp_insert.conduit
		.ptp_tx_etstamp_ins_ctrl_residence_time_update  (),              //  output,   width = 1,  ptp_tx_etstamp_ins_ctrl_residence_time_update.conduit
														  
		.tx_etstamp_ins_ctrl_timestamp_format           (),              //  output,   width = 1,           tx_etstamp_ins_ctrl_timestamp_format.conduit
		.tx_etstamp_ins_ctrl_residence_time_calc_format (),              //  output,   width = 1, tx_etstamp_ins_ctrl_residence_time_calc_format.conduit
		.tx_etstamp_ins_ctrl_offset_checksum_field      (),              //  output,  width = 16,      tx_etstamp_ins_ctrl_offset_checksum_field.conduit
		.tx_etstamp_ins_ctrl_offset_checksum_correction (),              //  output,  width = 16, tx_etstamp_ins_ctrl_offset_checksum_correction.conduit
		.tx_etstamp_ins_ctrl_ingress_timestamp_96b      (),              //  output,  width = 96,      tx_etstamp_ins_ctrl_ingress_timestamp_96b.conduit
		.tx_etstamp_ins_ctrl_checksum_zero              (),              //  output,   width = 1,              tx_etstamp_ins_ctrl_checksum_zero.conduit
		.tx_etstamp_ins_ctrl_checksum_correct           (),              //  output,   width = 1,           tx_etstamp_ins_ctrl_checksum_correct.conduit

		.ext_sink_0_tx_ingress_timestamp_96b_data       (),                                                              //   input,  width = 96,              ext_tx_ingress_timestamp_96b_data.conduit
		.ptp_tx_ingress_timestamp_96b_data              (),                                                              //  output,  width = 96,              ptp_tx_ingress_timestamp_96b_data.conduit
                                                                                                                                          
		// 2-step ptp signals                                                                                                       
		.ptp_timestamp_request_fingerprint              (o_mac_ptp_fp),                 //  output,   width = 22,              ptp_timestamp_request_fingerprint.conduit
		.ptp_timestamp_request_valid                    (o_mac_ptp_ts_req),             //  output,   width = 1,                    ptp_timestamp_request_valid.conduit
		.tx_egress_timestamp_96b_valid                  (i_mac_ptp_tx_ets_valid),       //   input,   width = 1,                  tx_egress_timestamp_96b_valid.conduit
		.tx_egress_timestamp_96b_data                   (i_mac_ptp_tx_ets),             //   input,  width = 96,                   tx_egress_timestamp_96b_data.conduit
		.tx_egress_timestamp_96b_fingerprint            (i_mac_ptp_tx_ets_fp),          //   input,   width = 22,            tx_egress_timestamp_96b_fingerprint.conduit
		.rx_ingress_timestamp_96b_valid                 (i_mac_ptp_rx_its_valid),       //   input,   width = 1,                 rx_ingress_timestamp_96b_valid.conduit
		.rx_ingress_timestamp_96b_data                  (i_mac_ptp_rx_its),             //   input,  width = 96,                  rx_ingress_timestamp_96b_data.conduit
		.ext_sink_0_timestamp_request_valid				(i_ext_ptp_ts_req),
		.ext_sink_0_timestamp_request_fingerprint       (i_ext_ptp_fp),                 //   input,   width = 20,          ext_ptp_timestamp_request_fingerprint.conduit
		.ext_sink_0_tx_egress_timestamp_96b_valid       (o_ext_ptp_tx_ets_valid),       //  output,   width = 1,              ext_tx_egress_timestamp_96b_valid.conduit
		.ext_sink_0_tx_egress_timestamp_96b_data        (o_ext_ptp_tx_ets),             //  output,  width = 96,               ext_tx_egress_timestamp_96b_data.conduit
		.ext_sink_0_tx_egress_timestamp_96b_fingerprint (o_ext_ptp_tx_ets_fp),          //  output,   width = 20,        ext_tx_egress_timestamp_96b_fingerprint.conduit
		.ext_rx_ingress_timestamp_96b_data              (o_ext_ptp_rx_its),             //  output,  width = 96,              ext_rx_ingress_timestamp_96b_data.conduit

		//TOD signals
		.rx_tod_time_of_day_96b_data                    (),                                 //   input,  width = 96,                    rx_tod_time_of_day_96b_data.conduit
		.tx_tod_time_of_day_96b_data                    (),                                 //   input,  width = 96,                    tx_tod_time_of_day_96b_data.conduit
		
		.sink_pkt_size                                  (sink_pkt_size),     
		.sink_pkt_checksum                              (),
		
        // C/U Plane Pkt Signal
        .tx_transport_c_u                               (tx_transport_c_u),                                        //   input,   width = 1,                               tx_transport_c_u.conduit
		.rx_transport_c_u                               (rx_transport_c_u)                                        //  output,   width = 1,                               rx_transport_c_u.conduit
		/* .tx_queue_0_fifo_full                           (),                                                        //  output,   width = 1,                           tx_queue_0_fifo_full.conduit
		.tx_queue_1_fifo_full                           (),                                                        //  output,   width = 1,                           tx_queue_1_fifo_full.conduit
		.tx_queue_2_fifo_full                           (),                                                        //  output,   width = 1,                           tx_queue_2_fifo_full.conduit
		.tx_queue_3_fifo_full                           (),                                                        //  output,   width = 1,                           tx_queue_3_fifo_full.conduit
		.tx_queue_4_fifo_full                           (),                                                        //  output,   width = 1,                           tx_queue_4_fifo_full.conduit
		.tx_queue_5_fifo_full                           (),                                                        //  output,   width = 1,                           tx_queue_5_fifo_full.conduit
		.tx_queue_6_fifo_full                           (),                                                        //  output,   width = 1,                           tx_queue_6_fifo_full.conduit
		.tx_queue_7_fifo_full                           ()                                                         //  output,   width = 1,                           tx_queue_7_fifo_full.conduit
 */
	);
	
oran_wrapper u_oran_wrapper(
	.clk_tx								(clk_eth_xran_ul),                          
	.clk_rx								(clk_eth_xran_dl),	                          
	.clk_csr							(clk_csr),                         
	.rst_tx_n							(rst_eth_n_ul_6d_dup2 & rst_eth_soft_n_6d_dup3),                        
	.rst_rx_n							(rst_eth_n_dl_6d_dup3 & rst_eth_soft_n_6d_dup3),                        
	.rst_csr_n							(rst_csr_n),                       
	.avst_sink_u_valid					(ul_arb_source_valid_out),               
	.avst_sink_u_data					({ul_arb_source_data_out[15:0],ul_arb_source_data_out[31:16],ul_arb_source_data_out[47:32],ul_arb_source_data_out[63:48],ul_arb_source_data_out[79:64],ul_arb_source_data_out[95:80],ul_arb_source_data_out[111:96],ul_arb_source_data_out[127:112]}),                
	.avst_sink_u_startofpacket			(ul_arb_source_sop_out),       
	.avst_sink_u_endofpacket			(ul_arb_source_eop_out),         
	.avst_sink_u_ready					(ul_arb_source_ready),               
	.avst_sink_u_empty					(3'd0),               
	.avst_sink_c_valid					(1'd0),               
	.avst_sink_c_startofpacket			(1'd0),       
	.avst_sink_c_endofpacket			(1'd0),         
	.avst_sink_c_ready					(),               
	.avst_sink_c_ext_valid				(1'd0),           
	.avst_sink_c_ext_data				(64'd0),            
	.avst_sink_c_ext_startofpacket		(1'd0),   
	.avst_sink_c_ext_endofpacket		(1'd0),     
	.avst_sink_c_ext_empty				(3'd0),           
	.avst_sink_c_ext_ready				(),           
	.avst_source_valid					(ecpri_sink_valid),	               
	.avst_source_data					(ecpri_sink_data),                
	.avst_source_startofpacket			(ecpri_sink_sop),       
	.avst_source_endofpacket			(ecpri_sink_eop),         
	.avst_source_empty					(ecpri_sink_empty),               
	.avst_source_ready					(ecpri_sink_ready),               
	.avst_source_u_valid				(xran_demapper_source_valid),             
	.avst_source_u_data					(xran_demapper_source_data),              
	.avst_source_u_startofpacket		(xran_demapper_source_startofpacket),     
	.avst_source_u_endofpacket			(xran_demapper_source_endofpacket),       
	.avst_source_u_empty				(),             
	.avst_source_u_error				(),             
	.avst_source_c_valid				(xran_demapper_cplane_valid),             
	.avst_source_c_startofpacket		(xran_demapper_cplane_startofpacket),     
	.avst_source_c_endofpacket			(xran_demapper_cplane_endofpacket),       
	.avst_source_c_error				(xran_demapper_cplane_error),             
	.avst_source_c_ext_valid			(avst_source_c_ext_valid),	         
	.avst_source_c_ext_data				(avst_source_c_ext_data),          
	.avst_source_c_ext_startofpacket	(avst_source_c_ext_startofpacket), 
	.avst_source_c_ext_endofpacket		(avst_source_c_ext_endofpacket  ),   
	.avst_source_c_ext_empty			(avst_source_c_ext_empty        ),         
	.avst_source_c_ext_error			(avst_source_c_ext_error        ),         
	.avst_sink_valid					(oran_demapper_valid),                  
	.avst_sink_data						(oran_demapper_data),                    
	.avst_sink_startofpacket			(oran_demapper_sop),            
	.avst_sink_endofpacket				(oran_demapper_eop),              
	.avst_sink_empty					(oran_demapper_empty),                  
	.avst_sink_error					(oran_demapper_error),                  
	.csr_address						({6'b0,oran_csr_address}),                           
	.csr_write							(oran_csr_write),                               
	.csr_writedata						(oran_csr_writedata),                       
	.csr_readdata						(oran_csr_readdata),                         
	.csr_read							(oran_csr_read),                                 
	.csr_readdatavalid					(oran_csr_readdatavalid), 	               
	.csr_waitrequest					(oran_csr_waitrequest),                   
	.irq								(),                             
	.tx_c_size	  						(16'b0),                       
	.tx_c_dataDirection					(1'b0),               
	.tx_c_filterIndex					(4'b0),                 
	.tx_c_frameId						(8'b0),                     
	.tx_c_subframeId					(4'b0),                  
	.tx_c_slotID						(6'b0),                      
	.tx_c_symbolid						(6'b0),                    
	.tx_c_sectionId						(12'b0),                  
	.tx_c_rb							(1'b0),                          
	.tx_c_startPrb						(10'b0),                   
	.tx_c_numPrb						(8'b0),                      
	.tx_c_udCompHdr						(8'b0),                   
	.tx_sectionType						(8'b0),                   
	.tx_ext_sectionType					(8'b0),               
	.tx_timeOffset						(16'b0),                   
	.tx_frameStructure					(8'b0),                
	.tx_cpLength						(16'b0),                     
	.tx_reMask							(12'b0),                       
	.tx_numSymbol						(4'b0),                     
	.tx_ef								(1'b0),                            
	.tx_frequencyOffset					(24'b0),              
	.tx_beamid							(15'b0),        	               
	.tx_u_size							(tx_u_size), 
    .tx_u_numberofsection               (tx_u_numberofsections),	
	.tx_u_dataDirection					(tx_u_dataDirection),              
	.tx_u_filterIndex					(tx_u_filterIndex),                
	.tx_u_frameId						(tx_u_frameId),                    
	.tx_u_subframeId					(tx_u_subframeId),                 
	.tx_u_slotID						(tx_u_slotID),                     
	.tx_u_symbolid						(tx_u_symbolid),                   
	.tx_u_sectionId						(tx_u_sectionId),                  
	.tx_u_rb							(tx_u_rb),                         
	.tx_u_startPrb						(tx_u_startPrb),                   
	.tx_u_numPrb						(tx_u_numPrb),                     
	.tx_u_udCompHdr						(8'b0),                  
	.ext_scs_sel						(tx_u_scs_sel),                     
	.tx_transport_c_u					(tx_transport_c_u),                
	.tx_time_of_day_96b					(oran_tx_time_of_day_96b_data),              
	.rx_c_dataDirection					(c_datadirection),              
	.rx_c_filterIndex					(rx_c_filterIndex),                
	.rx_c_frameId						(rx_c_frameId),                    
	.rx_c_subframeId					(rx_c_subframeId),                 
	.rx_c_slotID						(rx_c_slotID),                     
	.rx_c_symbolid						(rx_c_symbolid),                   
	.rx_c_numberOfsections				(rx_c_numberOfsections),           
	.rx_c_sectionId						(rx_c_sectionId),                  
	.rx_c_rb							(rx_c_rb),                         
	.rx_c_symInc						(rx_c_symInc),                     
	.rx_c_startPrb						(rx_c_startPrb),                   
	.rx_c_numPrb						(rx_c_numPrb),                     
	.rx_c_udCompHdr						(rx_c_udCompHdr),                  
	.rx_sec_hdr_valid					(rx_sec_hdr_valid),                
	.rx_sectionType						(rx_sectionType),                  
	.rx_ext_sectionType					(),              
	.rx_timeOffset						(rx_timeOffset),                   
	.rx_frameStructure					(c_framestructure),               
	.rx_cpLength						(c_cplength),                     
	.rx_reMask							(rx_reMask),                       
	.rx_numSymbol						(rx_numSymbol),                    
	.rx_frequencyOffset					(c_freqoffset),              
	.rx_ef								(),                           
	.rx_beamid							(),                       
	.rx_u_dataDirection					(),              
	.rx_u_filterIndex					(),                
	.rx_u_frameId						(frame_id),                    
	.rx_u_subframeId					(subframe_id),                 
	.rx_u_slotID						(slot_id),                     
	.rx_u_symbolid						(symbol_id),                   
	.rx_u_sectionId						(),                  
	.rx_u_rb							(),                         
	.rx_u_startPrb						(start_prb),                   
	.rx_u_numPrb						(num_prb),                     
	.rx_u_udCompHdr						(),                  
	.rx_transport_c_u					(rx_transport_c_u),                
	.rx_time_of_day_96b					(oran_rx_time_of_day_96b_data),              
	.tx_c_rtc_id						(16'b0),                     
	.tx_c_seq_id						(16'b0),                     
	.tx_u_pc_id							(tx_u_axc_id),                      
	.tx_u_seq_id						(tx_u_seq_id),                     
	.sink_pc_id							(ecpri_source_pc_id [15:0]),                       
	.sink_rtc_id						(ecpri_source_rtc_id [15:0]),                     
	.sink_seq_id						(ecpri_source_seq_id [15:0]),                     
	.rx_c_rtc_id						(rx_c_rtc_id),	                     
	.rx_c_seq_id						(),                     
	.rx_u_pc_id							(xran_demapper_source_channel),                      
	.rx_u_seq_id						(),                     
	.source_pc_id						(oran_source_pc_id),                    
	.source_rtc_id						(oran_source_rtc_id),                   
	.source_seq_id						(oran_source_seq_id),                   
	.source_pkt_size					(sink_pkt_size),                 
	.tx_lanes_stable					(tx_lanes_stable),                 
	.rx_pcs_ready						(rx_pcs_ready),
	.fh_comp_csr_address				({12'b0,fh_comp_csr_address}      ),      
    .fh_comp_csr_write					(fh_comp_csr_write        ),        
    .fh_comp_csr_writedata				(fh_comp_csr_writedata    ),    
    .fh_comp_csr_readdata				(fh_comp_csr_readdata     ),     
    .fh_comp_csr_read					(fh_comp_csr_read         ),         
    .fh_comp_csr_readdatavalid			(fh_comp_csr_readdatavalid),
    .fh_comp_csr_waitrequest			(fh_comp_csr_waitrequest  ),  
	.decomp_fs_offset                   (decomp_fsoffset),//('d8192),
	.comp_fs_offset						(comp_fsoffset	)//('d512)
	
);
	 
	 
cu_plane_coupling_top 
#(.PUSCH_NUM_OF_PHYSICAL_PORTS(2),
  .PRACH_NUM_OF_PHYSICAL_PORTS(2),
  .NUM_OF_CC(2),					
  .PUSCH_NUM_OF_EAXC_PER_PORT(4),	
  .PRACH_NUM_OF_EAXC_PER_PORT(4),
  .PUSCH_EAXC_ID_START(0),
  .PRACH_EAXC_ID_START(8)
  )				
u_cu_plane_coupling(
    .clk_eth                         (clk_eth_xran_ul)                                , // 390.625 MHz                         
    .rst_eth_n                       (rst_eth_n_ul_6d_dup2 & rst_eth_soft_n_6d_dup3)  ,                         
    .clk_dsp                         (clk_dsp)										  , //491.52 MHz                       
    .rst_dsp_n                       (rst_dsp_n_4d_dup1 & rst_dsp_soft_n_4d_dup1)     ,                       
    
	.pusch_avst_sink_valid           ({	coupling_pusch_avst_sink_valid_l2	,	coupling_pusch_avst_sink_valid_l1	}),
    .pusch_avst_sink_data            ({	coupling_pusch_avst_sink_data_l2	,	coupling_pusch_avst_sink_data_l1 	}),
    .pusch_avst_sink_channel         ({	coupling_pusch_avst_sink_channel_l2	,	coupling_pusch_avst_sink_channel_l1	}),
    .pusch_avst_sink_endofpacket     ({	coupling_pusch_avst_sink_eop_l2		,	coupling_pusch_avst_sink_eop_l1		}),
    .pusch_avst_sink_startofpacket   ({	coupling_pusch_avst_sink_sop_l2		,	coupling_pusch_avst_sink_sop_l1		}),
    
	.prach_avst_sink_valid           ({coupling_prach_avst_sink_valid_l2	,coupling_prach_avst_sink_valid_l1		}),
    .prach_avst_sink_data            ({coupling_prach_avst_sink_data_l2		,coupling_prach_avst_sink_data_l1		}),
    .prach_avst_sink_channel         ({coupling_prach_avst_sink_channel_l2	,coupling_prach_avst_sink_channel_l1	}),
    .prach_avst_sink_endofpacket     ({coupling_prach_avst_sink_eop_l2		,coupling_prach_avst_sink_eop_l1		}),
    .prach_avst_sink_startofpacket   ({coupling_prach_avst_sink_sop_l2		,coupling_prach_avst_sink_sop_l1		}),

// C Plane Input from ORAN IP
    .avst_sink_c_valid                (xran_demapper_cplane_valid_3d)                  ,        
    .avst_sink_c_endofpacket          (xran_demapper_cplane_endofpacket_3d)            ,
    .avst_sink_c_startofpacket        (xran_demapper_cplane_startofpacket_3d)          ,
	
	// C plane conduits data
	
    .rx_c_rtc_id                        (rx_rtc_id			     )							 , //rx_c_rtc_id eAxC Number from eCPRI IP. RU Port ID is considered as eAxC ID.     	
	.rx_c_dataDirection                 (c_datadirection_3d	     )							 ,              
	.rx_c_filterIndex					(rx_c_filterIndex_3d     )							 ,                   
	.rx_c_frameId						(rx_c_frameId_3d	     )							 ,                       
	.rx_c_subframeId					(rx_c_subframeId_3d	     )							 ,                    
	.rx_c_slotID						(rx_c_slotID_3d		     )							 ,                        
	.rx_c_symbolid						(rx_c_symbolid_3d	     )							 , // Start of symbol  
    .rx_c_numberOfsections		        (rx_c_numberOfsections_3d)						     ,
	.rx_c_symInc                        (rx_c_symInc_3d          )							 ,
	.rx_sec_hdr_valid                   (rx_sec_hdr_valid_3d     )							 ,
	.rx_c_sectionId						(rx_c_sectionId_3d	     )							 ,                     
	.rx_c_rb							(rx_c_rb_3d			     )							 ,                            
	.rx_c_startPrb						(rx_c_startPrb_3d	     )							 ,                      
	.rx_c_numPrb						(rx_c_numPrb_3d		     )							 ,            
	.rx_sectionType						(rx_sectionType_3d	     )							 ,                     
	.rx_numSymbol						(rx_numSymbol_3d	     )							 ,
	.rx_reMask                          (rx_reMask_3d		     )							 ,
	.rx_c_framestructure                (rx_c_framestructure_3d  )                           ,
	
	// Uplink PUSCH AV-Stream output from CU plane coupling at 390.625 MHz to ORAN IP
	.pusch_avst_source_valid                   (coupling_pusch_source_valid 			),
	.pusch_avst_source_data                    (coupling_pusch_source_data			    ),
	.pusch_avst_source_channel                 (coupling_pusch_source_channel		    ),
	.pusch_avst_source_ready                   (coupling_source_ready[0]    		    ),
	.pusch_avst_source_endofpacket             (coupling_pusch_source_endofpacket	    ),
	.pusch_avst_source_startofpacket           (coupling_pusch_source_startofpacket     ),	
	
	.prach_avst_source_valid                   (coupling_prach_avst_source_valid		 ),
	.prach_avst_source_data                    (coupling_prach_avst_source_data			 ),
	.prach_avst_source_channel                 (coupling_prach_avst_source_channel		 ),
	.prach_avst_source_ready                   (coupling_source_ready[1]                 ),
	.prach_avst_source_endofpacket             (coupling_prach_avst_source_endofpacket	 ),
	.prach_avst_source_startofpacket           (coupling_prach_avst_source_startofpacket ),	
    			
	// PUSCH conduits headers output from CU plane coupling at 390.625 MHz to ORAN IP
    .pusch_tx_u_size                (coupling_pusch_tx_u_size		  )	,                       
    .pusch_tx_u_dataDirection		(coupling_pusch_tx_u_dataDirection)	,              
    .pusch_tx_u_filterIndex  		(coupling_pusch_tx_u_filterIndex  )	,                
    .pusch_tx_u_frameId				(coupling_pusch_tx_u_frameId	  )	,                    
    .pusch_tx_u_subframeId			(coupling_pusch_tx_u_subframeId	  )	,               
    .pusch_tx_u_slotID				(coupling_pusch_tx_u_slotID		  )	,                   
    .pusch_tx_u_symbolid			(coupling_pusch_tx_u_symbolid	  )	,                 
    .pusch_tx_u_seq_id  			(coupling_pusch_tx_u_seq_id		  )	,                
    .pusch_tx_u_pc_id  				(coupling_pusch_tx_u_pc_id		  )	,                
    .pusch_tx_u_sectionId			(coupling_pusch_tx_u_sectionId	  )	,                
    .pusch_tx_u_rb					(coupling_pusch_tx_u_rb			  )	,                       
    .pusch_tx_u_startPrb			(coupling_pusch_tx_u_startPrb	  )	,                 
    .pusch_tx_u_numPrb				(coupling_pusch_tx_u_numPrb		  )	,
	.pusch_tx_u_scs_sel             (coupling_pusch_tx_u_scs_sel         ),
	.pusch_tx_u_numberofsections    (coupling_pusch_tx_u_numberofsections),
	
	// PRACH conduits headers output from CU plane coupling at 390.625 MHz to ORAN IP
    .prach_tx_u_size            (coupling_prach_tx_u_size		  )	   ,                       
    .prach_tx_u_dataDirection	(coupling_prach_tx_u_dataDirection)	   ,              
    .prach_tx_u_filterIndex  	(coupling_prach_tx_u_filterIndex  )	   ,                
    .prach_tx_u_frameId			(coupling_prach_tx_u_frameId	)	   ,                    
    .prach_tx_u_subframeId		(coupling_prach_tx_u_subframeId	)	   ,                 
    .prach_tx_u_slotID			(coupling_prach_tx_u_slotID		)	   ,                     
    .prach_tx_u_symbolid		(coupling_prach_tx_u_symbolid	)	   ,                  
    .prach_tx_u_seq_id  		(coupling_prach_tx_u_seq_id		)	   ,                 
    .prach_tx_u_pc_id  			(coupling_prach_tx_u_pc_id		)	   ,                  
    .prach_tx_u_sectionId		(coupling_prach_tx_u_sectionId	)	   ,                  
    .prach_tx_u_rb				(coupling_prach_tx_u_rb			)	   ,                         
    .prach_tx_u_startPrb		(coupling_prach_tx_u_startPrb	)	   ,                   
    .prach_tx_u_numPrb			(coupling_prach_tx_u_numPrb		)	   ,
	.prach_tx_u_scs_sel         (coupling_prach_tx_u_scs_sel         ),
	.prach_tx_u_numberofsections(coupling_prach_tx_u_numberofsections),

	.dl_ul_bw_config            ({bw_config_cc2,bw_config_cc1  }) 	   , // Bit[7] - 0/1 - Enable/Disable  // [3:0] - 1010/1101 - 60/100 MHz
	
	.pusch_arbiter_request      (pusch_arbiter_request)                                     ,
	.prach_arbiter_request      (prach_arbiter_request)                                     ,
	
	.status_clear               (coupling_err_clear),                
	.status_register_1       	(pusch_cu_coupling_status),          
	.status_register_2       	(prach_cu_coupling_status),
	.IP_Version_Register       	(cu_coupling_version),               
	.short_long_prach_select    (short_long_prach_select),           
	.prach_timing_reference     (coupling_prach_timing_ref),
	.pusch_timing_reference		(coupling_pusch_timing_ref),
	.statistics_register        (coupling_statistics_register),
	.ul_start                   (ul_start_pulse_latch)

);

/*      
uplink_arbiter u_uplink_arbiter
(
   .clk_in                           (clk_eth_xran_ul					        ),
   .rst_in_n                         (rst_eth_n_ul_6d_dup3				        ),//rst_eth_xran_n_ul_4d
																			    
   .ul_sink_valid                    (coupling_pusch_source_valid			    ),
   .ul_sink_data                     (coupling_pusch_source_data			    ),
   .ul_sink_channel                  (coupling_pusch_source_channel			    ),
   .ul_sink_sop                      (coupling_pusch_source_startofpacket	    ),
   .ul_sink_eop                      (coupling_pusch_source_endofpacket		    ),
   .ul_sink_ready                    (coupling_source_ready				        ),
																			    
   .ul_frame_ctrl_data               (pusch_metadata				            ), //xran_mapper_sts_frame_dout
   
   .prach_sink_valid                 (coupling_prach_avst_source_valid			),
   .prach_sink_data                  (coupling_prach_avst_source_data			),
   .prach_sink_channel               (coupling_prach_avst_source_channel		),
   .prach_sink_sop                   (coupling_prach_avst_source_startofpacket	),
   .prach_sink_eop                   (coupling_prach_avst_source_endofpacket	),
   .prach_sink_ready                 (prach_avst_source_ready			),  
   .prach_frame_ctrl_data            (prach_metadata					),

   .ul_arb_source_valid              (ul_arb_source_valid_out			),
   .ul_arb_source_data               (ul_arb_source_data_out			),
   .ul_arb_source_channel            (ul_arb_source_channel_out			),
   .ul_arb_source_sop                (ul_arb_source_sop_out				),
   .ul_arb_source_eop                (ul_arb_source_eop_out				),
   .ul_arb_source_ready              (ul_arb_source_ready				),
   
   .ul_arb_frame_ctrl_data           (ul_arb_frame_ctrl_data			),
   
   .ul_arb_frame_ctrl_vld            (                  				),
   .ul_arb_prb_ctrl_data             (									),
   .ul_arb_prb_ctrl_vld              (									),
   .prach_req                        (prach_arbiter_request			    ), //prach_req
   .ul_req                           (ul_request  						), //ul_request
   .output_fifo_full				 (ul_arb_output_fifo_full			)
);
 */

uplink_arbiter
   #(
      .NUM_INTERFACES (2), //pusch+prach+srs
      .DATAWIDTH      (128),
      .METADATAWIDTH  (120),
      .CSR_DATAWIDTH  (32),
      .CSR_ADDRWIDTH  (3)
   ) uplink_arbiter_inst
   (
      .arb_clk                   (clk_eth_xran_ul),		         //input 
      .arb_rst_n                 (rst_eth_n_ul_6d_dup3	),       //input
      .csr_clk                   (clk_csr),                     //input
      .csr_rst_n                 (rst_csr_n),                   //input

      .avst_sink_valid           ({coupling_prach_avst_source_valid,coupling_pusch_source_valid		}	),       //input  [NUM_INTERFACES-1:0]                      
      .avst_sink_data            ({coupling_prach_avst_source_data,coupling_pusch_source_data		}	),       //input  [NUM_INTERFACES*DATAWIDTH-1:0]            
      .avst_sink_sop             ({coupling_prach_avst_source_startofpacket,coupling_pusch_source_startofpacket	}),       //input  [NUM_INTERFACES-1:0]                      
      .avst_sink_eop             ({coupling_prach_avst_source_endofpacket,coupling_pusch_source_endofpacket}	),       //input  [NUM_INTERFACES-1:0]                      
      .avst_sink_empty           (8'b0	),       //input  [NUM_INTERFACES*$clog2(DATAWIDTH>>3)-1:0] 
      .avst_sink_ready           (coupling_source_ready				  						),       //output [NUM_INTERFACES-1:0]                      

      .metadata_in               ({prach_metadata,pusch_metadata}),      //input  [NUM_INTERFACES*METADATAWIDTH-1:0]        

/*       .csr_address               (up_arbiter_csr_address  ),    //input  [CSR_ADDRWIDTH-1:0]                       
      .csr_write                 (up_arbiter_csr_write    ),    //input                                            
      .csr_read                  (up_arbiter_csr_read     ),    //input                                            
      .csr_writedata             (up_arbiter_csr_writedata),    //input  [CSR_DATAWIDTH-1:0]                       
      .csr_readdata              (up_arbiter_csr_readdata ),    //output [CSR_DATAWIDTH-1:0] */

	   .arbiter_ctrl			(arbiter_cfg_ctrl),									
	   .arbiter_rdy				(arbiter_cfg_ready_i),                                        
	   .arbiter_prio1			({28'd0,arbiter_prio1_prach_priority,arbiter_prio1_pusch_priority}),                               
	   .arbiter_prio2			('d0),
	   .arbiter_prio3			('d0),	  

      .block_available           ({prach_arbiter_request,ul_request}),    //input  [NUM_INTERFACES-1:0]                      

      .avst_src_valid            (ul_arb_source_valid_out),              //output                                           
      .avst_src_data             (ul_arb_source_data_out),               //output [DATAWIDTH-1:0]                           
      .avst_src_sop              (ul_arb_source_sop_out),       //output                                           
      .avst_src_eop              (ul_arb_source_eop_out),       //output                                           
      .avst_src_empty            (),                            //output [$clog2(DATAWIDTH>>3)-1:0]                
      .avst_src_ready            (ul_arb_source_ready),         //input  

      .metadata_out              (ul_arb_frame_ctrl_data)      //output [METADATAWIDTH-1:0]                       
   );
   


// for c plane
ul_rtc_id_config u_ul_rtc_id_config(

	.clk_eth				(clk_eth_xran_dl		),
	.rst_eth_n				(rst_eth_n_dl_4d_dup1 & rst_eth_soft_n_dl_4d),

	.ul_axc_id0				(ul_eaxc_id0				),
	.ul_axc_id1				(ul_eaxc_id1				),
	.ul_axc_id2				(ul_eaxc_id2				),
	.ul_axc_id3				(ul_eaxc_id3				),
	.ul_axc_id4				(ul_eaxc_id4				),
	.ul_axc_id5				(ul_eaxc_id5				),
	.ul_axc_id6				(ul_eaxc_id6				),
	.ul_axc_id7				(ul_eaxc_id7				),
	.ul_axc_id8			    (ul_eaxc_id8				),
	.ul_axc_id9			    (ul_eaxc_id9				),
	.ul_axc_id10		 	(ul_eaxc_id10			),
	.ul_axc_id11		 	(ul_eaxc_id11			),
	.ul_axc_id12		 	(ul_eaxc_id12			),
	.ul_axc_id13		 	(ul_eaxc_id13			),
	.ul_axc_id14		 	(ul_eaxc_id14			),
	.ul_axc_id15		 	(ul_eaxc_id15			),
	.rtc_id					(rx_c_rtc_id			                ),
	.rx_c_dataDirection		(c_datadirection		                ),
	.rx_u_rtc_id			(rx_rtc_id				                ),
	.ul_rtc_id_intr			(ul_rtc_id_intr			                )	
); 

// for c plane
dl_rtc_id_config u_dl_rtc_id_config(

	.clk_eth				(clk_eth_xran_dl	),
	.rst_eth_n				(rst_eth_n_dl_4d_dup1 & rst_eth_soft_n_dl_4d),

	.dl_axc_id0				(dl_eaxc_id0			),
	.dl_axc_id1				(dl_eaxc_id1			),
	.dl_axc_id2				(dl_eaxc_id2			),
	.dl_axc_id3				(dl_eaxc_id3			),
	.dl_axc_id4				(dl_eaxc_id4			),
	.dl_axc_id5				(dl_eaxc_id5			),
	.dl_axc_id6				(dl_eaxc_id6			),
	.dl_axc_id7				(dl_eaxc_id7			),
	.rtc_id					(rx_c_rtc_id		                    ),
	.rx_c_dataDirection		(c_datadirection	                    ),
	.rx_u_rtc_id			(rx_rtc_id_dl		                    ),
	.dl_rtc_id_intr			(dl_rtc_id_intr		                    )	
); 
// for u plane
ul_eaxc_config u_ul_axc_config (

	.clk_eth								(clk_eth_xran_ul	 ),
	.rst_eth_n								(rst_eth_n_ul_6d_dup2 & rst_eth_soft_n_6d_dup3),

	.ul_axc_id0								(ul_eaxc_id0			),
	.ul_axc_id1								(ul_eaxc_id1			),
	.ul_axc_id2								(ul_eaxc_id2			),
	.ul_axc_id3								(ul_eaxc_id3			),
	.ul_axc_id4								(ul_eaxc_id4			),
	.ul_axc_id5								(ul_eaxc_id5			),
	.ul_axc_id6								(ul_eaxc_id6			),
	.ul_axc_id7								(ul_eaxc_id7			),
	.ul_axc_id8								(ul_eaxc_id8			),
	.ul_axc_id9								(ul_eaxc_id9			),
	.ul_axc_id10							(ul_eaxc_id10		),
	.ul_axc_id11							(ul_eaxc_id11		),
	.ul_axc_id12							(ul_eaxc_id12		),
	.ul_axc_id13							(ul_eaxc_id13		),
	.ul_axc_id14							(ul_eaxc_id14		),
	.ul_axc_id15							(ul_eaxc_id15		),
	.axc_id									(tx_u_pc_id			                ),
	.tx_u_axc_id							(tx_u_axc_id		                ),
	.ul_axc_id_intr							(ul_axc_id_intr		                )
); 

// for u plane
dl_eaxc_config u_dl_axc_config(

	.clk_eth				(clk_eth_xran_dl		),
	.rst_eth_n				(rst_eth_n_dl_4d_dup1 & rst_eth_soft_n_dl_4d),

	.dl_axc_id0				(dl_eaxc_id0				),
	.dl_axc_id1				(dl_eaxc_id1				),
	.dl_axc_id2				(dl_eaxc_id2				),
	.dl_axc_id3				(dl_eaxc_id3				),
	.dl_axc_id4				(dl_eaxc_id4				),
	.dl_axc_id5				(dl_eaxc_id5				),
	.dl_axc_id6				(dl_eaxc_id6				),
	.dl_axc_id7				(dl_eaxc_id7				),
	.axc_id					(xran_demapper_source_channel               ),
	.rx_u_axc_id			(rx_u_axc_id			                    ),
	.dl_axc_id_intr			(dl_axc_id_intr			                    )	
); 

     
                 
// ORAN SS REGISTERS
Oran_SS_Registers u_oran_ecpri_ss_config
(
	// Input Ports
	.ecpri_ip_version_ecpri_ip_version_i							('h302),// ecpri_ip_version input [31:0]
	.oran_ip_version_oran_ip_version_i								('h220),// oran_ip_version input [31:0]
	.fh_comp_ip_version_fh_comp_ip_version_i						('h107),// fh_comp_ip_version input [31:0]
	.coupling_version_coupling_version_i							(cu_coupling_version),// coupling_version input [31:0]
	.coupling_statistics_register                                   (coupling_statistics_register),
	//
	.intr_register_timeout_cntr_intr_cplane_i						(timeout_cntr_intr_cplane),
	.intr_register_timeout_cntr_intr_uplane_i						(timeout_cntr_intr_uplane),
	.intr_register_fifo_full_intr_i									(fifo_full_intr),
	
	//pusch_cu_coupling_status Input
	.coupling_err_clear_coupling_err_clear							(coupling_err_clear),
	.pusch_coupling_status_pusch_first_cplane_detect_i				(pusch_cu_coupling_status[4]),                
	.pusch_coupling_status_pusch_sf_slot_match_i				    (pusch_cu_coupling_status[5]),                
	.pusch_coupling_status_pusch_wr_memory_location_i				(pusch_cu_coupling_status[6]),                
	.pusch_coupling_status_pusch_rd_memory_location_i				(pusch_cu_coupling_status[7]),                
	.pusch_coupling_status_pusch_state_i							(pusch_cu_coupling_status[3:0]),              
	.pusch_coupling_status_invalid_PUSCH_eAxC_i						(pusch_cu_coupling_status[8]),              
	.pusch_coupling_status_PUSCH_data_arrived_eth_i					(pusch_cu_coupling_status[9]),              
	.pusch_coupling_status_PUSCH_data_processed_i					(pusch_cu_coupling_status[10]),              
	.pusch_coupling_status_pusch_fifo_full_i						(pusch_cu_coupling_status[11]),             
	.pusch_coupling_status_pusch_eAxC_Flag_i						(pusch_cu_coupling_status[12]),             
	.pusch_coupling_status_pusch_avst_source_ready_i				(pusch_cu_coupling_status[13]),             
	.pusch_coupling_status_pusch_ram_rd_valid_i						(pusch_cu_coupling_status[14]),             
	.pusch_coupling_status_pusch_ram_rdready_all_i					(pusch_cu_coupling_status[15]),             
	.pusch_coupling_status_cc1_enable_i								(pusch_cu_coupling_status[16]),             
	.pusch_coupling_status_cc2_enable_i								(pusch_cu_coupling_status[17]),
	.pusch_coupling_status_prb_state_i								(pusch_cu_coupling_status[20:18]),
	                                                                                                      
	//prach_cu_coupling_status Input                                                                      
	.prach_coupling_status_prach_first_cplane_detect_i					(prach_cu_coupling_status[4]),      	  
	.prach_coupling_status_prach_first_uplane_detect_i					(prach_cu_coupling_status[5]),         
	.prach_coupling_status_prach_wr_memory_location_i					(prach_cu_coupling_status[6]),         
	.prach_coupling_status_prach_rd_memory_location_i					(prach_cu_coupling_status[7]),         
	.prach_coupling_status_prach_state_i								(prach_cu_coupling_status[3:0]),      
	.prach_coupling_status_invalid_PRACH_eaxc_i							(prach_cu_coupling_status[8]),         
	.prach_coupling_status_prach_invalid_num_of_cplane_i				(prach_cu_coupling_status[9]),	      
	.prach_coupling_status_ul_start_2d_i								(prach_cu_coupling_status[10]),         
	.prach_coupling_status_prach_data_received_i						(prach_cu_coupling_status[11]),         
	.prach_coupling_status_prach_data_processed_i						(prach_cu_coupling_status[12]),         
	.prach_coupling_status_prach_fifo_full_i							(prach_cu_coupling_status[13]),         
	.prach_coupling_status_prach_eAxC_Flag_i							(prach_cu_coupling_status[14]),         
	.prach_coupling_status_prach_avst_source_ready_i					(prach_cu_coupling_status[15]),         
	                                                                                                        
	//fifo_full_status Input
	.fifo_full_flag_cu_plane_coupling_pusch_ram_write_full_i		(fifo_full_status[0]),
	.fifo_full_flag_cu_plane_coupling_prach_ram_write_full_i		(fifo_full_status[1]),
	.fifo_full_flag_ul_arb_out_fifo_full_i							(fifo_full_status[2]),
	//profiling_status
	.profiling_status_ram_rdusedw_i									(ram_rdusedw),//profiling_status_ram_rdusedw_i input wire [12:0] 
	.profiling_status_rdempty_i										(ram_rdempty),
	// Output Ports
	.dl_eaxc_id0_dl_eaxc_id0										(dl_eaxc_id0),// dl_eaxc_id- output reg [15:0]
	.dl_eaxc_id1_dl_eaxc_id1										(dl_eaxc_id1),// dl_eaxc_id- output reg [15:0]
	.dl_eaxc_id2_dl_eaxc_id2										(dl_eaxc_id2),// dl_eaxc_id- output reg [15:0]
	.dl_eaxc_id3_dl_eaxc_id3										(dl_eaxc_id3),// dl_eaxc_id- output reg [15:0]
	.dl_eaxc_id4_dl_eaxc_id4										(dl_eaxc_id4),// dl_eaxc_id- output reg [15:0]
	.dl_eaxc_id5_dl_eaxc_id5										(dl_eaxc_id5),// dl_eaxc_id- output reg [15:0]
	.dl_eaxc_id6_dl_eaxc_id6										(dl_eaxc_id6),// dl_eaxc_id- output reg [15:0]
	.dl_eaxc_id7_dl_eaxc_id7										(dl_eaxc_id7),// dl_eaxc_id- output reg [15:0]
	
	.ul_eaxc_id0_ul_eaxc_id0										(ul_eaxc_id0), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id1_ul_eaxc_id1										(ul_eaxc_id1), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id2_ul_eaxc_id2										(ul_eaxc_id2), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id3_ul_eaxc_id3										(ul_eaxc_id3), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id4_ul_eaxc_id4										(ul_eaxc_id4), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id5_ul_eaxc_id5										(ul_eaxc_id5), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id6_ul_eaxc_id6										(ul_eaxc_id6), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id7_ul_eaxc_id7										(ul_eaxc_id7), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id8_ul_eaxc_id8										(ul_eaxc_id8), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id9_ul_eaxc_id9										(ul_eaxc_id9), //ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id10_ul_eaxc_id10										(ul_eaxc_id10),//ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id11_ul_eaxc_id11										(ul_eaxc_id11),//ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id12_ul_eaxc_id12										(ul_eaxc_id12),//ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id13_ul_eaxc_id13										(ul_eaxc_id13),//ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id14_ul_eaxc_id14										(ul_eaxc_id14),//ul_eaxc_id- output reg [15:0]
	.ul_eaxc_id15_ul_eaxc_id15										(ul_eaxc_id15),//ul_eaxc_id- output reg [15:0]
	//timeout_cntr_intr_clear[1:0]
	.intr_clear_intr_clear_cplane									(timeout_cntr_intr_clear[0]),//intr_clear_cplane	- output reg
	.intr_clear_intr_clear_uplane									(timeout_cntr_intr_clear[1]),//intr_clear_uplane	- output reg
	.intr_clear_fifo_full_intr_clear								(fifo_full_intr_clear),//fifo_full_intr_clear	- output reg
	//timeout_cntr_intr_mask[1:0]
	.intr_mask_intr_mask_cplane										(timeout_cntr_intr_mask[0]),
	.intr_mask_intr_mask_uplane										(timeout_cntr_intr_mask[1]),
	.intr_mask_fifo_full_intr_mask									(fifo_full_intr_mask),
	
	.intr_idle_ms_intr_idle_time_ms									(intr_idle_ms_timeout),// intr_idle_time_ms output reg [11:0] 
	
	.decomp_fsoffset_decomp_fsoffset								(decomp_fsoffset),//decomp_fsoffset output reg [15:0] 
	.comp_fsoffset_comp_fsoffset									(comp_fsoffset),//comp_fsoffset output reg [15:0]
	
	.control_xran_timestamp_capture_start							(control_xran_timestamp[0]),
	
	.timestamp_mux_timestamp_mux									(timestamp_mux),
	
	//uplink_arbiter registers
	.arbiter_cfg_ctrl												(arbiter_cfg_ctrl			),
	.arbiter_cfg_ready_i                                            (arbiter_cfg_ready_i         ),
	.arbiter_prio1_pusch_priority                                   (arbiter_prio1_pusch_priority),
	.arbiter_prio1_prach_priority                                   (arbiter_prio1_prach_priority),
	// Bus Interface
	.clk															(clk_csr),
	.reset															(~rst_csr_n),
	.writedata														(oran_ss_config_csr_writedata),
	.read															(oran_ss_config_csr_read),
	.write															(oran_ss_config_csr_write),
	.byteenable														(4'b1111),
	.readdata														(oran_ss_config_csr_readdata),
	.readdatavalid													(oran_ss_config_csr_readdata_valid),//output
	.address														({oran_ss_config_csr_address[6:0],2'b00})
);

// timeout counter for cplane 
 idle_time_counter #(
  .CLK_FREQ (390625), 
  .TWIDTH   (12)
 ) u_idle_time_counter_cplane
 (
  .clk       (clk_eth_xran_dl				),       
  .rst_n     (rst_eth_xran_n_dl				),
  .in_valid  (xran_demapper_cplane_valid	), 
  .start	 (dl_input_hfn_pulse_2d			),
  .idle_ms   (intr_idle_ms_timeout			),
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
  .in_valid  (xran_demapper_source_valid 	), 
  .start	 (dl_input_hfn_pulse_2d			),
  .idle_ms   (intr_idle_ms_timeout			),
  .intr_ena  (~timeout_cntr_intr_mask[1]	),
  .intr_clear(timeout_cntr_intr_clear[1]	),
  .intr_out  (timeout_cntr_intr_uplane		)
  
 );
 
 
 xran_timestamp u_xran_timestamp(
    
    .clk_csr     							(clk_csr),
    .rst_csr_n                  			(rst_csr_n),
    .clk_eth                    			(clk_ecpri_rx),
    .rst_eth_n                  			(rst_ecpri_n_6d ),
    .avst_sink1_valid           			(xran_timestamp_dl_valid), 
    .avst_sink1_data            			(xran_timestamp_dl_data), 
    .avst_sink1_channel         			(8'd0), 
    .avst_sink1_startofpacket   			(xran_timestamp_dl_sop), 
    .avst_sink1_endofpacket     			(xran_timestamp_dl_eop), 
    .avst_sink2_valid           			(xran_timestamp_ul_valid), 
    .avst_sink2_data            			(xran_timestamp_ul_data), 
    .avst_sink2_channel         			(8'd0), 
    .avst_sink2_startofpacket   			(xran_timestamp_ul_sop), 
    .avst_sink2_endofpacket     			(xran_timestamp_ul_eop), 
    .frame_status               			(radio_config_status),//(xran_timestamp_radio_config_status),//(radio_config_status), 
	.tod                        			(xran_timestamp_tod),//(tod),
    .ram_read                   			(xran_timestamp_ram_read),
    .ram_readdata               			(xran_timestamp_ram_readdata),
    .ram_rdusedw                             (ram_rdusedw   ), 
    .ram_rdempty                             (ram_rdempty   ),
    .control                                 (control_xran_timestamp ),
    .timestamp_mux                           (timestamp_mux )
   
);

always @ (posedge clk_ecpri_rx) begin

avst_sink_dl_valid_1d            <=   avst_sink_dl_valid                  ;                   
avst_sink_dl_data_1d             <=   avst_sink_dl_data                   ;
avst_sink_dl_startofpacket_1d    <=   avst_sink_dl_startofpacket          ;
avst_sink_dl_endofpacket_1d      <=   avst_sink_dl_endofpacket            ;
avst_sink_dl_valid_2d            <=   avst_sink_dl_valid_1d               ;
avst_sink_dl_data_2d             <=   avst_sink_dl_data_1d                ;
avst_sink_dl_startofpacket_2d    <=   avst_sink_dl_startofpacket_1d       ;
avst_sink_dl_endofpacket_2d      <=   avst_sink_dl_endofpacket_1d         ;
avst_sink_dl_valid_3d            <=   avst_sink_dl_valid_2d               ;
avst_sink_dl_data_3d             <=   avst_sink_dl_data_2d                ;
avst_sink_dl_startofpacket_3d    <=   avst_sink_dl_startofpacket_2d       ;
avst_sink_dl_endofpacket_3d      <=   avst_sink_dl_endofpacket_2d         ;
avst_sink_dl_valid_4d            <=   avst_sink_dl_valid_3d               ;
avst_sink_dl_data_4d             <=   avst_sink_dl_data_3d                ;
avst_sink_dl_startofpacket_4d    <=   avst_sink_dl_startofpacket_3d       ;
avst_sink_dl_endofpacket_4d      <=   avst_sink_dl_endofpacket_3d         ;

avst_source_ul_valid_1d          <= avst_source_ul_valid             ;      
avst_source_ul_data_1d           <= avst_source_ul_data              ;
avst_source_ul_startofpacket_1d  <= avst_source_ul_startofpacket     ;
avst_source_ul_endofpacket_1d    <= avst_source_ul_endofpacket       ; 

avst_source_ul_valid_2d          <= avst_source_ul_valid_1d             ;      
avst_source_ul_data_2d           <= avst_source_ul_data_1d              ;
avst_source_ul_startofpacket_2d  <= avst_source_ul_startofpacket_1d     ;
avst_source_ul_endofpacket_2d    <= avst_source_ul_endofpacket_1d       ; 

avst_source_ul_valid_3d          <= avst_source_ul_valid_2d             ;      
avst_source_ul_data_3d           <= avst_source_ul_data_2d              ;
avst_source_ul_startofpacket_3d  <= avst_source_ul_startofpacket_2d     ;
avst_source_ul_endofpacket_3d    <= avst_source_ul_endofpacket_2d       ; 

avst_source_ul_valid_4d          <= avst_source_ul_valid_3d               ;      
avst_source_ul_data_4d           <= avst_source_ul_data_3d                ;
avst_source_ul_startofpacket_4d  <= avst_source_ul_startofpacket_3d       ;
avst_source_ul_endofpacket_4d    <= avst_source_ul_endofpacket_3d         ;  
xran_timestamp_tod_1d                   <= tod                 ;
xran_timestamp_tod_2d                   <= xran_timestamp_tod_1d                 ;
xran_timestamp_tod_3d                   <= xran_timestamp_tod_2d                 ;
xran_timestamp_tod_4d                   <= xran_timestamp_tod_3d                 ;

end

/* always @ (posedge clk_dsp) begin 

xran_timestamp_radio_config_status_1d   <= radio_config_status_402 ;
xran_timestamp_radio_config_status_2d   <= xran_timestamp_radio_config_status_1d ;
xran_timestamp_radio_config_status_3d   <= xran_timestamp_radio_config_status_2d ;
xran_timestamp_radio_config_status_4d   <= xran_timestamp_radio_config_status_3d ;

end */

always @ (posedge clk_ecpri_rx) begin
if (~rst_ecpri_n_6d)
 cycle_count <= 3'd0 ;
else if (cycle_count== 3'd3)
 cycle_count <= 3'd0 ;
else if (avst_sink_dl_valid  ) begin
 if (avst_sink_dl_startofpacket)
  cycle_count <= cycle_count + 1'b1  ;
 else if (cycle_count >= 3'd1)
  cycle_count <= cycle_count + 1'b1  ;
 else
  cycle_count <= cycle_count      ;
end
else
 cycle_count  <= cycle_count ;
end

always @ (posedge clk_ecpri_rx) begin
if (~rst_ecpri_n_6d)
  u_plane_packet_type = 1'b0   ;
else if (cycle_count == 3'd3)
   if ((avst_sink_dl_data_1d[39:32] == 8'd0) & (avst_sink_dl_data_1d[63:48] == 16'hAEFE) ) // ethernet type and message type check
     u_plane_packet_type <= 1'b1 ;
   else
     u_plane_packet_type <= 1'b0 ;   
end


assign xran_timestamp_dl_valid = (u_plane_packet_type) ? avst_sink_dl_valid_4d         : 'd0 ; 
assign xran_timestamp_dl_data  = (u_plane_packet_type) ? avst_sink_dl_data_4d          : 'd0 ;
assign xran_timestamp_dl_sop   = (u_plane_packet_type) ? avst_sink_dl_startofpacket_4d : 'd0 ;
assign xran_timestamp_dl_eop   = (u_plane_packet_type) ? avst_sink_dl_endofpacket_4d   : 'd0 ;

assign xran_timestamp_ul_valid = avst_source_ul_valid_4d          ;
assign xran_timestamp_ul_data  = avst_source_ul_data_4d           ;
assign xran_timestamp_ul_sop   = avst_source_ul_startofpacket_4d  ;
assign xran_timestamp_ul_eop   = avst_source_ul_endofpacket_4d    ;

assign xran_timestamp_radio_config_status = xran_timestamp_radio_config_status_2d ;
assign xran_timestamp_tod = xran_timestamp_tod_4d ;

/* profiling_cdc_pipeline #(
        .DW     (56),
        .DELAYS (2)
    ) u0 (
        .src_clk       (clk_dsp),                    //   input,   width = 1,       src_clk.clk
        .rst_src_clk_n (rst_dsp_n_6d_dup1),          //   input,   width = 1, rst_src_clk_n.reset_n
        .dst_clk       (clk_ecpri_rx),               //   input,   width = 1,       dst_clk.clk
        .rst_dst_clk_n (rst_ecpri_n_6d),             //   input,   width = 1, rst_dst_clk_n.reset_n
        .datain        (radio_config_status),        //   input,  width = DW,        datain.data
        .dataout       (radio_config_status_402)     //  output,  width = DW,       dataout.data
    ); */

endmodule
