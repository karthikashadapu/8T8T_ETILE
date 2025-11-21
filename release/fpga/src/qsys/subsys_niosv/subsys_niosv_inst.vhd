	component subsys_niosv is
		port (
			clk_clk               : in  std_logic                    := 'X'; -- clk
			issp_reset_in_reset   : in  std_logic                    := 'X'; -- reset
			issp_reset_out_source : out std_logic_vector(0 downto 0);        -- source
			reset_reset_n         : in  std_logic                    := 'X'  -- reset_n
		);
	end component subsys_niosv;

	u0 : component subsys_niosv
		port map (
			clk_clk               => CONNECTED_TO_clk_clk,               --            clk.clk
			issp_reset_in_reset   => CONNECTED_TO_issp_reset_in_reset,   --  issp_reset_in.reset
			issp_reset_out_source => CONNECTED_TO_issp_reset_out_source, -- issp_reset_out.source
			reset_reset_n         => CONNECTED_TO_reset_reset_n          --          reset.reset_n
		);

