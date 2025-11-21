	oran_tod_subsys u0 (
		.eth_1588_tod_synchronizer_clk_master_clk      (_connected_to_eth_1588_tod_synchronizer_clk_master_clk_),      //   input,   width = 1,     eth_1588_tod_synchronizer_clk_master.clk
		.eth_1588_tod_synchronizer_reset_master_reset  (_connected_to_eth_1588_tod_synchronizer_reset_master_reset_),  //   input,   width = 1,   eth_1588_tod_synchronizer_reset_master.reset
		.eth_1588_tod_synchronizer_clk_slave_clk       (_connected_to_eth_1588_tod_synchronizer_clk_slave_clk_),       //   input,   width = 1,      eth_1588_tod_synchronizer_clk_slave.clk
		.eth_1588_tod_synchronizer_reset_slave_reset   (_connected_to_eth_1588_tod_synchronizer_reset_slave_reset_),   //   input,   width = 1,    eth_1588_tod_synchronizer_reset_slave.reset
		.eth_1588_tod_synchronizer_clk_sampling_clk    (_connected_to_eth_1588_tod_synchronizer_clk_sampling_clk_),    //   input,   width = 1,   eth_1588_tod_synchronizer_clk_sampling.clk
		.eth_1588_tod_synchronizer_start_tod_sync_data (_connected_to_eth_1588_tod_synchronizer_start_tod_sync_data_), //   input,   width = 1, eth_1588_tod_synchronizer_start_tod_sync.data
		.oran_tod_time_of_day_96b_data                 (_connected_to_oran_tod_time_of_day_96b_data_),                 //  output,  width = 96,                 oran_tod_time_of_day_96b.data
		.oran_tod_time_of_day_96b_valid                (_connected_to_oran_tod_time_of_day_96b_valid_),                //  output,   width = 1,                                         .valid
		.rst_tod_n_reset_n                             (_connected_to_rst_tod_n_reset_n_),                             //   input,   width = 1,                                rst_tod_n.reset_n
		.ptp_seconds_data                              (_connected_to_ptp_seconds_data_),                              //   input,  width = 96,                              ptp_seconds.data
		.clk_tod_clk                                   (_connected_to_clk_tod_clk_)                                    //   input,   width = 1,                                  clk_tod.clk
	);

