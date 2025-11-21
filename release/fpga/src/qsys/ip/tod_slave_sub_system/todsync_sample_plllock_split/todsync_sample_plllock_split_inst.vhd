	component todsync_sample_plllock_split is
		generic (
			SIGNAL_WIDTH : integer := 1
		);
		port (
			conduit_in     : in  std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- lock
			conduit_out_1  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_2  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_3  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_4  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_5  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_6  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_7  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_8  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_9  : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_10 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_11 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_12 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_13 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_14 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_15 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_16 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_17 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_18 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_19 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0);                    -- lock
			conduit_out_20 : out std_logic_vector((((SIGNAL_WIDTH-1)-0)+1)-1 downto 0)                     -- lock
		);
	end component todsync_sample_plllock_split;

	u0 : component todsync_sample_plllock_split
		generic map (
			SIGNAL_WIDTH => INTEGER_VALUE_FOR_SIGNAL_WIDTH
		)
		port map (
			conduit_in     => CONNECTED_TO_conduit_in,     --    conduit_end.lock
			conduit_out_1  => CONNECTED_TO_conduit_out_1,  --  conduit_end_1.lock
			conduit_out_2  => CONNECTED_TO_conduit_out_2,  --  conduit_end_2.lock
			conduit_out_3  => CONNECTED_TO_conduit_out_3,  --  conduit_end_3.lock
			conduit_out_4  => CONNECTED_TO_conduit_out_4,  --  conduit_end_4.lock
			conduit_out_5  => CONNECTED_TO_conduit_out_5,  --  conduit_end_5.lock
			conduit_out_6  => CONNECTED_TO_conduit_out_6,  --  conduit_end_6.lock
			conduit_out_7  => CONNECTED_TO_conduit_out_7,  --  conduit_end_7.lock
			conduit_out_8  => CONNECTED_TO_conduit_out_8,  --  conduit_end_8.lock
			conduit_out_9  => CONNECTED_TO_conduit_out_9,  --  conduit_end_9.lock
			conduit_out_10 => CONNECTED_TO_conduit_out_10, -- conduit_end_10.lock
			conduit_out_11 => CONNECTED_TO_conduit_out_11, -- conduit_end_11.lock
			conduit_out_12 => CONNECTED_TO_conduit_out_12, -- conduit_end_12.lock
			conduit_out_13 => CONNECTED_TO_conduit_out_13, -- conduit_end_13.lock
			conduit_out_14 => CONNECTED_TO_conduit_out_14, -- conduit_end_14.lock
			conduit_out_15 => CONNECTED_TO_conduit_out_15, -- conduit_end_15.lock
			conduit_out_16 => CONNECTED_TO_conduit_out_16, -- conduit_end_16.lock
			conduit_out_17 => CONNECTED_TO_conduit_out_17, -- conduit_end_17.lock
			conduit_out_18 => CONNECTED_TO_conduit_out_18, -- conduit_end_18.lock
			conduit_out_19 => CONNECTED_TO_conduit_out_19, -- conduit_end_19.lock
			conduit_out_20 => CONNECTED_TO_conduit_out_20  -- conduit_end_20.lock
		);

