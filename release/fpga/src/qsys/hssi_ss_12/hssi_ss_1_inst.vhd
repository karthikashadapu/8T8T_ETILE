	component hssi_ss_1 is
		generic (
			SIM_MODE                         : integer := 1;
			SUBSYSTEM_RST_ACK_DEASSERT_DELAY : integer := 49152;
			TX_RST_ACK_DEASSERT_DELAY        : integer := 512;
			RX_RST_ACK_DEASSERT_DELAY        : integer := 512;
			DFHv0_FEA_VER                    : integer := 0;
			DFHv0_FEA_MINOR                  : integer := 0;
			DFHv0_FEA_EOL                    : integer := 0;
			DFHv0_FEA_NXT                    : integer := 4096;
			DFHv0_FEA_REV                    : integer := 2;
			DFHv0_FEA_FEAID                  : integer := 21;
			DFHv0_FEA_FEATYPE                : integer := 3;
			DFHv1_INSTID                     : integer := 0;
			SET_AXI_LITE_RESPONSE_TO_ZERO    : integer := 0
		);
		port (
			app_ss_lite_clk              : in  std_logic                     := 'X';             -- clk
			app_ss_lite_areset_n         : in  std_logic                     := 'X';             -- reset_n
			app_ss_lite_awaddr           : in  std_logic_vector(25 downto 0) := (others => 'X'); -- awaddr
			app_ss_lite_awprot           : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- awprot
			app_ss_lite_awvalid          : in  std_logic                     := 'X';             -- awvalid
			ss_app_lite_awready          : out std_logic;                                        -- awready
			app_ss_lite_wdata            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- wdata
			app_ss_lite_wstrb            : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- wstrb
			app_ss_lite_wvalid           : in  std_logic                     := 'X';             -- wvalid
			ss_app_lite_wready           : out std_logic;                                        -- wready
			ss_app_lite_bresp            : out std_logic_vector(1 downto 0);                     -- bresp
			ss_app_lite_bvalid           : out std_logic;                                        -- bvalid
			app_ss_lite_bready           : in  std_logic                     := 'X';             -- bready
			app_ss_lite_araddr           : in  std_logic_vector(25 downto 0) := (others => 'X'); -- araddr
			app_ss_lite_arprot           : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- arprot
			app_ss_lite_arvalid          : in  std_logic                     := 'X';             -- arvalid
			ss_app_lite_arready          : out std_logic;                                        -- arready
			ss_app_lite_rdata            : out std_logic_vector(31 downto 0);                    -- rdata
			ss_app_lite_rvalid           : out std_logic;                                        -- rvalid
			app_ss_lite_rready           : in  std_logic                     := 'X';             -- rready
			ss_app_lite_rresp            : out std_logic_vector(1 downto 0);                     -- rresp
			p0_app_ss_st_tx_clk          : in  std_logic                     := 'X';             -- clk
			p0_app_ss_st_tx_areset_n     : in  std_logic                     := 'X';             -- reset_n
			p0_app_ss_st_tx_tvalid       : in  std_logic                     := 'X';             -- tvalid
			p0_ss_app_st_tx_tready       : out std_logic;                                        -- tready
			p0_app_ss_st_tx_tdata        : in  std_logic_vector(63 downto 0) := (others => 'X'); -- tdata
			p0_app_ss_st_tx_tkeep        : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- tkeep
			p0_app_ss_st_tx_tlast        : in  std_logic                     := 'X';             -- tlast
			p0_app_ss_st_tx_tuser_client : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- tuser
			p0_app_ss_st_rx_clk          : in  std_logic                     := 'X';             -- clk
			p0_app_ss_st_rx_areset_n     : in  std_logic                     := 'X';             -- reset_n
			p0_ss_app_st_rx_tvalid       : out std_logic;                                        -- tvalid
			p0_ss_app_st_rx_tdata        : out std_logic_vector(63 downto 0);                    -- tdata
			p0_ss_app_st_rx_tkeep        : out std_logic_vector(7 downto 0);                     -- tkeep
			p0_ss_app_st_rx_tlast        : out std_logic;                                        -- tlast
			p0_ss_app_st_rx_tuser_client : out std_logic_vector(6 downto 0);                     -- tuser
			p0_ss_app_st_rx_tuser_sts    : out std_logic_vector(4 downto 0);                     -- tuser_1
			i_p0_tx_pause                : in  std_logic                     := 'X';             -- i_p0_tx_pause
			i_p0_tx_pfc                  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- i_p0_tx_pfc
			o_p0_rx_pause                : out std_logic;                                        -- o_p0_rx_pause
			o_p0_rx_pfc                  : out std_logic_vector(7 downto 0);                     -- o_p0_rx_pfc
			p0_tx_serial                 : out std_logic_vector(0 downto 0);                     -- p0_tx_serial
			p0_tx_serial_n               : out std_logic_vector(0 downto 0);                     -- p0_tx_serial_n
			p0_rx_serial                 : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- p0_rx_serial
			p0_rx_serial_n               : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- p0_rx_serial_n
			port0_led_speed              : out std_logic_vector(2 downto 0);                     -- port0_led_speed
			port0_led_status             : out std_logic_vector(2 downto 0);                     -- port0_led_status
			port1_led_speed              : out std_logic_vector(2 downto 0);                     -- port1_led_speed
			port1_led_status             : out std_logic_vector(2 downto 0);                     -- port1_led_status
			port2_led_speed              : out std_logic_vector(2 downto 0);                     -- port2_led_speed
			port2_led_status             : out std_logic_vector(2 downto 0);                     -- port2_led_status
			port3_led_speed              : out std_logic_vector(2 downto 0);                     -- port3_led_speed
			port3_led_status             : out std_logic_vector(2 downto 0);                     -- port3_led_status
			port4_led_speed              : out std_logic_vector(2 downto 0);                     -- port4_led_speed
			port4_led_status             : out std_logic_vector(2 downto 0);                     -- port4_led_status
			port5_led_speed              : out std_logic_vector(2 downto 0);                     -- port5_led_speed
			port5_led_status             : out std_logic_vector(2 downto 0);                     -- port5_led_status
			port6_led_speed              : out std_logic_vector(2 downto 0);                     -- port6_led_speed
			port6_led_status             : out std_logic_vector(2 downto 0);                     -- port6_led_status
			port7_led_speed              : out std_logic_vector(2 downto 0);                     -- port7_led_speed
			port7_led_status             : out std_logic_vector(2 downto 0);                     -- port7_led_status
			port8_led_speed              : out std_logic_vector(2 downto 0);                     -- port8_led_speed
			port8_led_status             : out std_logic_vector(2 downto 0);                     -- port8_led_status
			port9_led_speed              : out std_logic_vector(2 downto 0);                     -- port9_led_speed
			port9_led_status             : out std_logic_vector(2 downto 0);                     -- port9_led_status
			port10_led_speed             : out std_logic_vector(2 downto 0);                     -- port10_led_speed
			port10_led_status            : out std_logic_vector(2 downto 0);                     -- port10_led_status
			port11_led_speed             : out std_logic_vector(2 downto 0);                     -- port11_led_speed
			port11_led_status            : out std_logic_vector(2 downto 0);                     -- port11_led_status
			port12_led_speed             : out std_logic_vector(2 downto 0);                     -- port12_led_speed
			port12_led_status            : out std_logic_vector(2 downto 0);                     -- port12_led_status
			port13_led_speed             : out std_logic_vector(2 downto 0);                     -- port13_led_speed
			port13_led_status            : out std_logic_vector(2 downto 0);                     -- port13_led_status
			port14_led_speed             : out std_logic_vector(2 downto 0);                     -- port14_led_speed
			port14_led_status            : out std_logic_vector(2 downto 0);                     -- port14_led_status
			port15_led_speed             : out std_logic_vector(2 downto 0);                     -- port15_led_speed
			port15_led_status            : out std_logic_vector(2 downto 0);                     -- port15_led_status
			p0_tx_lanes_stable           : out std_logic;                                        -- p0_tx_lanes_stable
			p0_rx_pcs_ready              : out std_logic;                                        -- p0_rx_pcs_ready
			o_p0_tx_pll_locked           : out std_logic;                                        -- o_p0_tx_pll_locked
			o_p0_txfifo_pfull            : out std_logic;                                        -- o_p0_txfifo_pfull
			o_p0_txfifo_pempty           : out std_logic;                                        -- o_p0_txfifo_pempty
			o_p0_txfifo_overflow         : out std_logic;                                        -- o_p0_txfifo_overflow
			o_p0_txfifo_underflow        : out std_logic;                                        -- o_p0_txfifo_underflow
			subsystem_cold_rst_n         : in  std_logic                     := 'X';             -- reset_n
			subsystem_cold_rst_ack_n     : out std_logic;                                        -- reset_n
			i_p0_tx_rst_n                : in  std_logic                     := 'X';             -- reset_n
			i_p0_rx_rst_n                : in  std_logic                     := 'X';             -- reset_n
			o_p0_rx_rst_ack_n            : out std_logic;                                        -- reset_n
			o_p0_tx_rst_ack_n            : out std_logic;                                        -- reset_n
			o_p0_ereset_n                : out std_logic;                                        -- reset_n
			i_clk_ref                    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- clk
			o_p0_clk_pll                 : out std_logic;                                        -- clk
			o_p0_clk_tx_div              : out std_logic;                                        -- clk
			o_p0_clk_rec_div64           : out std_logic;                                        -- clk
			o_p0_clk_rec_div             : out std_logic                                         -- clk
		);
	end component hssi_ss_1;

	u0 : component hssi_ss_1
		generic map (
			SIM_MODE                         => INTEGER_VALUE_FOR_SIM_MODE,
			SUBSYSTEM_RST_ACK_DEASSERT_DELAY => INTEGER_VALUE_FOR_SUBSYSTEM_RST_ACK_DEASSERT_DELAY,
			TX_RST_ACK_DEASSERT_DELAY        => INTEGER_VALUE_FOR_TX_RST_ACK_DEASSERT_DELAY,
			RX_RST_ACK_DEASSERT_DELAY        => INTEGER_VALUE_FOR_RX_RST_ACK_DEASSERT_DELAY,
			DFHv0_FEA_VER                    => INTEGER_VALUE_FOR_DFHv0_FEA_VER,
			DFHv0_FEA_MINOR                  => INTEGER_VALUE_FOR_DFHv0_FEA_MINOR,
			DFHv0_FEA_EOL                    => INTEGER_VALUE_FOR_DFHv0_FEA_EOL,
			DFHv0_FEA_NXT                    => INTEGER_VALUE_FOR_DFHv0_FEA_NXT,
			DFHv0_FEA_REV                    => INTEGER_VALUE_FOR_DFHv0_FEA_REV,
			DFHv0_FEA_FEAID                  => INTEGER_VALUE_FOR_DFHv0_FEA_FEAID,
			DFHv0_FEA_FEATYPE                => INTEGER_VALUE_FOR_DFHv0_FEA_FEATYPE,
			DFHv1_INSTID                     => INTEGER_VALUE_FOR_DFHv1_INSTID,
			SET_AXI_LITE_RESPONSE_TO_ZERO    => INTEGER_VALUE_FOR_SET_AXI_LITE_RESPONSE_TO_ZERO
		)
		port map (
			app_ss_lite_clk              => CONNECTED_TO_app_ss_lite_clk,              --                axi4_lite_clk.clk
			app_ss_lite_areset_n         => CONNECTED_TO_app_ss_lite_areset_n,         --              axi4_lite_reset.reset_n
			app_ss_lite_awaddr           => CONNECTED_TO_app_ss_lite_awaddr,           --          axi4_lite_interface.awaddr
			app_ss_lite_awprot           => CONNECTED_TO_app_ss_lite_awprot,           --                             .awprot
			app_ss_lite_awvalid          => CONNECTED_TO_app_ss_lite_awvalid,          --                             .awvalid
			ss_app_lite_awready          => CONNECTED_TO_ss_app_lite_awready,          --                             .awready
			app_ss_lite_wdata            => CONNECTED_TO_app_ss_lite_wdata,            --                             .wdata
			app_ss_lite_wstrb            => CONNECTED_TO_app_ss_lite_wstrb,            --                             .wstrb
			app_ss_lite_wvalid           => CONNECTED_TO_app_ss_lite_wvalid,           --                             .wvalid
			ss_app_lite_wready           => CONNECTED_TO_ss_app_lite_wready,           --                             .wready
			ss_app_lite_bresp            => CONNECTED_TO_ss_app_lite_bresp,            --                             .bresp
			ss_app_lite_bvalid           => CONNECTED_TO_ss_app_lite_bvalid,           --                             .bvalid
			app_ss_lite_bready           => CONNECTED_TO_app_ss_lite_bready,           --                             .bready
			app_ss_lite_araddr           => CONNECTED_TO_app_ss_lite_araddr,           --                             .araddr
			app_ss_lite_arprot           => CONNECTED_TO_app_ss_lite_arprot,           --                             .arprot
			app_ss_lite_arvalid          => CONNECTED_TO_app_ss_lite_arvalid,          --                             .arvalid
			ss_app_lite_arready          => CONNECTED_TO_ss_app_lite_arready,          --                             .arready
			ss_app_lite_rdata            => CONNECTED_TO_ss_app_lite_rdata,            --                             .rdata
			ss_app_lite_rvalid           => CONNECTED_TO_ss_app_lite_rvalid,           --                             .rvalid
			app_ss_lite_rready           => CONNECTED_TO_app_ss_lite_rready,           --                             .rready
			ss_app_lite_rresp            => CONNECTED_TO_ss_app_lite_rresp,            --                             .rresp
			p0_app_ss_st_tx_clk          => CONNECTED_TO_p0_app_ss_st_tx_clk,          --             p0_axi_st_tx_clk.clk
			p0_app_ss_st_tx_areset_n     => CONNECTED_TO_p0_app_ss_st_tx_areset_n,     --           p0_axi_st_tx_reset.reset_n
			p0_app_ss_st_tx_tvalid       => CONNECTED_TO_p0_app_ss_st_tx_tvalid,       --       p0_axi_st_tx_interface.tvalid
			p0_ss_app_st_tx_tready       => CONNECTED_TO_p0_ss_app_st_tx_tready,       --                             .tready
			p0_app_ss_st_tx_tdata        => CONNECTED_TO_p0_app_ss_st_tx_tdata,        --                             .tdata
			p0_app_ss_st_tx_tkeep        => CONNECTED_TO_p0_app_ss_st_tx_tkeep,        --                             .tkeep
			p0_app_ss_st_tx_tlast        => CONNECTED_TO_p0_app_ss_st_tx_tlast,        --                             .tlast
			p0_app_ss_st_tx_tuser_client => CONNECTED_TO_p0_app_ss_st_tx_tuser_client, --                             .tuser
			p0_app_ss_st_rx_clk          => CONNECTED_TO_p0_app_ss_st_rx_clk,          --             p0_axi_st_rx_clk.clk
			p0_app_ss_st_rx_areset_n     => CONNECTED_TO_p0_app_ss_st_rx_areset_n,     --           p0_axi_st_rx_reset.reset_n
			p0_ss_app_st_rx_tvalid       => CONNECTED_TO_p0_ss_app_st_rx_tvalid,       --       p0_axi_st_rx_interface.tvalid
			p0_ss_app_st_rx_tdata        => CONNECTED_TO_p0_ss_app_st_rx_tdata,        --                             .tdata
			p0_ss_app_st_rx_tkeep        => CONNECTED_TO_p0_ss_app_st_rx_tkeep,        --                             .tkeep
			p0_ss_app_st_rx_tlast        => CONNECTED_TO_p0_ss_app_st_rx_tlast,        --                             .tlast
			p0_ss_app_st_rx_tuser_client => CONNECTED_TO_p0_ss_app_st_rx_tuser_client, --                             .tuser
			p0_ss_app_st_rx_tuser_sts    => CONNECTED_TO_p0_ss_app_st_rx_tuser_sts,    --           p0_rx_tuser_status.tuser_1
			i_p0_tx_pause                => CONNECTED_TO_i_p0_tx_pause,                -- p0_tx_flow_control_interface.i_p0_tx_pause
			i_p0_tx_pfc                  => CONNECTED_TO_i_p0_tx_pfc,                  --                             .i_p0_tx_pfc
			o_p0_rx_pause                => CONNECTED_TO_o_p0_rx_pause,                -- p0_rx_flow_control_interface.o_p0_rx_pause
			o_p0_rx_pfc                  => CONNECTED_TO_o_p0_rx_pfc,                  --                             .o_p0_rx_pfc
			p0_tx_serial                 => CONNECTED_TO_p0_tx_serial,                 --          p0_tx_srl_interface.p0_tx_serial
			p0_tx_serial_n               => CONNECTED_TO_p0_tx_serial_n,               --                             .p0_tx_serial_n
			p0_rx_serial                 => CONNECTED_TO_p0_rx_serial,                 --          p0_rx_srl_interface.p0_rx_serial
			p0_rx_serial_n               => CONNECTED_TO_p0_rx_serial_n,               --                             .p0_rx_serial_n
			port0_led_speed              => CONNECTED_TO_port0_led_speed,              --           p0_qsfp_led_sts_if.port0_led_speed
			port0_led_status             => CONNECTED_TO_port0_led_status,             --                             .port0_led_status
			port1_led_speed              => CONNECTED_TO_port1_led_speed,              --           p1_qsfp_led_sts_if.port1_led_speed
			port1_led_status             => CONNECTED_TO_port1_led_status,             --                             .port1_led_status
			port2_led_speed              => CONNECTED_TO_port2_led_speed,              --           p2_qsfp_led_sts_if.port2_led_speed
			port2_led_status             => CONNECTED_TO_port2_led_status,             --                             .port2_led_status
			port3_led_speed              => CONNECTED_TO_port3_led_speed,              --           p3_qsfp_led_sts_if.port3_led_speed
			port3_led_status             => CONNECTED_TO_port3_led_status,             --                             .port3_led_status
			port4_led_speed              => CONNECTED_TO_port4_led_speed,              --           p4_qsfp_led_sts_if.port4_led_speed
			port4_led_status             => CONNECTED_TO_port4_led_status,             --                             .port4_led_status
			port5_led_speed              => CONNECTED_TO_port5_led_speed,              --           p5_qsfp_led_sts_if.port5_led_speed
			port5_led_status             => CONNECTED_TO_port5_led_status,             --                             .port5_led_status
			port6_led_speed              => CONNECTED_TO_port6_led_speed,              --           p6_qsfp_led_sts_if.port6_led_speed
			port6_led_status             => CONNECTED_TO_port6_led_status,             --                             .port6_led_status
			port7_led_speed              => CONNECTED_TO_port7_led_speed,              --           p7_qsfp_led_sts_if.port7_led_speed
			port7_led_status             => CONNECTED_TO_port7_led_status,             --                             .port7_led_status
			port8_led_speed              => CONNECTED_TO_port8_led_speed,              --           p8_qsfp_led_sts_if.port8_led_speed
			port8_led_status             => CONNECTED_TO_port8_led_status,             --                             .port8_led_status
			port9_led_speed              => CONNECTED_TO_port9_led_speed,              --           p9_qsfp_led_sts_if.port9_led_speed
			port9_led_status             => CONNECTED_TO_port9_led_status,             --                             .port9_led_status
			port10_led_speed             => CONNECTED_TO_port10_led_speed,             --          p10_qsfp_led_sts_if.port10_led_speed
			port10_led_status            => CONNECTED_TO_port10_led_status,            --                             .port10_led_status
			port11_led_speed             => CONNECTED_TO_port11_led_speed,             --          p11_qsfp_led_sts_if.port11_led_speed
			port11_led_status            => CONNECTED_TO_port11_led_status,            --                             .port11_led_status
			port12_led_speed             => CONNECTED_TO_port12_led_speed,             --          p12_qsfp_led_sts_if.port12_led_speed
			port12_led_status            => CONNECTED_TO_port12_led_status,            --                             .port12_led_status
			port13_led_speed             => CONNECTED_TO_port13_led_speed,             --          p13_qsfp_led_sts_if.port13_led_speed
			port13_led_status            => CONNECTED_TO_port13_led_status,            --                             .port13_led_status
			port14_led_speed             => CONNECTED_TO_port14_led_speed,             --          p14_qsfp_led_sts_if.port14_led_speed
			port14_led_status            => CONNECTED_TO_port14_led_status,            --                             .port14_led_status
			port15_led_speed             => CONNECTED_TO_port15_led_speed,             --          p15_qsfp_led_sts_if.port15_led_speed
			port15_led_status            => CONNECTED_TO_port15_led_status,            --                             .port15_led_status
			p0_tx_lanes_stable           => CONNECTED_TO_p0_tx_lanes_stable,           --            p0_misc_interface.p0_tx_lanes_stable
			p0_rx_pcs_ready              => CONNECTED_TO_p0_rx_pcs_ready,              --                             .p0_rx_pcs_ready
			o_p0_tx_pll_locked           => CONNECTED_TO_o_p0_tx_pll_locked,           --                             .o_p0_tx_pll_locked
			o_p0_txfifo_pfull            => CONNECTED_TO_o_p0_txfifo_pfull,            --        p0_sl_xcvr_fifo_ports.o_p0_txfifo_pfull
			o_p0_txfifo_pempty           => CONNECTED_TO_o_p0_txfifo_pempty,           --                             .o_p0_txfifo_pempty
			o_p0_txfifo_overflow         => CONNECTED_TO_o_p0_txfifo_overflow,         --                             .o_p0_txfifo_overflow
			o_p0_txfifo_underflow        => CONNECTED_TO_o_p0_txfifo_underflow,        --                             .o_p0_txfifo_underflow
			subsystem_cold_rst_n         => CONNECTED_TO_subsystem_cold_rst_n,         --         subsystem_cold_rst_n.reset_n
			subsystem_cold_rst_ack_n     => CONNECTED_TO_subsystem_cold_rst_ack_n,     --     subsystem_cold_rst_ack_n.reset_n
			i_p0_tx_rst_n                => CONNECTED_TO_i_p0_tx_rst_n,                --                i_p0_tx_rst_n.reset_n
			i_p0_rx_rst_n                => CONNECTED_TO_i_p0_rx_rst_n,                --                i_p0_rx_rst_n.reset_n
			o_p0_rx_rst_ack_n            => CONNECTED_TO_o_p0_rx_rst_ack_n,            --            o_p0_rx_rst_ack_n.reset_n
			o_p0_tx_rst_ack_n            => CONNECTED_TO_o_p0_tx_rst_ack_n,            --            o_p0_tx_rst_ack_n.reset_n
			o_p0_ereset_n                => CONNECTED_TO_o_p0_ereset_n,                --                o_p0_ereset_n.reset_n
			i_clk_ref                    => CONNECTED_TO_i_clk_ref,                    --                    i_clk_ref.clk
			o_p0_clk_pll                 => CONNECTED_TO_o_p0_clk_pll,                 --                 o_p0_clk_pll.clk
			o_p0_clk_tx_div              => CONNECTED_TO_o_p0_clk_tx_div,              --              o_p0_clk_tx_div.clk
			o_p0_clk_rec_div64           => CONNECTED_TO_o_p0_clk_rec_div64,           --           o_p0_clk_rec_div64.clk
			o_p0_clk_rec_div             => CONNECTED_TO_o_p0_clk_rec_div              --             o_p0_clk_rec_div.clk
		);

