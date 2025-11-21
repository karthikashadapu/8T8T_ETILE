module hps_sub_sys (
		input  wire         acp_0_clock_clk,                           //                  acp_0_clock.clk
		input  wire         acp_0_reset_reset,                         //                  acp_0_reset.reset
		input  wire         acp_0_csr_clock_clk,                       //              acp_0_csr_clock.clk
		input  wire         acp_0_csr_reset_reset,                     //              acp_0_csr_reset.reset
		input  wire         acp_0_csr_address,                         //                    acp_0_csr.address
		input  wire         acp_0_csr_read,                            //                             .read
		input  wire         acp_0_csr_write,                           //                             .write
		input  wire [31:0]  acp_0_csr_writedata,                       //                             .writedata
		output wire [31:0]  acp_0_csr_readdata,                        //                             .readdata
		input  wire [36:0]  acp_0_s0_araddr,                           //                     acp_0_s0.araddr
		input  wire [1:0]   acp_0_s0_arburst,                          //                             .arburst
		input  wire [3:0]   acp_0_s0_arcache,                          //                             .arcache
		input  wire [3:0]   acp_0_s0_arid,                             //                             .arid
		input  wire [7:0]   acp_0_s0_arlen,                            //                             .arlen
		input  wire         acp_0_s0_arlock,                           //                             .arlock
		input  wire [2:0]   acp_0_s0_arprot,                           //                             .arprot
		output wire         acp_0_s0_arready,                          //                             .arready
		input  wire [2:0]   acp_0_s0_arsize,                           //                             .arsize
		input  wire         acp_0_s0_arvalid,                          //                             .arvalid
		input  wire [36:0]  acp_0_s0_awaddr,                           //                             .awaddr
		input  wire [1:0]   acp_0_s0_awburst,                          //                             .awburst
		input  wire [3:0]   acp_0_s0_awcache,                          //                             .awcache
		input  wire [3:0]   acp_0_s0_awid,                             //                             .awid
		input  wire [7:0]   acp_0_s0_awlen,                            //                             .awlen
		input  wire         acp_0_s0_awlock,                           //                             .awlock
		input  wire [2:0]   acp_0_s0_awprot,                           //                             .awprot
		output wire         acp_0_s0_awready,                          //                             .awready
		input  wire [2:0]   acp_0_s0_awsize,                           //                             .awsize
		input  wire         acp_0_s0_awvalid,                          //                             .awvalid
		output wire [3:0]   acp_0_s0_bid,                              //                             .bid
		input  wire         acp_0_s0_bready,                           //                             .bready
		output wire [1:0]   acp_0_s0_bresp,                            //                             .bresp
		output wire         acp_0_s0_bvalid,                           //                             .bvalid
		output wire [511:0] acp_0_s0_rdata,                            //                             .rdata
		output wire [3:0]   acp_0_s0_rid,                              //                             .rid
		output wire         acp_0_s0_rlast,                            //                             .rlast
		input  wire         acp_0_s0_rready,                           //                             .rready
		output wire [1:0]   acp_0_s0_rresp,                            //                             .rresp
		output wire         acp_0_s0_rvalid,                           //                             .rvalid
		input  wire [511:0] acp_0_s0_wdata,                            //                             .wdata
		input  wire         acp_0_s0_wlast,                            //                             .wlast
		output wire         acp_0_s0_wready,                           //                             .wready
		input  wire [63:0]  acp_0_s0_wstrb,                            //                             .wstrb
		input  wire         acp_0_s0_wvalid,                           //                             .wvalid
		input  wire [43:0]  agilex_hps_f2h_stm_hw_events_stm_hwevents, // agilex_hps_f2h_stm_hw_events.stm_hwevents
		input  wire         agilex_hps_h2f_cs_ntrst,                   //            agilex_hps_h2f_cs.ntrst
		input  wire         agilex_hps_h2f_cs_tck,                     //                             .tck
		input  wire         agilex_hps_h2f_cs_tdi,                     //                             .tdi
		output wire         agilex_hps_h2f_cs_tdo,                     //                             .tdo
		output wire         agilex_hps_h2f_cs_tdoen,                   //                             .tdoen
		input  wire         agilex_hps_h2f_cs_tms,                     //                             .tms
		output wire         agilex_hps_hps_io_EMAC1_TX_CLK,            //            agilex_hps_hps_io.EMAC1_TX_CLK
		output wire         agilex_hps_hps_io_EMAC1_TXD0,              //                             .EMAC1_TXD0
		output wire         agilex_hps_hps_io_EMAC1_TXD1,              //                             .EMAC1_TXD1
		output wire         agilex_hps_hps_io_EMAC1_TXD2,              //                             .EMAC1_TXD2
		output wire         agilex_hps_hps_io_EMAC1_TXD3,              //                             .EMAC1_TXD3
		input  wire         agilex_hps_hps_io_EMAC1_RX_CTL,            //                             .EMAC1_RX_CTL
		output wire         agilex_hps_hps_io_EMAC1_TX_CTL,            //                             .EMAC1_TX_CTL
		input  wire         agilex_hps_hps_io_EMAC1_RX_CLK,            //                             .EMAC1_RX_CLK
		input  wire         agilex_hps_hps_io_EMAC1_RXD0,              //                             .EMAC1_RXD0
		input  wire         agilex_hps_hps_io_EMAC1_RXD1,              //                             .EMAC1_RXD1
		input  wire         agilex_hps_hps_io_EMAC1_RXD2,              //                             .EMAC1_RXD2
		input  wire         agilex_hps_hps_io_EMAC1_RXD3,              //                             .EMAC1_RXD3
		inout  wire         agilex_hps_hps_io_EMAC1_MDIO,              //                             .EMAC1_MDIO
		output wire         agilex_hps_hps_io_EMAC1_MDC,               //                             .EMAC1_MDC
		inout  wire         agilex_hps_hps_io_SDMMC_CMD,               //                             .SDMMC_CMD
		inout  wire         agilex_hps_hps_io_SDMMC_D0,                //                             .SDMMC_D0
		inout  wire         agilex_hps_hps_io_SDMMC_D1,                //                             .SDMMC_D1
		inout  wire         agilex_hps_hps_io_SDMMC_D2,                //                             .SDMMC_D2
		inout  wire         agilex_hps_hps_io_SDMMC_D3,                //                             .SDMMC_D3
		inout  wire         agilex_hps_hps_io_SDMMC_D4,                //                             .SDMMC_D4
		inout  wire         agilex_hps_hps_io_SDMMC_D5,                //                             .SDMMC_D5
		inout  wire         agilex_hps_hps_io_SDMMC_D6,                //                             .SDMMC_D6
		inout  wire         agilex_hps_hps_io_SDMMC_D7,                //                             .SDMMC_D7
		output wire         agilex_hps_hps_io_SDMMC_CCLK,              //                             .SDMMC_CCLK
		output wire         agilex_hps_hps_io_SPIM0_CLK,               //                             .SPIM0_CLK
		output wire         agilex_hps_hps_io_SPIM0_MOSI,              //                             .SPIM0_MOSI
		input  wire         agilex_hps_hps_io_SPIM0_MISO,              //                             .SPIM0_MISO
		output wire         agilex_hps_hps_io_SPIM0_SS0_N,             //                             .SPIM0_SS0_N
		output wire         agilex_hps_hps_io_SPIM1_CLK,               //                             .SPIM1_CLK
		output wire         agilex_hps_hps_io_SPIM1_MOSI,              //                             .SPIM1_MOSI
		input  wire         agilex_hps_hps_io_SPIM1_MISO,              //                             .SPIM1_MISO
		output wire         agilex_hps_hps_io_SPIM1_SS0_N,             //                             .SPIM1_SS0_N
		output wire         agilex_hps_hps_io_SPIM1_SS1_N,             //                             .SPIM1_SS1_N
		input  wire         agilex_hps_hps_io_UART1_RX,                //                             .UART1_RX
		output wire         agilex_hps_hps_io_UART1_TX,                //                             .UART1_TX
		inout  wire         agilex_hps_hps_io_I2C1_SDA,                //                             .I2C1_SDA
		inout  wire         agilex_hps_hps_io_I2C1_SCL,                //                             .I2C1_SCL
		input  wire         agilex_hps_hps_io_hps_osc_clk,             //                             .hps_osc_clk
		inout  wire         agilex_hps_hps_io_gpio0_io11,              //                             .gpio0_io11
		inout  wire         agilex_hps_hps_io_gpio0_io12,              //                             .gpio0_io12
		inout  wire         agilex_hps_hps_io_gpio0_io13,              //                             .gpio0_io13
		inout  wire         agilex_hps_hps_io_gpio0_io14,              //                             .gpio0_io14
		inout  wire         agilex_hps_hps_io_gpio0_io15,              //                             .gpio0_io15
		inout  wire         agilex_hps_hps_io_gpio0_io16,              //                             .gpio0_io16
		inout  wire         agilex_hps_hps_io_gpio0_io17,              //                             .gpio0_io17
		inout  wire         agilex_hps_hps_io_gpio0_io18,              //                             .gpio0_io18
		inout  wire         agilex_hps_hps_io_gpio1_io16,              //                             .gpio1_io16
		inout  wire         agilex_hps_hps_io_gpio1_io17,              //                             .gpio1_io17
		output wire         agilex_hps_h2f_reset_reset,                //         agilex_hps_h2f_reset.reset
		input  wire         agilex_hps_h2f_axi_clock_clk,              //     agilex_hps_h2f_axi_clock.clk
		input  wire         agilex_hps_h2f_axi_reset_reset_n,          //     agilex_hps_h2f_axi_reset.reset_n
		output wire [3:0]   agilex_hps_h2f_axi_master_awid,            //    agilex_hps_h2f_axi_master.awid
		output wire [31:0]  agilex_hps_h2f_axi_master_awaddr,          //                             .awaddr
		output wire [7:0]   agilex_hps_h2f_axi_master_awlen,           //                             .awlen
		output wire [2:0]   agilex_hps_h2f_axi_master_awsize,          //                             .awsize
		output wire [1:0]   agilex_hps_h2f_axi_master_awburst,         //                             .awburst
		output wire         agilex_hps_h2f_axi_master_awlock,          //                             .awlock
		output wire [3:0]   agilex_hps_h2f_axi_master_awcache,         //                             .awcache
		output wire [2:0]   agilex_hps_h2f_axi_master_awprot,          //                             .awprot
		output wire         agilex_hps_h2f_axi_master_awvalid,         //                             .awvalid
		input  wire         agilex_hps_h2f_axi_master_awready,         //                             .awready
		output wire [127:0] agilex_hps_h2f_axi_master_wdata,           //                             .wdata
		output wire [15:0]  agilex_hps_h2f_axi_master_wstrb,           //                             .wstrb
		output wire         agilex_hps_h2f_axi_master_wlast,           //                             .wlast
		output wire         agilex_hps_h2f_axi_master_wvalid,          //                             .wvalid
		input  wire         agilex_hps_h2f_axi_master_wready,          //                             .wready
		input  wire [3:0]   agilex_hps_h2f_axi_master_bid,             //                             .bid
		input  wire [1:0]   agilex_hps_h2f_axi_master_bresp,           //                             .bresp
		input  wire         agilex_hps_h2f_axi_master_bvalid,          //                             .bvalid
		output wire         agilex_hps_h2f_axi_master_bready,          //                             .bready
		output wire [3:0]   agilex_hps_h2f_axi_master_arid,            //                             .arid
		output wire [31:0]  agilex_hps_h2f_axi_master_araddr,          //                             .araddr
		output wire [7:0]   agilex_hps_h2f_axi_master_arlen,           //                             .arlen
		output wire [2:0]   agilex_hps_h2f_axi_master_arsize,          //                             .arsize
		output wire [1:0]   agilex_hps_h2f_axi_master_arburst,         //                             .arburst
		output wire         agilex_hps_h2f_axi_master_arlock,          //                             .arlock
		output wire [3:0]   agilex_hps_h2f_axi_master_arcache,         //                             .arcache
		output wire [2:0]   agilex_hps_h2f_axi_master_arprot,          //                             .arprot
		output wire         agilex_hps_h2f_axi_master_arvalid,         //                             .arvalid
		input  wire         agilex_hps_h2f_axi_master_arready,         //                             .arready
		input  wire [3:0]   agilex_hps_h2f_axi_master_rid,             //                             .rid
		input  wire [127:0] agilex_hps_h2f_axi_master_rdata,           //                             .rdata
		input  wire [1:0]   agilex_hps_h2f_axi_master_rresp,           //                             .rresp
		input  wire         agilex_hps_h2f_axi_master_rlast,           //                             .rlast
		input  wire         agilex_hps_h2f_axi_master_rvalid,          //                             .rvalid
		output wire         agilex_hps_h2f_axi_master_rready,          //                             .rready
		input  wire         agilex_hps_h2f_lw_axi_clock_clk,           //  agilex_hps_h2f_lw_axi_clock.clk
		input  wire         agilex_hps_h2f_lw_axi_reset_reset_n,       //  agilex_hps_h2f_lw_axi_reset.reset_n
		output wire [3:0]   agilex_hps_h2f_lw_axi_master_awid,         // agilex_hps_h2f_lw_axi_master.awid
		output wire [20:0]  agilex_hps_h2f_lw_axi_master_awaddr,       //                             .awaddr
		output wire [7:0]   agilex_hps_h2f_lw_axi_master_awlen,        //                             .awlen
		output wire [2:0]   agilex_hps_h2f_lw_axi_master_awsize,       //                             .awsize
		output wire [1:0]   agilex_hps_h2f_lw_axi_master_awburst,      //                             .awburst
		output wire         agilex_hps_h2f_lw_axi_master_awlock,       //                             .awlock
		output wire [3:0]   agilex_hps_h2f_lw_axi_master_awcache,      //                             .awcache
		output wire [2:0]   agilex_hps_h2f_lw_axi_master_awprot,       //                             .awprot
		output wire         agilex_hps_h2f_lw_axi_master_awvalid,      //                             .awvalid
		input  wire         agilex_hps_h2f_lw_axi_master_awready,      //                             .awready
		output wire [31:0]  agilex_hps_h2f_lw_axi_master_wdata,        //                             .wdata
		output wire [3:0]   agilex_hps_h2f_lw_axi_master_wstrb,        //                             .wstrb
		output wire         agilex_hps_h2f_lw_axi_master_wlast,        //                             .wlast
		output wire         agilex_hps_h2f_lw_axi_master_wvalid,       //                             .wvalid
		input  wire         agilex_hps_h2f_lw_axi_master_wready,       //                             .wready
		input  wire [3:0]   agilex_hps_h2f_lw_axi_master_bid,          //                             .bid
		input  wire [1:0]   agilex_hps_h2f_lw_axi_master_bresp,        //                             .bresp
		input  wire         agilex_hps_h2f_lw_axi_master_bvalid,       //                             .bvalid
		output wire         agilex_hps_h2f_lw_axi_master_bready,       //                             .bready
		output wire [3:0]   agilex_hps_h2f_lw_axi_master_arid,         //                             .arid
		output wire [20:0]  agilex_hps_h2f_lw_axi_master_araddr,       //                             .araddr
		output wire [7:0]   agilex_hps_h2f_lw_axi_master_arlen,        //                             .arlen
		output wire [2:0]   agilex_hps_h2f_lw_axi_master_arsize,       //                             .arsize
		output wire [1:0]   agilex_hps_h2f_lw_axi_master_arburst,      //                             .arburst
		output wire         agilex_hps_h2f_lw_axi_master_arlock,       //                             .arlock
		output wire [3:0]   agilex_hps_h2f_lw_axi_master_arcache,      //                             .arcache
		output wire [2:0]   agilex_hps_h2f_lw_axi_master_arprot,       //                             .arprot
		output wire         agilex_hps_h2f_lw_axi_master_arvalid,      //                             .arvalid
		input  wire         agilex_hps_h2f_lw_axi_master_arready,      //                             .arready
		input  wire [3:0]   agilex_hps_h2f_lw_axi_master_rid,          //                             .rid
		input  wire [31:0]  agilex_hps_h2f_lw_axi_master_rdata,        //                             .rdata
		input  wire [1:0]   agilex_hps_h2f_lw_axi_master_rresp,        //                             .rresp
		input  wire         agilex_hps_h2f_lw_axi_master_rlast,        //                             .rlast
		input  wire         agilex_hps_h2f_lw_axi_master_rvalid,       //                             .rvalid
		output wire         agilex_hps_h2f_lw_axi_master_rready,       //                             .rready
		input  wire         agilex_hps_f2h_axi_clock_clk,              //     agilex_hps_f2h_axi_clock.clk
		input  wire         agilex_hps_f2h_axi_reset_reset_n,          //     agilex_hps_f2h_axi_reset.reset_n
		input  wire [31:0]  agilex_hps_f2h_irq0_irq,                   //          agilex_hps_f2h_irq0.irq
		input  wire [31:0]  agilex_hps_f2h_irq1_irq,                   //          agilex_hps_f2h_irq1.irq
		input  wire         emif_hps_pll_ref_clk_clk,                  //         emif_hps_pll_ref_clk.clk
		input  wire         emif_hps_oct_oct_rzqin,                    //                 emif_hps_oct.oct_rzqin
		output wire [0:0]   emif_hps_mem_mem_ck,                       //                 emif_hps_mem.mem_ck
		output wire [0:0]   emif_hps_mem_mem_ck_n,                     //                             .mem_ck_n
		output wire [16:0]  emif_hps_mem_mem_a,                        //                             .mem_a
		output wire [0:0]   emif_hps_mem_mem_act_n,                    //                             .mem_act_n
		output wire [1:0]   emif_hps_mem_mem_ba,                       //                             .mem_ba
		output wire [0:0]   emif_hps_mem_mem_bg,                       //                             .mem_bg
		output wire [0:0]   emif_hps_mem_mem_cke,                      //                             .mem_cke
		output wire [1:0]   emif_hps_mem_mem_cs_n,                     //                             .mem_cs_n
		output wire [0:0]   emif_hps_mem_mem_odt,                      //                             .mem_odt
		output wire [0:0]   emif_hps_mem_mem_reset_n,                  //                             .mem_reset_n
		output wire [0:0]   emif_hps_mem_mem_par,                      //                             .mem_par
		input  wire [0:0]   emif_hps_mem_mem_alert_n,                  //                             .mem_alert_n
		inout  wire [8:0]   emif_hps_mem_mem_dqs,                      //                             .mem_dqs
		inout  wire [8:0]   emif_hps_mem_mem_dqs_n,                    //                             .mem_dqs_n
		inout  wire [71:0]  emif_hps_mem_mem_dq,                       //                             .mem_dq
		inout  wire [8:0]   emif_hps_mem_mem_dbi_n                     //                             .mem_dbi_n
	);
endmodule

