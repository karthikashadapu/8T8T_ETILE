	component oran_ptp2gps_conv_0 is
		port (
			rst_tod_n   : in  std_logic                     := 'X';             -- reset_n
			ptp_seconds : in  std_logic_vector(95 downto 0) := (others => 'X'); -- data
			in_valid    : in  std_logic                     := 'X';             -- valid
			gps_seconds : out std_logic_vector(95 downto 0);                    -- data
			out_valid   : out std_logic;                                        -- valid
			clk_tod     : in  std_logic                     := 'X'              -- clk
		);
	end component oran_ptp2gps_conv_0;

	u0 : component oran_ptp2gps_conv_0
		port map (
			rst_tod_n   => CONNECTED_TO_rst_tod_n,   --   rst_tod_n.reset_n
			ptp_seconds => CONNECTED_TO_ptp_seconds, -- ptp_seconds.data
			in_valid    => CONNECTED_TO_in_valid,    --            .valid
			gps_seconds => CONNECTED_TO_gps_seconds, -- gps_seconds.data
			out_valid   => CONNECTED_TO_out_valid,   --            .valid
			clk_tod     => CONNECTED_TO_clk_tod      --     clk_tod.clk
		);

