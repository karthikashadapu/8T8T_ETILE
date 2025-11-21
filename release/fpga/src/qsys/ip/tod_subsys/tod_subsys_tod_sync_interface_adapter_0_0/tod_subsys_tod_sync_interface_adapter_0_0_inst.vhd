	component tod_subsys_tod_sync_interface_adapter_0_0 is
		port (
			time_of_day_96b     : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			valid               : in  std_logic                     := 'X';             -- valid
			tx0_tod_master_data : out std_logic_vector(95 downto 0);                    -- data
			valid_0             : out std_logic;                                        -- valid
			tx1_tod_master_data : out std_logic_vector(95 downto 0);                    -- data
			tx2_tod_master_data : out std_logic_vector(95 downto 0);                    -- data
			tx3_tod_master_data : out std_logic_vector(95 downto 0);                    -- data
			rx0_tod_master_data : out std_logic_vector(95 downto 0);                    -- data
			clk                 : in  std_logic                     := 'X';             -- clk
			rst_n               : in  std_logic                     := 'X'              -- reset_n
		);
	end component tod_subsys_tod_sync_interface_adapter_0_0;

	u0 : component tod_subsys_tod_sync_interface_adapter_0_0
		port map (
			time_of_day_96b     => CONNECTED_TO_time_of_day_96b,     --     time_of_day_96b.data
			valid               => CONNECTED_TO_valid,               --                    .valid
			tx0_tod_master_data => CONNECTED_TO_tx0_tod_master_data, -- tx0_tod_master_data.data
			valid_0             => CONNECTED_TO_valid_0,             --                    .valid
			tx1_tod_master_data => CONNECTED_TO_tx1_tod_master_data, -- tx1_tod_master_data.data
			tx2_tod_master_data => CONNECTED_TO_tx2_tod_master_data, -- tx2_tod_master_data.data
			tx3_tod_master_data => CONNECTED_TO_tx3_tod_master_data, -- tx3_tod_master_data.data
			rx0_tod_master_data => CONNECTED_TO_rx0_tod_master_data, -- rx0_tod_master_data.data
			clk                 => CONNECTED_TO_clk,                 --               clock.clk
			rst_n               => CONNECTED_TO_rst_n                --          reset_sink.reset_n
		);

