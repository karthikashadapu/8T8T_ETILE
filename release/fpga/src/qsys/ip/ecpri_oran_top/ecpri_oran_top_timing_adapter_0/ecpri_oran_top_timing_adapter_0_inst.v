	ecpri_oran_top_timing_adapter_0 u0 (
		.clk               (_connected_to_clk_),               //   input,   width = 1,   clk.clk
		.reset_n           (_connected_to_reset_n_),           //   input,   width = 1, reset.reset_n
		.in_data           (_connected_to_in_data_),           //   input,  width = 88,    in.data
		.in_valid          (_connected_to_in_valid_),          //   input,   width = 1,      .valid
		.in_ready          (_connected_to_in_ready_),          //  output,   width = 1,      .ready
		.in_startofpacket  (_connected_to_in_startofpacket_),  //   input,   width = 1,      .startofpacket
		.in_endofpacket    (_connected_to_in_endofpacket_),    //   input,   width = 1,      .endofpacket
		.in_empty          (_connected_to_in_empty_),          //   input,   width = 4,      .empty
		.out_data          (_connected_to_out_data_),          //  output,  width = 88,   out.data
		.out_valid         (_connected_to_out_valid_),         //  output,   width = 1,      .valid
		.out_ready         (_connected_to_out_ready_),         //   input,   width = 1,      .ready
		.out_startofpacket (_connected_to_out_startofpacket_), //  output,   width = 1,      .startofpacket
		.out_endofpacket   (_connected_to_out_endofpacket_),   //  output,   width = 1,      .endofpacket
		.out_empty         (_connected_to_out_empty_)          //  output,   width = 4,      .empty
	);

