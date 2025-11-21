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
 
module ifft_if
(
    clk_dsp                     ,
    rst_dsp_n                   ,

    clk_csr                     ,
    rst_csr_n                   ,
	
	rst_soft_n                  ,

    // Stream Input            
    avst_sink_valid             ,
    avst_sink_data              ,
    avst_sink_channel           ,
	avst_sink_startofpacket		,
	avst_sink_endofpacket		,
    avst_sink_ready             ,

    // Stream Output   
    ifft_avst_source_valid      ,
    ifft_avst_source_data       ,
    ifft_avst_source_channel    ,

	//DSPBA CSR
    ifft_busIn_writedata        ,
    ifft_busIn_address          ,
    ifft_busIn_write            ,
    ifft_busIn_read             ,
    ifft_busOut_readdatavalid   ,
    ifft_busOut_readdata        ,
    ifft_busOut_waitrequest     ,
	
	bw_config					,
	
	cp_len 						,
	fft_size					,
	ifft_gain 					,
	ifft_shift 					,
	ifft_mux_const				,
	ifft_muxsel					,
	dc_sc_en 				    ,

    pm_ifft_threash_mm_bridge_address		,
    pm_ifft_threash_mm_bridge_chipselect	,
    pm_ifft_threash_mm_bridge_read			,
    pm_ifft_threash_mm_bridge_write			,
    pm_ifft_threash_mm_bridge_writedata		,
    pm_ifft_threash_mm_bridge_byteenable	,
    pm_ifft_threash_mm_bridge_readdata		,
    pm_ifft_threash_mm_bridge_waitrequest	,
											,
    pm_ifft_hist_mm_bridge_address			,
    pm_ifft_hist_mm_bridge_chipselect		,
    pm_ifft_hist_mm_bridge_read				,
    pm_ifft_hist_mm_bridge_write			,
    pm_ifft_hist_mm_bridge_writedata		,
    pm_ifft_hist_mm_bridge_byteenable		,
    pm_ifft_hist_mm_bridge_readdata			,
    pm_ifft_hist_mm_bridge_readdatavalid	,
    pm_ifft_hist_mm_bridge_waitrequest		,
	
	pm_stat_ifft_mm_bridge_address	       ,	
	pm_stat_ifft_mm_bridge_chipselect	   ,
	pm_stat_ifft_mm_bridge_read		       ,
	pm_stat_ifft_mm_bridge_write		   ,
	pm_stat_ifft_mm_bridge_writedata	   ,
	pm_stat_ifft_mm_bridge_byteenable	   ,
	pm_stat_ifft_mm_bridge_readdata	       ,
	pm_stat_ifft_mm_bridge_readdatavalid	,
	
	pm_stat_ifft_mm_bridge_waitrequest	   ,
									
    pwr_mtr_config_csr_writedata			,
    pwr_mtr_config_csr_read				    ,
    pwr_mtr_config_csr_write				,
    pwr_mtr_config_csr_readdata				,
    pwr_mtr_config_csr_readdatavalid		,
    pwr_mtr_config_csr_address	            ,
	 
	 pwr_mtr_ifft_hist_done_intr,

    ripple_comp_en_s  ,	
	rc_bw_sel_s		  
);


//Parameters Declaration
parameter NUM_OF_ANT            =    4      ;
parameter NUM_OF_FFT            =    2      ;
parameter IQ_DATAWIDTH          =    32     ;

//Local parameter
localparam NUM_OF_SYM           =    14     ;

input 									clk_dsp       						;
input 									rst_dsp_n     						;
input 									clk_csr       						;
input 									rst_csr_n     						;

input 									rst_soft_n   						;
 
input									avst_sink_valid     				;      
input  [IQ_DATAWIDTH -1 :0]				avst_sink_data            			;
input  [7:0]							avst_sink_channel         			;
input									avst_sink_startofpacket				;
input									avst_sink_endofpacket				;


output                                  avst_sink_ready             		;

output                                  ifft_avst_source_valid          	;
output [IQ_DATAWIDTH -1 :0]             ifft_avst_source_data           	;
output [7:0]                            ifft_avst_source_channel        	;

input  [31:0]                           ifft_busIn_writedata       			;
input  [13:0 ]                         	ifft_busIn_address         			;
input                                   ifft_busIn_write           			;
input                                   ifft_busIn_read            			;
output                                  ifft_busOut_readdatavalid  			;
output [31:0]                           ifft_busOut_readdata       			;
output                                  ifft_busOut_waitrequest    			;

input wire [6:0]						bw_config							;

input wire [10:0] 						cp_len 								;
input wire [3:0]						fft_size							;			
input wire [31:0] 						ifft_gain 							;		
input wire [3:0] 						ifft_shift 							;		
input wire [31:0] 						ifft_mux_const						;
input wire								ifft_muxsel							;		
input wire 		 						dc_sc_en 							;

input  			[5:0]   	        pm_ifft_threash_mm_bridge_address		;
input  			         	        pm_ifft_threash_mm_bridge_chipselect	;
input  			         	        pm_ifft_threash_mm_bridge_read			;
input  			         	        pm_ifft_threash_mm_bridge_write			;	
input  			[31:0] 	            pm_ifft_threash_mm_bridge_writedata		;
input  			[3:0]    	        pm_ifft_threash_mm_bridge_byteenable	;
output 			[31:0] 	            pm_ifft_threash_mm_bridge_readdata		;
output 			         	        pm_ifft_threash_mm_bridge_waitrequest	;

input  			[11:0]  			pm_ifft_hist_mm_bridge_address			;
input  			         			pm_ifft_hist_mm_bridge_chipselect		;
input  			         			pm_ifft_hist_mm_bridge_read				;
input  			         			pm_ifft_hist_mm_bridge_write			;	
input  			[31:0]				pm_ifft_hist_mm_bridge_writedata		;
input  			[3:0]    			pm_ifft_hist_mm_bridge_byteenable		;
output 			[31:0] 			pm_ifft_hist_mm_bridge_readdata			;
output								pm_ifft_hist_mm_bridge_readdatavalid;
output 			         			pm_ifft_hist_mm_bridge_waitrequest		;

input  			[9:0]  			pm_stat_ifft_mm_bridge_address			;
input  			         			pm_stat_ifft_mm_bridge_chipselect		;
input  			         			pm_stat_ifft_mm_bridge_read				;
input  			         			pm_stat_ifft_mm_bridge_write			;	
input  			[31:0] 			pm_stat_ifft_mm_bridge_writedata		;
input  			[3:0]    			pm_stat_ifft_mm_bridge_byteenable		;
output 			[31:0] 			pm_stat_ifft_mm_bridge_readdata			;
output								pm_stat_ifft_mm_bridge_readdatavalid		;
output 			         			pm_stat_ifft_mm_bridge_waitrequest		;



input 	wire 	[31:0] 				pwr_mtr_config_csr_writedata			;	
input 	wire 						pwr_mtr_config_csr_read				    ;
input 	wire	 					pwr_mtr_config_csr_write				;
output 	    	[31:0] 				pwr_mtr_config_csr_readdata				;
output 	    						pwr_mtr_config_csr_readdatavalid		;	
input	wire 	[3:0] 				pwr_mtr_config_csr_address			    ;
output wire							pwr_mtr_ifft_hist_done_intr;

input       ripple_comp_en_s	;
input [3:0] rc_bw_sel_s			;			

// Internal Wires and Registers

reg   [6:0] 							bw_config_1d						;
reg   [6:0] 							bw_config_2d						;

reg [11:0] 								nsc                					;
reg [11:0] 								nsc_1d             					;

reg [11:0]								nsc_2d_dup1        					;
reg [11:0]								nsc_2d_dup2        					;

reg [3:0] 								fft_size_1d							;
reg [3:0] 								fft_size_2d_dup1					;
reg [3:0] 								fft_size_2d_dup2					;

reg [15:0] 								fft_cplength						;
reg [15:0] 								fft_cplength_1d						;
reg [15:0] 								fft_cplength_2d_dup1				;
reg [15:0] 								fft_cplength_2d_dup2				;

wire                                    avst_sink_ready             		;

reg                                     ifft_avst_sink_valid_1d          	;
reg                                     ifft_avst_sink_valid_2d          	;
reg                                     ifft_avst_sink_valid_3d          	;
reg                                     ifft_avst_sink_valid_4d          	;
reg   				                    ifft_avst_sink_valid_5d_dup1     	;
reg   				                    ifft_avst_sink_valid_5d_dup2     	;

reg  [IQ_DATAWIDTH -1 :0]    			ifft_avst_sink_data_1d           	;  
reg  [IQ_DATAWIDTH -1 :0]    			ifft_avst_sink_data_2d           	;
reg  [IQ_DATAWIDTH -1 :0]    			ifft_avst_sink_data_3d           	;
reg  [IQ_DATAWIDTH -1 :0]    			ifft_avst_sink_data_4d           	;
reg  [IQ_DATAWIDTH -1 :0]    			ifft_avst_sink_data_5d           	;
	
reg  [7:0]                              ifft_avst_sink_channel_1d        	;
reg  [7:0]                              ifft_avst_sink_channel_2d        	;
	
reg                                     ifft_avst_sink_endofpacket_1d    	;
reg                                     ifft_avst_sink_endofpacket_2d    	;
	
reg                                     ifft_avst_sink_startofpacket_1d  	;
reg                                     ifft_avst_sink_startofpacket_2d  	;
	
reg  [IQ_DATAWIDTH -1 :0]               ifft_sink_data      				;
	
reg  [IQ_DATAWIDTH -1 :0]               ifft_source_data1_1d    			;
reg  [IQ_DATAWIDTH -1 :0]               ifft_source_data1_2d   				;

reg                					    ifft_source_valid1_1d            	;
reg                					    ifft_source_valid1_2d            	;
	
reg  [logb2(NUM_OF_ANT)-1:0]            avst_sink_antenna               	;  
wire                                    avst_sink_antenna_last          	;  
reg                                     avst_sink_antenna_last_1d       	;  
reg  [logb2(NUM_OF_SYM)-1:0]            avst_sink_symbol                	;  
reg  [logb2(NUM_OF_SYM)-1:0]            avst_sink_symbol_1d             	;  
reg  [logb2(NUM_OF_SYM)-1:0]            avst_sink_symbol_2d_dup1        	;  
reg  [logb2(NUM_OF_SYM)-1:0]            avst_sink_symbol_2d_dup2        	;  

reg  [7:0]                              ifft_source_channel1_1d             ;
reg  [7:0]                              ifft_source_channel1_2d             ;

wire [31:0]                             ifft_busIn_writedata            	;
wire [13:0 ]                             ifft_busIn_address              	;
wire                   					ifft_busIn_write                    ;
wire                   					ifft_busIn_read                     ;
wire                  					ifft_busOut_readdatavalid           ;
wire [31:0]                             ifft_busOut_readdata            	;
wire                  					ifft_busOut_waitrequest             ;

reg  [31:0] 							ifft_gain_1d						;
reg  [31:0] 							ifft_gain_2d						;
reg  [3:0] 								ifft_shift_1d						;
reg  [3:0] 								ifft_shift_2d						;
reg  [15:0] 							ifft_mux_const_1d					;
reg  [15:0] 							ifft_mux_const_2d					;
reg  									muxsel_1d							;
reg  									muxsel_2d							;

wire [31:0] 							ifft_source_data					;
wire 									ifft_source_valid					;
wire [1:0] 								ifft_source_channel					;

reg 									dc_sc_en_1d							;
reg 									dc_sc_en_2d							;

	wire [63:0] 	timeref_in_s		;//INPUT		
    wire [15:0] 	td_ifft_out_data_im	;//OUTPUT
    wire [15:0]		td_ifft_out_data_re	;//OUTPUT
    wire [7:0] 		td_ifft_out_ch_s	;//OUTPUT
    wire [0:0] 		td_ifft_out_valid_s	;//OUTPUT
    wire [0:0] 		fd_data_v_s			;//OUTPUT
    wire [7:0] 		fd_data_c_s			;//OUTPUT
    wire [15:0] 	fd_data_q_im		;//OUTPUT
    wire [15:0] 	fd_data_q_re		;//OUTPUT
    wire [63:0] 	fd_timeref_out_s	;//OUTPUT
    wire [31:0] 	version_out_s		;//OUTPUT


assign avst_sink_ready  = 1'b1  ;

// Pipe Line Registers
always @ (posedge clk_dsp)
begin : PIPE_DELAY
    if(~rst_dsp_n) 
    begin
        ifft_avst_sink_valid_1d                 <= 1'b0                             ;
		ifft_avst_sink_valid_2d                 <= 1'b0                             ;
		ifft_avst_sink_valid_3d            		<= 1'b0                             ;
		ifft_avst_sink_valid_4d            		<= 1'b0                             ;
        ifft_avst_sink_valid_5d_dup1       		<= 1'b0                             ;
		ifft_avst_sink_valid_5d_dup2       		<= 1'b0                             ;
		
		ifft_avst_sink_data_1d					<= {IQ_DATAWIDTH{1'b0}} 			;
		ifft_avst_sink_data_2d					<= {IQ_DATAWIDTH{1'b0}} 			;
		ifft_avst_sink_data_3d					<= {IQ_DATAWIDTH{1'b0}} 			;
		ifft_avst_sink_data_4d					<= {IQ_DATAWIDTH{1'b0}} 			;
		ifft_avst_sink_data_5d					<= {IQ_DATAWIDTH{1'b0}} 			;
		
        ifft_avst_sink_channel_1d               <= 8'b0                             ;
		ifft_avst_sink_channel_2d               <= 8'b0                             ;
        
		avst_sink_antenna_last_1d           	<= 1'b0                             ;
        avst_sink_symbol_1d                 	<= {logb2(NUM_OF_SYM){1'b0}}        ;
        avst_sink_symbol_2d_dup1            	<= {logb2(NUM_OF_SYM){1'b0}}        ;
		avst_sink_symbol_2d_dup2            	<= {logb2(NUM_OF_SYM){1'b0}}        ;
		
		bw_config_1d							<= 1'b0								;
		bw_config_2d							<= 1'b0								;
		
		ifft_avst_sink_endofpacket_1d			<= 1'b0								;
		ifft_avst_sink_endofpacket_2d			<= 1'b0								;
    end 
    else 
    begin
        ifft_avst_sink_valid_1d                  <= avst_sink_valid						    ; 
		ifft_avst_sink_valid_2d                  <= ifft_avst_sink_valid_1d                 ;
		ifft_avst_sink_valid_3d                  <= ifft_avst_sink_valid_2d                 ;
        ifft_avst_sink_valid_4d                  <= ifft_avst_sink_valid_3d                 ;
        ifft_avst_sink_valid_5d_dup1             <= ifft_avst_sink_valid_4d                 ;
		ifft_avst_sink_valid_5d_dup2             <= ifft_avst_sink_valid_4d                 ;

        ifft_avst_sink_data_1d                   <= avst_sink_data						    ;
		ifft_avst_sink_data_2d                   <= ifft_avst_sink_data_1d                  ;
		ifft_avst_sink_data_3d                   <= ifft_avst_sink_data_2d                  ;
        ifft_avst_sink_data_4d                   <= ifft_avst_sink_data_3d                  ;
        ifft_avst_sink_data_5d                   <= ifft_avst_sink_data_4d                  ;

        ifft_avst_sink_channel_1d                <= avst_sink_channel					    ; 
		ifft_avst_sink_channel_2d                <= ifft_avst_sink_channel_1d               ;

		avst_sink_antenna_last_1d           	 <= avst_sink_antenna_last           		;
        avst_sink_symbol_1d                 	 <= avst_sink_symbol                 		;
        avst_sink_symbol_2d_dup1            	 <= avst_sink_symbol_1d              		;
		avst_sink_symbol_2d_dup2            	 <= avst_sink_symbol_1d              		;

		bw_config_1d							 <= bw_config								;
		bw_config_2d							 <= bw_config_1d							;
		
		ifft_avst_sink_endofpacket_1d			<= avst_sink_endofpacket					;
		ifft_avst_sink_endofpacket_2d			<= ifft_avst_sink_endofpacket_1d			;
		
    end
end


// Subcarrier Configurable for Variable Bandwidth
always @ (posedge clk_dsp)
begin 		
	if (rst_dsp_n == 1'b0)
		nsc      <= 'd0;
	else 
	begin
		case(bw_config_2d[6:0])
		'hA   	:   nsc  <= 'd1944 	;
		'hE   	:   nsc  <= 'd3276 	;
		default : 	nsc  <= 'd3276  ;
		endcase
	end		
end


always @ (posedge clk_dsp)
begin : L1_SINK_ANTENNA_COUNT
    if (rst_dsp_n == 1'b0)
        avst_sink_antenna   <=  {logb2(NUM_OF_ANT){1'b0}}   ; 
    else if (avst_sink_antenna_last)
        avst_sink_antenna   <=  {logb2(NUM_OF_ANT){1'b0}}   ; 
    else if (ifft_avst_sink_valid_2d & ifft_avst_sink_endofpacket_2d)
        avst_sink_antenna   <=  avst_sink_antenna + 1'b1;
end

assign avst_sink_antenna_last  =  ifft_avst_sink_valid_2d & ifft_avst_sink_endofpacket_2d & (avst_sink_antenna == (NUM_OF_ANT-1)) ;

always @ (posedge clk_dsp)
begin : L1_SINK_ANTENNA_SYMBOL
    if (rst_dsp_n == 1'b0)
        avst_sink_symbol    <=  {logb2(NUM_OF_SYM){1'b0}}   ; 
    else if (avst_sink_antenna_last_1d & (avst_sink_symbol == (NUM_OF_SYM-1)))
        avst_sink_symbol    <=  {logb2(NUM_OF_ANT){1'b0}}   ; 
    else if (avst_sink_antenna_last_1d)
        avst_sink_symbol    <=  avst_sink_symbol + 1'b1;
end


always @ (posedge clk_dsp)
begin
	if (rst_dsp_n == 1'b0)
	begin
		nsc_1d                          <=  12'b0                           ;
		nsc_2d_dup1                     <=  12'b0                           ;
		nsc_2d_dup2                     <=  12'b0                           ;
		fft_size_1d                     <=  4'b0                            ;
		fft_size_2d_dup1                <=  4'b0                            ;
		fft_size_2d_dup2                <=  4'b0                            ;
		fft_cplength_1d                 <=  16'b0                           ;
		fft_cplength_2d_dup1            <=  16'b0                           ;
		fft_cplength_2d_dup2            <=  16'b0                           ;
		ifft_sink_data                  <=  'b0                             ;
		ifft_gain_1d					<= 	'd0								;
		ifft_gain_2d					<= 	'd0								;
		ifft_shift_1d					<= 	'd0								;
		ifft_shift_2d					<= 	'd0								;
		ifft_mux_const_1d				<= 	'd0								;
		ifft_mux_const_2d				<= 	'd0								;
		muxsel_1d						<= 	'd0								;
		muxsel_2d						<= 	'd0								;
		dc_sc_en_1d						<=  'd0								;
		dc_sc_en_2d						<= 	'd0								;

	end
	else
	begin
		nsc_1d                          <=  nsc                             ;
		nsc_2d_dup1                     <=  nsc_1d                          ;
		nsc_2d_dup2                     <=  nsc_1d                          ;
		fft_size_1d                     <=  fft_size                        ;
		fft_size_2d_dup1                <=  fft_size_1d                     ;
		fft_size_2d_dup2                <=  fft_size_1d                     ;	
		fft_cplength_1d                 <=  cp_len		                    ;
		fft_cplength_2d_dup1            <=  fft_cplength_1d                 ;	
		fft_cplength_2d_dup2            <=  fft_cplength_1d                 ;
		ifft_sink_data                  <=  ifft_avst_sink_data_4d     		;
		ifft_gain_1d					<= ifft_gain						;
		ifft_gain_2d					<= ifft_gain_1d						;
		ifft_shift_1d					<= ifft_shift						;
		ifft_shift_2d					<= ifft_shift_1d					;
		ifft_mux_const_1d				<= ifft_mux_const[15:0]				;
		ifft_mux_const_2d				<= ifft_mux_const_1d				;
		muxsel_1d						<= ifft_muxsel						;
		muxsel_2d						<= muxsel_1d						;
		dc_sc_en_1d						<= dc_sc_en							;
		dc_sc_en_2d						<= dc_sc_en_1d						;
	
	end
end

ifft_blocktostream_DUT u_ifft_blocktostream_DUT
(
    .busIn_writedata 			(ifft_busIn_writedata			),
    .busIn_address 				(ifft_busIn_address				),
    .busIn_write 				(ifft_busIn_write				),
    .busIn_read 				(ifft_busIn_read				),
    .busOut_readdatavalid 		(ifft_busOut_readdatavalid		),
    .busOut_readdata			(ifft_busOut_readdata			),
    .busOut_waitrequest			(ifft_busOut_waitrequest		),
    .data1_im					(ifft_sink_data[31:16]			),
    .data1_re					(ifft_sink_data[15:0]			),
    .valid1_s					(ifft_avst_sink_valid_5d_dup1	),
    .channel1_s					({4'd0, avst_sink_symbol_2d_dup1}),
    .size1_s					(fft_size_2d_dup1				),
    .cplen1_s					(fft_cplength_2d_dup2			),
    .nsc1_s						(nsc_2d_dup1					),
    .ifft_gain_re_l1_s 			(ifft_gain_2d[15:0]				),
    .ifft_gain_im_l1_s			(ifft_gain_2d[31:16]			),
    .ifft_shift_l1_s			(ifft_shift_2d					),
    .ifft_mux_const_l1_s		(ifft_mux_const_2d				),
    .muxsel_l1_s				(muxsel_2d						),
    .DC_SC_EN_s					(dc_sc_en_2d					), 
    .CP_EN1_s					(1'b1							), // By default, This port value will be high. Phase Comp can be disabled/enabled using Reg_Addr 0x0003 (DSPBA BuS)
	.ripple_comp_en_s			(ripple_comp_en_s			  ),
    .rc_bw_sel_s				(rc_bw_sel_s[0]					),
	.vout2_s					(ifft_source_valid				),
    .cout2_s					(ifft_source_channel			),
    .dout2_im					(ifft_source_data[31:16]		),
    .dout2_re					(ifft_source_data[15:0]			),
    .ifft_size_out_s			(),
    .ifft_nprb_out_s			(),
    .ifft_cp_out_s				(),
	.timeref_in_s				(timeref_in_s					),//INPUT	[63:0]
	.td_ifft_out_data_im	    (td_ifft_out_data_im			),//OUTPUT  [15:0]
	.td_ifft_out_data_re	    (td_ifft_out_data_re			),//OUTPUT  [15:0]
	.td_ifft_out_ch_s	        (td_ifft_out_ch_s				),//OUTPUT  [7:0] 
	.td_ifft_out_valid_s	    (td_ifft_out_valid_s			),//OUTPUT  [0:0] 
	.fd_data_v_s			    (fd_data_v_s					),//OUTPUT  [0:0] 
	.fd_data_c_s			    (fd_data_c_s					),//OUTPUT  [7:0] 
	.fd_data_q_im		        (fd_data_q_im					),//OUTPUT  [15:0]
	.fd_data_q_re		        (fd_data_q_re					),//OUTPUT  [15:0]
	.fd_timeref_out_s	        (fd_timeref_out_s				),//OUTPUT  [63:0]
	.version_out_s		        (version_out_s					),//OUTPUT  [31:0]
    .clk						(clk_dsp						),
    .areset						(~rst_dsp_n						),
    .bus_clk					(clk_csr						),
	.bus_areset					(~rst_csr_n						)
);
	

power_meter_top_ss #(.DATA_WIDTH(32),.RAM_WIDTH(16),.ADDR_WIDTH(6),.ADDR_WIDTH1(12),.ADDR_WIDTH2(10)) u_power_meter_top_ss
(


            		.clk_dsp				(clk_dsp				),
			.rst_dsp_n				(rst_dsp_n				),
			.clk_csr				(clk_csr				), 
			.rst_csr_n				(rst_csr_n				), 
			.rst_soft_n				(rst_soft_n				),
			
			.ai					(fd_data_q_re				),// sfix16_En14
			.aq					(fd_data_q_im				),// sfix16_En14
			.valid_i				(fd_data_v_s				),
			.channel_i				(fd_data_c_s				),
			.hist_done_intr			(pwr_mtr_ifft_hist_done_intr		),
			
			// Traffic MM Slave	
 		  	.pm_threash_mm_bridge_address		(pm_ifft_threash_mm_bridge_address	),
 			.pm_threash_mm_bridge_chipselect	(pm_ifft_threash_mm_bridge_chipselect	),
 			.pm_threash_mm_bridge_read		(pm_ifft_threash_mm_bridge_read	),
 			.pm_threash_mm_bridge_write		(pm_ifft_threash_mm_bridge_write	),	
 			.pm_threash_mm_bridge_writedata	(pm_ifft_threash_mm_bridge_writedata	),
 			.pm_threash_mm_bridge_byteenable	(pm_ifft_threash_mm_bridge_byteenable	),
 			.pm_threash_mm_bridge_readdata		(pm_ifft_threash_mm_bridge_readdata	),
 			.pm_threash_mm_bridge_waitrequest	(pm_ifft_threash_mm_bridge_waitrequest	),
			
			// Traffic MM Slave	
			.pm_hist_mm_bridge_address		(pm_ifft_hist_mm_bridge_address	),
			.pm_hist_mm_bridge_chipselect		(pm_ifft_hist_mm_bridge_chipselect	),
			.pm_hist_mm_bridge_read		(pm_ifft_hist_mm_bridge_read		),
			.pm_hist_mm_bridge_write		(pm_ifft_hist_mm_bridge_write		),	
			.pm_hist_mm_bridge_writedata		(pm_ifft_hist_mm_bridge_writedata	),
			.pm_hist_mm_bridge_byteenable		(pm_ifft_hist_mm_bridge_byteenable	),
			.pm_hist_mm_bridge_readdata		(pm_ifft_hist_mm_bridge_readdata	),
			.pm_hist_mm_bridge_readdatavalid	(pm_ifft_hist_mm_bridge_readdatavalid	),
			.pm_hist_mm_bridge_waitrequest	 	(pm_ifft_hist_mm_bridge_waitrequest 	),
			
			.pm_stat_mm_bridge_address		(pm_stat_ifft_mm_bridge_address	),
			.pm_stat_mm_bridge_chipselect		(pm_stat_ifft_mm_bridge_chipselect	),
			.pm_stat_mm_bridge_read		(pm_stat_ifft_mm_bridge_read		),
			.pm_stat_mm_bridge_write		(pm_stat_ifft_mm_bridge_write		),	
			.pm_stat_mm_bridge_writedata		(pm_stat_ifft_mm_bridge_writedata	),
			.pm_stat_mm_bridge_byteenable		(pm_stat_ifft_mm_bridge_byteenable	),
			.pm_stat_mm_bridge_readdata		(pm_stat_ifft_mm_bridge_readdata	),
			.pm_stat_mm_bridge_readdatavalid	(pm_stat_ifft_mm_bridge_readdatavalid	),
			.pm_stat_mm_bridge_waitrequest		(pm_stat_ifft_mm_bridge_waitrequest	),
			

            		.pwr_mtr_config_csr_writedata		(pwr_mtr_config_csr_writedata		),	
			.pwr_mtr_config_csr_read		(pwr_mtr_config_csr_read		),
			.pwr_mtr_config_csr_write		(pwr_mtr_config_csr_write		),
			.pwr_mtr_config_csr_readdata		(pwr_mtr_config_csr_readdata		),
			.pwr_mtr_config_csr_readdatavalid	(pwr_mtr_config_csr_readdatavalid	),	
			.pwr_mtr_config_csr_address		(pwr_mtr_config_csr_address	     	)		

  );
  

 always @ (posedge clk_dsp)
begin 
    if(~rst_dsp_n) 
    begin
        ifft_source_valid1_1d       <=  1'b0                    ;
        ifft_source_valid1_2d       <=  1'b0                    ;
		ifft_source_channel1_1d		<=  8'd0                    ;
		ifft_source_channel1_2d		<=  8'd0                    ;
        ifft_source_data1_1d 		<=  'd0						;
        ifft_source_data1_2d 		<=  'd0						;
    end 
    else 
    begin
        ifft_source_valid1_1d       <=  ifft_source_valid    	;
        ifft_source_valid1_2d       <=  ifft_source_valid1_1d   ;
		ifft_source_channel1_1d		<=  {6'd0,ifft_source_channel} ;
		ifft_source_channel1_2d		<=  ifft_source_channel1_1d ;
		ifft_source_data1_1d 		<=  ifft_source_data		;
		ifft_source_data1_2d 		<=  ifft_source_data1_1d	;
    end
end 
    
// Streaming Output

assign ifft_avst_source_valid            = ifft_source_valid1_2d     ;
assign ifft_avst_source_channel          = ifft_source_channel1_2d   ;
assign ifft_avst_source_data             = ifft_source_data1_2d      ;


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
