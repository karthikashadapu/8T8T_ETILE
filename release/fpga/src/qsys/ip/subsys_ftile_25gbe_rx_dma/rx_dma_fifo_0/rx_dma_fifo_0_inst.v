	rx_dma_fifo_0 #(
		.DEVICE                (STRING_VALUE_FOR_DEVICE),
		.USE_RX_READY          (INTEGER_VALUE_FOR_USE_RX_READY),
		.MEMORY_CAPACITY_WORDS (INTEGER_VALUE_FOR_MEMORY_CAPACITY_WORDS),
		.AVST_DATA_WIDTH       (INTEGER_VALUE_FOR_AVST_DATA_WIDTH),
		.AVST_ERROR_WIDTH      (INTEGER_VALUE_FOR_AVST_ERROR_WIDTH),
		.TS_WIDTH              (INTEGER_VALUE_FOR_TS_WIDTH),
		.TS_RESP_WIDTH         (INTEGER_VALUE_FOR_TS_RESP_WIDTH),
		.AVST_EMPTY_WIDTH      (INTEGER_VALUE_FOR_AVST_EMPTY_WIDTH),
		.TO_CNTR_WIDTH         (INTEGER_VALUE_FOR_TO_CNTR_WIDTH)
	) u0 (
		.in_st_clk         (_connected_to_in_st_clk_),         //   input,                             width = 1,   in_st_clk.clk
		.in_st_rst         (_connected_to_in_st_rst_),         //   input,                             width = 1,   in_st_rst.reset
		.out_st_clk        (_connected_to_out_st_clk_),        //   input,                             width = 1,  out_st_clk.clk
		.out_st_rst        (_connected_to_out_st_rst_),        //   input,                             width = 1,  out_st_rst.reset
		.csr_clk           (_connected_to_csr_clk_),           //   input,                             width = 1,     csr_clk.clk
		.csr_rst           (_connected_to_csr_rst_),           //   input,                             width = 1,     csr_rst.reset
		.in_st_sop         (_connected_to_in_st_sop_),         //   input,                             width = 1,     in_avst.startofpacket
		.in_st_valid       (_connected_to_in_st_valid_),       //   input,                             width = 1,            .valid
		.in_st_eop         (_connected_to_in_st_eop_),         //   input,                             width = 1,            .endofpacket
		.in_st_data        (_connected_to_in_st_data_),        //   input,   width = (((AVST_DATA_WIDTH-1)-0)+1),            .data
		.in_st_empty       (_connected_to_in_st_empty_),       //   input,  width = (((AVST_EMPTY_WIDTH-1)-0)+1),            .empty
		.in_st_error       (_connected_to_in_st_error_),       //   input,  width = (((AVST_ERROR_WIDTH-1)-0)+1),            .error
		.in_ts_valid       (_connected_to_in_ts_valid_),       //   input,                             width = 1,       in_ts.valid
		.in_ts_data        (_connected_to_in_ts_data_),        //   input,          width = (((TS_WIDTH-1)-0)+1),            .data
		.out_st_ready      (_connected_to_out_st_ready_),      //   input,                             width = 1,    out_avst.ready
		.out_st_sop        (_connected_to_out_st_sop_),        //  output,                             width = 1,            .startofpacket
		.out_st_valid      (_connected_to_out_st_valid_),      //  output,                             width = 1,            .valid
		.out_st_eop        (_connected_to_out_st_eop_),        //  output,                             width = 1,            .endofpacket
		.out_st_data       (_connected_to_out_st_data_),       //  output,   width = (((AVST_DATA_WIDTH-1)-0)+1),            .data
		.out_st_empty      (_connected_to_out_st_empty_),      //  output,  width = (((AVST_EMPTY_WIDTH-1)-0)+1),            .empty
		.out_st_error      (_connected_to_out_st_error_),      //  output,  width = (((AVST_ERROR_WIDTH-1)-0)+1),            .error
		.in_ts_resp_ready  (_connected_to_in_ts_resp_ready_),  //  output,                             width = 1,  in_ts_resp.ready
		.in_ts_resp_valid  (_connected_to_in_ts_resp_valid_),  //   input,                             width = 1,            .valid
		.in_ts_resp_data   (_connected_to_in_ts_resp_data_),   //   input,     width = (((TS_RESP_WIDTH-1)-0)+1),            .data
		.out_ts_resp_ready (_connected_to_out_ts_resp_ready_), //   input,                             width = 1, out_ts_resp.ready
		.out_ts_resp_valid (_connected_to_out_ts_resp_valid_), //  output,                             width = 1,            .valid
		.out_ts_resp_data  (_connected_to_out_ts_resp_data_)   //  output,     width = (((TS_RESP_WIDTH-1)-0)+1),            .data
	);

