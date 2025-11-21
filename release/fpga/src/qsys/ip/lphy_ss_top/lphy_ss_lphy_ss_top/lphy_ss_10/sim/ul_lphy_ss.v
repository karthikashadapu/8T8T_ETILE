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
 
module ul_lphy_ss
(
   clk_dsp                                  ,
   rst_dsp_n                                ,   
   clk_csr                                  ,
   rst_csr_n                                , 
   rst_soft_n                               , 
   clk_eth_xran_ul		                    ,
   clk_eth_xran_dl                          ,
   rst_eth_xran_n_ul						,
   rst_eth_xran_n_dl						,               
   
 
   
   input_hfn_pulse                          ,
   output_hfn_pulse                         ,
   
   lte_sfn_sf                               ,

   bw_config_cc1                          	,
   bw_config_cc2 						  	,
   
   frame_status                             ,
   
   lphy_ss_ul_sink_data1					,
   lphy_ss_ul_sink_valid1					,
   lphy_ss_ul_sink_channel1					,
   
   lphy_ss_ul_sink_data2					,
   lphy_ss_ul_sink_valid2					,
   lphy_ss_ul_sink_channel2					,
   
   fft_sink_valid_l1  						,
   fft_sink_data_l1   						,
   fft_sink_channel_l1						,
   
   fft_sink_valid_l2  						,
   fft_sink_data_l2   						,
   fft_sink_channel_l2						,  
   
   fft_l1_source_valid             			,
   fft_l1_source_data              			,
   fft_l1_source_channel           			,
   fft_l1_source_ready             			,
   fft_l1_source_endofpacket       			,
   fft_l1_source_startofpacket     			,

   fft_l2_source_valid             			,
   fft_l2_source_data              			,
   fft_l2_source_channel           			,
   fft_l2_source_ready             			,
   fft_l2_source_endofpacket       			,
   fft_l2_source_startofpacket     			,
   
   cap_fft_l1_in_valid      	  			,
   cap_fft_l1_in_data             			,
   cap_fft_l1_in_channel          			,
   
   cap_fft_l2_in_valid            			,
   cap_fft_l2_in_data             			,
   cap_fft_l2_in_channel          			,

   cap_fft_l1_out_valid             		,
   cap_fft_l1_out_data              		,
   cap_fft_l1_out_channel           		,
   cap_fft_l1_out_startofpacket     		,
   cap_fft_l1_out_endofpacket       		,

   cap_fft_l2_out_valid             		,
   cap_fft_l2_out_data              		,
   cap_fft_l2_out_channel           		,
   cap_fft_l2_out_startofpacket     		,
   cap_fft_l2_out_endofpacket       		,

   fft_l1_busIn_writedata                   ,
   fft_l1_busIn_address                     ,
   fft_l1_busIn_write                       ,
   fft_l1_busIn_read                        ,
   fft_l1_busOut_readdatavalid              ,
   fft_l1_busOut_readdata                   ,
   fft_l1_busOut_waitrequest                ,  
   
   fft_l2_busIn_writedata                   ,
   fft_l2_busIn_address                     ,
   fft_l2_busIn_write                       ,
   fft_l2_busIn_read                        ,
   fft_l2_busOut_readdatavalid              ,
   fft_l2_busOut_readdata                   ,
   fft_l2_busOut_waitrequest                , 
   
 
   frag_disable                             ,
   ul_frame_status                          ,
  // arbiter_request                          ,
  
  scheduler_source_valid1                 ,
  scheduler_source_data1                  ,
  scheduler_source_channel1               ,
  
  scheduler_source_valid2                ,
  scheduler_source_data2                 ,
  scheduler_source_channel2              ,
   
   ifft_fft_lpbk_en                         ,
   
  

   pb_avst_sink_valid                       ,
   pb_avst_sink_data                    	,
   pb_fft_inj_sel                           ,                   
   
  
  cp_len 									,
  fft_size									,
  fft_dc_sc_en_l1 						    ,
  fft_dc_sc_en_l2 						    ,  
  hcs_bypass_l1								,
  hcs_bypass_l2								,  
  fft_gain_l1 								,
  fft_shift_l1 								, 
  fft_gain_l2 								,
  fft_shift_l2 								, 
  
  time_ref_out                              ,
  ul_start_pulse_latch                      ,
  fft_rc_enable_l1    ,
  fft_rc_enable_l2    ,
  fft_rc_bw_sel_l1    ,
  fft_rc_bw_sel_l2    ,

  	pwr_mtr_fft_hist_done_intr_l1,
	pwr_mtr_fft_hist_done_intr_l2,
  
   pm_fft_threash_mm_bridge_address_l1		    ,
   pm_fft_threash_mm_bridge_chipselect_l1		,
   pm_fft_threash_mm_bridge_read_l1				,
   pm_fft_threash_mm_bridge_write_l1			,
   pm_fft_threash_mm_bridge_writedata_l1		,
   pm_fft_threash_mm_bridge_byteenable_l1		,
   pm_fft_threash_mm_bridge_readdata_l1			,
   pm_fft_threash_mm_bridge_waitrequest_l1		,
   
   pm_fft_hist_mm_bridge_address_l1				,
   pm_fft_hist_mm_bridge_chipselect_l1		    ,
   pm_fft_hist_mm_bridge_read_l1				,
   pm_fft_hist_mm_bridge_write_l1				,
   pm_fft_hist_mm_bridge_writedata_l1			,
   pm_fft_hist_mm_bridge_byteenable_l1		    ,
   pm_fft_hist_mm_bridge_readdata_l1			,
   pm_fft_hist_mm_bridge_readdatavalid_l1			,
   pm_fft_hist_mm_bridge_waitrequest_l1			,
   
   pwr_mtr_config_csr_writedata_l1				,
   pwr_mtr_config_csr_read_l1				    ,
   pwr_mtr_config_csr_write_l1					,
   pwr_mtr_config_csr_readdata_l1				,
   pwr_mtr_config_csr_readdatavalid_l1			,
   pwr_mtr_config_csr_address_l1			    ,
   
   pm_fft_threash_mm_bridge_address_l2		    ,
   pm_fft_threash_mm_bridge_chipselect_l2		,
   pm_fft_threash_mm_bridge_read_l2				,
   pm_fft_threash_mm_bridge_write_l2			,
   pm_fft_threash_mm_bridge_writedata_l2		,
   pm_fft_threash_mm_bridge_byteenable_l2		,
   pm_fft_threash_mm_bridge_readdata_l2			,
   pm_fft_threash_mm_bridge_waitrequest_l2		,
   
   pm_fft_hist_mm_bridge_address_l2				,
   pm_fft_hist_mm_bridge_chipselect_l2		    ,
   pm_fft_hist_mm_bridge_read_l2				,
   pm_fft_hist_mm_bridge_write_l2				,
   pm_fft_hist_mm_bridge_writedata_l2			,
   pm_fft_hist_mm_bridge_byteenable_l2			,
   pm_fft_hist_mm_bridge_readdata_l2			,
   pm_fft_hist_mm_bridge_readdatavalid_l2			,
   pm_fft_hist_mm_bridge_waitrequest_l2			,
   
   pwr_mtr_config_csr_writedata_l2				,
   pwr_mtr_config_csr_read_l2				    ,
   pwr_mtr_config_csr_write_l2					,
   pwr_mtr_config_csr_readdata_l2				,
   pwr_mtr_config_csr_readdatavalid_l2			,
   pwr_mtr_config_csr_address_l2	            ,

   pm_stat_fft_mm_bridge_address_l1				,
   pm_stat_fft_mm_bridge_chipselect_l1		    ,
   pm_stat_fft_mm_bridge_read_l1				,
   pm_stat_fft_mm_bridge_write_l1			    ,	
   pm_stat_fft_mm_bridge_writedata_l1		    ,
   pm_stat_fft_mm_bridge_byteenable_l1		    ,
   pm_stat_fft_mm_bridge_readdata_l1			,
   pm_stat_fft_mm_bridge_readdatavalid_l1			,
   pm_stat_fft_mm_bridge_waitrequest_l1			,
   
   pm_stat_fft_mm_bridge_address_l2				,
   pm_stat_fft_mm_bridge_chipselect_l2		    ,
   pm_stat_fft_mm_bridge_read_l2				,
   pm_stat_fft_mm_bridge_write_l2			    ,	
   pm_stat_fft_mm_bridge_writedata_l2		    ,
   pm_stat_fft_mm_bridge_byteenable_l2		    ,
   pm_stat_fft_mm_bridge_readdata_l2			,
   pm_stat_fft_mm_bridge_readdatavalid_l2			,
   pm_stat_fft_mm_bridge_waitrequest_l2   
   
 );

//`include "def_param.vh"
`include "../common/def_param.vh"

//Parameters Declaration
parameter NUM_OF_ANT            =   32      ;
parameter NUM_OF_FFT            =   4       ;
parameter XRAN_ETH_DATAWIDTH    =   128     ;
parameter ROE_ETH_DATAWIDTH     =   128     ;

localparam NUM_OF_INSTANCE      =   2       ;
localparam IQ_DATAWIDTH         =   32      ;


input  									clk_dsp           				;
input  									rst_dsp_n         				;
input  									clk_csr           				;
input  									rst_csr_n         				;
input  									clk_eth_xran_ul					;	             
input  									clk_eth_xran_dl     			;                  
input  									rst_eth_xran_n_ul				;				
input  									rst_eth_xran_n_dl				;					
input  									rst_soft_n          			;
input  [67:0]                           frame_status        			;


input wire [7:0]                             bw_config_cc1              ;
input wire [7:0]                             bw_config_cc2              ;

input                         			frag_disable                    ;
input                                   input_hfn_pulse                 ;
input                                   output_hfn_pulse                ;
input  [13:0]                           lte_sfn_sf                      ;

input                                  lphy_ss_ul_sink_valid1               ;
input [IQ_DATAWIDTH -1 :0]             lphy_ss_ul_sink_data1                ;
input [7:0]                            lphy_ss_ul_sink_channel1             ;
									   
input                                  lphy_ss_ul_sink_valid2               ;
input [IQ_DATAWIDTH -1 :0]             lphy_ss_ul_sink_data2                ;
input [7:0]                            lphy_ss_ul_sink_channel2             ;

output                               	cap_fft_l1_in_valid      		;     
output [IQ_DATAWIDTH-1:0] 				cap_fft_l1_in_data            	;
output [7:0 ]                        	cap_fft_l1_in_channel         	;

output                               	cap_fft_l2_in_valid           	;
output [IQ_DATAWIDTH-1:0] 				cap_fft_l2_in_data            	;
output [7:0 ]                        	cap_fft_l2_in_channel         	;

output                                 cap_fft_l1_out_valid             ;
output [IQ_DATAWIDTH-1:0]   		   cap_fft_l1_out_data              ;
output [7:0 ]                          cap_fft_l1_out_channel           ;
output                                 cap_fft_l1_out_startofpacket     ;
output                                 cap_fft_l1_out_endofpacket       ;

output                                 cap_fft_l2_out_valid             ;
output [IQ_DATAWIDTH-1:0]   		   cap_fft_l2_out_data              ;
output [7:0 ]                          cap_fft_l2_out_channel           ;
output                                 cap_fft_l2_out_startofpacket     ;
output                                 cap_fft_l2_out_endofpacket       ;


input  [31:0]                           fft_l1_busIn_writedata          ;
input  [13:0 ]                           fft_l1_busIn_address            ;
input                                   fft_l1_busIn_write              ;
input                                   fft_l1_busIn_read               ;
output                                  fft_l1_busOut_readdatavalid     ;
output [31:0]                           fft_l1_busOut_readdata          ;
output                                  fft_l1_busOut_waitrequest       ;

input  [31:0]                           fft_l2_busIn_writedata          ;
input  [13:0 ]                           fft_l2_busIn_address            ;
input                                   fft_l2_busIn_write              ;
input                                   fft_l2_busIn_read               ;
output                                  fft_l2_busOut_readdatavalid     ;
output [31:0]                           fft_l2_busOut_readdata          ;
output                                  fft_l2_busOut_waitrequest       ;


output                                  fft_l1_source_valid             ;
output    [IQ_DATAWIDTH-1:0]   			fft_l1_source_data              ;
output    [7:0 ]                        fft_l1_source_channel           ;
input                                   fft_l1_source_ready             ;
output                                  fft_l1_source_endofpacket       ;
output                                  fft_l1_source_startofpacket     ;

output                                  fft_l2_source_valid             ;
output    [IQ_DATAWIDTH-1:0]   			fft_l2_source_data              ;
output    [7:0 ]                        fft_l2_source_channel           ;
input                                   fft_l2_source_ready             ;
output                                  fft_l2_source_endofpacket       ;
output                                  fft_l2_source_startofpacket     ;

//output                                  arbiter_request                 ;
output wire [13:0]                      ul_frame_status					;
input wire							    ifft_fft_lpbk_en				;

output wire								scheduler_source_valid1  					;
output wire	[IQ_DATAWIDTH -1:0]			scheduler_source_data1   					;
output wire	[7:0]						scheduler_source_channel1					;

output wire								scheduler_source_valid2  					;
output wire	[IQ_DATAWIDTH -1:0]			scheduler_source_data2   					;
output wire	[7:0]						scheduler_source_channel2					;

input wire								fft_sink_valid_l1  					;
input wire	[IQ_DATAWIDTH -1:0]			fft_sink_data_l1   					;
input wire	[7:0]						fft_sink_channel_l1					;
	
input wire								fft_sink_valid_l2  					;
input wire	[IQ_DATAWIDTH -1:0]			fft_sink_data_l2   					;
input wire	[7:0]						fft_sink_channel_l2					; 

input wire [10:0] 							cp_len 								;
input wire [3:0] 							fft_size							;	
input wire [31:0] 							fft_gain_l1							;	
input wire [3:0] 							fft_shift_l1						;
input wire [31:0] 							fft_gain_l2							;	
input wire [3:0] 							fft_shift_l2						;	

input wire 		 							fft_dc_sc_en_l1 					;
input wire 		 							fft_dc_sc_en_l2 					;	
input wire 						hcs_bypass_l1							;
input wire 						hcs_bypass_l2							;





input 								    pb_avst_sink_valid            		;
input 	[63:0]						    pb_avst_sink_data             		;
input                                   pb_fft_inj_sel                		;
//output								pb_avst_sink_ready        			;



output wire [63:0]                      time_ref_out						;
output                               ul_start_pulse_latch                ;

input fft_rc_enable_l1  ;
input fft_rc_enable_l2  ;
input [3:0] fft_rc_bw_sel_l1  ;
input [3:0] fft_rc_bw_sel_l2  ;


output wire								pwr_mtr_fft_hist_done_intr_l1;
output wire								pwr_mtr_fft_hist_done_intr_l2;

input  			[5:0]   	        pm_fft_threash_mm_bridge_address_l1			;
input  			         	        pm_fft_threash_mm_bridge_chipselect_l1		;
input  			         	        pm_fft_threash_mm_bridge_read_l1			;
input  			         	        pm_fft_threash_mm_bridge_write_l1			;	
input  			[31:0] 	            pm_fft_threash_mm_bridge_writedata_l1		;
input  			[3:0]    	        pm_fft_threash_mm_bridge_byteenable_l1		;
output 			[31:0] 	            pm_fft_threash_mm_bridge_readdata_l1		;
output 			         	        pm_fft_threash_mm_bridge_waitrequest_l1		;

input  			[11:0]  			pm_fft_hist_mm_bridge_address_l1			;
input  			         			pm_fft_hist_mm_bridge_chipselect_l1			;
input  			         			pm_fft_hist_mm_bridge_read_l1				;
input  			         			pm_fft_hist_mm_bridge_write_l1				;	
input  			[31:0] 				pm_fft_hist_mm_bridge_writedata_l1			;
input  			[3:0]    			pm_fft_hist_mm_bridge_byteenable_l1			;
output 			[31:0] 				pm_fft_hist_mm_bridge_readdata_l1			;
output 							pm_fft_hist_mm_bridge_readdatavalid_l1			;
output 			         			pm_fft_hist_mm_bridge_waitrequest_l1		;

input 	wire 	[31:0] 				pwr_mtr_config_csr_writedata_l1				;	
input 	wire 						pwr_mtr_config_csr_read_l1				    ;
input 	wire	 					pwr_mtr_config_csr_write_l1					;
output 	    	[31:0] 				pwr_mtr_config_csr_readdata_l1				;
output 	    						pwr_mtr_config_csr_readdatavalid_l1			;	
input	wire 	[3:0] 				pwr_mtr_config_csr_address_l1			    ;

input  			[5:0]   	        pm_fft_threash_mm_bridge_address_l2			;
input  			         	        pm_fft_threash_mm_bridge_chipselect_l2		;
input  			         	        pm_fft_threash_mm_bridge_read_l2			;
input  			         	        pm_fft_threash_mm_bridge_write_l2			;	
input  			[31:0] 	            pm_fft_threash_mm_bridge_writedata_l2		;
input  			[3:0]    	        pm_fft_threash_mm_bridge_byteenable_l2		;
output 			[31:0] 	            pm_fft_threash_mm_bridge_readdata_l2		;
output 			         	        pm_fft_threash_mm_bridge_waitrequest_l2		;

input  			[11:0]  			pm_fft_hist_mm_bridge_address_l2			;
input  			         			pm_fft_hist_mm_bridge_chipselect_l2			;
input  			         			pm_fft_hist_mm_bridge_read_l2				;
input  			         			pm_fft_hist_mm_bridge_write_l2				;	
input  			[31:0] 				pm_fft_hist_mm_bridge_writedata_l2			;
input  			[3:0]    			pm_fft_hist_mm_bridge_byteenable_l2			;
output 			[31:0] 				pm_fft_hist_mm_bridge_readdata_l2			;
output 							pm_fft_hist_mm_bridge_readdatavalid_l2			;
output 			         			pm_fft_hist_mm_bridge_waitrequest_l2		;

input 	wire 	[31:0] 				pwr_mtr_config_csr_writedata_l2				;	
input 	wire 						pwr_mtr_config_csr_read_l2				    ;
input 	wire	 					pwr_mtr_config_csr_write_l2					;
output 	    	[31:0] 				pwr_mtr_config_csr_readdata_l2				;
output 	    						pwr_mtr_config_csr_readdatavalid_l2			;	
input	wire 	[3:0] 				pwr_mtr_config_csr_address_l2			    ;

input  			[9:0]  			    pm_stat_fft_mm_bridge_address_l1			;
input  			         			pm_stat_fft_mm_bridge_chipselect_l1			;
input  			         			pm_stat_fft_mm_bridge_read_l1				;
input  			         			pm_stat_fft_mm_bridge_write_l1				;	
input  			[31:0] 				pm_stat_fft_mm_bridge_writedata_l1			;
input  			[3:0]    			pm_stat_fft_mm_bridge_byteenable_l1			;
output 			[31:0] 				pm_stat_fft_mm_bridge_readdata_l1			;
output 			 				pm_stat_fft_mm_bridge_readdatavalid_l1			;
output 			         			pm_stat_fft_mm_bridge_waitrequest_l1		;

input  			[9:0]  			    pm_stat_fft_mm_bridge_address_l2			;
input  			         			pm_stat_fft_mm_bridge_chipselect_l2			;
input  			         			pm_stat_fft_mm_bridge_read_l2				;
input  			         			pm_stat_fft_mm_bridge_write_l2			    ;	
input  			[31:0] 				pm_stat_fft_mm_bridge_writedata_l2		    ;
input  			[3:0]    			pm_stat_fft_mm_bridge_byteenable_l2			;
output 			[31:0] 				pm_stat_fft_mm_bridge_readdata_l2			;
output 			 				pm_stat_fft_mm_bridge_readdatavalid_l2			;
output 			         			pm_stat_fft_mm_bridge_waitrequest_l2		;

wire        [13:0]                      time_ref_out_l1					;
wire        [13:0]                      time_ref_out_l2					;


wire                                    cap_fft_l1_in_valid           	;
//wire    [IQ_DATAWIDTH*NUM_OF_FFT-1:0]   cap_fft_l1_in_data            ;
wire    [IQ_DATAWIDTH-1:0]   			cap_fft_l1_in_data            	;
wire    [7:0]                           cap_fft_l1_in_channel         	;

wire                                    cap_fft_l2_in_valid           	;
//wire    [IQ_DATAWIDTH*NUM_OF_FFT-1:0]   cap_fft_l2_in_data            ;
wire    [IQ_DATAWIDTH-1:0]   			cap_fft_l2_in_data            	;
wire    [7:0]                           cap_fft_l2_in_channel         	;

wire                                    cap_fft_l1_out_valid            ;
//wire    [IQ_DATAWIDTH*NUM_OF_FFT-1:0]   cap_fft_l1_out_data           ;
wire    [IQ_DATAWIDTH-1:0]   			cap_fft_l1_out_data             ;
wire    [7:0]                           cap_fft_l1_out_channel          ;
wire                                    cap_fft_l1_out_startofpacket    ;
wire                                    cap_fft_l1_out_endofpacket      ;

wire                                    cap_fft_l2_out_valid            ;
//wire    [IQ_DATAWIDTH*NUM_OF_FFT-1:0]   cap_fft_l2_out_data           ;
wire    [IQ_DATAWIDTH-1:0]              cap_fft_l2_out_data             ;
wire    [7:0]                           cap_fft_l2_out_channel          ;
wire                                    cap_fft_l2_out_startofpacket    ;
wire                                    cap_fft_l2_out_endofpacket      ;

wire								  	avst_sink_fft_valid1 			;
wire	[IQ_DATAWIDTH -1:0]			  	avst_sink_fft_data1 			;
wire	[7:0]						  	avst_sink_fft_channel1		    ;
wire								  	avst_sink_fft_valid2 			;
wire	[IQ_DATAWIDTH -1:0]			  	avst_sink_fft_data2 			;
wire	[7:0]						  	avst_sink_fft_channel2 			;

reg     [31:0]                          output_sop_count                ;
reg     [31:0]                          output_valid_count              ;
  



(*preserve_syn_only*) reg 				rst_dsp_n_1d_dup1	            ;
(*preserve_syn_only*) reg 				rst_dsp_n_2d_dup1	            ;
(*preserve_syn_only*) reg 				rst_dsp_n_1d_dup2	            ;
(*preserve_syn_only*) reg 				rst_dsp_n_2d_dup2	            ;
(*preserve_syn_only*) reg 				rst_dsp_n_1d_dup3	            ;
(*preserve_syn_only*) reg 				rst_dsp_n_2d_dup3	            ;
(*preserve_syn_only*) reg 				rst_dsp_n_1d_dup4	            ;
(*preserve_syn_only*) reg 				rst_dsp_n_2d_dup4	            ;
reg 									rst_eth_xran_n_dl_1d_dup1		;
reg 									rst_eth_xran_n_dl_2d_dup1		;
reg 									rst_eth_xran_n_dl_1d_dup2		;
reg 									rst_eth_xran_n_dl_2d_dup2		;
reg 									rst_eth_xran_n_ul_1d_dup1		;
reg 									rst_eth_xran_n_ul_2d_dup1		;
reg 									rst_eth_xran_n_ul_1d_dup2		;
reg 									rst_eth_xran_n_ul_2d_dup2		;
reg 									rst_eth_xran_n_ul_1d_dup3		;
reg 									rst_eth_xran_n_ul_2d_dup3		;
reg										ifft_fft_lpbk_en_1d				;
reg									    ifft_fft_lpbk_en_2d				;

reg                                     pattern_buffer_sel              ;

reg 									cu_coupling_data_inj			;
reg 									cu_coupling_data_inj_2d 		;
reg 									cu_coupling_data_inj_1d 		;

wire   [11:0] idle_ms ;

wire   [7:0]  pb_avst_source_channel  		;
reg    [1:0]  pb_avst_source_channel_reg 	;

reg [63:0]   pb_avst_sink_data_1d        ;
reg [63:0]   pb_avst_sink_data_2d        ;
reg [63:0]   pb_avst_sink_data_3d        ;
reg [63:0]   pb_avst_sink_data_4d        ;
reg [63:0]   pb_avst_sink_data_5d        ;
reg [63:0]   pb_avst_sink_data_6d        ;
reg          pb_avst_sink_valid_1d       ;
reg          pb_avst_sink_valid_2d       ;
reg          pb_avst_sink_valid_3d       ;
reg          pb_avst_sink_valid_4d       ;
reg          pb_avst_sink_valid_5d       ;
reg          pb_avst_sink_valid_6d       ;
//reg          ul_start_pulse_latch_out    ;


wire								scheduler_sink_valid1  					;
wire	[IQ_DATAWIDTH -1:0]			scheduler_sink_data1   					;
wire	[7:0]						scheduler_sink_channel1					;

wire								scheduler_sink_valid2  					;
wire	[IQ_DATAWIDTH -1:0]			scheduler_sink_data2   					;
wire	[7:0]						scheduler_sink_channel2					;

assign idle_ms = 12'd1 ;
assign cap_fft_l1_in_valid          =  avst_sink_fft_valid1        		;
assign cap_fft_l1_in_data           =  avst_sink_fft_data1				;
assign cap_fft_l1_in_channel        =  avst_sink_fft_channel1      		;

assign cap_fft_l2_in_valid          =  avst_sink_fft_valid2        		;
assign cap_fft_l2_in_data           =  avst_sink_fft_data2				;
assign cap_fft_l2_in_channel        =  avst_sink_fft_channel2      		;


assign cap_fft_l1_out_valid         =  fft_l1_source_valid              ;
assign cap_fft_l1_out_data          =  fft_l1_source_data               ;
assign cap_fft_l1_out_channel       =  fft_l1_source_channel            ;
assign cap_fft_l1_out_startofpacket =  fft_l1_source_startofpacket      ;
assign cap_fft_l1_out_endofpacket   =  fft_l1_source_endofpacket        ;

assign cap_fft_l2_out_valid         =  fft_l2_source_valid              ;
assign cap_fft_l2_out_data          =  fft_l2_source_data               ;
assign cap_fft_l2_out_channel       =  fft_l2_source_channel            ;
assign cap_fft_l2_out_startofpacket =  fft_l2_source_startofpacket      ;
assign cap_fft_l2_out_endofpacket   =  fft_l2_source_endofpacket        ;

assign time_ref_out= {7'd0,time_ref_out_l2[12:5],4'd0,time_ref_out_l2[4:1],5'd0,time_ref_out_l2[0],3'd0,7'd0,time_ref_out_l1[12:5],4'd0,time_ref_out_l1[4:1],5'd0,time_ref_out_l1[0],3'd0};      


always @(posedge clk_dsp)
	begin
		    rst_dsp_n_1d_dup1 <= rst_dsp_n					;
			rst_dsp_n_2d_dup1 <= rst_dsp_n_1d_dup1			;	
			
		    rst_dsp_n_1d_dup2 <= rst_dsp_n					;
			rst_dsp_n_2d_dup2 <= rst_dsp_n_1d_dup2			;	
			
		    rst_dsp_n_1d_dup3 <= rst_dsp_n					;
			rst_dsp_n_2d_dup3 <= rst_dsp_n_1d_dup3			;	

			rst_dsp_n_1d_dup4 <= rst_dsp_n					;
			rst_dsp_n_2d_dup4 <= rst_dsp_n_1d_dup4			;	

	end	
	
always @(posedge clk_eth_xran_ul)
	begin				
		    rst_eth_xran_n_ul_1d_dup1 <= rst_eth_xran_n_ul			;
			rst_eth_xran_n_ul_2d_dup1 <= rst_eth_xran_n_ul_1d_dup1	;				
		    rst_eth_xran_n_ul_1d_dup2 <= rst_eth_xran_n_ul			;
			rst_eth_xran_n_ul_2d_dup2 <= rst_eth_xran_n_ul_1d_dup2	;

	end
	
	
assign  scheduler_sink_valid1 		= (ifft_fft_lpbk_en_2d == 1'b1)? fft_sink_valid_l1 		: lphy_ss_ul_sink_valid1  	;	 	
assign  scheduler_sink_data1        = (ifft_fft_lpbk_en_2d == 1'b1)? fft_sink_data_l1	    : lphy_ss_ul_sink_data1   	;
assign  scheduler_sink_channel1     = (ifft_fft_lpbk_en_2d == 1'b1)? fft_sink_channel_l1    : lphy_ss_ul_sink_channel1	;
assign  scheduler_sink_valid2       = (ifft_fft_lpbk_en_2d == 1'b1)? fft_sink_valid_l2      : lphy_ss_ul_sink_valid2  	;
assign  scheduler_sink_data2        = (ifft_fft_lpbk_en_2d == 1'b1)? fft_sink_data_l2       : lphy_ss_ul_sink_data2   	;
assign  scheduler_sink_channel2     = (ifft_fft_lpbk_en_2d == 1'b1)? fft_sink_channel_l2    : lphy_ss_ul_sink_channel2	;
	
	
ul_ant_scheduler u_ul_ant_scheduler (
   
   .clk_dsp               (clk_dsp					),
   .rst_dsp_n             (rst_dsp_n_2d_dup4		),
   .ul_start_pulse        (input_hfn_pulse			),
   
   .avst_sink_valid_l1    (scheduler_sink_valid1 		),
   .avst_sink_data_l1     (scheduler_sink_data1   		),
   .avst_sink_channel_l1  (scheduler_sink_channel1		),
   .avst_sink_valid_l2    (scheduler_sink_valid2  		),
   .avst_sink_data_l2     (scheduler_sink_data2   		),
   .avst_sink_channel_l2  (scheduler_sink_channel2		),
   
   .avst_source_valid_l1  (scheduler_source_valid1  ),
   .avst_source_data_l1   (scheduler_source_data1   ),
   .avst_source_channel_l1(scheduler_source_channel1),
   .avst_source_valid_l2  (scheduler_source_valid2  ),
   .avst_source_data_l2   (scheduler_source_data2   ),
   .avst_source_channel_l2(scheduler_source_channel2),
   
   .ul_frame_status       (ul_frame_status			),
   .frame_sync_status     (frame_status				),
   .ul_start_pulse_latch  (ul_start_pulse_latch  	)
);


//assign ul_start_pulse_latch = ul_start_pulse_latch_out ;


always @ (posedge clk_dsp)
begin : PIPE_DELAY
    if(~rst_dsp_n_2d_dup1) 
		begin
			ifft_fft_lpbk_en_1d  <= 1'b0 				;
			ifft_fft_lpbk_en_2d  <= 1'b0 				;
		end
    else
		begin
        	ifft_fft_lpbk_en_1d  <= ifft_fft_lpbk_en    ;
			ifft_fft_lpbk_en_2d  <= ifft_fft_lpbk_en_1d ;
		end
end

assign avst_sink_fft_valid1		= (pb_fft_inj_sel == 1'b1)? pb_avst_sink_valid_1d      	:	scheduler_source_valid1   ;		  
assign avst_sink_fft_data1     	= (pb_fft_inj_sel == 1'b1)? pb_avst_sink_data_1d[31:0] 	:	scheduler_source_data1    ;			  
assign avst_sink_fft_channel1   = (pb_fft_inj_sel == 1'b1)? pb_avst_source_channel     	:	scheduler_source_channel1 ; 			  
										    
assign avst_sink_fft_valid2    	= (pb_fft_inj_sel == 1'b1)? pb_avst_sink_valid_1d      	:	scheduler_source_valid2   ;			  
assign avst_sink_fft_data2      = (pb_fft_inj_sel == 1'b1)? pb_avst_sink_data_1d[63:32]	:	scheduler_source_data2    ;     		  
assign avst_sink_fft_channel2   = (pb_fft_inj_sel == 1'b1)? pb_avst_source_channel     	:	scheduler_source_channel2 ;           

`ifndef SCH_LOOPBACK
fft_if
#(
    .NUM_OF_ANT     (NUM_OF_ANT/NUM_OF_FFT  ),
    .NUM_OF_FFT     (NUM_OF_FFT             )
)
u_fft_if_l1
(
	.clk_dsp                              	(clk_dsp                           			),
	.rst_dsp_n                            	(rst_dsp_n_2d_dup2                 			),
	.clk_csr                              	(clk_csr                           			),
	.rst_csr_n                            	(rst_csr_n                         			),
	.rst_soft_n                           	(rst_soft_n                        			),

	.avst_sink_valid                   		(avst_sink_fft_valid1				 		),
	.avst_sink_data                    		(avst_sink_fft_data1   			 			),
	.avst_sink_channel                 		(avst_sink_fft_channel1			 			),
	
	.avst_source_valid                    	(fft_l1_source_valid                  		),
	.avst_source_data                     	(fft_l1_source_data                   		),
	.avst_source_channel                  	(fft_l1_source_channel                		),
	.avst_source_ready                    	(fft_l1_source_ready                  		),
	.avst_source_endofpacket              	(fft_l1_source_endofpacket            		),
	.avst_source_startofpacket            	(fft_l1_source_startofpacket          		),

	.bw_config								(bw_config_cc1								),

	
	
	.ul_frame_status                      	(ul_frame_status					 		),
	.time_ref_out                         	(time_ref_out_l1						    ),   
	
	.fft_busIn_writedata                 	(fft_l1_busIn_writedata               		),
	.fft_busIn_address						(fft_l1_busIn_address						),
	.fft_busIn_write                     	(fft_l1_busIn_write                   		),
	.fft_busIn_read                      	(fft_l1_busIn_read                    		),
	.fft_busOut_readdatavalid             	(fft_l1_busOut_readdatavalid          		),
	.fft_busOut_readdata                  	(fft_l1_busOut_readdata               		),
	.fft_busOut_waitrequest               	(fft_l1_busOut_waitrequest            		),
	                                                                                      
	.cp_len 								(cp_len 									),
	.fft_size								(fft_size									),
	.fft_gain 								(fft_gain_l1								),
	.fft_shift 							    (fft_shift_l1								),
	.fft_rc_enable                          (fft_rc_enable_l1) ,
	.fft_rc_bw_sel                          (fft_rc_bw_sel_l1) ,
	
	
	.dc_sc_en 								(fft_dc_sc_en_l1 								),
	.hcs_bypass								(hcs_bypass_l1									),
	
	.pwr_mtr_fft_hist_done_intr				(pwr_mtr_fft_hist_done_intr_l1),
	
	.pm_fft_threash_mm_bridge_address		(pm_fft_threash_mm_bridge_address_l1		),
	.pm_fft_threash_mm_bridge_chipselect	(pm_fft_threash_mm_bridge_chipselect_l1   	),
	.pm_fft_threash_mm_bridge_read			(pm_fft_threash_mm_bridge_read_l1			),
	.pm_fft_threash_mm_bridge_write			(pm_fft_threash_mm_bridge_write_l1			),
	.pm_fft_threash_mm_bridge_writedata		(pm_fft_threash_mm_bridge_writedata_l1		),
	.pm_fft_threash_mm_bridge_byteenable	(pm_fft_threash_mm_bridge_byteenable_l1		),
	.pm_fft_threash_mm_bridge_readdata		(pm_fft_threash_mm_bridge_readdata_l1		),
	.pm_fft_threash_mm_bridge_waitrequest	(pm_fft_threash_mm_bridge_waitrequest_l1	),
											
	.pm_fft_hist_mm_bridge_address			(pm_fft_hist_mm_bridge_address_l1			),
	.pm_fft_hist_mm_bridge_chipselect		(pm_fft_hist_mm_bridge_chipselect_l1		),
	.pm_fft_hist_mm_bridge_read				(pm_fft_hist_mm_bridge_read_l1				),
	.pm_fft_hist_mm_bridge_write			(pm_fft_hist_mm_bridge_write_l1			  	),
	.pm_fft_hist_mm_bridge_writedata		(pm_fft_hist_mm_bridge_writedata_l1			),
	.pm_fft_hist_mm_bridge_byteenable		(pm_fft_hist_mm_bridge_byteenable_l1		),
	.pm_fft_hist_mm_bridge_readdata	    	(pm_fft_hist_mm_bridge_readdata_l1	    	),
	.pm_fft_hist_mm_bridge_readdatavalid	    	(pm_fft_hist_mm_bridge_readdatavalid_l1	    	),
	.pm_fft_hist_mm_bridge_waitrequest		(pm_fft_hist_mm_bridge_waitrequest_l1		),
											
	.pwr_mtr_config_csr_writedata			(pwr_mtr_config_csr_writedata_l1			),
	.pwr_mtr_config_csr_read				(pwr_mtr_config_csr_read_l1					),
	.pwr_mtr_config_csr_write				(pwr_mtr_config_csr_write_l1				),
	.pwr_mtr_config_csr_readdata			(pwr_mtr_config_csr_readdata_l1				),
	.pwr_mtr_config_csr_readdatavalid		(pwr_mtr_config_csr_readdatavalid_l1		),
	.pwr_mtr_config_csr_address			    (pwr_mtr_config_csr_address_l1			  	),
	
	.pm_stat_fft_mm_bridge_address	         (pm_stat_fft_mm_bridge_address_l1	        ),	
	.pm_stat_fft_mm_bridge_chipselect	     (pm_stat_fft_mm_bridge_chipselect_l1		),
	.pm_stat_fft_mm_bridge_read			     (pm_stat_fft_mm_bridge_read_l1				),
	.pm_stat_fft_mm_bridge_write		     (pm_stat_fft_mm_bridge_write_l1			),
	.pm_stat_fft_mm_bridge_writedata	     (pm_stat_fft_mm_bridge_writedata_l1		),
	.pm_stat_fft_mm_bridge_byteenable	     (pm_stat_fft_mm_bridge_byteenable_l1		),
	.pm_stat_fft_mm_bridge_readdata		     (pm_stat_fft_mm_bridge_readdata_l1			),
	.pm_stat_fft_mm_bridge_readdatavalid	    (pm_stat_fft_mm_bridge_readdatavalid_l1	    	),
	.pm_stat_fft_mm_bridge_waitrequest	     (pm_stat_fft_mm_bridge_waitrequest_l1 		)
	
);
`ifdef NUM_CC_TWO
fft_if
#(
    .NUM_OF_ANT     (NUM_OF_ANT/NUM_OF_FFT  ),
    .NUM_OF_FFT     (NUM_OF_FFT             )
)
u_fft_if_l2
(
	.clk_dsp                              	(clk_dsp                           		),
	.rst_dsp_n                            	(rst_dsp_n_2d_dup2                 		),//rst_dsp_n
	.clk_csr                              	(clk_csr                           		),
	.rst_csr_n                            	(rst_csr_n                         		),
	.rst_soft_n                           	(rst_soft_n                        		),
	
	.avst_sink_valid                   		(avst_sink_fft_valid2					),
	.avst_sink_data                    		(avst_sink_fft_data2   			 		),
	.avst_sink_channel                 		(avst_sink_fft_channel2			 		),

	.avst_source_valid                    	(fft_l2_source_valid                  	),
	.avst_source_data                     	(fft_l2_source_data                   	),
	.avst_source_channel                  	(fft_l2_source_channel                	),
	.avst_source_ready                    	(fft_l2_source_ready                  	),
	.avst_source_endofpacket              	(fft_l2_source_endofpacket            	),
	.avst_source_startofpacket            	(fft_l2_source_startofpacket          	),
	
	.bw_config								(bw_config_cc2							),


	
	.ul_frame_status                      	(ul_frame_status						),
	.time_ref_out                         	(time_ref_out_l2					    ),   
	
	.fft_busIn_writedata                 	(fft_l2_busIn_writedata               	),
	.fft_busIn_address						(fft_l2_busIn_address					),
	.fft_busIn_write                     	(fft_l2_busIn_write                   	),
	.fft_busIn_read                      	(fft_l2_busIn_read                    	),
	.fft_busOut_readdatavalid             	(fft_l2_busOut_readdatavalid          	),
	.fft_busOut_readdata                  	(fft_l2_busOut_readdata               	),
	.fft_busOut_waitrequest               	(fft_l2_busOut_waitrequest            	),

	.cp_len 								(cp_len 								),
	.fft_size								(fft_size								),
	.fft_gain 								(fft_gain_l2							),
	.fft_shift 							    (fft_shift_l2							),
	.fft_rc_enable                          (fft_rc_enable_l2) ,
	.fft_rc_bw_sel                          (fft_rc_bw_sel_l2) ,
	
	.dc_sc_en 								(fft_dc_sc_en_l2 						),
	.hcs_bypass								(hcs_bypass_l2							),
	
	.pwr_mtr_fft_hist_done_intr				(pwr_mtr_fft_hist_done_intr_l2),
	.pm_fft_threash_mm_bridge_address		(pm_fft_threash_mm_bridge_address_l2		),
	.pm_fft_threash_mm_bridge_chipselect	(pm_fft_threash_mm_bridge_chipselect_l2   	),
	.pm_fft_threash_mm_bridge_read			(pm_fft_threash_mm_bridge_read_l2			),
	.pm_fft_threash_mm_bridge_write			(pm_fft_threash_mm_bridge_write_l2			),
	.pm_fft_threash_mm_bridge_writedata		(pm_fft_threash_mm_bridge_writedata_l2		),
	.pm_fft_threash_mm_bridge_byteenable	(pm_fft_threash_mm_bridge_byteenable_l2		),
	.pm_fft_threash_mm_bridge_readdata		(pm_fft_threash_mm_bridge_readdata_l2		),
	.pm_fft_threash_mm_bridge_waitrequest	(pm_fft_threash_mm_bridge_waitrequest_l2	),
											
	.pm_fft_hist_mm_bridge_address			(pm_fft_hist_mm_bridge_address_l2			),
	.pm_fft_hist_mm_bridge_chipselect		(pm_fft_hist_mm_bridge_chipselect_l2		),
	.pm_fft_hist_mm_bridge_read				(pm_fft_hist_mm_bridge_read_l2				),
	.pm_fft_hist_mm_bridge_write			(pm_fft_hist_mm_bridge_write_l2				),
	.pm_fft_hist_mm_bridge_writedata		(pm_fft_hist_mm_bridge_writedata_l2			),
	.pm_fft_hist_mm_bridge_byteenable		(pm_fft_hist_mm_bridge_byteenable_l2		),
	.pm_fft_hist_mm_bridge_readdata	    	(pm_fft_hist_mm_bridge_readdata_l2	    	),
	.pm_fft_hist_mm_bridge_readdatavalid	    	(pm_fft_hist_mm_bridge_readdatavalid_l2	    	),
	.pm_fft_hist_mm_bridge_waitrequest		(pm_fft_hist_mm_bridge_waitrequest_l2		),
											
	.pwr_mtr_config_csr_writedata			(pwr_mtr_config_csr_writedata_l2			),
	.pwr_mtr_config_csr_read				(pwr_mtr_config_csr_read_l2					),
	.pwr_mtr_config_csr_write				(pwr_mtr_config_csr_write_l2				),
	.pwr_mtr_config_csr_readdata			(pwr_mtr_config_csr_readdata_l2				),
	.pwr_mtr_config_csr_readdatavalid		(pwr_mtr_config_csr_readdatavalid_l2		),
	.pwr_mtr_config_csr_address			    (pwr_mtr_config_csr_address_l2			  	),
	
	.pm_stat_fft_mm_bridge_address	        (pm_stat_fft_mm_bridge_address_l2	    ), 	
	.pm_stat_fft_mm_bridge_chipselect	    (pm_stat_fft_mm_bridge_chipselect_l2	),
	.pm_stat_fft_mm_bridge_read				(pm_stat_fft_mm_bridge_read_l2			),
	.pm_stat_fft_mm_bridge_write		    (pm_stat_fft_mm_bridge_write_l2			),
	.pm_stat_fft_mm_bridge_writedata	    (pm_stat_fft_mm_bridge_writedata_l2		),
	.pm_stat_fft_mm_bridge_byteenable	    (pm_stat_fft_mm_bridge_byteenable_l2	),
	.pm_stat_fft_mm_bridge_readdata			(pm_stat_fft_mm_bridge_readdata_l2		),
	.pm_stat_fft_mm_bridge_readdatavalid	    (pm_stat_fft_mm_bridge_readdatavalid_l2	    	),
	.pm_stat_fft_mm_bridge_waitrequest	    (pm_stat_fft_mm_bridge_waitrequest_l2	)
	
);
`endif
`endif








ValidLowCounter 
#(
 .CLK_FREQ(491520),
 .TWIDTH  (12)
)
U_ValidLowCounter (

 .clk                 ( clk_dsp         ),        
 .rst_n               ( rst_dsp_n       ),
 .in_valid            ( avst_sink_valid ),
 .idle_ms             ( idle_ms         ),
 .invalid_cycle_count (   )

);

always @ (posedge clk_dsp)begin
 if (~rst_dsp_n)begin
  pb_avst_sink_data_1d   <= 'd0;  
  pb_avst_sink_data_2d   <= 'd0;
  pb_avst_sink_data_3d   <= 'd0;
  pb_avst_sink_data_4d   <= 'd0;
  pb_avst_sink_data_5d   <= 'd0;
  pb_avst_sink_data_6d   <= 'd0;
  pb_avst_sink_valid_1d  <= 'd0 ;
  pb_avst_sink_valid_2d  <= 'd0 ;
  pb_avst_sink_valid_3d  <= 'd0 ;
  pb_avst_sink_valid_4d  <= 'd0 ;
  pb_avst_sink_valid_5d  <= 'd0 ;
  pb_avst_sink_valid_6d  <= 'd0 ;
 end 
else begin
  pb_avst_sink_data_1d   <= pb_avst_sink_data    ;  
  pb_avst_sink_data_2d   <= pb_avst_sink_data_1d ;
  pb_avst_sink_data_3d   <= pb_avst_sink_data_2d ;
  pb_avst_sink_data_4d   <= pb_avst_sink_data_3d ;
  pb_avst_sink_data_5d   <= pb_avst_sink_data_4d ;
  pb_avst_sink_data_6d   <= pb_avst_sink_data_5d ;
  pb_avst_sink_valid_1d  <= pb_avst_sink_valid    ;
  pb_avst_sink_valid_2d  <= pb_avst_sink_valid_1d ;
  pb_avst_sink_valid_3d  <= pb_avst_sink_valid_2d ;
  pb_avst_sink_valid_4d  <= pb_avst_sink_valid_3d ;
  pb_avst_sink_valid_5d  <= pb_avst_sink_valid_4d ;
  pb_avst_sink_valid_6d  <= pb_avst_sink_valid_5d ;
 end   
end


always @ (posedge clk_dsp)begin
 if (~rst_dsp_n)begin
   pb_avst_source_channel_reg <= 2'd3 ;
 end 
else if (pb_avst_sink_valid) begin
   pb_avst_source_channel_reg <= pb_avst_source_channel_reg + 1'b1 ;
 end   
end

assign pb_avst_source_channel = {6'b0, pb_avst_source_channel_reg} ;

endmodule





