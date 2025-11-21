	ghrd_f_mtod_pps_pll u0 (
		.refclk            (_connected_to_refclk_),            //   input,   width = 1,            refclk.clk
		.locked            (_connected_to_locked_),            //  output,   width = 1,            locked.export
		.rst               (_connected_to_rst_),               //   input,   width = 1,             reset.reset
		.reconfig_to_pll   (_connected_to_reconfig_to_pll_),   //   input,  width = 30,   reconfig_to_pll.reconfig_to_pll
		.reconfig_from_pll (_connected_to_reconfig_from_pll_), //  output,  width = 11, reconfig_from_pll.reconfig_from_pll
		.outclk_0          (_connected_to_outclk_0_),          //  output,   width = 1,           outclk0.clk
		.outclk_1          (_connected_to_outclk_1_)           //  output,   width = 1,           outclk1.clk
	);

