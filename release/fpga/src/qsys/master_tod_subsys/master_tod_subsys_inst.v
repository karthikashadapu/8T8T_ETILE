	master_tod_subsys u0 (
		.master_tod_top_0_csr_write                                (_connected_to_master_tod_top_0_csr_write_),                                //   input,   width = 1,                       master_tod_top_0_csr.write
		.master_tod_top_0_csr_writedata                            (_connected_to_master_tod_top_0_csr_writedata_),                            //   input,  width = 32,                                           .writedata
		.master_tod_top_0_csr_read                                 (_connected_to_master_tod_top_0_csr_read_),                                 //   input,   width = 1,                                           .read
		.master_tod_top_0_csr_readdata                             (_connected_to_master_tod_top_0_csr_readdata_),                             //  output,  width = 32,                                           .readdata
		.master_tod_top_0_csr_waitrequest                          (_connected_to_master_tod_top_0_csr_waitrequest_),                          //  output,   width = 1,                                           .waitrequest
		.master_tod_top_0_csr_address                              (_connected_to_master_tod_top_0_csr_address_),                              //   input,   width = 4,                                           .address
		.master_tod_top_0_i_clk_tod_clk                            (_connected_to_master_tod_top_0_i_clk_tod_clk_),                            //   input,   width = 1,                 master_tod_top_0_i_clk_tod.clk
		.master_tod_top_0_i_reconfig_rst_n_reset_n                 (_connected_to_master_tod_top_0_i_reconfig_rst_n_reset_n_),                 //   input,   width = 1,          master_tod_top_0_i_reconfig_rst_n.reset_n
		.master_tod_top_0_i_tod_rst_n_reset_n                      (_connected_to_master_tod_top_0_i_tod_rst_n_reset_n_),                      //   input,   width = 1,               master_tod_top_0_i_tod_rst_n.reset_n
		.master_tod_top_0_pulse_per_second_pps                     (_connected_to_master_tod_top_0_pulse_per_second_pps_),                     //  output,   width = 1,          master_tod_top_0_pulse_per_second.pps
		.master_tod_top_0_avst_tod_data_valid                      (_connected_to_master_tod_top_0_avst_tod_data_valid_),                      //  output,   width = 1,             master_tod_top_0_avst_tod_data.valid
		.master_tod_top_0_avst_tod_data_data                       (_connected_to_master_tod_top_0_avst_tod_data_data_),                       //  output,  width = 96,                                           .data
		.master_tod_top_0_i_upstr_pll_lock                         (_connected_to_master_tod_top_0_i_upstr_pll_lock_),                         //   input,   width = 1,               master_tod_top_0_i_upstr_pll.lock
		.mtod_subsys_clk100_in_clk_clk                             (_connected_to_mtod_subsys_clk100_in_clk_clk_),                             //   input,   width = 1,                  mtod_subsys_clk100_in_clk.clk
		.mtod_subsys_pps_load_tod_0_period_clock_clk               (_connected_to_mtod_subsys_pps_load_tod_0_period_clock_clk_),               //   input,   width = 1,    mtod_subsys_pps_load_tod_0_period_clock.clk
		.mtod_subsys_pps_load_tod_0_reset_reset                    (_connected_to_mtod_subsys_pps_load_tod_0_reset_reset_),                    //   input,   width = 1,           mtod_subsys_pps_load_tod_0_reset.reset
		.mtod_subsys_pps_load_tod_0_csr_reset_reset                (_connected_to_mtod_subsys_pps_load_tod_0_csr_reset_reset_),                //   input,   width = 1,       mtod_subsys_pps_load_tod_0_csr_reset.reset
		.mtod_subsys_pps_load_tod_0_csr_readdata                   (_connected_to_mtod_subsys_pps_load_tod_0_csr_readdata_),                   //  output,  width = 32,             mtod_subsys_pps_load_tod_0_csr.readdata
		.mtod_subsys_pps_load_tod_0_csr_write                      (_connected_to_mtod_subsys_pps_load_tod_0_csr_write_),                      //   input,   width = 1,                                           .write
		.mtod_subsys_pps_load_tod_0_csr_read                       (_connected_to_mtod_subsys_pps_load_tod_0_csr_read_),                       //   input,   width = 1,                                           .read
		.mtod_subsys_pps_load_tod_0_csr_writedata                  (_connected_to_mtod_subsys_pps_load_tod_0_csr_writedata_),                  //   input,  width = 32,                                           .writedata
		.mtod_subsys_pps_load_tod_0_csr_waitrequest                (_connected_to_mtod_subsys_pps_load_tod_0_csr_waitrequest_),                //  output,   width = 1,                                           .waitrequest
		.mtod_subsys_pps_load_tod_0_csr_address                    (_connected_to_mtod_subsys_pps_load_tod_0_csr_address_),                    //   input,   width = 6,                                           .address
		.mtod_subsys_pps_load_tod_0_pps_interface_pulse_per_second (_connected_to_mtod_subsys_pps_load_tod_0_pps_interface_pulse_per_second_), //   input,   width = 1,   mtod_subsys_pps_load_tod_0_pps_interface.pulse_per_second
		.mtod_subsys_pps_load_tod_0_time_of_day_96b_data           (_connected_to_mtod_subsys_pps_load_tod_0_time_of_day_96b_data_),           //   input,  width = 96, mtod_subsys_pps_load_tod_0_time_of_day_96b.data
		.mtod_subsys_pps_load_tod_0_pps_irq_irq                    (_connected_to_mtod_subsys_pps_load_tod_0_pps_irq_irq_),                    //  output,   width = 1,         mtod_subsys_pps_load_tod_0_pps_irq.irq
		.mtod_subsys_rstn_in_reset_reset_n                         (_connected_to_mtod_subsys_rstn_in_reset_reset_n_)                          //   input,   width = 1,                  mtod_subsys_rstn_in_reset.reset_n
	);

