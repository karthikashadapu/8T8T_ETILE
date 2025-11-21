	component phipps_peak_clock_bridge_ecpri_tx is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component phipps_peak_clock_bridge_ecpri_tx;

	u0 : component phipps_peak_clock_bridge_ecpri_tx
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

