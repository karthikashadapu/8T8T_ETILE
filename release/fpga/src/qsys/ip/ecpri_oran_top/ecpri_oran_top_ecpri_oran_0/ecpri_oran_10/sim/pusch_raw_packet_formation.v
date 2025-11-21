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



// ================================================================================ 
// File:        pusch_raw_packet_formation.v
// Author:      Boobathi Selvaraj
// Description: Sub block of CU Plane coupling. 
//              Uplink Frequency domain data from FFT is stored into a Buffer and then packets are framed as per Uplink C Plane information
//              C plane header is read from C plane FDV Buffer and then based on start and Num PRB, the data is read from PUSCH buffer and 
//              then RAW packet is framed and then sent to ORAN IP
//                    
//              It has Store and Forward FIFO to support continuos valid data b/w SOP to EOP as per ORAN Requirement.         
//              It has Statemachine to read the header from FDV and align the Headers along with data    
    
//              The Generated Symbol number is appended into   [101:96] bit location. Symbol number is 6 bit so added 2 bits zero .        
//              The generated Sequence number is appended into [71:64] bit location as this is reserved bit in ORAN Standard. 
//              This is for ORAN IP seq number when fragmentation is disabled
//              The Tx_U_Size(max_pkt_size_6d) is assigned at location [ 95:80] -- 16 bit generated internally and updated based on CC1/CC2 BW
// ================================================================================   

`timescale 1ns/1ns
 
module pusch_raw_packet_formation 
#(parameter NUM_OF_EAXC_PER_PORT    = 4,
  parameter NUM_OF_PHYSICAL_PORTS   = 2,
  parameter NUM_OF_CC               = 2,
  parameter EAXC_ID_START           = 0
  )
(
   clk_dsp                             ,
   rst_dsp_n                           ,
   
   clk_eth                             ,
   rst_eth_n                           ,
   
   // Stream Input 
   avst_sink_valid                     , 
   avst_sink_data                      ,
   avst_sink_channel                   ,
   avst_sink_endofpacket               ,
   avst_sink_startofpacket             ,
                                       
   // Stream Output    
   avst_source_valid                   ,
   avst_source_data                    ,
   avst_source_channel                 ,
   avst_source_ready                   ,
   avst_source_endofpacket             ,
   avst_source_startofpacket           ,
        
   tx_uplane_metadata_in               ,
   tx_uplane_metavalid_in              ,
   
   tx_uplane_metadata_out              ,
   tx_uplane_metadata_ready            ,
   tx_uplane_numprbu_size              , 
   
   last_sym_arrived                    ,
   dl_ul_bw_config                     ,                
   arbiter_request                     ,
   status_clear                        ,
   status_register                     ,
   statistics_register                 ,
   timing_reference                    ,
   rx_c_subframeId_2d                  ,
   rx_c_slotId_2d                      ,
   last_sym_arrived_latch_clr          ,
   sf_slot_match                       ,
   first_cplane_detect                 ,
   uplane_slot_boundary                ,
   cc1_enable                          ,
   cc2_enable                              
);


//Parameters Declaration
parameter NUM_OF_ANT          =   NUM_OF_EAXC_PER_PORT * NUM_OF_PHYSICAL_PORTS         ;
parameter NUM_OF_FFT          =   NUM_OF_PHYSICAL_PORTS  ;
parameter DSP_IQ_DATAWIDTH    =   32     ;
parameter ETH_IQ_DATAWIDTH    =   128    ;
parameter CPLANE_DATAWIDTH    =   128    ;
parameter BW_DATAWIDTH        =   10     ;
parameter MAX_CYCLE_COUNT_100 =   819    ; // 100 MHz - 273*12*32/128    ;
parameter MAX_CYCLE_COUNT_60  =   486    ; // 60 MHz - 162*12*32/128

parameter MAX_PRB_100         =   'd273  ; // 100Mhz - 273 PRBS
parameter MAX_PRB_60          =   'd162  ; //60MHz - 162 PRBs


parameter MAX_PKT_SIZE_100    =   13112  ; // 100 MHz - 273*12*32/8 + 8  // including Header    
parameter MAX_PKT_SIZE_60     =   7784   ; // 100 MHz - 162*12*32/8 + 8  // including Header    

parameter BW_CONFIG_CC_60     =   4'b1010;
parameter BW_CONFIG_CC_100    =   4'b1110;

localparam ETH_WAIT_CYCLE     =   1      ;
localparam NUM_OF_SYM         =   14     ;   //per slot

localparam OUTPUT_FIFO_WIDTH  =   290    ;  //Dont modify
localparam OUTPUT_FIFO_DEPTH  =   128    ;  //Dont modify

localparam SCS_SELECT_PUSCH   =   4'd0   ;

localparam SINK_PKT_CYCLES_100  =   3276 ;
localparam SINK_PKT_CYCLES_60   =   1944 ;

wire    [OUTPUT_FIFO_WIDTH-1: 0]        output_fifo_data    ;
wire                                    output_fifo_rdreq   ;
wire                                    output_fifo_wrreq   ;
wire    [OUTPUT_FIFO_WIDTH-1: 0]        output_fifo_q       ;
wire    [$clog2(OUTPUT_FIFO_DEPTH)-1:0] output_fifo_usedw   ;
wire                                    output_fifo_full    ;
wire                                    output_fifo_empty   ;
wire                                    scfifo_ready        ;
input                   clk_dsp         ;
input                   rst_dsp_n       ;

input                   clk_eth         ;
input                   rst_eth_n       ;



// Stream Input
input   [NUM_OF_FFT-1:0]                        avst_sink_valid                ;
input   [(NUM_OF_FFT*DSP_IQ_DATAWIDTH)-1 :0]    avst_sink_data                 ;
input   [(NUM_OF_FFT*16)-1:0]                   avst_sink_channel              ;
input   [NUM_OF_FFT-1:0]                        avst_sink_endofpacket          ;
input   [NUM_OF_FFT-1:0]                        avst_sink_startofpacket        ;
    
input   [(NUM_OF_CC*8)-1:0]                     dl_ul_bw_config                ;
    
reg     [7:0]                                   dl_ul_bw_config_cc1            ;
reg     [7:0]                                   dl_ul_bw_config_cc2            ;
    
reg     [(NUM_OF_CC*8)-1:0]                     dl_ul_bw_config_1d             ;
reg     [(NUM_OF_CC*8)-1:0]                     dl_ul_bw_config_2d             ;
    
reg     [BW_DATAWIDTH-1:0]                      no_of_cycles_cc1               ;
reg     [BW_DATAWIDTH-1:0]                      no_of_cycles_cc2               ;

wire    [BW_DATAWIDTH-1:0]                     max_cycle_count [NUM_OF_FFT-1:0];
reg  [15:0]                                    max_pkt_size_cc1                ;
reg  [15:0]                                    max_pkt_size_cc2                ;
           
// Stream Output                       
output                                         avst_source_valid               ;
output  [ETH_IQ_DATAWIDTH -1 :0]               avst_source_data                ;
output  [15 :0]                                avst_source_channel             ;
output                                         avst_source_endofpacket         ;
output                                         avst_source_startofpacket       ;
input                                          avst_source_ready               ;
                       
input   [31:0]                                 timing_reference                ;
input   [3:0]                                  rx_c_subframeId_2d              ;
input   [5:0]                                  rx_c_slotId_2d                  ;

// side band signals  
input   wire     [CPLANE_DATAWIDTH-1:0]        tx_uplane_metadata_in           ; 
input   wire                                   tx_uplane_metavalid_in          ; 
output  wire     [CPLANE_DATAWIDTH-1:0]        tx_uplane_metadata_out          ; 
output  wire                                   tx_uplane_metadata_ready        ;
reg                                            tx_uplane_metadata_ready_1d     ;
reg                                            tx_uplane_metadata_ready_2d     ;

reg                                            PUSCH_data_arrived_eth          ;

reg                                            PUSCH_data_arrived              ;
reg                                            PUSCH_data_arrived_eth_1d       ;

output  reg                                    last_sym_arrived                ;
output  wire                                   arbiter_request                 ;

reg                                            PUSCH_data_processed            ;
output  reg [12:0]                             status_register                 ;

input                                          first_cplane_detect             ;
input   wire                                   last_sym_arrived_latch_clr      ;
wire   [(NUM_OF_FFT*BW_DATAWIDTH)-1:0]         cc_concatenate                  ;

input                                          status_clear                    ;


// Internal Signals
reg   [NUM_OF_FFT-1:0]              avst_sink_valid_1d                  ;  
reg   [NUM_OF_FFT-1:0]              avst_sink_valid_2d                  ;  
reg   [NUM_OF_FFT-1:0]              avst_sink_valid_3d                  ;
reg   [NUM_OF_FFT-1:0]              avst_sink_valid_4d                  ;  
reg   [NUM_OF_FFT-1:0]              avst_sink_valid_5d                  ;
    
reg   [NUM_OF_FFT-1:0]              avst_sink_valid_eth_1d              ;
reg   [NUM_OF_FFT-1:0]              avst_sink_valid_eth_2d              ;
    
reg     [(NUM_OF_FFT*DSP_IQ_DATAWIDTH)-1 :0]   avst_sink_data_1d        ;
reg     [(NUM_OF_FFT*DSP_IQ_DATAWIDTH)-1 :0]   avst_sink_data_2d        ;
reg     [(NUM_OF_FFT*DSP_IQ_DATAWIDTH)-1 :0]   avst_sink_data_3d        ;
reg     [(NUM_OF_FFT*DSP_IQ_DATAWIDTH)-1 :0]   avst_sink_data_4d        ;
reg     [(NUM_OF_FFT*DSP_IQ_DATAWIDTH)-1 :0]   avst_sink_data_5d        ;

wire    [NUM_OF_FFT-1:0]            ff_wrreq                            ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_1d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_2d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_3d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_4d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_5d                         ;
reg     [NUM_OF_FFT-1:0]            ff_wrreq_6d                         ;

wire    [DSP_IQ_DATAWIDTH -1 :0]    ff_writedata     [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH -1 :0]    ff_writedata_1d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH -1 :0]    ff_writedata_2d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH -1 :0]    ff_writedata_3d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH -1 :0]    ff_writedata_4d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH -1 :0]    ff_writedata_5d  [NUM_OF_FFT-1:0]   ;
reg     [DSP_IQ_DATAWIDTH -1 :0]    ff_writedata_6d  [NUM_OF_FFT-1:0]   ;

wire    [NUM_OF_FFT-1:0]            ff_rdreq                            ;

reg     [NUM_OF_FFT-1:0]            ff_rdreq_1d                         ;
reg     [NUM_OF_FFT-1:0]            ff_rdreq_2d                         ;
reg     [NUM_OF_FFT-1:0]            ff_rdreq_3d                         ;
wire    [ETH_IQ_DATAWIDTH -1 :0]    ff_readdata      [NUM_OF_FFT-1:0]   ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    ff_readdata_1d   [NUM_OF_FFT-1:0]   ;
reg     [ETH_IQ_DATAWIDTH -1 :0]    ff_readdata_2d   [NUM_OF_FFT-1:0]   ;
wire    [NUM_OF_FFT-1:0]            ff_rdempty                          ;
                       

wire    [NUM_OF_FFT-1:0]            ram_wrreq                           ;  
reg     [NUM_OF_FFT-1:0]            ram_wrreq_1d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_wrreq_2d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_wrreq_3d                        ; 
wire    [ETH_IQ_DATAWIDTH -1 :0]    ram_writedata    [NUM_OF_FFT-1:0]   ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_writedata_1d [NUM_OF_FFT-1:0]   ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_writedata_2d [NUM_OF_FFT-1:0]   ; 
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_writedata_3d [NUM_OF_FFT-1:0]   ; 
wire    [NUM_OF_FFT-1:0]            ram_wrfull                          ; 
reg    [NUM_OF_FFT-1:0]             ram_wrfull_1d                       ; 
reg    [NUM_OF_FFT-1:0]             ram_wrfull_2d                       ; 
wire    [NUM_OF_FFT-1:0]            ram_rdreq                           ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_1d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_2d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_3d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_4d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_5d                        ;
reg     [NUM_OF_FFT-1:0]            ram_rdreq_6d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_7d                        ;  
reg     [NUM_OF_FFT-1:0]            ram_rdreq_8d                        ;  
wire    [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata    [NUM_OF_FFT-1:0]    ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata_1d [NUM_OF_FFT-1:0]    ;  
reg     [ETH_IQ_DATAWIDTH -1 :0]    ram_readdata_2d [NUM_OF_FFT-1:0]    ;  
reg    [ETH_IQ_DATAWIDTH -1 :0]     ram_readdata_mux                    ;  
reg    [ETH_IQ_DATAWIDTH -1 :0]     ram_readdata_mux_1d                 ;  
reg    [ETH_IQ_DATAWIDTH -1 :0]     ram_readdata_mux_2d                 ;  



wire    [10:0]                      ram_rdusedw     [NUM_OF_FFT-1:0]    ;  //PS
reg     [10:0]                      ram_rdusedw_1d  [NUM_OF_FFT-1:0]    ;  
reg     [10:0]                      ram_rdusedw_2d  [NUM_OF_FFT-1:0]    ;  
wire    [NUM_OF_FFT-1:0]            ram_rdempty                         ;  


reg     [NUM_OF_FFT-1:0]            ram_rdready                         ;  
reg                                 ram_rdready_all                     ;

reg                                 ram_rdenable                        ;
reg                                 ram_rdenable_2d                     ;
reg                                 ram_rdenable_3d                     ;
reg                                 ram_rdenable_4d                     ;
reg                                 ram_rdenable_5d                     ;
reg                                 ram_rdenable_6d                     ;
reg                                 ram_rdenable_7d                     ;
                                 
reg                                 ram_rdenable_1d                     ;
wire                                ram_rdenable_falling                ;
reg     [16:0]                      ram_rdcount                         ;

wire                                ram_rd_hold                         ; 
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
reg     [2:0]                       ram_rd_fft                          ;
reg     [2:0]                       ram_rd_fft_1d                       ;
reg     [2:0]                       ram_rd_fft_2d                       ;
reg     [2:0]                       ram_rd_fft_3d                       ;
reg     [2:0]                       ram_rd_fft_4d                       ;
reg     [2:0]                       ram_rd_fft_5d                       ;
reg     [2:0]                       ram_rd_fft_6d                       ;
reg     [2:0]                       ram_rd_fft_7d                       ;
reg     [2:0]                       ram_rd_fft_8d                       ;
reg     [2:0]                       ram_rd_fft_9d                       ;
reg     [2:0]                       ram_rd_fft_10d                      ;
reg     [2:0]                       ram_rd_fft_11d                      ;
reg     [2:0]                       ram_rd_fft_12d                      ;
reg     [2:0]                       ram_rd_fft_13d                      ;
reg     [2:0]                       ram_rd_fft_14d                      ;
reg     [2:0]                       ram_rd_location                     ;
reg     [3:0]                       ram_rd_iteration                    ;
reg                                 ram_rd_iteration_last               ;

reg                                 ram_rd_fft_last                     ;
reg                                 ram_rd_sym_last                     ;
reg                                 ram_rd_sym_last_1d                  ;

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



wire                                avst_source_antenna_last          ;
reg  [15:0]                         avst_source_antenna               ;
reg  [15:0]                         avst_source_antenna_1d            ;
reg  [15:0]                         avst_source_antenna_2d            ;
reg  [15:0]                         avst_source_antenna_3d            ;
reg  [15:0]                         avst_source_antenna_4d            ;
reg  [15:0]                         avst_source_antenna_5d            ;
reg  [15:0]                         avst_source_antenna_6d            ;
reg  [15:0]                         avst_source_antenna_7d            ;
reg  [15:0]                         avst_source_antenna_8d            ;
reg  [15:0]                         max_pkt_size_per_layer            ;            
reg  [15:0]                         max_pkt_size                      ;
reg  [15:0]                         max_pkt_size_1d                   ;
reg  [15:0]                         max_pkt_size_2d                   ;
reg  [15:0]                         max_pkt_size_3d                   ;
reg  [15:0]                         max_pkt_size_4d                   ;
reg  [15:0]                         max_pkt_size_5d                   ;
reg  [15:0]                         max_pkt_size_6d                   ;
reg  [15:0]                         max_pkt_size_7d                   ;
reg  [15:0]                         max_pkt_size_8d                   ;



reg  [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_1d             ;
reg  [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_2d             ;
reg  [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_3d             ;
reg  [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_4d             ;
reg  [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_5d             ;
reg  [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_6d             ;
reg  [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_7d             ;
reg  [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_8d             ;
wire [CPLANE_DATAWIDTH-1:0]         tx_uplane_metadata_wire           ;

reg                                 tx_uplane_metavalid_1d            ;
reg                                 tx_uplane_metavalid_2d            ;
reg                                 tx_uplane_metavalid_3d            ;
reg                                 tx_uplane_metavalid_4d            ;
reg                                 tx_uplane_metavalid_5d            ;
reg                                 tx_uplane_metavalid_6d            ;
reg                                 tx_uplane_metavalid_7d            ;
reg                                 tx_uplane_metavalid_8d            ;


reg     [5:0]                       ram_rd_sym                        ;
reg     [5:0]                       ram_rd_sym_1d                     ;
reg     [5:0]                       ram_rd_sym_2d                     ;
reg     [5:0]                       ram_rd_sym_3d                     ;
reg     [5:0]                       ram_rd_sym_4d                     ;
reg     [5:0]                       ram_rd_sym_5d                     ;
reg     [5:0]                       ram_rd_sym_6d                     ;
reg     [5:0]                       ram_rd_sym_7d                     ;

reg     [7:0]                       ram_rd_seq                        ;
reg     [7:0]                       ram_rd_seq_1d                     ;
reg     [7:0]                       ram_rd_seq_2d                     ;
reg     [7:0]                       ram_rd_seq_3d                     ;
reg     [7:0]                       ram_rd_seq_4d                     ;
reg     [7:0]                       ram_rd_seq_5d                     ;
reg     [7:0]                       ram_rd_seq_6d                     ;
reg     [7:0]                       ram_rd_seq_7d                     ;

reg                                 active_eaxc_sym                   ;
reg                                 first_metadata_read               ;
reg                                 first_metadata_read_1d            ;

wire [CPLANE_DATAWIDTH+ETH_IQ_DATAWIDTH-1:0] adapter_out_data         ;
wire [CPLANE_DATAWIDTH+ETH_IQ_DATAWIDTH-1:0] out_data                 ;

wire                                in_ready                          ;
wire                                adapter_out_valid                 ;
wire                                adapter_out_ready                 ;
wire                                adapter_out_startofpacket         ;
wire                                adapter_out_endofpacket           ;
wire                                adapter_out_empty                 ;
wire  [15:0]                        adapter_out_channel               ;
wire                                out_valid                         ;
wire                                out_ready                         ;
wire                                out_startofpacket                 ;
wire                                out_endofpacket                   ;
wire                                out_empty                         ;
wire  [15:0]                        out_channel                       ;

reg                                out_valid_1d                       ;
reg                                out_startofpacket_1d               ;
reg                                out_endofpacket_1d                 ;
reg  [CPLANE_DATAWIDTH+ETH_IQ_DATAWIDTH-1:0] out_data_1d              ;
reg  [15:0]                        out_channel_1d                     ;             

reg   [7:0]                         numprb                            ;       
wire                                almost_full_data                  ;
wire                                almost_empty_data                 ;
wire                                ram_almost_empty                  ;

reg                                 status_clear_1d                   ;
reg                                 status_clear_2d                   ;
reg                                 fifo_full                         ;
reg                                 invalid_BW_cc1                    ;
reg                                 invalid_BW_cc2                    ;
wire                                ram_read_req                      ;


reg [5:0]                           start_symbol                      ;
reg [3:0]                           num_symbol                        ;

reg     [3:0]                       timeref_subframeId_1d             ;
reg     [3:0]                       timeref_subframeId_2d             ;
reg     [11:0]                      timeref_frameId_1d                ;
reg     [11:0]                      timeref_frameId_2d                ;
reg     [5:0]                       timeref_slotId_1d                 ;
reg     [5:0]                       timeref_slotId_2d                 ;

output  reg                         sf_slot_match                     ;
reg                                 uplane_sf_slot_change_detect      ;
reg                                 uplane_sf_slot_change_detect_1d   ;
reg                                 uplane_sf_slot_change_detect_2d   ;
reg                                 uplane_sf_slot_change_detect_3d   ;

reg    [3:0]                        rx_c_subframeId_3d                ;
reg    [3:0]                        rx_c_subframeId_4d                ;
reg    [5:0]                        rx_c_slotId_3d                    ;
reg    [5:0]                        rx_c_slotId_4d                    ;
output reg                          uplane_slot_boundary              ;

reg                                 first_cplane_detect_1d            ;
reg                                 first_cplane_detect_2d            ;

//Debug Signals for 60mhz DL/UL start sequence issue.       
          
reg     [3:0]                       NUM_OF_ANT_REG                    ;
reg     [3:0]                       NUM_OF_FFT_REG                    ;
reg                                 cc2_sc_latch                      ;
reg                                 cc2_sc_latch_1d                   ;
             
output reg                          cc1_enable                        ;
output reg                          cc2_enable                        ;

reg  [8:0]                          max_prb_cc1                       ;
reg  [8:0]                          max_prb_cc2                       ;
reg  [8:0]                          max_prb                           ;
reg  [9:0]                          startprb                          ;

reg                                 first_section                     ;
reg                                 last_section                      ;
reg [8:0]                           no_of_blank_prbs                  ;

wire                                active_prb_valid                  ;
reg                                 active_prb_valid_2d               ;
reg                                 active_prb_valid_3d               ;
reg                                 active_prb_valid_4d               ;
reg                                 active_prb_valid_5d               ;
reg                                 active_prb_valid_6d               ;
reg                                 active_prb_valid_7d               ;
reg                                 active_prb_valid_8d               ;
wire [2:0]                          prb_state_machine                 ;

wire                                section_sop                       ;
reg                                 section_sop_1d                    ;
reg                                 section_sop_2d                    ;

wire                                active_prb_sop                    ;
reg                                 active_prb_sop_2d                 ;
reg                                 active_prb_sop_3d                 ;
reg                                 active_prb_sop_4d                 ;
reg                                 active_prb_sop_5d                 ;
reg                                 active_prb_sop_6d                 ;
reg                                 active_prb_sop_7d                 ;
reg                                 active_prb_sop_8d                 ;

wire                                active_prb_eop                    ;
reg                                 active_prb_eop_2d                 ;
reg                                 active_prb_eop_3d                 ;
reg                                 active_prb_eop_4d                 ;
reg                                 active_prb_eop_5d                 ;
reg                                 active_prb_eop_6d                 ;
reg                                 active_prb_eop_7d                 ;
reg                                 active_prb_eop_8d                 ;

reg                                 active_eaxc_sym_valid             ;
reg                                 ram_rd_sym_inc                    ;

reg [7:0]                           ram_rd_seq_eaxc_0                 ;
reg [7:0]                           ram_rd_seq_eaxc_1                 ;
reg [7:0]                           ram_rd_seq_eaxc_2                 ;
reg [7:0]                           ram_rd_seq_eaxc_3                 ;
reg [7:0]                           ram_rd_seq_eaxc_4                 ;
reg [7:0]                           ram_rd_seq_eaxc_5                 ;
reg [7:0]                           ram_rd_seq_eaxc_6                 ;
reg [7:0]                           ram_rd_seq_eaxc_7                 ;

reg [8:0]                           total_prb                         ;
reg [15:0]                          numprbu_size                      ;
wire [15:0]                         tx_u_numprbu_size                 ;
output wire [15:0]                  tx_uplane_numprbu_size            ;

reg [11:0]                          avst_sink_valid_ctr               ;
reg                                 avst_sink_data_invalid_count      ;
reg                                 avst_sink_data_invalid_count_1d   ;
reg                                 avst_sink_data_invalid_count_2d   ;

reg                                 blank_eaxc_sym                    ;
reg [10:0]                           last_prb_id                       ;

output reg [3:0]                    statistics_register               ;

always @ (posedge clk_dsp)
begin: UPLANE_SFN_EXTRACT
    if(~rst_dsp_n)
    begin
        timeref_slotId_1d           <= 'd2;
        timeref_subframeId_1d       <= 'd11;
        timeref_frameId_1d          <= 'd4095;
    end
    else if(|avst_sink_valid)
    begin
        timeref_subframeId_1d       <= timing_reference[12:9]  ;
        timeref_frameId_1d          <= timing_reference[28:17] ;
        timeref_slotId_1d           <= timing_reference[8:3]   ;
    end
end
always @ (posedge clk_dsp)
begin: UPLANE_SFN_LATCH
    if(~rst_dsp_n)
    begin
        timeref_subframeId_2d    <= 'd11;
        timeref_frameId_2d       <= 'd4095;
        timeref_slotId_2d        <= 'd2;
    end
    else if(|avst_sink_valid_1d)
    begin
        timeref_subframeId_2d    <= timeref_subframeId_1d      ;
        timeref_frameId_2d       <= timeref_frameId_1d         ;
        timeref_slotId_2d        <= timeref_slotId_1d          ;
    end
end


//Clock Domain crossing for c plane subframeid and first_cplane_detect from eth to dsp clock.
always @ (posedge clk_dsp)
begin:CDC_ETH_TO_DSP
    if(~rst_dsp_n)
    begin
        rx_c_subframeId_3d     <= 4'd0                   ;
        rx_c_subframeId_4d     <= 4'd0                   ;
        first_cplane_detect_1d <= 1'd0                   ;
        first_cplane_detect_2d <= 1'd0                   ;
        rx_c_slotId_3d         <= 6'd2                   ;
        rx_c_slotId_4d         <= 6'd2                   ;
    end
    else
    begin
        rx_c_subframeId_3d     <= rx_c_subframeId_2d     ;
        rx_c_subframeId_4d     <= rx_c_subframeId_3d     ;
        first_cplane_detect_1d <= first_cplane_detect    ;
        first_cplane_detect_2d <= first_cplane_detect_1d ;
        rx_c_slotId_3d         <= rx_c_slotId_2d         ;
        rx_c_slotId_4d         <= rx_c_slotId_3d         ;
    end
end


// Added to achieve timing in combinational logic from timeref to sf_slot_match. 1 clock cycle to generate uplane_sf_change and 1 clock cycle to generate sf match.
always @ (posedge clk_dsp)
begin:UPLANE_SF_SLOT_CHANGE_DETECT
    if(~rst_dsp_n)
        uplane_sf_slot_change_detect <= 'd0;
    else if(|avst_sink_valid_1d)
    begin
        if ((timeref_subframeId_2d ^ timeref_subframeId_1d) | (timeref_frameId_2d ^ timeref_frameId_1d) | (timeref_slotId_2d ^ timeref_slotId_1d))
            uplane_sf_slot_change_detect <= 'd1;
        else
            uplane_sf_slot_change_detect <= 'd0;
    end
    else
        uplane_sf_slot_change_detect <= 'd0;
end


// Match the SF ID from Low phy and C-plane. Disallow data when not matched. sf_slot_match should not be made low except at the boundary of subframe.
// SF match made low only in TDD case or reset. 
always @ (posedge clk_dsp)
begin: SF_RF_MATCH
    if(~rst_dsp_n)
        sf_slot_match <= 'd0;
    else if(|avst_sink_valid_2d)
    begin
        if(uplane_sf_slot_change_detect & first_cplane_detect_2d)
            if ((timeref_subframeId_2d == rx_c_subframeId_4d) & (timeref_slotId_2d == rx_c_slotId_4d)) // Compare input timing reference with c-plane reference.
                sf_slot_match <= 'd1;
            else
                sf_slot_match <= 'd0;
    end
end


//Create slot_boundary for 4 clock cycles for CDC to ethernet clock. This signal used in cplane_fdv_buffer for fdv_read_req_Valid.
always @ (posedge clk_dsp)
begin:UPLANE_SLOT_BOUNDARY
    if(~rst_dsp_n)
        uplane_slot_boundary <= 'd0;
    else if(uplane_sf_slot_change_detect | uplane_sf_slot_change_detect_1d | uplane_sf_slot_change_detect_2d | uplane_sf_slot_change_detect_3d)
        uplane_slot_boundary <= 'd1;
    else
        uplane_slot_boundary <= 'd0;
end


//Delay registers for uplane_sf_slot_change_detect.
always @ (posedge clk_dsp)
begin: DELAY_UPLANE_SF_SLOT_CHANGE_DETECT
    if(~rst_dsp_n)
    begin
        uplane_sf_slot_change_detect_1d <= 'd0;
        uplane_sf_slot_change_detect_2d <= 'd0;
        uplane_sf_slot_change_detect_3d <= 'd0;
    end
    else
    begin
        uplane_sf_slot_change_detect_1d <= uplane_sf_slot_change_detect    ;
        uplane_sf_slot_change_detect_2d <= uplane_sf_slot_change_detect_1d ;
        uplane_sf_slot_change_detect_3d <= uplane_sf_slot_change_detect_2d ;
    end
end


// Pipe Line Registers
always @ (posedge clk_dsp)
begin
    if(~rst_dsp_n) 
    begin 
        avst_sink_valid_1d       <= 'd0;
        avst_sink_valid_2d       <= 'd0;
        avst_sink_valid_3d       <= 'd0;
        avst_sink_data_1d        <= 'd0;
        avst_sink_data_2d        <= 'd0;    
        avst_sink_data_3d        <= 'd0;    

    end 
    else
    begin
            avst_sink_valid_1d       <= avst_sink_valid          ;
            avst_sink_valid_2d       <= avst_sink_valid_1d       ;
            avst_sink_valid_3d       <= avst_sink_valid_2d       ;
            avst_sink_data_1d        <= avst_sink_data           ;        
            avst_sink_data_2d        <= avst_sink_data_1d        ;
            avst_sink_data_3d        <= avst_sink_data_2d        ;
    end
end 


always @ (posedge clk_dsp)
begin
    if(~rst_dsp_n) 
    begin 
        avst_sink_valid_4d       <= 'd0;
        avst_sink_data_4d        <= 'd0;    
    end 
    else if(sf_slot_match) //Process PUSCH data only when sf_slot_match is high. 
    begin
            avst_sink_valid_4d       <= avst_sink_valid_3d       ;
            avst_sink_data_4d        <= avst_sink_data_3d        ;        
    end
    else 
    begin 
        avst_sink_valid_4d       <= 'd0;
        avst_sink_data_4d        <= 'd0;    
    end
end 


always @ (posedge clk_eth)
begin : CDC_FROM_DSP_TO_ETH
    if(~rst_eth_n) 
        begin
        avst_sink_valid_eth_1d <= 'b0 ;
        avst_sink_valid_eth_2d <= 'b0 ;
        end
    else 
        begin
        avst_sink_valid_eth_1d <=  avst_sink_valid_2d; 
        avst_sink_valid_eth_2d <=  avst_sink_valid_eth_1d; 
        end
end
always @ (posedge clk_eth)
begin : PACKET_AVAILABLE
    if(~rst_eth_n) 
        PUSCH_data_arrived <=  1'b0        ;
    else if(PUSCH_data_processed)
        PUSCH_data_arrived <=  1'b0        ;
    else if(|avst_sink_valid_eth_2d)
        PUSCH_data_arrived <=  1'b1           ; 
end

always @ (posedge clk_eth)
begin
    if(~rst_eth_n) 
    begin 
        ram_rdenable_1d             <=  1'b0    ;
        ram_readdata_mux_1d         <=  {ETH_IQ_DATAWIDTH{1'b0}} ;
        ram_readdata_mux_2d         <=  {ETH_IQ_DATAWIDTH{1'b0}} ;
        ram_rd_valid_1d             <=  1'b0    ;
        ram_rd_valid_2d             <=  1'b0    ;
        ram_rd_valid_3d             <=  1'b0    ;
        ram_rd_valid_4d             <=  1'b0    ;
        ram_rd_valid_5d             <=  1'b0    ;               
        ram_rd_valid_8d             <=  1'b0    ;        
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
        ram_rd_fft_1d               <=  'b0     ;
        ram_rd_fft_2d               <=  'b0     ;
        ram_rd_fft_3d               <=  'b0     ;
        ram_rd_fft_4d               <=  'b0     ;
        ram_rd_fft_5d               <=  'b0     ;
        ram_rd_fft_6d               <=  'b0     ;
        ram_rd_fft_7d               <=  'b0     ; 
        ram_rd_fft_8d               <=  'b0     ; 
        ram_rd_fft_9d               <=  'b0     ; 
        ram_rd_fft_10d              <=  'b0     ;
        ram_rd_fft_11d              <=  'b0     ;
        ram_rd_fft_12d              <=  'b0     ;
        ram_rd_fft_13d              <=  'b0     ;
        ram_rd_fft_14d              <=  'b0     ;     
        avst_source_antenna_1d      <=  'b0     ;
        avst_source_antenna_2d      <=  'b0     ;
        avst_source_antenna_3d      <=  'b0     ;
        avst_source_antenna_4d      <=  'b0     ;
        avst_source_antenna_5d      <=  'b0     ;
        avst_source_antenna_6d      <=  'b0     ;
        avst_source_antenna_7d      <=  'b0     ;
        avst_source_antenna_8d      <=  'b0     ;
        tx_uplane_metadata_1d       <=  'd0     ;
        tx_uplane_metadata_2d       <=  'd0     ;
        tx_uplane_metadata_3d       <=  'd0     ;
        tx_uplane_metadata_4d       <=  'd0     ;
        tx_uplane_metadata_5d       <=  'd0     ;
        tx_uplane_metadata_6d       <=  'd0     ;        
        tx_uplane_metadata_8d       <=  'd0     ;
        tx_uplane_metavalid_1d      <=  'd0     ;
        tx_uplane_metavalid_2d      <=  'd0     ;
        tx_uplane_metavalid_3d      <=  'd0     ;
        tx_uplane_metavalid_4d      <=  'd0     ;
        tx_uplane_metavalid_5d      <=  'd0     ;
        tx_uplane_metavalid_6d      <=  'd0     ;        
        tx_uplane_metavalid_7d      <=  'd0     ;        
        tx_uplane_metavalid_8d      <=  'd0     ;
        ram_rd_sym_1d               <=  'd0     ;
        ram_rd_sym_2d               <=  'd0     ;
        ram_rd_sym_3d               <=  'd0     ;
        ram_rd_sym_4d               <=  'd0     ;
        ram_rd_sym_5d               <=  'd0     ;
        ram_rd_sym_6d               <=  'd0     ;
        ram_rd_sym_7d               <=  'd0     ;
        ram_rd_sym_last_1d          <=  'd0     ;
        ram_rd_seq_6d               <=  'd0     ;
        tx_uplane_metadata_ready_1d <=  'd0     ;
        tx_uplane_metadata_ready_2d <=  'd0     ;
        dl_ul_bw_config_1d          <=  'd0     ; 
        dl_ul_bw_config_2d          <=  'd0     ; 
        max_pkt_size_1d             <=  'd0     ;
        max_pkt_size_2d             <=  'd0     ;
        max_pkt_size_3d             <=  'd0     ;
        max_pkt_size_4d             <=  'd0     ;
        max_pkt_size_5d             <=  'd0     ;
        max_pkt_size_6d             <=  'd0     ;
        max_pkt_size_7d             <=  'd0     ;
        max_pkt_size_8d             <=  'd0     ;
        status_clear_1d             <=  'd0     ;
        status_clear_2d             <=  'd0     ;
        PUSCH_data_arrived_eth_1d   <=  'd0     ;    
        PUSCH_data_arrived_eth      <=  'd0     ;
        cc2_sc_latch_1d             <=  'd0     ;
        active_prb_valid_2d         <=  'd0     ;
        active_prb_valid_3d         <=  'd0     ;
        active_prb_valid_4d         <=  'd0     ;
        active_prb_valid_5d         <=  'd0     ;
        active_prb_valid_6d         <=  'd0     ;
        active_prb_valid_7d         <=  'd0     ;
        active_prb_valid_8d         <=  'd0     ;
        active_prb_sop_2d           <=  'd0     ;
        active_prb_sop_3d           <=  'd0     ;
        active_prb_sop_4d           <=  'd0     ;
        active_prb_sop_5d           <=  'd0     ;
        active_prb_sop_6d           <=  'd0     ;
        active_prb_sop_7d           <=  'd0     ;
        active_prb_sop_8d           <=  'd0     ; 
        active_prb_eop_2d           <=  'd0     ;
        active_prb_eop_3d           <=  'd0     ;
        active_prb_eop_4d           <=  'd0     ;
        active_prb_eop_5d           <=  'd0     ;
        active_prb_eop_6d           <=  'd0     ;
        active_prb_eop_7d           <=  'd0     ;
        active_prb_eop_8d           <=  'd0     ;  
        out_valid_1d                <=  'd0     ;
        out_data_1d                 <=  'd0     ;
        out_startofpacket_1d        <=  'd0     ;
        out_endofpacket_1d          <=  'd0     ;
        out_channel_1d              <=  'd0     ;
        first_metadata_read_1d      <=  'd0     ;
        section_sop_1d              <=  'd0     ;
        section_sop_2d              <=  'd0     ;
        avst_sink_data_invalid_count_1d <= 'd0  ;
        avst_sink_data_invalid_count_2d <= 'd0  ;
    end 
    else 
    begin       
        ram_rdenable_1d             <=  ram_rdenable                 ;
        ram_readdata_mux_1d         <=  ram_readdata_mux             ;
        ram_readdata_mux_2d         <=  ram_readdata_mux_1d          ;
        ram_rd_valid_1d             <=  ram_rd_valid                 ;
        ram_rd_valid_2d             <=  ram_rd_valid_1d              ;
        ram_rd_valid_3d             <=  ram_rd_valid_2d              ;
        ram_rd_valid_4d             <=  ram_rd_valid_3d              ;
        ram_rd_valid_5d             <=  ram_rd_valid_4d              ;                
        ram_rd_valid_8d             <=  ram_rd_valid_7d              ;       
     
        ram_rd_sop_1d               <=  ram_rd_sop                   ;
        ram_rd_sop_2d               <=  ram_rd_sop_1d                ;
        ram_rd_sop_3d               <=  ram_rd_sop_2d                ;
        ram_rd_sop_4d               <=  ram_rd_sop_3d                ;
        ram_rd_sop_5d               <=  ram_rd_sop_4d                ;
        ram_rd_sop_6d               <=  ram_rd_sop_5d                ;
        ram_rd_sop_7d               <=  ram_rd_sop_6d                ;
        ram_rd_sop_8d               <=  ram_rd_sop_7d                ;
        ram_rd_eop_1d               <=  ram_rd_eop                   ;
        ram_rd_eop_2d               <=  ram_rd_eop_1d                ;
        ram_rd_eop_3d               <=  ram_rd_eop_2d                ;
        ram_rd_eop_4d               <=  ram_rd_eop_3d                ;
        ram_rd_eop_5d               <=  ram_rd_eop_4d                ;
        ram_rd_eop_6d               <=  ram_rd_eop_5d                ;
        ram_rd_eop_7d               <=  ram_rd_eop_6d                ;
        ram_rd_eop_8d               <=  ram_rd_eop_7d                ;  
     
        ram_rd_fft_1d               <=  ram_rd_fft                   ;
        ram_rd_fft_2d               <=  ram_rd_fft_1d                ;
        ram_rd_fft_3d               <=  ram_rd_fft_2d                ;
        ram_rd_fft_4d               <=  ram_rd_fft_3d                ;
        ram_rd_fft_5d               <=  ram_rd_fft_4d                ;
        ram_rd_fft_6d               <=  ram_rd_fft_5d                ;
        ram_rd_fft_7d               <=  ram_rd_fft_6d                ;
        ram_rd_fft_8d               <=  ram_rd_fft_7d                ;
        ram_rd_fft_9d               <=  ram_rd_fft_8d                ;
        ram_rd_fft_10d              <=  ram_rd_fft_9d                ;
        ram_rd_fft_11d              <=  ram_rd_fft_10d               ;
        ram_rd_fft_12d              <=  ram_rd_fft_11d               ;
        ram_rd_fft_13d              <=  ram_rd_fft_12d               ;
        ram_rd_fft_14d              <=  ram_rd_fft_13d               ;

        avst_source_antenna_1d      <=  avst_source_antenna          ;
        avst_source_antenna_2d      <=  avst_source_antenna_1d       ;
        avst_source_antenna_3d      <=  avst_source_antenna_2d       ;
        avst_source_antenna_4d      <=  avst_source_antenna_3d       ;
        avst_source_antenna_5d      <=  avst_source_antenna_4d       ;
        avst_source_antenna_6d      <=  avst_source_antenna_5d       ;
        avst_source_antenna_7d      <=  avst_source_antenna_6d       ;
        avst_source_antenna_8d      <=  avst_source_antenna_7d       ;    

        max_pkt_size_1d             <=  max_pkt_size                 ;
        max_pkt_size_2d             <=  max_pkt_size_1d              ;
        max_pkt_size_3d             <=  max_pkt_size_2d              ;
        max_pkt_size_4d             <=  max_pkt_size_3d              ;
        max_pkt_size_5d             <=  max_pkt_size_4d              ;
        max_pkt_size_6d             <=  max_pkt_size_5d              ;
        max_pkt_size_7d             <=  max_pkt_size_6d              ;
        max_pkt_size_8d             <=  max_pkt_size_7d              ;            
            
        tx_uplane_metadata_1d       <=  tx_uplane_metadata_in        ;
        tx_uplane_metadata_2d       <=  tx_uplane_metadata_1d        ;
        tx_uplane_metadata_3d       <=  tx_uplane_metadata_2d        ;
        tx_uplane_metadata_4d       <=  tx_uplane_metadata_3d        ;
        tx_uplane_metadata_5d       <=  tx_uplane_metadata_4d        ;
        tx_uplane_metadata_6d       <=  tx_uplane_metadata_5d        ;
        tx_uplane_metadata_8d       <=  tx_uplane_metadata_7d        ;
    
        tx_uplane_metavalid_1d      <=  tx_uplane_metavalid_in       ;
        tx_uplane_metavalid_2d      <=  tx_uplane_metavalid_1d       ;
        tx_uplane_metavalid_3d      <=  tx_uplane_metavalid_2d       ;
        tx_uplane_metavalid_4d      <=  tx_uplane_metavalid_3d       ;
        tx_uplane_metavalid_5d      <=  tx_uplane_metavalid_4d       ;
        tx_uplane_metavalid_6d      <=  tx_uplane_metavalid_5d       ;
        tx_uplane_metavalid_7d      <=  tx_uplane_metavalid_6d       ;
        tx_uplane_metavalid_8d      <=  tx_uplane_metavalid_7d       ;            
        
        ram_rd_sym_1d               <=  ram_rd_sym                   ;
        ram_rd_sym_2d               <=  ram_rd_sym_1d                ;
        ram_rd_sym_3d               <=  ram_rd_sym_2d                ;
        ram_rd_sym_4d               <=  ram_rd_sym_3d                ;
        ram_rd_sym_5d               <=  ram_rd_sym_4d                ;
        ram_rd_sym_6d               <=  ram_rd_sym_5d                ;
        ram_rd_sym_7d               <=  ram_rd_sym_6d                ;
        ram_rd_sym_last_1d          <=  ram_rd_sym_last              ;
        ram_rd_seq_6d               <=  ram_rd_seq_5d                ;
        tx_uplane_metadata_ready_1d <=  tx_uplane_metadata_ready     ;
        tx_uplane_metadata_ready_2d <=  tx_uplane_metadata_ready_1d  ;
        dl_ul_bw_config_1d          <=  dl_ul_bw_config              ;
        dl_ul_bw_config_2d          <=  dl_ul_bw_config_1d           ;
        status_clear_1d             <=  status_clear                 ;
        status_clear_2d             <=  status_clear_1d              ;
        PUSCH_data_arrived_eth_1d   <=  PUSCH_data_arrived           ;    
        PUSCH_data_arrived_eth      <=  PUSCH_data_arrived_eth_1d    ;    
        cc2_sc_latch_1d             <=  cc2_sc_latch                 ;
        active_prb_valid_2d         <=  active_prb_valid             ;
        active_prb_valid_3d         <=  active_prb_valid_2d          ;        
        active_prb_valid_4d         <=  active_prb_valid_3d          ;
        active_prb_valid_5d         <=  active_prb_valid_4d          ;
        active_prb_valid_6d         <=  active_prb_valid_5d          ;
        active_prb_valid_7d         <=  active_prb_valid_6d          ;
        active_prb_valid_8d         <=  active_prb_valid_7d          ;
        active_prb_sop_2d           <=  active_prb_sop               ;
        active_prb_sop_3d           <=  active_prb_sop_2d            ;
        active_prb_sop_4d           <=  active_prb_sop_3d            ;
        active_prb_sop_5d           <=  active_prb_sop_4d            ;
        active_prb_sop_6d           <=  active_prb_sop_5d            ;
        active_prb_sop_7d           <=  active_prb_sop_6d            ;
        active_prb_sop_8d           <=  active_prb_sop_7d            ;
        active_prb_eop_2d           <=  active_prb_eop               ;
        active_prb_eop_3d           <=  active_prb_eop_2d            ;
        active_prb_eop_4d           <=  active_prb_eop_3d            ;
        active_prb_eop_5d           <=  active_prb_eop_4d            ;
        active_prb_eop_6d           <=  active_prb_eop_5d            ;
        active_prb_eop_7d           <=  active_prb_eop_6d            ;
        active_prb_eop_8d           <=  active_prb_eop_7d            ;
        out_valid_1d                <=  out_valid & scfifo_ready     ;
        out_data_1d                 <=  out_data                     ;
        out_startofpacket_1d        <=  out_startofpacket & out_valid & scfifo_ready  ;
        out_endofpacket_1d          <=  out_endofpacket & out_valid & scfifo_ready    ; 
        out_channel_1d              <=  out_channel                  ;
        first_metadata_read_1d      <=  first_metadata_read          ;
        section_sop_1d              <=  section_sop                  ;
        section_sop_2d              <=  section_sop_1d               ;
        avst_sink_data_invalid_count_1d <= avst_sink_data_invalid_count     ;
        avst_sink_data_invalid_count_2d <= avst_sink_data_invalid_count_1d  ;
    end 
end



 // The Generated Symbol number is appended into   [101:96] bit location. Symbol number is 6 bit so added 2 bits zero .        
 // The generated Sequence number is appended into [71:64] bit location as this is reserved bit in ORAN Standard. This is for ORAN IP seq number when fragmentation is disabled
 // The Tx_U_Size 16 bit generated internally and updated based on CC1/CC2 BW
always @ (posedge clk_eth)
begin : PIPELINE
    if(~rst_eth_n) 
        tx_uplane_metadata_7d <= 'd0;
    else 
        tx_uplane_metadata_7d <=  {tx_uplane_metadata_6d[127:102],ram_rd_sym_5d,tx_uplane_metadata_6d[95:88],SCS_SELECT_PUSCH,4'd0,tx_uplane_metadata_6d[79:72],ram_rd_seq_6d,tx_uplane_metadata_6d[63:0]};     
end
    


assign ram_rd_sop       = ram_rd_valid & (ram_rdcount_interleave == 'd0);
assign ram_rd_eop       = ram_rd_valid & (ram_rdcount_interleave == max_cycle_count[ram_rd_fft]); 



assign ram_rdenable_falling = ~ram_rdenable & ram_rdenable_1d   ;

assign ram_rd_hold      = tx_uplane_metadata_ready | tx_uplane_metadata_ready_1d | tx_uplane_metadata_ready_2d; 


always @ (posedge clk_eth)
begin: CC_ENABLE
    if(~rst_eth_n)
    begin
        cc1_enable <= 'd1;   //Default on reset is 2 carrier mode
        cc2_enable <= 'd1;
    end
    else if(dl_ul_bw_config_cc1[7] & ~dl_ul_bw_config_cc2[7])
    begin
        cc1_enable <= 'd0; 
        cc2_enable <= 'd1;  //Single carrier mode with only cc2 enabled
    end
    else if(~dl_ul_bw_config_cc1[7] & dl_ul_bw_config_cc2[7])
    begin
        cc1_enable <= 'd1;  //single carrier mode with only cc1 enabled
        cc2_enable <= 'd0;  
    end
    else
    begin
        cc1_enable <= 'd1;   
        cc2_enable <= 'd1;
    end
end


always @ (posedge clk_eth)
begin
    if(~rst_eth_n)
    begin
        NUM_OF_FFT_REG <= NUM_OF_FFT;      //2 carrier mode is default on reset
        NUM_OF_ANT_REG <= NUM_OF_ANT;      //2 carrier mode is default on reset
    end
    else if(cc1_enable ^ cc2_enable)
    begin
        NUM_OF_FFT_REG <= NUM_OF_FFT >> 1;      //Single Carrier mode has half the prach fft engine
        NUM_OF_ANT_REG <= NUM_OF_ANT >> 1;      //single carrier mode has half the total number antennas
    end
    else 
    begin
        NUM_OF_FFT_REG <= NUM_OF_FFT;      
        NUM_OF_ANT_REG <= NUM_OF_ANT;      
    end  
end


always @ (posedge clk_eth)
begin : RAM_RD_LOC 
    if(~rst_eth_n)
        ram_rd_location  <= 'd0;
    else if(~cc1_enable & cc2_enable)
        ram_rd_location  <=  1;
    else if(cc1_enable & ~cc2_enable)
        ram_rd_location  <=  0 ;
    else if(cc1_enable & cc2_enable)
        ram_rd_location  <= ram_rd_fft;
end    


assign ram_rd_valid     = ram_rdenable & in_ready & ~ram_rd_hold & ~ram_waitenable & (ram_rdusedw_2d[ram_rd_location] > 'd4);



//Extract START PRB, NUM PRB, FIRST SECTION, LAST SECTION from cplane packet.
always @ (posedge clk_eth)
begin: EXTRACT_PRB_METADA
    if(~rst_eth_n)
    begin
        first_section    <= 'd0;
        last_section     <= 'd0;
        no_of_blank_prbs <= 'd0;
        startprb         <= 'd0;
        numprb           <= 'd0;
        blank_eaxc_sym   <= 'd0;
        last_prb_id      <= 'd0;
    end
    else if(tx_uplane_metavalid_1d)
    begin
        first_section    <= tx_uplane_metadata_1d[15];
        last_section     <= tx_uplane_metadata_1d[14];
        no_of_blank_prbs <= tx_uplane_metadata_1d[13:5];
        startprb         <= tx_uplane_metadata_1d[49:40];
        numprb           <= tx_uplane_metadata_1d[39:32];
        blank_eaxc_sym   <= tx_uplane_metadata_1d[0];
        last_prb_id      <= tx_uplane_metadata_1d[39:32]+tx_uplane_metadata_1d[49:40];
    end
end

//CALCULATE TX_U_NUMPRBU_SIZE
//TX_U_NUMPRBU_SIZE is the total size in bytes, the number of prbs in 1 U Plane packet.
// TX_U_NUMPRBU_SIZE = Number of PRBs * 12 REs/PRB * 32bits/RE / 8Bits/Byte = Size in Bytes
//Example: numprb= 273
//         TX_U_NUMPRBU_SIZE = 273 * 12 * 32 / 8 = 273 * 48 = 13108;
//Accumulate total_prb at every new cplane packet. Reset the total_prb to NUMPRB at every new eAxC, first section.
always @ (posedge clk_eth)
begin
    if(~rst_eth_n)
        total_prb <= 'd0;
    
    else if(first_metadata_read & ~first_metadata_read_1d) //This condition runs for the first cplane packet only
    begin
        if(first_section & last_section) //Single section
        begin
            if(numprb == 'd0)
                total_prb <= max_prb;
            else
                total_prb <= numprb;
        end
        else //first section in multisection
            total_prb <= numprb;
    end

    else if(section_sop_2d)
    begin
        if(first_section & last_section) //Single Section
        begin
            if(numprb== 'd0)
                total_prb <= max_prb;
            else
                total_prb <= numprb;
        end
        else if(first_section & ~last_section) //First section in multisection
            total_prb <= numprb;
        else if(~first_section)
            total_prb <= total_prb + numprb;   //Other sections in multisection
    end
    
    else
        total_prb <= total_prb;
end


always @ (posedge clk_eth)
begin
    if(~rst_eth_n)
        first_metadata_read <= 'd0;
    else if(active_prb_sop)
        first_metadata_read <= 'd1;
end


//Multiply total_prb * 48 to get TX_U_NUMPRBU_SIZE in bytes.
always @ (posedge clk_eth)
begin
    if(~rst_eth_n)
        numprbu_size <= 'd0;
    else
        numprbu_size <= (total_prb<<5) + (total_prb<<4); // [total_prbs * (2^5)+ total_prbs * (2^4)] = total_prbs*(32+16) = 48 * total_prbs;
end

// State machaine to fetch Next header based on NUMPRB
pusch_fifo_read_state_machine u_fifo_read_state_machine(
       .clk_in          (clk_eth                 ),
       .rst_in_n        (rst_eth_n               ),    
       .valid           (ram_rd_valid            ),
       .read_req        (tx_uplane_metadata_ready), // read_req to get next header
       .numprb          (numprb                  ),
       .first_section   (first_section           ),
       .last_section    (last_section            ),
       .no_of_blank_prbs(no_of_blank_prbs        ),
       .max_prb         (max_prb                 ),
       .in_eop          (ram_rd_eop              ),
       .startprb        (startprb                ),
       .active_prb      (active_prb_valid        ),
       .prb_sop         (active_prb_sop          ),
       .prb_eop         (active_prb_eop          ),
       .state           (prb_state_machine       ),
       .section_sop     (section_sop             ),
       .blank_eaxc_sym  (blank_eaxc_sym          ),
       .last_prb_id     (last_prb_id             )
);


always @ (posedge clk_eth)
begin : CC1_DISABLE 
    if(~rst_eth_n) 
        ram_rd_valid_6d  <= 'd0;
    else if(~cc1_enable)
        ram_rd_valid_6d  <=  ram_rd_valid_5d &  avst_source_antenna_5d[0] ;// Disable the carrier 0,2,4,6
    else 
        ram_rd_valid_6d  <=  ram_rd_valid_5d ;
end


always @ (posedge clk_eth)
begin : CC2_DISABLE 
    if(~rst_eth_n) 
        ram_rd_valid_7d  <= 'd0;
    else if(~cc2_enable)
        ram_rd_valid_7d  <=  ram_rd_valid_6d &  ~avst_source_antenna_6d[0] ;// Disable the carrier 1,3,5,7
    else 
        ram_rd_valid_7d  <=  ram_rd_valid_6d ;
end    


always @ (posedge clk_eth)
begin : CC2_SINGLE_CARRIER_LATCH
    if(~rst_eth_n)
    begin
        cc2_sc_latch <= 'd0;
    end
    else if(~cc1_enable & cc2_enable)
    begin
        cc2_sc_latch <= 'd1;
    end
end


always @ (posedge clk_eth)
begin : SET_DL_UL_CONFIG_CC
    if(~rst_eth_n)
    begin
        dl_ul_bw_config_cc1 <= 'd0;
        dl_ul_bw_config_cc2 <= 'd0;
    end
    else if(NUM_OF_CC == 1)
    begin
        dl_ul_bw_config_cc1 <= dl_ul_bw_config_2d;
        dl_ul_bw_config_cc2 <= dl_ul_bw_config_2d;
    end
    else if(NUM_OF_CC == 2)
    begin
        dl_ul_bw_config_cc1 <= dl_ul_bw_config_2d[7:0];
        dl_ul_bw_config_cc2 <= dl_ul_bw_config_2d[15:8];
    end
end


always @ (posedge clk_eth)
begin : NUM_PRB_CC1
    if(~rst_eth_n) 
    begin
        no_of_cycles_cc1 <= MAX_CYCLE_COUNT_100 ;
        max_pkt_size_cc1 <= MAX_PKT_SIZE_100 ;         
        max_prb_cc1      <= MAX_PRB_100;        
    end
    else if(cc1_enable)
    begin
        if(dl_ul_bw_config_cc1[3:0] == BW_CONFIG_CC_60)          // 60 MHz - 162*12*32/128 = 486 cycles
        begin
            no_of_cycles_cc1 <= MAX_CYCLE_COUNT_60 ;  
            max_pkt_size_cc1 <= MAX_PKT_SIZE_60 ;
            max_prb_cc1      <= MAX_PRB_60;       
        end    
        else if(dl_ul_bw_config_cc1[3:0] == BW_CONFIG_CC_100)    //100 MHz - 273*12*32/128 = 819 cycles
        begin
            no_of_cycles_cc1 <= MAX_CYCLE_COUNT_100 ; 
            max_pkt_size_cc1 <= MAX_PKT_SIZE_100 ;
            max_prb_cc1      <= MAX_PRB_100;       
        end
    end    
    else 
    begin
        no_of_cycles_cc1 <= 0 ;                                  // Set the cycle count to 0 when component carrier disabled
        max_pkt_size_cc1 <= MAX_PKT_SIZE_100 ;
    end    
end


always @ (posedge clk_eth)
begin : NUM_PRB_CC2
    if(~rst_eth_n) 
    begin
        no_of_cycles_cc2 <= MAX_CYCLE_COUNT_100 ;
        max_pkt_size_cc2 <= MAX_PKT_SIZE_100 ;
        max_prb_cc2      <= MAX_PRB_100; 
    end
    else if(cc2_enable)
    begin
        if(dl_ul_bw_config_cc2[3:0] == BW_CONFIG_CC_60)          // 60 MHz - 162*12*32/128 = 486 cycles
        begin
            no_of_cycles_cc2 <= MAX_CYCLE_COUNT_60 ;  
            max_pkt_size_cc2 <= MAX_PKT_SIZE_60 ;
            max_prb_cc2      <= MAX_PRB_60;
        end    
        else if(dl_ul_bw_config_cc2[3:0] == BW_CONFIG_CC_100)    // 100 MHz - 273*12*32/128 = 819 cycles
        begin
            no_of_cycles_cc2 <= MAX_CYCLE_COUNT_100 ; 
            max_pkt_size_cc2 <= MAX_PKT_SIZE_100 ;
            max_prb_cc2      <= MAX_PRB_100;
        end
    end    
    else 
    begin
        no_of_cycles_cc2 <= 0 ;                                  // Set the cycle count to 0 when component carrier disabled
        max_pkt_size_cc2 <= MAX_PKT_SIZE_100 ;
    end    
end


always @ (posedge clk_eth)
begin : RAM_READY_ALL
    if(~rst_eth_n) 
        ram_rdready_all <=  1'b0        ;
    else 
        ram_rdready_all <=  | ram_rdready; // Modified to support only one CC
end


always @ (posedge clk_eth)
begin : RAM_READ_ENABLE
    if (rst_eth_n == 1'b0)
       ram_rdenable <= 'b0 ; 
    else if (~ram_rdenable)
       ram_rdenable <=  ram_rdready_all   ;
    else if (ram_rd_valid & (ram_rdcount == ( ((NUM_OF_FFT/2)*(no_of_cycles_cc1 + no_of_cycles_cc2)) -1'd1 ) ))  //ram_rdenable should be high for 8 pusch path
       ram_rdenable <=  1'b0   ;
end


always @ (posedge clk_eth  )
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
        ram_rdcount_interleave  <=  12'b0  ; // 0 once end of packets reached
    else if (ram_rd_valid)
        ram_rdcount_interleave  <=  ram_rdcount_interleave + 1'b1  ; // increment upto 273Prb
end

always @ (posedge clk_eth)
begin : RAM_ITERATION
    if(~rst_eth_n) 
        ram_rd_iteration    <=  4'b0   ;
    else if (ram_rdenable_falling & ram_rd_iteration_last)  // reset after 8 Axcs
        ram_rd_iteration    <=  4'b0   ;
    else if (ram_rdenable_falling)
        ram_rd_iteration    <=  ram_rd_iteration + 4'b1   ;   // increament for every 8 axcs of 273 prb    
end

always @ (posedge clk_eth)
begin : RAM_READ_ITERATION_LAST
    if(~rst_eth_n) 
        ram_rd_iteration_last   <=  1'b0   ;
    else 
        ram_rd_iteration_last   <=  (ram_rd_iteration == (NUM_OF_ANT_REG/NUM_OF_FFT_REG)-1);  //8/8 --> 1 interation to read 8 axcs
end


always @ (posedge clk_eth)
begin : RAM_FFT
    if(~rst_eth_n) 
        ram_rd_fft      <=  2'b0   ;
    else if(cc2_sc_latch & ~cc2_sc_latch_1d)
        ram_rd_fft      <= 2'b1;
    else if (ram_rd_valid & ram_rd_eop & ram_rd_fft_last)
        if(cc2_sc_latch)
            ram_rd_fft  <= 2'b1;
        else
            ram_rd_fft  <=  2'b0   ;
    else if (ram_rd_valid & ram_rd_eop )
        ram_rd_fft      <=  ram_rd_fft + 2'b1   ;  
end


always @ (posedge clk_eth)
begin : RAM_READ_FFT_LAST
    if(~rst_eth_n) 
        ram_rd_fft_last <=  1'b0   ;
    else if(cc1_enable ^ cc2_enable)
        ram_rd_fft_last <= 1'b1;
    else
        ram_rd_fft_last <=  (ram_rd_fft == (NUM_OF_FFT_REG-1))  ;  
end

always @ (posedge clk_eth)
begin : SOURCE_ANTENNA_COUNT
    if (rst_eth_n == 1'b0)
    begin
        avst_source_antenna   <=  EAXC_ID_START;
    end
    else if(cc2_sc_latch & ~cc2_sc_latch_1d)
    begin
        avst_source_antenna <= EAXC_ID_START + 16'd1;
    end
    else if (ram_rd_valid & ram_rd_eop & ram_rd_iteration_last & ram_rd_fft_last)
    begin
        if(cc2_sc_latch)
            avst_source_antenna   <=  EAXC_ID_START + 16'd1   ;// PRACH eAxC starts from input parameter EAXC ID START. Supported values: 0,8,16,24,...
        else
            avst_source_antenna   <=  EAXC_ID_START;
    end     
    else if (ram_rd_valid & ram_rd_eop )
    begin
        if(cc1_enable ^ cc2_enable)
            avst_source_antenna   <=  avst_source_antenna + 16'd2;
        else if(cc1_enable & cc2_enable)
            avst_source_antenna   <=  avst_source_antenna + 16'd1;
    end
end

//max_prb can be 273/162 depending on bw of cc.
always @ (posedge clk_eth)
begin : MAX_PKT_SIZE_DETECT
    if(~rst_eth_n) 
        max_pkt_size  <= 'd0;
    else if(~avst_source_antenna[0])
    begin
        max_pkt_size   <=  max_pkt_size_cc1 ; // the carrier 0,2,4,6
        max_prb        <=  max_prb_cc1;
    end
    else
    begin 
        max_pkt_size   <=  max_pkt_size_cc2 ; // the carrier 1,3,5,7
        max_prb        <=  max_prb_cc2;
    end
end    
    
always @ (posedge clk_eth)
begin : RAM_SYM
    if(~rst_eth_n) 
        begin
        ram_rd_sym  <=  4'b0   ;
        PUSCH_data_processed <= 1'b0;
        end
    else if (ram_rdenable_falling & ram_rd_iteration_last & ram_rd_sym_last)
        begin
        ram_rd_sym  <=  4'b0   ;
        PUSCH_data_processed <= 1'b1;
        end
    else if (ram_rdenable_falling & ram_rd_iteration_last) // 1 Symbol duration
        begin
        ram_rd_sym  <=  ram_rd_sym + 4'b1 ;
        PUSCH_data_processed <= 1'b0;
        end    
    else 
        begin        
        PUSCH_data_processed <= 1'b0;
        end
end


 always @ (posedge clk_eth)
begin
    if(~rst_eth_n)
        active_eaxc_sym_valid <= 'd0;
    else if(tx_uplane_metavalid_2d & ram_rd_valid_2d)
        active_eaxc_sym_valid <= ~tx_uplane_metadata_2d[0];
end


//Sequence Id is incremented for each eAxC ID. Every eAxC ID has its own individual sequence counter.
always @ (posedge clk_eth)
begin
    if(~rst_eth_n)
    begin
        ram_rd_seq_eaxc_0 <= 'd255;
        ram_rd_seq_eaxc_1 <= 'd255;
        ram_rd_seq_eaxc_2 <= 'd255;
        ram_rd_seq_eaxc_3 <= 'd255;
        ram_rd_seq_eaxc_4 <= 'd255;
        ram_rd_seq_eaxc_5 <= 'd255;
        ram_rd_seq_eaxc_6 <= 'd255;
        ram_rd_seq_eaxc_7 <= 'd255;
    end
    else
    begin
        if(ram_rd_valid_3d & ram_rd_sop_3d & active_eaxc_sym_valid)
        begin
            case(avst_source_antenna_3d)
            EAXC_ID_START + 'd0:
            ram_rd_seq_eaxc_0 <= ram_rd_seq_eaxc_0 + 'd1;
            EAXC_ID_START + 'd1:
            ram_rd_seq_eaxc_1 <= ram_rd_seq_eaxc_1 + 'd1;
            EAXC_ID_START + 'd2:
            ram_rd_seq_eaxc_2 <= ram_rd_seq_eaxc_2 + 'd1;
            EAXC_ID_START + 'd3:
            ram_rd_seq_eaxc_3 <= ram_rd_seq_eaxc_3 + 'd1;
            EAXC_ID_START + 'd4:
            ram_rd_seq_eaxc_4 <= ram_rd_seq_eaxc_4 + 'd1;
            EAXC_ID_START + 'd5:
            ram_rd_seq_eaxc_5 <= ram_rd_seq_eaxc_5 + 'd1;                        
            EAXC_ID_START + 'd6:
            ram_rd_seq_eaxc_6 <= ram_rd_seq_eaxc_6 + 'd1;
            EAXC_ID_START + 'd7:
            ram_rd_seq_eaxc_7 <= ram_rd_seq_eaxc_7 + 'd1;
            endcase
        end
        else
        begin
            ram_rd_seq_eaxc_0 <= ram_rd_seq_eaxc_0; 
            ram_rd_seq_eaxc_1 <= ram_rd_seq_eaxc_1;
            ram_rd_seq_eaxc_2 <= ram_rd_seq_eaxc_2;
            ram_rd_seq_eaxc_3 <= ram_rd_seq_eaxc_3;
            ram_rd_seq_eaxc_4 <= ram_rd_seq_eaxc_4; 
            ram_rd_seq_eaxc_5 <= ram_rd_seq_eaxc_5;
            ram_rd_seq_eaxc_6 <= ram_rd_seq_eaxc_6;
            ram_rd_seq_eaxc_7 <= ram_rd_seq_eaxc_7;          
        end
    end
end


always @ (posedge clk_eth)
begin
    if(~rst_eth_n)
        ram_rd_seq_5d <= 'd0;
    else
    begin
        if(ram_rd_valid_4d)
        begin
            case(avst_source_antenna_4d)
            EAXC_ID_START:
            ram_rd_seq_5d <= ram_rd_seq_eaxc_0;
            EAXC_ID_START + 'd1:
            ram_rd_seq_5d <= ram_rd_seq_eaxc_1;
            EAXC_ID_START + 'd2:
            ram_rd_seq_5d <= ram_rd_seq_eaxc_2;
            EAXC_ID_START + 'd3:
            ram_rd_seq_5d <= ram_rd_seq_eaxc_3;
            EAXC_ID_START + 'd4:
            ram_rd_seq_5d <= ram_rd_seq_eaxc_4;
            EAXC_ID_START + 'd5:
            ram_rd_seq_5d <= ram_rd_seq_eaxc_5;
            EAXC_ID_START + 'd6:
            ram_rd_seq_5d <= ram_rd_seq_eaxc_6;
            EAXC_ID_START + 'd7:
            ram_rd_seq_5d <= ram_rd_seq_eaxc_7;
            endcase
        end
    end
end


always @ (posedge clk_eth)
begin : RAM_SYM_LAST
    if(~rst_eth_n) 
    begin
        ram_rd_sym_last  <=  1'b0                         ;
    end    
    else
    begin
        ram_rd_sym_last  <=  ram_rd_sym == (NUM_OF_SYM-1) ;
    end
end

/*
 * Description: LAST_SYM_ARRIVED is latched based on positive edge of ram_rd_sym_last. We detect the start of last_symbol. 
 */
always @ (posedge clk_eth)
begin: LAST_SYM_ARRIVED_LATCH  
if(~rst_eth_n) 
    begin
        last_sym_arrived  <= 1'b0   ;
    end    
    else if(last_sym_arrived_latch_clr)
    begin
        last_sym_arrived  <= 1'b0   ;
    end
    else if(ram_rd_sym_last &(~ram_rd_sym_last_1d))
    begin
        last_sym_arrived  <= 1'b1   ;
    end    
end
assign cc_concatenate = {(NUM_OF_FFT/2){no_of_cycles_cc2,no_of_cycles_cc1}};
//Generate Statement
generate
genvar fft_num;
for(fft_num=0; fft_num < NUM_OF_FFT; fft_num = fft_num+1)
begin:FFT_SLICE

    assign max_cycle_count  [fft_num] = cc_concatenate[fft_num*BW_DATAWIDTH+:BW_DATAWIDTH]-1'd1; 
    assign ff_wrreq         [fft_num] = avst_sink_valid_4d[fft_num]         ;
    assign ff_writedata     [fft_num] = avst_sink_data_4d [fft_num*DSP_IQ_DATAWIDTH+:DSP_IQ_DATAWIDTH] ;
    assign ff_rdreq         [fft_num] = ~ff_rdempty [fft_num]       ;    
    
    assign ram_writedata    [fft_num] = ff_readdata_2d  [fft_num]   ;
    assign ram_wrreq        [fft_num] = (ff_rdreq_3d[fft_num]   & ~ram_wrfull[fft_num]);    
    
    assign ram_rdreq        [fft_num] = ram_rd_valid & (ram_rd_fft == fft_num)    ;
    
    always @ (posedge clk_dsp)
    begin : DSP_PIPE_DELAY
        if (rst_dsp_n == 1'b0) 
        begin
            ff_wrreq_1d     [fft_num]   <=  1'b0                        ;
            ff_wrreq_2d     [fft_num]   <=  1'b0                        ;
            ff_wrreq_3d     [fft_num]   <=  1'b0                        ;
            ff_wrreq_4d     [fft_num]   <=  1'b0                        ;
            ff_wrreq_5d     [fft_num]   <=  1'b0                        ;
            ff_wrreq_6d     [fft_num]   <=  1'b0                        ;
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
            
            ff_writedata_1d [fft_num]   <=  ff_writedata    [fft_num]   ;
            ff_writedata_2d [fft_num]   <=  ff_writedata_1d [fft_num]   ;
            ff_writedata_3d [fft_num]   <=  ff_writedata_2d [fft_num]   ;
            ff_writedata_4d [fft_num]   <=  ff_writedata_3d [fft_num]   ;
            ff_writedata_5d [fft_num]   <=  ff_writedata_4d [fft_num]   ;
            ff_writedata_6d [fft_num]   <=  ff_writedata_5d [fft_num]   ;
        end      
    end
    
    // CDC FIFO for DSP to ethernet clock domain
    
    ff_32i_128o_64d_dc u_ff_32i_128o_64d_dc(   
        .data       (ff_writedata_6d    [fft_num]   ),  
        .wrreq      (ff_wrreq_6d        [fft_num]   ),  
        .rdreq      (ff_rdreq           [fft_num]   ),  
        .wrclk      (clk_dsp                        ),  
        .rdclk      (clk_eth                        ), 
        .aclr       (~rst_dsp_n                     ),    
        .q          (ff_readdata        [fft_num]   ),  
        .rdempty    (ff_rdempty         [fft_num]   )   
    );   

// FIFO Size
 //pusch --> 3276*32/128 --> 819 --> 819*2 --> 1638 --> 2048 depth should be fine
 
    ff_128i_128o_2048d_sc u_ff_128i_128o_2048d_ul_sc(  // FIFO SIZE needs to be revised
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
            ram_rdreq_6d            [fft_num]   <= 1'b0                     ;
            ram_rdreq_7d            [fft_num]   <= 1'b0                     ;
            ram_rdreq_8d            [fft_num]   <= 1'b0                     ;
            ram_readdata_1d         [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ram_readdata_2d         [fft_num]   <= {ETH_IQ_DATAWIDTH{1'b0}} ;
            ram_rdusedw_1d          [fft_num]   <= 12'b0                    ;
            ram_rdusedw_2d          [fft_num]   <= 12'b0                    ;
            ram_wrfull_1d           [fft_num]   <= 2'b0                     ;
            ram_wrfull_2d           [fft_num]   <= 2'b0                     ;  
        end 
        else 
        begin
            ff_rdreq_1d             [fft_num]   <= ff_rdreq             [fft_num]   ;
            ff_rdreq_2d             [fft_num]   <= ff_rdreq_1d          [fft_num]   ;
            ff_rdreq_3d             [fft_num]   <= ff_rdreq_2d          [fft_num]   ;
            ff_readdata_1d          [fft_num]   <= ff_readdata          [fft_num]   ;
            ff_readdata_2d          [fft_num]   <= ff_readdata_1d       [fft_num]   ;
            ram_wrreq_1d            [fft_num]   <= ram_wrreq            [fft_num]   ;
            ram_wrreq_2d            [fft_num]   <= ram_wrreq_1d         [fft_num]   ;
            ram_wrreq_3d            [fft_num]   <= ram_wrreq_2d         [fft_num]   ;
            ram_writedata_1d        [fft_num]   <= ram_writedata        [fft_num]   ;
            ram_writedata_2d        [fft_num]   <= ram_writedata_1d     [fft_num]   ;
            ram_writedata_3d        [fft_num]   <= ram_writedata_2d     [fft_num]   ;
            ram_rdreq_1d            [fft_num]   <= ram_rdreq            [fft_num]   ;
            ram_rdreq_2d            [fft_num]   <= ram_rdreq_1d         [fft_num]   ;
            ram_rdreq_3d            [fft_num]   <= ram_rdreq_2d         [fft_num]   ;
            ram_rdreq_4d            [fft_num]   <= ram_rdreq_3d         [fft_num]   ;
            ram_rdreq_5d            [fft_num]   <= ram_rdreq_4d         [fft_num]   ;
            ram_rdreq_6d            [fft_num]   <= ram_rdreq_5d         [fft_num]   ;
            ram_rdreq_7d            [fft_num]   <= ram_rdreq_6d         [fft_num]   ;
            ram_rdreq_8d            [fft_num]   <= ram_rdreq_7d         [fft_num]   ;
            ram_readdata_1d         [fft_num]   <= ram_readdata         [fft_num]   ;
            ram_readdata_2d         [fft_num]   <= ram_readdata_1d      [fft_num]   ;
            ram_rdusedw_1d          [fft_num]   <= ram_rdusedw          [fft_num]   ;
            ram_rdusedw_2d          [fft_num]   <= ram_rdusedw_1d       [fft_num]   ;
            ram_wrfull_1d           [fft_num]   <= ram_wrfull            [fft_num]  ;
            ram_wrfull_2d           [fft_num]   <= ram_wrfull_1d         [fft_num]  ;

        end      
    end
    

    always @ (posedge clk_eth)
    begin : RAM_READY
        if(~rst_eth_n) 
            ram_rdready [fft_num]   <=  1'b0    ;
        else             
            ram_rdready [fft_num]   <=  (ram_rdusedw_2d  [fft_num] >= max_cycle_count[fft_num]) ;  //273*12*32/128 - 1 Complete Symbol of 1 AxC data 
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



always @ (posedge clk_eth)
begin : eAxC_Flag_DETECT
    if(~rst_eth_n) 
    begin
        active_eaxc_sym <= 1'b0;
    end        
    else if(ram_rd_valid_7d & tx_uplane_metavalid_7d)
    begin 
        if(~tx_uplane_metadata_7d[0])
            active_eaxc_sym <= 1'b1;
        else
            active_eaxc_sym <= 1'b0;
    end
    else
    begin
        active_eaxc_sym <= 1'b0;
    end        
end


// timingadapter Ready latency = 8

timingadapter u_timingadapter(
    .clk              (clk_eth                                              ),
    .reset_n          (rst_eth_n                                            ),
    .in_data          ({tx_uplane_metadata_8d,ram_readdata_mux_2d}          ),
    .in_valid         (tx_uplane_metavalid_8d & ram_rd_valid_8d & active_eaxc_sym & active_prb_valid_8d ), 
    .in_ready         (in_ready                                             ),
    .in_startofpacket (active_prb_sop_8d                                    ),
    .in_endofpacket   (active_prb_eop_8d                                    ),
    .in_empty         ('d0                                                  ),
    .in_channel       (avst_source_antenna_8d                               ),
    .out_data         (adapter_out_data                                     ),
    .out_valid        (adapter_out_valid                                    ),
    .out_ready        (adapter_out_ready                                    ),
    .out_startofpacket(adapter_out_startofpacket                            ),
    .out_endofpacket  (adapter_out_endofpacket                              ),
    .out_empty        (                                                     ),
    .out_channel      (adapter_out_channel                                  ) 
    
    );

// storeandforward_fifo Ready latency = 0 
// FIFO Size --> 3276*32/128 --> 819 --> kept as 1024

storeandforward_fifo_pusch u_storeandforward_fifo(
    .clk                    (clk_eth                               ),              
    .reset                  (~rst_eth_n                            ),  
    .almost_full_data       (almost_full_data                      ), 
    .almost_empty_data      (almost_empty_data                     ),
    .in_data                (adapter_out_data                      ),          
    .in_valid               (adapter_out_valid & adapter_out_ready ),         
    .in_ready               (adapter_out_ready                     ),
    .in_startofpacket       (adapter_out_startofpacket & adapter_out_valid & adapter_out_ready), 
    .in_endofpacket         (adapter_out_endofpacket & adapter_out_valid & adapter_out_ready    ),   
    .in_empty               (                                      ),         
    .in_channel             (adapter_out_channel                   ),       
    .out_data               (out_data                              ),         
    .out_valid              (out_valid                             ),        
    .out_ready              (scfifo_ready                          ),        
    .out_startofpacket      (out_startofpacket                     ),
    .out_endofpacket        (out_endofpacket                       ),  
    .out_empty              (                                      ),        
    .out_channel            (out_channel                           )         
            
);


scfifo
#(
    .lpm_width                  (16                         ),
    .lpm_widthu                 (4                          ),
    .lpm_numwords               (16                         ),
    .lpm_showahead              ("OFF"                      ),
    .lpm_type                   ("SCFIFO"                   ),
    .overflow_checking          ("OFF"                      ),
    .underflow_checking         ("OFF"                      ),
    .ram_block_type             ("MLAB"                     )

    
)pusch_tx_u_numprb_size 
(
    .clock (clk_eth                      ),
    .data  (numprbu_size                 ),
    .rdreq (out_startofpacket & out_valid & scfifo_ready),
    .q     (tx_u_numprbu_size            ),
    .wrreq (active_prb_eop & active_prb_valid),
    .sclr  (~rst_eth_n                   )
    
);

assign scfifo_ready         = (output_fifo_usedw < (OUTPUT_FIFO_DEPTH-12) );
assign output_fifo_wrreq    = out_valid_1d;
assign output_fifo_data     = {tx_u_numprbu_size, out_startofpacket_1d,out_endofpacket_1d, out_channel_1d,out_data_1d};
assign output_fifo_rdreq    = avst_source_ready & ~output_fifo_empty ;

// To Fetch the data from Store and Forward FIFO and make it ready to feed to Arbiter with Zero Ready Latency

scfifo
#(
    .lpm_width                  (OUTPUT_FIFO_WIDTH          ),
    .lpm_widthu                 ($clog2(OUTPUT_FIFO_DEPTH)  ),
    .lpm_numwords               (OUTPUT_FIFO_DEPTH          ),
    .lpm_showahead              ("ON"                       ),
    .lpm_type                   ("SCFIFO"                   ),
    .overflow_checking          ("OFF"                      ),
    .underflow_checking         ("OFF"                      ),
    .ram_block_type             ("MLAB"                     )
) output_fifo
(
    .clock          (clk_eth                ),
    .data           (output_fifo_data       ),
    .rdreq          (output_fifo_rdreq      ),
    .sclr           (~rst_eth_n             ),
    .wrreq          (output_fifo_wrreq      ),
    .q              (output_fifo_q          ),
    .usedw          (output_fifo_usedw      ),
    .aclr           (                       ),
    .eccstatus      (                       ),
    .full           (output_fifo_full       ),
    .empty          (output_fifo_empty      ),
    .almost_full    (                       ),
    .almost_empty   (                       )
);


assign  tx_uplane_numprbu_size      = output_fifo_q[289:274] ;
assign  tx_uplane_metadata_out      = output_fifo_q[255:128] ;
assign  avst_source_data            = output_fifo_q[127: 0]  ; 
assign  avst_source_valid           = output_fifo_rdreq      ;
assign  avst_source_startofpacket   = output_fifo_q[273] & output_fifo_rdreq ;
assign  avst_source_endofpacket     = output_fifo_q[272] & output_fifo_rdreq ;
assign  avst_source_channel         = output_fifo_q[271:256] ;



// arbiter_request will be asserted 5 Clock cycle in advance from avst_source_valid
// duration of this arbiter_request is one clock cycle
// This is changed to support new arbiter in OB
assign  arbiter_request             = adapter_out_endofpacket & adapter_out_ready & adapter_out_valid ; // For New Arbiter
//assign  arbiter_request            = ~output_fifo_empty ;  //For Old Arbiter



//Input data counter
always @ (posedge clk_dsp)
begin
    if(~rst_dsp_n)
        avst_sink_valid_ctr <= 'd0;
    else if(~avst_sink_valid_1d[0] & avst_sink_valid_2d[0] )
        avst_sink_valid_ctr <= 'd0;
    else if(avst_sink_valid_1d[0])
        avst_sink_valid_ctr <= avst_sink_valid_ctr + 'd1;
end

always @ (posedge clk_dsp)
begin
    if(~rst_dsp_n)
        avst_sink_data_invalid_count <= 'd0;
    else if(~avst_sink_valid_1d[0] & avst_sink_valid_2d[0] )
        if (~((avst_sink_valid_ctr == SINK_PKT_CYCLES_60 ) | (avst_sink_valid_ctr == SINK_PKT_CYCLES_100)))
            avst_sink_data_invalid_count <= 'd1;
end

//Reserved for future use
always @  (posedge clk_eth)
begin
    if(~rst_eth_n)
        statistics_register <= 'd0;
    else
        statistics_register <= 'd0;
end

always @ (posedge clk_eth)
begin : STATUS_LATCH
    if(~rst_eth_n) 
        fifo_full <= 'd0;        
    else if(status_clear_2d)
        fifo_full <= 'd0;    
    else if((ram_wrfull_2d[1] & cc2_enable) | (ram_wrfull_2d[0] & cc1_enable) )
        fifo_full <= 'd1;        
end

always @ (posedge clk_eth  )
begin : STATUS_LATCH1
    if (rst_eth_n == 1'b0) 
        status_register <= 'd0;        
    else 
        status_register  <= {avst_sink_data_invalid_count_2d,
                             prb_state_machine,
                             cc2_enable,                            
                             cc1_enable,                            
                             ram_rdready_all,                         
                             ram_rd_valid,                           
                             avst_source_ready,                             
                             active_eaxc_sym,                
                             fifo_full,                 
                             PUSCH_data_processed,               
                             PUSCH_data_arrived_eth};                 
                             
end


endmodule

