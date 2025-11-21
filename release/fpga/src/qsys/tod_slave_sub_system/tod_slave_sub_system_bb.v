module tod_slave_sub_system (
		input  wire [95:0] master_tod_split_conduit_end_data,             //             master_tod_split_conduit_end.data
		input  wire        master_tod_split_conduit_end_valid,            //                                         .valid
		output wire [95:0] master_tod_split_conduit_end_10_data,          //          master_tod_split_conduit_end_10.data
		output wire        master_tod_split_conduit_end_10_valid,         //                                         .valid
		input  wire        oran_tod_stack_tx_clk_clk,                     //                    oran_tod_stack_tx_clk.clk
		input  wire        oran_tod_stack_rx_clk_clk,                     //                    oran_tod_stack_rx_clk.clk
		input  wire        oran_tod_stack_todsync_sample_clk_clk,         //        oran_tod_stack_todsync_sample_clk.clk
		output wire [95:0] oran_tod_stack_tx_tod_interface_tdata,         //          oran_tod_stack_tx_tod_interface.tdata
		output wire        oran_tod_stack_tx_tod_interface_tvalid,        //                                         .tvalid
		output wire [95:0] oran_tod_stack_rx_tod_interface_tdata,         //          oran_tod_stack_rx_tod_interface.tdata
		output wire        oran_tod_stack_rx_tod_interface_tvalid,        //                                         .tvalid
		input  wire        oran_tod_stack_tx_pll_locked_lock,             //             oran_tod_stack_tx_pll_locked.lock
		input  wire        port_8_tod_stack_tx_clk_clk,                   //                  port_8_tod_stack_tx_clk.clk
		input  wire        port_8_tod_stack_rx_clk_clk,                   //                  port_8_tod_stack_rx_clk.clk
		input  wire        port_8_tod_stack_todsync_sample_clk_clk,       //      port_8_tod_stack_todsync_sample_clk.clk
		output wire [95:0] port_8_tod_stack_tx_tod_interface_tdata,       //        port_8_tod_stack_tx_tod_interface.tdata
		output wire        port_8_tod_stack_tx_tod_interface_tvalid,      //                                         .tvalid
		output wire [95:0] port_8_tod_stack_rx_tod_interface_tdata,       //        port_8_tod_stack_rx_tod_interface.tdata
		output wire        port_8_tod_stack_rx_tod_interface_tvalid,      //                                         .tvalid
		input  wire        port_8_tod_stack_tx_pll_locked_lock,           //           port_8_tod_stack_tx_pll_locked.lock
		input  wire        tod_subsys_clk_100_in_clk_clk,                 //                tod_subsys_clk_100_in_clk.clk
		input  wire        tod_subsys_mtod_clk_in_clk_clk,                //               tod_subsys_mtod_clk_in_clk.clk
		input  wire        tod_subsys_rst_100_in_reset_reset_n,           //              tod_subsys_rst_100_in_reset.reset_n
		input  wire [0:0]  todsync_sample_plllock_split_conduit_end_lock  // todsync_sample_plllock_split_conduit_end.lock
	);
endmodule

