	component port_0_tod_stack is
		generic (
			NUMPORTS : integer := 1
		);
		port (
			i_reconfig_clk              : in  std_logic                     := 'X';             -- clk
			i_reconfig_reset            : in  std_logic                     := 'X';             -- reset_n
			i_clk_tx_tod                : in  std_logic                     := 'X';             -- clk
			i_clk_rx_tod                : in  std_logic                     := 'X';             -- clk
			i_clk_master_tod            : in  std_logic                     := 'X';             -- clk
			i_clk_todsync_sample        : in  std_logic                     := 'X';             -- clk
			i_clk_todsync_sample_locked : in  std_logic                     := 'X';             -- lock
			i_ptp_master_tod            : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			i_ptp_master_tod_valid      : in  std_logic                     := 'X';             -- valid
			ptp_tx_tod                  : out std_logic_vector(95 downto 0);                    -- tdata
			ptp_tx_tod_valid            : out std_logic;                                        -- tvalid
			ptp_rx_tod                  : out std_logic_vector(95 downto 0);                    -- tdata
			ptp_rx_tod_valid            : out std_logic;                                        -- tvalid
			i_tx_pll_locked             : in  std_logic                     := 'X';             -- lock
			i_ptp_master_tod_rst_n      : in  std_logic                     := 'X'              -- reset_n
		);
	end component port_0_tod_stack;

	u0 : component port_0_tod_stack
		generic map (
			NUMPORTS => INTEGER_VALUE_FOR_NUMPORTS
		)
		port map (
			i_reconfig_clk              => CONNECTED_TO_i_reconfig_clk,              --          reconfig_clk.clk
			i_reconfig_reset            => CONNECTED_TO_i_reconfig_reset,            --       reconfig_resetn.reset_n
			i_clk_tx_tod                => CONNECTED_TO_i_clk_tx_tod,                --                tx_clk.clk
			i_clk_rx_tod                => CONNECTED_TO_i_clk_rx_tod,                --                rx_clk.clk
			i_clk_master_tod            => CONNECTED_TO_i_clk_master_tod,            --              mtod_clk.clk
			i_clk_todsync_sample        => CONNECTED_TO_i_clk_todsync_sample,        --    todsync_sample_clk.clk
			i_clk_todsync_sample_locked => CONNECTED_TO_i_clk_todsync_sample_locked, -- todsync_sample_locked.lock
			i_ptp_master_tod            => CONNECTED_TO_i_ptp_master_tod,            --  master_tod_interface.data
			i_ptp_master_tod_valid      => CONNECTED_TO_i_ptp_master_tod_valid,      --                      .valid
			ptp_tx_tod                  => CONNECTED_TO_ptp_tx_tod,                  --      tx_tod_interface.tdata
			ptp_tx_tod_valid            => CONNECTED_TO_ptp_tx_tod_valid,            --                      .tvalid
			ptp_rx_tod                  => CONNECTED_TO_ptp_rx_tod,                  --      rx_tod_interface.tdata
			ptp_rx_tod_valid            => CONNECTED_TO_ptp_rx_tod_valid,            --                      .tvalid
			i_tx_pll_locked             => CONNECTED_TO_i_tx_pll_locked,             --         tx_pll_locked.lock
			i_ptp_master_tod_rst_n      => CONNECTED_TO_i_ptp_master_tod_rst_n       --          mtod_reset_n.reset_n
		);

