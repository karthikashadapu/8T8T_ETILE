module ed_synth (
		input  wire         capture_if_reset_soft_n_rst_soft_n,                 //        capture_if_reset_soft_n.rst_soft_n
		input  wire [55:0]  capture_if_radio_config_status_radio_config_status, // capture_if_radio_config_status.radio_config_status
		input  wire         lphy_avst_sink_dsp_capture_valid,                   //     lphy_avst_sink_dsp_capture.valid
		input  wire [31:0]  lphy_avst_sink_dsp_capture_data,                    //                               .data
		input  wire [2:0]   lphy_avst_sink_dsp_capture_channel,                 //                               .channel
		input  wire         dxc_avst_sink_dsp_capture_valid,                    //      dxc_avst_sink_dsp_capture.valid
		input  wire [31:0]  dxc_avst_sink_dsp_capture_data,                     //                               .data
		input  wire [2:0]   dxc_avst_sink_dsp_capture_channel,                  //                               .channel
		output wire [31:0]  interface_sel_data,                                 //                  interface_sel.data
		input  wire         dsp_in_clk_clk,                                     //                     dsp_in_clk.clk
		input  wire         eth_in_clk_clk,                                     //                     eth_in_clk.clk
		input  wire         clock_csr_clk,                                      //                      clock_csr.clk
		input  wire         clock_bridge_dspby2_in_clk_clk,                     //     clock_bridge_dspby2_in_clk.clk
		output wire         ed_synth_h2f_bridge_s0_waitrequest,                 //         ed_synth_h2f_bridge_s0.waitrequest
		output wire [511:0] ed_synth_h2f_bridge_s0_readdata,                    //                               .readdata
		output wire         ed_synth_h2f_bridge_s0_readdatavalid,               //                               .readdatavalid
		input  wire [0:0]   ed_synth_h2f_bridge_s0_burstcount,                  //                               .burstcount
		input  wire [511:0] ed_synth_h2f_bridge_s0_writedata,                   //                               .writedata
		input  wire [27:0]  ed_synth_h2f_bridge_s0_address,                     //                               .address
		input  wire         ed_synth_h2f_bridge_s0_write,                       //                               .write
		input  wire         ed_synth_h2f_bridge_s0_read,                        //                               .read
		input  wire [63:0]  ed_synth_h2f_bridge_s0_byteenable,                  //                               .byteenable
		input  wire         ed_synth_h2f_bridge_s0_debugaccess,                 //                               .debugaccess
		output wire         h2f_lw_bridge_s0_waitrequest,                       //               h2f_lw_bridge_s0.waitrequest
		output wire [31:0]  h2f_lw_bridge_s0_readdata,                          //                               .readdata
		output wire         h2f_lw_bridge_s0_readdatavalid,                     //                               .readdatavalid
		input  wire [0:0]   h2f_lw_bridge_s0_burstcount,                        //                               .burstcount
		input  wire [31:0]  h2f_lw_bridge_s0_writedata,                         //                               .writedata
		input  wire [12:0]  h2f_lw_bridge_s0_address,                           //                               .address
		input  wire         h2f_lw_bridge_s0_write,                             //                               .write
		input  wire         h2f_lw_bridge_s0_read,                              //                               .read
		input  wire [3:0]   h2f_lw_bridge_s0_byteenable,                        //                               .byteenable
		input  wire         h2f_lw_bridge_s0_debugaccess,                       //                               .debugaccess
		input  wire         dsp_in_reset_reset_n,                               //                   dsp_in_reset.reset_n
		input  wire         eth_in_reset_reset_n,                               //                   eth_in_reset.reset_n
		input  wire         reset_csr_reset_n                                   //                      reset_csr.reset_n
	);
endmodule

