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
 
module dl_fdv_buffer
(
    clk_eth                             ,
    rst_eth_n                           ,
    
    clk_dsp                             ,
    rst_dsp_n                           ,

    // Stream Input 
    avst_sink_valid                     ,
    avst_sink_data                      ,
    avst_sink_channel                   ,
    avst_sink_ready                     ,
    avst_sink_endofpacket               ,
    avst_sink_startofpacket             ,
    
    xran_demapper_sts_prb_dout          ,
    xran_demapper_sts_prb_vout          ,

    xran_demapper_sts_frame_dout        , 
    xran_demapper_sts_frame_vout        ,
 
    xran_demapper_c_plane_metad         ,
    xran_demapper_c_plane_metav         ,
    
    xran_demapper_cplane_vout           ,
    xran_demapper_cplane_dout           ,
    xran_demapper_cplane_dout_fo        ,

    // Stream Output
    avst_source_valid_1                 ,
    avst_source_data_1                  ,
    
    avst_source_ready_1                 ,
    
    // Stream Output
    avst_source_valid_2                 ,
    avst_source_data_2                  ,
    
    avst_source_ready_2                 ,

    c_plane_info_valid                    ,
    c_cplength                          ,
    c_fftsize                              ,

    blank_prb_flag                        ,
    blank_prb_intr                        ,
    
    bw_config_cc1                        ,
    bw_config_cc2                        ,
    blanking_dis                        
);

`include "../common/def_param.vh"

//Parameters Declaration
parameter NUM_OF_ANT    =    8             ;
parameter NUM_OF_IF     =    2          ;
parameter NUM_OF_SYM    =    4          ;   //Dont modify
//parameter NUM_OF_DATA_WRITE   =    300        ;    //5 MHz
parameter ETH_DATAWIDTH =    128        ;
parameter DSP_DATAWIDTH =    32         ;
parameter NUM_OF_SYM_FFT =   4             ;
parameter NUM_OF_SF      =   2          ;


`ifdef NUM_CC_ONE
localparam ANT_INCR          =    2      ;
`else
localparam ANT_INCR          =    1      ;
`endif




input                                       clk_eth                        ;
input                                       rst_eth_n                      ;

input                                          clk_dsp                        ;
input                                          rst_dsp_n                      ;


// Stream input
input                                       avst_sink_valid                ;
input   [ETH_DATAWIDTH -1 :0]               avst_sink_data                 ;
input   [15:0]                              avst_sink_channel              ;
input                                       avst_sink_endofpacket          ;
input                                       avst_sink_startofpacket        ;
output                                      avst_sink_ready                ;

// Stream output
output                                      avst_source_valid_1               ;
output  [(NUM_OF_IF*DSP_DATAWIDTH)/2 -1 :0] avst_source_data_1                ;
input                                       avst_source_ready_1               ;

// Stream output
output                                      avst_source_valid_2               ;
output  [(NUM_OF_IF*DSP_DATAWIDTH)/2 -1 :0] avst_source_data_2                ;
input                                       avst_source_ready_2               ;



//de-Mapper  DV Interface 
input   [33:0]                              xran_demapper_sts_prb_dout      ;
input                                       xran_demapper_sts_prb_vout      ;
input   [31:0]                              xran_demapper_sts_frame_dout    ;
input                                       xran_demapper_sts_frame_vout    ;
input   [49:0]                              xran_demapper_c_plane_metad     ;
input                                       xran_demapper_c_plane_metav     ;

//C plane            
input                                       xran_demapper_cplane_vout       ;           
input   [23:0]                               xran_demapper_cplane_dout       ;           
input   [23:0]                               xran_demapper_cplane_dout_fo    ;

output                                         c_plane_info_valid                ;
output     [15:0]                                c_cplength                        ;
output    [3:0]                                c_fftsize                        ;

output                                         blank_prb_intr                    ;
output  [31:0]                                 blank_prb_flag                    ;

input     [7:0]                                bw_config_cc1                    ;
input     [7:0]                                bw_config_cc2                    ; 

input                                          blanking_dis                     ;


//Internal Wire and Variables
wire                                        avst_sink_ready                 ;

wire                                        avst_source_valid_1             ;
wire                                        avst_source_valid_2             ;

reg     [(NUM_OF_IF*DSP_DATAWIDTH)/2 -1 :0] avst_source_data_1              ;
reg     [(NUM_OF_IF*DSP_DATAWIDTH)/2 -1 :0] avst_source_data_2              ;




reg                                         avst_sink_valid_1d              ;  
reg                                         avst_sink_valid_2d              ;  
reg                                         avst_sink_valid_3d              ; 
reg                                         avst_sink_valid_4d              ; 
reg                                         avst_sink_valid_5d              ; 
reg [NUM_OF_ANT-1:0]        avst_sink_valid_6d         [NUM_OF_SYM-1:0]; 

reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_1d               ;
//reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_2d               ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_2d_dup1          ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_2d_dup2          ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_2d_dup3          ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_2d_dup4          ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_2d_dup5          ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_2d_dup6          ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_3d_0 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]   ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_3d_1 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]   ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_3d_2 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]   ;
reg     [ETH_DATAWIDTH -1 :0]               avst_sink_data_3d_3 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]   ;

reg     [15 :0]                              avst_sink_channel_1d                    ;
reg     [15 :0]                              avst_sink_channel_2d                    ;
reg     [15 :0]                              avst_sink_channel_3d                    ;
reg     [15 :0]                              avst_sink_channel_4d                    ;
        
reg                                         avst_sink_endofpacket_1d                ;  
reg                                         avst_sink_endofpacket_2d                ;  
reg                                         avst_sink_endofpacket_3d                ; 
                    
reg                                         avst_sink_startofpacket_1d              ;  
reg                                         avst_sink_startofpacket_2d              ;  
reg                                         avst_sink_startofpacket_3d              ; 
reg                                         avst_sink_startofpacket_4d              ; 
reg                                         avst_sink_startofpacket_5d              ; 
reg                                         avst_sink_startofpacket_6d              ; 

reg     [31:0]                               xran_demapper_sts_frame_dout_1d          ;
reg     [31:0]                               xran_demapper_sts_frame_dout_dup1          ;
reg     [31:0]                               xran_demapper_sts_frame_dout_2d          ;
reg     [31:0]                               xran_demapper_sts_frame_dout_2d_dup1     ;
reg     [31:0]                               xran_demapper_sts_frame_dout_2d_dup2     ;

reg                                         xran_demapper_sts_frame_vout_1d         ;
reg                                         xran_demapper_sts_frame_vout_2d             ;
reg                                         xran_demapper_sts_frame_vout_1d_dup1     ;
reg     [NUM_OF_ANT-1:0]                    xran_demapper_sts_frame_vout_2d_dup1  [NUM_OF_SYM-1:0] ;
reg     [NUM_OF_ANT-1:0]                    xran_demapper_sts_frame_vout_2d_dup2  [NUM_OF_SYM-1:0] ;
            
reg     [NUM_OF_ANT-1:0]                    xran_demapper_sts_prb_vout_2d_dup1     [NUM_OF_SYM-1:0] ;
reg     [NUM_OF_ANT-1:0]                    xran_demapper_sts_prb_vout_2d_dup1_1d  [NUM_OF_SYM-1:0] ;
reg     [NUM_OF_ANT-1:0]                    xran_demapper_sts_prb_vout_2d_dup1_2d  [NUM_OF_SYM-1:0] ;
reg     [NUM_OF_ANT-1:0]                    xran_demapper_sts_prb_vout_2d_dup1_3d  [NUM_OF_SYM-1:0] ;
reg     [NUM_OF_ANT-1:0]                    xran_demapper_sts_prb_vout_2d_dup1_4d  [NUM_OF_SYM-1:0] ;
reg     [NUM_OF_ANT-1:0]                    xran_demapper_sts_prb_vout_2d_dup1_5d  [NUM_OF_SYM-1:0] ;


reg     [33:0]                              xran_demapper_sts_prb_dout_1d   ;
reg     [33:0]                              xran_demapper_sts_prb_dout_2d   ;
reg     [33:0]                              xran_demapper_sts_prb_dout_3d   ;
reg     [33:0]                              xran_demapper_sts_prb_dout_4d   ;
reg     [33:0]                              xran_demapper_sts_prb_dout_5d   ;
            
reg                                         xran_demapper_sts_prb_vout_1d   ;
reg                                         xran_demapper_sts_prb_vout_2d   ;
reg                                         xran_demapper_sts_prb_vout_3d   ;
reg                                         xran_demapper_sts_prb_vout_4d   ;
reg                                         xran_demapper_sts_prb_vout_5d   ;
reg 	[NUM_OF_ANT-1:0]        xran_demapper_sts_prb_vout_6d         [NUM_OF_SYM-1:0];
            
reg                                         xran_demapper_cplane_vout_1d       ;  
reg                                         xran_demapper_cplane_vout_2d       ;          
reg    [23:0]                               xran_demapper_cplane_dout_1d       ;
reg    [23:0]                               xran_demapper_cplane_dout_2d       ;             
reg    [23:0]                               xran_demapper_cplane_dout_fo_1d    ;
reg    [23:0]                               xran_demapper_cplane_dout_fo_2d    ;
            
            
            
reg     [7:0]                               avst_sink_symbolid_dup1 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]            ;
reg     [7:0]                               avst_sink_symbolid_dup2 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]             ;
            
reg     [9:0]                               avst_sink_rbstart                   ;
reg     [9:0]                               avst_sink_rbstart_1d                   ;
reg     [9:0]                               avst_sink_rbstart_2d                   ;
reg     [9:0]                               avst_sink_rbstart_3d                   ;
reg     [7:0]                               avst_sink_numprb                       ;
reg                                         avst_sink_rbstart_zero              ;
reg     [NUM_OF_ANT-1:0]                      avst_sink_rbstart_zero_1d[NUM_OF_SYM-1:0]       ;
reg     [NUM_OF_ANT-1:0]                      avst_sink_rbstart_zero_2d[NUM_OF_SYM-1:0]       ;

reg     [7:0]                               avst_sink_numprb_1d               ;
reg     [7:0]                               avst_sink_numprb_2d               ;

reg     [ETH_DATAWIDTH-1:0]     ram_writedata       [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_1d    [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_2d    [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_3d    [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_4d    [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_5d    [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;

wire    [DSP_DATAWIDTH-1:0]     ram_readdata        [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [DSP_DATAWIDTH-1:0]     ram_readdata_1d     [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [DSP_DATAWIDTH-1:0]     ram_readdata_2d     [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [DSP_DATAWIDTH-1:0]     ram_readdata_2d_dup [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [DSP_DATAWIDTH-1:0]     ram_readdata_2d_dup_1d [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0] ;
reg     [3:0]                     temp                 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;

reg     [NUM_OF_ANT-1:0]        ram_wren            [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_wren_1d         [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_wren_2d         [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_wren_3d         [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_wren_4d         [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_wren_5d         [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        avst_sink_startofpacket_6d_dup1         [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        avst_sink_startofpacket_6d_dup2         [NUM_OF_SYM-1:0]                    ;

reg     [NUM_OF_ANT-1:0]        ram_rden                       [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_1d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_2d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_2d_dup                [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_3d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_4d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_5d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_6d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_7d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_8d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_9d                    [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_dup_1d             [NUM_OF_SYM-1:0]                    ;
reg     [NUM_OF_ANT-1:0]        ram_rden_dup_2d             [NUM_OF_SYM-1:0]                    ;

reg     [3:0]                   avst_source_axc_1d_dup1     [NUM_OF_SYM-1:0] [NUM_OF_ANT-1:0]   ;
reg     [3:0]                   avst_source_axc_1d_dup2     [NUM_OF_SYM-1:0] [NUM_OF_ANT-1:0]   ;
reg     [3:0]                   avst_source_axc_1d_dup3     [NUM_OF_SYM-1:0] [NUM_OF_ANT-1:0]   ;
reg     [3:0]                   avst_source_axc_1d_dup4     [NUM_OF_SYM-1:0] [NUM_OF_ANT-1:0]   ;

reg     [9:0]                   ram_wraddress               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [9:0]                   ram_wraddress_1d            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [9:0]                   ram_wraddress_2d            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_1d               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_2d               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_3d               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_4d               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_5d               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_6d               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_7d               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_dup_1d        [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;
reg     [11:0]                  ram_rdaddress_dup_2d        [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]    ;


reg     [11:0]                  avst_source_ready_1_count_dup1                                     ;
reg     [11:0]                  avst_source_ready_1_count_dup2                                     ;
wire                            avst_source_ready_1_count_last                                    ;
wire                            avst_source_ready_1_count_first                                    ;

reg     [11:0]                  avst_source_ready_2_count_dup1                                     ;
reg     [11:0]                  avst_source_ready_2_count_dup2                                     ;
wire                            avst_source_ready_2_count_last                                    ;
wire                            avst_source_ready_2_count_first                                    ;




reg      [3:0]                  avst_source_symbol_1                                              ;
reg      [3:0]                  avst_source_symbol_1_1d                                           ;
reg      [3:0]                  avst_source_symbol_2                                              ;
reg      [3:0]                  avst_source_symbol_2_1d                                           ;
reg      [3:0]                  avst_source_symbol_1d_dup1[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg      [3:0]                  avst_source_symbol_1d_dup2[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg      [3:0]                  avst_source_symbol_1d_dup3[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg      [3:0]                  avst_source_symbol_1d_dup4[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg      [3:0]                  avst_source_symbol_1d_dup5[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg      [3:0]                  avst_source_symbol_1d_dup6[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg      [3:0]                  avst_source_symbol_1_2d                                   ;
reg      [3:0]                  avst_source_symbol_1_3d                                   ;
reg      [3:0]                  avst_source_symbol_1_4d                                   ;
reg      [3:0]                  avst_source_symbol_1_5d                                   ;
reg      [3:0]                  avst_source_symbol_1_6d                                   ;
reg      [3:0]                  avst_source_symbol_1_7d                                   ;
reg      [3:0]                  avst_source_symbol_1_8d                                   ;
reg      [3:0]                  avst_source_symbol_1_9d                                   ;
reg      [3:0]                  avst_source_symbol_1_10d                                  ;
reg      [3:0]                  avst_source_symbol_1_11d                                  ;
reg      [3:0]                  avst_source_symbol_1_12d                                  ;
reg      [3:0]                  avst_source_symbol_1_13d_dup1                             ;
reg      [3:0]                  avst_source_symbol_1_13d_dup2                             ;
reg      [3:0]                  avst_source_symbol_1_14d_dup1                             ;
reg      [3:0]                  avst_source_symbol_1_14d_dup2                             ;
reg      [3:0]                  avst_source_symbol_1_14d_dup3                             ;
reg      [3:0]                  avst_source_symbol_1_14d_dup4                             ;
reg     [3:0]                   avst_source_axc_1                                         ;
reg      [3:0]                  avst_source_symbol_2_2d                                   ;
reg      [3:0]                  avst_source_symbol_2_3d                                   ;
reg      [3:0]                  avst_source_symbol_2_4d                                   ;
reg      [3:0]                  avst_source_symbol_2_5d                                   ;
reg      [3:0]                  avst_source_symbol_2_6d                                   ;
reg      [3:0]                  avst_source_symbol_2_7d                                   ;
reg      [3:0]                  avst_source_symbol_2_8d                                   ;
reg      [3:0]                  avst_source_symbol_2_9d                                   ;
reg      [3:0]                  avst_source_symbol_2_10d                                  ;
reg      [3:0]                  avst_source_symbol_2_11d                                  ;
reg      [3:0]                  avst_source_symbol_2_12d                                  ;
reg      [3:0]                  avst_source_symbol_2_13d_dup1                             ;
reg      [3:0]                  avst_source_symbol_2_13d_dup2                             ;
reg      [3:0]                  avst_source_symbol_2_14d_dup1                             ;
reg      [3:0]                  avst_source_symbol_2_14d_dup2                             ;
reg      [3:0]                  avst_source_symbol_2_14d_dup3                             ;
reg      [3:0]                  avst_source_symbol_2_14d_dup4                             ;
reg     [3:0]                   avst_source_axc_2                                         ;
reg     [3:0]                   c_avst_source_axc                                         ;
reg     [3:0]                   avst_source_axc_1_0d                                      ;
reg     [3:0]                   avst_source_axc_1_1d                                      ;
reg     [3:0]                   avst_source_axc_1_2d                                      ;
reg     [3:0]                   avst_source_axc_1_3d                                      ;
reg     [3:0]                   avst_source_axc_1_4d                                      ;
reg     [3:0]                   avst_source_axc_1_5d                                      ;
reg     [3:0]                   avst_source_axc_1_6d                                      ; 
reg     [3:0]                   avst_source_axc_2_0d                                      ;  
reg     [3:0]                   avst_source_axc_2_1d                                      ;
reg     [3:0]                   avst_source_axc_2_2d                                      ;
reg     [3:0]                   avst_source_axc_2_3d                                      ;
reg     [3:0]                   avst_source_axc_2_4d                                      ;
reg     [3:0]                   avst_source_axc_2_5d                                      ;
reg     [3:0]                   avst_source_axc_2_6d                                      ; 


reg     [3:0]                   avst_source_axc_1_6d_1                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_1_6d_2                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_1_6d_3                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_1_6d_4                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_1_6d_5                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_1_6d_6                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_1_6d_7                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_1_6d_8                                    ; // CHANGED 

reg     [3:0]                   avst_source_axc_2_6d_1                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_2_6d_2                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_2_6d_3                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_2_6d_4                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_2_6d_5                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_2_6d_6                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_2_6d_7                                    ; // CHANGED 
reg     [3:0]                   avst_source_axc_2_6d_8                                    ; // CHANGED 

reg     [3:0]                   avst_source_axc_1_7d                                      ;
reg     [3:0]                   avst_source_axc_1_7d_1                                    ;
reg     [3:0]                   avst_source_axc_1_7d_2                                    ;
reg     [3:0]                   avst_source_axc_1_7d_3                                    ;
reg     [3:0]                   avst_source_axc_1_7d_4                                    ;
reg     [3:0]                   avst_source_axc_1_7d_5                                    ;
reg     [3:0]                   avst_source_axc_1_7d_6                                    ;
reg     [3:0]                   avst_source_axc_1_7d_7                                    ;
reg     [3:0]                   avst_source_axc_1_7d_8                                    ;
reg     [3:0]                   avst_source_axc_1_7d_9                                    ;
reg     [3:0]                   avst_source_axc_1_7d_10                                   ;
reg     [3:0]                   avst_source_axc_1_7d_11                                   ;
reg     [3:0]                   avst_source_axc_1_7d_12                                   ;
reg     [3:0]                   avst_source_axc_1_7d_13                                   ;
reg     [3:0]                   avst_source_axc_1_7d_14                                   ;
reg     [3:0]                   avst_source_axc_1_7d_15                                   ;
reg     [3:0]                   avst_source_axc_1_7d_16                                   ;
reg     [3:0]                   avst_source_axc_2_7d                                      ;
reg     [3:0]                   avst_source_axc_2_7d_1                                    ;
reg     [3:0]                   avst_source_axc_2_7d_2                                    ;
reg     [3:0]                   avst_source_axc_2_7d_3                                    ;
reg     [3:0]                   avst_source_axc_2_7d_4                                    ;
reg     [3:0]                   avst_source_axc_2_7d_5                                    ;
reg     [3:0]                   avst_source_axc_2_7d_6                                    ;
reg     [3:0]                   avst_source_axc_2_7d_7                                    ;
reg     [3:0]                   avst_source_axc_2_7d_8                                    ;
reg     [3:0]                   avst_source_axc_2_7d_9                                    ;
reg     [3:0]                   avst_source_axc_2_7d_10                                   ;
reg     [3:0]                   avst_source_axc_2_7d_11                                   ;
reg     [3:0]                   avst_source_axc_2_7d_12                                   ;
reg     [3:0]                   avst_source_axc_2_7d_13                                   ;
reg     [3:0]                   avst_source_axc_2_7d_14                                   ;
reg     [3:0]                   avst_source_axc_2_7d_15                                   ;
reg     [3:0]                   avst_source_axc_2_7d_16                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_17                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_18                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_19                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_20                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_21                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_22                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_23                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_24                                   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_25   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_26   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_27   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_28   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_29   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_30   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_31   ;
// CHANGED reg     [3:0]                   avst_source_axc_7d_32   ;
reg     [3:0]                   avst_source_axc_1_8d                                      ;
reg     [3:0]                   avst_source_axc_1_8d_1                                    ;
reg     [3:0]                   avst_source_axc_1_8d_2                                    ;
reg     [3:0]                   avst_source_axc_1_8d_3                                    ;
reg     [3:0]                   avst_source_axc_1_8d_4                                    ;
reg     [3:0]                   avst_source_axc_1_8d_5                                    ;
reg     [3:0]                   avst_source_axc_1_8d_6                                    ;
reg     [3:0]                   avst_source_axc_1_8d_7                                    ;
reg     [3:0]                   avst_source_axc_1_8d_8                                    ;
reg     [3:0]                   avst_source_axc_1_8d_9                                    ;
reg     [3:0]                   avst_source_axc_1_8d_10                                   ;
reg     [3:0]                   avst_source_axc_1_8d_11                                   ;
reg     [3:0]                   avst_source_axc_1_8d_12                                   ;
reg     [3:0]                   avst_source_axc_1_8d_13                                   ;
reg     [3:0]                   avst_source_axc_1_8d_14                                   ;
reg     [3:0]                    avst_source_axc_1_8d_15                                   ;
reg     [3:0]                    avst_source_axc_1_8d_16                                   ;
reg     [3:0]                    avst_source_axc_1_8d_17                                   ;
reg     [3:0]                    avst_source_axc_1_8d_18                                   ;
reg     [3:0]                    avst_source_axc_1_8d_19                                   ;
reg     [3:0]                    avst_source_axc_1_8d_20                                   ;
reg     [3:0]                    avst_source_axc_1_8d_21                                   ;
reg     [3:0]                    avst_source_axc_1_8d_22                                   ;
reg     [3:0]                    avst_source_axc_1_8d_23                                   ;
reg     [3:0]                    avst_source_axc_1_8d_24                                   ;
reg     [3:0]                   avst_source_axc_1_8d_25                                   ;
reg     [3:0]                   avst_source_axc_1_8d_26                                   ;
reg     [3:0]                   avst_source_axc_1_8d_27                                   ;
reg     [3:0]                   avst_source_axc_1_8d_28                                   ;
reg     [3:0]                   avst_source_axc_1_8d_29                                   ;
reg     [3:0]                   avst_source_axc_1_8d_30                                   ;
reg     [3:0]                   avst_source_axc_1_8d_31                                   ;
reg     [3:0]                   avst_source_axc_1_8d_32                                   ;
reg     [3:0]                   avst_source_axc_2_8d                                      ;
reg     [3:0]                   avst_source_axc_2_8d_1                                    ;
reg     [3:0]                   avst_source_axc_2_8d_2                                    ;
reg     [3:0]                   avst_source_axc_2_8d_3                                    ;
reg     [3:0]                   avst_source_axc_2_8d_4                                    ;
reg     [3:0]                   avst_source_axc_2_8d_5                                    ;
reg     [3:0]                   avst_source_axc_2_8d_6                                    ;
reg     [3:0]                   avst_source_axc_2_8d_7                                    ;
reg     [3:0]                   avst_source_axc_2_8d_8                                    ;
reg     [3:0]                   avst_source_axc_2_8d_9                                    ;
reg     [3:0]                   avst_source_axc_2_8d_10                                   ;
reg     [3:0]                   avst_source_axc_2_8d_11                                   ;
reg     [3:0]                   avst_source_axc_2_8d_12                                   ;
reg     [3:0]                   avst_source_axc_2_8d_13                                   ;
reg     [3:0]                   avst_source_axc_2_8d_14                                   ;
reg     [3:0]                    avst_source_axc_2_8d_15                                   ;
reg     [3:0]                    avst_source_axc_2_8d_16                                   ;
reg     [3:0]                    avst_source_axc_2_8d_17                                   ;
reg     [3:0]                    avst_source_axc_2_8d_18                                   ;
reg     [3:0]                    avst_source_axc_2_8d_19                                   ;
reg     [3:0]                    avst_source_axc_2_8d_20                                   ;
reg     [3:0]                    avst_source_axc_2_8d_21                                   ;
reg     [3:0]                    avst_source_axc_2_8d_22                                   ;
reg     [3:0]                    avst_source_axc_2_8d_23                                   ;
reg     [3:0]                    avst_source_axc_2_8d_24                                   ;
reg     [3:0]                   avst_source_axc_2_8d_25                                   ;
reg     [3:0]                   avst_source_axc_2_8d_26                                   ;
reg     [3:0]                   avst_source_axc_2_8d_27                                   ;
reg     [3:0]                   avst_source_axc_2_8d_28                                   ;
reg     [3:0]                   avst_source_axc_2_8d_29                                   ;
reg     [3:0]                   avst_source_axc_2_8d_30                                   ;
reg     [3:0]                   avst_source_axc_2_8d_31                                   ;
reg     [3:0]                   avst_source_axc_2_8d_32                                   ;

reg     [3:0]                   avst_source_axc_1_9d                                      ;
reg     [3:0]                   avst_source_axc_1_9d_1                                    ;
reg     [3:0]                   avst_source_axc_1_9d_2                                    ;
reg     [3:0]                   avst_source_axc_1_9d_3                                    ;
reg     [3:0]                   avst_source_axc_1_9d_4                                    ;
reg     [3:0]                   avst_source_axc_1_9d_5                                    ;
reg     [3:0]                   avst_source_axc_1_9d_6                                    ;
reg     [3:0]                   avst_source_axc_1_9d_7                                    ;
reg     [3:0]                   avst_source_axc_1_9d_8                                    ;
reg     [3:0]                   avst_source_axc_1_9d_9                                    ;
reg     [3:0]                   avst_source_axc_1_9d_10                                   ;
reg     [3:0]                   avst_source_axc_1_9d_11                                   ;
reg     [3:0]                   avst_source_axc_1_9d_12                                   ;
reg     [3:0]                   avst_source_axc_1_9d_13                                   ;
reg     [3:0]                   avst_source_axc_1_9d_14                                   ;
reg     [3:0]                   avst_source_axc_1_9d_15                                   ;
reg     [3:0]                   avst_source_axc_1_9d_16                                   ;
reg     [3:0]                   avst_source_axc_1_9d_17                                   ;
reg     [3:0]                   avst_source_axc_1_9d_18                                   ;
reg     [3:0]                   avst_source_axc_1_9d_19                                   ;
reg     [3:0]                   avst_source_axc_1_9d_20                                   ;
reg     [3:0]                   avst_source_axc_1_9d_21                                   ;
reg     [3:0]                   avst_source_axc_1_9d_22                                   ;
reg     [3:0]                   avst_source_axc_1_9d_23                                   ;
reg     [3:0]                   avst_source_axc_1_9d_24                                   ;
reg     [3:0]                   avst_source_axc_1_9d_25                                   ;
reg     [3:0]                   avst_source_axc_1_9d_26                                   ;
reg     [3:0]                   avst_source_axc_1_9d_27                                   ;
reg     [3:0]                   avst_source_axc_1_9d_28                                   ;
reg     [3:0]                   avst_source_axc_1_9d_29                                   ;
reg     [3:0]                   avst_source_axc_1_9d_30                                   ;
reg     [3:0]                   avst_source_axc_1_9d_31                                   ;
reg     [3:0]                   avst_source_axc_1_9d_32                                   ;
reg     [3:0]                   avst_source_axc_2_9d                                      ;
reg     [3:0]                   avst_source_axc_2_9d_1                                    ;
reg     [3:0]                   avst_source_axc_2_9d_2                                    ;
reg     [3:0]                   avst_source_axc_2_9d_3                                    ;
reg     [3:0]                   avst_source_axc_2_9d_4                                    ;
reg     [3:0]                   avst_source_axc_2_9d_5                                    ;
reg     [3:0]                   avst_source_axc_2_9d_6                                    ;
reg     [3:0]                   avst_source_axc_2_9d_7                                    ;
reg     [3:0]                   avst_source_axc_2_9d_8                                    ;
reg     [3:0]                   avst_source_axc_2_9d_9                                    ;
reg     [3:0]                   avst_source_axc_2_9d_10                                   ;
reg     [3:0]                   avst_source_axc_2_9d_11                                   ;
reg     [3:0]                   avst_source_axc_2_9d_12                                   ;
reg     [3:0]                   avst_source_axc_2_9d_13                                   ;
reg     [3:0]                   avst_source_axc_2_9d_14                                   ;
reg     [3:0]                   avst_source_axc_2_9d_15                                   ;
reg     [3:0]                   avst_source_axc_2_9d_16                                   ;
reg     [3:0]                   avst_source_axc_2_9d_17                                   ;
reg     [3:0]                   avst_source_axc_2_9d_18                                   ;
reg     [3:0]                   avst_source_axc_2_9d_19                                   ;
reg     [3:0]                   avst_source_axc_2_9d_20                                   ;
reg     [3:0]                   avst_source_axc_2_9d_21                                   ;
reg     [3:0]                   avst_source_axc_2_9d_22                                   ;
reg     [3:0]                   avst_source_axc_2_9d_23                                   ;
reg     [3:0]                   avst_source_axc_2_9d_24                                   ;
reg     [3:0]                   avst_source_axc_2_9d_25                                   ;
reg     [3:0]                   avst_source_axc_2_9d_26                                   ;
reg     [3:0]                   avst_source_axc_2_9d_27                                   ;
reg     [3:0]                   avst_source_axc_2_9d_28                                   ;
reg     [3:0]                   avst_source_axc_2_9d_29                                   ;
reg     [3:0]                   avst_source_axc_2_9d_30                                   ;
reg     [3:0]                   avst_source_axc_2_9d_31                                   ;
reg     [3:0]                   avst_source_axc_2_9d_32                                   ;
reg     [3:0]                   avst_source_axc_1_9d_bf                                   ;
reg     [3:0]                   avst_source_axc_1_9d_1_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_2_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_3_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_4_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_5_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_6_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_7_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_8_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_9_bf                                 ;
reg     [3:0]                   avst_source_axc_1_9d_10_bf                                ;
reg     [3:0]                   avst_source_axc_1_9d_11_bf                                   ;
reg     [3:0]                   avst_source_axc_1_9d_12_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_13_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_14_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_15_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_16_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_17_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_18_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_19_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_20_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_21_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_22_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_23_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_24_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_25_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_26_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_27_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_28_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_29_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_30_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_31_bf                                    ;
reg     [3:0]                   avst_source_axc_1_9d_32_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_bf                                   ;
reg     [3:0]                   avst_source_axc_2_9d_1_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_2_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_3_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_4_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_5_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_6_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_7_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_8_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_9_bf                                 ;
reg     [3:0]                   avst_source_axc_2_9d_10_bf                                ;
reg     [3:0]                   avst_source_axc_2_9d_11_bf                                   ;
reg     [3:0]                   avst_source_axc_2_9d_12_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_13_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_14_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_15_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_16_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_17_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_18_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_19_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_20_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_21_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_22_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_23_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_24_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_25_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_26_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_27_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_28_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_29_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_30_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_31_bf                                    ;
reg     [3:0]                   avst_source_axc_2_9d_32_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d                                            ;
reg     [3:0]                   avst_source_axc_1_10d_1                                       ;
reg     [3:0]                   avst_source_axc_1_10d_2                                       ;
reg     [3:0]                   avst_source_axc_1_10d_3                                       ;
reg     [3:0]                   avst_source_axc_1_10d_4                                       ;
reg     [3:0]                   avst_source_axc_1_10d_5                                       ;
reg     [3:0]                   avst_source_axc_1_10d_6                                       ;
reg     [3:0]                   avst_source_axc_1_10d_7                                       ;
reg     [3:0]                   avst_source_axc_1_10d_8                                       ;
reg     [3:0]                   avst_source_axc_1_10d_9                                       ;
reg     [3:0]                   avst_source_axc_1_10d_10                                      ;
reg     [3:0]                   avst_source_axc_1_10d_11                                      ;
reg     [3:0]                   avst_source_axc_1_10d_12                                      ;
reg     [3:0]                   avst_source_axc_1_10d_13                                      ;
reg     [3:0]                   avst_source_axc_1_10d_14                                      ;
reg     [3:0]                   avst_source_axc_1_10d_15                                      ;
reg     [3:0]                   avst_source_axc_1_10d_16                                      ;
reg     [3:0]                   avst_source_axc_1_10d_17                                      ;
reg     [3:0]                   avst_source_axc_2_10d                                            ;
reg     [3:0]                   avst_source_axc_2_10d_1                                       ;
reg     [3:0]                   avst_source_axc_2_10d_2                                       ;
reg     [3:0]                   avst_source_axc_2_10d_3                                       ;
reg     [3:0]                   avst_source_axc_2_10d_4                                       ;
reg     [3:0]                   avst_source_axc_2_10d_5                                       ;
reg     [3:0]                   avst_source_axc_2_10d_6                                       ;
reg     [3:0]                   avst_source_axc_2_10d_7                                       ;
reg     [3:0]                   avst_source_axc_2_10d_8                                       ;
reg     [3:0]                   avst_source_axc_2_10d_9                                       ;
reg     [3:0]                   avst_source_axc_2_10d_10                                      ;
reg     [3:0]                   avst_source_axc_2_10d_11                                      ;
reg     [3:0]                   avst_source_axc_2_10d_12                                      ;
reg     [3:0]                   avst_source_axc_2_10d_13                                      ;
reg     [3:0]                   avst_source_axc_2_10d_14                                      ;
reg     [3:0]                   avst_source_axc_2_10d_15                                      ;
reg     [3:0]                   avst_source_axc_2_10d_16                                      ;
reg     [3:0]                   avst_source_axc_2_10d_17                                      ;
reg     [3:0]                   avst_source_axc_1_11d                                         ;
reg     [3:0]                   avst_source_axc_1_11d_1                                       ;
reg     [3:0]                   avst_source_axc_1_11d_2                                       ;
reg     [3:0]                   avst_source_axc_1_11d_3                                       ;
reg     [3:0]                   avst_source_axc_1_11d_4                                       ;
reg     [3:0]                   avst_source_axc_1_11d_5                                       ;
reg     [3:0]                   avst_source_axc_1_11d_6                                       ;
reg     [3:0]                   avst_source_axc_1_11d_7                                       ;
reg     [3:0]                   avst_source_axc_1_11d_8                                       ;
reg     [3:0]                   avst_source_axc_1_10d_bf                                      ;
reg     [3:0]                   avst_source_axc_1_10d_1_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_2_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_3_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_4_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_5_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_6_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_7_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_8_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_9_bf                                    ;
reg     [3:0]                   avst_source_axc_1_10d_10_bf                                   ;
reg     [3:0]                   avst_source_axc_1_10d_11_bf                                   ;
reg     [3:0]                   avst_source_axc_1_10d_12_bf                                   ;
reg     [3:0]                   avst_source_axc_1_10d_13_bf                                   ;
reg     [3:0]                   avst_source_axc_1_10d_14_bf                                   ;
reg     [3:0]                   avst_source_axc_1_10d_15_bf                                   ;
reg     [3:0]                   avst_source_axc_1_10d_16_bf                                   ;
reg     [3:0]                   avst_source_axc_1_10d_17_bf                                   ;
reg     [3:0]                   avst_source_axc_1_11d_bf                                      ;
reg     [3:0]                   avst_source_axc_1_11d_1_bf                                    ;
reg     [3:0]                   avst_source_axc_1_11d_2_bf                                    ;
reg     [3:0]                   avst_source_axc_1_11d_3_bf                                    ;
reg     [3:0]                   avst_source_axc_1_11d_4_bf                                    ;
reg     [3:0]                   avst_source_axc_1_11d_5_bf                                    ;
reg     [3:0]                   avst_source_axc_1_11d_6_bf                                    ;
reg     [3:0]                   avst_source_axc_1_11d_7_bf                                    ;
reg     [3:0]                   avst_source_axc_1_11d_8_bf                                    ;
reg     [3:0]                   avst_source_axc_1_12d                                         ;
reg     [3:0]                   avst_source_axc_1_12d_1                                        ;
reg     [3:0]                   avst_source_axc_1_12d_2                                        ;
reg     [3:0]                   avst_source_axc_1_12d_3                                        ;
reg     [3:0]                   avst_source_axc_1_12d_4                                        ;
reg     [3:0]                   avst_source_axc_1_12d_5                                        ;
reg     [3:0]                   avst_source_axc_1_12d_6                                        ;
reg     [3:0]                   avst_source_axc_1_12d_7                                        ;
reg     [3:0]                   avst_source_axc_1_12d_8                                        ;
reg     [3:0]                   avst_source_axc_2_11d                                         ;
reg     [3:0]                   avst_source_axc_2_11d_1                                       ;
reg     [3:0]                   avst_source_axc_2_11d_2                                       ;
reg     [3:0]                   avst_source_axc_2_11d_3                                       ;
reg     [3:0]                   avst_source_axc_2_11d_4                                       ;
reg     [3:0]                   avst_source_axc_2_11d_5                                       ;
reg     [3:0]                   avst_source_axc_2_11d_6                                       ;
reg     [3:0]                   avst_source_axc_2_11d_7                                       ;
reg     [3:0]                   avst_source_axc_2_11d_8                                       ;
reg     [3:0]                   avst_source_axc_2_10d_bf                                      ;
reg     [3:0]                   avst_source_axc_2_10d_1_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_2_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_3_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_4_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_5_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_6_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_7_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_8_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_9_bf                                    ;
reg     [3:0]                   avst_source_axc_2_10d_10_bf                                   ;
reg     [3:0]                   avst_source_axc_2_10d_11_bf                                   ;
reg     [3:0]                   avst_source_axc_2_10d_12_bf                                   ;
reg     [3:0]                   avst_source_axc_2_10d_13_bf                                   ;
reg     [3:0]                   avst_source_axc_2_10d_14_bf                                   ;
reg     [3:0]                   avst_source_axc_2_10d_15_bf                                   ;
reg     [3:0]                   avst_source_axc_2_10d_16_bf                                   ;
reg     [3:0]                   avst_source_axc_2_10d_17_bf                                   ;
reg     [3:0]                   avst_source_axc_2_11d_bf                                      ;
reg     [3:0]                   avst_source_axc_2_11d_1_bf                                    ;
reg     [3:0]                   avst_source_axc_2_11d_2_bf                                    ;
reg     [3:0]                   avst_source_axc_2_11d_3_bf                                    ;
reg     [3:0]                   avst_source_axc_2_11d_4_bf                                    ;
reg     [3:0]                   avst_source_axc_2_11d_5_bf                                    ;
reg     [3:0]                   avst_source_axc_2_11d_6_bf                                    ;
reg     [3:0]                   avst_source_axc_2_11d_7_bf                                    ;
reg     [3:0]                   avst_source_axc_2_11d_8_bf                                    ;
reg     [3:0]                   avst_source_axc_2_12d                                         ;
reg     [3:0]                   avst_source_axc_2_12d_1                                        ;
reg     [3:0]                   avst_source_axc_2_12d_2                                        ;
reg     [3:0]                   avst_source_axc_2_12d_3                                        ;
reg     [3:0]                   avst_source_axc_2_12d_4                                        ;
reg     [3:0]                   avst_source_axc_2_12d_5                                        ;
reg     [3:0]                   avst_source_axc_2_12d_6                                        ;
reg     [3:0]                   avst_source_axc_2_12d_7                                        ;
reg     [3:0]                   avst_source_axc_2_12d_8                                        ;

wire                            avst_source_axc_1_last                                        ;
wire                            avst_source_axc_2_last                                        ;
wire                            c_avst_source_axc_last                                        ;

//reg     [NUM_OF_ANT-1:0]        avst_source_ready              [NUM_OF_SYM-1:0]           ;
reg                             avst_source_ready_1_1d                                        ;
reg                             avst_source_ready_1_1d_dup1                                 ;
reg                             avst_source_ready_2_1d                                        ;
reg                             avst_source_ready_2_1d_dup1                                 ;

reg     [NUM_OF_ANT-1:0]        avst_source_ready_1d_dup2      [NUM_OF_SYM-1:0]             ;
reg     [NUM_OF_ANT-1:0]        avst_source_ready_1d_dup3      [NUM_OF_SYM-1:0]             ;
reg     [NUM_OF_ANT-1:0]        avst_source_ready_1d_dup4      [NUM_OF_SYM-1:0]             ;
reg     [NUM_OF_ANT-1:0]        avst_source_ready_1d_dup5      [NUM_OF_SYM-1:0]             ;
reg     [NUM_OF_ANT-1:0]        avst_source_ready_1d_dup8      [NUM_OF_SYM-1:0]             ;
reg     [NUM_OF_ANT-1:0]        avst_source_ready_1d_dup9      [NUM_OF_SYM-1:0]             ;

reg                             avst_source_ready_1_1d_dup6                                   ;
reg                             avst_source_ready_1_1d_dup7                                   ;
reg                             avst_source_ready_1_2d                                    ;
reg                             avst_source_ready_1_3d                                    ;
reg                             avst_source_ready_1_4d                                    ;
reg                             avst_source_ready_1_5d                                    ;
reg                             avst_source_ready_1_6d                                    ;
reg                             avst_source_ready_1_7d                                    ;
reg                             avst_source_ready_1_8d                                    ;
reg                             avst_source_ready_1_9d                                    ;
reg                             avst_source_ready_1_10d                                   ;
reg                             avst_source_ready_1_11d                                   ;
reg                             avst_source_ready_1_12d                                   ;
reg                             avst_source_ready_1_13d                                   ;
reg                             avst_source_ready_1_14d                                   ;
reg                             avst_source_ready_1_15d                                   ;
reg                             avst_source_ready_1_16d                                   ;

reg                             avst_source_ready_2_1d_dup6                                   ;
reg                             avst_source_ready_2_1d_dup7                                   ;
reg                             avst_source_ready_2_2d                                    ;
reg                             avst_source_ready_2_3d                                    ;
reg                             avst_source_ready_2_4d                                    ;
reg                             avst_source_ready_2_5d                                    ;
reg                             avst_source_ready_2_6d                                    ;
reg                             avst_source_ready_2_7d                                    ;
reg                             avst_source_ready_2_8d                                    ;
reg                             avst_source_ready_2_9d                                    ;
reg                             avst_source_ready_2_10d                                   ;
reg                             avst_source_ready_2_11d                                   ;
reg                             avst_source_ready_2_12d                                   ;
reg                             avst_source_ready_2_13d                                   ;
reg                             avst_source_ready_2_14d                                   ;
reg                             avst_source_ready_2_15d                                   ;
reg                             avst_source_ready_2_16d                                   ;

/*reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_sym1                  ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_sym2                  ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_sym                   ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_sym_1d                ;*/

/*reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_odd_sym1                   ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_odd_sym2                   ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_odd_sym                    ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_odd_sym_1d                 ;*/

/*reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_odd_sym1              ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_odd_sym2              ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_odd_sym               ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_even_sym1             ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_even_sym2             ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_even_sym              ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_even_odd_sym_1d            ;*/



reg     [(NUM_OF_IF*DSP_DATAWIDTH/2) -1 :0]     avst_source_data_mux_lsb                ;
reg     [(NUM_OF_IF*DSP_DATAWIDTH/2) -1 :0]     avst_source_data_mux_msb                ;

wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_0_axc_0_1              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_0_axc_2_3              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_0_axc_4_5              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_0_axc_6_7              ;

wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_1_axc_0_1              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_1_axc_2_3              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_1_axc_4_5              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_1_axc_6_7              ;

wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_2_axc_0_1              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_2_axc_2_3              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_2_axc_4_5              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_2_axc_6_7              ;

wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_3_axc_0_1              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_3_axc_2_3              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_3_axc_4_5              ;
wire    [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf_3_axc_6_7              ;


reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf0_mux_stage1_0          ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf0_mux_stage1_1          ;

reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf1_mux_stage1_0          ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf1_mux_stage1_1          ;

reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf2_mux_stage1_0          ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf2_mux_stage1_1          ;

reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf3_mux_stage1_0          ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf3_mux_stage1_1          ;

reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf0_mux_stage2_0          ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf1_mux_stage2_0          ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf2_mux_stage2_0          ;
reg     [NUM_OF_IF*DSP_DATAWIDTH -1 :0]     avst_source_data_buf3_mux_stage2_0          ;


reg                                         avst_source_symbol_1_first                           ;
reg                                         avst_source_symbol_1_last                            ;
reg                                         avst_source_symbol_2_first                           ;
reg                                         avst_source_symbol_2_last                            ;
wire    [47:0]                              cplane_info                                        ;
wire                                        c_ram_wren                                         ;
reg                                         c_ram_wren_1d                                      ;
reg                                         c_ram_wren_2d                                      ;
wire                                        c_ram_rden                                         ;
reg                                         c_ram_rden_1d                                      ;
reg                                         c_ram_rden_2d                                      ;
reg                                         c_ram_rden_3d                                      ;
reg                                         c_ram_rden_4d                                      ;
reg                                         c_ram_rden_5d                                      ;
reg                                         c_ram_rden_6d                                      ;
reg                                         c_ram_rden_7d                                      ;
reg                                         c_ram_rden_8d                                      ;
wire    [47:0]                              c_ram_writedata                                    ;
reg    [47:0]                               c_ram_writedata_1d                                 ;
reg    [47:0]                               c_ram_writedata_2d                                 ;
wire    [47:0]                              c_ram_readdata                                     ;
reg     [5:0]                               c_ram_wraddress                                    ;
reg     [5:0]                               c_ram_wraddress_1d                                 ;
reg     [5:0]                               c_ram_wraddress_2d                                 ;
reg     [5:0]                               c_ram_rdaddress                                    ;
reg     [5:0]                               c_ram_rdaddress_1d                                 ;
reg     [5:0]                               c_ram_rdaddress_2d                                 ;
//wire    [3:0]                               datasize                                           ;
//reg    [47:0]                              c_ram_readdata                                    ;
reg    [47:0]                               c_ram_readdata_1d                                  ;
reg    [47:0]                               c_ram_readdata_2d                                  ;

reg     [7:0]                               avst_sink_frameid                                     ;
reg     [7:0]                               avst_sink_subframeid                                  ;
reg     [7:0]                               avst_sink_slotid;
reg                                         avst_sink_rfn_zero_latch                             ;

wire                                         c_plane_info_valid                                   ;
wire [15:0]                                 c_cplength                                         ;
wire [3:0]                                  c_fftsize                                          ;

reg [11:0]                                     NUM_OF_DATA_WRITE[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]  ;
reg [11:0]                                     NUM_OF_DATA_WRITE_1_dup1;
reg [11:0]                                     NUM_OF_DATA_WRITE_1_dup2;
reg [11:0]                                     NUM_OF_DATA_WRITE_2_dup1;
reg [11:0]                                     NUM_OF_DATA_WRITE_2_dup2;
reg [11:0]                                     NUM_OF_DATA_WRITE_1d[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0];
reg [11:0]                                     NUM_OF_DATA_WRITE_2d[NUM_OF_SYM-1:0][NUM_OF_ANT-1:0];

reg [$clog2(NUM_OF_ANT)-1:0]                   h_ant_num;

reg    [NUM_OF_ANT-1:0]                     rdaddr_comp        [NUM_OF_SYM-1:0]                 ; 
reg    [NUM_OF_ANT-1:0]                     rdaddr_comp_1d     [NUM_OF_SYM-1:0]                 ; 
reg    [NUM_OF_ANT-1:0]                     rdaddr_comp_2d     [NUM_OF_SYM-1:0]                 ; 
reg    [NUM_OF_ANT-1:0]                     rdaddr_comp_3d     [NUM_OF_SYM-1:0]                 ; 
reg    [NUM_OF_ANT-1:0]                     rdaddr_comp_4d     [NUM_OF_SYM-1:0]                 ; 

reg                                           xran_demapper_c_plane_metav_1d, xran_demapper_c_plane_metav_2d, xran_demapper_c_plane_metav_3d;
reg     [9:0]                                 c_startprb [NUM_OF_ANT-1:0];
reg     [9:0]                                 c_startprb_d [NUM_OF_ANT-1:0];
reg     [9:0]                                 c_totalprb [NUM_OF_ANT-1:0];
reg     [7:0]                                 c_numprb [NUM_OF_ANT-1:0];
reg     [8:0]                                 c_numprb_w [NUM_OF_ANT-1:0];
reg     [5:0]                                 c_startsym [NUM_OF_ANT-1:0];
reg     [3:0]                                 c_numsym [NUM_OF_ANT-1:0];
reg     [15:0]                                c_axc [NUM_OF_ANT-1:0];
reg     [15:0]                                c_axc_d [NUM_OF_ANT-1:0];
reg     [5:0]                                 c_slotid [NUM_OF_ANT-1:0];
reg                                           c_init, c_init_d;
wire                                          c_init_fedge;
//reg     [8:0]                                 prb_idx [NUM_OF_ANT-1:0];
reg     [8:0]                                 prb_idx, prb_idx_d ;
reg                                           slot_change, slot_change_1d, slot_change_2d;
reg                                           slot_chg_str, slot_chg_str_2d, slot_chg_str_3d;
wire                                          slot_chg_str_1d;
reg     [3:0]                                 rd_sym_cnt;
reg     [272:0]                               active_prb_arr        [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [272:0]                               active_prb_arr_1d     [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [272:0]                               active_prb_arr_2d     [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [272:0]                               c_prb_arr             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [272:0]                               c_prb_arr_d1          [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [272:0]                               c_prb_arr_d2          [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
wire    [272:0]                               c_prb_arr_dsp         [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [272:0]                               c_prb_arr_dsp_d1      [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [272:0]                               c_prb_arr_dsp_d2      [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [272:0]                               c_prb_arr_dsp_d3      [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
wire                                          c_prb_arr_dsp_v       [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [8:0]                                 active_prb            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [3:0]                                 re_cnt                [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [8:0]                                 prb_cnt               [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg     [8:0]                                 prb_cnt_d             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym1            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym2            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym3            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym4            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym5            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym6            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym7            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym8            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym9            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym10            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym11            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym12            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym13            [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym_1d          [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           blank_sym_2d          [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           prb_blank             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
reg                                           prb_blank_d           [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]      ;
//reg [272:0]                                 prb_val                                                    ;
//reg [3:0]                                     re_val                                                      ;


reg     [31:0]                                 blank_prb_flag                                              ;
wire                                         blank_prb_intr                                              ;



reg     [33:0]                              xran_demapper_sts_prb_dout_reg_1d                         ;
reg     [33:0]                              xran_demapper_sts_prb_dout_reg_2d                         ;
reg     [33:0]                              xran_demapper_sts_prb_dout_reg_3d                         ;

reg                                         xran_demapper_sts_prb_vout_reg_1d                         ;
reg                                         xran_demapper_sts_prb_vout_reg_2d                         ;
reg                                         xran_demapper_sts_prb_vout_reg_3d                         ;
reg                                         xran_demapper_sts_prb_vout_reg_4d                         ;

//reg     [9:0]                               rbstart                                                     ;
//reg     [7:0]                               numprb                                                     ;

reg     [9:0]     start_prb                     [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
reg     [9:0]     start_prb_latch             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
reg     [9:0]     start_prb_latch_1d         [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
reg     [8:0]     num_prb                     [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
reg     [8:0]     xran_demapper_sts_numprb ;
reg     [7:0]     num_prb_latch             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
 reg               sym_reset                 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
 reg               sym_reset_1d                 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
 reg               sym_reset_2d                 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
 reg               sym_reset_3d                 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
 reg               sym_reset_4d                 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
 reg               sym_reset_5d                 [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
reg               sym_reset_pulse             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
reg                sym_reset_pul             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;

 reg               sym_reset_pul_1d             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
 reg               sym_reset_pul_2d             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;
 reg               sym_reset_pul_3d             [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                          ;

reg [7:0]           bw_config_cc1_1d        ;
reg [7:0]           bw_config_cc1_2d        ;
reg [7:0]           bw_config_cc2_1d        ;
reg [7:0]           bw_config_cc2_2d        ;
reg [7:0]           bw_config_reg_cc1_1d    ;
reg [7:0]           bw_config_reg_cc1_2d    ;
reg [7:0]           bw_config_reg_cc2_1d    ;
reg [7:0]           bw_config_reg_cc2_2d    ;

reg [9:0]           ram_wraddress_limit      [NUM_OF_SYM-1:0][NUM_OF_ANT-1:0]                               ;
reg    			     rst_dsp_n_1d_dup1               	;
reg     			 rst_dsp_n_1d_dup2               	;
reg     			 rst_dsp_n_1d_dup3               	;
reg     			 rst_dsp_n_1d_dup4               	;



    assign  avst_source_ready_1_count_last    = avst_source_ready_1_1d_dup6 & (avst_source_ready_1_count_dup1 == (NUM_OF_DATA_WRITE_1_dup1-1)) ;
    assign  avst_source_ready_1_count_first   = avst_source_ready_1_1d_dup7 & (~(|avst_source_ready_1_count_dup2) ); // avst_source_ready_count == 0
    assign  avst_source_axc_1_last            = avst_source_ready_1_count_last & (avst_source_axc_1 == ((NUM_OF_ANT/NUM_OF_IF)-1)) ;
    
    assign  avst_source_ready_2_count_last    = avst_source_ready_2_1d_dup6 & (avst_source_ready_2_count_dup1 == (NUM_OF_DATA_WRITE_2_dup1-1)) ;
    assign  avst_source_ready_2_count_first   = avst_source_ready_2_1d_dup7 & (~(|avst_source_ready_2_count_dup2) ); // avst_source_ready_count == 0
    assign  avst_source_axc_2_last            = avst_source_ready_2_count_last & (avst_source_axc_2 == ((NUM_OF_ANT/NUM_OF_IF)-1)) ;
    
    assign  c_avst_source_axc_last          = avst_source_ready_1_count_last & (c_avst_source_axc == 3) ;
    assign  avst_sink_ready                 = 1'b1      ;
    assign  cplane_info                     = {xran_demapper_cplane_dout_fo_2d,xran_demapper_cplane_dout_2d};



    always @ (posedge clk_dsp)
		begin
		    rst_dsp_n_1d_dup1 <= rst_dsp_n;		
		    rst_dsp_n_1d_dup2 <= (~rst_dsp_n);
		    rst_dsp_n_1d_dup3 <= rst_dsp_n;
		    rst_dsp_n_1d_dup4 <= (~rst_dsp_n);
					
		end	
		
		

    always @ (posedge clk_eth  )
    begin : PIPE_DELAY
        if (rst_eth_n == 1'b0) 
        begin 
            avst_sink_valid_1d                      <=  1'b0                            ;   
            avst_sink_valid_2d                      <=  1'b0                            ;   
            avst_sink_valid_3d                      <=  1'b0                            ;   
            avst_sink_valid_4d                      <=  1'b0                            ; 
            avst_sink_valid_5d                      <=  1'b0                            ; 
            avst_sink_channel_1d                    <=  16'b0                           ;
            avst_sink_channel_2d                    <=  16'b0                           ;
            avst_sink_channel_3d                    <=  16'b0                           ;
            avst_sink_channel_4d                    <=  16'b0                           ;
            avst_sink_endofpacket_1d                <=  1'b0                            ;
            avst_sink_endofpacket_2d                <=  1'b0                            ;
            avst_sink_endofpacket_3d                <=  1'b0                            ;
            avst_sink_startofpacket_1d              <=  1'b0                            ;
            avst_sink_startofpacket_2d              <=  1'b0                            ;
            avst_sink_startofpacket_3d              <=  1'b0                            ;
            avst_sink_startofpacket_4d              <=  1'b0                            ;
            avst_sink_startofpacket_5d              <=  1'b0                            ;
            avst_sink_startofpacket_6d              <=  1'b0                            ;
            xran_demapper_sts_frame_dout_1d         <=  32'b0                           ;
            xran_demapper_sts_frame_dout_2d         <=  32'b0                           ;
            xran_demapper_sts_frame_dout_2d_dup1    <=  32'b0                           ;
            xran_demapper_sts_frame_dout_2d_dup2    <=  32'b0                           ;
            xran_demapper_sts_frame_vout_1d         <=  1'b0                            ;
            xran_demapper_sts_frame_vout_2d         <=  1'b0                            ;
            xran_demapper_cplane_vout_1d            <= 1'b0                             ;
            xran_demapper_cplane_vout_2d            <= 1'b0                             ;
            xran_demapper_cplane_dout_1d            <= 24'b0                            ;
            xran_demapper_cplane_dout_2d            <= 24'b0                            ;
            xran_demapper_cplane_dout_fo_1d         <= 24'b0                            ; 
            xran_demapper_cplane_dout_fo_2d         <= 24'b0                            ;            
            xran_demapper_sts_prb_dout_1d           <=  'b0                             ;
            xran_demapper_sts_prb_dout_2d           <=  'b0                             ;
            xran_demapper_sts_prb_dout_3d           <=  'b0                             ;
            xran_demapper_sts_prb_dout_4d           <=  'b0                             ;
            xran_demapper_sts_prb_dout_5d           <=  'b0                             ;
            xran_demapper_sts_prb_vout_1d           <=  1'b0                            ;
            xran_demapper_sts_prb_vout_2d           <=  1'b0                            ;
            xran_demapper_sts_prb_vout_3d           <=  1'b0                            ;
            xran_demapper_sts_prb_vout_4d           <=  1'b0                            ;
            xran_demapper_sts_prb_vout_5d           <=  1'b0                            ;
            avst_sink_numprb_1d                     <=  8'b0                            ;
            avst_sink_numprb_2d                     <=  8'b0                            ;
            avst_sink_rbstart_1d                    <=  'b0                             ;
            avst_sink_rbstart_2d                    <=  'b0                             ;
            avst_sink_rbstart_3d                    <=  'b0                             ;
            c_ram_wraddress_1d                      <=  'd0                                ;
            c_ram_wraddress_2d                      <=  'd0                                ;
            c_ram_writedata_1d                        <=  'd0                                ;
            c_ram_writedata_2d                      <=  'd0                                ;
            c_ram_wren_1d                           <=  'd0                                ;
            c_ram_wren_2d                           <=     'd0                                ;
            avst_sink_data_1d                       <=  'd0                              ;   
            avst_sink_data_2d_dup1                  <=  'd0                              ;   
            avst_sink_data_2d_dup2                  <=  'd0                              ;   
            avst_sink_data_2d_dup3                  <=  'd0                              ;   
            avst_sink_data_2d_dup4                  <=  'd0                              ;   
            avst_sink_data_2d_dup5                  <=  'd0                              ;   
            avst_sink_data_2d_dup6                  <=  'd0                              ;  
            bw_config_cc1_1d                        <=  'd0                                ;
            bw_config_cc1_2d                        <=  'd0                                ;
            bw_config_cc2_1d                        <=  'd0                                ;
            bw_config_cc2_2d                        <=  'd0                                ;

        end 
        else 
        begin 
            avst_sink_valid_1d                      <=  avst_sink_valid                 ;   
            avst_sink_valid_2d                      <=  avst_sink_valid_1d              ;   
            avst_sink_valid_3d                      <=  avst_sink_valid_2d              ;   
            avst_sink_valid_4d                      <=  avst_sink_valid_3d              ; 
            avst_sink_valid_5d                      <=  avst_sink_valid_4d              ; 
            avst_sink_data_1d                       <=  avst_sink_data                  ;   
            avst_sink_data_2d_dup1                  <=  avst_sink_data_1d               ;                                                           
            avst_sink_data_2d_dup2                  <=  avst_sink_data_1d               ;                                                           
            avst_sink_data_2d_dup3                  <=  avst_sink_data_1d               ;                                                           
            avst_sink_data_2d_dup4                  <=  avst_sink_data_1d               ;                                                           
            avst_sink_data_2d_dup5                  <=  avst_sink_data_1d               ;                                                           
            avst_sink_data_2d_dup6                  <=  avst_sink_data_1d               ;                                                           
            avst_sink_channel_1d                    <=  avst_sink_channel               ;
            avst_sink_channel_2d                    <=  avst_sink_channel_1d            ;
            avst_sink_channel_3d                    <=  avst_sink_channel_2d            ;
            avst_sink_channel_4d                    <=  avst_sink_channel_3d            ;
            avst_sink_endofpacket_1d                <=  avst_sink_endofpacket           ;
            avst_sink_endofpacket_2d                <=  avst_sink_endofpacket_1d        ;
            avst_sink_endofpacket_3d                <=  avst_sink_endofpacket_2d        ;
            avst_sink_startofpacket_1d              <=  avst_sink_startofpacket         ;
            avst_sink_startofpacket_2d              <=  avst_sink_startofpacket_1d      ;
            avst_sink_startofpacket_3d              <=  avst_sink_startofpacket_2d      ;
            avst_sink_startofpacket_4d              <=  avst_sink_startofpacket_3d      ;
            avst_sink_startofpacket_5d              <=  avst_sink_startofpacket_4d      ;
            avst_sink_startofpacket_6d              <=  avst_sink_startofpacket_5d      ;
            
                    
            xran_demapper_sts_frame_dout_dup1       <= ( xran_demapper_sts_frame_dout[23:16] * 14) +  xran_demapper_sts_frame_dout [31:24] ;
            
            xran_demapper_sts_frame_dout_1d         <=  xran_demapper_sts_frame_dout   ;            
            xran_demapper_sts_frame_dout_2d         <=  xran_demapper_sts_frame_dout_1d ;
            
             xran_demapper_sts_frame_dout_2d_dup1    <=  xran_demapper_sts_frame_dout_dup1 % NUM_OF_SYM;
            xran_demapper_sts_frame_dout_2d_dup2    <=  xran_demapper_sts_frame_dout_dup1 % NUM_OF_SYM;
            
            xran_demapper_sts_frame_vout_1d         <=  xran_demapper_sts_frame_vout    ;
            xran_demapper_sts_frame_vout_1d_dup1    <=  xran_demapper_sts_frame_vout    ;
            xran_demapper_sts_frame_vout_2d         <=  xran_demapper_sts_frame_vout_1d ;
            xran_demapper_sts_prb_dout_1d           <=  xran_demapper_sts_prb_dout      ;
            xran_demapper_sts_prb_dout_2d           <=  xran_demapper_sts_prb_dout_1d   ;
            xran_demapper_sts_prb_dout_3d           <=  xran_demapper_sts_prb_dout_2d   ;
            xran_demapper_sts_prb_dout_4d           <=  xran_demapper_sts_prb_dout_3d   ;
            xran_demapper_sts_prb_dout_5d           <=  xran_demapper_sts_prb_dout_4d   ;
            xran_demapper_sts_prb_vout_1d           <=  xran_demapper_sts_prb_vout      ;
            xran_demapper_sts_prb_vout_2d           <=  xran_demapper_sts_prb_vout_1d   ;
            xran_demapper_sts_prb_vout_3d           <=  xran_demapper_sts_prb_vout_2d   ;
            xran_demapper_sts_prb_vout_4d           <=  xran_demapper_sts_prb_vout_3d   ;
            xran_demapper_sts_prb_vout_5d           <=  xran_demapper_sts_prb_vout_4d   ;
            xran_demapper_cplane_vout_1d            <=  xran_demapper_cplane_vout        ;
            xran_demapper_cplane_vout_2d            <=  xran_demapper_cplane_vout_1d     ;
            xran_demapper_cplane_dout_1d            <=  xran_demapper_cplane_dout         ;
            xran_demapper_cplane_dout_2d            <=  xran_demapper_cplane_dout_1d     ;
            xran_demapper_cplane_dout_fo_1d         <=  xran_demapper_cplane_dout_fo       ;
            xran_demapper_cplane_dout_fo_2d         <=  xran_demapper_cplane_dout_fo_1d  ;
            avst_sink_numprb_1d                     <=  avst_sink_numprb                          ;
            avst_sink_numprb_2d                     <=  avst_sink_numprb_1d                       ;
            avst_sink_rbstart_1d                     <=  avst_sink_rbstart      * 'd3                   ;
            avst_sink_rbstart_2d                     <=  avst_sink_rbstart_1d                      ;
            avst_sink_rbstart_3d                     <=  avst_sink_rbstart_2d              ;
            c_ram_wren_1d                           <=  c_ram_wren                      ;
            c_ram_wren_2d                           <=  c_ram_wren_1d                      ;
            c_ram_wraddress_1d                      <=  c_ram_wraddress                    ;
            c_ram_wraddress_2d                      <=  c_ram_wraddress_1d                 ;    
            c_ram_writedata_1d                        <= c_ram_writedata                     ;
            c_ram_writedata_2d                        <= c_ram_writedata_1d                  ;
            bw_config_cc1_1d                        <=  bw_config_cc1                                ;
            bw_config_cc1_2d                        <=  bw_config_cc1_1d                            ;
            bw_config_cc2_1d                        <=  bw_config_cc2                                ;
            bw_config_cc2_2d                        <=  bw_config_cc2_1d                            ;
        end      
    end
    
    always @ (posedge clk_dsp)
    begin : DSP_PIPE_DELAY
        if (rst_dsp_n_1d_dup1 == 1'b0) 
        begin 
            avst_source_ready_1_1d                    <=  1'b0                            ;
            avst_source_ready_1_1d_dup1               <=  'd0                             ;
            avst_source_ready_1_1d_dup6               <=  'd0                             ;
            avst_source_ready_1_1d_dup7               <=  'd0                             ;
            avst_source_ready_1_2d                    <=  1'b0                            ;
            avst_source_ready_1_3d                    <=  1'b0                            ;
            avst_source_ready_1_4d                    <=  1'b0                            ;
            avst_source_ready_1_5d                    <=  1'b0                            ;
            avst_source_ready_1_6d                    <=  1'b0                            ;
            avst_source_ready_1_7d                    <=  1'b0                            ;
            avst_source_ready_1_8d                    <=  1'b0                            ;
            avst_source_ready_1_9d                    <=  1'b0                            ;
            avst_source_ready_1_10d                   <=  1'b0                            ;
            avst_source_ready_1_11d                   <=  1'b0                            ;
            avst_source_ready_1_12d                   <=  1'b0                            ;
            avst_source_ready_1_13d                   <=  1'b0                            ;
            avst_source_ready_1_14d                   <=  1'b0                            ;
            avst_source_ready_1_15d                   <=  1'b0                            ;
            avst_source_ready_1_16d                   <=  1'b0                            ;
            avst_source_symbol_1_1d                   <=  4'b0                            ;
            avst_source_symbol_1_2d                   <=  4'b0                            ;
            avst_source_symbol_1_3d                   <=  4'b0                            ;
            avst_source_symbol_1_4d                   <=  4'b0                            ;
            avst_source_symbol_1_5d                   <=  4'b0                            ;
            avst_source_symbol_1_6d                   <=  4'b0                            ;
            avst_source_symbol_1_7d                   <=  4'b0                            ;
            avst_source_symbol_1_8d                   <=  4'b0                            ;
            avst_source_symbol_1_9d                   <=  4'b0                            ;
            avst_source_symbol_1_10d                  <=  4'b0                            ;
            avst_source_symbol_1_11d                  <=  4'b0                            ;
            avst_source_symbol_1_12d                  <=  4'b0                            ;
            avst_source_symbol_1_13d_dup1             <=  4'b0                            ;
            avst_source_symbol_1_13d_dup2             <=  4'b0                            ;
            avst_source_symbol_1_14d_dup1             <=  4'b0                            ;
            avst_source_symbol_1_14d_dup2             <=  4'b0                            ;
            avst_source_symbol_1_14d_dup3             <=  4'b0                            ;
            avst_source_symbol_1_14d_dup4             <=  4'b0                            ;
            avst_source_axc_1_0d                      <=  4'b0                            ;
            avst_source_axc_1_1d                      <=  4'b0                            ;
            avst_source_axc_1_2d                      <=  4'b0                            ;
            avst_source_axc_1_3d                      <=  4'b0                            ;
            avst_source_axc_1_4d                      <=  4'b0                            ;
            avst_source_axc_1_5d                      <=  4'b0                            ;
            avst_source_axc_1_6d                      <=  4'b0                            ;  
            
            avst_source_axc_1_6d_1                    <=  4'b0;       // CHANGED
            avst_source_axc_1_6d_2                    <=  4'b0;       // CHANGED
            avst_source_axc_1_6d_3                    <=  4'b0;       // CHANGED
            avst_source_axc_1_6d_4                    <=  4'b0;       // CHANGED
            avst_source_axc_1_6d_5                    <=  4'b0;       // CHANGED
            avst_source_axc_1_6d_6                    <=  4'b0;       // CHANGED
            avst_source_axc_1_6d_7                    <=  4'b0;       // CHANGED
            avst_source_axc_1_6d_8                    <=  4'b0;       // CHANGED
            
            avst_source_axc_1_7d                      <=  4'b0                            ;
            avst_source_axc_1_7d_1                    <=  4'b0                            ;
            avst_source_axc_1_7d_2                    <=  4'b0                            ;
            avst_source_axc_1_7d_3                    <=  4'b0                            ;
            avst_source_axc_1_7d_4                    <=  4'b0                            ;
            avst_source_axc_1_7d_5                    <=  4'b0                            ;
            avst_source_axc_1_7d_6                    <=  4'b0                            ;
            avst_source_axc_1_7d_7                    <=  4'b0                            ;
            avst_source_axc_1_7d_8                    <=  4'b0                            ;
            avst_source_axc_1_7d_9                    <=  4'b0                            ;
            avst_source_axc_1_7d_10                   <=  4'b0              ;
            avst_source_axc_1_7d_11                   <=  4'b0              ;
            avst_source_axc_1_7d_12                   <=  4'b0              ;
            avst_source_axc_1_7d_13                   <=  4'b0              ;
            avst_source_axc_1_7d_14                   <=  4'b0              ;
            avst_source_axc_1_7d_15                   <=  4'b0              ;
            avst_source_axc_1_7d_16                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_17                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_18                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_19                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_20                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_21                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_22                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_23                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_24                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_25                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_26                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_27                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_28                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_29                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_30                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_31                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_32                    <=  4'b0              ;
            avst_source_axc_1_8d                      <=  4'b0                            ;
            avst_source_axc_1_8d_1                    <=  4'b0                            ;
            avst_source_axc_1_8d_2                    <=  4'b0                            ;
            avst_source_axc_1_8d_3                    <=  4'b0                            ;
            avst_source_axc_1_8d_4                    <=  4'b0                            ;
            avst_source_axc_1_8d_5                    <=  4'b0              ;
            avst_source_axc_1_8d_6                    <=  4'b0              ;
            avst_source_axc_1_8d_7                    <=  4'b0              ;
            avst_source_axc_1_8d_8                    <=  4'b0              ;
            avst_source_axc_1_8d_9                    <=  4'b0              ;
            avst_source_axc_1_8d_10                    <=  4'b0              ;
            avst_source_axc_1_8d_11                    <=  4'b0              ;
            avst_source_axc_1_8d_12                    <=  4'b0              ;
            avst_source_axc_1_8d_13                    <=  4'b0              ;
            avst_source_axc_1_8d_14                    <=  4'b0              ;
            avst_source_axc_1_8d_15                    <=  4'b0              ;
            avst_source_axc_1_8d_16                    <=  4'b0              ;
            avst_source_axc_1_8d_17                    <=  4'b0              ;
            avst_source_axc_1_8d_18                    <=  4'b0              ;
            avst_source_axc_1_8d_19                    <=  4'b0              ;
            avst_source_axc_1_8d_20                    <=  4'b0              ;
            avst_source_axc_1_8d_21                    <=  4'b0              ;
            avst_source_axc_1_8d_22                    <=  4'b0              ;
            avst_source_axc_1_8d_23                    <=  4'b0              ;
            avst_source_axc_1_8d_24                    <=  4'b0              ;
            avst_source_axc_1_8d_25                    <=  4'b0              ;
            avst_source_axc_1_8d_26                    <=  4'b0              ;
            avst_source_axc_1_8d_27                    <=  4'b0              ;
            avst_source_axc_1_8d_28                    <=  4'b0              ;
            avst_source_axc_1_8d_29                    <=  4'b0              ;
            avst_source_axc_1_8d_30                    <=  4'b0              ;
            avst_source_axc_1_8d_31                    <=  4'b0              ;
            avst_source_axc_1_8d_32                    <=  4'b0              ;
            
            avst_source_axc_1_9d                      <=  4'b0                            ;
            avst_source_axc_1_9d_1                    <=  4'b0                            ;
            avst_source_axc_1_9d_2                    <=  4'b0                            ;
            avst_source_axc_1_9d_3                    <=  4'b0               ;
            avst_source_axc_1_9d_4                    <=  4'b0               ;
            avst_source_axc_1_9d_5                    <=  4'b0               ;
            avst_source_axc_1_9d_6                    <=  4'b0               ;
            avst_source_axc_1_9d_7                    <=  4'b0               ;
            avst_source_axc_1_9d_8                    <=  4'b0               ;
            avst_source_axc_1_9d_9                    <=  4'b0               ;
            avst_source_axc_1_9d_10                    <=  4'b0               ;
            avst_source_axc_1_9d_11                    <=  4'b0               ;
            avst_source_axc_1_9d_12                    <=  4'b0               ;
            avst_source_axc_1_9d_13                    <=  4'b0               ;
            avst_source_axc_1_9d_14                    <=  4'b0               ;
            avst_source_axc_1_9d_15                    <=  4'b0               ;
            avst_source_axc_1_9d_16                    <=  4'b0               ;
            avst_source_axc_1_9d_17                    <=  4'b0               ;
            avst_source_axc_1_9d_18                    <=  4'b0               ;
            avst_source_axc_1_9d_19                    <=  4'b0               ;
            avst_source_axc_1_9d_20                    <=  4'b0               ;
            avst_source_axc_1_9d_21                    <=  4'b0               ;
            avst_source_axc_1_9d_22                    <=  4'b0               ;
            avst_source_axc_1_9d_23                    <=  4'b0               ;
            avst_source_axc_1_9d_24                    <=  4'b0               ;
            avst_source_axc_1_9d_25                    <=  4'b0              ;
            avst_source_axc_1_9d_26                    <=  4'b0              ;
            avst_source_axc_1_9d_27                    <=  4'b0              ;
            avst_source_axc_1_9d_28                    <=  4'b0              ;
            avst_source_axc_1_9d_29                    <=  4'b0              ;
            avst_source_axc_1_9d_30                    <=  4'b0              ;
            avst_source_axc_1_9d_31                    <=  4'b0              ;
            avst_source_axc_1_9d_32                    <=  4'b0              ;
            avst_source_axc_1_10d                      <=  4'b0              ;
            avst_source_axc_1_10d_1                    <=  4'b0              ;
            avst_source_axc_1_10d_2                    <=  4'b0              ;
            avst_source_axc_1_10d_3                    <=  4'b0              ;
            avst_source_axc_1_10d_4                    <=  4'b0              ;
            avst_source_axc_1_10d_5                    <=  4'b0              ;
            avst_source_axc_1_10d_6                    <=  4'b0              ;
            avst_source_axc_1_10d_7                    <=  4'b0              ;
            avst_source_axc_1_10d_8                    <=  4'b0              ;
            avst_source_axc_1_10d_9                    <=  4'b0              ;
            avst_source_axc_1_10d_10                   <=  4'b0              ;
            avst_source_axc_1_10d_11                   <=  4'b0              ;
            avst_source_axc_1_10d_12                   <=  4'b0              ;
            avst_source_axc_1_10d_13                   <=  4'b0              ;
            avst_source_axc_1_10d_14                   <=  4'b0              ;
            avst_source_axc_1_10d_15                   <=  4'b0              ;
            avst_source_axc_1_10d_16                   <=  4'b0              ;
            avst_source_axc_1_10d_17                   <=  4'b0              ;
            avst_source_axc_1_11d                      <=  4'b0              ;
            avst_source_axc_1_11d_1                    <=  4'b0              ;
            avst_source_axc_1_11d_2                    <=  4'b0              ;
            avst_source_axc_1_11d_3                    <=  4'b0              ;
            avst_source_axc_1_11d_4                    <=  4'b0              ;
            avst_source_axc_1_11d_5                    <=  4'b0              ;
            avst_source_axc_1_11d_6                    <=  4'b0              ;
            avst_source_axc_1_11d_7                    <=  4'b0              ;
            avst_source_axc_1_11d_8                    <=  4'b0              ;
             avst_source_axc_1_9d_bf                      <=  4'b0                            ;
             avst_source_axc_1_9d_1_bf                    <=  4'b0                            ;
             avst_source_axc_1_9d_2_bf                    <=  4'b0                            ;
             avst_source_axc_1_9d_3_bf                    <=  4'b0               ;
             avst_source_axc_1_9d_4_bf                    <=  4'b0               ;
             avst_source_axc_1_9d_5_bf                    <=  4'b0               ;
             avst_source_axc_1_9d_6_bf                    <=  4'b0               ;
             avst_source_axc_1_9d_7_bf                    <=  4'b0               ;
             avst_source_axc_1_9d_8_bf                    <=  4'b0               ;
             avst_source_axc_1_9d_9_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_10_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_11_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_12_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_13_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_14_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_15_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_16_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_17_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_18_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_19_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_20_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_21_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_22_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_23_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_24_bf                    <=  4'b0               ;
            avst_source_axc_1_9d_25_bf                    <=  4'b0              ;
            avst_source_axc_1_9d_26_bf                    <=  4'b0              ;
            avst_source_axc_1_9d_27_bf                    <=  4'b0              ;
            avst_source_axc_1_9d_28_bf                    <=  4'b0              ;
            avst_source_axc_1_9d_29_bf                    <=  4'b0              ;
            avst_source_axc_1_9d_30_bf                    <=  4'b0              ;
            avst_source_axc_1_9d_31_bf                    <=  4'b0              ;
            avst_source_axc_1_9d_32_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_bf                      <=  4'b0              ;
             avst_source_axc_1_10d_1_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_2_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_3_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_4_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_5_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_6_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_7_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_8_bf                    <=  4'b0              ;
             avst_source_axc_1_10d_9_bf                    <=  4'b0              ;
            avst_source_axc_1_10d_10_bf                   <=  4'b0              ;
            avst_source_axc_1_10d_11_bf                   <=  4'b0              ;
            avst_source_axc_1_10d_12_bf                   <=  4'b0              ;
            avst_source_axc_1_10d_13_bf                   <=  4'b0              ;
            avst_source_axc_1_10d_14_bf                   <=  4'b0              ;
            avst_source_axc_1_10d_15_bf                   <=  4'b0              ;
            avst_source_axc_1_10d_16_bf                   <=  4'b0              ;
            avst_source_axc_1_10d_17_bf                   <=  4'b0              ;
            avst_source_axc_1_11d_bf                      <=  4'b0              ;
            avst_source_axc_1_11d_1_bf                    <=  4'b0              ;
            avst_source_axc_1_11d_2_bf                    <=  4'b0              ;
            avst_source_axc_1_11d_3_bf                    <=  4'b0              ;
            avst_source_axc_1_11d_4_bf                    <=  4'b0              ;
            avst_source_axc_1_11d_5_bf                    <=  4'b0              ;
            avst_source_axc_1_11d_6_bf                    <=  4'b0              ;
            avst_source_axc_1_11d_7_bf                    <=  4'b0              ;
            avst_source_axc_1_11d_8_bf                    <=  4'b0              ;
            avst_source_axc_1_12d                        <=  4'b0              ;
            avst_source_axc_1_12d_1                      <=  4'b0              ;
            avst_source_axc_1_12d_2                      <=  4'b0              ;
            avst_source_axc_1_12d_3                      <=  4'b0              ;
            avst_source_axc_1_12d_4                      <=  4'b0              ;
            avst_source_axc_1_12d_5                      <=  4'b0              ;
            avst_source_axc_1_12d_6                      <=  4'b0              ;
            avst_source_axc_1_12d_7                      <=  4'b0              ;
            avst_source_axc_1_12d_8                      <=  4'b0              ;
            
            avst_source_ready_2_1d                    <=  1'b0                            ;
            avst_source_ready_2_1d_dup1               <=  'd0                             ;
            avst_source_ready_2_1d_dup6               <=  'd0                             ;
            avst_source_ready_2_1d_dup7               <=  'd0                             ;
            avst_source_ready_2_2d                    <=  1'b0                            ;
            avst_source_ready_2_3d                    <=  1'b0                            ;
            avst_source_ready_2_4d                    <=  1'b0                            ;
            avst_source_ready_2_5d                    <=  1'b0                            ;
            avst_source_ready_2_6d                    <=  1'b0                            ;
            avst_source_ready_2_7d                    <=  1'b0                            ;
            avst_source_ready_2_8d                    <=  1'b0                            ;
            avst_source_ready_2_9d                    <=  1'b0                            ;
            avst_source_ready_2_10d                   <=  1'b0                            ;
            avst_source_ready_2_11d                   <=  1'b0                            ;
            avst_source_ready_2_12d                   <=  1'b0                            ;
            avst_source_ready_2_13d                   <=  1'b0                            ;
            avst_source_ready_2_14d                   <=  1'b0                            ;
            avst_source_ready_2_15d                   <=  1'b0                            ;
            avst_source_ready_2_16d                   <=  1'b0                            ;
            avst_source_symbol_2_1d                   <=  4'b0                            ;
            avst_source_symbol_2_2d                   <=  4'b0                            ;
            avst_source_symbol_2_3d                   <=  4'b0                            ;
            avst_source_symbol_2_4d                   <=  4'b0                            ;
            avst_source_symbol_2_5d                   <=  4'b0                            ;
            avst_source_symbol_2_6d                   <=  4'b0                            ;
            avst_source_symbol_2_7d                   <=  4'b0                            ;
            avst_source_symbol_2_8d                   <=  4'b0                            ;
            avst_source_symbol_2_9d                   <=  4'b0                            ;
            avst_source_symbol_2_10d                  <=  4'b0                            ;
            avst_source_symbol_2_11d                  <=  4'b0                            ;
            avst_source_symbol_2_12d                  <=  4'b0                            ;
            avst_source_symbol_2_13d_dup1             <=  4'b0                            ;
            avst_source_symbol_2_13d_dup2             <=  4'b0                            ;
            avst_source_symbol_2_14d_dup1             <=  4'b0                            ;
            avst_source_symbol_2_14d_dup2             <=  4'b0                            ;
            avst_source_symbol_2_14d_dup3             <=  4'b0                            ;
            avst_source_symbol_2_14d_dup4             <=  4'b0                            ;
            avst_source_axc_2_0d                      <=  4'b0                            ;
            avst_source_axc_2_1d                      <=  4'b0                            ;
            avst_source_axc_2_2d                      <=  4'b0                            ;
            avst_source_axc_2_3d                      <=  4'b0                            ;
            avst_source_axc_2_4d                      <=  4'b0                            ;
            avst_source_axc_2_5d                      <=  4'b0                            ;
            avst_source_axc_2_6d                      <=  4'b0                            ;  
            
            avst_source_axc_2_6d_1                    <=  4'b0;       // CHANGED
            avst_source_axc_2_6d_2                    <=  4'b0;       // CHANGED
            avst_source_axc_2_6d_3                    <=  4'b0;       // CHANGED
            avst_source_axc_2_6d_4                    <=  4'b0;       // CHANGED
            avst_source_axc_2_6d_5                    <=  4'b0;       // CHANGED
            avst_source_axc_2_6d_6                    <=  4'b0;       // CHANGED
            avst_source_axc_2_6d_7                    <=  4'b0;       // CHANGED
            avst_source_axc_2_6d_8                    <=  4'b0;       // CHANGED
            
            avst_source_axc_2_7d                      <=  4'b0                            ;
            avst_source_axc_2_7d_1                    <=  4'b0                            ;
            avst_source_axc_2_7d_2                    <=  4'b0                            ;
            avst_source_axc_2_7d_3                    <=  4'b0                            ;
            avst_source_axc_2_7d_4                    <=  4'b0                            ;
            avst_source_axc_2_7d_5                    <=  4'b0                            ;
            avst_source_axc_2_7d_6                    <=  4'b0                            ;
            avst_source_axc_2_7d_7                    <=  4'b0                            ;
            avst_source_axc_2_7d_8                    <=  4'b0                            ;
            avst_source_axc_2_7d_9                    <=  4'b0                            ;
            avst_source_axc_2_7d_10                   <=  4'b0              ;
            avst_source_axc_2_7d_11                   <=  4'b0              ;
            avst_source_axc_2_7d_12                   <=  4'b0              ;
            avst_source_axc_2_7d_13                   <=  4'b0              ;
            avst_source_axc_2_7d_14                   <=  4'b0              ;
            avst_source_axc_2_7d_15                   <=  4'b0              ;
            avst_source_axc_2_7d_16                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_17                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_18                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_19                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_20                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_21                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_22                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_23                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_24                   <=  4'b0              ;
            // CHANGED avst_source_axc_7d_25                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_26                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_27                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_28                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_29                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_30                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_31                    <=  4'b0              ;
            // CHANGED avst_source_axc_7d_32                    <=  4'b0              ;
            avst_source_axc_2_8d                      <=  4'b0                            ;
            avst_source_axc_2_8d_1                    <=  4'b0                            ;
            avst_source_axc_2_8d_2                    <=  4'b0                            ;
            avst_source_axc_2_8d_3                    <=  4'b0                            ;
            avst_source_axc_2_8d_4                    <=  4'b0                            ;
            avst_source_axc_2_8d_5                    <=  4'b0              ;
            avst_source_axc_2_8d_6                    <=  4'b0              ;
            avst_source_axc_2_8d_7                    <=  4'b0              ;
            avst_source_axc_2_8d_8                    <=  4'b0              ;
            avst_source_axc_2_8d_9                    <=  4'b0              ;
            avst_source_axc_2_8d_10                    <=  4'b0              ;
            avst_source_axc_2_8d_11                    <=  4'b0              ;
            avst_source_axc_2_8d_12                    <=  4'b0              ;
            avst_source_axc_2_8d_13                    <=  4'b0              ;
            avst_source_axc_2_8d_14                    <=  4'b0              ;
            avst_source_axc_2_8d_15                    <=  4'b0              ;
            avst_source_axc_2_8d_16                    <=  4'b0              ;
            avst_source_axc_2_8d_17                    <=  4'b0              ;
            avst_source_axc_2_8d_18                    <=  4'b0              ;
            avst_source_axc_2_8d_19                    <=  4'b0              ;
            avst_source_axc_2_8d_20                    <=  4'b0              ;
            avst_source_axc_2_8d_21                    <=  4'b0              ;
            avst_source_axc_2_8d_22                    <=  4'b0              ;
            avst_source_axc_2_8d_23                    <=  4'b0              ;
            avst_source_axc_2_8d_24                    <=  4'b0              ;
            avst_source_axc_2_8d_25                    <=  4'b0              ;
            avst_source_axc_2_8d_26                    <=  4'b0              ;
            avst_source_axc_2_8d_27                    <=  4'b0              ;
            avst_source_axc_2_8d_28                    <=  4'b0              ;
            avst_source_axc_2_8d_29                    <=  4'b0              ;
            avst_source_axc_2_8d_30                    <=  4'b0              ;
            avst_source_axc_2_8d_31                    <=  4'b0              ;
            avst_source_axc_2_8d_32                    <=  4'b0              ;
            
            avst_source_axc_2_9d                      <=  4'b0                            ;
            avst_source_axc_2_9d_1                    <=  4'b0                            ;
            avst_source_axc_2_9d_2                    <=  4'b0                            ;
            avst_source_axc_2_9d_3                    <=  4'b0               ;
            avst_source_axc_2_9d_4                    <=  4'b0               ;
            avst_source_axc_2_9d_5                    <=  4'b0               ;
            avst_source_axc_2_9d_6                    <=  4'b0               ;
            avst_source_axc_2_9d_7                    <=  4'b0               ;
            avst_source_axc_2_9d_8                    <=  4'b0               ;
            avst_source_axc_2_9d_9                    <=  4'b0               ;
            avst_source_axc_2_9d_10                    <=  4'b0               ;
            avst_source_axc_2_9d_11                    <=  4'b0               ;
            avst_source_axc_2_9d_12                    <=  4'b0               ;
            avst_source_axc_2_9d_13                    <=  4'b0               ;
            avst_source_axc_2_9d_14                    <=  4'b0               ;
            avst_source_axc_2_9d_15                    <=  4'b0               ;
            avst_source_axc_2_9d_16                    <=  4'b0               ;
            avst_source_axc_2_9d_17                    <=  4'b0               ;
            avst_source_axc_2_9d_18                    <=  4'b0               ;
            avst_source_axc_2_9d_19                    <=  4'b0               ;
            avst_source_axc_2_9d_20                    <=  4'b0               ;
            avst_source_axc_2_9d_21                    <=  4'b0               ;
            avst_source_axc_2_9d_22                    <=  4'b0               ;
            avst_source_axc_2_9d_23                    <=  4'b0               ;
            avst_source_axc_2_9d_24                    <=  4'b0               ;
            avst_source_axc_2_9d_25                    <=  4'b0              ;
            avst_source_axc_2_9d_26                    <=  4'b0              ;
            avst_source_axc_2_9d_27                    <=  4'b0              ;
            avst_source_axc_2_9d_28                    <=  4'b0              ;
            avst_source_axc_2_9d_29                    <=  4'b0              ;
            avst_source_axc_2_9d_30                    <=  4'b0              ;
            avst_source_axc_2_9d_31                    <=  4'b0              ;
            avst_source_axc_2_9d_32                    <=  4'b0              ;
            avst_source_axc_2_10d                      <=  4'b0              ;
            avst_source_axc_2_10d_1                    <=  4'b0              ;
            avst_source_axc_2_10d_2                    <=  4'b0              ;
            avst_source_axc_2_10d_3                    <=  4'b0              ;
            avst_source_axc_2_10d_4                    <=  4'b0              ;
            avst_source_axc_2_10d_5                    <=  4'b0              ;
            avst_source_axc_2_10d_6                    <=  4'b0              ;
            avst_source_axc_2_10d_7                    <=  4'b0              ;
            avst_source_axc_2_10d_8                    <=  4'b0              ;
            avst_source_axc_2_10d_9                    <=  4'b0              ;
            avst_source_axc_2_10d_10                   <=  4'b0              ;
            avst_source_axc_2_10d_11                   <=  4'b0              ;
            avst_source_axc_2_10d_12                   <=  4'b0              ;
            avst_source_axc_2_10d_13                   <=  4'b0              ;
            avst_source_axc_2_10d_14                   <=  4'b0              ;
            avst_source_axc_2_10d_15                   <=  4'b0              ;
            avst_source_axc_2_10d_16                   <=  4'b0              ;
            avst_source_axc_2_10d_17                   <=  4'b0              ;
            avst_source_axc_2_11d                      <=  4'b0              ;
            avst_source_axc_2_11d_1                    <=  4'b0              ;
            avst_source_axc_2_11d_2                    <=  4'b0              ;
            avst_source_axc_2_11d_3                    <=  4'b0              ;
            avst_source_axc_2_11d_4                    <=  4'b0              ;
            avst_source_axc_2_11d_5                    <=  4'b0              ;
            avst_source_axc_2_11d_6                    <=  4'b0              ;
            avst_source_axc_2_11d_7                    <=  4'b0              ;
            avst_source_axc_2_11d_8                    <=  4'b0              ;
             avst_source_axc_2_9d_bf                      <=  4'b0                            ;
             avst_source_axc_2_9d_1_bf                    <=  4'b0                            ;
             avst_source_axc_2_9d_2_bf                    <=  4'b0                            ;
             avst_source_axc_2_9d_3_bf                    <=  4'b0               ;
             avst_source_axc_2_9d_4_bf                    <=  4'b0               ;
             avst_source_axc_2_9d_5_bf                    <=  4'b0               ;
             avst_source_axc_2_9d_6_bf                    <=  4'b0               ;
             avst_source_axc_2_9d_7_bf                    <=  4'b0               ;
             avst_source_axc_2_9d_8_bf                    <=  4'b0               ;
             avst_source_axc_2_9d_9_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_10_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_11_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_12_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_13_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_14_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_15_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_16_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_17_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_18_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_19_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_20_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_21_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_22_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_23_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_24_bf                    <=  4'b0               ;
            avst_source_axc_2_9d_25_bf                    <=  4'b0              ;
            avst_source_axc_2_9d_26_bf                    <=  4'b0              ;
            avst_source_axc_2_9d_27_bf                    <=  4'b0              ;
            avst_source_axc_2_9d_28_bf                    <=  4'b0              ;
            avst_source_axc_2_9d_29_bf                    <=  4'b0              ;
            avst_source_axc_2_9d_30_bf                    <=  4'b0              ;
            avst_source_axc_2_9d_31_bf                    <=  4'b0              ;
            avst_source_axc_2_9d_32_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_bf                      <=  4'b0              ;
             avst_source_axc_2_10d_1_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_2_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_3_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_4_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_5_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_6_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_7_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_8_bf                    <=  4'b0              ;
             avst_source_axc_2_10d_9_bf                    <=  4'b0              ;
            avst_source_axc_2_10d_10_bf                   <=  4'b0              ;
            avst_source_axc_2_10d_11_bf                   <=  4'b0              ;
            avst_source_axc_2_10d_12_bf                   <=  4'b0              ;
            avst_source_axc_2_10d_13_bf                   <=  4'b0              ;
            avst_source_axc_2_10d_14_bf                   <=  4'b0              ;
            avst_source_axc_2_10d_15_bf                   <=  4'b0              ;
            avst_source_axc_2_10d_16_bf                   <=  4'b0              ;
            avst_source_axc_2_10d_17_bf                   <=  4'b0              ;
            avst_source_axc_2_11d_bf                      <=  4'b0              ;
            avst_source_axc_2_11d_1_bf                    <=  4'b0              ;
            avst_source_axc_2_11d_2_bf                    <=  4'b0              ;
            avst_source_axc_2_11d_3_bf                    <=  4'b0              ;
            avst_source_axc_2_11d_4_bf                    <=  4'b0              ;
            avst_source_axc_2_11d_5_bf                    <=  4'b0              ;
            avst_source_axc_2_11d_6_bf                    <=  4'b0              ;
            avst_source_axc_2_11d_7_bf                    <=  4'b0              ;
            avst_source_axc_2_11d_8_bf                    <=  4'b0              ;
            avst_source_axc_2_12d                      <=  4'b0              ;
            avst_source_axc_2_12d_1                      <=  4'b0              ;
            avst_source_axc_2_12d_2                      <=  4'b0              ;
            avst_source_axc_2_12d_3                      <=  4'b0              ;
            avst_source_axc_2_12d_4                      <=  4'b0              ;
            avst_source_axc_2_12d_5                      <=  4'b0              ;
            avst_source_axc_2_12d_6                      <=  4'b0              ;
            avst_source_axc_2_12d_7                      <=  4'b0              ;
            avst_source_axc_2_12d_8                      <=  4'b0              ;
    //        avst_source_data_even_sym_1d            <=  {NUM_OF_IF*DSP_DATAWIDTH{1'b0}} ;   
    //        avst_source_data_odd_sym_1d             <=  {NUM_OF_IF*DSP_DATAWIDTH{1'b0}} ; 
    //        avst_source_data_even_odd_sym_1d        <=  {NUM_OF_IF*DSP_DATAWIDTH{1'b0}} ;             
            avst_source_data_1                        <=  {NUM_OF_IF*DSP_DATAWIDTH/2{1'b0}} ;
            avst_source_data_2                        <=  {NUM_OF_IF*DSP_DATAWIDTH/2{1'b0}} ;            
             c_ram_rden_1d                          <=  1'b0                            ; 
             c_ram_rden_2d                          <=  1'b0                            ; 
             c_ram_rden_3d                          <=  1'b0                            ;
             c_ram_rden_4d                          <=  1'b0                            ;
             c_ram_rden_5d                          <=  1'b0                            ; 
             c_ram_rden_6d                          <=  1'b0                            ; 
             c_ram_rden_7d                          <=  1'b0                            ;
             c_ram_rden_8d                          <=  1'b0                            ;              
            c_ram_readdata_1d                       <=  47'b0                           ;
            c_ram_readdata_2d                       <=  47'b0                           ;    
            c_ram_rdaddress_1d                      <=    'd0                                ;
            c_ram_rdaddress_2d                      <=  'd0                                ;
            bw_config_reg_cc1_1d                    <=     'd0                                ;
            bw_config_reg_cc1_2d                    <=     'd0                                ;
            bw_config_reg_cc2_1d                    <=     'd0                                ;
            bw_config_reg_cc2_2d                    <=     'd0                                ;
            
        end 
        else 
        begin
   // for line up 1        
            avst_source_ready_1_1d                    <=  avst_source_ready_1             ;
            avst_source_ready_1_1d_dup1               <=  avst_source_ready_1             ;            
            avst_source_ready_1_1d_dup6               <=  avst_source_ready_1             ;
            avst_source_ready_1_1d_dup7               <=  avst_source_ready_1             ;              
            avst_source_ready_1_2d                    <=  avst_source_ready_1_1d          ;
            avst_source_ready_1_3d                    <=  avst_source_ready_1_2d            ;
            avst_source_ready_1_4d                    <=  avst_source_ready_1_3d            ;
            avst_source_ready_1_5d                    <=  avst_source_ready_1_4d            ;
            avst_source_ready_1_6d                    <=  avst_source_ready_1_5d            ;
            avst_source_ready_1_7d                    <=  avst_source_ready_1_6d            ;
            avst_source_ready_1_8d                    <=  avst_source_ready_1_7d            ;
            avst_source_ready_1_9d                    <=  avst_source_ready_1_8d            ;
            avst_source_ready_1_10d                   <=  avst_source_ready_1_9d            ;
            avst_source_ready_1_11d                   <=  avst_source_ready_1_10d           ;
            avst_source_ready_1_12d                   <=  avst_source_ready_1_11d           ;
            avst_source_ready_1_13d                   <=  avst_source_ready_1_12d           ;
            avst_source_ready_1_14d                   <=  avst_source_ready_1_13d           ;
            avst_source_ready_1_15d                   <=  avst_source_ready_1_14d           ;
            avst_source_ready_1_16d                   <=  avst_source_ready_1_15d           ;
            avst_source_symbol_1_1d                   <=  avst_source_symbol_1              ;
            avst_source_symbol_1_2d                   <=  avst_source_symbol_1_1d           ;
            avst_source_symbol_1_3d                   <=  avst_source_symbol_1_2d           ;
            avst_source_symbol_1_4d                   <=  avst_source_symbol_1_3d           ;
            avst_source_symbol_1_5d                   <=  avst_source_symbol_1_4d           ;
            avst_source_symbol_1_6d                   <=  avst_source_symbol_1_5d           ;
            avst_source_symbol_1_7d                   <=  avst_source_symbol_1_6d           ;
            avst_source_symbol_1_8d                   <=  avst_source_symbol_1_7d           ;
            avst_source_symbol_1_9d                   <=  avst_source_symbol_1_8d           ;
            avst_source_symbol_1_10d                  <=  avst_source_symbol_1_9d           ;
            avst_source_symbol_1_11d                  <=  avst_source_symbol_1_10d          ;
            avst_source_symbol_1_12d                  <=  avst_source_symbol_1_11d          ;
            avst_source_symbol_1_13d_dup1             <=  avst_source_symbol_1_12d          ;
            avst_source_symbol_1_13d_dup2             <=  avst_source_symbol_1_12d          ;
            avst_source_symbol_1_14d_dup1             <=  avst_source_symbol_1_13d_dup1     ;
            avst_source_symbol_1_14d_dup2             <=  avst_source_symbol_1_13d_dup1     ;
            avst_source_symbol_1_14d_dup3             <=  avst_source_symbol_1_13d_dup2     ;
            avst_source_symbol_1_14d_dup4             <=  avst_source_symbol_1_13d_dup2     ;
      avst_source_axc_1_0d                      <=  avst_source_axc_1                 ;
      avst_source_axc_1_1d                      <=  avst_source_axc_1_0d              ;
      avst_source_axc_1_2d                      <=  avst_source_axc_1_1d              ;
      avst_source_axc_1_3d                      <=  avst_source_axc_1_2d              ;
      avst_source_axc_1_4d                      <=  avst_source_axc_1_3d              ;
      avst_source_axc_1_5d                      <=  avst_source_axc_1_4d              ;
      
      avst_source_axc_1_6d                      <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_1                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_1                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_2                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_2                    <=  avst_source_axc_1_5d              ;      
      avst_source_axc_1_6d_3                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_3                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_4                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_4                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_5                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_5                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_6                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_6                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_7                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_7                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_8                    <=  avst_source_axc_1_5d              ;
      avst_source_axc_1_6d_8                    <=  avst_source_axc_1_5d              ;
      
      ///////////// CHANGES START /////////////////////////////////////////////////////
      avst_source_axc_1_7d                      <=  avst_source_axc_1_6d   ;
      avst_source_axc_1_7d_1                    <=  avst_source_axc_1_6d_1 ;
      avst_source_axc_1_7d_2                    <=  avst_source_axc_1_6d_1 ;
      avst_source_axc_1_7d_3                    <=  avst_source_axc_1_6d_2 ;
      avst_source_axc_1_7d_4                    <=  avst_source_axc_1_6d_2 ;
      avst_source_axc_1_7d_5                    <=  avst_source_axc_1_6d_3 ;
      avst_source_axc_1_7d_6                    <=  avst_source_axc_1_6d_3 ;
      avst_source_axc_1_7d_7                    <=  avst_source_axc_1_6d_4 ;
      avst_source_axc_1_7d_8                    <=  avst_source_axc_1_6d_4 ;
      avst_source_axc_1_7d_9                    <=  avst_source_axc_1_6d_5 ;
      avst_source_axc_1_7d_10                   <=  avst_source_axc_1_6d_5 ;
      avst_source_axc_1_7d_11                   <=  avst_source_axc_1_6d_6 ;
      avst_source_axc_1_7d_12                   <=  avst_source_axc_1_6d_6 ;
      avst_source_axc_1_7d_13                   <=  avst_source_axc_1_6d_7 ;
      avst_source_axc_1_7d_14                   <=  avst_source_axc_1_6d_7 ;
      avst_source_axc_1_7d_15                   <=  avst_source_axc_1_6d_8 ;
      avst_source_axc_1_7d_16                   <=  avst_source_axc_1_6d_8 ;    
          
      avst_source_axc_1_8d                      <=  avst_source_axc_1_7d   ;
      avst_source_axc_1_8d_1                    <=  avst_source_axc_1_7d_1 ;
      avst_source_axc_1_8d_2                    <=  avst_source_axc_1_7d_1 ;
      avst_source_axc_1_8d_3                    <=  avst_source_axc_1_7d_2 ;
      avst_source_axc_1_8d_4                    <=  avst_source_axc_1_7d_2 ;
      avst_source_axc_1_8d_5                    <=  avst_source_axc_1_7d_3 ;
      avst_source_axc_1_8d_6                    <=  avst_source_axc_1_7d_3 ;
      avst_source_axc_1_8d_7                    <=  avst_source_axc_1_7d_4 ;
      avst_source_axc_1_8d_8                    <=  avst_source_axc_1_7d_4 ;
      avst_source_axc_1_8d_9                    <=  avst_source_axc_1_7d_5 ;
      avst_source_axc_1_8d_10                   <=  avst_source_axc_1_7d_5 ;
      avst_source_axc_1_8d_11                   <=  avst_source_axc_1_7d_6 ;
      avst_source_axc_1_8d_12                   <=  avst_source_axc_1_7d_6 ;
      avst_source_axc_1_8d_13                   <=  avst_source_axc_1_7d_7 ;
      avst_source_axc_1_8d_14                   <=  avst_source_axc_1_7d_7 ;
      avst_source_axc_1_8d_15                   <=  avst_source_axc_1_7d_8 ;
      avst_source_axc_1_8d_16                   <=  avst_source_axc_1_7d_8 ;
      avst_source_axc_1_8d_17                   <=  avst_source_axc_1_7d_9 ;
      avst_source_axc_1_8d_18                   <=  avst_source_axc_1_7d_9 ;
      avst_source_axc_1_8d_19                   <=  avst_source_axc_1_7d_10;
      avst_source_axc_1_8d_20                   <=  avst_source_axc_1_7d_10;
      avst_source_axc_1_8d_21                   <=  avst_source_axc_1_7d_11;
      avst_source_axc_1_8d_22                   <=  avst_source_axc_1_7d_11;
      avst_source_axc_1_8d_23                   <=  avst_source_axc_1_7d_12;
      avst_source_axc_1_8d_24                   <=  avst_source_axc_1_7d_12;
      avst_source_axc_1_8d_25                   <=  avst_source_axc_1_7d_13;
      avst_source_axc_1_8d_26                   <=  avst_source_axc_1_7d_13;
      avst_source_axc_1_8d_27                   <=  avst_source_axc_1_7d_14;
      avst_source_axc_1_8d_28                   <=  avst_source_axc_1_7d_14;
      avst_source_axc_1_8d_29                   <=  avst_source_axc_1_7d_15;
      avst_source_axc_1_8d_30                   <=  avst_source_axc_1_7d_15;
      avst_source_axc_1_8d_31                   <=  avst_source_axc_1_7d_16;
      avst_source_axc_1_8d_32                   <=  avst_source_axc_1_7d_16;            
            ///////////// CHANGES END /////////////////////////////////////////////////////
      avst_source_axc_1_9d                       <=  avst_source_axc_1_8d              ;
      avst_source_axc_1_9d_1                     <=  avst_source_axc_1_8d_1              ;
      avst_source_axc_1_9d_2                     <=  avst_source_axc_1_8d_2              ;
      avst_source_axc_1_9d_3                     <=  avst_source_axc_1_8d_3              ;
      avst_source_axc_1_9d_4                     <=  avst_source_axc_1_8d_4              ;
      avst_source_axc_1_9d_5                     <=  avst_source_axc_1_8d_5              ;
      avst_source_axc_1_9d_6                     <=  avst_source_axc_1_8d_6              ;
      avst_source_axc_1_9d_7                     <=  avst_source_axc_1_8d_7              ;
      avst_source_axc_1_9d_8                     <=  avst_source_axc_1_8d_8              ;
      avst_source_axc_1_9d_9                     <=  avst_source_axc_1_8d_9              ;
      avst_source_axc_1_9d_10                    <=  avst_source_axc_1_8d_10              ;
      avst_source_axc_1_9d_11                    <=  avst_source_axc_1_8d_11              ;
      avst_source_axc_1_9d_12                    <=  avst_source_axc_1_8d_12              ;
      avst_source_axc_1_9d_13                    <=  avst_source_axc_1_8d_13              ;
      avst_source_axc_1_9d_14                    <=  avst_source_axc_1_8d_14              ;
      avst_source_axc_1_9d_15                    <=  avst_source_axc_1_8d_15              ;
      avst_source_axc_1_9d_16                    <=  avst_source_axc_1_8d_16              ;
      avst_source_axc_1_9d_17                    <=  avst_source_axc_1_8d_17              ;
      avst_source_axc_1_9d_18                    <=  avst_source_axc_1_8d_18              ;
      avst_source_axc_1_9d_19                    <=  avst_source_axc_1_8d_19              ;
      avst_source_axc_1_9d_20                    <=  avst_source_axc_1_8d_20              ;
      avst_source_axc_1_9d_21                    <=  avst_source_axc_1_8d_21              ;
      avst_source_axc_1_9d_22                    <=  avst_source_axc_1_8d_22              ;
      avst_source_axc_1_9d_23                    <=  avst_source_axc_1_8d_23              ;
      avst_source_axc_1_9d_24                    <=  avst_source_axc_1_8d_24                ;
      avst_source_axc_1_9d_25                    <=  avst_source_axc_1_8d_25              ;
      avst_source_axc_1_9d_26                    <=  avst_source_axc_1_8d_26              ;
      avst_source_axc_1_9d_27                    <=  avst_source_axc_1_8d_27              ;
      avst_source_axc_1_9d_28                    <=  avst_source_axc_1_8d_28              ;
      avst_source_axc_1_9d_29                    <=  avst_source_axc_1_8d_29              ;
      avst_source_axc_1_9d_30                    <=  avst_source_axc_1_8d_30              ;
      avst_source_axc_1_9d_31                    <=  avst_source_axc_1_8d_31              ;
      avst_source_axc_1_9d_32                    <=  avst_source_axc_1_8d_32              ;
      
      // Duplicate for mux selection
       avst_source_axc_1_9d_bf                      <=  avst_source_axc_1_8d              ;
       avst_source_axc_1_9d_1_bf                    <=  avst_source_axc_1_8d_1              ;
       avst_source_axc_1_9d_2_bf                    <=  avst_source_axc_1_8d_2              ;
       avst_source_axc_1_9d_3_bf                    <=  avst_source_axc_1_8d_3              ;
       avst_source_axc_1_9d_4_bf                    <=  avst_source_axc_1_8d_4              ;
       avst_source_axc_1_9d_5_bf                    <=  avst_source_axc_1_8d_5              ;
       avst_source_axc_1_9d_6_bf                    <=  avst_source_axc_1_8d_6              ;
       avst_source_axc_1_9d_7_bf                    <=  avst_source_axc_1_8d_7              ;
       avst_source_axc_1_9d_8_bf                    <=  avst_source_axc_1_8d_8              ;
       avst_source_axc_1_9d_9_bf                    <=  avst_source_axc_1_8d_9              ;
      avst_source_axc_1_9d_10_bf                    <=  avst_source_axc_1_8d_10              ;
      avst_source_axc_1_9d_11_bf                    <=  avst_source_axc_1_8d_11              ;
      avst_source_axc_1_9d_12_bf                    <=  avst_source_axc_1_8d_12              ;
      avst_source_axc_1_9d_13_bf                    <=  avst_source_axc_1_8d_13              ;
      avst_source_axc_1_9d_14_bf                    <=  avst_source_axc_1_8d_14              ;
      avst_source_axc_1_9d_15_bf                    <=  avst_source_axc_1_8d_15              ;
      avst_source_axc_1_9d_16_bf                    <=  avst_source_axc_1_8d_16              ;
      avst_source_axc_1_9d_17_bf                    <=  avst_source_axc_1_8d_17              ;
      avst_source_axc_1_9d_18_bf                    <=  avst_source_axc_1_8d_18              ;
      avst_source_axc_1_9d_19_bf                    <=  avst_source_axc_1_8d_19              ;
      avst_source_axc_1_9d_20_bf                    <=  avst_source_axc_1_8d_20              ;
      avst_source_axc_1_9d_21_bf                    <=  avst_source_axc_1_8d_21              ;
      avst_source_axc_1_9d_22_bf                    <=  avst_source_axc_1_8d_22              ;
      avst_source_axc_1_9d_23_bf                    <=  avst_source_axc_1_8d_23              ;
      avst_source_axc_1_9d_24_bf                    <=  avst_source_axc_1_8d_24               ;
      avst_source_axc_1_9d_25_bf                    <=  avst_source_axc_1_8d_25              ;
      avst_source_axc_1_9d_26_bf                    <=  avst_source_axc_1_8d_26              ;
      avst_source_axc_1_9d_27_bf                    <=  avst_source_axc_1_8d_27              ;
      avst_source_axc_1_9d_28_bf                    <=  avst_source_axc_1_8d_28              ;
      avst_source_axc_1_9d_29_bf                    <=  avst_source_axc_1_8d_29              ;
      avst_source_axc_1_9d_30_bf                    <=  avst_source_axc_1_8d_30              ;
      avst_source_axc_1_9d_31_bf                    <=  avst_source_axc_1_8d_31              ;
      avst_source_axc_1_9d_32_bf                    <=  avst_source_axc_1_8d_32              ;
      
  
      // Modified duplicate register routing for timing closure - don't modify
      avst_source_axc_1_10d                      <=   avst_source_axc_1_9d_bf                 ;
      avst_source_axc_1_10d_1                    <=   avst_source_axc_1_9d_1_bf               ;
      avst_source_axc_1_10d_2                    <=   avst_source_axc_1_9d_3_bf               ;
      avst_source_axc_1_10d_3                    <=   avst_source_axc_1_9d_5_bf               ;
      avst_source_axc_1_10d_4                    <=   avst_source_axc_1_9d_7_bf               ;
      avst_source_axc_1_10d_5                    <=   avst_source_axc_1_9d_9_bf               ;
      avst_source_axc_1_10d_6                    <=   avst_source_axc_1_9d_11_bf               ;
      avst_source_axc_1_10d_7                    <=   avst_source_axc_1_9d_13_bf               ;
      avst_source_axc_1_10d_8                    <=   avst_source_axc_1_9d_15_bf               ;
      avst_source_axc_1_10d_9                    <=   avst_source_axc_1_9d_14_bf               ;
      avst_source_axc_1_10d_10                   <=   avst_source_axc_1_9d_17_bf               ;
      avst_source_axc_1_10d_11                   <=   avst_source_axc_1_9d_18_bf               ;
      avst_source_axc_1_10d_12                   <=   avst_source_axc_1_9d_21_bf               ;
      avst_source_axc_1_10d_13                   <=   avst_source_axc_1_9d_22_bf               ;
      avst_source_axc_1_10d_14                   <=   avst_source_axc_1_9d_25_bf               ;
      avst_source_axc_1_10d_15                   <=   avst_source_axc_1_9d_26_bf               ;
      avst_source_axc_1_10d_16                   <=   avst_source_axc_1_9d_29_bf               ;
      avst_source_axc_1_10d_17                   <=   avst_source_axc_1_9d_30_bf               ;  
      
            // Modified duplicate register routing for timing closure - don't modify
      avst_source_axc_1_10d_bf                      <=   avst_source_axc_1_9d_bf              ;
      avst_source_axc_1_10d_1_bf                    <=   avst_source_axc_1_9d_1_bf              ;
      avst_source_axc_1_10d_2_bf                    <=   avst_source_axc_1_9d_3_bf              ;
      avst_source_axc_1_10d_3_bf                    <=   avst_source_axc_1_9d_5_bf              ;
      avst_source_axc_1_10d_4_bf                    <=   avst_source_axc_1_9d_7_bf              ;
      avst_source_axc_1_10d_5_bf                    <=   avst_source_axc_1_9d_9_bf              ;
      avst_source_axc_1_10d_6_bf                    <=  avst_source_axc_1_9d_11_bf              ;
      avst_source_axc_1_10d_7_bf                    <=  avst_source_axc_1_9d_13_bf              ;
      avst_source_axc_1_10d_8_bf                    <=  avst_source_axc_1_9d_15_bf              ;
      avst_source_axc_1_10d_9_bf                    <=  avst_source_axc_1_9d_14_bf              ;
      avst_source_axc_1_10d_10_bf                   <=  avst_source_axc_1_9d_17_bf              ;
      avst_source_axc_1_10d_11_bf                   <=  avst_source_axc_1_9d_18_bf              ;
      avst_source_axc_1_10d_12_bf                   <=  avst_source_axc_1_9d_21_bf              ;
      avst_source_axc_1_10d_13_bf                   <=  avst_source_axc_1_9d_22_bf              ;
      avst_source_axc_1_10d_14_bf                   <=  avst_source_axc_1_9d_25_bf              ;
      avst_source_axc_1_10d_15_bf                   <=  avst_source_axc_1_9d_26_bf              ;
      avst_source_axc_1_10d_16_bf                   <=  avst_source_axc_1_9d_29_bf              ;
      avst_source_axc_1_10d_17_bf                   <=  avst_source_axc_1_9d_30_bf              ; 
      
      // Modified duplicate register routing for timing closure - don't modify
      avst_source_axc_1_11d                      <=   avst_source_axc_1_10d_bf              ;
      avst_source_axc_1_11d_1                    <=   avst_source_axc_1_10d_1_bf              ;
      avst_source_axc_1_11d_2                    <=   avst_source_axc_1_10d_3_bf              ;
      avst_source_axc_1_11d_3                    <=   avst_source_axc_1_10d_5_bf              ;
      avst_source_axc_1_11d_4                    <=   avst_source_axc_1_10d_6_bf              ;
      avst_source_axc_1_11d_5                    <=  avst_source_axc_1_10d_10_bf              ;
      avst_source_axc_1_11d_6                    <=  avst_source_axc_1_10d_11_bf              ;
      avst_source_axc_1_11d_7                    <=  avst_source_axc_1_10d_14_bf              ;
      avst_source_axc_1_11d_8                    <=  avst_source_axc_1_10d_15_bf              ;
      
        avst_source_axc_1_11d_bf                 <=   avst_source_axc_1_10d_bf              ;
      avst_source_axc_1_11d_1_bf                 <=   avst_source_axc_1_10d_1_bf              ;
      avst_source_axc_1_11d_2_bf                 <=   avst_source_axc_1_10d_3_bf              ;
      avst_source_axc_1_11d_3_bf                 <=   avst_source_axc_1_10d_5_bf              ;
      avst_source_axc_1_11d_4_bf                 <=   avst_source_axc_1_10d_6_bf              ;
      avst_source_axc_1_11d_5_bf                 <=  avst_source_axc_1_10d_10_bf              ;
      avst_source_axc_1_11d_6_bf                 <=  avst_source_axc_1_10d_11_bf              ;
      avst_source_axc_1_11d_7_bf                 <=  avst_source_axc_1_10d_14_bf              ;
      avst_source_axc_1_11d_8_bf                 <=  avst_source_axc_1_10d_15_bf              ;
      
      avst_source_axc_1_12d                      <=  avst_source_axc_1_11d_bf                ;
      avst_source_axc_1_12d_1                    <=  avst_source_axc_1_11d_1_bf              ;
      avst_source_axc_1_12d_2                    <=  avst_source_axc_1_11d_2_bf              ;
      avst_source_axc_1_12d_3                    <=  avst_source_axc_1_11d_3_bf              ;
      avst_source_axc_1_12d_4                    <=  avst_source_axc_1_11d_4_bf              ;
      avst_source_axc_1_12d_5                    <=  avst_source_axc_1_11d_5_bf              ;
      avst_source_axc_1_12d_6                    <=  avst_source_axc_1_11d_6_bf              ;
      avst_source_axc_1_12d_7                    <=  avst_source_axc_1_11d_7_bf              ;
      avst_source_axc_1_12d_8                    <=  avst_source_axc_1_11d_8_bf              ;
      
   //   avst_source_data_even_sym_1d            <=  avst_source_data_even_sym                 ;   
   //   avst_source_data_odd_sym_1d             <=  avst_source_data_odd_sym                  ;
   //   avst_source_data_even_odd_sym_1d        <=  avst_source_data_even_odd_sym             ;    
  
   // for line up 2
            avst_source_ready_2_1d                    <=  avst_source_ready_2             ;
            avst_source_ready_2_1d_dup1               <=  avst_source_ready_2             ;            
            avst_source_ready_2_1d_dup6               <=  avst_source_ready_2             ;
            avst_source_ready_2_1d_dup7               <=  avst_source_ready_2             ;              
            avst_source_ready_2_2d                    <=  avst_source_ready_2_1d          ;
            avst_source_ready_2_3d                    <=  avst_source_ready_2_2d            ;
            avst_source_ready_2_4d                    <=  avst_source_ready_2_3d            ;
            avst_source_ready_2_5d                    <=  avst_source_ready_2_4d            ;
            avst_source_ready_2_6d                    <=  avst_source_ready_2_5d            ;
            avst_source_ready_2_7d                    <=  avst_source_ready_2_6d            ;
            avst_source_ready_2_8d                    <=  avst_source_ready_2_7d            ;
            avst_source_ready_2_9d                    <=  avst_source_ready_2_8d            ;
            avst_source_ready_2_10d                   <=  avst_source_ready_2_9d            ;
            avst_source_ready_2_11d                   <=  avst_source_ready_2_10d           ;
            avst_source_ready_2_12d                   <=  avst_source_ready_2_11d           ;
            avst_source_ready_2_13d                   <=  avst_source_ready_2_12d           ;
            avst_source_ready_2_14d                   <=  avst_source_ready_2_13d           ;
            avst_source_ready_2_15d                   <=  avst_source_ready_2_14d           ;
            avst_source_ready_2_16d                   <=  avst_source_ready_2_15d           ;
            avst_source_symbol_2_1d                   <=  avst_source_symbol_2              ;
            avst_source_symbol_2_2d                   <=  avst_source_symbol_2_1d           ;
            avst_source_symbol_2_3d                   <=  avst_source_symbol_2_2d           ;
            avst_source_symbol_2_4d                   <=  avst_source_symbol_2_3d           ;
            avst_source_symbol_2_5d                   <=  avst_source_symbol_2_4d           ;
            avst_source_symbol_2_6d                   <=  avst_source_symbol_2_5d           ;
            avst_source_symbol_2_7d                   <=  avst_source_symbol_2_6d           ;
            avst_source_symbol_2_8d                   <=  avst_source_symbol_2_7d           ;
            avst_source_symbol_2_9d                   <=  avst_source_symbol_2_8d           ;
            avst_source_symbol_2_10d                  <=  avst_source_symbol_2_9d           ;
            avst_source_symbol_2_11d                  <=  avst_source_symbol_2_10d          ;
            avst_source_symbol_2_12d                  <=  avst_source_symbol_2_11d          ;
            avst_source_symbol_2_13d_dup1             <=  avst_source_symbol_2_12d          ;
            avst_source_symbol_2_13d_dup2             <=  avst_source_symbol_2_12d          ;
            avst_source_symbol_2_14d_dup1             <=  avst_source_symbol_2_13d_dup1     ;
            avst_source_symbol_2_14d_dup2             <=  avst_source_symbol_2_13d_dup1     ;
            avst_source_symbol_2_14d_dup3             <=  avst_source_symbol_2_13d_dup2     ;
            avst_source_symbol_2_14d_dup4             <=  avst_source_symbol_2_13d_dup2     ;
      avst_source_axc_2_0d                      <=  avst_source_axc_2                 ;
      avst_source_axc_2_1d                      <=  avst_source_axc_2_0d              ;
      avst_source_axc_2_2d                      <=  avst_source_axc_2_1d              ;
      avst_source_axc_2_3d                      <=  avst_source_axc_2_2d              ;
      avst_source_axc_2_4d                      <=  avst_source_axc_2_3d              ;
      avst_source_axc_2_5d                      <=  avst_source_axc_2_4d              ; 
      avst_source_axc_2_6d                      <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_1                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_1                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_2                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_2                    <=  avst_source_axc_2_5d              ;      
      avst_source_axc_2_6d_3                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_3                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_4                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_4                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_5                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_5                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_6                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_6                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_7                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_7                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_8                    <=  avst_source_axc_2_5d              ;
      avst_source_axc_2_6d_8                    <=  avst_source_axc_2_5d              ;
      
      ///////////// CHANGES START /////////////////////////////////////////////////////
      avst_source_axc_2_7d                      <=  avst_source_axc_2_6d   ;
      avst_source_axc_2_7d_1                    <=  avst_source_axc_2_6d_1 ;
      avst_source_axc_2_7d_2                    <=  avst_source_axc_2_6d_1 ;
      avst_source_axc_2_7d_3                    <=  avst_source_axc_2_6d_2 ;
      avst_source_axc_2_7d_4                    <=  avst_source_axc_2_6d_2 ;
      avst_source_axc_2_7d_5                    <=  avst_source_axc_2_6d_3 ;
      avst_source_axc_2_7d_6                    <=  avst_source_axc_2_6d_3 ;
      avst_source_axc_2_7d_7                    <=  avst_source_axc_2_6d_4 ;
      avst_source_axc_2_7d_8                    <=  avst_source_axc_2_6d_4 ;
      avst_source_axc_2_7d_9                    <=  avst_source_axc_2_6d_5 ;
      avst_source_axc_2_7d_10                   <=  avst_source_axc_2_6d_5 ;
      avst_source_axc_2_7d_11                   <=  avst_source_axc_2_6d_6 ;
      avst_source_axc_2_7d_12                   <=  avst_source_axc_2_6d_6 ;
      avst_source_axc_2_7d_13                   <=  avst_source_axc_2_6d_7 ;
      avst_source_axc_2_7d_14                   <=  avst_source_axc_2_6d_7 ;
      avst_source_axc_2_7d_15                   <=  avst_source_axc_2_6d_8 ;
      avst_source_axc_2_7d_16                   <=  avst_source_axc_2_6d_8 ;         
      avst_source_axc_2_8d                      <=  avst_source_axc_2_7d   ;
      avst_source_axc_2_8d_1                    <=  avst_source_axc_2_7d_1 ;
      avst_source_axc_2_8d_2                    <=  avst_source_axc_2_7d_1 ;
      avst_source_axc_2_8d_3                    <=  avst_source_axc_2_7d_2 ;
      avst_source_axc_2_8d_4                    <=  avst_source_axc_2_7d_2 ;
      avst_source_axc_2_8d_5                    <=  avst_source_axc_2_7d_3 ;
      avst_source_axc_2_8d_6                    <=  avst_source_axc_2_7d_3 ;
      avst_source_axc_2_8d_7                    <=  avst_source_axc_2_7d_4 ;
      avst_source_axc_2_8d_8                    <=  avst_source_axc_2_7d_4 ;
      avst_source_axc_2_8d_9                    <=  avst_source_axc_2_7d_5 ;
      avst_source_axc_2_8d_10                   <=  avst_source_axc_2_7d_5 ;
      avst_source_axc_2_8d_11                   <=  avst_source_axc_2_7d_6 ;
      avst_source_axc_2_8d_12                   <=  avst_source_axc_2_7d_6 ;
      avst_source_axc_2_8d_13                   <=  avst_source_axc_2_7d_7 ;
      avst_source_axc_2_8d_14                   <=  avst_source_axc_2_7d_7 ;
      avst_source_axc_2_8d_15                   <=  avst_source_axc_2_7d_8 ;
      avst_source_axc_2_8d_16                   <=  avst_source_axc_2_7d_8 ;
      avst_source_axc_2_8d_17                   <=  avst_source_axc_2_7d_9 ;
      avst_source_axc_2_8d_18                   <=  avst_source_axc_2_7d_9 ;
      avst_source_axc_2_8d_19                   <=  avst_source_axc_2_7d_10;
      avst_source_axc_2_8d_20                   <=  avst_source_axc_2_7d_10;
      avst_source_axc_2_8d_21                   <=  avst_source_axc_2_7d_11;
      avst_source_axc_2_8d_22                   <=  avst_source_axc_2_7d_11;
      avst_source_axc_2_8d_23                   <=  avst_source_axc_2_7d_12;
      avst_source_axc_2_8d_24                   <=  avst_source_axc_2_7d_12;
      avst_source_axc_2_8d_25                   <=  avst_source_axc_2_7d_13;
      avst_source_axc_2_8d_26                   <=  avst_source_axc_2_7d_13;
      avst_source_axc_2_8d_27                   <=  avst_source_axc_2_7d_14;
      avst_source_axc_2_8d_28                   <=  avst_source_axc_2_7d_14;
      avst_source_axc_2_8d_29                   <=  avst_source_axc_2_7d_15;
      avst_source_axc_2_8d_30                   <=  avst_source_axc_2_7d_15;
      avst_source_axc_2_8d_31                   <=  avst_source_axc_2_7d_16;
      avst_source_axc_2_8d_32                   <=  avst_source_axc_2_7d_16;            
            ///////////// CHANGES END /////////////////////////////////////////////////////
      avst_source_axc_2_9d                       <=  avst_source_axc_2_8d              ;
      avst_source_axc_2_9d_1                     <=  avst_source_axc_2_8d_1              ;
      avst_source_axc_2_9d_2                     <=  avst_source_axc_2_8d_2              ;
      avst_source_axc_2_9d_3                     <=  avst_source_axc_2_8d_3              ;
      avst_source_axc_2_9d_4                     <=  avst_source_axc_2_8d_4              ;
      avst_source_axc_2_9d_5                     <=  avst_source_axc_2_8d_5              ;
      avst_source_axc_2_9d_6                     <=  avst_source_axc_2_8d_6              ;
      avst_source_axc_2_9d_7                     <=  avst_source_axc_2_8d_7              ;
      avst_source_axc_2_9d_8                     <=  avst_source_axc_2_8d_8              ;
      avst_source_axc_2_9d_9                     <=  avst_source_axc_2_8d_9              ;
      avst_source_axc_2_9d_10                    <=  avst_source_axc_2_8d_10              ;
      avst_source_axc_2_9d_11                    <=  avst_source_axc_2_8d_11              ;
      avst_source_axc_2_9d_12                    <=  avst_source_axc_2_8d_12              ;
      avst_source_axc_2_9d_13                    <=  avst_source_axc_2_8d_13              ;
      avst_source_axc_2_9d_14                    <=  avst_source_axc_2_8d_14              ;
      avst_source_axc_2_9d_15                    <=  avst_source_axc_2_8d_15              ;
      avst_source_axc_2_9d_16                    <=  avst_source_axc_2_8d_16              ;
      avst_source_axc_2_9d_17                    <=  avst_source_axc_2_8d_17              ;
      avst_source_axc_2_9d_18                    <=  avst_source_axc_2_8d_18              ;
      avst_source_axc_2_9d_19                    <=  avst_source_axc_2_8d_19              ;
      avst_source_axc_2_9d_20                    <=  avst_source_axc_2_8d_20              ;
      avst_source_axc_2_9d_21                    <=  avst_source_axc_2_8d_21              ;
      avst_source_axc_2_9d_22                    <=  avst_source_axc_2_8d_22              ;
      avst_source_axc_2_9d_23                    <=  avst_source_axc_2_8d_23              ;
      avst_source_axc_2_9d_24                    <=  avst_source_axc_2_8d_24                ;
      avst_source_axc_2_9d_25                    <=  avst_source_axc_2_8d_25              ;
      avst_source_axc_2_9d_26                    <=  avst_source_axc_2_8d_26              ;
      avst_source_axc_2_9d_27                    <=  avst_source_axc_2_8d_27              ;
      avst_source_axc_2_9d_28                    <=  avst_source_axc_2_8d_28              ;
      avst_source_axc_2_9d_29                    <=  avst_source_axc_2_8d_29              ;
      avst_source_axc_2_9d_30                    <=  avst_source_axc_2_8d_30              ;
      avst_source_axc_2_9d_31                    <=  avst_source_axc_2_8d_31              ;
      avst_source_axc_2_9d_32                    <=  avst_source_axc_2_8d_32              ;
      
      // Duplicate for mux selection
      avst_source_axc_2_9d_bf                      <=  avst_source_axc_2_8d              ;
      avst_source_axc_2_9d_1_bf                    <=  avst_source_axc_2_8d_1              ;
      avst_source_axc_2_9d_2_bf                    <=  avst_source_axc_2_8d_2              ;
      avst_source_axc_2_9d_3_bf                    <=  avst_source_axc_2_8d_3              ;
      avst_source_axc_2_9d_4_bf                    <=  avst_source_axc_2_8d_4              ;
      avst_source_axc_2_9d_5_bf                    <=  avst_source_axc_2_8d_5              ;
      avst_source_axc_2_9d_6_bf                    <=  avst_source_axc_2_8d_6              ;
      avst_source_axc_2_9d_7_bf                    <=  avst_source_axc_2_8d_7              ;
      avst_source_axc_2_9d_8_bf                    <=  avst_source_axc_2_8d_8              ;
      avst_source_axc_2_9d_9_bf                    <=  avst_source_axc_2_8d_9              ;
      avst_source_axc_2_9d_10_bf                    <=  avst_source_axc_2_8d_10              ;
      avst_source_axc_2_9d_11_bf                    <=  avst_source_axc_2_8d_11              ;
      avst_source_axc_2_9d_12_bf                    <=  avst_source_axc_2_8d_12              ;
      avst_source_axc_2_9d_13_bf                    <=  avst_source_axc_2_8d_13              ;
      avst_source_axc_2_9d_14_bf                    <=  avst_source_axc_2_8d_14              ;
      avst_source_axc_2_9d_15_bf                    <=  avst_source_axc_2_8d_15              ;
      avst_source_axc_2_9d_16_bf                    <=  avst_source_axc_2_8d_16              ;
      avst_source_axc_2_9d_17_bf                    <=  avst_source_axc_2_8d_17              ;
      avst_source_axc_2_9d_18_bf                    <=  avst_source_axc_2_8d_18              ;
      avst_source_axc_2_9d_19_bf                    <=  avst_source_axc_2_8d_19              ;
      avst_source_axc_2_9d_20_bf                    <=  avst_source_axc_2_8d_20              ;
      avst_source_axc_2_9d_21_bf                    <=  avst_source_axc_2_8d_21              ;
      avst_source_axc_2_9d_22_bf                    <=  avst_source_axc_2_8d_22              ;
      avst_source_axc_2_9d_23_bf                    <=  avst_source_axc_2_8d_23              ;
      avst_source_axc_2_9d_24_bf                    <=  avst_source_axc_2_8d_24               ;
      avst_source_axc_2_9d_25_bf                    <=  avst_source_axc_2_8d_25              ;
      avst_source_axc_2_9d_26_bf                    <=  avst_source_axc_2_8d_26              ;
      avst_source_axc_2_9d_27_bf                    <=  avst_source_axc_2_8d_27              ;
      avst_source_axc_2_9d_28_bf                    <=  avst_source_axc_2_8d_28              ;
      avst_source_axc_2_9d_29_bf                    <=  avst_source_axc_2_8d_29              ;
      avst_source_axc_2_9d_30_bf                    <=  avst_source_axc_2_8d_30              ;
      avst_source_axc_2_9d_31_bf                    <=  avst_source_axc_2_8d_31              ;
      avst_source_axc_2_9d_32_bf                    <=  avst_source_axc_2_8d_32              ;
      
  
      // Modified duplicate register routing for timing closure - don't modify
      avst_source_axc_2_10d                      <=   avst_source_axc_2_9d_bf                 ;
      avst_source_axc_2_10d_1                    <=   avst_source_axc_2_9d_1_bf               ;
      avst_source_axc_2_10d_2                    <=   avst_source_axc_2_9d_3_bf               ;
      avst_source_axc_2_10d_3                    <=   avst_source_axc_2_9d_5_bf               ;
      avst_source_axc_2_10d_4                    <=   avst_source_axc_2_9d_7_bf               ;
      avst_source_axc_2_10d_5                    <=   avst_source_axc_2_9d_9_bf               ;
      avst_source_axc_2_10d_6                    <=   avst_source_axc_2_9d_11_bf               ;
      avst_source_axc_2_10d_7                    <=   avst_source_axc_2_9d_13_bf               ;
      avst_source_axc_2_10d_8                    <=   avst_source_axc_2_9d_15_bf               ;
      avst_source_axc_2_10d_9                    <=   avst_source_axc_2_9d_14_bf               ;
      avst_source_axc_2_10d_10                   <=   avst_source_axc_2_9d_17_bf               ;
      avst_source_axc_2_10d_11                   <=   avst_source_axc_2_9d_18_bf               ;
      avst_source_axc_2_10d_12                   <=   avst_source_axc_2_9d_21_bf               ;
      avst_source_axc_2_10d_13                   <=   avst_source_axc_2_9d_22_bf               ;
      avst_source_axc_2_10d_14                   <=   avst_source_axc_2_9d_25_bf               ;
      avst_source_axc_2_10d_15                   <=   avst_source_axc_2_9d_26_bf               ;
      avst_source_axc_2_10d_16                   <=   avst_source_axc_2_9d_29_bf               ;
      avst_source_axc_2_10d_17                   <=   avst_source_axc_2_9d_30_bf               ;  
      
            // Modified duplicate register routing for timing closure - don't modify
      avst_source_axc_2_10d_bf                      <=  avst_source_axc_2_9d_bf              ;
      avst_source_axc_2_10d_1_bf                    <=  avst_source_axc_2_9d_1_bf              ;
      avst_source_axc_2_10d_2_bf                    <=  avst_source_axc_2_9d_3_bf              ;
      avst_source_axc_2_10d_3_bf                    <=  avst_source_axc_2_9d_5_bf              ;
      avst_source_axc_2_10d_4_bf                    <=  avst_source_axc_2_9d_7_bf              ;
      avst_source_axc_2_10d_5_bf                    <=  avst_source_axc_2_9d_9_bf              ;
      avst_source_axc_2_10d_6_bf                    <=  avst_source_axc_2_9d_11_bf              ;
      avst_source_axc_2_10d_7_bf                    <=  avst_source_axc_2_9d_13_bf              ;
      avst_source_axc_2_10d_8_bf                    <=  avst_source_axc_2_9d_15_bf              ;
      avst_source_axc_2_10d_9_bf                    <=  avst_source_axc_2_9d_14_bf              ;
      avst_source_axc_2_10d_10_bf                   <=  avst_source_axc_2_9d_17_bf              ;
      avst_source_axc_2_10d_11_bf                   <=  avst_source_axc_2_9d_18_bf              ;
      avst_source_axc_2_10d_12_bf                   <=  avst_source_axc_2_9d_21_bf              ;
      avst_source_axc_2_10d_13_bf                   <=  avst_source_axc_2_9d_22_bf              ;
      avst_source_axc_2_10d_14_bf                   <=  avst_source_axc_2_9d_25_bf              ;
      avst_source_axc_2_10d_15_bf                   <=  avst_source_axc_2_9d_26_bf              ;
      avst_source_axc_2_10d_16_bf                   <=  avst_source_axc_2_9d_29_bf              ;
      avst_source_axc_2_10d_17_bf                   <=  avst_source_axc_2_9d_30_bf              ; 
      
      // Modified duplicate register routing for timing closure - don't modify
      avst_source_axc_2_11d                      <=  avst_source_axc_2_10d_bf                ;
      avst_source_axc_2_11d_1                    <=  avst_source_axc_2_10d_1_bf              ;
      avst_source_axc_2_11d_2                    <=  avst_source_axc_2_10d_3_bf              ;
      avst_source_axc_2_11d_3                    <=  avst_source_axc_2_10d_5_bf              ;
      avst_source_axc_2_11d_4                    <=  avst_source_axc_2_10d_6_bf              ;
      avst_source_axc_2_11d_5                    <=  avst_source_axc_2_10d_10_bf              ;
      avst_source_axc_2_11d_6                    <=  avst_source_axc_2_10d_11_bf              ;
      avst_source_axc_2_11d_7                    <=  avst_source_axc_2_10d_14_bf              ;
      avst_source_axc_2_11d_8                    <=  avst_source_axc_2_10d_15_bf              ;
      
      avst_source_axc_2_11d_bf                   <=  avst_source_axc_2_10d_bf                ;
      avst_source_axc_2_11d_1_bf                 <=  avst_source_axc_2_10d_1_bf              ;
      avst_source_axc_2_11d_2_bf                 <=  avst_source_axc_2_10d_3_bf              ;
      avst_source_axc_2_11d_3_bf                 <=  avst_source_axc_2_10d_5_bf              ;
      avst_source_axc_2_11d_4_bf                 <=  avst_source_axc_2_10d_6_bf              ;
      avst_source_axc_2_11d_5_bf                 <=  avst_source_axc_2_10d_10_bf              ;
      avst_source_axc_2_11d_6_bf                 <=  avst_source_axc_2_10d_11_bf              ;
      avst_source_axc_2_11d_7_bf                 <=  avst_source_axc_2_10d_14_bf              ;
      avst_source_axc_2_11d_8_bf                 <=  avst_source_axc_2_10d_15_bf              ;
      
      avst_source_axc_2_12d                      <=  avst_source_axc_2_11d_bf                ;
      avst_source_axc_2_12d_1                    <=  avst_source_axc_2_11d_1_bf              ;
      avst_source_axc_2_12d_2                    <=  avst_source_axc_2_11d_2_bf              ;
      avst_source_axc_2_12d_3                    <=  avst_source_axc_2_11d_3_bf              ;
      avst_source_axc_2_12d_4                    <=  avst_source_axc_2_11d_4_bf              ;
      avst_source_axc_2_12d_5                    <=  avst_source_axc_2_11d_5_bf              ;
      avst_source_axc_2_12d_6                    <=  avst_source_axc_2_11d_6_bf              ;
      avst_source_axc_2_12d_7                    <=  avst_source_axc_2_11d_7_bf              ;
      avst_source_axc_2_12d_8                    <=  avst_source_axc_2_11d_8_bf              ;
      
      avst_source_data_1                      <=  avst_source_data_mux_lsb                ;
      avst_source_data_2                      <=  avst_source_data_mux_msb                ;
      c_ram_rden_1d                           <=  c_ram_rden                                  ; 
      c_ram_rden_2d                           <=  c_ram_rden_1d                            ; 
      c_ram_rden_3d                           <=  c_ram_rden_2d                            ;
      c_ram_rden_4d                           <=  c_ram_rden_3d                            ; 
      c_ram_rden_5d                           <=  c_ram_rden_4d                            ; 
      c_ram_rden_6d                           <=  c_ram_rden_5d                            ; 
      c_ram_rden_7d                           <=  c_ram_rden_6d                            ;
      c_ram_rden_8d                           <=  c_ram_rden_7d                            ; 
      c_ram_readdata_1d                       <= c_ram_readdata                            ;
      c_ram_readdata_2d                       <=  c_ram_readdata_1d                        ;    
      c_ram_rdaddress_1d                      <= c_ram_rdaddress                           ;
      c_ram_rdaddress_2d                      <= c_ram_rdaddress_1d                        ;
      bw_config_reg_cc1_1d                      <= bw_config_cc1                                 ;
      bw_config_reg_cc1_2d                      <= bw_config_reg_cc1_1d                         ;
      bw_config_reg_cc2_1d                      <= bw_config_cc2                                 ;
      bw_config_reg_cc2_2d                      <= bw_config_reg_cc2_1d                         ;      
            
            
        end      
    end

    // ready count for line up 1
    always @ (posedge clk_dsp)
    begin : SOURCE_READY_COUNT_L1
        if (rst_dsp_n_1d_dup1 == 1'b0)
        begin
            avst_source_ready_1_count_dup1  <= 'b0 ;
            avst_source_ready_1_count_dup2  <= 'b0 ;
        end
        else if (avst_source_ready_1_count_last)
        begin
            avst_source_ready_1_count_dup1  <= 'b0;
            avst_source_ready_1_count_dup2  <= 'b0;
        end
        else if (avst_source_ready_1_1d_dup1) //else if (avst_source_ready)    //
        begin
            avst_source_ready_1_count_dup1  <= avst_source_ready_1_count_dup1 + 1'b1;
            avst_source_ready_1_count_dup2  <= avst_source_ready_1_count_dup2 + 1'b1;
        end
    end
    
    // ready count for line up 2
    always @ (posedge clk_dsp)
    begin : SOURCE_READY_COUNT_L2
        if (rst_dsp_n_1d_dup1 == 1'b0)
        begin
            avst_source_ready_2_count_dup1  <= 'b0 ;
            avst_source_ready_2_count_dup2  <= 'b0 ;
        end
        else if (avst_source_ready_2_count_last)
        begin
            avst_source_ready_2_count_dup1  <= 'b0;
            avst_source_ready_2_count_dup2  <= 'b0;
        end
        else if (avst_source_ready_2_1d_dup1) //else if (avst_source_ready)    //
        begin
            avst_source_ready_2_count_dup1  <= avst_source_ready_2_count_dup1 + 1'b1;
            avst_source_ready_2_count_dup2  <= avst_source_ready_2_count_dup2 + 1'b1;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : SOURCE_AXC_COUNT_L1
        if (rst_dsp_n_1d_dup1 == 1'b0)
            avst_source_axc_1     <= 4'b0 ;
        else if  (avst_source_axc_1_last)
            avst_source_axc_1     <= 4'b0 ;        
        else if (avst_source_ready_1_count_last)
            avst_source_axc_1     <= avst_source_axc_1 + 1'b1;
    end
    
    always @ (posedge clk_dsp)
    begin : SOURCE_AXC_COUNT_L2
        if (rst_dsp_n_1d_dup1 == 1'b0)
            avst_source_axc_2     <= 4'b0 ;
        else if  (avst_source_axc_2_last)
            avst_source_axc_2     <= 4'b0 ;        
        else if (avst_source_ready_2_count_last)
            avst_source_axc_2     <= avst_source_axc_2 + 1'b1;
    end
    
    always @ (posedge clk_dsp)
    begin : C_SOURCE_AXC_COUNT
        if (rst_dsp_n_1d_dup1 == 1'b0)
            c_avst_source_axc     <= 4'b0 ;
        else if  (c_avst_source_axc_last)
            c_avst_source_axc     <= 4'b0 ;        
        else if (avst_source_ready_1_count_last)
            c_avst_source_axc     <= c_avst_source_axc + 1'b1;
    end
    
    
    always @ (posedge clk_dsp)
    begin : SOURCE_SYM_COUNT_L1
        if (rst_dsp_n_1d_dup1 == 1'b0)
            avst_source_symbol_1  <= 4'b0 ;
        else if (avst_source_symbol_1_last & avst_source_axc_1_last)    
            avst_source_symbol_1  <= 4'b0 ;
        else if (avst_source_axc_1_last)
            avst_source_symbol_1  <= avst_source_symbol_1 + 1'b1;
    end
    
    always @ (posedge clk_dsp)
    begin : SOURCE_SYM_COUNT_L2
        if (rst_dsp_n_1d_dup1 == 1'b0)
            avst_source_symbol_2  <= 4'b0 ;
        else if (avst_source_symbol_2_last & avst_source_axc_2_last)    
            avst_source_symbol_2  <= 4'b0 ;
        else if (avst_source_axc_2_last)
            avst_source_symbol_2  <= avst_source_symbol_2 + 1'b1;
    end
    
    
    always @ (posedge clk_dsp  )
    begin : SOURCE_SYM_COUNT_FIRST_LAST_L1
        if (rst_dsp_n_1d_dup1 == 1'b0) 
        begin
            avst_source_symbol_1_first    <= 1'b0 ;
            avst_source_symbol_1_last     <= 1'b0 ;
        end
        else if(~(|avst_source_symbol_1)) //(avst_source_symbol == 4'b0)
        begin
            avst_source_symbol_1_first    <= 1'b1 ;
            avst_source_symbol_1_last     <= 1'b0 ;
        end
        else if(avst_source_symbol_1 == (NUM_OF_SYM_FFT-1))
        begin
            avst_source_symbol_1_first    <= 1'b0 ;
            avst_source_symbol_1_last     <= 1'b1 ;
        end
        else
        begin
            avst_source_symbol_1_first    <= 1'b0 ;
            avst_source_symbol_1_last     <= 1'b0 ;
        end
    end
    
    always @ (posedge clk_dsp  )
    begin : SOURCE_SYM_COUNT_FIRST_LAST_L2
        if (rst_dsp_n_1d_dup1 == 1'b0) 
        begin
            avst_source_symbol_2_first    <= 1'b0 ;
            avst_source_symbol_2_last     <= 1'b0 ;
        end
        else if(~(|avst_source_symbol_2)) //(avst_source_symbol == 4'b0)
        begin
            avst_source_symbol_2_first    <= 1'b1 ;
            avst_source_symbol_2_last     <= 1'b0 ;
        end
        else if(avst_source_symbol_2 == (NUM_OF_SYM_FFT-1))
        begin
            avst_source_symbol_2_first    <= 1'b0 ;
            avst_source_symbol_2_last     <= 1'b1 ;
        end
        else
        begin
            avst_source_symbol_2_first    <= 1'b0 ;
            avst_source_symbol_2_last     <= 1'b0 ;
        end
    end
    
    
    always @ (posedge clk_eth)
    begin : FRAME_ID_LATCH
        if (rst_eth_n == 1'b0) 
            avst_sink_frameid  <= 8'b0 ;
        else if (xran_demapper_sts_frame_vout_2d)
            avst_sink_frameid  <= xran_demapper_sts_frame_dout_2d  [7:0];
    end
    
    
    always @ (posedge clk_eth)
    begin : SUBFRAME_ID_LATCH
        if (rst_eth_n == 1'b0) 
            avst_sink_subframeid  <= 8'b0 ;
        else if (xran_demapper_sts_frame_vout_2d)
            avst_sink_subframeid  <= xran_demapper_sts_frame_dout_2d  [15:8];
    end
    
    always @ (posedge clk_eth)
    begin : SLOT_ID_LATCH
        if (rst_eth_n == 1'b0) 
            avst_sink_slotid  <= 8'b0 ;
        else if (xran_demapper_sts_frame_vout_2d)
            avst_sink_slotid  <= xran_demapper_sts_frame_dout_2d  [23:16];
    end
    
    
    always @ (posedge clk_eth)
    begin : RFN_ZERO_LATCH
        if (rst_eth_n == 1'b0) 
            avst_sink_rfn_zero_latch  <= 'b0 ;
     //   else if (xran_demapper_sts_frame_vout_2d & (xran_demapper_sts_frame_dout_2d  [31:24]=='b0) & (xran_demapper_sts_frame_dout_2d  [15:8] =='b0) & (xran_demapper_sts_frame_dout_2d  [7:0] =='b0))
        else
				avst_sink_rfn_zero_latch  <= 'b1 ;
    end
    
    
    

    
    always @ (posedge clk_eth  )
    begin : SEQ_ID_LATCH
        if (rst_eth_n == 1'b0) 
            avst_sink_rbstart   <= 'b0 ;
        else if (xran_demapper_sts_prb_vout_2d)
            avst_sink_rbstart  <= xran_demapper_sts_prb_dout_2d  [25:16];
    end
    
    always @ (posedge clk_eth )
    begin : NUM_PRB_LATCH
        if (rst_eth_n == 1'b0) 
            avst_sink_numprb   <= 8'b0 ;
        else if (xran_demapper_sts_prb_vout_2d)
            avst_sink_numprb  <= xran_demapper_sts_prb_dout_2d  [33:26];
    end
    
    always @ (posedge clk_eth  )
    begin : SEQ_ID_ZERO
        if (rst_eth_n == 1'b0) 
            avst_sink_rbstart_zero  <= 8'b0 ;
        else
            avst_sink_rbstart_zero  <= (avst_sink_rbstart == 10'b0)  ;
    end
    
    always @ (posedge clk_eth  )
    begin : NUM_PRB_CONVERT
        if (rst_eth_n == 1'b0) begin
           xran_demapper_sts_numprb = 'd0;
        end else if (xran_demapper_sts_prb_vout_2d && (xran_demapper_sts_prb_dout_2d  [33:26] == 'b0)) begin
           xran_demapper_sts_numprb = 'd273;
        end else if (xran_demapper_sts_prb_vout_2d)
           xran_demapper_sts_numprb = xran_demapper_sts_prb_dout_2d  [33:26];
    end

/************************************************ C Plane data preparation for PRB Blanking ************************************************/

    //C plane Data latching
    integer i;
    always @ (posedge clk_eth  )
    begin
        if (~rst_eth_n) begin
           for (i=0; i<NUM_OF_ANT; i=i+1) begin
              c_startprb[i] <= 10'b0;  
              c_numprb[i]   <= 8'b0;
              c_startsym[i] <= 6'b0;
              c_numsym[i]   <= 4'b0;
              c_slotid[i]   <= 6'b0;
              c_totalprb[i] <= 10'b0;
              c_axc[i]      <= NUM_OF_ANT;
           end
        end else if (xran_demapper_c_plane_metav) begin
           c_startprb[xran_demapper_c_plane_metad[2:0]] <= xran_demapper_c_plane_metad[16 +: 10];
           c_numprb[xran_demapper_c_plane_metad[2:0]]   <= xran_demapper_c_plane_metad[26 +: 8];
           c_startsym[xran_demapper_c_plane_metad[2:0]] <= xran_demapper_c_plane_metad[34 +: 6];
           c_numsym[xran_demapper_c_plane_metad[2:0]]   <= xran_demapper_c_plane_metad[40 +: 4];
           c_slotid[xran_demapper_c_plane_metad[2:0]]   <= xran_demapper_c_plane_metad[44 +: 6];
           c_totalprb[xran_demapper_c_plane_metad[2:0]] <= xran_demapper_c_plane_metad[16 +: 10] + xran_demapper_c_plane_metad[26 +: 8];
           c_axc[xran_demapper_c_plane_metad[2:0]]      <= xran_demapper_c_plane_metad[0  +: 16];
        end
    end

    always @ (posedge clk_eth  )
    begin
        c_startprb_d <= c_startprb; 
        c_axc_d      <= c_axc;
    end
   
    always @ (posedge clk_eth  )
    begin
        if (~rst_eth_n) begin
           xran_demapper_c_plane_metav_1d <= 1'b0;
           xran_demapper_c_plane_metav_2d <= 1'b0;
           xran_demapper_c_plane_metav_3d <= 1'b0;
        end else begin
           xran_demapper_c_plane_metav_1d <= xran_demapper_c_plane_metav;
           xran_demapper_c_plane_metav_2d <= xran_demapper_c_plane_metav_1d;
           xran_demapper_c_plane_metav_3d <= xran_demapper_c_plane_metav_2d;
        end
    end

    always @ (posedge clk_dsp)
    begin
        if (~rst_dsp_n_1d_dup1) begin
           h_ant_num <= 'b0;
        end else if (NUM_OF_DATA_WRITE_2_dup2 > NUM_OF_DATA_WRITE_1_dup2) begin
           h_ant_num <= NUM_OF_ANT-1;
        end else begin
           h_ant_num <= NUM_OF_ANT-2;
        end
    end

    //Slot change detection to update C plane PRB array
    always @ (posedge clk_dsp)
    begin
        if (~rst_dsp_n_1d_dup1) begin
           rd_sym_cnt  <= 4'b0;
           slot_change <= 1'b0;
        end else begin
           if (rd_sym_cnt==4'd14) begin
              rd_sym_cnt  <= 4'b0;
              slot_change <= 1'b1;
           end else if (sym_reset_pul_2d[0][h_ant_num] || 
                        sym_reset_pul_2d[1][h_ant_num] || 
                        sym_reset_pul_2d[2][h_ant_num] || 
                        sym_reset_pul_2d[3][h_ant_num]) begin
              rd_sym_cnt  <= rd_sym_cnt + 4'd1;
              slot_change <= 1'b0;
           end else begin
              rd_sym_cnt  <= rd_sym_cnt;
              slot_change <= 1'b0;
           end
        end
    end

    always @ (posedge clk_dsp  )
    begin
        if (~rst_dsp_n_1d_dup1) begin
           slot_change_1d <= 1'b0;
           slot_change_2d <= 1'b0;
           slot_chg_str   <= 1'b0;
        end else begin
           slot_change_1d <= slot_change;
           slot_change_2d <= slot_change_1d;
           slot_chg_str   <= slot_change || slot_change_1d || slot_change_2d;
        end
    end

    altera_std_synchronizer_nocut u_slot_chg_sync (
       .clk       (clk_eth),
       .reset_n   (rst_eth_n),
       .din       (slot_chg_str),
       .dout      (slot_chg_str_1d)
    );
    
    always @ (posedge clk_eth  )
    begin
        if (~rst_eth_n) begin
           slot_chg_str_2d <= 1'b0;
           slot_chg_str_3d <= 1'b0;
           c_init_d        <= 1'b0;
        end else begin
           slot_chg_str_2d <= slot_chg_str_1d || (prb_idx < 'd272);
           slot_chg_str_3d <= slot_chg_str_2d;
           c_init_d        <= c_init;
        end
    end

    // Initialization flag
    always @ (posedge clk_eth  )
    begin
        if (~rst_eth_n) begin
           c_init <= 1'b1;
        end else if (xran_demapper_sts_frame_vout_1d) begin
           c_init <= 1'b0;
        end
    end

    assign c_init_fedge = c_init_d && (~c_init);

    // PRB index counter for updating C_PRB array
    always @ (posedge clk_eth  )
    begin
        if (~rst_eth_n) begin
           prb_idx <= 'd273;
        end else if (c_init_fedge || slot_chg_str_1d) begin
           prb_idx <= 'b0 ;
        end else if (slot_chg_str_2d) begin
           prb_idx <= prb_idx + 1'b1;
        end
    end

    always @ (posedge clk_eth  )
    begin
       prb_idx_d <= prb_idx;
    end

    //numprb handling when its 0
    integer k;
    always @ (posedge clk_eth  )
    begin
        if (~rst_eth_n) begin
           c_numprb_w <= '{NUM_OF_ANT{1'b0}};
        end else begin
           for (k=0; k<NUM_OF_ANT; k=k+1) begin
              if (~(|c_numprb[k]))
                 c_numprb_w[k] <= 9'd273;
              else
                 c_numprb_w[k] <= c_totalprb[k];
           end
        end
    end
/************************************************ C Plane data preparation END ************************************************/

    assign c_ram_writedata =  cplane_info ;
    assign c_ram_wren      =  xran_demapper_cplane_vout_2d    ;
    assign c_ram_rden      =  avst_source_ready_1_count_first ;
    
    always @ (posedge clk_eth)
            begin : C_WRITE_ADDRESS
                if (rst_eth_n == 1'b0) 
                    c_ram_wraddress     <= 'b0        ;
                else if ((c_ram_wraddress == 'd7) & c_ram_wren)
                    c_ram_wraddress     <= 'b0        ;
                else if (c_ram_wren)
                    c_ram_wraddress     <= c_ram_wraddress + 'b1 ;
            end
    
    
    ram_48i_48o_36d_dc u_ram_48i_48o_36d_dc(
                .data             (c_ram_writedata_2d     ),               //      data.datain
                .q                (c_ram_readdata          ),               //         q.dataout
                .wraddress        (c_ram_wraddress_2d   ),               // wraddress.wraddress
                .rdaddress        (c_ram_rdaddress       ),               // rdaddress.rdaddress
                .wren             (c_ram_wren_2d           ),               //      wren.wren
                .wrclock          (clk_eth               ),               //   wrclock.clk
                .rdclock          (clk_dsp               ),               //   rdclock.clk
                .rden             (c_ram_rden           ),               //      rden.rden
                .byteena_a        (6'b111111            )                // byteena_a.byte_enable_a
            );
            
    
            
    
    always @ (posedge clk_dsp)
            begin : C_READ_ADDRESS
                if (rst_dsp_n_1d_dup1 == 1'b0) 
                    c_ram_rdaddress     <= 'b0        ;
                else if ((c_ram_rdaddress == 'd4) & c_ram_rden)
                    c_ram_rdaddress     <= 'b0        ;
                else if (c_ram_rden)
                    c_ram_rdaddress     <= c_ram_rdaddress + 'd4 ;
            end    
            
            //assign datasize = c_ram_readdata_2d[4:7];
            
    /*always @ (posedge clk_dsp)
            begin : CPLANE_DATA_LEN    
        if (rst_dsp_n_1d_dup1 == 1'b0)
            begin
            NUM_OF_DATA_WRITE_dup1  <= 'b0 ;    
                NUM_OF_DATA_WRITE_dup2  <= 'b0 ;    
            end            
        else if (c_ram_rden_2d)
                     begin
                                case(c_ram_readdata[7:4]) // synthesis parallel_case     
                                'd9    :  begin  NUM_OF_DATA_WRITE_dup1 <= 'd300 ;        NUM_OF_DATA_WRITE_dup2    <= 'd300 ; end                             
                                'd10    : begin   NUM_OF_DATA_WRITE_dup1 <= 'd600 ;    NUM_OF_DATA_WRITE_dup2 <= 'd600 ;  end
                                'd11    : begin  NUM_OF_DATA_WRITE_dup1 <= 'd1200 ;    NUM_OF_DATA_WRITE_dup2 <= 'd1200 ; end
                                'd12    : begin  NUM_OF_DATA_WRITE_dup1 <= 'd3276 ;    NUM_OF_DATA_WRITE_dup2 <= 'd3276 ; end
                                default    :    begin NUM_OF_DATA_WRITE_dup1  <= 'd3276   ;  NUM_OF_DATA_WRITE_dup2  <= 'd3276;    end
                                 endcase
                     end        
            end */
    
       //NUM READ DATA 
      //  if(ant_num == 'd0 | ant_num == 'd2 | ant_num == 'd4 | ant_num == 'd6)begin        
            always @ (posedge clk_dsp)
                begin : NUM_DATA_WRITE_cc1    
                if (rst_dsp_n_1d_dup1 == 1'b0)
                begin
                NUM_OF_DATA_WRITE_1_dup1 <= 'b0 ;    
                NUM_OF_DATA_WRITE_1_dup2 <= 'b0 ;    
                end            
                else 
                         begin
                        (* parallel_case *)    case(bw_config_reg_cc1_2d[3:0]) // synthesis parallel_case     
                                           'hA   : begin  NUM_OF_DATA_WRITE_1_dup1 <= 'd1944 ;    NUM_OF_DATA_WRITE_1_dup2<= 'd1944 ; end
                                           'hE   : begin  NUM_OF_DATA_WRITE_1_dup1 <= 'd3276 ;    NUM_OF_DATA_WRITE_1_dup2<= 'd3276 ; end
                                           default    :    begin NUM_OF_DATA_WRITE_1_dup1 <= 'd3276; NUM_OF_DATA_WRITE_1_dup2 <= 'd3276;    end
                                           endcase
                         end                             
                end
                
            always @ (posedge clk_dsp)
                begin : NUM_DATA_WRITE_cc2    
                if (rst_dsp_n_1d_dup1 == 1'b0)
                begin
                NUM_OF_DATA_WRITE_2_dup1  <= 'b0 ;    
                NUM_OF_DATA_WRITE_2_dup2  <= 'b0 ;    
                end            
                else 
                         begin
                        (* parallel_case *)    case(bw_config_reg_cc2_2d[3:0]) // synthesis parallel_case     
                                           'hA   : begin  NUM_OF_DATA_WRITE_2_dup1 <= 'd1944 ;    NUM_OF_DATA_WRITE_2_dup2 <= 'd1944 ; end
                                           'hE   : begin  NUM_OF_DATA_WRITE_2_dup1 <= 'd3276 ;    NUM_OF_DATA_WRITE_2_dup2 <= 'd3276 ; end
                                           default    :    begin NUM_OF_DATA_WRITE_2_dup1 <= 'd3276; NUM_OF_DATA_WRITE_2_dup2  <= 'd3276; end
                                           endcase
                         end                             
                end
     

    //Generate fdv ram
    generate
    genvar sym_num,ant_num;
    for(sym_num=0; sym_num < NUM_OF_SYM; sym_num = sym_num+1)
    begin:SYM_SLICE
    
        for(ant_num=0; ant_num < NUM_OF_ANT; ant_num = ant_num + ANT_INCR)
        begin:ANT_SLICE
    
                always @ (posedge clk_eth  )
                begin : SYMBOL_ID_LATCH1
                    if (rst_eth_n == 1'b0) 
                    begin
                        avst_sink_symbolid_dup1[sym_num][ant_num]  <= 8'b0 ;                        
                    end
                    else if (xran_demapper_sts_frame_vout_2d_dup1[sym_num][ant_num])
                    begin
                        avst_sink_symbolid_dup1[sym_num][ant_num]  <= xran_demapper_sts_frame_dout_2d_dup1[7:0];                        
                    end
                end
       
                always @ (posedge clk_eth  )
                begin : SYMBOL_ID_LATCH2
                    if (rst_eth_n == 1'b0) 
                    begin                        
                        avst_sink_symbolid_dup2[sym_num][ant_num]  <= 8'b0 ;
                    end
                    else if (xran_demapper_sts_frame_vout_2d_dup2[sym_num][ant_num])
                    begin                                                
                        avst_sink_symbolid_dup2[sym_num][ant_num]  <= xran_demapper_sts_frame_dout_2d_dup2[7:0] ;
                    end
                end
           
                always @ (posedge clk_eth)
                begin 
                
                    if (rst_eth_n==1'b0)
                    begin
                        ram_writedata    [sym_num][ant_num]  <=  128'b0;
                    end
                    else
                    begin                    
                        if(avst_sink_symbolid_dup1[sym_num][ant_num] == 'd0)                 
                            ram_writedata    [sym_num][ant_num] <= avst_sink_data_3d_0[sym_num][ant_num];                     
                        else if(avst_sink_symbolid_dup1[sym_num][ant_num] == 'd1)                             
                            ram_writedata    [sym_num][ant_num] <= avst_sink_data_3d_1[sym_num][ant_num];                        
                        else if(avst_sink_symbolid_dup1[sym_num][ant_num] == 'd2)                                 
                            ram_writedata    [sym_num][ant_num] <= avst_sink_data_3d_2[sym_num][ant_num];
                        else if(avst_sink_symbolid_dup1[sym_num][ant_num] == 'd3)                                 
                            ram_writedata    [sym_num][ant_num] <= avst_sink_data_3d_3[sym_num][ant_num];                                                                                
                        else 
                            ram_writedata    [sym_num][ant_num]  <=  128'b0;                    
                    end
                end
            

           
                always @ (posedge clk_eth)
                begin : WRITE_EN
                    if (rst_eth_n == 1'b0) 
                        ram_wren [sym_num][ant_num] <=  1'b0    ;    
                        
                    else if(~avst_sink_valid_3d)
                        ram_wren [sym_num][ant_num] <=  1'b0    ;
                        
                    else if (avst_sink_valid_3d & avst_sink_rfn_zero_latch)
                    begin        
                        case(avst_sink_symbolid_dup2[sym_num][ant_num])// synthesis parallel_case                    
                                'd0:if(sym_num == 0)ram_wren [sym_num][ant_num] <=  (avst_sink_channel_3d == ant_num) ?  'd1: 'd0;
                                'd1:if(sym_num == 1)ram_wren [sym_num][ant_num] <=  (avst_sink_channel_3d == ant_num) ?  'd1: 'd0;
                                'd2:if(sym_num == 2)ram_wren [sym_num][ant_num] <=  (avst_sink_channel_3d == ant_num) ?  'd1: 'd0;
                                'd3:if(sym_num == 3)ram_wren [sym_num][ant_num] <=  (avst_sink_channel_3d == ant_num) ?  'd1: 'd0;                                                            
                                default : ram_wren [sym_num][ant_num] <=  1'b0    ;                            
                        endcase                    
                    end
                end
                
                
                always @ (posedge clk_eth)
                begin : GEN_START_PRB
                    if (rst_eth_n == 1'b0) 
                        start_prb [sym_num][ant_num] <=  1'b0    ;    
                        
                    else if(~avst_sink_valid_3d)
                        start_prb [sym_num][ant_num] <=  start_prb [sym_num][ant_num]   ;
                        
                    else if (avst_sink_valid_3d & avst_sink_rfn_zero_latch & (avst_sink_channel_3d == ant_num) & xran_demapper_sts_prb_vout_2d_dup1_1d [sym_num] [ant_num])
                    begin        
                        case(avst_sink_symbolid_dup2[sym_num][ant_num])// synthesis parallel_case                    
                                'd0:if(sym_num == 0)start_prb [sym_num][ant_num] <=  xran_demapper_sts_prb_dout_3d  [25:16] ;
                                'd1:if(sym_num == 1)start_prb [sym_num][ant_num] <=  xran_demapper_sts_prb_dout_3d  [25:16] ;
                                'd2:if(sym_num == 2)start_prb [sym_num][ant_num] <=  xran_demapper_sts_prb_dout_3d  [25:16] ;
                                'd3:if(sym_num == 3)start_prb [sym_num][ant_num] <=  xran_demapper_sts_prb_dout_3d  [25:16] ;
                                default : start_prb [sym_num][ant_num] <=  start_prb [sym_num][ant_num]   ;                            
                        endcase                    
                    end
                end
                
                
                
                always @ (posedge clk_eth)
                begin : GEN_NUM_PRB
                    if (rst_eth_n == 1'b0) 
                        num_prb [sym_num][ant_num] <=  'b0    ;    
                        
                    else if(~avst_sink_valid_3d)
                        num_prb [sym_num][ant_num] <=  num_prb [sym_num][ant_num]   ;
                        
                    else if (avst_sink_valid_3d & avst_sink_rfn_zero_latch & (avst_sink_channel_3d == ant_num) &  xran_demapper_sts_prb_vout_2d_dup1_1d [sym_num] [ant_num])
                    begin        
                        case(avst_sink_symbolid_dup2[sym_num][ant_num])// synthesis parallel_case                    
                                'd0:if(sym_num == 0)num_prb [sym_num][ant_num] <=  xran_demapper_sts_numprb;//xran_demapper_sts_prb_dout_3d  [33:26] ;
                                'd1:if(sym_num == 1)num_prb [sym_num][ant_num] <=  xran_demapper_sts_numprb;//xran_demapper_sts_prb_dout_3d  [33:26] ;
                                'd2:if(sym_num == 2)num_prb [sym_num][ant_num] <=  xran_demapper_sts_numprb;//xran_demapper_sts_prb_dout_3d  [33:26] ;
                                'd3:if(sym_num == 3)num_prb [sym_num][ant_num] <=  xran_demapper_sts_numprb;//xran_demapper_sts_prb_dout_3d  [33:26] ;
                                default : num_prb [sym_num][ant_num] <=  num_prb [sym_num][ant_num]    ;                            
                        endcase                    
                    end
                end
                
            always @ (posedge clk_eth  )
                begin : START_PRB_LATCH
                    if (rst_eth_n == 1'b0) 
                        start_prb_latch [sym_num][ant_num]   <= 'b0 ;
                    else if (xran_demapper_sts_prb_vout_2d_dup1_3d [sym_num] [ant_num] )
                        start_prb_latch [sym_num][ant_num] <= start_prb [sym_num][ant_num] ;
                end
            
                always @ (posedge clk_eth )
                begin : NUM_PRB_LATCH
                    if (rst_eth_n == 1'b0) 
                        num_prb_latch   [sym_num][ant_num]  <= 8'b0 ;
                else if (xran_demapper_sts_prb_vout_2d_dup1_3d [sym_num] [ant_num] )
                        num_prb_latch  [sym_num][ant_num]  <=  num_prb [sym_num][ant_num] ;
                end 
                
        /*        
                
            always @ (posedge clk_dsp)
             begin 
             if (rst_dsp_n_1d_dup1 == 1'b0) 
              begin 
              avst_source_ready_1d                    <=  1'b0                            ;
              avst_source_ready_1d_dup1               <=  'd0                             ;
              avst_source_ready_1d_dup6               <=  'd0                             ;
              avst_source_ready_1d_dup7               <=  'd0                             ;
             end
            else 
             begin 
             avst_source_ready_1d                    <=  avst_source_ready[sym_num][ant_num]               ;
             avst_source_ready_1d_dup1               <=  avst_source_ready[sym_num][ant_num]               ;            
             avst_source_ready_1d_dup6               <=  avst_source_ready[sym_num][ant_num]               ;
             avst_source_ready_1d_dup7               <=  avst_source_ready[sym_num][ant_num]               ;
             end
            end
             
        if (ant_num == 'd0 | ant_num == 'd2 | ant_num == 'd4 | ant_num == 'd6  )begin 
            always @ (posedge clk_dsp) 
             begin  
             if (rst_dsp_n_1d_dup1 == 1'b0) 
                  avst_source_ready[sym_num][ant_num]  <= 'd0 ;                       
             else 
                   avst_source_ready[sym_num][ant_num]  <= avst_source_ready_1  ;
            end
          end
        else if (ant_num == 'd1 | ant_num == 'd3 | ant_num == 'd5 | ant_num == 'd7  )begin 
            always @ (posedge clk_dsp) begin   
             if (rst_dsp_n_1d_dup1 == 1'b0) 
                  avst_source_ready[sym_num][ant_num]  <= 'd0 ;                       
             else 
                   avst_source_ready[sym_num][ant_num]  <= avst_source_ready_2  ;
            end
          end
           */        
            always @ (posedge clk_eth)
            begin
                if (rst_eth_n == 1'b0) 
                begin 
                    xran_demapper_sts_prb_vout_2d_dup1        [sym_num][ant_num]        <= 'd0                      ; 
                end else if (xran_demapper_sts_prb_vout_1d && (sym_num==xran_demapper_sts_frame_dout_dup1[1:0]) && (ant_num==avst_sink_channel_1d[2:0])) begin
                    xran_demapper_sts_prb_vout_2d_dup1       [sym_num][ant_num]      <=  1'b1;
                end else begin
                    xran_demapper_sts_prb_vout_2d_dup1        [sym_num][ant_num]        <= 'd0                      ; 
                end
            end
                    
            always @ (posedge clk_eth)
            begin : ETH_PIPE_DELAY
                if (rst_eth_n == 1'b0) 
                begin 
                    ram_writedata_1d                        [sym_num][ant_num]      <= {ETH_DATAWIDTH{1'b0}}    ;
                    ram_writedata_2d                        [sym_num][ant_num]      <= {ETH_DATAWIDTH{1'b0}}    ;
                    ram_writedata_3d                        [sym_num][ant_num]      <= {ETH_DATAWIDTH{1'b0}}    ;
                    ram_writedata_4d                        [sym_num][ant_num]      <= {ETH_DATAWIDTH{1'b0}}    ;
                    ram_writedata_5d                        [sym_num][ant_num]      <= {ETH_DATAWIDTH{1'b0}}    ;
                    ram_wren_1d                             [sym_num][ant_num]      <= 1'b0                     ;
                    ram_wren_2d                             [sym_num][ant_num]      <= 1'b0                     ;
                    ram_wren_3d                             [sym_num][ant_num]      <= 1'b0                     ;
                    ram_wren_4d                             [sym_num][ant_num]      <= 1'b0                     ;
                    ram_wren_5d                             [sym_num][ant_num]      <= 1'b0                     ;
                    ram_wraddress_1d                        [sym_num][ant_num]      <= 'd0                        ;
                    ram_wraddress_2d                        [sym_num][ant_num]      <= 'd0                        ;
                    avst_sink_data_3d_0                     [sym_num][ant_num]      <= 'd0                        ;
                    avst_sink_data_3d_1                     [sym_num][ant_num]      <= 'd0                        ;
                    avst_sink_data_3d_2                     [sym_num][ant_num]      <= 'd0                        ;
                    avst_sink_data_3d_3                     [sym_num][ant_num]      <= 'd0                        ;
                    avst_sink_startofpacket_6d_dup1         [sym_num][ant_num]      <= 'd0                        ;
                    avst_sink_startofpacket_6d_dup2         [sym_num][ant_num]      <= 'd0                        ;
                    avst_sink_valid_6d				        [sym_num][ant_num]      <= 'd0                        ;
                    xran_demapper_sts_frame_vout_2d_dup1    [sym_num][ant_num]      <= 'd0                      ;                         
                    xran_demapper_sts_frame_vout_2d_dup2    [sym_num][ant_num]      <= 'd0                      ;
                    avst_sink_rbstart_zero_1d                [sym_num][ant_num]      <= 'd0                         ;
                    avst_sink_rbstart_zero_2d                [sym_num][ant_num]      <= 'd0                      ;
                    xran_demapper_sts_prb_vout_2d_dup1_1d    [sym_num][ant_num]        <= 'd0                      ;
                    xran_demapper_sts_prb_vout_2d_dup1_2d    [sym_num][ant_num]        <= 'd0                      ;
                    xran_demapper_sts_prb_vout_2d_dup1_3d    [sym_num][ant_num]        <= 'd0                      ;
                    xran_demapper_sts_prb_vout_2d_dup1_4d    [sym_num][ant_num]        <= 'd0                      ;
                    xran_demapper_sts_prb_vout_2d_dup1_5d    [sym_num][ant_num]        <= 'd0                      ;
					xran_demapper_sts_prb_vout_6d    [sym_num][ant_num]        <= 'd0                      ;
                    
                    start_prb_latch_1d [sym_num][ant_num]    <=  'd0  ;

                end 
                else 
                begin 
                    ram_writedata_1d                        [sym_num][ant_num]      <= ram_writedata        [sym_num][ant_num]  ;
                    ram_writedata_2d                        [sym_num][ant_num]      <= ram_writedata_1d     [sym_num][ant_num]  ;
                    ram_writedata_3d                        [sym_num][ant_num]      <= ram_writedata_2d     [sym_num][ant_num]  ;
                    ram_writedata_4d                        [sym_num][ant_num]      <= ram_writedata_3d     [sym_num][ant_num]  ;
                    ram_writedata_5d                        [sym_num][ant_num]      <= ram_writedata_4d     [sym_num][ant_num]  ;
                    ram_wren_1d                             [sym_num][ant_num]      <= ram_wren             [sym_num][ant_num]  ;
                    ram_wren_2d                             [sym_num][ant_num]      <= ram_wren_1d          [sym_num][ant_num]  ;
                    ram_wren_3d                             [sym_num][ant_num]      <= ram_wren_2d          [sym_num][ant_num]  ;
                    ram_wren_4d                             [sym_num][ant_num]      <= ram_wren_3d          [sym_num][ant_num]  ;
                    ram_wren_5d                             [sym_num][ant_num]      <= ram_wren_4d          [sym_num][ant_num]  ;
                    ram_wraddress_1d                        [sym_num][ant_num]      <= ram_wraddress        [sym_num][ant_num]  ;
                    ram_wraddress_2d                        [sym_num][ant_num]      <= ram_wraddress_1d     [sym_num][ant_num]  ;
                    avst_sink_startofpacket_6d_dup1         [sym_num][ant_num]      <=  avst_sink_startofpacket_5d              ;
                    avst_sink_startofpacket_6d_dup2         [sym_num][ant_num]      <=  avst_sink_startofpacket_5d              ;
					avst_sink_valid_6d				        [sym_num][ant_num]      <=  avst_sink_valid_5d                        ;
                    xran_demapper_sts_frame_vout_2d_dup1    [sym_num][ant_num]        <=  xran_demapper_sts_frame_vout_1d         ;
                    xran_demapper_sts_frame_vout_2d_dup2    [sym_num][ant_num]        <=  xran_demapper_sts_frame_vout_1d_dup1     ;
                    
                    xran_demapper_sts_prb_vout_2d_dup1_1d    [sym_num][ant_num]        <=  xran_demapper_sts_prb_vout_2d_dup1 [sym_num][ant_num]     ;
                    xran_demapper_sts_prb_vout_2d_dup1_2d    [sym_num][ant_num]        <=  xran_demapper_sts_prb_vout_2d_dup1_1d [sym_num][ant_num];
                    xran_demapper_sts_prb_vout_2d_dup1_3d    [sym_num][ant_num]        <=  xran_demapper_sts_prb_vout_2d_dup1_2d [sym_num][ant_num];
                    xran_demapper_sts_prb_vout_2d_dup1_4d    [sym_num][ant_num]        <=  xran_demapper_sts_prb_vout_2d_dup1_3d [sym_num][ant_num];
                    xran_demapper_sts_prb_vout_2d_dup1_5d    [sym_num][ant_num]        <=  xran_demapper_sts_prb_vout_2d_dup1_4d [sym_num][ant_num];
					xran_demapper_sts_prb_vout_6d    [sym_num][ant_num]        <= xran_demapper_sts_prb_vout_5d                      ;
                    
                    start_prb_latch_1d                         [sym_num][ant_num]       <= start_prb_latch [sym_num][ant_num]    ;
                    
                    avst_sink_rbstart_zero_1d                [sym_num][ant_num]      <=  {avst_sink_rbstart_zero};
                    avst_sink_rbstart_zero_2d                [sym_num][ant_num]      <=  avst_sink_rbstart_zero_1d[sym_num][ant_num]       ; 
                    
                    avst_sink_data_3d_0 [sym_num][ant_num]  <= {avst_sink_data_2d_dup1[15:0],
                                                                avst_sink_data_2d_dup1[31:16],
                                                                avst_sink_data_2d_dup1[47:32],
                                                                avst_sink_data_2d_dup1[63:48],
                                                                avst_sink_data_2d_dup1[79:64],
                                                                avst_sink_data_2d_dup1[95:80],
                                                                avst_sink_data_2d_dup1[111:96],
                                                                avst_sink_data_2d_dup1[127:112]}     ;
                    
                    avst_sink_data_3d_1 [sym_num][ant_num]  <= {avst_sink_data_2d_dup2[15:0],
                                                                avst_sink_data_2d_dup2[31:16],
                                                                avst_sink_data_2d_dup2[47:32],
                                                                avst_sink_data_2d_dup2[63:48],
                                                                avst_sink_data_2d_dup2[79:64],
                                                                avst_sink_data_2d_dup2[95:80],
                                                                avst_sink_data_2d_dup2[111:96],
                                                                avst_sink_data_2d_dup2[127:112]}     ;  
            
                    avst_sink_data_3d_2 [sym_num][ant_num]  <= {avst_sink_data_2d_dup3[15:0],
                                                                avst_sink_data_2d_dup3[31:16],
                                                                avst_sink_data_2d_dup3[47:32],
                                                                avst_sink_data_2d_dup3[63:48],
                                                                avst_sink_data_2d_dup3[79:64],
                                                                avst_sink_data_2d_dup3[95:80],
                                                                avst_sink_data_2d_dup3[111:96],
                                                                avst_sink_data_2d_dup3[127:112]}     ; 
                                                                
                    avst_sink_data_3d_3 [sym_num][ant_num]  <= {avst_sink_data_2d_dup4[15:0],
                                                                avst_sink_data_2d_dup4[31:16],
                                                                avst_sink_data_2d_dup4[47:32],
                                                                avst_sink_data_2d_dup4[63:48],
                                                                avst_sink_data_2d_dup4[79:64],
                                                                avst_sink_data_2d_dup4[95:80],
                                                                avst_sink_data_2d_dup4[111:96],
                                                                avst_sink_data_2d_dup4[127:112]}     ;         

                end
            end
            
            
            // Subcarrier Configurable for Variable Bandwidth for L1
          if(ant_num == 'd0 | ant_num == 'd2 | ant_num == 'd4 | ant_num == 'd6)begin
            always @ (posedge clk_eth)
            begin : RAM_WRADDR_LIMIT_cc1        
            if (rst_eth_n == 1'b0)
               ram_wraddress_limit[sym_num][ant_num] <= 'd0 ;           
            else begin                  
               (* parallel_case *) case(bw_config_cc1_2d[3:0])
                                'hA    :   ram_wraddress_limit[sym_num][ant_num]  <= 'd485 ;
                                'hE    :   ram_wraddress_limit[sym_num][ant_num]  <= 'd818 ;
                                default  : ram_wraddress_limit[sym_num][ant_num]  <= 'd818 ;
                                  endcase
                     end        
            end
            end
        
            
         // Subcarrier Configurable for Variable Bandwidth for L2
          if(ant_num == 'd1 | ant_num == 'd3 | ant_num == 'd5 | ant_num == 'd7)begin
            always @ (posedge clk_eth)
            begin : RAM_WRADDR_LIMIT_cc2        
            if (rst_eth_n == 1'b0)
               ram_wraddress_limit[sym_num][ant_num] <= 'd0 ;           
            else begin                  
               (* parallel_case *) case(bw_config_cc2_2d[3:0])
                                'hA    :   ram_wraddress_limit[sym_num][ant_num]  <= 'd485;
                                'hE    :   ram_wraddress_limit[sym_num][ant_num]  <= 'd818 ;
                                default  : ram_wraddress_limit[sym_num][ant_num]  <= 'd818 ;
                                  endcase
                     end        
            end
            end 
        
                      
            always @ (posedge clk_eth)
            begin : WRITE_ADDRESS
                if (rst_eth_n == 1'b0) 
                    ram_wraddress   [sym_num][ant_num]  <= 'b0        ;
                else if (avst_sink_valid_6d[sym_num][ant_num] & ram_wren_2d [sym_num][ant_num] & xran_demapper_sts_prb_vout_6d    [sym_num][ant_num])
                    //ram_wraddress   [sym_num][ant_num]  <= avst_sink_rbstart_3d * 'd3 ;    //12*DSP_DATAWIDTH/ETH_DATAWIDTH)      ;
                    ram_wraddress   [sym_num][ant_num]  <= avst_sink_rbstart_3d ;            //* 'd3 moved to avst_sink_rbstart_2d
                else if (ram_wren_3d [sym_num][ant_num] & ram_wraddress[sym_num][ant_num] < ram_wraddress_limit[sym_num][ant_num] )
                    ram_wraddress   [sym_num][ant_num]  <= ram_wraddress[sym_num][ant_num] + 'd1 ;
            end
    
            ram_128i_32o_3276d_dc uram_128i_32o_3276d_dc(
                .data             (ram_writedata_5d [sym_num][ant_num]  ),      //      data.datain
                .q                (ram_readdata     [sym_num][ant_num]  ),      //         q.dataout
                .wraddress        (ram_wraddress_2d [sym_num][ant_num]  ),         // wraddress.wraddress
                .rdaddress        (ram_rdaddress_2d [sym_num][ant_num]  ),         // rdaddress.rdaddress
                .wren             (ram_wren_5d      [sym_num][ant_num]  ),      //      wren.wren
                .wrclock          (clk_eth                              ),       //   wrclock.clk
                .rdclock          (clk_dsp                              ),       //   rdclock.clk
                .rden             (ram_rden_4d      [sym_num][ant_num]  ),      //      rden.rden
                .byteena_a        (16'b1111111111111111                 )         // byteena_a.byte_enable_a
            );
            
          if(ant_num == 'd0 | ant_num == 'd2 | ant_num == 'd4 | ant_num == 'd6)begin
            always @ (posedge clk_dsp)
            begin : DSP_PIPE_DELAY_L1
                if (rst_dsp_n_1d_dup1 == 1'b0) 
                begin 
                    ram_readdata_1d                 [sym_num][ant_num]      <= {DSP_DATAWIDTH{1'b0}}            ;
                    ram_readdata_2d                 [sym_num][ant_num]      <= {DSP_DATAWIDTH{1'b0}}            ;

                    ram_rden_1d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_2d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_2d_dup                 [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_3d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_4d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_5d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_6d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_7d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_8d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_9d                     [sym_num][ant_num]      <= 1'b0                             ;
    
                    ram_rdaddress_1d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_2d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_3d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_4d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_5d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_6d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_7d                [sym_num][ant_num]         <= 'd0                                ;
                    rdaddr_comp_1d                     [sym_num][ant_num]         <= 'd0                                ;
                    rdaddr_comp_2d                     [sym_num][ant_num]         <= 'd0                                ;
                    rdaddr_comp_3d                     [sym_num][ant_num]         <= 'd0                                ;
                    rdaddr_comp_4d                     [sym_num][ant_num]         <= 'd0                                ;
                    
                    avst_source_axc_1d_dup1            [sym_num][ant_num]      <=  'd0                              ;
                    avst_source_axc_1d_dup2            [sym_num][ant_num]      <=  'd0                              ;
                    avst_source_axc_1d_dup3            [sym_num][ant_num]      <=  'd0                              ;
                    avst_source_axc_1d_dup4            [sym_num][ant_num]      <=  'd0                              ;
                    avst_source_symbol_1d_dup1        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup2        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup3        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup4        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup5        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup6        [sym_num][ant_num]        <=  'd0                             ;
                    NUM_OF_DATA_WRITE_1d            [sym_num][ant_num]      <=  'd0                                ;
                    NUM_OF_DATA_WRITE_2d            [sym_num][ant_num]      <=  'd0                                ;                    
                    avst_source_ready_1d_dup2          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup3          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup4          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup5          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup8          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup9          [sym_num][ant_num]       <=  'd0                             ;
                    
                end 
                else 
                begin 
                    ram_readdata_1d                  [sym_num][ant_num]      <= ram_readdata     [sym_num][ant_num]  ;
                    ram_readdata_2d                  [sym_num][ant_num]      <= ram_readdata_1d  [sym_num][ant_num]  ;
                                                    
                    ram_rden_1d                      [sym_num][ant_num]      <= ram_rden         [sym_num][ant_num]  ;
                    ram_rden_2d                      [sym_num][ant_num]      <= ram_rden_1d      [sym_num][ant_num]  ;
                    ram_rden_2d_dup                  [sym_num][ant_num]      <= ram_rden_1d      [sym_num][ant_num]  ;
                    ram_rden_3d                      [sym_num][ant_num]      <= ram_rden_2d      [sym_num][ant_num]  ;
                    ram_rden_4d                      [sym_num][ant_num]      <= ram_rden_3d      [sym_num][ant_num]  ;
                    ram_rden_5d                      [sym_num][ant_num]      <= ram_rden_4d      [sym_num][ant_num]  ;
                    ram_rden_6d                      [sym_num][ant_num]      <= ram_rden_5d      [sym_num][ant_num]  ;
                    ram_rden_7d                      [sym_num][ant_num]      <= ram_rden_6d      [sym_num][ant_num]  ;
                    ram_rden_8d                      [sym_num][ant_num]      <= ram_rden_7d      [sym_num][ant_num]  ;
                    ram_rden_9d                      [sym_num][ant_num]      <= ram_rden_8d      [sym_num][ant_num]  ;
            
                    ram_rdaddress_1d                 [sym_num][ant_num]         <= ram_rdaddress    [sym_num][ant_num]  ;
                    ram_rdaddress_2d                 [sym_num][ant_num]         <= ram_rdaddress_1d [sym_num][ant_num]  ;
                    ram_rdaddress_3d                 [sym_num][ant_num]         <= ram_rdaddress_2d [sym_num][ant_num]  ;
                    ram_rdaddress_4d                 [sym_num][ant_num]         <= ram_rdaddress_3d [sym_num][ant_num]  ;
                    ram_rdaddress_5d                 [sym_num][ant_num]         <= ram_rdaddress_4d [sym_num][ant_num]  ;
                    ram_rdaddress_6d                 [sym_num][ant_num]         <= ram_rdaddress_5d [sym_num][ant_num]  ;
                    ram_rdaddress_7d                 [sym_num][ant_num]         <= ram_rdaddress_6d [sym_num][ant_num]  ;
                    rdaddr_comp_1d                      [sym_num][ant_num]         <= rdaddr_comp         [sym_num][ant_num]    ;
                    rdaddr_comp_2d                      [sym_num][ant_num]         <= rdaddr_comp_1d     [sym_num][ant_num]    ;
                    rdaddr_comp_3d                      [sym_num][ant_num]         <= rdaddr_comp_2d     [sym_num][ant_num]    ;
                    rdaddr_comp_4d                      [sym_num][ant_num]         <= rdaddr_comp_3d     [sym_num][ant_num]    ;
                          
                    avst_source_axc_1d_dup1            [sym_num][ant_num]      <=  avst_source_axc_1                     ;
                    avst_source_axc_1d_dup2            [sym_num][ant_num]      <=  avst_source_axc_1                     ;
                    avst_source_axc_1d_dup3            [sym_num][ant_num]      <=  avst_source_axc_1                     ;
                    avst_source_axc_1d_dup4            [sym_num][ant_num]      <=  avst_source_axc_1                     ;
                    avst_source_symbol_1d_dup1        [sym_num][ant_num]         <=  avst_source_symbol_1                  ;
                    avst_source_symbol_1d_dup2        [sym_num][ant_num]         <=  avst_source_symbol_1                  ;
                    avst_source_symbol_1d_dup3        [sym_num][ant_num]         <=  avst_source_symbol_1                  ;
                    avst_source_symbol_1d_dup4        [sym_num][ant_num]         <=  avst_source_symbol_1                  ;
                    avst_source_symbol_1d_dup5        [sym_num][ant_num]         <=  avst_source_symbol_1                  ;
                    avst_source_symbol_1d_dup6        [sym_num][ant_num]         <=  avst_source_symbol_1                  ;
                    NUM_OF_DATA_WRITE_1d            [sym_num][ant_num]      <=  NUM_OF_DATA_WRITE_1_dup2 - 3'd4       ; // For Timing closure
                    NUM_OF_DATA_WRITE_2d            [sym_num][ant_num]      <=  NUM_OF_DATA_WRITE_1d[sym_num][ant_num] ; //  - 3'd4     ;
                                    
                    avst_source_ready_1d_dup2         [sym_num][ant_num]      <=  avst_source_ready_1             ;
                    avst_source_ready_1d_dup3         [sym_num][ant_num]      <=  avst_source_ready_1             ;            
                    avst_source_ready_1d_dup4         [sym_num][ant_num]      <=  avst_source_ready_1             ;
                    avst_source_ready_1d_dup5         [sym_num][ant_num]      <=  avst_source_ready_1             ;
                    avst_source_ready_1d_dup8         [sym_num][ant_num]      <=  avst_source_ready_1             ;
                    avst_source_ready_1d_dup9         [sym_num][ant_num]      <=  avst_source_ready_1             ;
                    
                end
            end
            end 
            
        if(ant_num == 'd1 | ant_num == 'd3 | ant_num == 'd5 | ant_num == 'd7)begin
            always @ (posedge clk_dsp)
            begin : DSP_PIPE_DELAY_L2
                if (rst_dsp_n_1d_dup1 == 1'b0) 
                begin 
                    ram_readdata_1d                 [sym_num][ant_num]      <= {DSP_DATAWIDTH{1'b0}}            ;
                    ram_readdata_2d                 [sym_num][ant_num]      <= {DSP_DATAWIDTH{1'b0}}            ;

                    ram_rden_1d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_2d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_2d_dup                 [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_3d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_4d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_5d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_6d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_7d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_8d                     [sym_num][ant_num]      <= 1'b0                             ;
                    ram_rden_9d                     [sym_num][ant_num]      <= 1'b0                             ;
    
                    ram_rdaddress_1d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_2d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_3d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_4d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_5d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_6d                [sym_num][ant_num]         <= 'd0                                ;
                    ram_rdaddress_7d                [sym_num][ant_num]         <= 'd0                                ;
                    rdaddr_comp_1d                     [sym_num][ant_num]         <= 'd0                                ;
                    rdaddr_comp_2d                     [sym_num][ant_num]         <= 'd0                                ;
                    rdaddr_comp_3d                     [sym_num][ant_num]         <= 'd0                                ;
                    rdaddr_comp_4d                     [sym_num][ant_num]         <= 'd0                                ;
                    
                    avst_source_axc_1d_dup1            [sym_num][ant_num]      <=  'd0                              ;
                    avst_source_axc_1d_dup2            [sym_num][ant_num]      <=  'd0                              ;
                    avst_source_axc_1d_dup3            [sym_num][ant_num]      <=  'd0                              ;
                    avst_source_axc_1d_dup4            [sym_num][ant_num]      <=  'd0                              ;
                    avst_source_symbol_1d_dup1        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup2        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup3        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup4        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup5        [sym_num][ant_num]        <=  'd0                             ;
                    avst_source_symbol_1d_dup6        [sym_num][ant_num]        <=  'd0                             ;
                    NUM_OF_DATA_WRITE_1d            [sym_num][ant_num]      <=  'd0                                ;
                    NUM_OF_DATA_WRITE_2d            [sym_num][ant_num]      <=  'd0                                ;                    
                    avst_source_ready_1d_dup2          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup3          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup4          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup5          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup8          [sym_num][ant_num]       <=  'd0                             ;
                    avst_source_ready_1d_dup9          [sym_num][ant_num]       <=  'd0                             ;
                    
                end 
                else 
                begin 
                    ram_readdata_1d                  [sym_num][ant_num]      <= ram_readdata     [sym_num][ant_num]  ;
                    ram_readdata_2d                  [sym_num][ant_num]      <= ram_readdata_1d  [sym_num][ant_num]  ;
                                                    
                    ram_rden_1d                      [sym_num][ant_num]      <= ram_rden         [sym_num][ant_num]  ;
                    ram_rden_2d                      [sym_num][ant_num]      <= ram_rden_1d      [sym_num][ant_num]  ;
                    ram_rden_2d_dup                  [sym_num][ant_num]      <= ram_rden_1d      [sym_num][ant_num]  ;
                    ram_rden_3d                      [sym_num][ant_num]      <= ram_rden_2d      [sym_num][ant_num]  ;
                    ram_rden_4d                      [sym_num][ant_num]      <= ram_rden_3d      [sym_num][ant_num]  ;
                    ram_rden_5d                      [sym_num][ant_num]      <= ram_rden_4d      [sym_num][ant_num]  ;
                    ram_rden_6d                      [sym_num][ant_num]      <= ram_rden_5d      [sym_num][ant_num]  ;
                    ram_rden_7d                      [sym_num][ant_num]      <= ram_rden_6d      [sym_num][ant_num]  ;
                    ram_rden_8d                      [sym_num][ant_num]      <= ram_rden_7d      [sym_num][ant_num]  ;
                    ram_rden_9d                      [sym_num][ant_num]      <= ram_rden_8d      [sym_num][ant_num]  ;
            
                    ram_rdaddress_1d                 [sym_num][ant_num]         <= ram_rdaddress    [sym_num][ant_num]  ;
                    ram_rdaddress_2d                 [sym_num][ant_num]         <= ram_rdaddress_1d [sym_num][ant_num]  ;
                    ram_rdaddress_3d                 [sym_num][ant_num]         <= ram_rdaddress_2d [sym_num][ant_num]  ;
                    ram_rdaddress_4d                 [sym_num][ant_num]         <= ram_rdaddress_3d [sym_num][ant_num]  ;
                    ram_rdaddress_5d                 [sym_num][ant_num]         <= ram_rdaddress_4d [sym_num][ant_num]  ;
                    ram_rdaddress_6d                 [sym_num][ant_num]         <= ram_rdaddress_5d [sym_num][ant_num]  ;
                    ram_rdaddress_7d                 [sym_num][ant_num]         <= ram_rdaddress_6d [sym_num][ant_num]  ;
                    rdaddr_comp_1d                      [sym_num][ant_num]         <= rdaddr_comp         [sym_num][ant_num]    ;
                    rdaddr_comp_2d                      [sym_num][ant_num]         <= rdaddr_comp_1d     [sym_num][ant_num]    ;
                    rdaddr_comp_3d                      [sym_num][ant_num]         <= rdaddr_comp_2d     [sym_num][ant_num]    ;
                    rdaddr_comp_4d                      [sym_num][ant_num]         <= rdaddr_comp_3d     [sym_num][ant_num]    ;
                          
                    avst_source_axc_1d_dup1            [sym_num][ant_num]      <=  avst_source_axc_2                     ;
                    avst_source_axc_1d_dup2            [sym_num][ant_num]      <=  avst_source_axc_2                     ;
                    avst_source_axc_1d_dup3            [sym_num][ant_num]      <=  avst_source_axc_2                     ;
                    avst_source_axc_1d_dup4            [sym_num][ant_num]      <=  avst_source_axc_2                     ;
                    avst_source_symbol_1d_dup1        [sym_num][ant_num]         <=  avst_source_symbol_2                 ;
                    avst_source_symbol_1d_dup2        [sym_num][ant_num]         <=  avst_source_symbol_2                 ;
                    avst_source_symbol_1d_dup3        [sym_num][ant_num]         <=  avst_source_symbol_2                 ;
                    avst_source_symbol_1d_dup4        [sym_num][ant_num]         <=  avst_source_symbol_2                 ;
                    avst_source_symbol_1d_dup5        [sym_num][ant_num]         <=  avst_source_symbol_2                 ;
                    avst_source_symbol_1d_dup6        [sym_num][ant_num]         <=  avst_source_symbol_2                 ;
                    NUM_OF_DATA_WRITE_1d            [sym_num][ant_num]      <=  NUM_OF_DATA_WRITE_2_dup2 - 3'd4       ; // For Timing closure
                    NUM_OF_DATA_WRITE_2d            [sym_num][ant_num]      <=  NUM_OF_DATA_WRITE_1d[sym_num][ant_num] ; //  - 3'd4     ;
                                    
                    avst_source_ready_1d_dup2         [sym_num][ant_num]      <=  avst_source_ready_2             ;
                    avst_source_ready_1d_dup3         [sym_num][ant_num]      <=  avst_source_ready_2             ;            
                    avst_source_ready_1d_dup4         [sym_num][ant_num]      <=  avst_source_ready_2             ;
                    avst_source_ready_1d_dup5         [sym_num][ant_num]      <=  avst_source_ready_2             ;
                    avst_source_ready_1d_dup8         [sym_num][ant_num]      <=  avst_source_ready_2             ;
                    avst_source_ready_1d_dup9         [sym_num][ant_num]      <=  avst_source_ready_2             ;
                    
                end
            end
            end 
                                                         
            
             if(sym_num == 0)
            begin
                always @ (posedge clk_dsp)
                begin : READ_EN
                    
                    if (avst_source_ready_1d_dup2[0][ant_num] & ~(|avst_source_symbol_1d_dup1[0][ant_num]) ) //(avst_source_symbol_1d == 0)
                        begin
               (* parallel_case *) case(avst_source_axc_1d_dup1[0][ant_num])// synthesis parallel_case
                                4'd0    :   ram_rden [0][ant_num] <=  ((ant_num==0)|(ant_num==1));
                                4'd1    :   ram_rden [0][ant_num] <=  ((ant_num==2)|(ant_num==3));
                                4'd2    :   ram_rden [0][ant_num] <=  ((ant_num==4)|(ant_num==5));
                                4'd3    :   ram_rden [0][ant_num] <=  ((ant_num==6)|(ant_num==7));
                                default : ram_rden [0][ant_num] <=  1'b0    ;
                            endcase
                        end
                    else
                        ram_rden [0][ant_num] <=  1'b0    ;
                end
            end
            else if(sym_num == 1)
            begin
                always @ (posedge clk_dsp)
                begin : READ_EN
                    
                    if (avst_source_ready_1d_dup3[1][ant_num]& (avst_source_symbol_1d_dup2[1][ant_num] == 1))
                        begin
            (* parallel_case *) case(avst_source_axc_1d_dup2[1][ant_num])// synthesis parallel_case
                                4'd0    :   ram_rden [1][ant_num] <=  ((ant_num==0)|(ant_num==1));
                                4'd1    :   ram_rden [1][ant_num] <=  ((ant_num==2)|(ant_num==3));
                                4'd2    :   ram_rden [1][ant_num] <=  ((ant_num==4)|(ant_num==5));
                                4'd3    :   ram_rden [1][ant_num] <=  ((ant_num==6)|(ant_num==7));        
                                default : ram_rden [1][ant_num] <=  1'b0    ;
                            endcase
                        end
                    else
                        ram_rden [1][ant_num] <=  1'b0    ;
                end
            end
            else if(sym_num == 2)
            begin
                always @ (posedge clk_dsp)
                begin : READ_EN
                   
                   if (avst_source_ready_1d_dup4[2][ant_num] & (avst_source_symbol_1d_dup3[2][ant_num] == 2))
                        begin
            (* parallel_case *) case(avst_source_axc_1d_dup3[2][ant_num])// synthesis parallel_case
                                4'd0    :   ram_rden [2][ant_num] <=  ((ant_num==0)|(ant_num==1));
                                4'd1    :   ram_rden [2][ant_num] <=  ((ant_num==2)|(ant_num==3));
                                4'd2    :   ram_rden [2][ant_num] <=  ((ant_num==4)|(ant_num==5));
                                4'd3    :   ram_rden [2][ant_num] <=  ((ant_num==6)|(ant_num==7));    
                                default : ram_rden [2][ant_num] <=  1'b0    ;
                            endcase
                        end
                    else
                        ram_rden [2][ant_num] <=  1'b0    ;
                end
            end  


            else if(sym_num == 3)
            begin
                always @ (posedge clk_dsp)
                begin : READ_EN
                    if (avst_source_ready_1d_dup5[3][ant_num] & (avst_source_symbol_1d_dup4[3][ant_num] == 3))
                        begin
            (* parallel_case *) case(avst_source_axc_1d_dup4[3][ant_num])// synthesis parallel_case
                                4'd0    :   ram_rden [3][ant_num] <=  ((ant_num==0)|(ant_num==1));
                                4'd1    :   ram_rden [3][ant_num] <=  ((ant_num==2)|(ant_num==3));
                                4'd2    :   ram_rden [3][ant_num] <=  ((ant_num==4)|(ant_num==5));
                                4'd3    :   ram_rden [3][ant_num] <=  ((ant_num==6)|(ant_num==7));    
                                default : ram_rden [3][ant_num] <=  1'b0    ;
                            endcase
                        end
                    else
                        ram_rden [3][ant_num] <=  1'b0    ;
                end
            end            

            
            always @ (posedge clk_dsp)
            begin : READ_COMPARATOR
                if (rst_dsp_n_1d_dup1 == 1'b0) 
                    rdaddr_comp   [sym_num][ant_num]  <= 1'b0        ;
                else 
                    rdaddr_comp   [sym_num][ant_num]  <= (ram_rdaddress[sym_num][ant_num] == NUM_OF_DATA_WRITE_2d[sym_num][ant_num])    ;
            end
            

            
            always @ (posedge clk_dsp)
            begin : READ_ADDRESS
                if (rst_dsp_n_1d_dup1 == 1'b0) 
                    ram_rdaddress   [sym_num][ant_num]  <= 11'b0        ;
                else if (rdaddr_comp_2d [sym_num][ant_num] & ram_rden_2d_dup [sym_num][ant_num])
                    ram_rdaddress   [sym_num][ant_num]  <= 11'b0        ;
                else if (ram_rden_2d_dup [sym_num][ant_num])
                    ram_rdaddress   [sym_num][ant_num]  <= ram_rdaddress[sym_num][ant_num] + 11'b1 ;
        end
        
        
    
    always @ (posedge clk_dsp)
            begin : PIPE_DSP
                if (rst_dsp_n_1d_dup1 == 1'b0) begin
                    xran_demapper_sts_prb_vout_reg_1d    <= 'd0                                   ;
                    xran_demapper_sts_prb_vout_reg_2d    <= 'd0                                   ;
                    xran_demapper_sts_prb_vout_reg_3d    <= 'd0                                   ;
                    xran_demapper_sts_prb_vout_reg_4d    <= 'd0                                   ;

                    xran_demapper_sts_prb_dout_reg_1d    <= 'd0                                   ;
                    xran_demapper_sts_prb_dout_reg_2d    <= 'd0                                   ;
                    xran_demapper_sts_prb_dout_reg_3d    <= 'd0                                   ;
                    
                    
                end else begin
                    xran_demapper_sts_prb_vout_reg_1d    <= xran_demapper_sts_prb_vout            ;
                    xran_demapper_sts_prb_vout_reg_2d   <= xran_demapper_sts_prb_vout_reg_1d    ;
                    xran_demapper_sts_prb_vout_reg_3d   <= xran_demapper_sts_prb_vout_reg_2d    ;
                    xran_demapper_sts_prb_vout_reg_4d   <= xran_demapper_sts_prb_vout_reg_3d    ;
                    
                    xran_demapper_sts_prb_dout_reg_1d    <= xran_demapper_sts_prb_dout            ;
                    xran_demapper_sts_prb_dout_reg_2d   <= xran_demapper_sts_prb_dout_reg_1d    ;
                    xran_demapper_sts_prb_dout_reg_3d   <= xran_demapper_sts_prb_dout_reg_2d    ;
                end
            end

/************************************************ C Plane array preparation and PRB/symbol Blanking logic ************************************************/
    integer j;
    //C plane array formation
    always @ (posedge clk_eth  )
    begin
        if (~rst_eth_n) begin
           c_prb_arr[sym_num][ant_num] <= 273'b0;
        end else if (slot_chg_str_3d) begin
           for (j=0; j<NUM_OF_ANT; j=j+1) begin
              if (prb_idx_d >= c_startprb_d[j] && prb_idx_d < c_numprb_w[j] && c_axc_d[j]==ant_num)
                 c_prb_arr[sym_num][ant_num][prb_idx_d] <= 1'b1;
           end
        end else if (slot_chg_str_1d) begin
           c_prb_arr[sym_num][ant_num] <= 273'b0;
        end
    end

    always @ (posedge clk_eth  )
    begin
        if (~rst_eth_n) begin
           c_prb_arr_d1[sym_num][ant_num]     <= 273'b0;
           c_prb_arr_d2[sym_num][ant_num]     <= 273'b0;
        end else begin
           c_prb_arr_d1[sym_num][ant_num]     <= c_prb_arr[sym_num][ant_num];
           c_prb_arr_d2[sym_num][ant_num]     <= c_prb_arr_d1[sym_num][ant_num];
        end
    end

    // C plane array CDC. This array will not be utilized immediately since it is formed in advance based on C plane packet arrival
    always @ (posedge clk_dsp  )
    begin
        if (rst_dsp_n_1d_dup4) begin
           c_prb_arr_dsp_d1[sym_num][ant_num] <= 273'b0;
           c_prb_arr_dsp_d2[sym_num][ant_num] <= 273'b0;
           c_prb_arr_dsp_d3[sym_num][ant_num] <= 273'b0;
        end else begin
           c_prb_arr_dsp_d1[sym_num][ant_num] <= c_prb_arr_d2[sym_num][ant_num];
           c_prb_arr_dsp_d2[sym_num][ant_num] <= c_prb_arr_dsp_d1[sym_num][ant_num];
           c_prb_arr_dsp_d3[sym_num][ant_num] <= c_prb_arr_dsp_d2[sym_num][ant_num];
        end
    end

    // Use C plane array to decide PRBs to be blanked
    always @ (posedge clk_dsp  )
    begin
        if (rst_dsp_n_1d_dup4) begin
           prb_blank[sym_num][ant_num] <= 1'b0;   
        end else if (ram_rden_4d [sym_num][ant_num] && (re_cnt[sym_num][ant_num]=='b1)) begin
           prb_blank[sym_num][ant_num] <= c_prb_arr_dsp_d3[sym_num][ant_num][prb_cnt_d[sym_num][ant_num]];
        end
    end
   
    always @ (posedge clk_dsp  )
    begin
        prb_blank_d[sym_num][ant_num] <= prb_blank[sym_num][ant_num];
    end

    // U plane array formation based on U plane packet header information
    always @ (posedge clk_eth)
                begin : ACTIVE_PRB
                    if (rst_eth_n == 1'b0) 
                        active_prb [sym_num][ant_num] <=  'd0    ;    
                    else if (avst_sink_valid_4d & (avst_sink_channel_4d == ant_num) & xran_demapper_sts_prb_vout_2d_dup1_2d [sym_num] [ant_num])
                    begin        
                        case(avst_sink_symbolid_dup2[sym_num][ant_num])// synthesis parallel_case                    
                                'd0:if(sym_num == 0) active_prb [sym_num][ant_num] <=  (start_prb [sym_num][ant_num] + num_prb [sym_num][ant_num])  ;
                                'd1:if(sym_num == 1) active_prb [sym_num][ant_num] <=  (start_prb [sym_num][ant_num] + num_prb [sym_num][ant_num])  ;
                                'd2:if(sym_num == 2) active_prb [sym_num][ant_num] <=  (start_prb [sym_num][ant_num] + num_prb [sym_num][ant_num])  ;
                                'd3:if(sym_num == 3) active_prb [sym_num][ant_num] <=  (start_prb [sym_num][ant_num] + num_prb [sym_num][ant_num])  ;
                                default : active_prb [sym_num][ant_num] <=  active_prb [sym_num][ant_num]   ;                            
                        endcase                    
                    end
                    else if (sym_reset_pulse [sym_num][ant_num])
                        active_prb [sym_num][ant_num] <= 'b0;
                end
    
    
    
    // U plane array formation based on U plane packet header information
    always @ (posedge clk_eth)
    begin : ACTIVE_PRB_ARR
        if (rst_eth_n == 1'b0) 
            active_prb_arr [sym_num][ant_num] <= 'b0 ;
        else if (xran_demapper_sts_prb_vout_2d_dup1_4d [sym_num][ant_num])
             begin
                for (j = 0; j <= 272; j = j+1)
                    begin : ACTIVE_PRB_VAL
                        if (j >= start_prb_latch [sym_num][ant_num] & j < active_prb [sym_num][ant_num])
                            active_prb_arr [sym_num][ant_num][j] <= 1'b1 ;
                    end
            end
        else if (sym_reset_pulse [sym_num][ant_num])
                        active_prb_arr [sym_num][ant_num] <= 'b0;
    end 


    // Symbol Reset Generation 
    always @ (posedge clk_dsp  )
                begin : GEN_SYM_RESET
                    if (rst_dsp_n_1d_dup1 == 1'b0) 
                        sym_reset [sym_num][ant_num]   <= 'b0 ;
                    else if (ram_rden_4d [sym_num][ant_num] & (ram_rdaddress_2d [sym_num][ant_num] == NUM_OF_DATA_WRITE_2d[sym_num][ant_num]))
                        sym_reset [sym_num][ant_num] <= 1'b1 ;
                    else 
                        sym_reset [sym_num][ant_num] <= 1'b0 ;
                end 
                
    
    
    always @ (posedge clk_dsp  )
                begin : PIPE_DSP_SYM_RESET
                    if (rst_dsp_n_1d_dup2 ) begin
                        sym_reset_pul_1d [sym_num][ant_num]               <= 'b0 ;
                        sym_reset_pul_2d [sym_num][ant_num]               <= 'b0 ;
                        sym_reset_pul_3d [sym_num][ant_num]               <= 'b0 ;
                        sym_reset_pul [sym_num][ant_num]                 <= 'b0 ;
                    end else begin
                        sym_reset_pul_1d [sym_num][ant_num]             <= sym_reset             [sym_num][ant_num];
                        sym_reset_pul_2d [sym_num][ant_num]             <= sym_reset_pul_1d     [sym_num][ant_num];
                        sym_reset_pul_3d [sym_num][ant_num]             <= sym_reset_pul_2d     [sym_num][ant_num];
                        sym_reset_pul [sym_num][ant_num]                 <= sym_reset_pul_1d [sym_num][ant_num] | sym_reset_pul_2d [sym_num][ant_num] | sym_reset_pul_3d [sym_num][ant_num] ;
                    end
                end            

//assign sym_reset_pul [sym_num][ant_num]  = sym_reset_pul_1d [sym_num][ant_num] | sym_reset_pul_2d [sym_num][ant_num] | sym_reset_pul_3d [sym_num][ant_num] ;


    always @ (posedge clk_eth  )
                begin : PIPE_SYM_RESET
                    if (rst_eth_n == 1'b0) begin
                        sym_reset_1d [sym_num][ant_num]               <= 'b0 ;
                        sym_reset_2d [sym_num][ant_num]               <= 'b0 ;
                        sym_reset_3d [sym_num][ant_num]               <= 'b0 ;
                        sym_reset_4d [sym_num][ant_num]               <= 'b0 ;
                        sym_reset_5d [sym_num][ant_num]               <= 'b0 ;
                        
                    end else begin
                        sym_reset_1d [sym_num][ant_num]             <= sym_reset_pul     [sym_num][ant_num];
                        sym_reset_2d [sym_num][ant_num]             <= sym_reset_1d     [sym_num][ant_num];
                        sym_reset_3d [sym_num][ant_num]             <= sym_reset_2d     [sym_num][ant_num];
                        sym_reset_4d [sym_num][ant_num]             <= sym_reset_3d     [sym_num][ant_num];
                        sym_reset_5d [sym_num][ant_num]             <= sym_reset_4d     [sym_num][ant_num];
                        

                    end
                end

always @ (posedge clk_eth  )
                begin : SYM_RESET_PULSE
                    if (rst_eth_n == 1'b0) begin
                        sym_reset_pulse [sym_num][ant_num]               <= 'b0 ;                       
                    end else begin
                        sym_reset_pulse [sym_num][ant_num] <= sym_reset_2d [sym_num][ant_num] | sym_reset_3d [sym_num][ant_num] | sym_reset_4d [sym_num][ant_num];
                    end
                end

//assign sym_reset_pulse [sym_num][ant_num] = sym_reset_3d [sym_num][ant_num] | sym_reset_4d [sym_num][ant_num] | sym_reset_5d [sym_num][ant_num] ;
//assign avst_source_ready_count_last       = avst_source_ready_1d_dup6 & (avst_source_ready_count_dup1 == (NUM_OF_DATA_WRITE_dup1_1-1)) ;


    
    /* //Blank Symbol Generation based on U plane and C plane array comparison
    always @ (posedge clk_eth)
            begin : GEN_BLANK_PRB
                if (rst_eth_n == 1'b0) begin
                    blank_sym1[sym_num][ant_num]  <= 1'b0  ;
                    blank_sym2[sym_num][ant_num]  <= 1'b0  ;
                    blank_sym3[sym_num][ant_num]  <= 1'b0  ;
                end else begin
                    blank_sym1[sym_num][ant_num]  <= (active_prb_arr[sym_num][ant_num][0  +: 91] == c_prb_arr_d2[sym_num][ant_num][0  +: 91])    ;
                    blank_sym2[sym_num][ant_num]  <= (active_prb_arr[sym_num][ant_num][91 +: 91] == c_prb_arr_d2[sym_num][ant_num][91 +: 91])    ;
                    blank_sym3[sym_num][ant_num]  <= (active_prb_arr[sym_num][ant_num][182+: 91] == c_prb_arr_d2[sym_num][ant_num][182+: 91])    ;
            end    
            end */
	//Blank Symbol Generation based on U plane and C plane array comparison(parallel processing to improve timng)		
	always @(posedge clk_eth) begin : GEN_BLANK_PRB
    if (rst_eth_n == 1'b0) begin
        blank_sym1[sym_num][ant_num] <= 1'b0;
        blank_sym2[sym_num][ant_num] <= 1'b0;
        blank_sym3[sym_num][ant_num] <= 1'b0;
        blank_sym4[sym_num][ant_num] <= 1'b0;
        blank_sym5[sym_num][ant_num] <= 1'b0;
        blank_sym6[sym_num][ant_num] <= 1'b0;
        blank_sym7[sym_num][ant_num] <= 1'b0;
        blank_sym8[sym_num][ant_num] <= 1'b0;
        blank_sym9[sym_num][ant_num] <= 1'b0;
        blank_sym10[sym_num][ant_num] <= 1'b0;
        blank_sym11[sym_num][ant_num] <= 1'b0;
        blank_sym12[sym_num][ant_num] <= 1'b0;
        blank_sym13[sym_num][ant_num] <= 1'b0;
    end else begin
        blank_sym1[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][0  +: 21] == c_prb_arr_d2[sym_num][ant_num][0  +: 21]);
        blank_sym2[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][21 +: 21] == c_prb_arr_d2[sym_num][ant_num][21 +: 21]);
        blank_sym3[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][42 +: 21] == c_prb_arr_d2[sym_num][ant_num][42 +: 21]);
        blank_sym4[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][63 +: 21] == c_prb_arr_d2[sym_num][ant_num][63 +: 21]);
        blank_sym5[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][84 +: 21] == c_prb_arr_d2[sym_num][ant_num][84 +: 21]);
        blank_sym6[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][105 +: 21] == c_prb_arr_d2[sym_num][ant_num][105 +: 21]);
        blank_sym7[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][126 +: 21] == c_prb_arr_d2[sym_num][ant_num][126 +: 21]);
        blank_sym8[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][147 +: 21] == c_prb_arr_d2[sym_num][ant_num][147 +: 21]);
        blank_sym9[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][168 +: 21] == c_prb_arr_d2[sym_num][ant_num][168 +: 21]);
        blank_sym10[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][189 +: 21] == c_prb_arr_d2[sym_num][ant_num][189 +: 21]);
        blank_sym11[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][210 +: 21] == c_prb_arr_d2[sym_num][ant_num][210 +: 21]);
        blank_sym12[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][231 +: 21] == c_prb_arr_d2[sym_num][ant_num][231 +: 21]);
        blank_sym13[sym_num][ant_num] <= (active_prb_arr[sym_num][ant_num][252 +: 21] == c_prb_arr_d2[sym_num][ant_num][252 +: 21]);
    end
end

    
    
    always @ (posedge clk_dsp)
            begin 
                if (rst_dsp_n_1d_dup2 ) begin
                    blank_sym_1d[sym_num][ant_num]  <= 'd0  ;
                    blank_sym_2d[sym_num][ant_num]  <= 'd0  ;
                end else begin
                    blank_sym_1d[sym_num][ant_num]  <= blank_sym1[sym_num][ant_num] && blank_sym2[sym_num][ant_num] && blank_sym3[sym_num][ant_num] && blank_sym4[sym_num][ant_num] && blank_sym5[sym_num][ant_num] && blank_sym6[sym_num][ant_num] && blank_sym7[sym_num][ant_num] && blank_sym8[sym_num][ant_num] && blank_sym9[sym_num][ant_num] && blank_sym10[sym_num][ant_num] && blank_sym11[sym_num][ant_num] && blank_sym12[sym_num][ant_num] && blank_sym13[sym_num][ant_num];
                    blank_sym_2d[sym_num][ant_num]  <= blank_sym_1d[sym_num][ant_num]    ;
            end    
            end
    
    //RE counter control logic
    always @ (posedge clk_dsp)
            begin : RE_CNT
                if (rst_dsp_n_1d_dup2 ) 
                    re_cnt   [sym_num][ant_num]  <= 4'b0  ;
                else if (ram_rden_2d [sym_num][ant_num])
                    re_cnt   [sym_num][ant_num]  <= ram_rdaddress[sym_num][ant_num] % 'd12 ;
                else
                    re_cnt  [sym_num][ant_num] <= 'b0;
            end
    
    //PRB counter control logic
    always @ (posedge clk_dsp)
            begin : PRB_CNT
                if (rst_dsp_n_1d_dup2 ) 
                    prb_cnt   [sym_num][ant_num]  <= 9'b0  ;
                else if (rdaddr_comp_3d[sym_num][ant_num] && ram_rden_3d [sym_num][ant_num] && re_cnt[sym_num][ant_num]=='d11)
                    prb_cnt   [sym_num][ant_num]  <= 9'b0  ;
                else if (ram_rden_3d [sym_num][ant_num] && re_cnt[sym_num][ant_num]=='d11)
                    prb_cnt   [sym_num][ant_num]  <= prb_cnt[sym_num][ant_num] + 1'b1;
            end
    
    always @ (posedge clk_dsp) begin
       prb_cnt_d[sym_num][ant_num] <= prb_cnt[sym_num][ant_num];
    end
   
    // MUX between ram readata and zeroes based on blanking signal 
    always@(posedge clk_dsp) begin
        if(rst_dsp_n_1d_dup2) begin
                    ram_readdata_2d_dup[sym_num][ant_num]     <= {DSP_DATAWIDTH{1'b0}} ;
        end else begin
            if(ram_rden_6d [sym_num][ant_num] ) begin //block readata when prb_blank and blank_sym are 0
                ram_readdata_2d_dup [sym_num][ant_num]     <= ram_readdata [sym_num][ant_num];
            end else begin
                ram_readdata_2d_dup [sym_num][ant_num]     <= {DSP_DATAWIDTH{1'b0}}  ;
            end
    
        end
    end
    
    
    // Blanking Disabled case
    always @ (posedge clk_dsp)
    begin : PIPE_RAM_DATA
        if (rst_dsp_n_1d_dup1 == 1'b0) begin
            ram_readdata_2d_dup_1d [sym_num][ant_num] <= {DSP_DATAWIDTH{1'b0}}  ;
        end else if (blanking_dis) begin
            ram_readdata_2d_dup_1d [sym_num][ant_num] <= ram_readdata_1d [sym_num][ant_num];
        end else begin
            ram_readdata_2d_dup_1d [sym_num][ant_num] <= ram_readdata_2d_dup [sym_num][ant_num];
        end
    end
/************************************************ Blanking logic END ************************************************/
    
        end
    end
    
    endgenerate
    
     always@(posedge clk_dsp)
     begin: BLANK_PRB_FLAG
     if(rst_dsp_n_1d_dup1 == 1'b0)
     blank_prb_flag      <= 32'd0;
     else begin
      blank_prb_flag[0]  <= blank_sym_2d[0][0];
      blank_prb_flag[1]  <= blank_sym_2d[0][1];
      blank_prb_flag[2]  <= blank_sym_2d[0][2];
      blank_prb_flag[3]  <= blank_sym_2d[0][3];
      blank_prb_flag[4]  <= blank_sym_2d[0][4];
      blank_prb_flag[5]  <= blank_sym_2d[0][5];
      blank_prb_flag[6]  <= blank_sym_2d[0][6];
      blank_prb_flag[7]  <= blank_sym_2d[0][7];
      
      blank_prb_flag[8]  <= blank_sym_2d[1][0];
      blank_prb_flag[9]  <= blank_sym_2d[1][1];
      blank_prb_flag[10] <= blank_sym_2d[1][2];
      blank_prb_flag[11] <= blank_sym_2d[1][3];
      blank_prb_flag[12] <= blank_sym_2d[1][4];
      blank_prb_flag[13] <= blank_sym_2d[1][5];
      blank_prb_flag[14] <= blank_sym_2d[1][6];
      blank_prb_flag[15] <= blank_sym_2d[1][7];
      
      blank_prb_flag[16] <= blank_sym_2d[2][0];
      blank_prb_flag[17] <= blank_sym_2d[2][1];
      blank_prb_flag[18] <= blank_sym_2d[2][2];
      blank_prb_flag[19] <= blank_sym_2d[2][3];
      blank_prb_flag[20] <= blank_sym_2d[2][4];
      blank_prb_flag[21] <= blank_sym_2d[2][5];
      blank_prb_flag[22] <= blank_sym_2d[2][6];
      blank_prb_flag[23] <= blank_sym_2d[2][7];
      
      blank_prb_flag[24] <= blank_sym_2d[3][0];
      blank_prb_flag[25] <= blank_sym_2d[3][1];
      blank_prb_flag[26] <= blank_sym_2d[3][2];
      blank_prb_flag[27] <= blank_sym_2d[3][3];
      blank_prb_flag[28] <= blank_sym_2d[3][4];
      blank_prb_flag[29] <= blank_sym_2d[3][5];
      blank_prb_flag[30] <= blank_sym_2d[3][6];
      blank_prb_flag[31] <= blank_sym_2d[3][7];
     end
     end
     
     // PRB Blanking Interrupt
     assign blank_prb_intr = ~ (&(blank_prb_flag)) ;

    assign avst_source_data_buf_0_axc_0_1   = {ram_readdata_2d_dup_1d [0][1],ram_readdata_2d_dup_1d [0][0]} ;
    assign avst_source_data_buf_1_axc_0_1   = {ram_readdata_2d_dup_1d [1][1],ram_readdata_2d_dup_1d [1][0]} ;
    assign avst_source_data_buf_2_axc_0_1   = {ram_readdata_2d_dup_1d [2][1],ram_readdata_2d_dup_1d [2][0]} ;
    assign avst_source_data_buf_3_axc_0_1   = {ram_readdata_2d_dup_1d [3][1],ram_readdata_2d_dup_1d [3][0]} ;

    assign avst_source_data_buf_0_axc_2_3   = {ram_readdata_2d_dup_1d [0][3],ram_readdata_2d_dup_1d [0][2]} ;
    assign avst_source_data_buf_1_axc_2_3   = {ram_readdata_2d_dup_1d [1][3],ram_readdata_2d_dup_1d [1][2]} ;
    assign avst_source_data_buf_2_axc_2_3   = {ram_readdata_2d_dup_1d [2][3],ram_readdata_2d_dup_1d [2][2]} ;
    assign avst_source_data_buf_3_axc_2_3   = {ram_readdata_2d_dup_1d [3][3],ram_readdata_2d_dup_1d [3][2]} ;

    assign avst_source_data_buf_0_axc_4_5   = {ram_readdata_2d_dup_1d [0][5],ram_readdata_2d_dup_1d [0][4]} ;
    assign avst_source_data_buf_1_axc_4_5   = {ram_readdata_2d_dup_1d [1][5],ram_readdata_2d_dup_1d [1][4]} ;     
    assign avst_source_data_buf_2_axc_4_5   = {ram_readdata_2d_dup_1d [2][5],ram_readdata_2d_dup_1d [2][4]} ;
    assign avst_source_data_buf_3_axc_4_5   = {ram_readdata_2d_dup_1d [3][5],ram_readdata_2d_dup_1d [3][4]} ;

    assign avst_source_data_buf_0_axc_6_7   = {ram_readdata_2d_dup_1d [0][7],ram_readdata_2d_dup_1d [0][6]} ;
    assign avst_source_data_buf_1_axc_6_7   = {ram_readdata_2d_dup_1d [1][7],ram_readdata_2d_dup_1d [1][6]} ;
    assign avst_source_data_buf_2_axc_6_7   = {ram_readdata_2d_dup_1d [2][7],ram_readdata_2d_dup_1d [2][6]} ;
    assign avst_source_data_buf_3_axc_6_7   = {ram_readdata_2d_dup_1d [3][7],ram_readdata_2d_dup_1d [3][6]} ; 
    
    /*assign avst_source_data_buf_0_axc_0_1   = {ram_readdata_2d [0][1],ram_readdata_2d [0][0]} ;
    assign avst_source_data_buf_1_axc_0_1   = {ram_readdata_2d [1][1],ram_readdata_2d [1][0]} ;
    assign avst_source_data_buf_2_axc_0_1   = {ram_readdata_2d [2][1],ram_readdata_2d [2][0]} ;
    assign avst_source_data_buf_3_axc_0_1   = {ram_readdata_2d [3][1],ram_readdata_2d [3][0]} ;
                        
    assign avst_source_data_buf_0_axc_2_3   = {ram_readdata_2d [0][3],ram_readdata_2d [0][2]} ;
    assign avst_source_data_buf_1_axc_2_3   = {ram_readdata_2d [1][3],ram_readdata_2d [1][2]} ;
    assign avst_source_data_buf_2_axc_2_3   = {ram_readdata_2d [2][3],ram_readdata_2d [2][2]} ;
    assign avst_source_data_buf_3_axc_2_3   = {ram_readdata_2d [3][3],ram_readdata_2d [3][2]} ;
    
    assign avst_source_data_buf_0_axc_4_5   = {ram_readdata_2d [0][5],ram_readdata_2d [0][4]} ;
    assign avst_source_data_buf_1_axc_4_5   = {ram_readdata_2d [1][5],ram_readdata_2d [1][4]} ;     
    assign avst_source_data_buf_2_axc_4_5   = {ram_readdata_2d [2][5],ram_readdata_2d [2][4]} ;
    assign avst_source_data_buf_3_axc_4_5   = {ram_readdata_2d [3][5],ram_readdata_2d [3][4]} ;
    
    assign avst_source_data_buf_0_axc_6_7   = {ram_readdata_2d [0][7],ram_readdata_2d [0][6]} ;
    assign avst_source_data_buf_1_axc_6_7   = {ram_readdata_2d [1][7],ram_readdata_2d [1][6]} ;
    assign avst_source_data_buf_2_axc_6_7   = {ram_readdata_2d [2][7],ram_readdata_2d [2][6]} ;
    assign avst_source_data_buf_3_axc_6_7   = {ram_readdata_2d [3][7],ram_readdata_2d [3][6]} ; */

    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF0_MUX_STAGE1_0_LSB
        if (avst_source_axc_1_9d_1[0])
        begin
            avst_source_data_buf0_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] <= avst_source_data_buf_0_axc_2_3[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
        else
        begin
            avst_source_data_buf0_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] <= avst_source_data_buf_0_axc_0_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF0_MUX_STAGE1_0_MSB
        if (avst_source_axc_2_9d_2[0])
        begin
            avst_source_data_buf0_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] <= avst_source_data_buf_0_axc_2_3[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
        else
        begin
            avst_source_data_buf0_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] <= avst_source_data_buf_0_axc_0_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF0_MUX_STAGE1_1_LSB
        if (avst_source_axc_1_9d_3[0])
        begin
            avst_source_data_buf0_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] <= avst_source_data_buf_0_axc_6_7[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0];
        end
        else
        begin
            avst_source_data_buf0_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] <= avst_source_data_buf_0_axc_4_5[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF0_MUX_STAGE1_1_MSB
        if (avst_source_axc_2_9d_4[0])
        begin
            avst_source_data_buf0_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] <= avst_source_data_buf_0_axc_6_7[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
        else
        begin
            avst_source_data_buf0_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] <= avst_source_data_buf_0_axc_4_5[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
    end

               
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF1_MUX_STAGE1_0_LSB
        if (avst_source_axc_1_9d_5[0])
        begin
            avst_source_data_buf1_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_1_axc_2_3[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
        else
        begin
            avst_source_data_buf1_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_1_axc_0_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF1_MUX_STAGE1_0_MSB
        if (avst_source_axc_2_9d_6[0])
        begin
            avst_source_data_buf1_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_1_axc_2_3[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
        else
        begin
            avst_source_data_buf1_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_1_axc_0_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
    end

    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF1_MUX_STAGE1_1_LSB
        if (avst_source_axc_1_9d_7[0])
        begin
            avst_source_data_buf1_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_1_axc_6_7[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
        else
        begin
            avst_source_data_buf1_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_1_axc_4_5[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_ODD_SYM_MUX_STAGE1_1_MSB
        if (avst_source_axc_2_9d_8[0])
        begin
            avst_source_data_buf1_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_1_axc_6_7[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
        else
        begin
            avst_source_data_buf1_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_1_axc_4_5[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
    end
        
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF2_MUX_STAGE1_0_LSB
        if (avst_source_axc_1_9d_9[0])
        begin
            avst_source_data_buf2_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_2_axc_2_3[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
        else
        begin
            avst_source_data_buf2_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_2_axc_0_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF2_MUX_STAGE1_0_MSB
        if (avst_source_axc_2_9d_10[0])
        begin
            avst_source_data_buf2_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_2_axc_2_3[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
        else
        begin
            avst_source_data_buf2_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_2_axc_0_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
    end

    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF2_MUX_STAGE1_1_LSB
        if (avst_source_axc_1_9d_11[0])
        begin
            avst_source_data_buf2_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_2_axc_6_7[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
        else
        begin
            avst_source_data_buf2_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_2_axc_4_5[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF2_MUX_STAGE1_1_MSB
        if (avst_source_axc_2_9d_12[0])
        begin
            avst_source_data_buf2_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_2_axc_6_7[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
        else
        begin
            avst_source_data_buf2_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_2_axc_4_5[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
    end
    
        
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF3_MUX_STAGE1_0_LSB
        if (avst_source_axc_1_9d_13[0])
        begin
            avst_source_data_buf3_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_3_axc_2_3[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
        else
        begin
            avst_source_data_buf3_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_3_axc_0_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF3_MUX_STAGE1_0_MSB
        if (avst_source_axc_2_9d_14[0])
        begin
            avst_source_data_buf3_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_3_axc_2_3[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
        else
        begin
            avst_source_data_buf3_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_3_axc_0_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
    end

    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF3_MUX_STAGE1_1_LSB
        if (avst_source_axc_1_9d_15[0])
        begin
            avst_source_data_buf3_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_3_axc_6_7[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
        else
        begin
            avst_source_data_buf3_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf_3_axc_4_5[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF3_MUX_STAGE1_1_MSB
        if (avst_source_axc_2_9d_16[0])
        begin
            avst_source_data_buf3_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_3_axc_6_7[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
        else
        begin
            avst_source_data_buf3_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf_3_axc_4_5[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
    end
 
    
    
    
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF0_MUX_STAGE2_0_LSB
        if (avst_source_axc_1_10d_1[1])
        begin
            avst_source_data_buf0_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] <= avst_source_data_buf0_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
        else
        begin
            avst_source_data_buf0_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] <= avst_source_data_buf0_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0] ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF0_MUX_STAGE2_0_MSB
        if (avst_source_axc_2_10d_2[1])
        begin
            avst_source_data_buf0_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] <= avst_source_data_buf0_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
        else
        begin
            avst_source_data_buf0_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] <= avst_source_data_buf0_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)] ;
        end
    end
    

    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF1_MUX_STAGE2_0_LSB
        if (avst_source_axc_1_10d_3[1])
        begin
            avst_source_data_buf1_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf1_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
        else
        begin
            avst_source_data_buf1_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf1_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF1_MUX_STAGE2_0_MSB
        if (avst_source_axc_2_10d_4[1])
        begin
            avst_source_data_buf1_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf1_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
        else
        begin
            avst_source_data_buf1_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf1_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF2_MUX_STAGE2_0_LSB
        if (avst_source_axc_1_10d_5[1])
        begin
            avst_source_data_buf2_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf2_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
        else
        begin
            avst_source_data_buf2_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf2_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF2_MUX_STAGE2_0_MSB
        if (avst_source_axc_2_10d_6[1])
        begin
            avst_source_data_buf2_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf2_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
        else
        begin
            avst_source_data_buf2_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf2_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
    end

    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF3_MUX_STAGE2_0_LSB
        if (avst_source_axc_1_10d_7[1])
        begin
            avst_source_data_buf3_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf3_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
        else
        begin
            avst_source_data_buf3_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  <= avst_source_data_buf3_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]  ;
        end
    end
    
    always @ (posedge clk_dsp)
    begin : AVST_SOURCE_DATA_BUF3_MUX_STAGE2_0_MSB
        if (avst_source_axc_2_10d_8[1])
        begin
            avst_source_data_buf3_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf3_mux_stage1_1[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
        else
        begin
            avst_source_data_buf3_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  <= avst_source_data_buf3_mux_stage1_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]  ;
        end
    end
        
        
                
    always @ (posedge clk_dsp)
    begin : SOURCE_DATA1
        if (rst_dsp_n_1d_dup1 == 1'b0) 
            avst_source_data_mux_lsb    <= {NUM_OF_IF*DSP_DATAWIDTH{1'b0}}    ;
        else
        begin
        case(avst_source_symbol_1_14d_dup1) // synthesis parallel_case
            'd0:avst_source_data_mux_lsb    <= avst_source_data_buf0_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]       ;
            'd1:avst_source_data_mux_lsb    <= avst_source_data_buf1_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]       ;
            'd2:avst_source_data_mux_lsb    <= avst_source_data_buf2_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]       ;
            'd3:avst_source_data_mux_lsb    <= avst_source_data_buf3_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH/2)-1:0]       ;
            default: avst_source_data_mux_lsb    <= {NUM_OF_IF*DSP_DATAWIDTH{1'b0}}                                      ;
        endcase
        end
    end

    always @ (posedge clk_dsp)
    begin : SOURCE_DATA2
        if (rst_dsp_n_1d_dup1 == 1'b0) 
            avst_source_data_mux_msb    <= {NUM_OF_IF*DSP_DATAWIDTH{1'b0}}    ;
        else
        begin
        case(avst_source_symbol_2_14d_dup2) // synthesis parallel_case
            'd0:avst_source_data_mux_msb    <= avst_source_data_buf0_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]       ;
            'd1:avst_source_data_mux_msb    <= avst_source_data_buf1_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]       ;
            'd2:avst_source_data_mux_msb    <= avst_source_data_buf2_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]       ;
            'd3:avst_source_data_mux_msb    <= avst_source_data_buf3_mux_stage2_0[(NUM_OF_IF*DSP_DATAWIDTH)-1:(NUM_OF_IF*DSP_DATAWIDTH/2)]       ;
            default: avst_source_data_mux_msb    <= {NUM_OF_IF*DSP_DATAWIDTH{1'b0}}    ;
        endcase
        end
    end 
    
    
    
   // assign avst_source_valid            = avst_source_ready_14d ;
   
   //assign avst_source_valid_1            = (~bw_config_reg_cc1_2d[7])?  avst_source_ready_1_14d : 0 ;
   //assign avst_source_valid_2            = (~bw_config_reg_cc2_2d[7])?  avst_source_ready_2_14d : 0 ;

   assign avst_source_valid_1            =  avst_source_ready_1_14d  ;
   assign avst_source_valid_2            =  avst_source_ready_2_14d  ;

    
    
    
    assign c_plane_info_valid = c_ram_rden_4d;
    assign c_cplength         = c_ram_readdata_2d[23:8]        ;
    assign c_fftsize          = c_ram_readdata_2d[7:4]         ;
    

endmodule
