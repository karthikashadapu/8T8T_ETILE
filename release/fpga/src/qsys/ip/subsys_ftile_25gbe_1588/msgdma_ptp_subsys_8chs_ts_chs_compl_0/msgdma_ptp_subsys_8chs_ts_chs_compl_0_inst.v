	msgdma_ptp_subsys_8chs_ts_chs_compl_0 #(
		.NUM_PORTS        (INTEGER_VALUE_FOR_NUM_PORTS),
		.ID_WIDTH         (INTEGER_VALUE_FOR_ID_WIDTH),
		.DATA_WIDTH       (INTEGER_VALUE_FOR_DATA_WIDTH),
		.TO_CNTR_WIDTH    (INTEGER_VALUE_FOR_TO_CNTR_WIDTH),
		.CHANNEL_WIDTH    (INTEGER_VALUE_FOR_CHANNEL_WIDTH),
		.FP_WIDTH         (INTEGER_VALUE_FOR_FP_WIDTH),
		.AVST_DATA_WIDTH  (INTEGER_VALUE_FOR_AVST_DATA_WIDTH),
		.AVST_ERROR_WIDTH (INTEGER_VALUE_FOR_AVST_ERROR_WIDTH),
		.AVST_EMPTY_WIDTH (INTEGER_VALUE_FOR_AVST_EMPTY_WIDTH)
	) u0 (
		.i_ts_req_clk (_connected_to_i_ts_req_clk_), //   input,                                   width = 1,   ts_req_clk.clk
		.i_ts_req_rst (_connected_to_i_ts_req_rst_), //   input,                                   width = 1, ts_req_reset.reset
		.i_clk_bus    (_connected_to_i_clk_bus_),    //   input,               width = (((NUM_PORTS-1)-0)+1),   clk_bus_in.clk
		.i_rst_bus    (_connected_to_i_rst_bus_),    //   input,               width = (((NUM_PORTS-1)-0)+1),   rst_bus_in.reset_n
		.in_st_ready  (_connected_to_in_st_ready_),  //  output,                                   width = 1,        in_st.ready
		.in_st_sop    (_connected_to_in_st_sop_),    //   input,                                   width = 1,             .startofpacket
		.in_st_valid  (_connected_to_in_st_valid_),  //   input,                                   width = 1,             .valid
		.in_st_eop    (_connected_to_in_st_eop_),    //   input,                                   width = 1,             .endofpacket
		.in_st_data   (_connected_to_in_st_data_),   //   input,         width = (((AVST_DATA_WIDTH-1)-0)+1),             .data
		.in_st_empty  (_connected_to_in_st_empty_),  //   input,        width = (((AVST_EMPTY_WIDTH-1)-0)+1),             .empty
		.in_st_error  (_connected_to_in_st_error_),  //   input,        width = (((AVST_ERROR_WIDTH-1)-0)+1),             .error
		.out_st_ready (_connected_to_out_st_ready_), //   input,                                   width = 1,       out_st.ready
		.out_st_sop   (_connected_to_out_st_sop_),   //  output,                                   width = 1,             .startofpacket
		.out_st_valid (_connected_to_out_st_valid_), //  output,                                   width = 1,             .valid
		.out_st_eop   (_connected_to_out_st_eop_),   //  output,                                   width = 1,             .endofpacket
		.out_st_data  (_connected_to_out_st_data_),  //  output,         width = (((AVST_DATA_WIDTH-1)-0)+1),             .data
		.out_st_empty (_connected_to_out_st_empty_), //  output,        width = (((AVST_EMPTY_WIDTH-1)-0)+1),             .empty
		.out_st_error (_connected_to_out_st_error_), //  output,        width = (((AVST_ERROR_WIDTH-1)-0)+1),             .error
		.i_ts_valid   (_connected_to_i_ts_valid_),   //   input,               width = (((NUM_PORTS-1)-0)+1),         i_ts.valid
		.i_ts_fp      (_connected_to_i_ts_fp_),      //   input,    width = ((((NUM_PORTS*FP_WIDTH)-1)-0)+1),             .fingerprint
		.i_ts_data    (_connected_to_i_ts_data_),    //   input,  width = ((((NUM_PORTS*DATA_WIDTH)-1)-0)+1),             .data
		.o_ts_valid   (_connected_to_o_ts_valid_),   //  output,               width = (((NUM_PORTS-1)-0)+1),         o_ts.valid
		.o_ts_fp      (_connected_to_o_ts_fp_),      //  output,    width = ((((NUM_PORTS*ID_WIDTH)-1)-0)+1),             .fingerprint
		.o_ts_data    (_connected_to_o_ts_data_)     //  output,  width = ((((NUM_PORTS*DATA_WIDTH)-1)-0)+1),             .data
	);

