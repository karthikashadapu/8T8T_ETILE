	component ram_48i_48o_36d_dc is
		port (
			data      : in  std_logic_vector(47 downto 0) := (others => 'X'); -- datain
			q         : out std_logic_vector(47 downto 0);                    -- dataout
			wraddress : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- wraddress
			rdaddress : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- rdaddress
			wren      : in  std_logic                     := 'X';             -- wren
			wrclock   : in  std_logic                     := 'X';             -- clk
			rdclock   : in  std_logic                     := 'X';             -- clk
			rden      : in  std_logic                     := 'X';             -- rden
			byteena_a : in  std_logic_vector(5 downto 0)  := (others => 'X')  -- byte_enable_a
		);
	end component ram_48i_48o_36d_dc;

	u0 : component ram_48i_48o_36d_dc
		port map (
			data      => CONNECTED_TO_data,      --      data.datain
			q         => CONNECTED_TO_q,         --         q.dataout
			wraddress => CONNECTED_TO_wraddress, -- wraddress.wraddress
			rdaddress => CONNECTED_TO_rdaddress, -- rdaddress.rdaddress
			wren      => CONNECTED_TO_wren,      --      wren.wren
			wrclock   => CONNECTED_TO_wrclock,   --   wrclock.clk
			rdclock   => CONNECTED_TO_rdclock,   --   rdclock.clk
			rden      => CONNECTED_TO_rden,      --      rden.rden
			byteena_a => CONNECTED_TO_byteena_a  -- byteena_a.byte_enable_a
		);

