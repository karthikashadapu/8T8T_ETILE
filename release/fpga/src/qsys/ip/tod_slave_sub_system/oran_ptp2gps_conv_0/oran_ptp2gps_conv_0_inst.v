	oran_ptp2gps_conv_0 u0 (
		.rst_tod_n   (_connected_to_rst_tod_n_),   //   input,   width = 1,   rst_tod_n.reset_n
		.ptp_seconds (_connected_to_ptp_seconds_), //   input,  width = 96, ptp_seconds.data
		.in_valid    (_connected_to_in_valid_),    //   input,   width = 1,            .valid
		.gps_seconds (_connected_to_gps_seconds_), //  output,  width = 96, gps_seconds.data
		.out_valid   (_connected_to_out_valid_),   //  output,   width = 1,            .valid
		.clk_tod     (_connected_to_clk_tod_)      //   input,   width = 1,     clk_tod.clk
	);

