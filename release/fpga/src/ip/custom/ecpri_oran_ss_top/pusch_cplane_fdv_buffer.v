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
// File:        pusch_cplane_fdv_buffer.v
// Author:      Boobathi Selvaraj
// Description: Sub block of CU Plane coupling. 

//              Uplink C plane FDV Buffer to store the C plane packets from O-DU and read it based on availablity of uplink U plane packets from FFT  
//                It has 2 sub modules
//                1. C Plane Parser 
//                        This block checks the incoming packet data direction and Section type and passes to next block.
//                        data direction should be 0 for Uplink packets
//                        Section type should be 1 for CU plane coupling feature
//                2. State Machine for discreate read 
//                        Read address will keep switch based on No of sections / No of Axcs / No of Symbols                        
// ================================================================================ 
         
         
`timescale 1ns/1ns
 
module pusch_cplane_fdv_buffer
#(parameter NUM_OF_EAXC_PER_PORT  = 4,
  parameter NUM_OF_PHYSICAL_PORTS = 2,
  parameter EAXC_ID_START         = 0
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
    rx_c_slotId                         ,                        
    rx_c_startsymbolid                  , // Start of symbol  
    rx_c_numberOfsections               ,
    rx_c_symInc                         ,
    rx_c_sectionId                      , 
    rx_c_rb                             ,
    rx_c_startPrb                       ,  
    rx_c_numPrb                         ,
    rx_sectionType                      , 
    rx_numSymbol                        ,   
    tx_uplane_metadata_ready            ,
    tx_uplane_metadata                  ,                
    tx_uplane_metavalid                 ,                
    last_sym_arrived                    ,
    status_clear                        ,
    status_register                     ,
    statistics_register                 ,
    rx_c_subframeId_2d                  ,
    rx_c_slotId_2d                      ,
    sf_slot_match                       ,
    last_sym_arrived_latch_clr          ,
    ul_start                            ,
    first_cplane_detect                 ,
    uplane_slot_boundary                ,
    cc1_enable                          ,
    cc2_enable                          
);

//Parameters Declaration
parameter NUM_OF_ANT         =    NUM_OF_EAXC_PER_PORT * NUM_OF_PHYSICAL_PORTS         ;
parameter NUM_OF_SLOT        =    2         ;
parameter NUM_OF_SYM         =    14        ; 
parameter ETH_DATAWIDTH      =    128       ;
parameter CPLANE_DATAWIDTH   =    128       ;

localparam OUTPUT_FIFO_WIDTH    = 128 ;  //Width of the Final SC FIFO 
localparam OUTPUT_FIFO_DEPTH    = 256 ;  //To store atleaset 4 Symbol information

localparam  SLOT_INCREMENT_STATE = 'ha;

input                         clk_eth                              ;
input                         rst_eth_n                            ;

// Stream input
input                         avst_sink_c_valid                    ;
input                         avst_sink_c_endofpacket              ;
input                         avst_sink_c_startofpacket            ;
    
// C plane conduits data     
input wire                    rx_c_dataDirection                   ;
input wire [3:0]              rx_c_filterIndex                     ;
input wire [7:0]              rx_c_frameId                         ;
input wire [3:0]              rx_c_subframeId                      ;
input wire [5:0]              rx_c_slotId                          ;
input wire [5:0]              rx_c_startsymbolid                   ;
input wire [7:0]              rx_c_numberOfsections                ;
input wire [11:0]             rx_c_sectionId                       ;
input wire                    rx_c_rb                              ;
input wire                    rx_c_symInc                          ;
input wire [9:0]              rx_c_startPrb                        ;
input wire [7:0]              rx_c_numPrb                          ;
input wire [7:0]              rx_sectionType                       ;
input wire [3:0]              rx_numSymbol                         ;
input wire [15:0]             rx_c_rtc_id                          ;

// Stream output
output [CPLANE_DATAWIDTH-1:0] tx_uplane_metadata                   ;
output                        tx_uplane_metavalid                  ;
output reg [8:0]              status_register                      ;
output reg [11:0]             statistics_register                  ;
output wire                   last_sym_arrived_latch_clr           ;
reg                           sec_type1_cplane_detect              ;

output [3:0]                  rx_c_subframeId_2d                   ;

input                         tx_uplane_metadata_ready             ;
input                         last_sym_arrived                     ;
input                         status_clear                         ;
input                         sf_slot_match                        ;
input                         uplane_slot_boundary                 ;
input                         ul_start                             ;
// Internal Signals       
wire    [OUTPUT_FIFO_WIDTH-1: 0]        output_fifo_data           ;
wire                                    output_fifo_rdreq          ;
wire                                    output_fifo_wrreq          ;
wire    [OUTPUT_FIFO_WIDTH-1: 0]        output_fifo_q              ;
wire    [$clog2(OUTPUT_FIFO_DEPTH)-1:0] output_fifo_usedw          ;
wire                                    output_fifo_full           ;
wire                                    output_fifo_empty          ;

reg                           rx_c_dataDirection_1d                ;
reg [3:0]                     rx_c_filterIndex_1d                  ;
reg [8:0]                     rx_c_frameId_1d                      ;
reg [3:0]                     rx_c_subframeId_1d                   ;
reg [5:0]                     rx_c_slotId_1d                       ;
reg [5:0]                     rx_c_startsymbolid_1d                ;
reg [11:0]                    rx_c_sectionId_1d                    ;
reg                           rx_c_rb_1d                           ;
reg [9:0]                     rx_c_startPrb_1d                     ;
reg [7:0]                     rx_c_numPrb_1d                       ;
reg [7:0]                     rx_sectionType_1d                    ;
reg [3:0]                     rx_numSymbol_1d                      ;
reg [15:0]                    rx_c_rtc_id_1d                       ;
                  
reg                           rx_c_dataDirection_2d                ;
reg [3:0]                     rx_c_filterIndex_2d                  ;
reg [8:0]                     rx_c_frameId_2d                      ;
reg [3:0]                     rx_c_subframeId_2d                   ;
reg                           next_slot_arrived                    ;


output reg [5:0]              rx_c_slotId_2d                       ;
reg [5:0]                     rx_c_slotId_3d                       ;
reg [5:0]                     rx_c_slotId_4d                       ;

reg [5:0]                     rx_c_startsymbolid_2d                ;
reg [5:0]                     rx_c_symbolid_latch                  ;
reg [11:0]                    rx_c_sectionId_2d                    ;
reg                           rx_c_rb_2d                           ;
reg [9:0]                     rx_c_startPrb_2d                     ;
reg [7:0]                     rx_c_numPrb_2d                       ;
reg [7:0]                     rx_sectionType_2d                    ;
reg [7:0]                     numberOfsections                     ;
reg [7:0]                     rx_c_numberOfsections_1d             ;
reg [7:0]                     rx_c_numberOfsections_2d             ;
reg [3:0]                     rx_numSymbol_2d                      ;
reg [15:0]                    rx_c_rtc_id_2d                       ;
reg [15:0]                    rx_c_rtc_id_3d                       ;
reg [15:0]                    rx_c_rtc_id_4d                       ;
reg [15:0]                    rx_c_rtc_id_5d                       ;
reg [15:0]                    rx_c_rtc_id_6d                       ;
reg [15:0]                    rx_c_rtc_id_7d                       ;
reg [15:0]                    rx_c_rtc_id_8d                       ;

reg [15:0]                    rx_c_eaxc_id_latch                   ;

reg [CPLANE_DATAWIDTH-1:0]    meta_data_latch                      ;
reg [CPLANE_DATAWIDTH-1:0]    meta_data_out                        ;
reg                           meta_data_valid                      ;
reg                           meta_data_valid_1d                   ;

reg                           avst_sink_c_valid_1d                 ;
reg                           avst_sink_c_valid_2d                 ;
reg                           avst_sink_c_valid_3d                 ;
reg                           avst_sink_c_valid_4d                 ;
reg                           avst_sink_c_valid_5d                 ;
reg                           avst_sink_c_valid_6d                 ;
reg                           avst_sink_c_valid_7d                 ;
reg                           avst_sink_c_valid_8d                 ;

reg                           avst_sink_c_startofpacket_1d         ;
reg                           avst_sink_c_startofpacket_2d         ;
reg                           avst_sink_c_startofpacket_3d         ;
reg                           avst_sink_c_startofpacket_4d         ;
reg                           avst_sink_c_startofpacket_5d         ;
reg                           avst_sink_c_startofpacket_6d         ;
reg                           avst_sink_c_startofpacket_7d         ;
reg                           avst_sink_c_startofpacket_8d         ;

reg                           avst_sink_c_endofpacket_1d           ;
reg                           avst_sink_c_endofpacket_2d           ;
reg                           avst_sink_c_endofpacket_3d           ;
reg                           avst_sink_c_endofpacket_4d           ;
reg                           avst_sink_c_endofpacket_5d           ;
reg                           avst_sink_c_endofpacket_6d           ;

reg     [NUM_OF_SYM-1:0]           ram_wren            [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_wren_1d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_wren_2d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_wren_3d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_wren_4d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_wren_5d         [NUM_OF_ANT-1:0]                    ;
                                   
reg     [ETH_DATAWIDTH-1:0]        ram_writedata       [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]        ram_writedata_1d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]        ram_writedata_2d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]        ram_writedata_3d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]        ram_writedata_4d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]        ram_writedata_5d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
wire    [ETH_DATAWIDTH-1:0]        ram_readdata        [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]        ram_readdata_1d     [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [ETH_DATAWIDTH-1:0]        ram_readdata_2d     [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [NUM_OF_SYM-1:0]           ram_rden            [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_1d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_2d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_3d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_4d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_5d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_6d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_7d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_8d         [NUM_OF_ANT-1:0]                    ;
reg     [NUM_OF_SYM-1:0]           ram_rden_9d         [NUM_OF_ANT-1:0]                    ;
reg     [5:0]                      ram_wraddress       [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [5:0]                      ram_wraddress_1d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [5:0]                      ram_wraddress_2d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [5:0]                      ram_rdaddress       [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [5:0]                      ram_rdaddress_1d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;
reg     [5:0]                      ram_rdaddress_2d    [NUM_OF_ANT-1:0][NUM_OF_SYM-1:0]    ;

wire                                                       fdv_read_req                    ;
wire                                                       fdv_read_enable                 ;
reg                                                        fdv_read_enable_1d              ;
reg                                                        fdv_read_enable_2d              ;
reg                                                        rx_c_symInc_1d                  ;
reg                                                        rx_c_symInc_2d                  ;
reg                                                        rx_c_symInc_3d                  ;
reg                                                        rx_c_symInc_4d                  ;
reg                                                        rx_c_symInc_5d                  ;
reg                                                        rx_c_symInc_6d                  ;
wire   [7:0]                                               section_count                   ;
reg    [7:0]                                               section_count_1d                ;
reg    [7:0]                                               section_count_2d                ;
reg    [7:0]                                               section_count_3d                ;
reg    [7:0]                                               section_count_4d                ;
reg    [7:0]                                               section_count_5d                ;
reg    [7:0]                                               section_count_6d                ;
reg    [7:0]                                               section_count_7d                ;
reg    [7:0]                                               section_count_8d                ;
reg    [7:0]                                               section_count_9d                ;
reg    [7:0]                                               section_count_10d               ;
reg    [7:0]                                               section_count_11d               ;
reg    [7:0]                                               section_count_12d               ;
wire   [$clog2(NUM_OF_SYM)-1:0]                            symbol_number                   ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_1d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_2d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_3d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_4d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_5d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_6d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_7d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_8d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_9d                ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_10d               ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_11d               ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_11d_dup1          ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_11d_dup2          ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_11d_dup3          ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_11d_dup4          ;
reg    [$clog2(NUM_OF_SYM)-1:0]                            symbol_number_11d_dup5          ;
wire   [$clog2(NUM_OF_ANT)-1:0]                            axc_number                      ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_1d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_2d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_3d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_4d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_5d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_6d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_7d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_8d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_9d                   ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_10d                  ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_11d                  ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_11d_dup1             ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_11d_dup2             ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_11d_dup3             ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_11d_dup4             ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_11d_dup5             ;
reg    [$clog2(NUM_OF_ANT)-1:0]                            axc_number_12d                  ;
             
wire                                                       rd_memory_location              ;
reg                                                        rd_memory_location_1d           ;
reg                                                        rd_memory_location_2d           ;
reg                                                        rd_memory_location_3d           ;
reg                                                        rd_memory_location_4d           ;
reg                                                        rd_memory_location_5d           ;
reg                                                        rd_memory_location_6d           ;
reg                                                        rd_memory_location_7d           ;
reg                                                        rd_memory_location_8d           ;
reg                                                        rd_memory_location_9d           ;
reg                                                        rd_memory_location_10d          ;
reg                                                        rd_memory_location_11d          ;
                            
reg                                                        wr_memory_location              ;
reg                                                        wr_memory_location_1d           ;
reg                                                        wr_memory_location_2d           ;
reg                                                        wr_memory_location_3d           ;
reg                                                        wr_memory_location_4d           ;
reg                                                        wr_memory_location_5d           ;
                            
wire                                                       read_address_clr                ;
wire                                                       next_slot_arrived_latch_clr     ;
reg                                                        read_address_clr_1d             ;
reg                                                        next_slot_arrived_latch_clr_1d  ;
reg                                                        read_address_clr_2d             ;
reg                                                        next_slot_arrived_latch_clr_2d  ;
reg                                                        read_address_clr_3d             ;
reg                                                        read_address_clr_4d             ;
reg                                                        read_address_clr_5d             ;
reg                                                        next_slot_arrived_1d            ;
reg                                                        next_slot_arrived_2d            ;
reg                                                        last_sym_arrived_1d             ;
reg                                                        last_sym_arrived_2d             ;

reg                                                        status_clear_1d                 ;
reg                                                        status_clear_2d                 ;
wire                                                       next_slot_arrived_posedge       ;
reg                                                        fifo_full                       ;
reg                                                        sf_slot_match_1d                ;
reg                                                        sf_slot_match_2d                ;
reg                                                        sf_slot_match_3d                ;
reg                                                        uplane_slot_boundary_1d         ;
reg                                                        uplane_slot_boundary_2d         ; 
reg                                                        uplane_slot_boundary_3d         ;    
wire [3:0]                                                 state                           ;
output reg                                                 first_cplane_detect             ;
reg                                                        ul_start_1d                     ;
reg                                                        ul_start_2d                     ;
input                                                      cc1_enable                      ;
input                                                      cc2_enable                      ;
                            
reg [(NUM_OF_SYM*4)-1:0]                                   sym_eaxc_map[15:0]              ;
wire                                                       blank_eaxc_sym                  ;
reg                                                        blank_eaxc_sym_1d               ;
wire                                                       sym_eaxc_map_latch_clr          ;
reg                                                        sym_eaxc_map_latch_clr_1d       ;
reg                                                        sym_eaxc_map_latch_clr_2d       ;
reg [7:0]                                                  map_address                     ;
wire [(NUM_OF_SYM*4)-1:0]                                  map_table_out                   ;
reg [7:0]                                                  map_address_1d                  ;
reg [(NUM_OF_SYM*4)-1:0]                                   map_table_out_1d                ;
reg [7:0]                                                  map_address_2d                  ;
reg [(NUM_OF_SYM*4)-1:0]                                   map_table_out_2d                ;
reg                                                        cplane_fdv_read_valid           ;
wire [((NUM_OF_SYM*4)*(NUM_OF_ANT*NUM_OF_SLOT))-1:0]       sym_eaxc_map_flat               ;

//PRB Blank Registers
reg [8:0]                                                  no_of_blank_prbs                ;
reg [8:0]                                                  last_prb_in_section             ;
reg                                                        last_section                    ;
reg                                                        first_section                   ;
reg [11:0]                                                 cplane_rf_counter               ;
reg [11:0]                                                 cplane_statistics               ; 

//PIPELINE REGISTERS
    always @ (posedge clk_eth  )
    begin : PIPE_DELAY
        if (rst_eth_n == 1'b0) 
        begin 
            
            avst_sink_c_valid_2d                      <=  'd0  ;  
            avst_sink_c_valid_3d                      <=  'd0  ;  
            avst_sink_c_valid_3d                      <=  'd0  ; 
            avst_sink_c_valid_4d                      <=  'd0  ; 
            avst_sink_c_valid_5d                      <=  'd0  ; 
            avst_sink_c_valid_6d                      <=  'd0  ; 
            avst_sink_c_valid_7d                      <=  'd0  ; 
            avst_sink_c_valid_8d                      <=  'd0  ; 

            avst_sink_c_startofpacket_2d              <=  'd0  ;  
            avst_sink_c_startofpacket_3d              <=  'd0  ;  
            avst_sink_c_startofpacket_4d              <=  'd0  ;  
            avst_sink_c_startofpacket_5d              <=  'd0  ;  
            avst_sink_c_startofpacket_6d              <=  'd0  ;  
            avst_sink_c_startofpacket_7d              <=  'd0  ;
            avst_sink_c_startofpacket_8d              <=  'd0  ;

            avst_sink_c_endofpacket_2d                <=  'd0  ;  
            avst_sink_c_endofpacket_3d                <=  'd0  ;  
            avst_sink_c_endofpacket_4d                <=  'd0  ;  
            avst_sink_c_endofpacket_5d                <=  'd0  ;  
            avst_sink_c_endofpacket_6d                <=  'd0  ;  
                                                             
            rx_c_rtc_id_2d                            <=  'd0  ;
            rx_c_rtc_id_3d                            <=  'd0  ;
            rx_c_rtc_id_4d                            <=  'd0  ;
            rx_c_rtc_id_5d                            <=  'd0  ;
            rx_c_rtc_id_6d                            <=  'd0  ;
            rx_c_rtc_id_7d                            <=  'd0  ;
            rx_c_rtc_id_8d                            <=  'd0  ;
	    	    
            rx_c_dataDirection_2d                     <=  'd0  ;        
            rx_c_filterIndex_2d                       <=  'd0  ;    
            rx_c_frameId_2d                           <=  'd256;    
            rx_c_subframeId_2d                        <=  'd10 ;
            rx_c_slotId_2d                            <=  'd2  ;
            rx_c_startsymbolid_2d                     <=  'd0  ;
            rx_c_numberOfsections_2d                  <=  'd0  ;
            rx_c_sectionId_2d                         <=  'd0  ;
            rx_c_rb_2d                                <=  'd0  ;
            rx_c_startPrb_2d                          <=  'd0  ;
            rx_c_numPrb_2d                            <=  'd0  ;
            rx_sectionType_2d                         <=  'd0  ;
            rx_numSymbol_2d                           <=  'd0  ;

            rx_c_slotId_3d                            <=  'd0  ;
            rx_c_slotId_4d                            <=  'd0  ;

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
            next_slot_arrived_1d                      <=  'd0  ;
            next_slot_arrived_2d                      <=  'd0  ;
            last_sym_arrived_1d                       <=  'd0  ; 
            last_sym_arrived_2d                       <=  'd0  ;     
            next_slot_arrived_latch_clr_1d            <=  'd0  ;
            next_slot_arrived_latch_clr_2d            <=  'd0  ;
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
            ul_start_1d                               <=  'd0  ;
            ul_start_2d                               <=  'd0  ;
            sf_slot_match_1d                          <=  'd0  ;
            sf_slot_match_2d                          <=  'd0  ;
            sf_slot_match_3d                          <=  'd0  ;
            sym_eaxc_map_latch_clr_1d                 <=  'd0  ;
            sym_eaxc_map_latch_clr_2d                 <=  'd0  ;
            uplane_slot_boundary_1d                   <=  'd0  ;
            uplane_slot_boundary_2d                   <=  'd0  ;
            uplane_slot_boundary_3d                   <=  'd0  ;
            blank_eaxc_sym_1d                         <=  'd0  ;
            map_table_out_1d                          <=  'd0  ;
            map_table_out_2d                          <=  'd0  ;
            map_address_1d                            <=  'd0  ;
            map_address_2d                            <=  'd0  ;
        end
        else 
        begin 
              
            avst_sink_c_valid_2d                      <=  avst_sink_c_valid_1d               ;    
            avst_sink_c_valid_3d                      <=  avst_sink_c_valid_2d               ;    
            avst_sink_c_valid_4d                      <=  avst_sink_c_valid_3d               ;    
            avst_sink_c_valid_5d                      <=  avst_sink_c_valid_4d               ;    
            avst_sink_c_valid_6d                      <=  avst_sink_c_valid_5d               ;    
            avst_sink_c_valid_7d                      <=  avst_sink_c_valid_6d               ;    
            avst_sink_c_valid_8d                      <=  avst_sink_c_valid_7d               ;
			
            avst_sink_c_startofpacket_2d              <=  avst_sink_c_startofpacket_1d       ;      
            avst_sink_c_startofpacket_3d              <=  avst_sink_c_startofpacket_2d       ;      
            avst_sink_c_startofpacket_4d              <=  avst_sink_c_startofpacket_3d       ;      
            avst_sink_c_startofpacket_5d              <=  avst_sink_c_startofpacket_4d       ;      
            avst_sink_c_startofpacket_6d              <=  avst_sink_c_startofpacket_5d       ;
            avst_sink_c_startofpacket_7d              <=  avst_sink_c_startofpacket_6d       ;      
            avst_sink_c_startofpacket_8d              <=  avst_sink_c_startofpacket_7d       ;			
                       
            avst_sink_c_endofpacket_2d                <=  avst_sink_c_endofpacket_1d         ;  
            avst_sink_c_endofpacket_3d                <=  avst_sink_c_endofpacket_2d         ;  
            avst_sink_c_endofpacket_4d                <=  avst_sink_c_endofpacket_3d         ;  
            avst_sink_c_endofpacket_5d                <=  avst_sink_c_endofpacket_4d         ;  
            avst_sink_c_endofpacket_6d                <=  avst_sink_c_endofpacket_5d         ;  
                                                                                             
            rx_c_rtc_id_2d                            <=  rx_c_rtc_id_1d                     ;
            rx_c_rtc_id_3d                            <=  rx_c_rtc_id_2d                     ;
            rx_c_dataDirection_2d                     <=  rx_c_dataDirection_1d              ;                                    
            rx_c_filterIndex_2d                       <=  rx_c_filterIndex_1d                ;                                    
            rx_c_frameId_2d                           <=  rx_c_frameId_1d                    ;                                    
            rx_c_subframeId_2d                        <=  rx_c_subframeId_1d                 ;
            rx_c_slotId_2d                            <=  rx_c_slotId_1d                     ;
            rx_c_startsymbolid_2d                     <=  rx_c_startsymbolid_1d              ;
            rx_c_numberOfsections_2d                  <=  rx_c_numberOfsections_1d           ;
            rx_c_sectionId_2d                         <=  rx_c_sectionId_1d                  ;
            rx_c_rb_2d                                <=  rx_c_rb_1d                         ;
            rx_c_startPrb_2d                          <=  rx_c_startPrb_1d                   ;
            rx_c_numPrb_2d                            <=  rx_c_numPrb_1d                     ;
            rx_sectionType_2d                         <=  rx_sectionType_1d                  ;
            rx_numSymbol_2d                           <=  rx_numSymbol_1d                    ;

            symbol_number_1d                          <=  symbol_number                      ;
            symbol_number_2d                          <=  symbol_number_1d                   ;
            symbol_number_3d                          <=  symbol_number_2d                   ;
            symbol_number_4d                          <=  symbol_number_3d                   ;
            symbol_number_5d                          <=  symbol_number_4d                   ;
            symbol_number_6d                          <=  symbol_number_5d                   ;
            symbol_number_7d                          <=  symbol_number_6d                   ;
            symbol_number_8d                          <=  symbol_number_7d                   ;
            symbol_number_9d                          <=  symbol_number_8d                   ;
            symbol_number_10d                         <=  symbol_number_9d                   ;
            symbol_number_11d                         <=  symbol_number_10d                  ;
            symbol_number_11d_dup1                    <=  symbol_number_10d                  ;
            symbol_number_11d_dup2                    <=  symbol_number_10d                  ;
            symbol_number_11d_dup3                    <=  symbol_number_10d                  ;
            symbol_number_11d_dup4                    <=  symbol_number_10d                  ;
            symbol_number_11d_dup5                    <=  symbol_number_10d                  ;            
            section_count_1d                          <=  section_count                      ;
            section_count_2d                          <=  section_count_1d                   ;
            section_count_3d                          <=  section_count_2d                   ;
            section_count_4d                          <=  section_count_3d                   ;
            section_count_5d                          <=  section_count_4d                   ;
            section_count_6d                          <=  section_count_5d                   ;
            section_count_7d                          <=  section_count_6d                   ;
            section_count_8d                          <=  section_count_7d                   ;
            section_count_9d                          <=  section_count_8d                   ;
            section_count_10d                         <=  section_count_9d                   ;
            section_count_11d                         <=  section_count_10d                  ;            
            section_count_12d                         <=  section_count_11d                  ;            
            axc_number_1d                             <=  axc_number                         ;
            axc_number_2d                             <=  axc_number_1d                      ;
            axc_number_3d                             <=  axc_number_2d                      ;
            axc_number_4d                             <=  axc_number_3d                      ;
            axc_number_5d                             <=  axc_number_4d                      ;
            axc_number_6d                             <=  axc_number_5d                      ;
            axc_number_7d                             <=  axc_number_6d                      ;
            axc_number_8d                             <=  axc_number_7d                      ;
            axc_number_9d                             <=  axc_number_8d                      ;
            axc_number_10d                            <=  axc_number_9d                      ;
            axc_number_11d                            <=  axc_number_10d                     ;
            axc_number_11d_dup1                       <=  axc_number_10d                     ;
            axc_number_11d_dup2                       <=  axc_number_10d                     ;
            axc_number_11d_dup3                       <=  axc_number_10d                     ;
            axc_number_11d_dup4                       <=  axc_number_10d                     ;
            axc_number_11d_dup5                       <=  axc_number_10d                     ;
            rd_memory_location_1d                     <=  rd_memory_location                 ;
            rd_memory_location_2d                     <=  rd_memory_location_1d              ;
            rd_memory_location_3d                     <=  rd_memory_location_2d              ;
            rd_memory_location_4d                     <=  rd_memory_location_3d              ;
            rd_memory_location_5d                     <=  rd_memory_location_4d              ;
            rd_memory_location_6d                     <=  rd_memory_location_5d              ;
            rd_memory_location_7d                     <=  rd_memory_location_6d              ;
            rd_memory_location_8d                     <=  rd_memory_location_7d              ;
            rd_memory_location_9d                     <=  rd_memory_location_8d              ;
            rd_memory_location_10d                    <=  rd_memory_location_9d              ;
            rd_memory_location_11d                    <=  rd_memory_location_10d             ;
            wr_memory_location_1d                     <=  wr_memory_location                 ;
            wr_memory_location_2d                     <=  wr_memory_location_1d              ;
            wr_memory_location_3d                     <=  wr_memory_location_2d              ;
            wr_memory_location_4d                     <=  wr_memory_location_3d              ;
            wr_memory_location_5d                     <=  wr_memory_location_4d              ;
            fdv_read_enable_1d                        <=  fdv_read_enable                    ;
            fdv_read_enable_2d                        <=  fdv_read_enable_1d                 ;
            rx_c_symInc_2d                            <=  rx_c_symInc_1d                     ;
            rx_c_symInc_3d                            <=  rx_c_symInc_2d                     ;
            rx_c_symInc_4d                            <=  rx_c_symInc_3d                     ;
            rx_c_symInc_5d                            <=  rx_c_symInc_4d                     ;
            rx_c_symInc_6d                            <=  rx_c_symInc_5d                     ;
            read_address_clr_1d                       <=  read_address_clr                   ;
            read_address_clr_2d                       <=  read_address_clr_1d                ;
            read_address_clr_3d                       <=  read_address_clr_2d                ;
            read_address_clr_4d                       <=  read_address_clr_3d                ;
            read_address_clr_5d                       <=  read_address_clr_4d                ;              
            next_slot_arrived_1d                      <=  next_slot_arrived                  ;    
            next_slot_arrived_2d                      <=  next_slot_arrived_1d               ;    
            last_sym_arrived_1d                       <=  last_sym_arrived                   ;    
            last_sym_arrived_2d                       <=  last_sym_arrived_1d                ;      
            next_slot_arrived_latch_clr_1d            <=  next_slot_arrived_latch_clr        ;
            next_slot_arrived_latch_clr_2d            <=  next_slot_arrived_latch_clr_1d     ;
            status_clear_1d                           <=  status_clear                       ;
            status_clear_2d                           <=  status_clear_1d                    ;
            meta_data_valid_1d                        <=  meta_data_valid                    ;
            ul_start_1d                               <=  ul_start                           ;
            ul_start_2d                               <=  ul_start_1d                        ;
            sf_slot_match_1d                          <=  sf_slot_match                      ;
            sf_slot_match_2d                          <=  sf_slot_match_1d                   ;
            sf_slot_match_3d                          <=  sf_slot_match_2d                   ;
            uplane_slot_boundary_1d                   <=  uplane_slot_boundary               ;
            uplane_slot_boundary_2d                   <=  uplane_slot_boundary_1d            ;
            uplane_slot_boundary_3d                   <=  uplane_slot_boundary_2d            ;
            sym_eaxc_map_latch_clr_1d                 <=  sym_eaxc_map_latch_clr             ;
            sym_eaxc_map_latch_clr_2d                 <=  sym_eaxc_map_latch_clr_1d          ;
            rx_c_slotId_3d                            <=  rx_c_slotId_2d                     ;
            rx_c_slotId_4d                            <=  rx_c_slotId_3d                     ;
            rx_c_rtc_id_4d                            <=  rx_c_rtc_id_3d                     ;
            rx_c_rtc_id_5d                            <=  rx_c_rtc_id_4d                     ;
            rx_c_rtc_id_6d                            <=  rx_c_rtc_id_5d                     ;
            rx_c_rtc_id_7d                            <=  rx_c_rtc_id_6d                     ;
            rx_c_rtc_id_8d                            <=  rx_c_rtc_id_7d                     ;

            blank_eaxc_sym_1d                         <=  blank_eaxc_sym                     ;
			
            map_address_1d                            <=  map_address                        ;
            map_address_2d                            <=  map_address_1d                     ;
            map_table_out_1d                          <=  map_table_out                      ;
            map_table_out_2d                          <=  map_table_out_1d                   ;
        end      
    end
     
always @ (posedge clk_eth  )
    begin : VALID_CPLANE_DETECT1
        if (rst_eth_n == 1'b0) 
        begin            
            avst_sink_c_valid_1d           <=  'd0                        ;
            avst_sink_c_startofpacket_1d   <=  'd0                        ;  
            avst_sink_c_endofpacket_1d     <=  'd0                        ; 
        end
        else if (avst_sink_c_valid & (rx_c_dataDirection == 'd0) & (rx_sectionType == 'd1) )
        begin
            avst_sink_c_valid_1d           <=  avst_sink_c_valid          ;
            avst_sink_c_startofpacket_1d   <=  avst_sink_c_startofpacket  ;
            avst_sink_c_endofpacket_1d     <=  avst_sink_c_endofpacket    ;
        end
        else
        begin
            avst_sink_c_valid_1d           <=  'd0                        ;
            avst_sink_c_startofpacket_1d   <=  'd0                        ;  
            avst_sink_c_endofpacket_1d     <=  'd0                        ; 
        end        
    end
    
    always @ (posedge clk_eth  )
    begin : VALID_CPLANE_DETECT2
        if (rst_eth_n == 1'b0) 
        begin                        
            rx_c_rtc_id_1d             <=  'd0                            ;
            rx_c_dataDirection_1d      <=  'd0                            ;
            rx_c_filterIndex_1d        <=  'd0                            ;
            rx_c_frameId_1d            <=  'd256                          ;
            rx_c_subframeId_1d         <=  'd10                           ;
            rx_c_slotId_1d             <=  'd2                            ;
            rx_c_startsymbolid_1d      <=  'd0                            ;
            rx_c_numberOfsections_1d   <=  'd0                            ;
            rx_c_sectionId_1d          <=  'd0                            ;
            rx_c_rb_1d                 <=  'd0                            ;
            rx_c_startPrb_1d           <=  'd0                            ;
            rx_c_numPrb_1d             <=  'd0                            ;
            rx_sectionType_1d          <=  'd0                            ;
            rx_numSymbol_1d            <=  'd0                            ;
            rx_c_symInc_1d             <=  'd0                            ;
        end
        else if (avst_sink_c_valid & (rx_c_dataDirection == 'd0) & (rx_sectionType == 'd1) )
        begin                                                
            rx_c_rtc_id_1d             <=  rx_c_rtc_id                    ;
            rx_c_dataDirection_1d      <=  rx_c_dataDirection             ;
            rx_c_filterIndex_1d        <=  rx_c_filterIndex               ;
            rx_c_frameId_1d            <=  {1'd0,rx_c_frameId}            ;
            rx_c_subframeId_1d         <=  rx_c_subframeId                ;
            rx_c_slotId_1d             <=  rx_c_slotId                    ;
            rx_c_startsymbolid_1d      <=  rx_c_startsymbolid             ;
            rx_c_numberOfsections_1d   <=  rx_c_numberOfsections          ;
            rx_c_sectionId_1d          <=  rx_c_sectionId                 ;
            rx_c_rb_1d                 <=  rx_c_rb                        ;
            rx_c_startPrb_1d           <=  rx_c_startPrb                  ;
            rx_c_numPrb_1d             <=  rx_c_numPrb                    ;
            rx_sectionType_1d          <=  rx_sectionType                 ;
            rx_numSymbol_1d            <=  rx_numSymbol                   ;
            rx_c_symInc_1d             <=  rx_c_symInc                    ;
        end
        else if(~sf_slot_match_2d & sf_slot_match_3d ) //Reset Latch condition of metadata when there is no C-plane message.
        begin
            rx_c_rtc_id_1d             <=  'd0                            ;
            rx_c_dataDirection_1d      <=  'd0                            ;
            rx_c_filterIndex_1d        <=  'd0                            ;
            rx_c_frameId_1d            <=  'd256                          ;
            rx_c_subframeId_1d         <=  'd10                           ;
            rx_c_slotId_1d             <=  'd2                            ;
            rx_c_startsymbolid_1d      <=  'd0                            ;
            rx_c_numberOfsections_1d   <=  'd0                            ;
            rx_c_sectionId_1d          <=  'd0                            ;
            rx_c_rb_1d                 <=  'd0                            ;
            rx_c_startPrb_1d           <=  'd0                            ;
            rx_c_numPrb_1d             <=  'd0                            ;
            rx_sectionType_1d          <=  'd0                            ;
            rx_numSymbol_1d            <=  'd0                            ;
            rx_c_symInc_1d             <=  'd0                            ;
        end
    end
        
    assign next_slot_arrived_posedge = next_slot_arrived_1d & ~ next_slot_arrived_2d ;

    
    always@ (posedge clk_eth)
    begin : FIRST_CPLANE_DETECT_LATCH
        if (rst_eth_n == 1'b0)
            first_cplane_detect  <= 'd0 ;
        else if(ul_start_2d & avst_sink_c_valid_1d)
            if(rx_c_frameId_2d ^ rx_c_frameId_1d ) // detect next slot arrival        
                first_cplane_detect <= 1'b1;
    end


    always @ (posedge clk_eth  )
    begin : NEXT_SLOT_LATCH
        if (rst_eth_n == 1'b0)                                 
            next_slot_arrived  <= 1'b0 ;        
        else if(next_slot_arrived_latch_clr_2d) // clear at idle state        
            next_slot_arrived  <= 1'b0;
        else if(first_cplane_detect & avst_sink_c_valid_1d)        
            if( (rx_c_slotId_2d ^ rx_c_slotId_1d) || (rx_c_subframeId_2d ^ rx_c_subframeId_1d) || (rx_c_frameId_2d ^ rx_c_frameId_1d) )                            
                next_slot_arrived  <= 1'b1;
    end

    always @ (posedge clk_eth  )
    begin : MEM_LOCATION_LATCH
        if (rst_eth_n == 1'b0)
            wr_memory_location  <= 'd0 ;
        else if(first_cplane_detect & avst_sink_c_valid_1d)
            if( (rx_c_slotId_2d ^ rx_c_slotId_1d) || (rx_c_subframeId_2d ^ rx_c_subframeId_1d) || (rx_c_frameId_2d ^ rx_c_frameId_1d) ) // detect next slot arrival                                                
                wr_memory_location  <= ~ wr_memory_location ; // Switch the double memory location based on the next SF arrival.0 means ping memory & 1 means pong memory.             
    end

    integer idx;
    always @ (posedge clk_eth )
    begin: SYM_EAXC_MAP_TABLE
        if(~rst_eth_n)
        begin
            for(idx =0; idx <(NUM_OF_ANT*NUM_OF_SLOT); idx=idx+1)
                sym_eaxc_map[idx]  = 56'd0;
        end
        else if(~first_cplane_detect)
        begin
            for(idx = 0; idx < (NUM_OF_ANT*NUM_OF_SLOT); idx=idx+1)
                sym_eaxc_map[idx] = 56'd0;
        end
        else if(avst_sink_c_valid_8d & avst_sink_c_startofpacket_8d)
        begin
            sym_eaxc_map[{wr_memory_location,rx_c_rtc_id_8d[2:0]}] <= sym_eaxc_map[{wr_memory_location,rx_c_rtc_id_8d[2:0]}] | map_table_out_2d;
        end
        else if(sym_eaxc_map_latch_clr_1d & ~sym_eaxc_map_latch_clr_2d)
        begin
            if(rd_memory_location)
            begin
                for(idx =0; idx <(NUM_OF_ANT); idx=idx+1)
                    sym_eaxc_map[idx]  = 56'd0;
            end
            else
            begin
                for(idx =(NUM_OF_ANT); idx <(NUM_OF_ANT*NUM_OF_SLOT); idx=idx+1)
                    sym_eaxc_map[idx] = 56'd0;
            end
        end

    end


    //Flatten 2D Array sym_eaxc_map to 1D to pass to pusch_fdv_read_state_machine module
    genvar i;
    generate
        for (i = 0; i < (NUM_OF_ANT*NUM_OF_SLOT); i = i+1) 
        begin:FLATTEN
            assign sym_eaxc_map_flat[56*i +: 56] = sym_eaxc_map[i]; 
        end
    endgenerate


    always @ (posedge clk_eth )
    begin: MAP_ADDRESS_LATCH
        if(~rst_eth_n)
        begin
            map_address <= 'd0;
        end
        else if(avst_sink_c_valid_1d & avst_sink_c_startofpacket_1d)
        begin
            map_address <= {rx_c_startsymbolid_1d[3:0],rx_numSymbol_1d[3:0]};
        end
    end


    rom_8i_56o_256d_sc symbol_eaxc_map_table_inst(  .address(map_address_2d  ),
                                                    .clock  (clk_eth         ),
                                                    .q      (map_table_out   ),
                                                    .rden   (avst_sink_c_valid_4d & avst_sink_c_startofpacket_4d)
                                                    );


    always @ (posedge clk_eth)
    begin: FDV_READ_ENABLE_VALID
    if(~rst_eth_n)
        cplane_fdv_read_valid <= 'd0;
    else if(uplane_slot_boundary_3d & sf_slot_match_2d)
        cplane_fdv_read_valid <= 'd1;
    else if(state == (SLOT_INCREMENT_STATE))
        cplane_fdv_read_valid <= 'd0;
    end


    always @ (posedge clk_eth  )
    begin : EAXC_LATCH
        if (rst_eth_n == 1'b0) 
        begin                        
            rx_c_eaxc_id_latch  <= NUM_OF_ANT-1 ;
        end
        else if (avst_sink_c_valid_2d & avst_sink_c_startofpacket_2d)
        begin                                                
            rx_c_eaxc_id_latch  <= rx_c_rtc_id_2d[2:0] ;
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
            rx_c_symbolid_latch  <=  rx_c_startsymbolid_2d ;
        end
    end      
    


    
    // Compute the sum of start prb and num prb of previous section
    always @ (posedge clk_eth)
    begin: LAST_PRB_CALCULATION
        if(~rst_eth_n)
        begin
            last_prb_in_section <= 'd0;
        end
        else if(avst_sink_c_valid_1d)
        begin
            if(avst_sink_c_endofpacket_1d)
                last_prb_in_section <= 'd0;
            else 
                last_prb_in_section <= rx_c_startPrb_1d + rx_c_numPrb_1d;
        end
    end

    // Compute no of blanked prbs from startprb and numprb
    always @ (posedge clk_eth)
    begin
        if(~rst_eth_n)
        begin
            no_of_blank_prbs <= 'd0;
            first_section <= 'd0;
        end
        else if(avst_sink_c_valid_1d)
        begin
            if(avst_sink_c_startofpacket_1d)
            begin
                no_of_blank_prbs <= rx_c_startPrb_1d;
                first_section <= 'd1;   
            end
            else
            begin
                if(last_prb_in_section == rx_c_startPrb_1d)
                begin
                    no_of_blank_prbs <= 'd0;
                    first_section <= 'd0;
                end
                else
                begin
                    no_of_blank_prbs <= rx_c_startPrb_1d - last_prb_in_section;
                    first_section <= 'd0;
                end
            end
        end
        else
        begin
            no_of_blank_prbs <= 'd0;
            first_section <= 'd0;
        end 
    end

    always @ (posedge clk_eth)
    begin: LAST_SECTION
        if(~rst_eth_n)
            last_section <= 'd0;
        else if(avst_sink_c_valid_1d & avst_sink_c_endofpacket_1d)
            last_section <= 'd1;
        else 
            last_section <= 'd0;
    end


    always @ (posedge clk_eth  )
    begin : Conduits_LATCH
        if (rst_eth_n == 1'b0) 
        begin                        
            meta_data_latch  <= 'd0 ;
        end
        else if (avst_sink_c_valid_2d)
        begin                                                
            meta_data_latch  <= {rx_c_dataDirection_2d,      //1'b   [127]
                                 3'b0,                       //3'b   [126:124]   - PayloadVersion
                                 rx_c_filterIndex_2d,        //4'b   [123:120]
                                 rx_c_frameId_2d[7:0],       //8'b   [119:112]
                                 rx_c_subframeId_2d,         //4'b   [111:108]
                                 rx_c_slotId_2d,             //6'b   [107:102]
                                 rx_c_startsymbolid_2d,      //6'b   [101:96]
                                 rx_c_numberOfsections_2d,   //8'b   [95:88]
                                 rx_sectionType_2d,          //8'b   [87:80]
                                 16'd0,                      //16'b  [79:64]     - udCompHdr,reserved
                                 rx_c_sectionId_2d,          //12'b  [63:52]
                                 rx_c_rb_2d,                 //1'b   [51]
                                 rx_c_symInc_2d,             //1'b   [50]
                                 rx_c_startPrb_2d,           //10'b  [49:40]
                                 rx_c_numPrb_2d,             //8'b   [39:32]
                                 12'd0,                      //12'b  [31:20]     - reMask
                                 rx_numSymbol_2d,            //4'b   [19:16]
                                 first_section,              //1'b   [15]        - 1 bit indicator if first section
                                 last_section,               //1'b   [14]        - 1 bit indicator if last section
                                 no_of_blank_prbs,           //9'b   [13:5]      - number of blank prbs before start prb
                                 4'd0,                      //4'b    [4:1]
                                 1'd0};                      //1'b   [0]         - Symbol and EAXC Blanking Information
                                  
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
                        else if ((rx_c_eaxc_id_latch == ant_num) & (rx_c_symbolid_latch == sym_num))
                            ram_wren [ant_num][sym_num] <= avst_sink_c_valid_3d   ;
                end 

            //  Write Data generation logic.
            //  Write Data generation logic.
            
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
            
                always @ (posedge clk_eth)
                begin : WRITE_ADDRESS
                    if (rst_eth_n == 1'b0)                    
                        ram_wraddress       [ant_num][sym_num]  <= 'b0        ;                                                                                                            
                    else if (ram_wren_2d [ant_num][sym_num] & avst_sink_c_valid_6d & avst_sink_c_endofpacket_6d )                    
                        ram_wraddress       [ant_num][sym_num]  <= 'b0        ;                                                                
                    else if (ram_wren_2d[ant_num][sym_num])                    
                        ram_wraddress   [ant_num][sym_num]  <= ram_wraddress[ant_num][sym_num] + 1'b1 ;                
                end
                

            // Ping-pong memory 128 locations. top 64 location for slot 0 and bottom 64 location for slot 1
            
                ram_128i_128o_128d_sc ul_cplane_fdv_buffer(
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
                    else if((axc_number_2d == ant_num) & (symbol_number_2d == sym_num))
                        ram_rden [ant_num][sym_num]  <=  fdv_read_enable_2d ;
                end


                            
                always @ (posedge clk_eth)
                begin : READ_ADDRESS
                    if (rst_eth_n == 1'b0) 
                        ram_rdaddress   [ant_num][sym_num]  <= 11'b0        ;
                    else if (read_address_clr_5d)
                        ram_rdaddress   [ant_num][sym_num]  <= 11'b0        ;
                    else if (ram_rden_2d [ant_num][sym_num])
                        ram_rdaddress   [ant_num][sym_num]  <= ram_rdaddress[ant_num][sym_num] + 1'b1 ;
                end        
        
                // 12 clock cycle latency from FDV Buffer. 12 clock cycle to get meta_data_out once read_grant supplied 
                always @ (posedge clk_eth)
                begin : META_DATA_READ
                    if (rst_eth_n == 1'b0) 
                        begin
                        meta_data_valid   <= 'd0;    
                        meta_data_out     <= 'd0;       
                        end
                    else if(blank_eaxc_sym_1d)
                        begin
                            meta_data_valid <= 'd1;
                            meta_data_out   <= {127'b0,1'b1};
                        end
                    else 
                        begin    
                        meta_data_valid    <= ram_rden_8d[axc_number_11d][symbol_number_11d];
                        meta_data_out      <= ram_readdata_2d [axc_number_11d_dup1][symbol_number_11d_dup1];        
                        end
                end    

                // 13 clock cycle to get numberOfsections once read_grant supplied
                always @ (posedge clk_eth)
                begin : SECTION_DECODE
                    if (rst_eth_n == 1'b0) 
                        begin                 
                        numberOfsections <= 'd0  ;                                   
                        end
                    else if(meta_data_valid)
                        begin                            
                        numberOfsections <= meta_data_out[95:88] - 8'd1  ;                                 
                        end
                end
        
        
            end
        end    
    endgenerate


pusch_fdv_read_state_machine instance_pusch_fdv_read_state_machine
(
    .clk_in                        (clk_eth                    ),
    .rst_in_n                      (rst_eth_n                  ),
    .read_req                      (fdv_read_req               ),         // To trigger the State Machine 
    .numberOfsections              (numberOfsections           ),
    .read_grant                    (fdv_read_enable            ),         // To Start Read from FDV Buffer
    .section_count                 (section_count              ),
    .axc_number                    (axc_number                 ),         // To Read Next EAxC
    .start_sym                     (symbol_number              ),         // To Read Next Symbol
    .rd_memory_location            (rd_memory_location         ),
    .read_address_clr              (read_address_clr           ),
    .next_slot_arrived_latch_clr   (next_slot_arrived_latch_clr),
    .last_sym_arrived              (last_sym_arrived_2d        ),
    .next_slot_arrived             (next_slot_arrived_2d       ),
    .state                         (state                      ),
    .last_sym_arrived_latch_clr    (last_sym_arrived_latch_clr ),
    .cc1_enable                    (cc1_enable                 ),
    .cc2_enable                    (cc2_enable                 ),
    .blank_eaxc_sym                (blank_eaxc_sym             ),
    .sym_eaxc_map_latch_clr        (sym_eaxc_map_latch_clr     ),
    .sym_eaxc_map_flat             (sym_eaxc_map_flat          )
);
    
    
assign fdv_read_req         = (output_fifo_usedw < (OUTPUT_FIFO_DEPTH-12) & cplane_fdv_read_valid & sf_slot_match_2d);
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
    .clock                      (clk_eth                ),
    .data                       (output_fifo_data       ),
    .rdreq                      (output_fifo_rdreq      ),
    .sclr                       (~rst_eth_n             ),
    .wrreq                      (output_fifo_wrreq      ),
    .q                          (output_fifo_q          ),
    .usedw                      (output_fifo_usedw      ),
    .aclr                       (                       ),
    .eccstatus                  (                       ),
    .full                       (output_fifo_full       ),
    .empty                      (output_fifo_empty      ),
    .almost_full                (                       ),
    .almost_empty               (                       )
);

assign tx_uplane_metadata          =  output_fifo_q            ;
assign tx_uplane_metavalid         =  ~output_fifo_empty       ;


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
        status_register  <= 'd0;        
    else 
        status_register  <= {1'd0,     
                             rd_memory_location,       
                             wr_memory_location,       
                             sf_slot_match_2d,               
                             first_cplane_detect,      
                             state};                       
end



endmodule
