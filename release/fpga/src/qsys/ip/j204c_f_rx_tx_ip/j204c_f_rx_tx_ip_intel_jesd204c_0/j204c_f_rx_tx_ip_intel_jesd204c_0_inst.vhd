	component j204c_f_rx_tx_ip_intel_jesd204c_0 is
		port (
			j204c_tx_phy_rst_n         : in  std_logic                      := 'X';             -- reset_n
			j204c_rx_phy_rst_n         : in  std_logic                      := 'X';             -- reset_n
			rx_serial_data             : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- export
			rx_serial_data_n           : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- export
			j204c_pll_refclk           : in  std_logic                      := 'X';             -- clk
			tx_pma_ready               : out std_logic_vector(3 downto 0);                      -- export
			rx_pma_ready               : out std_logic_vector(3 downto 0);                      -- export
			tx_serial_data             : out std_logic_vector(3 downto 0);                      -- export
			tx_serial_data_n           : out std_logic_vector(3 downto 0);                      -- export
			j204c_reconfig_clk         : in  std_logic                      := 'X';             -- clk
			j204c_reconfig_reset       : in  std_logic                      := 'X';             -- reset
			j204c_reconfig_address     : in  std_logic_vector(20 downto 0)  := (others => 'X'); -- address
			j204c_reconfig_read        : in  std_logic                      := 'X';             -- read
			j204c_reconfig_readdata    : out std_logic_vector(7 downto 0);                      -- readdata
			j204c_reconfig_waitrequest : out std_logic;                                         -- waitrequest
			j204c_reconfig_write       : in  std_logic                      := 'X';             -- write
			j204c_reconfig_writedata   : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- writedata
			j204c_txlink_clk           : in  std_logic                      := 'X';             -- clk
			j204c_txframe_clk          : in  std_logic                      := 'X';             -- clk
			j204c_tx_rst_n             : in  std_logic                      := 'X';             -- reset_n
			j204c_txlclk_ctrl          : in  std_logic                      := 'X';             -- export
			j204c_txfclk_ctrl          : in  std_logic                      := 'X';             -- export
			j204c_tx_avs_clk           : in  std_logic                      := 'X';             -- clk
			j204c_tx_avs_rst_n         : in  std_logic                      := 'X';             -- reset_n
			j204c_tx_avs_chipselect    : in  std_logic                      := 'X';             -- chipselect
			j204c_tx_avs_address       : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			j204c_tx_avs_read          : in  std_logic                      := 'X';             -- read
			j204c_tx_avs_readdata      : out std_logic_vector(31 downto 0);                     -- readdata
			j204c_tx_avs_waitrequest   : out std_logic;                                         -- waitrequest
			j204c_tx_avs_write         : in  std_logic                      := 'X';             -- write
			j204c_tx_avs_writedata     : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			j204c_tx_avst_data         : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			j204c_tx_avst_valid        : in  std_logic                      := 'X';             -- valid
			j204c_tx_avst_ready        : out std_logic;                                         -- ready
			j204c_tx_avst_control      : in  std_logic                      := 'X';             -- export
			j204c_tx_cmd_data          : in  std_logic_vector(23 downto 0)  := (others => 'X'); -- data
			j204c_tx_cmd_valid         : in  std_logic                      := 'X';             -- valid
			j204c_tx_cmd_ready         : out std_logic;                                         -- ready
			j204c_tx_sysref            : in  std_logic                      := 'X';             -- export
			j204c_tx_somb              : out std_logic;                                         -- export
			j204c_tx_soemb             : out std_logic;                                         -- export
			j204c_tx_csr_l             : out std_logic_vector(3 downto 0);                      -- export
			j204c_tx_csr_f             : out std_logic_vector(7 downto 0);                      -- export
			j204c_tx_csr_m             : out std_logic_vector(7 downto 0);                      -- export
			j204c_tx_csr_cs            : out std_logic_vector(1 downto 0);                      -- export
			j204c_tx_csr_n             : out std_logic_vector(4 downto 0);                      -- export
			j204c_tx_csr_np            : out std_logic_vector(4 downto 0);                      -- export
			j204c_tx_csr_s             : out std_logic_vector(4 downto 0);                      -- export
			j204c_tx_csr_hd            : out std_logic;                                         -- export
			j204c_tx_csr_cf            : out std_logic_vector(4 downto 0);                      -- export
			j204c_tx_csr_e             : out std_logic_vector(7 downto 0);                      -- export
			j204c_tx_csr_testmode      : out std_logic_vector(3 downto 0);                      -- export
			j204c_tx_int               : out std_logic;                                         -- irq
			j204c_rx_avs_clk           : in  std_logic                      := 'X';             -- clk
			j204c_rx_avs_rst_n         : in  std_logic                      := 'X';             -- reset_n
			j204c_rx_avs_chipselect    : in  std_logic                      := 'X';             -- chipselect
			j204c_rx_avs_address       : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			j204c_rx_avs_read          : in  std_logic                      := 'X';             -- read
			j204c_rx_avs_readdata      : out std_logic_vector(31 downto 0);                     -- readdata
			j204c_rx_avs_waitrequest   : out std_logic;                                         -- waitrequest
			j204c_rx_avs_write         : in  std_logic                      := 'X';             -- write
			j204c_rx_avs_writedata     : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			j204c_rx_int               : out std_logic;                                         -- irq
			j204c_rx_csr_l             : out std_logic_vector(3 downto 0);                      -- export
			j204c_rx_csr_f             : out std_logic_vector(7 downto 0);                      -- export
			j204c_rx_csr_m             : out std_logic_vector(7 downto 0);                      -- export
			j204c_rx_csr_cs            : out std_logic_vector(1 downto 0);                      -- export
			j204c_rx_csr_n             : out std_logic_vector(4 downto 0);                      -- export
			j204c_rx_csr_np            : out std_logic_vector(4 downto 0);                      -- export
			j204c_rx_csr_s             : out std_logic_vector(4 downto 0);                      -- export
			j204c_rx_csr_hd            : out std_logic;                                         -- export
			j204c_rx_csr_cf            : out std_logic_vector(4 downto 0);                      -- export
			j204c_rx_csr_e             : out std_logic_vector(7 downto 0);                      -- export
			j204c_rx_csr_testmode      : out std_logic_vector(3 downto 0);                      -- export
			j204c_rx_sysref            : in  std_logic                      := 'X';             -- export
			j204c_rxlink_clk           : in  std_logic                      := 'X';             -- clk
			j204c_rxframe_clk          : in  std_logic                      := 'X';             -- clk
			j204c_rxlclk_ctrl          : in  std_logic                      := 'X';             -- export
			j204c_rxfclk_ctrl          : in  std_logic                      := 'X';             -- export
			j204c_rx_rst_n             : in  std_logic                      := 'X';             -- reset_n
			j204c_rx_dev_lane_align    : out std_logic;                                         -- export
			j204c_rx_alldev_lane_align : in  std_logic                      := 'X';             -- export
			j204c_rx_cmd_data          : out std_logic_vector(23 downto 0);                     -- data
			j204c_rx_cmd_valid         : out std_logic;                                         -- valid
			j204c_rx_cmd_ready         : in  std_logic                      := 'X';             -- ready
			j204c_rx_cmd_par_err       : out std_logic_vector(3 downto 0);                      -- export
			j204c_rx_somb              : out std_logic;                                         -- export
			j204c_rx_soemb             : out std_logic;                                         -- export
			j204c_rx_sh_lock           : out std_logic;                                         -- export
			j204c_rx_emb_lock          : out std_logic;                                         -- export
			j204c_rx_avst_data         : out std_logic_vector(255 downto 0);                    -- data
			j204c_rx_avst_valid        : out std_logic;                                         -- valid
			j204c_rx_avst_ready        : in  std_logic                      := 'X';             -- ready
			j204c_rx_avst_control      : out std_logic;                                         -- export
			j204c_rx_crc_err           : out std_logic_vector(3 downto 0);                      -- export
			rx_ready                   : out std_logic_vector(3 downto 0);                      -- export
			tx_ready                   : out std_logic_vector(3 downto 0)                       -- export
		);
	end component j204c_f_rx_tx_ip_intel_jesd204c_0;

	u0 : component j204c_f_rx_tx_ip_intel_jesd204c_0
		port map (
			j204c_tx_phy_rst_n         => CONNECTED_TO_j204c_tx_phy_rst_n,         --         j204c_tx_phy_rst_n.reset_n
			j204c_rx_phy_rst_n         => CONNECTED_TO_j204c_rx_phy_rst_n,         --         j204c_rx_phy_rst_n.reset_n
			rx_serial_data             => CONNECTED_TO_rx_serial_data,             --             rx_serial_data.export
			rx_serial_data_n           => CONNECTED_TO_rx_serial_data_n,           --           rx_serial_data_n.export
			j204c_pll_refclk           => CONNECTED_TO_j204c_pll_refclk,           --           j204c_pll_refclk.clk
			tx_pma_ready               => CONNECTED_TO_tx_pma_ready,               --               tx_pma_ready.export
			rx_pma_ready               => CONNECTED_TO_rx_pma_ready,               --               rx_pma_ready.export
			tx_serial_data             => CONNECTED_TO_tx_serial_data,             --             tx_serial_data.export
			tx_serial_data_n           => CONNECTED_TO_tx_serial_data_n,           --           tx_serial_data_n.export
			j204c_reconfig_clk         => CONNECTED_TO_j204c_reconfig_clk,         --         j204c_reconfig_clk.clk
			j204c_reconfig_reset       => CONNECTED_TO_j204c_reconfig_reset,       --       j204c_reconfig_reset.reset
			j204c_reconfig_address     => CONNECTED_TO_j204c_reconfig_address,     --             j204c_reconfig.address
			j204c_reconfig_read        => CONNECTED_TO_j204c_reconfig_read,        --                           .read
			j204c_reconfig_readdata    => CONNECTED_TO_j204c_reconfig_readdata,    --                           .readdata
			j204c_reconfig_waitrequest => CONNECTED_TO_j204c_reconfig_waitrequest, --                           .waitrequest
			j204c_reconfig_write       => CONNECTED_TO_j204c_reconfig_write,       --                           .write
			j204c_reconfig_writedata   => CONNECTED_TO_j204c_reconfig_writedata,   --                           .writedata
			j204c_txlink_clk           => CONNECTED_TO_j204c_txlink_clk,           --           j204c_txlink_clk.clk
			j204c_txframe_clk          => CONNECTED_TO_j204c_txframe_clk,          --          j204c_txframe_clk.clk
			j204c_tx_rst_n             => CONNECTED_TO_j204c_tx_rst_n,             --             j204c_tx_rst_n.reset_n
			j204c_txlclk_ctrl          => CONNECTED_TO_j204c_txlclk_ctrl,          --          j204c_txlclk_ctrl.export
			j204c_txfclk_ctrl          => CONNECTED_TO_j204c_txfclk_ctrl,          --          j204c_txfclk_ctrl.export
			j204c_tx_avs_clk           => CONNECTED_TO_j204c_tx_avs_clk,           --           j204c_tx_avs_clk.clk
			j204c_tx_avs_rst_n         => CONNECTED_TO_j204c_tx_avs_rst_n,         --         j204c_tx_avs_rst_n.reset_n
			j204c_tx_avs_chipselect    => CONNECTED_TO_j204c_tx_avs_chipselect,    --               j204c_tx_avs.chipselect
			j204c_tx_avs_address       => CONNECTED_TO_j204c_tx_avs_address,       --                           .address
			j204c_tx_avs_read          => CONNECTED_TO_j204c_tx_avs_read,          --                           .read
			j204c_tx_avs_readdata      => CONNECTED_TO_j204c_tx_avs_readdata,      --                           .readdata
			j204c_tx_avs_waitrequest   => CONNECTED_TO_j204c_tx_avs_waitrequest,   --                           .waitrequest
			j204c_tx_avs_write         => CONNECTED_TO_j204c_tx_avs_write,         --                           .write
			j204c_tx_avs_writedata     => CONNECTED_TO_j204c_tx_avs_writedata,     --                           .writedata
			j204c_tx_avst_data         => CONNECTED_TO_j204c_tx_avst_data,         --              j204c_tx_avst.data
			j204c_tx_avst_valid        => CONNECTED_TO_j204c_tx_avst_valid,        --                           .valid
			j204c_tx_avst_ready        => CONNECTED_TO_j204c_tx_avst_ready,        --                           .ready
			j204c_tx_avst_control      => CONNECTED_TO_j204c_tx_avst_control,      --      j204c_tx_avst_control.export
			j204c_tx_cmd_data          => CONNECTED_TO_j204c_tx_cmd_data,          --               j204c_tx_cmd.data
			j204c_tx_cmd_valid         => CONNECTED_TO_j204c_tx_cmd_valid,         --                           .valid
			j204c_tx_cmd_ready         => CONNECTED_TO_j204c_tx_cmd_ready,         --                           .ready
			j204c_tx_sysref            => CONNECTED_TO_j204c_tx_sysref,            --            j204c_tx_sysref.export
			j204c_tx_somb              => CONNECTED_TO_j204c_tx_somb,              --              j204c_tx_somb.export
			j204c_tx_soemb             => CONNECTED_TO_j204c_tx_soemb,             --             j204c_tx_soemb.export
			j204c_tx_csr_l             => CONNECTED_TO_j204c_tx_csr_l,             --             j204c_tx_csr_l.export
			j204c_tx_csr_f             => CONNECTED_TO_j204c_tx_csr_f,             --             j204c_tx_csr_f.export
			j204c_tx_csr_m             => CONNECTED_TO_j204c_tx_csr_m,             --             j204c_tx_csr_m.export
			j204c_tx_csr_cs            => CONNECTED_TO_j204c_tx_csr_cs,            --            j204c_tx_csr_cs.export
			j204c_tx_csr_n             => CONNECTED_TO_j204c_tx_csr_n,             --             j204c_tx_csr_n.export
			j204c_tx_csr_np            => CONNECTED_TO_j204c_tx_csr_np,            --            j204c_tx_csr_np.export
			j204c_tx_csr_s             => CONNECTED_TO_j204c_tx_csr_s,             --             j204c_tx_csr_s.export
			j204c_tx_csr_hd            => CONNECTED_TO_j204c_tx_csr_hd,            --            j204c_tx_csr_hd.export
			j204c_tx_csr_cf            => CONNECTED_TO_j204c_tx_csr_cf,            --            j204c_tx_csr_cf.export
			j204c_tx_csr_e             => CONNECTED_TO_j204c_tx_csr_e,             --             j204c_tx_csr_e.export
			j204c_tx_csr_testmode      => CONNECTED_TO_j204c_tx_csr_testmode,      --      j204c_tx_csr_testmode.export
			j204c_tx_int               => CONNECTED_TO_j204c_tx_int,               --               j204c_tx_int.irq
			j204c_rx_avs_clk           => CONNECTED_TO_j204c_rx_avs_clk,           --           j204c_rx_avs_clk.clk
			j204c_rx_avs_rst_n         => CONNECTED_TO_j204c_rx_avs_rst_n,         --         j204c_rx_avs_rst_n.reset_n
			j204c_rx_avs_chipselect    => CONNECTED_TO_j204c_rx_avs_chipselect,    --               j204c_rx_avs.chipselect
			j204c_rx_avs_address       => CONNECTED_TO_j204c_rx_avs_address,       --                           .address
			j204c_rx_avs_read          => CONNECTED_TO_j204c_rx_avs_read,          --                           .read
			j204c_rx_avs_readdata      => CONNECTED_TO_j204c_rx_avs_readdata,      --                           .readdata
			j204c_rx_avs_waitrequest   => CONNECTED_TO_j204c_rx_avs_waitrequest,   --                           .waitrequest
			j204c_rx_avs_write         => CONNECTED_TO_j204c_rx_avs_write,         --                           .write
			j204c_rx_avs_writedata     => CONNECTED_TO_j204c_rx_avs_writedata,     --                           .writedata
			j204c_rx_int               => CONNECTED_TO_j204c_rx_int,               --               j204c_rx_int.irq
			j204c_rx_csr_l             => CONNECTED_TO_j204c_rx_csr_l,             --             j204c_rx_csr_l.export
			j204c_rx_csr_f             => CONNECTED_TO_j204c_rx_csr_f,             --             j204c_rx_csr_f.export
			j204c_rx_csr_m             => CONNECTED_TO_j204c_rx_csr_m,             --             j204c_rx_csr_m.export
			j204c_rx_csr_cs            => CONNECTED_TO_j204c_rx_csr_cs,            --            j204c_rx_csr_cs.export
			j204c_rx_csr_n             => CONNECTED_TO_j204c_rx_csr_n,             --             j204c_rx_csr_n.export
			j204c_rx_csr_np            => CONNECTED_TO_j204c_rx_csr_np,            --            j204c_rx_csr_np.export
			j204c_rx_csr_s             => CONNECTED_TO_j204c_rx_csr_s,             --             j204c_rx_csr_s.export
			j204c_rx_csr_hd            => CONNECTED_TO_j204c_rx_csr_hd,            --            j204c_rx_csr_hd.export
			j204c_rx_csr_cf            => CONNECTED_TO_j204c_rx_csr_cf,            --            j204c_rx_csr_cf.export
			j204c_rx_csr_e             => CONNECTED_TO_j204c_rx_csr_e,             --             j204c_rx_csr_e.export
			j204c_rx_csr_testmode      => CONNECTED_TO_j204c_rx_csr_testmode,      --      j204c_rx_csr_testmode.export
			j204c_rx_sysref            => CONNECTED_TO_j204c_rx_sysref,            --            j204c_rx_sysref.export
			j204c_rxlink_clk           => CONNECTED_TO_j204c_rxlink_clk,           --           j204c_rxlink_clk.clk
			j204c_rxframe_clk          => CONNECTED_TO_j204c_rxframe_clk,          --          j204c_rxframe_clk.clk
			j204c_rxlclk_ctrl          => CONNECTED_TO_j204c_rxlclk_ctrl,          --          j204c_rxlclk_ctrl.export
			j204c_rxfclk_ctrl          => CONNECTED_TO_j204c_rxfclk_ctrl,          --          j204c_rxfclk_ctrl.export
			j204c_rx_rst_n             => CONNECTED_TO_j204c_rx_rst_n,             --             j204c_rx_rst_n.reset_n
			j204c_rx_dev_lane_align    => CONNECTED_TO_j204c_rx_dev_lane_align,    --    j204c_rx_dev_lane_align.export
			j204c_rx_alldev_lane_align => CONNECTED_TO_j204c_rx_alldev_lane_align, -- j204c_rx_alldev_lane_align.export
			j204c_rx_cmd_data          => CONNECTED_TO_j204c_rx_cmd_data,          --               j204c_rx_cmd.data
			j204c_rx_cmd_valid         => CONNECTED_TO_j204c_rx_cmd_valid,         --                           .valid
			j204c_rx_cmd_ready         => CONNECTED_TO_j204c_rx_cmd_ready,         --                           .ready
			j204c_rx_cmd_par_err       => CONNECTED_TO_j204c_rx_cmd_par_err,       --       j204c_rx_cmd_par_err.export
			j204c_rx_somb              => CONNECTED_TO_j204c_rx_somb,              --              j204c_rx_somb.export
			j204c_rx_soemb             => CONNECTED_TO_j204c_rx_soemb,             --             j204c_rx_soemb.export
			j204c_rx_sh_lock           => CONNECTED_TO_j204c_rx_sh_lock,           --           j204c_rx_sh_lock.export
			j204c_rx_emb_lock          => CONNECTED_TO_j204c_rx_emb_lock,          --          j204c_rx_emb_lock.export
			j204c_rx_avst_data         => CONNECTED_TO_j204c_rx_avst_data,         --              j204c_rx_avst.data
			j204c_rx_avst_valid        => CONNECTED_TO_j204c_rx_avst_valid,        --                           .valid
			j204c_rx_avst_ready        => CONNECTED_TO_j204c_rx_avst_ready,        --                           .ready
			j204c_rx_avst_control      => CONNECTED_TO_j204c_rx_avst_control,      --      j204c_rx_avst_control.export
			j204c_rx_crc_err           => CONNECTED_TO_j204c_rx_crc_err,           --           j204c_rx_crc_err.export
			rx_ready                   => CONNECTED_TO_rx_ready,                   --                   rx_ready.export
			tx_ready                   => CONNECTED_TO_tx_ready                    --                   tx_ready.export
		);

