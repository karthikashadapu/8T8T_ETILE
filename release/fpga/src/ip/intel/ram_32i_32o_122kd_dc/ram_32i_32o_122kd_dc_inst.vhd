	component ram_32i_32o_122kd_dc is
		port (
			data      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain
			q         : out std_logic_vector(31 downto 0);                    -- dataout
			wraddress : in  std_logic_vector(16 downto 0) := (others => 'X'); -- wraddress
			rdaddress : in  std_logic_vector(16 downto 0) := (others => 'X'); -- rdaddress
			wren      : in  std_logic                     := 'X';             -- wren
			wrclock   : in  std_logic                     := 'X';             -- clk
			rdclock   : in  std_logic                     := 'X';             -- clk
			rden      : in  std_logic                     := 'X';             -- rden
			rd_aclr   : in  std_logic                     := 'X'              -- reset
		);
	end component ram_32i_32o_122kd_dc;

	u0 : component ram_32i_32o_122kd_dc
		port map (
			data      => CONNECTED_TO_data,      --      data.datain
			q         => CONNECTED_TO_q,         --         q.dataout
			wraddress => CONNECTED_TO_wraddress, -- wraddress.wraddress
			rdaddress => CONNECTED_TO_rdaddress, -- rdaddress.rdaddress
			wren      => CONNECTED_TO_wren,      --      wren.wren
			wrclock   => CONNECTED_TO_wrclock,   --   wrclock.clk
			rdclock   => CONNECTED_TO_rdclock,   --   rdclock.clk
			rden      => CONNECTED_TO_rden,      --      rden.rden
			rd_aclr   => CONNECTED_TO_rd_aclr    --   rd_aclr.reset
		);

