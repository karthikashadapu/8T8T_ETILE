module port_0_tod_stack_1 #(
		parameter NUMPORTS = 1
	) (
		input  wire        i_reconfig_clk,              //          reconfig_clk.clk
		input  wire        i_reconfig_reset,            //       reconfig_resetn.reset_n
		input  wire        i_clk_tx_tod,                //                tx_clk.clk
		input  wire        i_clk_rx_tod,                //                rx_clk.clk
		input  wire        i_clk_master_tod,            //              mtod_clk.clk
		input  wire        i_clk_todsync_sample,        //    todsync_sample_clk.clk
		input  wire        i_clk_todsync_sample_locked, // todsync_sample_locked.lock
		input  wire [95:0] i_ptp_master_tod,            //  master_tod_interface.data
		input  wire        i_ptp_master_tod_valid,      //                      .valid
		output wire [95:0] ptp_tx_tod,                  //      tx_tod_interface.tdata
		output wire        ptp_tx_tod_valid,            //                      .tvalid
		output wire [95:0] ptp_rx_tod,                  //      rx_tod_interface.tdata
		output wire        ptp_rx_tod_valid,            //                      .tvalid
		input  wire        i_tx_pll_locked,             //         tx_pll_locked.lock
		input  wire        i_ptp_master_tod_rst_n       //          mtod_reset_n.reset_n
	);
endmodule

