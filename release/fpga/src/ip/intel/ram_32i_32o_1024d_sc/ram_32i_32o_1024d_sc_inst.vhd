	component ram_32i_32o_1024d_sc is
		port (
			data      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain
			q         : out std_logic_vector(31 downto 0);                    -- dataout
			wraddress : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- wraddress
			rdaddress : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- rdaddress
			wren      : in  std_logic                     := 'X';             -- wren
			clock     : in  std_logic                     := 'X';             -- clk
			rden      : in  std_logic                     := 'X'              -- rden
		);
	end component ram_32i_32o_1024d_sc;

	u0 : component ram_32i_32o_1024d_sc
		port map (
			data      => CONNECTED_TO_data,      --      data.datain
			q         => CONNECTED_TO_q,         --         q.dataout
			wraddress => CONNECTED_TO_wraddress, -- wraddress.wraddress
			rdaddress => CONNECTED_TO_rdaddress, -- rdaddress.rdaddress
			wren      => CONNECTED_TO_wren,      --      wren.wren
			clock     => CONNECTED_TO_clock,     --     clock.clk
			rden      => CONNECTED_TO_rden       --      rden.rden
		);

