	tx_dma_prefetcher #(
		.ADDRESS_WIDTH            (INTEGER_VALUE_FOR_ADDRESS_WIDTH),
		.RESPONSE_FIFO_DEPTH      (INTEGER_VALUE_FOR_RESPONSE_FIFO_DEPTH),
		.RESPONSE_FIFO_DEPTH_LOG2 (INTEGER_VALUE_FOR_RESPONSE_FIFO_DEPTH_LOG2)
	) u0 (
		.clk                         (_connected_to_clk_),                         //   input,    width = 1,                              Clock.clk
		.reset                       (_connected_to_reset_),                       //   input,    width = 1,                        Clock_reset.reset
		.mm_read_address             (_connected_to_mm_read_address_),             //  output,   width = 37,             Descriptor_Read_Master.address
		.mm_read_read                (_connected_to_mm_read_read_),                //  output,    width = 1,                                   .read
		.mm_read_readdata            (_connected_to_mm_read_readdata_),            //   input,  width = 128,                                   .readdata
		.mm_read_waitrequest         (_connected_to_mm_read_waitrequest_),         //   input,    width = 1,                                   .waitrequest
		.mm_read_readdatavalid       (_connected_to_mm_read_readdatavalid_),       //   input,    width = 1,                                   .readdatavalid
		.mm_read_burstcount          (_connected_to_mm_read_burstcount_),          //  output,    width = 3,                                   .burstcount
		.mm_write_address            (_connected_to_mm_write_address_),            //  output,   width = 37,            Descriptor_Write_Master.address
		.mm_write_write              (_connected_to_mm_write_write_),              //  output,    width = 1,                                   .write
		.mm_write_byteenable         (_connected_to_mm_write_byteenable_),         //  output,   width = 16,                                   .byteenable
		.mm_write_writedata          (_connected_to_mm_write_writedata_),          //  output,  width = 128,                                   .writedata
		.mm_write_waitrequest        (_connected_to_mm_write_waitrequest_),        //   input,    width = 1,                                   .waitrequest
		.mm_write_response           (_connected_to_mm_write_response_),           //   input,    width = 2,                                   .response
		.mm_write_writeresponsevalid (_connected_to_mm_write_writeresponsevalid_), //   input,    width = 1,                                   .writeresponsevalid
		.st_src_descr_data           (_connected_to_st_src_descr_data_),           //  output,  width = 256, Descriptor_Write_Dispatcher_Source.data
		.st_src_descr_valid          (_connected_to_st_src_descr_valid_),          //  output,    width = 1,                                   .valid
		.st_src_descr_ready          (_connected_to_st_src_descr_ready_),          //   input,    width = 1,                                   .ready
		.st_snk_data                 (_connected_to_st_snk_data_),                 //   input,  width = 256,                      Response_Sink.data
		.st_snk_valid                (_connected_to_st_snk_valid_),                //   input,    width = 1,                                   .valid
		.st_snk_ready                (_connected_to_st_snk_ready_),                //  output,    width = 1,                                   .ready
		.mm_csr_address              (_connected_to_mm_csr_address_),              //   input,    width = 3,                                Csr.address
		.mm_csr_read                 (_connected_to_mm_csr_read_),                 //   input,    width = 1,                                   .read
		.mm_csr_write                (_connected_to_mm_csr_write_),                //   input,    width = 1,                                   .write
		.mm_csr_writedata            (_connected_to_mm_csr_writedata_),            //   input,   width = 32,                                   .writedata
		.mm_csr_readdata             (_connected_to_mm_csr_readdata_),             //  output,   width = 32,                                   .readdata
		.csr_irq                     (_connected_to_csr_irq_)                      //  output,    width = 1,                            Csr_Irq.irq
	);

