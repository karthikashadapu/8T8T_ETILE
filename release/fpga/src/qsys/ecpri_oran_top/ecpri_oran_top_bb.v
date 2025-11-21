module ecpri_oran_top (
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_skip_crc,              //   avst_axist_bridge_0_avst_tx_ptp.i_av_st_tx_skip_crc
		input  wire [1:0]   avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_valid,          //                                  .i_av_st_tx_ptp_ts_valid
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_ets,           //                                  .i_av_st_tx_ptp_ins_ets
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_cf,            //                                  .i_av_st_tx_ptp_ins_cf
		input  wire [95:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_tx_its,            //                                  .i_av_st_tx_ptp_tx_its
		input  wire [6:0]   avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx,      //                                  .i_av_st_tx_ptp_asym_p2p_idx
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_sign,         //                                  .i_av_st_tx_ptp_asym_sign
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym,              //                                  .i_av_st_tx_ptp_asym
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_p2p,               //                                  .i_av_st_tx_ptp_p2p
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_format,         //                                  .i_av_st_tx_ptp_ts_format
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_update_eb,         //                                  .i_av_st_tx_ptp_update_eb
		input  wire         avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_zero_csum,         //                                  .i_av_st_tx_ptp_zero_csum
		input  wire [15:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_eb_offset,         //                                  .i_av_st_tx_ptp_eb_offset
		input  wire [15:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_csum_offset,       //                                  .i_av_st_tx_ptp_csum_offset
		input  wire [15:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_cf_offset,         //                                  .i_av_st_tx_ptp_cf_offset
		input  wire [15:0]  avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_offset,         //                                  .i_av_st_tx_ptp_ts_offset
		input  wire         avst_axist_bridge_0_axit_tx_if_tready,                            //    avst_axist_bridge_0_axit_tx_if.tready
		output wire         avst_axist_bridge_0_axit_tx_if_tvalid,                            //                                  .tvalid
		output wire [63:0]  avst_axist_bridge_0_axit_tx_if_tdata,                             //                                  .tdata
		output wire         avst_axist_bridge_0_axit_tx_if_tlast,                             //                                  .tlast
		output wire [7:0]   avst_axist_bridge_0_axit_tx_if_tkeep,                             //                                  .tkeep
		output wire [1:0]   avst_axist_bridge_0_axit_tx_if_tuser,                             //                                  .tuser
		output wire [93:0]  avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp,          // avst_axist_bridge_0_axist_tx_user.o_axi_st_tx_tuser_ptp
		output wire [327:0] avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp_extended, //                                  .o_axi_st_tx_tuser_ptp_extended
		output wire [39:0]  avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_data,            //   avst_axist_bridge_0_avst_rx_ptp.o_av_st_rxstatus_data
		output wire         avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_valid,           //                                  .o_av_st_rxstatus_valid
		output wire [95:0]  avst_axist_bridge_0_avst_rx_ptp_o_av_st_ptp_rx_its,               //                                  .o_av_st_ptp_rx_its
		input  wire         avst_axist_bridge_0_axist_rx_if_tvalid,                           //   avst_axist_bridge_0_axist_rx_if.tvalid
		input  wire [63:0]  avst_axist_bridge_0_axist_rx_if_tdata,                            //                                  .tdata
		input  wire         avst_axist_bridge_0_axist_rx_if_tlast,                            //                                  .tlast
		input  wire [7:0]   avst_axist_bridge_0_axist_rx_if_tkeep,                            //                                  .tkeep
		input  wire [6:0]   avst_axist_bridge_0_axist_rx_if_tuser,                            //                                  .tuser
		input  wire [4:0]   avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts,          // avst_axist_bridge_0_axist_rx_user.i_axi_st_rx_tuser_sts
		input  wire [31:0]  avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts_extended, //                                  .i_axi_st_rx_tuser_sts_extended
		input  wire [95:0]  avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tdata,      //                                  .i_axi_st_rx_ingrts0_tdata
		input  wire         avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tvalid,     //                                  .i_axi_st_rx_ingrts0_tvalid
		input  wire         csr_in_clk_clk,                                                   //                        csr_in_clk.clk
		input  wire         dsp_in_clk_clk,                                                   //                        dsp_in_clk.clk
		input  wire         ecpri_rx_in_clk_clk,                                              //                   ecpri_rx_in_clk.clk
		input  wire         ecpri_tx_in_clk_clk,                                              //                   ecpri_tx_in_clk.clk
		input  wire         eth_xran_dl_in_clk_clk,                                           //                eth_xran_dl_in_clk.clk
		input  wire         eth_xran_ul_in_clk_clk,                                           //                eth_xran_ul_in_clk.clk
		input  wire         rst_ecpri_n_reset_n,                                              //                       rst_ecpri_n.reset_n
		input  wire         coupling_pusch_sink_l1_valid,                                     //            coupling_pusch_sink_l1.valid
		input  wire [31:0]  coupling_pusch_sink_l1_data,                                      //                                  .data
		input  wire [15:0]  coupling_pusch_sink_l1_channel,                                   //                                  .channel
		input  wire         coupling_pusch_sink_l1_startofpacket,                             //                                  .startofpacket
		input  wire         coupling_pusch_sink_l1_endofpacket,                               //                                  .endofpacket
		input  wire         coupling_pusch_sink_l2_valid,                                     //            coupling_pusch_sink_l2.valid
		input  wire [31:0]  coupling_pusch_sink_l2_data,                                      //                                  .data
		input  wire [15:0]  coupling_pusch_sink_l2_channel,                                   //                                  .channel
		input  wire         coupling_pusch_sink_l2_startofpacket,                             //                                  .startofpacket
		input  wire         coupling_pusch_sink_l2_endofpacket,                               //                                  .endofpacket
		input  wire         coupling_prach_sink_l2_valid,                                     //            coupling_prach_sink_l2.valid
		input  wire [31:0]  coupling_prach_sink_l2_data,                                      //                                  .data
		input  wire [15:0]  coupling_prach_sink_l2_channel,                                   //                                  .channel
		input  wire         coupling_prach_sink_l2_startofpacket,                             //                                  .startofpacket
		input  wire         coupling_prach_sink_l2_endofpacket,                               //                                  .endofpacket
		input  wire         ecpri_ext_sink_valid,                                             //                    ecpri_ext_sink.valid
		input  wire [63:0]  ecpri_ext_sink_data,                                              //                                  .data
		input  wire         ecpri_ext_sink_startofpacket,                                     //                                  .startofpacket
		input  wire         ecpri_ext_sink_endofpacket,                                       //                                  .endofpacket
		input  wire [2:0]   ecpri_ext_sink_empty,                                             //                                  .empty
		input  wire         ecpri_ext_sink_error,                                             //                                  .error
		output wire         ecpri_ext_sink_ready,                                             //                                  .ready
		output wire         ecpri_ext_source_valid,                                           //                  ecpri_ext_source.valid
		output wire [63:0]  ecpri_ext_source_data,                                            //                                  .data
		output wire         ecpri_ext_source_startofpacket,                                   //                                  .startofpacket
		output wire         ecpri_ext_source_endofpacket,                                     //                                  .endofpacket
		output wire [2:0]   ecpri_ext_source_empty,                                           //                                  .empty
		output wire [5:0]   ecpri_ext_source_error,                                           //                                  .error
		output wire         xran_demapper_source_valid,                                       //              xran_demapper_source.valid
		output wire [127:0] xran_demapper_source_data,                                        //                                  .data
		output wire [15:0]  xran_demapper_source_channel,                                     //                                  .channel
		output wire         xran_demapper_source_startofpacket,                               //                                  .startofpacket
		input  wire         xran_demapper_source_ready,                                       //                                  .ready
		output wire         xran_demapper_source_endofpacket,                                 //                                  .endofpacket
		output wire         xran_demapper_cplane_source_valid,                                //       xran_demapper_cplane_source.valid
		output wire         xran_demapper_cplane_source_startofpacket,                        //                                  .startofpacket
		output wire         xran_demapper_cplane_source_endofpacket,                          //                                  .endofpacket
		output wire [21:0]  ptp_tod_o_mac_ptp_fp,                                             //                           ptp_tod.o_mac_ptp_fp
		output wire         ptp_tod_o_mac_ptp_ts_req,                                         //                                  .o_mac_ptp_ts_req
		input  wire         ptp_tod_i_mac_ptp_tx_ets_valid,                                   //                                  .i_mac_ptp_tx_ets_valid
		input  wire [95:0]  ptp_tod_i_mac_ptp_tx_ets,                                         //                                  .i_mac_ptp_tx_ets
		input  wire [21:0]  ptp_tod_i_mac_ptp_tx_ets_fp,                                      //                                  .i_mac_ptp_tx_ets_fp
		input  wire         ptp_tod_i_mac_ptp_rx_its_valid,                                   //                                  .i_mac_ptp_rx_its_valid
		input  wire [95:0]  ptp_tod_i_mac_ptp_rx_its,                                         //                                  .i_mac_ptp_rx_its
		input  wire [19:0]  ptp_tod_i_ext_ptp_fp,                                             //                                  .i_ext_ptp_fp
		input  wire         ptp_tod_i_ext_ptp_ts_req,                                         //                                  .i_ext_ptp_ts_req
		output wire         ptp_tod_o_ext_ptp_tx_ets_valid,                                   //                                  .o_ext_ptp_tx_ets_valid
		output wire [95:0]  ptp_tod_o_ext_ptp_tx_ets,                                         //                                  .o_ext_ptp_tx_ets
		output wire [19:0]  ptp_tod_o_ext_ptp_tx_ets_fp,                                      //                                  .o_ext_ptp_tx_ets_fp
		output wire [95:0]  ptp_tod_o_ext_ptp_rx_its,                                         //                                  .o_ext_ptp_rx_its
		output wire         ptp_tod_o_ext_ptp_rx_its_valid,                                   //                                  .o_ext_ptp_rx_its_valid
		input  wire         rx_pcs_ready_rx_pcs_ready,                                        //                      rx_pcs_ready.rx_pcs_ready
		input  wire         tx_lanes_stable_tx_lanes_stable,                                  //                   tx_lanes_stable.tx_lanes_stable
		input  wire         rst_soft_n_rst_soft_n,                                            //                        rst_soft_n.rst_soft_n
		input  wire [95:0]  oran_tx_tod_96b_data_tdata,                                       //              oran_tx_tod_96b_data.tdata
		input  wire         oran_tx_tod_96b_data_tvalid,                                      //                                  .tvalid
		input  wire [95:0]  oran_rx_tod_96b_data_tdata,                                       //              oran_rx_tod_96b_data.tdata
		input  wire         oran_rx_tod_96b_data_tvalid,                                      //                                  .tvalid
		input  wire [7:0]   bw_config_cc1_bw_config_cc1,                                      //                     bw_config_cc1.bw_config_cc1
		input  wire [7:0]   bw_config_cc2_bw_config_cc2,                                      //                     bw_config_cc2.bw_config_cc2
		input  wire         short_long_prach_select_data,                                     //           short_long_prach_select.data
		output wire [15:0]  rx_rtc_id_rx_rtc_id,                                              //                         rx_rtc_id.rx_rtc_id
		output wire [15:0]  rx_rtc_id_dl_rx_rtc_id_dl,                                        //                      rx_rtc_id_dl.rx_rtc_id_dl
		output wire [15:0]  rx_u_axc_id_rx_u_axc_id,                                          //                       rx_u_axc_id.rx_u_axc_id
		output wire         ul_rtc_id_intr_ul_rtc_id_intr,                                    //                    ul_rtc_id_intr.ul_rtc_id_intr
		output wire         dl_rtc_id_intr_dl_rtc_id_intr,                                    //                    dl_rtc_id_intr.dl_rtc_id_intr
		output wire         ul_axc_id_intr_ul_axc_id_intr,                                    //                    ul_axc_id_intr.ul_axc_id_intr
		output wire         dl_axc_id_intr_dl_axc_id_intr,                                    //                    dl_axc_id_intr.dl_axc_id_intr
		input  wire [31:0]  coupling_pusch_timing_ref_data,                                   //         coupling_pusch_timing_ref.data
		input  wire [31:0]  coupling_prach_timing_ref_data,                                   //         coupling_prach_timing_ref.data
		input  wire         coupling_prach_sink_l1_valid,                                     //            coupling_prach_sink_l1.valid
		input  wire [31:0]  coupling_prach_sink_l1_data,                                      //                                  .data
		input  wire [15:0]  coupling_prach_sink_l1_channel,                                   //                                  .channel
		input  wire         coupling_prach_sink_l1_startofpacket,                             //                                  .startofpacket
		input  wire         coupling_prach_sink_l1_endofpacket,                               //                                  .endofpacket
		input  wire [127:0] downlink_eaxc_id_concat_data,                                     //           downlink_eaxc_id_concat.data
		output wire [67:0]  oran_rx_uplane_concat_data,                                       //             oran_rx_uplane_concat.data
		output wire [189:0] oran_rx_cplane_concat_data,                                       //             oran_rx_cplane_concat.data
		input  wire [255:0] uplink_eaxc_id_concat_data,                                       //             uplink_eaxc_id_concat.data
		input  wire         coupling_ul_start_pulse_latch_data,                               //     coupling_ul_start_pulse_latch.data
		input  wire [95:0]  tod_data,                                                         //                               tod.data
		input  wire [55:0]  radio_config_status_data,                                         //               radio_config_status.data
		input  wire         dl_input_hfn_pulse_data,                                          //                dl_input_hfn_pulse.data
		input  wire         xran_timestamp_mem_read,                                          //                xran_timestamp_mem.read
		output wire [63:0]  xran_timestamp_mem_readdata,                                      //                                  .readdata
		output wire         timeout_cntr_intr_uplane_irq,                                     //          timeout_cntr_intr_uplane.irq
		output wire         timeout_cntr_intr_cplane_irq,                                     //          timeout_cntr_intr_cplane.irq
		output wire         fifo_full_intr_irq,                                               //                    fifo_full_intr.irq
		output wire         h2f_lw_bridge_s0_waitrequest,                                     //                  h2f_lw_bridge_s0.waitrequest
		output wire [31:0]  h2f_lw_bridge_s0_readdata,                                        //                                  .readdata
		output wire         h2f_lw_bridge_s0_readdatavalid,                                   //                                  .readdatavalid
		input  wire [0:0]   h2f_lw_bridge_s0_burstcount,                                      //                                  .burstcount
		input  wire [31:0]  h2f_lw_bridge_s0_writedata,                                       //                                  .writedata
		input  wire [13:0]  h2f_lw_bridge_s0_address,                                         //                                  .address
		input  wire         h2f_lw_bridge_s0_write,                                           //                                  .write
		input  wire         h2f_lw_bridge_s0_read,                                            //                                  .read
		input  wire [3:0]   h2f_lw_bridge_s0_byteenable,                                      //                                  .byteenable
		input  wire         h2f_lw_bridge_s0_debugaccess,                                     //                                  .debugaccess
		input  wire         csr_in_reset_reset,                                               //                      csr_in_reset.reset
		input  wire         dsp_in_reset_reset_n,                                             //                      dsp_in_reset.reset_n
		input  wire         eth_xran_dl_in_reset_reset_n,                                     //              eth_xran_dl_in_reset.reset_n
		input  wire         eth_xran_ul_in_reset_reset_n                                      //              eth_xran_ul_in_reset.reset_n
	);
endmodule

