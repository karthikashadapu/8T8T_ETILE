module rst_ss (
		input  wire  dsp_rst_cntrl_reset_in0_reset,        //        dsp_rst_cntrl_reset_in0.reset
		input  wire  dsp_rst_cntrl_clk_clk,                //              dsp_rst_cntrl_clk.clk
		output wire  dsp_rst_cntrl_reset_out_reset,        //        dsp_rst_cntrl_reset_out.reset
		input  wire  ecpri_rst_cntrl_reset_in0_reset,      //      ecpri_rst_cntrl_reset_in0.reset
		input  wire  ecpri_rst_cntrl_clk_clk,              //            ecpri_rst_cntrl_clk.clk
		output wire  ecpri_rst_cntrl_reset_out_reset,      //      ecpri_rst_cntrl_reset_out.reset
		input  wire  eth_rst_cntrl_reset_in0_reset,        //        eth_rst_cntrl_reset_in0.reset
		input  wire  eth_rst_cntrl_clk_clk,                //              eth_rst_cntrl_clk.clk
		output wire  eth_rst_cntrl_reset_out_reset,        //        eth_rst_cntrl_reset_out.reset
		input  wire  reset_bridge_act_high_clk_clk,        //      reset_bridge_act_high_clk.clk
		input  wire  reset_bridge_act_high_in_reset_reset, // reset_bridge_act_high_in_reset.reset
		input  wire  rst_csr_clk_clk,                      //                    rst_csr_clk.clk
		input  wire  rst_csr_in_reset_reset_n,             //               rst_csr_in_reset.reset_n
		output wire  rst_csr_out_reset_reset_n,            //              rst_csr_out_reset.reset_n
		input  wire  reset_bridge_rec_rx_clk_clk,          //        reset_bridge_rec_rx_clk.clk
		input  wire  reset_bridge_rec_rx_in_reset_reset,   //   reset_bridge_rec_rx_in_reset.reset
		input  wire  reset_bridge_tx_div_clk_clk,          //        reset_bridge_tx_div_clk.clk
		input  wire  reset_bridge_tx_div_in_reset_reset    //   reset_bridge_tx_div_in_reset.reset
	);
endmodule

