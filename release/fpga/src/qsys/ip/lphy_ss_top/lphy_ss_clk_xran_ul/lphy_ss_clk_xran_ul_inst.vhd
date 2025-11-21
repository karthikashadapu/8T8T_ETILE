	component lphy_ss_clk_xran_ul is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component lphy_ss_clk_xran_ul;

	u0 : component lphy_ss_clk_xran_ul
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

