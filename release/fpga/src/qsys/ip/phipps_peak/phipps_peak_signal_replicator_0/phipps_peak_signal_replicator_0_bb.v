module phipps_peak_signal_replicator_0 (
		input  wire [7:0]  bw_config_cc1,             //             bw_config_cc1.bw_config_cc1
		input  wire [7:0]  bw_config_cc2,             //             bw_config_cc2.bw_config_cc2
		input  wire [55:0] radio_config_status,       //       radio_config_status.radio_config_status
		input  wire        short_long_prach_sel,      //      short_long_prach_sel.short_long_prach_sel
		output wire [7:0]  bw_config_cc1_dup1,        //        bw_config_cc1_dup1.bw_config_cc1
		output wire [7:0]  bw_config_cc2_dup1,        //        bw_config_cc2_dup1.bw_config_cc2
		output wire [55:0] radio_config_status_dup1,  //  radio_config_status_dup1.radio_config_status
		output wire        short_long_prach_sel_dup1, // short_long_prach_sel_dup1.short_long_prach_sel
		output wire        rst_soft_n_dup1,           //           rst_soft_n_dup1.rst_soft_n
		output wire [7:0]  bw_config_cc1_dup2,        //        bw_config_cc1_dup2.bw_config_cc1
		output wire [7:0]  bw_config_cc2_dup2,        //        bw_config_cc2_dup2.bw_config_cc2
		output wire [55:0] radio_config_status_dup2,  //  radio_config_status_dup2.radio_config_status
		output wire        short_long_prach_sel_dup2, // short_long_prach_sel_dup2.short_long_prach_sel
		output wire        rst_soft_n_dup2,           //           rst_soft_n_dup2.rst_soft_n
		output wire [7:0]  bw_config_cc1_dup3,        //        bw_config_cc1_dup3.bw_config_cc1
		output wire [7:0]  bw_config_cc2_dup3,        //        bw_config_cc2_dup3.bw_config_cc2
		output wire [55:0] radio_config_status_dup3,  //  radio_config_status_dup3.data
		output wire        short_long_prach_sel_dup3, // short_long_prach_sel_dup3.short_long_prach_sel
		output wire        rst_soft_n_dup3,           //           rst_soft_n_dup3.rst_soft_n
		input  wire        rst_soft_n,                //                rst_soft_n.rst_soft_n
		output wire        rst_soft_n_dup4,           //           rst_soft_n_dup4.rst_soft_n
		input  wire [31:0] interface_sel,             //             interface_sel.data
		output wire [31:0] interface_sel_dup1,        //        interface_sel_dup1.data
		output wire [31:0] interface_sel_dup2         //        interface_sel_dup2.data
	);
endmodule

