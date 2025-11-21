	clk_ss u0 (
		.clk_csr_in_clk_clk              (_connected_to_clk_csr_in_clk_clk_),              //   input,  width = 1,              clk_csr_in_clk.clk
		.clk_csr_out_clk_clk             (_connected_to_clk_csr_out_clk_clk_),             //  output,  width = 1,             clk_csr_out_clk.clk
		.clk_dsp_in_clk_clk              (_connected_to_clk_dsp_in_clk_clk_),              //   input,  width = 1,              clk_dsp_in_clk.clk
		.clk_dsp_out_clk_clk             (_connected_to_clk_dsp_out_clk_clk_),             //  output,  width = 1,             clk_dsp_out_clk.clk
		.clk_eth_in_clk_clk              (_connected_to_clk_eth_in_clk_clk_),              //   input,  width = 1,              clk_eth_in_clk.clk
		.clk_eth_out_clk_clk             (_connected_to_clk_eth_out_clk_clk_),             //  output,  width = 1,             clk_eth_out_clk.clk
		.clk_ftile_402_in_clk_clk        (_connected_to_clk_ftile_402_in_clk_clk_),        //   input,  width = 1,        clk_ftile_402_in_clk.clk
		.clk_ftile_402_out_clk_clk       (_connected_to_clk_ftile_402_out_clk_clk_),       //  output,  width = 1,       clk_ftile_402_out_clk.clk
		.clock_bridge_rec_rx_in_clk_clk  (_connected_to_clock_bridge_rec_rx_in_clk_clk_),  //   input,  width = 1,  clock_bridge_rec_rx_in_clk.clk
		.clock_bridge_rec_rx_out_clk_clk (_connected_to_clock_bridge_rec_rx_out_clk_clk_), //  output,  width = 1, clock_bridge_rec_rx_out_clk.clk
		.ftile_in_clk_clk                (_connected_to_ftile_in_clk_clk_),                //   input,  width = 1,                ftile_in_clk.clk
		.ftile_out_clk_clk               (_connected_to_ftile_out_clk_clk_)                //  output,  width = 1,               ftile_out_clk.clk
	);

