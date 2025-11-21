	port_0_tod_stack #(
		.NUMPORTS (INTEGER_VALUE_FOR_NUMPORTS)
	) u0 (
		.i_reconfig_clk              (_connected_to_i_reconfig_clk_),              //   input,   width = 1,          reconfig_clk.clk
		.i_reconfig_reset            (_connected_to_i_reconfig_reset_),            //   input,   width = 1,       reconfig_resetn.reset_n
		.i_clk_tx_tod                (_connected_to_i_clk_tx_tod_),                //   input,   width = 1,                tx_clk.clk
		.i_clk_rx_tod                (_connected_to_i_clk_rx_tod_),                //   input,   width = 1,                rx_clk.clk
		.i_clk_master_tod            (_connected_to_i_clk_master_tod_),            //   input,   width = 1,              mtod_clk.clk
		.i_clk_todsync_sample        (_connected_to_i_clk_todsync_sample_),        //   input,   width = 1,    todsync_sample_clk.clk
		.i_clk_todsync_sample_locked (_connected_to_i_clk_todsync_sample_locked_), //   input,   width = 1, todsync_sample_locked.lock
		.i_ptp_master_tod            (_connected_to_i_ptp_master_tod_),            //   input,  width = 96,  master_tod_interface.data
		.i_ptp_master_tod_valid      (_connected_to_i_ptp_master_tod_valid_),      //   input,   width = 1,                      .valid
		.ptp_tx_tod                  (_connected_to_ptp_tx_tod_),                  //  output,  width = 96,      tx_tod_interface.tdata
		.ptp_tx_tod_valid            (_connected_to_ptp_tx_tod_valid_),            //  output,   width = 1,                      .tvalid
		.ptp_rx_tod                  (_connected_to_ptp_rx_tod_),                  //  output,  width = 96,      rx_tod_interface.tdata
		.ptp_rx_tod_valid            (_connected_to_ptp_rx_tod_valid_),            //  output,   width = 1,                      .tvalid
		.i_tx_pll_locked             (_connected_to_i_tx_pll_locked_),             //   input,   width = 1,         tx_pll_locked.lock
		.i_ptp_master_tod_rst_n      (_connected_to_i_ptp_master_tod_rst_n_)       //   input,   width = 1,          mtod_reset_n.reset_n
	);

