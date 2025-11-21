	rst_ss u0 (
		.dsp_rst_cntrl_reset_in0_reset        (_connected_to_dsp_rst_cntrl_reset_in0_reset_),        //   input,  width = 1,        dsp_rst_cntrl_reset_in0.reset
		.dsp_rst_cntrl_clk_clk                (_connected_to_dsp_rst_cntrl_clk_clk_),                //   input,  width = 1,              dsp_rst_cntrl_clk.clk
		.dsp_rst_cntrl_reset_out_reset        (_connected_to_dsp_rst_cntrl_reset_out_reset_),        //  output,  width = 1,        dsp_rst_cntrl_reset_out.reset
		.ecpri_rst_cntrl_reset_in0_reset      (_connected_to_ecpri_rst_cntrl_reset_in0_reset_),      //   input,  width = 1,      ecpri_rst_cntrl_reset_in0.reset
		.ecpri_rst_cntrl_clk_clk              (_connected_to_ecpri_rst_cntrl_clk_clk_),              //   input,  width = 1,            ecpri_rst_cntrl_clk.clk
		.ecpri_rst_cntrl_reset_out_reset      (_connected_to_ecpri_rst_cntrl_reset_out_reset_),      //  output,  width = 1,      ecpri_rst_cntrl_reset_out.reset
		.eth_rst_cntrl_reset_in0_reset        (_connected_to_eth_rst_cntrl_reset_in0_reset_),        //   input,  width = 1,        eth_rst_cntrl_reset_in0.reset
		.eth_rst_cntrl_clk_clk                (_connected_to_eth_rst_cntrl_clk_clk_),                //   input,  width = 1,              eth_rst_cntrl_clk.clk
		.eth_rst_cntrl_reset_out_reset        (_connected_to_eth_rst_cntrl_reset_out_reset_),        //  output,  width = 1,        eth_rst_cntrl_reset_out.reset
		.reset_bridge_act_high_clk_clk        (_connected_to_reset_bridge_act_high_clk_clk_),        //   input,  width = 1,      reset_bridge_act_high_clk.clk
		.reset_bridge_act_high_in_reset_reset (_connected_to_reset_bridge_act_high_in_reset_reset_), //   input,  width = 1, reset_bridge_act_high_in_reset.reset
		.rst_csr_clk_clk                      (_connected_to_rst_csr_clk_clk_),                      //   input,  width = 1,                    rst_csr_clk.clk
		.rst_csr_in_reset_reset_n             (_connected_to_rst_csr_in_reset_reset_n_),             //   input,  width = 1,               rst_csr_in_reset.reset_n
		.rst_csr_out_reset_reset_n            (_connected_to_rst_csr_out_reset_reset_n_),            //  output,  width = 1,              rst_csr_out_reset.reset_n
		.reset_bridge_rec_rx_clk_clk          (_connected_to_reset_bridge_rec_rx_clk_clk_),          //   input,  width = 1,        reset_bridge_rec_rx_clk.clk
		.reset_bridge_rec_rx_in_reset_reset   (_connected_to_reset_bridge_rec_rx_in_reset_reset_),   //   input,  width = 1,   reset_bridge_rec_rx_in_reset.reset
		.reset_bridge_tx_div_clk_clk          (_connected_to_reset_bridge_tx_div_clk_clk_),          //   input,  width = 1,        reset_bridge_tx_div_clk.clk
		.reset_bridge_tx_div_in_reset_reset   (_connected_to_reset_bridge_tx_div_in_reset_reset_)    //   input,  width = 1,   reset_bridge_tx_div_in_reset.reset
	);

