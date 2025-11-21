module qsys_top #(
		parameter FP_WIDTH = 32,
		parameter SIM_MODE = 0
	) (
		input  wire [19:0]  ftile_debug_status_econ_export,                                                          //                                                     ftile_debug_status_econ.export
		input  wire         hssi_ss_1_p0_axi_st_tx_reset_reset_n,                                                    //                                                hssi_ss_1_p0_axi_st_tx_reset.reset_n
		input  wire         hssi_ss_1_p0_axi_st_tx_interface_tvalid,                                                 //                                            hssi_ss_1_p0_axi_st_tx_interface.tvalid
		output wire         hssi_ss_1_p0_axi_st_tx_interface_tready,                                                 //                                                                            .tready
		input  wire [63:0]  hssi_ss_1_p0_axi_st_tx_interface_tdata,                                                  //                                                                            .tdata
		input  wire [7:0]   hssi_ss_1_p0_axi_st_tx_interface_tkeep,                                                  //                                                                            .tkeep
		input  wire         hssi_ss_1_p0_axi_st_tx_interface_tlast,                                                  //                                                                            .tlast
		input  wire [1:0]   hssi_ss_1_p0_axi_st_tx_interface_tuser,                                                  //                                                                            .tuser
		input  wire [93:0]  hssi_ss_1_p0_tx_tuser_ptp_tuser_1,                                                       //                                                   hssi_ss_1_p0_tx_tuser_ptp.tuser_1
		input  wire [327:0] hssi_ss_1_p0_tx_tuser_ptp_extended_tuser_2,                                              //                                          hssi_ss_1_p0_tx_tuser_ptp_extended.tuser_2
		input  wire         hssi_ss_1_p1_axi_st_tx_reset_reset_n,                                                    //                                                hssi_ss_1_p1_axi_st_tx_reset.reset_n
		input  wire         hssi_ss_1_p1_axi_st_tx_interface_tvalid,                                                 //                                            hssi_ss_1_p1_axi_st_tx_interface.tvalid
		output wire         hssi_ss_1_p1_axi_st_tx_interface_tready,                                                 //                                                                            .tready
		input  wire [63:0]  hssi_ss_1_p1_axi_st_tx_interface_tdata,                                                  //                                                                            .tdata
		input  wire [7:0]   hssi_ss_1_p1_axi_st_tx_interface_tkeep,                                                  //                                                                            .tkeep
		input  wire         hssi_ss_1_p1_axi_st_tx_interface_tlast,                                                  //                                                                            .tlast
		input  wire [1:0]   hssi_ss_1_p1_axi_st_tx_interface_tuser,                                                  //                                                                            .tuser
		input  wire [93:0]  hssi_ss_1_p1_tx_tuser_ptp_tuser_1,                                                       //                                                   hssi_ss_1_p1_tx_tuser_ptp.tuser_1
		input  wire [327:0] hssi_ss_1_p1_tx_tuser_ptp_extended_tuser_2,                                              //                                          hssi_ss_1_p1_tx_tuser_ptp_extended.tuser_2
		input  wire         hssi_ss_1_p2_axi_st_tx_reset_reset_n,                                                    //                                                hssi_ss_1_p2_axi_st_tx_reset.reset_n
		input  wire         hssi_ss_1_p2_axi_st_tx_interface_tvalid,                                                 //                                            hssi_ss_1_p2_axi_st_tx_interface.tvalid
		output wire         hssi_ss_1_p2_axi_st_tx_interface_tready,                                                 //                                                                            .tready
		input  wire [63:0]  hssi_ss_1_p2_axi_st_tx_interface_tdata,                                                  //                                                                            .tdata
		input  wire [7:0]   hssi_ss_1_p2_axi_st_tx_interface_tkeep,                                                  //                                                                            .tkeep
		input  wire         hssi_ss_1_p2_axi_st_tx_interface_tlast,                                                  //                                                                            .tlast
		input  wire [1:0]   hssi_ss_1_p2_axi_st_tx_interface_tuser,                                                  //                                                                            .tuser
		input  wire [93:0]  hssi_ss_1_p2_tx_tuser_ptp_tuser_1,                                                       //                                                   hssi_ss_1_p2_tx_tuser_ptp.tuser_1
		input  wire [327:0] hssi_ss_1_p2_tx_tuser_ptp_extended_tuser_2,                                              //                                          hssi_ss_1_p2_tx_tuser_ptp_extended.tuser_2
		input  wire         hssi_ss_1_p3_axi_st_tx_reset_reset_n,                                                    //                                                hssi_ss_1_p3_axi_st_tx_reset.reset_n
		input  wire         hssi_ss_1_p3_axi_st_tx_interface_tvalid,                                                 //                                            hssi_ss_1_p3_axi_st_tx_interface.tvalid
		output wire         hssi_ss_1_p3_axi_st_tx_interface_tready,                                                 //                                                                            .tready
		input  wire [63:0]  hssi_ss_1_p3_axi_st_tx_interface_tdata,                                                  //                                                                            .tdata
		input  wire [7:0]   hssi_ss_1_p3_axi_st_tx_interface_tkeep,                                                  //                                                                            .tkeep
		input  wire         hssi_ss_1_p3_axi_st_tx_interface_tlast,                                                  //                                                                            .tlast
		input  wire [1:0]   hssi_ss_1_p3_axi_st_tx_interface_tuser,                                                  //                                                                            .tuser
		input  wire [93:0]  hssi_ss_1_p3_tx_tuser_ptp_tuser_1,                                                       //                                                   hssi_ss_1_p3_tx_tuser_ptp.tuser_1
		input  wire [327:0] hssi_ss_1_p3_tx_tuser_ptp_extended_tuser_2,                                              //                                          hssi_ss_1_p3_tx_tuser_ptp_extended.tuser_2
		input  wire         hssi_ss_1_p0_axi_st_rx_reset_reset_n,                                                    //                                                hssi_ss_1_p0_axi_st_rx_reset.reset_n
		output wire [4:0]   hssi_ss_1_p0_rx_tuser_status_tuser_1,                                                    //                                                hssi_ss_1_p0_rx_tuser_status.tuser_1
		input  wire         hssi_ss_1_p1_axi_st_rx_reset_reset_n,                                                    //                                                hssi_ss_1_p1_axi_st_rx_reset.reset_n
		output wire         hssi_ss_1_p1_axi_st_rx_interface_tvalid,                                                 //                                            hssi_ss_1_p1_axi_st_rx_interface.tvalid
		output wire [63:0]  hssi_ss_1_p1_axi_st_rx_interface_tdata,                                                  //                                                                            .tdata
		output wire [7:0]   hssi_ss_1_p1_axi_st_rx_interface_tkeep,                                                  //                                                                            .tkeep
		output wire         hssi_ss_1_p1_axi_st_rx_interface_tlast,                                                  //                                                                            .tlast
		output wire [6:0]   hssi_ss_1_p1_axi_st_rx_interface_tuser,                                                  //                                                                            .tuser
		input  wire         hssi_ss_1_p2_axi_st_rx_reset_reset_n,                                                    //                                                hssi_ss_1_p2_axi_st_rx_reset.reset_n
		output wire         hssi_ss_1_p2_axi_st_rx_interface_tvalid,                                                 //                                            hssi_ss_1_p2_axi_st_rx_interface.tvalid
		output wire [63:0]  hssi_ss_1_p2_axi_st_rx_interface_tdata,                                                  //                                                                            .tdata
		output wire [7:0]   hssi_ss_1_p2_axi_st_rx_interface_tkeep,                                                  //                                                                            .tkeep
		output wire         hssi_ss_1_p2_axi_st_rx_interface_tlast,                                                  //                                                                            .tlast
		output wire [6:0]   hssi_ss_1_p2_axi_st_rx_interface_tuser,                                                  //                                                                            .tuser
		input  wire         hssi_ss_1_p3_axi_st_rx_reset_reset_n,                                                    //                                                hssi_ss_1_p3_axi_st_rx_reset.reset_n
		output wire         hssi_ss_1_p3_axi_st_rx_interface_tvalid,                                                 //                                            hssi_ss_1_p3_axi_st_rx_interface.tvalid
		output wire [63:0]  hssi_ss_1_p3_axi_st_rx_interface_tdata,                                                  //                                                                            .tdata
		output wire [7:0]   hssi_ss_1_p3_axi_st_rx_interface_tkeep,                                                  //                                                                            .tkeep
		output wire         hssi_ss_1_p3_axi_st_rx_interface_tlast,                                                  //                                                                            .tlast
		output wire [6:0]   hssi_ss_1_p3_axi_st_rx_interface_tuser,                                                  //                                                                            .tuser
		input  wire         hssi_ss_1_p0_axi_st_tx_ptp_interface_tvalid,                                             //                                        hssi_ss_1_p0_axi_st_tx_ptp_interface.tvalid
		input  wire [95:0]  hssi_ss_1_p0_axi_st_tx_ptp_interface_tdata,                                              //                                                                            .tdata
		output wire         hssi_ss_1_p0_axi_st_tx_egrs0_interface_tvalid,                                           //                                      hssi_ss_1_p0_axi_st_tx_egrs0_interface.tvalid
		output wire [103:0] hssi_ss_1_p0_axi_st_tx_egrs0_interface_tdata,                                            //                                                                            .tdata
		output wire         hssi_ss_1_p0_axi_st_rx_ingrs0_interface_tvalid,                                          //                                     hssi_ss_1_p0_axi_st_rx_ingrs0_interface.tvalid
		output wire [95:0]  hssi_ss_1_p0_axi_st_rx_ingrs0_interface_tdata,                                           //                                                                            .tdata
		input  wire         hssi_ss_1_p0_tx_flow_control_interface_i_p0_tx_pause,                                    //                                      hssi_ss_1_p0_tx_flow_control_interface.i_p0_tx_pause
		input  wire [7:0]   hssi_ss_1_p0_tx_flow_control_interface_i_p0_tx_pfc,                                      //                                                                            .i_p0_tx_pfc
		input  wire         hssi_ss_1_p1_tx_flow_control_interface_i_p1_tx_pause,                                    //                                      hssi_ss_1_p1_tx_flow_control_interface.i_p1_tx_pause
		input  wire [7:0]   hssi_ss_1_p1_tx_flow_control_interface_i_p1_tx_pfc,                                      //                                                                            .i_p1_tx_pfc
		input  wire         hssi_ss_1_p2_tx_flow_control_interface_i_p2_tx_pause,                                    //                                      hssi_ss_1_p2_tx_flow_control_interface.i_p2_tx_pause
		input  wire [7:0]   hssi_ss_1_p2_tx_flow_control_interface_i_p2_tx_pfc,                                      //                                                                            .i_p2_tx_pfc
		input  wire         hssi_ss_1_p3_tx_flow_control_interface_i_p3_tx_pause,                                    //                                      hssi_ss_1_p3_tx_flow_control_interface.i_p3_tx_pause
		input  wire [7:0]   hssi_ss_1_p3_tx_flow_control_interface_i_p3_tx_pfc,                                      //                                                                            .i_p3_tx_pfc
		output wire [0:0]   hssi_ss_1_p0_tx_srl_interface_p0_tx_serial,                                              //                                               hssi_ss_1_p0_tx_srl_interface.p0_tx_serial
		output wire [0:0]   hssi_ss_1_p0_tx_srl_interface_p0_tx_serial_n,                                            //                                                                            .p0_tx_serial_n
		input  wire [0:0]   hssi_ss_1_p0_rx_srl_interface_p0_rx_serial,                                              //                                               hssi_ss_1_p0_rx_srl_interface.p0_rx_serial
		input  wire [0:0]   hssi_ss_1_p0_rx_srl_interface_p0_rx_serial_n,                                            //                                                                            .p0_rx_serial_n
		output wire [0:0]   hssi_ss_1_p1_tx_srl_interface_p1_tx_serial,                                              //                                               hssi_ss_1_p1_tx_srl_interface.p1_tx_serial
		output wire [0:0]   hssi_ss_1_p1_tx_srl_interface_p1_tx_serial_n,                                            //                                                                            .p1_tx_serial_n
		input  wire [0:0]   hssi_ss_1_p1_rx_srl_interface_p1_rx_serial,                                              //                                               hssi_ss_1_p1_rx_srl_interface.p1_rx_serial
		input  wire [0:0]   hssi_ss_1_p1_rx_srl_interface_p1_rx_serial_n,                                            //                                                                            .p1_rx_serial_n
		input  wire [0:0]   hssi_ss_1_p2_rx_srl_interface_p2_rx_serial,                                              //                                               hssi_ss_1_p2_rx_srl_interface.p2_rx_serial
		input  wire [0:0]   hssi_ss_1_p2_rx_srl_interface_p2_rx_serial_n,                                            //                                                                            .p2_rx_serial_n
		input  wire [0:0]   hssi_ss_1_p3_rx_srl_interface_p3_rx_serial,                                              //                                               hssi_ss_1_p3_rx_srl_interface.p3_rx_serial
		input  wire [0:0]   hssi_ss_1_p3_rx_srl_interface_p3_rx_serial_n,                                            //                                                                            .p3_rx_serial_n
		input  wire         hssi_ss_1_subsystem_cold_rst_n_reset_n,                                                  //                                              hssi_ss_1_subsystem_cold_rst_n.reset_n
		output wire         hssi_ss_1_subsystem_cold_rst_ack_n_reset_n,                                              //                                          hssi_ss_1_subsystem_cold_rst_ack_n.reset_n
		input  wire         hssi_ss_1_i_p0_tx_rst_n_reset_n,                                                         //                                                     hssi_ss_1_i_p0_tx_rst_n.reset_n
		input  wire         hssi_ss_1_i_p0_rx_rst_n_reset_n,                                                         //                                                     hssi_ss_1_i_p0_rx_rst_n.reset_n
		output wire         hssi_ss_1_o_p0_rx_rst_ack_n_reset_n,                                                     //                                                 hssi_ss_1_o_p0_rx_rst_ack_n.reset_n
		output wire         hssi_ss_1_o_p0_tx_rst_ack_n_reset_n,                                                     //                                                 hssi_ss_1_o_p0_tx_rst_ack_n.reset_n
		input  wire         hssi_ss_1_i_p1_tx_rst_n_reset_n,                                                         //                                                     hssi_ss_1_i_p1_tx_rst_n.reset_n
		input  wire         hssi_ss_1_i_p1_rx_rst_n_reset_n,                                                         //                                                     hssi_ss_1_i_p1_rx_rst_n.reset_n
		output wire         hssi_ss_1_o_p1_rx_rst_ack_n_reset_n,                                                     //                                                 hssi_ss_1_o_p1_rx_rst_ack_n.reset_n
		output wire         hssi_ss_1_o_p1_tx_rst_ack_n_reset_n,                                                     //                                                 hssi_ss_1_o_p1_tx_rst_ack_n.reset_n
		input  wire         hssi_ss_1_i_p2_tx_rst_n_reset_n,                                                         //                                                     hssi_ss_1_i_p2_tx_rst_n.reset_n
		input  wire         hssi_ss_1_i_p2_rx_rst_n_reset_n,                                                         //                                                     hssi_ss_1_i_p2_rx_rst_n.reset_n
		input  wire         hssi_ss_1_i_p3_tx_rst_n_reset_n,                                                         //                                                     hssi_ss_1_i_p3_tx_rst_n.reset_n
		input  wire         hssi_ss_1_i_p3_rx_rst_n_reset_n,                                                         //                                                     hssi_ss_1_i_p3_rx_rst_n.reset_n
		input  wire [2:0]   hssi_ss_1_i_clk_ref_clk,                                                                 //                                                         hssi_ss_1_i_clk_ref.clk
		input  wire [1:0]   qsfpdd_status_pio_external_connection_export,                                            //                                       qsfpdd_status_pio_external_connection.export
		output wire [5:0]   qsfpdd_ctrl_pio_0_econ_export,                                                           //                                                      qsfpdd_ctrl_pio_0_econ.export
		input  wire         clk_csr_in_clk_clk,                                                                      //                                                              clk_csr_in_clk.clk
		input  wire         clk_dsp_in_clk_clk,                                                                      //                                                              clk_dsp_in_clk.clk
		output wire         hssi_ss_1_o_p0_clk_rec_div_clk,                                                          //                                                  hssi_ss_1_o_p0_clk_rec_div.clk
		output wire         ftile_out_clk_clk,                                                                       //                                                               ftile_out_clk.clk
		input  wire         dfd_subsystem_clock_bridge_dspby2_in_clk_clk,                                            //                                    dfd_subsystem_clock_bridge_dspby2_in_clk.clk
		input  wire         dma_subsys_ninit_done_reset,                                                             //                                                       dma_subsys_ninit_done.reset
		input  wire         dma_subsys_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid,            //      dma_subsys_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts.valid
		input  wire [95:0]  dma_subsys_dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data,             //                                                                            .data
		input  wire [0:0]   ts_chs_compl_0_rst_bus_in_reset,                                                         //                                                   ts_chs_compl_0_rst_bus_in.reset
		input  wire [0:0]   dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid,            //      dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts.valid
		input  wire [19:0]  dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint,      //                                                                            .fingerprint
		input  wire [95:0]  dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data,             //                                                                            .data
		output wire         dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid,       // dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req.valid
		output wire [19:0]  dma_subsys_dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint, //                                                                            .fingerprint
		input  wire [43:0]  agilex_hps_f2h_stm_hw_events_stm_hwevents,                                               //                                                agilex_hps_f2h_stm_hw_events.stm_hwevents
		input  wire         agilex_hps_h2f_cs_ntrst,                                                                 //                                                           agilex_hps_h2f_cs.ntrst
		input  wire         agilex_hps_h2f_cs_tck,                                                                   //                                                                            .tck
		input  wire         agilex_hps_h2f_cs_tdi,                                                                   //                                                                            .tdi
		output wire         agilex_hps_h2f_cs_tdo,                                                                   //                                                                            .tdo
		output wire         agilex_hps_h2f_cs_tdoen,                                                                 //                                                                            .tdoen
		input  wire         agilex_hps_h2f_cs_tms,                                                                   //                                                                            .tms
		output wire         hps_io_EMAC1_TX_CLK,                                                                     //                                                                      hps_io.EMAC1_TX_CLK
		output wire         hps_io_EMAC1_TXD0,                                                                       //                                                                            .EMAC1_TXD0
		output wire         hps_io_EMAC1_TXD1,                                                                       //                                                                            .EMAC1_TXD1
		output wire         hps_io_EMAC1_TXD2,                                                                       //                                                                            .EMAC1_TXD2
		output wire         hps_io_EMAC1_TXD3,                                                                       //                                                                            .EMAC1_TXD3
		input  wire         hps_io_EMAC1_RX_CTL,                                                                     //                                                                            .EMAC1_RX_CTL
		output wire         hps_io_EMAC1_TX_CTL,                                                                     //                                                                            .EMAC1_TX_CTL
		input  wire         hps_io_EMAC1_RX_CLK,                                                                     //                                                                            .EMAC1_RX_CLK
		input  wire         hps_io_EMAC1_RXD0,                                                                       //                                                                            .EMAC1_RXD0
		input  wire         hps_io_EMAC1_RXD1,                                                                       //                                                                            .EMAC1_RXD1
		input  wire         hps_io_EMAC1_RXD2,                                                                       //                                                                            .EMAC1_RXD2
		input  wire         hps_io_EMAC1_RXD3,                                                                       //                                                                            .EMAC1_RXD3
		inout  wire         hps_io_EMAC1_MDIO,                                                                       //                                                                            .EMAC1_MDIO
		output wire         hps_io_EMAC1_MDC,                                                                        //                                                                            .EMAC1_MDC
		inout  wire         hps_io_SDMMC_CMD,                                                                        //                                                                            .SDMMC_CMD
		inout  wire         hps_io_SDMMC_D0,                                                                         //                                                                            .SDMMC_D0
		inout  wire         hps_io_SDMMC_D1,                                                                         //                                                                            .SDMMC_D1
		inout  wire         hps_io_SDMMC_D2,                                                                         //                                                                            .SDMMC_D2
		inout  wire         hps_io_SDMMC_D3,                                                                         //                                                                            .SDMMC_D3
		inout  wire         hps_io_SDMMC_D4,                                                                         //                                                                            .SDMMC_D4
		inout  wire         hps_io_SDMMC_D5,                                                                         //                                                                            .SDMMC_D5
		inout  wire         hps_io_SDMMC_D6,                                                                         //                                                                            .SDMMC_D6
		inout  wire         hps_io_SDMMC_D7,                                                                         //                                                                            .SDMMC_D7
		output wire         hps_io_SDMMC_CCLK,                                                                       //                                                                            .SDMMC_CCLK
		output wire         hps_io_SPIM0_CLK,                                                                        //                                                                            .SPIM0_CLK
		output wire         hps_io_SPIM0_MOSI,                                                                       //                                                                            .SPIM0_MOSI
		input  wire         hps_io_SPIM0_MISO,                                                                       //                                                                            .SPIM0_MISO
		output wire         hps_io_SPIM0_SS0_N,                                                                      //                                                                            .SPIM0_SS0_N
		output wire         hps_io_SPIM1_CLK,                                                                        //                                                                            .SPIM1_CLK
		output wire         hps_io_SPIM1_MOSI,                                                                       //                                                                            .SPIM1_MOSI
		input  wire         hps_io_SPIM1_MISO,                                                                       //                                                                            .SPIM1_MISO
		output wire         hps_io_SPIM1_SS0_N,                                                                      //                                                                            .SPIM1_SS0_N
		output wire         hps_io_SPIM1_SS1_N,                                                                      //                                                                            .SPIM1_SS1_N
		input  wire         hps_io_UART1_RX,                                                                         //                                                                            .UART1_RX
		output wire         hps_io_UART1_TX,                                                                         //                                                                            .UART1_TX
		inout  wire         hps_io_I2C1_SDA,                                                                         //                                                                            .I2C1_SDA
		inout  wire         hps_io_I2C1_SCL,                                                                         //                                                                            .I2C1_SCL
		input  wire         hps_io_hps_osc_clk,                                                                      //                                                                            .hps_osc_clk
		inout  wire         hps_io_gpio0_io11,                                                                       //                                                                            .gpio0_io11
		inout  wire         hps_io_gpio0_io12,                                                                       //                                                                            .gpio0_io12
		inout  wire         hps_io_gpio0_io13,                                                                       //                                                                            .gpio0_io13
		inout  wire         hps_io_gpio0_io14,                                                                       //                                                                            .gpio0_io14
		inout  wire         hps_io_gpio0_io15,                                                                       //                                                                            .gpio0_io15
		inout  wire         hps_io_gpio0_io16,                                                                       //                                                                            .gpio0_io16
		inout  wire         hps_io_gpio0_io17,                                                                       //                                                                            .gpio0_io17
		inout  wire         hps_io_gpio0_io18,                                                                       //                                                                            .gpio0_io18
		inout  wire         hps_io_gpio1_io16,                                                                       //                                                                            .gpio1_io16
		inout  wire         hps_io_gpio1_io17,                                                                       //                                                                            .gpio1_io17
		output wire         agilex_hps_h2f_reset_reset,                                                              //                                                        agilex_hps_h2f_reset.reset
		input  wire [31:0]  f2h_irq1_irq,                                                                            //                                                                    f2h_irq1.irq
		input  wire         emif_hps_pll_ref_clk_clk,                                                                //                                                        emif_hps_pll_ref_clk.clk
		input  wire         emif_hps_oct_oct_rzqin,                                                                  //                                                                emif_hps_oct.oct_rzqin
		output wire [0:0]   emif_hps_mem_mem_ck,                                                                     //                                                                emif_hps_mem.mem_ck
		output wire [0:0]   emif_hps_mem_mem_ck_n,                                                                   //                                                                            .mem_ck_n
		output wire [16:0]  emif_hps_mem_mem_a,                                                                      //                                                                            .mem_a
		output wire [0:0]   emif_hps_mem_mem_act_n,                                                                  //                                                                            .mem_act_n
		output wire [1:0]   emif_hps_mem_mem_ba,                                                                     //                                                                            .mem_ba
		output wire [0:0]   emif_hps_mem_mem_bg,                                                                     //                                                                            .mem_bg
		output wire [0:0]   emif_hps_mem_mem_cke,                                                                    //                                                                            .mem_cke
		output wire [1:0]   emif_hps_mem_mem_cs_n,                                                                   //                                                                            .mem_cs_n
		output wire [0:0]   emif_hps_mem_mem_odt,                                                                    //                                                                            .mem_odt
		output wire [0:0]   emif_hps_mem_mem_reset_n,                                                                //                                                                            .mem_reset_n
		output wire [0:0]   emif_hps_mem_mem_par,                                                                    //                                                                            .mem_par
		input  wire [0:0]   emif_hps_mem_mem_alert_n,                                                                //                                                                            .mem_alert_n
		inout  wire [8:0]   emif_hps_mem_mem_dqs,                                                                    //                                                                            .mem_dqs
		inout  wire [8:0]   emif_hps_mem_mem_dqs_n,                                                                  //                                                                            .mem_dqs_n
		inout  wire [71:0]  emif_hps_mem_mem_dq,                                                                     //                                                                            .mem_dq
		inout  wire [8:0]   emif_hps_mem_mem_dbi_n,                                                                  //                                                                            .mem_dbi_n
		input  wire [3:0]   button_pio_external_connection_export,                                                   //                                              button_pio_external_connection.export
		input  wire [3:0]   dipsw_pio_external_connection_export,                                                    //                                               dipsw_pio_external_connection.export
		input  wire [2:0]   led_pio_external_connection_in_port,                                                     //                                                 led_pio_external_connection.in_port
		output wire [2:0]   led_pio_external_connection_out_port,                                                    //                                                                            .out_port
		input  wire         ddc_avst_sink_avst_sink_valid,                                                           //                                                               ddc_avst_sink.avst_sink_valid
		input  wire [7:0]   ddc_avst_sink_avst_sink_channel,                                                         //                                                                            .avst_sink_channel
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l1,                                                         //                                                                            .avst_sink_data_l1
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l2,                                                         //                                                                            .avst_sink_data_l2
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l3,                                                         //                                                                            .avst_sink_data_l3
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l4,                                                         //                                                                            .avst_sink_data_l4
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l5,                                                         //                                                                            .avst_sink_data_l5
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l6,                                                         //                                                                            .avst_sink_data_l6
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l7,                                                         //                                                                            .avst_sink_data_l7
		input  wire [31:0]  ddc_avst_sink_avst_sink_data_l8,                                                         //                                                                            .avst_sink_data_l8
		output wire         duc_avst_source_duc_avst_source_valid,                                                   //                                                             duc_avst_source.duc_avst_source_valid
		output wire [31:0]  duc_avst_source_duc_avst_source_data0,                                                   //                                                                            .duc_avst_source_data0
		output wire [31:0]  duc_avst_source_duc_avst_source_data1,                                                   //                                                                            .duc_avst_source_data1
		output wire [31:0]  duc_avst_source_duc_avst_source_data2,                                                   //                                                                            .duc_avst_source_data2
		output wire [31:0]  duc_avst_source_duc_avst_source_data3,                                                   //                                                                            .duc_avst_source_data3
		output wire [31:0]  duc_avst_source_duc_avst_source_data4,                                                   //                                                                            .duc_avst_source_data4
		output wire [31:0]  duc_avst_source_duc_avst_source_data5,                                                   //                                                                            .duc_avst_source_data5
		output wire [31:0]  duc_avst_source_duc_avst_source_data6,                                                   //                                                                            .duc_avst_source_data6
		output wire [31:0]  duc_avst_source_duc_avst_source_data7,                                                   //                                                                            .duc_avst_source_data7
		output wire [7:0]   duc_avst_source_duc_avst_source_channel,                                                 //                                                                            .duc_avst_source_channel
		input  wire         avst_tx_ptp_i_av_st_tx_skip_crc,                                                         //                                                                 avst_tx_ptp.i_av_st_tx_skip_crc
		input  wire [1:0]   avst_tx_ptp_i_av_st_tx_ptp_ts_valid,                                                     //                                                                            .i_av_st_tx_ptp_ts_valid
		input  wire         avst_tx_ptp_i_av_st_tx_ptp_ins_ets,                                                      //                                                                            .i_av_st_tx_ptp_ins_ets
		input  wire         avst_tx_ptp_i_av_st_tx_ptp_ins_cf,                                                       //                                                                            .i_av_st_tx_ptp_ins_cf
		input  wire [95:0]  avst_tx_ptp_i_av_st_tx_ptp_tx_its,                                                       //                                                                            .i_av_st_tx_ptp_tx_its
		input  wire [6:0]   avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx,                                                 //                                                                            .i_av_st_tx_ptp_asym_p2p_idx
		input  wire         avst_tx_ptp_i_av_st_tx_ptp_asym_sign,                                                    //                                                                            .i_av_st_tx_ptp_asym_sign
		input  wire         avst_tx_ptp_i_av_st_tx_ptp_asym,                                                         //                                                                            .i_av_st_tx_ptp_asym
		input  wire         avst_tx_ptp_i_av_st_tx_ptp_p2p,                                                          //                                                                            .i_av_st_tx_ptp_p2p
		input  wire         avst_tx_ptp_i_av_st_tx_ptp_ts_format,                                                    //                                                                            .i_av_st_tx_ptp_ts_format
		input  wire         avst_tx_ptp_i_av_st_tx_ptp_update_eb,                                                    //                                                                            .i_av_st_tx_ptp_update_eb
		input  wire         avst_tx_ptp_i_av_st_tx_ptp_zero_csum,                                                    //                                                                            .i_av_st_tx_ptp_zero_csum
		input  wire [15:0]  avst_tx_ptp_i_av_st_tx_ptp_eb_offset,                                                    //                                                                            .i_av_st_tx_ptp_eb_offset
		input  wire [15:0]  avst_tx_ptp_i_av_st_tx_ptp_csum_offset,                                                  //                                                                            .i_av_st_tx_ptp_csum_offset
		input  wire [15:0]  avst_tx_ptp_i_av_st_tx_ptp_cf_offset,                                                    //                                                                            .i_av_st_tx_ptp_cf_offset
		input  wire [15:0]  avst_tx_ptp_i_av_st_tx_ptp_ts_offset,                                                    //                                                                            .i_av_st_tx_ptp_ts_offset
		input  wire         avst_axist_bridge_0_axit_tx_if_tready,                                                   //                                              avst_axist_bridge_0_axit_tx_if.tready
		output wire         avst_axist_bridge_0_axit_tx_if_tvalid,                                                   //                                                                            .tvalid
		output wire [63:0]  avst_axist_bridge_0_axit_tx_if_tdata,                                                    //                                                                            .tdata
		output wire         avst_axist_bridge_0_axit_tx_if_tlast,                                                    //                                                                            .tlast
		output wire [7:0]   avst_axist_bridge_0_axit_tx_if_tkeep,                                                    //                                                                            .tkeep
		output wire [1:0]   avst_axist_bridge_0_axit_tx_if_tuser,                                                    //                                                                            .tuser
		output wire [93:0]  axist_tx_user_o_axi_st_tx_tuser_ptp,                                                     //                                                               axist_tx_user.o_axi_st_tx_tuser_ptp
		output wire [327:0] axist_tx_user_o_axi_st_tx_tuser_ptp_extended,                                            //                                                                            .o_axi_st_tx_tuser_ptp_extended
		output wire [39:0]  avst_rx_ptp_o_av_st_rxstatus_data,                                                       //                                                                 avst_rx_ptp.o_av_st_rxstatus_data
		output wire         avst_rx_ptp_o_av_st_rxstatus_valid,                                                      //                                                                            .o_av_st_rxstatus_valid
		output wire [95:0]  avst_rx_ptp_o_av_st_ptp_rx_its,                                                          //                                                                            .o_av_st_ptp_rx_its
		input  wire [4:0]   axist_rx_user_i_axi_st_rx_tuser_sts,                                                     //                                                               axist_rx_user.i_axi_st_rx_tuser_sts
		input  wire [31:0]  axist_rx_user_i_axi_st_rx_tuser_sts_extended,                                            //                                                                            .i_axi_st_rx_tuser_sts_extended
		input  wire [95:0]  axist_rx_user_i_axi_st_rx_ingrts0_tdata,                                                 //                                                                            .i_axi_st_rx_ingrts0_tdata
		input  wire         axist_rx_user_i_axi_st_rx_ingrts0_tvalid,                                                //                                                                            .i_axi_st_rx_ingrts0_tvalid
		output wire [21:0]  ptp_tod_concat_out_o_mac_ptp_fp,                                                         //                                                          ptp_tod_concat_out.o_mac_ptp_fp
		output wire         ptp_tod_concat_out_o_mac_ptp_ts_req,                                                     //                                                                            .o_mac_ptp_ts_req
		input  wire         ptp_tod_concat_out_i_mac_ptp_tx_ets_valid,                                               //                                                                            .i_mac_ptp_tx_ets_valid
		input  wire [95:0]  ptp_tod_concat_out_i_mac_ptp_tx_ets,                                                     //                                                                            .i_mac_ptp_tx_ets
		input  wire [21:0]  ptp_tod_concat_out_i_mac_ptp_tx_ets_fp,                                                  //                                                                            .i_mac_ptp_tx_ets_fp
		input  wire         ptp_tod_concat_out_i_mac_ptp_rx_its_valid,                                               //                                                                            .i_mac_ptp_rx_its_valid
		input  wire [95:0]  ptp_tod_concat_out_i_mac_ptp_rx_its,                                                     //                                                                            .i_mac_ptp_rx_its
		input  wire [19:0]  ptp_tod_concat_out_i_ext_ptp_fp,                                                         //                                                                            .i_ext_ptp_fp
		input  wire         ptp_tod_concat_out_i_ext_ptp_ts_req,                                                     //                                                                            .i_ext_ptp_ts_req
		output wire         ptp_tod_concat_out_o_ext_ptp_tx_ets_valid,                                               //                                                                            .o_ext_ptp_tx_ets_valid
		output wire [95:0]  ptp_tod_concat_out_o_ext_ptp_tx_ets,                                                     //                                                                            .o_ext_ptp_tx_ets
		output wire [19:0]  ptp_tod_concat_out_o_ext_ptp_tx_ets_fp,                                                  //                                                                            .o_ext_ptp_tx_ets_fp
		output wire [95:0]  ptp_tod_concat_out_o_ext_ptp_rx_its,                                                     //                                                                            .o_ext_ptp_rx_its
		output wire         ptp_tod_concat_out_o_ext_ptp_rx_its_valid,                                               //                                                                            .o_ext_ptp_rx_its_valid
		input  wire         phipps_peak_0_rx_pcs_ready_rx_pcs_ready,                                                 //                                                  phipps_peak_0_rx_pcs_ready.rx_pcs_ready
		input  wire         phipps_peak_0_tx_lanes_stable_tx_lanes_stable,                                           //                                               phipps_peak_0_tx_lanes_stable.tx_lanes_stable
		input  wire         phipps_peak_0_lphy_ss_top_0_pb_avst_sink_valid,                                          //                                    phipps_peak_0_lphy_ss_top_0_pb_avst_sink.valid
		input  wire [63:0]  phipps_peak_0_lphy_ss_top_0_pb_avst_sink_data,                                           //                                                                            .data
		output wire         phipps_peak_0_lphy_ss_top_0_pb_avst_sink_ready,                                          //                                                                            .ready
		output wire         phipps_peak_0_lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en_data,                            //                     phipps_peak_0_lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en.data
		input  wire         rst_dsp_in_reset_reset,                                                                  //                                                            rst_dsp_in_reset.reset
		input  wire         rst_eth_in_reset_reset,                                                                  //                                                            rst_eth_in_reset.reset
		input  wire         rst_csr_act_high_in_reset_reset,                                                         //                                                   rst_csr_act_high_in_reset.reset
		input  wire         rst_csr_in_reset_reset_n,                                                                //                                                            rst_csr_in_reset.reset_n
		input  wire         clk_100_clk,                                                                             //                                                                     clk_100.clk
		input  wire         dma_subsys_port0_rx_dma_resetn_reset_n,                                                  //                                      dma_subsys_port0_rx_dma_resetn_reset_n.reset_n
		input  wire         dma_subsys_port1_rx_dma_resetn_reset_n,                                                  //                                      dma_subsys_port1_rx_dma_resetn_reset_n.reset_n
		input  wire         qsys_top_master_todclk_0_in_clk_clk,                                                     //                                             qsys_top_master_todclk_0_in_clk.clk
		input  wire         reset_reset_n,                                                                           //                                                                       reset.reset_n
		output wire         ninit_done_ninit_done,                                                                   //                                                                  ninit_done.ninit_done
		input  wire         tod_timestamp_96b_0_pps_in_pps_in,                                                       //                                                  tod_timestamp_96b_0_pps_in.pps_in
		output wire         master_tod_top_0_pulse_per_second_pps,                                                   //                                           master_tod_top_0_pulse_per_second.pps
		input  wire         mtod_subsys_master_tod_top_0_i_upstr_pll_lock,                                           //                                    mtod_subsys_master_tod_top_0_i_upstr_pll.lock
		input  wire         mtod_subsys_pps_in_pulse_per_second,                                                     //                                                          mtod_subsys_pps_in.pulse_per_second
		input  wire [95:0]  tod_subsys_0_master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b_data,        // tod_subsys_0_master_tod_subsys_0_mtod_subsys_pps_load_tod_0_time_of_day_96b.data
		output wire [95:0]  tod_subsys_0_tod_slave_sub_system_0_master_tod_split_conduit_end_10_data,                //         tod_subsys_0_tod_slave_sub_system_0_master_tod_split_conduit_end_10.data
		output wire         tod_subsys_0_tod_slave_sub_system_0_master_tod_split_conduit_end_10_valid,               //                                                                            .valid
		output wire [95:0]  tod_subsys_0_tod_slave_port_8_tod_stack_tx_tod_interface_tdata,                          //                    tod_subsys_0_tod_slave_port_8_tod_stack_tx_tod_interface.tdata
		output wire         tod_subsys_0_tod_slave_port_8_tod_stack_tx_tod_interface_tvalid,                         //                                                                            .tvalid
		output wire [95:0]  tod_subsys_0_tod_slave_port_8_tod_stack_rx_tod_interface_tdata,                          //                    tod_subsys_0_tod_slave_port_8_tod_stack_rx_tod_interface.tdata
		output wire         tod_subsys_0_tod_slave_port_8_tod_stack_rx_tod_interface_tvalid,                         //                                                                            .tvalid
		input  wire         tod_slave_subsys_port_8_tod_stack_tx_pll_locked_lock                                     //                             tod_slave_subsys_port_8_tod_stack_tx_pll_locked.lock
	);
endmodule

