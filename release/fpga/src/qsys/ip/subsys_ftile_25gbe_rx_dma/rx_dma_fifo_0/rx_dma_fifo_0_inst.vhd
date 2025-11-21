	component rx_dma_fifo_0 is
		generic (
			DEVICE                : string  := "s10";
			USE_RX_READY          : integer := 0;
			MEMORY_CAPACITY_WORDS : integer := 16384;
			AVST_DATA_WIDTH       : integer := 64;
			AVST_ERROR_WIDTH      : integer := 6;
			TS_WIDTH              : integer := 96;
			TS_RESP_WIDTH         : integer := 256;
			AVST_EMPTY_WIDTH      : integer := 3;
			TO_CNTR_WIDTH         : integer := 20
		);
		port (
			in_st_clk         : in  std_logic                                                 := 'X';             -- clk
			in_st_rst         : in  std_logic                                                 := 'X';             -- reset
			out_st_clk        : in  std_logic                                                 := 'X';             -- clk
			out_st_rst        : in  std_logic                                                 := 'X';             -- reset
			csr_clk           : in  std_logic                                                 := 'X';             -- clk
			csr_rst           : in  std_logic                                                 := 'X';             -- reset
			in_st_sop         : in  std_logic                                                 := 'X';             -- startofpacket
			in_st_valid       : in  std_logic                                                 := 'X';             -- valid
			in_st_eop         : in  std_logic                                                 := 'X';             -- endofpacket
			in_st_data        : in  std_logic_vector((((AVST_DATA_WIDTH-1)-0)+1)-1 downto 0)  := (others => 'X'); -- data
			in_st_empty       : in  std_logic_vector((((AVST_EMPTY_WIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- empty
			in_st_error       : in  std_logic_vector((((AVST_ERROR_WIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- error
			in_ts_valid       : in  std_logic                                                 := 'X';             -- valid
			in_ts_data        : in  std_logic_vector((((TS_WIDTH-1)-0)+1)-1 downto 0)         := (others => 'X'); -- data
			out_st_ready      : in  std_logic                                                 := 'X';             -- ready
			out_st_sop        : out std_logic;                                                                    -- startofpacket
			out_st_valid      : out std_logic;                                                                    -- valid
			out_st_eop        : out std_logic;                                                                    -- endofpacket
			out_st_data       : out std_logic_vector((((AVST_DATA_WIDTH-1)-0)+1)-1 downto 0);                     -- data
			out_st_empty      : out std_logic_vector((((AVST_EMPTY_WIDTH-1)-0)+1)-1 downto 0);                    -- empty
			out_st_error      : out std_logic_vector((((AVST_ERROR_WIDTH-1)-0)+1)-1 downto 0);                    -- error
			in_ts_resp_ready  : out std_logic;                                                                    -- ready
			in_ts_resp_valid  : in  std_logic                                                 := 'X';             -- valid
			in_ts_resp_data   : in  std_logic_vector((((TS_RESP_WIDTH-1)-0)+1)-1 downto 0)    := (others => 'X'); -- data
			out_ts_resp_ready : in  std_logic                                                 := 'X';             -- ready
			out_ts_resp_valid : out std_logic;                                                                    -- valid
			out_ts_resp_data  : out std_logic_vector((((TS_RESP_WIDTH-1)-0)+1)-1 downto 0)                        -- data
		);
	end component rx_dma_fifo_0;

	u0 : component rx_dma_fifo_0
		generic map (
			DEVICE                => STRING_VALUE_FOR_DEVICE,
			USE_RX_READY          => INTEGER_VALUE_FOR_USE_RX_READY,
			MEMORY_CAPACITY_WORDS => INTEGER_VALUE_FOR_MEMORY_CAPACITY_WORDS,
			AVST_DATA_WIDTH       => INTEGER_VALUE_FOR_AVST_DATA_WIDTH,
			AVST_ERROR_WIDTH      => INTEGER_VALUE_FOR_AVST_ERROR_WIDTH,
			TS_WIDTH              => INTEGER_VALUE_FOR_TS_WIDTH,
			TS_RESP_WIDTH         => INTEGER_VALUE_FOR_TS_RESP_WIDTH,
			AVST_EMPTY_WIDTH      => INTEGER_VALUE_FOR_AVST_EMPTY_WIDTH,
			TO_CNTR_WIDTH         => INTEGER_VALUE_FOR_TO_CNTR_WIDTH
		)
		port map (
			in_st_clk         => CONNECTED_TO_in_st_clk,         --   in_st_clk.clk
			in_st_rst         => CONNECTED_TO_in_st_rst,         --   in_st_rst.reset
			out_st_clk        => CONNECTED_TO_out_st_clk,        --  out_st_clk.clk
			out_st_rst        => CONNECTED_TO_out_st_rst,        --  out_st_rst.reset
			csr_clk           => CONNECTED_TO_csr_clk,           --     csr_clk.clk
			csr_rst           => CONNECTED_TO_csr_rst,           --     csr_rst.reset
			in_st_sop         => CONNECTED_TO_in_st_sop,         --     in_avst.startofpacket
			in_st_valid       => CONNECTED_TO_in_st_valid,       --            .valid
			in_st_eop         => CONNECTED_TO_in_st_eop,         --            .endofpacket
			in_st_data        => CONNECTED_TO_in_st_data,        --            .data
			in_st_empty       => CONNECTED_TO_in_st_empty,       --            .empty
			in_st_error       => CONNECTED_TO_in_st_error,       --            .error
			in_ts_valid       => CONNECTED_TO_in_ts_valid,       --       in_ts.valid
			in_ts_data        => CONNECTED_TO_in_ts_data,        --            .data
			out_st_ready      => CONNECTED_TO_out_st_ready,      --    out_avst.ready
			out_st_sop        => CONNECTED_TO_out_st_sop,        --            .startofpacket
			out_st_valid      => CONNECTED_TO_out_st_valid,      --            .valid
			out_st_eop        => CONNECTED_TO_out_st_eop,        --            .endofpacket
			out_st_data       => CONNECTED_TO_out_st_data,       --            .data
			out_st_empty      => CONNECTED_TO_out_st_empty,      --            .empty
			out_st_error      => CONNECTED_TO_out_st_error,      --            .error
			in_ts_resp_ready  => CONNECTED_TO_in_ts_resp_ready,  --  in_ts_resp.ready
			in_ts_resp_valid  => CONNECTED_TO_in_ts_resp_valid,  --            .valid
			in_ts_resp_data   => CONNECTED_TO_in_ts_resp_data,   --            .data
			out_ts_resp_ready => CONNECTED_TO_out_ts_resp_ready, -- out_ts_resp.ready
			out_ts_resp_valid => CONNECTED_TO_out_ts_resp_valid, --            .valid
			out_ts_resp_data  => CONNECTED_TO_out_ts_resp_data   --            .data
		);

