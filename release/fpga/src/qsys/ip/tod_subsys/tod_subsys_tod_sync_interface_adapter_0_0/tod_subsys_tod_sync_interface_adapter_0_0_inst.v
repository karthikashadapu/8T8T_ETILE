	tod_subsys_tod_sync_interface_adapter_0_0 u0 (
		.time_of_day_96b     (_connected_to_time_of_day_96b_),     //   input,  width = 96,     time_of_day_96b.data
		.valid               (_connected_to_valid_),               //   input,   width = 1,                    .valid
		.tx0_tod_master_data (_connected_to_tx0_tod_master_data_), //  output,  width = 96, tx0_tod_master_data.data
		.valid_0             (_connected_to_valid_0_),             //  output,   width = 1,                    .valid
		.tx1_tod_master_data (_connected_to_tx1_tod_master_data_), //  output,  width = 96, tx1_tod_master_data.data
		.tx2_tod_master_data (_connected_to_tx2_tod_master_data_), //  output,  width = 96, tx2_tod_master_data.data
		.tx3_tod_master_data (_connected_to_tx3_tod_master_data_), //  output,  width = 96, tx3_tod_master_data.data
		.rx0_tod_master_data (_connected_to_rx0_tod_master_data_), //  output,  width = 96, rx0_tod_master_data.data
		.clk                 (_connected_to_clk_),                 //   input,   width = 1,               clock.clk
		.rst_n               (_connected_to_rst_n_)                //   input,   width = 1,          reset_sink.reset_n
	);

