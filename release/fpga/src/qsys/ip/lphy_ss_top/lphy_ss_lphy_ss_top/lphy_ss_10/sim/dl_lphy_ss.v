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
 
module dl_lphy_ss
(
   clk_dsp                                ,
   rst_dsp_n                              ,                            
   
   rst_soft_n                             ,
   
   clk_csr                                ,
   rst_csr_n                              ,
   
   clk_eth_xran                           ,
   rst_eth_xran_n                         ,
   
    // Stream Input                       
   avst_sink_valid                        ,
   avst_sink_data                         ,
   avst_sink_channel                      ,
   avst_sink_ready                        ,
   avst_sink_endofpacket                  ,
   avst_sink_startofpacket                ,

   xran_demapper_sts_prb_dout             ,
   xran_demapper_sts_prb_vout             ,

   xran_demapper_sts_frame_dout           ,
   xran_demapper_sts_frame_vout           ,

   xran_demapper_c_plane_metad            ,
   xran_demapper_c_plane_metav            ,
   xran_demapper_cplane_vout              ,
   xran_demapper_cplane_dout              ,
   xran_demapper_cplane_dout_fo           ,

   input_hfn_pulse                        ,
   
   ifft_source_valid1   				  ,
   ifft_source_data1    				  ,
   ifft_source_channel1 				  ,
   ifft_source_valid2   				  ,
   ifft_source_data2    				  ,
   ifft_source_channel2 				  ,
   
   //Capture
   cap_ifft1_out_valid                     ,
   cap_ifft1_out_data                      ,
   cap_ifft1_out_channel                   ,
   
   cap_ifft2_out_valid                     ,
   cap_ifft2_out_data                      ,
   cap_ifft2_out_channel                   ,
   
   
   ifft_l1_busIn_writedata                   ,
   ifft_l1_busIn_address                     ,
   ifft_l1_busIn_write                       ,
   ifft_l1_busIn_read                        ,
   ifft_l1_busOut_readdatavalid              ,
   ifft_l1_busOut_readdata                   ,
   ifft_l1_busOut_waitrequest                , 
   
   ifft_l2_busIn_writedata                   ,
   ifft_l2_busIn_address                     ,
   ifft_l2_busIn_write                       ,
   ifft_l2_busIn_read                        ,
   ifft_l2_busOut_readdatavalid              ,
   ifft_l2_busOut_readdata                   ,
   ifft_l2_busOut_waitrequest                , 
   
   dl_lphy_ss_source_valid1               	,
   dl_lphy_ss_source_data1                	,
   dl_lphy_ss_source_channel1             	,
   dl_lphy_ss_source_valid2               	,
   dl_lphy_ss_source_data2                	,
   dl_lphy_ss_source_channel2             	,
 
   scheduler_source_valid_1          		  ,
   scheduler_source_data_1           		  ,
   scheduler_source_channel_1        		  ,
   scheduler_source_endofpacket_1    		  ,
   scheduler_source_startofpacket_1  		  ,
   scheduler_source_valid_2          		  ,
   scheduler_source_data_2           		  ,
   scheduler_source_channel_2        		  ,
   scheduler_source_endofpacket_2    		  ,
   scheduler_source_startofpacket_2  		  ,
   
   blanking_source_valid_1          ,
   blanking_source_data_1           ,
   blanking_source_channel_1        ,
   blanking_source_endofpacket_1    ,
   blanking_source_startofpacket_1  ,
   blanking_source_valid_2          ,
   blanking_source_data_2           ,
   blanking_source_channel_2        ,
   blanking_source_endofpacket_2    ,
   blanking_source_startofpacket_2  ,
   
  // ifft_fft_lpbk_en					  ,

   blank_prb_intr						  ,
   blank_prb_flag                         ,
   
   dl_scheduler_source_ready_1            ,
   dl_scheduler_source_ready_2            ,
   
   
   //fdv_source_valid                       ,
   //fdv_source_data                        ,
   
   pb_avst_sink_valid                     ,
   pb_avst_sink_data                      ,
   scheduler_pb_sink_ready                ,
   pb_dl_scheduler_inj_sel                ,
   
   // csr interface for pattern buffer
   //dl_csr_address                         ,
   //dl_csr_write                           ,
   //dl_csr_writedata                       ,
   //dl_csr_readdata                        , 
   
   bw_config_cc1                          ,
   bw_config_cc2 						  ,
   ifft_fft_lpbk_en                       ,
   
   cp_len 				 					,
   fft_size									,
   ifft_gain_l1			 					,
   ifft_shift_l1		 					,
   ifft_gain_l2			 					,
   ifft_shift_l2		 					,
   ifft_mux_const_l1		 				,
   ifft_mux_const_l2		 				,
   ifft_muxsel_l1							,
   ifft_muxsel_l2							,
   ifft_dc_sc_en_l1 			 			, 			 					
   ifft_dc_sc_en_l2 			 			,
   blanking_dis                             ,
   
   pm_ifft_threash_mm_bridge_address_l1		    ,
   pm_ifft_threash_mm_bridge_chipselect_l1		,
   pm_ifft_threash_mm_bridge_read_l1			,
   pm_ifft_threash_mm_bridge_write_l1			,
   pm_ifft_threash_mm_bridge_writedata_l1		,
   pm_ifft_threash_mm_bridge_byteenable_l1		,
   pm_ifft_threash_mm_bridge_readdata_l1		,
   pm_ifft_threash_mm_bridge_waitrequest_l1		,
   
   pm_ifft_hist_mm_bridge_address_l1			,
   pm_ifft_hist_mm_bridge_chipselect_l1		    ,
   pm_ifft_hist_mm_bridge_read_l1				,
   pm_ifft_hist_mm_bridge_write_l1				,
   pm_ifft_hist_mm_bridge_writedata_l1			,
   pm_ifft_hist_mm_bridge_byteenable_l1		    ,
   pm_ifft_hist_mm_bridge_readdata_l1			,
   pm_ifft_hist_mm_bridge_readdatavalid_l1	,
   pm_ifft_hist_mm_bridge_waitrequest_l1		,
   
   
   
   pwr_mtr_config_csr_writedata_l1				,
   pwr_mtr_config_csr_read_l1				    ,
   pwr_mtr_config_csr_write_l1					,
   pwr_mtr_config_csr_readdata_l1				,
   pwr_mtr_config_csr_readdatavalid_l1			,
   pwr_mtr_config_csr_address_l1			    ,
   
   pm_ifft_threash_mm_bridge_address_l2		    ,
   pm_ifft_threash_mm_bridge_chipselect_l2		,
   pm_ifft_threash_mm_bridge_read_l2			,
   pm_ifft_threash_mm_bridge_write_l2			,
   pm_ifft_threash_mm_bridge_writedata_l2		,
   pm_ifft_threash_mm_bridge_byteenable_l2		,
   pm_ifft_threash_mm_bridge_readdata_l2		,
   pm_ifft_threash_mm_bridge_waitrequest_l2		,
   
   pm_ifft_hist_mm_bridge_address_l2			,
   pm_ifft_hist_mm_bridge_chipselect_l2		    ,
   pm_ifft_hist_mm_bridge_read_l2				,
   pm_ifft_hist_mm_bridge_write_l2				,
   pm_ifft_hist_mm_bridge_writedata_l2			,
   pm_ifft_hist_mm_bridge_byteenable_l2			,
   pm_ifft_hist_mm_bridge_readdata_l2			,
   pm_ifft_hist_mm_bridge_readdatavalid_l2		,
   pm_ifft_hist_mm_bridge_waitrequest_l2		,
   
   pwr_mtr_config_csr_writedata_l2				,
   pwr_mtr_config_csr_read_l2				    ,
   pwr_mtr_config_csr_write_l2					,
   pwr_mtr_config_csr_readdata_l2				,
   pwr_mtr_config_csr_readdatavalid_l2			,
   pwr_mtr_config_csr_address_l2		        ,
	
	pwr_mtr_ifft_hist_done_intr_l1,
	pwr_mtr_ifft_hist_done_intr_l2,

   ifft_rc_enable_l1 ,
   ifft_rc_enable_l2 ,
   ifft_rc_bw_sel_l1 ,
   ifft_rc_bw_sel_l2 ,
   
   pm_stat_ifft_mm_bridge_address_l1			,
   pm_stat_ifft_mm_bridge_chipselect_l1		    ,
   pm_stat_ifft_mm_bridge_read_l1				,
   pm_stat_ifft_mm_bridge_write_l1			    ,	
   pm_stat_ifft_mm_bridge_writedata_l1		    ,
   pm_stat_ifft_mm_bridge_byteenable_l1		    ,
   pm_stat_ifft_mm_bridge_readdata_l1			,
   pm_stat_ifft_mm_bridge_readdatavalid_l1			,
   pm_stat_ifft_mm_bridge_waitrequest_l1		,
   
   pm_stat_ifft_mm_bridge_address_l2			,
   pm_stat_ifft_mm_bridge_chipselect_l2		    ,
   pm_stat_ifft_mm_bridge_read_l2				,
   pm_stat_ifft_mm_bridge_write_l2			    ,	
   pm_stat_ifft_mm_bridge_writedata_l2		    ,
   pm_stat_ifft_mm_bridge_byteenable_l2		    ,
   pm_stat_ifft_mm_bridge_readdata_l2			,
   pm_stat_ifft_mm_bridge_readdatavalid_l2		,
   
   pm_stat_ifft_mm_bridge_waitrequest_l2		
   
);
//`include "../../../quartus_projects/ftile_1588_sr/def_param.vh"
//`include "def_param.vh"
`include "../common/def_param.vh"


//Parameters Declaration
parameter NUM_OF_ANT            =    4      ;
parameter NUM_OF_FFT            =    2      ;
parameter XRAN_ETH_DATAWIDTH    =    128    ;
parameter ROE_ETH_DATAWIDTH     =    128    ;

localparam IQ_DATAWIDTH         =    32     ;

input 									clk_dsp           			;
input 									rst_dsp_n         			;
input 									clk_csr           			;
input 									rst_csr_n         			;
input 									clk_eth_xran      			;
input 									rst_eth_xran_n    			;
input									rst_soft_n        			;

input                             		avst_sink_valid        		;  
input   [XRAN_ETH_DATAWIDTH -1:0 ]		avst_sink_data         		;  
input   [15 :0 ]                  		avst_sink_channel      		;  
output                            		avst_sink_ready        		;  
input                             		avst_sink_endofpacket  		;  
input                             		avst_sink_startofpacket		;  


input   [33:0 ]							xran_demapper_sts_prb_dout  ;
input          							xran_demapper_sts_prb_vout  ;

input   [31:0 ]							xran_demapper_sts_frame_dout;
input          							xran_demapper_sts_frame_vout;
input   [57:0 ]                            xran_demapper_c_plane_metad;
input                                      xran_demapper_c_plane_metav;

input         							xran_demapper_cplane_vout   ;           
input   [23:0]							xran_demapper_cplane_dout   ;           
input   [23:0]							xran_demapper_cplane_dout_fo;
 
input                          			input_hfn_pulse             ;


output                                  cap_ifft1_out_valid          ;
output  [IQ_DATAWIDTH-1:0]   			cap_ifft1_out_data           ;
output  [7:0 ]                          cap_ifft1_out_channel        ;

output                                  cap_ifft2_out_valid          ;
output  [IQ_DATAWIDTH-1:0]   			cap_ifft2_out_data           ;
output  [7:0 ]                          cap_ifft2_out_channel        ;


input   [31:0]                          ifft_l1_busIn_writedata        	;
input   [13:0 ]                         ifft_l1_busIn_address          	;
input                                   ifft_l1_busIn_write            	;
input                                   ifft_l1_busIn_read             	;
output                                  ifft_l1_busOut_readdatavalid   	;
output  [31:0]                          ifft_l1_busOut_readdata        	;
output                                  ifft_l1_busOut_waitrequest     	;
	
input   [31:0]                          ifft_l2_busIn_writedata        	;
input   [13:0 ]                         ifft_l2_busIn_address         	;
input                                   ifft_l2_busIn_write            	;
input                                   ifft_l2_busIn_read             	;
output                                  ifft_l2_busOut_readdatavalid   	;
output  [31:0]                          ifft_l2_busOut_readdata        	;
output                                  ifft_l2_busOut_waitrequest     	;	

output                                   dl_lphy_ss_source_valid1               	;
output    [IQ_DATAWIDTH-1:0]   		     dl_lphy_ss_source_data1                	;
output    [7:0 ]                         dl_lphy_ss_source_channel1             	;
output                                   dl_lphy_ss_source_valid2               	;
output    [IQ_DATAWIDTH-1:0]   		     dl_lphy_ss_source_data2                	;
output    [7:0 ]                         dl_lphy_ss_source_channel2             	;	

// scheduler output L1
output                                  scheduler_source_valid_1          ;
output  [IQ_DATAWIDTH-1:0] 				scheduler_source_data_1           ;
output  [7:0 ]                          scheduler_source_channel_1        ;
output                                  scheduler_source_endofpacket_1    ;
output                                  scheduler_source_startofpacket_1  ;
// scheduler output L2
output                                  scheduler_source_valid_2          ;
output  [IQ_DATAWIDTH-1:0] 				scheduler_source_data_2           ;
output  [7:0 ]                          scheduler_source_channel_2        ;
output                                  scheduler_source_endofpacket_2    ;
output                                  scheduler_source_startofpacket_2  ;

output                                    blanking_source_valid_1          ;
output    [IQ_DATAWIDTH-1:0] 			  blanking_source_data_1           ;
output    [7:0 ]                          blanking_source_channel_1        ;
output                                    blanking_source_endofpacket_1    ;
output                                    blanking_source_startofpacket_1  ;

output                                    blanking_source_valid_2          ;
output    [IQ_DATAWIDTH-1:0] 			  blanking_source_data_2           ;
output    [7:0 ]                          blanking_source_channel_2        ;
output                                    blanking_source_endofpacket_2    ;
output                                    blanking_source_startofpacket_2  ;



//output                                  scheduler_source_ready          ;
input                                   dl_scheduler_source_ready_1            ;    // output from ul buffer
input                                   dl_scheduler_source_ready_2            ;    // output from ul buffer

output                                  ifft_source_valid1              ;
output    [IQ_DATAWIDTH-1:0]   			ifft_source_data1               ;
output    [7:0 ]                        ifft_source_channel1            ;
output                                  ifft_source_valid2              ;
output    [IQ_DATAWIDTH-1:0]   			ifft_source_data2               ;
output    [7:0 ]                     	ifft_source_channel2            ;

//output wire								ifft_fft_lpbk_en			;

output 									blank_prb_intr				;
output  [31:0] 							blank_prb_flag				;

// for capturing in wrapper top
//output                                    fdv_source_valid          ;
//output    [IQ_DATAWIDTH*NUM_OF_FFT-1:0]   fdv_source_data           ;

// ddr based pattern buffer injection
input 								    pb_avst_sink_valid          ;
input 	[255:0]						    pb_avst_sink_data           ;
output								    scheduler_pb_sink_ready     ;
input                                   pb_dl_scheduler_inj_sel     ;


//input   [3 :0]      				       dl_csr_address         	    ;
//input               				       dl_csr_write           	    ;
//input      [31:0]      				   dl_csr_writedata       	    ;
//output reg [31:0]      				   dl_csr_readdata        	    ;

input wire [7:0]                            bw_config_cc1                ;
input wire [7:0]                            bw_config_cc2                ;
input                                       ifft_fft_lpbk_en             ;

input wire [10:0] 							cp_len 				;	
input wire [3:0]							fft_size			;
input wire [31:0] 							ifft_gain_l1		;	
input wire [3:0] 							ifft_shift_l1		;	
input wire [31:0] 							ifft_gain_l2		;	
input wire [3:0] 							ifft_shift_l2		;	
input wire [31:0] 							ifft_mux_const_l1	;
input wire [31:0] 							ifft_mux_const_l2	;	
input wire									ifft_muxsel_l1		;
input wire									ifft_muxsel_l2		;
input 		 								ifft_dc_sc_en_l1 			;
input 		 								ifft_dc_sc_en_l2 			;	

input                                       blanking_dis        ;

input  			[5:0]   	        pm_ifft_threash_mm_bridge_address_l1		;
input  			         	        pm_ifft_threash_mm_bridge_chipselect_l1		;
input  			         	        pm_ifft_threash_mm_bridge_read_l1			;
input  			         	        pm_ifft_threash_mm_bridge_write_l1			;	
input  			[31:0] 	            pm_ifft_threash_mm_bridge_writedata_l1		;
input  			[3:0]    	        pm_ifft_threash_mm_bridge_byteenable_l1		;
output 			[31:0] 	            pm_ifft_threash_mm_bridge_readdata_l1		;
output 			         	        pm_ifft_threash_mm_bridge_waitrequest_l1	;

input  			[11:0]  			pm_ifft_hist_mm_bridge_address_l1			;
input  			         			pm_ifft_hist_mm_bridge_chipselect_l1		;
input  			         			pm_ifft_hist_mm_bridge_read_l1				;
input  			         			pm_ifft_hist_mm_bridge_write_l1				;	
input  			[31:0] 				pm_ifft_hist_mm_bridge_writedata_l1			;
input  			[3:0]    			pm_ifft_hist_mm_bridge_byteenable_l1		;
output 			[31:0] 				pm_ifft_hist_mm_bridge_readdata_l1			;
output								pm_ifft_hist_mm_bridge_readdatavalid_l1;
output 			         			pm_ifft_hist_mm_bridge_waitrequest_l1		;

input  			[9:0]  			    pm_stat_ifft_mm_bridge_address_l1			;
input  			         			pm_stat_ifft_mm_bridge_chipselect_l1		;
input  			         			pm_stat_ifft_mm_bridge_read_l1				;
input  			         			pm_stat_ifft_mm_bridge_write_l1				;	
input  			[31:0] 				pm_stat_ifft_mm_bridge_writedata_l1			;
input  			[3:0]    			pm_stat_ifft_mm_bridge_byteenable_l1		;
output 			[31:0] 				pm_stat_ifft_mm_bridge_readdata_l1			;
output								pm_stat_ifft_mm_bridge_readdatavalid_l1	;
output 			         			pm_stat_ifft_mm_bridge_waitrequest_l1		;

input 	wire 	[31:0] 				pwr_mtr_config_csr_writedata_l1				;	
input 	wire 						pwr_mtr_config_csr_read_l1				    ;
input 	wire	 					pwr_mtr_config_csr_write_l1					;
output 	    	[31:0] 				pwr_mtr_config_csr_readdata_l1				;
output 	    						pwr_mtr_config_csr_readdatavalid_l1			;	
input	wire 	[3:0] 				pwr_mtr_config_csr_address_l1			    ;

input  			[5:0]   	        pm_ifft_threash_mm_bridge_address_l2		;
input  			         	        pm_ifft_threash_mm_bridge_chipselect_l2		;
input  			         	        pm_ifft_threash_mm_bridge_read_l2			;
input  			         	        pm_ifft_threash_mm_bridge_write_l2			;	
input  			[31:0] 	            pm_ifft_threash_mm_bridge_writedata_l2		;
input  			[3:0]    	        pm_ifft_threash_mm_bridge_byteenable_l2		;
output 			[31:0] 	            pm_ifft_threash_mm_bridge_readdata_l2		;
output 			         	        pm_ifft_threash_mm_bridge_waitrequest_l2	;

input  			[11:0]  			pm_ifft_hist_mm_bridge_address_l2			;
input  			         			pm_ifft_hist_mm_bridge_chipselect_l2		;
input  			         			pm_ifft_hist_mm_bridge_read_l2				;
input  			         			pm_ifft_hist_mm_bridge_write_l2				;	
input  			[31:0] 				pm_ifft_hist_mm_bridge_writedata_l2			;
input  			[3:0]    			pm_ifft_hist_mm_bridge_byteenable_l2		;
output 			[31:0] 				pm_ifft_hist_mm_bridge_readdata_l2			;
output								pm_ifft_hist_mm_bridge_readdatavalid_l2		;
output 			         			pm_ifft_hist_mm_bridge_waitrequest_l2		;

input  			[9:0]  			    pm_stat_ifft_mm_bridge_address_l2			;
input  			         			pm_stat_ifft_mm_bridge_chipselect_l2		;
input  			         			pm_stat_ifft_mm_bridge_read_l2				;
input  			         			pm_stat_ifft_mm_bridge_write_l2			    ;	
input  			[31:0] 				pm_stat_ifft_mm_bridge_writedata_l2		    ;
input  			[3:0]    			pm_stat_ifft_mm_bridge_byteenable_l2		;
output 			[31:0] 				pm_stat_ifft_mm_bridge_readdata_l2			;
output								pm_stat_ifft_mm_bridge_readdatavalid_l2	;
output 			         			pm_stat_ifft_mm_bridge_waitrequest_l2		;

input 	wire 	[31:0] 				pwr_mtr_config_csr_writedata_l2				;	
input 	wire 						pwr_mtr_config_csr_read_l2				    ;
input 	wire	 					pwr_mtr_config_csr_write_l2					;
output 	    	[31:0] 				pwr_mtr_config_csr_readdata_l2				;
output 	    						pwr_mtr_config_csr_readdatavalid_l2			;	
input	wire 	[3:0] 				pwr_mtr_config_csr_address_l2			    ;

output wire								pwr_mtr_ifft_hist_done_intr_l1;
output wire								pwr_mtr_ifft_hist_done_intr_l2;

input ifft_rc_enable_l1   ;
input ifft_rc_enable_l2   ;
input [3:0] ifft_rc_bw_sel_l1   ;
input [3:0] ifft_rc_bw_sel_l2   ;

wire                                    avst_sink_ready             	;  
	
wire                                    cap_ifft_in_valid           	;
wire    [IQ_DATAWIDTH*NUM_OF_FFT-1:0]   cap_ifft_in_data            	;
wire    [7:0 ]                          cap_ifft_in_channel         	;
wire                                    cap_ifft_in_startofpacket   	;
wire                                    cap_ifft_in_endofpacket     	;
	
wire                                    cap_ifft_out_valid          	;
wire    [IQ_DATAWIDTH-1:0]   			cap_ifft_out_data           	;
wire    [7:0 ]                          cap_ifft_out_channel        	;
wire                                    cap_ifft_out_startofpacket  	;
wire                                    cap_ifft_out_endofpacket    	;


wire                                    fdv_source_valid_1              ;
wire                                    fdv_source_valid_2              ;
wire    [IQ_DATAWIDTH-1:0] 				fdv_source_data_1               ;
wire    [IQ_DATAWIDTH-1:0] 				fdv_source_data_2               ;
wire                                    fdv_source_ready_1              ;
wire                                    fdv_source_ready_2              ;


wire                                    scheduler_source_valid_1          ;
wire    [IQ_DATAWIDTH-1:0] 				scheduler_source_data_1           ;
wire    [7:0 ]                          scheduler_source_channel_1        ;

wire                                    scheduler_source_valid_2          ;
wire    [IQ_DATAWIDTH-1:0] 				scheduler_source_data_2           ;
wire    [7:0 ]                          scheduler_source_channel_2        ;

wire                                    scheduler_source_endofpacket_1    ;
wire                                    scheduler_source_startofpacket_1  ;
wire                                    scheduler_source_endofpacket_2    ;
wire                                    scheduler_source_startofpacket_2  ;

wire                                    blanking_source_valid_1          ;
wire    [IQ_DATAWIDTH-1:0] 				blanking_source_data_1           ;
wire    [7:0 ]                          blanking_source_channel_1        ;

wire                                    blanking_source_valid_2          ;
wire    [IQ_DATAWIDTH-1:0] 				blanking_source_data_2           ;
wire    [7:0 ]                          blanking_source_channel_2        ;

wire                                    blanking_source_endofpacket_1    ;
wire                                    blanking_source_startofpacket_1  ;
wire                                    blanking_source_endofpacket_2    ;
wire                                    blanking_source_startofpacket_2  ;


wire                                    scheduler_source_ready          ;

reg                                     scheduler_source_valid_1_1d           ;
reg                                     scheduler_source_valid_1_2d           ;
reg                                     scheduler_source_valid_1_3d           ;
reg                                     scheduler_source_valid_1_4d           ;
reg                                     scheduler_source_valid_1_5d           ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_1_1d            ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_1_2d            ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_1_3d            ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_1_4d            ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_1_5d            ;
reg     [7:0 ]                          scheduler_source_channel_1_1d         ;
reg     [7:0 ]                          scheduler_source_channel_1_2d         ;
reg     [7:0 ]                          scheduler_source_channel_1_3d         ;
reg     [7:0 ]                          scheduler_source_channel_1_4d         ;
reg     [7:0 ]                          scheduler_source_channel_1_5d         ;
reg                                     scheduler_source_endofpacket_1_1d     ;
reg                                     scheduler_source_endofpacket_1_2d     ;
reg                                     scheduler_source_endofpacket_1_3d     ;
reg                                     scheduler_source_endofpacket_1_4d     ;
reg                                     scheduler_source_endofpacket_1_5d     ;
reg                                     scheduler_source_startofpacket_1_1d   ;
reg                                     scheduler_source_startofpacket_1_2d   ;
reg                                     scheduler_source_startofpacket_1_3d   ;
reg                                     scheduler_source_startofpacket_1_4d   ;
reg                                     scheduler_source_startofpacket_1_5d   ;
reg                                     scheduler_source_valid_2_1d           ;
reg                                     scheduler_source_valid_2_2d           ;
reg                                     scheduler_source_valid_2_3d           ;
reg                                     scheduler_source_valid_2_4d           ;
reg                                     scheduler_source_valid_2_5d           ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_2_1d            ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_2_2d            ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_2_3d            ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_2_4d            ;
reg     [IQ_DATAWIDTH-1:0] 				scheduler_source_data_2_5d            ;
reg     [7:0 ]                          scheduler_source_channel_2_1d         ;
reg     [7:0 ]                          scheduler_source_channel_2_2d         ;
reg     [7:0 ]                          scheduler_source_channel_2_3d         ;
reg     [7:0 ]                          scheduler_source_channel_2_4d         ;
reg     [7:0 ]                          scheduler_source_channel_2_5d         ;
reg                                     scheduler_source_endofpacket_2_1d     ;
reg                                     scheduler_source_endofpacket_2_2d     ;
reg                                     scheduler_source_endofpacket_2_3d     ;
reg                                     scheduler_source_endofpacket_2_4d     ;
reg                                     scheduler_source_endofpacket_2_5d     ;
reg                                     scheduler_source_startofpacket_2_1d   ;
reg                                     scheduler_source_startofpacket_2_2d   ;
reg                                     scheduler_source_startofpacket_2_3d   ;
reg                                     scheduler_source_startofpacket_2_4d   ;
reg                                     scheduler_source_startofpacket_2_5d   ;




reg                                     avst_sink_valid_1d                  ;
reg                                     avst_sink_valid_2d                  ;
reg                                     avst_sink_valid_3d                  ;
reg                                     avst_sink_valid_4d                  ;
reg                                     avst_sink_valid_5d                  ;
reg     [XRAN_ETH_DATAWIDTH -1:0 ]      avst_sink_data_1d                   ;
reg     [XRAN_ETH_DATAWIDTH -1:0 ]      avst_sink_data_2d                   ;
reg     [XRAN_ETH_DATAWIDTH -1:0 ]      avst_sink_data_3d                   ;
reg     [XRAN_ETH_DATAWIDTH -1:0 ]      avst_sink_data_4d                   ;
reg     [XRAN_ETH_DATAWIDTH -1:0 ]      avst_sink_data_5d                   ;
reg     [15:0 ]                         avst_sink_channel_1d                ;
reg     [15:0 ]                         avst_sink_channel_2d                ;
reg     [15:0 ]                         avst_sink_channel_3d                ;
reg     [15:0 ]                         avst_sink_channel_4d                ;
reg     [15:0 ]                         avst_sink_channel_5d                ;
reg                                     avst_sink_endofpacket_1d            ;
reg                                     avst_sink_endofpacket_2d            ;
reg                                     avst_sink_endofpacket_3d            ;
reg                                     avst_sink_endofpacket_4d            ;
reg                                     avst_sink_endofpacket_5d            ;
reg                                     avst_sink_startofpacket_1d          ;
reg                                     avst_sink_startofpacket_2d          ;
reg                                     avst_sink_startofpacket_3d          ;
reg                                     avst_sink_startofpacket_4d          ;
reg                                     avst_sink_startofpacket_5d          ;

reg         [33:0]                      xran_demapper_sts_prb_dout_1d       ;
reg         [33:0]                      xran_demapper_sts_prb_dout_2d       ;
reg         [33:0]                      xran_demapper_sts_prb_dout_3d       ;
reg         [33:0]                      xran_demapper_sts_prb_dout_4d       ;
reg         [33:0]                      xran_demapper_sts_prb_dout_5d       ;

reg                                     xran_demapper_sts_prb_vout_1d       ;
reg                                     xran_demapper_sts_prb_vout_2d       ;
reg                                     xran_demapper_sts_prb_vout_3d       ;
reg                                     xran_demapper_sts_prb_vout_4d       ;
reg                                     xran_demapper_sts_prb_vout_5d       ;

reg         [31:0]                      xran_demapper_sts_frame_dout_1d     ;
reg         [31:0]                      xran_demapper_sts_frame_dout_2d     ;
reg         [31:0]                      xran_demapper_sts_frame_dout_3d     ;
reg         [31:0]                      xran_demapper_sts_frame_dout_4d     ;
reg         [31:0]                      xran_demapper_sts_frame_dout_5d     ;

reg                                     xran_demapper_sts_frame_vout_1d     ;
reg                                     xran_demapper_sts_frame_vout_2d     ;
reg                                     xran_demapper_sts_frame_vout_3d     ;
reg                                     xran_demapper_sts_frame_vout_4d     ;
reg                                     xran_demapper_sts_frame_vout_5d     ;

reg         [57:0]                      xran_demapper_c_plane_metad_1d      ;
reg         [57:0]                      xran_demapper_c_plane_metad_2d      ;
reg                                     xran_demapper_c_plane_metav_1d      ;
reg                                     xran_demapper_c_plane_metav_2d      ;
reg                                     pattern_buffer_sel                  ;
reg                                     pattern_buffer_sel_1d               ;
reg                                     pattern_buffer_sel_2d               ;

reg 									ifft_fft_lpbk_en_1d                 ;
reg 									ifft_fft_lpbk_en_2d                 ;

 wire                                   ifft_source_valid1               	;
 wire    [IQ_DATAWIDTH-1:0]   			ifft_source_data1                	;
 wire    [7:0 ]                         ifft_source_channel1             	;
 wire                                   ifft_source_valid2               	;
 wire    [IQ_DATAWIDTH-1:0]   			ifft_source_data2                	;
 wire    [7:0 ]                         ifft_source_channel2             	;
 
 
wire                                    c_valid                        		;
wire    [3:0]                           size                            	;
wire    [15:0]                          cplength                        	;


wire 									c_plane_info_valid					;
wire [15:0]                             c_cplength                      	;
wire [3:0]                              c_fftsize                       	;
	
wire [3:0]								sizeout_s							;
	
(*preserve_syn_only*)  reg    			rst_dsp_n_1d_dup1               	;
(*preserve_syn_only*)  reg     			rst_dsp_n_2d_dup1               	;	
(*preserve_syn_only*)  reg    			rst_dsp_n_1d_dup2               	;
(*preserve_syn_only*)  reg     			rst_dsp_n_2d_dup2               	;
	
(*preserve_syn_only*) reg    			rst_dsp_n_1d_dup3               	;
(*preserve_syn_only*) reg   			rst_dsp_n_2d_dup3               	;
	
(*preserve_syn_only*) reg               rst_dsp_n_1d_dup4               	;
(*preserve_syn_only*) reg               rst_dsp_n_2d_dup4               	;
	
reg                                     rst_eth_xran_n_1d_dup1          	;
reg                                     rst_eth_xran_n_2d_dup1          	;
	
reg                                     rst_eth_xran_n_1d_dup2          	;
reg                                     rst_eth_xran_n_2d_dup2          	;
		

wire 	[31:0] 							blank_prb_flag						;
wire 									blank_prb_intr						;

wire                                    dl_scheduler_sink_valid_1           ;
wire                                    dl_scheduler_sink_valid_2           ;
wire      [31:0]                        dl_scheduler_sink_data_1            ;
wire      [31:0]                        dl_scheduler_sink_data_2            ;

wire									scheduler_pb_sink_ready				;


reg  [1:0]									blanking_cplane_axc_11;
reg  [1:0]									blanking_cplane_axc_12;
reg											blanking_cplane_valid_l1;
reg											blanking_cplane_valid_l2;


always @ (posedge clk_dsp)
begin : PIPE_DELAY
if (rst_dsp_n_2d_dup1 == 1'b0) 
    begin 
	scheduler_source_valid_1_1d           <=    'b0                           ;
	scheduler_source_valid_1_2d           <=    'b0                           ;
	scheduler_source_valid_1_3d           <=    'b0                           ;
	scheduler_source_valid_1_4d           <=    'b0                           ;
	scheduler_source_valid_1_5d           <=    'b0                           ;
	scheduler_source_data_1_1d            <=    'b0                           ;
	scheduler_source_data_1_2d            <=    'b0                           ;
	scheduler_source_data_1_3d            <=    'b0                           ;
	scheduler_source_data_1_4d            <=    'b0                           ;
	scheduler_source_data_1_5d            <=    'b0                           ;
	scheduler_source_channel_1_1d         <=    'b0                           ;
	scheduler_source_channel_1_2d         <=    'b0                           ;
	scheduler_source_channel_1_3d         <=    'b0                           ;
	scheduler_source_channel_1_4d         <=    'b0                           ;
	scheduler_source_channel_1_5d         <=    'b0                           ;
	scheduler_source_endofpacket_1_1d     <=    'b0                           ;
	scheduler_source_endofpacket_1_2d     <=    'b0                           ;
	scheduler_source_endofpacket_1_3d     <=    'b0                           ;
	scheduler_source_endofpacket_1_4d     <=    'b0                           ;
	scheduler_source_endofpacket_1_5d     <=    'b0                           ;
	scheduler_source_startofpacket_1_1d   <=    'b0                           ;
	scheduler_source_startofpacket_1_2d   <=    'b0                           ;
	scheduler_source_startofpacket_1_3d   <=    'b0                           ;
	scheduler_source_startofpacket_1_4d   <=    'b0                           ;
	scheduler_source_startofpacket_1_5d   <=    'b0                           ;
	scheduler_source_valid_2_1d           <=    'b0                           ;
	scheduler_source_valid_2_2d           <=    'b0                           ;
	scheduler_source_valid_2_3d           <=    'b0                           ;
	scheduler_source_valid_2_4d           <=    'b0                           ;
	scheduler_source_valid_2_5d           <=    'b0                           ;
	scheduler_source_data_2_1d            <=    'b0                           ;
	scheduler_source_data_2_2d            <=    'b0                           ;
	scheduler_source_data_2_3d            <=    'b0                           ;
	scheduler_source_data_2_4d            <=    'b0                           ;
	scheduler_source_data_2_5d            <=    'b0                           ;
	scheduler_source_channel_2_1d         <=    'b0                           ;
	scheduler_source_channel_2_2d         <=    'b0                           ;
	scheduler_source_channel_2_3d         <=    'b0                           ;
	scheduler_source_channel_2_4d         <=    'b0                           ;
	scheduler_source_channel_2_5d         <=    'b0                           ;
	scheduler_source_endofpacket_2_1d     <=    'b0                           ;
	scheduler_source_endofpacket_2_2d     <=    'b0                           ;
	scheduler_source_endofpacket_2_3d     <=    'b0                           ;
	scheduler_source_endofpacket_2_4d     <=    'b0                           ;
	scheduler_source_endofpacket_2_5d     <=    'b0                           ;
	scheduler_source_startofpacket_2_1d   <=    'b0                           ;
	scheduler_source_startofpacket_2_2d   <=    'b0                           ;
	scheduler_source_startofpacket_2_3d   <=    'b0                           ;
	scheduler_source_startofpacket_2_4d   <=    'b0                           ;
	scheduler_source_startofpacket_2_5d   <=    'b0                           ;
 end
	else
     begin
    scheduler_source_valid_1_1d           <= scheduler_source_valid_1            ;
    scheduler_source_valid_1_2d           <= scheduler_source_valid_1_1d         ;
    scheduler_source_valid_1_3d           <= scheduler_source_valid_1_2d         ;
    scheduler_source_valid_1_4d           <= scheduler_source_valid_1_3d         ;
    scheduler_source_valid_1_5d           <= scheduler_source_valid_1_4d         ;
    scheduler_source_data_1_1d            <= scheduler_source_data_1             ;
    scheduler_source_data_1_2d            <= scheduler_source_data_1_1d          ;
    scheduler_source_data_1_3d            <= scheduler_source_data_1_2d          ;
    scheduler_source_data_1_4d            <= scheduler_source_data_1_3d          ;
    scheduler_source_data_1_5d            <= scheduler_source_data_1_4d          ;
    scheduler_source_channel_1_1d         <= scheduler_source_channel_1          ;
    scheduler_source_channel_1_2d         <= scheduler_source_channel_1_1d       ;
    scheduler_source_channel_1_3d         <= scheduler_source_channel_1_2d       ;
    scheduler_source_channel_1_4d         <= scheduler_source_channel_1_3d       ;
    scheduler_source_channel_1_5d         <= scheduler_source_channel_1_4d       ;
    scheduler_source_endofpacket_1_1d     <= scheduler_source_endofpacket_1      ;
    scheduler_source_endofpacket_1_2d     <= scheduler_source_endofpacket_1_1d   ;
    scheduler_source_endofpacket_1_3d     <= scheduler_source_endofpacket_1_2d   ;
    scheduler_source_endofpacket_1_4d     <= scheduler_source_endofpacket_1_3d   ;
    scheduler_source_endofpacket_1_5d     <= scheduler_source_endofpacket_1_4d   ;
    scheduler_source_startofpacket_1_1d   <= scheduler_source_startofpacket_1    ;
    scheduler_source_startofpacket_1_2d   <= scheduler_source_startofpacket_1_1d ;
    scheduler_source_startofpacket_1_3d   <= scheduler_source_startofpacket_1_2d ;
    scheduler_source_startofpacket_1_4d   <= scheduler_source_startofpacket_1_3d ;
    scheduler_source_startofpacket_1_5d   <= scheduler_source_startofpacket_1_4d ;
	scheduler_source_valid_2_1d           <= scheduler_source_valid_2            ;
    scheduler_source_valid_2_2d           <= scheduler_source_valid_2_1d         ;
    scheduler_source_valid_2_3d           <= scheduler_source_valid_2_2d         ;
    scheduler_source_valid_2_4d           <= scheduler_source_valid_2_3d         ;
    scheduler_source_valid_2_5d           <= scheduler_source_valid_2_4d         ;
    scheduler_source_data_2_1d            <= scheduler_source_data_2             ;
    scheduler_source_data_2_2d            <= scheduler_source_data_2_1d          ;
    scheduler_source_data_2_3d            <= scheduler_source_data_2_2d          ;
    scheduler_source_data_2_4d            <= scheduler_source_data_2_3d          ;
    scheduler_source_data_2_5d            <= scheduler_source_data_2_4d          ;
    scheduler_source_channel_2_1d         <= scheduler_source_channel_2          ;
    scheduler_source_channel_2_2d         <= scheduler_source_channel_2_1d       ;
    scheduler_source_channel_2_3d         <= scheduler_source_channel_2_2d       ;
    scheduler_source_channel_2_4d         <= scheduler_source_channel_2_3d       ;
    scheduler_source_channel_2_5d         <= scheduler_source_channel_2_4d       ;
    scheduler_source_endofpacket_2_1d     <= scheduler_source_endofpacket_2      ;
    scheduler_source_endofpacket_2_2d     <= scheduler_source_endofpacket_2_1d   ;
    scheduler_source_endofpacket_2_3d     <= scheduler_source_endofpacket_2_2d   ;
    scheduler_source_endofpacket_2_4d     <= scheduler_source_endofpacket_2_3d   ;
    scheduler_source_endofpacket_2_5d     <= scheduler_source_endofpacket_2_4d   ;
    scheduler_source_startofpacket_2_1d   <= scheduler_source_startofpacket_2    ;
    scheduler_source_startofpacket_2_2d   <= scheduler_source_startofpacket_2_1d ;
    scheduler_source_startofpacket_2_3d   <= scheduler_source_startofpacket_2_2d ;
    scheduler_source_startofpacket_2_4d   <= scheduler_source_startofpacket_2_3d ;
    scheduler_source_startofpacket_2_5d   <= scheduler_source_startofpacket_2_4d ;
end
end

always @ (posedge clk_eth_xran)
begin : ETH_XRAN_PIPE_DELAY
if (rst_eth_xran_n_2d_dup1  == 1'b0) 
    begin
		avst_sink_valid_1d           <=      'b0;
		avst_sink_valid_2d           <=      'b0;
		avst_sink_valid_3d           <=      'b0;
		avst_sink_valid_4d           <=      'b0;
		avst_sink_valid_5d           <=      'b0;
		avst_sink_data_1d            <=      'b0;
		avst_sink_data_2d            <=      'b0;
		avst_sink_data_3d            <=      'b0;
		avst_sink_data_4d            <=      'b0;
		avst_sink_data_5d            <=      'b0;
		avst_sink_channel_1d         <=      'b0;
		avst_sink_channel_2d         <=      'b0;
		avst_sink_channel_3d         <=      'b0;
		avst_sink_channel_4d         <=      'b0;
		avst_sink_channel_5d         <=      'b0;
		avst_sink_endofpacket_1d     <=      'b0;
		avst_sink_endofpacket_2d     <=      'b0;
		avst_sink_endofpacket_3d     <=      'b0;
		avst_sink_endofpacket_4d     <=      'b0;
		avst_sink_endofpacket_5d     <=      'b0;
		avst_sink_startofpacket_1d   <=      'b0;
		avst_sink_startofpacket_2d   <=      'b0;
		avst_sink_startofpacket_3d   <=      'b0;
		avst_sink_startofpacket_4d   <=      'b0;
		avst_sink_startofpacket_5d   <=      'b0;
		xran_demapper_sts_frame_vout_1d <=   'b0;
		xran_demapper_sts_frame_vout_2d <=   'b0;
		xran_demapper_sts_frame_vout_3d <=   'b0;
		xran_demapper_sts_frame_vout_4d <=   'b0;
		xran_demapper_sts_frame_vout_5d <=   'b0;
		xran_demapper_sts_frame_dout_1d <=   'b0;
		xran_demapper_sts_frame_dout_2d <=   'b0;
		xran_demapper_sts_frame_dout_3d <=   'b0;
		xran_demapper_sts_frame_dout_4d <=   'b0;
		xran_demapper_sts_frame_dout_5d <=   'b0;
		xran_demapper_sts_prb_vout_1d <=     'b0;
		xran_demapper_sts_prb_vout_2d <=     'b0;
		xran_demapper_sts_prb_vout_3d <=     'b0;
		xran_demapper_sts_prb_vout_4d <=     'b0;
		xran_demapper_sts_prb_vout_5d <=     'b0;
		xran_demapper_sts_prb_dout_1d <=     'b0;
		xran_demapper_sts_prb_dout_2d <=     'b0;
		xran_demapper_sts_prb_dout_3d <=     'b0;
		xran_demapper_sts_prb_dout_4d <=     'b0;
		xran_demapper_sts_prb_dout_5d <=     'b0;
        xran_demapper_c_plane_metad_1d <=   50'b0;
        xran_demapper_c_plane_metad_2d <=   50'b0;
        xran_demapper_c_plane_metav_1d <=    1'b0;
        xran_demapper_c_plane_metav_2d <=    1'b0;
end
  else
    begin
		avst_sink_valid_1d           <= avst_sink_valid            ;
		avst_sink_valid_2d           <= avst_sink_valid_1d         ;
		avst_sink_valid_3d           <= avst_sink_valid_2d         ;
		avst_sink_valid_4d           <= avst_sink_valid_3d         ;
		avst_sink_valid_5d           <= avst_sink_valid_4d         ;
		avst_sink_data_1d            <= avst_sink_data             ;
		avst_sink_data_2d            <= avst_sink_data_1d          ;
		avst_sink_data_3d            <= avst_sink_data_2d          ;
		avst_sink_data_4d            <= avst_sink_data_3d          ;
		avst_sink_data_5d            <= avst_sink_data_4d          ;
		avst_sink_channel_1d         <= avst_sink_channel          ;
		avst_sink_channel_2d         <= avst_sink_channel_1d       ;
		avst_sink_channel_3d         <= avst_sink_channel_2d       ;
		avst_sink_channel_4d         <= avst_sink_channel_3d       ;
		avst_sink_channel_5d         <= avst_sink_channel_4d       ;
		avst_sink_endofpacket_1d     <= avst_sink_endofpacket      ;
		avst_sink_endofpacket_2d     <= avst_sink_endofpacket_1d   ;
		avst_sink_endofpacket_3d     <= avst_sink_endofpacket_2d   ;
		avst_sink_endofpacket_4d     <= avst_sink_endofpacket_3d   ;
		avst_sink_endofpacket_5d     <= avst_sink_endofpacket_4d   ;
		avst_sink_startofpacket_1d   <= avst_sink_startofpacket    ;
		avst_sink_startofpacket_2d   <= avst_sink_startofpacket_1d ;
		avst_sink_startofpacket_3d   <= avst_sink_startofpacket_2d ;
		avst_sink_startofpacket_4d   <= avst_sink_startofpacket_3d ;
		avst_sink_startofpacket_5d   <= avst_sink_startofpacket_4d ;
		xran_demapper_sts_frame_vout_1d <= xran_demapper_sts_frame_vout;
		xran_demapper_sts_frame_vout_2d <= xran_demapper_sts_frame_vout_1d;
		xran_demapper_sts_frame_vout_3d <= xran_demapper_sts_frame_vout_2d;
		xran_demapper_sts_frame_vout_4d <= xran_demapper_sts_frame_vout_3d;
		xran_demapper_sts_frame_vout_5d <= xran_demapper_sts_frame_vout_4d;
		xran_demapper_sts_frame_dout_1d <= xran_demapper_sts_frame_dout;
		xran_demapper_sts_frame_dout_2d <= xran_demapper_sts_frame_dout_1d;
		xran_demapper_sts_frame_dout_3d <= xran_demapper_sts_frame_dout_2d;
		xran_demapper_sts_frame_dout_4d <= xran_demapper_sts_frame_dout_3d;
		xran_demapper_sts_frame_dout_5d <= xran_demapper_sts_frame_dout_4d;
		xran_demapper_sts_prb_vout_1d <= xran_demapper_sts_prb_vout;
		xran_demapper_sts_prb_vout_2d <= xran_demapper_sts_prb_vout_1d;
		xran_demapper_sts_prb_vout_3d <= xran_demapper_sts_prb_vout_2d;
		xran_demapper_sts_prb_vout_4d <= xran_demapper_sts_prb_vout_3d;
		xran_demapper_sts_prb_vout_5d <= xran_demapper_sts_prb_vout_4d;
		xran_demapper_sts_prb_dout_1d <= xran_demapper_sts_prb_dout;
		xran_demapper_sts_prb_dout_2d <= xran_demapper_sts_prb_dout_1d;
		xran_demapper_sts_prb_dout_3d <= xran_demapper_sts_prb_dout_2d;
		xran_demapper_sts_prb_dout_4d <= xran_demapper_sts_prb_dout_3d;
		xran_demapper_sts_prb_dout_5d <= xran_demapper_sts_prb_dout_4d;
        xran_demapper_c_plane_metad_1d <=   xran_demapper_c_plane_metad;
        xran_demapper_c_plane_metad_2d <=   xran_demapper_c_plane_metad_1d;
        xran_demapper_c_plane_metav_1d <=   xran_demapper_c_plane_metav;
        xran_demapper_c_plane_metav_2d <=   xran_demapper_c_plane_metav_1d;
   end
end







always @ (posedge clk_dsp)
		begin
		    rst_dsp_n_1d_dup1 <= rst_dsp_n;
			rst_dsp_n_2d_dup1 <= rst_dsp_n_1d_dup1;	
			
		    rst_dsp_n_1d_dup2 <= rst_dsp_n;
			rst_dsp_n_2d_dup2 <= rst_dsp_n_1d_dup2;	
			
		    rst_dsp_n_1d_dup3 <= rst_dsp_n;
			rst_dsp_n_2d_dup3 <= rst_dsp_n_1d_dup3;
			
			rst_dsp_n_1d_dup4 <= rst_dsp_n;
			rst_dsp_n_2d_dup4 <= rst_dsp_n_1d_dup4;	
		end	
	
always @ (posedge clk_eth_xran)
		begin						
		    rst_eth_xran_n_1d_dup1 <= rst_eth_xran_n;
			rst_eth_xran_n_2d_dup1 <= rst_eth_xran_n_1d_dup1;	
			
		    rst_eth_xran_n_1d_dup2 <= rst_eth_xran_n;
			rst_eth_xran_n_2d_dup2 <= rst_eth_xran_n_1d_dup2;																		
		end
		
		


dl_fdv_buffer 
#(
    .NUM_OF_ANT         (NUM_OF_ANT         ),
    .NUM_OF_IF          (NUM_OF_FFT         ),
    .ETH_DATAWIDTH      (XRAN_ETH_DATAWIDTH )
)
u_dl_fdv_buffer
(
    .clk_eth                            (clk_eth_xran                  		),
    .rst_eth_n                          (rst_eth_xran_n_2d_dup2        		),
    .clk_dsp                            (clk_dsp                       		),
    .rst_dsp_n                          (rst_dsp_n_2d_dup1			   		),
    .avst_sink_valid                    (avst_sink_valid_5d            		),
    .avst_sink_data                     (avst_sink_data_5d             		),
    .avst_sink_channel                  (avst_sink_channel_5d          		),
    .avst_sink_ready                    (avst_sink_ready               		),
    .avst_sink_endofpacket              (avst_sink_endofpacket_5d      		),
    .avst_sink_startofpacket            (avst_sink_startofpacket_5d    		),
    .xran_demapper_sts_prb_dout         (xran_demapper_sts_prb_dout_5d    	),
    .xran_demapper_sts_prb_vout         (xran_demapper_sts_prb_vout_5d    	),
    .xran_demapper_sts_frame_dout       (xran_demapper_sts_frame_dout_5d  	), 
    .xran_demapper_sts_frame_vout       (xran_demapper_sts_frame_vout_5d  	),
    .xran_demapper_c_plane_metad        (xran_demapper_c_plane_metad_2d       ),
    .xran_demapper_c_plane_metav        (xran_demapper_c_plane_metav_2d       ),
    .avst_source_valid_1                (fdv_source_valid_1              	),
	.avst_source_valid_2                (fdv_source_valid_2              	),
    .avst_source_data_1                 (fdv_source_data_1               	),
	.avst_source_data_2                 (fdv_source_data_2               	),
    .avst_source_ready_1                (fdv_source_ready_1              	),
	.avst_source_ready_2                (fdv_source_ready_2              	),
	.xran_demapper_cplane_vout 			(xran_demapper_cplane_vout			),
	.xran_demapper_cplane_dout			(xran_demapper_cplane_dout			),
	.xran_demapper_cplane_dout_fo		(xran_demapper_cplane_dout_fo		),
	.c_plane_info_valid					(c_plane_info_valid					),
    .c_cplength							(c_cplength							),
	.c_fftsize    						(c_fftsize							),
	.blank_prb_flag 					(blank_prb_flag						),
    .blank_prb_intr						(blank_prb_intr						),
    .bw_config_cc1                      (bw_config_cc1                      ),      
	.bw_config_cc2                      (bw_config_cc2                      ),
    .blanking_dis                       (blanking_dis    					)
);


dl_ant_scheduler
#(
    .NUM_OF_ANT         (NUM_OF_ANT/NUM_OF_FFT  ), //TBD
    .NUM_OF_FFT         (NUM_OF_FFT             )
)
u_dl_ant_scheduler
(
    .clk_dsp                          (clk_dsp                      	),
    .rst_dsp_n                        (rst_dsp_n_2d_dup2            	),
    .hfn_pulse                        (input_hfn_pulse              	),
    .avst_sink_valid_1                (dl_scheduler_sink_valid_1        ),
	.avst_sink_valid_2                (dl_scheduler_sink_valid_2        ),
    .avst_sink_data_1                 (dl_scheduler_sink_data_1         ),
	.avst_sink_data_2                 (dl_scheduler_sink_data_2         ),
    .avst_sink_ready_1                (fdv_source_ready_1             	),
	.avst_sink_ready_2                (fdv_source_ready_2             	),
	.c_plane_info_valid				  (c_plane_info_valid				),
    .c_cplength						  (c_cplength						),
	.c_fftsize    					  (c_fftsize						),
	.c_valid                          (c_valid							),  // output 
    .fftsize                          (size								),  // output
	.cplength                         (cplength							),  // output
    .avst_source_valid_1              (scheduler_source_valid_1         ),
    .avst_source_data_1               (scheduler_source_data_1          ),
    .avst_source_channel_1            (scheduler_source_channel_1       ),
	.avst_source_valid_2              (scheduler_source_valid_2         ),
    .avst_source_data_2               (scheduler_source_data_2          ),
    .avst_source_channel_2            (scheduler_source_channel_2       ),
    .avst_source_ready_1                (dl_scheduler_source_ready_1        ),
	.avst_source_ready_2                (dl_scheduler_source_ready_2        ),
    .avst_source_endofpacket_1          (scheduler_source_endofpacket_1   	),
    .avst_source_startofpacket_1        (scheduler_source_startofpacket_1 	),
	.avst_source_endofpacket_2          (scheduler_source_endofpacket_2   	),
    .avst_source_startofpacket_2        (scheduler_source_startofpacket_2 	),
	.bw_config_cc1                      (bw_config_cc1                      ),      
	.bw_config_cc2                      (bw_config_cc2                      )
	
);

always@(posedge clk_eth_xran)
begin
	if(~rst_eth_xran_n_2d_dup2) begin 
			blanking_cplane_axc_11 <= 'd0;
	end else if(xran_demapper_c_plane_metav_1d) begin
		case (xran_demapper_c_plane_metad_1d[15:0])
			'd0	:	blanking_cplane_axc_11 <= 'd0;
			'd2	:	blanking_cplane_axc_11 <= 'd1;
			'd4	:	blanking_cplane_axc_11 <= 'd2;
			'd6	:	blanking_cplane_axc_11 <= 'd3;
            default: begin
				blanking_cplane_axc_11 <= 'd0;
            end
        endcase
		end
end

always@(posedge clk_eth_xran)
begin
	if(~rst_eth_xran_n_2d_dup2) begin 
			blanking_cplane_axc_12 <= 'd0;
	end else if(xran_demapper_c_plane_metav_1d) begin
		case (xran_demapper_c_plane_metad_1d[15:0])
			'd1	:	blanking_cplane_axc_12 <= 'd0;
			'd3	:	blanking_cplane_axc_12 <= 'd1;
			'd5	:	blanking_cplane_axc_12 <= 'd2;
			'd7	:	blanking_cplane_axc_12 <= 'd3;
            default: begin
				blanking_cplane_axc_12 <= 'd0;
            end
        endcase
		end
end

always@(posedge clk_eth_xran)
begin
	if(~rst_eth_xran_n_2d_dup2) begin 
			blanking_cplane_valid_l1 <= 'd0;
	end else if(xran_demapper_c_plane_metav_1d & (xran_demapper_c_plane_metad_1d[15:0] == 'd0 | xran_demapper_c_plane_metad_1d[15:0] == 'd2 | xran_demapper_c_plane_metad_1d[15:0] == 'd4 | xran_demapper_c_plane_metad_1d[15:0] == 'd6)) begin
			blanking_cplane_valid_l1 <= 'd1;
	end else begin
			blanking_cplane_valid_l1 <= 'd0;
	end
end

always@(posedge clk_eth_xran)
begin
	if(~rst_eth_xran_n_2d_dup2) begin 
			blanking_cplane_valid_l2 <= 'd0;
	end else if(xran_demapper_c_plane_metav_1d & (xran_demapper_c_plane_metad_1d[15:0] == 'd1 | xran_demapper_c_plane_metad_1d[15:0] == 'd3 | xran_demapper_c_plane_metad_1d[15:0] == 'd5 | xran_demapper_c_plane_metad_1d[15:0] == 'd7)) begin
			blanking_cplane_valid_l2 <= 'd1;
	end else begin
			blanking_cplane_valid_l2 <= 'd0;
	end
end

dl_blanking
#(	.DSP_DATAWIDTH 	(32),
	.NUM_ANT      	(4),
	.NUM_SYM		(28)
)
u_dl_blanking_l1
(	.clk_eth				(clk_eth_xran						),
	.rst_eth				(rst_eth_xran_n_2d_dup2				),
	.clk_dsp				(clk_dsp							),
	.rst_dsp				(rst_dsp_n_2d_dup2					),
	.avst_sink_valid		(scheduler_source_valid_1			),
	.avst_sink_data			(scheduler_source_data_1			),
	.avst_sink_channel		(scheduler_source_channel_1			),
	.avst_sink_sop			(scheduler_source_startofpacket_1	),
	.avst_sink_eop			(scheduler_source_endofpacket_1		),
	.avst_sink_ready		(									),
	.avst_src_valid			(blanking_source_valid_1			),
	.avst_src_data			(blanking_source_data_1				),
	.avst_src_channel		(blanking_source_channel_1			),
	.avst_src_sop			(blanking_source_startofpacket_1	),
	.avst_src_eop			(blanking_source_endofpacket_1		),
	.avst_src_ready			(									),
	.cplane_valid			(blanking_cplane_valid_l1			),
	.cplane_channel			(blanking_cplane_axc_11				),
	.cplane_metadata		(xran_demapper_c_plane_metad_2d[57:16])     
);

`ifdef NUM_CC_TWO
dl_blanking
#(	.DSP_DATAWIDTH 	(32),
	.NUM_ANT      	(4),
	.NUM_SYM		(28)
)
u_dl_blanking_l2
(	.clk_eth				(clk_eth_xran						),
	.rst_eth				(rst_eth_xran_n_2d_dup2				),
	.clk_dsp				(clk_dsp							),
	.rst_dsp				(rst_dsp_n_2d_dup2					),
	.avst_sink_valid		(scheduler_source_valid_2			),
	.avst_sink_data			(scheduler_source_data_2			),
	.avst_sink_channel		(scheduler_source_channel_2			),
	.avst_sink_sop			(scheduler_source_startofpacket_2	),
	.avst_sink_eop			(scheduler_source_endofpacket_2		),
	.avst_sink_ready		(									),
	.avst_src_valid			(blanking_source_valid_2			),
	.avst_src_data			(blanking_source_data_2				),
	.avst_src_channel		(blanking_source_channel_2			),
	.avst_src_sop			(blanking_source_startofpacket_2	),
	.avst_src_eop			(blanking_source_endofpacket_2		),
	.avst_src_ready			(									),
	.cplane_valid			(blanking_cplane_valid_l2			),
	.cplane_channel			(blanking_cplane_axc_12				),
	.cplane_metadata		(xran_demapper_c_plane_metad_2d[57:16])   
);
`endif
	
`ifndef SCH_LOOPBACK

ifft_if
#(
    .NUM_OF_ANT     (NUM_OF_ANT/NUM_OF_FFT  ),
    .NUM_OF_FFT     (NUM_OF_FFT             )
)
u_ifft_if_l1
(
    .clk_dsp                                  	(clk_dsp                       			),
    .rst_dsp_n                                	(rst_dsp_n_2d_dup3             			),
    .clk_csr                                  	(clk_csr                       			),
    .rst_csr_n                                	(rst_csr_n                     			),	
	.rst_soft_n                               	(rst_soft_n                    			),
	
    .avst_sink_valid                          	(blanking_source_valid_1				),
    .avst_sink_data                           	(blanking_source_data_1			 		),
    .avst_sink_channel                        	(blanking_source_channel_1		 		),
	.avst_sink_startofpacket					(blanking_source_startofpacket_1		),
	.avst_sink_endofpacket						(blanking_source_endofpacket_1			),
    .avst_sink_ready                          	(scheduler_source_ready        			),
	
    .ifft_avst_source_valid  					(ifft_source_valid1              		),
    .ifft_avst_source_data   					(ifft_source_data1               		),
    .ifft_avst_source_channel					(ifft_source_channel1            		),
	
    .ifft_busIn_writedata                     	(ifft_l1_busIn_writedata     			),
    .ifft_busIn_address                       	(ifft_l1_busIn_address       			),
    .ifft_busIn_write                         	(ifft_l1_busIn_write         			),
    .ifft_busIn_read                          	(ifft_l1_busIn_read          			),
    .ifft_busOut_readdatavalid                	(ifft_l1_busOut_readdatavalid			),
    .ifft_busOut_readdata                     	(ifft_l1_busOut_readdata     			),
    .ifft_busOut_waitrequest                  	(ifft_l1_busOut_waitrequest  			),
	
	
	.bw_config									(bw_config_cc1[6:0]						),

	.cp_len 									(cp_len 								),
	.fft_size									(fft_size								),
	.ifft_gain 									(ifft_gain_l1							),
	.ifft_shift 								(ifft_shift_l1 							),  
	.ifft_mux_const								(ifft_mux_const_l1						),
	.ifft_muxsel								(ifft_muxsel_l1							),  
	.dc_sc_en 									(ifft_dc_sc_en_l1 						),  
	.ripple_comp_en_s                           (ifft_rc_enable_l1						),                                         
	.rc_bw_sel_s		                        (ifft_rc_bw_sel_l1						),

	.pwr_mtr_ifft_hist_done_intr				(pwr_mtr_ifft_hist_done_intr_l1),
	.pm_ifft_threash_mm_bridge_address		(pm_ifft_threash_mm_bridge_address_l1		),
	.pm_ifft_threash_mm_bridge_chipselect	(pm_ifft_threash_mm_bridge_chipselect_l1   	),
	.pm_ifft_threash_mm_bridge_read			(pm_ifft_threash_mm_bridge_read_l1			),
	.pm_ifft_threash_mm_bridge_write		(pm_ifft_threash_mm_bridge_write_l1			),
	.pm_ifft_threash_mm_bridge_writedata	(pm_ifft_threash_mm_bridge_writedata_l1		),
	.pm_ifft_threash_mm_bridge_byteenable	(pm_ifft_threash_mm_bridge_byteenable_l1	),
	.pm_ifft_threash_mm_bridge_readdata		(pm_ifft_threash_mm_bridge_readdata_l1		),
	.pm_ifft_threash_mm_bridge_waitrequest	(pm_ifft_threash_mm_bridge_waitrequest_l1	),
											
	.pm_ifft_hist_mm_bridge_address			(pm_ifft_hist_mm_bridge_address_l1			),
	.pm_ifft_hist_mm_bridge_chipselect		(pm_ifft_hist_mm_bridge_chipselect_l1		),
	.pm_ifft_hist_mm_bridge_read			(pm_ifft_hist_mm_bridge_read_l1				),
	.pm_ifft_hist_mm_bridge_write			(pm_ifft_hist_mm_bridge_write_l1			),
	.pm_ifft_hist_mm_bridge_writedata		(pm_ifft_hist_mm_bridge_writedata_l1		),
	.pm_ifft_hist_mm_bridge_byteenable		(pm_ifft_hist_mm_bridge_byteenable_l1		),
	.pm_ifft_hist_mm_bridge_readdata	    (pm_ifft_hist_mm_bridge_readdata_l1	    	),
	.pm_ifft_hist_mm_bridge_readdatavalid	    (pm_ifft_hist_mm_bridge_readdatavalid_l1	    	),
	.pm_ifft_hist_mm_bridge_waitrequest		(pm_ifft_hist_mm_bridge_waitrequest_l1		),
	
	.pm_stat_ifft_mm_bridge_address	         (pm_stat_ifft_mm_bridge_address_l1	),	
	.pm_stat_ifft_mm_bridge_chipselect	     (pm_stat_ifft_mm_bridge_chipselect_l1	),
	.pm_stat_ifft_mm_bridge_read			 (pm_stat_ifft_mm_bridge_read_l1		),
	.pm_stat_ifft_mm_bridge_write		     (pm_stat_ifft_mm_bridge_write_l1		),
	.pm_stat_ifft_mm_bridge_writedata	     (pm_stat_ifft_mm_bridge_writedata_l1	),
	.pm_stat_ifft_mm_bridge_byteenable	     (pm_stat_ifft_mm_bridge_byteenable_l1	),
	.pm_stat_ifft_mm_bridge_readdata		 (pm_stat_ifft_mm_bridge_readdata_l1	),
	.pm_stat_ifft_mm_bridge_readdatavalid		 (pm_stat_ifft_mm_bridge_readdatavalid_l1	),
	.pm_stat_ifft_mm_bridge_waitrequest	     (pm_stat_ifft_mm_bridge_waitrequest_l1 ),
	
	
											
	.pwr_mtr_config_csr_writedata			(pwr_mtr_config_csr_writedata_l1			),
	.pwr_mtr_config_csr_read				(pwr_mtr_config_csr_read_l1					),
	.pwr_mtr_config_csr_write				(pwr_mtr_config_csr_write_l1				),
	.pwr_mtr_config_csr_readdata			(pwr_mtr_config_csr_readdata_l1				),
	.pwr_mtr_config_csr_readdatavalid		(pwr_mtr_config_csr_readdatavalid_l1		),
	.pwr_mtr_config_csr_address			    (pwr_mtr_config_csr_address_l1			  	)
	
);

`ifdef NUM_CC_TWO
ifft_if
#(
    .NUM_OF_ANT     (NUM_OF_ANT/NUM_OF_FFT  ),
    .NUM_OF_FFT     (NUM_OF_FFT             )
)
u_ifft_if_l2
(
    .clk_dsp                                  	(clk_dsp                       			),
    .rst_dsp_n                                	(rst_dsp_n_2d_dup3             			),
    .clk_csr                                  	(clk_csr                       			),
    .rst_csr_n                                	(rst_csr_n                     			),	
	.rst_soft_n                               	(rst_soft_n                    			),
	
    .avst_sink_valid                          	(blanking_source_valid_2			),
    .avst_sink_data                           	(blanking_source_data_2				),
    .avst_sink_channel                        	(blanking_source_channel_2			),
	.avst_sink_startofpacket					(blanking_source_startofpacket_2	),
	.avst_sink_endofpacket						(blanking_source_endofpacket_2		),
    .avst_sink_ready                          	(scheduler_source_ready        			),
	
    .ifft_avst_source_valid  					(ifft_source_valid2              		),
    .ifft_avst_source_data   					(ifft_source_data2               		),
    .ifft_avst_source_channel					(ifft_source_channel2            		),
	
    .ifft_busIn_writedata                     	(ifft_l2_busIn_writedata     			),
    .ifft_busIn_address                       	(ifft_l2_busIn_address       			),
    .ifft_busIn_write                         	(ifft_l2_busIn_write         			),
    .ifft_busIn_read                          	(ifft_l2_busIn_read          			),
    .ifft_busOut_readdatavalid                	(ifft_l2_busOut_readdatavalid			),
    .ifft_busOut_readdata                     	(ifft_l2_busOut_readdata     			),
    .ifft_busOut_waitrequest                  	(ifft_l2_busOut_waitrequest  			),
	
	.bw_config									(bw_config_cc2 [6:0]					),			

	.cp_len 									(cp_len 								),
	.fft_size									(fft_size								),
	.ifft_gain 									(ifft_gain_l2							),
	.ifft_shift 								(ifft_shift_l2 							),
	.ifft_mux_const								(ifft_mux_const_l2						),
	.ifft_muxsel								(ifft_muxsel_l2							),
	.dc_sc_en 									(ifft_dc_sc_en_l2 						),
	.ripple_comp_en_s                           (ifft_rc_enable_l2						),                                         
	.rc_bw_sel_s		                        (ifft_rc_bw_sel_l2						),
	.pwr_mtr_ifft_hist_done_intr				(pwr_mtr_ifft_hist_done_intr_l2),
	.pm_ifft_threash_mm_bridge_address		(pm_ifft_threash_mm_bridge_address_l2		),
	.pm_ifft_threash_mm_bridge_chipselect	(pm_ifft_threash_mm_bridge_chipselect_l2   	),
	.pm_ifft_threash_mm_bridge_read			(pm_ifft_threash_mm_bridge_read_l2			),
	.pm_ifft_threash_mm_bridge_write		(pm_ifft_threash_mm_bridge_write_l2			),
	.pm_ifft_threash_mm_bridge_writedata	(pm_ifft_threash_mm_bridge_writedata_l2		),
	.pm_ifft_threash_mm_bridge_byteenable	(pm_ifft_threash_mm_bridge_byteenable_l2	),
	.pm_ifft_threash_mm_bridge_readdata		(pm_ifft_threash_mm_bridge_readdata_l2		),
	.pm_ifft_threash_mm_bridge_waitrequest	(pm_ifft_threash_mm_bridge_waitrequest_l2	),
											
	.pm_ifft_hist_mm_bridge_address			(pm_ifft_hist_mm_bridge_address_l2			),
	.pm_ifft_hist_mm_bridge_chipselect		(pm_ifft_hist_mm_bridge_chipselect_l2		),
	.pm_ifft_hist_mm_bridge_read			(pm_ifft_hist_mm_bridge_read_l2				),
	.pm_ifft_hist_mm_bridge_write			(pm_ifft_hist_mm_bridge_write_l2			),
	.pm_ifft_hist_mm_bridge_writedata		(pm_ifft_hist_mm_bridge_writedata_l2		),
	.pm_ifft_hist_mm_bridge_byteenable		(pm_ifft_hist_mm_bridge_byteenable_l2		),
	.pm_ifft_hist_mm_bridge_readdata	    (pm_ifft_hist_mm_bridge_readdata_l2	    	),
	.pm_ifft_hist_mm_bridge_readdatavalid	    (pm_ifft_hist_mm_bridge_readdatavalid_l2	    	),
	.pm_ifft_hist_mm_bridge_waitrequest		(pm_ifft_hist_mm_bridge_waitrequest_l2		),
	
	.pm_stat_ifft_mm_bridge_address	        (pm_stat_ifft_mm_bridge_address_l2	    ), 	
	.pm_stat_ifft_mm_bridge_chipselect	    (pm_stat_ifft_mm_bridge_chipselect_l2	),
	.pm_stat_ifft_mm_bridge_read			(pm_stat_ifft_mm_bridge_read_l2			),
	.pm_stat_ifft_mm_bridge_write		    (pm_stat_ifft_mm_bridge_write_l2		),
	.pm_stat_ifft_mm_bridge_writedata	    (pm_stat_ifft_mm_bridge_writedata_l2	),
	.pm_stat_ifft_mm_bridge_byteenable	    (pm_stat_ifft_mm_bridge_byteenable_l2	),
	.pm_stat_ifft_mm_bridge_readdata		(pm_stat_ifft_mm_bridge_readdata_l2		),
	.pm_stat_ifft_mm_bridge_readdatavalid	    (pm_stat_ifft_mm_bridge_readdatavalid_l2	    	),
	.pm_stat_ifft_mm_bridge_waitrequest	    (pm_stat_ifft_mm_bridge_waitrequest_l2	),
	
	
											
	.pwr_mtr_config_csr_writedata			(pwr_mtr_config_csr_writedata_l2			),
	.pwr_mtr_config_csr_read				(pwr_mtr_config_csr_read_l2					),
	.pwr_mtr_config_csr_write				(pwr_mtr_config_csr_write_l2				),
	.pwr_mtr_config_csr_readdata			(pwr_mtr_config_csr_readdata_l2				),
	.pwr_mtr_config_csr_readdatavalid		(pwr_mtr_config_csr_readdatavalid_l2		),
	.pwr_mtr_config_csr_address			    (pwr_mtr_config_csr_address_l2			  	)
	
);

`endif
`endif	




assign dl_scheduler_sink_valid_1   = (pb_dl_scheduler_inj_sel) ?  pb_avst_sink_valid        : fdv_source_valid_1         	 ;
assign dl_scheduler_sink_valid_2   = (pb_dl_scheduler_inj_sel) ?  pb_avst_sink_valid        : fdv_source_valid_2         	 ;
assign dl_scheduler_sink_data_1    = (pb_dl_scheduler_inj_sel) ?  pb_avst_sink_data[31:0]   : fdv_source_data_1              ;
assign dl_scheduler_sink_data_2    = (pb_dl_scheduler_inj_sel) ?  pb_avst_sink_data[63:32]  : fdv_source_data_2              ;
//assign pb_avst_sink_ready 		   = (pattern_buffer_sel_2d)   ?  pb_sink_ready   	  	  : 1'b0 						 ;

pipeline #(
      .DW        (1),
      .DELAYS    (13)
   ) u_pb_ready_pipe  (
      .clk       (clk_dsp),
      .reset_n   (rst_dsp_n),
      .datain    (fdv_source_ready_1),
      .dataout   (scheduler_pb_sink_ready)
   );

// Capture Interfaces

assign cap_ifft1_out_valid           =  ifft_source_valid1             			;
assign cap_ifft1_out_data            =  ifft_source_data1					    ;
assign cap_ifft1_out_channel         =  ifft_source_channel1           			;

assign cap_ifft2_out_valid           =  ifft_source_valid2             			;
assign cap_ifft2_out_data            =  ifft_source_data2					    ;
assign cap_ifft2_out_channel         =  ifft_source_channel2           			;


//pipeline ifft fft loopback enable
always @ (posedge clk_dsp)
begin 
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

 assign dl_lphy_ss_source_valid1    = (ifft_fft_lpbk_en_2d)  ? 0 : ifft_source_valid1    ;
 assign dl_lphy_ss_source_data1     = (ifft_fft_lpbk_en_2d)  ? 0 : ifft_source_data1     ;
 assign dl_lphy_ss_source_channel1  = (ifft_fft_lpbk_en_2d)  ? 0 : ifft_source_channel1  ;
 assign dl_lphy_ss_source_valid2    = (ifft_fft_lpbk_en_2d)  ? 0 : ifft_source_valid2    ;
 assign dl_lphy_ss_source_data2     = (ifft_fft_lpbk_en_2d)  ? 0 : ifft_source_data2     ;
 assign dl_lphy_ss_source_channel2  = (ifft_fft_lpbk_en_2d)  ? 0 : ifft_source_channel2  ;
 

endmodule
