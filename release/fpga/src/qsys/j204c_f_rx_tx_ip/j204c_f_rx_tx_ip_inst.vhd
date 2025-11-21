	component j204c_f_rx_tx_ip is
		port (
			intel_jesd204c_1_rx_serial_data_export        : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- export
			intel_jesd204c_1_rx_serial_data_n_export      : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- export
			intel_jesd204c_1_tx_pma_ready_export          : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_rx_pma_ready_export          : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_tx_serial_data_export        : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_tx_serial_data_n_export      : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_j204c_reconfig_address       : in  std_logic_vector(20 downto 0)  := (others => 'X'); -- address
			intel_jesd204c_1_j204c_reconfig_read          : in  std_logic                      := 'X';             -- read
			intel_jesd204c_1_j204c_reconfig_readdata      : out std_logic_vector(7 downto 0);                      -- readdata
			intel_jesd204c_1_j204c_reconfig_waitrequest   : out std_logic;                                         -- waitrequest
			intel_jesd204c_1_j204c_reconfig_write         : in  std_logic                      := 'X';             -- write
			intel_jesd204c_1_j204c_reconfig_writedata     : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- writedata
			intel_jesd204c_1_j204c_txlclk_ctrl_export     : in  std_logic                      := 'X';             -- export
			intel_jesd204c_1_j204c_txfclk_ctrl_export     : in  std_logic                      := 'X';             -- export
			intel_jesd204c_1_j204c_tx_avs_chipselect      : in  std_logic                      := 'X';             -- chipselect
			intel_jesd204c_1_j204c_tx_avs_address         : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			intel_jesd204c_1_j204c_tx_avs_read            : in  std_logic                      := 'X';             -- read
			intel_jesd204c_1_j204c_tx_avs_readdata        : out std_logic_vector(31 downto 0);                     -- readdata
			intel_jesd204c_1_j204c_tx_avs_waitrequest     : out std_logic;                                         -- waitrequest
			intel_jesd204c_1_j204c_tx_avs_write           : in  std_logic                      := 'X';             -- write
			intel_jesd204c_1_j204c_tx_avs_writedata       : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			intel_jesd204c_1_j204c_tx_avst_data           : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			intel_jesd204c_1_j204c_tx_avst_valid          : in  std_logic                      := 'X';             -- valid
			intel_jesd204c_1_j204c_tx_avst_ready          : out std_logic;                                         -- ready
			intel_jesd204c_1_j204c_tx_avst_control_export : in  std_logic                      := 'X';             -- export
			intel_jesd204c_1_j204c_tx_sysref_export       : in  std_logic                      := 'X';             -- export
			intel_jesd204c_1_j204c_tx_somb_export         : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_tx_soemb_export        : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_tx_csr_l_export        : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_f_export        : out std_logic_vector(7 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_m_export        : out std_logic_vector(7 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_cs_export       : out std_logic_vector(1 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_n_export        : out std_logic_vector(4 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_np_export       : out std_logic_vector(4 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_s_export        : out std_logic_vector(4 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_hd_export       : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_tx_csr_cf_export       : out std_logic_vector(4 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_e_export        : out std_logic_vector(7 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_csr_testmode_export : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_j204c_tx_int_irq             : out std_logic;                                         -- irq
			intel_jesd204c_1_j204c_rx_avs_chipselect      : in  std_logic                      := 'X';             -- chipselect
			intel_jesd204c_1_j204c_rx_avs_address         : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			intel_jesd204c_1_j204c_rx_avs_read            : in  std_logic                      := 'X';             -- read
			intel_jesd204c_1_j204c_rx_avs_readdata        : out std_logic_vector(31 downto 0);                     -- readdata
			intel_jesd204c_1_j204c_rx_avs_waitrequest     : out std_logic;                                         -- waitrequest
			intel_jesd204c_1_j204c_rx_avs_write           : in  std_logic                      := 'X';             -- write
			intel_jesd204c_1_j204c_rx_avs_writedata       : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			intel_jesd204c_1_j204c_rx_int_irq             : out std_logic;                                         -- irq
			intel_jesd204c_1_j204c_rx_csr_l_export        : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_f_export        : out std_logic_vector(7 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_m_export        : out std_logic_vector(7 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_cs_export       : out std_logic_vector(1 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_n_export        : out std_logic_vector(4 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_np_export       : out std_logic_vector(4 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_s_export        : out std_logic_vector(4 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_hd_export       : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_rx_csr_cf_export       : out std_logic_vector(4 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_e_export        : out std_logic_vector(7 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_csr_testmode_export : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_sysref_export       : in  std_logic                      := 'X';             -- export
			intel_jesd204c_1_j204c_rxlclk_ctrl_export     : in  std_logic                      := 'X';             -- export
			intel_jesd204c_1_j204c_rxfclk_ctrl_export     : in  std_logic                      := 'X';             -- export
			intel_jesd204c_1_j204c_rx_cmd_par_err_export  : out std_logic_vector(3 downto 0);                      -- export
			intel_jesd204c_1_j204c_rx_somb_export         : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_rx_soemb_export        : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_rx_sh_lock_export      : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_rx_emb_lock_export     : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_rx_avst_data           : out std_logic_vector(255 downto 0);                    -- data
			intel_jesd204c_1_j204c_rx_avst_valid          : out std_logic;                                         -- valid
			intel_jesd204c_1_j204c_rx_avst_ready          : in  std_logic                      := 'X';             -- ready
			intel_jesd204c_1_j204c_rx_avst_control_export : out std_logic;                                         -- export
			intel_jesd204c_1_j204c_rx_crc_err_export      : out std_logic_vector(3 downto 0);                      -- export
			jesd_link_clk_in_clk_clk                      : in  std_logic                      := 'X';             -- clk
			mgmt_clk_in_clk_clk                           : in  std_logic                      := 'X';             -- clk
			mgmt_reset_in_reset_reset_n                   : in  std_logic                      := 'X';             -- reset_n
			reset_out1_reset                              : out std_logic;                                         -- reset
			reset_out2_reset                              : out std_logic;                                         -- reset
			reset_out4_reset                              : out std_logic;                                         -- reset
			reset1_dsrt_qual_reset1_dsrt_qual             : in  std_logic                      := 'X';             -- reset1_dsrt_qual
			reset2_dsrt_qual_reset2_dsrt_qual             : in  std_logic                      := 'X';             -- reset2_dsrt_qual
			reset4_dsrt_qual_reset4_dsrt_qual             : in  std_logic                      := 'X';             -- reset4_dsrt_qual
			reset_sequencer_0_av_csr_address              : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- address
			reset_sequencer_0_av_csr_readdata             : out std_logic_vector(31 downto 0);                     -- readdata
			reset_sequencer_0_av_csr_read                 : in  std_logic                      := 'X';             -- read
			reset_sequencer_0_av_csr_writedata            : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			reset_sequencer_0_av_csr_write                : in  std_logic                      := 'X';             -- write
			reset_sequencer_0_av_csr_irq_irq              : out std_logic                                          -- irq
		);
	end component j204c_f_rx_tx_ip;

	u0 : component j204c_f_rx_tx_ip
		port map (
			intel_jesd204c_1_rx_serial_data_export        => CONNECTED_TO_intel_jesd204c_1_rx_serial_data_export,        --        intel_jesd204c_1_rx_serial_data.export
			intel_jesd204c_1_rx_serial_data_n_export      => CONNECTED_TO_intel_jesd204c_1_rx_serial_data_n_export,      --      intel_jesd204c_1_rx_serial_data_n.export
			intel_jesd204c_1_tx_pma_ready_export          => CONNECTED_TO_intel_jesd204c_1_tx_pma_ready_export,          --          intel_jesd204c_1_tx_pma_ready.export
			intel_jesd204c_1_rx_pma_ready_export          => CONNECTED_TO_intel_jesd204c_1_rx_pma_ready_export,          --          intel_jesd204c_1_rx_pma_ready.export
			intel_jesd204c_1_tx_serial_data_export        => CONNECTED_TO_intel_jesd204c_1_tx_serial_data_export,        --        intel_jesd204c_1_tx_serial_data.export
			intel_jesd204c_1_tx_serial_data_n_export      => CONNECTED_TO_intel_jesd204c_1_tx_serial_data_n_export,      --      intel_jesd204c_1_tx_serial_data_n.export
			intel_jesd204c_1_j204c_reconfig_address       => CONNECTED_TO_intel_jesd204c_1_j204c_reconfig_address,       --        intel_jesd204c_1_j204c_reconfig.address
			intel_jesd204c_1_j204c_reconfig_read          => CONNECTED_TO_intel_jesd204c_1_j204c_reconfig_read,          --                                       .read
			intel_jesd204c_1_j204c_reconfig_readdata      => CONNECTED_TO_intel_jesd204c_1_j204c_reconfig_readdata,      --                                       .readdata
			intel_jesd204c_1_j204c_reconfig_waitrequest   => CONNECTED_TO_intel_jesd204c_1_j204c_reconfig_waitrequest,   --                                       .waitrequest
			intel_jesd204c_1_j204c_reconfig_write         => CONNECTED_TO_intel_jesd204c_1_j204c_reconfig_write,         --                                       .write
			intel_jesd204c_1_j204c_reconfig_writedata     => CONNECTED_TO_intel_jesd204c_1_j204c_reconfig_writedata,     --                                       .writedata
			intel_jesd204c_1_j204c_txlclk_ctrl_export     => CONNECTED_TO_intel_jesd204c_1_j204c_txlclk_ctrl_export,     --     intel_jesd204c_1_j204c_txlclk_ctrl.export
			intel_jesd204c_1_j204c_txfclk_ctrl_export     => CONNECTED_TO_intel_jesd204c_1_j204c_txfclk_ctrl_export,     --     intel_jesd204c_1_j204c_txfclk_ctrl.export
			intel_jesd204c_1_j204c_tx_avs_chipselect      => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avs_chipselect,      --          intel_jesd204c_1_j204c_tx_avs.chipselect
			intel_jesd204c_1_j204c_tx_avs_address         => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avs_address,         --                                       .address
			intel_jesd204c_1_j204c_tx_avs_read            => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avs_read,            --                                       .read
			intel_jesd204c_1_j204c_tx_avs_readdata        => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avs_readdata,        --                                       .readdata
			intel_jesd204c_1_j204c_tx_avs_waitrequest     => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avs_waitrequest,     --                                       .waitrequest
			intel_jesd204c_1_j204c_tx_avs_write           => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avs_write,           --                                       .write
			intel_jesd204c_1_j204c_tx_avs_writedata       => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avs_writedata,       --                                       .writedata
			intel_jesd204c_1_j204c_tx_avst_data           => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avst_data,           --         intel_jesd204c_1_j204c_tx_avst.data
			intel_jesd204c_1_j204c_tx_avst_valid          => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avst_valid,          --                                       .valid
			intel_jesd204c_1_j204c_tx_avst_ready          => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avst_ready,          --                                       .ready
			intel_jesd204c_1_j204c_tx_avst_control_export => CONNECTED_TO_intel_jesd204c_1_j204c_tx_avst_control_export, -- intel_jesd204c_1_j204c_tx_avst_control.export
			intel_jesd204c_1_j204c_tx_sysref_export       => CONNECTED_TO_intel_jesd204c_1_j204c_tx_sysref_export,       --       intel_jesd204c_1_j204c_tx_sysref.export
			intel_jesd204c_1_j204c_tx_somb_export         => CONNECTED_TO_intel_jesd204c_1_j204c_tx_somb_export,         --         intel_jesd204c_1_j204c_tx_somb.export
			intel_jesd204c_1_j204c_tx_soemb_export        => CONNECTED_TO_intel_jesd204c_1_j204c_tx_soemb_export,        --        intel_jesd204c_1_j204c_tx_soemb.export
			intel_jesd204c_1_j204c_tx_csr_l_export        => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_l_export,        --        intel_jesd204c_1_j204c_tx_csr_l.export
			intel_jesd204c_1_j204c_tx_csr_f_export        => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_f_export,        --        intel_jesd204c_1_j204c_tx_csr_f.export
			intel_jesd204c_1_j204c_tx_csr_m_export        => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_m_export,        --        intel_jesd204c_1_j204c_tx_csr_m.export
			intel_jesd204c_1_j204c_tx_csr_cs_export       => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_cs_export,       --       intel_jesd204c_1_j204c_tx_csr_cs.export
			intel_jesd204c_1_j204c_tx_csr_n_export        => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_n_export,        --        intel_jesd204c_1_j204c_tx_csr_n.export
			intel_jesd204c_1_j204c_tx_csr_np_export       => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_np_export,       --       intel_jesd204c_1_j204c_tx_csr_np.export
			intel_jesd204c_1_j204c_tx_csr_s_export        => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_s_export,        --        intel_jesd204c_1_j204c_tx_csr_s.export
			intel_jesd204c_1_j204c_tx_csr_hd_export       => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_hd_export,       --       intel_jesd204c_1_j204c_tx_csr_hd.export
			intel_jesd204c_1_j204c_tx_csr_cf_export       => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_cf_export,       --       intel_jesd204c_1_j204c_tx_csr_cf.export
			intel_jesd204c_1_j204c_tx_csr_e_export        => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_e_export,        --        intel_jesd204c_1_j204c_tx_csr_e.export
			intel_jesd204c_1_j204c_tx_csr_testmode_export => CONNECTED_TO_intel_jesd204c_1_j204c_tx_csr_testmode_export, -- intel_jesd204c_1_j204c_tx_csr_testmode.export
			intel_jesd204c_1_j204c_tx_int_irq             => CONNECTED_TO_intel_jesd204c_1_j204c_tx_int_irq,             --          intel_jesd204c_1_j204c_tx_int.irq
			intel_jesd204c_1_j204c_rx_avs_chipselect      => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avs_chipselect,      --          intel_jesd204c_1_j204c_rx_avs.chipselect
			intel_jesd204c_1_j204c_rx_avs_address         => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avs_address,         --                                       .address
			intel_jesd204c_1_j204c_rx_avs_read            => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avs_read,            --                                       .read
			intel_jesd204c_1_j204c_rx_avs_readdata        => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avs_readdata,        --                                       .readdata
			intel_jesd204c_1_j204c_rx_avs_waitrequest     => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avs_waitrequest,     --                                       .waitrequest
			intel_jesd204c_1_j204c_rx_avs_write           => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avs_write,           --                                       .write
			intel_jesd204c_1_j204c_rx_avs_writedata       => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avs_writedata,       --                                       .writedata
			intel_jesd204c_1_j204c_rx_int_irq             => CONNECTED_TO_intel_jesd204c_1_j204c_rx_int_irq,             --          intel_jesd204c_1_j204c_rx_int.irq
			intel_jesd204c_1_j204c_rx_csr_l_export        => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_l_export,        --        intel_jesd204c_1_j204c_rx_csr_l.export
			intel_jesd204c_1_j204c_rx_csr_f_export        => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_f_export,        --        intel_jesd204c_1_j204c_rx_csr_f.export
			intel_jesd204c_1_j204c_rx_csr_m_export        => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_m_export,        --        intel_jesd204c_1_j204c_rx_csr_m.export
			intel_jesd204c_1_j204c_rx_csr_cs_export       => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_cs_export,       --       intel_jesd204c_1_j204c_rx_csr_cs.export
			intel_jesd204c_1_j204c_rx_csr_n_export        => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_n_export,        --        intel_jesd204c_1_j204c_rx_csr_n.export
			intel_jesd204c_1_j204c_rx_csr_np_export       => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_np_export,       --       intel_jesd204c_1_j204c_rx_csr_np.export
			intel_jesd204c_1_j204c_rx_csr_s_export        => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_s_export,        --        intel_jesd204c_1_j204c_rx_csr_s.export
			intel_jesd204c_1_j204c_rx_csr_hd_export       => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_hd_export,       --       intel_jesd204c_1_j204c_rx_csr_hd.export
			intel_jesd204c_1_j204c_rx_csr_cf_export       => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_cf_export,       --       intel_jesd204c_1_j204c_rx_csr_cf.export
			intel_jesd204c_1_j204c_rx_csr_e_export        => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_e_export,        --        intel_jesd204c_1_j204c_rx_csr_e.export
			intel_jesd204c_1_j204c_rx_csr_testmode_export => CONNECTED_TO_intel_jesd204c_1_j204c_rx_csr_testmode_export, -- intel_jesd204c_1_j204c_rx_csr_testmode.export
			intel_jesd204c_1_j204c_rx_sysref_export       => CONNECTED_TO_intel_jesd204c_1_j204c_rx_sysref_export,       --       intel_jesd204c_1_j204c_rx_sysref.export
			intel_jesd204c_1_j204c_rxlclk_ctrl_export     => CONNECTED_TO_intel_jesd204c_1_j204c_rxlclk_ctrl_export,     --     intel_jesd204c_1_j204c_rxlclk_ctrl.export
			intel_jesd204c_1_j204c_rxfclk_ctrl_export     => CONNECTED_TO_intel_jesd204c_1_j204c_rxfclk_ctrl_export,     --     intel_jesd204c_1_j204c_rxfclk_ctrl.export
			intel_jesd204c_1_j204c_rx_cmd_par_err_export  => CONNECTED_TO_intel_jesd204c_1_j204c_rx_cmd_par_err_export,  --  intel_jesd204c_1_j204c_rx_cmd_par_err.export
			intel_jesd204c_1_j204c_rx_somb_export         => CONNECTED_TO_intel_jesd204c_1_j204c_rx_somb_export,         --         intel_jesd204c_1_j204c_rx_somb.export
			intel_jesd204c_1_j204c_rx_soemb_export        => CONNECTED_TO_intel_jesd204c_1_j204c_rx_soemb_export,        --        intel_jesd204c_1_j204c_rx_soemb.export
			intel_jesd204c_1_j204c_rx_sh_lock_export      => CONNECTED_TO_intel_jesd204c_1_j204c_rx_sh_lock_export,      --      intel_jesd204c_1_j204c_rx_sh_lock.export
			intel_jesd204c_1_j204c_rx_emb_lock_export     => CONNECTED_TO_intel_jesd204c_1_j204c_rx_emb_lock_export,     --     intel_jesd204c_1_j204c_rx_emb_lock.export
			intel_jesd204c_1_j204c_rx_avst_data           => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avst_data,           --         intel_jesd204c_1_j204c_rx_avst.data
			intel_jesd204c_1_j204c_rx_avst_valid          => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avst_valid,          --                                       .valid
			intel_jesd204c_1_j204c_rx_avst_ready          => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avst_ready,          --                                       .ready
			intel_jesd204c_1_j204c_rx_avst_control_export => CONNECTED_TO_intel_jesd204c_1_j204c_rx_avst_control_export, -- intel_jesd204c_1_j204c_rx_avst_control.export
			intel_jesd204c_1_j204c_rx_crc_err_export      => CONNECTED_TO_intel_jesd204c_1_j204c_rx_crc_err_export,      --      intel_jesd204c_1_j204c_rx_crc_err.export
			jesd_link_clk_in_clk_clk                      => CONNECTED_TO_jesd_link_clk_in_clk_clk,                      --                   jesd_link_clk_in_clk.clk
			mgmt_clk_in_clk_clk                           => CONNECTED_TO_mgmt_clk_in_clk_clk,                           --                        mgmt_clk_in_clk.clk
			mgmt_reset_in_reset_reset_n                   => CONNECTED_TO_mgmt_reset_in_reset_reset_n,                   --                    mgmt_reset_in_reset.reset_n
			reset_out1_reset                              => CONNECTED_TO_reset_out1_reset,                              --                             reset_out1.reset
			reset_out2_reset                              => CONNECTED_TO_reset_out2_reset,                              --                             reset_out2.reset
			reset_out4_reset                              => CONNECTED_TO_reset_out4_reset,                              --                             reset_out4.reset
			reset1_dsrt_qual_reset1_dsrt_qual             => CONNECTED_TO_reset1_dsrt_qual_reset1_dsrt_qual,             --                       reset1_dsrt_qual.reset1_dsrt_qual
			reset2_dsrt_qual_reset2_dsrt_qual             => CONNECTED_TO_reset2_dsrt_qual_reset2_dsrt_qual,             --                       reset2_dsrt_qual.reset2_dsrt_qual
			reset4_dsrt_qual_reset4_dsrt_qual             => CONNECTED_TO_reset4_dsrt_qual_reset4_dsrt_qual,             --                       reset4_dsrt_qual.reset4_dsrt_qual
			reset_sequencer_0_av_csr_address              => CONNECTED_TO_reset_sequencer_0_av_csr_address,              --               reset_sequencer_0_av_csr.address
			reset_sequencer_0_av_csr_readdata             => CONNECTED_TO_reset_sequencer_0_av_csr_readdata,             --                                       .readdata
			reset_sequencer_0_av_csr_read                 => CONNECTED_TO_reset_sequencer_0_av_csr_read,                 --                                       .read
			reset_sequencer_0_av_csr_writedata            => CONNECTED_TO_reset_sequencer_0_av_csr_writedata,            --                                       .writedata
			reset_sequencer_0_av_csr_write                => CONNECTED_TO_reset_sequencer_0_av_csr_write,                --                                       .write
			reset_sequencer_0_av_csr_irq_irq              => CONNECTED_TO_reset_sequencer_0_av_csr_irq_irq               --           reset_sequencer_0_av_csr_irq.irq
		);

