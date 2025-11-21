	sys_manager u0 (
		.clk_100_in_clk_clk                               (_connected_to_clk_100_in_clk_clk_),                               //   input,   width = 1,                           clk_100_in_clk.clk
		.clk_100_out_clk_clk                              (_connected_to_clk_100_out_clk_clk_),                              //  output,   width = 1,                          clk_100_out_clk.clk
		.dma_subsys_port0_rx_dma_resetn_clk_clk           (_connected_to_dma_subsys_port0_rx_dma_resetn_clk_clk_),           //   input,   width = 1,       dma_subsys_port0_rx_dma_resetn_clk.clk
		.dma_subsys_port0_rx_dma_resetn_in_reset_reset_n  (_connected_to_dma_subsys_port0_rx_dma_resetn_in_reset_reset_n_),  //   input,   width = 1,  dma_subsys_port0_rx_dma_resetn_in_reset.reset_n
		.dma_subsys_port0_rx_dma_resetn_out_reset_reset_n (_connected_to_dma_subsys_port0_rx_dma_resetn_out_reset_reset_n_), //  output,   width = 1, dma_subsys_port0_rx_dma_resetn_out_reset.reset_n
		.dma_subsys_port1_rx_dma_resetn_clk_clk           (_connected_to_dma_subsys_port1_rx_dma_resetn_clk_clk_),           //   input,   width = 1,       dma_subsys_port1_rx_dma_resetn_clk.clk
		.dma_subsys_port1_rx_dma_resetn_in_reset_reset_n  (_connected_to_dma_subsys_port1_rx_dma_resetn_in_reset_reset_n_),  //   input,   width = 1,  dma_subsys_port1_rx_dma_resetn_in_reset.reset_n
		.dma_subsys_port1_rx_dma_resetn_out_reset_reset_n (_connected_to_dma_subsys_port1_rx_dma_resetn_out_reset_reset_n_), //  output,   width = 1, dma_subsys_port1_rx_dma_resetn_out_reset.reset_n
		.ftile_iopll_ptp_sampling_refclk_clk              (_connected_to_ftile_iopll_ptp_sampling_refclk_clk_),              //   input,   width = 1,          ftile_iopll_ptp_sampling_refclk.clk
		.ftile_iopll_ptp_sampling_reset_reset             (_connected_to_ftile_iopll_ptp_sampling_reset_reset_),             //   input,   width = 1,           ftile_iopll_ptp_sampling_reset.reset
		.ftile_iopll_ptp_sampling_outclk0_clk             (_connected_to_ftile_iopll_ptp_sampling_outclk0_clk_),             //  output,   width = 1,         ftile_iopll_ptp_sampling_outclk0.clk
		.ftile_iopll_todsync_sampling_refclk_clk          (_connected_to_ftile_iopll_todsync_sampling_refclk_clk_),          //   input,   width = 1,      ftile_iopll_todsync_sampling_refclk.clk
		.ftile_iopll_todsync_sampling_locked_lock         (_connected_to_ftile_iopll_todsync_sampling_locked_lock_),         //  output,   width = 1,      ftile_iopll_todsync_sampling_locked.lock
		.ftile_iopll_todsync_sampling_reset_reset         (_connected_to_ftile_iopll_todsync_sampling_reset_reset_),         //   input,   width = 1,       ftile_iopll_todsync_sampling_reset.reset
		.ftile_iopll_todsync_sampling_outclk0_clk         (_connected_to_ftile_iopll_todsync_sampling_outclk0_clk_),         //  output,   width = 1,     ftile_iopll_todsync_sampling_outclk0.clk
		.qsys_top_master_todclk_0_in_clk_clk              (_connected_to_qsys_top_master_todclk_0_in_clk_clk_),              //   input,   width = 1,          qsys_top_master_todclk_0_in_clk.clk
		.qsys_top_master_todclk_0_out_clk_clk             (_connected_to_qsys_top_master_todclk_0_out_clk_clk_),             //  output,   width = 1,         qsys_top_master_todclk_0_out_clk.clk
		.rst_in_clk_clk                                   (_connected_to_rst_in_clk_clk_),                                   //   input,   width = 1,                               rst_in_clk.clk
		.rst_in_in_reset_reset_n                          (_connected_to_rst_in_in_reset_reset_n_),                          //   input,   width = 1,                          rst_in_in_reset.reset_n
		.rst_in_out_reset_reset_n                         (_connected_to_rst_in_out_reset_reset_n_),                         //  output,   width = 1,                         rst_in_out_reset.reset_n
		.sysid_clk_clk                                    (_connected_to_sysid_clk_clk_),                                    //   input,   width = 1,                                sysid_clk.clk
		.sysid_reset_reset_n                              (_connected_to_sysid_reset_reset_n_),                              //   input,   width = 1,                              sysid_reset.reset_n
		.sysid_control_slave_readdata                     (_connected_to_sysid_control_slave_readdata_),                     //  output,  width = 32,                      sysid_control_slave.readdata
		.sysid_control_slave_address                      (_connected_to_sysid_control_slave_address_),                      //   input,   width = 1,                                         .address
		.user_rst_clkgate_0_ninit_done_ninit_done         (_connected_to_user_rst_clkgate_0_ninit_done_ninit_done_)          //  output,   width = 1,            user_rst_clkgate_0_ninit_done.ninit_done
	);

