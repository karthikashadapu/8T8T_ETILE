module profiling_cdc_pipeline #(
		parameter DW     = 56,
		parameter DELAYS = 2
	) (
		input  wire          src_clk,       //       src_clk.clk
		input  wire          rst_src_clk_n, // rst_src_clk_n.reset_n
		input  wire          dst_clk,       //       dst_clk.clk
		input  wire          rst_dst_clk_n, // rst_dst_clk_n.reset_n
		input  wire [DW-1:0] datain,        //        datain.data
		output wire [DW-1:0] dataout        //       dataout.data
	);
endmodule

