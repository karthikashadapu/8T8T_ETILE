	oran_tod_subsys_ptp2gps_conv_0 u0 (
		.rst_tod_n   (_connected_to_rst_tod_n_),   //   input,   width = 1,   rst_tod_n.reset_n
		.ptp_seconds (_connected_to_ptp_seconds_), //   input,  width = 96, ptp_seconds.data
		.gps_seconds (_connected_to_gps_seconds_), //  output,  width = 96, gps_seconds.data
		.clk_tod     (_connected_to_clk_tod_)      //   input,   width = 1,     clk_tod.clk
	);

