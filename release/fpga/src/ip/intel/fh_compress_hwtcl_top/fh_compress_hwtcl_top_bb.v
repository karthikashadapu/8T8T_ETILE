module fh_compress_hwtcl_top (
		input  wire         tx_clk,                       //         tx_clk.clk
		input  wire         rx_clk,                       //         rx_clk.clk
		input  wire         csr_clk,                      //        csr_clk.clk
		input  wire         tx_rst_n,                     //       tx_rst_n.reset
		input  wire         rx_rst_n,                     //       rx_rst_n.reset
		input  wire         csr_rst_n,                    //      csr_rst_n.reset
		input  wire [15:0]  csr_address,                  //   avalon_slave.address
		input  wire         csr_write,                    //               .write
		input  wire [31:0]  csr_writedata,                //               .writedata
		output wire [31:0]  csr_readdata,                 //               .readdata
		input  wire         csr_read,                     //               .read
		output wire         csr_readdatavalid,            //               .readdatavalid
		output wire         csr_waitrequest,              //               .waitrequest
		output wire         irq,                          //    conduit_end.irq
		input  wire [127:0] tx_metadata_i,                //               .tx_metadata_i
		input  wire [7:0]   tx_udcomphdr_i,               //               .tx_udcomphdr_i
		input  wire [3:0]   comp_fs_offset,               //               .comp_fs_offset
		output wire [127:0] rx_metadata_o,                //               .rx_metadata_o
		output wire [7:0]   rx_udcomphdr_o,               //               .rx_udcomphdr_o
		output wire         rx_metadata_valid_o,          //               .rx_metadata_valid_o
		output wire [127:0] tx_metadata_o,                //               .tx_metadata_o
		output wire [7:0]   tx_udcomphdr_o,               //               .tx_udcomphdr_o
		input  wire [127:0] rx_metadata_i,                //               .rx_metadata_i
		input  wire [7:0]   rx_udcomphdr_i,               //               .rx_udcomphdr_i
		input  wire         rx_metadata_valid_i,          //               .rx_metadata_valid_i
		input  wire [3:0]   decomp_fs_offset,             //               .decomp_fs_offset
		input  wire         tx_avst_sink_valid,           //   tx_avst_sink.valid
		input  wire [127:0] tx_avst_sink_data,            //               .data
		input  wire         tx_avst_sink_startofpacket,   //               .startofpacket
		input  wire         tx_avst_sink_endofpacket,     //               .endofpacket
		output wire         tx_avst_sink_ready,           //               .ready
		output wire         rx_avst_source_valid,         // rx_avst_source.valid
		output wire [127:0] rx_avst_source_data,          //               .data
		output wire         rx_avst_source_startofpacket, //               .startofpacket
		output wire         rx_avst_source_endofpacket,   //               .endofpacket
		output wire         rx_avst_source_error,         //               .error
		output wire         tx_avst_source_valid,         // tx_avst_source.valid
		output wire [63:0]  tx_avst_source_data,          //               .data
		output wire         tx_avst_source_startofpacket, //               .startofpacket
		output wire         tx_avst_source_endofpacket,   //               .endofpacket
		input  wire         tx_avst_source_ready,         //               .ready
		output wire [2:0]   tx_avst_source_empty,         //               .empty
		input  wire         rx_avst_sink_valid,           //   rx_avst_sink.valid
		input  wire [63:0]  rx_avst_sink_data,            //               .data
		input  wire         rx_avst_sink_startofpacket,   //               .startofpacket
		input  wire         rx_avst_sink_endofpacket,     //               .endofpacket
		input  wire         rx_avst_sink_error            //               .error
	);
endmodule

