module ghrd_f_mtod_pps_pll (
		input  wire        refclk,            //            refclk.clk
		output wire        locked,            //            locked.export
		input  wire        rst,               //             reset.reset
		input  wire [29:0] reconfig_to_pll,   //   reconfig_to_pll.reconfig_to_pll
		output wire [10:0] reconfig_from_pll, // reconfig_from_pll.reconfig_from_pll
		output wire        outclk_0,          //           outclk0.clk
		output wire        outclk_1           //           outclk1.clk
	);
endmodule

