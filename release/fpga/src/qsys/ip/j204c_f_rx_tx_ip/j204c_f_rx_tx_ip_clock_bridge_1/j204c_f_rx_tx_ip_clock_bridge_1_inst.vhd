	component j204c_f_rx_tx_ip_clock_bridge_1 is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component j204c_f_rx_tx_ip_clock_bridge_1;

	u0 : component j204c_f_rx_tx_ip_clock_bridge_1
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

