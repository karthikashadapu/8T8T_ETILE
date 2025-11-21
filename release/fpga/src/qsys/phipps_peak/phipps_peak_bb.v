module phipps_peak (
		input  wire         clock_bridge_csr_in_clk_clk,                                      //                                  clock_bridge_csr_in_clk.clk
		input  wire         clock_bridge_dsp_in_clk_clk,                                      //                                  clock_bridge_dsp_in_clk.clk
		input  wire         clock_bridge_ecpri_rx_in_clk_clk,                                 //                             clock_bridge_ecpri_rx_in_clk.clk
		input  wire         clock_bridge_ecpri_tx_in_clk_clk,                                 //                             clock_bridge_ecpri_tx_in_clk.clk
		input  wire         clock_bridge_eth_in_clk_clk,                                      //                                  clock_bridge_eth_in_clk.clk
		output wire         h2f_bridge_s0_waitrequest,                                        //                                            h2f_bridge_s0.waitrequest
		output wire [31:0]  h2f_bridge_s0_readdata,                                           //                                                         .readdata
		output wire         h2f_bridge_s0_readdatavalid,                                      //                                                         .readdatavalid
		input  wire [0:0]   h2f_bridge_s0_burstcount,                                         //                                                         .burstcount
		input  wire [31:0]  h2f_bridge_s0_writedata,                                          //                                                         .writedata
		input  wire [22:0]  h2f_bridge_s0_address,                                            //                                                         .address
		input  wire         h2f_bridge_s0_write,                                              //                                                         .write
		input  wire         h2f_bridge_s0_read,                                               //                                                         .read
		input  wire [3:0]   h2f_bridge_s0_byteenable,                                         //                                                         .byteenable
		input  wire         h2f_bridge_s0_debugaccess,                                        //                                                         .debugaccess
		output wire         h2f_lw_bridge_s0_waitrequest,                                     //                                         h2f_lw_bridge_s0.waitrequest
		output wire [31:0]  h2f_lw_bridge_s0_readdata,                                        //                                                         .readdata
		output wire         h2f_lw_bridge_s0_readdatavalid,                                   //                                                         .readdatavalid
		input  wire [0:0]   h2f_lw_bridge_s0_burstcount,                                      //                                                         .burstcount
		input  wire [31:0]  h2f_lw_bridge_s0_writedata,                                       //                                                         .writedata
		input  wire [19:0]  h2f_lw_bridge_s0_address,                                         //                                                         .address
		input  wire         h2f_lw_bridge_s0_write,                                           //                                                         .write
		input  wire         h2f_lw_bridge_s0_read,                                            //                                                         .read
		input  wire [3:0]   h2f_lw_bridge_s0_byteenable,                                      //                                                         .byteenable
		input  wire         h2f_lw_bridge_s0_debugaccess,                                     //                                                         .debugaccess
		input  wire         csr_in_reset_reset_n,                                             //                                             csr_in_reset.reset_n
		input  wire         dsp_in_reset_reset_n,                                             //                                             dsp_in_reset.reset_n
		input  wire         eth_in_reset_reset_n,                                             //                                             eth_in_reset.reset_n
		input  wire         rst_ecpri_n_reset_n,                                              //                                              rst_ecpri_n.reset_n
		output wire [55:0]  radio_config_status_dup2_radio_config_status,                     //                                 radio_config_status_dup2.radio_config_status
		output wire         rst_soft_n_dup4_rst_soft_n,                                       //                                          rst_soft_n_dup4.rst_soft_n
		input  wire [31:0]  interface_sel_data,                                               //                                            interface_sel.data
		input  wire         ddc_avst_sink_avst_sink_valid,                                    //                                            ddc_avst_sink.avst_sink_valid
		input  wire [7:0]   ddc_avst_sink_avst_sink_channel,                                  //                                                         .avst_sink_channel
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l1,                                  //                                                         .avst_sink_data_l1
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l2,                                  //                                                         .avst_sink_data_l2
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l3,                                  //                                                         .avst_sink_data_l3
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l4,                                  //                                                         .avst_sink_data_l4
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l5,                                  //                                                         .avst_sink_data_l5
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l6,                                  //                                                         .avst_sink_data_l6
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l7,                                  //                                                         .avst_sink_data_l7
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l8,                                  //                                                         .avst_sink_data_l8
		output wire         duc_avst_source_duc_avst_source_valid,                            //                                          duc_avst_source.duc_avst_source_valid
		output wire [31:0]  duc_avst_source_duc_avst_source_data0,                            //                                                         .duc_avst_source_data0
		output wire [31:0]  duc_avst_source_duc_avst_source_data1,                            //                                                         .duc_avst_source_data1
		output wire [31:0]  duc_avst_source_duc_avst_source_data2,                            //                                                         .duc_avst_source_data2
		output wire [31:0]  duc_avst_source_duc_avst_source_data3,                            //                                                         .duc_avst_source_data3
		output wire [31:0]  duc_avst_source_duc_avst_source_data4,                            //                                                         .duc_avst_source_data4
		output wire [31:0]  duc_avst_source_duc_avst_source_data5,                            //                                                         .duc_avst_source_data5
		output wire [31:0]  duc_avst_source_duc_avst_source_data6,                            //                                                         .duc_avst_source_data6
		output wire [31:0]  duc_avst_source_duc_avst_source_data7,                            //                                                         .duc_avst_source_data7
		output wire [7:0]   duc_avst_source_duc_avst_source_channel,                          //                                                         .duc_avst_source_channel
		input  wire         dxc_ss_top_0_rfp_pulse_data,                                      //                                   dxc_ss_top_0_rfp_pulse.data
		output wire         dxc_avst_selctd_cap_intf_valid,                                   //                                 dxc_avst_selctd_cap_intf.valid
		output wire [31:0]  dxc_avst_selctd_cap_intf_data,                                    //                                                         .data
		output wire [2:0]   dxc_avst_selctd_cap_intf_channel,                                 //                                                         .channel
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_skip_crc,              //                          avst_axist_bridge_0_avst_tx_ptp.i_av_st_tx_skip_crc
		input  wire [1:0]   avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_valid,          //                                                         .i_av_st_tx_ptp_ts_valid
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_ets,           //                                                         .i_av_st_tx_ptp_ins_ets
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_cf,            //                                                         .i_av_st_tx_ptp_ins_cf
		input  wire [95:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_tx_its,            //                                                         .i_av_st_tx_ptp_tx_its
		input  wire [6:0]   avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx,      //                                                         .i_av_st_tx_ptp_asym_p2p_idx
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_sign,         //                                                         .i_av_st_tx_ptp_asym_sign
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym,              //                                                         .i_av_st_tx_ptp_asym
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_p2p,               //                                                         .i_av_st_tx_ptp_p2p
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_format,         //                                                         .i_av_st_tx_ptp_ts_format
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_update_eb,         //                                                         .i_av_st_tx_ptp_update_eb
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_zero_csum,         //                                                         .i_av_st_tx_ptp_zero_csum
		input  wire [15:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_eb_offset,         //                                                         .i_av_st_tx_ptp_eb_offset
		input  wire [15:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_csum_offset,       //                                                         .i_av_st_tx_ptp_csum_offset
		input  wire [15:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_cf_offset,         //                                                         .i_av_st_tx_ptp_cf_offset
		input  wire [15:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_offset,         //                                                         .i_av_st_tx_ptp_ts_offset
		input  wire         avst_axist_bridge_0_axit_tx_if_tready,                            //                           avst_axist_bridge_0_axit_tx_if.tready
		output wire         avst_axist_bridge_0_axit_tx_if_tvalid,                            //                                                         .tvalid
		output wire [63:0]  avst_axist_bridge_0_axit_tx_if_tdata,                             //                                                         .tdata
		output wire         avst_axist_bridge_0_axit_tx_if_tlast,                             //                                                         .tlast
		output wire [7:0]   avst_axist_bridge_0_axit_tx_if_tkeep,                             //                                                         .tkeep
		output wire [1:0]   avst_axist_bridge_0_axit_tx_if_tuser,                             //                                                         .tuser
		output wire [93:0]  avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp,          //                        avst_axist_bridge_0_axist_tx_user.o_axi_st_tx_tuser_ptp
		output wire [327:0] avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp_extended, //                                                         .o_axi_st_tx_tuser_ptp_extended
		output wire [39:0]  avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_data,            //                          avst_axist_bridge_0_avst_rx_ptp.o_av_st_rxstatus_data
		output wire         avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_valid,           //                                                         .o_av_st_rxstatus_valid
		output wire [95:0]  avst_axist_bridge_0_avst_rx_ptp_o_av_st_ptp_rx_its,               //                                                         .o_av_st_ptp_rx_its
		input  wire         avst_axist_bridge_0_axist_rx_if_tvalid,                           //                          avst_axist_bridge_0_axist_rx_if.tvalid
		input  wire [63:0]  avst_axist_bridge_0_axist_rx_if_tdata,                            //                                                         .tdata
		input  wire         avst_axist_bridge_0_axist_rx_if_tlast,                            //                                                         .tlast
		input  wire [7:0]   avst_axist_bridge_0_axist_rx_if_tkeep,                            //                                                         .tkeep
		input  wire [6:0]   avst_axist_bridge_0_axist_rx_if_tuser,                            //                                                         .tuser
		input  wire [4:0]   avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts,          //                        avst_axist_bridge_0_axist_rx_user.i_axi_st_rx_tuser_sts
		input  wire [31:0]  avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts_extended, //                                                         .i_axi_st_rx_tuser_sts_extended
		input  wire [95:0]  avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tdata,      //                                                         .i_axi_st_rx_ingrts0_tdata
		input  wire         avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tvalid,     //                                                         .i_axi_st_rx_ingrts0_tvalid
		input  wire         ecpri_ext_sink_valid,                                             //                                           ecpri_ext_sink.valid
		input  wire [63:0]  ecpri_ext_sink_data,                                              //                                                         .data
		input  wire         ecpri_ext_sink_startofpacket,                                     //                                                         .startofpacket
		input  wire         ecpri_ext_sink_endofpacket,                                       //                                                         .endofpacket
		input  wire [2:0]   ecpri_ext_sink_empty,                                             //                                                         .empty
		input  wire         ecpri_ext_sink_error,                                             //                                                         .error
		output wire         ecpri_ext_sink_ready,                                             //                                                         .ready
		output wire         ecpri_ext_source_valid,                                           //                                         ecpri_ext_source.valid
		output wire [63:0]  ecpri_ext_source_data,                                            //                                                         .data
		output wire         ecpri_ext_source_startofpacket,                                   //                                                         .startofpacket
		output wire         ecpri_ext_source_endofpacket,                                     //                                                         .endofpacket
		output wire [2:0]   ecpri_ext_source_empty,                                           //                                                         .empty
		output wire [5:0]   ecpri_ext_source_error,                                           //                                                         .error
		output wire [21:0]  ptp_tod_concat_out_o_mac_ptp_fp,                                  //                                       ptp_tod_concat_out.o_mac_ptp_fp
		output wire         ptp_tod_concat_out_o_mac_ptp_ts_req,                              //                                                         .o_mac_ptp_ts_req
		input  wire         ptp_tod_concat_out_i_mac_ptp_tx_ets_valid,                        //                                                         .i_mac_ptp_tx_ets_valid
		input  wire [95:0]  ptp_tod_concat_out_i_mac_ptp_tx_ets,                              //                                                         .i_mac_ptp_tx_ets
		input  wire [21:0]  ptp_tod_concat_out_i_mac_ptp_tx_ets_fp,                           //                                                         .i_mac_ptp_tx_ets_fp
		input  wire         ptp_tod_concat_out_i_mac_ptp_rx_its_valid,                        //                                                         .i_mac_ptp_rx_its_valid
		input  wire [95:0]  ptp_tod_concat_out_i_mac_ptp_rx_its,                              //                                                         .i_mac_ptp_rx_its
		input  wire [19:0]  ptp_tod_concat_out_i_ext_ptp_fp,                                  //                                                         .i_ext_ptp_fp
		input  wire         ptp_tod_concat_out_i_ext_ptp_ts_req,                              //                                                         .i_ext_ptp_ts_req
		output wire         ptp_tod_concat_out_o_ext_ptp_tx_ets_valid,                        //                                                         .o_ext_ptp_tx_ets_valid
		output wire [95:0]  ptp_tod_concat_out_o_ext_ptp_tx_ets,                              //                                                         .o_ext_ptp_tx_ets
		output wire [19:0]  ptp_tod_concat_out_o_ext_ptp_tx_ets_fp,                           //                                                         .o_ext_ptp_tx_ets_fp
		output wire [95:0]  ptp_tod_concat_out_o_ext_ptp_rx_its,                              //                                                         .o_ext_ptp_rx_its
		output wire         ptp_tod_concat_out_o_ext_ptp_rx_its_valid,                        //                                                         .o_ext_ptp_rx_its_valid
		input  wire         rx_pcs_ready_rx_pcs_ready,                                        //                                             rx_pcs_ready.rx_pcs_ready
		input  wire         tx_lanes_stable_tx_lanes_stable,                                  //                                          tx_lanes_stable.tx_lanes_stable
		input  wire [95:0]  ecpri_oran_top_0_oran_tx_tod_96b_data_tdata,                      //                    ecpri_oran_top_0_oran_tx_tod_96b_data.tdata
		input  wire         ecpri_oran_top_0_oran_tx_tod_96b_data_tvalid,                     //                                                         .tvalid
		input  wire [95:0]  ecpri_oran_top_0_oran_rx_tod_96b_data_tdata,                      //                    ecpri_oran_top_0_oran_rx_tod_96b_data.tdata
		input  wire         ecpri_oran_top_0_oran_rx_tod_96b_data_tvalid,                     //                                                         .tvalid
		input  wire [95:0]  xran_timestamp_tod_in_data,                                       //                                    xran_timestamp_tod_in.data
		output wire         timeout_cntr_intr_uplane_irq,                                     //                                 timeout_cntr_intr_uplane.irq
		output wire         timeout_cntr_intr_cplane_irq,                                     //                                 timeout_cntr_intr_cplane.irq
		output wire         fifo_full_intr_irq,                                               //                                           fifo_full_intr.irq
		output wire         pwr_mtr_h2f_bridge_s0_waitrequest,                                //                                    pwr_mtr_h2f_bridge_s0.waitrequest
		output wire [31:0]  pwr_mtr_h2f_bridge_s0_readdata,                                   //                                                         .readdata
		output wire         pwr_mtr_h2f_bridge_s0_readdatavalid,                              //                                                         .readdatavalid
		input  wire [0:0]   pwr_mtr_h2f_bridge_s0_burstcount,                                 //                                                         .burstcount
		input  wire [31:0]  pwr_mtr_h2f_bridge_s0_writedata,                                  //                                                         .writedata
		input  wire [16:0]  pwr_mtr_h2f_bridge_s0_address,                                    //                                                         .address
		input  wire         pwr_mtr_h2f_bridge_s0_write,                                      //                                                         .write
		input  wire         pwr_mtr_h2f_bridge_s0_read,                                       //                                                         .read
		input  wire [3:0]   pwr_mtr_h2f_bridge_s0_byteenable,                                 //                                                         .byteenable
		input  wire         pwr_mtr_h2f_bridge_s0_debugaccess,                                //                                                         .debugaccess
		input  wire         lphy_ss_top_0_pb_avst_sink_valid,                                 //                               lphy_ss_top_0_pb_avst_sink.valid
		input  wire [63:0]  lphy_ss_top_0_pb_avst_sink_data,                                  //                                                         .data
		output wire         lphy_ss_top_0_pb_avst_sink_ready,                                 //                                                         .ready
		output wire         lphy_avst_selctd_cap_intf_valid,                                  //                                lphy_avst_selctd_cap_intf.valid
		output wire [31:0]  lphy_avst_selctd_cap_intf_data,                                   //                                                         .data
		output wire [2:0]   lphy_avst_selctd_cap_intf_channel,                                //                                                         .channel
		input  wire         lphy_ss_top_0_frame_status_counter_reset_data,                    //                 lphy_ss_top_0_frame_status_counter_reset.data
		output wire         lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1_irq,     // lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1.irq
		output wire         lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2_irq,     // lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2.irq
		output wire         lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1_irq,      //  lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1.irq
		output wire         lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2_irq,      //  lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2.irq
		output wire         lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en_data                    //                lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en.data
	);
endmodule

