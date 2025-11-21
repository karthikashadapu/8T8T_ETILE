	component tod_slave_sub_system is
		port (
			master_tod_split_conduit_end_data             : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			master_tod_split_conduit_end_valid            : in  std_logic                     := 'X';             -- valid
			master_tod_split_conduit_end_10_data          : out std_logic_vector(95 downto 0);                    -- data
			master_tod_split_conduit_end_10_valid         : out std_logic;                                        -- valid
			oran_tod_stack_tx_clk_clk                     : in  std_logic                     := 'X';             -- clk
			oran_tod_stack_rx_clk_clk                     : in  std_logic                     := 'X';             -- clk
			oran_tod_stack_todsync_sample_clk_clk         : in  std_logic                     := 'X';             -- clk
			oran_tod_stack_tx_tod_interface_tdata         : out std_logic_vector(95 downto 0);                    -- tdata
			oran_tod_stack_tx_tod_interface_tvalid        : out std_logic;                                        -- tvalid
			oran_tod_stack_rx_tod_interface_tdata         : out std_logic_vector(95 downto 0);                    -- tdata
			oran_tod_stack_rx_tod_interface_tvalid        : out std_logic;                                        -- tvalid
			oran_tod_stack_tx_pll_locked_lock             : in  std_logic                     := 'X';             -- lock
			port_8_tod_stack_tx_clk_clk                   : in  std_logic                     := 'X';             -- clk
			port_8_tod_stack_rx_clk_clk                   : in  std_logic                     := 'X';             -- clk
			port_8_tod_stack_todsync_sample_clk_clk       : in  std_logic                     := 'X';             -- clk
			port_8_tod_stack_tx_tod_interface_tdata       : out std_logic_vector(95 downto 0);                    -- tdata
			port_8_tod_stack_tx_tod_interface_tvalid      : out std_logic;                                        -- tvalid
			port_8_tod_stack_rx_tod_interface_tdata       : out std_logic_vector(95 downto 0);                    -- tdata
			port_8_tod_stack_rx_tod_interface_tvalid      : out std_logic;                                        -- tvalid
			port_8_tod_stack_tx_pll_locked_lock           : in  std_logic                     := 'X';             -- lock
			tod_subsys_clk_100_in_clk_clk                 : in  std_logic                     := 'X';             -- clk
			tod_subsys_mtod_clk_in_clk_clk                : in  std_logic                     := 'X';             -- clk
			tod_subsys_rst_100_in_reset_reset_n           : in  std_logic                     := 'X';             -- reset_n
			todsync_sample_plllock_split_conduit_end_lock : in  std_logic_vector(0 downto 0)  := (others => 'X')  -- lock
		);
	end component tod_slave_sub_system;

	u0 : component tod_slave_sub_system
		port map (
			master_tod_split_conduit_end_data             => CONNECTED_TO_master_tod_split_conduit_end_data,             --             master_tod_split_conduit_end.data
			master_tod_split_conduit_end_valid            => CONNECTED_TO_master_tod_split_conduit_end_valid,            --                                         .valid
			master_tod_split_conduit_end_10_data          => CONNECTED_TO_master_tod_split_conduit_end_10_data,          --          master_tod_split_conduit_end_10.data
			master_tod_split_conduit_end_10_valid         => CONNECTED_TO_master_tod_split_conduit_end_10_valid,         --                                         .valid
			oran_tod_stack_tx_clk_clk                     => CONNECTED_TO_oran_tod_stack_tx_clk_clk,                     --                    oran_tod_stack_tx_clk.clk
			oran_tod_stack_rx_clk_clk                     => CONNECTED_TO_oran_tod_stack_rx_clk_clk,                     --                    oran_tod_stack_rx_clk.clk
			oran_tod_stack_todsync_sample_clk_clk         => CONNECTED_TO_oran_tod_stack_todsync_sample_clk_clk,         --        oran_tod_stack_todsync_sample_clk.clk
			oran_tod_stack_tx_tod_interface_tdata         => CONNECTED_TO_oran_tod_stack_tx_tod_interface_tdata,         --          oran_tod_stack_tx_tod_interface.tdata
			oran_tod_stack_tx_tod_interface_tvalid        => CONNECTED_TO_oran_tod_stack_tx_tod_interface_tvalid,        --                                         .tvalid
			oran_tod_stack_rx_tod_interface_tdata         => CONNECTED_TO_oran_tod_stack_rx_tod_interface_tdata,         --          oran_tod_stack_rx_tod_interface.tdata
			oran_tod_stack_rx_tod_interface_tvalid        => CONNECTED_TO_oran_tod_stack_rx_tod_interface_tvalid,        --                                         .tvalid
			oran_tod_stack_tx_pll_locked_lock             => CONNECTED_TO_oran_tod_stack_tx_pll_locked_lock,             --             oran_tod_stack_tx_pll_locked.lock
			port_8_tod_stack_tx_clk_clk                   => CONNECTED_TO_port_8_tod_stack_tx_clk_clk,                   --                  port_8_tod_stack_tx_clk.clk
			port_8_tod_stack_rx_clk_clk                   => CONNECTED_TO_port_8_tod_stack_rx_clk_clk,                   --                  port_8_tod_stack_rx_clk.clk
			port_8_tod_stack_todsync_sample_clk_clk       => CONNECTED_TO_port_8_tod_stack_todsync_sample_clk_clk,       --      port_8_tod_stack_todsync_sample_clk.clk
			port_8_tod_stack_tx_tod_interface_tdata       => CONNECTED_TO_port_8_tod_stack_tx_tod_interface_tdata,       --        port_8_tod_stack_tx_tod_interface.tdata
			port_8_tod_stack_tx_tod_interface_tvalid      => CONNECTED_TO_port_8_tod_stack_tx_tod_interface_tvalid,      --                                         .tvalid
			port_8_tod_stack_rx_tod_interface_tdata       => CONNECTED_TO_port_8_tod_stack_rx_tod_interface_tdata,       --        port_8_tod_stack_rx_tod_interface.tdata
			port_8_tod_stack_rx_tod_interface_tvalid      => CONNECTED_TO_port_8_tod_stack_rx_tod_interface_tvalid,      --                                         .tvalid
			port_8_tod_stack_tx_pll_locked_lock           => CONNECTED_TO_port_8_tod_stack_tx_pll_locked_lock,           --           port_8_tod_stack_tx_pll_locked.lock
			tod_subsys_clk_100_in_clk_clk                 => CONNECTED_TO_tod_subsys_clk_100_in_clk_clk,                 --                tod_subsys_clk_100_in_clk.clk
			tod_subsys_mtod_clk_in_clk_clk                => CONNECTED_TO_tod_subsys_mtod_clk_in_clk_clk,                --               tod_subsys_mtod_clk_in_clk.clk
			tod_subsys_rst_100_in_reset_reset_n           => CONNECTED_TO_tod_subsys_rst_100_in_reset_reset_n,           --              tod_subsys_rst_100_in_reset.reset_n
			todsync_sample_plllock_split_conduit_end_lock => CONNECTED_TO_todsync_sample_plllock_split_conduit_end_lock  -- todsync_sample_plllock_split_conduit_end.lock
		);

