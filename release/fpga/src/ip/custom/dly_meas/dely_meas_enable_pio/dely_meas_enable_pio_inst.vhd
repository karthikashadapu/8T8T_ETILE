	component dely_meas_enable_pio is
		port (
			source : out std_logic_vector(15 downto 0)   -- source
		);
	end component dely_meas_enable_pio;

	u0 : component dely_meas_enable_pio
		port map (
			source => CONNECTED_TO_source  -- sources.source
		);

