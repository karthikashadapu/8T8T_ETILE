module clk_ss (
		input  wire  clk_csr_in_clk_clk,              //              clk_csr_in_clk.clk
		output wire  clk_csr_out_clk_clk,             //             clk_csr_out_clk.clk
		input  wire  clk_dsp_in_clk_clk,              //              clk_dsp_in_clk.clk
		output wire  clk_dsp_out_clk_clk,             //             clk_dsp_out_clk.clk
		input  wire  clk_eth_in_clk_clk,              //              clk_eth_in_clk.clk
		output wire  clk_eth_out_clk_clk,             //             clk_eth_out_clk.clk
		input  wire  clk_ftile_402_in_clk_clk,        //        clk_ftile_402_in_clk.clk
		output wire  clk_ftile_402_out_clk_clk,       //       clk_ftile_402_out_clk.clk
		input  wire  clock_bridge_rec_rx_in_clk_clk,  //  clock_bridge_rec_rx_in_clk.clk
		output wire  clock_bridge_rec_rx_out_clk_clk, // clock_bridge_rec_rx_out_clk.clk
		input  wire  ftile_in_clk_clk,                //                ftile_in_clk.clk
		output wire  ftile_out_clk_clk                //               ftile_out_clk.clk
	);
endmodule

