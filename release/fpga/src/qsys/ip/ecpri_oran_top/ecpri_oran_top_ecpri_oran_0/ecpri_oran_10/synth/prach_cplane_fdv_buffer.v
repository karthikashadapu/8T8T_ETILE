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
// File:        prach_cplane_fdv_buffer.v
// Author:      Boobathi Selvaraj
// Description: Sub block of CU Plane coupling. 

//              PRACH C plane FDV Buffer to store the C plane packets from O-DU and read it based on availablity of uplink U plane packets from PRACH
//                It has 2 sub modules
//                1. C Plane Parser 
//                        This block checks the incoming packet data direction and Section type and passes to next block.
//                        data direction should be 0 for Uplink packets
//                        Section type should be 1 for CU plane coupling feature
//                2. State Machine for discreate read 
//                        Read address will keep switch based on No of sections / No of Axcs / No of Symbols                        
// ================================================================================ 
         
         
`timescale 1ns/1ns
 
module prach_cplane_fdv_buffer
#(parameter NUM_OF_EAXC_PER_PORT  = 4,
  parameter NUM_OF_PHYSICAL_PORTS = 2,
  parameter EAXC_ID_START         = 8
  )
(
    clk_eth                             ,
    rst_eth_n                           ,

    // Stream Input 
    avst_sink_c_valid                   ,        
    avst_sink_c_endofpacket             ,
    avst_sink_c_startofpacket           ,
    
    // C plane conduits data
    rx_c_rtc_id                         , //rx_c_rtc_id eAxC Number from rx_c_rtc_id of eCPRI IP. RU Port ID is considered as eAxC ID.         
    rx_c_dataDirection                  ,              
    rx_c_filterIndex                    ,                   
    rx_c_frameId                        ,                       
    rx_c_subframeId                     ,                    
    rx_c_slotID                         ,                        
    rx_c_startsymbolid                  , // Start of symbol  
    rx_c_numberOfsections               ,
    rx_c_symInc                         ,
    rx_c_sectionId                      ,                     
    rx_c_rb                             ,                            
    rx_c_startPrb                       ,                      
    rx_c_numPrb                         ,                    
    rx_sectionType                      ,                     
    rx_numSymbol                        ,       
    rx_c_framestructure                 ,    

    tx_uplane_metadata_ready            ,
    tx_uplane_metadata                  ,                
    tx_uplane_metavalid                 ,  
    
    last_sym_arrived                    ,
    status_clear                        ,
    status_register                     ,
    statistics_register                 ,
    last_sym_arrived_latch_clr          ,
    prach_data_received                 ,  
    prach_data_processed                ,                
    Sec_type3_cplane_detect             ,        
    ul_start                            ,
    cc1_enable                          ,
    cc2_enable               

);

//Parameters Declaration
parameter NUM_OF_ANT         =    NUM_OF_EAXC_PER_PORT * NUM_OF_PHYSICAL_PORTS ;
parameter NUM_OF_SLOT        =    2                 ;
parameter NUM_OF_SYM         =    1                 ; 
parameter ETH_DATAWIDTH      =    128               ;
parameter CPLANE_DATAWIDTH   =    128               ;

localparam OUTPUT_FIFO_WIDTH =    128               ;  //Width of the Final SC FIFO 
localparam OUTPUT_FIFO_DEPTH =    256               ;  //To store atleaset 4 Symbol information
localparam MAX_NUM_OF_SYM    =    12                ;

input              clk_eth                          ;
input              rst_eth_n                        ;

// Stream input
input              avst_sink_c_valid                ;
input              avst_sink_c_endofpacket          ;
input              avst_sink_c_startofpacket        ;

// C plane conduits data 
input wire         rx_c_dataDirection               ;
input wire [3:0]   rx_c_filterIndex                 ;
input wire [7:0]   rx_c_frameId                     ;
input wire [3:0]   rx_c_subframeId                  ;
input wire [5:0]   rx_c_slotID                      ;
input wire [5:0]   rx_c_startsymbolid               ;
input wire [7:0]   rx_c_numberOfsections            ;
input wire [11:0]  rx_c_sectionId                   ;
input wire         rx_c_rb                          ;
input wire         rx_c_symInc                      ;
input wire [9:0]   rx_c_startPrb                    ;
input wire [7:0]   rx_c_numPrb                      ;
input wire [7:0]   rx_sectionType                   ;
input wire [3:0]   rx_numSymbol                     ;
input wire [15:0]  rx_c_rtc_id                      ;
input wire [7:0]   rx_c_framestructure              ;

// Stream output
output [CPLANE_DATAWIDTH-1:0]           tx_uplane_metadata               ;
output                                  tx_uplane_metavalid              ;
output reg [10:0]                       status_register                  ;
output reg                              Sec_type3_cplane_detect          ;                         
output wire                             last_sym_arrived_latch_clr       ;

input                                   tx_uplane_metadata_ready         ;
input                                   prach_data_received              ;
input                                   prach_data_processed             ;
                                   
input                                   last_sym_arrived                 ;
input                                   status_clear                     ;
                                  
input                                   ul_start                         ;

// Internal Signals
wire    [OUTPUT_FIFO_WIDTH-1: 0]        output_fifo_data                 ;
wire                                    output_fifo_rdreq                ;
wire                                    output_fifo_wrreq                ;
wire    [OUTPUT_FIFO_WIDTH-1: 0]        output_fifo_q                    ;
wire    [$clog2(OUTPUT_FIFO_DEPTH)-1:0] output_fifo_usedw                ;
wire                                    output_fifo_full                 ;
wire                                    output_fifo_empty                ;

reg                                     rx_c_dataDirection_1d            ;
reg [3:0]                               rx_c_filterIndex_1d              ;
reg [8:0]                               rx_c_frameId_1d                  ;
reg [3:0]                               rx_c_subframeId_1d               ;
reg [5:0]                               rx_c_slotID_1d                   ;
reg [5:0]                               rx_c_startsymbolid_1d            ;
reg [11:0]                              rx_c_sectionId_1d                ;
reg                                     rx_c_rb_1d                       ;
reg [9:0]                               rx_c_startPrb_1d                 ;
reg [7:0]                               rx_c_numPrb_1d                   ;
reg [7:0]                               rx_sectionType_1d                ;
reg [3:0]                               rx_numSymbol_1d                  ;
reg [15:0]                              rx_c_rtc_id_1d                   ;
                            
reg                                     rx_c_dataDirection_2d            ;
reg [3:0]                               rx_c_filterIndex_2d              ;
reg [8:0]                               rx_c_frameId_2d                  ;
reg [3:0]                               rx_c_subframeId_2d               ;
reg                                     next_sf_arrived                  ;
reg                                     rx_c_subframeId_latch            ;
reg                                     rx_c_subframeId_latch_1d         ;
reg                                     rx_c_subframeId_latch_2d         ;
reg                                     rx_c_subframeId_latch_3d         ;
reg                                     rx_c_subframeId_latch_4d         ;
reg                                     rx_c_subframeId_latch_5d         ;
reg                                     rx_c_subframeId_latch_6d         ;
reg                                     rx_c_subframeId_latch_7d         ;
                            
reg                                     Sec_type3_prach_received_1d      ;
reg                                     Sec_type3_prach_received_2d      ;
reg                                     Sec_type3_prach_processed_1d     ;
reg                                     Sec_type3_prach_processed_2d     ;
reg [5:0]                               rx_c_slotID_2d                   ;
reg [5:0]                               rx_c_startsymbolid_2d            ;
reg [5:0]                               rx_c_symbolid_latch              ;
reg [11:0]                              rx_c_sectionId_2d                ;
reg                                     rx_c_rb_2d                       ;
reg [9:0]                               rx_c_startPrb_2d                 ;
reg [7:0]                               rx_c_numPrb_2d                   ;
reg [3:0]                               num_symbol                       ;
reg [5:0]                               start_symbol                     ;
reg [7:0]                               rx_sectionType_2d                ;
reg [7:0]                               numberOfsections                 ;
reg                                     ram_last_wraddress               ;
reg [7:0]                               rx_c_numberOfsections_1d         ;
reg [7:0]                               rx_c_numberOfsections_2d         ;
reg [7:0]                               rx_c_numberOfsections_latch      ;
reg [3:0]                               rx_numSymbol_2d                  ;
reg [15:0]                              rx_c_rtc_id_2d                   ;
reg [15:0]                              rx_c_rtc_id_3d                   ;
reg [15:0]                              rx_c_eaxc_id_latch               ;

reg [7:0]                               rx_c_framestructure_1d           ;
reg [7:0]                               rx_c_framestructure_2d           ;

reg [3:0]                               Number_of_Cplane                 ;
reg                                     first_cplane_detect              ;
reg                                     first_cplane_detect_1d           ;
reg                                     first_cplane_detect_posedge      ;
reg                                     invalid_num_of_cplane            ;
reg [CPLANE_DATAWIDTH-1:0]              meta_data_latch                  ;
reg [CPLANE_DATAWIDTH-1:0]              meta_data_out                    ;
reg                                     meta_data_valid                  ;
reg                                     meta_data_valid_1d               ;

reg                                     avst_sink_c_valid_1d             ;
reg                                     avst_sink_c_valid_2d             ;
reg                                     avst_sink_c_valid_3d             ;
reg                                     avst_sink_c_valid_4d             ;
reg                                     avst_sink_c_valid_5d             ;
reg                                     avst_sink_c_valid_6d             ;
reg                                     avst_sink_c_startofpacket_1d     ;
reg                                     avst_sink_c_startofpacket_2d     ;
reg                                     avst_sink_c_startofpacket_3d     ;
reg                                     avst_sink_c_startofpacket_4d     ;
reg                                     avst_sink_c_startofpacket_5d     ;
reg                                     avst_sink_c_startofpacket_6d     ;
reg                                     avst_sink_c_endofpacket_1d       ;
reg                                     avst_sink_c_endofpacket_2d       ;
reg                                     avst_sink_c_endofpacket_3d       ;
reg                                     avst_sink_c_endofpacket_4d       ;
reg                                     avst_sink_c_endofpacket_5d       ;
reg                                     avst_sink_c_endofpacket_6d       ;

reg     [NUM_OF_SYM-1:0]        ram_wren            [NUM_OF_ANT-1:0]                     ;
reg     [NUM_OF_SYM-1:0]        ram_wren_1d         [NUM_OF_ANT-1:0]                     ;
reg     [NUM_OF_SYM-1:0]        ram_wren_2d         [NUM_OF_ANT-1:0]                     ;
reg     [NUM_OF_SYM-1:0]        ram_wren_3d         [NUM_OF_ANT-1:0]                     ;
reg     [NUM_OF_SYM-1:0]        ram_wren_4d         [NUM_OF_ANT-1:0]                     ;
reg     [NUM_OF_SYM-1:0]        ram_wren_5d         [NUM_OF_ANT-1:0]                     ;
                                
reg     [ETH_DATAWIDTH-1:0]     ram_writedata       [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_1d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_2d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_3d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_4d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_writedata_5d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;

wire    [ETH_DATAWIDTH-1:0]     ram_readdata        [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_readdata_1d     [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]     ram_readdata_2d     [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;

reg     [NUM_OF_SYM-1:0]        ram_rden            [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_1d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_2d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_3d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_4d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_5d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_6d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_7d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_8d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]        ram_rden_9d         [NUM_OF_ANT-1:0]                    ;


reg                             ram_wraddress         [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg   [1:0]                     ram_wraddress_max     [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg                             ram_wraddress_1d      [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg                             ram_wraddress_2d      [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg                             ram_rdaddress         [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg                             ram_rdaddress_1d      [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg                             ram_rdaddress_2d      [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;

wire                                    fdv_read_req            ;
wire                                    fdv_read_enable         ;
reg                                     fdv_read_enable_1d      ;
reg                                     fdv_read_enable_2d      ;
reg                                     rx_c_symInc_1d          ;
reg                                     rx_c_symInc_2d          ;
reg                                     rx_c_symInc_3d          ;
reg                                     rx_c_symInc_4d          ;
reg                                     rx_c_symInc_5d          ;
reg                                     rx_c_symInc_6d          ;
wire   [7:0]                            section_count           ;
reg    [7:0]                            section_count_1d        ;
reg    [7:0]                            section_count_2d        ;
reg    [7:0]                            section_count_3d        ;
reg    [7:0]                            section_count_4d        ;
reg    [7:0]                            section_count_5d        ;
reg    [7:0]                            section_count_6d        ;
reg    [7:0]                            section_count_7d        ;
reg    [7:0]                            section_count_8d        ;
reg    [7:0]                            section_count_9d        ;
reg    [7:0]                            section_count_10d       ;
reg    [7:0]                            section_count_11d       ;
reg    [7:0]                            section_count_12d       ;
wire   [$clog2(NUM_OF_SYM)-1:0]         symbol_number           ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_1d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_2d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_3d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_4d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_5d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_6d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_7d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_8d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_9d        ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_10d       ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_11d       ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_11d_dup1  ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_11d_dup2  ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_11d_dup3  ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_11d_dup4  ;
reg    [$clog2(NUM_OF_SYM)-1:0]         symbol_number_11d_dup5  ;

wire   [$clog2(NUM_OF_ANT)-1:0]         axc_number              ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_1d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_2d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_3d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_4d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_5d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_6d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_7d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_8d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_9d           ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_10d          ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_11d          ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_11d_dup1     ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_11d_dup2     ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_11d_dup3     ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_11d_dup4     ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_11d_dup5     ;
reg    [$clog2(NUM_OF_ANT)-1:0]         axc_number_12d          ;

reg                             wr_memory_location              ;
wire                            rd_memory_location              ;
reg                             rd_memory_location_1d           ;
reg                             rd_memory_location_2d           ;
reg                             rd_memory_location_3d           ;
reg                             rd_memory_location_4d           ;
reg                             rd_memory_location_5d           ;
reg                             rd_memory_location_6d           ;
reg                             rd_memory_location_7d           ;
reg                             rd_memory_location_8d           ;
reg                             rd_memory_location_9d           ;
reg                             rd_memory_location_10d          ;
reg                             rd_memory_location_11d          ;
         
reg                             wr_memory_location_1d           ;
reg                             wr_memory_location_2d           ;
reg                             wr_memory_location_3d           ;
reg                             wr_memory_location_4d           ;
reg                             wr_memory_location_5d           ;

wire                            read_address_clr                ;
wire                            next_sf_arrived_latch_clr       ;
reg                             read_address_clr_1d             ;
reg                             next_sf_arrived_latch_clr_1d    ;
reg                             read_address_clr_2d             ;
reg                             next_sf_arrived_latch_clr_2d    ;
reg                             read_address_clr_3d             ;
reg                             read_address_clr_4d             ;
reg                             read_address_clr_5d             ;
reg                             next_sf_arrived_1d              ;
reg                             next_sf_arrived_2d              ;
reg                             last_sym_arrived_1d             ;
reg                             last_sym_arrived_2d             ;
reg                             invalid_PRACH_eAxC              ;
reg                             status_clear_1d                 ;
reg                             status_clear_2d                 ;
wire                            next_sf_arrived_posedge         ;;
reg                             prach_data_received_1d          ;
reg                             prach_data_received_2d          ;
reg                             prach_data_processed_1d         ;
reg                             prach_data_processed_2d         ;

reg  [7:0]                      eaxc_received                   ; 
wire [3:0]                      state                           ;


reg                             ul_start_1d                     ;
reg                             ul_start_2d                     ;
reg                             first_uplane_detect             ;

reg [11:0]                                                 cplane_rf_counter               ;
reg [11:0]                                                 cplane_statistics               ; 
output reg [11:0]             statistics_register                  ;

input wire                      cc1_enable                      ;
input wire                      cc2_enable                      ;


    always @ (posedge clk_eth  )
    begin : PIPE_DELAY
        if (rst_eth_n == 1'b0) 
        begin 
            
            avst_sink_c_valid_2d                      <=  'd0  ;  
            avst_sink_c_valid_3d                      <=  'd0  ;              
            avst_sink_c_startofpacket_2d              <=  'd0  ;  
            avst_sink_c_startofpacket_3d              <=  'd0  ;  
            avst_sink_c_startofpacket_4d              <=  'd0  ;  
            avst_sink_c_startofpacket_5d              <=  'd0  ;  
            avst_sink_c_startofpacket_6d              <=  'd0  ;              
            avst_sink_c_endofpacket_2d                <=  'd0  ;  
            avst_sink_c_endofpacket_3d                <=  'd0  ;  
            avst_sink_c_endofpacket_4d                <=  'd0  ;  
            avst_sink_c_endofpacket_5d                <=  'd0  ;  
            avst_sink_c_endofpacket_6d                <=  'd0  ;                                                       
            rx_c_rtc_id_2d                            <=  'd0  ;
            rx_c_rtc_id_3d                            <=  'd0  ;
            rx_c_dataDirection_2d                     <=  'd0  ;                
            rx_c_filterIndex_2d                       <=  'd0  ;                
            rx_c_frameId_2d                           <=  'd256;                
            rx_c_subframeId_2d                        <=  'd10 ;            
            rx_c_slotID_2d                            <=  'd2  ;            
            rx_c_startsymbolid_2d                     <=  'd0  ;            
            rx_c_numberOfsections_2d                  <=  'd0  ;            
            rx_c_sectionId_2d                         <=  'd0  ;            
            rx_c_rb_2d                                <=  'd0  ;            
            rx_c_startPrb_2d                          <=  'd0  ;            
            rx_c_numPrb_2d                            <=  'd0  ;            
            rx_sectionType_2d                         <=  'd0  ;            
             rx_numSymbol_2d                          <=  'd0  ;
            symbol_number_1d                          <=  'd0  ; 
            symbol_number_2d                          <=  'd0  ;
            symbol_number_3d                          <=  'd0  ;
            symbol_number_4d                          <=  'd0  ;
            symbol_number_5d                          <=  'd0  ;
            symbol_number_6d                          <=  'd0  ;
            symbol_number_7d                          <=  'd0  ;
            symbol_number_8d                          <=  'd0  ;
            symbol_number_9d                          <=  'd0  ;
            symbol_number_10d                         <=  'd0  ;
            symbol_number_11d                         <=  'd0  ;
            symbol_number_11d_dup1                    <=  'd0  ;
            symbol_number_11d_dup2                    <=  'd0  ;
            symbol_number_11d_dup3                    <=  'd0  ;
            symbol_number_11d_dup4                    <=  'd0  ;
            symbol_number_11d_dup5                    <=  'd0  ;            
            section_count_1d                          <=  'd0  ;
            section_count_2d                          <=  'd0  ;
            section_count_3d                          <=  'd0  ;
            section_count_4d                          <=  'd0  ;
            section_count_5d                          <=  'd0  ;
            section_count_6d                          <=  'd0  ;
            section_count_7d                          <=  'd0  ;
            section_count_8d                          <=  'd0  ;
            section_count_9d                          <=  'd0  ;
            section_count_10d                         <=  'd0  ;
            section_count_11d                         <=  'd0  ;            
            section_count_12d                         <=  'd0  ;            
            axc_number_1d                             <=  'd0  ;
            axc_number_2d                             <=  'd0  ;
            axc_number_3d                             <=  'd0  ;
            axc_number_4d                             <=  'd0  ;
            axc_number_5d                             <=  'd0  ;
            axc_number_6d                             <=  'd0  ;
            axc_number_7d                             <=  'd0  ;
            axc_number_8d                             <=  'd0  ;
            axc_number_9d                             <=  'd0  ;
            axc_number_10d                            <=  'd0  ;
            axc_number_11d                            <=  'd0  ;
            axc_number_11d_dup1                       <=  'd0  ;
            axc_number_11d_dup2                       <=  'd0  ;
            axc_number_11d_dup3                       <=  'd0  ;
            axc_number_11d_dup4                       <=  'd0  ;
            axc_number_11d_dup5                       <=  'd0  ;
            rd_memory_location_1d                     <=  'd0  ;
            rd_memory_location_2d                     <=  'd0  ;
            rd_memory_location_3d                     <=  'd0  ;
            rd_memory_location_4d                     <=  'd0  ;
            rd_memory_location_5d                     <=  'd0  ;
            rd_memory_location_6d                     <=  'd0  ;
            rd_memory_location_7d                     <=  'd0  ;
            rd_memory_location_8d                     <=  'd0  ;
            rd_memory_location_9d                     <=  'd0  ;
            rd_memory_location_10d                    <=  'd0  ;
            rd_memory_location_11d                    <=  'd0  ;
            fdv_read_enable_1d                        <=  'd0  ;
            fdv_read_enable_2d                        <=  'd0  ;
            read_address_clr_1d                       <=  'd0  ;
            read_address_clr_2d                       <=  'd0  ;
            read_address_clr_3d                       <=  'd0  ;
            read_address_clr_4d                       <=  'd0  ;
            read_address_clr_5d                       <=  'd0  ;            
            section_count_1d                          <=  'd0  ;     
            section_count_2d                          <=  'd0  ;
            section_count_3d                          <=  'd0  ;
            section_count_4d                          <=  'd0  ;
            section_count_5d                          <=  'd0  ;
            section_count_6d                          <=  'd0  ;
            section_count_7d                          <=  'd0  ;
            section_count_8d                          <=  'd0  ;
            section_count_9d                          <=  'd0  ;
            section_count_10d                         <=  'd0  ;
            section_count_11d                         <=  'd0  ;
            section_count_12d                         <=  'd0  ;
            rx_c_subframeId_latch_1d                  <=  'd0  ; 
            rx_c_subframeId_latch_2d                  <=  'd0  ; 
            rx_c_subframeId_latch_3d                  <=  'd0  ; 
            rx_c_subframeId_latch_4d                  <=  'd0  ; 
            rx_c_subframeId_latch_5d                  <=  'd0  ; 
            rx_c_subframeId_latch_6d                  <=  'd0  ; 
            rx_c_subframeId_latch_7d                  <=  'd0  ; 
            Sec_type3_prach_received_1d               <=  'd0  ; 
            Sec_type3_prach_received_2d               <=  'd0  ; 
            next_sf_arrived_1d                        <=  'd0  ;
            next_sf_arrived_2d                        <=  'd0  ;
            last_sym_arrived_1d                       <=  'd0  ; 
            last_sym_arrived_2d                       <=  'd0  ;                 
            rx_c_symInc_2d                            <=  'd0  ;
            rx_c_symInc_3d                            <=  'd0  ;
            rx_c_symInc_4d                            <=  'd0  ;
            rx_c_symInc_5d                            <=  'd0  ;
            rx_c_symInc_6d                            <=  'd0  ;
            status_clear_1d                           <=  'd0  ;
            status_clear_2d                           <=  'd0  ;
            meta_data_valid_1d                        <=  'd0  ;
            wr_memory_location_1d                     <=  'd0  ;
            wr_memory_location_2d                     <=  'd0  ;
            wr_memory_location_3d                     <=  'd0  ;
            wr_memory_location_4d                     <=  'd0  ;
            wr_memory_location_5d                     <=  'd0  ;
            next_sf_arrived_latch_clr_1d              <=  'd0  ;
            next_sf_arrived_latch_clr_2d              <=  'd0  ;
            first_cplane_detect_1d                    <=  'd0  ;
            prach_data_received_1d                    <=  'd0  ;
            prach_data_received_2d                    <=  'd0  ;
            prach_data_processed_1d                   <=  'd0  ;
            prach_data_processed_2d                   <=  'd0  ;

            rx_c_framestructure_2d                    <=  'd0  ;
 
            ul_start_1d                               <=  'd0  ;
            ul_start_2d                               <=  'd0  ;
        end
        else 
        begin 
                      
            avst_sink_c_valid_2d                      <=  avst_sink_c_valid_1d          ;    
            avst_sink_c_valid_3d                      <=  avst_sink_c_valid_2d          ;    
            avst_sink_c_valid_4d                      <=  avst_sink_c_valid_3d          ;    
            avst_sink_c_valid_5d                      <=  avst_sink_c_valid_4d          ;    
            avst_sink_c_valid_6d                      <=  avst_sink_c_valid_5d          ;               
            avst_sink_c_startofpacket_2d              <=  avst_sink_c_startofpacket_1d  ;      
            avst_sink_c_startofpacket_3d              <=  avst_sink_c_startofpacket_2d  ;      
            avst_sink_c_startofpacket_4d              <=  avst_sink_c_startofpacket_3d  ;      
            avst_sink_c_startofpacket_5d              <=  avst_sink_c_startofpacket_4d  ;      
            avst_sink_c_startofpacket_6d              <=  avst_sink_c_startofpacket_5d  ;                
            avst_sink_c_endofpacket_2d                <=  avst_sink_c_endofpacket_1d    ;  
            avst_sink_c_endofpacket_3d                <=  avst_sink_c_endofpacket_2d    ;  
            avst_sink_c_endofpacket_4d                <=  avst_sink_c_endofpacket_3d    ;  
            avst_sink_c_endofpacket_5d                <=  avst_sink_c_endofpacket_4d    ;  
            avst_sink_c_endofpacket_6d                <=  avst_sink_c_endofpacket_5d    ;  
            rx_c_rtc_id_2d                            <=  rx_c_rtc_id_1d                ;
            rx_c_rtc_id_3d                            <=  rx_c_rtc_id_2d                ;            
            rx_c_dataDirection_2d                     <=  rx_c_dataDirection_1d         ;    
            rx_c_filterIndex_2d                       <=  rx_c_filterIndex_1d           ;
            rx_c_frameId_2d                           <=  rx_c_frameId_1d               ;    
            rx_c_subframeId_2d                        <=  rx_c_subframeId_1d            ;
            rx_c_slotID_2d                            <=  rx_c_slotID_1d                ;
            rx_c_startsymbolid_2d                     <=  rx_c_startsymbolid_1d         ;
            rx_c_numberOfsections_2d                  <=  rx_c_numberOfsections_1d      ;
            rx_c_sectionId_2d                         <=  rx_c_sectionId_1d             ;
            rx_c_rb_2d                                <=  rx_c_rb_1d                    ;
            rx_c_startPrb_2d                          <=  rx_c_startPrb_1d              ;
            rx_c_numPrb_2d                            <=  rx_c_numPrb_1d                ;
            rx_sectionType_2d                         <=  rx_sectionType_1d             ;
            rx_numSymbol_2d                           <=  rx_numSymbol_1d               ;
            symbol_number_1d                          <=  symbol_number                 ;
            symbol_number_2d                          <=  symbol_number_1d              ;
            symbol_number_3d                          <=  symbol_number_2d              ;
            symbol_number_4d                          <=  symbol_number_3d              ;
            symbol_number_5d                          <=  symbol_number_4d              ;
            symbol_number_6d                          <=  symbol_number_5d              ;
            symbol_number_7d                          <=  symbol_number_6d              ;
            symbol_number_8d                          <=  symbol_number_7d              ;
            symbol_number_9d                          <=  symbol_number_8d              ;
            symbol_number_10d                         <=  symbol_number_9d              ;
            symbol_number_11d                         <=  symbol_number_10d             ;
            symbol_number_11d_dup1                    <=  symbol_number_10d             ;
            symbol_number_11d_dup2                    <=  symbol_number_10d             ;
            symbol_number_11d_dup3                    <=  symbol_number_10d             ;
            symbol_number_11d_dup4                    <=  symbol_number_10d             ;
            symbol_number_11d_dup5                    <=  symbol_number_10d             ;            
            section_count_1d                          <=  section_count                 ;
            section_count_2d                          <=  section_count_1d              ;
            section_count_3d                          <=  section_count_2d              ;
            section_count_4d                          <=  section_count_3d              ;
            section_count_5d                          <=  section_count_4d              ;
            section_count_6d                          <=  section_count_5d              ;
            section_count_7d                          <=  section_count_6d              ;
            section_count_8d                          <=  section_count_7d              ;
            section_count_9d                          <=  section_count_8d              ;
            section_count_10d                         <=  section_count_9d              ;
            section_count_11d                         <=  section_count_10d             ;            
            section_count_12d                         <=  section_count_11d             ;            
            axc_number_1d                             <=  axc_number                    ;
            axc_number_2d                             <=  axc_number_1d                 ;
            axc_number_3d                             <=  axc_number_2d                 ;
            axc_number_4d                             <=  axc_number_3d                 ;
            axc_number_5d                             <=  axc_number_4d                 ;
            axc_number_6d                             <=  axc_number_5d                 ;
            axc_number_7d                             <=  axc_number_6d                 ;
            axc_number_8d                             <=  axc_number_7d                 ;
            axc_number_9d                             <=  axc_number_8d                 ;
            axc_number_10d                            <=  axc_number_9d                 ;
            axc_number_11d                            <=  axc_number_10d                ;
            axc_number_11d_dup1                       <=  axc_number_10d                ;
            axc_number_11d_dup2                       <=  axc_number_10d                ;
            axc_number_11d_dup3                       <=  axc_number_10d                ;
            axc_number_11d_dup4                       <=  axc_number_10d                ;
            axc_number_11d_dup5                       <=  axc_number_10d                ;
            rd_memory_location_1d                     <=  rd_memory_location            ;
            rd_memory_location_2d                     <=  rd_memory_location_1d         ;
            rd_memory_location_3d                     <=  rd_memory_location_2d         ;
            rd_memory_location_4d                     <=  rd_memory_location_3d         ;
            rd_memory_location_5d                     <=  rd_memory_location_4d         ;
            rd_memory_location_6d                     <=  rd_memory_location_5d         ;
            rd_memory_location_7d                     <=  rd_memory_location_6d         ;
            rd_memory_location_8d                     <=  rd_memory_location_7d         ;
            rd_memory_location_9d                     <=  rd_memory_location_8d         ;
            rd_memory_location_10d                    <=  rd_memory_location_9d         ;
            rd_memory_location_11d                    <=  rd_memory_location_10d        ;
            wr_memory_location_1d                     <=  wr_memory_location            ;
            wr_memory_location_2d                     <=  wr_memory_location_1d         ;
            wr_memory_location_3d                     <=  wr_memory_location_2d         ;
            wr_memory_location_4d                     <=  wr_memory_location_3d         ;
            wr_memory_location_5d                     <=  wr_memory_location_4d         ;
            fdv_read_enable_1d                        <=  fdv_read_enable               ;
            fdv_read_enable_2d                        <=  fdv_read_enable_1d            ;            
            rx_c_symInc_2d                            <=  rx_c_symInc_1d                ;
            rx_c_symInc_3d                            <=  rx_c_symInc_2d                ;
            rx_c_symInc_4d                            <=  rx_c_symInc_3d                ;
            rx_c_symInc_5d                            <=  rx_c_symInc_4d                ;
            rx_c_symInc_6d                            <=  rx_c_symInc_5d                ;
            read_address_clr_1d                       <=  read_address_clr              ;
            read_address_clr_2d                       <=  read_address_clr_1d           ;
            read_address_clr_3d                       <=  read_address_clr_2d           ;
            read_address_clr_4d                       <=  read_address_clr_3d           ;
            read_address_clr_5d                       <=  read_address_clr_4d           ;            
            rx_c_subframeId_latch_1d                  <=  rx_c_subframeId_latch         ;
            rx_c_subframeId_latch_2d                  <=  rx_c_subframeId_latch_1d      ;
            rx_c_subframeId_latch_3d                  <=  rx_c_subframeId_latch_2d      ;
            rx_c_subframeId_latch_4d                  <=  rx_c_subframeId_latch_3d      ;
            rx_c_subframeId_latch_5d                  <=  rx_c_subframeId_latch_4d      ;
            rx_c_subframeId_latch_6d                  <=  rx_c_subframeId_latch_5d      ;
            rx_c_subframeId_latch_7d                  <=  rx_c_subframeId_latch_6d      ;        
            next_sf_arrived_1d                        <=  next_sf_arrived               ;    
            next_sf_arrived_2d                        <=  next_sf_arrived_1d            ;     
            last_sym_arrived_1d                       <=  last_sym_arrived              ;    
            last_sym_arrived_2d                       <=  last_sym_arrived_1d           ;    
            status_clear_1d                           <=  status_clear                  ;
            status_clear_2d                           <=  status_clear_1d               ;
            meta_data_valid_1d                        <=  meta_data_valid               ; 
            next_sf_arrived_latch_clr_1d              <=  next_sf_arrived_latch_clr     ;
            next_sf_arrived_latch_clr_2d              <=  next_sf_arrived_latch_clr_1d  ;
            prach_data_received_1d                    <=  prach_data_received           ;            
            prach_data_received_2d                    <=  prach_data_received_1d        ;            
            prach_data_processed_1d                   <=  prach_data_processed          ;            
            prach_data_processed_2d                   <=  prach_data_processed_1d       ;    
            ul_start_1d                               <=  ul_start                      ;
            ul_start_2d                               <=  ul_start_1d                   ;            
            first_cplane_detect_1d                    <=  first_cplane_detect           ;
            rx_c_framestructure_2d                    <=  rx_c_framestructure_1d        ;
        end      
    end
    
    
    always @ (posedge clk_eth  )
    begin : VALID_CPLANE_DETECT1
        if (rst_eth_n == 1'b0) 
        begin            
            avst_sink_c_valid_1d           <=  'd0   ;
            avst_sink_c_startofpacket_1d   <=  'd0   ;  
            avst_sink_c_endofpacket_1d     <=  'd0   ; 
        end
        else if (avst_sink_c_valid & avst_sink_c_startofpacket & (rx_c_dataDirection == 'd0) & (rx_sectionType == 'd3) )
        begin                        
            avst_sink_c_valid_1d           <=  avst_sink_c_valid           ;               
            avst_sink_c_startofpacket_1d   <=  avst_sink_c_startofpacket   ;  
            avst_sink_c_endofpacket_1d     <=  avst_sink_c_endofpacket     ;              
        end
        else
        begin                        
            avst_sink_c_valid_1d           <=  'd0   ;
            avst_sink_c_startofpacket_1d   <=  'd0   ;  
            avst_sink_c_endofpacket_1d     <=  'd0   ; 
        end        
    end
    
    always @ (posedge clk_eth  )
    begin : SEC_TYPE3_CPLANE_DETECT
        if (rst_eth_n == 1'b0) 
        begin            
             Sec_type3_cplane_detect       <= 1'b0;            
        end
        else if (prach_data_processed_2d )
        begin                        
            Sec_type3_cplane_detect       <= 1'b0;            
        end
        else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d  )
        begin                        
            Sec_type3_cplane_detect       <= 1'b1;            
        end        
    end
    
    always @ (posedge clk_eth  )
    begin : VALID_CPLANE_DETECT2
        if (rst_eth_n == 1'b0) 
        begin                        
            rx_c_rtc_id_1d             <=  'd0       ;            
            rx_c_dataDirection_1d      <=  'd0       ;                                                        
            rx_c_filterIndex_1d        <=  'd0       ;                        
            rx_c_frameId_1d            <=  'd256     ;                                
            rx_c_subframeId_1d         <=  'd10      ;                                        
            rx_c_slotID_1d             <=  'd2       ;
            rx_c_startsymbolid_1d      <=  'd0       ;
            rx_c_numberOfsections_1d   <=  'd0       ;
            rx_c_sectionId_1d          <=  'd0       ;
            rx_c_rb_1d                 <=  'd0       ;
            rx_c_startPrb_1d           <=  'd0       ;
            rx_c_numPrb_1d             <=  'd0       ;
            rx_sectionType_1d          <=  'd0       ;
            rx_numSymbol_1d            <=  'd0       ;
            rx_c_symInc_1d             <=  'd0       ;
            rx_c_framestructure_1d     <=  'd0       ;
        end
        else if (avst_sink_c_valid & avst_sink_c_startofpacket & (rx_c_dataDirection == 'd0) & (rx_sectionType == 'd3) )
        begin                                                
            rx_c_rtc_id_1d             <=  rx_c_rtc_id                    ;            
            rx_c_dataDirection_1d      <=  rx_c_dataDirection             ;                                                        
            rx_c_filterIndex_1d        <=  rx_c_filterIndex               ;                        
            rx_c_frameId_1d            <=  {1'd0,rx_c_frameId}            ;                                
            rx_c_subframeId_1d         <=  rx_c_subframeId                ;                                        
            rx_c_slotID_1d             <=  rx_c_slotID                    ;
            rx_c_startsymbolid_1d      <=  rx_c_startsymbolid             ;
            rx_c_numberOfsections_1d   <=  rx_c_numberOfsections          ;
            rx_c_sectionId_1d          <=  rx_c_sectionId                 ;
            rx_c_rb_1d                 <=  rx_c_rb                        ;
            rx_c_startPrb_1d           <=  rx_c_startPrb                  ;
            rx_c_numPrb_1d             <=  rx_c_numPrb                    ;
            rx_sectionType_1d          <=  rx_sectionType                 ;
            rx_numSymbol_1d            <=  rx_numSymbol                   ;            
            rx_c_symInc_1d             <=  rx_c_symInc                    ;
            rx_c_framestructure_1d     <=  rx_c_framestructure            ;            
        end        
    end
    

    assign next_sf_arrived_posedge = next_sf_arrived_1d & ~ next_sf_arrived_2d ; // arrives at avst_sink_c_valid_7d

    always@ (posedge clk_eth)
    begin : FIRST_CPLANE_DETECT_LATCH
        if (rst_eth_n == 1'b0)                                 
            first_cplane_detect  <= 'd0 ;                        
        else if(ul_start_2d)
            if(rx_c_frameId_2d ^ rx_c_frameId_1d ) // detect next RFN boundary
                first_cplane_detect <= 1'b1;
    end


    // First valid uplane after cplane RFN boundary is detected.
    always @(posedge clk_eth)
    begin: FIRST_UPLANE_VALID_DETECT
    if(~rst_eth_n)
        first_uplane_detect <= 'd0;
    else if(first_cplane_detect)
        if(prach_data_received_1d & ~prach_data_received_2d)
            first_uplane_detect <= 'd1;
    end




    always @ (posedge clk_eth)
    begin:FIRST_CPLANE_POSEDGE_DETECT
        if(~rst_eth_n)
            first_cplane_detect_posedge <= 'd0;
        else if(first_cplane_detect & ~first_cplane_detect_1d)
            first_cplane_detect_posedge <= 'd1;
        else
            first_cplane_detect_posedge <= 'd0;
    end


    always @ (posedge clk_eth  )
    begin : NEXT_SF_LATCH
        if (rst_eth_n == 1'b0)                                 
            next_sf_arrived  <= 1'b0 ;        
        else if(next_sf_arrived_latch_clr_2d) // clear at idle state        
            next_sf_arrived  <= 1'b0;
        else if(first_cplane_detect)        
            if( (rx_c_slotID_2d ^ rx_c_slotID_1d) || (rx_c_subframeId_2d ^ rx_c_subframeId_1d) || (rx_c_frameId_2d ^ rx_c_frameId_1d) )                            
                next_sf_arrived  <= 1'b1;
    end


    always @ (posedge clk_eth  )
    begin : MEM_LOCATION_LATCH
        if (rst_eth_n == 1'b0)                                 
            wr_memory_location  <= 'd0 ;    
        else if(first_cplane_detect)
            if( (rx_c_slotID_2d ^ rx_c_slotID_1d) || (rx_c_subframeId_2d ^ rx_c_subframeId_1d) || (rx_c_frameId_2d ^ rx_c_frameId_1d) ) // detect next slot arrival                                                
                wr_memory_location  <= ~ wr_memory_location ; // Switch the double memory location based on the next SF arrival.0 means ping memory & 1 means pong memory.             
    end


    always @ (posedge clk_eth  )
    begin : NUMBER_OF_CPLANE_MESSAGES
        if (rst_eth_n == 1'b0)                                 
            Number_of_Cplane       <= 4'b0;
        else if(first_cplane_detect_posedge) //Number of Cplane to be incremented at the first cplane.
            Number_of_Cplane       <= 4'd1;
        else if(first_uplane_detect & prach_data_processed_2d & (Number_of_Cplane > 'd0))   // clear at idle state        
            Number_of_Cplane       <= Number_of_Cplane - 4'd1;
        else if(first_cplane_detect)
            if((rx_c_slotID_2d ^ rx_c_slotID_1d) || (rx_c_subframeId_2d ^ rx_c_subframeId_1d) || (rx_c_frameId_2d ^ rx_c_frameId_1d) )
                Number_of_Cplane        <= Number_of_Cplane + 4'd1;    
    end


    always @ (posedge clk_eth  )
    begin : EAXC_LATCH
        if (rst_eth_n == 1'b0) 
        begin                        
            rx_c_eaxc_id_latch  <= NUM_OF_ANT-1 ;
        end
        else if (avst_sink_c_valid_2d & avst_sink_c_startofpacket_2d)
        begin                                                
            rx_c_eaxc_id_latch  <= rx_c_rtc_id_2d [2:0]; // Take only the LSB 3 bits to write into AxC buffer 0 to 7
        end
    end
        
    always @ (posedge clk_eth  )
    begin : SYMBOL_ID_LATCH
        if (rst_eth_n == 1'b0) 
        begin                        
            rx_c_symbolid_latch  <= 'd0 ;
        end
        else if (avst_sink_c_valid_2d & avst_sink_c_startofpacket_2d)
        begin
            rx_c_symbolid_latch  <=  'd0;        // To Write in always Symbol 0 buffer as entire C plane carries information for all Symbols.    
        end
    end    
        
    always @ (posedge clk_eth  )
    begin : EAXC_RECEIVED
        if (rst_eth_n == 1'b0) 
        begin
            eaxc_received <= 'd0;
            invalid_PRACH_eAxC    <=  'd0;            
        end
        
        else if (avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d )
        begin                                                
            case(rx_c_rtc_id_1d)
                EAXC_ID_START+'d0: eaxc_received  <=  8'b00000001;
                EAXC_ID_START+'d1: eaxc_received  <=  8'b00000010;
                EAXC_ID_START+'d2: eaxc_received  <=  8'b00000100;
                EAXC_ID_START+'d3: eaxc_received  <=  8'b00001000;
                EAXC_ID_START+'d4: eaxc_received  <=  8'b00010000;
                EAXC_ID_START+'d5: eaxc_received  <=  8'b00100000;
                EAXC_ID_START+'d6: eaxc_received  <=  8'b01000000;
                EAXC_ID_START+'d7: eaxc_received  <=  8'b10000000;
            default: 
            begin
                eaxc_received             <= 'd0;
                invalid_PRACH_eAxC         <= 'd1;    
            end
            endcase    
        end

        else if(next_sf_arrived_posedge)
        begin
            invalid_PRACH_eAxC    <=  'd0;
        end    
        
        else if(prach_data_processed_2d) 
        begin
            invalid_PRACH_eAxC    <=  'd0;                    
        end
    end
    
    always @ (posedge clk_eth  )
    begin : Conduits_LATCH
        if (rst_eth_n == 1'b0) 
        begin                        
            meta_data_latch  <= 'd0 ;
        end
        else if (avst_sink_c_valid_2d)
        begin                                                
            meta_data_latch  <= {rx_c_dataDirection_2d,         //1'b   [127]
                                3'b0,                           //3'b   [126:124]  - PayloadVersion
                                rx_c_filterIndex_2d,            //4'b   [123:120]
                                rx_c_frameId_2d[7:0],           //8'b   [119:112]
                                rx_c_subframeId_2d,             //4'b   [111:108]
                                rx_c_slotID_2d,                 //6'b   [107:102]
                                rx_c_startsymbolid_2d,          //6'b   [101:96]
                                rx_c_numberOfsections_2d,       //8 'b  [95:88]
                                rx_sectionType_2d,              //8 'b  [87:80]
                                16'd0,                          //16'b  [79:64]  - udCompHdr,reserved
                                rx_c_sectionId_2d,              //12'b  [63:52]
                                rx_c_rb,                        //1'b   [51]
                                rx_c_symInc_2d,                 //1'b   [50]    
                                rx_c_startPrb_2d,               //10'b  [49:40]
                                rx_c_numPrb_2d,                 //8 'b  [39:32]
                                12'd0,                          //12'b  [31:20]     - reMask
                                rx_numSymbol_2d,                //4'b   [19:16]
                                rx_c_framestructure_2d,         //8'b   [15:8]   - framestructrure
                                eaxc_received }    ;            //8'b   [7:0]      - eaxc receive flag
        end
    end
        
    
    //Generate fdv ram
    generate
    genvar sym_num,ant_num;
    
        for(ant_num=0; ant_num < NUM_OF_ANT; ant_num = ant_num+1)
        begin:ANT_SLICE
    
            for(sym_num=0; sym_num < NUM_OF_SYM; sym_num = sym_num+1)
            begin:SYM_SLICE
        
        
                always @ (posedge clk_eth)
                begin : ETH_PIPE_DELAY
                    if (rst_eth_n == 1'b0) 
                    begin 
                        ram_writedata_1d    [ant_num][sym_num]  <= {ETH_DATAWIDTH{1'b0}}    ;
                        ram_writedata_2d    [ant_num][sym_num]  <= {ETH_DATAWIDTH{1'b0}}    ;
                        ram_writedata_3d    [ant_num][sym_num]  <= {ETH_DATAWIDTH{1'b0}}    ;
                        ram_writedata_4d    [ant_num][sym_num]  <= {ETH_DATAWIDTH{1'b0}}    ;
                        ram_writedata_5d    [ant_num][sym_num]  <= {ETH_DATAWIDTH{1'b0}}    ;
                        ram_wren_1d         [ant_num][sym_num]  <= 1'b0                     ;
                        ram_wren_2d         [ant_num][sym_num]  <= 1'b0                     ;
                        ram_wren_3d         [ant_num][sym_num]  <= 1'b0                     ;
                        ram_wren_4d         [ant_num][sym_num]  <= 1'b0                     ;
                        ram_wren_5d         [ant_num][sym_num]  <= 1'b0                     ;
                        ram_wraddress_1d    [ant_num][sym_num]  <= 'd0  ;
                        ram_wraddress_2d    [ant_num][sym_num]  <= 'd0  ;    
                        ram_rden_1d         [ant_num][sym_num]  <= 'd0  ;
                        ram_rden_2d         [ant_num][sym_num]  <= 'd0  ;
                        ram_rden_3d         [ant_num][sym_num]  <= 'd0  ;
                        ram_rden_4d         [ant_num][sym_num]  <= 'd0  ;
                        ram_rden_5d         [ant_num][sym_num]  <= 'd0  ;
                        ram_rden_6d         [ant_num][sym_num]  <= 'd0  ;
                        ram_rden_7d         [ant_num][sym_num]  <= 'd0  ;
                        ram_rden_8d         [ant_num][sym_num]  <= 'd0  ;
                        ram_rden_9d         [ant_num][sym_num]  <= 'd0  ;                
                    end 
                    else 
                    begin 
                        ram_writedata_1d    [ant_num][sym_num]  <= ram_writedata       [ant_num][sym_num]  ;
                        ram_writedata_2d    [ant_num][sym_num]  <= ram_writedata_1d    [ant_num][sym_num]  ;
                        ram_writedata_3d    [ant_num][sym_num]  <= ram_writedata_2d    [ant_num][sym_num]  ;
                        ram_writedata_4d    [ant_num][sym_num]  <= ram_writedata_3d    [ant_num][sym_num]  ;
                        ram_writedata_5d    [ant_num][sym_num]  <= ram_writedata_4d    [ant_num][sym_num]  ;
                        ram_wren_1d         [ant_num][sym_num]  <= ram_wren            [ant_num][sym_num]  ;
                        ram_wren_2d         [ant_num][sym_num]  <= ram_wren_1d         [ant_num][sym_num]  ;
                        ram_wren_3d         [ant_num][sym_num]  <= ram_wren_2d         [ant_num][sym_num]  ;
                        ram_wren_4d         [ant_num][sym_num]  <= ram_wren_3d         [ant_num][sym_num]  ;
                        ram_wren_5d         [ant_num][sym_num]  <= ram_wren_4d         [ant_num][sym_num]  ;
                        ram_wraddress_1d    [ant_num][sym_num]  <= ram_wraddress       [ant_num][sym_num]  ;
                        ram_wraddress_2d    [ant_num][sym_num]  <= ram_wraddress_1d    [ant_num][sym_num]  ;
                        ram_rdaddress_1d    [ant_num][sym_num]  <= ram_rdaddress       [ant_num][sym_num]  ;
                        ram_rdaddress_2d    [ant_num][sym_num]  <= ram_rdaddress_1d    [ant_num][sym_num]  ;
                        ram_rden_1d         [ant_num][sym_num]  <= ram_rden            [ant_num][sym_num]  ;
                        ram_rden_2d         [ant_num][sym_num]  <= ram_rden_1d         [ant_num][sym_num]  ;
                        ram_rden_3d         [ant_num][sym_num]  <= ram_rden_2d         [ant_num][sym_num]  ;
                        ram_rden_4d         [ant_num][sym_num]  <= ram_rden_3d         [ant_num][sym_num]  ;
                        ram_rden_5d         [ant_num][sym_num]  <= ram_rden_4d         [ant_num][sym_num]  ;
                        ram_rden_6d         [ant_num][sym_num]  <= ram_rden_5d         [ant_num][sym_num]  ;
                        ram_rden_7d         [ant_num][sym_num]  <= ram_rden_6d         [ant_num][sym_num]  ;
                        ram_rden_8d         [ant_num][sym_num]  <= ram_rden_7d         [ant_num][sym_num]  ;
                        ram_rden_9d         [ant_num][sym_num]  <= ram_rden_8d         [ant_num][sym_num]  ;
                        ram_readdata_1d     [ant_num][sym_num]  <= ram_readdata        [ant_num][sym_num]  ;
                        ram_readdata_2d     [ant_num][sym_num]  <= ram_readdata_1d     [ant_num][sym_num]  ;
                    end    
                end    
                
                //  Write Enable generation logic
                always @ (posedge clk_eth)
                begin : WRITE_EN
                        if (rst_eth_n == 1'b0) 
                            ram_wren [ant_num][sym_num] <=  1'b0    ;                            
                        else if((rx_c_eaxc_id_latch == ant_num) & (rx_c_symbolid_latch == sym_num))
                            ram_wren[ant_num][sym_num]  <= avst_sink_c_valid_3d ;                        
                end 
                           
            //  Write Data generation logic.
            
                always @ (posedge clk_eth)
                begin : WRITE_DATA                
                    if (rst_eth_n==1'b0)                    
                        ram_writedata    [ant_num][sym_num]  <=  128'b0;                    
                    else if (avst_sink_c_valid_3d)                    
                        ram_writedata    [ant_num][sym_num] <= meta_data_latch;        
                    else    
                        ram_writedata    [ant_num][sym_num]  <=  128'b0;                
                end            
            
            // Write address always Zero. pingpong selected based on WR/RD memory location
                always @ (posedge clk_eth)
                begin : WRITE_ADDRESS
                    if (rst_eth_n == 1'b0)                    
                        ram_wraddress       [ant_num][sym_num]  <= 'b0        ;                                   
                    else if (ram_wren_2d [ant_num][sym_num] & avst_sink_c_valid_6d & avst_sink_c_startofpacket_6d )                    
                        ram_wraddress       [ant_num][sym_num]  <= 'b0        ;                                                                
                    /* else if (ram_wren_2d[ant_num][sym_num])                    
                        ram_wraddress   [ant_num][sym_num]  <= ram_wraddress[ant_num][sym_num] + 1'b1 ;     */            
                end
                
            // Ping-pong memory 2 locations. 0th location for SF 0 and 1st location for SF1. SF2 will be replaced in SF0
                ram_128i_128o_2d_sc ul_cplane_fdv_buffer(
                    .data             (ram_writedata_4d [ant_num] [sym_num] ),     
                    .q                (ram_readdata     [ant_num] [sym_num] ),     
                    .wraddress        ({wr_memory_location_5d,ram_wraddress_2d [ant_num] [sym_num]} ), 
                    .rdaddress        ({rd_memory_location_7d,ram_rdaddress_2d [ant_num] [sym_num]} ), 
                    .wren             (ram_wren_4d      [ant_num] [sym_num] ), 
                    .clock            (clk_eth                              ),                     
                    .rden             (ram_rden_4d      [ant_num] [sym_num] )                    
                );            
           
                always @ (posedge clk_eth)
                begin : READ_EN
                    if (rst_eth_n == 1'b0) 
                        ram_rden [ant_num][sym_num]  <=  'b0  ;
                    else if ((ant_num == axc_number_2d) & (sym_num == symbol_number_2d))
                        ram_rden [ant_num][sym_num]  <=  fdv_read_enable_2d  ;
                end


                // Write address always Zero. pingpong selected based on WR/RD memory location            
                always @ (posedge clk_eth)
                begin : READ_ADDRESS
                    if (rst_eth_n == 1'b0) 
                        ram_rdaddress   [ant_num][sym_num]  <= 11'b0        ;
                /*     else if (read_address_clr_5d)
                        ram_rdaddress   [ant_num][sym_num]  <= 11'b0        ;
                    else if (ram_rden_2d [ant_num][sym_num])
                        ram_rdaddress   [ant_num][sym_num]  <= ram_rdaddress[ant_num][sym_num] + 1'b1 ; */
                end        
        
                // 12 clock cycle latency from FDV Buffer. 12 clock cycle to get meta_data_out once read_grant supplied 
                always @ (posedge clk_eth)
                begin : META_DATA_READ
                    if (rst_eth_n == 1'b0) 
                        begin
                        meta_data_valid   <= 'd0;    
                        meta_data_out     <= 'd0;    
                        end
                    else 
                        begin    
                        meta_data_valid    <= ram_rden_8d[axc_number_11d][symbol_number_11d];
                        meta_data_out      <= ram_readdata_2d [axc_number_11d_dup1][symbol_number_11d_dup1];                
                        end
                end    

                // 13 clock cycle to get num_symbol/start_symbol once read_grant supplied
                always @ (posedge clk_eth)
                begin : SECTION_DECODE
                    if (rst_eth_n == 1'b0) 
                        begin
                        num_symbol       <= 'd0;                    
                        numberOfsections <= 'd0;                    
                        start_symbol     <= 'd0;                    
                        end
                    else if(meta_data_valid)
                        begin                            
                        numberOfsections    <= 1'b0 ;      // No of sections for PRACH always one - 1;                    
                        num_symbol          <= meta_data_out[19:16]  ;            
                        start_symbol        <= meta_data_out[101:96] ;            
                        end
                end    
        
            end
        end    
    endgenerate
 

prach_fdv_read_state_machine instance_prach_fdv_read_state_machine
(
    .clk_in                      (clk_eth                    ),
    .rst_in_n                    (rst_eth_n                  ),
    .read_req                    (fdv_read_req               ),      // To trigger the State Machine 
    .numberOfsections            (numberOfsections           ),
    .num_symbol                  (num_symbol                 ),
    .start_symbol                (start_symbol               ),
    .read_grant                  (fdv_read_enable            ),  // To Start Read from FDV Buffer
    .section_count               (section_count              ),
    .axc_number                  (axc_number                 ),      // To Read Next EAxC
    .symbol_number               (symbol_number              ),    // To Read Next Symbol
    .rd_memory_location          (rd_memory_location         ),
    .read_address_clr            (read_address_clr           ),
    .next_sf_arrived_latch_clr   (next_sf_arrived_latch_clr  ),
    .last_sym_arrived            (last_sym_arrived_2d        ),
    .next_sf_arrived             (next_sf_arrived_2d         ),
    .last_sym_arrived_latch_clr  (last_sym_arrived_latch_clr ),
    .state                       (state                      ),
    .cc1_enable                  (cc1_enable                 ),
    .cc2_enable                  (cc2_enable                 )
);
    
    
assign fdv_read_req         = (output_fifo_usedw < (OUTPUT_FIFO_DEPTH-12) & prach_data_received_2d  & first_uplane_detect & (Number_of_Cplane>0));
assign output_fifo_wrreq    = meta_data_valid ;
assign output_fifo_data     = meta_data_out;
assign output_fifo_rdreq    = tx_uplane_metadata_ready & ~output_fifo_empty ;

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
    .aclr           (),
    .eccstatus      (),
    .full           (output_fifo_full       ),
    .empty          (output_fifo_empty      ),
    .almost_full    (),
    .almost_empty   ()
);

assign tx_uplane_metadata          =  output_fifo_q            ;
assign tx_uplane_metavalid         =  ~output_fifo_empty       ;


    always @ (posedge clk_eth)
    begin: STATUS_LATCH7
    if (rst_eth_n == 1'b0) 
        invalid_num_of_cplane <= 1'b0;
    else if(status_clear_2d)
        invalid_num_of_cplane <= 1'b0;
    else if (Number_of_Cplane > 4'd2)
        invalid_num_of_cplane <= 1'b1;
    end

//Cplane packet counter which resets at every radio frame.
always @ (posedge clk_eth)
begin
    if(rst_eth_n == 1'd0)
    begin
        cplane_rf_counter <= 'd1;
        cplane_statistics <= 'd0;
    end
    else if(rx_c_frameId_1d ^ rx_c_frameId_2d)
    begin
        cplane_rf_counter <= 'd1;
        cplane_statistics <= cplane_rf_counter;
    end
    else if(avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d)
    begin
        cplane_rf_counter <= cplane_rf_counter + 'd1;
        cplane_statistics <= cplane_statistics;
    end
    else
    begin
        cplane_rf_counter <= cplane_rf_counter;
        cplane_statistics <= cplane_statistics;
    end
end

//cplane stats added to statistics register
always @ (posedge clk_eth)
begin
    if(rst_eth_n == 1'b0)
        statistics_register <= 'd0;
    else
        statistics_register <= cplane_statistics;
end

    
    always @ (posedge clk_eth  )
    begin : STATUS_LATCH6
    if (rst_eth_n == 1'b0) 
        status_register <= 'd0;        
    else 
        status_register  <= {ul_start_2d,              
                             invalid_num_of_cplane,    
                             invalid_PRACH_eAxC,       
                             rd_memory_location,       
                             wr_memory_location,       
                             first_uplane_detect,      
                             first_cplane_detect,      
                             state};                    
    end

endmodule
