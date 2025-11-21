	component niosv_issp_reset_out is
		port (
			source     : out std_logic_vector(0 downto 0);        -- source
			source_clk : in  std_logic                    := 'X'  -- clk
		);
	end component niosv_issp_reset_out;

	u0 : component niosv_issp_reset_out
		port map (
			source     => CONNECTED_TO_source,     --    sources.source
			source_clk => CONNECTED_TO_source_clk  -- source_clk.clk
		);

