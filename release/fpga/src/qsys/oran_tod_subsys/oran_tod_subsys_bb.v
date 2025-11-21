module oran_tod_subsys (
		input  wire        eth_1588_tod_synchronizer_clk_master_clk,      //     eth_1588_tod_synchronizer_clk_master.clk
		input  wire        eth_1588_tod_synchronizer_reset_master_reset,  //   eth_1588_tod_synchronizer_reset_master.reset
		input  wire        eth_1588_tod_synchronizer_clk_slave_clk,       //      eth_1588_tod_synchronizer_clk_slave.clk
		input  wire        eth_1588_tod_synchronizer_reset_slave_reset,   //    eth_1588_tod_synchronizer_reset_slave.reset
		input  wire        eth_1588_tod_synchronizer_clk_sampling_clk,    //   eth_1588_tod_synchronizer_clk_sampling.clk
		input  wire        eth_1588_tod_synchronizer_start_tod_sync_data, // eth_1588_tod_synchronizer_start_tod_sync.data
		output wire [95:0] oran_tod_time_of_day_96b_data,                 //                 oran_tod_time_of_day_96b.data
		output wire        oran_tod_time_of_day_96b_valid,                //                                         .valid
		input  wire        rst_tod_n_reset_n,                             //                                rst_tod_n.reset_n
		input  wire [95:0] ptp_seconds_data,                              //                              ptp_seconds.data
		input  wire        clk_tod_clk                                    //                                  clk_tod.clk
	);
endmodule

