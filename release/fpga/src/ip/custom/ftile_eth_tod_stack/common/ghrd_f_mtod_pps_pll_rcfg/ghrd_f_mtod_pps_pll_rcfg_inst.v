	ghrd_f_mtod_pps_pll_rcfg u0 (
		.mgmt_clk          (_connected_to_mgmt_clk_),          //   input,   width = 1,          mgmt_clk.clk
		.mgmt_reset        (_connected_to_mgmt_reset_),        //   input,   width = 1,        mgmt_reset.reset
		.mgmt_waitrequest  (_connected_to_mgmt_waitrequest_),  //  output,   width = 1, mgmt_avalon_slave.waitrequest
		.mgmt_write        (_connected_to_mgmt_write_),        //   input,   width = 1,                  .write
		.mgmt_read         (_connected_to_mgmt_read_),         //   input,   width = 1,                  .read
		.mgmt_writedata    (_connected_to_mgmt_writedata_),    //   input,   width = 8,                  .writedata
		.mgmt_readdata     (_connected_to_mgmt_readdata_),     //  output,   width = 8,                  .readdata
		.mgmt_address      (_connected_to_mgmt_address_),      //   input,  width = 10,                  .address
		.reconfig_to_pll   (_connected_to_reconfig_to_pll_),   //  output,  width = 30,   reconfig_to_pll.reconfig_to_pll
		.reconfig_from_pll (_connected_to_reconfig_from_pll_)  //   input,  width = 11, reconfig_from_pll.reconfig_from_pll
	);

