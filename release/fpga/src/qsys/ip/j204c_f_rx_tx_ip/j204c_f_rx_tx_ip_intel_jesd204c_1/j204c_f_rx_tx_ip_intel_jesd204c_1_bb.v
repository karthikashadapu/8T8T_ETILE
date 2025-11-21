module j204c_f_rx_tx_ip_intel_jesd204c_1 (
		input  wire         j204c_tx_phy_rst_n,         //         j204c_tx_phy_rst_n.reset_n
		input  wire         j204c_rx_phy_rst_n,         //         j204c_rx_phy_rst_n.reset_n
		input  wire [3:0]   rx_serial_data,             //             rx_serial_data.export
		input  wire [3:0]   rx_serial_data_n,           //           rx_serial_data_n.export
		input  wire         j204c_pll_refclk,           //           j204c_pll_refclk.clk
		output wire [3:0]   tx_pma_ready,               //               tx_pma_ready.export
		output wire [3:0]   rx_pma_ready,               //               rx_pma_ready.export
		output wire [3:0]   tx_serial_data,             //             tx_serial_data.export
		output wire [3:0]   tx_serial_data_n,           //           tx_serial_data_n.export
		input  wire         j204c_reconfig_clk,         //         j204c_reconfig_clk.clk
		input  wire         j204c_reconfig_reset,       //       j204c_reconfig_reset.reset
		input  wire [20:0]  j204c_reconfig_address,     //             j204c_reconfig.address
		input  wire         j204c_reconfig_read,        //                           .read
		output wire [7:0]   j204c_reconfig_readdata,    //                           .readdata
		output wire         j204c_reconfig_waitrequest, //                           .waitrequest
		input  wire         j204c_reconfig_write,       //                           .write
		input  wire [7:0]   j204c_reconfig_writedata,   //                           .writedata
		input  wire         j204c_txlink_clk,           //           j204c_txlink_clk.clk
		input  wire         j204c_txframe_clk,          //          j204c_txframe_clk.clk
		input  wire         j204c_tx_rst_n,             //             j204c_tx_rst_n.reset_n
		input  wire         j204c_txlclk_ctrl,          //          j204c_txlclk_ctrl.export
		input  wire         j204c_txfclk_ctrl,          //          j204c_txfclk_ctrl.export
		input  wire         j204c_tx_avs_clk,           //           j204c_tx_avs_clk.clk
		input  wire         j204c_tx_avs_rst_n,         //         j204c_tx_avs_rst_n.reset_n
		input  wire         j204c_tx_avs_chipselect,    //               j204c_tx_avs.chipselect
		input  wire [9:0]   j204c_tx_avs_address,       //                           .address
		input  wire         j204c_tx_avs_read,          //                           .read
		output wire [31:0]  j204c_tx_avs_readdata,      //                           .readdata
		output wire         j204c_tx_avs_waitrequest,   //                           .waitrequest
		input  wire         j204c_tx_avs_write,         //                           .write
		input  wire [31:0]  j204c_tx_avs_writedata,     //                           .writedata
		input  wire [255:0] j204c_tx_avst_data,         //              j204c_tx_avst.data
		input  wire         j204c_tx_avst_valid,        //                           .valid
		output wire         j204c_tx_avst_ready,        //                           .ready
		input  wire         j204c_tx_avst_control,      //      j204c_tx_avst_control.export
		input  wire [23:0]  j204c_tx_cmd_data,          //               j204c_tx_cmd.data
		input  wire         j204c_tx_cmd_valid,         //                           .valid
		output wire         j204c_tx_cmd_ready,         //                           .ready
		input  wire         j204c_tx_sysref,            //            j204c_tx_sysref.export
		output wire         j204c_tx_somb,              //              j204c_tx_somb.export
		output wire         j204c_tx_soemb,             //             j204c_tx_soemb.export
		output wire [3:0]   j204c_tx_csr_l,             //             j204c_tx_csr_l.export
		output wire [7:0]   j204c_tx_csr_f,             //             j204c_tx_csr_f.export
		output wire [7:0]   j204c_tx_csr_m,             //             j204c_tx_csr_m.export
		output wire [1:0]   j204c_tx_csr_cs,            //            j204c_tx_csr_cs.export
		output wire [4:0]   j204c_tx_csr_n,             //             j204c_tx_csr_n.export
		output wire [4:0]   j204c_tx_csr_np,            //            j204c_tx_csr_np.export
		output wire [4:0]   j204c_tx_csr_s,             //             j204c_tx_csr_s.export
		output wire         j204c_tx_csr_hd,            //            j204c_tx_csr_hd.export
		output wire [4:0]   j204c_tx_csr_cf,            //            j204c_tx_csr_cf.export
		output wire [7:0]   j204c_tx_csr_e,             //             j204c_tx_csr_e.export
		output wire [3:0]   j204c_tx_csr_testmode,      //      j204c_tx_csr_testmode.export
		output wire         j204c_tx_int,               //               j204c_tx_int.irq
		input  wire         j204c_rx_avs_clk,           //           j204c_rx_avs_clk.clk
		input  wire         j204c_rx_avs_rst_n,         //         j204c_rx_avs_rst_n.reset_n
		input  wire         j204c_rx_avs_chipselect,    //               j204c_rx_avs.chipselect
		input  wire [9:0]   j204c_rx_avs_address,       //                           .address
		input  wire         j204c_rx_avs_read,          //                           .read
		output wire [31:0]  j204c_rx_avs_readdata,      //                           .readdata
		output wire         j204c_rx_avs_waitrequest,   //                           .waitrequest
		input  wire         j204c_rx_avs_write,         //                           .write
		input  wire [31:0]  j204c_rx_avs_writedata,     //                           .writedata
		output wire         j204c_rx_int,               //               j204c_rx_int.irq
		output wire [3:0]   j204c_rx_csr_l,             //             j204c_rx_csr_l.export
		output wire [7:0]   j204c_rx_csr_f,             //             j204c_rx_csr_f.export
		output wire [7:0]   j204c_rx_csr_m,             //             j204c_rx_csr_m.export
		output wire [1:0]   j204c_rx_csr_cs,            //            j204c_rx_csr_cs.export
		output wire [4:0]   j204c_rx_csr_n,             //             j204c_rx_csr_n.export
		output wire [4:0]   j204c_rx_csr_np,            //            j204c_rx_csr_np.export
		output wire [4:0]   j204c_rx_csr_s,             //             j204c_rx_csr_s.export
		output wire         j204c_rx_csr_hd,            //            j204c_rx_csr_hd.export
		output wire [4:0]   j204c_rx_csr_cf,            //            j204c_rx_csr_cf.export
		output wire [7:0]   j204c_rx_csr_e,             //             j204c_rx_csr_e.export
		output wire [3:0]   j204c_rx_csr_testmode,      //      j204c_rx_csr_testmode.export
		input  wire         j204c_rx_sysref,            //            j204c_rx_sysref.export
		input  wire         j204c_rxlink_clk,           //           j204c_rxlink_clk.clk
		input  wire         j204c_rxframe_clk,          //          j204c_rxframe_clk.clk
		input  wire         j204c_rxlclk_ctrl,          //          j204c_rxlclk_ctrl.export
		input  wire         j204c_rxfclk_ctrl,          //          j204c_rxfclk_ctrl.export
		input  wire         j204c_rx_rst_n,             //             j204c_rx_rst_n.reset_n
		output wire         j204c_rx_dev_lane_align,    //    j204c_rx_dev_lane_align.export
		input  wire         j204c_rx_alldev_lane_align, // j204c_rx_alldev_lane_align.export
		output wire [23:0]  j204c_rx_cmd_data,          //               j204c_rx_cmd.data
		output wire         j204c_rx_cmd_valid,         //                           .valid
		input  wire         j204c_rx_cmd_ready,         //                           .ready
		output wire [3:0]   j204c_rx_cmd_par_err,       //       j204c_rx_cmd_par_err.export
		output wire         j204c_rx_somb,              //              j204c_rx_somb.export
		output wire         j204c_rx_soemb,             //             j204c_rx_soemb.export
		output wire         j204c_rx_sh_lock,           //           j204c_rx_sh_lock.export
		output wire         j204c_rx_emb_lock,          //          j204c_rx_emb_lock.export
		output wire [255:0] j204c_rx_avst_data,         //              j204c_rx_avst.data
		output wire         j204c_rx_avst_valid,        //                           .valid
		input  wire         j204c_rx_avst_ready,        //                           .ready
		output wire         j204c_rx_avst_control,      //      j204c_rx_avst_control.export
		output wire [3:0]   j204c_rx_crc_err,           //           j204c_rx_crc_err.export
		output wire [3:0]   rx_ready,                   //                   rx_ready.export
		output wire [3:0]   tx_ready                    //                   tx_ready.export
	);
endmodule

