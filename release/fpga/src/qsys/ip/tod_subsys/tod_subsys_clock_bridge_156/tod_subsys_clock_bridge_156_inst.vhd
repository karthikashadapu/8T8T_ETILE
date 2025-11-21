	component tod_subsys_clock_bridge_156 is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component tod_subsys_clock_bridge_156;

	u0 : component tod_subsys_clock_bridge_156
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

