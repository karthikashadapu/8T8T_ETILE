	component subsys_ftile_25gbe_1588_reset is
		port (
			clk         : in  std_logic := 'X'; -- clk
			in_reset_n  : in  std_logic := 'X'; -- reset_n
			out_reset_n : out std_logic         -- reset_n
		);
	end component subsys_ftile_25gbe_1588_reset;

	u0 : component subsys_ftile_25gbe_1588_reset
		port map (
			clk         => CONNECTED_TO_clk,         --       clk.clk
			in_reset_n  => CONNECTED_TO_in_reset_n,  --  in_reset.reset_n
			out_reset_n => CONNECTED_TO_out_reset_n  -- out_reset.reset_n
		);

