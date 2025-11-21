	phipps_peak_signal_replicator_0 u0 (
		.bw_config_cc1             (_connected_to_bw_config_cc1_),             //   input,   width = 8,             bw_config_cc1.bw_config_cc1
		.bw_config_cc2             (_connected_to_bw_config_cc2_),             //   input,   width = 8,             bw_config_cc2.bw_config_cc2
		.radio_config_status       (_connected_to_radio_config_status_),       //   input,  width = 56,       radio_config_status.radio_config_status
		.short_long_prach_sel      (_connected_to_short_long_prach_sel_),      //   input,   width = 1,      short_long_prach_sel.short_long_prach_sel
		.bw_config_cc1_dup1        (_connected_to_bw_config_cc1_dup1_),        //  output,   width = 8,        bw_config_cc1_dup1.bw_config_cc1
		.bw_config_cc2_dup1        (_connected_to_bw_config_cc2_dup1_),        //  output,   width = 8,        bw_config_cc2_dup1.bw_config_cc2
		.radio_config_status_dup1  (_connected_to_radio_config_status_dup1_),  //  output,  width = 56,  radio_config_status_dup1.radio_config_status
		.short_long_prach_sel_dup1 (_connected_to_short_long_prach_sel_dup1_), //  output,   width = 1, short_long_prach_sel_dup1.short_long_prach_sel
		.rst_soft_n_dup1           (_connected_to_rst_soft_n_dup1_),           //  output,   width = 1,           rst_soft_n_dup1.rst_soft_n
		.bw_config_cc1_dup2        (_connected_to_bw_config_cc1_dup2_),        //  output,   width = 8,        bw_config_cc1_dup2.bw_config_cc1
		.bw_config_cc2_dup2        (_connected_to_bw_config_cc2_dup2_),        //  output,   width = 8,        bw_config_cc2_dup2.bw_config_cc2
		.radio_config_status_dup2  (_connected_to_radio_config_status_dup2_),  //  output,  width = 56,  radio_config_status_dup2.radio_config_status
		.short_long_prach_sel_dup2 (_connected_to_short_long_prach_sel_dup2_), //  output,   width = 1, short_long_prach_sel_dup2.short_long_prach_sel
		.rst_soft_n_dup2           (_connected_to_rst_soft_n_dup2_),           //  output,   width = 1,           rst_soft_n_dup2.rst_soft_n
		.bw_config_cc1_dup3        (_connected_to_bw_config_cc1_dup3_),        //  output,   width = 8,        bw_config_cc1_dup3.bw_config_cc1
		.bw_config_cc2_dup3        (_connected_to_bw_config_cc2_dup3_),        //  output,   width = 8,        bw_config_cc2_dup3.bw_config_cc2
		.radio_config_status_dup3  (_connected_to_radio_config_status_dup3_),  //  output,  width = 56,  radio_config_status_dup3.data
		.short_long_prach_sel_dup3 (_connected_to_short_long_prach_sel_dup3_), //  output,   width = 1, short_long_prach_sel_dup3.short_long_prach_sel
		.rst_soft_n_dup3           (_connected_to_rst_soft_n_dup3_),           //  output,   width = 1,           rst_soft_n_dup3.rst_soft_n
		.rst_soft_n                (_connected_to_rst_soft_n_),                //   input,   width = 1,                rst_soft_n.rst_soft_n
		.rst_soft_n_dup4           (_connected_to_rst_soft_n_dup4_),           //  output,   width = 1,           rst_soft_n_dup4.rst_soft_n
		.interface_sel             (_connected_to_interface_sel_),             //   input,  width = 32,             interface_sel.data
		.interface_sel_dup1        (_connected_to_interface_sel_dup1_),        //  output,  width = 32,        interface_sel_dup1.data
		.interface_sel_dup2        (_connected_to_interface_sel_dup2_)         //  output,  width = 32,        interface_sel_dup2.data
	);

