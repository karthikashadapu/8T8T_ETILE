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
 
module prach_top
(
    clk_eth_xran                       		,
    rst_eth_xran_n                      	,
		
    clk_dsp                       			,
    rst_dsp_n                     			,

    clk_csr                       			,
    rst_csr_n                     			,
	
    // Stream Input               			
    avst_sink_valid               			,
    avst_sink_data                			,
    avst_sink_channel             			,
		
    //frame_num_rx							,				  		
    // Stream Output   			
    /* avst_source_valid             			,
    avst_source_data              			,
    avst_source_channel           			,
    avst_source_endofpacket       			,
    avst_source_startofpacket     			,
	avst_source_ready						, */
	
	chan_sel                      			,
    data_sel                      			,  
		
	//cp_len									,
	//offset_s                                ,        
	cPlane_coupling_en_s                    ,
    //PRACH OUTPUT CAPTURE	
    cap_prach_out_l1_valid              	,
    cap_prach_out_l1_data               	,
    cap_prach_out_l1_channel            	,
	 
	cap_prach_out_l2_valid              	,
    cap_prach_out_l2_data               	,
    cap_prach_out_l2_channel            	,
		
	sync_in									,
	
	pb_mm_bridge_address                	,
	pb_mm_bridge_chipselect             	,
	pb_mm_bridge_read                   	,
	pb_mm_bridge_readdata               	,
	pb_mm_bridge_write                  	,
	pb_mm_bridge_writedata              	,
	pb_mm_bridge_byteenable             	,
	pb_mm_bridge_waitrequest            	,
		
	short_prach_m_freqoff_ul			    ,
	short_prach_m_fft_size_ul			    ,
	valid_in								,
	
	short_prach_lw_bridge_readdata_l1  			,
	short_prach_lw_bridge_writedata_l1 			,
	short_prach_lw_bridge_address_l1   			,
	short_prach_lw_bridge_write_l1     			,
	short_prach_lw_bridge_waitrequest_l1		,
	short_prach_lw_bridge_readdatavalid_l1		,
	short_prach_lw_bridge_read_l1               ,
	
	short_prach_lw_bridge_readdata_l2  			,
	short_prach_lw_bridge_writedata_l2 			,
	short_prach_lw_bridge_address_l2   			,
	short_prach_lw_bridge_write_l2     			,
	short_prach_lw_bridge_waitrequest_l2		,
	short_prach_lw_bridge_readdatavalid_l2		,
	short_prach_lw_bridge_read_l2               ,
	
	long_prach_lw_bridge_readdata_l1  		,
	long_prach_lw_bridge_writedata_l1 		,
	long_prach_lw_bridge_address_l1   		,
	long_prach_lw_bridge_write_l1     		,
	long_prach_lw_bridge_readdatavalid_l1	,
	long_prach_lw_bridge_read_l1			,
	long_prach_lw_bridge_waitrequest_l1		,
	
	long_prach_lw_bridge_readdata_l2  		,
	long_prach_lw_bridge_writedata_l2 		,
	long_prach_lw_bridge_address_l2   		,
	long_prach_lw_bridge_write_l2     		,
	long_prach_lw_bridge_readdatavalid_l2	,
	long_prach_lw_bridge_read_l2			,
	long_prach_lw_bridge_waitrequest_l2		,
	
	short_long_prach_select					,
//	long_prach_config_index                 ,
	
	//frag_disable                			,
	//frame_status        					,
	ul_frame_status                     	,

	// side band signals  
	/* frame_ctrl_data							,
	frame_ctrl_vld							,
	prb_ctrl_data 							,
	prb_ctrl_vld */ 							,
	//arbiter_request							,
	
	/* output_sop_count                   		,
	output_valid_count                  	, */


	timing_reference                        ,
	
	// input from oran to prach config ip top
	avst_sink_c_valid                       ,       
	avst_sink_c_endofpacket                 ,
    avst_sink_c_startofpacket               ,
	rx_c_subframeId                         ,
	rx_c_rtc_id                             ,
	rx_c_dataDirection                      ,
	rx_sectionType     	                    ,
	rx_timeOffset                           ,
	rx_cpLength                             ,
	rx_frequencyOffset                      ,
	rx_frameStructure                       ,
	c_m_plane_sel                           ,
	filt_flush_en							,
	rx_c_symbolid							,
	rx_c_num_symbol							,
	rx_c_slotid								,
	rx_c_frameid							,
	long_prach_version_l1_reg				,
	long_prach_version_l2_reg				,
	Pb_enable								,
	Pb_select								,
	short_prach_time_offset					,
	short_prach_time_offset_bias			,
	short_prach_startsym_bias			
	
);

//`include "../../../quartus_projects/ftile_1588_sr/def_param.vh"
`include "../common/def_param.vh"

//Parameters Declaration
parameter  NUM_OF_ANT            	=   8		;
parameter  NUM_OF_FFT            	=	2		;
parameter  UL_DATAWIDTH          	=   128		;
parameter  XRAN_ETH_DATAWIDTH    	=   128		;
parameter  IQ_DATAWIDTH         	=	32 		;
localparam CPRI_FRAME_DATAWIDTH		= 	64		;

input 										clk_eth_xran       			;
input 										rst_eth_xran_n     			;

input 										clk_dsp      				;
input 										rst_dsp_n    				;

input 										clk_csr      				;
input 										rst_csr_n    				;

input  wire [7:0] 							chan_sel					;
input  wire [3:0] 							data_sel					; 

//input wire [15:0] 							cp_len               	;
//input wire [15:0] 							offset_s             	;
input wire        							cPlane_coupling_en_s 		;
         

input   [NUM_OF_FFT-1:0]				    avst_sink_valid             ;
input   [NUM_OF_FFT*IQ_DATAWIDTH-1:0]		avst_sink_data              ;
input   [(NUM_OF_FFT*8)-1:0]                avst_sink_channel           ;

//input   [19:0]       						frame_num_rx                ;
/* output 					                avst_source_valid           ;
output  [UL_DATAWIDTH-1 :0]   				avst_source_data            ;
output  [15:0]                              avst_source_channel         ;
output                                      avst_source_endofpacket     ;
output                                      avst_source_startofpacket   ;
input                                       avst_source_ready           ; */

output                                      cap_prach_out_l1_valid      ;
output  [IQ_DATAWIDTH -1 :0]   				cap_prach_out_l1_data       ;
output  [7:0]                               cap_prach_out_l1_channel    ;

output                                      cap_prach_out_l2_valid      ;
output  [IQ_DATAWIDTH -1 :0]   				cap_prach_out_l2_data       ;
output  [7:0]                               cap_prach_out_l2_channel    ;

input										sync_in					    ;


// PB Traffic MM Slave
input  [16:0]      							pb_mm_bridge_address		;
input              							pb_mm_bridge_chipselect		;
input              							pb_mm_bridge_read			;
input              							pb_mm_bridge_write			;
input  [31:0]      							pb_mm_bridge_writedata		;
input  [3:0]       							pb_mm_bridge_byteenable		;
output [31:0]      							pb_mm_bridge_readdata		;
output             							pb_mm_bridge_waitrequest	;

input  [23:0] 	   							short_prach_m_freqoff_ul	;
input  [3:0]  	   							short_prach_m_fft_size_ul	;
input			   							valid_in					;

 // M plane Light Weight Configuration 
input  [2:0]     							short_prach_lw_bridge_address_l1  			;
input            							short_prach_lw_bridge_write_l1    			;    
output [31:0]    							short_prach_lw_bridge_readdata_l1 			;
input  [31:0]    							short_prach_lw_bridge_writedata_l1			;
output  		 							short_prach_lw_bridge_waitrequest_l1		;
output  		 							short_prach_lw_bridge_readdatavalid_l1		;
input                                       short_prach_lw_bridge_read_l1               ;
	
input  [2:0]     							short_prach_lw_bridge_address_l2  			;
input            							short_prach_lw_bridge_write_l2    			;    
output [31:0]    							short_prach_lw_bridge_readdata_l2 			;
input  [31:0]    							short_prach_lw_bridge_writedata_l2			;
output  		 							short_prach_lw_bridge_waitrequest_l2		;
output  		 							short_prach_lw_bridge_readdatavalid_l2		;
input                                       short_prach_lw_bridge_read_l2               ;

input  [3:0]     							long_prach_lw_bridge_address_l1  		;
input            							long_prach_lw_bridge_write_l1    		;    
output [31:0]    							long_prach_lw_bridge_readdata_l1 		;
input  [31:0]    							long_prach_lw_bridge_writedata_l1		;
output  		 							long_prach_lw_bridge_waitrequest_l1		;
output  		 							long_prach_lw_bridge_readdatavalid_l1	;
input   		 							long_prach_lw_bridge_read_l1			;

input  [3:0]     							long_prach_lw_bridge_address_l2  		;
input            							long_prach_lw_bridge_write_l2    		;    
output [31:0]    							long_prach_lw_bridge_readdata_l2 		;
input  [31:0]    							long_prach_lw_bridge_writedata_l2		;
output  		 							long_prach_lw_bridge_waitrequest_l2		;
output  		 							long_prach_lw_bridge_readdatavalid_l2	;
input   		 							long_prach_lw_bridge_read_l2			;

//input            							frag_disable                			;
//input  [67:0]    							frame_status        					;

input wire [12:0] 							ul_frame_status							;

output wire 								short_long_prach_select					;
//input  [31:0]       						long_prach_config_index 				;
// side band signals  
/* output  wire [IQ_DATAWIDTH-1:0]       	  	frame_ctrl_data							; 
output  wire                              	frame_ctrl_vld 							;
output  wire [IQ_DATAWIDTH-1:0]       	  	prb_ctrl_data  							; 
output  wire                              	prb_ctrl_vld   							;  */
//output  wire                              	arbiter_request							;
		
/* output reg   [31:0]						output_sop_count  						;
output reg   [31:0]						  	output_valid_count						; */

output wire [63:0]     						timing_reference						;

input              							avst_sink_c_valid                		;
input              							avst_sink_c_endofpacket          		;
input              							avst_sink_c_startofpacket        		;

input wire [7:0]   							rx_c_rtc_id                     		;
input wire         							rx_c_dataDirection              		;
input wire [7:0]   							rx_sectionType                  		;

input wire [15:0]   						rx_timeOffset                   		;
input wire [15:0]   						rx_cpLength                     		;
input wire [23:0]   						rx_frequencyOffset              		;
input wire [7:0]                            rx_frameStructure                       ;

input                                       c_m_plane_sel                           ;
input	[3:0]                           rx_c_subframeId                         ;
input	[1:0]                           filt_flush_en                           ;
input	[5:0]							rx_c_symbolid							;
input 	[3:0]							rx_c_num_symbol							;
input 	[5:0]							rx_c_slotid								;
input	[7:0]							rx_c_frameid							;

output wire  [31:0]   long_prach_version_l1_reg;
output wire  [31:0]   long_prach_version_l2_reg;

input wire Pb_enable	;
input wire Pb_select	;

input wire [31:0] short_prach_time_offset		;
input wire [31:0] short_prach_time_offset_bias	;
input wire [31:0] short_prach_startsym_bias		;


wire   [NUM_OF_FFT-1:0]                   prach_avst_sink_valid  ;
wire   [NUM_OF_FFT*IQ_DATAWIDTH-1:0]	  prach_avst_sink_data   ;
wire   [(NUM_OF_FFT*8)-1:0]               prach_avst_sink_channel;

 // prach in - Light Weight Configuration 
wire  [9:0]     lw_bridge_address_l1    ;
wire            lw_bridge_chipselect_l1 ;
wire            lw_bridge_write_l1      ;
wire            lw_bridge_read_l1       ;
wire  [31:0]    lw_bridge_readdata_l1   ;
wire  [31:0]    lw_bridge_writedata_l1  ;
wire  [3:0]     lw_bridge_byteenable_l1 ;
wire            lw_bridge_waitrequest_l1;
wire            lw_bridge_readdatavalid_l1;

// prach in - Light Weight Configuration 
wire [9:0]      lw_bridge_address_l2    ;
wire            lw_bridge_chipselect_l2 ;
wire            lw_bridge_write_l2      ;
wire            lw_bridge_read_l2       ;
wire [31:0]     lw_bridge_readdata_l2   ;
wire [31:0]     lw_bridge_writedata_l2  ;
wire [3:0]      lw_bridge_byteenable_l2 ;
wire            lw_bridge_waitrequest_l2;
wire            lw_bridge_readdatavalid_l2; 

wire [31:0]     prach1_busIn_writedata      ;
wire [9:0 ]     prach1_busIn_address        ;
wire            prach1_busIn_write          ;
wire            prach1_busIn_read           ;
wire            prach1_busOut_readdatavalid ;
wire [31:0]     prach1_busOut_readdata      ;
wire            prach1_busOut_waitrequest   ;

wire [31:0]     prach2_busIn_writedata      ;
wire [9:0 ]     prach2_busIn_address        ;
wire            prach2_busIn_write          ;
wire            prach2_busIn_read           ;
wire            prach2_busOut_readdatavalid ;
wire [31:0]     prach2_busOut_readdata      ;
wire            prach2_busOut_waitrequest   ;

// Stream Output
wire        	pb_avst_source_valid		;
wire [31:0] 	pb_avst_source_data			;
wire [7:0]  	pb_avst_source_channel		;
wire 			pb_avst_source_ready		;
wire        	pb_avst_source_eop			;
wire        	pb_avst_source_sop			;

wire [7:0]  	prach_cfg_idx_l1			;
wire [31:0]    	prach_cfg_time_idx_l1		;
wire [31:0]  	n_prach_slot_l1				;
wire [31:0]    	prach_freq_idx_l1			;

wire [7:0]     	prach_cfg_idx_l2			;
wire [31:0]    	prach_cfg_time_idx_l2		;
wire [31:0]    	n_prach_slot_l2				;
wire [31:0] 	prach_freq_idx_l2			;

wire [31:0]		prach_nco_l1				;
wire 			prach_slot_addr_l1			;
wire [31:0] 	active_prach_slot_l1		;
wire 			prach_tech_l1				;
wire [31:0]		sym_start_ch1_l1			;
wire [31:0]		sym_end_ch1_l1				;
wire [31:0]		prach_out_start_l1			;
wire [31:0]		prach_out_end_l1			;
wire [31:0]		prach_nco_l2				;
wire 			prach_slot_addr_l2			;
wire [31:0]		active_prach_slot_l2		;
wire 			prach_tech_l2				;
wire [31:0]		sym_start_ch1_l2			;
wire [31:0]		sym_end_ch1_l2				;
wire [31:0]		prach_out_start_l2			;
wire [31:0]		prach_out_end_l2			;
wire [15:0]		gain_re_l1					;
wire [15:0]		gain_im_l1					;
wire [15:0]		gain_re_l2					;
wire [15:0]		gain_im_l2					;

wire [15:0]		sp_gain_re_l1					;
wire [15:0]		sp_gain_im_l1					;
wire [15:0]		sp_gain_re_l2					;
wire [15:0]		sp_gain_im_l2					;

wire [15:0]     cp_len_l1	                ;
wire [15:0]     offset_s_l1				    ;
wire [15:0]     cp_len_l2	                ;
wire [15:0]     offset_s_l2                 ;

wire [5:0]      start_sym_s_11				;
wire [5:0]      start_sym_s_12				;

wire [3:0]		subframeId_s_11				;
wire [3:0]		subframeId_s_12				;

wire [3:0]		num_symbol_s_11				;
wire [3:0]		num_symbol_s_12				;

wire [5:0]		slot_id_s_l1				;
wire [5:0]		slot_id_s_l2				;

wire [7:0]		frame_id_l1					;
wire [7:0]		frame_id_l2					;

wire [15:0]	    long_prach_cfg_index_l1		;
wire [15:0]		long_prach_cfg_index_l2		;

wire [3:0]      	prach_if_lw_bridge_address_l1    		;
wire            	prach_if_lw_bridge_write_l1      		;
wire            	prach_if_lw_bridge_read_l1      		;
wire [31:0]     	prach_if_lw_bridge_readdata_l1   		;
wire [31:0]     	prach_if_lw_bridge_writedata_l1  		;
wire            	prach_if_lw_bridge_waitrequest_l1		;
wire            	prach_if_lw_bridge_readdatavalid_l1		;

wire [3:0]      	prach_if_lw_bridge_address_l2    		;
wire            	prach_if_lw_bridge_write_l2      		;	
wire            	prach_if_lw_bridge_read_l2       		;
wire [31:0]     	prach_if_lw_bridge_readdata_l2   		;
wire [31:0]     	prach_if_lw_bridge_writedata_l2  		;
wire            	prach_if_lw_bridge_waitrequest_l2		;
wire            	prach_if_lw_bridge_readdatavalid_l2		;



// Stream Input
wire  [NUM_OF_FFT-1:0]                    	prach_avst_source_valid             ;
wire  [IQ_DATAWIDTH*NUM_OF_FFT-1 :0] 	  	prach_avst_source_data              ;
wire  [7:0]                               	prach_avst_source_channel           ;
wire                                      	prach_avst_source_endofpacket       ;
wire                                      	prach_avst_source_startofpacket     ;
wire                                      	prach_avst_source_ready             ;

(*preserve_syn_only*) reg 					rst_dsp_n_1d_dup1					;
(*preserve_syn_only*) reg 					rst_dsp_n_1d_dup2					;
(*preserve_syn_only*) reg 					rst_dsp_n_2d_dup1					;
(*preserve_syn_only*) reg 					rst_dsp_n_2d_dup2					;
				
(*preserve_syn_only*) reg 					rst_dsp_n_3d_dup1					;
(*preserve_syn_only*) reg 					rst_dsp_n_4d_dup1					;
(*preserve_syn_only*) reg 					rst_dsp_n_4d_dup2					;

reg 										rst_eth_xran_n_1d_dup1				;
reg 										rst_eth_xran_n_2d_dup1				;
reg 										rst_eth_xran_n_3d_dup1				;
reg 										rst_eth_xran_n_4d_dup1				;
reg											rst_eth_xran_n_3d_dup2				;
reg											rst_eth_xran_n_4d_dup2				;

wire                                      	cap_prach_out_l1_valid         		;
wire  [IQ_DATAWIDTH -1 :0]   				cap_prach_out_l1_data          		;
wire  [7:0]                               	cap_prach_out_l1_channel       		;

wire                                      	cap_prach_out_l2_valid         		;
wire  [IQ_DATAWIDTH -1 :0]   				cap_prach_out_l2_data          		;
wire  [7:0]                               	cap_prach_out_l2_channel       		;


wire [3:0]        	hps_lw_bridge_address_l1  	;
wire           		hps_lw_bridge_write_l1    	;    
wire [31:0]    		hps_lw_bridge_readdata_l1 	;
wire [31:0]    		hps_lw_bridge_writedata_l1	;
wire				hps_lw_bridge_waitrequest_l1;
wire				hps_lw_bridge_readdatavalid_l1;
wire                hps_lw_bridge_read_l1        ;
				
wire [3:0]     		hps_lw_bridge_address_l2  	;
wire           		hps_lw_bridge_write_l2    	;    
wire [31:0]    		hps_lw_bridge_readdata_l2 	;
wire [31:0]    		hps_lw_bridge_writedata_l2	;
wire				hps_lw_bridge_waitrequest_l2;
wire				hps_lw_bridge_readdatavalid_l2;
wire                hps_lw_bridge_read_l2        ;


always @(posedge clk_dsp)
	begin
		    rst_dsp_n_1d_dup1 <= rst_dsp_n;
			rst_dsp_n_2d_dup1 <= rst_dsp_n_1d_dup1;	
			
			rst_dsp_n_1d_dup2 <= rst_dsp_n;	
			rst_dsp_n_2d_dup2 <= rst_dsp_n_1d_dup2;	
			
		    rst_dsp_n_3d_dup1 <= rst_dsp_n_2d_dup1;
		    rst_dsp_n_4d_dup1 <= rst_dsp_n_3d_dup1;
			
		    rst_dsp_n_4d_dup2 <= rst_dsp_n_3d_dup1;
			
	end	
	
always @(posedge clk_eth_xran)
	begin						
		    rst_eth_xran_n_1d_dup1 <= rst_eth_xran_n;
			rst_eth_xran_n_2d_dup1 <= rst_eth_xran_n_1d_dup1;	
			
			rst_eth_xran_n_3d_dup1 <= rst_eth_xran_n_2d_dup1;																		
			rst_eth_xran_n_4d_dup1 <= rst_eth_xran_n_3d_dup1;	

			rst_eth_xran_n_3d_dup2 <= rst_eth_xran_n_2d_dup1;																		
			rst_eth_xran_n_4d_dup2 <= rst_eth_xran_n_3d_dup2;			
	end	


prach_if u_prach_if
(
    .clk_ul                        		(clk_eth_xran      				  ),
    .rst_ul_n                      		(rst_eth_xran_n_2d_dup1    		  ),

    .clk_dsp                       		(clk_dsp                    	  ),
    .rst_dsp_n                     		(rst_dsp_n_2d_dup1          	  ),

    .clk_csr                       		(clk_csr                    	  ),
    .rst_csr_n                     		(rst_csr_n                  	  ),

    // Stream Input               		                                  
    .avst_sink_valid               		(prach_avst_sink_valid			  ), //avst_sink_valid
    .avst_sink_data                		(prach_avst_sink_data			  ), //avst_sink_data
    .avst_sink_channel             		(prach_avst_sink_channel		  ), //avst_sink_channel

    .frame_num_rx						({7'b0,ul_frame_status}			  ),				  		
	.timing_reference_out               (timing_reference				  ),
    // Stream Output   		       
    .avst_source_valid             		(prach_avst_source_valid          ),
    .avst_source_data              		(prach_avst_source_data           ),
    .avst_source_channel           		(prach_avst_source_channel        ),
    .avst_source_endofpacket       		(prach_avst_source_endofpacket    ),
    .avst_source_startofpacket     		(prach_avst_source_startofpacket  ),

	.chan_sel                      		(chan_sel                   	  ),
    .data_sel                      		(data_sel                   	  ),  
	.valid_in							(valid_in						  ),
    .cp_len_l1 							(cp_len_l1 				    	  ),				
    .offset_s_l1                        (offset_s_l1                   	  ),
    .cp_len_l2 							(cp_len_l2 				    	  ),				
    .offset_s_l2                        (offset_s_l2                   	  ),
	
	.start_sym_s_11						(start_sym_s_11					  ),
	.start_sym_s_12						(start_sym_s_12					  ),
 	 
	.subframeId_s_11					(subframeId_s_11				  ),
	.subframeId_s_12					(subframeId_s_12				  ),
	
	.num_symbol_s_11					(num_symbol_s_11				  ),
	.num_symbol_s_12					(num_symbol_s_12				  ),
	.slot_id_s_l1						(slot_id_s_l1					  ),
	.slot_id_s_l2						(slot_id_s_l2					  ),
	.frame_id_l1						(frame_id_l1						),
	.frame_id_l2						(frame_id_l2						),
	.cPlane_coupling_en_s               (cPlane_coupling_en_s       	  ),
	.cap_prach_out_l1_valid             (cap_prach_out_l1_valid			  ),
    .cap_prach_out_l1_data              (cap_prach_out_l1_data			  ),
    .cap_prach_out_l1_channel           (cap_prach_out_l1_channel		  ),
	.cap_prach_out_l2_valid             (cap_prach_out_l2_valid			  ),
    .cap_prach_out_l2_data              (cap_prach_out_l2_data			  ),
    .cap_prach_out_l2_channel           (cap_prach_out_l2_channel		  ),
	.long_prach_config_index_l1         (long_prach_cfg_index_l1		  ),
	.long_prach_config_index_l2         (long_prach_cfg_index_l2		  ),
	.prach_tech_l1						(prach_tech_l1					  ),
	.prach_tech_l2						(prach_tech_l2					  ),
	.gain_re_l1							(gain_re_l1						  ),
	.gain_im_l1							(gain_im_l1						  ),
	.gain_re_l2							(gain_re_l2						  ),
	.gain_im_l2							(gain_im_l2						  ),
	.sp_gain_re_l1						(sp_gain_re_l1						  ),
	.sp_gain_im_l1						(sp_gain_im_l1						  ),
	.sp_gain_re_l2						(sp_gain_re_l2						  ),
	.sp_gain_im_l2						(sp_gain_im_l2						  ),
	
    //DSPBA CSR                       
    .prach1_busIn_writedata     		(prach1_busIn_writedata     	  ),
    .prach1_busIn_address       		(prach1_busIn_address       	  ),
    .prach1_busIn_write         		(prach1_busIn_write         	  ),
    .prach1_busIn_read          		(prach1_busIn_read          	  ),
    .prach1_busOut_readdatavalid		(prach1_busOut_readdatavalid	  ),
    .prach1_busOut_readdata     		(prach1_busOut_readdata     	  ),
    .prach1_busOut_waitrequest  		(prach1_busOut_waitrequest  	  ),

    .prach2_busIn_writedata     		(prach2_busIn_writedata     	  ),
    .prach2_busIn_address       		(prach2_busIn_address       	  ),
    .prach2_busIn_write         		(prach2_busIn_write         	  ),
    .prach2_busIn_read          		(prach2_busIn_read          	  ),
    .prach2_busOut_readdatavalid		(prach2_busOut_readdatavalid	  ),
    .prach2_busOut_readdata     		(prach2_busOut_readdata     	  ),
    .prach2_busOut_waitrequest  		(prach2_busOut_waitrequest  	  ),

	.filt_flush_en                      (filt_flush_en					  ),
	.long_prach_version_l1_reg			(long_prach_version_l1_reg),
	.long_prach_version_l2_reg			(long_prach_version_l2_reg),
	.short_prach_time_offset			(short_prach_time_offset		),
	.short_prach_time_offset_bias		(short_prach_time_offset_bias	),
	.short_prach_startsym_bias			(short_prach_startsym_bias		)
);



assign prach1_busIn_writedata      			= prach_if_lw_bridge_writedata_l1	;
assign prach1_busIn_address        			= prach_if_lw_bridge_address_l1		;
assign prach1_busIn_write          			= prach_if_lw_bridge_write_l1		;
assign prach1_busIn_read           			= prach_if_lw_bridge_read_l1		;
assign prach_if_lw_bridge_readdatavalid_l1  = prach1_busOut_readdatavalid		;
assign prach_if_lw_bridge_readdata_l1	    = prach1_busOut_readdata     		;
assign prach_if_lw_bridge_waitrequest_l1    = prach1_busOut_waitrequest  		;

assign prach2_busIn_writedata      			= prach_if_lw_bridge_writedata_l2	;
assign prach2_busIn_address        			= prach_if_lw_bridge_address_l2		;
assign prach2_busIn_write          			= prach_if_lw_bridge_write_l2		;
assign prach2_busIn_read           			= prach_if_lw_bridge_read_l2		;
assign prach_if_lw_bridge_readdatavalid_l2  = prach2_busOut_readdatavalid		;
assign prach_if_lw_bridge_readdata_l2	    = prach2_busOut_readdata     		;
assign prach_if_lw_bridge_waitrequest_l2    = prach2_busOut_waitrequest  		;




`ifdef SHORT_PRACH_FORMAT
	assign short_long_prach_select = 1'b0;
`else
	assign short_long_prach_select = 1'b1;
`endif

 prach_config_ip_top u_prach_config_ip_top (

.clk_eth                                       (clk_eth_xran			 ),                      
.rst_eth_n                                     (rst_eth_xran_n			 ),
.clk_csr                                       (clk_csr					 ),
.rst_csr_n                                     (rst_csr_n				 ),
.clk_dsp                                       (clk_dsp					 ),
.rst_dsp_n                                     (rst_dsp_n				 ),

.avst_sink_c_valid                             (avst_sink_c_valid        ),
.avst_sink_c_endofpacket                       (avst_sink_c_endofpacket  ),
.avst_sink_c_startofpacket                     (avst_sink_c_startofpacket),

.rx_c_rtc_id                                   (rx_c_rtc_id          	),
.rx_c_dataDirection                            (rx_c_dataDirection 		),
.rx_sectionType		                           (rx_sectionType			),
.rx_timeOffset                                 (rx_timeOffset      		),
.rx_cpLength        				           (rx_cpLength        		),
.rx_frequencyOffset	                           (rx_frequencyOffset		),
.rx_frameStructure                             (rx_frameStructure       ),     
.rx_c_startsymbolid							   (rx_c_symbolid			),
.rx_c_subframeId							   (rx_c_subframeId			),
.rx_c_num_symbol								(rx_c_num_symbol		),
.rx_c_slotid									(rx_c_slotid			),
.rx_c_frameid									(rx_c_frameid			),

.cpLength_11                                   (cp_len_l1				),  	
.cpLength_12						           (cp_len_l2				),                                                   	
.timeOffset_11                                 (offset_s_l1				), 
.timeOffset_12					               (offset_s_l2				),

.start_sym_11								   (start_sym_s_11			),
.start_sym_12								   (start_sym_s_12			),

.subframeId_11								   (subframeId_s_11			),
.subframeId_12								   (subframeId_s_12			),

.num_symbol_11								(num_symbol_s_11),
.num_symbol_12								(num_symbol_s_12),

.slot_id_l1									(slot_id_s_l1),
.slot_id_l2                                 (slot_id_s_l2),
.frame_id_l1								(frame_id_l1),			
.frame_id_l2                                (frame_id_l2),
 
.hps_lw_bridge_readdata_l1  		           (hps_lw_bridge_readdata_l1  		  ),
.hps_lw_bridge_writedata_l1 		           (hps_lw_bridge_writedata_l1 		  ),
.hps_lw_bridge_address_l1   		           (hps_lw_bridge_address_l1   		  ),
.hps_lw_bridge_write_l1     		           (hps_lw_bridge_write_l1     		  ),
.hps_lw_bridge_waitrequest_l1	               (	  ),	
.hps_lw_bridge_readdatavalid_l1	               (hps_lw_bridge_readdatavalid_l1	  ),
.hps_lw_bridge_read_l1                         (hps_lw_bridge_read_l1             ),	
.hps_lw_bridge_readdata_l2  		           (hps_lw_bridge_readdata_l2  		  ),
.hps_lw_bridge_writedata_l2 		           (hps_lw_bridge_writedata_l2 		  ),
.hps_lw_bridge_address_l2   		           (hps_lw_bridge_address_l2   		  ),
.hps_lw_bridge_write_l2     		           (hps_lw_bridge_write_l2     		  ),
.hps_lw_bridge_waitrequest_l2	               (	  ),
.hps_lw_bridge_readdatavalid_l2	               (hps_lw_bridge_readdatavalid_l2	  ),
.hps_lw_bridge_read_l2                         (hps_lw_bridge_read_l2             ),
.prach_tech_l1							       (prach_tech_l1							),
.long_prach_cfg_index_l1					   (long_prach_cfg_index_l1					),
.prach_tech_l2							       (prach_tech_l2							),
.long_prach_cfg_index_l2					   (long_prach_cfg_index_l2					),

.gain_re_l1									   (gain_re_l1						        ),
.gain_im_l1									   (gain_im_l1						        ),
.gain_re_l2									   (gain_re_l2						        ),
.gain_im_l2									   (gain_im_l2						        ),
.sp_gain_re_l1								(sp_gain_re_l1						        ),
.sp_gain_im_l1								(sp_gain_im_l1						        ),
.sp_gain_re_l2								(sp_gain_re_l2						        ),
.sp_gain_im_l2								(sp_gain_im_l2						        ),
	

.prach_lw_bridge_readdata_l1  		       (prach_if_lw_bridge_readdata_l1  		),
.prach_lw_bridge_writedata_l1 		       (prach_if_lw_bridge_writedata_l1 		),
.prach_lw_bridge_address_l1   		       (prach_if_lw_bridge_address_l1   		),
.prach_lw_bridge_write_l1     		       (prach_if_lw_bridge_write_l1     		),
.prach_lw_bridge_read_l1	               (prach_if_lw_bridge_read_l1	        	),
.prach_lw_bridge_readdatavalid_l1	       (prach_if_lw_bridge_readdatavalid_l1		),
.prach_lw_bridge_waitrequest_l1		   	   (prach_if_lw_bridge_waitrequest_l1	    ),
.prach_lw_bridge_readdata_l2  		       (prach_if_lw_bridge_readdata_l2  		),
.prach_lw_bridge_writedata_l2 		       (prach_if_lw_bridge_writedata_l2 		),
.prach_lw_bridge_address_l2   		       (prach_if_lw_bridge_address_l2   		),
.prach_lw_bridge_read_l2     		       (prach_if_lw_bridge_read_l2     			),
.prach_lw_bridge_write_l2     		       (prach_if_lw_bridge_write_l2     		),
.prach_lw_bridge_readdatavalid_l2	       (prach_if_lw_bridge_readdatavalid_l2		),
.prach_lw_bridge_waitrequest_l2		   	   (prach_if_lw_bridge_waitrequest_l2	    ),
.SF_Number			            		       (ul_frame_status[4:1]					),
.c_m_plane_sel							       (c_m_plane_sel							),
.short_prach_m_freqoff_ul                      (short_prach_m_freqoff_ul  ), // for m plane
.short_prach_m_fft_size_ul                     (short_prach_m_fft_size_ul ),  // for m plane
.ul_start_pulse_latch							(sync_in)

);
	  


`ifdef SHORT_PRACH_FORMAT

assign short_prach_lw_bridge_readdata_l1		   =   hps_lw_bridge_readdata_l1  		        ;
assign hps_lw_bridge_writedata_l1 		           =   short_prach_lw_bridge_writedata_l1		;
assign hps_lw_bridge_address_l1   		           =   short_prach_lw_bridge_address_l1			;
assign hps_lw_bridge_write_l1     		           =   short_prach_lw_bridge_write_l1			;
assign short_prach_lw_bridge_waitrequest_l1	       =   1'b0	 		;
assign short_prach_lw_bridge_readdatavalid_l1	   =   hps_lw_bridge_readdatavalid_l1  		;
assign hps_lw_bridge_read_l1                       =   short_prach_lw_bridge_read_l1			;	
assign short_prach_lw_bridge_readdata_l2		   =   hps_lw_bridge_readdata_l2  		        ;
assign hps_lw_bridge_writedata_l2 		           =   short_prach_lw_bridge_writedata_l2		;
assign hps_lw_bridge_address_l2   		           =   short_prach_lw_bridge_address_l2			;
assign hps_lw_bridge_write_l2     		           =   short_prach_lw_bridge_write_l2			;
assign short_prach_lw_bridge_waitrequest_l2	       =   1'b0	 		;
assign short_prach_lw_bridge_readdatavalid_l2	   =   hps_lw_bridge_readdatavalid_l2  		;
assign hps_lw_bridge_read_l2                       =   short_prach_lw_bridge_read_l2			;

`else
assign long_prach_lw_bridge_readdata_l1			   =   hps_lw_bridge_readdata_l1  		        ;
assign hps_lw_bridge_writedata_l1 		           =   long_prach_lw_bridge_writedata_l1		;
assign hps_lw_bridge_address_l1   		           =   long_prach_lw_bridge_address_l1			;
assign hps_lw_bridge_write_l1     		           =   long_prach_lw_bridge_write_l1			;
assign long_prach_lw_bridge_waitrequest_l1	       =   1'b0	 		;
assign long_prach_lw_bridge_readdatavalid_l1	   =   hps_lw_bridge_readdatavalid_l1  		;
assign hps_lw_bridge_read_l1                       =   long_prach_lw_bridge_read_l1				;	
assign long_prach_lw_bridge_readdata_l2			   =   hps_lw_bridge_readdata_l2  		        ;
assign hps_lw_bridge_writedata_l2 		           =   long_prach_lw_bridge_writedata_l2		;
assign hps_lw_bridge_address_l2   		           =   long_prach_lw_bridge_address_l2			;
assign hps_lw_bridge_write_l2     		           =   long_prach_lw_bridge_write_l2			;
assign long_prach_lw_bridge_waitrequest_l2	       =   1'b0	 		;
assign long_prach_lw_bridge_readdatavalid_l2	   =   hps_lw_bridge_readdatavalid_l2  		;
assign hps_lw_bridge_read_l2                       =   long_prach_lw_bridge_read_l2				;

`endif




pb_st u_pb_st(
   .clk									(clk_dsp				),
   .rst_n                               (rst_dsp_n_4d_dup1		), 
   .sync_in                             (sync_in				),
   //  MEM WR Interface              
   .mem_address                         (pb_mm_bridge_address	),
   .mem_chipselect                      (pb_mm_bridge_chipselect),
   .mem_read                            (pb_mm_bridge_read		),
   .mem_readdata                        (pb_mm_bridge_readdata	),
   .mem_write							(pb_mm_bridge_write		),
   .mem_writedata                       (pb_mm_bridge_writedata	),
   .mem_byteenable                      (pb_mm_bridge_byteenable),
   .mem_waitrequest                     (pb_mm_bridge_waitrequest),
   // Stream Output      
   .avst_source_valid					(pb_avst_source_valid	),
   .avst_source_data					(pb_avst_source_data	),
   .avst_source_ready					(pb_avst_source_ready	),
   .avst_source_endofpacket				(pb_avst_source_eop		),
   .avst_source_startofpacket			(pb_avst_source_sop		),
   .avst_source_channel					(pb_avst_source_channel	),
   // Light weight Memory Interface    
   .clk_lw_in                           (clk_csr				),
   .reset_lw_in_n                       (rst_csr_n				),
   .Pb_enable							(Pb_enable				)

);

assign pb_avst_source_ready 	= 1'b1;
assign prach_avst_sink_valid 	= (Pb_select) ? {pb_avst_source_valid,pb_avst_source_valid} 		: avst_sink_valid	;
assign prach_avst_sink_data 	= (Pb_select) ? {pb_avst_source_data,pb_avst_source_data} 		: avst_sink_data	;
assign prach_avst_sink_channel 	= (Pb_select) ? {pb_avst_source_channel,pb_avst_source_channel}	: avst_sink_channel	;

endmodule
