	component ecpri_oran_top_ecpri_oran_0 is
		generic (
			NUM_OF_ANT              : integer := 8;
			NUM_OF_FFT              : integer := 2;
			CPRI_ETH_DATAWIDTH      : integer := 128;
			XRAN_ETH_DATAWIDTH      : integer := 128;
			CH_DW                   : integer := 8;
			NUM_OF_PRACH            : integer := 2;
			CAPTURE_DMA_WIDTH       : integer := 512;
			IQ_DATAWIDTH            : integer := 32;
			CPRI_FRAME_DATAWIDTH    : integer := 64;
			ECPRI_CAPTURE_INSTANCES : integer := 2;
			DSP_CAPTURE_INSTANCES   : integer := 30;
			ANTENNA_DWIDTH          : integer := 0
		);
		port (
			ecpri_csr_address                   : in  std_logic_vector(9 downto 0)                                := (others => 'X'); -- address
			ecpri_csr_write                     : in  std_logic                                                   := 'X';             -- write
			ecpri_csr_read                      : in  std_logic                                                   := 'X';             -- read
			ecpri_csr_writedata                 : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			ecpri_csr_readdata                  : out std_logic_vector(31 downto 0);                                                  -- readdata
			ecpri_csr_readdatavalid             : out std_logic;                                                                      -- readdatavalid
			ecpri_csr_waitrequest               : out std_logic;                                                                      -- waitrequest
			oran_csr_address                    : in  std_logic_vector(9 downto 0)                                := (others => 'X'); -- address
			oran_csr_write                      : in  std_logic                                                   := 'X';             -- write
			oran_csr_read                       : in  std_logic                                                   := 'X';             -- read
			oran_csr_writedata                  : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			oran_csr_readdata                   : out std_logic_vector(31 downto 0);                                                  -- readdata
			oran_csr_readdatavalid              : out std_logic;                                                                      -- readdatavalid
			oran_csr_waitrequest                : out std_logic;                                                                      -- waitrequest
			clk_csr                             : in  std_logic                                                   := 'X';             -- clk
			clk_dsp                             : in  std_logic                                                   := 'X';             -- clk
			clk_ecpri_tx                        : in  std_logic                                                   := 'X';             -- clk
			clk_ecpri_rx                        : in  std_logic                                                   := 'X';             -- clk
			clk_eth_xran_dl                     : in  std_logic                                                   := 'X';             -- clk
			clk_eth_xran_ul                     : in  std_logic                                                   := 'X';             -- clk
			rst_dsp_n                           : in  std_logic                                                   := 'X';             -- reset_n
			rst_ecpri_n                         : in  std_logic                                                   := 'X';             -- reset_n
			rst_csr_n                           : in  std_logic                                                   := 'X';             -- reset_n
			rst_eth_xran_n_dl                   : in  std_logic                                                   := 'X';             -- reset_n
			rst_eth_xran_n_ul                   : in  std_logic                                                   := 'X';             -- reset_n
			coupling_pusch_avst_sink_valid_l1   : in  std_logic                                                   := 'X';             -- valid
			coupling_pusch_avst_sink_data_l1    : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- data
			coupling_pusch_avst_sink_channel_l1 : in  std_logic_vector(15 downto 0)                               := (others => 'X'); -- channel
			coupling_pusch_avst_sink_sop_l1     : in  std_logic                                                   := 'X';             -- startofpacket
			coupling_pusch_avst_sink_eop_l1     : in  std_logic                                                   := 'X';             -- endofpacket
			coupling_pusch_avst_sink_valid_l2   : in  std_logic                                                   := 'X';             -- valid
			coupling_pusch_avst_sink_data_l2    : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- data
			coupling_pusch_avst_sink_channel_l2 : in  std_logic_vector(15 downto 0)                               := (others => 'X'); -- channel
			coupling_pusch_avst_sink_sop_l2     : in  std_logic                                                   := 'X';             -- startofpacket
			coupling_pusch_avst_sink_eop_l2     : in  std_logic                                                   := 'X';             -- endofpacket
			coupling_prach_avst_sink_valid_l2   : in  std_logic                                                   := 'X';             -- valid
			coupling_prach_avst_sink_data_l2    : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- data
			coupling_prach_avst_sink_channel_l2 : in  std_logic_vector(15 downto 0)                               := (others => 'X'); -- channel
			coupling_prach_avst_sink_sop_l2     : in  std_logic                                                   := 'X';             -- startofpacket
			coupling_prach_avst_sink_eop_l2     : in  std_logic                                                   := 'X';             -- endofpacket
			avst_source_ul_bridge_valid         : out std_logic;                                                                      -- valid
			avst_source_ul_bridge_data          : out std_logic_vector(63 downto 0);                                                  -- data
			avst_source_ul_bridge_ready         : in  std_logic                                                   := 'X';             -- ready
			avst_source_ul_bridge_startofpacket : out std_logic;                                                                      -- startofpacket
			avst_source_ul_bridge_empty         : out std_logic_vector(2 downto 0);                                                   -- empty
			avst_source_ul_bridge_endofpacket   : out std_logic;                                                                      -- endofpacket
			avst_sink_dl_valid                  : in  std_logic                                                   := 'X';             -- valid
			avst_sink_dl_data                   : in  std_logic_vector(63 downto 0)                               := (others => 'X'); -- data
			avst_sink_dl_endofpacket            : in  std_logic                                                   := 'X';             -- endofpacket
			avst_sink_dl_ready                  : out std_logic;                                                                      -- ready
			avst_sink_dl_startofpacket          : in  std_logic                                                   := 'X';             -- startofpacket
			avst_sink_dl_empty                  : in  std_logic_vector(2 downto 0)                                := (others => 'X'); -- empty
			avst_sink_dl_error                  : in  std_logic_vector(5 downto 0)                                := (others => 'X'); -- error
			ecpri_ext_sink_valid                : in  std_logic                                                   := 'X';             -- valid
			ecpri_ext_sink_data                 : in  std_logic_vector(63 downto 0)                               := (others => 'X'); -- data
			ecpri_ext_sink_sop                  : in  std_logic                                                   := 'X';             -- startofpacket
			ecpri_ext_sink_eop                  : in  std_logic                                                   := 'X';             -- endofpacket
			ecpri_ext_sink_empty                : in  std_logic_vector(2 downto 0)                                := (others => 'X'); -- empty
			ecpri_ext_sink_error                : in  std_logic                                                   := 'X';             -- error
			ecpri_ext_sink_ready                : out std_logic;                                                                      -- ready
			ecpri_ext_source_valid              : out std_logic;                                                                      -- valid
			ecpri_ext_source_data               : out std_logic_vector(63 downto 0);                                                  -- data
			ecpri_ext_source_sop                : out std_logic;                                                                      -- startofpacket
			ecpri_ext_source_eop                : out std_logic;                                                                      -- endofpacket
			ecpri_ext_source_empty              : out std_logic_vector(2 downto 0);                                                   -- empty
			ecpri_ext_source_error              : out std_logic_vector(5 downto 0);                                                   -- error
			xran_demapper_source_valid          : out std_logic;                                                                      -- valid
			xran_demapper_source_data           : out std_logic_vector((((XRAN_ETH_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- data
			xran_demapper_source_channel        : out std_logic_vector(15 downto 0);                                                  -- channel
			xran_demapper_source_startofpacket  : out std_logic;                                                                      -- startofpacket
			xran_demapper_source_ready          : in  std_logic                                                   := 'X';             -- ready
			xran_demapper_source_endofpacket    : out std_logic;                                                                      -- endofpacket
			xran_demapper_cplane_valid          : out std_logic;                                                                      -- valid
			xran_demapper_cplane_startofpacket  : out std_logic;                                                                      -- startofpacket
			xran_demapper_cplane_endofpacket    : out std_logic;                                                                      -- endofpacket
			o_mac_ptp_fp                        : out std_logic_vector(21 downto 0);                                                  -- o_mac_ptp_fp
			o_mac_ptp_ts_req                    : out std_logic;                                                                      -- o_mac_ptp_ts_req
			i_mac_ptp_tx_ets_valid              : in  std_logic                                                   := 'X';             -- i_mac_ptp_tx_ets_valid
			i_mac_ptp_tx_ets                    : in  std_logic_vector(95 downto 0)                               := (others => 'X'); -- i_mac_ptp_tx_ets
			i_mac_ptp_tx_ets_fp                 : in  std_logic_vector(21 downto 0)                               := (others => 'X'); -- i_mac_ptp_tx_ets_fp
			i_mac_ptp_rx_its_valid              : in  std_logic                                                   := 'X';             -- i_mac_ptp_rx_its_valid
			i_mac_ptp_rx_its                    : in  std_logic_vector(95 downto 0)                               := (others => 'X'); -- i_mac_ptp_rx_its
			i_ext_ptp_fp                        : in  std_logic_vector(19 downto 0)                               := (others => 'X'); -- i_ext_ptp_fp
			i_ext_ptp_ts_req                    : in  std_logic                                                   := 'X';             -- i_ext_ptp_ts_req
			o_ext_ptp_tx_ets_valid              : out std_logic;                                                                      -- o_ext_ptp_tx_ets_valid
			o_ext_ptp_tx_ets                    : out std_logic_vector(95 downto 0);                                                  -- o_ext_ptp_tx_ets
			o_ext_ptp_tx_ets_fp                 : out std_logic_vector(19 downto 0);                                                  -- o_ext_ptp_tx_ets_fp
			o_ext_ptp_rx_its                    : out std_logic_vector(95 downto 0);                                                  -- o_ext_ptp_rx_its
			o_ext_ptp_rx_its_valid              : out std_logic;                                                                      -- o_ext_ptp_rx_its_valid
			rx_pcs_ready                        : in  std_logic                                                   := 'X';             -- rx_pcs_ready
			tx_lanes_stable                     : in  std_logic                                                   := 'X';             -- tx_lanes_stable
			rst_soft_n                          : in  std_logic                                                   := 'X';             -- rst_soft_n
			oran_tx_time_of_day_96b_data        : in  std_logic_vector(95 downto 0)                               := (others => 'X'); -- tdata
			oran_tx_time_of_day_96b_valid       : in  std_logic                                                   := 'X';             -- tvalid
			oran_rx_time_of_day_96b_data        : in  std_logic_vector(95 downto 0)                               := (others => 'X'); -- tdata
			oran_rx_time_of_day_96b_valid       : in  std_logic                                                   := 'X';             -- tvalid
			bw_config_cc1                       : in  std_logic_vector(7 downto 0)                                := (others => 'X'); -- bw_config_cc1
			bw_config_cc2                       : in  std_logic_vector(7 downto 0)                                := (others => 'X'); -- bw_config_cc2
			short_long_prach_select             : in  std_logic                                                   := 'X';             -- data
			rx_rtc_id                           : out std_logic_vector(15 downto 0);                                                  -- rx_rtc_id
			rx_rtc_id_dl                        : out std_logic_vector(15 downto 0);                                                  -- rx_rtc_id_dl
			rx_u_axc_id                         : out std_logic_vector(15 downto 0);                                                  -- rx_u_axc_id
			ul_rtc_id_intr                      : out std_logic;                                                                      -- ul_rtc_id_intr
			dl_rtc_id_intr                      : out std_logic;                                                                      -- dl_rtc_id_intr
			ul_axc_id_intr                      : out std_logic;                                                                      -- ul_axc_id_intr
			dl_axc_id_intr                      : out std_logic;                                                                      -- dl_axc_id_intr
			coupling_pusch_timing_ref           : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- data
			coupling_prach_timing_ref           : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- data
			coupling_prach_avst_sink_valid_l1   : in  std_logic                                                   := 'X';             -- valid
			coupling_prach_avst_sink_data_l1    : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- data
			coupling_prach_avst_sink_channel_l1 : in  std_logic_vector(15 downto 0)                               := (others => 'X'); -- channel
			coupling_prach_avst_sink_sop_l1     : in  std_logic                                                   := 'X';             -- startofpacket
			coupling_prach_avst_sink_eop_l1     : in  std_logic                                                   := 'X';             -- endofpacket
			downlink_eaxc_id_concat             : in  std_logic_vector(127 downto 0)                              := (others => 'X'); -- data
			oran_rx_uplane_concat               : out std_logic_vector(67 downto 0);                                                  -- data
			oran_rx_cplane_concat               : out std_logic_vector(189 downto 0);                                                 -- data
			uplink_eaxc_id_concat               : in  std_logic_vector(255 downto 0)                              := (others => 'X'); -- data
			ul_start_pulse_latch                : in  std_logic                                                   := 'X';             -- data
			fh_comp_csr_address                 : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- address
			fh_comp_csr_write                   : in  std_logic                                                   := 'X';             -- write
			fh_comp_csr_read                    : in  std_logic                                                   := 'X';             -- read
			fh_comp_csr_writedata               : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			fh_comp_csr_readdata                : out std_logic_vector(31 downto 0);                                                  -- readdata
			fh_comp_csr_readdatavalid           : out std_logic;                                                                      -- readdatavalid
			fh_comp_csr_waitrequest             : out std_logic;                                                                      -- waitrequest
			oran_ss_config_csr_address          : in  std_logic_vector(7 downto 0)                                := (others => 'X'); -- address
			oran_ss_config_csr_write            : in  std_logic                                                   := 'X';             -- write
			oran_ss_config_csr_writedata        : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			oran_ss_config_csr_readdata         : out std_logic_vector(31 downto 0);                                                  -- readdata
			oran_ss_config_csr_read             : in  std_logic                                                   := 'X';             -- read
			oran_ss_config_csr_readdata_valid   : out std_logic;                                                                      -- readdatavalid
			oran_ss_config_csr_waitrequest      : out std_logic;                                                                      -- waitrequest
			tod                                 : in  std_logic_vector(95 downto 0)                               := (others => 'X'); -- data
			radio_config_status                 : in  std_logic_vector(55 downto 0)                               := (others => 'X'); -- data
			dl_input_hfn_pulse                  : in  std_logic                                                   := 'X';             -- data
			xran_timestamp_ram_read             : in  std_logic                                                   := 'X';             -- read
			xran_timestamp_ram_readdata         : out std_logic_vector(63 downto 0);                                                  -- readdata
			timeout_cntr_intr_uplane            : out std_logic;                                                                      -- irq
			timeout_cntr_intr_cplane            : out std_logic;                                                                      -- irq
			fifo_full_intr                      : out std_logic;                                                                      -- irq
			tx_ptp_fp_bridge                    : out std_logic_vector(31 downto 0);                                                  -- fingerprint
			tx_ptp_ts_req_bridge                : out std_logic                                                                       -- ts_request
		);
	end component ecpri_oran_top_ecpri_oran_0;

	u0 : component ecpri_oran_top_ecpri_oran_0
		generic map (
			NUM_OF_ANT              => INTEGER_VALUE_FOR_NUM_OF_ANT,
			NUM_OF_FFT              => INTEGER_VALUE_FOR_NUM_OF_FFT,
			CPRI_ETH_DATAWIDTH      => INTEGER_VALUE_FOR_CPRI_ETH_DATAWIDTH,
			XRAN_ETH_DATAWIDTH      => INTEGER_VALUE_FOR_XRAN_ETH_DATAWIDTH,
			CH_DW                   => INTEGER_VALUE_FOR_CH_DW,
			NUM_OF_PRACH            => INTEGER_VALUE_FOR_NUM_OF_PRACH,
			CAPTURE_DMA_WIDTH       => INTEGER_VALUE_FOR_CAPTURE_DMA_WIDTH,
			IQ_DATAWIDTH            => INTEGER_VALUE_FOR_IQ_DATAWIDTH,
			CPRI_FRAME_DATAWIDTH    => INTEGER_VALUE_FOR_CPRI_FRAME_DATAWIDTH,
			ECPRI_CAPTURE_INSTANCES => INTEGER_VALUE_FOR_ECPRI_CAPTURE_INSTANCES,
			DSP_CAPTURE_INSTANCES   => INTEGER_VALUE_FOR_DSP_CAPTURE_INSTANCES,
			ANTENNA_DWIDTH          => INTEGER_VALUE_FOR_ANTENNA_DWIDTH
		)
		port map (
			ecpri_csr_address                   => CONNECTED_TO_ecpri_csr_address,                   --                     ecpri_csr.address
			ecpri_csr_write                     => CONNECTED_TO_ecpri_csr_write,                     --                              .write
			ecpri_csr_read                      => CONNECTED_TO_ecpri_csr_read,                      --                              .read
			ecpri_csr_writedata                 => CONNECTED_TO_ecpri_csr_writedata,                 --                              .writedata
			ecpri_csr_readdata                  => CONNECTED_TO_ecpri_csr_readdata,                  --                              .readdata
			ecpri_csr_readdatavalid             => CONNECTED_TO_ecpri_csr_readdatavalid,             --                              .readdatavalid
			ecpri_csr_waitrequest               => CONNECTED_TO_ecpri_csr_waitrequest,               --                              .waitrequest
			oran_csr_address                    => CONNECTED_TO_oran_csr_address,                    --                      oran_csr.address
			oran_csr_write                      => CONNECTED_TO_oran_csr_write,                      --                              .write
			oran_csr_read                       => CONNECTED_TO_oran_csr_read,                       --                              .read
			oran_csr_writedata                  => CONNECTED_TO_oran_csr_writedata,                  --                              .writedata
			oran_csr_readdata                   => CONNECTED_TO_oran_csr_readdata,                   --                              .readdata
			oran_csr_readdatavalid              => CONNECTED_TO_oran_csr_readdatavalid,              --                              .readdatavalid
			oran_csr_waitrequest                => CONNECTED_TO_oran_csr_waitrequest,                --                              .waitrequest
			clk_csr                             => CONNECTED_TO_clk_csr,                             --                     clock_csr.clk
			clk_dsp                             => CONNECTED_TO_clk_dsp,                             --                     clock_dsp.clk
			clk_ecpri_tx                        => CONNECTED_TO_clk_ecpri_tx,                        --                clock_ecpri_tx.clk
			clk_ecpri_rx                        => CONNECTED_TO_clk_ecpri_rx,                        --                clock_ecpri_rx.clk
			clk_eth_xran_dl                     => CONNECTED_TO_clk_eth_xran_dl,                     --             clock_eth_xran_dl.clk
			clk_eth_xran_ul                     => CONNECTED_TO_clk_eth_xran_ul,                     --             clock_eth_xran_ul.clk
			rst_dsp_n                           => CONNECTED_TO_rst_dsp_n,                           --                   reset_dsp_n.reset_n
			rst_ecpri_n                         => CONNECTED_TO_rst_ecpri_n,                         --                   rst_ecpri_n.reset_n
			rst_csr_n                           => CONNECTED_TO_rst_csr_n,                           --                   reset_csr_n.reset_n
			rst_eth_xran_n_dl                   => CONNECTED_TO_rst_eth_xran_n_dl,                   --           reset_eth_xran_dl_n.reset_n
			rst_eth_xran_n_ul                   => CONNECTED_TO_rst_eth_xran_n_ul,                   --           reset_eth_xran_ul_n.reset_n
			coupling_pusch_avst_sink_valid_l1   => CONNECTED_TO_coupling_pusch_avst_sink_valid_l1,   --        coupling_pusch_sink_l1.valid
			coupling_pusch_avst_sink_data_l1    => CONNECTED_TO_coupling_pusch_avst_sink_data_l1,    --                              .data
			coupling_pusch_avst_sink_channel_l1 => CONNECTED_TO_coupling_pusch_avst_sink_channel_l1, --                              .channel
			coupling_pusch_avst_sink_sop_l1     => CONNECTED_TO_coupling_pusch_avst_sink_sop_l1,     --                              .startofpacket
			coupling_pusch_avst_sink_eop_l1     => CONNECTED_TO_coupling_pusch_avst_sink_eop_l1,     --                              .endofpacket
			coupling_pusch_avst_sink_valid_l2   => CONNECTED_TO_coupling_pusch_avst_sink_valid_l2,   --        coupling_pusch_sink_l2.valid
			coupling_pusch_avst_sink_data_l2    => CONNECTED_TO_coupling_pusch_avst_sink_data_l2,    --                              .data
			coupling_pusch_avst_sink_channel_l2 => CONNECTED_TO_coupling_pusch_avst_sink_channel_l2, --                              .channel
			coupling_pusch_avst_sink_sop_l2     => CONNECTED_TO_coupling_pusch_avst_sink_sop_l2,     --                              .startofpacket
			coupling_pusch_avst_sink_eop_l2     => CONNECTED_TO_coupling_pusch_avst_sink_eop_l2,     --                              .endofpacket
			coupling_prach_avst_sink_valid_l2   => CONNECTED_TO_coupling_prach_avst_sink_valid_l2,   --        coupling_prach_sink_l2.valid
			coupling_prach_avst_sink_data_l2    => CONNECTED_TO_coupling_prach_avst_sink_data_l2,    --                              .data
			coupling_prach_avst_sink_channel_l2 => CONNECTED_TO_coupling_prach_avst_sink_channel_l2, --                              .channel
			coupling_prach_avst_sink_sop_l2     => CONNECTED_TO_coupling_prach_avst_sink_sop_l2,     --                              .startofpacket
			coupling_prach_avst_sink_eop_l2     => CONNECTED_TO_coupling_prach_avst_sink_eop_l2,     --                              .endofpacket
			avst_source_ul_bridge_valid         => CONNECTED_TO_avst_source_ul_bridge_valid,         --         avst_source_ul_bridge.valid
			avst_source_ul_bridge_data          => CONNECTED_TO_avst_source_ul_bridge_data,          --                              .data
			avst_source_ul_bridge_ready         => CONNECTED_TO_avst_source_ul_bridge_ready,         --                              .ready
			avst_source_ul_bridge_startofpacket => CONNECTED_TO_avst_source_ul_bridge_startofpacket, --                              .startofpacket
			avst_source_ul_bridge_empty         => CONNECTED_TO_avst_source_ul_bridge_empty,         --                              .empty
			avst_source_ul_bridge_endofpacket   => CONNECTED_TO_avst_source_ul_bridge_endofpacket,   --                              .endofpacket
			avst_sink_dl_valid                  => CONNECTED_TO_avst_sink_dl_valid,                  --                  avst_sink_dl.valid
			avst_sink_dl_data                   => CONNECTED_TO_avst_sink_dl_data,                   --                              .data
			avst_sink_dl_endofpacket            => CONNECTED_TO_avst_sink_dl_endofpacket,            --                              .endofpacket
			avst_sink_dl_ready                  => CONNECTED_TO_avst_sink_dl_ready,                  --                              .ready
			avst_sink_dl_startofpacket          => CONNECTED_TO_avst_sink_dl_startofpacket,          --                              .startofpacket
			avst_sink_dl_empty                  => CONNECTED_TO_avst_sink_dl_empty,                  --                              .empty
			avst_sink_dl_error                  => CONNECTED_TO_avst_sink_dl_error,                  --                              .error
			ecpri_ext_sink_valid                => CONNECTED_TO_ecpri_ext_sink_valid,                --                ecpri_ext_sink.valid
			ecpri_ext_sink_data                 => CONNECTED_TO_ecpri_ext_sink_data,                 --                              .data
			ecpri_ext_sink_sop                  => CONNECTED_TO_ecpri_ext_sink_sop,                  --                              .startofpacket
			ecpri_ext_sink_eop                  => CONNECTED_TO_ecpri_ext_sink_eop,                  --                              .endofpacket
			ecpri_ext_sink_empty                => CONNECTED_TO_ecpri_ext_sink_empty,                --                              .empty
			ecpri_ext_sink_error                => CONNECTED_TO_ecpri_ext_sink_error,                --                              .error
			ecpri_ext_sink_ready                => CONNECTED_TO_ecpri_ext_sink_ready,                --                              .ready
			ecpri_ext_source_valid              => CONNECTED_TO_ecpri_ext_source_valid,              --              ecpri_ext_source.valid
			ecpri_ext_source_data               => CONNECTED_TO_ecpri_ext_source_data,               --                              .data
			ecpri_ext_source_sop                => CONNECTED_TO_ecpri_ext_source_sop,                --                              .startofpacket
			ecpri_ext_source_eop                => CONNECTED_TO_ecpri_ext_source_eop,                --                              .endofpacket
			ecpri_ext_source_empty              => CONNECTED_TO_ecpri_ext_source_empty,              --                              .empty
			ecpri_ext_source_error              => CONNECTED_TO_ecpri_ext_source_error,              --                              .error
			xran_demapper_source_valid          => CONNECTED_TO_xran_demapper_source_valid,          --          xran_demapper_source.valid
			xran_demapper_source_data           => CONNECTED_TO_xran_demapper_source_data,           --                              .data
			xran_demapper_source_channel        => CONNECTED_TO_xran_demapper_source_channel,        --                              .channel
			xran_demapper_source_startofpacket  => CONNECTED_TO_xran_demapper_source_startofpacket,  --                              .startofpacket
			xran_demapper_source_ready          => CONNECTED_TO_xran_demapper_source_ready,          --                              .ready
			xran_demapper_source_endofpacket    => CONNECTED_TO_xran_demapper_source_endofpacket,    --                              .endofpacket
			xran_demapper_cplane_valid          => CONNECTED_TO_xran_demapper_cplane_valid,          --   xran_demapper_cplane_source.valid
			xran_demapper_cplane_startofpacket  => CONNECTED_TO_xran_demapper_cplane_startofpacket,  --                              .startofpacket
			xran_demapper_cplane_endofpacket    => CONNECTED_TO_xran_demapper_cplane_endofpacket,    --                              .endofpacket
			o_mac_ptp_fp                        => CONNECTED_TO_o_mac_ptp_fp,                        --                       ptp_tod.o_mac_ptp_fp
			o_mac_ptp_ts_req                    => CONNECTED_TO_o_mac_ptp_ts_req,                    --                              .o_mac_ptp_ts_req
			i_mac_ptp_tx_ets_valid              => CONNECTED_TO_i_mac_ptp_tx_ets_valid,              --                              .i_mac_ptp_tx_ets_valid
			i_mac_ptp_tx_ets                    => CONNECTED_TO_i_mac_ptp_tx_ets,                    --                              .i_mac_ptp_tx_ets
			i_mac_ptp_tx_ets_fp                 => CONNECTED_TO_i_mac_ptp_tx_ets_fp,                 --                              .i_mac_ptp_tx_ets_fp
			i_mac_ptp_rx_its_valid              => CONNECTED_TO_i_mac_ptp_rx_its_valid,              --                              .i_mac_ptp_rx_its_valid
			i_mac_ptp_rx_its                    => CONNECTED_TO_i_mac_ptp_rx_its,                    --                              .i_mac_ptp_rx_its
			i_ext_ptp_fp                        => CONNECTED_TO_i_ext_ptp_fp,                        --                              .i_ext_ptp_fp
			i_ext_ptp_ts_req                    => CONNECTED_TO_i_ext_ptp_ts_req,                    --                              .i_ext_ptp_ts_req
			o_ext_ptp_tx_ets_valid              => CONNECTED_TO_o_ext_ptp_tx_ets_valid,              --                              .o_ext_ptp_tx_ets_valid
			o_ext_ptp_tx_ets                    => CONNECTED_TO_o_ext_ptp_tx_ets,                    --                              .o_ext_ptp_tx_ets
			o_ext_ptp_tx_ets_fp                 => CONNECTED_TO_o_ext_ptp_tx_ets_fp,                 --                              .o_ext_ptp_tx_ets_fp
			o_ext_ptp_rx_its                    => CONNECTED_TO_o_ext_ptp_rx_its,                    --                              .o_ext_ptp_rx_its
			o_ext_ptp_rx_its_valid              => CONNECTED_TO_o_ext_ptp_rx_its_valid,              --                              .o_ext_ptp_rx_its_valid
			rx_pcs_ready                        => CONNECTED_TO_rx_pcs_ready,                        --                  rx_pcs_ready.rx_pcs_ready
			tx_lanes_stable                     => CONNECTED_TO_tx_lanes_stable,                     --               tx_lanes_stable.tx_lanes_stable
			rst_soft_n                          => CONNECTED_TO_rst_soft_n,                          --                    rst_soft_n.rst_soft_n
			oran_tx_time_of_day_96b_data        => CONNECTED_TO_oran_tx_time_of_day_96b_data,        --          oran_tx_tod_96b_data.tdata
			oran_tx_time_of_day_96b_valid       => CONNECTED_TO_oran_tx_time_of_day_96b_valid,       --                              .tvalid
			oran_rx_time_of_day_96b_data        => CONNECTED_TO_oran_rx_time_of_day_96b_data,        --          oran_rx_tod_96b_data.tdata
			oran_rx_time_of_day_96b_valid       => CONNECTED_TO_oran_rx_time_of_day_96b_valid,       --                              .tvalid
			bw_config_cc1                       => CONNECTED_TO_bw_config_cc1,                       --                 bw_config_cc1.bw_config_cc1
			bw_config_cc2                       => CONNECTED_TO_bw_config_cc2,                       --                 bw_config_cc2.bw_config_cc2
			short_long_prach_select             => CONNECTED_TO_short_long_prach_select,             --       short_long_prach_select.data
			rx_rtc_id                           => CONNECTED_TO_rx_rtc_id,                           --                     rx_rtc_id.rx_rtc_id
			rx_rtc_id_dl                        => CONNECTED_TO_rx_rtc_id_dl,                        --                  rx_rtc_id_dl.rx_rtc_id_dl
			rx_u_axc_id                         => CONNECTED_TO_rx_u_axc_id,                         --                   rx_u_axc_id.rx_u_axc_id
			ul_rtc_id_intr                      => CONNECTED_TO_ul_rtc_id_intr,                      --                ul_rtc_id_intr.ul_rtc_id_intr
			dl_rtc_id_intr                      => CONNECTED_TO_dl_rtc_id_intr,                      --                dl_rtc_id_intr.dl_rtc_id_intr
			ul_axc_id_intr                      => CONNECTED_TO_ul_axc_id_intr,                      --                ul_axc_id_intr.ul_axc_id_intr
			dl_axc_id_intr                      => CONNECTED_TO_dl_axc_id_intr,                      --                dl_axc_id_intr.dl_axc_id_intr
			coupling_pusch_timing_ref           => CONNECTED_TO_coupling_pusch_timing_ref,           --     coupling_pusch_timing_ref.data
			coupling_prach_timing_ref           => CONNECTED_TO_coupling_prach_timing_ref,           --     coupling_prach_timing_ref.data
			coupling_prach_avst_sink_valid_l1   => CONNECTED_TO_coupling_prach_avst_sink_valid_l1,   --        coupling_prach_sink_l1.valid
			coupling_prach_avst_sink_data_l1    => CONNECTED_TO_coupling_prach_avst_sink_data_l1,    --                              .data
			coupling_prach_avst_sink_channel_l1 => CONNECTED_TO_coupling_prach_avst_sink_channel_l1, --                              .channel
			coupling_prach_avst_sink_sop_l1     => CONNECTED_TO_coupling_prach_avst_sink_sop_l1,     --                              .startofpacket
			coupling_prach_avst_sink_eop_l1     => CONNECTED_TO_coupling_prach_avst_sink_eop_l1,     --                              .endofpacket
			downlink_eaxc_id_concat             => CONNECTED_TO_downlink_eaxc_id_concat,             --       downlink_eaxc_id_concat.data
			oran_rx_uplane_concat               => CONNECTED_TO_oran_rx_uplane_concat,               --         oran_rx_uplane_concat.data
			oran_rx_cplane_concat               => CONNECTED_TO_oran_rx_cplane_concat,               --         oran_rx_cplane_concat.data
			uplink_eaxc_id_concat               => CONNECTED_TO_uplink_eaxc_id_concat,               --         uplink_eaxc_id_concat.data
			ul_start_pulse_latch                => CONNECTED_TO_ul_start_pulse_latch,                -- coupling_ul_start_pulse_latch.data
			fh_comp_csr_address                 => CONNECTED_TO_fh_comp_csr_address,                 --                   fh_comp_csr.address
			fh_comp_csr_write                   => CONNECTED_TO_fh_comp_csr_write,                   --                              .write
			fh_comp_csr_read                    => CONNECTED_TO_fh_comp_csr_read,                    --                              .read
			fh_comp_csr_writedata               => CONNECTED_TO_fh_comp_csr_writedata,               --                              .writedata
			fh_comp_csr_readdata                => CONNECTED_TO_fh_comp_csr_readdata,                --                              .readdata
			fh_comp_csr_readdatavalid           => CONNECTED_TO_fh_comp_csr_readdatavalid,           --                              .readdatavalid
			fh_comp_csr_waitrequest             => CONNECTED_TO_fh_comp_csr_waitrequest,             --                              .waitrequest
			oran_ss_config_csr_address          => CONNECTED_TO_oran_ss_config_csr_address,          --            oran_ss_config_csr.address
			oran_ss_config_csr_write            => CONNECTED_TO_oran_ss_config_csr_write,            --                              .write
			oran_ss_config_csr_writedata        => CONNECTED_TO_oran_ss_config_csr_writedata,        --                              .writedata
			oran_ss_config_csr_readdata         => CONNECTED_TO_oran_ss_config_csr_readdata,         --                              .readdata
			oran_ss_config_csr_read             => CONNECTED_TO_oran_ss_config_csr_read,             --                              .read
			oran_ss_config_csr_readdata_valid   => CONNECTED_TO_oran_ss_config_csr_readdata_valid,   --                              .readdatavalid
			oran_ss_config_csr_waitrequest      => CONNECTED_TO_oran_ss_config_csr_waitrequest,      --                              .waitrequest
			tod                                 => CONNECTED_TO_tod,                                 --                           tod.data
			radio_config_status                 => CONNECTED_TO_radio_config_status,                 --           radio_config_status.data
			dl_input_hfn_pulse                  => CONNECTED_TO_dl_input_hfn_pulse,                  --            dl_input_hfn_pulse.data
			xran_timestamp_ram_read             => CONNECTED_TO_xran_timestamp_ram_read,             --            xran_timestamp_mem.read
			xran_timestamp_ram_readdata         => CONNECTED_TO_xran_timestamp_ram_readdata,         --                              .readdata
			timeout_cntr_intr_uplane            => CONNECTED_TO_timeout_cntr_intr_uplane,            --      timeout_cntr_intr_uplane.irq
			timeout_cntr_intr_cplane            => CONNECTED_TO_timeout_cntr_intr_cplane,            --      timeout_cntr_intr_cplane.irq
			fifo_full_intr                      => CONNECTED_TO_fifo_full_intr,                      --                fifo_full_intr.irq
			tx_ptp_fp_bridge                    => CONNECTED_TO_tx_ptp_fp_bridge,                    --                 tx_ptp_req_fp.fingerprint
			tx_ptp_ts_req_bridge                => CONNECTED_TO_tx_ptp_ts_req_bridge                 --                              .ts_request
		);

