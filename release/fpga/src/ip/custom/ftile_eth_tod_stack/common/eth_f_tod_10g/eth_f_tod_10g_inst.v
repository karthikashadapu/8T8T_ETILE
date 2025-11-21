	eth_f_tod_10g #(
		.PERIOD_CLOCK_FREQUENCY        (INTEGER_VALUE_FOR_PERIOD_CLOCK_FREQUENCY),
		.OFFSET_JITTER_WANDER_EN       (INTEGER_VALUE_FOR_OFFSET_JITTER_WANDER_EN),
		.DEFAULT_NSEC_PERIOD           (INTEGER_VALUE_FOR_DEFAULT_NSEC_PERIOD),
		.DEFAULT_FNSEC_PERIOD          (INTEGER_VALUE_FOR_DEFAULT_FNSEC_PERIOD),
		.DEFAULT_NSEC_ADJPERIOD        (INTEGER_VALUE_FOR_DEFAULT_NSEC_ADJPERIOD),
		.DEFAULT_FNSEC_ADJPERIOD       (INTEGER_VALUE_FOR_DEFAULT_FNSEC_ADJPERIOD),
		.PPS_PULSE_ASSERT_CYCLE_MASTER (INTEGER_VALUE_FOR_PPS_PULSE_ASSERT_CYCLE_MASTER),
		.PLL_SCAN_CLK_FREQ             (INTEGER_VALUE_FOR_PLL_SCAN_CLK_FREQ),
		.UNIT_PHASE_SHIFT              (INTEGER_VALUE_FOR_UNIT_PHASE_SHIFT)
	) u0 (
		.clk                        (_connected_to_clk_),                        //   input,   width = 1,            csr_clock.clk
		.rst_n                      (_connected_to_rst_n_),                      //   input,   width = 1,            csr_reset.reset_n
		.period_clk                 (_connected_to_period_clk_),                 //   input,   width = 1,         period_clock.clk
		.period_rst_n               (_connected_to_period_rst_n_),               //   input,   width = 1,   period_clock_reset.reset_n
		.csr_readdata               (_connected_to_csr_readdata_),               //  output,  width = 32,                  csr.readdata
		.csr_write                  (_connected_to_csr_write_),                  //   input,   width = 1,                     .write
		.csr_read                   (_connected_to_csr_read_),                   //   input,   width = 1,                     .read
		.csr_writedata              (_connected_to_csr_writedata_),              //   input,  width = 32,                     .writedata
		.csr_waitrequest            (_connected_to_csr_waitrequest_),            //  output,   width = 1,                     .waitrequest
		.csr_address                (_connected_to_csr_address_),                //   input,   width = 4,                     .address
		.time_of_day_96b            (_connected_to_time_of_day_96b_),            //  output,  width = 96,      time_of_day_96b.data
		.time_of_day_64b            (_connected_to_time_of_day_64b_),            //  output,  width = 64,      time_of_day_64b.data
		.time_of_day_96b_load_data  (_connected_to_time_of_day_96b_load_data_),  //   input,  width = 96, time_of_day_96b_load.data
		.time_of_day_96b_load_valid (_connected_to_time_of_day_96b_load_valid_), //   input,   width = 1,                     .valid
		.time_of_day_64b_load_data  (_connected_to_time_of_day_64b_load_data_),  //   input,  width = 64, time_of_day_64b_load.data
		.time_of_day_64b_load_valid (_connected_to_time_of_day_64b_load_valid_)  //   input,   width = 1,                     .valid
	);

