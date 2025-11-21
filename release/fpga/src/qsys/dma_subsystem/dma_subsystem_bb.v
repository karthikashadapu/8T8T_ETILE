module dma_subsystem (
		output wire         acp_bridge_in_clk_clk,                                                        //                                                acp_bridge_in_clk.clk
		input  wire         dma_clk_100_in_clk_clk,                                                       //                                               dma_clk_100_in_clk.clk
		output wire         dma_clk_out_bridge_0_out_clk_clk,                                             //                                     dma_clk_out_bridge_0_out_clk.clk
		input  wire         dma_rst_100_in_reset_reset,                                                   //                                             dma_rst_100_in_reset.reset
		input  wire         dma_ss_master_m0_waitrequest,                                                 //                                                 dma_ss_master_m0.waitrequest
		input  wire [511:0] dma_ss_master_m0_readdata,                                                    //                                                                 .readdata
		input  wire         dma_ss_master_m0_readdatavalid,                                               //                                                                 .readdatavalid
		input  wire [1:0]   dma_ss_master_m0_response,                                                    //                                                                 .response
		output wire [4:0]   dma_ss_master_m0_burstcount,                                                  //                                                                 .burstcount
		output wire [511:0] dma_ss_master_m0_writedata,                                                   //                                                                 .writedata
		output wire [36:0]  dma_ss_master_m0_address,                                                     //                                                                 .address
		output wire         dma_ss_master_m0_write,                                                       //                                                                 .write
		output wire         dma_ss_master_m0_read,                                                        //                                                                 .read
		output wire [63:0]  dma_ss_master_m0_byteenable,                                                  //                                                                 .byteenable
		output wire         dma_ss_master_m0_debugaccess,                                                 //                                                                 .debugaccess
		input  wire         dma_ss_master_m0_writeresponsevalid,                                          //                                                                 .writeresponsevalid
		input  wire [29:0]  ext_hps_m_master_windowed_slave_address,                                      //                                  ext_hps_m_master_windowed_slave.address
		input  wire         ext_hps_m_master_windowed_slave_read,                                         //                                                                 .read
		output wire [31:0]  ext_hps_m_master_windowed_slave_readdata,                                     //                                                                 .readdata
		input  wire         ext_hps_m_master_windowed_slave_write,                                        //                                                                 .write
		input  wire [31:0]  ext_hps_m_master_windowed_slave_writedata,                                    //                                                                 .writedata
		output wire         ext_hps_m_master_windowed_slave_readdatavalid,                                //                                                                 .readdatavalid
		output wire         ext_hps_m_master_windowed_slave_waitrequest,                                  //                                                                 .waitrequest
		input  wire [3:0]   ext_hps_m_master_windowed_slave_byteenable,                                   //                                                                 .byteenable
		input  wire [0:0]   ext_hps_m_master_windowed_slave_burstcount,                                   //                                                                 .burstcount
		output wire [36:0]  ext_hps_m_master_expanded_master_address,                                     //                                 ext_hps_m_master_expanded_master.address
		output wire         ext_hps_m_master_expanded_master_read,                                        //                                                                 .read
		input  wire         ext_hps_m_master_expanded_master_waitrequest,                                 //                                                                 .waitrequest
		input  wire [31:0]  ext_hps_m_master_expanded_master_readdata,                                    //                                                                 .readdata
		output wire         ext_hps_m_master_expanded_master_write,                                       //                                                                 .write
		output wire [31:0]  ext_hps_m_master_expanded_master_writedata,                                   //                                                                 .writedata
		input  wire         ext_hps_m_master_expanded_master_readdatavalid,                               //                                                                 .readdatavalid
		output wire [3:0]   ext_hps_m_master_expanded_master_byteenable,                                  //                                                                 .byteenable
		output wire [0:0]   ext_hps_m_master_expanded_master_burstcount,                                  //                                                                 .burstcount
		input  wire         oclk_pll_port8_in_clk_clk,                                                    //                                            oclk_pll_port8_in_clk.clk
		input  wire         rx_dma_reset_bridge_0_in_reset_reset_n,                                       //                                   rx_dma_reset_bridge_0_in_reset.reset_n
		input  wire         rx_dma_reset_bridge_1_in_reset_reset_n,                                       //                                   rx_dma_reset_bridge_1_in_reset.reset_n
		output wire         subsys_ftile_25gbe_1588_dmaclkout_reset_out_reset_reset_n,                    //                subsys_ftile_25gbe_1588_dmaclkout_reset_out_reset.reset_n
		input  wire         ninit_done_reset,                                                             //                                                       ninit_done.reset
		output wire         dma_subsys_port8_csr_waitrequest,                                             //                                             dma_subsys_port8_csr.waitrequest
		output wire [31:0]  dma_subsys_port8_csr_readdata,                                                //                                                                 .readdata
		output wire         dma_subsys_port8_csr_readdatavalid,                                           //                                                                 .readdatavalid
		input  wire [0:0]   dma_subsys_port8_csr_burstcount,                                              //                                                                 .burstcount
		input  wire [31:0]  dma_subsys_port8_csr_writedata,                                               //                                                                 .writedata
		input  wire [7:0]   dma_subsys_port8_csr_address,                                                 //                                                                 .address
		input  wire         dma_subsys_port8_csr_write,                                                   //                                                                 .write
		input  wire         dma_subsys_port8_csr_read,                                                    //                                                                 .read
		input  wire [3:0]   dma_subsys_port8_csr_byteenable,                                              //                                                                 .byteenable
		input  wire         dma_subsys_port8_csr_debugaccess,                                             //                                                                 .debugaccess
		input  wire         dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_startofpacket,                  //                    dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin.startofpacket
		input  wire         dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_valid,                          //                                                                 .valid
		input  wire         dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_endofpacket,                    //                                                                 .endofpacket
		input  wire [63:0]  dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_data,                           //                                                                 .data
		input  wire [2:0]   dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_empty,                          //                                                                 .empty
		input  wire [5:0]   dma_subsys_port8_ftile_25gbe_rx_dma_ch1_pktin_error,                          //                                                                 .error
		input  wire         dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_valid,            //      dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts.valid
		input  wire [95:0]  dma_subsys_port8_ftile_25gbe_rx_dma_ch1_rx_dma_fifo_0_in_ts_data,             //                                                                 .data
		output wire         dma_subsys_port8_rx_dma_ch1_irq_irq,                                          //                                  dma_subsys_port8_rx_dma_ch1_irq.irq
		input  wire [0:0]   dma_subsys_port8_ts_chs_compl_0_clk_bus_in_clk,                               //                       dma_subsys_port8_ts_chs_compl_0_clk_bus_in.clk
		input  wire [0:0]   dma_subsys_port8_ts_chs_compl_0_rst_bus_in_reset,                             //                       dma_subsys_port8_ts_chs_compl_0_rst_bus_in.reset
		input  wire [0:0]   dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_valid,            //      dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts.valid
		input  wire [19:0]  dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_fingerprint,      //                                                                 .fingerprint
		input  wire [95:0]  dma_subsys_port8_ftile_25gbe_tx_dma_ch1_ts_chs_compl_0_i_ts_data,             //                                                                 .data
		input  wire         dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_ready,           //     dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st.ready
		output wire         dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_startofpacket,   //                                                                 .startofpacket
		output wire         dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_valid,           //                                                                 .valid
		output wire         dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_endofpacket,     //                                                                 .endofpacket
		output wire [63:0]  dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_data,            //                                                                 .data
		output wire [2:0]   dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_empty,           //                                                                 .empty
		output wire [0:0]   dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_st_error,           //                                                                 .error
		output wire         dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_valid,       // dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req.valid
		output wire [19:0]  dma_subsys_port8_ftile_25gbe_tx_dma_ch1_tx_dma_fifo_0_out_ts_req_fingerprint, //                                                                 .fingerprint
		output wire         dma_subsys_port8_tx_dma_ch1_irq_irq                                           //                                  dma_subsys_port8_tx_dma_ch1_irq.irq
	);
endmodule

