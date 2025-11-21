module subsys_ftile_25gbe_1588 #(
		parameter FP_WIDTH = 8
	) (
		input  wire         rx_dma_resetn,                                               //                                   rx_dma_resetn.reset_n
		output wire         csr_waitrequest,                                             //                                             csr.waitrequest
		output wire [31:0]  csr_readdata,                                                //                                                .readdata
		output wire         csr_readdatavalid,                                           //                                                .readdatavalid
		input  wire [0:0]   csr_burstcount,                                              //                                                .burstcount
		input  wire [31:0]  csr_writedata,                                               //                                                .writedata
		input  wire [7:0]   csr_address,                                                 //                                                .address
		input  wire         csr_write,                                                   //                                                .write
		input  wire         csr_read,                                                    //                                                .read
		input  wire [3:0]   csr_byteenable,                                              //                                                .byteenable
		input  wire         csr_debugaccess,                                             //                                                .debugaccess
		input  wire         clk_clk,                                                     //                                             clk.clk
		input  wire         subsys_ftile_25gbe_1588_dmaclkout_in_clk_clk,                //        subsys_ftile_25gbe_1588_dmaclkout_in_clk.clk
		input  wire         subsys_ftile_25gbe_1588_o_pll_clk_in_clk_clk,                //        subsys_ftile_25gbe_1588_o_pll_clk_in_clk.clk
		input  wire         reset_reset_n,                                               //                                           reset.reset_n
		input  wire         ftile_25gbe_rx_dma_ch1_pktin_startofpacket,                  //                    ftile_25gbe_rx_dma_ch1_pktin.startofpacket
		input  wire         ftile_25gbe_rx_dma_ch1_pktin_valid,                          //                                                .valid
		input  wire         ftile_25gbe_rx_dma_ch1_pktin_endofpacket,                    //                                                .endofpacket
		input  wire [63:0]  ftile_25gbe_rx_dma_ch1_pktin_data,                           //                                                .data
		input  wire [2:0]   ftile_25gbe_rx_dma_ch1_pktin_empty,                          //                                                .empty
		input  wire [5:0]   ftile_25gbe_rx_dma_ch1_pktin_error,                          //                                                .error
		input  wire         ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid,            //      ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts.valid
		input  wire [95:0]  ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data,             //                                                .data
		output wire [36:0]  rx_dma_ch1_prefetcher_read_master_address,                   //               rx_dma_ch1_prefetcher_read_master.address
		output wire         rx_dma_ch1_prefetcher_read_master_read,                      //                                                .read
		input  wire [127:0] rx_dma_ch1_prefetcher_read_master_readdata,                  //                                                .readdata
		input  wire         rx_dma_ch1_prefetcher_read_master_waitrequest,               //                                                .waitrequest
		input  wire         rx_dma_ch1_prefetcher_read_master_readdatavalid,             //                                                .readdatavalid
		output wire [2:0]   rx_dma_ch1_prefetcher_read_master_burstcount,                //                                                .burstcount
		output wire [36:0]  rx_dma_ch1_prefetcher_write_master_address,                  //              rx_dma_ch1_prefetcher_write_master.address
		output wire         rx_dma_ch1_prefetcher_write_master_write,                    //                                                .write
		output wire [15:0]  rx_dma_ch1_prefetcher_write_master_byteenable,               //                                                .byteenable
		output wire [127:0] rx_dma_ch1_prefetcher_write_master_writedata,                //                                                .writedata
		input  wire         rx_dma_ch1_prefetcher_write_master_waitrequest,              //                                                .waitrequest
		input  wire [1:0]   rx_dma_ch1_prefetcher_write_master_response,                 //                                                .response
		input  wire         rx_dma_ch1_prefetcher_write_master_writeresponsevalid,       //                                                .writeresponsevalid
		output wire         rx_dma_ch1_irq_irq,                                          //                                  rx_dma_ch1_irq.irq
		output wire [36:0]  rx_dma_ch1_write_master_address,                             //                         rx_dma_ch1_write_master.address
		output wire         rx_dma_ch1_write_master_write,                               //                                                .write
		output wire [15:0]  rx_dma_ch1_write_master_byteenable,                          //                                                .byteenable
		output wire [127:0] rx_dma_ch1_write_master_writedata,                           //                                                .writedata
		input  wire         rx_dma_ch1_write_master_waitrequest,                         //                                                .waitrequest
		output wire [4:0]   rx_dma_ch1_write_master_burstcount,                          //                                                .burstcount
		input  wire [1:0]   rx_dma_ch1_write_master_response,                            //                                                .response
		input  wire         rx_dma_ch1_write_master_writeresponsevalid,                  //                                                .writeresponsevalid
		input  wire [0:0]   ts_chs_compl_0_clk_bus_in_clk,                               //                       ts_chs_compl_0_clk_bus_in.clk
		input  wire [0:0]   ts_chs_compl_0_rst_bus_in_reset,                             //                       ts_chs_compl_0_rst_bus_in.reset
		input  wire [0:0]   ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid,            //      ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts.valid
		input  wire [19:0]  ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint,      //                                                .fingerprint
		input  wire [95:0]  ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data,             //                                                .data
		input  wire         ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_ready,           //     ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st.ready
		output wire         ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_startofpacket,   //                                                .startofpacket
		output wire         ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_valid,           //                                                .valid
		output wire         ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_endofpacket,     //                                                .endofpacket
		output wire [63:0]  ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_data,            //                                                .data
		output wire [2:0]   ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_empty,           //                                                .empty
		output wire [0:0]   ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_error,           //                                                .error
		output wire         ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid,       // ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req.valid
		output wire [19:0]  ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint, //                                                .fingerprint
		output wire [36:0]  tx_dma_ch1_prefetcher_read_master_address,                   //               tx_dma_ch1_prefetcher_read_master.address
		output wire         tx_dma_ch1_prefetcher_read_master_read,                      //                                                .read
		input  wire [127:0] tx_dma_ch1_prefetcher_read_master_readdata,                  //                                                .readdata
		input  wire         tx_dma_ch1_prefetcher_read_master_waitrequest,               //                                                .waitrequest
		input  wire         tx_dma_ch1_prefetcher_read_master_readdatavalid,             //                                                .readdatavalid
		output wire [2:0]   tx_dma_ch1_prefetcher_read_master_burstcount,                //                                                .burstcount
		output wire [36:0]  tx_dma_ch1_prefetcher_write_master_address,                  //              tx_dma_ch1_prefetcher_write_master.address
		output wire         tx_dma_ch1_prefetcher_write_master_write,                    //                                                .write
		output wire [15:0]  tx_dma_ch1_prefetcher_write_master_byteenable,               //                                                .byteenable
		output wire [127:0] tx_dma_ch1_prefetcher_write_master_writedata,                //                                                .writedata
		input  wire         tx_dma_ch1_prefetcher_write_master_waitrequest,              //                                                .waitrequest
		input  wire [1:0]   tx_dma_ch1_prefetcher_write_master_response,                 //                                                .response
		input  wire         tx_dma_ch1_prefetcher_write_master_writeresponsevalid,       //                                                .writeresponsevalid
		output wire         tx_dma_ch1_irq_irq,                                          //                                  tx_dma_ch1_irq.irq
		output wire [36:0]  tx_dma_ch1_read_master_address,                              //                          tx_dma_ch1_read_master.address
		output wire         tx_dma_ch1_read_master_read,                                 //                                                .read
		output wire [15:0]  tx_dma_ch1_read_master_byteenable,                           //                                                .byteenable
		input  wire [127:0] tx_dma_ch1_read_master_readdata,                             //                                                .readdata
		input  wire         tx_dma_ch1_read_master_waitrequest,                          //                                                .waitrequest
		input  wire         tx_dma_ch1_read_master_readdatavalid,                        //                                                .readdatavalid
		output wire [4:0]   tx_dma_ch1_read_master_burstcount                            //                                                .burstcount
	);
endmodule

