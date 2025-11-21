	mtod_subsys_pps_load_tod_0 u0 (
		.period_clock                (_connected_to_period_clock_),                //   input,   width = 1,          period_clock.clk
		.reset                       (_connected_to_reset_),                       //   input,   width = 1,                 reset.reset
		.csr_clock                   (_connected_to_csr_clock_),                   //   input,   width = 1,             csr_clock.clk
		.csr_reset                   (_connected_to_csr_reset_),                   //   input,   width = 1,             csr_reset.reset
		.csr_readdata                (_connected_to_csr_readdata_),                //  output,  width = 32,                   csr.readdata
		.csr_write                   (_connected_to_csr_write_),                   //   input,   width = 1,                      .write
		.csr_read                    (_connected_to_csr_read_),                    //   input,   width = 1,                      .read
		.csr_writedata               (_connected_to_csr_writedata_),               //   input,  width = 32,                      .writedata
		.csr_waitrequest             (_connected_to_csr_waitrequest_),             //  output,   width = 1,                      .waitrequest
		.csr_address                 (_connected_to_csr_address_),                 //   input,   width = 6,                      .address
		.pps_pulse_per_second        (_connected_to_pps_pulse_per_second_),        //   input,   width = 1,         pps_interface.pulse_per_second
		.time_of_day_96b             (_connected_to_time_of_day_96b_),             //   input,  width = 96,       time_of_day_96b.data
		.time_of_data_96b_load_data  (_connected_to_time_of_data_96b_load_data_),  //  output,  width = 96, time_of_data_96b_load.data
		.time_of_data_96b_load_valid (_connected_to_time_of_data_96b_load_valid_), //  output,   width = 1,                      .valid
		.pps_irq                     (_connected_to_pps_irq_)                      //  output,   width = 1,               pps_irq.irq
	);

