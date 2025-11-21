	component subsys_ftile_25gbe_1588_dmaclkout is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component subsys_ftile_25gbe_1588_dmaclkout;

	u0 : component subsys_ftile_25gbe_1588_dmaclkout
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

