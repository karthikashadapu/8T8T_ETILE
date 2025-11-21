// ================================================================================
// Copyright (c) <2024>, Intel Corporation
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
 
module oran_wrapper(
	input  wire         clk_tx,                          
	input  wire         clk_rx,                          
	input  wire         clk_csr,                         
	input  wire         rst_tx_n,                        
	input  wire         rst_rx_n,                        
	input  wire         rst_csr_n,                       
	input  wire         avst_sink_u_valid,               
	input  wire [127:0] avst_sink_u_data,                
	input  wire         avst_sink_u_startofpacket,       
	input  wire         avst_sink_u_endofpacket,         
	output wire         avst_sink_u_ready,               
	input  wire [2:0]   avst_sink_u_empty,               
	input  wire         avst_sink_c_valid,               
	input  wire         avst_sink_c_startofpacket,       
	input  wire         avst_sink_c_endofpacket,         
	output wire         avst_sink_c_ready,               
	input  wire         avst_sink_c_ext_valid,           
	input  wire [63:0]  avst_sink_c_ext_data,            
	input  wire         avst_sink_c_ext_startofpacket,   
	input  wire         avst_sink_c_ext_endofpacket,     
	input  wire [2:0]   avst_sink_c_ext_empty,           
	output wire         avst_sink_c_ext_ready,           
	output wire         avst_source_valid,               
	output wire [63:0]  avst_source_data,                
	output wire         avst_source_startofpacket,       
	output wire         avst_source_endofpacket,         
	output wire [2:0]   avst_source_empty,               
	input  wire         avst_source_ready,               
	output wire         avst_source_u_valid,             
	output wire [127:0] avst_source_u_data,              
	output wire         avst_source_u_startofpacket,     
	output wire         avst_source_u_endofpacket,       
	output wire [2:0]   avst_source_u_empty,             
	output wire         avst_source_u_error,             
	output wire         avst_source_c_valid,             
	output wire         avst_source_c_startofpacket,     
	output wire         avst_source_c_endofpacket,       
	output wire         avst_source_c_error,             
	output wire         avst_source_c_ext_valid,         
	output wire [63:0]  avst_source_c_ext_data,          
	output wire         avst_source_c_ext_startofpacket, 
	output wire         avst_source_c_ext_endofpacket,   
	output wire [2:0]   avst_source_c_ext_empty,         
	output wire         avst_source_c_ext_error,         
	input  wire         avst_sink_valid,                 
	input  wire [63:0]  avst_sink_data,                  
	input  wire         avst_sink_startofpacket,         
	input  wire         avst_sink_endofpacket,           
	input  wire [2:0]   avst_sink_empty,                 
	input  wire         avst_sink_error,                 
	input  wire [15:0]  csr_address,                     
	input  wire         csr_write,                       
	input  wire [31:0]  csr_writedata,                   
	output wire [31:0]  csr_readdata,                    
	input  wire         csr_read,                        
	output wire         csr_readdatavalid,               
	output wire         csr_waitrequest,                 
	output wire         irq,                             
	input  wire [15:0]  tx_c_size,                       
	input  wire         tx_c_dataDirection,              
	input  wire [3:0]   tx_c_filterIndex,                
	input  wire [7:0]   tx_c_frameId,                    
	input  wire [3:0]   tx_c_subframeId,                 
	input  wire [5:0]   tx_c_slotID,                     
	input  wire [5:0]   tx_c_symbolid,                   
	input  wire [11:0]  tx_c_sectionId,                  
	input  wire         tx_c_rb,                         
	input  wire [9:0]   tx_c_startPrb,                   
	input  wire [7:0]   tx_c_numPrb,                     
	input  wire [7:0]   tx_c_udCompHdr,                  
	input  wire [7:0]   tx_sectionType,                  
	input  wire [7:0]   tx_ext_sectionType,              
	input  wire [15:0]  tx_timeOffset,                   
	input  wire [7:0]   tx_frameStructure,               
	input  wire [15:0]  tx_cpLength,                     
	input  wire [11:0]  tx_reMask,                       
	input  wire [3:0]   tx_numSymbol,                    
	input  wire         tx_ef,                           
	input  wire [23:0]  tx_frequencyOffset,              
	input  wire [14:0]  tx_beamid,                       
	input  wire [15:0]  tx_u_size,                       
	input  wire         tx_u_dataDirection, 
    input  wire [7:0]   tx_u_numberofsection,	
	input  wire [3:0]   tx_u_filterIndex,                
	input  wire [7:0]   tx_u_frameId,                    
	input  wire [3:0]   tx_u_subframeId,                 
	input  wire [5:0]   tx_u_slotID,                     
	input  wire [5:0]   tx_u_symbolid,                   
	input  wire [11:0]  tx_u_sectionId,                  
	input  wire         tx_u_rb,                         
	input  wire [9:0]   tx_u_startPrb,                   
	input  wire [7:0]   tx_u_numPrb,                     
	input  wire [7:0]   tx_u_udCompHdr,                  
	input  wire [3:0]   ext_scs_sel,                     
	output wire         tx_transport_c_u,                
	input  wire [95:0]  tx_time_of_day_96b,              
	output wire         rx_c_dataDirection,              
	output wire [3:0]   rx_c_filterIndex,                
	output wire [7:0]   rx_c_frameId,                    
	output wire [3:0]   rx_c_subframeId,                 
	output wire [5:0]   rx_c_slotID,                     
	output wire [5:0]   rx_c_symbolid,                   
	output wire [7:0]   rx_c_numberOfsections,           
	output wire [11:0]  rx_c_sectionId,                  
	output wire         rx_c_rb,                         
	output wire         rx_c_symInc,                     
	output wire [9:0]   rx_c_startPrb,                   
	output wire [7:0]   rx_c_numPrb,                     
	output wire [7:0]   rx_c_udCompHdr,                  
	output wire         rx_sec_hdr_valid,                
	output wire [7:0]   rx_sectionType,                  
	output wire [7:0]   rx_ext_sectionType,              
	output wire [15:0]  rx_timeOffset,                   
	output wire [7:0]   rx_frameStructure,               
	output wire [15:0]  rx_cpLength,                     
	output wire [11:0]  rx_reMask,                       
	output wire [3:0]   rx_numSymbol,                    
	output wire [23:0]  rx_frequencyOffset,              
	output wire         rx_ef,                           
	output wire [14:0]  rx_beamid,                       
	output wire         rx_u_dataDirection,              
	output wire [3:0]   rx_u_filterIndex,                
	output wire [7:0]   rx_u_frameId,                    
	output wire [3:0]   rx_u_subframeId,                 
	output wire [5:0]   rx_u_slotID,                     
	output wire [5:0]   rx_u_symbolid,                   
	output wire [11:0]  rx_u_sectionId,                  
	output wire         rx_u_rb,                         
	output wire [9:0]   rx_u_startPrb,                   
	output wire [7:0]   rx_u_numPrb,                     
	output wire [7:0]   rx_u_udCompHdr,                  
	input  wire         rx_transport_c_u,                
	input  wire [95:0]  rx_time_of_day_96b,              
	input  wire [15:0]  tx_c_rtc_id,                     
	input  wire [15:0]  tx_c_seq_id,                     
	input  wire [15:0]  tx_u_pc_id,                      
	input  wire [15:0]  tx_u_seq_id,                     
	input  wire [15:0]  sink_pc_id,                      
	input  wire [15:0]  sink_rtc_id,                     
	input  wire [15:0]  sink_seq_id,                     
	output wire [15:0]  rx_c_rtc_id,                     
	output wire [15:0]  rx_c_seq_id,                     
	output wire [15:0]  rx_u_pc_id,                      
	output wire [15:0]  rx_u_seq_id,                     
	output wire [15:0]  source_pc_id,                    
	output wire [15:0]  source_rtc_id,                   
	output wire [15:0]  source_seq_id,                   
	output wire [15:0]  source_pkt_size,                 
	input  wire         tx_lanes_stable,                 
	input  wire         rx_pcs_ready,
	input  wire [15:0]  fh_comp_csr_address,      
    input  wire         fh_comp_csr_write,        
    input  wire [31:0]  fh_comp_csr_writedata,    
    output wire [31:0]  fh_comp_csr_readdata,     
    input  wire         fh_comp_csr_read,         
    output wire         fh_comp_csr_readdatavalid,
    output wire         fh_comp_csr_waitrequest,  
	input  wire [3:0]   decomp_fs_offset,
	input  wire [3:0]   comp_fs_offset
	
);

wire oran_irq;
wire fh_comp_irq;
wire oran_rx_sec_hdr_valid;
wire [127:0]rx_metadata_i,rx_metadata_o,tx_metadata_i,tx_metadata_o;
wire 		fh_comp_tx_avst_source_valid		 ;   
wire [63:0] fh_comp_tx_avst_source_data          ;
wire 		fh_comp_tx_avst_source_startofpacket ;
wire 		fh_comp_tx_avst_source_endofpacket   ;
wire 		fh_comp_tx_avst_source_ready         ;
wire [2:0] 	fh_comp_tx_avst_source_empty         ;
wire 		oran_avst_source_u_valid        	;	
wire [63:0] oran_avst_source_u_data             ;
wire 		oran_avst_source_u_startofpacket    ;
wire 		oran_avst_source_u_endofpacket      ;
wire [2:0]	oran_avst_source_u_empty            ;
wire 		oran_avst_source_u_error            ;
wire [15:0]	oran_rx_seq_id                      ;
wire [15:0]	oran_rx_pc_id               		;
wire 		oran_rx_dataDirection				;
wire [3:0]	oran_rx_filterIndex                 ;
wire [7:0]	oran_rx_frameId                     ;
wire [3:0]	oran_rx_subframeId                  ;
wire [5:0]	oran_rx_slotID                      ;
wire [5:0]	oran_rx_symbolid                    ;
wire [11:0]	oran_rx_sectionId                   ;
wire 		oran_rx_rb                          ;
wire [9:0]	oran_rx_startPrb                    ;
wire [7:0]	oran_rx_numPrb                      ;
wire [7:0]	oran_rx_udCompHdr                   ;
wire [15:0]	fh_comp_tx_size                     ;
wire [15:0]	fh_comp_tx_seq_id                   ;
wire [15:0]	fh_comp_tx_pc_id               		;
wire 		fh_comp_tx_dataDirection			;
wire [3:0]	fh_comp_tx_filterIndex              ;
wire [7:0]	fh_comp_tx_frameId                  ;
wire [3:0]	fh_comp_tx_subframeId               ;
wire [5:0]	fh_comp_tx_slotID                   ;
wire [5:0]	fh_comp_tx_symbolid                 ;
wire [11:0]	fh_comp_tx_sectionId                ;
wire 		fh_comp_tx_rb                       ;
wire [9:0]	fh_comp_tx_startPrb                 ;
wire [7:0]	fh_comp_tx_numPrb                   ;
wire [7:0]	fh_comp_tx_udCompHdr                ;



oran_hwtcl_top u_oran_hwtcl_top(
		.clk_tx                          (clk_tx),                       	//   input,   width = 1,            clk_tx.clk
		.clk_rx                          (clk_rx),                          //   input,   width = 1,            clk_rx.clk
		.clk_csr                         (clk_csr),                         //   input,   width = 1,           clk_csr.clk
		.rst_tx_n                        (rst_tx_n),                        //   input,   width = 1,          rst_tx_n.reset_n
		.rst_rx_n                        (rst_rx_n),                        //   input,   width = 1,          rst_rx_n.reset_n
		.rst_csr_n                       (rst_csr_n),                       //   input,   width = 1,         rst_csr_n.reset_n
		.avst_sink_u_valid               (fh_comp_tx_avst_source_valid),               //   input,   width = 1,       avst_sink_u.valid
		.avst_sink_u_data                (fh_comp_tx_avst_source_data),                //   input,  width = 64,                  .data
		.avst_sink_u_startofpacket       (fh_comp_tx_avst_source_startofpacket),       //   input,   width = 1,                  .startofpacket
		.avst_sink_u_endofpacket         (fh_comp_tx_avst_source_endofpacket),         //   input,   width = 1,                  .endofpacket
		.avst_sink_u_ready               (fh_comp_tx_avst_source_ready),               //  output,   width = 1,                  .ready
		.avst_sink_u_empty               (fh_comp_tx_avst_source_empty),               //   input,   width = 3,                  .empty
		.avst_sink_c_valid               (avst_sink_c_valid),               //   input,   width = 1,       avst_sink_c.valid
		.avst_sink_c_startofpacket       (avst_sink_c_startofpacket),       //   input,   width = 1,                  .startofpacket
		.avst_sink_c_endofpacket         (avst_sink_c_endofpacket),         //   input,   width = 1,                  .endofpacket
		.avst_sink_c_ready               (avst_sink_c_ready),               //  output,   width = 1,                  .ready
		.avst_sink_c_ext_valid           (avst_sink_c_ext_valid),           //   input,   width = 1,   avst_sink_c_ext.valid
		.avst_sink_c_ext_data            (avst_sink_c_ext_data),            //   input,  width = 64,                  .data
		.avst_sink_c_ext_startofpacket   (avst_sink_c_ext_startofpacket),   //   input,   width = 1,                  .startofpacket
		.avst_sink_c_ext_endofpacket     (avst_sink_c_ext_endofpacket),     //   input,   width = 1,                  .endofpacket
		.avst_sink_c_ext_empty           (avst_sink_c_ext_empty),           //   input,   width = 3,                  .empty
		.avst_sink_c_ext_ready           (avst_sink_c_ext_ready),           //  output,   width = 1,                  .ready
		.avst_source_valid               (avst_source_valid),               //  output,   width = 1,       avst_source.valid
		.avst_source_data                (avst_source_data),                //  output,  width = 64,                  .data
		.avst_source_startofpacket       (avst_source_startofpacket),       //  output,   width = 1,                  .startofpacket
		.avst_source_endofpacket         (avst_source_endofpacket),         //  output,   width = 1,                  .endofpacket
		.avst_source_empty               (avst_source_empty),               //  output,   width = 3,                  .empty
		.avst_source_ready               (avst_source_ready),               //   input,   width = 1,                  .ready
		.avst_source_u_valid             (oran_avst_source_u_valid        ),             //  output,   width = 1,     avst_source_u.valid
		.avst_source_u_data              (oran_avst_source_u_data         ),              //  output,  width = 64,                  .data
		.avst_source_u_startofpacket     (oran_avst_source_u_startofpacket),     //  output,   width = 1,                  .startofpacket
		.avst_source_u_endofpacket       (oran_avst_source_u_endofpacket  ),       //  output,   width = 1,                  .endofpacket
		.avst_source_u_empty             (oran_avst_source_u_empty        ),             //  output,   width = 3,                  .empty
		.avst_source_u_error             (oran_avst_source_u_error        ),             //  output,   width = 1,                  .error
		.avst_source_c_valid             (avst_source_c_valid),             //  output,   width = 1,     avst_source_c.valid
		.avst_source_c_startofpacket     (avst_source_c_startofpacket),     //  output,   width = 1,                  .startofpacket
		.avst_source_c_endofpacket       (avst_source_c_endofpacket),       //  output,   width = 1,                  .endofpacket
		.avst_source_c_error             (avst_source_c_error),             //  output,   width = 1,                  .error
		.avst_source_c_ext_valid         (avst_source_c_ext_valid),         //  output,   width = 1, avst_source_c_ext.valid
		.avst_source_c_ext_data          (avst_source_c_ext_data),          //  output,  width = 64,                  .data
		.avst_source_c_ext_startofpacket (avst_source_c_ext_startofpacket), //  output,   width = 1,                  .startofpacket
		.avst_source_c_ext_endofpacket   (avst_source_c_ext_endofpacket),   //  output,   width = 1,                  .endofpacket
		.avst_source_c_ext_empty         (avst_source_c_ext_empty),         //  output,   width = 3,                  .empty
		.avst_source_c_ext_error         (avst_source_c_ext_error),         //  output,   width = 1,                  .error
		.avst_sink_valid                 (avst_sink_valid),                 //   input,   width = 1,         avst_sink.valid
		.avst_sink_data                  (avst_sink_data),                  //   input,  width = 64,                  .data
		.avst_sink_startofpacket         (avst_sink_startofpacket),         //   input,   width = 1,                  .startofpacket
		.avst_sink_endofpacket           (avst_sink_endofpacket),           //   input,   width = 1,                  .endofpacket
		.avst_sink_empty                 (avst_sink_empty),                 //   input,   width = 3,                  .empty
		.avst_sink_error                 (avst_sink_error),                 //   input,   width = 1,                  .error
		.csr_address                     (csr_address),                     //   input,  width = 16,      avalon_slave.address
		.csr_write                       (csr_write),                       //   input,   width = 1,                  .write
		.csr_writedata                   (csr_writedata),                   //   input,  width = 32,                  .writedata
		.csr_readdata                    (csr_readdata),                    //  output,  width = 32,                  .readdata
		.csr_read                        (csr_read),                        //   input,   width = 1,                  .read
		.csr_readdatavalid               (csr_readdatavalid),               //  output,   width = 1,                  .readdatavalid
		.csr_waitrequest                 (csr_waitrequest),                 //  output,   width = 1,                  .waitrequest
		.irq                             (oran_irq),                             //  output,   width = 1,       conduit_end.irq
		.tx_c_size                       (tx_c_size),                       //   input,  width = 16,                  .tx_c_size
		.tx_c_dataDirection              (tx_c_dataDirection),              //   input,   width = 1,                  .tx_c_dataDirection
		.tx_c_filterIndex                (tx_c_filterIndex),                //   input,   width = 4,                  .tx_c_filterIndex
		.tx_c_frameId                    (tx_c_frameId),                    //   input,   width = 8,                  .tx_c_frameId
		.tx_c_subframeId                 (tx_c_subframeId),                 //   input,   width = 4,                  .tx_c_subframeId
		.tx_c_slotID                     (tx_c_slotID),                     //   input,   width = 6,                  .tx_c_slotID
		.tx_c_symbolid                   (tx_c_symbolid),                   //   input,   width = 6,                  .tx_c_symbolid
		.tx_c_sectionId                  (tx_c_sectionId),                  //   input,  width = 12,                  .tx_c_sectionId
		.tx_c_rb                         (tx_c_rb),                         //   input,   width = 1,                  .tx_c_rb
		.tx_c_startPrb                   (tx_c_startPrb),                   //   input,  width = 10,                  .tx_c_startPrb
		.tx_c_numPrb                     (tx_c_numPrb),                     //   input,   width = 8,                  .tx_c_numPrb
		.tx_c_udCompHdr                  (tx_c_udCompHdr),                  //   input,   width = 8,                  .tx_c_udCompHdr
		.tx_sectionType                  (tx_sectionType),                  //   input,   width = 8,                  .tx_sectionType
		.tx_ext_sectionType              (tx_ext_sectionType),              //   input,   width = 8,                  .tx_ext_sectionType
		.tx_timeOffset                   (tx_timeOffset),                   //   input,  width = 16,                  .tx_timeOffset
		.tx_frameStructure               (tx_frameStructure),               //   input,   width = 8,                  .tx_frameStructure
		.tx_cpLength                     (tx_cpLength),                     //   input,  width = 16,                  .tx_cpLength
		.tx_reMask                       (tx_reMask),                       //   input,  width = 12,                  .tx_reMask
		.tx_numSymbol                    (tx_numSymbol),                    //   input,   width = 4,                  .tx_numSymbol
		.tx_ef                           (tx_ef),                           //   input,   width = 1,                  .tx_ef
		.tx_frequencyOffset              (tx_frequencyOffset),              //   input,  width = 24,                  .tx_frequencyOffset
		.tx_beamid                       (tx_beamid),                       //   input,  width = 15,                  .tx_beamid
		.tx_u_prbusize                   (fh_comp_tx_size),                       //   input,  width = 16,                  .tx_u_size
		.tx_u_numberofsection            (tx_u_numberofsection), 				//input 8 bits
		.tx_u_dataDirection              (fh_comp_tx_dataDirection	),              //   input,   width = 1,                  .tx_u_dataDirection
		.tx_u_filterIndex                (fh_comp_tx_filterIndex	),                //   input,   width = 4,                  .tx_u_filterIndex
		.tx_u_frameId                    (fh_comp_tx_frameId		),                    //   input,   width = 8,                  .tx_u_frameId
		.tx_u_subframeId                 (fh_comp_tx_subframeId	),                 //   input,   width = 4,                  .tx_u_subframeId
		.tx_u_slotID                     (fh_comp_tx_slotID		),                     //   input,   width = 6,                  .tx_u_slotID
		.tx_u_symbolid                   (fh_comp_tx_symbolid		),                   //   input,   width = 6,                  .tx_u_symbolid
		.tx_u_sectionId                  (fh_comp_tx_sectionId		),                  //   input,  width = 12,                  .tx_u_sectionId
		.tx_u_rb                         (fh_comp_tx_rb			),                         //   input,   width = 1,                  .tx_u_rb
		.tx_u_startPrb                   (fh_comp_tx_startPrb		),                   //   input,  width = 10,                  .tx_u_startPrb
		.tx_u_numPrb                     (fh_comp_tx_numPrb		),                     //   input,   width = 8,                  .tx_u_numPrb
		.tx_u_udCompHdr                  (fh_comp_tx_udCompHdr),                  //   input,   width = 8,                  .tx_u_udCompHdr
		.ext_scs_sel                     (ext_scs_sel),                     //   input,   width = 4,                  .ext_scs_sel
		.tx_transport_c_u                (tx_transport_c_u),                //  output,   width = 1,                  .tx_transport_c_u
		.tx_time_of_day_96b              (tx_time_of_day_96b),              //   input,  width = 96,                  .tx_time_of_day_96b
		.rx_c_dataDirection              (rx_c_dataDirection),              //  output,   width = 1,                  .rx_c_dataDirection
		.rx_c_filterIndex                (rx_c_filterIndex),                //  output,   width = 4,                  .rx_c_filterIndex
		.rx_c_frameId                    (rx_c_frameId),                    //  output,   width = 8,                  .rx_c_frameId
		.rx_c_subframeId                 (rx_c_subframeId),                 //  output,   width = 4,                  .rx_c_subframeId
		.rx_c_slotID                     (rx_c_slotID),                     //  output,   width = 6,                  .rx_c_slotID
		.rx_c_symbolid                   (rx_c_symbolid),                   //  output,   width = 6,                  .rx_c_symbolid
		.rx_c_numberOfsections           (rx_c_numberOfsections),           //  output,   width = 8,                  .rx_c_numberOfsections
		.rx_c_sectionId                  (rx_c_sectionId),                  //  output,  width = 12,                  .rx_c_sectionId
		.rx_c_rb                         (rx_c_rb),                         //  output,   width = 1,                  .rx_c_rb
		.rx_c_symInc                     (rx_c_symInc),                     //  output,   width = 1,                  .rx_c_symInc
		.rx_c_startPrb                   (rx_c_startPrb),                   //  output,  width = 10,                  .rx_c_startPrb
		.rx_c_numPrb                     (rx_c_numPrb),                     //  output,   width = 8,                  .rx_c_numPrb
		.rx_c_udCompHdr                  (rx_c_udCompHdr),                  //  output,   width = 8,                  .rx_c_udCompHdr
		.rx_sec_hdr_valid                (oran_rx_sec_hdr_valid),                //  output,   width = 1,                  .rx_sec_hdr_valid
		.rx_sectionType                  (rx_sectionType),                  //  output,   width = 8,                  .rx_sectionType
		.rx_ext_sectionType              (rx_ext_sectionType),              //  output,   width = 8,                  .rx_ext_sectionType
		.rx_timeOffset                   (rx_timeOffset),                   //  output,  width = 16,                  .rx_timeOffset
		.rx_frameStructure               (rx_frameStructure),               //  output,   width = 8,                  .rx_frameStructure
		.rx_cpLength                     (rx_cpLength),                     //  output,  width = 16,                  .rx_cpLength
		.rx_reMask                       (rx_reMask),                       //  output,  width = 12,                  .rx_reMask
		.rx_numSymbol                    (rx_numSymbol),                    //  output,   width = 4,                  .rx_numSymbol
		.rx_frequencyOffset              (rx_frequencyOffset),              //  output,  width = 24,                  .rx_frequencyOffset
		.rx_ef                           (rx_ef),                           //  output,   width = 1,                  .rx_ef
		.rx_beamid                       (rx_beamid),                       //  output,  width = 15,                  .rx_beamid
		.rx_u_dataDirection              (oran_rx_dataDirection),              //  output,   width = 1,                  .rx_u_dataDirection
		.rx_u_filterIndex                (oran_rx_filterIndex  ),                //  output,   width = 4,                  .rx_u_filterIndex
		.rx_u_frameId                    (oran_rx_frameId      ),                    //  output,   width = 8,                  .rx_u_frameId
		.rx_u_subframeId                 (oran_rx_subframeId   ),                 //  output,   width = 4,                  .rx_u_subframeId
		.rx_u_slotID                     (oran_rx_slotID       ),                     //  output,   width = 6,                  .rx_u_slotID
		.rx_u_symbolid                   (oran_rx_symbolid     ),                   //  output,   width = 6,                  .rx_u_symbolid
		.rx_u_sectionId                  (oran_rx_sectionId    ),                  //  output,  width = 12,                  .rx_u_sectionId
		.rx_u_rb                         (oran_rx_rb           ),                         //  output,   width = 1,                  .rx_u_rb
		.rx_u_startPrb                   (oran_rx_startPrb     ),                   //  output,  width = 10,                  .rx_u_startPrb
		.rx_u_numPrb                     (oran_rx_numPrb       ),                     //  output,   width = 8,                  .rx_u_numPrb
		.rx_u_udCompHdr                  (oran_rx_udCompHdr    ),                  //  output,   width = 8,                  .rx_u_udCompHdr
		.rx_transport_c_u                (rx_transport_c_u),                //   input,   width = 1,                  .rx_transport_c_u
		.rx_time_of_day_96b              (rx_time_of_day_96b),              //   input,  width = 96,                  .rx_time_of_day_96b
		.tx_c_rtc_id                     (tx_c_rtc_id),                     //   input,  width = 16,                  .tx_c_rtc_id
		.tx_c_seq_id                     (tx_c_seq_id),                     //   input,  width = 16,                  .tx_c_seq_id
		.tx_u_pc_id                      (fh_comp_tx_pc_id),                      //   input,  width = 16,                  .tx_u_pc_id
		.tx_u_seq_id                     (fh_comp_tx_seq_id),                     //   input,  width = 16,                  .tx_u_seq_id
		.sink_pc_id                      (sink_pc_id),                      //   input,  width = 16,                  .sink_pc_id
		.sink_rtc_id                     (sink_rtc_id),                     //   input,  width = 16,                  .sink_rtc_id
		.sink_seq_id                     (sink_seq_id),                     //   input,  width = 16,                  .sink_seq_id
		.rx_c_rtc_id                     (rx_c_rtc_id),                     //  output,  width = 16,                  .rx_c_rtc_id
		.rx_c_seq_id                     (rx_c_seq_id),                     //  output,  width = 16,                  .rx_c_seq_id
		.rx_u_pc_id                      (oran_rx_pc_id),                      //  output,  width = 16,                  .rx_u_pc_id
		.rx_u_seq_id                     (oran_rx_seq_id),                     //  output,  width = 16,                  .rx_u_seq_id
		.source_pc_id                    (source_pc_id),                    //  output,  width = 16,                  .source_pc_id
		.source_rtc_id                   (source_rtc_id),                   //  output,  width = 16,                  .source_rtc_id
		.source_seq_id                   (source_seq_id),                   //  output,  width = 16,                  .source_seq_id
		.source_pkt_size                 (source_pkt_size),                 //  output,  width = 16,                  .source_pkt_size
		.tx_lanes_stable                 (tx_lanes_stable),                 //   input,   width = 1,                  .tx_lanes_stable
		.rx_pcs_ready                    (rx_pcs_ready)                     //   input,   width = 1,                  .rx_pcs_ready
	);
	
fh_compress_hwtcl_top u_fh_compress_hwtcl_top (
		.tx_clk                       (clk_tx),                          //   input,    width = 1,         tx_clk.clk
		.rx_clk                       (clk_rx),                          //   input,    width = 1,         rx_clk.clk
		.csr_clk                      (clk_csr),                        //   input,    width = 1,        csr_clk.clk
		.tx_rst_n                     (rst_tx_n),                      //   input,    width = 1,       tx_rst_n.reset
		.rx_rst_n                     (rst_rx_n),                      //   input,    width = 1,       rx_rst_n.reset
		.csr_rst_n                    (rst_csr_n),                    //   input,    width = 1,      csr_rst_n.reset
		.csr_address                  (fh_comp_csr_address),                  //   input,   width = 16,   avalon_slave.address
		.csr_write                    (fh_comp_csr_write),                    //   input,    width = 1,               .write
		.csr_writedata                (fh_comp_csr_writedata),                //   input,   width = 32,               .writedata
		.csr_readdata                 (fh_comp_csr_readdata),                 //  output,   width = 32,               .readdata
		.csr_read                     (fh_comp_csr_read),                     //   input,    width = 1,               .read
		.csr_readdatavalid            (fh_comp_csr_readdatavalid),            //  output,    width = 1,               .readdatavalid
		.csr_waitrequest              (fh_comp_csr_waitrequest),              //  output,    width = 1,               .waitrequest
		.irq                          (fh_comp_irq),                          //  output,    width = 1,    conduit_end.irq
		.tx_metadata_i                (tx_metadata_i),                //   input,  width = 128,               .tx_metadata_i
		.tx_udcomphdr_i               (tx_u_udCompHdr),               //   input,    width = 8,               .tx_udcomphdr_i
		.rx_metadata_o                (rx_metadata_o),                //  output,  width = 128,               .rx_metadata_o
		.rx_udcomphdr_o               (rx_u_udCompHdr),               //  output,    width = 8,               .rx_udcomphdr_o
		.rx_metadata_valid_o          (rx_sec_hdr_valid),          //  output,    width = 1,               .rx_metadata_valid_o
		.tx_metadata_o                (tx_metadata_o),                //  output,  width = 128,               .tx_metadata_o
		.tx_udcomphdr_o               (fh_comp_tx_udCompHdr),               //  output,    width = 8,               .tx_udcomphdr_o
		.rx_metadata_i                (rx_metadata_i),                //   input,  width = 128,               .rx_metadata_i
		.rx_udcomphdr_i               (oran_rx_udCompHdr),               //   input,    width = 8,               .rx_udcomphdr_i
		.rx_metadata_valid_i          (oran_rx_sec_hdr_valid),          //   input,    width = 1,               .rx_metadata_valid_i
		.tx_avst_sink_valid           (avst_sink_u_valid),           //   input,    width = 1,   tx_avst_sink.valid
		.tx_avst_sink_data            (avst_sink_u_data),            //   input,  width = 128,               .data
		.tx_avst_sink_startofpacket   (avst_sink_u_startofpacket),   //   input,    width = 1,               .startofpacket
		.tx_avst_sink_endofpacket     (avst_sink_u_endofpacket),     //   input,    width = 1,               .endofpacket
		.tx_avst_sink_ready           (avst_sink_u_ready),           //  output,    width = 1,               .ready
		.rx_avst_source_valid         (avst_source_u_valid),         //  output,    width = 1, rx_avst_source.valid
		.rx_avst_source_data          (avst_source_u_data),          //  output,  width = 128,               .data
		.rx_avst_source_startofpacket (avst_source_u_startofpacket), //  output,    width = 1,               .startofpacket
		.rx_avst_source_endofpacket   (avst_source_u_endofpacket),   //  output,    width = 1,               .endofpacket
		.rx_avst_source_error         (avst_source_u_error),         //  output,    width = 1,               .error
		.tx_avst_source_valid         (fh_comp_tx_avst_source_valid		   ),         //  output,    width = 1, tx_avst_source.valid
		.tx_avst_source_data          (fh_comp_tx_avst_source_data         ),          //  output,   width = 64,               .data
		.tx_avst_source_startofpacket (fh_comp_tx_avst_source_startofpacket), //  output,    width = 1,               .startofpacket
		.tx_avst_source_endofpacket   (fh_comp_tx_avst_source_endofpacket  ),   //  output,    width = 1,               .endofpacket
		.tx_avst_source_ready         (fh_comp_tx_avst_source_ready        ),         //   input,    width = 1,               .ready
		.tx_avst_source_empty         (fh_comp_tx_avst_source_empty        ),         //  output,    width = 3,               .empty
		.rx_avst_sink_valid           (oran_avst_source_u_valid        ),           //   input,    width = 1,   rx_avst_sink.valid
		.rx_avst_sink_data            (oran_avst_source_u_data         ),            //   input,   width = 64,               .data
		.rx_avst_sink_startofpacket   (oran_avst_source_u_startofpacket),   //   input,    width = 1,               .startofpacket
		.rx_avst_sink_endofpacket     (oran_avst_source_u_endofpacket  ),     //   input,    width = 1,               .endofpacket
		.rx_avst_sink_error           (oran_avst_source_u_error),            //   input,    width = 1,               .error
		.decomp_fs_offset             (decomp_fs_offset),
		.comp_fs_offset               (comp_fs_offset)
	);

assign irq 						= oran_irq & fh_comp_irq;
assign rx_metadata_i[127:96]	='d0;
assign rx_metadata_i[95:80]		=oran_rx_seq_id;
assign rx_metadata_i[79:64]		=oran_rx_pc_id;
assign rx_metadata_i[63:60]		='d0;
assign rx_metadata_i[59]		=oran_rx_dataDirection;
assign rx_metadata_i[58:55]		=oran_rx_filterIndex;
assign rx_metadata_i[54:47]		=oran_rx_frameId;
assign rx_metadata_i[46:43]		=oran_rx_subframeId;
assign rx_metadata_i[42:37]		=oran_rx_slotID;
assign rx_metadata_i[36:31]		=oran_rx_symbolid;
assign rx_metadata_i[30:19]		=oran_rx_sectionId;
assign rx_metadata_i[18] 		=oran_rx_rb;
assign rx_metadata_i[17:8]		=oran_rx_startPrb;
assign rx_metadata_i[7:0]		=oran_rx_numPrb;
assign rx_u_seq_id				=rx_metadata_o[95:80]; 	
assign rx_u_pc_id				=rx_metadata_o[79:64];	
assign rx_u_dataDirection		=rx_metadata_o[59]	;
assign rx_u_filterIndex			=rx_metadata_o[58:55];	
assign rx_u_frameId				=rx_metadata_o[54:47];	
assign rx_u_subframeId			=rx_metadata_o[46:43];	
assign rx_u_slotID				=rx_metadata_o[42:37];	
assign rx_u_symbolid			=rx_metadata_o[36:31];	
assign rx_u_sectionId			=rx_metadata_o[30:19];	
assign rx_u_rb					=rx_metadata_o[18] 	;
assign rx_u_startPrb			=rx_metadata_o[17:8]	;
assign rx_u_numPrb				=rx_metadata_o[7:0]	;
assign tx_metadata_i[127:112]	='d0;
assign tx_metadata_i[111:96]	=tx_u_size;
assign tx_metadata_i[95:80]		=tx_u_seq_id;
assign tx_metadata_i[79:64]		=tx_u_pc_id;
assign tx_metadata_i[63:60]		='d0;
assign tx_metadata_i[59]		=tx_u_dataDirection;
assign tx_metadata_i[58:55]		=tx_u_filterIndex;
assign tx_metadata_i[54:47]		=tx_u_frameId;
assign tx_metadata_i[46:43]		=tx_u_subframeId;
assign tx_metadata_i[42:37]		=tx_u_slotID;
assign tx_metadata_i[36:31]		=tx_u_symbolid;
assign tx_metadata_i[30:19]		=tx_u_sectionId;
assign tx_metadata_i[18] 		=tx_u_rb;
assign tx_metadata_i[17:8]		=tx_u_startPrb;
assign tx_metadata_i[7:0]		=tx_u_numPrb;
assign fh_comp_tx_size			=tx_metadata_o[111:96];
assign fh_comp_tx_seq_id		=tx_metadata_o[95:80]; 	
assign fh_comp_tx_pc_id			=tx_metadata_o[79:64];	
assign fh_comp_tx_dataDirection	=tx_metadata_o[59]	;
assign fh_comp_tx_filterIndex	=tx_metadata_o[58:55];	
assign fh_comp_tx_frameId		=tx_metadata_o[54:47];	
assign fh_comp_tx_subframeId	=tx_metadata_o[46:43];	
assign fh_comp_tx_slotID		=tx_metadata_o[42:37];	
assign fh_comp_tx_symbolid		=tx_metadata_o[36:31];	
assign fh_comp_tx_sectionId		=tx_metadata_o[30:19];	
assign fh_comp_tx_rb			=tx_metadata_o[18] 	;
assign fh_comp_tx_startPrb		=tx_metadata_o[17:8]	;
assign fh_comp_tx_numPrb		=tx_metadata_o[7:0]	;

endmodule
