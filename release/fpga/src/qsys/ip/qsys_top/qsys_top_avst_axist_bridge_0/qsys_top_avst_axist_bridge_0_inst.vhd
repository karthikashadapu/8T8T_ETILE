	component qsys_top_avst_axist_bridge_0 is
		generic (
			DATA_WIDTH   : integer := 64;
			NUM_CHANNELS : integer := 1;
			NO_OF_BYTES  : integer := 8;
			EMPTY_BITS   : integer := 3;
			Tiles        : string  := "F";
			SIM_EMULATE  : integer := 1
		);
		port (
			i_tx_clk                       : in  std_logic                                            := 'X';             -- clk
			i_rx_clk                       : in  std_logic                                            := 'X';             -- clk
			i_tx_rst_n                     : in  std_logic                                            := 'X';             -- reset_n
			i_rx_rst_n                     : in  std_logic                                            := 'X';             -- reset_n
			o_av_st_tx_ready               : out std_logic;                                                               -- ready
			i_av_st_tx_valid               : in  std_logic                                            := 'X';             -- valid
			i_av_st_tx_data                : in  std_logic_vector((((DATA_WIDTH-1)-0)+1)-1 downto 0)  := (others => 'X'); -- data
			i_av_st_tx_startofpacket       : in  std_logic                                            := 'X';             -- startofpacket
			i_av_st_tx_endofpacket         : in  std_logic                                            := 'X';             -- endofpacket
			i_av_st_tx_empty               : in  std_logic_vector((((EMPTY_BITS-1)-0)+1)-1 downto 0)  := (others => 'X'); -- empty
			i_av_st_tx_error               : in  std_logic                                            := 'X';             -- error
			i_av_st_tx_skip_crc            : in  std_logic                                            := 'X';             -- i_av_st_tx_skip_crc
			i_av_st_tx_ptp_ts_valid        : in  std_logic_vector(1 downto 0)                         := (others => 'X'); -- i_av_st_tx_ptp_ts_valid
			i_av_st_tx_ptp_ts_req          : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_ts_req
			i_av_st_tx_ptp_ins_ets         : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_ins_ets
			i_av_st_tx_ptp_fp              : in  std_logic_vector(31 downto 0)                        := (others => 'X'); -- i_av_st_tx_ptp_fp
			i_av_st_tx_ptp_ins_cf          : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_ins_cf
			i_av_st_tx_ptp_tx_its          : in  std_logic_vector(95 downto 0)                        := (others => 'X'); -- i_av_st_tx_ptp_tx_its
			i_av_st_tx_ptp_asym_p2p_idx    : in  std_logic_vector(6 downto 0)                         := (others => 'X'); -- i_av_st_tx_ptp_asym_p2p_idx
			i_av_st_tx_ptp_asym_sign       : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_asym_sign
			i_av_st_tx_ptp_asym            : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_asym
			i_av_st_tx_ptp_p2p             : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_p2p
			i_av_st_tx_ptp_ts_format       : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_ts_format
			i_av_st_tx_ptp_update_eb       : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_update_eb
			i_av_st_tx_ptp_zero_csum       : in  std_logic                                            := 'X';             -- i_av_st_tx_ptp_zero_csum
			i_av_st_tx_ptp_eb_offset       : in  std_logic_vector(15 downto 0)                        := (others => 'X'); -- i_av_st_tx_ptp_eb_offset
			i_av_st_tx_ptp_csum_offset     : in  std_logic_vector(15 downto 0)                        := (others => 'X'); -- i_av_st_tx_ptp_csum_offset
			i_av_st_tx_ptp_cf_offset       : in  std_logic_vector(15 downto 0)                        := (others => 'X'); -- i_av_st_tx_ptp_cf_offset
			i_av_st_tx_ptp_ts_offset       : in  std_logic_vector(15 downto 0)                        := (others => 'X'); -- i_av_st_tx_ptp_ts_offset
			i_axi_st_tx_tready             : in  std_logic                                            := 'X';             -- tready
			o_axi_st_tx_tvalid             : out std_logic;                                                               -- tvalid
			o_axi_st_tx_tdata              : out std_logic_vector((((DATA_WIDTH-1)-0)+1)-1 downto 0);                     -- tdata
			o_axi_st_tx_tlast              : out std_logic;                                                               -- tlast
			o_axi_st_tx_tkeep              : out std_logic_vector((((NO_OF_BYTES-1)-0)+1)-1 downto 0);                    -- tkeep
			o_axi_st_tx_tuser_client       : out std_logic_vector(1 downto 0);                                            -- tuser
			o_axi_st_tx_tuser_ptp          : out std_logic_vector(93 downto 0);                                           -- o_axi_st_tx_tuser_ptp
			o_axi_st_tx_tuser_ptp_extended : out std_logic_vector(327 downto 0);                                          -- o_axi_st_tx_tuser_ptp_extended
			o_av_st_rx_valid               : out std_logic;                                                               -- valid
			o_av_st_rx_data                : out std_logic_vector((((DATA_WIDTH-1)-0)+1)-1 downto 0);                     -- data
			o_av_st_rx_startofpacket       : out std_logic;                                                               -- startofpacket
			o_av_st_rx_endofpacket         : out std_logic;                                                               -- endofpacket
			o_av_st_rx_empty               : out std_logic_vector((((EMPTY_BITS-1)-0)+1)-1 downto 0);                     -- empty
			o_av_st_rx_error               : out std_logic_vector(5 downto 0);                                            -- error
			o_av_st_rxstatus_data          : out std_logic_vector(39 downto 0);                                           -- o_av_st_rxstatus_data
			o_av_st_rxstatus_valid         : out std_logic;                                                               -- o_av_st_rxstatus_valid
			o_av_st_ptp_rx_its             : out std_logic_vector(95 downto 0);                                           -- o_av_st_ptp_rx_its
			i_axi_st_rx_tvalid             : in  std_logic                                            := 'X';             -- tvalid
			i_axi_st_rx_tdata              : in  std_logic_vector((((DATA_WIDTH-1)-0)+1)-1 downto 0)  := (others => 'X'); -- tdata
			i_axi_st_rx_tlast              : in  std_logic                                            := 'X';             -- tlast
			i_axi_st_rx_tkeep              : in  std_logic_vector((((NO_OF_BYTES-1)-0)+1)-1 downto 0) := (others => 'X'); -- tkeep
			i_axi_st_rx_tuser_client       : in  std_logic_vector(6 downto 0)                         := (others => 'X'); -- tuser
			i_axi_st_rx_tuser_sts          : in  std_logic_vector(4 downto 0)                         := (others => 'X'); -- i_axi_st_rx_tuser_sts
			i_axi_st_rx_tuser_sts_extended : in  std_logic_vector(31 downto 0)                        := (others => 'X'); -- i_axi_st_rx_tuser_sts_extended
			i_axi_st_rx_ingrts0_tdata      : in  std_logic_vector(95 downto 0)                        := (others => 'X'); -- i_axi_st_rx_ingrts0_tdata
			i_axi_st_rx_ingrts0_tvalid     : in  std_logic                                            := 'X'              -- i_axi_st_rx_ingrts0_tvalid
		);
	end component qsys_top_avst_axist_bridge_0;

	u0 : component qsys_top_avst_axist_bridge_0
		generic map (
			DATA_WIDTH   => INTEGER_VALUE_FOR_DATA_WIDTH,
			NUM_CHANNELS => INTEGER_VALUE_FOR_NUM_CHANNELS,
			NO_OF_BYTES  => INTEGER_VALUE_FOR_NO_OF_BYTES,
			EMPTY_BITS   => INTEGER_VALUE_FOR_EMPTY_BITS,
			Tiles        => STRING_VALUE_FOR_Tiles,
			SIM_EMULATE  => INTEGER_VALUE_FOR_SIM_EMULATE
		)
		port map (
			i_tx_clk                       => CONNECTED_TO_i_tx_clk,                       --      i_tx_clk.clk
			i_rx_clk                       => CONNECTED_TO_i_rx_clk,                       --      i_rx_clk.clk
			i_tx_rst_n                     => CONNECTED_TO_i_tx_rst_n,                     --    i_tx_rst_n.reset_n
			i_rx_rst_n                     => CONNECTED_TO_i_rx_rst_n,                     --    i_rx_rst_n.reset_n
			o_av_st_tx_ready               => CONNECTED_TO_o_av_st_tx_ready,               --    avst_tx_if.ready
			i_av_st_tx_valid               => CONNECTED_TO_i_av_st_tx_valid,               --              .valid
			i_av_st_tx_data                => CONNECTED_TO_i_av_st_tx_data,                --              .data
			i_av_st_tx_startofpacket       => CONNECTED_TO_i_av_st_tx_startofpacket,       --              .startofpacket
			i_av_st_tx_endofpacket         => CONNECTED_TO_i_av_st_tx_endofpacket,         --              .endofpacket
			i_av_st_tx_empty               => CONNECTED_TO_i_av_st_tx_empty,               --              .empty
			i_av_st_tx_error               => CONNECTED_TO_i_av_st_tx_error,               --              .error
			i_av_st_tx_skip_crc            => CONNECTED_TO_i_av_st_tx_skip_crc,            --   avst_tx_ptp.i_av_st_tx_skip_crc
			i_av_st_tx_ptp_ts_valid        => CONNECTED_TO_i_av_st_tx_ptp_ts_valid,        --              .i_av_st_tx_ptp_ts_valid
			i_av_st_tx_ptp_ts_req          => CONNECTED_TO_i_av_st_tx_ptp_ts_req,          --              .i_av_st_tx_ptp_ts_req
			i_av_st_tx_ptp_ins_ets         => CONNECTED_TO_i_av_st_tx_ptp_ins_ets,         --              .i_av_st_tx_ptp_ins_ets
			i_av_st_tx_ptp_fp              => CONNECTED_TO_i_av_st_tx_ptp_fp,              --              .i_av_st_tx_ptp_fp
			i_av_st_tx_ptp_ins_cf          => CONNECTED_TO_i_av_st_tx_ptp_ins_cf,          --              .i_av_st_tx_ptp_ins_cf
			i_av_st_tx_ptp_tx_its          => CONNECTED_TO_i_av_st_tx_ptp_tx_its,          --              .i_av_st_tx_ptp_tx_its
			i_av_st_tx_ptp_asym_p2p_idx    => CONNECTED_TO_i_av_st_tx_ptp_asym_p2p_idx,    --              .i_av_st_tx_ptp_asym_p2p_idx
			i_av_st_tx_ptp_asym_sign       => CONNECTED_TO_i_av_st_tx_ptp_asym_sign,       --              .i_av_st_tx_ptp_asym_sign
			i_av_st_tx_ptp_asym            => CONNECTED_TO_i_av_st_tx_ptp_asym,            --              .i_av_st_tx_ptp_asym
			i_av_st_tx_ptp_p2p             => CONNECTED_TO_i_av_st_tx_ptp_p2p,             --              .i_av_st_tx_ptp_p2p
			i_av_st_tx_ptp_ts_format       => CONNECTED_TO_i_av_st_tx_ptp_ts_format,       --              .i_av_st_tx_ptp_ts_format
			i_av_st_tx_ptp_update_eb       => CONNECTED_TO_i_av_st_tx_ptp_update_eb,       --              .i_av_st_tx_ptp_update_eb
			i_av_st_tx_ptp_zero_csum       => CONNECTED_TO_i_av_st_tx_ptp_zero_csum,       --              .i_av_st_tx_ptp_zero_csum
			i_av_st_tx_ptp_eb_offset       => CONNECTED_TO_i_av_st_tx_ptp_eb_offset,       --              .i_av_st_tx_ptp_eb_offset
			i_av_st_tx_ptp_csum_offset     => CONNECTED_TO_i_av_st_tx_ptp_csum_offset,     --              .i_av_st_tx_ptp_csum_offset
			i_av_st_tx_ptp_cf_offset       => CONNECTED_TO_i_av_st_tx_ptp_cf_offset,       --              .i_av_st_tx_ptp_cf_offset
			i_av_st_tx_ptp_ts_offset       => CONNECTED_TO_i_av_st_tx_ptp_ts_offset,       --              .i_av_st_tx_ptp_ts_offset
			i_axi_st_tx_tready             => CONNECTED_TO_i_axi_st_tx_tready,             --    axit_tx_if.tready
			o_axi_st_tx_tvalid             => CONNECTED_TO_o_axi_st_tx_tvalid,             --              .tvalid
			o_axi_st_tx_tdata              => CONNECTED_TO_o_axi_st_tx_tdata,              --              .tdata
			o_axi_st_tx_tlast              => CONNECTED_TO_o_axi_st_tx_tlast,              --              .tlast
			o_axi_st_tx_tkeep              => CONNECTED_TO_o_axi_st_tx_tkeep,              --              .tkeep
			o_axi_st_tx_tuser_client       => CONNECTED_TO_o_axi_st_tx_tuser_client,       --              .tuser
			o_axi_st_tx_tuser_ptp          => CONNECTED_TO_o_axi_st_tx_tuser_ptp,          -- axist_tx_user.o_axi_st_tx_tuser_ptp
			o_axi_st_tx_tuser_ptp_extended => CONNECTED_TO_o_axi_st_tx_tuser_ptp_extended, --              .o_axi_st_tx_tuser_ptp_extended
			o_av_st_rx_valid               => CONNECTED_TO_o_av_st_rx_valid,               --    avst_rx_if.valid
			o_av_st_rx_data                => CONNECTED_TO_o_av_st_rx_data,                --              .data
			o_av_st_rx_startofpacket       => CONNECTED_TO_o_av_st_rx_startofpacket,       --              .startofpacket
			o_av_st_rx_endofpacket         => CONNECTED_TO_o_av_st_rx_endofpacket,         --              .endofpacket
			o_av_st_rx_empty               => CONNECTED_TO_o_av_st_rx_empty,               --              .empty
			o_av_st_rx_error               => CONNECTED_TO_o_av_st_rx_error,               --              .error
			o_av_st_rxstatus_data          => CONNECTED_TO_o_av_st_rxstatus_data,          --   avst_rx_ptp.o_av_st_rxstatus_data
			o_av_st_rxstatus_valid         => CONNECTED_TO_o_av_st_rxstatus_valid,         --              .o_av_st_rxstatus_valid
			o_av_st_ptp_rx_its             => CONNECTED_TO_o_av_st_ptp_rx_its,             --              .o_av_st_ptp_rx_its
			i_axi_st_rx_tvalid             => CONNECTED_TO_i_axi_st_rx_tvalid,             --   axist_rx_if.tvalid
			i_axi_st_rx_tdata              => CONNECTED_TO_i_axi_st_rx_tdata,              --              .tdata
			i_axi_st_rx_tlast              => CONNECTED_TO_i_axi_st_rx_tlast,              --              .tlast
			i_axi_st_rx_tkeep              => CONNECTED_TO_i_axi_st_rx_tkeep,              --              .tkeep
			i_axi_st_rx_tuser_client       => CONNECTED_TO_i_axi_st_rx_tuser_client,       --              .tuser
			i_axi_st_rx_tuser_sts          => CONNECTED_TO_i_axi_st_rx_tuser_sts,          -- axist_rx_user.i_axi_st_rx_tuser_sts
			i_axi_st_rx_tuser_sts_extended => CONNECTED_TO_i_axi_st_rx_tuser_sts_extended, --              .i_axi_st_rx_tuser_sts_extended
			i_axi_st_rx_ingrts0_tdata      => CONNECTED_TO_i_axi_st_rx_ingrts0_tdata,      --              .i_axi_st_rx_ingrts0_tdata
			i_axi_st_rx_ingrts0_tvalid     => CONNECTED_TO_i_axi_st_rx_ingrts0_tvalid      --              .i_axi_st_rx_ingrts0_tvalid
		);

