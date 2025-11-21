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
// File       : cu_plane_coupling_top.v
// Author:      Boobathi Selvaraj
// Description: Top level interface block of CU Plane coupling. 
//              It includes the Top wrapper instance of CU Plane coupling for PUSCH and PRACH Path
// Author2:     Rohan Desai
// Description: Added parameterized modules for PHYSICAL_PORTS of PUSCH and PRACH. 
//              Status Register and IP version Registers added. 
// ================================================================================ 

// Supports maximum of 8 axcs in the cplane.

`timescale 1ns/1ns
 
module cu_plane_coupling_top
                                                    //  Parameters           |   Sail River  |   Olympia Bridge
#(parameter PUSCH_NUM_OF_PHYSICAL_PORTS = 2,        //  PUSCH Ports          |       2       |       8
  parameter PRACH_NUM_OF_PHYSICAL_PORTS = 2,        //  PRACH Ports          |       2       |       2
  parameter NUM_OF_CC                   = 2,        //  Component Carriers   |       2       |       1
  parameter PUSCH_NUM_OF_EAXC_PER_PORT  = 4,        //  PUSCH eAXCs per Port |       4       |       1
  parameter PRACH_NUM_OF_EAXC_PER_PORT  = 4,        //  PRACH eAXCs per Port |       4       |       4
  parameter PUSCH_EAXC_ID_START         = 0,        //  Supported Start eaxcIDs are 0,8,16,...
  parameter PRACH_EAXC_ID_START         = 8        //  supported Start eaxcIDs are 0,8,16,... 
  )
(
    clk_eth                                     ,   // 390.625 MHz
    rst_eth_n                                   ,
            
    clk_dsp                                     ,   //491.52 MHz
    rst_dsp_n                                   ,

    // Uplink PUSCH AV-Stream Input from FFT/BF Combiner Engine at 491.52 MHz
    pusch_avst_sink_valid                       ,
    pusch_avst_sink_data                        ,   // 32*PUSCH_NUM_OF_PHYSICAL_PORTS bit interface. 
    pusch_avst_sink_channel                     ,
    pusch_avst_sink_endofpacket                 ,
    pusch_avst_sink_startofpacket               ,

    // Uplink PRACH AV-Stream Input from PRACH Engine at 491.52 MHz
    prach_avst_sink_valid                       ,
    prach_avst_sink_data                        ,   // 32*PRACH_NUM_OF_PHYSICAL_PORTS bit interface. 
    prach_avst_sink_channel                     ,
    prach_avst_sink_endofpacket                 ,
    prach_avst_sink_startofpacket               ,

    // C Plane Input from ORAN IP
    avst_sink_c_valid                           ,
    avst_sink_c_endofpacket                     ,
    avst_sink_c_startofpacket                   ,

    // C plane conduits data
    rx_c_rtc_id                                 ,   //rx_c_rtc_id eAxC Number from eCPRI IP. RU Port ID is considered as eAxC ID.         
    rx_c_dataDirection                          ,
    rx_c_filterIndex                            ,
    rx_c_frameId                                ,
    rx_c_subframeId                             ,
    rx_c_slotID                                 ,
    rx_c_symbolid                               ,   // Start of symbol  
    rx_c_numberOfsections                       ,
    rx_c_symInc                                 ,
    rx_sec_hdr_valid                            ,
    rx_c_sectionId                              ,
    rx_c_rb                                     ,
    rx_c_startPrb                               ,
    rx_c_numPrb                                 ,
    rx_sectionType                              ,
    rx_numSymbol                                ,
    rx_reMask                                   ,
    rx_c_framestructure                         ,

    // Uplink PUSCH AV-Stream output from CU plane coupling at 390.625 MHz to ORAN IP
    pusch_avst_source_valid                     ,
    pusch_avst_source_data                      ,
    pusch_avst_source_channel                   ,
    pusch_avst_source_ready                     ,
    pusch_avst_source_endofpacket               ,
    pusch_avst_source_startofpacket             ,

    // Uplink PRACH AV-Stream output from CU plane coupling at 390.625 MHz to ORAN IP
    prach_avst_source_valid                     ,
    prach_avst_source_data                      ,
    prach_avst_source_channel                   ,
    prach_avst_source_ready                     ,
    prach_avst_source_endofpacket               ,
    prach_avst_source_startofpacket             ,
        
    // PUSCH conduits headers output from CU plane coupling at 390.625 MHz to ORAN IP
    pusch_tx_u_size                             ,
    pusch_tx_u_dataDirection                    ,
    pusch_tx_u_filterIndex                      ,
    pusch_tx_u_frameId                          ,
    pusch_tx_u_subframeId                       ,
    pusch_tx_u_slotID                           ,
    pusch_tx_u_symbolid                         ,
    pusch_tx_u_seq_id                           ,
    pusch_tx_u_pc_id                            ,
    pusch_tx_u_sectionId                        ,
    pusch_tx_u_rb                               ,
    pusch_tx_u_startPrb                         ,
    pusch_tx_u_numPrb                           ,
    pusch_tx_u_numberofsections                 ,
    pusch_tx_u_scs_sel                          ,
    // PRACH conduits headers output from CU plane coupling at 390.625 MHz to ORAN IP
    prach_tx_u_size                             ,
    prach_tx_u_dataDirection                    ,
    prach_tx_u_filterIndex                      ,
    prach_tx_u_frameId                          ,
    prach_tx_u_subframeId                       ,
    prach_tx_u_slotID                           ,
    prach_tx_u_symbolid                         ,
    prach_tx_u_seq_id                           ,
    prach_tx_u_pc_id                            ,
    prach_tx_u_sectionId                        ,
    prach_tx_u_rb                               ,
    prach_tx_u_startPrb                         ,
    prach_tx_u_numPrb                           ,
    prach_tx_u_scs_sel                          ,
    prach_tx_u_numberofsections                 ,
    //DL_UL_BW_CONFIG Details
    // Size       : Number of component carriers(1/2) * 8 bits
    // Description: Bit[7] - 0/1 - Enable/Disable  
    //              Bits[3:0] - 1010/1101 - 60/100 MHz
    dl_ul_bw_config                             ,

    pusch_arbiter_request                       ,
    prach_arbiter_request                       ,
    status_clear                                ,
    ul_start                                    ,
    //Status Register 1 Details
    //Size       :   32 bits:    
    //               PUSCH_STATUS:  
    //               ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //               Name                              Bit Map   Reset Value  Description
    //               ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //               Reserved                            31:22        0       Not used
    //               avst_sink_data_invalid_count           21        0       Bit set to 1 if incorrect avst_sink_valid clock cycles arrive at CU Coupling input.
    //               prb_state_machine                   20:18        1       pusch_fifo_read_state_machine state ranges from 1-5 during uplane processing.
    //               cc2_enable                             17        0       Bit set to 1 if cc2 is enabled. Bit set to 0 if cc2 is disabled.     
    //               cc1_enable                             16        0       Bit set to 1 in cc1 is enabled. Bit set to 0 if cc1 is disabled.
    //               ram_rdready_all                        15        0       fifo ready for read
    //               ram_rd_valid                           14        0       Bit set to 1 if uplane fifo read signal given
    //               avst_source_ready                      13        0       PUSCH ready signal from ORAN IP.
    //               eAxC_sym_flag                          12        0       Bit set to 1 if uplane data is axc/symbol blanked. Bit set to 0 when data is allowed in uplane.
    //               fifo_full                              11        0       Bit set to 1 if input uplane data fifo is full.
    //               PUSCH_data_processed                   10        0       Bit set to 1 when last symbol uplane data in a slot is written to timing adapter. Bit set to 0 when next uplane slot begins.   
    //               PUSCH_data_arrived_eth                  9        0       Bit set to 1 at uplane input. Bit set to 0 when pusch_data_processed is 1.   
    //               invalid_PUSCH_eAxC                      8        0       Bit set to 1 if the input cplane eaxc is out of range PUSCH_EAXC_ID_START to PUSCH_EAXC_ID_START + 'd8         
    //               rd_memory_location                      7        0       Bit toggles after uplane slot is processed.   
    //               wr_memory_location                      6        0       Bit toggles at every new cplane slot.   
    //               sf_slot_match_2d                        5        0       Bit set to 1 when cplane subframeId and slotId matches with uplane timing reference subframeId and slotId at the uplane slot boundary. Bit set to 0 when no cplane arrives at uplane slot boundary.  
    //               first_cplane_detect                     4        0       Bit set to 1 when first cplane arrives after ul_start.  
    //               state[3:0]                            3:0        1       fdv_read_state_machine state ranges from 1-7 during cplane read. 
    status_register_1                           ,

    //Status Register 2 Details
    //Size       :   32 bits:
    //Description:
    //               PRACH_STATUS:
    //               ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //               Name                      Bit Map   Reset Value  Description
    //               ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //               Reserved                 31:16            0      Not used
    //               avst_source_ready           15            0      PRACH ready signal from ORAN IP.
    //               eAxC_Flag                   14            0      Bit set to 1 if uplane data to be written to timing adapter. Bit set to 0 if eaxc is blanked.
    //               fifo_full                   13            0      Bit set to 1 if input uplane data fifo is full.
    //               prach_data_processed        12            0      Bit toggles after uplane subframe is processed.
    //               prach_data_received         11            0      Bit toggles at every new cplane subframe.
    //               ul_start_2d                 10            0      Bit set to 1 when ul_start is enabled.
    //               invalid_num_of_cplane        9            0      Bit set to 1 if number of cplane before uplane read exceeds 2. Buffers can handle only 2 consecutive cplane subframes in PRACH.
    //               invalid_PRACH_eaxc           8            0      Bit set to 1 if the input cplane eaxc is out of range PRACH_EAXC_ID_START to PRACH_EAXC_ID_START + 'd8        
    //               rd_memory_location           7            0      Bit toggles after uplane slot is processed.
    //               wr_memory_location           6            0      Bit toggles at every new cplane slot.
    //               first_uplane_detect          5            0      Bit set to 1 when uplane corresponding to first_cplane_detect arrives after ul_start.
    //               first_cplane_detect          4            0      Bit set to 1 when first cplane arrives after ul_start. 
    //               state[3:0]                 3:0            1      fdv_read_state_machine state ranges from 1-7 during cplane read. 
    status_register_2                           ,

    //statistics register Details
    //size          : 32 bits
    //Description   :[15:0] -> pusch_statistics
    //              :[31:16]-> prach_statistics
    //               ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //               Name                      Bit Map   Reset Value  Description
    //               ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //               Reserved                 31:28            0      Not Used
    //               prach_cplane_count       27:16            0      Count of number of input PRACH Cplane packets every Radio Frame. Maximum possible value[Long prach] is 5(sf)*8(eaxcs)= 40 packets per radio frame
    //               Reserved                 15:12            0      Not Used
    //               pusch_cplane_count        11:0            0      Count of number of input PUSCH Cplane packets every Radio Frame. Maximum possible value is 14(sym)*8(eaxcs)*2(slots)*10(subframes)=2240 packets per radio frame.
    statistics_register                         ,

    IP_Version_Register                         ,    //CUPlane Coupling IP version Register
    short_long_prach_select                     ,    // 0 - Short PRACH / 1- Long PRACH        
    prach_timing_reference                      ,    // [Reserved[31:29],RFN[28:17],SFN[16:9],reserved[8:0]]
    pusch_timing_reference                           // [Reserved[31:29],RFN[28:17],SFN[16:9],SlotId[8:3],reserved[2:0]]
);

//IP Version parameter
//Read as 'hxyz = x.y.z
//x -> Milestone
//y -> Major Revision
//z -> Minor Revision
parameter IP_VERSION        = 'h516                                       ;   //Version 5.1.5

//Datawidth parameters
parameter DSP_IQ_DATAWIDTH  =   32                                        ;
parameter ETH_IQ_DATAWIDTH  =   128                                       ;
parameter CPLANE_DATAWIDTH  =   128                                       ;
 
input                           clk_eth                                   ;   // 390.625 MHz
input                           rst_eth_n                                 ;
      
input                           clk_dsp                                   ;   // 491.52 MHz
input                           rst_dsp_n                                 ;

input [PUSCH_NUM_OF_PHYSICAL_PORTS-1:0]                         pusch_avst_sink_valid            ;
input [(PUSCH_NUM_OF_PHYSICAL_PORTS*DSP_IQ_DATAWIDTH)-1:0]      pusch_avst_sink_data             ;
input [(PUSCH_NUM_OF_PHYSICAL_PORTS*16)-1:0]                    pusch_avst_sink_channel          ;
input [PUSCH_NUM_OF_PHYSICAL_PORTS-1:0]                         pusch_avst_sink_endofpacket      ;
input [PUSCH_NUM_OF_PHYSICAL_PORTS-1:0]                         pusch_avst_sink_startofpacket    ;

input [PRACH_NUM_OF_PHYSICAL_PORTS-1:0]                         prach_avst_sink_valid            ;
input [(PRACH_NUM_OF_PHYSICAL_PORTS*DSP_IQ_DATAWIDTH)-1:0]      prach_avst_sink_data             ;
input [(PRACH_NUM_OF_PHYSICAL_PORTS*16)-1:0]                    prach_avst_sink_channel          ;
input [PRACH_NUM_OF_PHYSICAL_PORTS-1:0]                         prach_avst_sink_endofpacket      ;
input [PRACH_NUM_OF_PHYSICAL_PORTS-1:0]                         prach_avst_sink_startofpacket    ;

input                           avst_sink_c_valid                         ;
input                           avst_sink_c_endofpacket                   ;
input                           avst_sink_c_startofpacket                 ;

input   [31:0]                  prach_timing_reference                    ;
input   [31:0]                  pusch_timing_reference                    ;
output  [15:0]                  pusch_tx_u_size                           ;
output                          pusch_tx_u_dataDirection                  ;
output  [3:0]                   pusch_tx_u_filterIndex                    ;
output  [7:0]                   pusch_tx_u_frameId                        ;
output  [3:0]                   pusch_tx_u_subframeId                     ;
output  [5:0]                   pusch_tx_u_slotID                         ;
output  [5:0]                   pusch_tx_u_symbolid                       ;
output  [11:0]                  pusch_tx_u_sectionId                      ;
output  [15:0]                  pusch_tx_u_seq_id                         ;
output  [15:0]                  pusch_tx_u_pc_id                          ;
output                          pusch_tx_u_rb                             ;
output  [9:0]                   pusch_tx_u_startPrb                       ;
output  [7:0]                   pusch_tx_u_numPrb                         ;
output  [7:0]                   pusch_tx_u_numberofsections               ;
output  [3:0]                   pusch_tx_u_scs_sel                        ;

output  [15:0]                  prach_tx_u_size                           ;
output                          prach_tx_u_dataDirection                  ;
output  [3:0]                   prach_tx_u_filterIndex                    ;
output  [7:0]                   prach_tx_u_frameId                        ;
output  [3:0]                   prach_tx_u_subframeId                     ;
output  [5:0]                   prach_tx_u_slotID                         ;
output  [5:0]                   prach_tx_u_symbolid                       ;
output  [11:0]                  prach_tx_u_sectionId                      ;
output  [15:0]                  prach_tx_u_seq_id                         ;
output  [15:0]                  prach_tx_u_pc_id                          ;
output                          prach_tx_u_rb                             ;
output  [9:0]                   prach_tx_u_startPrb                       ;
output  [7:0]                   prach_tx_u_numPrb                         ;
output  [3:0]                   prach_tx_u_scs_sel                        ;
output  [7:0]                   prach_tx_u_numberofsections               ;

input   [7:0]                   rx_c_numberOfsections                     ;
input                           rx_sec_hdr_valid                          ;
input                           rx_c_symInc                               ;
input                           rx_c_dataDirection                        ;
input   [15:0]                  rx_c_rtc_id                               ;
input   [3:0]                   rx_c_filterIndex                          ;
input   [7:0]                   rx_c_frameId                              ;
input   [3:0]                   rx_c_subframeId                           ;
input   [5:0]                   rx_c_slotID                               ;
input   [5:0]                   rx_c_symbolid                             ;
input                           rx_c_rb                                   ;
input   [9:0]                   rx_c_startPrb                             ;
input   [7:0]                   rx_c_numPrb                               ;
input   [11:0]                  rx_reMask                                 ;
input   [3:0]                   rx_numSymbol                              ;
input   [7:0]                   rx_sectionType                            ;
input   [11:0]                  rx_c_sectionId                            ;
input   [7:0]                   rx_c_framestructure                       ;

output                          pusch_avst_source_valid                   ;
output  [ETH_IQ_DATAWIDTH-1:0]  pusch_avst_source_data                    ;
output  [15:0]                  pusch_avst_source_channel                 ;
input                           pusch_avst_source_ready                   ;
output                          pusch_avst_source_endofpacket             ;
output                          pusch_avst_source_startofpacket           ;

output                          prach_avst_source_valid                   ;
output  [ETH_IQ_DATAWIDTH-1:0]  prach_avst_source_data                    ;
output  [15:0]                  prach_avst_source_channel                 ;
input                           prach_avst_source_ready                   ;
output                          prach_avst_source_endofpacket             ;
output                          prach_avst_source_startofpacket           ;

output                          pusch_arbiter_request                     ;
output                          prach_arbiter_request                     ;
input   [(NUM_OF_CC*8)-1:0]     dl_ul_bw_config                           ;
input                           status_clear                              ;
input                           short_long_prach_select                   ;
output  [31:0]                  status_register_1                         ;
output  [31:0]                  status_register_2                         ;
output  [31:0]                  statistics_register                       ;
output  [31:0]                  IP_Version_Register                       ;
wire    [31:0]                  pusch_status_register                     ;
wire    [31:0]                  prach_status_register                     ;
wire    [15:0]                  pusch_statistics_register                 ;
wire    [15:0]                  prach_statistics_register                 ;
input                           ul_start                                  ;

  
cu_plane_coupling_pusch_wrapper #(.NUM_OF_EAXC_PER_PORT(PUSCH_NUM_OF_EAXC_PER_PORT), 
                                  .NUM_OF_PHYSICAL_PORTS(PUSCH_NUM_OF_PHYSICAL_PORTS), 
                                  .NUM_OF_CC(NUM_OF_CC), 
                                  .EAXC_ID_START(PUSCH_EAXC_ID_START)
                                 ) instance_cu_plane_coupling_pusch_wrapper
(
    .clk_eth                            (clk_eth                         ),
    .rst_eth_n                          (rst_eth_n                       ),
    .clk_dsp                            (clk_dsp                         ),
    .rst_dsp_n                          (rst_dsp_n                       ),
    .avst_sink_valid                    (pusch_avst_sink_valid           ),
    .avst_sink_data                     (pusch_avst_sink_data            ), 
    .avst_sink_channel                  (pusch_avst_sink_channel         ),
    .avst_sink_endofpacket              (pusch_avst_sink_endofpacket     ),
    .avst_sink_startofpacket            (pusch_avst_sink_startofpacket   ),
    .avst_sink_c_valid                  (avst_sink_c_valid               ), 
    .avst_sink_c_endofpacket            (avst_sink_c_endofpacket         ),
    .avst_sink_c_startofpacket          (avst_sink_c_startofpacket       ),
    .rx_c_rtc_id                        (rx_c_rtc_id                     ),
    .rx_c_dataDirection                 (rx_c_dataDirection              ),
    .rx_c_filterIndex                   (rx_c_filterIndex                ),
    .rx_c_frameId                       (rx_c_frameId                    ),
    .rx_c_subframeId                    (rx_c_subframeId                 ),
    .rx_c_slotId                        (rx_c_slotID                     ),
    .rx_c_symbolid                      (rx_c_symbolid                   ),
    .rx_c_numberOfsections              (rx_c_numberOfsections           ),
    .rx_c_symInc                        (rx_c_symInc                     ),
    .rx_sec_hdr_valid                   (rx_sec_hdr_valid                ),
    .rx_c_sectionId                     (rx_c_sectionId                  ),
    .rx_c_rb                            (rx_c_rb                         ),
    .rx_c_startPrb                      (rx_c_startPrb                   ),
    .rx_c_numPrb                        (rx_c_numPrb                     ),
    .rx_sectionType                     (rx_sectionType                  ),
    .rx_numSymbol                       (rx_numSymbol                    ),
    .rx_reMask                          (rx_reMask                       ),
    .avst_source_valid                  (pusch_avst_source_valid         ),
    .avst_source_data                   (pusch_avst_source_data          ),
    .avst_source_channel                (pusch_avst_source_channel       ),
    .avst_source_ready                  (pusch_avst_source_ready         ),
    .avst_source_endofpacket            (pusch_avst_source_endofpacket   ),
    .avst_source_startofpacket          (pusch_avst_source_startofpacket ),
    .tx_u_size                          (pusch_tx_u_size                 ),
    .tx_u_dataDirection                 (pusch_tx_u_dataDirection        ),
    .tx_u_filterIndex                   (pusch_tx_u_filterIndex          ),
    .tx_u_frameId                       (pusch_tx_u_frameId              ),
    .tx_u_subframeId                    (pusch_tx_u_subframeId           ),
    .tx_u_slotID                        (pusch_tx_u_slotID               ),
    .tx_u_symbolid                      (pusch_tx_u_symbolid             ),
    .tx_u_seq_id                        (pusch_tx_u_seq_id               ),
    .tx_u_pc_id                         (pusch_tx_u_pc_id                ),
    .tx_u_sectionId                     (pusch_tx_u_sectionId            ),
    .tx_u_rb                            (pusch_tx_u_rb                   ),
    .tx_u_startPrb                      (pusch_tx_u_startPrb             ),
    .tx_u_numPrb                        (pusch_tx_u_numPrb               ),
    .tx_u_numberofsections              (pusch_tx_u_numberofsections     ),
    .tx_u_scs_sel                       (pusch_tx_u_scs_sel              ),
    .dl_ul_bw_config                    (dl_ul_bw_config                 ),
    .arbiter_request                    (pusch_arbiter_request           ),
    .status_clear                       (status_clear                    ),
    .pusch_status_register              (pusch_status_register           ),
    .pusch_statistics_register          (pusch_statistics_register       ),
    .timing_reference                   (pusch_timing_reference          ),
    .ul_start                           (ul_start                        )
);

cu_plane_coupling_prach_wrapper #(.NUM_OF_EAXC_PER_PORT(PRACH_NUM_OF_EAXC_PER_PORT), 
                                  .NUM_OF_PHYSICAL_PORTS(PRACH_NUM_OF_PHYSICAL_PORTS), 
                                  .NUM_OF_CC(NUM_OF_CC), 
                                  .EAXC_ID_START(PRACH_EAXC_ID_START)
                                 ) instance_cu_plane_coupling_prach_wrapper
(
    .clk_eth                            (clk_eth                         ), 
    .rst_eth_n                          (rst_eth_n                       ), 
    .clk_dsp                            (clk_dsp                         ), 
    .rst_dsp_n                          (rst_dsp_n                       ),
    .avst_sink_valid                    (prach_avst_sink_valid           ),
    .avst_sink_data                     (prach_avst_sink_data            ), 
    .avst_sink_channel                  (prach_avst_sink_channel         ),
    .avst_sink_endofpacket              (prach_avst_sink_endofpacket     ),
    .avst_sink_startofpacket            (prach_avst_sink_startofpacket   ),
    .avst_sink_c_valid                  (avst_sink_c_valid               ), 
    .avst_sink_c_endofpacket            (avst_sink_c_endofpacket         ),
    .avst_sink_c_startofpacket          (avst_sink_c_startofpacket       ),
    .rx_c_rtc_id                        (rx_c_rtc_id                     ), 
    .rx_c_dataDirection                 (rx_c_dataDirection              ), 
    .rx_c_filterIndex                   (rx_c_filterIndex                ), 
    .rx_c_frameId                       (rx_c_frameId                    ), 
    .rx_c_subframeId                    (rx_c_subframeId                 ), 
    .rx_c_slotID                        (rx_c_slotID                     ), 
    .rx_c_symbolid                      (rx_c_symbolid                   ), 
    .rx_c_numberOfsections              (rx_c_numberOfsections           ),
    .rx_c_symInc                        (rx_c_symInc                     ),
    .rx_sec_hdr_valid                   (rx_sec_hdr_valid                ),
    .rx_c_sectionId                     (rx_c_sectionId                  ), 
    .rx_c_rb                            (rx_c_rb                         ), 
    .rx_c_startPrb                      (rx_c_startPrb                   ), 
    .rx_c_numPrb                        (rx_c_numPrb                     ), 
    .rx_sectionType                     (rx_sectionType                  ), 
    .rx_numSymbol                       (rx_numSymbol                    ),
    .rx_reMask                          (rx_reMask                       ),
    .rx_c_framestructure                (rx_c_framestructure             ),
    .avst_source_valid                  (prach_avst_source_valid         ),
    .avst_source_data                   (prach_avst_source_data          ),
    .avst_source_channel                (prach_avst_source_channel       ),
    .avst_source_ready                  (prach_avst_source_ready         ),
    .avst_source_endofpacket            (prach_avst_source_endofpacket   ),
    .avst_source_startofpacket          (prach_avst_source_startofpacket ),
    .tx_u_size                          (prach_tx_u_size                 ), 
    .tx_u_dataDirection                 (prach_tx_u_dataDirection        ), 
    .tx_u_filterIndex                   (prach_tx_u_filterIndex          ), 
    .tx_u_frameId                       (prach_tx_u_frameId              ), 
    .tx_u_subframeId                    (prach_tx_u_subframeId           ), 
    .tx_u_slotID                        (prach_tx_u_slotID               ), 
    .tx_u_symbolid                      (prach_tx_u_symbolid             ), 
    .tx_u_seq_id                        (prach_tx_u_seq_id               ), 
    .tx_u_pc_id                         (prach_tx_u_pc_id                ), 
    .tx_u_sectionId                     (prach_tx_u_sectionId            ), 
    .tx_u_rb                            (prach_tx_u_rb                   ), 
    .tx_u_startPrb                      (prach_tx_u_startPrb             ), 
    .tx_u_numPrb                        (prach_tx_u_numPrb               ),
    .tx_u_scs_sel                       (prach_tx_u_scs_sel              ),
    .tx_u_numberofsections              (prach_tx_u_numberofsections     ),
    .dl_ul_bw_config                    (dl_ul_bw_config                 ), 
    .arbiter_request                    (prach_arbiter_request           ),
    .status_clear                       (status_clear                    ),
    .prach_status_register              (prach_status_register           ),
    .prach_statistics_register          (prach_statistics_register       ),
    .short_long_prach_select            (short_long_prach_select         ),
    .timing_reference                   (prach_timing_reference          ),
    .ul_start                           (ul_start                        )
);

assign IP_Version_Register   = IP_VERSION                                ; // 'hxyz = Version x.y.z
assign statistics_register   = {prach_statistics_register, pusch_statistics_register};
assign status_register_1     = pusch_status_register                     ;
assign status_register_2     = prach_status_register                     ;

endmodule