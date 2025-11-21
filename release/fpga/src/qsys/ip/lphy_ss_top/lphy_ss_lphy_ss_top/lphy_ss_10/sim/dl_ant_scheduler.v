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
 
module dl_ant_scheduler
(
   clk_dsp                                  ,
   rst_dsp_n                                ,
   
   //hyperframe pulse from ttd_sync
   hfn_pulse                                ,

   // Stream Input                  
   avst_sink_valid_1                          ,
   avst_sink_data_1                           ,
   avst_sink_ready_1                          ,
   
   // Stream Input                  
   avst_sink_valid_2                         ,
   avst_sink_data_2                          ,
   avst_sink_ready_2                         ,

   // C Plane
   c_plane_info_valid                       ,
   c_cplength                               ,
   c_fftsize                                ,
   
   c_valid                                  ,
   fftsize                                  ,
   cplength                                 ,
   
   bw_config_cc1							,
   bw_config_cc2							,
   

   // Stream Output   
   avst_source_valid_1                        ,
   avst_source_data_1                         ,
   avst_source_channel_1                      ,
   avst_source_ready_1                        ,
   avst_source_endofpacket_1                  ,
   avst_source_startofpacket_1                ,
   
    // Stream Output   
   avst_source_valid_2                       ,
   avst_source_data_2                        ,
   avst_source_channel_2                     ,
   avst_source_ready_2                       ,
   avst_source_endofpacket_2                 ,
   avst_source_startofpacket_2                  
);

`include "../common/def_param.vh"

//Parameters Declaration
parameter NUM_OF_ANT            =    8      ;
parameter NUM_OF_FFT            =    3      ;
//parameter NUM_OF_SUBCARRIER     =    300   ;
parameter IQ_DATAWIDTH          =    32     ;
parameter SINK_READY_LATENCY    =    14     ;

//localparam INTERLEAVE_WAIT_CYCLE =    1156 ; //1200

input									clk_dsp       			   ;
input									rst_dsp_n     			   ;

input									hfn_pulse     			   ;

 // C Plane
input                                   c_plane_info_valid         ;
input  [15:0]                           c_cplength                 ;
input  [3:0]                            c_fftsize                  ;

input [7:0] 							bw_config_cc1			   ;           
input [7:0] 							bw_config_cc2			   ;           

output                                  c_valid                     ;
output  [15:0]                          cplength                    ;
output  [3:0]                           fftsize                     ;


input                                     avst_sink_valid_1             ;
input [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_1              ; // 32 bit input data
output                                    avst_sink_ready_1             ;

input                                     avst_sink_valid_2            ;
input [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_2             ; // 32 bit input data
output                                    avst_sink_ready_2            ;


output reg                                   	avst_source_valid_1           ;
output reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_source_data_1            ;
output reg  [7:0]                            	avst_source_channel_1         ;
input                                    		avst_source_ready_1           ;
output reg                                   	avst_source_endofpacket_1     ;
output reg                                  	avst_source_startofpacket_1   ;

output reg                                    	avst_source_valid_2          ;
output reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_source_data_2           ;
output reg  [7:0]                               avst_source_channel_2        ;
input                                    		avst_source_ready_2          ;
output reg                                   	avst_source_endofpacket_2    ;
output reg                                   	avst_source_startofpacket_2  ;


// Internal Wires and Variables
wire                                  c_valid                 	;
wire  [15:0]                          cplength                	;
wire  [3:0]                           fftsize                 	;
	                                                            
wire                                  c_plane_info_valid      	;
wire  [15:0]                          c_cplength              	;
wire  [3:0]                           c_fftsize               	;

reg                                   c_plane_info_valid_1d   	;
reg  [15:0]                           c_cplength_1d           	;
reg  [3:0]                            c_fftsize_1d            	;

reg                                   c_plane_info_valid_2d   	;
reg                                   c_plane_info_valid_3d   	;
reg                                   c_plane_info_valid_4d   	;
reg                                   c_plane_info_valid_5d   	;
reg                                   c_plane_info_valid_6d   	;
reg                                   c_plane_info_valid_7d   	;
reg                                   c_plane_info_valid_8d   	;
reg                                   c_plane_info_valid_9d   	;
reg                                   c_plane_info_valid_10d  	;
reg                                   c_plane_info_valid_11d  	;
reg                                   c_plane_info_valid_12d  	;
reg                                   c_plane_info_valid_13d  	;
reg                                   c_plane_info_valid_14d  	;
	                                                           
reg  [15:0]                           c_cplength_2d           	;
reg  [15:0]                           c_cplength_3d           	;
reg  [15:0]                           c_cplength_4d           	;
reg  [15:0]                           c_cplength_5d           	;
reg  [15:0]                           c_cplength_6d           	;
reg  [15:0]                           c_cplength_7d           	;
reg  [15:0]                           c_cplength_8d           	;
reg  [15:0]                           c_cplength_9d           	;
reg  [15:0]                           c_cplength_10d          	;
reg  [15:0]                           c_cplength_11d          	;
reg  [15:0]                           c_cplength_12d          	;
reg  [15:0]                           c_cplength_13d          	;
reg  [15:0]                           c_cplength_14d          	;

reg  [3:0]                            c_fftsize_2d              ;
reg  [3:0]                            c_fftsize_3d              ;
reg  [3:0]                            c_fftsize_4d              ;
reg  [3:0]                            c_fftsize_5d              ;
reg  [3:0]                            c_fftsize_6d              ;
reg  [3:0]                            c_fftsize_7d              ;
reg  [3:0]                            c_fftsize_8d              ;
reg  [3:0]                            c_fftsize_9d              ;
reg  [3:0]                            c_fftsize_10d             ;
reg  [3:0]                            c_fftsize_11d             ;
reg  [3:0]                            c_fftsize_12d             ;
reg  [3:0]                            c_fftsize_13d             ;
reg  [3:0]                            c_fftsize_14d             ;

reg  [12:0]                           NUM_OF_SUBCARRIER_1         ;
reg  [4:0]                            sym_count_1                 ;
reg  [2:0]                            wait_done_count_1           ;
reg  [11:0]                           INTERLEAVE_WAIT_CYCLE_1     ;
reg                                   wait_done_pulse_1           ;

reg  [12:0]                           NUM_OF_SUBCARRIER_2        ;
reg  [4:0]                            sym_count_2                ;
reg  [2:0]                            wait_done_count_2          ;
reg  [11:0]                           INTERLEAVE_WAIT_CYCLE_2    ;
reg                                   wait_done_pulse_2          ;


reg                                   avst_sink_ready_1         ;
reg                                   avst_sink_ready_2         ;


reg                                      avst_sink_valid_1_1d        ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_1_1d         ;
reg                                      avst_sink_valid_2_1d        ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_2_1d         ;

reg                                      avst_sink_valid_1_2d          ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_1_2d           ;
reg                                      avst_sink_valid_2_2d          ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_2_2d           ;

reg                                      avst_sink_valid_1_3d          ;
reg                                      avst_sink_valid_1_4d          ;
reg                                      avst_sink_valid_1_5d          ;
reg                                      avst_sink_valid_2_3d          ;
reg                                      avst_sink_valid_2_4d          ;
reg                                      avst_sink_valid_2_5d          ;

reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_1_3d           ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_1_4d           ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_1_5d           ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_2_3d           ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_2_4d           ;
reg  [(NUM_OF_FFT*IQ_DATAWIDTH)/2 -1 :0] avst_sink_data_2_5d           ;

reg                                      hfn_pulse_1d                  ;
reg                                      hfn_pulse_2d                  ;


reg  [15:0]                             sink_valid_count_1            ;
reg  [11:0]                             subcarrier_index_1            ;
reg  [11:0]                             wait_count_1                  ;

reg  [1:0]                              axc_index_1                   ;
reg  [1:0]                              axc_index_1_1d                ;
reg  [1:0]                              axc_index_1_2d                ;
reg  [1:0]                              axc_index_1_3d                ;
reg                                     wait_enable_1                 ;
reg                                     wait_done_1                   ;
reg                                     last_axc_index_1              ;

reg  [15:0]                             sink_valid_count_2           ;
reg  [11:0]                             subcarrier_index_2           ;
reg  [11:0]                             wait_count_2                 ;
reg  [1:0]                              axc_index_2                  ;
reg  [1:0]                              axc_index_2_1d               ;
reg  [1:0]                              axc_index_2_2d               ;
reg  [1:0]                              axc_index_2_3d               ;
reg                                     wait_enable_2                ;
reg                                     wait_done_2                  ;
reg                                     last_axc_index_2             ;


wire                                    source_startofpacket_1        ;
reg                                     source_startofpacket_1_1d     ;
reg                                     source_startofpacket_1_2d     ;
reg                                     source_startofpacket_1_3d     ;

wire                                    source_startofpacket_2        ;
reg                                     source_startofpacket_2_1d     ;
reg                                     source_startofpacket_2_2d     ;
reg                                     source_startofpacket_2_3d     ;

reg                                     source_endofpacket_1          ;
reg                                     source_endofpacket_1_1d       ;
reg                                     source_endofpacket_1_2d       ;
reg                                     source_endofpacket_1_3d       ;

reg                                     source_endofpacket_2          ;
reg                                     source_endofpacket_2_1d       ;
reg                                     source_endofpacket_2_2d       ;
reg                                     source_endofpacket_2_3d       ;

reg [7:0] 								bw_config_reg_cc1_1d		;
reg [7:0] 								bw_config_reg_cc1_2d		;
reg [7:0] 								bw_config_reg_cc2_1d		;
reg [7:0] 								bw_config_reg_cc2_2d		;


// Pipe Line Registers
always @ (posedge clk_dsp)
begin : PIPE_DELAY
    if(~rst_dsp_n) 
    begin
        avst_sink_valid_1_1d                <= 1'b0                             ;
        avst_sink_valid_1_2d                <= 1'b0                             ;
        avst_sink_valid_1_3d                <= 1'b0                             ;
        avst_sink_valid_1_4d                <= 1'b0                             ;
        avst_sink_valid_1_5d                <= 1'b0                             ;
		avst_sink_valid_2_1d                <= 1'b0                             ;
        avst_sink_valid_2_2d                <= 1'b0                             ;
        avst_sink_valid_2_3d                <= 1'b0                             ;
        avst_sink_valid_2_4d                <= 1'b0                             ;
        avst_sink_valid_2_5d                <= 1'b0                             ;
        hfn_pulse_1d                        <= 1'b0                             ;
        hfn_pulse_2d                        <= 1'b0                             ;
        axc_index_1_1d                        <= 2'b0                             ;
        axc_index_1_2d                        <= 2'b0                             ;
        axc_index_1_3d                        <= 2'b0                             ;
		axc_index_2_1d                        <= 2'b0                             ;
        axc_index_2_2d                        <= 2'b0                             ;
        axc_index_2_3d                        <= 2'b0                             ;
        source_startofpacket_1_1d           <= 1'b0                             ;
        source_startofpacket_1_2d           <= 1'b0                             ;
        source_startofpacket_1_3d           <= 1'b0                             ;
        source_endofpacket_1_1d             <= 1'b0                             ;
        source_endofpacket_1_2d             <= 1'b0                             ;
        source_endofpacket_1_3d             <= 1'b0                             ;
		source_startofpacket_2_1d           <= 1'b0                             ;
        source_startofpacket_2_2d           <= 1'b0                             ;
        source_startofpacket_2_3d           <= 1'b0                             ;
        source_endofpacket_2_1d             <= 1'b0                             ;
        source_endofpacket_2_2d             <= 1'b0                             ;
        source_endofpacket_2_3d             <= 1'b0                             ;
		c_plane_info_valid_1d               <= 1'b0                             ;
		c_plane_info_valid_2d               <= 1'b0                             ;
		c_plane_info_valid_3d               <= 1'b0                             ;
		c_plane_info_valid_4d               <= 1'b0                             ;
		c_plane_info_valid_5d               <= 1'b0                             ;
		c_plane_info_valid_6d               <= 1'b0                             ;
		c_plane_info_valid_7d               <= 1'b0                             ;
		c_plane_info_valid_8d               <= 1'b0                             ;
		c_plane_info_valid_9d               <= 1'b0                             ;
		c_plane_info_valid_10d              <= 1'b0                             ;
		c_plane_info_valid_11d              <= 1'b0                             ;
		c_plane_info_valid_12d              <= 1'b0                             ;
		c_plane_info_valid_13d              <= 1'b0                             ;
		c_plane_info_valid_14d              <= 1'b0                             ;
		c_cplength_1d                       <= 16'b0                            ;
		c_cplength_2d                       <= 16'b0                            ;
		c_cplength_3d                       <= 16'b0                            ;
		c_cplength_4d                       <= 16'b0                            ;
		c_cplength_5d                       <= 16'b0                            ;
		c_cplength_6d                       <= 16'b0                            ;
		c_cplength_7d                       <= 16'b0                            ;
		c_cplength_8d                       <= 16'b0                            ;
		c_cplength_9d                       <= 16'b0                            ;
		c_cplength_10d                      <= 16'b0                            ;
		c_cplength_11d                      <= 16'b0                            ;
		c_cplength_12d                      <= 16'b0                            ;
		c_cplength_13d                      <= 16'b0                            ;
		c_cplength_14d                      <= 16'b0                            ;
		c_fftsize_1d                        <= 4'b0                            ;
		c_fftsize_2d                        <= 4'b0                            ;
		c_fftsize_3d                        <= 4'b0                            ;
		c_fftsize_4d                        <= 4'b0                            ;
		c_fftsize_5d                        <= 4'b0                            ;
		c_fftsize_6d                        <= 4'b0                            ;
		c_fftsize_7d                        <= 4'b0                            ;
		c_fftsize_8d                        <= 4'b0                            ;
		c_fftsize_9d                        <= 4'b0                            ;
		c_fftsize_10d                       <= 4'b0                            ;
		c_fftsize_11d                       <= 4'b0                            ;
		c_fftsize_12d                       <= 4'b0                            ;
		c_fftsize_13d                       <= 4'b0                            ;
		c_fftsize_14d                       <= 4'b0                            ;
		avst_sink_data_1_1d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
		avst_sink_data_1_2d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
		avst_sink_data_1_3d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
        avst_sink_data_1_4d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
        avst_sink_data_1_5d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
		avst_sink_data_2_1d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
		avst_sink_data_2_2d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
		avst_sink_data_2_3d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
        avst_sink_data_2_4d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
        avst_sink_data_2_5d                 <= {(NUM_OF_FFT*IQ_DATAWIDTH)/2{1'b0}}                ;
		bw_config_reg_cc1_1d				<= 8'd0;
		bw_config_reg_cc1_2d				<= 8'd0;
		bw_config_reg_cc2_1d				<= 8'd0;
		bw_config_reg_cc2_2d				<= 8'd0;
    end 
    else 
    begin
        avst_sink_valid_1_1d                  <= avst_sink_valid_1                  ;
        avst_sink_data_1_1d                   <= avst_sink_data_1                   ;
        avst_sink_valid_1_2d                  <= avst_sink_valid_1_1d               ;
        avst_sink_data_1_2d                   <= avst_sink_data_1_1d                ;
        avst_sink_valid_1_3d                  <= avst_sink_valid_1_2d               ;
        avst_sink_valid_1_4d                  <= avst_sink_valid_1_3d               ;
        avst_sink_valid_1_5d                  <= avst_sink_valid_1_4d               ;
        avst_sink_data_1_3d                   <= avst_sink_data_1_2d                ;
        avst_sink_data_1_4d                   <= avst_sink_data_1_3d                ;
        avst_sink_data_1_5d                   <= avst_sink_data_1_4d                ;
		
		avst_sink_valid_2_1d                  <= avst_sink_valid_2                 ;
        avst_sink_data_2_1d                   <= avst_sink_data_2                  ;
        avst_sink_valid_2_2d                  <= avst_sink_valid_2_1d               ;
        avst_sink_data_2_2d                   <= avst_sink_data_2_1d                ;
        avst_sink_valid_2_3d                  <= avst_sink_valid_2_2d               ;
        avst_sink_valid_2_4d                  <= avst_sink_valid_2_3d               ;
        avst_sink_valid_2_5d                  <= avst_sink_valid_2_4d               ;
        avst_sink_data_2_3d                   <= avst_sink_data_2_2d                ;
        avst_sink_data_2_4d                   <= avst_sink_data_2_3d                ;
        avst_sink_data_2_5d                   <= avst_sink_data_2_4d                ;
		
        hfn_pulse_1d                          <= hfn_pulse                          ;
        hfn_pulse_2d                          <= hfn_pulse_1d                       ;
        axc_index_1_1d                        <= axc_index_1                        ;
        axc_index_1_2d                        <= axc_index_1_1d                     ;
        axc_index_1_3d                        <= axc_index_1_2d                     ;
		axc_index_2_1d                        <= axc_index_2                        ;
        axc_index_2_2d                        <= axc_index_2_1d                     ;
        axc_index_2_3d                        <= axc_index_2_2d                     ;
        source_startofpacket_1_1d             <= source_startofpacket_1             ;
        source_startofpacket_1_2d             <= source_startofpacket_1_1d          ;
        source_startofpacket_1_3d             <= source_startofpacket_1_2d          ;
        source_endofpacket_1_1d               <= source_endofpacket_1               ;
        source_endofpacket_1_2d               <= source_endofpacket_1_1d            ;
        source_endofpacket_1_3d               <= source_endofpacket_1_2d            ;
		source_startofpacket_2_1d             <= source_startofpacket_2            ;
        source_startofpacket_2_2d             <= source_startofpacket_2_1d          ;
        source_startofpacket_2_3d             <= source_startofpacket_2_2d          ;
        source_endofpacket_2_1d               <= source_endofpacket_2              ;
        source_endofpacket_2_2d               <= source_endofpacket_2_1d            ;
        source_endofpacket_2_3d               <= source_endofpacket_2_2d            ;
		c_plane_info_valid_1d               <= c_plane_info_valid               ;
		c_plane_info_valid_2d               <= c_plane_info_valid_1d            ;
		c_plane_info_valid_3d               <=   c_plane_info_valid_2d            ; 
		c_plane_info_valid_4d               <=   c_plane_info_valid_3d            ;
		c_plane_info_valid_5d               <=   c_plane_info_valid_4d            ;
		c_plane_info_valid_6d               <=   c_plane_info_valid_5d            ;
		c_plane_info_valid_7d               <=   c_plane_info_valid_6d            ;
		c_plane_info_valid_8d               <=   c_plane_info_valid_7d            ;
		c_plane_info_valid_9d               <=   c_plane_info_valid_8d            ;
		c_plane_info_valid_10d              <=   c_plane_info_valid_9d            ;
		c_plane_info_valid_11d              <=   c_plane_info_valid_10d           ;
		c_plane_info_valid_12d              <=   c_plane_info_valid_11d           ;
		c_plane_info_valid_13d              <=   c_plane_info_valid_12d           ;
		c_plane_info_valid_14d              <=   c_plane_info_valid_13d           ;
		c_cplength_1d                       <= c_cplength                         ;
		c_cplength_2d                       <= c_cplength_1d                      ;
		c_cplength_3d                       <= c_cplength_2d                      ;
		c_cplength_4d                       <= c_cplength_3d                      ;
		c_cplength_5d                       <= c_cplength_4d                      ;
		c_cplength_6d                       <= c_cplength_5d                      ;
		c_cplength_7d                       <= c_cplength_6d                      ;
		c_cplength_8d                       <= c_cplength_7d                      ;
		c_cplength_9d                       <= c_cplength_8d                      ;
		c_cplength_10d                      <=c_cplength_9d                       ;
		c_cplength_11d                      <=c_cplength_10d                      ;
		c_cplength_12d                      <=c_cplength_11d                      ;
		c_cplength_13d                      <=c_cplength_12d                      ;
		c_cplength_14d                      <=c_cplength_13d                      ;
		c_fftsize_1d                       	<= c_fftsize                          ;
		c_fftsize_2d                       	<= c_fftsize_2d                       ;
		c_fftsize_3d                       	<= c_fftsize_2d                       ;
		c_fftsize_4d                       	<= c_fftsize_3d                       ;
		c_fftsize_5d                       	<= c_fftsize_4d                       ;
		c_fftsize_6d                       	<= c_fftsize_5d                       ;
		c_fftsize_7d                       	<= c_fftsize_6d                       ;
		c_fftsize_8d                       	<= c_fftsize_7d                       ;
		c_fftsize_9d                       	<= c_fftsize_8d                       ;
		c_fftsize_10d                       <=c_fftsize_9d                        ;
		c_fftsize_11d                       <=c_fftsize_10d                       ;
		c_fftsize_12d                       <=c_fftsize_11d                       ;
		c_fftsize_13d                       <=c_fftsize_12d                       ;
		c_fftsize_14d                       <=c_fftsize_13d                       ;
		bw_config_reg_cc1_1d				<= bw_config_cc1				      ;
		bw_config_reg_cc1_2d				<= bw_config_reg_cc1_1d			      ;
		bw_config_reg_cc2_1d				<= bw_config_cc2				      ;
		bw_config_reg_cc2_2d				<= bw_config_reg_cc2_1d			 	  ;
    end
end


// Subcarrier Configurable for Variable Bandwidth
/*always @ (posedge clk_dsp)
            begin : CPLANE_SC		
            if (rst_dsp_n == 1'b0)
               NUM_OF_SUBCARRIER <= 'b0 ;
			else if (c_plane_info_valid_2d)
                     begin
               (* parallel_case *) case(c_fftsize_2d)
                                'd9    :    NUM_OF_SUBCARRIER  <= 'd300 ;
                                'd10    :   NUM_OF_SUBCARRIER  <= 'd600 ;
                                'd11    :   NUM_OF_SUBCARRIER  <= 'd1200 ;
                                'd12    :   NUM_OF_SUBCARRIER  <= 'd3276 ;
								default  : NUM_OF_SUBCARRIER   <= 'b0 ;
                                  endcase
                     end		
            end */
			
			
// Subcarrier Configurable for Variable Bandwidth - - Needs to updated for Mixed BW Support		
always @ (posedge clk_dsp)
            begin : NUM_SC_1		
            if (rst_dsp_n == 1'b0)
               NUM_OF_SUBCARRIER_1 <= 'b0 ;
//			else if (~bw_config_reg_cc1_2d [7]  )
			else 
                     begin
               (* parallel_case *) case(bw_config_reg_cc1_2d [6:0])
								'hA    :   NUM_OF_SUBCARRIER_1  <= 'd1944 ;
                                'hE    :   NUM_OF_SUBCARRIER_1  <= 'd3276 ;
								default  : NUM_OF_SUBCARRIER_1  <= 'd3276 ;
                                  endcase
                     end		
            end 
// Subcarrier Configurable for Variable Bandwidth - - Needs to updated for Mixed BW Support		
always @ (posedge clk_dsp)
            begin : NUM_SC_2		
            if (rst_dsp_n == 1'b0)
               NUM_OF_SUBCARRIER_2<= 'b0 ;
//			else if (~bw_config_reg_cc2_2d [7]  )
			else
                     begin
               (* parallel_case *) case(bw_config_reg_cc2_2d [6:0])
								'hA    :   NUM_OF_SUBCARRIER_2 <= 'd1944 ;
                                'hE    :   NUM_OF_SUBCARRIER_2 <= 'd3276 ;
								default  : NUM_OF_SUBCARRIER_2 <= 'd3276 ;
                                  endcase
                     end		
            end 				

			
//	INTERLEAVE_WAIT_CYCLE Calculation - 		
always @ (posedge clk_dsp)
            begin : INTERLEAVE_WAIT_CYCLE_SELECTION_1	
            if (rst_dsp_n == 1'b0)
               INTERLEAVE_WAIT_CYCLE_1 <= 'b0 ;
			else if ( bw_config_reg_cc1_2d[6:0] == 'hE) // For 100 MHz
                     begin
               (* parallel_case *) case(sym_count_1)
                                'd0   	: INTERLEAVE_WAIT_CYCLE_1  <= 'd1156 ;
                                'd14    : INTERLEAVE_WAIT_CYCLE_1  <= 'd1156 ;
								default : INTERLEAVE_WAIT_CYCLE_1  <= 'd1092 ;
                                  endcase
                     end		
			else if ( bw_config_reg_cc1_2d[6:0] == 'hA) // For 60 MHz
                     begin
               (* parallel_case *) case(sym_count_1)
                                'd0   	: INTERLEAVE_WAIT_CYCLE_1  <= 'd2488 ;
                                'd14    : INTERLEAVE_WAIT_CYCLE_1  <= 'd2488 ;
								default : INTERLEAVE_WAIT_CYCLE_1  <= 'd2424 ;
                                  endcase
                     end		
            end

//	INTERLEAVE_WAIT_CYCLE Calculation -		
always @ (posedge clk_dsp)
            begin : INTERLEAVE_WAIT_CYCLE_SELECTION_2	
            if (rst_dsp_n == 1'b0)
               INTERLEAVE_WAIT_CYCLE_2<= 'b0 ;
			else if ( bw_config_reg_cc2_2d[6:0] == 'hE) // For 100 MHz
                     begin
               (* parallel_case *) case(sym_count_2)
                                'd0   	: INTERLEAVE_WAIT_CYCLE_2 <= 'd1156 ;
                                'd14    : INTERLEAVE_WAIT_CYCLE_2 <= 'd1156 ;
								default : INTERLEAVE_WAIT_CYCLE_2 <= 'd1092 ;
                                  endcase
                     end		
			else if ( bw_config_reg_cc2_2d[6:0] == 'hA) // For 60 MHz
                     begin
               (* parallel_case *) case(sym_count_2)
                                'd0   	: INTERLEAVE_WAIT_CYCLE_2 <= 'd2488 ;
                                'd14    : INTERLEAVE_WAIT_CYCLE_2 <= 'd2488 ;
								default : INTERLEAVE_WAIT_CYCLE_2 <= 'd2424 ;
                                  endcase
                     end		
            end


//---------- Symbol Counter ------------//
always @ (posedge clk_dsp)
begin : SYM_COUNTER_1   
    if (rst_dsp_n == 1'b0) 
        sym_count_1  <= 5'b0 ;
	else if (hfn_pulse_2d)
		sym_count_1  <=  5'd0;
    else if ( wait_done_pulse_1 & sym_count_1 == 5'd27)
		sym_count_1  <=  5'd0;		
    else if (wait_done_pulse_1)
        sym_count_1  <=  sym_count_1 + 5'd1;
end

//---------- Symbol Counter ------------//
always @ (posedge clk_dsp)
begin : SYM_COUNTER_2   
    if (rst_dsp_n == 1'b0) 
        sym_count_2 <= 5'b0 ;
	else if (hfn_pulse_2d)
		sym_count_2 <=  5'd0;
    else if ( wait_done_pulse_2& sym_count_2== 5'd27)
		sym_count_2 <=  5'd0;		
    else if (wait_done_pulse_2)
        sym_count_2 <=  sym_count_2+ 5'd1;
end

/* always @ (posedge clk_dsp)
begin : WAIT_DONE_COUNTER   
    if (rst_dsp_n == 1'b0) 
        wait_done_count  <= 3'b0 ;
	else if (wait_done_count == 3'd4)
		wait_done_count  <=  3'd0;
    else if ( wait_done & wait_done_count < 3'd4)
        wait_done_count  <=  wait_done_count + 3'd1;
end */

always @ (posedge clk_dsp)
begin : WAIT_DONE_COUNTER_1   
    if (rst_dsp_n == 1'b0)
      begin 	
        wait_done_count_1  <= 3'b0 ;
		wait_done_pulse_1  <= 'd0;
	  end
	else if (wait_done_1 & wait_done_count_1 == 3'd3)
	begin
		wait_done_count_1  <=  3'd0;
		wait_done_pulse_1  <=   'd1;
		end
    else if (wait_done_1)
	begin
        wait_done_count_1  <=  wait_done_count_1 + 3'd1;
		wait_done_pulse_1  <= 'd0;
	end
	else
	begin
	   wait_done_count_1  <=  wait_done_count_1;
	   wait_done_pulse_1  <= 'd0;
    end
end

always @ (posedge clk_dsp)
begin : WAIT_DONE_COUNTER_2   
    if (rst_dsp_n == 1'b0)
      begin 	
        wait_done_count_2 <= 3'b0 ;
		wait_done_pulse_2 <= 'd0;
	  end
	else if (wait_done_2& wait_done_count_2== 3'd3)
	begin
		wait_done_count_2 <=  3'd0;
		wait_done_pulse_2 <=   'd1;
		end
    else if (wait_done_2)
	begin
        wait_done_count_2 <=  wait_done_count_2+ 3'd1;
		wait_done_pulse_2 <= 'd0;
	end
	else
	begin
	   wait_done_count_2 <=  wait_done_count_2;
	   wait_done_pulse_2 <= 'd0;
    end
end

/* always @ (posedge clk_eth or negedge rst_eth_n )
    begin : SEQ_ID_LATCH
        if (rst_eth_n == 1'b0) 
            avst_sink_rbstart   <= 8'b0 ;
        else if (xran_demapper_sts_prb_vout_2d)
            avst_sink_rbstart  <= xran_demapper_sts_prb_dout_2d  [23:16];
    end */

  
//---------- Sink ready ------------//
always @ (posedge clk_dsp)
begin : SINK_READY_1   
    if (rst_dsp_n == 1'b0) 
        avst_sink_ready_1  <= 1'b0 ;
//	else if (bw_config_reg_cc1_2d [7])  // L1 is disabled
//        avst_sink_ready_1 <= 1'b0 ;
    else if (hfn_pulse_2d | wait_done_1)
        avst_sink_ready_1  <= 1'b1 ;
    else if ((sink_valid_count_1 == (NUM_OF_SUBCARRIER_1-(1+SINK_READY_LATENCY))) & avst_sink_valid_1_2d) 
        avst_sink_ready_1  <= 1'b0 ;
end

`ifdef NUM_CC_TWO
//---------- Sink ready ------------//
always @ (posedge clk_dsp)
begin : SINK_READY_2   
    if (rst_dsp_n == 1'b0) 
        avst_sink_ready_2 <= 1'b0 ;
//	else if (bw_config_reg_cc2_2d [7])  // L2 is disabled
//        avst_sink_ready_2 <= 1'b0 ;
    else if (hfn_pulse_2d | wait_done_2)
        avst_sink_ready_2 <= 1'b1 ;
    else if ((sink_valid_count_2== (NUM_OF_SUBCARRIER_2-(1+SINK_READY_LATENCY))) & avst_sink_valid_2_2d) 
        avst_sink_ready_2 <= 1'b0 ;
end

`else

//---------- Sink ready ------------//
always @ (posedge clk_dsp)
begin : SINK_READY_2   
    if (rst_dsp_n == 1'b0) 
        avst_sink_ready_2 <= 1'b0 ;
//	else if (bw_config_reg_cc2_2d [7])  // L2 is disabled
//        avst_sink_ready_2 <= 1'b0 ;
    else if (hfn_pulse_2d | wait_done_2)
        avst_sink_ready_2 <= 1'b0 ;
    else if ((sink_valid_count_2== (NUM_OF_SUBCARRIER_2-(1+SINK_READY_LATENCY))) & avst_sink_valid_2_2d) 
        avst_sink_ready_2 <= 1'b0 ;
end

`endif


//---------- Sink counter ------------//
always @ (posedge clk_dsp)
begin : SINK_COUNTER_1   
    if (rst_dsp_n == 1'b0) 
        sink_valid_count_1  <= 16'b0 ;
    else if (hfn_pulse_2d | wait_done_1)
        sink_valid_count_1  <= 16'b0 ;
    else if (avst_sink_valid_1)
        sink_valid_count_1  <= sink_valid_count_1 + 1'b1 ;
end
//---------- Sink counter ------------//
always @ (posedge clk_dsp)
begin : SINK_COUNTER_2   
    if (rst_dsp_n == 1'b0) 
        sink_valid_count_2 <= 16'b0 ;
    else if (hfn_pulse_2d | wait_done_2)
        sink_valid_count_2 <= 16'b0 ;
    else if (avst_sink_valid_2)
        sink_valid_count_2 <= sink_valid_count_2+ 1'b1 ;
end

//---------- Subcarrier index ------------//
always @ (posedge clk_dsp)
begin : SUBCARRIER_INDEX_1   
    if (rst_dsp_n == 1'b0) 
        subcarrier_index_1  <= 11'b0 ;
    else if (hfn_pulse_2d | wait_done_1)
        subcarrier_index_1  <= 11'b0 ;
    else if (source_endofpacket_1 & avst_sink_valid_1_2d)
        subcarrier_index_1  <= 11'b0 ;
    else if (avst_sink_valid_1_2d)
        subcarrier_index_1  <= subcarrier_index_1 + 1'b1 ;
end

//---------- Subcarrier index ------------//
always @ (posedge clk_dsp)
begin : SUBCARRIER_INDEX_2   
    if (rst_dsp_n == 1'b0) 
        subcarrier_index_2 <= 11'b0 ;
    else if (hfn_pulse_2d | wait_done_2)
        subcarrier_index_2 <= 11'b0 ;
    else if (source_endofpacket_2& avst_sink_valid_2_2d)
        subcarrier_index_2 <= 11'b0 ;
    else if (avst_sink_valid_2_2d)
        subcarrier_index_2 <= subcarrier_index_2+ 1'b1 ;
end


assign source_startofpacket_1    = (subcarrier_index_1 == 11'b0);
assign source_startofpacket_2   = (subcarrier_index_2== 11'b0);

always @ (posedge clk_dsp)
begin : SOURCE_ENDOFPACKET_1   
    source_endofpacket_1  <= (subcarrier_index_1 == (NUM_OF_SUBCARRIER_1-2)) ;
end

always @ (posedge clk_dsp)
begin : SOURCE_ENDOFPACKET_2   
    source_endofpacket_2 <= (subcarrier_index_2== (NUM_OF_SUBCARRIER_2-2)) ;
end


//---------- AXC index ------------//
always @ (posedge clk_dsp)
begin : AXC_INDEX_1   
    if (rst_dsp_n == 1'b0)
        axc_index_1  <= 2'b0 ;
    else if (hfn_pulse_2d)
        axc_index_1  <= 2'b0 ;
    else if (source_endofpacket_1 & avst_sink_valid_1_2d)
        axc_index_1  <= axc_index_1 + 1'b1 ;
end

//---------- AXC index ------------//
always @ (posedge clk_dsp)
begin : AXC_INDEX_2   
    if (rst_dsp_n == 1'b0)
        axc_index_2 <= 2'b0 ;
    else if (hfn_pulse_2d)
        axc_index_2 <= 2'b0 ;
    else if (source_endofpacket_2& avst_sink_valid_2_2d)
        axc_index_2 <= axc_index_2+ 1'b1 ;
end


//---------- LAST AXC INDEX ------------//
always @ (posedge clk_dsp)
begin : LAST_AXC_INDEX_1   
    if (rst_dsp_n == 1'b0)
        last_axc_index_1  <= 1'b0 ;
    else if (hfn_pulse_2d)
        last_axc_index_1  <= 1'b0 ;
    else if (axc_index_1 == (NUM_OF_ANT-2))
        last_axc_index_1  <= 1'b1 ;
end

//---------- LAST AXC INDEX ------------//
always @ (posedge clk_dsp)
begin : LAST_AXC_INDEX_2   
    if (rst_dsp_n == 1'b0)
        last_axc_index_2 <= 1'b0 ;
    else if (hfn_pulse_2d)
        last_axc_index_2 <= 1'b0 ;
    else if (axc_index_2== (NUM_OF_ANT-1))
        last_axc_index_2 <= 1'b1 ;
end

always @ (posedge clk_dsp)
begin : WAIT_DONE_1   
    if (rst_dsp_n == 1'b0)
        wait_done_1 <= 1'b0 ;
    else if (wait_enable_1)
        wait_done_1 <= wait_count_1 == (INTERLEAVE_WAIT_CYCLE_1-2);
end

always @ (posedge clk_dsp)
begin : WAIT_DONE_2   
    if (rst_dsp_n == 1'b0)
        wait_done_2<= 1'b0 ;
    else if (wait_enable_2)
        wait_done_2<= wait_count_2== (INTERLEAVE_WAIT_CYCLE_2-2);
end

//---------- WAIT ENABLE ------------//
always @ (posedge clk_dsp)
begin : WAIT_ENABLE_1   
    if (rst_dsp_n == 1'b0)
        wait_enable_1 <= 1'b0 ;
    else if (hfn_pulse_2d)
        wait_enable_1 <= 1'b0 ;
    else if (avst_sink_valid_1_2d & source_endofpacket_1)
        wait_enable_1 <= 1'b1 ;
    else if (wait_done_1)
        wait_enable_1 <= 1'b0 ;
end

//---------- WAIT ENABLE ------------//
always @ (posedge clk_dsp)
begin : WAIT_ENABLE_2   
    if (rst_dsp_n == 1'b0)
        wait_enable_2<= 1'b0 ;
    else if (hfn_pulse_2d)
        wait_enable_2<= 1'b0 ;
    else if (avst_sink_valid_2_2d & source_endofpacket_2)
        wait_enable_2<= 1'b1 ;
    else if (wait_done_2)
        wait_enable_2<= 1'b0 ;
end

//---------- WAIT COUNT ------------//
always @ (posedge clk_dsp)
begin : WAIT_COUNT_1   
    if (rst_dsp_n == 1'b0)
        wait_count_1  <= 11'b0 ;
    else if (hfn_pulse_2d)
        wait_count_1  <= 11'b0 ;
    else if (wait_enable_1)
        wait_count_1  <= wait_count_1 + 1'b1 ;
    else
        wait_count_1  <= 1'b0 ;
end

//---------- WAIT COUNT ------------//
always @ (posedge clk_dsp)
begin : WAIT_COUNT_2   
    if (rst_dsp_n == 1'b0)
        wait_count_2 <= 11'b0 ;
    else if (hfn_pulse_2d)
        wait_count_2 <= 11'b0 ;
    else if (wait_enable_2)
        wait_count_2 <= wait_count_2+ 1'b1 ;
    else
        wait_count_2 <= 1'b0 ;
end



assign c_valid                      = c_plane_info_valid_14d   ;
assign fftsize                      = c_fftsize_14d            ;
assign cplength                     = c_cplength_14d           ;

always@(posedge clk_dsp)
begin: DATA_OUTPUT
    if (rst_dsp_n == 1'b0) begin
		avst_source_valid_1           <= 'd0; 
		avst_source_data_1            <= 'd0; 
		avst_source_channel_1         <= 'd0; 
		avst_source_endofpacket_1     <= 'd0; 
		avst_source_startofpacket_1   <= 'd0; 
		
		avst_source_valid_2          <= 'd0; 
		avst_source_data_2           <= 'd0; 
		avst_source_channel_2        <= 'd0; 
		avst_source_endofpacket_2    <= 'd0; 
		avst_source_startofpacket_2  <= 'd0;		
    end  else  begin 
	    avst_source_valid_1           <= (bw_config_reg_cc1_2d [7] & bw_config_reg_cc2_2d [7]) ? 'd0 : avst_sink_valid_1_5d    ; 
		avst_source_data_1            <= (bw_config_reg_cc1_2d [7] 							 ) ? 'd0 : avst_sink_data_1_5d     ; 
		avst_source_channel_1         <= (bw_config_reg_cc1_2d [7] & bw_config_reg_cc2_2d [7]) ? 'd0 : axc_index_1_3d          ; 
		avst_source_endofpacket_1     <= (bw_config_reg_cc1_2d [7] & bw_config_reg_cc2_2d [7]) ? 'd0 : source_endofpacket_1_3d  ; 
		avst_source_startofpacket_1   <= (bw_config_reg_cc1_2d [7] & bw_config_reg_cc2_2d [7]) ? 'd0 : source_startofpacket_1_3d; 
		
		avst_source_valid_2          <= (bw_config_reg_cc1_2d [7] & bw_config_reg_cc2_2d [7]) ? 'd0 : avst_sink_valid_2_5d     ; 
		avst_source_data_2           <= (bw_config_reg_cc2_2d [7] 							) ? 'd0 : avst_sink_data_2_5d      ; 
		avst_source_channel_2        <= (bw_config_reg_cc1_2d [7] & bw_config_reg_cc2_2d [7]) ? 'd0 : axc_index_2_3d           ; 
		avst_source_endofpacket_2    <= (bw_config_reg_cc1_2d [7] & bw_config_reg_cc2_2d [7]) ? 'd0 : source_endofpacket_2_3d  ; 
		avst_source_startofpacket_2  <= (bw_config_reg_cc1_2d [7] & bw_config_reg_cc2_2d [7]) ? 'd0 : source_startofpacket_2_3d;
	   	
	end
end

endmodule
