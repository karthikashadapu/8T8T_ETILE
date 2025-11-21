module lphy_ss_lphy_ss_top #(
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
		parameter LPHY_DSP_CAPTURE_INST   = 8
	) (
		input  wire [31:0]                               ifft1_busIn_writedata,                    //                    ifft1_busin.writedata
		input  wire [13:0]                               ifft1_busIn_address,                      //                               .address
		input  wire                                      ifft1_busIn_write,                        //                               .write
		input  wire                                      ifft1_busIn_read,                         //                               .read
		output wire                                      ifft1_busOut_readdatavalid,               //                               .readdatavalid
		output wire [31:0]                               ifft1_busOut_readdata,                    //                               .readdata
		output wire                                      ifft1_busOut_waitrequest,                 //                               .waitrequest
		input  wire [31:0]                               ifft2_busIn_writedata,                    //                    ifft2_busin.writedata
		input  wire [13:0]                               ifft2_busIn_address,                      //                               .address
		input  wire                                      ifft2_busIn_write,                        //                               .write
		input  wire                                      ifft2_busIn_read,                         //                               .read
		output wire                                      ifft2_busOut_readdatavalid,               //                               .readdatavalid
		output wire [31:0]                               ifft2_busOut_readdata,                    //                               .readdata
		output wire                                      ifft2_busOut_waitrequest,                 //                               .waitrequest
		input  wire [31:0]                               fft1_busIn_writedata,                     //                     fft1_busin.writedata
		input  wire [13:0]                               fft1_busIn_address,                       //                               .address
		input  wire                                      fft1_busIn_write,                         //                               .write
		input  wire                                      fft1_busIn_read,                          //                               .read
		output wire                                      fft1_busOut_readdatavalid,                //                               .readdatavalid
		output wire [31:0]                               fft1_busOut_readdata,                     //                               .readdata
		output wire                                      fft1_busOut_waitrequest,                  //                               .waitrequest
		input  wire [31:0]                               fft2_busIn_writedata,                     //                     fft2_busin.writedata
		input  wire [13:0]                               fft2_busIn_address,                       //                               .address
		input  wire                                      fft2_busIn_write,                         //                               .write
		input  wire                                      fft2_busIn_read,                          //                               .read
		output wire                                      fft2_busOut_readdatavalid,                //                               .readdatavalid
		output wire [31:0]                               fft2_busOut_readdata,                     //                               .readdata
		output wire                                      fft2_busOut_waitrequest,                  //                               .waitrequest
		input  wire [3:0]                                pb_ddr_csr_address,                       //                     pb_ddr_csr.address
		input  wire                                      pb_ddr_csr_write,                         //                               .write
		input  wire [31:0]                               pb_ddr_csr_writedata,                     //                               .writedata
		output wire [31:0]                               pb_ddr_csr_readdata,                      //                               .readdata
		input  wire [16:0]                               pb_mm_bridge_address,                     //                   pb_mm_bridge.address
		input  wire                                      pb_mm_bridge_chipselect,                  //                               .chipselect
		input  wire                                      pb_mm_bridge_read,                        //                               .read
		output wire [31:0]                               pb_mm_bridge_readdata,                    //                               .readdata
		input  wire                                      pb_mm_bridge_write,                       //                               .write
		input  wire [31:0]                               pb_mm_bridge_writedata,                   //                               .writedata
		input  wire [3:0]                                pb_mm_bridge_byteenable,                  //                               .byteenable
		output wire                                      pb_mm_bridge_waitrequest,                 //                               .waitrequest
		input  wire [7:0]                                lphy_ss_config_csr_address,               //             lphy_ss_config_csr.address
		input  wire                                      lphy_ss_config_csr_write,                 //                               .write
		input  wire [31:0]                               lphy_ss_config_csr_writedata,             //                               .writedata
		output wire [31:0]                               lphy_ss_config_csr_readdata,              //                               .readdata
		input  wire                                      lphy_ss_config_csr_read,                  //                               .read
		output wire                                      lphy_ss_config_csr_waitrequest,           //                               .waitrequest
		output wire                                      lphy_ss_config_csr_readdatavalid,         //                               .readdatavalid
		input  wire [3:0]                                long_prach_lw_bridge_address_l2,          //        long_prach_lw_bridge_l2.address
		input  wire                                      long_prach_lw_bridge_write_l2,            //                               .write
		output wire [31:0]                               long_prach_lw_bridge_readdata_l2,         //                               .readdata
		input  wire [31:0]                               long_prach_lw_bridge_writedata_l2,        //                               .writedata
		output wire                                      long_prach_lw_bridge_waitrequest_l2,      //                               .waitrequest
		output wire                                      long_prach_lw_bridge_readdatavalid_l2,    //                               .readdatavalid
		input  wire                                      long_prach_lw_bridge_read_l2,             //                               .read
		input  wire [3:0]                                long_prach_lw_bridge_address_l1,          //        long_prach_lw_bridge_l1.address
		input  wire                                      long_prach_lw_bridge_write_l1,            //                               .write
		output wire [31:0]                               long_prach_lw_bridge_readdata_l1,         //                               .readdata
		input  wire [31:0]                               long_prach_lw_bridge_writedata_l1,        //                               .writedata
		output wire                                      long_prach_lw_bridge_waitrequest_l1,      //                               .waitrequest
		output wire                                      long_prach_lw_bridge_readdatavalid_l1,    //                               .readdatavalid
		input  wire                                      long_prach_lw_bridge_read_l1,             //                               .read
		input  wire [31:0]                               short_prach2_busIn_writedata,             //       short_prach_lw_bridge_l2.writedata
		input  wire [9:0]                                short_prach2_busIn_address,               //                               .address
		input  wire                                      short_prach2_busIn_write,                 //                               .write
		input  wire                                      short_prach2_busIn_read,                  //                               .read
		output wire                                      short_prach2_busOut_readdatavalid,        //                               .readdatavalid
		output wire [31:0]                               short_prach2_busOut_readdata,             //                               .readdata
		output wire                                      short_prach2_busOut_waitrequest,          //                               .waitrequest
		input  wire [31:0]                               short_prach1_busIn_writedata,             //       short_prach_lw_bridge_l1.writedata
		input  wire [9:0]                                short_prach1_busIn_address,               //                               .address
		input  wire                                      short_prach1_busIn_write,                 //                               .write
		input  wire                                      short_prach1_busIn_read,                  //                               .read
		output wire                                      short_prach1_busOut_readdatavalid,        //                               .readdatavalid
		output wire [31:0]                               short_prach1_busOut_readdata,             //                               .readdata
		output wire                                      short_prach1_busOut_waitrequest,          //                               .waitrequest
		input  wire                                      clk_dsp,                                  //                      clock_dsp.clk
		input  wire                                      clk_csr,                                  //                      clock_csr.clk
		input  wire                                      clk_eth_xran_dl,                          //              clock_eth_xran_dl.clk
		input  wire                                      clk_eth_xran_ul,                          //              clock_eth_xran_ul.clk
		input  wire                                      rst_dsp_n,                                //                    reset_dsp_n.reset_n
		input  wire                                      rst_csr_n,                                //                    reset_csr_n.reset_n
		input  wire                                      rst_eth_xran_n_dl,                        //            reset_eth_xran_dl_n.reset_n
		input  wire                                      rst_eth_xran_n_ul,                        //            reset_eth_xran_ul_n.reset_n
		input  wire                                      xran_demapper_source_valid,               //           xran_demapper_source.valid
		input  wire [(((XRAN_ETH_DATAWIDTH-1)-0)+1)-1:0] xran_demapper_source_data,                //                               .data
		input  wire                                      xran_demapper_source_endofpacket,         //                               .endofpacket
		input  wire                                      xran_demapper_source_startofpacket,       //                               .startofpacket
		output wire                                      xran_demapper_source_ready,               //                               .ready
		input  wire [15:0]                               xran_demapper_source_channel,             //                               .channel
		output wire                                      ifft_source_valid1,                       //                 ifft_source_l1.valid
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0]       ifft_source_data1,                        //                               .data
		output wire [7:0]                                ifft_source_channel1,                     //                               .channel
		output wire                                      ifft_source_valid2,                       //                 ifft_source_l2.valid
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0]       ifft_source_data2,                        //                               .data
		output wire [7:0]                                ifft_source_channel2,                     //                               .channel
		output wire                                      coupling_pusch_avst_sink_valid_l1,        //    coupling_pusch_avst_sink_l1.valid
		output wire [31:0]                               coupling_pusch_avst_sink_data_l1,         //                               .data
		output wire [15:0]                               coupling_pusch_avst_sink_channel_l1,      //                               .channel
		output wire                                      coupling_pusch_avst_sink_sop_l1,          //                               .startofpacket
		output wire                                      coupling_pusch_avst_sink_eop_l1,          //                               .endofpacket
		output wire                                      coupling_pusch_avst_sink_valid_l2,        //    coupling_pusch_avst_sink_l2.valid
		output wire [31:0]                               coupling_pusch_avst_sink_data_l2,         //                               .data
		output wire [15:0]                               coupling_pusch_avst_sink_channel_l2,      //                               .channel
		output wire                                      coupling_pusch_avst_sink_sop_l2,          //                               .startofpacket
		output wire                                      coupling_pusch_avst_sink_eop_l2,          //                               .endofpacket
		output wire                                      coupling_prach_avst_sink_valid_l1,        //    coupling_prach_avst_sink_l1.valid
		output wire [31:0]                               coupling_prach_avst_sink_data_l1,         //                               .data
		output wire [15:0]                               coupling_prach_avst_sink_channel_l1,      //                               .channel
		output wire                                      coupling_prach_avst_sink_sop_l1,          //                               .startofpacket
		output wire                                      coupling_prach_avst_sink_eop_l1,          //                               .endofpacket
		output wire                                      coupling_prach_avst_sink_valid_l2,        //    coupling_prach_avst_sink_l2.valid
		output wire [31:0]                               coupling_prach_avst_sink_data_l2,         //                               .data
		output wire [15:0]                               coupling_prach_avst_sink_channel_l2,      //                               .channel
		output wire                                      coupling_prach_avst_sink_sop_l2,          //                               .startofpacket
		output wire                                      coupling_prach_avst_sink_eop_l2,          //                               .endofpacket
		input  wire                                      xran_demapper_cplane_valid,               //    xran_demapper_cplane_source.valid
		input  wire                                      xran_demapper_cplane_startofpacket,       //                               .startofpacket
		input  wire                                      xran_demapper_cplane_endofpacket,         //                               .endofpacket
		input  wire                                      pb_avst_sink_valid,                       //                   pb_avst_sink.valid
		input  wire [63:0]                               pb_avst_sink_data,                        //                               .data
		output wire                                      pb_avst_sink_ready,                       //                               .ready
		output wire [7:0]                                bw_config_cc1,                            //                   bw_confg_cc1.bw_config_cc1
		output wire [7:0]                                bw_config_cc2,                            //                   bw_confg_cc2.bw_config_cc2
		output wire [55:0]                               radio_config_status,                      //            radio_config_status.radio_config_status
		output wire                                      short_long_prach_select,                  //        short_long_prach_select.data
		input  wire [15:0]                               rx_rtc_id,                                //                      rx_rtc_id.rx_rtc_id
		input  wire [15:0]                               rx_u_axc_id,                              //                    rx_u_axc_id.rx_u_axc_id
		input  wire [15:0]                               rx_rtc_id_dl,                             //                   rx_rtc_id_dl.rx_rtc_id_dl
		input  wire                                      lphy_ss_ul_sink_valid1,                   //             lphy_ss_ul_sink_l1.valid
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0]       lphy_ss_ul_sink_data1,                    //                               .data
		input  wire [7:0]                                lphy_ss_ul_sink_channel1,                 //                               .channel
		input  wire                                      lphy_ss_ul_sink_valid2,                   //             lphy_ss_ul_sink_l2.valid
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0]       lphy_ss_ul_sink_data2,                    //                               .data
		input  wire [7:0]                                lphy_ss_ul_sink_channel2,                 //                               .channel
		output wire                                      rst_soft_n,                               //                     rst_soft_n.rst_soft_n
		output wire [31:0]                               coupling_pusch_timing_ref,                //      coupling_pusch_timing_ref.data
		output wire [31:0]                               coupling_prach_timing_ref,                //      coupling_prach_timing_ref.data
		input  wire [189:0]                              oran_rx_cplane_concat,                    //          oran_rx_cplane_concat.data
		input  wire [67:0]                               oran_rx_uplane_concat,                    //          oran_rx_uplane_concat.data
		output wire                                      lphy_avst_selctd_cap_intf_valid,          //      lphy_avst_selctd_cap_intf.valid
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0]       lphy_avst_selctd_cap_intf_data,           //                               .data
		output wire [2:0]                                lphy_avst_selctd_cap_intf_chan,           //                               .channel
		output wire                                      ul_start_pulse_latch,                     //           ul_start_pulse_latch.data
		input  wire                                      frame_status_counter_reset,               //     frame_status_counter_reset.data
		input  wire [31:0]                               interface_sel,                            //                  interface_sel.data
		output wire                                      dl_input_hfn_pulse,                       //             dl_input_hfn_pulse.data
		input  wire [5:0]                                pm_ifft_threash_mm_bridge_address_l1,     //   pm_ifft_threash_mm_bridge_l1.address
		input  wire                                      pm_ifft_threash_mm_bridge_chipselect_l1,  //                               .chipselect
		input  wire                                      pm_ifft_threash_mm_bridge_read_l1,        //                               .read
		input  wire                                      pm_ifft_threash_mm_bridge_write_l1,       //                               .write
		input  wire [31:0]                               pm_ifft_threash_mm_bridge_writedata_l1,   //                               .writedata
		input  wire [3:0]                                pm_ifft_threash_mm_bridge_byteenable_l1,  //                               .byteenable
		output wire [31:0]                               pm_ifft_threash_mm_bridge_readdata_l1,    //                               .readdata
		output wire                                      pm_ifft_threash_mm_bridge_waitrequest_l1, //                               .waitrequest
		output wire                                      pwr_mtr_ifft_hist_done_intr_l1,           // pwr_mtr_ifft_hist_done_intr_l1.irq
		output wire                                      pwr_mtr_ifft_hist_done_intr_l2,           // pwr_mtr_ifft_hist_done_intr_l2.irq
		input  wire [5:0]                                pm_ifft_threash_mm_bridge_address_l2,     //   pm_ifft_threash_mm_bridge_l2.address
		input  wire                                      pm_ifft_threash_mm_bridge_chipselect_l2,  //                               .chipselect
		input  wire                                      pm_ifft_threash_mm_bridge_read_l2,        //                               .read
		input  wire                                      pm_ifft_threash_mm_bridge_write_l2,       //                               .write
		input  wire [31:0]                               pm_ifft_threash_mm_bridge_writedata_l2,   //                               .writedata
		input  wire [3:0]                                pm_ifft_threash_mm_bridge_byteenable_l2,  //                               .byteenable
		output wire [31:0]                               pm_ifft_threash_mm_bridge_readdata_l2,    //                               .readdata
		output wire                                      pm_ifft_threash_mm_bridge_waitrequest_l2, //                               .waitrequest
		input  wire [31:0]                               pwr_mtr_ifft_config_csr_writedata_l1,     //     pwr_mtr_ifft_config_csr_l1.writedata
		input  wire                                      pwr_mtr_ifft_config_csr_read_l1,          //                               .read
		input  wire                                      pwr_mtr_ifft_config_csr_write_l1,         //                               .write
		output wire [31:0]                               pwr_mtr_ifft_config_csr_readdata_l1,      //                               .readdata
		output wire                                      pwr_mtr_ifft_config_csr_readdatavalid_l1, //                               .readdatavalid
		input  wire [3:0]                                pwr_mtr_ifft_config_csr_address_l1,       //                               .address
		output wire                                      pwr_mtr_ifft_config_csr_waitrequest_l1,   //                               .waitrequest
		input  wire [31:0]                               pwr_mtr_ifft_config_csr_writedata_l2,     //     pwr_mtr_ifft_config_csr_l2.writedata
		input  wire                                      pwr_mtr_ifft_config_csr_read_l2,          //                               .read
		input  wire                                      pwr_mtr_ifft_config_csr_write_l2,         //                               .write
		output wire [31:0]                               pwr_mtr_ifft_config_csr_readdata_l2,      //                               .readdata
		output wire                                      pwr_mtr_ifft_config_csr_readdatavalid_l2, //                               .readdatavalid
		input  wire [3:0]                                pwr_mtr_ifft_config_csr_address_l2,       //                               .address
		output wire                                      pwr_mtr_ifft_config_csr_waitrequest_l2,   //                               .waitrequest
		input  wire [11:0]                               pm_ifft_hist_mm_bridge_address_l1,        //      pm_ifft_hist_mm_bridge_l1.address
		input  wire                                      pm_ifft_hist_mm_bridge_chipselect_l1,     //                               .chipselect
		input  wire                                      pm_ifft_hist_mm_bridge_read_l1,           //                               .read
		input  wire                                      pm_ifft_hist_mm_bridge_write_l1,          //                               .write
		input  wire [31:0]                               pm_ifft_hist_mm_bridge_writedata_l1,      //                               .writedata
		input  wire [3:0]                                pm_ifft_hist_mm_bridge_byteenable_l1,     //                               .byteenable
		output wire [31:0]                               pm_ifft_hist_mm_bridge_readdata_l1,       //                               .readdata
		output wire                                      pm_ifft_hist_mm_bridge_readdatavalid_l1,  //                               .readdatavalid
		output wire                                      pm_ifft_hist_mm_bridge_waitrequest_l1,    //                               .waitrequest
		input  wire [11:0]                               pm_ifft_hist_mm_bridge_address_l2,        //      pm_ifft_hist_mm_bridge_l2.address
		input  wire                                      pm_ifft_hist_mm_bridge_chipselect_l2,     //                               .chipselect
		input  wire                                      pm_ifft_hist_mm_bridge_read_l2,           //                               .read
		input  wire                                      pm_ifft_hist_mm_bridge_write_l2,          //                               .write
		input  wire [31:0]                               pm_ifft_hist_mm_bridge_writedata_l2,      //                               .writedata
		input  wire [3:0]                                pm_ifft_hist_mm_bridge_byteenable_l2,     //                               .byteenable
		output wire [31:0]                               pm_ifft_hist_mm_bridge_readdata_l2,       //                               .readdata
		output wire                                      pm_ifft_hist_mm_bridge_readdatavalid_l2,  //                               .readdatavalid
		output wire                                      pm_ifft_hist_mm_bridge_waitrequest_l2,    //                               .waitrequest
		output wire                                      pwr_mtr_fft_hist_done_intr_l1,            //  pwr_mtr_fft_hist_done_intr_l1.irq
		output wire                                      pwr_mtr_fft_hist_done_intr_l2,            //  pwr_mtr_fft_hist_done_intr_l2.irq
		output wire                                      duc_ddc_lpbk_en,                          //                duc_ddc_lpbk_en.data
		input  wire [5:0]                                pm_fft_threash_mm_bridge_address_l1,      //    pm_fft_threash_mm_bridge_l1.address
		input  wire                                      pm_fft_threash_mm_bridge_chipselect_l1,   //                               .chipselect
		input  wire                                      pm_fft_threash_mm_bridge_read_l1,         //                               .read
		input  wire                                      pm_fft_threash_mm_bridge_write_l1,        //                               .write
		input  wire [31:0]                               pm_fft_threash_mm_bridge_writedata_l1,    //                               .writedata
		input  wire [3:0]                                pm_fft_threash_mm_bridge_byteenable_l1,   //                               .byteenable
		output wire [31:0]                               pm_fft_threash_mm_bridge_readdata_l1,     //                               .readdata
		output wire                                      pm_fft_threash_mm_bridge_waitrequest_l1,  //                               .waitrequest
		input  wire [5:0]                                pm_fft_threash_mm_bridge_address_l2,      //    pm_fft_threash_mm_bridge_l2.address
		input  wire                                      pm_fft_threash_mm_bridge_chipselect_l2,   //                               .chipselect
		input  wire                                      pm_fft_threash_mm_bridge_read_l2,         //                               .read
		input  wire                                      pm_fft_threash_mm_bridge_write_l2,        //                               .write
		input  wire [31:0]                               pm_fft_threash_mm_bridge_writedata_l2,    //                               .writedata
		input  wire [3:0]                                pm_fft_threash_mm_bridge_byteenable_l2,   //                               .byteenable
		output wire [31:0]                               pm_fft_threash_mm_bridge_readdata_l2,     //                               .readdata
		output wire                                      pm_fft_threash_mm_bridge_waitrequest_l2,  //                               .waitrequest
		input  wire [31:0]                               pwr_mtr_fft_config_csr_writedata_l1,      //      pwr_mtr_fft_config_csr_l1.writedata
		input  wire                                      pwr_mtr_fft_config_csr_read_l1,           //                               .read
		input  wire                                      pwr_mtr_fft_config_csr_write_l1,          //                               .write
		output wire [31:0]                               pwr_mtr_fft_config_csr_readdata_l1,       //                               .readdata
		output wire                                      pwr_mtr_fft_config_csr_readdatavalid_l1,  //                               .readdatavalid
		input  wire [3:0]                                pwr_mtr_fft_config_csr_address_l1,        //                               .address
		output wire                                      pwr_mtr_fft_config_csr_waitrequest_l1,    //                               .waitrequest
		input  wire [31:0]                               pwr_mtr_fft_config_csr_writedata_l2,      //      pwr_mtr_fft_config_csr_l2.writedata
		input  wire                                      pwr_mtr_fft_config_csr_read_l2,           //                               .read
		input  wire                                      pwr_mtr_fft_config_csr_write_l2,          //                               .write
		output wire [31:0]                               pwr_mtr_fft_config_csr_readdata_l2,       //                               .readdata
		output wire                                      pwr_mtr_fft_config_csr_readdatavalid_l2,  //                               .readdatavalid
		input  wire [3:0]                                pwr_mtr_fft_config_csr_address_l2,        //                               .address
		output wire                                      pwr_mtr_fft_config_csr_waitrequest_l2,    //                               .waitrequest
		input  wire [11:0]                               pm_fft_hist_mm_bridge_address_l1,         //       pm_fft_hist_mm_bridge_l1.address
		input  wire                                      pm_fft_hist_mm_bridge_chipselect_l1,      //                               .chipselect
		input  wire                                      pm_fft_hist_mm_bridge_read_l1,            //                               .read
		input  wire                                      pm_fft_hist_mm_bridge_write_l1,           //                               .write
		input  wire [31:0]                               pm_fft_hist_mm_bridge_writedata_l1,       //                               .writedata
		input  wire [3:0]                                pm_fft_hist_mm_bridge_byteenable_l1,      //                               .byteenable
		output wire [31:0]                               pm_fft_hist_mm_bridge_readdata_l1,        //                               .readdata
		output wire                                      pm_fft_hist_mm_bridge_readdatavalid_l1,   //                               .readdatavalid
		output wire                                      pm_fft_hist_mm_bridge_waitrequest_l1,     //                               .waitrequest
		input  wire [11:0]                               pm_fft_hist_mm_bridge_address_l2,         //       pm_fft_hist_mm_bridge_l2.address
		input  wire                                      pm_fft_hist_mm_bridge_chipselect_l2,      //                               .chipselect
		input  wire                                      pm_fft_hist_mm_bridge_read_l2,            //                               .read
		input  wire                                      pm_fft_hist_mm_bridge_write_l2,           //                               .write
		input  wire [31:0]                               pm_fft_hist_mm_bridge_writedata_l2,       //                               .writedata
		input  wire [3:0]                                pm_fft_hist_mm_bridge_byteenable_l2,      //                               .byteenable
		output wire [31:0]                               pm_fft_hist_mm_bridge_readdata_l2,        //                               .readdata
		output wire                                      pm_fft_hist_mm_bridge_readdatavalid_l2,   //                               .readdatavalid
		output wire                                      pm_fft_hist_mm_bridge_waitrequest_l2,     //                               .waitrequest
		input  wire [9:0]                                pm_stat_ifft_mm_bridge_address_l1,        //      pm_stat_ifft_mm_bridge_l1.address
		input  wire                                      pm_stat_ifft_mm_bridge_chipselect_l1,     //                               .chipselect
		input  wire                                      pm_stat_ifft_mm_bridge_read_l1,           //                               .read
		input  wire                                      pm_stat_ifft_mm_bridge_write_l1,          //                               .write
		input  wire [31:0]                               pm_stat_ifft_mm_bridge_writedata_l1,      //                               .writedata
		input  wire [3:0]                                pm_stat_ifft_mm_bridge_byteenable_l1,     //                               .byteenable
		output wire [31:0]                               pm_stat_ifft_mm_bridge_readdata_l1,       //                               .readdata
		output wire                                      pm_stat_ifft_mm_bridge_readdatavalid_l1,  //                               .readdatavalid
		output wire                                      pm_stat_ifft_mm_bridge_waitrequest_l1,    //                               .waitrequest
		input  wire [9:0]                                pm_stat_ifft_mm_bridge_address_l2,        //      pm_stat_ifft_mm_bridge_l2.address
		input  wire                                      pm_stat_ifft_mm_bridge_chipselect_l2,     //                               .chipselect
		input  wire                                      pm_stat_ifft_mm_bridge_read_l2,           //                               .read
		input  wire                                      pm_stat_ifft_mm_bridge_write_l2,          //                               .write
		input  wire [31:0]                               pm_stat_ifft_mm_bridge_writedata_l2,      //                               .writedata
		input  wire [3:0]                                pm_stat_ifft_mm_bridge_byteenable_l2,     //                               .byteenable
		output wire [31:0]                               pm_stat_ifft_mm_bridge_readdata_l2,       //                               .readdata
		output wire                                      pm_stat_ifft_mm_bridge_readdatavalid_l2,  //                               .readdatavalid
		output wire                                      pm_stat_ifft_mm_bridge_waitrequest_l2,    //                               .waitrequest
		input  wire [9:0]                                pm_stat_fft_mm_bridge_address_l1,         //       pm_stat_fft_mm_bridge_l1.address
		input  wire                                      pm_stat_fft_mm_bridge_chipselect_l1,      //                               .chipselect
		input  wire                                      pm_stat_fft_mm_bridge_read_l1,            //                               .read
		input  wire                                      pm_stat_fft_mm_bridge_write_l1,           //                               .write
		input  wire [31:0]                               pm_stat_fft_mm_bridge_writedata_l1,       //                               .writedata
		input  wire [3:0]                                pm_stat_fft_mm_bridge_byteenable_l1,      //                               .byteenable
		output wire [31:0]                               pm_stat_fft_mm_bridge_readdata_l1,        //                               .readdata
		output wire                                      pm_stat_fft_mm_bridge_readdatavalid_l1,   //                               .readdatavalid
		output wire                                      pm_stat_fft_mm_bridge_waitrequest_l1,     //                               .waitrequest
		input  wire [9:0]                                pm_stat_fft_mm_bridge_address_l2,         //       pm_stat_fft_mm_bridge_l2.address
		input  wire                                      pm_stat_fft_mm_bridge_chipselect_l2,      //                               .chipselect
		input  wire                                      pm_stat_fft_mm_bridge_read_l2,            //                               .read
		input  wire                                      pm_stat_fft_mm_bridge_write_l2,           //                               .write
		input  wire [31:0]                               pm_stat_fft_mm_bridge_writedata_l2,       //                               .writedata
		input  wire [3:0]                                pm_stat_fft_mm_bridge_byteenable_l2,      //                               .byteenable
		output wire [31:0]                               pm_stat_fft_mm_bridge_readdata_l2,        //                               .readdata
		output wire                                      pm_stat_fft_mm_bridge_readdatavalid_l2,   //                               .readdatavalid
		output wire                                      pm_stat_fft_mm_bridge_waitrequest_l2      //                               .waitrequest
	);
endmodule

