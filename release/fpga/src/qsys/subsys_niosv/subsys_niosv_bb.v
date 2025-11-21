module subsys_niosv (
		input  wire       clk_clk,               //            clk.clk
		input  wire       issp_reset_in_reset,   //  issp_reset_in.reset
		output wire [0:0] issp_reset_out_source, // issp_reset_out.source
		input  wire       reset_reset_n          //          reset.reset_n
	);
endmodule

