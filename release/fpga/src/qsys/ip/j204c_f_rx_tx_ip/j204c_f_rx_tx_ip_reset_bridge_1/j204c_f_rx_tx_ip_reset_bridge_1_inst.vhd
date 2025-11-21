	component j204c_f_rx_tx_ip_reset_bridge_1 is
		port (
			clk       : in  std_logic := 'X'; -- clk
			in_reset  : in  std_logic := 'X'; -- reset
			out_reset : out std_logic         -- reset
		);
	end component j204c_f_rx_tx_ip_reset_bridge_1;

	u0 : component j204c_f_rx_tx_ip_reset_bridge_1
		port map (
			clk       => CONNECTED_TO_clk,       --       clk.clk
			in_reset  => CONNECTED_TO_in_reset,  --  in_reset.reset
			out_reset => CONNECTED_TO_out_reset  -- out_reset.reset
		);

