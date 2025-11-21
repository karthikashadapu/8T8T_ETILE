	subsys_niosv u0 (
		.clk_clk               (_connected_to_clk_clk_),               //   input,  width = 1,            clk.clk
		.issp_reset_in_reset   (_connected_to_issp_reset_in_reset_),   //   input,  width = 1,  issp_reset_in.reset
		.issp_reset_out_source (_connected_to_issp_reset_out_source_), //  output,  width = 1, issp_reset_out.source
		.reset_reset_n         (_connected_to_reset_reset_n_)          //   input,  width = 1,          reset.reset_n
	);

