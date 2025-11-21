module j204c_f_rx_tx_ip (
		input  wire [3:0]   intel_jesd204c_1_rx_serial_data_export,        //        intel_jesd204c_1_rx_serial_data.export
		input  wire [3:0]   intel_jesd204c_1_rx_serial_data_n_export,      //      intel_jesd204c_1_rx_serial_data_n.export
		output wire [3:0]   intel_jesd204c_1_tx_pma_ready_export,          //          intel_jesd204c_1_tx_pma_ready.export
		output wire [3:0]   intel_jesd204c_1_rx_pma_ready_export,          //          intel_jesd204c_1_rx_pma_ready.export
		output wire [3:0]   intel_jesd204c_1_tx_serial_data_export,        //        intel_jesd204c_1_tx_serial_data.export
		output wire [3:0]   intel_jesd204c_1_tx_serial_data_n_export,      //      intel_jesd204c_1_tx_serial_data_n.export
		input  wire [20:0]  intel_jesd204c_1_j204c_reconfig_address,       //        intel_jesd204c_1_j204c_reconfig.address
		input  wire         intel_jesd204c_1_j204c_reconfig_read,          //                                       .read
		output wire [7:0]   intel_jesd204c_1_j204c_reconfig_readdata,      //                                       .readdata
		output wire         intel_jesd204c_1_j204c_reconfig_waitrequest,   //                                       .waitrequest
		input  wire         intel_jesd204c_1_j204c_reconfig_write,         //                                       .write
		input  wire [7:0]   intel_jesd204c_1_j204c_reconfig_writedata,     //                                       .writedata
		input  wire         intel_jesd204c_1_j204c_txlclk_ctrl_export,     //     intel_jesd204c_1_j204c_txlclk_ctrl.export
		input  wire         intel_jesd204c_1_j204c_txfclk_ctrl_export,     //     intel_jesd204c_1_j204c_txfclk_ctrl.export
		input  wire         intel_jesd204c_1_j204c_tx_avs_chipselect,      //          intel_jesd204c_1_j204c_tx_avs.chipselect
		input  wire [9:0]   intel_jesd204c_1_j204c_tx_avs_address,         //                                       .address
		input  wire         intel_jesd204c_1_j204c_tx_avs_read,            //                                       .read
		output wire [31:0]  intel_jesd204c_1_j204c_tx_avs_readdata,        //                                       .readdata
		output wire         intel_jesd204c_1_j204c_tx_avs_waitrequest,     //                                       .waitrequest
		input  wire         intel_jesd204c_1_j204c_tx_avs_write,           //                                       .write
		input  wire [31:0]  intel_jesd204c_1_j204c_tx_avs_writedata,       //                                       .writedata
		input  wire [255:0] intel_jesd204c_1_j204c_tx_avst_data,           //         intel_jesd204c_1_j204c_tx_avst.data
		input  wire         intel_jesd204c_1_j204c_tx_avst_valid,          //                                       .valid
		output wire         intel_jesd204c_1_j204c_tx_avst_ready,          //                                       .ready
		input  wire         intel_jesd204c_1_j204c_tx_avst_control_export, // intel_jesd204c_1_j204c_tx_avst_control.export
		input  wire         intel_jesd204c_1_j204c_tx_sysref_export,       //       intel_jesd204c_1_j204c_tx_sysref.export
		output wire         intel_jesd204c_1_j204c_tx_somb_export,         //         intel_jesd204c_1_j204c_tx_somb.export
		output wire         intel_jesd204c_1_j204c_tx_soemb_export,        //        intel_jesd204c_1_j204c_tx_soemb.export
		output wire [3:0]   intel_jesd204c_1_j204c_tx_csr_l_export,        //        intel_jesd204c_1_j204c_tx_csr_l.export
		output wire [7:0]   intel_jesd204c_1_j204c_tx_csr_f_export,        //        intel_jesd204c_1_j204c_tx_csr_f.export
		output wire [7:0]   intel_jesd204c_1_j204c_tx_csr_m_export,        //        intel_jesd204c_1_j204c_tx_csr_m.export
		output wire [1:0]   intel_jesd204c_1_j204c_tx_csr_cs_export,       //       intel_jesd204c_1_j204c_tx_csr_cs.export
		output wire [4:0]   intel_jesd204c_1_j204c_tx_csr_n_export,        //        intel_jesd204c_1_j204c_tx_csr_n.export
		output wire [4:0]   intel_jesd204c_1_j204c_tx_csr_np_export,       //       intel_jesd204c_1_j204c_tx_csr_np.export
		output wire [4:0]   intel_jesd204c_1_j204c_tx_csr_s_export,        //        intel_jesd204c_1_j204c_tx_csr_s.export
		output wire         intel_jesd204c_1_j204c_tx_csr_hd_export,       //       intel_jesd204c_1_j204c_tx_csr_hd.export
		output wire [4:0]   intel_jesd204c_1_j204c_tx_csr_cf_export,       //       intel_jesd204c_1_j204c_tx_csr_cf.export
		output wire [7:0]   intel_jesd204c_1_j204c_tx_csr_e_export,        //        intel_jesd204c_1_j204c_tx_csr_e.export
		output wire [3:0]   intel_jesd204c_1_j204c_tx_csr_testmode_export, // intel_jesd204c_1_j204c_tx_csr_testmode.export
		output wire         intel_jesd204c_1_j204c_tx_int_irq,             //          intel_jesd204c_1_j204c_tx_int.irq
		input  wire         intel_jesd204c_1_j204c_rx_avs_chipselect,      //          intel_jesd204c_1_j204c_rx_avs.chipselect
		input  wire [9:0]   intel_jesd204c_1_j204c_rx_avs_address,         //                                       .address
		input  wire         intel_jesd204c_1_j204c_rx_avs_read,            //                                       .read
		output wire [31:0]  intel_jesd204c_1_j204c_rx_avs_readdata,        //                                       .readdata
		output wire         intel_jesd204c_1_j204c_rx_avs_waitrequest,     //                                       .waitrequest
		input  wire         intel_jesd204c_1_j204c_rx_avs_write,           //                                       .write
		input  wire [31:0]  intel_jesd204c_1_j204c_rx_avs_writedata,       //                                       .writedata
		output wire         intel_jesd204c_1_j204c_rx_int_irq,             //          intel_jesd204c_1_j204c_rx_int.irq
		output wire [3:0]   intel_jesd204c_1_j204c_rx_csr_l_export,        //        intel_jesd204c_1_j204c_rx_csr_l.export
		output wire [7:0]   intel_jesd204c_1_j204c_rx_csr_f_export,        //        intel_jesd204c_1_j204c_rx_csr_f.export
		output wire [7:0]   intel_jesd204c_1_j204c_rx_csr_m_export,        //        intel_jesd204c_1_j204c_rx_csr_m.export
		output wire [1:0]   intel_jesd204c_1_j204c_rx_csr_cs_export,       //       intel_jesd204c_1_j204c_rx_csr_cs.export
		output wire [4:0]   intel_jesd204c_1_j204c_rx_csr_n_export,        //        intel_jesd204c_1_j204c_rx_csr_n.export
		output wire [4:0]   intel_jesd204c_1_j204c_rx_csr_np_export,       //       intel_jesd204c_1_j204c_rx_csr_np.export
		output wire [4:0]   intel_jesd204c_1_j204c_rx_csr_s_export,        //        intel_jesd204c_1_j204c_rx_csr_s.export
		output wire         intel_jesd204c_1_j204c_rx_csr_hd_export,       //       intel_jesd204c_1_j204c_rx_csr_hd.export
		output wire [4:0]   intel_jesd204c_1_j204c_rx_csr_cf_export,       //       intel_jesd204c_1_j204c_rx_csr_cf.export
		output wire [7:0]   intel_jesd204c_1_j204c_rx_csr_e_export,        //        intel_jesd204c_1_j204c_rx_csr_e.export
		output wire [3:0]   intel_jesd204c_1_j204c_rx_csr_testmode_export, // intel_jesd204c_1_j204c_rx_csr_testmode.export
		input  wire         intel_jesd204c_1_j204c_rx_sysref_export,       //       intel_jesd204c_1_j204c_rx_sysref.export
		input  wire         intel_jesd204c_1_j204c_rxlclk_ctrl_export,     //     intel_jesd204c_1_j204c_rxlclk_ctrl.export
		input  wire         intel_jesd204c_1_j204c_rxfclk_ctrl_export,     //     intel_jesd204c_1_j204c_rxfclk_ctrl.export
		output wire [3:0]   intel_jesd204c_1_j204c_rx_cmd_par_err_export,  //  intel_jesd204c_1_j204c_rx_cmd_par_err.export
		output wire         intel_jesd204c_1_j204c_rx_somb_export,         //         intel_jesd204c_1_j204c_rx_somb.export
		output wire         intel_jesd204c_1_j204c_rx_soemb_export,        //        intel_jesd204c_1_j204c_rx_soemb.export
		output wire         intel_jesd204c_1_j204c_rx_sh_lock_export,      //      intel_jesd204c_1_j204c_rx_sh_lock.export
		output wire         intel_jesd204c_1_j204c_rx_emb_lock_export,     //     intel_jesd204c_1_j204c_rx_emb_lock.export
		output wire [255:0] intel_jesd204c_1_j204c_rx_avst_data,           //         intel_jesd204c_1_j204c_rx_avst.data
		output wire         intel_jesd204c_1_j204c_rx_avst_valid,          //                                       .valid
		input  wire         intel_jesd204c_1_j204c_rx_avst_ready,          //                                       .ready
		output wire         intel_jesd204c_1_j204c_rx_avst_control_export, // intel_jesd204c_1_j204c_rx_avst_control.export
		output wire [3:0]   intel_jesd204c_1_j204c_rx_crc_err_export,      //      intel_jesd204c_1_j204c_rx_crc_err.export
		input  wire         jesd_link_clk_in_clk_clk,                      //                   jesd_link_clk_in_clk.clk
		input  wire         mgmt_clk_in_clk_clk,                           //                        mgmt_clk_in_clk.clk
		input  wire         mgmt_reset_in_reset_reset_n,                   //                    mgmt_reset_in_reset.reset_n
		output wire         reset_out1_reset,                              //                             reset_out1.reset
		output wire         reset_out2_reset,                              //                             reset_out2.reset
		output wire         reset_out4_reset,                              //                             reset_out4.reset
		input  wire         reset1_dsrt_qual_reset1_dsrt_qual,             //                       reset1_dsrt_qual.reset1_dsrt_qual
		input  wire         reset2_dsrt_qual_reset2_dsrt_qual,             //                       reset2_dsrt_qual.reset2_dsrt_qual
		input  wire         reset4_dsrt_qual_reset4_dsrt_qual,             //                       reset4_dsrt_qual.reset4_dsrt_qual
		input  wire [7:0]   reset_sequencer_0_av_csr_address,              //               reset_sequencer_0_av_csr.address
		output wire [31:0]  reset_sequencer_0_av_csr_readdata,             //                                       .readdata
		input  wire         reset_sequencer_0_av_csr_read,                 //                                       .read
		input  wire [31:0]  reset_sequencer_0_av_csr_writedata,            //                                       .writedata
		input  wire         reset_sequencer_0_av_csr_write,                //                                       .write
		output wire         reset_sequencer_0_av_csr_irq_irq               //           reset_sequencer_0_av_csr_irq.irq
	);
endmodule

