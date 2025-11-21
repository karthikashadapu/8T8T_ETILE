	component oran_tod_subsys is
		port (
			eth_1588_tod_synchronizer_clk_master_clk      : in  std_logic                     := 'X';             -- clk
			eth_1588_tod_synchronizer_reset_master_reset  : in  std_logic                     := 'X';             -- reset
			eth_1588_tod_synchronizer_clk_slave_clk       : in  std_logic                     := 'X';             -- clk
			eth_1588_tod_synchronizer_reset_slave_reset   : in  std_logic                     := 'X';             -- reset
			eth_1588_tod_synchronizer_clk_sampling_clk    : in  std_logic                     := 'X';             -- clk
			eth_1588_tod_synchronizer_start_tod_sync_data : in  std_logic                     := 'X';             -- data
			oran_tod_time_of_day_96b_data                 : out std_logic_vector(95 downto 0);                    -- data
			oran_tod_time_of_day_96b_valid                : out std_logic;                                        -- valid
			rst_tod_n_reset_n                             : in  std_logic                     := 'X';             -- reset_n
			ptp_seconds_data                              : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			clk_tod_clk                                   : in  std_logic                     := 'X'              -- clk
		);
	end component oran_tod_subsys;

	u0 : component oran_tod_subsys
		port map (
			eth_1588_tod_synchronizer_clk_master_clk      => CONNECTED_TO_eth_1588_tod_synchronizer_clk_master_clk,      --     eth_1588_tod_synchronizer_clk_master.clk
			eth_1588_tod_synchronizer_reset_master_reset  => CONNECTED_TO_eth_1588_tod_synchronizer_reset_master_reset,  --   eth_1588_tod_synchronizer_reset_master.reset
			eth_1588_tod_synchronizer_clk_slave_clk       => CONNECTED_TO_eth_1588_tod_synchronizer_clk_slave_clk,       --      eth_1588_tod_synchronizer_clk_slave.clk
			eth_1588_tod_synchronizer_reset_slave_reset   => CONNECTED_TO_eth_1588_tod_synchronizer_reset_slave_reset,   --    eth_1588_tod_synchronizer_reset_slave.reset
			eth_1588_tod_synchronizer_clk_sampling_clk    => CONNECTED_TO_eth_1588_tod_synchronizer_clk_sampling_clk,    --   eth_1588_tod_synchronizer_clk_sampling.clk
			eth_1588_tod_synchronizer_start_tod_sync_data => CONNECTED_TO_eth_1588_tod_synchronizer_start_tod_sync_data, -- eth_1588_tod_synchronizer_start_tod_sync.data
			oran_tod_time_of_day_96b_data                 => CONNECTED_TO_oran_tod_time_of_day_96b_data,                 --                 oran_tod_time_of_day_96b.data
			oran_tod_time_of_day_96b_valid                => CONNECTED_TO_oran_tod_time_of_day_96b_valid,                --                                         .valid
			rst_tod_n_reset_n                             => CONNECTED_TO_rst_tod_n_reset_n,                             --                                rst_tod_n.reset_n
			ptp_seconds_data                              => CONNECTED_TO_ptp_seconds_data,                              --                              ptp_seconds.data
			clk_tod_clk                                   => CONNECTED_TO_clk_tod_clk                                    --                                  clk_tod.clk
		);

