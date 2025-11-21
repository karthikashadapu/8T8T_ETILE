	subsys_ftile_25gbe_tx_dma #(
		.FP_WIDTH (INTEGER_VALUE_FOR_FP_WIDTH)
	) u0 (
		.ts_chs_compl_0_clk_bus_in_clk              (_connected_to_ts_chs_compl_0_clk_bus_in_clk_),              //   input,    width = 1, ts_chs_compl_0_clk_bus_in.clk
		.ts_chs_compl_0_rst_bus_in_reset            (_connected_to_ts_chs_compl_0_rst_bus_in_reset_),            //   input,    width = 1, ts_chs_compl_0_rst_bus_in.reset
		.ts_chs_compl_0_i_ts_valid                  (_connected_to_ts_chs_compl_0_i_ts_valid_),                  //   input,    width = 1,       ts_chs_compl_0_i_ts.valid
		.ts_chs_compl_0_i_ts_fingerprint            (_connected_to_ts_chs_compl_0_i_ts_fingerprint_),            //   input,   width = 20,                          .fingerprint
		.ts_chs_compl_0_i_ts_data                   (_connected_to_ts_chs_compl_0_i_ts_data_),                   //   input,   width = 96,                          .data
		.dma_clk_clk                                (_connected_to_dma_clk_clk_),                                //   input,    width = 1,                   dma_clk.clk
		.csr_waitrequest                            (_connected_to_csr_waitrequest_),                            //  output,    width = 1,                       csr.waitrequest
		.csr_readdata                               (_connected_to_csr_readdata_),                               //  output,   width = 32,                          .readdata
		.csr_readdatavalid                          (_connected_to_csr_readdatavalid_),                          //  output,    width = 1,                          .readdatavalid
		.csr_burstcount                             (_connected_to_csr_burstcount_),                             //   input,    width = 1,                          .burstcount
		.csr_writedata                              (_connected_to_csr_writedata_),                              //   input,   width = 32,                          .writedata
		.csr_address                                (_connected_to_csr_address_),                                //   input,    width = 6,                          .address
		.csr_write                                  (_connected_to_csr_write_),                                  //   input,    width = 1,                          .write
		.csr_read                                   (_connected_to_csr_read_),                                   //   input,    width = 1,                          .read
		.csr_byteenable                             (_connected_to_csr_byteenable_),                             //   input,    width = 4,                          .byteenable
		.csr_debugaccess                            (_connected_to_csr_debugaccess_),                            //   input,    width = 1,                          .debugaccess
		.tx_dma_fifo_0_out_st_ready                 (_connected_to_tx_dma_fifo_0_out_st_ready_),                 //   input,    width = 1,      tx_dma_fifo_0_out_st.ready
		.tx_dma_fifo_0_out_st_startofpacket         (_connected_to_tx_dma_fifo_0_out_st_startofpacket_),         //  output,    width = 1,                          .startofpacket
		.tx_dma_fifo_0_out_st_valid                 (_connected_to_tx_dma_fifo_0_out_st_valid_),                 //  output,    width = 1,                          .valid
		.tx_dma_fifo_0_out_st_endofpacket           (_connected_to_tx_dma_fifo_0_out_st_endofpacket_),           //  output,    width = 1,                          .endofpacket
		.tx_dma_fifo_0_out_st_data                  (_connected_to_tx_dma_fifo_0_out_st_data_),                  //  output,   width = 64,                          .data
		.tx_dma_fifo_0_out_st_empty                 (_connected_to_tx_dma_fifo_0_out_st_empty_),                 //  output,    width = 3,                          .empty
		.tx_dma_fifo_0_out_st_error                 (_connected_to_tx_dma_fifo_0_out_st_error_),                 //  output,    width = 1,                          .error
		.tx_dma_fifo_0_out_ts_req_valid             (_connected_to_tx_dma_fifo_0_out_ts_req_valid_),             //  output,    width = 1,  tx_dma_fifo_0_out_ts_req.valid
		.tx_dma_fifo_0_out_ts_req_fingerprint       (_connected_to_tx_dma_fifo_0_out_ts_req_fingerprint_),       //  output,   width = 20,                          .fingerprint
		.ftile_clk_clk                              (_connected_to_ftile_clk_clk_),                              //   input,    width = 1,                 ftile_clk.clk
		.prefetcher_read_master_address             (_connected_to_prefetcher_read_master_address_),             //  output,   width = 37,    prefetcher_read_master.address
		.prefetcher_read_master_read                (_connected_to_prefetcher_read_master_read_),                //  output,    width = 1,                          .read
		.prefetcher_read_master_readdata            (_connected_to_prefetcher_read_master_readdata_),            //   input,  width = 128,                          .readdata
		.prefetcher_read_master_waitrequest         (_connected_to_prefetcher_read_master_waitrequest_),         //   input,    width = 1,                          .waitrequest
		.prefetcher_read_master_readdatavalid       (_connected_to_prefetcher_read_master_readdatavalid_),       //   input,    width = 1,                          .readdatavalid
		.prefetcher_read_master_burstcount          (_connected_to_prefetcher_read_master_burstcount_),          //  output,    width = 3,                          .burstcount
		.prefetcher_write_master_address            (_connected_to_prefetcher_write_master_address_),            //  output,   width = 37,   prefetcher_write_master.address
		.prefetcher_write_master_write              (_connected_to_prefetcher_write_master_write_),              //  output,    width = 1,                          .write
		.prefetcher_write_master_byteenable         (_connected_to_prefetcher_write_master_byteenable_),         //  output,   width = 16,                          .byteenable
		.prefetcher_write_master_writedata          (_connected_to_prefetcher_write_master_writedata_),          //  output,  width = 128,                          .writedata
		.prefetcher_write_master_waitrequest        (_connected_to_prefetcher_write_master_waitrequest_),        //   input,    width = 1,                          .waitrequest
		.prefetcher_write_master_response           (_connected_to_prefetcher_write_master_response_),           //   input,    width = 2,                          .response
		.prefetcher_write_master_writeresponsevalid (_connected_to_prefetcher_write_master_writeresponsevalid_), //   input,    width = 1,                          .writeresponsevalid
		.irq_irq                                    (_connected_to_irq_irq_),                                    //  output,    width = 1,                       irq.irq
		.read_master_address                        (_connected_to_read_master_address_),                        //  output,   width = 37,               read_master.address
		.read_master_read                           (_connected_to_read_master_read_),                           //  output,    width = 1,                          .read
		.read_master_byteenable                     (_connected_to_read_master_byteenable_),                     //  output,   width = 16,                          .byteenable
		.read_master_readdata                       (_connected_to_read_master_readdata_),                       //   input,  width = 128,                          .readdata
		.read_master_waitrequest                    (_connected_to_read_master_waitrequest_),                    //   input,    width = 1,                          .waitrequest
		.read_master_readdatavalid                  (_connected_to_read_master_readdatavalid_),                  //   input,    width = 1,                          .readdatavalid
		.read_master_burstcount                     (_connected_to_read_master_burstcount_),                     //  output,    width = 5,                          .burstcount
		.reset_reset_n                              (_connected_to_reset_reset_n_)                               //   input,    width = 1,                     reset.reset_n
	);

