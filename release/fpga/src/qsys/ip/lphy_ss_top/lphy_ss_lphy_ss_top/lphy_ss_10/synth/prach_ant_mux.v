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
 
module prach_ant_mux
(
    clk_dsp                             ,
    rst_dsp_n                           ,
    
    clk_eth                             ,
    rst_eth_n                           ,
   
    // Stream Input 
    avst_sink_valid                     ,
    avst_sink_data                      ,
    avst_sink_channel                   ,
    avst_sink_ready                     ,
    avst_sink_endofpacket               ,
    avst_sink_startofpacket             ,
    
    // Stream Output    
    avst_source_valid                   ,
    avst_source_data                    ,
    avst_source_channel                 ,
    avst_source_ready                   ,
    avst_source_endofpacket             ,
    avst_source_startofpacket           ,
	
	frag_disable                        ,
	timing_reference                    ,
    
    
    //hyperframe pulse from ttd_sync
//    hfn_pulse                           ,
//    lte_sfn_sf_in                       ,
    
 //   lte_sfn_sf_out                      ,
 //   ant_interleave_index                ,
 //   packet_size                         ,

   frame_status                        ,

    //side band signals
   frame_ctrl_data                     , 
   frame_ctrl_vld                      ,
   prb_ctrl_data                       , 
   prb_ctrl_vld                        ,
   
   arbiter_request                     ,
   output_fifo_full                    ,
   sc_fifo_full                        ,
   sc_fifo_full_time_ref
    
);


//Parameters Declaration
parameter NUM_OF_ANT        =   8 ;
parameter NUM_OF_FFT        =   2 ;
parameter MAX_ANT           =   16 ;
parameter DSP_IQ_DATAWIDTH  =   32  ;
parameter ETH_IQ_DATAWIDTH  =   128 ;


localparam ETH_WAIT_CYCLE   =    8  ;
localparam NUM_OF_SYM       =    12  ;

localparam OUTPUT_FIFO_WIDTH    = 190 ;  //Dont modify
localparam OUTPUT_FIFO_DEPTH    = 64 ;  //Dont modify

input                   clk_dsp         ;
input                   rst_dsp_n       ;

input                   clk_eth         ;
input                   rst_eth_n       ;
input [57:0]			timing_reference;


// Stream Input
input   [NUM_OF_FFT-1:0]                        avst_sink_valid             ;
input   [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]   avst_sink_data              ;
input   [7:0]                                   avst_sink_channel           ;
input                                           avst_sink_endofpacket       ;
input                                           avst_sink_startofpacket     ;
output                                          avst_sink_ready             ;

// Stream Output
output                              avst_source_valid           ;
output  [ETH_IQ_DATAWIDTH -1 :0]    avst_source_data            ;
output  [15 :0]                     avst_source_channel         ;
output                              avst_source_endofpacket     ;
output                              avst_source_startofpacket   ;
input                               avst_source_ready           ;

input                               frag_disable                ;
reg                                 frag_disable_1d             ;
reg                                 frag_disable_2d             ;
 

//input                               hfn_pulse                   ;
//input   [13:0]                      lte_sfn_sf_in               ;
//output  [13:0]                      lte_sfn_sf_out              ;
//output  [15:0]                      ant_interleave_index        ;
//output  [15:0]                      packet_size                 ;

input   [67:0]                      frame_status        ;

wire                                avst_sink_ready             ;

// side band signals  
output  wire     [DSP_IQ_DATAWIDTH-1:0]       frame_ctrl_data; 
output  wire                                  frame_ctrl_vld ;
output  wire     [DSP_IQ_DATAWIDTH-1:0]       prb_ctrl_data  ; 
output  wire                                  prb_ctrl_vld   ; 

output  wire                                  arbiter_request;

output                                     output_fifo_full    ;
output  wire  [NUM_OF_FFT-1:0]                       sc_fifo_full;
output  wire  [NUM_OF_FFT-1:0]                       sc_fifo_full_time_ref;

// Stream Output
wire                                avst_source_valid           ;
wire    [ETH_IQ_DATAWIDTH -1 :0]    avst_source_data            ;
wire    [15 :0]                      avst_source_channel         ;
wire                                avst_source_endofpacket     ;
wire                                avst_source_startofpacket   ;

wire    [13:0]                      lte_sfn_sf_out              ;
wire    [15:0]                      ant_interleave_index        ;
wire    [15:0]                      packet_size                 ;

reg     [NUM_OF_FFT-1:0]            avst_sink_valid_1d          ;  
reg     [NUM_OF_FFT-1:0]            avst_sink_valid_2d          ;  
reg     [NUM_OF_FFT-1:0]            avst_sink_valid_3d          ; 

reg     [NUM_OF_FFT-1:0]            avst_sink_valid_1d_dup1     ;  
reg     [NUM_OF_FFT-1:0]            avst_sink_valid_2d_dup1     ;  
reg     [NUM_OF_FFT-1:0]            avst_sink_valid_3d_dup1     ; 
 
reg     [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]   avst_sink_data_1d   ;
reg     [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]   avst_sink_data_2d   ;
reg     [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]   avst_sink_data_3d   ;

reg     [7 :0]                      avst_sink_channel_1d        ;
reg     [7 :0]                      avst_sink_channel_2d        ;
reg     [7 :0]                      avst_sink_channel_3d        ;

reg                                 avst_sink_startofpacket_1d  ;
reg                                 avst_sink_startofpacket_2d  ;
reg                                 avst_sink_startofpacket_3d  ;

reg                                 avst_sink_endofpacket_1d    ;
reg                                 avst_sink_endofpacket_2d    ;
reg                                 avst_sink_endofpacket_3d    ;


wire    [NUM_OF_FFT-1:0]            ff_wrreq                            ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_1d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_2d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_3d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_4d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_5d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_6d                         ;
reg     [NUM_OF_FFT-1:0]            add_pul                             ;
reg     [NUM_OF_FFT-1:0]            add_pul_1d                          ;
reg     [NUM_OF_FFT-1:0]            add_pul_2d                          ;
wire    [DSP_IQ_DATAWIDTH -1 :0]    ff_writedata     [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH*NUM_OF_FFT -1 :0]    ff_writedata_1d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH*NUM_OF_FFT -1 :0]    ff_writedata_2d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH*NUM_OF_FFT -1 :0]    ff_writedata_3d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH*NUM_OF_FFT -1 :0]    ff_writedata_4d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH*NUM_OF_FFT -1 :0]    ff_writedata_5d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH*NUM_OF_FFT -1 :0]    ff_writedata_6d  [NUM_OF_FFT-1:0]   ;
wire    [NUM_OF_FFT-1:0]            ff_rdreq                            ;
wire    [NUM_OF_FFT-1:0]            ff_rdreq_timing                     ;
reg     [NUM_OF_FFT-1:0]            ff_rdreq_1d                         ;
reg     [NUM_OF_FFT-1:0]            ff_rdreq_2d                         ;
reg     [NUM_OF_FFT-1:0]            ff_rdreq_3d                         ;
wire    [ETH_IQ_DATAWIDTH -1 :0]    ff_readdata      [NUM_OF_FFT-1:0]   ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    ff_readdata_1d   [NUM_OF_FFT-1:0]   ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    ff_readdata_2d   [NUM_OF_FFT-1:0]   ;
wire    [NUM_OF_FFT-1:0]            ff_rdempty                          ;

wire    [ETH_IQ_DATAWIDTH -1 :0]    	ff_readdata_timing      [NUM_OF_FFT-1:0]   ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ff_readdata_timing_1d   [NUM_OF_FFT-1:0]   ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ff_readdata_timing_2d   [NUM_OF_FFT-1:0]   ;
wire    [NUM_OF_FFT-1:0]            ff_rdempty_timing                          ;


wire    [NUM_OF_FFT-1:0]            ram_wrreq                           ;  
reg     [NUM_OF_FFT-1:0]            ram_wrreq_1d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_wrreq_2d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_wrreq_3d                        ; 
wire    [ETH_IQ_DATAWIDTH -1 :0]    ram_writedata    [NUM_OF_FFT-1:0]   ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_writedata_1d [NUM_OF_FFT-1:0]   ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_writedata_2d [NUM_OF_FFT-1:0]   ; 
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_writedata_3d [NUM_OF_FFT-1:0]   ; 
wire    [NUM_OF_FFT-1:0]            ram_wrfull                          ;

reg    [NUM_OF_FFT-1:0]            ram_wrfull_1d     	                ;
reg    [NUM_OF_FFT-1:0]            ram_wrfull_2d 		                ;
 
wire    [NUM_OF_FFT-1:0]            ram_rdreq                           ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_1d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_2d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_3d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_4d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_5d                        ;  
wire    [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata    [NUM_OF_FFT-1:0]    ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata_1d [NUM_OF_FFT-1:0]    ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata_2d [NUM_OF_FFT-1:0]    ;  
wire    [10:0]                      	ram_rdusedw     [NUM_OF_FFT-1:0]    ;  
reg     [10:0]                      	ram_rdusedw_1d  [NUM_OF_FFT-1:0]    ;  
reg     [10:0]                      	ram_rdusedw_2d  [NUM_OF_FFT-1:0]    ;  
reg     [11:0]                      valid_cnt       [NUM_OF_FFT-1:0]    ; 
wire    [NUM_OF_FFT-1:0]            ram_rdempty                         ;  

wire    [ETH_IQ_DATAWIDTH -1 :0]    	ram_writedata_timing    [NUM_OF_FFT-1:0]   ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ram_writedata_timing_1d [NUM_OF_FFT-1:0]   ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ram_writedata_timing_2d [NUM_OF_FFT-1:0]   ; 
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ram_writedata_timing_3d [NUM_OF_FFT-1:0]   ; 
wire    [NUM_OF_FFT-1:0]            ram_wrfull_timing                          ;
reg    [NUM_OF_FFT-1:0]            ram_wrfull_timing_1d                ;
reg    [NUM_OF_FFT-1:0]            ram_wrfull_timing_2d                ; 

wire    [ETH_IQ_DATAWIDTH -1 :0]    	ram_readdata_timing    [NUM_OF_FFT-1:0]    ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ram_readdata_timing_1d [NUM_OF_FFT-1:0]    ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ram_readdata_timing_2d [NUM_OF_FFT-1:0]    ;  
wire    [10:0]                      	ram_rdusedw_timing     [NUM_OF_FFT-1:0]    ;  
reg     [10:0]                      	ram_rdusedw_timing_1d  [NUM_OF_FFT-1:0]    ;  
reg     [10:0]                      	ram_rdusedw_timing_2d  [NUM_OF_FFT-1:0]    ;  
//reg     [11:0]                      valid_cnt       [NUM_OF_FFT-1:0]    ; 
wire    [NUM_OF_FFT-1:0]            ram_rdempty_timing                        ;  




reg     [NUM_OF_FFT-1:0]            ram_rdready                         ;  
reg                                 ram_rdready_all                     ;

wire                                hfn_pulse_extend                    ;
reg                                 hfn_pulse_dsp_1d                    ;
reg                                 hfn_pulse_dsp_2d                    ;
reg                                 hfn_pulse_dsp_3d                    ;
reg                                 hfn_pulse_dsp_4d                    ;
reg                                 hfn_pulse_dsp_5d                    ;
reg                                 hfn_pulse_1d                        ;
reg                                 hfn_pulse_2d                        ;
reg                                 hfn_pulse_3d                        ;
reg                                 hfn_pulse_4d                        ;
wire                                hfn_pulse_rising                    ;
reg                                 hfn_pulse_rising_1d                 ;
reg     [13:0]                      lte_sfn_sf_in_1d                    ;
reg     [13:0]                      lte_sfn_sf_in_2d                    ;
reg     [11:0]                      ant_interleave_max                  ;
reg     [11:0]                      ant_interleave_max_1d               ;
reg     [11:0]                      ant_interleave_max_2d               ;
reg     [11:0]                      ant_interleave_max_p1               ;
reg     [15:0]                      ant_interleave_max_bytes            ;
reg     [15:0]                      ant_interleave_max_bytes_1d         ;
reg     [15:0]                      ant_interleave_max_bytes_2d         ;
reg     [15:0]                      ant_interleave_max_bytes_3d         ;
reg     [15:0]                      ant_interleave_max_bytes_4d         ;
reg     [15:0]                      ant_interleave_max_bytes_5d         ;

reg                                 ram_rdenable                        ;
reg                                 ram_rdenable_1d                     ;
wire                                ram_rdenable_falling                ;
reg     [16:0]                      ram_rdcount                         ;
reg     [16:0]                      ram_rdcount_limit                   ;
reg     [16:0]                      ram_rdcount_limit_1d                ;
reg     [16:0]                      ram_rdcount_limit_2d                ;
wire                                ram_rd_valid                        ; 
reg                                 ram_rd_valid_1d                     ; 
reg                                 ram_rd_valid_2d                     ; 
reg                                 ram_rd_valid_3d                     ; 
reg                                 ram_rd_valid_4d                     ; 
reg                                 ram_rd_valid_5d                     ; 
reg                                 ram_rd_valid_6d                     ; 
reg                                 ram_rd_valid_7d                     ; 
reg                                 ram_rd_valid_8d                     ; 

reg                                 ram_waitenable                      ;
reg     [15:0]                      ram_waitcount                       ;

reg     [11:0]                      ram_rdcount_interleave              ;
reg     [3:0]                       ram_rd_fft                          ;
reg     [3:0]                       ram_rd_fft_1d                       ;
reg     [3:0]                       ram_rd_fft_2d                       ;
reg     [3:0]                       ram_rd_fft_3d                       ;
reg     [3:0]                       ram_rd_fft_4d                       ;
reg     [3:0]                       ram_rd_fft_5d                       ;
reg     [2:0]                       ram_rd_iteration                    ;
reg     [15:0]                       ram_rd_ant                          ;
reg     [15:0]                       ram_rd_ant_1d                       ;
reg     [15:0]                       ram_rd_ant_2d                       ;
reg     [15:0]                       ram_rd_ant_3d                       ;
reg     [15:0]                       ram_rd_ant_4d                       ;
reg     [15:0]                       ram_rd_ant_5d                       ;
reg     [15:0]                       ram_rd_ant_6d                       ;
reg     [15:0]                       ram_rd_ant_7d                       ;
reg     [15:0]                       ram_rd_ant_8d                       ;
reg     [3:0]                       ram_rd_sym                          ;
reg     [3:0]                       ram_rd_sym_1d                       ;
reg     [3:0]                       ram_rd_sym_2d                       ;
reg     [3:0]                       ram_rd_sym_3d                       ;
reg     [3:0]                       ram_rd_sym_4d                       ;
reg     [3:0]                       ram_rd_sym_5d                       ;
reg     [3:0]                       ram_rd_sym_6d                       ;
reg     [3:0]                       ram_rd_sym_7d                       ;



reg     [7:0]                       ram_rd_seq                          ;
reg     [7:0]                       ram_rd_seq_1d                       ;
reg     [7:0]                       ram_rd_seq_2d                       ;
reg     [7:0]                       ram_rd_seq_3d                       ;
reg     [7:0]                       ram_rd_seq_4d                       ;
reg     [7:0]                       ram_rd_seq_5d                       ;
reg     [7:0]                       ram_rd_seq_6d                       ;
reg     [7:0]                       ram_rd_seq_7d                       ;
reg     [15:0]                      ram_interleave_index                ;
reg     [15:0]                      ram_interleave_offset               ;
reg     [15:0]                      ram_interleave_index_1ms            ;
reg     [15:0]                      ram_interleave_index_1ms_1d         ;
reg     [15:0]                      ram_interleave_index_1ms_2d         ;
reg     [15:0]                      ram_interleave_index_1ms_3d         ;
reg     [15:0]                      ram_interleave_index_1ms_4d         ;
reg     [15:0]                      ram_interleave_index_1ms_5d         ;
reg     [15:0]                      ram_interleave_index_1ms_6d         ;
reg     [15:0]                      ram_interleave_index_1ms_7d         ;
reg     [15:0]                      ram_interleave_index_1ms_8d         ;
reg     [13:0]                      lte_sfn_sf_in_latch                 ;
reg     [13:0]                      lte_sfn_sf_in_latch_1d              ;
reg     [13:0]                      lte_sfn_sf_in_latch_2d              ;
reg     [13:0]                      lte_sfn_sf_in_latch_3d              ;
reg     [13:0]                      lte_sfn_sf_in_latch_4d              ;
reg     [13:0]                      lte_sfn_sf_in_latch_5d              ;
reg     [13:0]                      lte_sfn_sf_in_latch_6d              ;
reg     [13:0]                      lte_sfn_sf_in_latch_7d              ;
reg                                 ram_rd_fft_last                     ;
reg                                 ram_rd_fft_last_1d                  ;
reg                                 ram_rd_ant_last                     ;
reg                                 ram_interleave_index_last           ;
reg                                 ram_rd_iteration_last               ;
reg                                 ram_rd_iteration_last_1d            ;
reg                                 ram_rd_iteration_first              ;
reg                                 ram_rd_sym_14	                    ;
reg                                 ram_rd_sym_last                     ;

wire                                ram_rd_sop                          ;
reg                                 ram_rd_sop_1d                       ;
reg                                 ram_rd_sop_2d                       ;
reg                                 ram_rd_sop_3d                       ;
reg                                 ram_rd_sop_4d                       ;
reg                                 ram_rd_sop_5d                       ;
reg                                 ram_rd_sop_6d                       ;
reg                                 ram_rd_sop_7d                       ;
reg                                 ram_rd_sop_8d                       ;
wire                                ram_rd_eop                          ;
reg                                 ram_rd_eop_1d                       ;
reg                                 ram_rd_eop_2d                       ;
reg                                 ram_rd_eop_3d                       ;
reg                                 ram_rd_eop_4d                       ;
reg                                 ram_rd_eop_5d                       ;
reg                                 ram_rd_eop_6d                       ;
reg                                 ram_rd_eop_7d                       ;
reg                                 ram_rd_eop_8d                       ;

reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata_mux                    ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata_mux_1d                 ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata_mux_2d                 ;

reg     [ETH_IQ_DATAWIDTH -1 :0]    	ram_readdata_timing_mux                    ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ram_readdata_timing_mux_1d                ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    	ram_readdata_timing_mux_2d                 ;

reg                     [69:0]      frame_status_1d                     ;
reg                     [69:0]      frame_status_2d                     ;

reg     [3:0]                       slot_id	                         ;
reg     [3:0]                       slot_id_1d                       ;
reg     [3:0]                       slot_id_2d                       ;
wire [7:0]	num_prbu                  ;   
reg [7:0]	numprbu_1d                  ;   
reg [7:0]	numprbu_2d                  ;
reg [7:0]	numprbu_3d                  ;   
reg [7:0]	numprbu_4d                  ; 
reg [7:0]	numprbu_5d                  ;   
reg [7:0]	numprbu_6d                  ; 
reg [7:0]	numprbu_7d                  ;   
reg [7:0]	numprbu_8d                  ;
wire [7:0]       start_prbu                          ;  
reg [7:0]	startprbu_1d                ; 
reg [7:0]	startprbu_2d                ;
reg [7:0]	startprbu_3d                ;
reg [7:0]	startprbu_4d                ;
reg [7:0]	startprbu_5d                ;
reg [7:0]	startprbu_6d                ;
reg [7:0]	startprbu_7d                ; 
reg [7:0]	udcompparam_1d              ; 
reg [7:0]	udcompparam_2d              ; 
reg [7:0]	numberofsections_1d         ;
reg [7:0]	numberofsections_2d         ;
reg             hfn_pulse               ;
reg [13:0]      lte_sfn_sf_in           ;

reg [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]     timing_reference_1d               	 ;
reg [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]      timing_reference_2d               	 ;
reg [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]      timing_reference_3d               	 ;

reg [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]     dsp_timing_reference_1d               	 ;
reg [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]     dsp_timing_reference_2d               	 ;
reg [(DSP_IQ_DATAWIDTH*NUM_OF_FFT) -1 :0]     dsp_timing_reference_3d               	 ;


wire [DSP_IQ_DATAWIDTH-1 :0]    ff_timing_ref     [NUM_OF_FFT-1:0]   ;


wire    [OUTPUT_FIFO_WIDTH-1: 0]        output_fifo_data    ;
wire                                    output_fifo_rdreq   ;
wire                                    output_fifo_wrreq   ;
wire    [OUTPUT_FIFO_WIDTH-1: 0]        output_fifo_q       ;
wire    [$clog2(OUTPUT_FIFO_DEPTH)-1:0] output_fifo_usedw   ;
wire                                    output_fifo_full    ;
wire                                    output_fifo_empty   ;

reg [3:0] 								start_symbol		;
reg [3:0] 								start_symbol_d		;
reg [3:0] 								max_symbol			;
reg [11:0]								subframe_num		;
reg [7:0] 								frame_num			;
reg [11:0]								subframe_num_1d		;
reg [11:0]								subframe_num_2d		;
reg [7:0] 								frame_num_1d		;
reg [7:0] 								frame_num_2d		;

wire start_symbol_edge;

wire valid_pos_edge;


reg valid_pos_edge_1d;

assign avst_sink_ready  = 1'b1 ;
assign hfn_pulse_rising = hfn_pulse_3d & ~hfn_pulse_4d  ;
assign ram_rd_sop       = ram_rd_valid & (ram_rdcount_interleave == 12'd0);
assign ram_rd_eop       = ram_rd_valid & (ram_rdcount_interleave == 'd 35); //12*32*12/128
assign ram_rdenable_falling = ~ram_rdenable & ram_rdenable_1d   ;
assign ram_rd_valid     = ram_rdenable & (output_fifo_usedw < (OUTPUT_FIFO_DEPTH-12)) & ~ram_waitenable ;
assign hfn_pulse_extend = hfn_pulse | hfn_pulse_dsp_1d | hfn_pulse_dsp_2d | 
                        hfn_pulse_dsp_3d | hfn_pulse_dsp_4d | hfn_pulse_dsp_5d ;
		

// Pipe Line Registers
always @ (posedge clk_dsp)
begin
    if(~rst_dsp_n) 
    begin 
        avst_sink_valid_1d          <= {NUM_OF_FFT{1'b0}} ;
        avst_sink_valid_2d          <= {NUM_OF_FFT{1'b0}} ;
        avst_sink_valid_3d          <= {NUM_OF_FFT{1'b0}} ;
        avst_sink_data_1d           <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}} ;
        avst_sink_data_2d           <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}} ;
        avst_sink_data_3d           <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}} ;
        avst_sink_channel_1d        <= 8'b0 ;
        avst_sink_channel_2d        <= 8'b0 ;
        avst_sink_channel_3d        <= 8'b0 ;
        avst_sink_startofpacket_1d  <= 1'b0 ;
        avst_sink_startofpacket_2d  <= 1'b0 ;
        avst_sink_startofpacket_3d  <= 1'b0 ;
        avst_sink_endofpacket_1d    <= 1'b0 ;
        avst_sink_endofpacket_2d    <= 1'b0 ;
        avst_sink_endofpacket_3d    <= 1'b0 ;
        hfn_pulse_dsp_1d            <= 1'b0 ;
        hfn_pulse_dsp_2d            <= 1'b0 ;
        hfn_pulse_dsp_3d            <= 1'b0 ;
        hfn_pulse_dsp_4d            <= 1'b0 ;
        hfn_pulse_dsp_5d            <= 1'b0 ;
		dsp_timing_reference_1d         <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}};
		dsp_timing_reference_2d         <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}};
		dsp_timing_reference_3d         <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}}; 
		
		
    end 
    else 
    begin
        avst_sink_valid_1d          <= avst_sink_valid              ;
        avst_sink_valid_2d          <= avst_sink_valid_1d           ;
        avst_sink_valid_3d          <= avst_sink_valid_2d           ;
        avst_sink_data_1d           <= avst_sink_data               ;
        avst_sink_data_2d           <= avst_sink_data_1d            ;
        avst_sink_data_3d           <= avst_sink_data_2d            ;
        avst_sink_channel_1d        <= avst_sink_channel            ;
        avst_sink_channel_2d        <= avst_sink_channel_1d         ;
        avst_sink_channel_3d        <= avst_sink_channel_2d         ;
        avst_sink_startofpacket_1d  <= avst_sink_startofpacket      ;
        avst_sink_startofpacket_2d  <= avst_sink_startofpacket_1d   ;
        avst_sink_startofpacket_3d  <= avst_sink_startofpacket_2d   ;
        avst_sink_endofpacket_1d    <= avst_sink_endofpacket        ;
        avst_sink_endofpacket_2d    <= avst_sink_endofpacket_1d     ;
        avst_sink_endofpacket_3d    <= avst_sink_endofpacket_2d     ;
        hfn_pulse_dsp_1d            <= hfn_pulse                    ;
        hfn_pulse_dsp_2d            <= hfn_pulse_dsp_1d             ;
        hfn_pulse_dsp_3d            <= hfn_pulse_dsp_2d             ;
        hfn_pulse_dsp_4d            <= hfn_pulse_dsp_3d             ;
        hfn_pulse_dsp_5d            <= hfn_pulse_dsp_4d             ;
		dsp_timing_reference_1d         <= {3'b0,timing_reference[28:0],3'b0,timing_reference[28:0]}		;
		dsp_timing_reference_2d         <= dsp_timing_reference_1d;
		dsp_timing_reference_3d         <= dsp_timing_reference_2d; 
    end 
end


always @ (posedge clk_eth)
begin
    if(~rst_eth_n) 
    begin 
        hfn_pulse_1d            <=  1'b0    ;
        hfn_pulse_2d            <=  1'b0    ;
        hfn_pulse_3d            <=  1'b0    ;
        hfn_pulse_4d            <=  1'b0    ;
        lte_sfn_sf_in_1d        <=  14'b0   ;
        lte_sfn_sf_in_2d        <=  14'b0   ;
        ant_interleave_max_1d   <=  12'b0   ;
        ant_interleave_max_2d   <=  12'b0   ;
        hfn_pulse_rising_1d     <=  1'b0    ;
        ram_rdenable_1d         <=  1'b0    ;
        ram_rd_ant_1d           <=  'b0    ;
        ram_rd_ant_2d           <=  'b0    ;
        ram_rd_ant_3d           <=  'b0    ;
        ram_rd_ant_4d           <=  'b0    ;
        ram_rd_ant_5d           <=  'b0    ;
        ram_rd_ant_6d           <=  'b0    ;
        ram_rd_ant_7d           <=  'b0    ;
        ram_rd_ant_8d           <=  'b0    ;
        ram_readdata_mux_1d     <=  {ETH_IQ_DATAWIDTH{1'b0}} ;
        ram_readdata_mux_2d     <=  {ETH_IQ_DATAWIDTH{1'b0}} ;
        ram_rd_valid_1d         <=  1'b0    ;
        ram_rd_valid_2d         <=  1'b0    ;
        ram_rd_valid_3d         <=  1'b0    ;
        ram_rd_valid_4d         <=  1'b0    ;
        ram_rd_valid_5d         <=  1'b0    ;
        ram_rd_valid_6d         <=  1'b0    ;
        ram_rd_valid_7d         <=  1'b0    ;
        ram_rd_valid_8d         <=  1'b0    ;
        lte_sfn_sf_in_latch_1d  <=  14'b0   ;
        lte_sfn_sf_in_latch_2d  <=  14'b0   ;
        lte_sfn_sf_in_latch_3d  <=  14'b0   ;
        lte_sfn_sf_in_latch_4d  <=  14'b0   ;
        lte_sfn_sf_in_latch_5d  <=  14'b0   ;
        lte_sfn_sf_in_latch_6d  <=  14'b0   ;
        lte_sfn_sf_in_latch_7d  <=  14'b0   ;
        ram_interleave_index_1ms_1d     <=  16'b0   ;
        ram_interleave_index_1ms_2d     <=  16'b0   ;
        ram_interleave_index_1ms_3d     <=  16'b0   ;
        ram_interleave_index_1ms_4d     <=  16'b0   ;
        ram_interleave_index_1ms_5d     <=  16'b0   ;
        ram_interleave_index_1ms_6d     <=  16'b0   ;
        ram_interleave_index_1ms_7d     <=  16'b0   ;
        ram_interleave_index_1ms_8d     <=  16'b0   ;
        ram_rd_sop_1d               <=  1'b0    ;
        ram_rd_sop_2d               <=  1'b0    ;
        ram_rd_sop_3d               <=  1'b0    ;
        ram_rd_sop_4d               <=  1'b0    ;
        ram_rd_sop_5d               <=  1'b0    ;
        ram_rd_sop_6d               <=  1'b0    ;
        ram_rd_sop_7d               <=  1'b0    ;
        ram_rd_sop_8d               <=  1'b0    ;
        ram_rd_eop_1d               <=  1'b0    ;
        ram_rd_eop_2d               <=  1'b0    ;
        ram_rd_eop_3d               <=  1'b0    ;
        ram_rd_eop_4d               <=  1'b0    ;
        ram_rd_eop_5d               <=  1'b0    ;
        ram_rd_eop_6d               <=  1'b0    ;
        ram_rd_eop_7d               <=  1'b0    ;
        ram_rd_eop_8d               <=  1'b0    ;
        ram_rd_sym_1d               <=  'b0    ;
        ram_rd_sym_2d               <=  'b0    ;       
		ram_rd_sym_3d               <=  'b0    ;
        ram_rd_sym_4d               <=  'b0    ;
		ram_rd_sym_5d               <=  'b0    ;
        ram_rd_sym_6d               <=  'b0    ;
		ram_rd_sym_7d               <=  'b0    ;
        ram_rd_seq_1d               <=  'b0     ;
		ram_rd_seq_2d               <=  'b0     ;
		ram_rd_seq_3d               <=  'b0     ;
		ram_rd_seq_4d               <=  'b0     ;
		ram_rd_seq_5d               <=  'b0     ;
		ram_rd_seq_6d               <=  'b0     ;
		ram_rd_seq_7d               <=  'b0     ;
        slot_id_1d                  <=  4'b0    ;
        slot_id_2d                  <=  4'b0    ;
		frame_num_1d				<=	8'b0	;
		frame_num_2d				<=	8'b0	;
		subframe_num_1d				<=	12'b0	;
		subframe_num_2d				<=	12'b0	;
        ram_rdcount_limit_1d        <=  17'b0   ;
        ram_rdcount_limit_2d        <=  17'b0   ;
        ram_rd_fft_1d               <=  4'b0    ;
        ram_rd_fft_2d               <=  4'b0    ;
        ram_rd_fft_3d               <=  4'b0    ;
        ram_rd_fft_4d               <=  4'b0    ;
        ram_rd_fft_5d               <=  4'b0    ;
        ant_interleave_max_bytes_1d <=  16'b0   ;
        ant_interleave_max_bytes_2d <=  16'b0   ;
        ant_interleave_max_bytes_3d <=  16'b0   ;
        ant_interleave_max_bytes_4d <=  16'b0   ;
        ant_interleave_max_bytes_5d <=  16'b0   ;
	numprbu_1d                  <=  'd12;   
	numprbu_2d                  <=  'd12; 
	numprbu_3d                  <=  'd12;
	numprbu_4d                  <=  'd12;
	numprbu_5d                  <=  'd12;
	numprbu_6d                  <=  'd12;
	numprbu_7d                  <=  'd12;
	numprbu_8d                  <=  'd12;
	startprbu_1d                <=  'd0; 
	startprbu_2d                <=  'd0; 
	startprbu_3d                <=  'd0;
	startprbu_4d                <=  'd0;
	startprbu_5d                <=  'd0;
	startprbu_6d                <=  'd0;
	startprbu_7d                <=  'd0;
	frag_disable_1d             <=  'd0;
	frag_disable_2d             <=  'd0;
	udcompparam_1d              <=  'd0; 
	udcompparam_2d              <=  'd0; 
	numberofsections_1d         <=  'd0;
	numberofsections_2d         <=  'd0;
	frame_status_1d             <=  'd0;
	frame_status_2d             <=  'd0;
	ram_rd_iteration_last_1d    <=  'b0;
        ram_rd_fft_last_1d          <=  'b0 ; 
	ram_readdata_timing_mux_1d  <=  {ETH_IQ_DATAWIDTH{1'b0}} ;
    ram_readdata_timing_mux_2d  <=  {ETH_IQ_DATAWIDTH{1'b0}} ;
    avst_sink_valid_1d_dup1     <= {NUM_OF_FFT{1'b0}} ;
    avst_sink_valid_2d_dup1     <= {NUM_OF_FFT{1'b0}} ;
	avst_sink_valid_3d_dup1	    <= {NUM_OF_FFT{1'b0}} ;   
	timing_reference_1d         <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}};
	timing_reference_2d         <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}};
	timing_reference_3d         <= {DSP_IQ_DATAWIDTH*NUM_OF_FFT{1'b0}}; 
   end 
    else 
    begin
        hfn_pulse_1d                <=  hfn_pulse_extend        ;
        hfn_pulse_2d                <=  hfn_pulse_1d            ;
        hfn_pulse_3d                <=  hfn_pulse_2d            ;
        hfn_pulse_4d                <=  hfn_pulse_3d            ;
        lte_sfn_sf_in_1d            <=  lte_sfn_sf_in           ;
        lte_sfn_sf_in_2d            <=  lte_sfn_sf_in_1d        ;
        ant_interleave_max_1d       <=  ant_interleave_max      ;
        ant_interleave_max_2d       <=  ant_interleave_max_1d   ;
        hfn_pulse_rising_1d         <=  hfn_pulse_rising        ;
        ram_rdenable_1d             <=  ram_rdenable            ;
        ram_rd_ant_1d               <=  ram_rd_ant              ;
        ram_rd_ant_2d               <=  ram_rd_ant_1d           ;
        ram_rd_ant_3d               <=  ram_rd_ant_2d           ;
        ram_rd_ant_4d               <=  ram_rd_ant_3d           ;
        ram_rd_ant_5d               <=  ram_rd_ant_4d           ;
        ram_rd_ant_6d               <=  ram_rd_ant_5d           ;
        ram_rd_ant_7d               <=  ram_rd_ant_6d           ;
        ram_rd_ant_8d               <=  ram_rd_ant_7d           ;
        ram_readdata_mux_1d         <=  ram_readdata_mux        ;
        ram_readdata_mux_2d         <=  ram_readdata_mux_1d     ;
        ram_rd_valid_1d             <=  ram_rd_valid            ;
        ram_rd_valid_2d             <=  ram_rd_valid_1d         ;
        ram_rd_valid_3d             <=  ram_rd_valid_2d         ;
        ram_rd_valid_4d             <=  ram_rd_valid_3d         ;
        ram_rd_valid_5d             <=  ram_rd_valid_4d         ;
        ram_rd_valid_6d             <=  ram_rd_valid_5d         ;
        ram_rd_valid_7d             <=  ram_rd_valid_6d         ;
        ram_rd_valid_8d             <=  ram_rd_valid_7d         ;
        lte_sfn_sf_in_latch_1d      <=  lte_sfn_sf_in_latch     ;
        lte_sfn_sf_in_latch_2d      <=  lte_sfn_sf_in_latch_1d  ;
        lte_sfn_sf_in_latch_3d      <=  lte_sfn_sf_in_latch_2d  ;
        lte_sfn_sf_in_latch_4d      <=  lte_sfn_sf_in_latch_3d  ;
        lte_sfn_sf_in_latch_5d      <=  lte_sfn_sf_in_latch_4d  ;
        lte_sfn_sf_in_latch_6d      <=  lte_sfn_sf_in_latch_5d  ;
        lte_sfn_sf_in_latch_7d      <=  lte_sfn_sf_in_latch_6d  ;
        ram_interleave_index_1ms_1d <=  ram_interleave_index_1ms    ;
        ram_interleave_index_1ms_2d <=  ram_interleave_index_1ms_1d ;
        ram_interleave_index_1ms_3d <=  ram_interleave_index_1ms_2d ;
        ram_interleave_index_1ms_4d <=  ram_interleave_index_1ms_3d ;
        ram_interleave_index_1ms_5d <=  ram_interleave_index_1ms_4d ;
        ram_interleave_index_1ms_6d <=  ram_interleave_index_1ms_5d ;
        ram_interleave_index_1ms_7d <=  ram_interleave_index_1ms_6d ;
        ram_interleave_index_1ms_8d <=  ram_interleave_index_1ms_7d ;
        ram_rd_sop_1d               <=  ram_rd_sop              ;
        ram_rd_sop_2d               <=  ram_rd_sop_1d           ;
        ram_rd_sop_3d               <=  ram_rd_sop_2d           ;
        ram_rd_sop_4d               <=  ram_rd_sop_3d           ;
        ram_rd_sop_5d               <=  ram_rd_sop_4d           ;
        ram_rd_sop_6d               <=  ram_rd_sop_5d           ;
        ram_rd_sop_7d               <=  ram_rd_sop_6d           ;
        ram_rd_sop_8d               <=  ram_rd_sop_7d           ;
        ram_rd_eop_1d               <=  ram_rd_eop              ;
        ram_rd_eop_2d               <=  ram_rd_eop_1d           ;
        ram_rd_eop_3d               <=  ram_rd_eop_2d           ;
        ram_rd_eop_4d               <=  ram_rd_eop_3d           ;
        ram_rd_eop_5d               <=  ram_rd_eop_4d           ;
        ram_rd_eop_6d               <=  ram_rd_eop_5d           ;
        ram_rd_eop_7d               <=  ram_rd_eop_6d           ;
        ram_rd_eop_8d               <=  ram_rd_eop_7d           ;
        ram_rd_sym_1d               <=  ram_rd_sym + start_symbol     ;
        ram_rd_sym_2d               <=  ram_rd_sym_1d           ;
 		ram_rd_sym_3d               <=  ram_rd_sym_2d    		;
        ram_rd_sym_4d               <=  ram_rd_sym_3d    		;
		ram_rd_sym_5d               <=  ram_rd_sym_4d    		;
        ram_rd_sym_6d               <=  ram_rd_sym_5d    		;
		ram_rd_sym_7d               <=  ram_rd_sym_6d    		;
		ram_rd_seq_1d               <=  ram_rd_seq              ;
        ram_rd_seq_2d               <=  ram_rd_seq_1d           ;
		ram_rd_seq_3d               <=  ram_rd_seq_2d           ;
		ram_rd_seq_4d               <=  ram_rd_seq_3d           ;
		ram_rd_seq_5d               <=  ram_rd_seq_4d           ;
		ram_rd_seq_6d               <=  ram_rd_seq_5d           ;
		ram_rd_seq_7d               <=  ram_rd_seq_6d           ;
        slot_id_1d                  <=  slot_id              	;
        slot_id_2d                  <=  slot_id_1d           	;
		frame_num_1d				<=	frame_num				;
		frame_num_2d				<=	frame_num_1d			;
		subframe_num_1d				<=	subframe_num			;
		subframe_num_2d				<=	subframe_num_1d			;
        ram_rdcount_limit_1d        <=  ram_rdcount_limit       ;
        ram_rdcount_limit_2d        <=  ram_rdcount_limit_1d    ;
        ram_rd_fft_1d               <=  ram_rd_fft              ;
        ram_rd_fft_2d               <=  ram_rd_fft_1d           ;
        ram_rd_fft_3d               <=  ram_rd_fft_2d           ;
        ram_rd_fft_4d               <=  ram_rd_fft_3d           ;
        ram_rd_fft_5d               <=  ram_rd_fft_4d           ;
        ant_interleave_max_bytes_1d <=  ant_interleave_max_bytes    ;
        ant_interleave_max_bytes_2d <=  ant_interleave_max_bytes_1d ;
        ant_interleave_max_bytes_3d <=  ant_interleave_max_bytes_2d ;
        ant_interleave_max_bytes_4d <=  ant_interleave_max_bytes_3d ;
        ant_interleave_max_bytes_5d <=  ant_interleave_max_bytes_4d ;
	numprbu_1d                  <=  num_prbu;
	numprbu_2d                  <=  numprbu_1d;
	numprbu_3d                  <=  numprbu_2d;
	numprbu_4d                  <=  numprbu_3d;
	numprbu_5d                  <=  numprbu_4d;
	numprbu_6d                  <=  numprbu_5d;
	numprbu_7d                  <=  numprbu_6d;
	numprbu_8d                  <=  numprbu_7d;
	
	startprbu_1d                <=  start_prbu;
	startprbu_2d                <=  startprbu_1d;
	startprbu_3d                <=  startprbu_2d;
	startprbu_4d                <=  startprbu_3d;
	startprbu_5d                <=  startprbu_4d;
	startprbu_6d                <=  startprbu_5d;
	startprbu_7d                <=  startprbu_6d;
	frag_disable_1d             <=  frag_disable;
	frag_disable_2d             <=  frag_disable_1d;
	udcompparam_1d              <=  'd0;
	udcompparam_2d              <=  udcompparam_1d;
	numberofsections_1d         <= 'd0;
	numberofsections_2d         <= numberofsections_1d;
	frame_status_1d             <= frame_status;
	frame_status_2d             <= frame_status_1d;
	ram_rd_iteration_last_1d    <= ram_rd_iteration_last;
        ram_rd_fft_last_1d          <= ram_rd_fft_last      ; 
	ram_readdata_timing_mux_1d  <= ram_readdata_timing_mux        ;
    ram_readdata_timing_mux_2d  <= ram_readdata_timing_mux_1d    ;
    avst_sink_valid_1d_dup1     <= avst_sink_valid              ;
    avst_sink_valid_2d_dup1     <= avst_sink_valid_1d_dup1           ;
	avst_sink_valid_3d_dup1     <= avst_sink_valid_2d_dup1           ;
	valid_pos_edge_1d			<= valid_pos_edge				;
	timing_reference_1d         <= {3'b0,timing_reference[28:0],3'b0,timing_reference[28:0]}		;
	timing_reference_2d         <= timing_reference_1d;
	timing_reference_3d         <= timing_reference_2d; 
	
	end 
end

    
assign valid_pos_edge = avst_sink_valid_2d_dup1 & ~avst_sink_valid_3d_dup1 ;


always @ (posedge clk_eth)//clk_dsp
begin : RAM_TIMING_REFERENCE
    if(~rst_eth_n)//rst_dsp_n
    begin	
        start_symbol <=  'd0        ;
        max_symbol   <=  'd0        ;
    end
    else //else if(valid_pos_edge)
    begin
        max_symbol   <=  ff_readdata_timing[0][7:4]; //timing_reference_2d[7:4];        
	start_symbol 	<=  ff_readdata_timing[0][3:0];//timing_reference_2d[3:0];
    end
end

assign start_prbu =8'd0;
assign num_prbu = 8'd12;


always @ (posedge clk_eth)
begin : RAM_READY_ALL
    if(~rst_eth_n) 
        ram_rdready_all <=  1'b0        ;
    else 
        ram_rdready_all <=  &ram_rdready;
end


always @ (posedge clk_eth)
begin : RAM_READ_ENABLE
    if(~rst_eth_n) 
        ram_rdenable <=  1'b0   ;
    else if (~ram_rdenable)
        ram_rdenable <=  ram_rdready_all   ;
    else if (ram_rdcount == ((36*NUM_OF_FFT) ))  //12*12*32/128 - 36  reading 2 Axcs of one symbol
        ram_rdenable <=  1'b0   ;
end

always @ (posedge clk_eth)
begin : RAM_READ_COUNT
    if(~rst_eth_n) 
        ram_rdcount <=  15'b0   ;
    else if (~ram_rdenable)
        ram_rdcount <=  15'b0   ;
    else if (ram_rd_valid)
        ram_rdcount <=  ram_rdcount + 1'b1  ;
end


always @ (posedge clk_eth)
begin : RAM_WAIT_ENABLE
    if(~rst_eth_n) 
        ram_waitenable  <=  1'b0   ;
    else if (ram_rd_eop)
        ram_waitenable  <=  1'b1   ;
    else if (ram_waitcount == (ETH_WAIT_CYCLE-1))
        ram_waitenable  <=  1'b0   ;
end


always @ (posedge clk_eth)
begin : RAM_WAIT_COUNT
    if(~rst_eth_n) 
        ram_waitcount   <=  16'b0   ;
    else if (ram_waitenable)
        ram_waitcount   <=  ram_waitcount + 1'b1   ;
    else
	
        ram_waitcount   <=  16'b0   ;
end


always @ (posedge clk_eth)
begin : RAM_READ_INTERLEAVE_COUNT
    if(~rst_eth_n) 
        ram_rdcount_interleave  <=  12'b0   ;
    else if (ram_rd_eop)
        ram_rdcount_interleave  <=  12'b0  ; // 0 for every end of packets
    else if (ram_rd_valid)
        ram_rdcount_interleave  <=  ram_rdcount_interleave + 1'b1  ; // increment upto 12Prb's address count
end

always @ (posedge clk_eth)
begin : RAM_ITERATION
    if(~rst_eth_n) 
        ram_rd_iteration    <=  'b0   ;
    else if ( ram_rdenable_falling & ram_rd_iteration_last) // reset after 8 Axcs
        ram_rd_iteration    <=  'b0   ;
    else if (ram_rdenable_falling)
        ram_rd_iteration    <=  ram_rd_iteration + 'b1   ; // increament for every 2 axcs of 12 prb 
end

 always @ (posedge clk_eth)
begin : RAM_READ_ITERATION_LAST
    if(~rst_eth_n) 
        ram_rd_iteration_last   <=  1'b0   ;
    else 
        ram_rd_iteration_last   <=  (ram_rd_iteration == (NUM_OF_ANT/NUM_OF_FFT)-1);//8/2 --> 4 interation to read 8 axcs
end

always @ (posedge clk_eth)
begin : RAM_FFT
    if(~rst_eth_n) 
        ram_rd_fft  <=  2'b0   ;
    else if (ram_rd_eop & ram_rd_fft_last)
        ram_rd_fft  <=  2'b0   ;
    else if (ram_rd_eop)
        ram_rd_fft  <=  ram_rd_fft + 2'b1   ; // switch read buffer alternatively
end

always @ (posedge clk_eth)
begin : RAM_READ_FFT_LAST
    if(~rst_eth_n) 
        ram_rd_fft_last <=  1'b0   ;
    else 
        ram_rd_fft_last <=  (ram_rd_fft == (NUM_OF_FFT-1))  ;
end

always @ (posedge clk_eth)
begin : RAM_READ_ANT_LAST
    if(~rst_eth_n) 
        ram_rd_ant_last <=  1'b0   ;
    else 
        ram_rd_ant_last <=  (ram_rd_ant == (MAX_ANT-1))  ;
end

always @ (posedge clk_eth)
begin : RAM_ANT
    if(~rst_eth_n) 
        ram_rd_ant  <=  'd8   ; // 0-7 pusch , 8-15 prach
    else if (ram_rd_eop  & ram_rd_ant_last )
        ram_rd_ant  <=  'd8   ;
	else if (ram_rd_eop)
	    ram_rd_ant  <=  ram_rd_ant + 'b1   ;
end		
		
//Symbol 27 
always @ (posedge clk_eth)
begin : RAM_SYM_LAST
    if(~rst_eth_n) 
        ram_rd_sym_last <=  1'b0   ;
    else
        ram_rd_sym_last <=  (ram_rd_sym == (max_symbol - 1'b1)) ;
end


always @ (posedge clk_eth) begin
    if(~rst_eth_n) 
       start_symbol_d <= 4'b0;
    else
       start_symbol_d <= start_symbol;
end

assign start_symbol_edge = | ((start_symbol & (~start_symbol_d))  |  ((~start_symbol) & start_symbol_d) );


//Symbol Count
always @ (posedge clk_eth)
begin : RAM_SYM
    if(~rst_eth_n) 
        ram_rd_sym  <=  0; //start_symbol  
    //else if (start_symbol_edge)
    //    ram_rd_sym  <= start_symbol;
    else if (ram_rdenable_falling & ram_rd_iteration_last & ram_rd_sym_last)
        ram_rd_sym  <=  0; //start_symbol  
    else if (ram_rdenable_falling & ram_rd_iteration_last)
        ram_rd_sym  <=  ram_rd_sym + 4'b1 ;
end


always @ (posedge clk_eth)
begin : SEQ_ID
    if(~rst_eth_n) 
        ram_rd_seq  <=  'b0   ;
    else if (ram_rdenable_falling & ram_rd_iteration_last_1d & ram_rd_fft_last_1d)
        ram_rd_seq  <=  ram_rd_seq + 'b1 ;
end


//Generate Statement
generate
genvar fft_num;
for(fft_num=0; fft_num < NUM_OF_FFT; fft_num = fft_num+1)
begin:FFT_SLICE

    assign ff_wrreq         [fft_num] = avst_sink_valid_3d [fft_num];
    assign ff_writedata     [fft_num] = avst_sink_data_3d [fft_num*DSP_IQ_DATAWIDTH+:DSP_IQ_DATAWIDTH];
    assign ff_rdreq         [fft_num] = ~ff_rdempty [fft_num]        ;
	assign ff_rdreq_timing  [fft_num] = ~ff_rdempty_timing [fft_num]       ;
	assign ff_timing_ref 	[fft_num] = dsp_timing_reference_3d [fft_num*DSP_IQ_DATAWIDTH+:DSP_IQ_DATAWIDTH];
	
    assign ram_writedata    [fft_num] = ff_readdata_2d  [fft_num]   ;
    assign ram_wrreq        [fft_num] = ff_rdreq_3d     [fft_num] & ~ram_wrfull[fft_num]  ;
    assign ram_rdreq        [fft_num] = ram_rd_valid & (ram_rd_fft == fft_num) & ~ram_rdempty[fft_num] ;
	
	assign ram_writedata_timing    [fft_num] = ff_readdata_timing_2d  [fft_num]   ;
	assign sc_fifo_full               [fft_num] = ram_wrfull_2d [fft_num];
	assign sc_fifo_full_time_ref      [fft_num] = ram_wrfull_timing_2d [fft_num];
    always @ (posedge clk_dsp)
    begin : DSP_PIPE_DELAY
        if (~rst_dsp_n) 
        begin
            ff_wrreq_1d     [fft_num]   <=  1'b0 ;
            ff_wrreq_2d     [fft_num]   <=  1'b0 ;
            ff_wrreq_3d     [fft_num]   <=  1'b0 ;
            ff_wrreq_4d     [fft_num]   <=  1'b0 ;
            ff_wrreq_5d     [fft_num]   <=  1'b0 ;
            ff_wrreq_6d     [fft_num]   <=  1'b0 ;
			add_pul_1d      [fft_num]   <=  1'b0 ;
			add_pul_2d      [fft_num]   <=  1'b0 ;
            ff_writedata_1d [fft_num]   <=  {ETH_IQ_DATAWIDTH{1'b0}}    ;
            ff_writedata_2d [fft_num]   <=  {ETH_IQ_DATAWIDTH{1'b0}}    ;
            ff_writedata_3d [fft_num]   <=  {ETH_IQ_DATAWIDTH{1'b0}}    ;
            ff_writedata_4d [fft_num]   <=  {ETH_IQ_DATAWIDTH{1'b0}}    ;
            ff_writedata_5d [fft_num]   <=  {ETH_IQ_DATAWIDTH{1'b0}}    ;
            ff_writedata_6d [fft_num]   <=  {ETH_IQ_DATAWIDTH{1'b0}}    ;
        end 
        else 
        begin 
            ff_wrreq_1d     [fft_num]   <=  ff_wrreq        [fft_num]   ;
            ff_wrreq_2d     [fft_num]   <=  ff_wrreq_1d     [fft_num]   ;
            ff_wrreq_3d     [fft_num]   <=  ff_wrreq_2d     [fft_num]   ;
            ff_wrreq_4d     [fft_num]   <=  ff_wrreq_3d     [fft_num]   ;
            ff_wrreq_5d     [fft_num]   <=  ff_wrreq_4d     [fft_num]   ;
            ff_wrreq_6d     [fft_num]   <=  ff_wrreq_5d     [fft_num]   ;
			add_pul_1d      [fft_num]   <=  add_pul         [fft_num]   ;
			add_pul_2d      [fft_num]   <=  add_pul_1d      [fft_num]   ;
			
            ff_writedata_1d [fft_num]   <=  {ff_timing_ref	[fft_num], ff_writedata	[fft_num] } ;
            ff_writedata_2d [fft_num]   <=  ff_writedata_1d [fft_num]   ;
            ff_writedata_3d [fft_num]   <=  ff_writedata_2d [fft_num]   ;
            ff_writedata_4d [fft_num]   <=  ff_writedata_3d [fft_num]   ;
            ff_writedata_5d [fft_num]   <=  ff_writedata_4d [fft_num]   ;
            ff_writedata_6d [fft_num]   <=  ff_writedata_5d [fft_num]   ;
        end      
    end
    
    
    ff_32i_128o_8d_dc u_ff_32i_128o_8d_dc(   
		.data       (ff_writedata_6d    [fft_num][31:0]   ),  
		.wrreq      (ff_wrreq_6d        [fft_num]   ),  
		.rdreq      (ff_rdreq           [fft_num]   ),  
		.wrclk      (clk_dsp                        ),  
		.rdclk      (clk_eth                        ), 
        .aclr       (~rst_dsp_n						),		
		.q          (ff_readdata        [fft_num]   ),  
		.rdempty    (ff_rdempty         [fft_num]   )   
	);
	
	ff_32i_128o_8d_dc u_ff_32i_128o_8d_prach_time_ref_dc (
		.data    (ff_writedata_6d    [fft_num][63:32]	),   //   input,  width = 32,  fifo_input.datain
		.wrreq   (ff_wrreq_6d        [fft_num]   		),   //   input,   width = 1,            .wrreq
		.rdreq   (ff_rdreq_timing    [fft_num]   		),   //   input,   width = 1,            .rdreq
		.wrclk   (clk_dsp								),   //   input,   width = 1,            .wrclk
		.rdclk   (clk_eth								),   //   input,   width = 1,            .rdclk
		.aclr    (~rst_dsp_n					      	),
		.q       (ff_readdata_timing [fft_num]   		),   //  output,  width = 32, fifo_output.dataout
		.rdempty (ff_rdempty_timing  [fft_num]  		)    //  output,   width = 1,            .rdempty
	);
    
    ff_128i_128o_2048d_sc u_ff_128i_128o_2048d_prach_sc(  // 16K
		.data       (ram_writedata_3d   [fft_num]   ),  
		.wrreq      (ram_wrreq_3d       [fft_num]   ),  
		.rdreq      (ram_rdreq_2d       [fft_num]   ),  
		.clock      (clk_eth                        ),  
		.aclr       (~rst_eth_n                     ),  
		.q          (ram_readdata       [fft_num]   ),  
		.usedw      (ram_rdusedw        [fft_num]   ),  
		.full       (ram_wrfull         [fft_num]   ),  
		.empty      (ram_rdempty        [fft_num]   )   
	);
	
	ff_128i_128o_2048d_sc u_ff_128i_128o_2048d_prach_time_ref_sc (
		.data  (ram_writedata_timing_3d [fft_num]),  //   input,  width = 32,  fifo_input.datain
		.wrreq (ram_wrreq_3d       		[fft_num]   ), //   input,   width = 1,            .wrreq
		.rdreq (ram_rdreq_2d       		[fft_num]   ), //   input,   width = 1,            .rdreq
		.clock (clk_eth                        		), //   input,   width = 1,            .clk
		.aclr  (~rst_eth_n                    		),  //   input,   width = 1,            .aclr
		.q     (ram_readdata_timing		[fft_num]   ),     //  output,  width = 32, fifo_output.dataout
		.usedw (ram_rdusedw_timing      [fft_num]   ), //  output,  width = 10,            .usedw
		.full  (ram_wrfull_timing       [fft_num]   ),  //  output,   width = 1,            .full
		.empty (ram_rdempty_timing      [fft_num]   )  //  output,   width = 1,            .empty
	);

	
    
    
    always @ (posedge clk_eth)
    begin : ETH_PIPE_DELAY
        if (rst_eth_n == 1'b0) 
        begin 
            ff_rdreq_1d             [fft_num]   <=  1'b0                    ;
            ff_rdreq_2d             [fft_num]   <=  1'b0                    ;
            ff_rdreq_3d             [fft_num]   <=  1'b0                    ;
            ff_readdata_1d          [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ff_readdata_2d          [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ram_wrreq_1d            [fft_num]   <=  1'b0                    ;
            ram_wrreq_2d            [fft_num]   <=  1'b0                    ;
            ram_wrreq_3d            [fft_num]   <=  1'b0                    ;
            ram_writedata_1d        [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ram_writedata_2d        [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ram_writedata_3d        [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ram_rdreq_1d            [fft_num]   <= 1'b0                     ;
            ram_rdreq_2d            [fft_num]   <= 1'b0                     ;
            ram_rdreq_3d            [fft_num]   <= 1'b0                     ;
            ram_rdreq_4d            [fft_num]   <= 1'b0                     ;
            ram_rdreq_5d            [fft_num]   <= 1'b0                     ;
            ram_readdata_1d         [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ram_readdata_2d         [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ram_rdusedw_1d          [fft_num]   <= 11'b0                    ;
            ram_rdusedw_2d          [fft_num]   <= 11'b0                    ;
			ff_readdata_timing_1d   [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} 	;
            ff_readdata_timing_2d   [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} 	;
			ram_writedata_timing_1d [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} 	;
            ram_writedata_timing_2d [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} 	;
            ram_writedata_timing_3d [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} 	;
			ram_readdata_timing_1d  [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} 	;
            ram_readdata_timing_2d  [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} 	;
            ram_rdusedw_timing_1d   [fft_num]   <= 11'b0                    ;
            ram_rdusedw_timing_2d   [fft_num]   <= 11'b0                    ;
			ram_wrfull_timing_1d    [fft_num]   <= 2'b0                    ;
			ram_wrfull_timing_2d 	[fft_num]   <= 2'b0                    ;
			ram_wrfull_1d     		[fft_num]   <= 2'b0                    ;
			ram_wrfull_2d 			[fft_num]   <= 2'b0                    ;
        end 
        else 
        begin
            ff_rdreq_1d             [fft_num]   <= ff_rdreq             	[fft_num]   ;
            ff_rdreq_2d             [fft_num]   <= ff_rdreq_1d          	[fft_num]   ;
            ff_rdreq_3d             [fft_num]   <= ff_rdreq_2d          	[fft_num]   ;
            ff_readdata_1d          [fft_num]   <= ff_readdata          	[fft_num]   ;
            ff_readdata_2d          [fft_num]   <= ff_readdata_1d       	[fft_num]   ;
            ram_wrreq_1d            [fft_num]   <= ram_wrreq            	[fft_num]   ;
            ram_wrreq_2d            [fft_num]   <= ram_wrreq_1d         	[fft_num]   ;
            ram_wrreq_3d            [fft_num]   <= ram_wrreq_2d         	[fft_num]   ;
            ram_writedata_1d        [fft_num]   <= ram_writedata        	[fft_num]   ;
            ram_writedata_2d        [fft_num]   <= ram_writedata_1d     	[fft_num]   ;
            ram_writedata_3d        [fft_num]   <= ram_writedata_2d     	[fft_num]   ;
            ram_rdreq_1d            [fft_num]   <= ram_rdreq            	[fft_num]   ;
            ram_rdreq_2d            [fft_num]   <= ram_rdreq_1d         	[fft_num]   ;
            ram_rdreq_3d            [fft_num]   <= ram_rdreq_2d         	[fft_num]   ;
            ram_rdreq_4d            [fft_num]   <= ram_rdreq_3d         	[fft_num]   ;
            ram_rdreq_5d            [fft_num]   <= ram_rdreq_4d         	[fft_num]   ;
            ram_readdata_1d         [fft_num]   <= ram_readdata         	[fft_num]   ;
            ram_readdata_2d         [fft_num]   <= ram_readdata_1d      	[fft_num]   ;
            ram_rdusedw_1d          [fft_num]   <= ram_rdusedw          	[fft_num]   ;
            ram_rdusedw_2d          [fft_num]   <= ram_rdusedw_1d       	[fft_num]   ;
			ff_readdata_timing_1d   [fft_num]   <= ff_readdata_timing		[fft_num]	;
            ff_readdata_timing_2d   [fft_num]   <= ff_readdata_timing_1d	[fft_num]	;
			ram_writedata_timing_1d [fft_num]   <= ram_writedata_timing		[fft_num]	;
            ram_writedata_timing_2d [fft_num]   <= ram_writedata_timing_1d	[fft_num]	;
            ram_writedata_timing_3d [fft_num]   <= ram_writedata_timing_2d	[fft_num]	;
			ram_readdata_timing_1d  [fft_num]   <= ram_readdata_timing		[fft_num]	;
            ram_readdata_timing_2d  [fft_num]   <= ram_readdata_timing_1d	[fft_num]	;
            ram_rdusedw_timing_1d   [fft_num]   <= ram_rdusedw_timing		[fft_num]	;
            ram_rdusedw_timing_2d   [fft_num]   <= ram_rdusedw_timing_1d	[fft_num]	;
			ram_wrfull_timing_1d    [fft_num]   <= ram_wrfull_timing  [fft_num]                  ;
			ram_wrfull_timing_2d 	[fft_num]   <= ram_wrfull_timing_1d  [fft_num]                  ;
			ram_wrfull_1d     		[fft_num]   <= ram_wrfull  [fft_num]                  ;
			ram_wrfull_2d 			[fft_num]   <= ram_wrfull_1d [fft_num]                   ;
		end      
    end
	
     always @ (posedge clk_eth)
    begin : RAM_READY
        if(~rst_eth_n) 
            ram_rdready [fft_num]    <=  1'b0    ;
        else 
            ram_rdready [fft_num]   <=  (ram_rdusedw_2d  [fft_num] > 10'd35) ; //1 axc of data
    end 

end
endgenerate



//Output mux
always @ (posedge clk_eth)
begin : RAM_READDATA_MUX
    if(~rst_eth_n) 
        ram_readdata_mux    <=  {ETH_IQ_DATAWIDTH{1'b0}}        ;
    else 
        ram_readdata_mux    <=  ram_readdata_2d[ram_rd_fft_5d]  ;
end

//Output mux
always @ (posedge clk_eth)
begin : RAM_READDATA_TIMING_MUX
    if(~rst_eth_n) 
        ram_readdata_timing_mux    <=  {ETH_IQ_DATAWIDTH{1'b0}}        ;
    else 
        ram_readdata_timing_mux    <=  ram_readdata_timing_2d[ram_rd_fft_5d]  ;
end

assign output_fifo_wrreq    = ram_rd_valid_8d && ~output_fifo_full;
assign output_fifo_data     = { numprbu_8d,startprbu_7d,ram_rd_seq_7d,
                                ram_rd_sym_7d,3'b0,ram_readdata_timing_mux_2d [8],ram_readdata_timing_mux_2d [12:9],ram_readdata_timing_mux_2d [24:17],
                                ram_rd_eop_8d,ram_rd_sop_8d,ram_rd_ant_8d,
                                ram_readdata_mux_2d};
assign output_fifo_rdreq    = avst_source_ready & ~output_fifo_empty ;


scfifo
#(
    .lpm_width                  (OUTPUT_FIFO_WIDTH         	),
    .lpm_widthu                 ($clog2(OUTPUT_FIFO_DEPTH)  ),
    .lpm_numwords               (OUTPUT_FIFO_DEPTH          ),
    .lpm_showahead              ("ON"                       ),
    .lpm_type                   ("SCFIFO"                   ),
    .overflow_checking          ("OFF"                      ),
    .underflow_checking         ("OFF"                      )
) output_fifo
(
    .clock          (clk_eth                ),
    .data           (output_fifo_data       ),
    .rdreq          (output_fifo_rdreq      ),
    .sclr           (~rst_eth_n             ),
    .wrreq          (output_fifo_wrreq      ),
    .q              (output_fifo_q          ),
    .usedw          (output_fifo_usedw      ),
    .aclr           (~rst_eth_n 			),
    .eccstatus      (),
    .full           (output_fifo_full       ),
    .empty          (output_fifo_empty      ),
    .almost_full    (),
    .almost_empty   ()
);


assign  avst_source_valid           = output_fifo_rdreq     ;
assign  avst_source_data            = output_fifo_q[127: 0]  ; 
assign  avst_source_channel         = output_fifo_q[143:128]  ; 
assign  avst_source_startofpacket   = output_fifo_q[ 144]  ; 
assign  avst_source_endofpacket     = output_fifo_q[   145]  ; 

assign  frame_ctrl_data = {output_fifo_q[173:166],output_fifo_q[165:162],output_fifo_q[161:158],4'd0,output_fifo_q[157:154],output_fifo_q[153:146]} ;                  
assign  frame_ctrl_vld  = avst_source_valid ;                   
assign  prb_ctrl_data   = {output_fifo_q[189:182],output_fifo_q[181:174],8'b0,8'b0};                    
assign  prb_ctrl_vld    = avst_source_valid ;

assign  arbiter_request = ~output_fifo_empty ;

endmodule

