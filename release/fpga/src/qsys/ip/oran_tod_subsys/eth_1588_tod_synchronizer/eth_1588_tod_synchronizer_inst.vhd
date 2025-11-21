	component eth_1588_tod_synchronizer is
		generic (
			TOD_MODE     : integer := 1;
			SYNC_MODE    : integer := 9;
			SAMPLE_SIZE  : integer := 256;
			PERIOD_NSEC  : integer := 6;
			PERIOD_FNSEC : integer := 26214
		);
		port (
			clk_master      : in  std_logic                     := 'X';             -- clk
			reset_master    : in  std_logic                     := 'X';             -- reset
			clk_slave       : in  std_logic                     := 'X';             -- clk
			reset_slave     : in  std_logic                     := 'X';             -- reset
			clk_sampling    : in  std_logic                     := 'X';             -- clk
			start_tod_sync  : in  std_logic                     := 'X';             -- data
			tod_master_data : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			tod_slave_data  : out std_logic_vector(95 downto 0);                    -- data
			tod_slave_valid : out std_logic                                         -- valid
		);
	end component eth_1588_tod_synchronizer;

	u0 : component eth_1588_tod_synchronizer
		generic map (
			TOD_MODE     => INTEGER_VALUE_FOR_TOD_MODE,
			SYNC_MODE    => INTEGER_VALUE_FOR_SYNC_MODE,
			SAMPLE_SIZE  => INTEGER_VALUE_FOR_SAMPLE_SIZE,
			PERIOD_NSEC  => INTEGER_VALUE_FOR_PERIOD_NSEC,
			PERIOD_FNSEC => INTEGER_VALUE_FOR_PERIOD_FNSEC
		)
		port map (
			clk_master      => CONNECTED_TO_clk_master,      --      clk_master.clk
			reset_master    => CONNECTED_TO_reset_master,    --    reset_master.reset
			clk_slave       => CONNECTED_TO_clk_slave,       --       clk_slave.clk
			reset_slave     => CONNECTED_TO_reset_slave,     --     reset_slave.reset
			clk_sampling    => CONNECTED_TO_clk_sampling,    --    clk_sampling.clk
			start_tod_sync  => CONNECTED_TO_start_tod_sync,  --  start_tod_sync.data
			tod_master_data => CONNECTED_TO_tod_master_data, -- tod_master_data.data
			tod_slave_data  => CONNECTED_TO_tod_slave_data,  --  tod_slave_data.data
			tod_slave_valid => CONNECTED_TO_tod_slave_valid  --                .valid
		);

