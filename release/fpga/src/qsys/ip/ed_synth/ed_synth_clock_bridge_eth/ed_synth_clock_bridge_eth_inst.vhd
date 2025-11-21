	component ed_synth_clock_bridge_eth is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component ed_synth_clock_bridge_eth;

	u0 : component ed_synth_clock_bridge_eth
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

