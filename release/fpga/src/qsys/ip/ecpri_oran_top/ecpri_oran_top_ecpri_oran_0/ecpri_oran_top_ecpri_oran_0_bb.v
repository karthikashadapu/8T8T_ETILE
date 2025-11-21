module ecpri_oran_top_ecpri_oran_0 #(
		parameter NUM_OF_ANT              = 8,
		parameter NUM_OF_FFT              = 2,
		parameter CPRI_ETH_DATAWIDTH      = 128,
		parameter XRAN_ETH_DATAWIDTH      = 128,
		parameter CH_DW                   = 8,
		parameter NUM_OF_PRACH            = 2,
		parameter CAPTURE_DMA_WIDTH       = 512,
		parameter IQ_DATAWIDTH            = 32,
		parameter CPRI_FRAME_DATAWIDTH    = 64,
		parameter ECPRI_CAPTURE_INSTANCES = 2,
		parameter DSP_CAPTURE_INSTANCES   = 30,
		parameter ANTENNA_DWIDTH          = 0
	) (
		input  wire [9:0]                                ecpri_csr_address,                   //                     ecpri_csr.address
		input  wire                                      ecpri_csr_write,                     //                              .write
		input  wire                                      ecpri_csr_read,                      //                              .read
		input  wire [31:0]                               ecpri_csr_writedata,                 //                              .writedata
		output wire [31:0]                               ecpri_csr_readdata,                  //                              .readdata
		output wire                                      ecpri_csr_readdatavalid,             //                              .readdatavalid
		output wire                                      ecpri_csr_waitrequest,               //                              .waitrequest
		input  wire [9:0]                                oran_csr_address,                    //                      oran_csr.address
		input  wire                                      oran_csr_write,                      //                              .write
		input  wire                                      oran_csr_read,                       //                              .read
		input  wire [31:0]                               oran_csr_writedata,                  //                              .writedata
		output wire [31:0]                               oran_csr_readdata,                   //                              .readdata
		output wire                                      oran_csr_readdatavalid,              //                              .readdatavalid
		output wire                                      oran_csr_waitrequest,                //                              .waitrequest
		input  wire                                      clk_csr,                             //                     clock_csr.clk
		input  wire                                      clk_dsp,                             //                     clock_dsp.clk
		input  wire                                      clk_ecpri_tx,                        //                clock_ecpri_tx.clk
		input  wire                                      clk_ecpri_rx,                        //                clock_ecpri_rx.clk
		input  wire                                      clk_eth_xran_dl,                     //             clock_eth_xran_dl.clk
		input  wire                                      clk_eth_xran_ul,                     //             clock_eth_xran_ul.clk
		input  wire                                      rst_dsp_n,                           //                   reset_dsp_n.reset_n
		input  wire                                      rst_ecpri_n,                         //                   rst_ecpri_n.reset_n
		input  wire                                      rst_csr_n,                           //                   reset_csr_n.reset_n
		input  wire                                      rst_eth_xran_n_dl,                   //           reset_eth_xran_dl_n.reset_n
		input  wire                                      rst_eth_xran_n_ul,                   //           reset_eth_xran_ul_n.reset_n
		input  wire                                      coupling_pusch_avst_sink_valid_l1,   //        coupling_pusch_sink_l1.valid
		input  wire [31:0]                               coupling_pusch_avst_sink_data_l1,    //                              .data
		input  wire [15:0]                               coupling_pusch_avst_sink_channel_l1, //                              .channel
		input  wire                                      coupling_pusch_avst_sink_sop_l1,     //                              .startofpacket
		input  wire                                      coupling_pusch_avst_sink_eop_l1,     //                              .endofpacket
		input  wire                                      coupling_pusch_avst_sink_valid_l2,   //        coupling_pusch_sink_l2.valid
		input  wire [31:0]                               coupling_pusch_avst_sink_data_l2,    //                              .data
		input  wire [15:0]                               coupling_pusch_avst_sink_channel_l2, //                              .channel
		input  wire                                      coupling_pusch_avst_sink_sop_l2,     //                              .startofpacket
		input  wire                                      coupling_pusch_avst_sink_eop_l2,     //                              .endofpacket
		input  wire                                      coupling_prach_avst_sink_valid_l2,   //        coupling_prach_sink_l2.valid
		input  wire [31:0]                               coupling_prach_avst_sink_data_l2,    //                              .data
		input  wire [15:0]                               coupling_prach_avst_sink_channel_l2, //                              .channel
		input  wire                                      coupling_prach_avst_sink_sop_l2,     //                              .startofpacket
		input  wire                                      coupling_prach_avst_sink_eop_l2,     //                              .endofpacket
		output wire                                      avst_source_ul_bridge_valid,         //         avst_source_ul_bridge.valid
		output wire [63:0]                               avst_source_ul_bridge_data,          //                              .data
		input  wire                                      avst_source_ul_bridge_ready,         //                              .ready
		output wire                                      avst_source_ul_bridge_startofpacket, //                              .startofpacket
		output wire [2:0]                                avst_source_ul_bridge_empty,         //                              .empty
		output wire                                      avst_source_ul_bridge_endofpacket,   //                              .endofpacket
		input  wire                                      avst_sink_dl_valid,                  //                  avst_sink_dl.valid
		input  wire [63:0]                               avst_sink_dl_data,                   //                              .data
		input  wire                                      avst_sink_dl_endofpacket,            //                              .endofpacket
		output wire                                      avst_sink_dl_ready,                  //                              .ready
		input  wire                                      avst_sink_dl_startofpacket,          //                              .startofpacket
		input  wire [2:0]                                avst_sink_dl_empty,                  //                              .empty
		input  wire [5:0]                                avst_sink_dl_error,                  //                              .error
		input  wire                                      ecpri_ext_sink_valid,                //                ecpri_ext_sink.valid
		input  wire [63:0]                               ecpri_ext_sink_data,                 //                              .data
		input  wire                                      ecpri_ext_sink_sop,                  //                              .startofpacket
		input  wire                                      ecpri_ext_sink_eop,                  //                              .endofpacket
		input  wire [2:0]                                ecpri_ext_sink_empty,                //                              .empty
		input  wire                                      ecpri_ext_sink_error,                //                              .error
		output wire                                      ecpri_ext_sink_ready,                //                              .ready
		output wire                                      ecpri_ext_source_valid,              //              ecpri_ext_source.valid
		output wire [63:0]                               ecpri_ext_source_data,               //                              .data
		output wire                                      ecpri_ext_source_sop,                //                              .startofpacket
		output wire                                      ecpri_ext_source_eop,                //                              .endofpacket
		output wire [2:0]                                ecpri_ext_source_empty,              //                              .empty
		output wire [5:0]                                ecpri_ext_source_error,              //                              .error
		output wire                                      xran_demapper_source_valid,          //          xran_demapper_source.valid
		output wire [(((XRAN_ETH_DATAWIDTH-1)-0)+1)-1:0] xran_demapper_source_data,           //                              .data
		output wire [15:0]                               xran_demapper_source_channel,        //                              .channel
		output wire                                      xran_demapper_source_startofpacket,  //                              .startofpacket
		input  wire                                      xran_demapper_source_ready,          //                              .ready
		output wire                                      xran_demapper_source_endofpacket,    //                              .endofpacket
		output wire                                      xran_demapper_cplane_valid,          //   xran_demapper_cplane_source.valid
		output wire                                      xran_demapper_cplane_startofpacket,  //                              .startofpacket
		output wire                                      xran_demapper_cplane_endofpacket,    //                              .endofpacket
		output wire [21:0]                               o_mac_ptp_fp,                        //                       ptp_tod.o_mac_ptp_fp
		output wire                                      o_mac_ptp_ts_req,                    //                              .o_mac_ptp_ts_req
		input  wire                                      i_mac_ptp_tx_ets_valid,              //                              .i_mac_ptp_tx_ets_valid
		input  wire [95:0]                               i_mac_ptp_tx_ets,                    //                              .i_mac_ptp_tx_ets
		input  wire [21:0]                               i_mac_ptp_tx_ets_fp,                 //                              .i_mac_ptp_tx_ets_fp
		input  wire                                      i_mac_ptp_rx_its_valid,              //                              .i_mac_ptp_rx_its_valid
		input  wire [95:0]                               i_mac_ptp_rx_its,                    //                              .i_mac_ptp_rx_its
		input  wire [19:0]                               i_ext_ptp_fp,                        //                              .i_ext_ptp_fp
		input  wire                                      i_ext_ptp_ts_req,                    //                              .i_ext_ptp_ts_req
		output wire                                      o_ext_ptp_tx_ets_valid,              //                              .o_ext_ptp_tx_ets_valid
		output wire [95:0]                               o_ext_ptp_tx_ets,                    //                              .o_ext_ptp_tx_ets
		output wire [19:0]                               o_ext_ptp_tx_ets_fp,                 //                              .o_ext_ptp_tx_ets_fp
		output wire [95:0]                               o_ext_ptp_rx_its,                    //                              .o_ext_ptp_rx_its
		output wire                                      o_ext_ptp_rx_its_valid,              //                              .o_ext_ptp_rx_its_valid
		input  wire                                      rx_pcs_ready,                        //                  rx_pcs_ready.rx_pcs_ready
		input  wire                                      tx_lanes_stable,                     //               tx_lanes_stable.tx_lanes_stable
		input  wire                                      rst_soft_n,                          //                    rst_soft_n.rst_soft_n
		input  wire [95:0]                               oran_tx_time_of_day_96b_data,        //          oran_tx_tod_96b_data.tdata
		input  wire                                      oran_tx_time_of_day_96b_valid,       //                              .tvalid
		input  wire [95:0]                               oran_rx_time_of_day_96b_data,        //          oran_rx_tod_96b_data.tdata
		input  wire                                      oran_rx_time_of_day_96b_valid,       //                              .tvalid
		input  wire [7:0]                                bw_config_cc1,                       //                 bw_config_cc1.bw_config_cc1
		input  wire [7:0]                                bw_config_cc2,                       //                 bw_config_cc2.bw_config_cc2
		input  wire                                      short_long_prach_select,             //       short_long_prach_select.data
		output wire [15:0]                               rx_rtc_id,                           //                     rx_rtc_id.rx_rtc_id
		output wire [15:0]                               rx_rtc_id_dl,                        //                  rx_rtc_id_dl.rx_rtc_id_dl
		output wire [15:0]                               rx_u_axc_id,                         //                   rx_u_axc_id.rx_u_axc_id
		output wire                                      ul_rtc_id_intr,                      //                ul_rtc_id_intr.ul_rtc_id_intr
		output wire                                      dl_rtc_id_intr,                      //                dl_rtc_id_intr.dl_rtc_id_intr
		output wire                                      ul_axc_id_intr,                      //                ul_axc_id_intr.ul_axc_id_intr
		output wire                                      dl_axc_id_intr,                      //                dl_axc_id_intr.dl_axc_id_intr
		input  wire [31:0]                               coupling_pusch_timing_ref,           //     coupling_pusch_timing_ref.data
		input  wire [31:0]                               coupling_prach_timing_ref,           //     coupling_prach_timing_ref.data
		input  wire                                      coupling_prach_avst_sink_valid_l1,   //        coupling_prach_sink_l1.valid
		input  wire [31:0]                               coupling_prach_avst_sink_data_l1,    //                              .data
		input  wire [15:0]                               coupling_prach_avst_sink_channel_l1, //                              .channel
		input  wire                                      coupling_prach_avst_sink_sop_l1,     //                              .startofpacket
		input  wire                                      coupling_prach_avst_sink_eop_l1,     //                              .endofpacket
		input  wire [127:0]                              downlink_eaxc_id_concat,             //       downlink_eaxc_id_concat.data
		output wire [67:0]                               oran_rx_uplane_concat,               //         oran_rx_uplane_concat.data
		output wire [189:0]                              oran_rx_cplane_concat,               //         oran_rx_cplane_concat.data
		input  wire [255:0]                              uplink_eaxc_id_concat,               //         uplink_eaxc_id_concat.data
		input  wire                                      ul_start_pulse_latch,                // coupling_ul_start_pulse_latch.data
		input  wire [3:0]                                fh_comp_csr_address,                 //                   fh_comp_csr.address
		input  wire                                      fh_comp_csr_write,                   //                              .write
		input  wire                                      fh_comp_csr_read,                    //                              .read
		input  wire [31:0]                               fh_comp_csr_writedata,               //                              .writedata
		output wire [31:0]                               fh_comp_csr_readdata,                //                              .readdata
		output wire                                      fh_comp_csr_readdatavalid,           //                              .readdatavalid
		output wire                                      fh_comp_csr_waitrequest,             //                              .waitrequest
		input  wire [7:0]                                oran_ss_config_csr_address,          //            oran_ss_config_csr.address
		input  wire                                      oran_ss_config_csr_write,            //                              .write
		input  wire [31:0]                               oran_ss_config_csr_writedata,        //                              .writedata
		output wire [31:0]                               oran_ss_config_csr_readdata,         //                              .readdata
		input  wire                                      oran_ss_config_csr_read,             //                              .read
		output wire                                      oran_ss_config_csr_readdata_valid,   //                              .readdatavalid
		output wire                                      oran_ss_config_csr_waitrequest,      //                              .waitrequest
		input  wire [95:0]                               tod,                                 //                           tod.data
		input  wire [55:0]                               radio_config_status,                 //           radio_config_status.data
		input  wire                                      dl_input_hfn_pulse,                  //            dl_input_hfn_pulse.data
		input  wire                                      xran_timestamp_ram_read,             //            xran_timestamp_mem.read
		output wire [63:0]                               xran_timestamp_ram_readdata,         //                              .readdata
		output wire                                      timeout_cntr_intr_uplane,            //      timeout_cntr_intr_uplane.irq
		output wire                                      timeout_cntr_intr_cplane,            //      timeout_cntr_intr_cplane.irq
		output wire                                      fifo_full_intr,                      //                fifo_full_intr.irq
		output wire [31:0]                               tx_ptp_fp_bridge,                    //                 tx_ptp_req_fp.fingerprint
		output wire                                      tx_ptp_ts_req_bridge                 //                              .ts_request
	);
endmodule

