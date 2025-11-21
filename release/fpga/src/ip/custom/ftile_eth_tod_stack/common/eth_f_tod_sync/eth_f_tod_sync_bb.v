module eth_f_tod_sync #(
		parameter TOD_MODE     = 1,
		parameter SYNC_MODE    = 9,
		parameter SAMPLE_SIZE  = 256,
		parameter PERIOD_NSEC  = 2,
		parameter PERIOD_FNSEC = 36700
	) (
		input  wire        clk_master,      //      clk_master.clk
		input  wire        reset_master,    //    reset_master.reset
		input  wire        clk_slave,       //       clk_slave.clk
		input  wire        reset_slave,     //     reset_slave.reset
		input  wire        clk_sampling,    //    clk_sampling.clk
		input  wire        start_tod_sync,  //  start_tod_sync.data
		input  wire [95:0] tod_master_data, // tod_master_data.data
		output wire [95:0] tod_slave_data,  //  tod_slave_data.data
		output wire        tod_slave_valid  //                .valid
	);
endmodule

