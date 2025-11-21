	eth_f_tod_sync_10g #(
		.TOD_MODE     (INTEGER_VALUE_FOR_TOD_MODE),
		.SYNC_MODE    (INTEGER_VALUE_FOR_SYNC_MODE),
		.SAMPLE_SIZE  (INTEGER_VALUE_FOR_SAMPLE_SIZE),
		.PERIOD_NSEC  (INTEGER_VALUE_FOR_PERIOD_NSEC),
		.PERIOD_FNSEC (INTEGER_VALUE_FOR_PERIOD_FNSEC)
	) u0 (
		.clk_master      (_connected_to_clk_master_),      //   input,   width = 1,      clk_master.clk
		.reset_master    (_connected_to_reset_master_),    //   input,   width = 1,    reset_master.reset
		.clk_slave       (_connected_to_clk_slave_),       //   input,   width = 1,       clk_slave.clk
		.reset_slave     (_connected_to_reset_slave_),     //   input,   width = 1,     reset_slave.reset
		.clk_sampling    (_connected_to_clk_sampling_),    //   input,   width = 1,    clk_sampling.clk
		.start_tod_sync  (_connected_to_start_tod_sync_),  //   input,   width = 1,  start_tod_sync.data
		.tod_master_data (_connected_to_tod_master_data_), //   input,  width = 96, tod_master_data.data
		.tod_slave_data  (_connected_to_tod_slave_data_),  //  output,  width = 96,  tod_slave_data.data
		.tod_slave_valid (_connected_to_tod_slave_valid_)  //  output,   width = 1,                .valid
	);

