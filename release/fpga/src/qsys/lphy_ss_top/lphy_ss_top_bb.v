module lphy_ss_top (
		input  wire         clk_csr_clk,                                    //                                    clk_csr.clk
		input  wire         clk_dsp_clk,                                    //                                    clk_dsp.clk
		input  wire         clk_xran_dl_clk,                                //                                clk_xran_dl.clk
		input  wire         clk_xran_ul_clk,                                //                                clk_xran_ul.clk
		output wire         pwr_mtr_h2f_bridge_s0_waitrequest,              //                      pwr_mtr_h2f_bridge_s0.waitrequest
		output wire [31:0]  pwr_mtr_h2f_bridge_s0_readdata,                 //                                           .readdata
		output wire         pwr_mtr_h2f_bridge_s0_readdatavalid,            //                                           .readdatavalid
		input  wire [0:0]   pwr_mtr_h2f_bridge_s0_burstcount,               //                                           .burstcount
		input  wire [31:0]  pwr_mtr_h2f_bridge_s0_writedata,                //                                           .writedata
		input  wire [16:0]  pwr_mtr_h2f_bridge_s0_address,                  //                                           .address
		input  wire         pwr_mtr_h2f_bridge_s0_write,                    //                                           .write
		input  wire         pwr_mtr_h2f_bridge_s0_read,                     //                                           .read
		input  wire [3:0]   pwr_mtr_h2f_bridge_s0_byteenable,               //                                           .byteenable
		input  wire         pwr_mtr_h2f_bridge_s0_debugaccess,              //                                           .debugaccess
		output wire         h2f_lw_bridge_s0_waitrequest,                   //                           h2f_lw_bridge_s0.waitrequest
		output wire [31:0]  h2f_lw_bridge_s0_readdata,                      //                                           .readdata
		output wire         h2f_lw_bridge_s0_readdatavalid,                 //                                           .readdatavalid
		input  wire [0:0]   h2f_lw_bridge_s0_burstcount,                    //                                           .burstcount
		input  wire [31:0]  h2f_lw_bridge_s0_writedata,                     //                                           .writedata
		input  wire [18:0]  h2f_lw_bridge_s0_address,                       //                                           .address
		input  wire         h2f_lw_bridge_s0_write,                         //                                           .write
		input  wire         h2f_lw_bridge_s0_read,                          //                                           .read
		input  wire [3:0]   h2f_lw_bridge_s0_byteenable,                    //                                           .byteenable
		input  wire         h2f_lw_bridge_s0_debugaccess,                   //                                           .debugaccess
		input  wire [16:0]  pb_mm_bridge_address,                           //                               pb_mm_bridge.address
		input  wire         pb_mm_bridge_chipselect,                        //                                           .chipselect
		input  wire         pb_mm_bridge_read,                              //                                           .read
		output wire [31:0]  pb_mm_bridge_readdata,                          //                                           .readdata
		input  wire         pb_mm_bridge_write,                             //                                           .write
		input  wire [31:0]  pb_mm_bridge_writedata,                         //                                           .writedata
		input  wire [3:0]   pb_mm_bridge_byteenable,                        //                                           .byteenable
		output wire         pb_mm_bridge_waitrequest,                       //                                           .waitrequest
		input  wire         xran_demapper_source_valid,                     //                       xran_demapper_source.valid
		input  wire [127:0] xran_demapper_source_data,                      //                                           .data
		input  wire         xran_demapper_source_endofpacket,               //                                           .endofpacket
		input  wire         xran_demapper_source_startofpacket,             //                                           .startofpacket
		output wire         xran_demapper_source_ready,                     //                                           .ready
		input  wire [15:0]  xran_demapper_source_channel,                   //                                           .channel
		output wire         ifft_source_l1_valid,                           //                             ifft_source_l1.valid
		output wire [31:0]  ifft_source_l1_data,                            //                                           .data
		output wire [7:0]   ifft_source_l1_channel,                         //                                           .channel
		output wire         ifft_source_l2_valid,                           //                             ifft_source_l2.valid
		output wire [31:0]  ifft_source_l2_data,                            //                                           .data
		output wire [7:0]   ifft_source_l2_channel,                         //                                           .channel
		output wire         coupling_pusch_avst_sink_l1_valid,              //                coupling_pusch_avst_sink_l1.valid
		output wire [31:0]  coupling_pusch_avst_sink_l1_data,               //                                           .data
		output wire [15:0]  coupling_pusch_avst_sink_l1_channel,            //                                           .channel
		output wire         coupling_pusch_avst_sink_l1_startofpacket,      //                                           .startofpacket
		output wire         coupling_pusch_avst_sink_l1_endofpacket,        //                                           .endofpacket
		output wire         coupling_pusch_avst_sink_l2_valid,              //                coupling_pusch_avst_sink_l2.valid
		output wire [31:0]  coupling_pusch_avst_sink_l2_data,               //                                           .data
		output wire [15:0]  coupling_pusch_avst_sink_l2_channel,            //                                           .channel
		output wire         coupling_pusch_avst_sink_l2_startofpacket,      //                                           .startofpacket
		output wire         coupling_pusch_avst_sink_l2_endofpacket,        //                                           .endofpacket
		output wire         coupling_prach_avst_sink_l1_valid,              //                coupling_prach_avst_sink_l1.valid
		output wire [31:0]  coupling_prach_avst_sink_l1_data,               //                                           .data
		output wire [15:0]  coupling_prach_avst_sink_l1_channel,            //                                           .channel
		output wire         coupling_prach_avst_sink_l1_startofpacket,      //                                           .startofpacket
		output wire         coupling_prach_avst_sink_l1_endofpacket,        //                                           .endofpacket
		output wire         coupling_prach_avst_sink_l2_valid,              //                coupling_prach_avst_sink_l2.valid
		output wire [31:0]  coupling_prach_avst_sink_l2_data,               //                                           .data
		output wire [15:0]  coupling_prach_avst_sink_l2_channel,            //                                           .channel
		output wire         coupling_prach_avst_sink_l2_startofpacket,      //                                           .startofpacket
		output wire         coupling_prach_avst_sink_l2_endofpacket,        //                                           .endofpacket
		input  wire         xran_demapper_cplane_source_valid,              //                xran_demapper_cplane_source.valid
		input  wire         xran_demapper_cplane_source_startofpacket,      //                                           .startofpacket
		input  wire         xran_demapper_cplane_source_endofpacket,        //                                           .endofpacket
		input  wire         pb_avst_sink_valid,                             //                               pb_avst_sink.valid
		input  wire [63:0]  pb_avst_sink_data,                              //                                           .data
		output wire         pb_avst_sink_ready,                             //                                           .ready
		output wire [7:0]   bw_confg_cc1_bw_config_cc1,                     //                               bw_confg_cc1.bw_config_cc1
		output wire [7:0]   bw_confg_cc2_bw_config_cc2,                     //                               bw_confg_cc2.bw_config_cc2
		output wire [55:0]  radio_config_status_radio_config_status,        //                        radio_config_status.radio_config_status
		output wire         short_long_prach_select_data,                   //                    short_long_prach_select.data
		input  wire [15:0]  rx_rtc_id_rx_rtc_id,                            //                                  rx_rtc_id.rx_rtc_id
		input  wire [15:0]  rx_u_axc_id_rx_u_axc_id,                        //                                rx_u_axc_id.rx_u_axc_id
		input  wire [15:0]  rx_rtc_id_dl_rx_rtc_id_dl,                      //                               rx_rtc_id_dl.rx_rtc_id_dl
		input  wire         lphy_ss_ul_sink_l1_valid,                       //                         lphy_ss_ul_sink_l1.valid
		input  wire [31:0]  lphy_ss_ul_sink_l1_data,                        //                                           .data
		input  wire [7:0]   lphy_ss_ul_sink_l1_channel,                     //                                           .channel
		input  wire         lphy_ss_ul_sink_l2_valid,                       //                         lphy_ss_ul_sink_l2.valid
		input  wire [31:0]  lphy_ss_ul_sink_l2_data,                        //                                           .data
		input  wire [7:0]   lphy_ss_ul_sink_l2_channel,                     //                                           .channel
		output wire         rst_soft_n_rst_soft_n,                          //                                 rst_soft_n.rst_soft_n
		output wire [31:0]  coupling_pusch_timing_ref_data,                 //                  coupling_pusch_timing_ref.data
		output wire [31:0]  coupling_prach_timing_ref_data,                 //                  coupling_prach_timing_ref.data
		input  wire [189:0] oran_rx_cplane_concat_data,                     //                      oran_rx_cplane_concat.data
		input  wire [67:0]  oran_rx_uplane_concat_data,                     //                      oran_rx_uplane_concat.data
		output wire         lphy_avst_selctd_cap_intf_valid,                //                  lphy_avst_selctd_cap_intf.valid
		output wire [31:0]  lphy_avst_selctd_cap_intf_data,                 //                                           .data
		output wire [2:0]   lphy_avst_selctd_cap_intf_channel,              //                                           .channel
		output wire         ul_start_pulse_latch_data,                      //                       ul_start_pulse_latch.data
		input  wire         frame_status_counter_reset_data,                //                 frame_status_counter_reset.data
		input  wire [31:0]  lphy_ss_top_interface_sel_data,                 //                  lphy_ss_top_interface_sel.data
		output wire         lphy_ss_top_dl_input_hfn_pulse_data,            //             lphy_ss_top_dl_input_hfn_pulse.data
		output wire         lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1_irq, // lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1.irq
		output wire         lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2_irq, // lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2.irq
		output wire         lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1_irq,  //  lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1.irq
		output wire         lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2_irq,  //  lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2.irq
		output wire         lphy_ss_top_duc_ddc_lpbk_en_data,               //                lphy_ss_top_duc_ddc_lpbk_en.data
		input  wire         reset_csr_reset,                                //                                  reset_csr.reset
		input  wire         reset_dsp_in_reset_n,                           //                               reset_dsp_in.reset_n
		input  wire         reset_xran_dl_reset_n,                          //                              reset_xran_dl.reset_n
		input  wire         reset_xran_ul_reset_n                           //                              reset_xran_ul.reset_n
	);
endmodule

