	component oclk_pll_clock_bridge_0 is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component oclk_pll_clock_bridge_0;

	u0 : component oclk_pll_clock_bridge_0
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

