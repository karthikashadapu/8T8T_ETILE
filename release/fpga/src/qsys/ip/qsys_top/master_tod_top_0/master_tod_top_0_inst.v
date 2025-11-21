	master_tod_top_0 #(
		.MASTER_PPS_CYCLE (INTEGER_VALUE_FOR_MASTER_PPS_CYCLE)
	) u0 (
		.i_csr_write          (_connected_to_i_csr_write_),          //   input,   width = 1,                csr.write
		.i_csr_writedata      (_connected_to_i_csr_writedata_),      //   input,  width = 32,                   .writedata
		.i_csr_read           (_connected_to_i_csr_read_),           //   input,   width = 1,                   .read
		.o_csr_readdata       (_connected_to_o_csr_readdata_),       //  output,  width = 32,                   .readdata
		.o_csr_waitrequest    (_connected_to_o_csr_waitrequest_),    //  output,   width = 1,                   .waitrequest
		.i_csr_addr           (_connected_to_i_csr_addr_),           //   input,   width = 4,                   .address
		.i_clk_reconfig       (_connected_to_i_clk_reconfig_),       //   input,   width = 1,     i_clk_reconfig.clk
		.i_clk_tod            (_connected_to_i_clk_tod_),            //   input,   width = 1,          i_clk_tod.clk
		.i_reconfig_rst_n     (_connected_to_i_reconfig_rst_n_),     //   input,   width = 1,   i_reconfig_rst_n.reset_n
		.i_tod_rst_n          (_connected_to_i_tod_rst_n_),          //   input,   width = 1,        i_tod_rst_n.reset_n
		.i_tod_96b_load_valid (_connected_to_i_tod_96b_load_valid_), //   input,   width = 1, avst_tod_load_data.valid
		.i_tod_96b_load_data  (_connected_to_i_tod_96b_load_data_),  //   input,  width = 96,                   .data
		.o_pps                (_connected_to_o_pps_),                //  output,   width = 1,   pulse_per_second.writeresponsevalid_n
		.o_tod_96b_valid      (_connected_to_o_tod_96b_valid_),      //  output,   width = 1,      avst_tod_data.valid
		.o_tod_96b_data       (_connected_to_o_tod_96b_data_),       //  output,  width = 96,                   .data
		.i_upstr_pll_lock     (_connected_to_i_upstr_pll_lock_)      //   input,   width = 1,        i_upstr_pll.lock
	);

