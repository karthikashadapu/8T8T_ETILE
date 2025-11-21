	profiling_cdc_pipeline #(
		.DW     (INTEGER_VALUE_FOR_DW),
		.DELAYS (INTEGER_VALUE_FOR_DELAYS)
	) u0 (
		.src_clk       (_connected_to_src_clk_),       //   input,   width = 1,       src_clk.clk
		.rst_src_clk_n (_connected_to_rst_src_clk_n_), //   input,   width = 1, rst_src_clk_n.reset_n
		.dst_clk       (_connected_to_dst_clk_),       //   input,   width = 1,       dst_clk.clk
		.rst_dst_clk_n (_connected_to_rst_dst_clk_n_), //   input,   width = 1, rst_dst_clk_n.reset_n
		.datain        (_connected_to_datain_),        //   input,  width = DW,        datain.data
		.dataout       (_connected_to_dataout_)        //  output,  width = DW,       dataout.data
	);

