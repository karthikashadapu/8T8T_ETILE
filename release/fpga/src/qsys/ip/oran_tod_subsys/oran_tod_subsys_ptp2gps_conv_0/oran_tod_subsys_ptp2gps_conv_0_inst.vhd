	component oran_tod_subsys_ptp2gps_conv_0 is
		port (
			rst_tod_n   : in  std_logic                     := 'X';             -- reset_n
			ptp_seconds : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			gps_seconds : out std_logic_vector(95 downto 0);                    -- data
			clk_tod     : in  std_logic                     := 'X'              -- clk
		);
	end component oran_tod_subsys_ptp2gps_conv_0;

	u0 : component oran_tod_subsys_ptp2gps_conv_0
		port map (
			rst_tod_n   => CONNECTED_TO_rst_tod_n,   --   rst_tod_n.reset_n
			ptp_seconds => CONNECTED_TO_ptp_seconds, -- ptp_seconds.data
			gps_seconds => CONNECTED_TO_gps_seconds, -- gps_seconds.data
			clk_tod     => CONNECTED_TO_clk_tod      --     clk_tod.clk
		);

