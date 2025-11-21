	component hps_sub_sys is
		port (
			acp_0_clock_clk                           : in    std_logic                      := 'X';             -- clk
			acp_0_reset_reset                         : in    std_logic                      := 'X';             -- reset
			acp_0_csr_clock_clk                       : in    std_logic                      := 'X';             -- clk
			acp_0_csr_reset_reset                     : in    std_logic                      := 'X';             -- reset
			acp_0_csr_address                         : in    std_logic                      := 'X';             -- address
			acp_0_csr_read                            : in    std_logic                      := 'X';             -- read
			acp_0_csr_write                           : in    std_logic                      := 'X';             -- write
			acp_0_csr_writedata                       : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			acp_0_csr_readdata                        : out   std_logic_vector(31 downto 0);                     -- readdata
			acp_0_s0_araddr                           : in    std_logic_vector(36 downto 0)  := (others => 'X'); -- araddr
			acp_0_s0_arburst                          : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- arburst
			acp_0_s0_arcache                          : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- arcache
			acp_0_s0_arid                             : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- arid
			acp_0_s0_arlen                            : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- arlen
			acp_0_s0_arlock                           : in    std_logic                      := 'X';             -- arlock
			acp_0_s0_arprot                           : in    std_logic_vector(2 downto 0)   := (others => 'X'); -- arprot
			acp_0_s0_arready                          : out   std_logic;                                         -- arready
			acp_0_s0_arsize                           : in    std_logic_vector(2 downto 0)   := (others => 'X'); -- arsize
			acp_0_s0_arvalid                          : in    std_logic                      := 'X';             -- arvalid
			acp_0_s0_awaddr                           : in    std_logic_vector(36 downto 0)  := (others => 'X'); -- awaddr
			acp_0_s0_awburst                          : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- awburst
			acp_0_s0_awcache                          : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- awcache
			acp_0_s0_awid                             : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- awid
			acp_0_s0_awlen                            : in    std_logic_vector(7 downto 0)   := (others => 'X'); -- awlen
			acp_0_s0_awlock                           : in    std_logic                      := 'X';             -- awlock
			acp_0_s0_awprot                           : in    std_logic_vector(2 downto 0)   := (others => 'X'); -- awprot
			acp_0_s0_awready                          : out   std_logic;                                         -- awready
			acp_0_s0_awsize                           : in    std_logic_vector(2 downto 0)   := (others => 'X'); -- awsize
			acp_0_s0_awvalid                          : in    std_logic                      := 'X';             -- awvalid
			acp_0_s0_bid                              : out   std_logic_vector(3 downto 0);                      -- bid
			acp_0_s0_bready                           : in    std_logic                      := 'X';             -- bready
			acp_0_s0_bresp                            : out   std_logic_vector(1 downto 0);                      -- bresp
			acp_0_s0_bvalid                           : out   std_logic;                                         -- bvalid
			acp_0_s0_rdata                            : out   std_logic_vector(511 downto 0);                    -- rdata
			acp_0_s0_rid                              : out   std_logic_vector(3 downto 0);                      -- rid
			acp_0_s0_rlast                            : out   std_logic;                                         -- rlast
			acp_0_s0_rready                           : in    std_logic                      := 'X';             -- rready
			acp_0_s0_rresp                            : out   std_logic_vector(1 downto 0);                      -- rresp
			acp_0_s0_rvalid                           : out   std_logic;                                         -- rvalid
			acp_0_s0_wdata                            : in    std_logic_vector(511 downto 0) := (others => 'X'); -- wdata
			acp_0_s0_wlast                            : in    std_logic                      := 'X';             -- wlast
			acp_0_s0_wready                           : out   std_logic;                                         -- wready
			acp_0_s0_wstrb                            : in    std_logic_vector(63 downto 0)  := (others => 'X'); -- wstrb
			acp_0_s0_wvalid                           : in    std_logic                      := 'X';             -- wvalid
			agilex_hps_f2h_stm_hw_events_stm_hwevents : in    std_logic_vector(43 downto 0)  := (others => 'X'); -- stm_hwevents
			agilex_hps_h2f_cs_ntrst                   : in    std_logic                      := 'X';             -- ntrst
			agilex_hps_h2f_cs_tck                     : in    std_logic                      := 'X';             -- tck
			agilex_hps_h2f_cs_tdi                     : in    std_logic                      := 'X';             -- tdi
			agilex_hps_h2f_cs_tdo                     : out   std_logic;                                         -- tdo
			agilex_hps_h2f_cs_tdoen                   : out   std_logic;                                         -- tdoen
			agilex_hps_h2f_cs_tms                     : in    std_logic                      := 'X';             -- tms
			agilex_hps_hps_io_EMAC1_TX_CLK            : out   std_logic;                                         -- EMAC1_TX_CLK
			agilex_hps_hps_io_EMAC1_TXD0              : out   std_logic;                                         -- EMAC1_TXD0
			agilex_hps_hps_io_EMAC1_TXD1              : out   std_logic;                                         -- EMAC1_TXD1
			agilex_hps_hps_io_EMAC1_TXD2              : out   std_logic;                                         -- EMAC1_TXD2
			agilex_hps_hps_io_EMAC1_TXD3              : out   std_logic;                                         -- EMAC1_TXD3
			agilex_hps_hps_io_EMAC1_RX_CTL            : in    std_logic                      := 'X';             -- EMAC1_RX_CTL
			agilex_hps_hps_io_EMAC1_TX_CTL            : out   std_logic;                                         -- EMAC1_TX_CTL
			agilex_hps_hps_io_EMAC1_RX_CLK            : in    std_logic                      := 'X';             -- EMAC1_RX_CLK
			agilex_hps_hps_io_EMAC1_RXD0              : in    std_logic                      := 'X';             -- EMAC1_RXD0
			agilex_hps_hps_io_EMAC1_RXD1              : in    std_logic                      := 'X';             -- EMAC1_RXD1
			agilex_hps_hps_io_EMAC1_RXD2              : in    std_logic                      := 'X';             -- EMAC1_RXD2
			agilex_hps_hps_io_EMAC1_RXD3              : in    std_logic                      := 'X';             -- EMAC1_RXD3
			agilex_hps_hps_io_EMAC1_MDIO              : inout std_logic                      := 'X';             -- EMAC1_MDIO
			agilex_hps_hps_io_EMAC1_MDC               : out   std_logic;                                         -- EMAC1_MDC
			agilex_hps_hps_io_SDMMC_CMD               : inout std_logic                      := 'X';             -- SDMMC_CMD
			agilex_hps_hps_io_SDMMC_D0                : inout std_logic                      := 'X';             -- SDMMC_D0
			agilex_hps_hps_io_SDMMC_D1                : inout std_logic                      := 'X';             -- SDMMC_D1
			agilex_hps_hps_io_SDMMC_D2                : inout std_logic                      := 'X';             -- SDMMC_D2
			agilex_hps_hps_io_SDMMC_D3                : inout std_logic                      := 'X';             -- SDMMC_D3
			agilex_hps_hps_io_SDMMC_D4                : inout std_logic                      := 'X';             -- SDMMC_D4
			agilex_hps_hps_io_SDMMC_D5                : inout std_logic                      := 'X';             -- SDMMC_D5
			agilex_hps_hps_io_SDMMC_D6                : inout std_logic                      := 'X';             -- SDMMC_D6
			agilex_hps_hps_io_SDMMC_D7                : inout std_logic                      := 'X';             -- SDMMC_D7
			agilex_hps_hps_io_SDMMC_CCLK              : out   std_logic;                                         -- SDMMC_CCLK
			agilex_hps_hps_io_SPIM0_CLK               : out   std_logic;                                         -- SPIM0_CLK
			agilex_hps_hps_io_SPIM0_MOSI              : out   std_logic;                                         -- SPIM0_MOSI
			agilex_hps_hps_io_SPIM0_MISO              : in    std_logic                      := 'X';             -- SPIM0_MISO
			agilex_hps_hps_io_SPIM0_SS0_N             : out   std_logic;                                         -- SPIM0_SS0_N
			agilex_hps_hps_io_SPIM1_CLK               : out   std_logic;                                         -- SPIM1_CLK
			agilex_hps_hps_io_SPIM1_MOSI              : out   std_logic;                                         -- SPIM1_MOSI
			agilex_hps_hps_io_SPIM1_MISO              : in    std_logic                      := 'X';             -- SPIM1_MISO
			agilex_hps_hps_io_SPIM1_SS0_N             : out   std_logic;                                         -- SPIM1_SS0_N
			agilex_hps_hps_io_SPIM1_SS1_N             : out   std_logic;                                         -- SPIM1_SS1_N
			agilex_hps_hps_io_UART1_RX                : in    std_logic                      := 'X';             -- UART1_RX
			agilex_hps_hps_io_UART1_TX                : out   std_logic;                                         -- UART1_TX
			agilex_hps_hps_io_I2C1_SDA                : inout std_logic                      := 'X';             -- I2C1_SDA
			agilex_hps_hps_io_I2C1_SCL                : inout std_logic                      := 'X';             -- I2C1_SCL
			agilex_hps_hps_io_hps_osc_clk             : in    std_logic                      := 'X';             -- hps_osc_clk
			agilex_hps_hps_io_gpio0_io11              : inout std_logic                      := 'X';             -- gpio0_io11
			agilex_hps_hps_io_gpio0_io12              : inout std_logic                      := 'X';             -- gpio0_io12
			agilex_hps_hps_io_gpio0_io13              : inout std_logic                      := 'X';             -- gpio0_io13
			agilex_hps_hps_io_gpio0_io14              : inout std_logic                      := 'X';             -- gpio0_io14
			agilex_hps_hps_io_gpio0_io15              : inout std_logic                      := 'X';             -- gpio0_io15
			agilex_hps_hps_io_gpio0_io16              : inout std_logic                      := 'X';             -- gpio0_io16
			agilex_hps_hps_io_gpio0_io17              : inout std_logic                      := 'X';             -- gpio0_io17
			agilex_hps_hps_io_gpio0_io18              : inout std_logic                      := 'X';             -- gpio0_io18
			agilex_hps_hps_io_gpio1_io16              : inout std_logic                      := 'X';             -- gpio1_io16
			agilex_hps_hps_io_gpio1_io17              : inout std_logic                      := 'X';             -- gpio1_io17
			agilex_hps_h2f_reset_reset                : out   std_logic;                                         -- reset
			agilex_hps_h2f_axi_clock_clk              : in    std_logic                      := 'X';             -- clk
			agilex_hps_h2f_axi_reset_reset_n          : in    std_logic                      := 'X';             -- reset_n
			agilex_hps_h2f_axi_master_awid            : out   std_logic_vector(3 downto 0);                      -- awid
			agilex_hps_h2f_axi_master_awaddr          : out   std_logic_vector(31 downto 0);                     -- awaddr
			agilex_hps_h2f_axi_master_awlen           : out   std_logic_vector(7 downto 0);                      -- awlen
			agilex_hps_h2f_axi_master_awsize          : out   std_logic_vector(2 downto 0);                      -- awsize
			agilex_hps_h2f_axi_master_awburst         : out   std_logic_vector(1 downto 0);                      -- awburst
			agilex_hps_h2f_axi_master_awlock          : out   std_logic;                                         -- awlock
			agilex_hps_h2f_axi_master_awcache         : out   std_logic_vector(3 downto 0);                      -- awcache
			agilex_hps_h2f_axi_master_awprot          : out   std_logic_vector(2 downto 0);                      -- awprot
			agilex_hps_h2f_axi_master_awvalid         : out   std_logic;                                         -- awvalid
			agilex_hps_h2f_axi_master_awready         : in    std_logic                      := 'X';             -- awready
			agilex_hps_h2f_axi_master_wdata           : out   std_logic_vector(127 downto 0);                    -- wdata
			agilex_hps_h2f_axi_master_wstrb           : out   std_logic_vector(15 downto 0);                     -- wstrb
			agilex_hps_h2f_axi_master_wlast           : out   std_logic;                                         -- wlast
			agilex_hps_h2f_axi_master_wvalid          : out   std_logic;                                         -- wvalid
			agilex_hps_h2f_axi_master_wready          : in    std_logic                      := 'X';             -- wready
			agilex_hps_h2f_axi_master_bid             : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- bid
			agilex_hps_h2f_axi_master_bresp           : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			agilex_hps_h2f_axi_master_bvalid          : in    std_logic                      := 'X';             -- bvalid
			agilex_hps_h2f_axi_master_bready          : out   std_logic;                                         -- bready
			agilex_hps_h2f_axi_master_arid            : out   std_logic_vector(3 downto 0);                      -- arid
			agilex_hps_h2f_axi_master_araddr          : out   std_logic_vector(31 downto 0);                     -- araddr
			agilex_hps_h2f_axi_master_arlen           : out   std_logic_vector(7 downto 0);                      -- arlen
			agilex_hps_h2f_axi_master_arsize          : out   std_logic_vector(2 downto 0);                      -- arsize
			agilex_hps_h2f_axi_master_arburst         : out   std_logic_vector(1 downto 0);                      -- arburst
			agilex_hps_h2f_axi_master_arlock          : out   std_logic;                                         -- arlock
			agilex_hps_h2f_axi_master_arcache         : out   std_logic_vector(3 downto 0);                      -- arcache
			agilex_hps_h2f_axi_master_arprot          : out   std_logic_vector(2 downto 0);                      -- arprot
			agilex_hps_h2f_axi_master_arvalid         : out   std_logic;                                         -- arvalid
			agilex_hps_h2f_axi_master_arready         : in    std_logic                      := 'X';             -- arready
			agilex_hps_h2f_axi_master_rid             : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- rid
			agilex_hps_h2f_axi_master_rdata           : in    std_logic_vector(127 downto 0) := (others => 'X'); -- rdata
			agilex_hps_h2f_axi_master_rresp           : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			agilex_hps_h2f_axi_master_rlast           : in    std_logic                      := 'X';             -- rlast
			agilex_hps_h2f_axi_master_rvalid          : in    std_logic                      := 'X';             -- rvalid
			agilex_hps_h2f_axi_master_rready          : out   std_logic;                                         -- rready
			agilex_hps_h2f_lw_axi_clock_clk           : in    std_logic                      := 'X';             -- clk
			agilex_hps_h2f_lw_axi_reset_reset_n       : in    std_logic                      := 'X';             -- reset_n
			agilex_hps_h2f_lw_axi_master_awid         : out   std_logic_vector(3 downto 0);                      -- awid
			agilex_hps_h2f_lw_axi_master_awaddr       : out   std_logic_vector(20 downto 0);                     -- awaddr
			agilex_hps_h2f_lw_axi_master_awlen        : out   std_logic_vector(7 downto 0);                      -- awlen
			agilex_hps_h2f_lw_axi_master_awsize       : out   std_logic_vector(2 downto 0);                      -- awsize
			agilex_hps_h2f_lw_axi_master_awburst      : out   std_logic_vector(1 downto 0);                      -- awburst
			agilex_hps_h2f_lw_axi_master_awlock       : out   std_logic;                                         -- awlock
			agilex_hps_h2f_lw_axi_master_awcache      : out   std_logic_vector(3 downto 0);                      -- awcache
			agilex_hps_h2f_lw_axi_master_awprot       : out   std_logic_vector(2 downto 0);                      -- awprot
			agilex_hps_h2f_lw_axi_master_awvalid      : out   std_logic;                                         -- awvalid
			agilex_hps_h2f_lw_axi_master_awready      : in    std_logic                      := 'X';             -- awready
			agilex_hps_h2f_lw_axi_master_wdata        : out   std_logic_vector(31 downto 0);                     -- wdata
			agilex_hps_h2f_lw_axi_master_wstrb        : out   std_logic_vector(3 downto 0);                      -- wstrb
			agilex_hps_h2f_lw_axi_master_wlast        : out   std_logic;                                         -- wlast
			agilex_hps_h2f_lw_axi_master_wvalid       : out   std_logic;                                         -- wvalid
			agilex_hps_h2f_lw_axi_master_wready       : in    std_logic                      := 'X';             -- wready
			agilex_hps_h2f_lw_axi_master_bid          : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- bid
			agilex_hps_h2f_lw_axi_master_bresp        : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			agilex_hps_h2f_lw_axi_master_bvalid       : in    std_logic                      := 'X';             -- bvalid
			agilex_hps_h2f_lw_axi_master_bready       : out   std_logic;                                         -- bready
			agilex_hps_h2f_lw_axi_master_arid         : out   std_logic_vector(3 downto 0);                      -- arid
			agilex_hps_h2f_lw_axi_master_araddr       : out   std_logic_vector(20 downto 0);                     -- araddr
			agilex_hps_h2f_lw_axi_master_arlen        : out   std_logic_vector(7 downto 0);                      -- arlen
			agilex_hps_h2f_lw_axi_master_arsize       : out   std_logic_vector(2 downto 0);                      -- arsize
			agilex_hps_h2f_lw_axi_master_arburst      : out   std_logic_vector(1 downto 0);                      -- arburst
			agilex_hps_h2f_lw_axi_master_arlock       : out   std_logic;                                         -- arlock
			agilex_hps_h2f_lw_axi_master_arcache      : out   std_logic_vector(3 downto 0);                      -- arcache
			agilex_hps_h2f_lw_axi_master_arprot       : out   std_logic_vector(2 downto 0);                      -- arprot
			agilex_hps_h2f_lw_axi_master_arvalid      : out   std_logic;                                         -- arvalid
			agilex_hps_h2f_lw_axi_master_arready      : in    std_logic                      := 'X';             -- arready
			agilex_hps_h2f_lw_axi_master_rid          : in    std_logic_vector(3 downto 0)   := (others => 'X'); -- rid
			agilex_hps_h2f_lw_axi_master_rdata        : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- rdata
			agilex_hps_h2f_lw_axi_master_rresp        : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			agilex_hps_h2f_lw_axi_master_rlast        : in    std_logic                      := 'X';             -- rlast
			agilex_hps_h2f_lw_axi_master_rvalid       : in    std_logic                      := 'X';             -- rvalid
			agilex_hps_h2f_lw_axi_master_rready       : out   std_logic;                                         -- rready
			agilex_hps_f2h_axi_clock_clk              : in    std_logic                      := 'X';             -- clk
			agilex_hps_f2h_axi_reset_reset_n          : in    std_logic                      := 'X';             -- reset_n
			agilex_hps_f2h_irq0_irq                   : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- irq
			agilex_hps_f2h_irq1_irq                   : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- irq
			emif_hps_pll_ref_clk_clk                  : in    std_logic                      := 'X';             -- clk
			emif_hps_oct_oct_rzqin                    : in    std_logic                      := 'X';             -- oct_rzqin
			emif_hps_mem_mem_ck                       : out   std_logic_vector(0 downto 0);                      -- mem_ck
			emif_hps_mem_mem_ck_n                     : out   std_logic_vector(0 downto 0);                      -- mem_ck_n
			emif_hps_mem_mem_a                        : out   std_logic_vector(16 downto 0);                     -- mem_a
			emif_hps_mem_mem_act_n                    : out   std_logic_vector(0 downto 0);                      -- mem_act_n
			emif_hps_mem_mem_ba                       : out   std_logic_vector(1 downto 0);                      -- mem_ba
			emif_hps_mem_mem_bg                       : out   std_logic_vector(0 downto 0);                      -- mem_bg
			emif_hps_mem_mem_cke                      : out   std_logic_vector(0 downto 0);                      -- mem_cke
			emif_hps_mem_mem_cs_n                     : out   std_logic_vector(1 downto 0);                      -- mem_cs_n
			emif_hps_mem_mem_odt                      : out   std_logic_vector(0 downto 0);                      -- mem_odt
			emif_hps_mem_mem_reset_n                  : out   std_logic_vector(0 downto 0);                      -- mem_reset_n
			emif_hps_mem_mem_par                      : out   std_logic_vector(0 downto 0);                      -- mem_par
			emif_hps_mem_mem_alert_n                  : in    std_logic_vector(0 downto 0)   := (others => 'X'); -- mem_alert_n
			emif_hps_mem_mem_dqs                      : inout std_logic_vector(8 downto 0)   := (others => 'X'); -- mem_dqs
			emif_hps_mem_mem_dqs_n                    : inout std_logic_vector(8 downto 0)   := (others => 'X'); -- mem_dqs_n
			emif_hps_mem_mem_dq                       : inout std_logic_vector(71 downto 0)  := (others => 'X'); -- mem_dq
			emif_hps_mem_mem_dbi_n                    : inout std_logic_vector(8 downto 0)   := (others => 'X')  -- mem_dbi_n
		);
	end component hps_sub_sys;

	u0 : component hps_sub_sys
		port map (
			acp_0_clock_clk                           => CONNECTED_TO_acp_0_clock_clk,                           --                  acp_0_clock.clk
			acp_0_reset_reset                         => CONNECTED_TO_acp_0_reset_reset,                         --                  acp_0_reset.reset
			acp_0_csr_clock_clk                       => CONNECTED_TO_acp_0_csr_clock_clk,                       --              acp_0_csr_clock.clk
			acp_0_csr_reset_reset                     => CONNECTED_TO_acp_0_csr_reset_reset,                     --              acp_0_csr_reset.reset
			acp_0_csr_address                         => CONNECTED_TO_acp_0_csr_address,                         --                    acp_0_csr.address
			acp_0_csr_read                            => CONNECTED_TO_acp_0_csr_read,                            --                             .read
			acp_0_csr_write                           => CONNECTED_TO_acp_0_csr_write,                           --                             .write
			acp_0_csr_writedata                       => CONNECTED_TO_acp_0_csr_writedata,                       --                             .writedata
			acp_0_csr_readdata                        => CONNECTED_TO_acp_0_csr_readdata,                        --                             .readdata
			acp_0_s0_araddr                           => CONNECTED_TO_acp_0_s0_araddr,                           --                     acp_0_s0.araddr
			acp_0_s0_arburst                          => CONNECTED_TO_acp_0_s0_arburst,                          --                             .arburst
			acp_0_s0_arcache                          => CONNECTED_TO_acp_0_s0_arcache,                          --                             .arcache
			acp_0_s0_arid                             => CONNECTED_TO_acp_0_s0_arid,                             --                             .arid
			acp_0_s0_arlen                            => CONNECTED_TO_acp_0_s0_arlen,                            --                             .arlen
			acp_0_s0_arlock                           => CONNECTED_TO_acp_0_s0_arlock,                           --                             .arlock
			acp_0_s0_arprot                           => CONNECTED_TO_acp_0_s0_arprot,                           --                             .arprot
			acp_0_s0_arready                          => CONNECTED_TO_acp_0_s0_arready,                          --                             .arready
			acp_0_s0_arsize                           => CONNECTED_TO_acp_0_s0_arsize,                           --                             .arsize
			acp_0_s0_arvalid                          => CONNECTED_TO_acp_0_s0_arvalid,                          --                             .arvalid
			acp_0_s0_awaddr                           => CONNECTED_TO_acp_0_s0_awaddr,                           --                             .awaddr
			acp_0_s0_awburst                          => CONNECTED_TO_acp_0_s0_awburst,                          --                             .awburst
			acp_0_s0_awcache                          => CONNECTED_TO_acp_0_s0_awcache,                          --                             .awcache
			acp_0_s0_awid                             => CONNECTED_TO_acp_0_s0_awid,                             --                             .awid
			acp_0_s0_awlen                            => CONNECTED_TO_acp_0_s0_awlen,                            --                             .awlen
			acp_0_s0_awlock                           => CONNECTED_TO_acp_0_s0_awlock,                           --                             .awlock
			acp_0_s0_awprot                           => CONNECTED_TO_acp_0_s0_awprot,                           --                             .awprot
			acp_0_s0_awready                          => CONNECTED_TO_acp_0_s0_awready,                          --                             .awready
			acp_0_s0_awsize                           => CONNECTED_TO_acp_0_s0_awsize,                           --                             .awsize
			acp_0_s0_awvalid                          => CONNECTED_TO_acp_0_s0_awvalid,                          --                             .awvalid
			acp_0_s0_bid                              => CONNECTED_TO_acp_0_s0_bid,                              --                             .bid
			acp_0_s0_bready                           => CONNECTED_TO_acp_0_s0_bready,                           --                             .bready
			acp_0_s0_bresp                            => CONNECTED_TO_acp_0_s0_bresp,                            --                             .bresp
			acp_0_s0_bvalid                           => CONNECTED_TO_acp_0_s0_bvalid,                           --                             .bvalid
			acp_0_s0_rdata                            => CONNECTED_TO_acp_0_s0_rdata,                            --                             .rdata
			acp_0_s0_rid                              => CONNECTED_TO_acp_0_s0_rid,                              --                             .rid
			acp_0_s0_rlast                            => CONNECTED_TO_acp_0_s0_rlast,                            --                             .rlast
			acp_0_s0_rready                           => CONNECTED_TO_acp_0_s0_rready,                           --                             .rready
			acp_0_s0_rresp                            => CONNECTED_TO_acp_0_s0_rresp,                            --                             .rresp
			acp_0_s0_rvalid                           => CONNECTED_TO_acp_0_s0_rvalid,                           --                             .rvalid
			acp_0_s0_wdata                            => CONNECTED_TO_acp_0_s0_wdata,                            --                             .wdata
			acp_0_s0_wlast                            => CONNECTED_TO_acp_0_s0_wlast,                            --                             .wlast
			acp_0_s0_wready                           => CONNECTED_TO_acp_0_s0_wready,                           --                             .wready
			acp_0_s0_wstrb                            => CONNECTED_TO_acp_0_s0_wstrb,                            --                             .wstrb
			acp_0_s0_wvalid                           => CONNECTED_TO_acp_0_s0_wvalid,                           --                             .wvalid
			agilex_hps_f2h_stm_hw_events_stm_hwevents => CONNECTED_TO_agilex_hps_f2h_stm_hw_events_stm_hwevents, -- agilex_hps_f2h_stm_hw_events.stm_hwevents
			agilex_hps_h2f_cs_ntrst                   => CONNECTED_TO_agilex_hps_h2f_cs_ntrst,                   --            agilex_hps_h2f_cs.ntrst
			agilex_hps_h2f_cs_tck                     => CONNECTED_TO_agilex_hps_h2f_cs_tck,                     --                             .tck
			agilex_hps_h2f_cs_tdi                     => CONNECTED_TO_agilex_hps_h2f_cs_tdi,                     --                             .tdi
			agilex_hps_h2f_cs_tdo                     => CONNECTED_TO_agilex_hps_h2f_cs_tdo,                     --                             .tdo
			agilex_hps_h2f_cs_tdoen                   => CONNECTED_TO_agilex_hps_h2f_cs_tdoen,                   --                             .tdoen
			agilex_hps_h2f_cs_tms                     => CONNECTED_TO_agilex_hps_h2f_cs_tms,                     --                             .tms
			agilex_hps_hps_io_EMAC1_TX_CLK            => CONNECTED_TO_agilex_hps_hps_io_EMAC1_TX_CLK,            --            agilex_hps_hps_io.EMAC1_TX_CLK
			agilex_hps_hps_io_EMAC1_TXD0              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_TXD0,              --                             .EMAC1_TXD0
			agilex_hps_hps_io_EMAC1_TXD1              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_TXD1,              --                             .EMAC1_TXD1
			agilex_hps_hps_io_EMAC1_TXD2              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_TXD2,              --                             .EMAC1_TXD2
			agilex_hps_hps_io_EMAC1_TXD3              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_TXD3,              --                             .EMAC1_TXD3
			agilex_hps_hps_io_EMAC1_RX_CTL            => CONNECTED_TO_agilex_hps_hps_io_EMAC1_RX_CTL,            --                             .EMAC1_RX_CTL
			agilex_hps_hps_io_EMAC1_TX_CTL            => CONNECTED_TO_agilex_hps_hps_io_EMAC1_TX_CTL,            --                             .EMAC1_TX_CTL
			agilex_hps_hps_io_EMAC1_RX_CLK            => CONNECTED_TO_agilex_hps_hps_io_EMAC1_RX_CLK,            --                             .EMAC1_RX_CLK
			agilex_hps_hps_io_EMAC1_RXD0              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_RXD0,              --                             .EMAC1_RXD0
			agilex_hps_hps_io_EMAC1_RXD1              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_RXD1,              --                             .EMAC1_RXD1
			agilex_hps_hps_io_EMAC1_RXD2              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_RXD2,              --                             .EMAC1_RXD2
			agilex_hps_hps_io_EMAC1_RXD3              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_RXD3,              --                             .EMAC1_RXD3
			agilex_hps_hps_io_EMAC1_MDIO              => CONNECTED_TO_agilex_hps_hps_io_EMAC1_MDIO,              --                             .EMAC1_MDIO
			agilex_hps_hps_io_EMAC1_MDC               => CONNECTED_TO_agilex_hps_hps_io_EMAC1_MDC,               --                             .EMAC1_MDC
			agilex_hps_hps_io_SDMMC_CMD               => CONNECTED_TO_agilex_hps_hps_io_SDMMC_CMD,               --                             .SDMMC_CMD
			agilex_hps_hps_io_SDMMC_D0                => CONNECTED_TO_agilex_hps_hps_io_SDMMC_D0,                --                             .SDMMC_D0
			agilex_hps_hps_io_SDMMC_D1                => CONNECTED_TO_agilex_hps_hps_io_SDMMC_D1,                --                             .SDMMC_D1
			agilex_hps_hps_io_SDMMC_D2                => CONNECTED_TO_agilex_hps_hps_io_SDMMC_D2,                --                             .SDMMC_D2
			agilex_hps_hps_io_SDMMC_D3                => CONNECTED_TO_agilex_hps_hps_io_SDMMC_D3,                --                             .SDMMC_D3
			agilex_hps_hps_io_SDMMC_D4                => CONNECTED_TO_agilex_hps_hps_io_SDMMC_D4,                --                             .SDMMC_D4
			agilex_hps_hps_io_SDMMC_D5                => CONNECTED_TO_agilex_hps_hps_io_SDMMC_D5,                --                             .SDMMC_D5
			agilex_hps_hps_io_SDMMC_D6                => CONNECTED_TO_agilex_hps_hps_io_SDMMC_D6,                --                             .SDMMC_D6
			agilex_hps_hps_io_SDMMC_D7                => CONNECTED_TO_agilex_hps_hps_io_SDMMC_D7,                --                             .SDMMC_D7
			agilex_hps_hps_io_SDMMC_CCLK              => CONNECTED_TO_agilex_hps_hps_io_SDMMC_CCLK,              --                             .SDMMC_CCLK
			agilex_hps_hps_io_SPIM0_CLK               => CONNECTED_TO_agilex_hps_hps_io_SPIM0_CLK,               --                             .SPIM0_CLK
			agilex_hps_hps_io_SPIM0_MOSI              => CONNECTED_TO_agilex_hps_hps_io_SPIM0_MOSI,              --                             .SPIM0_MOSI
			agilex_hps_hps_io_SPIM0_MISO              => CONNECTED_TO_agilex_hps_hps_io_SPIM0_MISO,              --                             .SPIM0_MISO
			agilex_hps_hps_io_SPIM0_SS0_N             => CONNECTED_TO_agilex_hps_hps_io_SPIM0_SS0_N,             --                             .SPIM0_SS0_N
			agilex_hps_hps_io_SPIM1_CLK               => CONNECTED_TO_agilex_hps_hps_io_SPIM1_CLK,               --                             .SPIM1_CLK
			agilex_hps_hps_io_SPIM1_MOSI              => CONNECTED_TO_agilex_hps_hps_io_SPIM1_MOSI,              --                             .SPIM1_MOSI
			agilex_hps_hps_io_SPIM1_MISO              => CONNECTED_TO_agilex_hps_hps_io_SPIM1_MISO,              --                             .SPIM1_MISO
			agilex_hps_hps_io_SPIM1_SS0_N             => CONNECTED_TO_agilex_hps_hps_io_SPIM1_SS0_N,             --                             .SPIM1_SS0_N
			agilex_hps_hps_io_SPIM1_SS1_N             => CONNECTED_TO_agilex_hps_hps_io_SPIM1_SS1_N,             --                             .SPIM1_SS1_N
			agilex_hps_hps_io_UART1_RX                => CONNECTED_TO_agilex_hps_hps_io_UART1_RX,                --                             .UART1_RX
			agilex_hps_hps_io_UART1_TX                => CONNECTED_TO_agilex_hps_hps_io_UART1_TX,                --                             .UART1_TX
			agilex_hps_hps_io_I2C1_SDA                => CONNECTED_TO_agilex_hps_hps_io_I2C1_SDA,                --                             .I2C1_SDA
			agilex_hps_hps_io_I2C1_SCL                => CONNECTED_TO_agilex_hps_hps_io_I2C1_SCL,                --                             .I2C1_SCL
			agilex_hps_hps_io_hps_osc_clk             => CONNECTED_TO_agilex_hps_hps_io_hps_osc_clk,             --                             .hps_osc_clk
			agilex_hps_hps_io_gpio0_io11              => CONNECTED_TO_agilex_hps_hps_io_gpio0_io11,              --                             .gpio0_io11
			agilex_hps_hps_io_gpio0_io12              => CONNECTED_TO_agilex_hps_hps_io_gpio0_io12,              --                             .gpio0_io12
			agilex_hps_hps_io_gpio0_io13              => CONNECTED_TO_agilex_hps_hps_io_gpio0_io13,              --                             .gpio0_io13
			agilex_hps_hps_io_gpio0_io14              => CONNECTED_TO_agilex_hps_hps_io_gpio0_io14,              --                             .gpio0_io14
			agilex_hps_hps_io_gpio0_io15              => CONNECTED_TO_agilex_hps_hps_io_gpio0_io15,              --                             .gpio0_io15
			agilex_hps_hps_io_gpio0_io16              => CONNECTED_TO_agilex_hps_hps_io_gpio0_io16,              --                             .gpio0_io16
			agilex_hps_hps_io_gpio0_io17              => CONNECTED_TO_agilex_hps_hps_io_gpio0_io17,              --                             .gpio0_io17
			agilex_hps_hps_io_gpio0_io18              => CONNECTED_TO_agilex_hps_hps_io_gpio0_io18,              --                             .gpio0_io18
			agilex_hps_hps_io_gpio1_io16              => CONNECTED_TO_agilex_hps_hps_io_gpio1_io16,              --                             .gpio1_io16
			agilex_hps_hps_io_gpio1_io17              => CONNECTED_TO_agilex_hps_hps_io_gpio1_io17,              --                             .gpio1_io17
			agilex_hps_h2f_reset_reset                => CONNECTED_TO_agilex_hps_h2f_reset_reset,                --         agilex_hps_h2f_reset.reset
			agilex_hps_h2f_axi_clock_clk              => CONNECTED_TO_agilex_hps_h2f_axi_clock_clk,              --     agilex_hps_h2f_axi_clock.clk
			agilex_hps_h2f_axi_reset_reset_n          => CONNECTED_TO_agilex_hps_h2f_axi_reset_reset_n,          --     agilex_hps_h2f_axi_reset.reset_n
			agilex_hps_h2f_axi_master_awid            => CONNECTED_TO_agilex_hps_h2f_axi_master_awid,            --    agilex_hps_h2f_axi_master.awid
			agilex_hps_h2f_axi_master_awaddr          => CONNECTED_TO_agilex_hps_h2f_axi_master_awaddr,          --                             .awaddr
			agilex_hps_h2f_axi_master_awlen           => CONNECTED_TO_agilex_hps_h2f_axi_master_awlen,           --                             .awlen
			agilex_hps_h2f_axi_master_awsize          => CONNECTED_TO_agilex_hps_h2f_axi_master_awsize,          --                             .awsize
			agilex_hps_h2f_axi_master_awburst         => CONNECTED_TO_agilex_hps_h2f_axi_master_awburst,         --                             .awburst
			agilex_hps_h2f_axi_master_awlock          => CONNECTED_TO_agilex_hps_h2f_axi_master_awlock,          --                             .awlock
			agilex_hps_h2f_axi_master_awcache         => CONNECTED_TO_agilex_hps_h2f_axi_master_awcache,         --                             .awcache
			agilex_hps_h2f_axi_master_awprot          => CONNECTED_TO_agilex_hps_h2f_axi_master_awprot,          --                             .awprot
			agilex_hps_h2f_axi_master_awvalid         => CONNECTED_TO_agilex_hps_h2f_axi_master_awvalid,         --                             .awvalid
			agilex_hps_h2f_axi_master_awready         => CONNECTED_TO_agilex_hps_h2f_axi_master_awready,         --                             .awready
			agilex_hps_h2f_axi_master_wdata           => CONNECTED_TO_agilex_hps_h2f_axi_master_wdata,           --                             .wdata
			agilex_hps_h2f_axi_master_wstrb           => CONNECTED_TO_agilex_hps_h2f_axi_master_wstrb,           --                             .wstrb
			agilex_hps_h2f_axi_master_wlast           => CONNECTED_TO_agilex_hps_h2f_axi_master_wlast,           --                             .wlast
			agilex_hps_h2f_axi_master_wvalid          => CONNECTED_TO_agilex_hps_h2f_axi_master_wvalid,          --                             .wvalid
			agilex_hps_h2f_axi_master_wready          => CONNECTED_TO_agilex_hps_h2f_axi_master_wready,          --                             .wready
			agilex_hps_h2f_axi_master_bid             => CONNECTED_TO_agilex_hps_h2f_axi_master_bid,             --                             .bid
			agilex_hps_h2f_axi_master_bresp           => CONNECTED_TO_agilex_hps_h2f_axi_master_bresp,           --                             .bresp
			agilex_hps_h2f_axi_master_bvalid          => CONNECTED_TO_agilex_hps_h2f_axi_master_bvalid,          --                             .bvalid
			agilex_hps_h2f_axi_master_bready          => CONNECTED_TO_agilex_hps_h2f_axi_master_bready,          --                             .bready
			agilex_hps_h2f_axi_master_arid            => CONNECTED_TO_agilex_hps_h2f_axi_master_arid,            --                             .arid
			agilex_hps_h2f_axi_master_araddr          => CONNECTED_TO_agilex_hps_h2f_axi_master_araddr,          --                             .araddr
			agilex_hps_h2f_axi_master_arlen           => CONNECTED_TO_agilex_hps_h2f_axi_master_arlen,           --                             .arlen
			agilex_hps_h2f_axi_master_arsize          => CONNECTED_TO_agilex_hps_h2f_axi_master_arsize,          --                             .arsize
			agilex_hps_h2f_axi_master_arburst         => CONNECTED_TO_agilex_hps_h2f_axi_master_arburst,         --                             .arburst
			agilex_hps_h2f_axi_master_arlock          => CONNECTED_TO_agilex_hps_h2f_axi_master_arlock,          --                             .arlock
			agilex_hps_h2f_axi_master_arcache         => CONNECTED_TO_agilex_hps_h2f_axi_master_arcache,         --                             .arcache
			agilex_hps_h2f_axi_master_arprot          => CONNECTED_TO_agilex_hps_h2f_axi_master_arprot,          --                             .arprot
			agilex_hps_h2f_axi_master_arvalid         => CONNECTED_TO_agilex_hps_h2f_axi_master_arvalid,         --                             .arvalid
			agilex_hps_h2f_axi_master_arready         => CONNECTED_TO_agilex_hps_h2f_axi_master_arready,         --                             .arready
			agilex_hps_h2f_axi_master_rid             => CONNECTED_TO_agilex_hps_h2f_axi_master_rid,             --                             .rid
			agilex_hps_h2f_axi_master_rdata           => CONNECTED_TO_agilex_hps_h2f_axi_master_rdata,           --                             .rdata
			agilex_hps_h2f_axi_master_rresp           => CONNECTED_TO_agilex_hps_h2f_axi_master_rresp,           --                             .rresp
			agilex_hps_h2f_axi_master_rlast           => CONNECTED_TO_agilex_hps_h2f_axi_master_rlast,           --                             .rlast
			agilex_hps_h2f_axi_master_rvalid          => CONNECTED_TO_agilex_hps_h2f_axi_master_rvalid,          --                             .rvalid
			agilex_hps_h2f_axi_master_rready          => CONNECTED_TO_agilex_hps_h2f_axi_master_rready,          --                             .rready
			agilex_hps_h2f_lw_axi_clock_clk           => CONNECTED_TO_agilex_hps_h2f_lw_axi_clock_clk,           --  agilex_hps_h2f_lw_axi_clock.clk
			agilex_hps_h2f_lw_axi_reset_reset_n       => CONNECTED_TO_agilex_hps_h2f_lw_axi_reset_reset_n,       --  agilex_hps_h2f_lw_axi_reset.reset_n
			agilex_hps_h2f_lw_axi_master_awid         => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awid,         -- agilex_hps_h2f_lw_axi_master.awid
			agilex_hps_h2f_lw_axi_master_awaddr       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awaddr,       --                             .awaddr
			agilex_hps_h2f_lw_axi_master_awlen        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awlen,        --                             .awlen
			agilex_hps_h2f_lw_axi_master_awsize       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awsize,       --                             .awsize
			agilex_hps_h2f_lw_axi_master_awburst      => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awburst,      --                             .awburst
			agilex_hps_h2f_lw_axi_master_awlock       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awlock,       --                             .awlock
			agilex_hps_h2f_lw_axi_master_awcache      => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awcache,      --                             .awcache
			agilex_hps_h2f_lw_axi_master_awprot       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awprot,       --                             .awprot
			agilex_hps_h2f_lw_axi_master_awvalid      => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awvalid,      --                             .awvalid
			agilex_hps_h2f_lw_axi_master_awready      => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_awready,      --                             .awready
			agilex_hps_h2f_lw_axi_master_wdata        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_wdata,        --                             .wdata
			agilex_hps_h2f_lw_axi_master_wstrb        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_wstrb,        --                             .wstrb
			agilex_hps_h2f_lw_axi_master_wlast        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_wlast,        --                             .wlast
			agilex_hps_h2f_lw_axi_master_wvalid       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_wvalid,       --                             .wvalid
			agilex_hps_h2f_lw_axi_master_wready       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_wready,       --                             .wready
			agilex_hps_h2f_lw_axi_master_bid          => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_bid,          --                             .bid
			agilex_hps_h2f_lw_axi_master_bresp        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_bresp,        --                             .bresp
			agilex_hps_h2f_lw_axi_master_bvalid       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_bvalid,       --                             .bvalid
			agilex_hps_h2f_lw_axi_master_bready       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_bready,       --                             .bready
			agilex_hps_h2f_lw_axi_master_arid         => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arid,         --                             .arid
			agilex_hps_h2f_lw_axi_master_araddr       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_araddr,       --                             .araddr
			agilex_hps_h2f_lw_axi_master_arlen        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arlen,        --                             .arlen
			agilex_hps_h2f_lw_axi_master_arsize       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arsize,       --                             .arsize
			agilex_hps_h2f_lw_axi_master_arburst      => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arburst,      --                             .arburst
			agilex_hps_h2f_lw_axi_master_arlock       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arlock,       --                             .arlock
			agilex_hps_h2f_lw_axi_master_arcache      => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arcache,      --                             .arcache
			agilex_hps_h2f_lw_axi_master_arprot       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arprot,       --                             .arprot
			agilex_hps_h2f_lw_axi_master_arvalid      => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arvalid,      --                             .arvalid
			agilex_hps_h2f_lw_axi_master_arready      => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_arready,      --                             .arready
			agilex_hps_h2f_lw_axi_master_rid          => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_rid,          --                             .rid
			agilex_hps_h2f_lw_axi_master_rdata        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_rdata,        --                             .rdata
			agilex_hps_h2f_lw_axi_master_rresp        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_rresp,        --                             .rresp
			agilex_hps_h2f_lw_axi_master_rlast        => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_rlast,        --                             .rlast
			agilex_hps_h2f_lw_axi_master_rvalid       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_rvalid,       --                             .rvalid
			agilex_hps_h2f_lw_axi_master_rready       => CONNECTED_TO_agilex_hps_h2f_lw_axi_master_rready,       --                             .rready
			agilex_hps_f2h_axi_clock_clk              => CONNECTED_TO_agilex_hps_f2h_axi_clock_clk,              --     agilex_hps_f2h_axi_clock.clk
			agilex_hps_f2h_axi_reset_reset_n          => CONNECTED_TO_agilex_hps_f2h_axi_reset_reset_n,          --     agilex_hps_f2h_axi_reset.reset_n
			agilex_hps_f2h_irq0_irq                   => CONNECTED_TO_agilex_hps_f2h_irq0_irq,                   --          agilex_hps_f2h_irq0.irq
			agilex_hps_f2h_irq1_irq                   => CONNECTED_TO_agilex_hps_f2h_irq1_irq,                   --          agilex_hps_f2h_irq1.irq
			emif_hps_pll_ref_clk_clk                  => CONNECTED_TO_emif_hps_pll_ref_clk_clk,                  --         emif_hps_pll_ref_clk.clk
			emif_hps_oct_oct_rzqin                    => CONNECTED_TO_emif_hps_oct_oct_rzqin,                    --                 emif_hps_oct.oct_rzqin
			emif_hps_mem_mem_ck                       => CONNECTED_TO_emif_hps_mem_mem_ck,                       --                 emif_hps_mem.mem_ck
			emif_hps_mem_mem_ck_n                     => CONNECTED_TO_emif_hps_mem_mem_ck_n,                     --                             .mem_ck_n
			emif_hps_mem_mem_a                        => CONNECTED_TO_emif_hps_mem_mem_a,                        --                             .mem_a
			emif_hps_mem_mem_act_n                    => CONNECTED_TO_emif_hps_mem_mem_act_n,                    --                             .mem_act_n
			emif_hps_mem_mem_ba                       => CONNECTED_TO_emif_hps_mem_mem_ba,                       --                             .mem_ba
			emif_hps_mem_mem_bg                       => CONNECTED_TO_emif_hps_mem_mem_bg,                       --                             .mem_bg
			emif_hps_mem_mem_cke                      => CONNECTED_TO_emif_hps_mem_mem_cke,                      --                             .mem_cke
			emif_hps_mem_mem_cs_n                     => CONNECTED_TO_emif_hps_mem_mem_cs_n,                     --                             .mem_cs_n
			emif_hps_mem_mem_odt                      => CONNECTED_TO_emif_hps_mem_mem_odt,                      --                             .mem_odt
			emif_hps_mem_mem_reset_n                  => CONNECTED_TO_emif_hps_mem_mem_reset_n,                  --                             .mem_reset_n
			emif_hps_mem_mem_par                      => CONNECTED_TO_emif_hps_mem_mem_par,                      --                             .mem_par
			emif_hps_mem_mem_alert_n                  => CONNECTED_TO_emif_hps_mem_mem_alert_n,                  --                             .mem_alert_n
			emif_hps_mem_mem_dqs                      => CONNECTED_TO_emif_hps_mem_mem_dqs,                      --                             .mem_dqs
			emif_hps_mem_mem_dqs_n                    => CONNECTED_TO_emif_hps_mem_mem_dqs_n,                    --                             .mem_dqs_n
			emif_hps_mem_mem_dq                       => CONNECTED_TO_emif_hps_mem_mem_dq,                       --                             .mem_dq
			emif_hps_mem_mem_dbi_n                    => CONNECTED_TO_emif_hps_mem_mem_dbi_n                     --                             .mem_dbi_n
		);

