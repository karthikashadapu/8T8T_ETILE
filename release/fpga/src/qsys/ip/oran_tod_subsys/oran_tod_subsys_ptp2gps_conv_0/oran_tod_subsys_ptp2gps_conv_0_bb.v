module oran_tod_subsys_ptp2gps_conv_0 (
		input  wire        rst_tod_n,   //   rst_tod_n.reset_n
		input  wire [95:0] ptp_seconds, // ptp_seconds.data
		output wire [95:0] gps_seconds, // gps_seconds.data
		input  wire        clk_tod      //     clk_tod.clk
	);
endmodule

