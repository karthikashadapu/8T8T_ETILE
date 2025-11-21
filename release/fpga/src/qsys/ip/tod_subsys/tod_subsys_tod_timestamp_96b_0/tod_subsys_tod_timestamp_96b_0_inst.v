	tod_subsys_tod_timestamp_96b_0 u0 (
		.clk_tod                          (_connected_to_clk_tod_),                          //   input,    width = 1,                    clk_tod.clk
		.rst_clk_tod_n                    (_connected_to_rst_clk_tod_n_),                    //   input,    width = 1,              rst_clk_tod_n.reset_n
		.clk_100                          (_connected_to_clk_100_),                          //   input,    width = 1,                    clk_100.clk
		.system_reset_n                   (_connected_to_system_reset_n_),                   //   input,    width = 1,             system_reset_n.reset_n
		.pps_in                           (_connected_to_pps_in_),                           //   input,    width = 1,                     pps_in.pps_in
		.irq_delay_pulse                  (_connected_to_irq_delay_pulse_),                  //  output,    width = 1,            irq_delay_pulse.irq
		.eth_tod_master_96b_tx            (_connected_to_eth_tod_master_96b_tx_),            //   input,   width = 96,      eth_tod_master_96b_tx.data
		.eth_tod_master_96b_tx_load_data  (_connected_to_eth_tod_master_96b_tx_load_data_),  //  output,   width = 96, eth_tod_master_96b_tx_load.data
		.eth_tod_master_96b_tx_load_valid (_connected_to_eth_tod_master_96b_tx_load_valid_), //  output,    width = 1,                           .valid
		.rfp_sync_pul                     (_connected_to_rfp_sync_pul_),                     //  output,    width = 1,               rfp_sync_pul.data
		.rfp_sync_pul_cpri                (_connected_to_rfp_sync_pul_cpri_),                //  output,    width = 1,          rfp_sync_pul_cpri.cpri_aux_rx_rfp_l1_cpri
		.csr_address                      (_connected_to_csr_address_),                      //   input,    width = 5,      tod_timestamp_96b_csr.address
		.csr_write                        (_connected_to_csr_write_),                        //   input,    width = 1,                           .write
		.csr_read                         (_connected_to_csr_read_),                         //   input,    width = 1,                           .read
		.csr_writedata                    (_connected_to_csr_writedata_),                    //   input,   width = 32,                           .writedata
		.csr_readdata                     (_connected_to_csr_readdata_),                     //  output,   width = 32,                           .readdata
		.csr_waitrequest                  (_connected_to_csr_waitrequest_),                  //  output,    width = 1,                           .waitrequest
		.csr_readdatavalid                (_connected_to_csr_readdatavalid_),                //  output,    width = 1,                           .readdatavalid
		.ram_read                         (_connected_to_ram_read_),                         //   input,    width = 1,          tod_timestamp_mem.read
		.ram_q                            (_connected_to_ram_q_),                            //  output,  width = 128,                           .readdata
		.rfp_sync_pul_dup                 (_connected_to_rfp_sync_pul_dup_)                  //  output,    width = 1,           rfp_sync_pul_dup.data
	);

