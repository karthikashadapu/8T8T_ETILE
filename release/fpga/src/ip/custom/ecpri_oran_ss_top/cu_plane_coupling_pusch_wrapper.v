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
// File       : cu_plane_coupling_pusch_wrapper.v
// Author:      Boobathi Selvaraj
// Description: Top wrapper block of CU Plane coupling for PRACH. 
//              CU Plane coupling functionality mainly ensures that Uplink C plane header information from Section Type 1 is mapped to uplink U plane packet header. 
//                This module includes 2 sub blocks    

//                1. PUSCH C plane FDV Buffer  
//                        Uplink Cplane packets from O-DU are stored here
//                        This is a 2 dimensonal Matrix to store 14 symobls * 8 AxCs 
//                        Each Symbol will have 64 sections
//                        We have double buffer to store 2 slots of data            
//                2. RAW Packet formation 
//                        It gets the IQ data from FFT Engine and frames a complete packet for 1 Symbol worth of information    
//                        Its gets the C plane Header information for that complete symbol from C Plane FDV Buffer
//                        It exactly aligns the common headers and section headers based on Start and Num PRB of IQ data and then sends to ORAN IP    
//                        ORAN IP gets the complete Symbol worth of Information along with headers and fragments based on MTU Size
//
// ================================================================================ 
            

         
`timescale 1ns/1ns
 
module cu_plane_coupling_pusch_wrapper 
#(parameter NUM_OF_EAXC_PER_PORT  = 4,
  parameter NUM_OF_PHYSICAL_PORTS = 2,
  parameter NUM_OF_CC             = 1,
  parameter EAXC_ID_START         = 0
  )
(
    clk_eth                                 , // 390.625 MHz
    rst_eth_n                               ,
    
    clk_dsp                                 , //491.52 MHz
    rst_dsp_n                               ,
    
    // Uplink U plane AV-Stream Input from FFT Engine at 491.52 MHz
    
    avst_sink_valid                         ,
    avst_sink_data                          , // 32 bit interface. 
    avst_sink_channel                       ,    
    avst_sink_endofpacket                   ,
    avst_sink_startofpacket                 ,    
    
    // C Plane Input from ORAN IP
    avst_sink_c_valid                       ,        
    avst_sink_c_endofpacket                 ,
    avst_sink_c_startofpacket               ,
    
    // C plane conduits data
    
    rx_c_rtc_id                             , //rx_c_rtc_id eAxC Number from eCPRI IP. RU Port ID is considered as eAxC ID.         
    rx_c_dataDirection                      ,              
    rx_c_filterIndex                        ,                   
    rx_c_frameId                            ,                       
    rx_c_subframeId                         ,                    
    rx_c_slotId                             ,                        
    rx_c_symbolid                           , // Start of symbol  
    rx_c_numberOfsections                   ,
    rx_c_symInc                             ,
    rx_sec_hdr_valid                        ,
    rx_c_sectionId                          ,                     
    rx_c_rb                                 ,                            
    rx_c_startPrb                           ,                      
    rx_c_numPrb                             ,            
    rx_sectionType                          ,                     
    rx_numSymbol                            ,
    rx_reMask                               ,
        
    // Uplink U plane AV-Stream output from CU plane coupling at 390.625 MHz to ORAN IP
    avst_source_valid                       ,
    avst_source_data                        ,
    avst_source_channel                     ,
    avst_source_ready                       ,
    avst_source_endofpacket                 ,
    avst_source_startofpacket               ,    
                
    // U plane conduits headers output from CU plane coupling at 390.625 MHz to ORAN IP
    tx_u_size                               ,                       
    tx_u_dataDirection                      ,              
    tx_u_filterIndex                        ,                
    tx_u_frameId                            ,                    
    tx_u_subframeId                         ,                 
    tx_u_slotID                             ,                     
    tx_u_symbolid                           ,                   
    tx_u_seq_id                             ,                   
    tx_u_pc_id                              ,                  
    tx_u_sectionId                          ,                  
    tx_u_rb                                 ,                         
    tx_u_startPrb                           ,                   
    tx_u_numPrb                             ,
    tx_u_numberofsections                   ,
    tx_u_scs_sel                            ,

    dl_ul_bw_config                         , // Bit[7] - 0/1 - Enable/Disable  // [3:0] - 1010/1101 - 60/100 MHz

    arbiter_request                         ,
    
    status_clear                            , 
    pusch_status_register                   ,
    pusch_statistics_register               ,
    timing_reference                        ,
    ul_start
);

parameter DSP_IQ_DATAWIDTH  =   32   ;
parameter ETH_IQ_DATAWIDTH  =   128  ;
parameter CPLANE_DATAWIDTH  =   128  ;

input           clk_eth                                    ;// 390.625 MHz
input           rst_eth_n                                  ;
           
input           clk_dsp                                    ;//491.52 MHz
input           rst_dsp_n                                  ;
       
input [NUM_OF_PHYSICAL_PORTS-1:0]                            avst_sink_valid                    ;                
input [(NUM_OF_PHYSICAL_PORTS*DSP_IQ_DATAWIDTH)-1:0]         avst_sink_data                     ;             
input [(NUM_OF_PHYSICAL_PORTS*16)-1:0]                       avst_sink_channel                  ;                 
input [NUM_OF_PHYSICAL_PORTS-1:0]                            avst_sink_endofpacket              ;         
input [NUM_OF_PHYSICAL_PORTS-1:0]                            avst_sink_startofpacket            ;        

input                          avst_sink_c_valid           ;
input                          avst_sink_c_endofpacket     ;
input                          avst_sink_c_startofpacket   ;
input   [31:0]                 timing_reference            ;
output  [15:0]                 tx_u_size                   ;       
output                         tx_u_dataDirection          ;              
output  [3:0]                  tx_u_filterIndex            ;                  
output  [7:0]                  tx_u_frameId                ;                    
output  [3:0]                  tx_u_subframeId             ;                 
output  [5:0]                  tx_u_slotID                 ;                     
output  [5:0]                  tx_u_symbolid               ;                   
output  [11:0]                 tx_u_sectionId              ;
output  [15:0]                 tx_u_seq_id                 ;
output  [15:0]                 tx_u_pc_id                  ;
output                         tx_u_rb                     ;                         
output  [9:0]                  tx_u_startPrb               ;                   
output  [7:0]                  tx_u_numPrb                 ; 
output  [7:0]                  tx_u_numberofsections       ;
output  [3:0]                  tx_u_scs_sel                ;                      
                      
input [7:0]                    rx_c_numberOfsections       ;
input                          rx_sec_hdr_valid            ;
input                          rx_c_symInc                 ;
input                          rx_c_dataDirection          ;
input [15:0]                   rx_c_rtc_id                 ;    
input [3:0]                    rx_c_filterIndex            ;
input [7:0]                    rx_c_frameId                ;
input [3:0]                    rx_c_subframeId             ;
input [5:0]                    rx_c_slotId                 ;
input [5:0]                    rx_c_symbolid               ;
input                          rx_c_rb                     ;
input [9:0]                    rx_c_startPrb               ;
input [7:0]                    rx_c_numPrb                 ;
input [11:0]                   rx_reMask                   ;
input [3:0]                    rx_numSymbol                ;
input [7:0]                    rx_sectionType              ;
input [11:0]                   rx_c_sectionId              ;


output                         avst_source_valid           ;
output [ETH_IQ_DATAWIDTH-1:0]  avst_source_data            ;
output [15:0]                  avst_source_channel         ;
input                          avst_source_ready           ;
output                         avst_source_endofpacket     ;
output                         avst_source_startofpacket   ;    
  
output                         arbiter_request             ;    
input  [(NUM_OF_CC*8)-1:0]     dl_ul_bw_config             ;
input                          ul_start                    ;
  
input                          status_clear                ;
output  [31:0]                 pusch_status_register       ;
output  [15:0]                 pusch_statistics_register   ;
  
  
  
wire                           tx_uplane_metadata_ready    ;
wire                           tx_uplane_metavalid         ;
wire  [CPLANE_DATAWIDTH-1:0]   tx_uplane_metadata          ;
wire  [CPLANE_DATAWIDTH-1:0]   tx_uplane_metadata_out      ;

wire  [15:0]                   tx_uplane_numprbu_size      ;

wire    [15:0]                 avst_source_channel         ;
  
wire    [12:0]                 status_register_uplane      ;
wire    [8:0]                  status_register_cplane      ;

wire    [11:0]                 statistics_register_cplane  ;
wire    [3:0]                  statistics_register_uplane  ;
  
wire    [3:0]                  rx_c_subframeId_2d          ;
wire    [5:0]                  rx_c_slotId_2d              ;

wire                           sf_slot_match               ;
wire                           uplane_slot_boundary        ;
wire                           last_sym_arrived_latch_clr  ;
wire                           first_cplane_detect         ;
wire                           cc1_enable                  ;
wire                           cc2_enable                  ;


pusch_cplane_fdv_buffer #(.NUM_OF_EAXC_PER_PORT(NUM_OF_EAXC_PER_PORT), 
                          .NUM_OF_PHYSICAL_PORTS(NUM_OF_PHYSICAL_PORTS),
                          .EAXC_ID_START(EAXC_ID_START)
                          )instance_pusch_cplane_fdv_buffer
( 
    .clk_eth                            (clk_eth                     ) ,
    .rst_eth_n                          (rst_eth_n                   ) ,    
    .avst_sink_c_valid                  (avst_sink_c_valid           ) ,        
    .avst_sink_c_endofpacket            (avst_sink_c_endofpacket     ) ,
    .avst_sink_c_startofpacket          (avst_sink_c_startofpacket   ) ,        
    .rx_c_rtc_id                        (rx_c_rtc_id                 ) , //rx_c_rtc_id eAxC Number from rx_c_rtc_id of eCPRI IP. RU Port ID is considered as eAxC ID.         
    .rx_c_dataDirection                 (rx_c_dataDirection          ) ,              
    .rx_c_symInc                        (rx_c_symInc                 ) ,              
    .rx_c_filterIndex                   (rx_c_filterIndex            ) ,                   
    .rx_c_frameId                       (rx_c_frameId                ) ,                       
    .rx_c_subframeId                    (rx_c_subframeId             ) ,                    
    .rx_c_slotId                        (rx_c_slotId                 ) ,                        
    .rx_c_startsymbolid                 (rx_c_symbolid               ) , // Start of symbol  
    .rx_c_numberOfsections              (rx_c_numberOfsections       ) ,
    .rx_c_sectionId                     (rx_c_sectionId              ) ,                     
    .rx_c_rb                            (rx_c_rb                     ) ,                            
    .rx_c_startPrb                      (rx_c_startPrb               ) ,                      
    .rx_c_numPrb                        (rx_c_numPrb                 ) ,                          
    .rx_sectionType                     (rx_sectionType              ) ,                     
    .rx_numSymbol                       (rx_numSymbol                ) ,    
    .tx_uplane_metadata_ready           (tx_uplane_metadata_ready    ) ,
    .tx_uplane_metadata                 (tx_uplane_metadata          ) ,                                
    .tx_uplane_metavalid                (tx_uplane_metavalid         ) ,                                                         
    .last_sym_arrived                   (last_sym_arrived            ) ,
    .last_sym_arrived_latch_clr         (last_sym_arrived_latch_clr  ) ,
    .status_clear                       (status_clear                ) ,
    .status_register                    (status_register_cplane      ) ,
    .statistics_register                (statistics_register_cplane  ) ,
    .rx_c_subframeId_2d                 (rx_c_subframeId_2d          ) ,
    .rx_c_slotId_2d                     (rx_c_slotId_2d              ) ,
    .sf_slot_match                      (sf_slot_match               ) ,
    .uplane_slot_boundary               (uplane_slot_boundary        ) ,
    .ul_start                           (ul_start                    ) ,
    .first_cplane_detect                (first_cplane_detect         ) ,
    .cc1_enable                         (cc1_enable                  ) ,
    .cc2_enable                         (cc2_enable                  )
    
);


pusch_raw_packet_formation #(.NUM_OF_EAXC_PER_PORT(NUM_OF_EAXC_PER_PORT), 
                             .NUM_OF_PHYSICAL_PORTS(NUM_OF_PHYSICAL_PORTS), 
                             .NUM_OF_CC(NUM_OF_CC),
                             .EAXC_ID_START(EAXC_ID_START)
                            ) instance_pusch_raw_packet_formation

(
   .clk_dsp                             (clk_dsp                     ),
   .rst_dsp_n                           (rst_dsp_n                   ),   
   .clk_eth                             (clk_eth                     ),
   .rst_eth_n                           (rst_eth_n                   ),      
   .avst_sink_valid                     (avst_sink_valid             ),
   .avst_sink_data                      (avst_sink_data              ),
   .avst_sink_channel                   (avst_sink_channel           ), 
   .avst_sink_startofpacket             (avst_sink_startofpacket     ),   
   .avst_sink_endofpacket               (avst_sink_endofpacket       ),
   .avst_source_valid                   (avst_source_valid           ),
   .avst_source_data                    (avst_source_data            ),
   .avst_source_channel                 (avst_source_channel         ),
   .avst_source_ready                   (avst_source_ready           ),
   .avst_source_endofpacket             (avst_source_endofpacket     ),
   .avst_source_startofpacket           (avst_source_startofpacket   ),  
   .tx_uplane_metadata_in               (tx_uplane_metadata          ),
   .tx_uplane_metavalid_in              (tx_uplane_metavalid         ),
   .tx_uplane_metadata_ready            (tx_uplane_metadata_ready    ),
   .tx_uplane_metadata_out              (tx_uplane_metadata_out      ),
   .tx_uplane_numprbu_size              (tx_uplane_numprbu_size      ),
   .last_sym_arrived_latch_clr          (last_sym_arrived_latch_clr  ),
   .last_sym_arrived                    (last_sym_arrived            ),
   .dl_ul_bw_config                     (dl_ul_bw_config             ),    
   .arbiter_request                     (arbiter_request             ),
   .status_clear                        (status_clear                ),
   .status_register                     (status_register_uplane      ),
   .statistics_register                 (statistics_register_uplane  ),
   .timing_reference                    (timing_reference            ),
   .rx_c_subframeId_2d                  (rx_c_subframeId_2d          ),
   .rx_c_slotId_2d                      (rx_c_slotId_2d              ),
   .sf_slot_match                       (sf_slot_match               ),
   .uplane_slot_boundary                (uplane_slot_boundary        ),
   .first_cplane_detect                 (first_cplane_detect         ),
   .cc1_enable                          (cc1_enable                  ),
   .cc2_enable                          (cc2_enable                  )
);



assign tx_u_dataDirection      =  tx_uplane_metadata_out[127]    ;
assign tx_u_filterIndex        =  tx_uplane_metadata_out[123:120];
assign tx_u_frameId            =  tx_uplane_metadata_out[119:112];
assign tx_u_subframeId         =  tx_uplane_metadata_out[111:108];
assign tx_u_slotID             =  tx_uplane_metadata_out[107:102];
assign tx_u_symbolid           =  tx_uplane_metadata_out[101:96] ;
assign tx_u_size               =  tx_uplane_numprbu_size         ;       // (NUM OF PRB * 12 RE * 32 / 8 )


// reserved bit [71:64] assigned to seq id. This is assigned to ORAN IP. ORAN IP will use this Sequence ID when fragementation is disabled
// For "application layer fragmentation" the subsequence identifier shall always be set to "0", and the E-bit set to "1"
assign tx_u_seq_id             =  {tx_uplane_metadata_out[71:64],1'b1,7'b0}; // { Sequence ID,E bit,Subsequence ID}

assign tx_u_pc_id              =  avst_source_channel          ; 

assign tx_u_sectionId          =  tx_uplane_metadata_out[63:52];
assign tx_u_rb                 =  tx_uplane_metadata_out[51]   ;
assign tx_u_startPrb           =  tx_uplane_metadata_out[49:40];
assign tx_u_numPrb             =  tx_uplane_metadata_out[39:32];
assign tx_u_numberofsections   =  tx_uplane_metadata_out[95:88];
assign tx_u_scs_sel            =  tx_uplane_metadata_out[87:84];      //scs select 0 for pusch

assign pusch_status_register   = {status_register_uplane,status_register_cplane};
assign pusch_statistics_register = {statistics_register_uplane, statistics_register_cplane};
endmodule