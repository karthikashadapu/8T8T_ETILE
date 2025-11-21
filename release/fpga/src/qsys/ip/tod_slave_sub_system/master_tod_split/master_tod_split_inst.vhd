	component master_tod_split is
		port (
			data_conduit_in      : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			valid_conduit_in     : in  std_logic                     := 'X';             -- valid
			data_conduit_out_1   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_1  : out std_logic;                                        -- valid
			data_conduit_out_2   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_2  : out std_logic;                                        -- valid
			data_conduit_out_3   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_3  : out std_logic;                                        -- valid
			data_conduit_out_4   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_4  : out std_logic;                                        -- valid
			data_conduit_out_5   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_5  : out std_logic;                                        -- valid
			data_conduit_out_6   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_6  : out std_logic;                                        -- valid
			data_conduit_out_7   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_7  : out std_logic;                                        -- valid
			data_conduit_out_8   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_8  : out std_logic;                                        -- valid
			data_conduit_out_9   : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_9  : out std_logic;                                        -- valid
			data_conduit_out_10  : out std_logic_vector(95 downto 0);                    -- data
			valid_conduit_out_10 : out std_logic                                         -- valid
		);
	end component master_tod_split;

	u0 : component master_tod_split
		port map (
			data_conduit_in      => CONNECTED_TO_data_conduit_in,      --    conduit_end.data
			valid_conduit_in     => CONNECTED_TO_valid_conduit_in,     --               .valid
			data_conduit_out_1   => CONNECTED_TO_data_conduit_out_1,   --  conduit_end_1.data
			valid_conduit_out_1  => CONNECTED_TO_valid_conduit_out_1,  --               .valid
			data_conduit_out_2   => CONNECTED_TO_data_conduit_out_2,   --  conduit_end_2.data
			valid_conduit_out_2  => CONNECTED_TO_valid_conduit_out_2,  --               .valid
			data_conduit_out_3   => CONNECTED_TO_data_conduit_out_3,   --  conduit_end_3.data
			valid_conduit_out_3  => CONNECTED_TO_valid_conduit_out_3,  --               .valid
			data_conduit_out_4   => CONNECTED_TO_data_conduit_out_4,   --  conduit_end_4.data
			valid_conduit_out_4  => CONNECTED_TO_valid_conduit_out_4,  --               .valid
			data_conduit_out_5   => CONNECTED_TO_data_conduit_out_5,   --  conduit_end_5.data
			valid_conduit_out_5  => CONNECTED_TO_valid_conduit_out_5,  --               .valid
			data_conduit_out_6   => CONNECTED_TO_data_conduit_out_6,   --  conduit_end_6.data
			valid_conduit_out_6  => CONNECTED_TO_valid_conduit_out_6,  --               .valid
			data_conduit_out_7   => CONNECTED_TO_data_conduit_out_7,   --  conduit_end_7.data
			valid_conduit_out_7  => CONNECTED_TO_valid_conduit_out_7,  --               .valid
			data_conduit_out_8   => CONNECTED_TO_data_conduit_out_8,   --  conduit_end_8.data
			valid_conduit_out_8  => CONNECTED_TO_valid_conduit_out_8,  --               .valid
			data_conduit_out_9   => CONNECTED_TO_data_conduit_out_9,   --  conduit_end_9.data
			valid_conduit_out_9  => CONNECTED_TO_valid_conduit_out_9,  --               .valid
			data_conduit_out_10  => CONNECTED_TO_data_conduit_out_10,  -- conduit_end_10.data
			valid_conduit_out_10 => CONNECTED_TO_valid_conduit_out_10  --               .valid
		);

