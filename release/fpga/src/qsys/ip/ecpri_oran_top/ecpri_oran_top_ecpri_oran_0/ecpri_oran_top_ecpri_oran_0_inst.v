	ecpri_oran_top_ecpri_oran_0 #(
		.NUM_OF_ANT              (INTEGER_VALUE_FOR_NUM_OF_ANT),
		.NUM_OF_FFT              (INTEGER_VALUE_FOR_NUM_OF_FFT),
		.CPRI_ETH_DATAWIDTH      (INTEGER_VALUE_FOR_CPRI_ETH_DATAWIDTH),
		.XRAN_ETH_DATAWIDTH      (INTEGER_VALUE_FOR_XRAN_ETH_DATAWIDTH),
		.CH_DW                   (INTEGER_VALUE_FOR_CH_DW),
		.NUM_OF_PRACH            (INTEGER_VALUE_FOR_NUM_OF_PRACH),
		.CAPTURE_DMA_WIDTH       (INTEGER_VALUE_FOR_CAPTURE_DMA_WIDTH),
		.IQ_DATAWIDTH            (INTEGER_VALUE_FOR_IQ_DATAWIDTH),
		.CPRI_FRAME_DATAWIDTH    (INTEGER_VALUE_FOR_CPRI_FRAME_DATAWIDTH),
		.ECPRI_CAPTURE_INSTANCES (INTEGER_VALUE_FOR_ECPRI_CAPTURE_INSTANCES),
		.DSP_CAPTURE_INSTANCES   (INTEGER_VALUE_FOR_DSP_CAPTURE_INSTANCES),
		.ANTENNA_DWIDTH          (INTEGER_VALUE_FOR_ANTENNA_DWIDTH)
	) u0 (
		.ecpri_csr_address                   (_connected_to_ecpri_csr_address_),                   //   input,                              width = 10,                     ecpri_csr.address
		.ecpri_csr_write                     (_connected_to_ecpri_csr_write_),                     //   input,                               width = 1,                              .write
		.ecpri_csr_read                      (_connected_to_ecpri_csr_read_),                      //   input,                               width = 1,                              .read
		.ecpri_csr_writedata                 (_connected_to_ecpri_csr_writedata_),                 //   input,                              width = 32,                              .writedata
		.ecpri_csr_readdata                  (_connected_to_ecpri_csr_readdata_),                  //  output,                              width = 32,                              .readdata
		.ecpri_csr_readdatavalid             (_connected_to_ecpri_csr_readdatavalid_),             //  output,                               width = 1,                              .readdatavalid
		.ecpri_csr_waitrequest               (_connected_to_ecpri_csr_waitrequest_),               //  output,                               width = 1,                              .waitrequest
		.oran_csr_address                    (_connected_to_oran_csr_address_),                    //   input,                              width = 10,                      oran_csr.address
		.oran_csr_write                      (_connected_to_oran_csr_write_),                      //   input,                               width = 1,                              .write
		.oran_csr_read                       (_connected_to_oran_csr_read_),                       //   input,                               width = 1,                              .read
		.oran_csr_writedata                  (_connected_to_oran_csr_writedata_),                  //   input,                              width = 32,                              .writedata
		.oran_csr_readdata                   (_connected_to_oran_csr_readdata_),                   //  output,                              width = 32,                              .readdata
		.oran_csr_readdatavalid              (_connected_to_oran_csr_readdatavalid_),              //  output,                               width = 1,                              .readdatavalid
		.oran_csr_waitrequest                (_connected_to_oran_csr_waitrequest_),                //  output,                               width = 1,                              .waitrequest
		.clk_csr                             (_connected_to_clk_csr_),                             //   input,                               width = 1,                     clock_csr.clk
		.clk_dsp                             (_connected_to_clk_dsp_),                             //   input,                               width = 1,                     clock_dsp.clk
		.clk_ecpri_tx                        (_connected_to_clk_ecpri_tx_),                        //   input,                               width = 1,                clock_ecpri_tx.clk
		.clk_ecpri_rx                        (_connected_to_clk_ecpri_rx_),                        //   input,                               width = 1,                clock_ecpri_rx.clk
		.clk_eth_xran_dl                     (_connected_to_clk_eth_xran_dl_),                     //   input,                               width = 1,             clock_eth_xran_dl.clk
		.clk_eth_xran_ul                     (_connected_to_clk_eth_xran_ul_),                     //   input,                               width = 1,             clock_eth_xran_ul.clk
		.rst_dsp_n                           (_connected_to_rst_dsp_n_),                           //   input,                               width = 1,                   reset_dsp_n.reset_n
		.rst_ecpri_n                         (_connected_to_rst_ecpri_n_),                         //   input,                               width = 1,                   rst_ecpri_n.reset_n
		.rst_csr_n                           (_connected_to_rst_csr_n_),                           //   input,                               width = 1,                   reset_csr_n.reset_n
		.rst_eth_xran_n_dl                   (_connected_to_rst_eth_xran_n_dl_),                   //   input,                               width = 1,           reset_eth_xran_dl_n.reset_n
		.rst_eth_xran_n_ul                   (_connected_to_rst_eth_xran_n_ul_),                   //   input,                               width = 1,           reset_eth_xran_ul_n.reset_n
		.coupling_pusch_avst_sink_valid_l1   (_connected_to_coupling_pusch_avst_sink_valid_l1_),   //   input,                               width = 1,        coupling_pusch_sink_l1.valid
		.coupling_pusch_avst_sink_data_l1    (_connected_to_coupling_pusch_avst_sink_data_l1_),    //   input,                              width = 32,                              .data
		.coupling_pusch_avst_sink_channel_l1 (_connected_to_coupling_pusch_avst_sink_channel_l1_), //   input,                              width = 16,                              .channel
		.coupling_pusch_avst_sink_sop_l1     (_connected_to_coupling_pusch_avst_sink_sop_l1_),     //   input,                               width = 1,                              .startofpacket
		.coupling_pusch_avst_sink_eop_l1     (_connected_to_coupling_pusch_avst_sink_eop_l1_),     //   input,                               width = 1,                              .endofpacket
		.coupling_pusch_avst_sink_valid_l2   (_connected_to_coupling_pusch_avst_sink_valid_l2_),   //   input,                               width = 1,        coupling_pusch_sink_l2.valid
		.coupling_pusch_avst_sink_data_l2    (_connected_to_coupling_pusch_avst_sink_data_l2_),    //   input,                              width = 32,                              .data
		.coupling_pusch_avst_sink_channel_l2 (_connected_to_coupling_pusch_avst_sink_channel_l2_), //   input,                              width = 16,                              .channel
		.coupling_pusch_avst_sink_sop_l2     (_connected_to_coupling_pusch_avst_sink_sop_l2_),     //   input,                               width = 1,                              .startofpacket
		.coupling_pusch_avst_sink_eop_l2     (_connected_to_coupling_pusch_avst_sink_eop_l2_),     //   input,                               width = 1,                              .endofpacket
		.coupling_prach_avst_sink_valid_l2   (_connected_to_coupling_prach_avst_sink_valid_l2_),   //   input,                               width = 1,        coupling_prach_sink_l2.valid
		.coupling_prach_avst_sink_data_l2    (_connected_to_coupling_prach_avst_sink_data_l2_),    //   input,                              width = 32,                              .data
		.coupling_prach_avst_sink_channel_l2 (_connected_to_coupling_prach_avst_sink_channel_l2_), //   input,                              width = 16,                              .channel
		.coupling_prach_avst_sink_sop_l2     (_connected_to_coupling_prach_avst_sink_sop_l2_),     //   input,                               width = 1,                              .startofpacket
		.coupling_prach_avst_sink_eop_l2     (_connected_to_coupling_prach_avst_sink_eop_l2_),     //   input,                               width = 1,                              .endofpacket
		.avst_source_ul_bridge_valid         (_connected_to_avst_source_ul_bridge_valid_),         //  output,                               width = 1,         avst_source_ul_bridge.valid
		.avst_source_ul_bridge_data          (_connected_to_avst_source_ul_bridge_data_),          //  output,                              width = 64,                              .data
		.avst_source_ul_bridge_ready         (_connected_to_avst_source_ul_bridge_ready_),         //   input,                               width = 1,                              .ready
		.avst_source_ul_bridge_startofpacket (_connected_to_avst_source_ul_bridge_startofpacket_), //  output,                               width = 1,                              .startofpacket
		.avst_source_ul_bridge_empty         (_connected_to_avst_source_ul_bridge_empty_),         //  output,                               width = 3,                              .empty
		.avst_source_ul_bridge_endofpacket   (_connected_to_avst_source_ul_bridge_endofpacket_),   //  output,                               width = 1,                              .endofpacket
		.avst_sink_dl_valid                  (_connected_to_avst_sink_dl_valid_),                  //   input,                               width = 1,                  avst_sink_dl.valid
		.avst_sink_dl_data                   (_connected_to_avst_sink_dl_data_),                   //   input,                              width = 64,                              .data
		.avst_sink_dl_endofpacket            (_connected_to_avst_sink_dl_endofpacket_),            //   input,                               width = 1,                              .endofpacket
		.avst_sink_dl_ready                  (_connected_to_avst_sink_dl_ready_),                  //  output,                               width = 1,                              .ready
		.avst_sink_dl_startofpacket          (_connected_to_avst_sink_dl_startofpacket_),          //   input,                               width = 1,                              .startofpacket
		.avst_sink_dl_empty                  (_connected_to_avst_sink_dl_empty_),                  //   input,                               width = 3,                              .empty
		.avst_sink_dl_error                  (_connected_to_avst_sink_dl_error_),                  //   input,                               width = 6,                              .error
		.ecpri_ext_sink_valid                (_connected_to_ecpri_ext_sink_valid_),                //   input,                               width = 1,                ecpri_ext_sink.valid
		.ecpri_ext_sink_data                 (_connected_to_ecpri_ext_sink_data_),                 //   input,                              width = 64,                              .data
		.ecpri_ext_sink_sop                  (_connected_to_ecpri_ext_sink_sop_),                  //   input,                               width = 1,                              .startofpacket
		.ecpri_ext_sink_eop                  (_connected_to_ecpri_ext_sink_eop_),                  //   input,                               width = 1,                              .endofpacket
		.ecpri_ext_sink_empty                (_connected_to_ecpri_ext_sink_empty_),                //   input,                               width = 3,                              .empty
		.ecpri_ext_sink_error                (_connected_to_ecpri_ext_sink_error_),                //   input,                               width = 1,                              .error
		.ecpri_ext_sink_ready                (_connected_to_ecpri_ext_sink_ready_),                //  output,                               width = 1,                              .ready
		.ecpri_ext_source_valid              (_connected_to_ecpri_ext_source_valid_),              //  output,                               width = 1,              ecpri_ext_source.valid
		.ecpri_ext_source_data               (_connected_to_ecpri_ext_source_data_),               //  output,                              width = 64,                              .data
		.ecpri_ext_source_sop                (_connected_to_ecpri_ext_source_sop_),                //  output,                               width = 1,                              .startofpacket
		.ecpri_ext_source_eop                (_connected_to_ecpri_ext_source_eop_),                //  output,                               width = 1,                              .endofpacket
		.ecpri_ext_source_empty              (_connected_to_ecpri_ext_source_empty_),              //  output,                               width = 3,                              .empty
		.ecpri_ext_source_error              (_connected_to_ecpri_ext_source_error_),              //  output,                               width = 6,                              .error
		.xran_demapper_source_valid          (_connected_to_xran_demapper_source_valid_),          //  output,                               width = 1,          xran_demapper_source.valid
		.xran_demapper_source_data           (_connected_to_xran_demapper_source_data_),           //  output,  width = (((XRAN_ETH_DATAWIDTH-1)-0)+1),                              .data
		.xran_demapper_source_channel        (_connected_to_xran_demapper_source_channel_),        //  output,                              width = 16,                              .channel
		.xran_demapper_source_startofpacket  (_connected_to_xran_demapper_source_startofpacket_),  //  output,                               width = 1,                              .startofpacket
		.xran_demapper_source_ready          (_connected_to_xran_demapper_source_ready_),          //   input,                               width = 1,                              .ready
		.xran_demapper_source_endofpacket    (_connected_to_xran_demapper_source_endofpacket_),    //  output,                               width = 1,                              .endofpacket
		.xran_demapper_cplane_valid          (_connected_to_xran_demapper_cplane_valid_),          //  output,                               width = 1,   xran_demapper_cplane_source.valid
		.xran_demapper_cplane_startofpacket  (_connected_to_xran_demapper_cplane_startofpacket_),  //  output,                               width = 1,                              .startofpacket
		.xran_demapper_cplane_endofpacket    (_connected_to_xran_demapper_cplane_endofpacket_),    //  output,                               width = 1,                              .endofpacket
		.o_mac_ptp_fp                        (_connected_to_o_mac_ptp_fp_),                        //  output,                              width = 22,                       ptp_tod.o_mac_ptp_fp
		.o_mac_ptp_ts_req                    (_connected_to_o_mac_ptp_ts_req_),                    //  output,                               width = 1,                              .o_mac_ptp_ts_req
		.i_mac_ptp_tx_ets_valid              (_connected_to_i_mac_ptp_tx_ets_valid_),              //   input,                               width = 1,                              .i_mac_ptp_tx_ets_valid
		.i_mac_ptp_tx_ets                    (_connected_to_i_mac_ptp_tx_ets_),                    //   input,                              width = 96,                              .i_mac_ptp_tx_ets
		.i_mac_ptp_tx_ets_fp                 (_connected_to_i_mac_ptp_tx_ets_fp_),                 //   input,                              width = 22,                              .i_mac_ptp_tx_ets_fp
		.i_mac_ptp_rx_its_valid              (_connected_to_i_mac_ptp_rx_its_valid_),              //   input,                               width = 1,                              .i_mac_ptp_rx_its_valid
		.i_mac_ptp_rx_its                    (_connected_to_i_mac_ptp_rx_its_),                    //   input,                              width = 96,                              .i_mac_ptp_rx_its
		.i_ext_ptp_fp                        (_connected_to_i_ext_ptp_fp_),                        //   input,                              width = 20,                              .i_ext_ptp_fp
		.i_ext_ptp_ts_req                    (_connected_to_i_ext_ptp_ts_req_),                    //   input,                               width = 1,                              .i_ext_ptp_ts_req
		.o_ext_ptp_tx_ets_valid              (_connected_to_o_ext_ptp_tx_ets_valid_),              //  output,                               width = 1,                              .o_ext_ptp_tx_ets_valid
		.o_ext_ptp_tx_ets                    (_connected_to_o_ext_ptp_tx_ets_),                    //  output,                              width = 96,                              .o_ext_ptp_tx_ets
		.o_ext_ptp_tx_ets_fp                 (_connected_to_o_ext_ptp_tx_ets_fp_),                 //  output,                              width = 20,                              .o_ext_ptp_tx_ets_fp
		.o_ext_ptp_rx_its                    (_connected_to_o_ext_ptp_rx_its_),                    //  output,                              width = 96,                              .o_ext_ptp_rx_its
		.o_ext_ptp_rx_its_valid              (_connected_to_o_ext_ptp_rx_its_valid_),              //  output,                               width = 1,                              .o_ext_ptp_rx_its_valid
		.rx_pcs_ready                        (_connected_to_rx_pcs_ready_),                        //   input,                               width = 1,                  rx_pcs_ready.rx_pcs_ready
		.tx_lanes_stable                     (_connected_to_tx_lanes_stable_),                     //   input,                               width = 1,               tx_lanes_stable.tx_lanes_stable
		.rst_soft_n                          (_connected_to_rst_soft_n_),                          //   input,                               width = 1,                    rst_soft_n.rst_soft_n
		.oran_tx_time_of_day_96b_data        (_connected_to_oran_tx_time_of_day_96b_data_),        //   input,                              width = 96,          oran_tx_tod_96b_data.tdata
		.oran_tx_time_of_day_96b_valid       (_connected_to_oran_tx_time_of_day_96b_valid_),       //   input,                               width = 1,                              .tvalid
		.oran_rx_time_of_day_96b_data        (_connected_to_oran_rx_time_of_day_96b_data_),        //   input,                              width = 96,          oran_rx_tod_96b_data.tdata
		.oran_rx_time_of_day_96b_valid       (_connected_to_oran_rx_time_of_day_96b_valid_),       //   input,                               width = 1,                              .tvalid
		.bw_config_cc1                       (_connected_to_bw_config_cc1_),                       //   input,                               width = 8,                 bw_config_cc1.bw_config_cc1
		.bw_config_cc2                       (_connected_to_bw_config_cc2_),                       //   input,                               width = 8,                 bw_config_cc2.bw_config_cc2
		.short_long_prach_select             (_connected_to_short_long_prach_select_),             //   input,                               width = 1,       short_long_prach_select.data
		.rx_rtc_id                           (_connected_to_rx_rtc_id_),                           //  output,                              width = 16,                     rx_rtc_id.rx_rtc_id
		.rx_rtc_id_dl                        (_connected_to_rx_rtc_id_dl_),                        //  output,                              width = 16,                  rx_rtc_id_dl.rx_rtc_id_dl
		.rx_u_axc_id                         (_connected_to_rx_u_axc_id_),                         //  output,                              width = 16,                   rx_u_axc_id.rx_u_axc_id
		.ul_rtc_id_intr                      (_connected_to_ul_rtc_id_intr_),                      //  output,                               width = 1,                ul_rtc_id_intr.ul_rtc_id_intr
		.dl_rtc_id_intr                      (_connected_to_dl_rtc_id_intr_),                      //  output,                               width = 1,                dl_rtc_id_intr.dl_rtc_id_intr
		.ul_axc_id_intr                      (_connected_to_ul_axc_id_intr_),                      //  output,                               width = 1,                ul_axc_id_intr.ul_axc_id_intr
		.dl_axc_id_intr                      (_connected_to_dl_axc_id_intr_),                      //  output,                               width = 1,                dl_axc_id_intr.dl_axc_id_intr
		.coupling_pusch_timing_ref           (_connected_to_coupling_pusch_timing_ref_),           //   input,                              width = 32,     coupling_pusch_timing_ref.data
		.coupling_prach_timing_ref           (_connected_to_coupling_prach_timing_ref_),           //   input,                              width = 32,     coupling_prach_timing_ref.data
		.coupling_prach_avst_sink_valid_l1   (_connected_to_coupling_prach_avst_sink_valid_l1_),   //   input,                               width = 1,        coupling_prach_sink_l1.valid
		.coupling_prach_avst_sink_data_l1    (_connected_to_coupling_prach_avst_sink_data_l1_),    //   input,                              width = 32,                              .data
		.coupling_prach_avst_sink_channel_l1 (_connected_to_coupling_prach_avst_sink_channel_l1_), //   input,                              width = 16,                              .channel
		.coupling_prach_avst_sink_sop_l1     (_connected_to_coupling_prach_avst_sink_sop_l1_),     //   input,                               width = 1,                              .startofpacket
		.coupling_prach_avst_sink_eop_l1     (_connected_to_coupling_prach_avst_sink_eop_l1_),     //   input,                               width = 1,                              .endofpacket
		.downlink_eaxc_id_concat             (_connected_to_downlink_eaxc_id_concat_),             //   input,                             width = 128,       downlink_eaxc_id_concat.data
		.oran_rx_uplane_concat               (_connected_to_oran_rx_uplane_concat_),               //  output,                              width = 68,         oran_rx_uplane_concat.data
		.oran_rx_cplane_concat               (_connected_to_oran_rx_cplane_concat_),               //  output,                             width = 190,         oran_rx_cplane_concat.data
		.uplink_eaxc_id_concat               (_connected_to_uplink_eaxc_id_concat_),               //   input,                             width = 256,         uplink_eaxc_id_concat.data
		.ul_start_pulse_latch                (_connected_to_ul_start_pulse_latch_),                //   input,                               width = 1, coupling_ul_start_pulse_latch.data
		.fh_comp_csr_address                 (_connected_to_fh_comp_csr_address_),                 //   input,                               width = 4,                   fh_comp_csr.address
		.fh_comp_csr_write                   (_connected_to_fh_comp_csr_write_),                   //   input,                               width = 1,                              .write
		.fh_comp_csr_read                    (_connected_to_fh_comp_csr_read_),                    //   input,                               width = 1,                              .read
		.fh_comp_csr_writedata               (_connected_to_fh_comp_csr_writedata_),               //   input,                              width = 32,                              .writedata
		.fh_comp_csr_readdata                (_connected_to_fh_comp_csr_readdata_),                //  output,                              width = 32,                              .readdata
		.fh_comp_csr_readdatavalid           (_connected_to_fh_comp_csr_readdatavalid_),           //  output,                               width = 1,                              .readdatavalid
		.fh_comp_csr_waitrequest             (_connected_to_fh_comp_csr_waitrequest_),             //  output,                               width = 1,                              .waitrequest
		.oran_ss_config_csr_address          (_connected_to_oran_ss_config_csr_address_),          //   input,                               width = 8,            oran_ss_config_csr.address
		.oran_ss_config_csr_write            (_connected_to_oran_ss_config_csr_write_),            //   input,                               width = 1,                              .write
		.oran_ss_config_csr_writedata        (_connected_to_oran_ss_config_csr_writedata_),        //   input,                              width = 32,                              .writedata
		.oran_ss_config_csr_readdata         (_connected_to_oran_ss_config_csr_readdata_),         //  output,                              width = 32,                              .readdata
		.oran_ss_config_csr_read             (_connected_to_oran_ss_config_csr_read_),             //   input,                               width = 1,                              .read
		.oran_ss_config_csr_readdata_valid   (_connected_to_oran_ss_config_csr_readdata_valid_),   //  output,                               width = 1,                              .readdatavalid
		.oran_ss_config_csr_waitrequest      (_connected_to_oran_ss_config_csr_waitrequest_),      //  output,                               width = 1,                              .waitrequest
		.tod                                 (_connected_to_tod_),                                 //   input,                              width = 96,                           tod.data
		.radio_config_status                 (_connected_to_radio_config_status_),                 //   input,                              width = 56,           radio_config_status.data
		.dl_input_hfn_pulse                  (_connected_to_dl_input_hfn_pulse_),                  //   input,                               width = 1,            dl_input_hfn_pulse.data
		.xran_timestamp_ram_read             (_connected_to_xran_timestamp_ram_read_),             //   input,                               width = 1,            xran_timestamp_mem.read
		.xran_timestamp_ram_readdata         (_connected_to_xran_timestamp_ram_readdata_),         //  output,                              width = 64,                              .readdata
		.timeout_cntr_intr_uplane            (_connected_to_timeout_cntr_intr_uplane_),            //  output,                               width = 1,      timeout_cntr_intr_uplane.irq
		.timeout_cntr_intr_cplane            (_connected_to_timeout_cntr_intr_cplane_),            //  output,                               width = 1,      timeout_cntr_intr_cplane.irq
		.fifo_full_intr                      (_connected_to_fifo_full_intr_),                      //  output,                               width = 1,                fifo_full_intr.irq
		.tx_ptp_fp_bridge                    (_connected_to_tx_ptp_fp_bridge_),                    //  output,                              width = 32,                 tx_ptp_req_fp.fingerprint
		.tx_ptp_ts_req_bridge                (_connected_to_tx_ptp_ts_req_bridge_)                 //  output,                               width = 1,                              .ts_request
	);

