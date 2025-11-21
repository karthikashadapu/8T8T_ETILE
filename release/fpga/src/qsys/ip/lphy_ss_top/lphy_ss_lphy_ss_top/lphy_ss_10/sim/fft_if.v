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
 
module fft_if
(
    clk_dsp                         ,
    rst_dsp_n                       ,

    clk_csr                         ,
    rst_csr_n                       ,
	
	rst_soft_n                      ,

    // Stream Input                 
    avst_sink_valid              	,
    avst_sink_data               	,
    avst_sink_channel            	,
	
    // Stream Output   
    avst_source_valid               ,
    avst_source_data                ,
    avst_source_channel             ,
    avst_source_ready               ,
    avst_source_endofpacket         ,
    avst_source_startofpacket       ,
	
	bw_config						,
	
	ul_frame_status                 ,
	time_ref_out                    ,

    //DSPBA CSR
    fft_busIn_writedata             ,
    fft_busIn_address               ,
    fft_busIn_write                 ,
    fft_busIn_read                  ,
    fft_busOut_readdatavalid        ,
    fft_busOut_readdata             ,
    fft_busOut_waitrequest          ,
	
	pm_fft_threash_mm_bridge_address		,
    pm_fft_threash_mm_bridge_chipselect		,
    pm_fft_threash_mm_bridge_read			,
    pm_fft_threash_mm_bridge_write			,
    pm_fft_threash_mm_bridge_writedata		,
    pm_fft_threash_mm_bridge_byteenable		,
    pm_fft_threash_mm_bridge_readdata		,
    pm_fft_threash_mm_bridge_waitrequest	,
											,
    pm_fft_hist_mm_bridge_address			,
    pm_fft_hist_mm_bridge_chipselect		,
    pm_fft_hist_mm_bridge_read				,
    pm_fft_hist_mm_bridge_write			,
    pm_fft_hist_mm_bridge_writedata		,
    pm_fft_hist_mm_bridge_byteenable		,
    pm_fft_hist_mm_bridge_readdata			,
    pm_fft_hist_mm_bridge_readdatavalid			,
    pm_fft_hist_mm_bridge_waitrequest		,
											,
    pwr_mtr_config_csr_writedata			,
    pwr_mtr_config_csr_read				    ,
    pwr_mtr_config_csr_write				,
    pwr_mtr_config_csr_readdata				,
    pwr_mtr_config_csr_readdatavalid		,
    pwr_mtr_config_csr_address	            ,
	
	pm_stat_fft_mm_bridge_address	       ,	
	pm_stat_fft_mm_bridge_chipselect	   ,
	pm_stat_fft_mm_bridge_read		       ,
	pm_stat_fft_mm_bridge_write		       ,
	pm_stat_fft_mm_bridge_writedata	       ,
	pm_stat_fft_mm_bridge_byteenable	   ,
	pm_stat_fft_mm_bridge_readdata	       ,
	pm_stat_fft_mm_bridge_readdatavalid	,
	pm_stat_fft_mm_bridge_waitrequest	   ,
	
	pwr_mtr_fft_hist_done_intr,
	
	
	cp_len 							,
	fft_size						,
	fft_gain 						,
	fft_shift 						,
	fft_rc_enable           ,
	fft_rc_bw_sel           ,
	dc_sc_en 						,
	hcs_bypass								
);


//Parameters Declaration
parameter NUM_OF_ANT      =    4   ;
parameter NUM_OF_FFT      =    2   ;
parameter IQ_DATAWIDTH    =    32  ;

//Local parameter
localparam NUM_OF_SYM     =    14  ;

input clk_dsp       ;
input rst_dsp_n     ;

input clk_csr       ;
input rst_csr_n     ;

input rst_soft_n    ;


input                                   avst_sink_valid       		;
input [IQ_DATAWIDTH -1 :0]   			avst_sink_data        		;
input  [7:0]                            avst_sink_channel     		;

output                                  avst_source_valid        	;
output [IQ_DATAWIDTH -1 :0]  			avst_source_data         	;
output [7:0]                            avst_source_channel      	;
input                                   avst_source_ready        	;
output                                  avst_source_endofpacket  	;
output                                  avst_source_startofpacket	;
	
input wire [13:0]                       ul_frame_status          	;
output wire [13:0]                      time_ref_out          		;

input  wire [31:0]                      fft_busIn_writedata       	;
input  wire [13:0 ]                      fft_busIn_address         	;
input  wire                             fft_busIn_write           	;
input  wire                             fft_busIn_read            	;
output wire                             fft_busOut_readdatavalid  	;
output wire [31:0]                      fft_busOut_readdata       	;
output wire                             fft_busOut_waitrequest    	;

input  			[5:0]   	        pm_fft_threash_mm_bridge_address		;
input  			         	        pm_fft_threash_mm_bridge_chipselect	;
input  			         	        pm_fft_threash_mm_bridge_read			;
input  			         	        pm_fft_threash_mm_bridge_write			;	
input  			[31:0] 	            pm_fft_threash_mm_bridge_writedata		;
input  			[3:0]    	        pm_fft_threash_mm_bridge_byteenable	;
output 			[31:0] 	            pm_fft_threash_mm_bridge_readdata		;
output 			         	        pm_fft_threash_mm_bridge_waitrequest	;

input  			[11:0]  			pm_fft_hist_mm_bridge_address			;
input  			         			pm_fft_hist_mm_bridge_chipselect		;
input  			         			pm_fft_hist_mm_bridge_read				;
input  			         			pm_fft_hist_mm_bridge_write			;	
input  			[31:0] 				pm_fft_hist_mm_bridge_writedata		;
input  			[3:0]    			pm_fft_hist_mm_bridge_byteenable		;
output 			[31:0] 				pm_fft_hist_mm_bridge_readdata			;
output								pm_fft_hist_mm_bridge_readdatavalid			;
output 			         			pm_fft_hist_mm_bridge_waitrequest		;

input 	wire 	[31:0] 				pwr_mtr_config_csr_writedata			;	
input 	wire 						pwr_mtr_config_csr_read				    ;
input 	wire	 					pwr_mtr_config_csr_write				;
output 	    	[31:0] 				pwr_mtr_config_csr_readdata				;
output 	    						pwr_mtr_config_csr_readdatavalid		;	
input	wire 	[3:0] 				pwr_mtr_config_csr_address			    ;

input  			[9:0]  			    pm_stat_fft_mm_bridge_address			;
input  			         			pm_stat_fft_mm_bridge_chipselect		;
input  			         			pm_stat_fft_mm_bridge_read				;
input  			         			pm_stat_fft_mm_bridge_write			    ;	
input  			[31:0] 				pm_stat_fft_mm_bridge_writedata		    ;
input  			[3:0]    			pm_stat_fft_mm_bridge_byteenable		;
output 			[31:0] 				pm_stat_fft_mm_bridge_readdata			;
output 							pm_stat_fft_mm_bridge_readdatavalid			;
output 			         			pm_stat_fft_mm_bridge_waitrequest		;

output wire							pwr_mtr_fft_hist_done_intr;

input wire [6:0]						bw_config					;

input wire [10:0] 						cp_len 						;
input wire [3:0] 						fft_size					;			
input wire [31:0] 						fft_gain 					;		
input wire [3:0] 						fft_shift 					;				
input wire 		 						dc_sc_en 					;				
input wire 					hcs_bypass					;

input       fft_rc_enable  ;
input [3:0] fft_rc_bw_sel  ;

// Internal Wires and Variables
wire 	[3:0]							sizeout_s 				 	;
reg 	[3:0]							sizeout_s_1d			 	;
reg 	[3:0]							sizeout_s_2d			 	;

wire                                    avst_sink_ready             ;

wire                                    avst_source_valid           ;
wire [IQ_DATAWIDTH -1 :0]    			avst_source_data            ;
wire [7:0]                              avst_source_channel         ;
wire                                    avst_source_endofpacket     ;
wire                                    avst_source_startofpacket   ;


wire [IQ_DATAWIDTH -1 :0] 				csr_readdata 				;
wire [NUM_OF_FFT-1:0] 					hsc_bypass1					;   

reg                                     avst_sink_valid_1d       	;
reg                                     avst_sink_valid_2d       	;
reg                                     avst_sink_valid_3d     		;
reg                                     avst_sink_valid_4d     		;
reg                                     avst_sink_valid_5d     		;

reg  [IQ_DATAWIDTH -1 :0]    			avst_sink_data_1d           ;
reg  [IQ_DATAWIDTH -1 :0]    			avst_sink_data_2d           ;
reg  [IQ_DATAWIDTH -1 :0]    			avst_sink_data_3d           ;
reg  [IQ_DATAWIDTH -1 :0]    			avst_sink_data_4d           ;
reg  [IQ_DATAWIDTH -1 :0]    			avst_sink_data_5d           ;

reg   [6:0] 							bw_config_1d				;
reg   [6:0] 							bw_config_2d				;

reg  [7:0]                              avst_sink_channel_1d        ;
reg  [7:0]                              avst_sink_channel_2d        ;

reg                                     avst_sink_endofpacket_1d    ;
reg                                     avst_sink_endofpacket_2d    ;

reg                                     avst_sink_startofpacket_1d  ;
reg                                     avst_sink_startofpacket_2d  ;

reg                                     avst_source_startofpacket_1d;
reg                                     avst_source_startofpacket_2d;
reg                                     avst_source_startofpacket_3d;
	
reg                                     avst_source_endofpacket_1d  ;
reg                                     avst_source_endofpacket_2d  ;
reg                                     avst_source_endofpacket_3d  ;

reg                             		xran_demapper_cplane_vout_ul_1d       ;  
reg                             		xran_demapper_cplane_vout_ul_2d       ;          
reg                             		xran_demapper_cplane_vout_ul_3d       ; 
reg                             		xran_demapper_cplane_vout_ul_4d       ; 
reg                             		xran_demapper_cplane_vout_ul_5d       ; 

reg   [23:0]               				xran_demapper_cplane_dout_ul_1d       ;
reg   [23:0]               				xran_demapper_cplane_dout_ul_2d       ;             
reg   [23:0]               				xran_demapper_cplane_dout_fo_ul_1d    ;
reg   [23:0]               				xran_demapper_cplane_dout_fo_ul_2d    ;

reg   [IQ_DATAWIDTH -1 :0]				fft_sink_data     					  ;

wire  [IQ_DATAWIDTH -1 :0]				fft_source_data    					  ;
reg   [IQ_DATAWIDTH -1 :0]				fft_source_data_1d 					  ;
reg   [IQ_DATAWIDTH -1 :0]				fft_source_data_2d 					  ;
wire									fft_source_valid           			  ;    
reg 									fft_source_valid_1d        			  ;    
reg 									fft_source_valid_2d        			  ;    
reg 									fft_source_valid_3d        			  ;    

reg   [logb2(NUM_OF_ANT)-1:0]			avst_sink_antenna           ;  
wire                         			avst_sink_antenna_last      ;  
reg                          			avst_sink_antenna_last_1d   ;  
reg   [logb2(NUM_OF_SYM)-1:0]			avst_sink_symbol            ;  
reg   [logb2(NUM_OF_SYM)-1:0]			avst_sink_symbol_1d         ;  
reg   [logb2(NUM_OF_SYM)-1:0]			avst_sink_symbol_2d_dup1    ;  
reg   [logb2(NUM_OF_SYM)-1:0]			avst_sink_symbol_2d_dup2    ;  

reg   [logb2(NUM_OF_ANT)-1:0]           avst_source_antenna			;  

wire 					                rst_dsp                     ;

wire  [47:0]                            cplane_info                 ;
wire                                    c_ram_wren_ul            	;
wire                                    c_ram_rden_ul            	;
reg                                     c_ram_rden_ul_1d            ;
reg                                     c_ram_rden_ul_2d            ;
reg                                     c_ram_rden_ul_3d            ;
reg                                     c_ram_rden_ul_4d            ;
wire   [47:0]                           c_ram_writedata_ul			;
wire   [47:0]                           c_ram_readdata_ul 			;
reg    [47:0]                           c_ram_readdata_ul_1d		;
reg    [47:0]                           c_ram_readdata_ul_2d		;
reg    [5:0]                            c_ram_wraddress_ul			;
reg    [5:0]                            c_ram_rdaddress_ul			;
wire   [3:0]                            datasize					;

reg   [11:0]                            nsc							;
reg   [11:0] 							nsc_1d            			;
reg   [11:0] 							nsc_2d						;
reg   [11:0]							nsc_2d_dup1					;
reg   [11:0]							nsc_2d_dup2					;
reg   [11:0]							nsc_3d						;

//reg   [3:0] 							fft_size	        		;
reg   [3:0] 							fft_size_1d	    			;
reg   [3:0] 							fft_size_2d	    			;
reg   [3:0] 							fft_size_2d_dup1			;
reg   [3:0] 							fft_size_2d_dup2			;

reg   [15:0] 							fft_cplength     			;
reg   [15:0] 							fft_cplength_1d				;
reg   [15:0] 							fft_cplength_2d_dup1		;
reg   [15:0] 							fft_cplength_2d_dup2		;

reg										hcs_bypass_1d				;
reg										hcs_bypass_1d_dup1			;
reg										hcs_bypass_1d_dup2			;
reg										hcs_bypass_2d				;

reg	  [31:0]							fft_gain_1d					;
reg	  [31:0]							fft_gain_2d    				;
reg	  [31:0]							fft_gain_2d_dup1    		;
reg	  [31:0]							fft_gain_2d_dup2    		;
reg	  [31:0]							fft_gain_3d     			;

reg	  [3:0]								fft_shift_1d				;
reg	  [3:0]								fft_shift_2d    			;
reg	  [3:0]								fft_shift_2d_dup1   		;
reg	  [3:0]								fft_shift_2d_dup2   		;
reg	  [3:0]								fft_shift_3d     			;


wire [13:0]                             ul_time_ref                 ;

wire [63:0] 							rx_time_out_sig				;//

reg [13:0]                              ul_time_ref_1d              ;
reg [13:0]                              ul_time_ref_2d              ;

reg 									dc_sc_en_1d							;
reg 									dc_sc_en_2d							;

	wire [63:0] sym_metadata_in_s			;//input 	
    wire [0:0] 	sym_metadata_in_valid_s  	;//input 	
    wire [0:0] 	rx_valid_s              	;//output 	
    wire [7:0] 	rx_chout_s              	;//output 	
    wire [15:0] rx_dout_im	           		;//output 	
    wire [15:0] rx_dout_re             		;//output 	
    wire [63:0] rx_time_out_s          		;//output 	
    wire [63:0] td_time_out_s          		;//output 	
    wire [0:0]  td_data_v_s            		;//output 	
    wire [7:0]  td_data_c_s            		;//output 	
    wire [15:0] td_data_q_im           		;//output 	
    wire [15:0] td_data_q_re           		;//output 	
    wire [1:0] 	eAxCout_s              		;//output 	
    wire [63:0] symmetadataout_s       		;//output 	
    wire [0:0] 	eop_eAxC_s             		;//output 	
    wire [0:0] 	eop_sym_s              		;//output 	
    wire [0:0] 	sop_eAxC_s             		;//output 	
    wire [0:0] 	sop_sym_s              		;//output 	
    wire [31:0] version_out_s          		;//output 

assign avst_sink_ready  = 1'b1  ;

assign cplane_info     = {xran_demapper_cplane_dout_fo_ul_2d,xran_demapper_cplane_dout_ul_2d};

// Pipe Line Registers
always @ (posedge clk_dsp)
begin : PIPE_DELAY
    if(~rst_dsp_n) 
    begin
        avst_sink_antenna_last_1d           	<= 1'b0                             ;
        avst_sink_symbol_1d                 	<= {logb2(NUM_OF_SYM){1'b0}}        ;
        avst_sink_symbol_2d_dup1            	<= {logb2(NUM_OF_SYM){1'b0}}        ;
		avst_sink_symbol_2d_dup2            	<= {logb2(NUM_OF_SYM){1'b0}}        ;
		xran_demapper_cplane_vout_ul_1d			<= 1'b0                             ;
	    xran_demapper_cplane_vout_ul_2d			<= 1'b0                             ;
		xran_demapper_cplane_vout_ul_3d			<= 1'b0                             ;
		xran_demapper_cplane_vout_ul_4d			<= 1'b0                             ;
		xran_demapper_cplane_vout_ul_5d			<= 1'b0                             ;
	    xran_demapper_cplane_dout_ul_1d			<= 24'b0                            ;
	    xran_demapper_cplane_dout_ul_2d			<= 24'b0                            ;
	    xran_demapper_cplane_dout_fo_ul_1d		<= 24'b0                            ; 
        xran_demapper_cplane_dout_fo_ul_2d		<= 24'b0                            ;
        c_ram_rden_ul_1d                        <=  1'b0                            ; 
        c_ram_rden_ul_2d                        <=  1'b0                            ; 
        c_ram_rden_ul_3d                        <=  1'b0                            ;
        c_ram_rden_ul_4d                        <=  1'b0                            ; 
        c_ram_readdata_ul_1d                    <=  47'b0                           ;
        c_ram_readdata_ul_2d                    <=  47'b0                           ;	
		avst_sink_valid_1d						<=	'd0								;
		avst_sink_valid_2d						<=	'd0								;
		bw_config_1d							<= 1'b0								;
		bw_config_2d							<= 1'b0								;
		
   end 
    else 
    begin
  
        avst_source_startofpacket_1d       		<= avst_source_startofpacket        	;
        avst_source_startofpacket_2d       		<= avst_source_startofpacket_1d     	;
        avst_source_startofpacket_3d       		<= avst_source_startofpacket_2d     	;
        avst_source_endofpacket_1d         		<= avst_source_endofpacket          	;
        avst_source_endofpacket_2d         		<= avst_source_endofpacket_1d       	;
        avst_source_endofpacket_3d         		<= avst_source_endofpacket_2d       	;
        avst_sink_antenna_last_1d          		<= avst_sink_antenna_last           	;
        avst_sink_symbol_1d                		<= avst_sink_symbol                 	;
        avst_sink_symbol_2d_dup1           		<= avst_sink_symbol_1d              	;
		avst_sink_symbol_2d_dup2           		<= avst_sink_symbol_1d              	;
		c_ram_rden_ul_1d                   		<= c_ram_rden_ul                        ; 
        c_ram_rden_ul_2d                   		<= c_ram_rden_ul_1d                     ; 
        c_ram_rden_ul_3d                   		<= c_ram_rden_ul_2d                     ;
        c_ram_rden_ul_4d                   		<= c_ram_rden_ul_3d                     ; 
        c_ram_readdata_ul_1d               		<= c_ram_readdata_ul                    ;
        c_ram_readdata_ul_2d               		<= c_ram_readdata_ul_1d                 ;
		avst_sink_valid_1d						<= avst_sink_valid						;
		avst_sink_valid_2d						<= avst_sink_valid_1d					;
		bw_config_1d							<= bw_config							;
		bw_config_2d							<= bw_config_1d							;
    end
end

// Subcarrier Configurable for Variable Bandwidth
always @ (posedge clk_dsp)
begin : NSC		
	if (rst_dsp_n == 1'b0)
		nsc      <= 'd0;
	else 
		begin
			case(bw_config_2d[6:0])
			'hA   	:   nsc  <= 'd1944 	;
			'hE   	:   nsc  <= 'd3276 	;
			default : 	nsc  <= 'd3276	;
			endcase
		end		
end


always @ (posedge clk_dsp)
begin : SINK_ANTENNA_COUNT
    if (rst_dsp_n == 1'b0)
        avst_sink_antenna   <=  {logb2(NUM_OF_ANT){1'b0}}   ; 
    else if (avst_sink_antenna_last)
        avst_sink_antenna   <=  {logb2(NUM_OF_ANT){1'b0}}   ; 
    else if (avst_sink_valid_2d & avst_sink_endofpacket_2d)
        avst_sink_antenna   <=  avst_sink_antenna + 1'b1;
end

assign avst_sink_antenna_last  =  avst_sink_valid_2d & avst_sink_endofpacket_2d 
                                    & (avst_sink_antenna == (NUM_OF_ANT-1)) ;

                                    
always @ (posedge clk_dsp)
begin : SINK_ANTENNA_SYMBOL
    if (rst_dsp_n == 1'b0)
        avst_sink_symbol    <=  {logb2(NUM_OF_SYM){1'b0}}   ; 
    else if (avst_sink_antenna_last_1d & (avst_sink_symbol == (NUM_OF_SYM-1)))
        avst_sink_symbol    <=  {logb2(NUM_OF_ANT){1'b0}}   ; 
    else if (avst_sink_antenna_last_1d)
        avst_sink_symbol    <=  avst_sink_symbol + 1'b1;
end


//Generate Statement

    //assign rst_dsp  [fft_num] = ~rst_dsp_n ;
	always @ (posedge clk_dsp)
	begin 
		if(~rst_dsp_n) 
		begin
			fft_gain_1d	     				    <= 'd0;
			fft_gain_2d	     				    <= 'd0;
			fft_gain_2d_dup1                    <= 'd0;
			fft_gain_2d_dup2                    <= 'd0;
			fft_gain_3d	     				    <= 'd0;
			
			fft_shift_1d	     				<= 'd0;
			fft_shift_2d	     				<= 'd0;
			fft_shift_2d_dup1                   <= 'd0;
			fft_shift_2d_dup2                   <= 'd0;
			fft_shift_3d	     				<= 'd0;		
			
			hcs_bypass_1d	   				    <= 'd0;
			hcs_bypass_1d_dup1                  <= 'd0;
			hcs_bypass_1d_dup2					<= 'd0;
			hcs_bypass_2d	   				    <= 'd0;
			
			nsc_1d                              <= 12'b0 ;
			nsc_2d_dup1                         <= 12'b0 ;
			nsc_2d_dup2                         <= 12'b0 ;
			nsc_3d                              <= 12'b0 ;
			
			fft_size_1d                         <= 4'b0  ;
			fft_size_2d_dup1                    <= 4'b0  ;
			fft_size_2d_dup2                    <= 4'b0  ;
			
			fft_cplength_1d                     <= 16'b0 ;
			fft_cplength_2d_dup1                <= 16'b0 ;
			fft_cplength_2d_dup2                <= 16'b0 ;
			
			dc_sc_en_1d							<=  'd0	;
			dc_sc_en_2d							<= 	'd0	;
		end
		else
		begin
			fft_gain_1d							<= fft_gain 		;
			fft_gain_2d							<= fft_gain_1d 		;
			fft_gain_2d_dup1                    <= fft_gain_1d 		;
			fft_gain_2d_dup2                    <= fft_gain_1d 		;
			fft_gain_3d							<= fft_gain_2d 		;

			fft_shift_1d						<= fft_shift		;
			fft_shift_2d						<= fft_shift_1d 	;
			fft_shift_2d_dup1                 	<= fft_shift_2d 	;
			fft_shift_2d_dup2                 	<= fft_shift_2d 	;
			fft_shift_3d						<= fft_shift_2d 	;

			hcs_bypass_1d						<= hcs_bypass 		;
			hcs_bypass_1d_dup1                  <= hcs_bypass_1d	;
            hcs_bypass_1d_dup2			        <= hcs_bypass_1d	;
			hcs_bypass_2d						<= hcs_bypass_1d	;

			nsc_1d                              <= nsc          	;
			nsc_2d_dup1                         <= nsc_1d       	;
			nsc_2d_dup2                         <= nsc_1d       	;
			nsc_3d                              <= nsc_2d       	;	

			fft_size_1d                         <= fft_size     	;
			fft_size_2d							<= fft_size_1d		;
			fft_size_2d_dup1                    <= fft_size_1d  	;
			fft_size_2d_dup2                    <= fft_size_1d  	;

			fft_cplength_1d                     <= cp_len			;
			fft_cplength_2d_dup1                <= fft_cplength_1d 	;
			fft_cplength_2d_dup2                <= fft_cplength_1d 	;
			dc_sc_en_1d							<= dc_sc_en			;
			dc_sc_en_2d							<= dc_sc_en_1d		;
		
		end
	end
	
	
	
streamtoblock_fft_DUT u_streamtoblock_fft_DUT(
    .busIn_writedata        (fft_busIn_writedata 	  [31:0]	),
    .busIn_address          (fft_busIn_address  	  		 	),
    .busIn_write            (fft_busIn_write 			      	),
    .busIn_read             (fft_busIn_read  			      	),
    .busOut_readdatavalid   (fft_busOut_readdatavalid	      	),
    .busOut_readdata        (fft_busOut_readdata 	  [31:0]	),
    .busOut_waitrequest     (fft_busOut_waitrequest 	      	),
	
    .rx_vin_s               (avst_sink_valid               		),
    .rx_chin_s              (avst_sink_channel             		),
    .rx_din_im              (avst_sink_data        [31:16] 		),
    .rx_din_re              (avst_sink_data        [15:0]  		),
	
    .fft_in_s               (fft_size_2d_dup1		        	),
    .cp_in_s                (fft_cplength_2d_dup1             	),
    .nprb_s                 ({4'b0,nsc_2d_dup1}               	),
	.time_ref_in_s          ({18'b0,ul_frame_status}			),//	    input wire [31:0] time_ref_in_s,
	
	.hcs_bypass_s			(hcs_bypass_1d_dup2					),
    .fft_gain_s          	(fft_gain_2d_dup2 [15:0] 			),
	.fft_gain_im_s       	(fft_gain_2d_dup2 [31:16]			),
    .fft_shift_s         	(fft_shift_2d_dup2					),
		
    .DC_SC_EN_s				(dc_sc_en_2d						),
	.CP_EN_s				(1'b1								), // By default, This port value will be high. Phase Comp can be disabled/enabled using Reg_Addr 0x0003 (DSPBA BuS)
	
	.ripple_comp_en_s		(fft_rc_enable								),//    input wire [0:0] ripple_comp_en_s,
	.rc_bw_sel_s 			(fft_rc_bw_sel[0]							),//    input wire [0:0] rc_bw_sel_s	
	
	.rx_valid_s             (fft_source_valid                   ),
    .rx_chout_s 			(),
    .rx_dout_im             (fft_source_data [31:16]			),  
    .rx_dout_re             (fft_source_data [15:0] 			),  
	.rx_time_out_s          (rx_time_out_sig					),// ul_time_ref[11:0]	//   output wire [63:0] rx_time_out_s,

    .fft_vout_s				(td_data_v_s),	//output wire [0:0] fft_vout_s,
    .fft_chout_s			(td_data_c_s),	//output wire [7:0] fft_chout_s,
    .fft_dout_im			(td_data_q_im),	//output wire [15:0] fft_dout_im,
    .fft_dout_re			(td_data_q_re),	//output wire [15:0] fft_dout_re,
    .nsc_out_s				(),	//output wire [15:0] nsc_out_s,
    .size_out_s				(),	//output wire [3:0] size_out_s,
    //.time_out_s				(),	//output wire [31:0] time_out_s,
	
	
	.sym_metadata_in_s		(sym_metadata_in_s					),//input  [63:0]
	.sym_metadata_in_valid_s(sym_metadata_in_valid_s 			),//input  [0:0] 
	.td_time_out_s          (td_time_out_s          			),//output [63:0]
	.fd_data_v_s            (            			),//output [0:0] 
	.fd_data_c_s            (            			),//output [7:0] 
	.fd_data_q_im           (           			),//output [15:0]
	.fd_data_q_re           (           			),//output [15:0]
	.eAxCout_s              (eAxCout_s              			),//output [1:0] 
	.symmetadataout_s       (symmetadataout_s       			),//output [63:0]
	.eop_eAxC_s             (eop_eAxC_s             			),//output [0:0] 
	.eop_sym_s              (eop_sym_s              			),//output [0:0] 
	.sop_eAxC_s             (sop_eAxC_s             			),//output [0:0] 
	.sop_sym_s              (sop_sym_s              			),//output [0:0] 
	.version_out1_s          (version_out_s          			),//output [31:0]
	
    .clk    	            (clk_dsp                			),
    .areset                 (~rst_dsp_n         	    		),
    .bus_clk				(clk_csr							),
	.bus_areset             (~rst_csr_n             			)
    );
	
  
power_meter_top_ss #(.DATA_WIDTH(32),.RAM_WIDTH(16),.ADDR_WIDTH(6),.ADDR_WIDTH1(12),.ADDR_WIDTH2(10)) u_power_meter_top_ss_ul
(

            .clk_dsp								(clk_dsp),
			.rst_dsp_n								(rst_dsp_n	),
			.clk_csr                  				(clk_csr), 
			.rst_csr_n                				(rst_csr_n), 
			.rst_soft_n               				(rst_soft_n),
			
			.ai										(td_data_q_re),// sfix16_En14
			.aq										(td_data_q_im),// sfix16_En14
			.valid_i								(td_data_v_s),
			.channel_i								(td_data_c_s),
			.hist_done_intr						(pwr_mtr_fft_hist_done_intr),
			
			// Traffic MM Slave	
 		  	.pm_threash_mm_bridge_address		(pm_fft_threash_mm_bridge_address		),
 			.pm_threash_mm_bridge_chipselect	(pm_fft_threash_mm_bridge_chipselect	),
 			.pm_threash_mm_bridge_read			(pm_fft_threash_mm_bridge_read			),
 			.pm_threash_mm_bridge_write		    (pm_fft_threash_mm_bridge_write		),	
 			.pm_threash_mm_bridge_writedata	    (pm_fft_threash_mm_bridge_writedata	),
 			.pm_threash_mm_bridge_byteenable	(pm_fft_threash_mm_bridge_byteenable	),
 			.pm_threash_mm_bridge_readdata		(pm_fft_threash_mm_bridge_readdata		),
 			.pm_threash_mm_bridge_waitrequest	(pm_fft_threash_mm_bridge_waitrequest	),
			
			// Traffic MM Slave	
			.pm_hist_mm_bridge_address			(pm_fft_hist_mm_bridge_address		),
			.pm_hist_mm_bridge_chipselect		(pm_fft_hist_mm_bridge_chipselect	),
			.pm_hist_mm_bridge_read			    (pm_fft_hist_mm_bridge_read		),
			.pm_hist_mm_bridge_write			(pm_fft_hist_mm_bridge_write		),	
			.pm_hist_mm_bridge_writedata		(pm_fft_hist_mm_bridge_writedata	),
			.pm_hist_mm_bridge_byteenable		(pm_fft_hist_mm_bridge_byteenable	),
			.pm_hist_mm_bridge_readdata		    (pm_fft_hist_mm_bridge_readdata	),
			.pm_hist_mm_bridge_readdatavalid	(pm_fft_hist_mm_bridge_readdatavalid	),
			.pm_hist_mm_bridge_waitrequest	    (pm_fft_hist_mm_bridge_waitrequest),

            .pwr_mtr_config_csr_writedata			(pwr_mtr_config_csr_writedata	),	
			.pwr_mtr_config_csr_read				(pwr_mtr_config_csr_read		),
			.pwr_mtr_config_csr_write				(pwr_mtr_config_csr_write		),
			.pwr_mtr_config_csr_readdata			(pwr_mtr_config_csr_readdata	),
			.pwr_mtr_config_csr_readdatavalid		(pwr_mtr_config_csr_readdatavalid),	
			.pwr_mtr_config_csr_address	            (pwr_mtr_config_csr_address	     ),
            
			.pm_stat_mm_bridge_address			(pm_stat_fft_mm_bridge_address		),
			.pm_stat_mm_bridge_chipselect		(pm_stat_fft_mm_bridge_chipselect	),
			.pm_stat_mm_bridge_read				(pm_stat_fft_mm_bridge_read			),
			.pm_stat_mm_bridge_write			(pm_stat_fft_mm_bridge_write		),	
			.pm_stat_mm_bridge_writedata		(pm_stat_fft_mm_bridge_writedata	),
			.pm_stat_mm_bridge_byteenable		(pm_stat_fft_mm_bridge_byteenable	),
			.pm_stat_mm_bridge_readdata			(pm_stat_fft_mm_bridge_readdata		),
			.pm_stat_mm_bridge_readdatavalid	(pm_stat_fft_mm_bridge_readdatavalid	),
			.pm_stat_mm_bridge_waitrequest		(pm_stat_fft_mm_bridge_waitrequest	)
             			

  );
 
	
	
	
	
	
	
	
	
	
	
	
	
assign ul_time_ref = rx_time_out_sig[13:0];

	
always @ (posedge clk_dsp)
begin 
    if(~rst_dsp_n) 
    begin
        fft_source_valid_1d      <=  1'b0                    ;
        fft_source_valid_2d      <=  1'b0                    ;
        fft_source_valid_3d      <=  1'b0                    ;
        fft_source_data_1d       <=  {IQ_DATAWIDTH{1'b0}}    ;
        fft_source_data_2d       <=  {IQ_DATAWIDTH{1'b0}}    ;
		ul_time_ref_1d			 <=	13'b0                    ;
		ul_time_ref_2d			 <=	13'b0                    ;			
		sizeout_s_1d			 <=	4'b0                     ;
		sizeout_s_2d			 <= 4'b0                     ;
    end 
    else 
    begin
        fft_source_valid_1d      <=  fft_source_valid      ;
        fft_source_valid_2d      <=  fft_source_valid_1d   ;
        fft_source_valid_3d      <=  fft_source_valid_2d   ;
        fft_source_data_1d       <=  fft_source_data       ;
        fft_source_data_2d       <=  fft_source_data_1d    ;
		ul_time_ref_1d			 <=  ul_time_ref  ;
		ul_time_ref_2d			 <=  ul_time_ref_1d        ;
		sizeout_s_1d			 <=	 sizeout_s             ;	
		sizeout_s_2d			 <=	 sizeout_s_1d          ;		
    end
end
        
always @ (posedge clk_dsp)
begin : SOURCE_ANTENNA_COUNT
    if (rst_dsp_n == 1'b0)
        avst_source_antenna <=  {logb2(NUM_OF_ANT){1'b0}}   ; 
    else if (fft_source_valid_2d & (~fft_source_valid_1d) & (avst_source_antenna == (NUM_OF_ANT-1)))
        avst_source_antenna <=  {logb2(NUM_OF_ANT){1'b0}}   ; 
    else if (fft_source_valid_2d & (~fft_source_valid_1d))
        avst_source_antenna <=  avst_source_antenna + 1'b1;
end


// Streaming Output
assign avst_source_data				= fft_source_data_2d  ;
assign avst_source_valid            = fft_source_valid_2d ;
assign avst_source_channel          = avst_source_antenna        ;
assign avst_source_endofpacket      = fft_source_valid_2d & (~fft_source_valid_1d)   ;
assign avst_source_startofpacket    = fft_source_valid_2d & (~fft_source_valid_3d)   ;
assign time_ref_out                 = ul_time_ref_2d ;
assign sizeout 						= sizeout_s_2d[0];


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
