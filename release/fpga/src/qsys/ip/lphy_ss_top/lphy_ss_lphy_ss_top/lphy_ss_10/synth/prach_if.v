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
 
module prach_if
(
    clk_ul                        		,
    rst_ul_n                      		,
    
    clk_dsp                       		,
    rst_dsp_n                     		,
		
    clk_csr                       		,
    rst_csr_n                     		,
		
    // Stream Input               		
    avst_sink_valid               		,
    avst_sink_data                		,
    avst_sink_channel             		,
		
    frame_num_rx						,				  		
    timing_reference_out                ,	
   
    // Stream Output   		
    avst_source_valid             		,
    avst_source_data              		,
    avst_source_channel           		,
    avst_source_endofpacket       		,
    avst_source_startofpacket     		,
			
	chan_sel                      		,
    data_sel                      		,  
	
	valid_in							,
	
    cp_len_l1	              		    ,
    offset_s_l1				  		    ,
    cp_len_l2	              		    ,
    offset_s_l2               		    ,
			    
	start_sym_s_11			  		    ,				
	start_sym_s_12			  		    ,

	subframeId_s_11						,
	subframeId_s_12						,
	
	num_symbol_s_11						,
	num_symbol_s_12						,
	
	slot_id_s_l1						,	
	slot_id_s_l2						,
	
	frame_id_l1							,
	frame_id_l2							,
	
	cPlane_coupling_en_s                ,

	long_prach_config_index_l1 			,
	long_prach_config_index_l2 			,
	
	prach_tech_l1						,
	prach_tech_l2						,
	
	gain_re_l1							,
	gain_im_l1							,
	gain_re_l2							,
	gain_im_l2							,
	
	sp_gain_re_l1						,
	sp_gain_im_l1						,	
	sp_gain_re_l2						,
	sp_gain_im_l2						,

    //PRACH OUTPUT CAPTURE
    cap_prach_out_l1_valid              ,
    cap_prach_out_l1_data               ,
    cap_prach_out_l1_channel            ,
	 
	cap_prach_out_l2_valid              ,
    cap_prach_out_l2_data               ,
    cap_prach_out_l2_channel            ,


    //DSPBA CSR
    prach1_busIn_writedata     			,
    prach1_busIn_address       			,
    prach1_busIn_write         			,
    prach1_busIn_read          			,
    prach1_busOut_readdatavalid			,
    prach1_busOut_readdata     			,
    prach1_busOut_waitrequest  			,

    prach2_busIn_writedata     			,
    prach2_busIn_address       			,
    prach2_busIn_write         			,
    prach2_busIn_read          			,
    prach2_busOut_readdatavalid			,
    prach2_busOut_readdata     			,
    prach2_busOut_waitrequest  			,

    
	filt_flush_en						,
	long_prach_version_l1_reg			,
	long_prach_version_l2_reg			,
	short_prach_time_offset				,
	short_prach_time_offset_bias		,
	short_prach_startsym_bias		

	//prach_freq_idx_l1	    			,
	//prach_freq_idx_l2	    			
	
);

//`include "../../quartus_projects/ftile_1588_sr/def_param.vh"
//`include "def_param.vh"

`include "../common/def_param.vh"


//Parameters Declaration
parameter NUM_OF_ANT            =    8    	;
parameter IQ_DATAWIDTH          =    32     ;
parameter CPRI_DATAWIDTH        =    128    ;

//Local parameter
localparam NUM_OF_SYM				= 7   ;	
localparam CPRI_FRAME_DATAWIDTH		= 64  ;
localparam config_index_DATAWIDTH	= 8   ;
localparam TIMING_REF				= 32  ;

// prach instances based on cc2 enabled or disabled
`ifdef NUM_CC_TWO
localparam NUM_OF_PRACH          =    2      ;
`else
localparam NUM_OF_PRACH          =    1      ;
`endif

input 										clk_ul      				;
input 										rst_ul_n    				;

input 										clk_dsp     				;
input 										rst_dsp_n   				;

input 										clk_csr     				;
input 										rst_csr_n   				;
				
input  wire [7:0] 							chan_sel					;
input  wire [3:0] 							data_sel					;

input wire 									valid_in					;

input [15:0]     							cp_len_l1	                ;
input [15:0]     							offset_s_l1				    ;
input [15:0]     							cp_len_l2	                ;
input [15:0]     							offset_s_l2                 ;
  
input [5:0]                                 start_sym_s_11			    ;
input [5:0]                                 start_sym_s_12			    ;

input [3:0]									subframeId_s_11				;
input [3:0]									subframeId_s_12				;

input [3:0]									num_symbol_s_11				;
input [3:0]									num_symbol_s_12				;

input [5:0]									slot_id_s_l1				;
input [5:0]									slot_id_s_l2				;

input wire [7:0]							frame_id_l1					;
input wire [7:0]							frame_id_l2					;

input  wire       							cPlane_coupling_en_s		;

          

input   [NUM_OF_PRACH-1:0]                  avst_sink_valid             ;
input   [NUM_OF_PRACH*IQ_DATAWIDTH-1:0]		avst_sink_data              ;
input   [(NUM_OF_PRACH*8)-1:0]              avst_sink_channel           ;

//input   [31:0]                              long_prach_config_index 	;
input   [15:0]                              long_prach_config_index_l1 	;
input   [15:0]                              long_prach_config_index_l2 	;

input 										prach_tech_l1				;
input 										prach_tech_l2				;

input 	[15:0]								gain_re_l1					;
input 	[15:0]								gain_im_l1					;
input 	[15:0]								gain_re_l2					;
input 	[15:0]								gain_im_l2					;

input 	[15:0]								sp_gain_re_l1					;
input 	[15:0]								sp_gain_im_l1					;
input 	[15:0]								sp_gain_re_l2					;
input 	[15:0]								sp_gain_im_l2					;

input   [19:0]       						frame_num_rx                ;
output  [63:0]                              timing_reference_out        ;
output  [NUM_OF_PRACH-1:0]                  avst_source_valid           ;
output  [NUM_OF_PRACH*IQ_DATAWIDTH -1 :0]   avst_source_data            ;
output  [7:0]                               avst_source_channel         ;
output                                      avst_source_endofpacket     ;
output                                      avst_source_startofpacket   ;

output                                      cap_prach_out_l1_valid      ;
output  [IQ_DATAWIDTH -1 :0]   				cap_prach_out_l1_data       ;
output  [7:0]                               cap_prach_out_l1_channel    ;

output                                      cap_prach_out_l2_valid      ;
output  [IQ_DATAWIDTH -1 :0]   				cap_prach_out_l2_data       ;
output  [7:0]                               cap_prach_out_l2_channel    ;

input  [31:0]                               prach1_busIn_writedata      ;
input  [9:0 ]                               prach1_busIn_address        ;
input                                       prach1_busIn_write          ;
input                                       prach1_busIn_read           ;
output                                      prach1_busOut_readdatavalid ;
output [31:0]                               prach1_busOut_readdata      ;
output                                      prach1_busOut_waitrequest   ;

input  [31:0]                               prach2_busIn_writedata      ;
input  [9:0 ]                               prach2_busIn_address        ;
input                                       prach2_busIn_write          ;
input                                       prach2_busIn_read           ;
output                                      prach2_busOut_readdatavalid ;
output [31:0]                               prach2_busOut_readdata      ;
output                                      prach2_busOut_waitrequest   ;

input [1:0]                                 filt_flush_en               ;
output  [31:0]   long_prach_version_l1_reg;
output  [31:0]   long_prach_version_l2_reg;

input wire [31:0] short_prach_time_offset		;
input wire [31:0] short_prach_time_offset_bias	;
input wire [31:0] short_prach_startsym_bias		;
 
//input [31:0]   							prach_freq_idx_l1			;
//input [31:0]   							prach_freq_idx_l2			;

reg                                      	cap_prach_out_l1_valid      ;
reg  [IQ_DATAWIDTH -1 :0]                	cap_prach_out_l1_data       ;
reg  [7:0]                               	cap_prach_out_l1_channel    ;
	
reg                                      	cap_prach_out_l2_valid      ;
reg  [IQ_DATAWIDTH -1 :0]                	cap_prach_out_l2_data       ;
reg  [7:0]                               	cap_prach_out_l2_channel    ;
reg  [31:0]   long_prach_version_l1_reg;
reg  [31:0]   long_prach_version_l2_reg;
 


wire  [19:0]       					   		frame_num_rx               				;
wire  [19:0]         						prach_frame_num_rx  [NUM_OF_PRACH-1:0]  ;

reg   [19:0]					            frame_num_rx_1d               			;
reg   [19:0]					            frame_num_rx_2d               			;
reg   [19:0]					            frame_num_rx_3d               			;
reg   [19:0]					            frame_num_rx_4d               			;
reg   [19:0]					            frame_num_rx_5d               			;
reg   [19:0]					            frame_num_rx_6d               			;
reg   [19:0]					            frame_num_rx_7d               			;
reg   [19:0]					            frame_num_rx_8d               			;
reg   [19:0]					            frame_num_rx_9d               			;

reg  [7:0]                                  chan_sel_1d                           	;
reg  [7:0]                                  chan_sel_2d                           	;

reg  [3:0]                                  data_sel_1d                           	;
reg  [3:0]                                  data_sel_2d                           	;

reg  [15:0]                                 cp_len_1d                           	;
reg  [15:0]                                 cp_len_2d                           	;

reg  [15:0] 								offset_s_1d 							;
reg  [15:0] 								offset_s_2d 							;            
reg        									cPlane_coupling_en_s_1d 				;
reg        									cPlane_coupling_en_s_2d 				;
     
reg [2:0]									sink_axc_count	[NUM_OF_PRACH-1:0]		;
reg	[NUM_OF_PRACH-1:0]						avst_sink_ready					 		;

reg 										valid_in_1d								;
reg 										valid_in_2d								;
reg 										valid_in_3d								;
reg 										valid_in_4d								;
wire 										valid_in_pos 							;
reg [15:0]									cp_length_latch							;
reg [15:0]									offset_latch							;
reg [15:0]									cp_length_align							;
reg [15:0]									offset_align							;

wire [15:0] offset    [NUM_OF_PRACH-1:0] ;
wire [15:0] cp_length [NUM_OF_PRACH-1:0] ;

wire [5:0] start_symbol [NUM_OF_PRACH-1:0] ;

wire [3:0] subframe_num [NUM_OF_PRACH-1:0] ;

wire [3:0] numsymbol[NUM_OF_PRACH-1:0];
wire [5:0] slotid[NUM_OF_PRACH-1:0];
wire [7:0] frameid[NUM_OF_PRACH-1:0];

wire [NUM_OF_PRACH-1:0]                     avst_source_valid           ;
wire [NUM_OF_PRACH*IQ_DATAWIDTH -1 :0]      avst_source_data            ;
wire [7:0]                                  avst_source_channel         ;
wire                                        avst_source_endofpacket     ;
wire                                        avst_source_startofpacket   ;



wire                                        prach1_busOut_readdatavalid ;
wire [31:0]                                 prach1_busOut_readdata      ;
wire                                        prach1_busOut_waitrequest   ;

wire                                        prach2_busOut_readdatavalid ;
wire [31:0]                                 prach2_busOut_readdata      ;
wire                                        prach2_busOut_waitrequest   ;

wire                                        prach3_busOut_readdatavalid ;
wire [31:0]                                 prach3_busOut_readdata      ;
wire                                        prach3_busOut_waitrequest   ;

wire                                        prach4_busOut_readdatavalid ;
wire [31:0]                                 prach4_busOut_readdata      ;
wire                                        prach4_busOut_waitrequest   ;


reg  [NUM_OF_PRACH-1:0]                     avst_sink_valid_1d          ;
reg  [NUM_OF_PRACH*IQ_DATAWIDTH-1:0]  		avst_sink_data_1d           ;
reg  [(NUM_OF_PRACH*8)-1:0]                 avst_sink_channel_1d        ;
reg                                         avst_sink_endofpacket_1d    ;
reg                                         avst_sink_startofpacket_1d  ;

reg  [NUM_OF_PRACH-1:0]                     avst_sink_valid_2d          ;
reg  [NUM_OF_PRACH*IQ_DATAWIDTH-1:0]    	avst_sink_data_2d		    ;
reg  [(NUM_OF_PRACH*8)-1:0]                 avst_sink_channel_2d        ;
reg                                         avst_sink_endofpacket_2d    ;
reg                                         avst_sink_startofpacket_2d  ;

reg  [NUM_OF_PRACH-1:0]                     avst_sink_valid_3d          ;
reg  [NUM_OF_PRACH-1:0]                     avst_sink_valid_4d          ;
reg  [NUM_OF_PRACH-1:0]                     avst_sink_valid_5d          ;

reg  [NUM_OF_PRACH*IQ_DATAWIDTH-1:0]  		avst_sink_data_3d		    ;
reg  [NUM_OF_PRACH*IQ_DATAWIDTH-1:0]    	avst_sink_data_4d		    ;
reg  [NUM_OF_PRACH*IQ_DATAWIDTH-1:0]    	avst_sink_data_5d		    ;

reg  [(NUM_OF_PRACH*8)-1:0]                 avst_sink_channel_3d        ;

reg                                         avst_source_startofpacket_1d    ;
reg                                         avst_source_startofpacket_2d    ;
reg                                         avst_source_startofpacket_3d    ;

reg                                         avst_source_endofpacket_1d      ;
reg                                         avst_source_endofpacket_2d      ;
reg                                         avst_source_endofpacket_3d      ;


reg [ 7:0]                                  roe_p_counter_1d                ;
reg [ 7:0]                                  roe_p_counter_2d                ;

reg [13:0]                                  roe_q_counter_1d                ;
reg [13:0]                                  roe_q_counter_2d                ;

wire    [NUM_OF_PRACH -1:0]                 scheduler_source_valid                              ;
wire    [CPRI_DATAWIDTH -1 :0]              scheduler_source_data          [NUM_OF_PRACH-1:0]   ;
wire    [7:0]                               scheduler_source_channel       [NUM_OF_PRACH-1:0]   ;
wire    [NUM_OF_PRACH-1:0]                  scheduler_source_endofpacket                        ;
wire    [NUM_OF_PRACH-1:0]                  scheduler_source_startofpacket                      ;

wire    [NUM_OF_PRACH -1:0]                 channelizer_source_valid                            ;
wire    [NUM_OF_ANT*IQ_DATAWIDTH -1:0]      channelizer_source_data          [NUM_OF_PRACH-1:0] ;
wire    [7:0]                               channelizer_source_channel       [NUM_OF_PRACH-1:0] ;
wire    [NUM_OF_PRACH-1:0]                  channelizer_source_endofpacket                      ;
wire    [NUM_OF_PRACH-1:0]                  channelizer_source_startofpacket                    ;

reg     [NUM_OF_PRACH -1:0]                 channelizer_source_valid_1d                         ;
reg     [NUM_OF_PRACH -1:0]                 channelizer_source_valid_2d                         ;
reg     [NUM_OF_PRACH -1:0]                 channelizer_source_valid_3d                         ;
reg     [NUM_OF_ANT*IQ_DATAWIDTH -1:0]      channelizer_source_data_1d       [NUM_OF_PRACH-1:0] ;
reg     [NUM_OF_ANT*IQ_DATAWIDTH -1:0]      channelizer_source_data_2d       [NUM_OF_PRACH-1:0] ;

wire    [IQ_DATAWIDTH-1:0]                  prach_if_dout                    [NUM_OF_PRACH-1:0] ;
wire    [7:0]                               prach_if_cout                    [NUM_OF_PRACH-1:0] ;
wire    [NUM_OF_PRACH -1:0]                 prach_if_vout                                       ;    
wire    [TIMING_REF-1:0]                    timing_reference                 [NUM_OF_PRACH-1:0] ;
reg    [TIMING_REF-1:0]                    	timing_reference_1d              [NUM_OF_PRACH-1:0] ;
reg    [TIMING_REF-1:0]                    	timing_reference_2d              [NUM_OF_PRACH-1:0] ;

wire    [IQ_DATAWIDTH-1:0]                  cap_prach_if_dout                [NUM_OF_PRACH-1:0] ;
wire    [7:0]                               cap_prach_if_cout                [NUM_OF_PRACH-1:0] ;
wire    [NUM_OF_PRACH -1:0]                 cap_prach_if_vout                                   ; 

reg    [NUM_OF_PRACH -1:0]                 	cap_prach_if_vout_1d                                ;    
reg    [NUM_OF_PRACH -1:0]                 	cap_prach_if_vout_2d                                ; 
reg    [NUM_OF_PRACH -1:0]                 	cap_prach_if_vout_3d                                ; 
reg    [NUM_OF_PRACH -1:0]                 	cap_prach_if_vout_4d                                ;

reg    [7:0]               					cap_prach_if_cout_1d      [NUM_OF_PRACH -1:0]      	;    
reg    [7:0]               					cap_prach_if_cout_2d      [NUM_OF_PRACH -1:0]      	; 
reg    [7:0]               					cap_prach_if_cout_3d      [NUM_OF_PRACH -1:0]      	; 
reg    [7:0]               					cap_prach_if_cout_4d      [NUM_OF_PRACH -1:0]      	; 
wire    [31:0]               					long_prach_version      [NUM_OF_PRACH -1:0]      	; 

reg    [IQ_DATAWIDTH-1:0]                	cap_prach_if_dout_1d       [NUM_OF_PRACH -1:0]      ;    
reg    [IQ_DATAWIDTH-1:0]                	cap_prach_if_dout_2d       [NUM_OF_PRACH -1:0]      ; 
reg    [IQ_DATAWIDTH-1:0]                	cap_prach_if_dout_3d       [NUM_OF_PRACH -1:0]      ; 
reg    [IQ_DATAWIDTH-1:0]                	cap_prach_if_dout_4d       [NUM_OF_PRACH -1:0]      ; 


reg     [IQ_DATAWIDTH-1:0]                  prach_if_dout_1d           [NUM_OF_PRACH-1:0]   ;
reg     [IQ_DATAWIDTH-1:0]                  prach_if_dout_2d           [NUM_OF_PRACH-1:0]   ;
reg     [IQ_DATAWIDTH-1:0]                  prach_if_dout_3d           [NUM_OF_PRACH-1:0]   ;
reg     [IQ_DATAWIDTH-1:0]                  prach_if_dout_4d           [NUM_OF_PRACH-1:0]   ;
reg     [NUM_OF_PRACH -1:0]                 prach_if_vout_1d                                ;   
reg     [NUM_OF_PRACH -1:0]                 prach_if_vout_2d                                ;   
reg     [NUM_OF_PRACH -1:0]                 prach_if_vout_3d                                ;   
reg     [NUM_OF_PRACH -1:0]                 prach_if_vout_4d                                ;   
reg     [7:0]                               prach_if_cout_1d           [NUM_OF_PRACH-1:0]   ;
reg     [7:0]                               prach_if_cout_2d           [NUM_OF_PRACH-1:0]   ;
reg     [7:0]                               prach_if_cout_3d           [NUM_OF_PRACH-1:0]   ;
reg     [7:0]                               prach_if_cout_4d           [NUM_OF_PRACH-1:0]   ;


wire [31:0]                                 prach_busIn_writedata        [NUM_OF_PRACH-1:0] ;
wire [9:0 ]                                 prach_busIn_address          [NUM_OF_PRACH-1:0] ;
wire [NUM_OF_PRACH-1:0]                     prach_busIn_write                               ;
wire [NUM_OF_PRACH-1:0]                     prach_busIn_read                                ;
wire [NUM_OF_PRACH-1:0]                     prach_busOut_readdatavalid                      ;
wire [31:0]                                 prach_busOut_readdata        [NUM_OF_PRACH-1:0] ;
wire [NUM_OF_PRACH-1:0]                     prach_busOut_waitrequest                        ;

wire [NUM_OF_PRACH-1:0]                     rst_dsp                         ;

reg  [31: 0]                                prach_input_valid_count      [NUM_OF_PRACH-1:0] ;
reg  [31: 0]                                prach_output_valid_count     [NUM_OF_PRACH-1:0] ;
reg  [15: 0]                                prach_input_valid_count_mod  [NUM_OF_PRACH-1:0] ;
reg  [15: 0]                                prach_output_valid_count_mod [NUM_OF_PRACH-1:0] ;

reg                                         cap_prach_in_valid           ;
wire [NUM_OF_PRACH*CPRI_DATAWIDTH -1 :0]    cap_prach_in_data            ;
wire [7:0]                                  cap_prach_in_channel         ;
wire                                        cap_prach_in_endofpacket     ;
wire                                        cap_prach_in_startofpacket   ;

reg                                         cap_prach_out_valid          ;
reg  [NUM_OF_PRACH*IQ_DATAWIDTH -1 :0]      cap_prach_out_data           ;
reg  [7:0]                                  cap_prach_out_channel        ;
wire                                        cap_prach_out_endofpacket    ;
wire                                        cap_prach_out_startofpacket  ;

reg  [31:0]                                 cap_prach_in_data_1_stage1_high	;
reg  [31:0]                                 cap_prach_in_data_2_stage1_high	;
reg  [31:0]                                 cap_prach_in_data_3_stage1_high	;
reg  [31:0]                                 cap_prach_in_data_4_stage1_high	;

reg  [31:0]                                 cap_prach_in_data_1_stage1_low	;
reg  [31:0]                                 cap_prach_in_data_2_stage1_low	;
reg  [31:0]                                 cap_prach_in_data_3_stage1_low	;
reg  [31:0]                                 cap_prach_in_data_4_stage1_low	;

reg  [31:0]                                 cap_prach_in_data_1				;
reg  [31:0]                                 cap_prach_in_data_2				;
reg  [31:0]                                 cap_prach_in_data_3				;
reg  [31:0]                                 cap_prach_in_data_4				;

wire [3:0]									aux_rx_sfn						;
reg											prach_sink_valid [NUM_OF_PRACH-1:0]  ;
wire [IQ_DATAWIDTH-1:0]						prach_sink_data [NUM_OF_PRACH-1:0]   ;
wire [7:0]									prach_sink_channel [NUM_OF_PRACH-1:0]   ;

reg											rst_dsp_n_1d_dup1 ;
reg											rst_dsp_n_2d_dup1 ;

reg											rst_dsp_n_1d_dup2 ;
reg											rst_dsp_n_2d_dup2 ;

reg											rst_dsp_n_1d_dup3 ;
reg											rst_dsp_n_2d_dup3 ;

reg											rst_ul_n_1d_dup1 ;
reg											rst_ul_n_2d_dup1 ;																		
reg											rst_ul_n_3d_dup1 ;																		
reg											rst_ul_n_4d_dup1 ;

wire [15:0] 					config_index [NUM_OF_PRACH-1:0] ;	
wire 							prach_tech 	 [NUM_OF_PRACH-1:0] ;

wire [15:0]						gain_real	 [NUM_OF_PRACH-1:0]	;
wire [15:0]						gain_imag	 [NUM_OF_PRACH-1:0] ;
wire [15:0]						sp_gain_real [NUM_OF_PRACH-1:0]	;
wire [15:0]						sp_gain_imag [NUM_OF_PRACH-1:0] ;

assign cp_length[0] = cp_len_l1  ;
assign offset[0] 	= offset_s_l1;

assign start_symbol[0] = start_sym_s_11;

assign subframe_num[0] = subframeId_s_11;

assign numsymbol[0] = num_symbol_s_11;

assign slotid[0] = slot_id_s_l1;

assign	frameid[0] = frame_id_l1;

assign config_index[0] = long_prach_config_index_l1 ;

assign prach_tech[0] = prach_tech_l1;

assign gain_real[0] = gain_re_l1;
assign gain_imag[0] = gain_im_l1;
assign sp_gain_real[0] = sp_gain_re_l1;
assign sp_gain_imag[0] = sp_gain_im_l1;

//assign avst_sink_ready  = 1'b1  ;

assign prach_busIn_writedata [0]    =   prach1_busIn_writedata          ;
assign prach_busIn_address   [0]    =   prach1_busIn_address            ;
assign prach_busIn_write     [0]    =   prach1_busIn_write              ;
assign prach_busIn_read      [0]    =   prach1_busIn_read               ;
assign prach1_busOut_readdatavalid  =   prach_busOut_readdatavalid[0]   ;
assign prach1_busOut_readdata       =   prach_busOut_readdata     [0]   ;
assign prach1_busOut_waitrequest    =   prach_busOut_waitrequest  [0]   ;

always @ (posedge clk_dsp)
begin : PRACH_CAPTURE_1
    if(~rst_dsp_n_2d_dup1)
    begin
        cap_prach_out_l1_valid     <=  1'b0    ;
        cap_prach_out_l1_channel   <=  8'b0    ;
        cap_prach_out_l1_data      <= {IQ_DATAWIDTH{1'b0}}  ;
		long_prach_version_l1_reg		<= 'd0;		  
    end
    else 
    begin
		  cap_prach_out_l1_valid     <=  prach_if_vout_4d[0];
		  cap_prach_out_l1_channel   <=  prach_if_cout_4d[0];
		  cap_prach_out_l1_data      <=  prach_if_dout_4d[0];
		  long_prach_version_l1_reg	 <= long_prach_version[0];	
		  
    end
end

`ifdef NUM_CC_TWO
assign prach_busIn_writedata [1]    =   prach2_busIn_writedata          ;
assign prach_busIn_address   [1]    =   prach2_busIn_address            ;
assign prach_busIn_write     [1]    =   prach2_busIn_write              ;
assign prach_busIn_read      [1]    =   prach2_busIn_read               ;
assign prach2_busOut_readdatavalid  =   prach_busOut_readdatavalid[1]   ;
assign prach2_busOut_readdata       =   prach_busOut_readdata     [1]   ;
assign prach2_busOut_waitrequest    =   prach_busOut_waitrequest  [1]   ;


assign cp_length[1] = cp_len_l2  ;
assign offset[1] 	= offset_s_l2;
assign start_symbol[1] = start_sym_s_12;
assign subframe_num[1] = subframeId_s_12;
assign numsymbol[1] = num_symbol_s_12;
assign slotid[1] = slot_id_s_l2;
assign frameid[1] = frame_id_l2;
assign config_index[1] = long_prach_config_index_l2 ;
assign prach_tech[1] = prach_tech_l2;

assign gain_real[1] = gain_re_l2;
assign gain_imag[1] = gain_im_l2;
assign sp_gain_real[1] = sp_gain_re_l2;
assign sp_gain_imag[1] = sp_gain_im_l2;

always @ (posedge clk_dsp)
begin : PRACH_CAPTURE_2
    if(~rst_dsp_n_2d_dup1)
    begin	  
		cap_prach_out_l2_valid     <=  1'b0    ;
        cap_prach_out_l2_channel   <=  8'b0    ;
        cap_prach_out_l2_data      <= {IQ_DATAWIDTH{1'b0}}  ;
		long_prach_version_l2_reg		<= 'd0;	
    end
    else 
    begin 
		  cap_prach_out_l2_valid     <=  prach_if_vout_4d[1];
		  cap_prach_out_l2_channel   <=  prach_if_cout_4d[1];
		  cap_prach_out_l2_data      <=  prach_if_dout_4d[1];
		 long_prach_version_l2_reg	 <= long_prach_version[1]; 
    end
end
`endif


always @(posedge clk_dsp)
	begin
		    rst_dsp_n_1d_dup1 <= rst_dsp_n;
			rst_dsp_n_2d_dup1 <= rst_dsp_n_1d_dup1;
			
		    rst_dsp_n_1d_dup2 <= rst_dsp_n;
			rst_dsp_n_2d_dup2 <= rst_dsp_n_1d_dup2;	
			
		    rst_dsp_n_1d_dup3 <= rst_dsp_n;
			rst_dsp_n_2d_dup3 <= rst_dsp_n_1d_dup3;	
			
	end	
	
always @(posedge clk_ul)
	begin					
		    rst_ul_n_1d_dup1 <= rst_ul_n;
			rst_ul_n_2d_dup1 <= rst_ul_n_1d_dup1;																		
			rst_ul_n_3d_dup1 <= rst_ul_n_2d_dup1;																		
			rst_ul_n_4d_dup1 <= rst_ul_n_3d_dup1;																																			
	end	


// Pipe Line Registers
always @ (posedge clk_dsp)
begin : ETH_PIPE_DELAY
    if(~rst_dsp_n_2d_dup1) 
    begin
        avst_sink_valid_1d                  <= {NUM_OF_PRACH{1'b0}}         ;
        avst_sink_valid_2d                  <= {NUM_OF_PRACH{1'b0}}         ;
        avst_sink_valid_3d                  <= {NUM_OF_PRACH{1'b0}}         ;
        avst_sink_valid_4d                  <= {NUM_OF_PRACH{1'b0}}         ;
        avst_sink_valid_5d                  <= {NUM_OF_PRACH{1'b0}}         ;
        avst_sink_data_1d                   <= 'd0					       	;
        avst_sink_data_2d                   <= 'd0					       	;
        avst_sink_data_3d                   <= 'd0					       	;
        avst_sink_data_4d                   <= 'd0					       	;
        avst_sink_data_5d                   <= 'd0					       	;
        avst_sink_channel_1d                <= 'd0                          ;
        avst_sink_channel_2d                <= 'd0                          ;
		avst_sink_channel_3d                <= 'd0                          ;
    end 
    else 
    begin
        avst_sink_valid_1d                  <= avst_sink_valid              ;
        avst_sink_valid_2d                  <= avst_sink_valid_1d           ;
        avst_sink_valid_3d                  <= avst_sink_valid_2d           ;
        avst_sink_valid_4d                  <= avst_sink_valid_3d           ;
        avst_sink_valid_5d                  <= avst_sink_valid_4d           ;
        avst_sink_data_1d                   <= avst_sink_data               ;
        avst_sink_data_2d                   <= avst_sink_data_1d            ;
        avst_sink_data_3d                   <= avst_sink_data_2d            ;
        avst_sink_data_4d                   <= avst_sink_data_3d            ;
        avst_sink_data_5d                   <= avst_sink_data_4d            ;
        avst_sink_channel_1d                <= avst_sink_channel            ;
        avst_sink_channel_2d                <= avst_sink_channel_1d         ;
		avst_sink_channel_3d                <= avst_sink_channel_2d         ;
    end
end

always @ (posedge clk_dsp)
begin : DSP_PIPE_DELAY
    if(~rst_dsp_n_2d_dup1) 
    begin
       
        frame_num_rx_1d    		    <= 'd0 ;
		frame_num_rx_2d        		<= 'd0 ;
		frame_num_rx_3d        		<= 'd0 ;
		frame_num_rx_4d        		<= 'd0 ;
		frame_num_rx_5d        		<= 'd0 ;
		frame_num_rx_6d        		<= 'd0 ;
		frame_num_rx_7d        		<= 'd0 ;
		frame_num_rx_8d        		<= 'd0 ;
		frame_num_rx_9d        		<= 'd0 ;					
        chan_sel_1d                 <=  'd0 ;
		chan_sel_2d                 <=  'd0 ;
		data_sel_1d                 <=  'd0 ;
		data_sel_2d                 <=  'd0 ;
		cp_len_1d                   <=  'd0 ;
		cp_len_2d                   <=  'd0 ;
		cPlane_coupling_en_s_1d     <=  'd0 ;
        cPlane_coupling_en_s_2d     <=  'd0 ;
		offset_s_1d                 <=  'd0 ;
		offset_s_2d                 <=  'd0 ;
		valid_in_1d					<= 'd0	;
		valid_in_2d					<= 'd0  ;
		valid_in_3d					<= 'd0  ;
		valid_in_4d					<= 'd0  ;
	end 
    else 
    begin
        
        frame_num_rx_1d        		<= frame_num_rx					;
		frame_num_rx_2d        		<= frame_num_rx_1d				;
		frame_num_rx_3d        		<= frame_num_rx_2d				;
		frame_num_rx_4d        		<= frame_num_rx_3d				;
		frame_num_rx_5d        		<= frame_num_rx_4d				;
		frame_num_rx_6d        		<= frame_num_rx_5d				;
		frame_num_rx_7d        		<= frame_num_rx_6d				;
		frame_num_rx_8d        		<= frame_num_rx_7d				;
		frame_num_rx_9d        		<= frame_num_rx_8d				;
		chan_sel_1d                 <= chan_sel 					;
		chan_sel_2d                 <= chan_sel_1d 					;
		data_sel_1d                 <= data_sel 					;
		data_sel_2d                 <= data_sel_1d 					;
		//cp_len_1d					<= cp_len 						;
		cp_len_2d					<= cp_len_1d					;
		cPlane_coupling_en_s_1d     <= cPlane_coupling_en_s         ;
		cPlane_coupling_en_s_2d     <= cPlane_coupling_en_s_1d      ;
		//offset_s_1d                 <= offset_s                   ;
		offset_s_2d                 <= offset_s_1d                  ;
		valid_in_1d					<= valid_in						;
		valid_in_2d					<= valid_in_1d					;
		valid_in_3d					<= valid_in_2d					;
		valid_in_4d					<= valid_in_3d					;
    end
end

	assign valid_in_pos = valid_in_3d & ~valid_in_4d;
	
always @(posedge clk_dsp)
	begin
	    if(~rst_dsp_n_2d_dup1) begin
		    cp_length_latch  	<= 'd0;
			offset_latch 		<= 'd3168;
		end else if (valid_in_pos) begin
			cp_length_latch  	<= cp_len_2d;
			offset_latch 		<= offset_s_2d;
		end	
	end

always @(posedge clk_dsp)
	begin
	    if(~rst_dsp_n_2d_dup1) begin
		    cp_length_align  	<= 'd0;
			offset_align 		<= 'd3168;
		end else if (frame_num_rx_8d[0] == 1'b1) begin
			cp_length_align  	<= cp_length_latch;
			offset_align 		<= offset_latch;
		end	
	end	

/*	
always @(frame_num_rx_9d[0])
	begin
		cp_length_align  	<= cp_length_latch;
		offset_align 		<= offset_latch;
	end	
*/
	
//Generate Statement
generate
genvar prach_num;
for(prach_num=0; prach_num < NUM_OF_PRACH; prach_num = prach_num+1)
begin:PRACH_SLICE


        altera_reset_synchronizer
        #(
            .ASYNC_RESET(0),
            .DEPTH      (2)
        ) prach_dsp_rst_ctrl
        (
            .reset_in   (~rst_dsp_n             ),
            .clk        (clk_dsp                ), 
            .reset_out  (rst_dsp  [prach_num]   )
        );

	
	
	// assign prach_sink_data[prach_num] = avst_sink_data_2d[prach_num*CPRI_DATAWIDTH+:CPRI_DATAWIDTH]      ;
    assign prach_sink_data[prach_num] = avst_sink_data_3d[prach_num*IQ_DATAWIDTH+:IQ_DATAWIDTH]	;
	assign prach_sink_channel[prach_num] = avst_sink_channel_3d[prach_num*8+:8]	;
	
//	reg a = 1'd1;
//
//	wire valid_to_port;
//
//	assign 	valid_to_port = ((a == 0) | (frame_num_rx_8d[3:0] == 'd9)) ? avst_sink_valid_3d[prach_num] : 0;
//  
//	always @(posedge clk_dsp)
//		begin
//			if(~rst_dsp_n_2d_dup1) begin
//			a  	<= 'd1;
//		end else if (frame_num_rx_8d[3:0]=='d9) begin
//			a  	<= 'd0;
//		end	
//	end	
   
`ifdef SHORT_PRACH_FORMAT
prach_shortFormat_fftShift_prach u_prach_shortFormat_fftShift_prach (
        .busIn_writedata 			(prach_busIn_writedata		[prach_num]	), //32
        .busIn_address 				(prach_busIn_address		[prach_num]	), //10
        .busIn_write 				(prach_busIn_write			[prach_num]	), //1
        .busIn_read 				(prach_busIn_read			[prach_num]	),	//1
        .busOut_readdatavalid 		(prach_busOut_readdatavalid [prach_num]	), //1
        .busOut_readdata 			(prach_busOut_readdata		[prach_num]	), //32
        .busOut_waitrequest 		(prach_busOut_waitrequest	[prach_num]	), //1
        .vin1_s 					(avst_sink_valid_3d			[prach_num]	), //1
        .chin1_s 					(prach_sink_channel			[prach_num]	), //8
        .din1_im					(prach_sink_data[prach_num][31:16] 		), //15 // pb out
        .din1_re 					(prach_sink_data[prach_num][15:0]	   	), //15 - lsb
        .SFN_s 						({2'd0,frame_num_rx_8d[14:5]}		  	), //12
        .SubFN_s 					({4'd0,frame_num_rx_8d[4:1]}		  	), //8
        .SCSby15_s 					(2'd2									), //30KHz/12 //2                        
        .BWby10_s 					(8'd10									), //100MHz/10 //8                           
		.CPLen_cplane_s				({7'd0,cp_length[prach_num]}			),
		.timeoffset_cplane_s		(short_prach_time_offset				),
		.numsym_cplane_s			(numsymbol[prach_num]					),
		.slotID_cplane_s			(slotid[prach_num]						),
		.startsym_cplane_s			(start_symbol[prach_num][3:0]			),
		.timerefin_cplane_s			('d0									),
		.cur_slot_s					({1'd0,frame_num_rx_8d[0]}				),
		.SubFN_cplane_s				({4'd0,subframe_num[prach_num]}			),
		.cbar_mplane_s				(cPlane_coupling_en_s_2d				),
		.timeoffset_bias_cplane_s	(short_prach_time_offset_bias			),
		.startsym_bias_cplane_s		(short_prach_startsym_bias				),
		.gain_in_re_s				(sp_gain_real[prach_num]								),
		.gain_in_imag_s				(sp_gain_imag[prach_num]								),
		.fftShift_v_s				(prach_if_vout[prach_num]				),
		.fftShift_c_s				(prach_if_cout[prach_num]				),
		.fftShift_d_im				(prach_if_dout[prach_num][31:16]		),
		.fftShift_d_re				(prach_if_dout[prach_num][15:0]			),
		.TimeReference_s            (timing_reference[prach_num][28:0]		),
        .clk 						(clk_dsp								),
        .areset 					(~rst_dsp_n_2d_dup2						),
        .bus_clk 					(clk_csr					   			),
        .bus_areset 				(~rst_csr_n						   		)
    );
`else
LongPRACH_sim_prach_wrap u_LongPRACH_sim_prach_wrap (
     	.busIn_writedata		(prach_busIn_writedata		[prach_num]	),
    	.busIn_address			(prach_busIn_address		[prach_num]	),
    	.busIn_write			(prach_busIn_write			[prach_num]	),
    	.busIn_read				(prach_busIn_read			[prach_num]	),
    	.busOut_readdatavalid	(prach_busOut_readdatavalid [prach_num]	),
     	.busOut_readdata		(prach_busOut_readdata		[prach_num]	),
    	.busOut_waitrequest		(prach_busOut_waitrequest	[prach_num]	),
    	.vin0_s					(avst_sink_valid_3d			[prach_num]	), 
    	.chin0_s				(prach_sink_channel			[prach_num]	),
     	.din0_im				(prach_sink_data[prach_num][31:16] 		),
     	.din0_re				(prach_sink_data[prach_num][15:0]		),
     	.RFN_s					({2'd0,frame_num_rx_8d[14:5]}			),
    	.subframe_s				({4'd0,frame_num_rx_8d[4:1]}			),
		.prach_cfg_idx_s		(config_index[prach_num]				), //16 bit
	    .cp_len_s				({5'd0,cp_length[prach_num]}			), //21 bit
     	.offset_s				({5'd0,offset[prach_num]}				), //21 bit
    	.c_m_plane_sel_s		(cPlane_coupling_en_s_2d				), //select based on C/M-plane: 1-> M-plane, 0-> C-plane
		.prach_tech_s			(prach_tech [prach_num]					),
     	.filt_flush_en_s		(filt_flush_en[prach_num]				),
		.start_sym_s			(start_symbol[prach_num][3:0]			),
		.SubFrame_cplane_s      ({4'd0,subframe_num[prach_num]}			),
		.gain_re_s				(gain_real[prach_num]					),
		.gain_im_s				(gain_imag[prach_num]					),
		.ch0_info_s				('d0									),
		.ch1_info_s             ('d0									),
		.ch2_info_s             ('d0									),
		.ch3_info_s             ('d0									),
		.RFN_cplane_s			({4'd0,frameid[prach_num]}				), // 12 bits
		.dout_im				(prach_if_dout[prach_num][31:16]		),
     	.dout_re				(prach_if_dout[prach_num][15:0]			),
    	.vout_s					(prach_if_vout[prach_num]				),
    	.cout_s					(prach_if_cout[prach_num]				),
     	.TimeReference_s		(timing_reference[prach_num][31:0]		), // 25bit time ref out in long prach
        .version_info_s			(long_prach_version[prach_num]),
		.ch_info_s				(),
		.clk					(clk_dsp								),
        .areset					(~rst_dsp_n_2d_dup2						),
        .bus_clk				(clk_csr								),
		.bus_areset				(~rst_csr_n								)
    );
`endif	
  
	
// 32 bit - 16 bit, 16 bit

    assign avst_source_data[prach_num*IQ_DATAWIDTH +: IQ_DATAWIDTH] = prach_if_dout_2d [prach_num] ;
    assign timing_reference_out [prach_num*TIMING_REF+:TIMING_REF] = timing_reference_2d [prach_num] ;
    
    always @ (posedge clk_dsp)
    begin : DSP_PIPELINE
        if(~rst_dsp_n_2d_dup1) 
        begin
 
            prach_if_dout_1d            [prach_num] <= {IQ_DATAWIDTH{1'b0}}              ;
            prach_if_dout_2d            [prach_num] <= {IQ_DATAWIDTH{1'b0}}              ;
            prach_if_dout_3d            [prach_num] <= {IQ_DATAWIDTH{1'b0}}              ;
            prach_if_dout_4d            [prach_num] <= {IQ_DATAWIDTH{1'b0}}              ;
            prach_if_vout_1d            [prach_num] <= 1'b0 ;
            prach_if_vout_2d            [prach_num] <= 1'b0 ;
            prach_if_vout_3d            [prach_num] <= 1'b0 ;
            prach_if_vout_4d            [prach_num] <= 1'b0 ;
            prach_if_cout_1d            [prach_num] <= 8'b0 ;
            prach_if_cout_2d            [prach_num] <= 8'b0 ;
            prach_if_cout_3d            [prach_num] <= 8'b0 ;
            prach_if_cout_4d            [prach_num] <= 8'b0 ;
			cap_prach_if_vout_1d        [prach_num] <= 1'b0 ;
			cap_prach_if_vout_2d        [prach_num] <= 1'b0 ;
			cap_prach_if_vout_3d        [prach_num] <= 1'b0 ;
			cap_prach_if_vout_4d        [prach_num] <= 1'b0 ;
			cap_prach_if_cout_1d        [prach_num] <= 8'b0 ;
			cap_prach_if_cout_2d        [prach_num] <= 8'b0 ;
			cap_prach_if_cout_3d        [prach_num] <= 8'b0 ;
			cap_prach_if_cout_4d        [prach_num] <= 8'b0 ;
			cap_prach_if_dout_1d        [prach_num] <= {IQ_DATAWIDTH{1'b0}}   ;
			cap_prach_if_dout_2d        [prach_num] <= {IQ_DATAWIDTH{1'b0}}   ;
			cap_prach_if_dout_3d        [prach_num] <= {IQ_DATAWIDTH{1'b0}}   ;
			cap_prach_if_dout_4d        [prach_num] <= {IQ_DATAWIDTH{1'b0}}   ;

        end
        else
        begin

            prach_if_dout_1d            [prach_num] <= prach_if_dout               [prach_num] ;
            prach_if_dout_2d            [prach_num] <= prach_if_dout_1d            [prach_num] ;
            prach_if_dout_3d            [prach_num] <= prach_if_dout_2d            [prach_num] ;
            prach_if_dout_4d            [prach_num] <= prach_if_dout_3d            [prach_num] ;
            prach_if_vout_1d            [prach_num] <= prach_if_vout               [prach_num] ;
            prach_if_vout_2d            [prach_num] <= prach_if_vout_1d            [prach_num] ;
            prach_if_vout_3d            [prach_num] <= prach_if_vout_2d            [prach_num] ;
            prach_if_vout_4d            [prach_num] <= prach_if_vout_3d            [prach_num] ;
            prach_if_cout_1d            [prach_num] <= prach_if_cout               [prach_num] ;
            prach_if_cout_2d            [prach_num] <= prach_if_cout_1d            [prach_num] ;
            prach_if_cout_3d            [prach_num] <= prach_if_cout_2d            [prach_num] ;
            prach_if_cout_4d            [prach_num] <= prach_if_cout_3d            [prach_num] ;
			cap_prach_if_vout_1d        [prach_num] <= cap_prach_if_vout           [prach_num] ;
			cap_prach_if_vout_2d        [prach_num] <= cap_prach_if_vout_1d        [prach_num] ;
			cap_prach_if_vout_3d        [prach_num] <= cap_prach_if_vout_2d        [prach_num] ;
			cap_prach_if_vout_4d        [prach_num] <= cap_prach_if_vout_3d        [prach_num] ;
			cap_prach_if_cout_1d        [prach_num] <= cap_prach_if_cout           [prach_num] ;
			cap_prach_if_cout_2d        [prach_num] <= cap_prach_if_cout_1d        [prach_num] ;
			cap_prach_if_cout_3d        [prach_num] <= cap_prach_if_cout_2d        [prach_num] ;
			cap_prach_if_cout_4d        [prach_num] <= cap_prach_if_cout_3d        [prach_num] ;
			cap_prach_if_dout_1d        [prach_num] <= cap_prach_if_dout           [prach_num] ;
			cap_prach_if_dout_2d        [prach_num] <= cap_prach_if_dout_1d        [prach_num] ;
			cap_prach_if_dout_3d        [prach_num] <= cap_prach_if_dout_2d        [prach_num] ;
			cap_prach_if_dout_4d        [prach_num] <= cap_prach_if_dout_3d        [prach_num] ;
				
			
        end
    end
	
`ifdef SHORT_PRACH_FORMAT

always @ (posedge clk_dsp)
    begin : DSP_PIPELINE_TIMING_REF
        if(~rst_dsp_n_2d_dup1) 
        begin
			timing_reference_1d         [prach_num] <= {TIMING_REF{1'b0}}	  ;
            timing_reference_2d         [prach_num] <= {TIMING_REF{1'b0}}	  ;

        end
        else
        begin
			timing_reference_1d         [prach_num][28:0] <= timing_reference			   [prach_num][28:0] ;
            timing_reference_2d         [prach_num]       <= timing_reference_1d		   [prach_num]       ;		
        end
    end  
`else
   always @ (posedge clk_dsp)
   begin : DSP_PIPELINE_TIMING_REF
        if(~rst_dsp_n_2d_dup1) 
        begin
			timing_reference_1d         [prach_num] <= {TIMING_REF{1'b0}}	  ;
            timing_reference_2d         [prach_num] <= {TIMING_REF{1'b0}}	  ;

        end
        else
        begin
			timing_reference_1d         [prach_num] <= timing_reference			   [prach_num] ;
            timing_reference_2d         [prach_num] <= timing_reference_1d		   [prach_num] ;		
        end
    end 
`endif
end
endgenerate

// Streaming Output

assign avst_source_valid            = prach_if_vout_2d   ;
assign avst_source_channel          = 8'b0               ;
assign avst_source_endofpacket      = 1'b0               ;
assign avst_source_startofpacket    = 1'b1               ;

 

assign cap_prach_out_startofpacket = 1'b1       ; 
assign cap_prach_out_endofpacket = 1'b1         ;


//  Logarithm base 2 to find the power of Input data
  
function [31:0] logb2   ;
    input [31:0] value  ;
    begin
        value = value - 32'd1;
        for (logb2=0; value>0; logb2=logb2+1) 
        begin
            value = value >> 1;
        end
    end
endfunction

endmodule
