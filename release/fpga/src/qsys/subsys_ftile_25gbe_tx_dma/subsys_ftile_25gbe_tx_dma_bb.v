module subsys_ftile_25gbe_tx_dma #(
		parameter FP_WIDTH = 8
	) (
		input  wire [0:0]   ts_chs_compl_0_clk_bus_in_clk,              // ts_chs_compl_0_clk_bus_in.clk
		input  wire [0:0]   ts_chs_compl_0_rst_bus_in_reset,            // ts_chs_compl_0_rst_bus_in.reset
		input  wire [0:0]   ts_chs_compl_0_i_ts_valid,                  //       ts_chs_compl_0_i_ts.valid
		input  wire [19:0]  ts_chs_compl_0_i_ts_fingerprint,            //                          .fingerprint
		input  wire [95:0]  ts_chs_compl_0_i_ts_data,                   //                          .data
		input  wire         dma_clk_clk,                                //                   dma_clk.clk
		output wire         csr_waitrequest,                            //                       csr.waitrequest
		output wire [31:0]  csr_readdata,                               //                          .readdata
		output wire         csr_readdatavalid,                          //                          .readdatavalid
		input  wire [0:0]   csr_burstcount,                             //                          .burstcount
		input  wire [31:0]  csr_writedata,                              //                          .writedata
		input  wire [5:0]   csr_address,                                //                          .address
		input  wire         csr_write,                                  //                          .write
		input  wire         csr_read,                                   //                          .read
		input  wire [3:0]   csr_byteenable,                             //                          .byteenable
		input  wire         csr_debugaccess,                            //                          .debugaccess
		input  wire         tx_dma_fifo_0_out_st_ready,                 //      tx_dma_fifo_0_out_st.ready
		output wire         tx_dma_fifo_0_out_st_startofpacket,         //                          .startofpacket
		output wire         tx_dma_fifo_0_out_st_valid,                 //                          .valid
		output wire         tx_dma_fifo_0_out_st_endofpacket,           //                          .endofpacket
		output wire [63:0]  tx_dma_fifo_0_out_st_data,                  //                          .data
		output wire [2:0]   tx_dma_fifo_0_out_st_empty,                 //                          .empty
		output wire [0:0]   tx_dma_fifo_0_out_st_error,                 //                          .error
		output wire         tx_dma_fifo_0_out_ts_req_valid,             //  tx_dma_fifo_0_out_ts_req.valid
		output wire [19:0]  tx_dma_fifo_0_out_ts_req_fingerprint,       //                          .fingerprint
		input  wire         ftile_clk_clk,                              //                 ftile_clk.clk
		output wire [36:0]  prefetcher_read_master_address,             //    prefetcher_read_master.address
		output wire         prefetcher_read_master_read,                //                          .read
		input  wire [127:0] prefetcher_read_master_readdata,            //                          .readdata
		input  wire         prefetcher_read_master_waitrequest,         //                          .waitrequest
		input  wire         prefetcher_read_master_readdatavalid,       //                          .readdatavalid
		output wire [2:0]   prefetcher_read_master_burstcount,          //                          .burstcount
		output wire [36:0]  prefetcher_write_master_address,            //   prefetcher_write_master.address
		output wire         prefetcher_write_master_write,              //                          .write
		output wire [15:0]  prefetcher_write_master_byteenable,         //                          .byteenable
		output wire [127:0] prefetcher_write_master_writedata,          //                          .writedata
		input  wire         prefetcher_write_master_waitrequest,        //                          .waitrequest
		input  wire [1:0]   prefetcher_write_master_response,           //                          .response
		input  wire         prefetcher_write_master_writeresponsevalid, //                          .writeresponsevalid
		output wire         irq_irq,                                    //                       irq.irq
		output wire [36:0]  read_master_address,                        //               read_master.address
		output wire         read_master_read,                           //                          .read
		output wire [15:0]  read_master_byteenable,                     //                          .byteenable
		input  wire [127:0] read_master_readdata,                       //                          .readdata
		input  wire         read_master_waitrequest,                    //                          .waitrequest
		input  wire         read_master_readdatavalid,                  //                          .readdatavalid
		output wire [4:0]   read_master_burstcount,                     //                          .burstcount
		input  wire         reset_reset_n                               //                     reset.reset_n
	);
endmodule

