	component msgdma_ptp_subsys_8chs_ts_chs_compl_0 is
		generic (
			NUM_PORTS        : integer := 1;
			ID_WIDTH         : integer := 20;
			DATA_WIDTH       : integer := 96;
			TO_CNTR_WIDTH    : integer := 11;
			CHANNEL_WIDTH    : integer := 1;
			FP_WIDTH         : integer := 20;
			AVST_DATA_WIDTH  : integer := 128;
			AVST_ERROR_WIDTH : integer := 6;
			AVST_EMPTY_WIDTH : integer := 4
		);
		port (
			i_ts_req_clk : in  std_logic                                                       := 'X';             -- clk
			i_ts_req_rst : in  std_logic                                                       := 'X';             -- reset
			i_clk_bus    : in  std_logic_vector((((NUM_PORTS-1)-0)+1)-1 downto 0)              := (others => 'X'); -- clk
			i_rst_bus    : in  std_logic_vector((((NUM_PORTS-1)-0)+1)-1 downto 0)              := (others => 'X'); -- reset_n
			in_st_ready  : out std_logic;                                                                          -- ready
			in_st_sop    : in  std_logic                                                       := 'X';             -- startofpacket
			in_st_valid  : in  std_logic                                                       := 'X';             -- valid
			in_st_eop    : in  std_logic                                                       := 'X';             -- endofpacket
			in_st_data   : in  std_logic_vector((((AVST_DATA_WIDTH-1)-0)+1)-1 downto 0)        := (others => 'X'); -- data
			in_st_empty  : in  std_logic_vector((((AVST_EMPTY_WIDTH-1)-0)+1)-1 downto 0)       := (others => 'X'); -- empty
			in_st_error  : in  std_logic_vector((((AVST_ERROR_WIDTH-1)-0)+1)-1 downto 0)       := (others => 'X'); -- error
			out_st_ready : in  std_logic                                                       := 'X';             -- ready
			out_st_sop   : out std_logic;                                                                          -- startofpacket
			out_st_valid : out std_logic;                                                                          -- valid
			out_st_eop   : out std_logic;                                                                          -- endofpacket
			out_st_data  : out std_logic_vector((((AVST_DATA_WIDTH-1)-0)+1)-1 downto 0);                           -- data
			out_st_empty : out std_logic_vector((((AVST_EMPTY_WIDTH-1)-0)+1)-1 downto 0);                          -- empty
			out_st_error : out std_logic_vector((((AVST_ERROR_WIDTH-1)-0)+1)-1 downto 0);                          -- error
			i_ts_valid   : in  std_logic_vector((((NUM_PORTS-1)-0)+1)-1 downto 0)              := (others => 'X'); -- valid
			i_ts_fp      : in  std_logic_vector(((((NUM_PORTS*FP_WIDTH)-1)-0)+1)-1 downto 0)   := (others => 'X'); -- fingerprint
			i_ts_data    : in  std_logic_vector(((((NUM_PORTS*DATA_WIDTH)-1)-0)+1)-1 downto 0) := (others => 'X'); -- data
			o_ts_valid   : out std_logic_vector((((NUM_PORTS-1)-0)+1)-1 downto 0);                                 -- valid
			o_ts_fp      : out std_logic_vector(((((NUM_PORTS*ID_WIDTH)-1)-0)+1)-1 downto 0);                      -- fingerprint
			o_ts_data    : out std_logic_vector(((((NUM_PORTS*DATA_WIDTH)-1)-0)+1)-1 downto 0)                     -- data
		);
	end component msgdma_ptp_subsys_8chs_ts_chs_compl_0;

	u0 : component msgdma_ptp_subsys_8chs_ts_chs_compl_0
		generic map (
			NUM_PORTS        => INTEGER_VALUE_FOR_NUM_PORTS,
			ID_WIDTH         => INTEGER_VALUE_FOR_ID_WIDTH,
			DATA_WIDTH       => INTEGER_VALUE_FOR_DATA_WIDTH,
			TO_CNTR_WIDTH    => INTEGER_VALUE_FOR_TO_CNTR_WIDTH,
			CHANNEL_WIDTH    => INTEGER_VALUE_FOR_CHANNEL_WIDTH,
			FP_WIDTH         => INTEGER_VALUE_FOR_FP_WIDTH,
			AVST_DATA_WIDTH  => INTEGER_VALUE_FOR_AVST_DATA_WIDTH,
			AVST_ERROR_WIDTH => INTEGER_VALUE_FOR_AVST_ERROR_WIDTH,
			AVST_EMPTY_WIDTH => INTEGER_VALUE_FOR_AVST_EMPTY_WIDTH
		)
		port map (
			i_ts_req_clk => CONNECTED_TO_i_ts_req_clk, --   ts_req_clk.clk
			i_ts_req_rst => CONNECTED_TO_i_ts_req_rst, -- ts_req_reset.reset
			i_clk_bus    => CONNECTED_TO_i_clk_bus,    --   clk_bus_in.clk
			i_rst_bus    => CONNECTED_TO_i_rst_bus,    --   rst_bus_in.reset_n
			in_st_ready  => CONNECTED_TO_in_st_ready,  --        in_st.ready
			in_st_sop    => CONNECTED_TO_in_st_sop,    --             .startofpacket
			in_st_valid  => CONNECTED_TO_in_st_valid,  --             .valid
			in_st_eop    => CONNECTED_TO_in_st_eop,    --             .endofpacket
			in_st_data   => CONNECTED_TO_in_st_data,   --             .data
			in_st_empty  => CONNECTED_TO_in_st_empty,  --             .empty
			in_st_error  => CONNECTED_TO_in_st_error,  --             .error
			out_st_ready => CONNECTED_TO_out_st_ready, --       out_st.ready
			out_st_sop   => CONNECTED_TO_out_st_sop,   --             .startofpacket
			out_st_valid => CONNECTED_TO_out_st_valid, --             .valid
			out_st_eop   => CONNECTED_TO_out_st_eop,   --             .endofpacket
			out_st_data  => CONNECTED_TO_out_st_data,  --             .data
			out_st_empty => CONNECTED_TO_out_st_empty, --             .empty
			out_st_error => CONNECTED_TO_out_st_error, --             .error
			i_ts_valid   => CONNECTED_TO_i_ts_valid,   --         i_ts.valid
			i_ts_fp      => CONNECTED_TO_i_ts_fp,      --             .fingerprint
			i_ts_data    => CONNECTED_TO_i_ts_data,    --             .data
			o_ts_valid   => CONNECTED_TO_o_ts_valid,   --         o_ts.valid
			o_ts_fp      => CONNECTED_TO_o_ts_fp,      --             .fingerprint
			o_ts_data    => CONNECTED_TO_o_ts_data     --             .data
		);

