	component subsys_ftile_25gbe_1588_ninitdone_reset is
		port (
			in_reset  : in  std_logic := 'X'; -- reset
			out_reset : out std_logic         -- reset
		);
	end component subsys_ftile_25gbe_1588_ninitdone_reset;

	u0 : component subsys_ftile_25gbe_1588_ninitdone_reset
		port map (
			in_reset  => CONNECTED_TO_in_reset,  --  in_reset.reset
			out_reset => CONNECTED_TO_out_reset  -- out_reset.reset
		);

