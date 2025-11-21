	tod_slave_sub_system u0 (
		.master_tod_split_conduit_end_data             (_connected_to_master_tod_split_conduit_end_data_),             //   input,  width = 96,             master_tod_split_conduit_end.data
		.master_tod_split_conduit_end_valid            (_connected_to_master_tod_split_conduit_end_valid_),            //   input,   width = 1,                                         .valid
		.master_tod_split_conduit_end_10_data          (_connected_to_master_tod_split_conduit_end_10_data_),          //  output,  width = 96,          master_tod_split_conduit_end_10.data
		.master_tod_split_conduit_end_10_valid         (_connected_to_master_tod_split_conduit_end_10_valid_),         //  output,   width = 1,                                         .valid
		.oran_tod_stack_tx_clk_clk                     (_connected_to_oran_tod_stack_tx_clk_clk_),                     //   input,   width = 1,                    oran_tod_stack_tx_clk.clk
		.oran_tod_stack_rx_clk_clk                     (_connected_to_oran_tod_stack_rx_clk_clk_),                     //   input,   width = 1,                    oran_tod_stack_rx_clk.clk
		.oran_tod_stack_todsync_sample_clk_clk         (_connected_to_oran_tod_stack_todsync_sample_clk_clk_),         //   input,   width = 1,        oran_tod_stack_todsync_sample_clk.clk
		.oran_tod_stack_tx_tod_interface_tdata         (_connected_to_oran_tod_stack_tx_tod_interface_tdata_),         //  output,  width = 96,          oran_tod_stack_tx_tod_interface.tdata
		.oran_tod_stack_tx_tod_interface_tvalid        (_connected_to_oran_tod_stack_tx_tod_interface_tvalid_),        //  output,   width = 1,                                         .tvalid
		.oran_tod_stack_rx_tod_interface_tdata         (_connected_to_oran_tod_stack_rx_tod_interface_tdata_),         //  output,  width = 96,          oran_tod_stack_rx_tod_interface.tdata
		.oran_tod_stack_rx_tod_interface_tvalid        (_connected_to_oran_tod_stack_rx_tod_interface_tvalid_),        //  output,   width = 1,                                         .tvalid
		.oran_tod_stack_tx_pll_locked_lock             (_connected_to_oran_tod_stack_tx_pll_locked_lock_),             //   input,   width = 1,             oran_tod_stack_tx_pll_locked.lock
		.port_8_tod_stack_tx_clk_clk                   (_connected_to_port_8_tod_stack_tx_clk_clk_),                   //   input,   width = 1,                  port_8_tod_stack_tx_clk.clk
		.port_8_tod_stack_rx_clk_clk                   (_connected_to_port_8_tod_stack_rx_clk_clk_),                   //   input,   width = 1,                  port_8_tod_stack_rx_clk.clk
		.port_8_tod_stack_todsync_sample_clk_clk       (_connected_to_port_8_tod_stack_todsync_sample_clk_clk_),       //   input,   width = 1,      port_8_tod_stack_todsync_sample_clk.clk
		.port_8_tod_stack_tx_tod_interface_tdata       (_connected_to_port_8_tod_stack_tx_tod_interface_tdata_),       //  output,  width = 96,        port_8_tod_stack_tx_tod_interface.tdata
		.port_8_tod_stack_tx_tod_interface_tvalid      (_connected_to_port_8_tod_stack_tx_tod_interface_tvalid_),      //  output,   width = 1,                                         .tvalid
		.port_8_tod_stack_rx_tod_interface_tdata       (_connected_to_port_8_tod_stack_rx_tod_interface_tdata_),       //  output,  width = 96,        port_8_tod_stack_rx_tod_interface.tdata
		.port_8_tod_stack_rx_tod_interface_tvalid      (_connected_to_port_8_tod_stack_rx_tod_interface_tvalid_),      //  output,   width = 1,                                         .tvalid
		.port_8_tod_stack_tx_pll_locked_lock           (_connected_to_port_8_tod_stack_tx_pll_locked_lock_),           //   input,   width = 1,           port_8_tod_stack_tx_pll_locked.lock
		.tod_subsys_clk_100_in_clk_clk                 (_connected_to_tod_subsys_clk_100_in_clk_clk_),                 //   input,   width = 1,                tod_subsys_clk_100_in_clk.clk
		.tod_subsys_mtod_clk_in_clk_clk                (_connected_to_tod_subsys_mtod_clk_in_clk_clk_),                //   input,   width = 1,               tod_subsys_mtod_clk_in_clk.clk
		.tod_subsys_rst_100_in_reset_reset_n           (_connected_to_tod_subsys_rst_100_in_reset_reset_n_),           //   input,   width = 1,              tod_subsys_rst_100_in_reset.reset_n
		.todsync_sample_plllock_split_conduit_end_lock (_connected_to_todsync_sample_plllock_split_conduit_end_lock_)  //   input,   width = 1, todsync_sample_plllock_split_conduit_end.lock
	);

