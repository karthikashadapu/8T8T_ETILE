	component rom_8i_56o_256d_sc is
		port (
			q       : out std_logic_vector(55 downto 0);                    -- dataout
			address : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			clock   : in  std_logic                     := 'X';             -- clk
			rden    : in  std_logic                     := 'X'              -- rden
		);
	end component rom_8i_56o_256d_sc;

	u0 : component rom_8i_56o_256d_sc
		port map (
			q       => CONNECTED_TO_q,       --       q.dataout
			address => CONNECTED_TO_address, -- address.address
			clock   => CONNECTED_TO_clock,   --   clock.clk
			rden    => CONNECTED_TO_rden     --    rden.rden
		);

