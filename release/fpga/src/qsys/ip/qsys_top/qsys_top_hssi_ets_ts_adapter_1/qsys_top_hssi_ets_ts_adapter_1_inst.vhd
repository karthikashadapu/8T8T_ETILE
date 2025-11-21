	component qsys_top_hssi_ets_ts_adapter_1 is
		generic (
			FP_WIDTH : integer := 10
		);
		port (
			timestamp_fp_valid     : in  std_logic                                          := 'X';             -- tvalid
			timestamp_fp_data      : in  std_logic_vector((((FP_WIDTH+95)-0)+1)-1 downto 0) := (others => 'X'); -- tdata
			aso_timestamp_fp_valid : out std_logic;                                                             -- valid
			aso_timestamp_fp       : out std_logic_vector(31 downto 0);                                         -- fingerprint
			aso_timestamp_data     : out std_logic_vector(95 downto 0)                                          -- data
		);
	end component qsys_top_hssi_ets_ts_adapter_1;

	u0 : component qsys_top_hssi_ets_ts_adapter_1
		generic map (
			FP_WIDTH => INTEGER_VALUE_FOR_FP_WIDTH
		)
		port map (
			timestamp_fp_valid     => CONNECTED_TO_timestamp_fp_valid,     -- egrs_ts_hssi.tvalid
			timestamp_fp_data      => CONNECTED_TO_timestamp_fp_data,      --             .tdata
			aso_timestamp_fp_valid => CONNECTED_TO_aso_timestamp_fp_valid, --  egrs_ts_dma.valid
			aso_timestamp_fp       => CONNECTED_TO_aso_timestamp_fp,       --             .fingerprint
			aso_timestamp_data     => CONNECTED_TO_aso_timestamp_data      --             .data
		);

