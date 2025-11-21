	ddr4_wr_rd_intel_onchip_memory_1 u0 (
		.clk        (_connected_to_clk_),        //   input,    width = 1,   clk1.clk
		.address    (_connected_to_address_),    //   input,   width = 13,     s1.address
		.byteenable (_connected_to_byteenable_), //   input,   width = 16,       .byteenable
		.write      (_connected_to_write_),      //   input,    width = 1,       .write
		.writedata  (_connected_to_writedata_),  //   input,  width = 128,       .writedata
		.reset      (_connected_to_reset_),      //   input,    width = 1, reset1.reset
		.reset_req  (_connected_to_reset_req_),  //   input,    width = 1,       .reset_req
		.address2   (_connected_to_address2_),   //   input,   width = 13,     s2.address
		.read2      (_connected_to_read2_),      //   input,    width = 1,       .read
		.readdata2  (_connected_to_readdata2_),  //  output,  width = 128,       .readdata
		.clk2       (_connected_to_clk2_),       //   input,    width = 1,   clk2.clk
		.reset2     (_connected_to_reset2_),     //   input,    width = 1, reset2.reset
		.reset_req2 (_connected_to_reset_req2_)  //   input,    width = 1,       .reset_req
	);

