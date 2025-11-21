module oran_hwtcl_top (
		input  wire        clk_tx,                          //            clk_tx.clk
		input  wire        clk_rx,                          //            clk_rx.clk
		input  wire        clk_csr,                         //           clk_csr.clk
		input  wire        rst_tx_n,                        //          rst_tx_n.reset_n
		input  wire        rst_rx_n,                        //          rst_rx_n.reset_n
		input  wire        rst_csr_n,                       //         rst_csr_n.reset_n
		input  wire        avst_sink_u_valid,               //       avst_sink_u.valid
		input  wire [63:0] avst_sink_u_data,                //                  .data
		input  wire        avst_sink_u_startofpacket,       //                  .startofpacket
		input  wire        avst_sink_u_endofpacket,         //                  .endofpacket
		output wire        avst_sink_u_ready,               //                  .ready
		input  wire [2:0]  avst_sink_u_empty,               //                  .empty
		input  wire        avst_sink_c_valid,               //       avst_sink_c.valid
		input  wire        avst_sink_c_startofpacket,       //                  .startofpacket
		input  wire        avst_sink_c_endofpacket,         //                  .endofpacket
		output wire        avst_sink_c_ready,               //                  .ready
		input  wire        avst_sink_c_ext_valid,           //   avst_sink_c_ext.valid
		input  wire [63:0] avst_sink_c_ext_data,            //                  .data
		input  wire        avst_sink_c_ext_startofpacket,   //                  .startofpacket
		input  wire        avst_sink_c_ext_endofpacket,     //                  .endofpacket
		input  wire [2:0]  avst_sink_c_ext_empty,           //                  .empty
		output wire        avst_sink_c_ext_ready,           //                  .ready
		output wire        avst_source_valid,               //       avst_source.valid
		output wire [63:0] avst_source_data,                //                  .data
		output wire        avst_source_startofpacket,       //                  .startofpacket
		output wire        avst_source_endofpacket,         //                  .endofpacket
		output wire [2:0]  avst_source_empty,               //                  .empty
		input  wire        avst_source_ready,               //                  .ready
		output wire        avst_source_u_valid,             //     avst_source_u.valid
		output wire [63:0] avst_source_u_data,              //                  .data
		output wire        avst_source_u_startofpacket,     //                  .startofpacket
		output wire        avst_source_u_endofpacket,       //                  .endofpacket
		output wire [2:0]  avst_source_u_empty,             //                  .empty
		output wire        avst_source_u_error,             //                  .error
		output wire        avst_source_c_valid,             //     avst_source_c.valid
		output wire        avst_source_c_startofpacket,     //                  .startofpacket
		output wire        avst_source_c_endofpacket,       //                  .endofpacket
		output wire        avst_source_c_error,             //                  .error
		output wire        avst_source_c_ext_valid,         // avst_source_c_ext.valid
		output wire [63:0] avst_source_c_ext_data,          //                  .data
		output wire        avst_source_c_ext_startofpacket, //                  .startofpacket
		output wire        avst_source_c_ext_endofpacket,   //                  .endofpacket
		output wire [2:0]  avst_source_c_ext_empty,         //                  .empty
		output wire        avst_source_c_ext_error,         //                  .error
		input  wire        avst_sink_valid,                 //         avst_sink.valid
		input  wire [63:0] avst_sink_data,                  //                  .data
		input  wire        avst_sink_startofpacket,         //                  .startofpacket
		input  wire        avst_sink_endofpacket,           //                  .endofpacket
		input  wire [2:0]  avst_sink_empty,                 //                  .empty
		input  wire        avst_sink_error,                 //                  .error
		input  wire [15:0] csr_address,                     //      avalon_slave.address
		input  wire        csr_write,                       //                  .write
		input  wire [31:0] csr_writedata,                   //                  .writedata
		output wire [31:0] csr_readdata,                    //                  .readdata
		input  wire        csr_read,                        //                  .read
		output wire        csr_readdatavalid,               //                  .readdatavalid
		output wire        csr_waitrequest,                 //                  .waitrequest
		output wire        irq,                             //       conduit_end.irq
		input  wire [15:0] tx_c_size,                       //                  .tx_c_size
		input  wire        tx_c_dataDirection,              //                  .tx_c_dataDirection
		input  wire [3:0]  tx_c_filterIndex,                //                  .tx_c_filterIndex
		input  wire [7:0]  tx_c_frameId,                    //                  .tx_c_frameId
		input  wire [3:0]  tx_c_subframeId,                 //                  .tx_c_subframeId
		input  wire [5:0]  tx_c_slotID,                     //                  .tx_c_slotID
		input  wire [5:0]  tx_c_symbolid,                   //                  .tx_c_symbolid
		input  wire [11:0] tx_c_sectionId,                  //                  .tx_c_sectionId
		input  wire        tx_c_rb,                         //                  .tx_c_rb
		input  wire [9:0]  tx_c_startPrb,                   //                  .tx_c_startPrb
		input  wire [7:0]  tx_c_numPrb,                     //                  .tx_c_numPrb
		input  wire [7:0]  tx_c_udCompHdr,                  //                  .tx_c_udCompHdr
		input  wire [7:0]  tx_sectionType,                  //                  .tx_sectionType
		input  wire [7:0]  tx_ext_sectionType,              //                  .tx_ext_sectionType
		input  wire [15:0] tx_timeOffset,                   //                  .tx_timeOffset
		input  wire [7:0]  tx_frameStructure,               //                  .tx_frameStructure
		input  wire [15:0] tx_cpLength,                     //                  .tx_cpLength
		input  wire [11:0] tx_reMask,                       //                  .tx_reMask
		input  wire [3:0]  tx_numSymbol,                    //                  .tx_numSymbol
		input  wire        tx_ef,                           //                  .tx_ef
		input  wire [23:0] tx_frequencyOffset,              //                  .tx_frequencyOffset
		input  wire [14:0] tx_beamid,                       //                  .tx_beamid
		input  wire [15:0] tx_u_prbusize,                   //                  .tx_u_prbusize
		input  wire [7:0]  tx_u_numberofsection,            //                  .tx_u_numberofsection
		input  wire        tx_u_dataDirection,              //                  .tx_u_dataDirection
		input  wire [3:0]  tx_u_filterIndex,                //                  .tx_u_filterIndex
		input  wire [7:0]  tx_u_frameId,                    //                  .tx_u_frameId
		input  wire [3:0]  tx_u_subframeId,                 //                  .tx_u_subframeId
		input  wire [5:0]  tx_u_slotID,                     //                  .tx_u_slotID
		input  wire [5:0]  tx_u_symbolid,                   //                  .tx_u_symbolid
		input  wire [11:0] tx_u_sectionId,                  //                  .tx_u_sectionId
		input  wire        tx_u_rb,                         //                  .tx_u_rb
		input  wire [9:0]  tx_u_startPrb,                   //                  .tx_u_startPrb
		input  wire [7:0]  tx_u_numPrb,                     //                  .tx_u_numPrb
		input  wire [7:0]  tx_u_udCompHdr,                  //                  .tx_u_udCompHdr
		input  wire [3:0]  ext_scs_sel,                     //                  .ext_scs_sel
		output wire        tx_transport_c_u,                //                  .tx_transport_c_u
		input  wire [95:0] tx_time_of_day_96b,              //                  .tx_time_of_day_96b
		output wire        rx_c_dataDirection,              //                  .rx_c_dataDirection
		output wire [3:0]  rx_c_filterIndex,                //                  .rx_c_filterIndex
		output wire [7:0]  rx_c_frameId,                    //                  .rx_c_frameId
		output wire [3:0]  rx_c_subframeId,                 //                  .rx_c_subframeId
		output wire [5:0]  rx_c_slotID,                     //                  .rx_c_slotID
		output wire [5:0]  rx_c_symbolid,                   //                  .rx_c_symbolid
		output wire [7:0]  rx_c_numberOfsections,           //                  .rx_c_numberOfsections
		output wire [11:0] rx_c_sectionId,                  //                  .rx_c_sectionId
		output wire        rx_c_rb,                         //                  .rx_c_rb
		output wire        rx_c_symInc,                     //                  .rx_c_symInc
		output wire [9:0]  rx_c_startPrb,                   //                  .rx_c_startPrb
		output wire [7:0]  rx_c_numPrb,                     //                  .rx_c_numPrb
		output wire [7:0]  rx_c_udCompHdr,                  //                  .rx_c_udCompHdr
		output wire        rx_sec_hdr_valid,                //                  .rx_sec_hdr_valid
		output wire [7:0]  rx_sectionType,                  //                  .rx_sectionType
		output wire [7:0]  rx_ext_sectionType,              //                  .rx_ext_sectionType
		output wire [15:0] rx_timeOffset,                   //                  .rx_timeOffset
		output wire [7:0]  rx_frameStructure,               //                  .rx_frameStructure
		output wire [15:0] rx_cpLength,                     //                  .rx_cpLength
		output wire [11:0] rx_reMask,                       //                  .rx_reMask
		output wire [3:0]  rx_numSymbol,                    //                  .rx_numSymbol
		output wire [23:0] rx_frequencyOffset,              //                  .rx_frequencyOffset
		output wire        rx_ef,                           //                  .rx_ef
		output wire [14:0] rx_beamid,                       //                  .rx_beamid
		output wire        rx_u_dataDirection,              //                  .rx_u_dataDirection
		output wire [3:0]  rx_u_filterIndex,                //                  .rx_u_filterIndex
		output wire [7:0]  rx_u_frameId,                    //                  .rx_u_frameId
		output wire [3:0]  rx_u_subframeId,                 //                  .rx_u_subframeId
		output wire [5:0]  rx_u_slotID,                     //                  .rx_u_slotID
		output wire [5:0]  rx_u_symbolid,                   //                  .rx_u_symbolid
		output wire [11:0] rx_u_sectionId,                  //                  .rx_u_sectionId
		output wire        rx_u_rb,                         //                  .rx_u_rb
		output wire [9:0]  rx_u_startPrb,                   //                  .rx_u_startPrb
		output wire [7:0]  rx_u_numPrb,                     //                  .rx_u_numPrb
		output wire [7:0]  rx_u_udCompHdr,                  //                  .rx_u_udCompHdr
		input  wire        rx_transport_c_u,                //                  .rx_transport_c_u
		input  wire [95:0] rx_time_of_day_96b,              //                  .rx_time_of_day_96b
		input  wire [15:0] tx_c_rtc_id,                     //                  .tx_c_rtc_id
		input  wire [15:0] tx_c_seq_id,                     //                  .tx_c_seq_id
		input  wire [15:0] tx_u_pc_id,                      //                  .tx_u_pc_id
		input  wire [15:0] tx_u_seq_id,                     //                  .tx_u_seq_id
		input  wire [15:0] sink_pc_id,                      //                  .sink_pc_id
		input  wire [15:0] sink_rtc_id,                     //                  .sink_rtc_id
		input  wire [15:0] sink_seq_id,                     //                  .sink_seq_id
		output wire [15:0] rx_c_rtc_id,                     //                  .rx_c_rtc_id
		output wire [15:0] rx_c_seq_id,                     //                  .rx_c_seq_id
		output wire [15:0] rx_u_pc_id,                      //                  .rx_u_pc_id
		output wire [15:0] rx_u_seq_id,                     //                  .rx_u_seq_id
		output wire [15:0] source_pc_id,                    //                  .source_pc_id
		output wire [15:0] source_rtc_id,                   //                  .source_rtc_id
		output wire [15:0] source_seq_id,                   //                  .source_seq_id
		output wire [15:0] source_pkt_size,                 //                  .source_pkt_size
		input  wire        tx_lanes_stable,                 //                  .tx_lanes_stable
		input  wire        rx_pcs_ready                     //                  .rx_pcs_ready
	);
endmodule

