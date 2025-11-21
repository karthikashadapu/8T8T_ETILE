module ghrd_f_mtod_pps_pll_rcfg (
		input  wire        mgmt_clk,          //          mgmt_clk.clk
		input  wire        mgmt_reset,        //        mgmt_reset.reset
		output wire        mgmt_waitrequest,  // mgmt_avalon_slave.waitrequest
		input  wire        mgmt_write,        //                  .write
		input  wire        mgmt_read,         //                  .read
		input  wire [7:0]  mgmt_writedata,    //                  .writedata
		output wire [7:0]  mgmt_readdata,     //                  .readdata
		input  wire [9:0]  mgmt_address,      //                  .address
		output wire [29:0] reconfig_to_pll,   //   reconfig_to_pll.reconfig_to_pll
		input  wire [10:0] reconfig_from_pll  // reconfig_from_pll.reconfig_from_pll
	);
endmodule

