	component ecpri_oran_top is
		port (
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_skip_crc              : in  std_logic                      := 'X';             -- i_av_st_tx_skip_crc
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_valid          : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- i_av_st_tx_ptp_ts_valid
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_ets           : in  std_logic                      := 'X';             -- i_av_st_tx_ptp_ins_ets
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_cf            : in  std_logic                      := 'X';             -- i_av_st_tx_ptp_ins_cf
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_tx_its            : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- i_av_st_tx_ptp_tx_its
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx      : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- i_av_st_tx_ptp_asym_p2p_idx
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_sign         : in  std_logic                      := 'X';             -- i_av_st_tx_ptp_asym_sign
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym              : in  std_logic                      := 'X';             -- i_av_st_tx_ptp_asym
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_p2p               : in  std_logic                      := 'X';             -- i_av_st_tx_ptp_p2p
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_format         : in  std_logic                      := 'X';             -- i_av_st_tx_ptp_ts_format
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_update_eb         : in  std_logic                      := 'X';             -- i_av_st_tx_ptp_update_eb
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_zero_csum         : in  std_logic                      := 'X';             -- i_av_st_tx_ptp_zero_csum
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_eb_offset         : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- i_av_st_tx_ptp_eb_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_csum_offset       : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- i_av_st_tx_ptp_csum_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_cf_offset         : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- i_av_st_tx_ptp_cf_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_offset         : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- i_av_st_tx_ptp_ts_offset
			avst_axist_bridge_0_axit_tx_if_tready                            : in  std_logic                      := 'X';             -- tready
			avst_axist_bridge_0_axit_tx_if_tvalid                            : out std_logic;                                         -- tvalid
			avst_axist_bridge_0_axit_tx_if_tdata                             : out std_logic_vector(63 downto 0);                     -- tdata
			avst_axist_bridge_0_axit_tx_if_tlast                             : out std_logic;                                         -- tlast
			avst_axist_bridge_0_axit_tx_if_tkeep                             : out std_logic_vector(7 downto 0);                      -- tkeep
			avst_axist_bridge_0_axit_tx_if_tuser                             : out std_logic_vector(1 downto 0);                      -- tuser
			avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp          : out std_logic_vector(93 downto 0);                     -- o_axi_st_tx_tuser_ptp
			avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp_extended : out std_logic_vector(327 downto 0);                    -- o_axi_st_tx_tuser_ptp_extended
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_data            : out std_logic_vector(39 downto 0);                     -- o_av_st_rxstatus_data
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_valid           : out std_logic;                                         -- o_av_st_rxstatus_valid
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_ptp_rx_its               : out std_logic_vector(95 downto 0);                     -- o_av_st_ptp_rx_its
			avst_axist_bridge_0_axist_rx_if_tvalid                           : in  std_logic                      := 'X';             -- tvalid
			avst_axist_bridge_0_axist_rx_if_tdata                            : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- tdata
			avst_axist_bridge_0_axist_rx_if_tlast                            : in  std_logic                      := 'X';             -- tlast
			avst_axist_bridge_0_axist_rx_if_tkeep                            : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- tkeep
			avst_axist_bridge_0_axist_rx_if_tuser                            : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- tuser
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts          : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- i_axi_st_rx_tuser_sts
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts_extended : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- i_axi_st_rx_tuser_sts_extended
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tdata      : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- i_axi_st_rx_ingrts0_tdata
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tvalid     : in  std_logic                      := 'X';             -- i_axi_st_rx_ingrts0_tvalid
			csr_in_clk_clk                                                   : in  std_logic                      := 'X';             -- clk
			dsp_in_clk_clk                                                   : in  std_logic                      := 'X';             -- clk
			ecpri_rx_in_clk_clk                                              : in  std_logic                      := 'X';             -- clk
			ecpri_tx_in_clk_clk                                              : in  std_logic                      := 'X';             -- clk
			eth_xran_dl_in_clk_clk                                           : in  std_logic                      := 'X';             -- clk
			eth_xran_ul_in_clk_clk                                           : in  std_logic                      := 'X';             -- clk
			rst_ecpri_n_reset_n                                              : in  std_logic                      := 'X';             -- reset_n
			coupling_pusch_sink_l1_valid                                     : in  std_logic                      := 'X';             -- valid
			coupling_pusch_sink_l1_data                                      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			coupling_pusch_sink_l1_channel                                   : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- channel
			coupling_pusch_sink_l1_startofpacket                             : in  std_logic                      := 'X';             -- startofpacket
			coupling_pusch_sink_l1_endofpacket                               : in  std_logic                      := 'X';             -- endofpacket
			coupling_pusch_sink_l2_valid                                     : in  std_logic                      := 'X';             -- valid
			coupling_pusch_sink_l2_data                                      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			coupling_pusch_sink_l2_channel                                   : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- channel
			coupling_pusch_sink_l2_startofpacket                             : in  std_logic                      := 'X';             -- startofpacket
			coupling_pusch_sink_l2_endofpacket                               : in  std_logic                      := 'X';             -- endofpacket
			coupling_prach_sink_l2_valid                                     : in  std_logic                      := 'X';             -- valid
			coupling_prach_sink_l2_data                                      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			coupling_prach_sink_l2_channel                                   : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- channel
			coupling_prach_sink_l2_startofpacket                             : in  std_logic                      := 'X';             -- startofpacket
			coupling_prach_sink_l2_endofpacket                               : in  std_logic                      := 'X';             -- endofpacket
			ecpri_ext_sink_valid                                             : in  std_logic                      := 'X';             -- valid
			ecpri_ext_sink_data                                              : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			ecpri_ext_sink_startofpacket                                     : in  std_logic                      := 'X';             -- startofpacket
			ecpri_ext_sink_endofpacket                                       : in  std_logic                      := 'X';             -- endofpacket
			ecpri_ext_sink_empty                                             : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- empty
			ecpri_ext_sink_error                                             : in  std_logic                      := 'X';             -- error
			ecpri_ext_sink_ready                                             : out std_logic;                                         -- ready
			ecpri_ext_source_valid                                           : out std_logic;                                         -- valid
			ecpri_ext_source_data                                            : out std_logic_vector(63 downto 0);                     -- data
			ecpri_ext_source_startofpacket                                   : out std_logic;                                         -- startofpacket
			ecpri_ext_source_endofpacket                                     : out std_logic;                                         -- endofpacket
			ecpri_ext_source_empty                                           : out std_logic_vector(2 downto 0);                      -- empty
			ecpri_ext_source_error                                           : out std_logic_vector(5 downto 0);                      -- error
			xran_demapper_source_valid                                       : out std_logic;                                         -- valid
			xran_demapper_source_data                                        : out std_logic_vector(127 downto 0);                    -- data
			xran_demapper_source_channel                                     : out std_logic_vector(15 downto 0);                     -- channel
			xran_demapper_source_startofpacket                               : out std_logic;                                         -- startofpacket
			xran_demapper_source_ready                                       : in  std_logic                      := 'X';             -- ready
			xran_demapper_source_endofpacket                                 : out std_logic;                                         -- endofpacket
			xran_demapper_cplane_source_valid                                : out std_logic;                                         -- valid
			xran_demapper_cplane_source_startofpacket                        : out std_logic;                                         -- startofpacket
			xran_demapper_cplane_source_endofpacket                          : out std_logic;                                         -- endofpacket
			ptp_tod_o_mac_ptp_fp                                             : out std_logic_vector(21 downto 0);                     -- o_mac_ptp_fp
			ptp_tod_o_mac_ptp_ts_req                                         : out std_logic;                                         -- o_mac_ptp_ts_req
			ptp_tod_i_mac_ptp_tx_ets_valid                                   : in  std_logic                      := 'X';             -- i_mac_ptp_tx_ets_valid
			ptp_tod_i_mac_ptp_tx_ets                                         : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- i_mac_ptp_tx_ets
			ptp_tod_i_mac_ptp_tx_ets_fp                                      : in  std_logic_vector(21 downto 0)  := (others => 'X'); -- i_mac_ptp_tx_ets_fp
			ptp_tod_i_mac_ptp_rx_its_valid                                   : in  std_logic                      := 'X';             -- i_mac_ptp_rx_its_valid
			ptp_tod_i_mac_ptp_rx_its                                         : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- i_mac_ptp_rx_its
			ptp_tod_i_ext_ptp_fp                                             : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- i_ext_ptp_fp
			ptp_tod_i_ext_ptp_ts_req                                         : in  std_logic                      := 'X';             -- i_ext_ptp_ts_req
			ptp_tod_o_ext_ptp_tx_ets_valid                                   : out std_logic;                                         -- o_ext_ptp_tx_ets_valid
			ptp_tod_o_ext_ptp_tx_ets                                         : out std_logic_vector(95 downto 0);                     -- o_ext_ptp_tx_ets
			ptp_tod_o_ext_ptp_tx_ets_fp                                      : out std_logic_vector(19 downto 0);                     -- o_ext_ptp_tx_ets_fp
			ptp_tod_o_ext_ptp_rx_its                                         : out std_logic_vector(95 downto 0);                     -- o_ext_ptp_rx_its
			ptp_tod_o_ext_ptp_rx_its_valid                                   : out std_logic;                                         -- o_ext_ptp_rx_its_valid
			rx_pcs_ready_rx_pcs_ready                                        : in  std_logic                      := 'X';             -- rx_pcs_ready
			tx_lanes_stable_tx_lanes_stable                                  : in  std_logic                      := 'X';             -- tx_lanes_stable
			rst_soft_n_rst_soft_n                                            : in  std_logic                      := 'X';             -- rst_soft_n
			oran_tx_tod_96b_data_tdata                                       : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- tdata
			oran_tx_tod_96b_data_tvalid                                      : in  std_logic                      := 'X';             -- tvalid
			oran_rx_tod_96b_data_tdata                                       : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- tdata
			oran_rx_tod_96b_data_tvalid                                      : in  std_logic                      := 'X';             -- tvalid
			bw_config_cc1_bw_config_cc1                                      : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- bw_config_cc1
			bw_config_cc2_bw_config_cc2                                      : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- bw_config_cc2
			short_long_prach_select_data                                     : in  std_logic                      := 'X';             -- data
			rx_rtc_id_rx_rtc_id                                              : out std_logic_vector(15 downto 0);                     -- rx_rtc_id
			rx_rtc_id_dl_rx_rtc_id_dl                                        : out std_logic_vector(15 downto 0);                     -- rx_rtc_id_dl
			rx_u_axc_id_rx_u_axc_id                                          : out std_logic_vector(15 downto 0);                     -- rx_u_axc_id
			ul_rtc_id_intr_ul_rtc_id_intr                                    : out std_logic;                                         -- ul_rtc_id_intr
			dl_rtc_id_intr_dl_rtc_id_intr                                    : out std_logic;                                         -- dl_rtc_id_intr
			ul_axc_id_intr_ul_axc_id_intr                                    : out std_logic;                                         -- ul_axc_id_intr
			dl_axc_id_intr_dl_axc_id_intr                                    : out std_logic;                                         -- dl_axc_id_intr
			coupling_pusch_timing_ref_data                                   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			coupling_prach_timing_ref_data                                   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			coupling_prach_sink_l1_valid                                     : in  std_logic                      := 'X';             -- valid
			coupling_prach_sink_l1_data                                      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			coupling_prach_sink_l1_channel                                   : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- channel
			coupling_prach_sink_l1_startofpacket                             : in  std_logic                      := 'X';             -- startofpacket
			coupling_prach_sink_l1_endofpacket                               : in  std_logic                      := 'X';             -- endofpacket
			downlink_eaxc_id_concat_data                                     : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			oran_rx_uplane_concat_data                                       : out std_logic_vector(67 downto 0);                     -- data
			oran_rx_cplane_concat_data                                       : out std_logic_vector(189 downto 0);                    -- data
			uplink_eaxc_id_concat_data                                       : in  std_logic_vector(255 downto 0) := (others => 'X'); -- data
			coupling_ul_start_pulse_latch_data                               : in  std_logic                      := 'X';             -- data
			tod_data                                                         : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
			radio_config_status_data                                         : in  std_logic_vector(55 downto 0)  := (others => 'X'); -- data
			dl_input_hfn_pulse_data                                          : in  std_logic                      := 'X';             -- data
			xran_timestamp_mem_read                                          : in  std_logic                      := 'X';             -- read
			xran_timestamp_mem_readdata                                      : out std_logic_vector(63 downto 0);                     -- readdata
			timeout_cntr_intr_uplane_irq                                     : out std_logic;                                         -- irq
			timeout_cntr_intr_cplane_irq                                     : out std_logic;                                         -- irq
			fifo_full_intr_irq                                               : out std_logic;                                         -- irq
			h2f_lw_bridge_s0_waitrequest                                     : out std_logic;                                         -- waitrequest
			h2f_lw_bridge_s0_readdata                                        : out std_logic_vector(31 downto 0);                     -- readdata
			h2f_lw_bridge_s0_readdatavalid                                   : out std_logic;                                         -- readdatavalid
			h2f_lw_bridge_s0_burstcount                                      : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			h2f_lw_bridge_s0_writedata                                       : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			h2f_lw_bridge_s0_address                                         : in  std_logic_vector(13 downto 0)  := (others => 'X'); -- address
			h2f_lw_bridge_s0_write                                           : in  std_logic                      := 'X';             -- write
			h2f_lw_bridge_s0_read                                            : in  std_logic                      := 'X';             -- read
			h2f_lw_bridge_s0_byteenable                                      : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			h2f_lw_bridge_s0_debugaccess                                     : in  std_logic                      := 'X';             -- debugaccess
			csr_in_reset_reset                                               : in  std_logic                      := 'X';             -- reset
			dsp_in_reset_reset_n                                             : in  std_logic                      := 'X';             -- reset_n
			eth_xran_dl_in_reset_reset_n                                     : in  std_logic                      := 'X';             -- reset_n
			eth_xran_ul_in_reset_reset_n                                     : in  std_logic                      := 'X'              -- reset_n
		);
	end component ecpri_oran_top;

	u0 : component ecpri_oran_top
		port map (
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_skip_crc              => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_skip_crc,              --   avst_axist_bridge_0_avst_tx_ptp.i_av_st_tx_skip_crc
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_valid          => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_valid,          --                                  .i_av_st_tx_ptp_ts_valid
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_ets           => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_ets,           --                                  .i_av_st_tx_ptp_ins_ets
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_cf            => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_cf,            --                                  .i_av_st_tx_ptp_ins_cf
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_tx_its            => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_tx_its,            --                                  .i_av_st_tx_ptp_tx_its
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx      => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx,      --                                  .i_av_st_tx_ptp_asym_p2p_idx
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_sign         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_sign,         --                                  .i_av_st_tx_ptp_asym_sign
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym              => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym,              --                                  .i_av_st_tx_ptp_asym
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_p2p               => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_p2p,               --                                  .i_av_st_tx_ptp_p2p
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_format         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_format,         --                                  .i_av_st_tx_ptp_ts_format
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_update_eb         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_update_eb,         --                                  .i_av_st_tx_ptp_update_eb
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_zero_csum         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_zero_csum,         --                                  .i_av_st_tx_ptp_zero_csum
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_eb_offset         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_eb_offset,         --                                  .i_av_st_tx_ptp_eb_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_csum_offset       => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_csum_offset,       --                                  .i_av_st_tx_ptp_csum_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_cf_offset         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_cf_offset,         --                                  .i_av_st_tx_ptp_cf_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_offset         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_offset,         --                                  .i_av_st_tx_ptp_ts_offset
			avst_axist_bridge_0_axit_tx_if_tready                            => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tready,                            --    avst_axist_bridge_0_axit_tx_if.tready
			avst_axist_bridge_0_axit_tx_if_tvalid                            => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tvalid,                            --                                  .tvalid
			avst_axist_bridge_0_axit_tx_if_tdata                             => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tdata,                             --                                  .tdata
			avst_axist_bridge_0_axit_tx_if_tlast                             => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tlast,                             --                                  .tlast
			avst_axist_bridge_0_axit_tx_if_tkeep                             => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tkeep,                             --                                  .tkeep
			avst_axist_bridge_0_axit_tx_if_tuser                             => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tuser,                             --                                  .tuser
			avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp          => CONNECTED_TO_avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp,          -- avst_axist_bridge_0_axist_tx_user.o_axi_st_tx_tuser_ptp
			avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp_extended => CONNECTED_TO_avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp_extended, --                                  .o_axi_st_tx_tuser_ptp_extended
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_data            => CONNECTED_TO_avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_data,            --   avst_axist_bridge_0_avst_rx_ptp.o_av_st_rxstatus_data
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_valid           => CONNECTED_TO_avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_valid,           --                                  .o_av_st_rxstatus_valid
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_ptp_rx_its               => CONNECTED_TO_avst_axist_bridge_0_avst_rx_ptp_o_av_st_ptp_rx_its,               --                                  .o_av_st_ptp_rx_its
			avst_axist_bridge_0_axist_rx_if_tvalid                           => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tvalid,                           --   avst_axist_bridge_0_axist_rx_if.tvalid
			avst_axist_bridge_0_axist_rx_if_tdata                            => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tdata,                            --                                  .tdata
			avst_axist_bridge_0_axist_rx_if_tlast                            => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tlast,                            --                                  .tlast
			avst_axist_bridge_0_axist_rx_if_tkeep                            => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tkeep,                            --                                  .tkeep
			avst_axist_bridge_0_axist_rx_if_tuser                            => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tuser,                            --                                  .tuser
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts          => CONNECTED_TO_avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts,          -- avst_axist_bridge_0_axist_rx_user.i_axi_st_rx_tuser_sts
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts_extended => CONNECTED_TO_avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts_extended, --                                  .i_axi_st_rx_tuser_sts_extended
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tdata      => CONNECTED_TO_avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tdata,      --                                  .i_axi_st_rx_ingrts0_tdata
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tvalid     => CONNECTED_TO_avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tvalid,     --                                  .i_axi_st_rx_ingrts0_tvalid
			csr_in_clk_clk                                                   => CONNECTED_TO_csr_in_clk_clk,                                                   --                        csr_in_clk.clk
			dsp_in_clk_clk                                                   => CONNECTED_TO_dsp_in_clk_clk,                                                   --                        dsp_in_clk.clk
			ecpri_rx_in_clk_clk                                              => CONNECTED_TO_ecpri_rx_in_clk_clk,                                              --                   ecpri_rx_in_clk.clk
			ecpri_tx_in_clk_clk                                              => CONNECTED_TO_ecpri_tx_in_clk_clk,                                              --                   ecpri_tx_in_clk.clk
			eth_xran_dl_in_clk_clk                                           => CONNECTED_TO_eth_xran_dl_in_clk_clk,                                           --                eth_xran_dl_in_clk.clk
			eth_xran_ul_in_clk_clk                                           => CONNECTED_TO_eth_xran_ul_in_clk_clk,                                           --                eth_xran_ul_in_clk.clk
			rst_ecpri_n_reset_n                                              => CONNECTED_TO_rst_ecpri_n_reset_n,                                              --                       rst_ecpri_n.reset_n
			coupling_pusch_sink_l1_valid                                     => CONNECTED_TO_coupling_pusch_sink_l1_valid,                                     --            coupling_pusch_sink_l1.valid
			coupling_pusch_sink_l1_data                                      => CONNECTED_TO_coupling_pusch_sink_l1_data,                                      --                                  .data
			coupling_pusch_sink_l1_channel                                   => CONNECTED_TO_coupling_pusch_sink_l1_channel,                                   --                                  .channel
			coupling_pusch_sink_l1_startofpacket                             => CONNECTED_TO_coupling_pusch_sink_l1_startofpacket,                             --                                  .startofpacket
			coupling_pusch_sink_l1_endofpacket                               => CONNECTED_TO_coupling_pusch_sink_l1_endofpacket,                               --                                  .endofpacket
			coupling_pusch_sink_l2_valid                                     => CONNECTED_TO_coupling_pusch_sink_l2_valid,                                     --            coupling_pusch_sink_l2.valid
			coupling_pusch_sink_l2_data                                      => CONNECTED_TO_coupling_pusch_sink_l2_data,                                      --                                  .data
			coupling_pusch_sink_l2_channel                                   => CONNECTED_TO_coupling_pusch_sink_l2_channel,                                   --                                  .channel
			coupling_pusch_sink_l2_startofpacket                             => CONNECTED_TO_coupling_pusch_sink_l2_startofpacket,                             --                                  .startofpacket
			coupling_pusch_sink_l2_endofpacket                               => CONNECTED_TO_coupling_pusch_sink_l2_endofpacket,                               --                                  .endofpacket
			coupling_prach_sink_l2_valid                                     => CONNECTED_TO_coupling_prach_sink_l2_valid,                                     --            coupling_prach_sink_l2.valid
			coupling_prach_sink_l2_data                                      => CONNECTED_TO_coupling_prach_sink_l2_data,                                      --                                  .data
			coupling_prach_sink_l2_channel                                   => CONNECTED_TO_coupling_prach_sink_l2_channel,                                   --                                  .channel
			coupling_prach_sink_l2_startofpacket                             => CONNECTED_TO_coupling_prach_sink_l2_startofpacket,                             --                                  .startofpacket
			coupling_prach_sink_l2_endofpacket                               => CONNECTED_TO_coupling_prach_sink_l2_endofpacket,                               --                                  .endofpacket
			ecpri_ext_sink_valid                                             => CONNECTED_TO_ecpri_ext_sink_valid,                                             --                    ecpri_ext_sink.valid
			ecpri_ext_sink_data                                              => CONNECTED_TO_ecpri_ext_sink_data,                                              --                                  .data
			ecpri_ext_sink_startofpacket                                     => CONNECTED_TO_ecpri_ext_sink_startofpacket,                                     --                                  .startofpacket
			ecpri_ext_sink_endofpacket                                       => CONNECTED_TO_ecpri_ext_sink_endofpacket,                                       --                                  .endofpacket
			ecpri_ext_sink_empty                                             => CONNECTED_TO_ecpri_ext_sink_empty,                                             --                                  .empty
			ecpri_ext_sink_error                                             => CONNECTED_TO_ecpri_ext_sink_error,                                             --                                  .error
			ecpri_ext_sink_ready                                             => CONNECTED_TO_ecpri_ext_sink_ready,                                             --                                  .ready
			ecpri_ext_source_valid                                           => CONNECTED_TO_ecpri_ext_source_valid,                                           --                  ecpri_ext_source.valid
			ecpri_ext_source_data                                            => CONNECTED_TO_ecpri_ext_source_data,                                            --                                  .data
			ecpri_ext_source_startofpacket                                   => CONNECTED_TO_ecpri_ext_source_startofpacket,                                   --                                  .startofpacket
			ecpri_ext_source_endofpacket                                     => CONNECTED_TO_ecpri_ext_source_endofpacket,                                     --                                  .endofpacket
			ecpri_ext_source_empty                                           => CONNECTED_TO_ecpri_ext_source_empty,                                           --                                  .empty
			ecpri_ext_source_error                                           => CONNECTED_TO_ecpri_ext_source_error,                                           --                                  .error
			xran_demapper_source_valid                                       => CONNECTED_TO_xran_demapper_source_valid,                                       --              xran_demapper_source.valid
			xran_demapper_source_data                                        => CONNECTED_TO_xran_demapper_source_data,                                        --                                  .data
			xran_demapper_source_channel                                     => CONNECTED_TO_xran_demapper_source_channel,                                     --                                  .channel
			xran_demapper_source_startofpacket                               => CONNECTED_TO_xran_demapper_source_startofpacket,                               --                                  .startofpacket
			xran_demapper_source_ready                                       => CONNECTED_TO_xran_demapper_source_ready,                                       --                                  .ready
			xran_demapper_source_endofpacket                                 => CONNECTED_TO_xran_demapper_source_endofpacket,                                 --                                  .endofpacket
			xran_demapper_cplane_source_valid                                => CONNECTED_TO_xran_demapper_cplane_source_valid,                                --       xran_demapper_cplane_source.valid
			xran_demapper_cplane_source_startofpacket                        => CONNECTED_TO_xran_demapper_cplane_source_startofpacket,                        --                                  .startofpacket
			xran_demapper_cplane_source_endofpacket                          => CONNECTED_TO_xran_demapper_cplane_source_endofpacket,                          --                                  .endofpacket
			ptp_tod_o_mac_ptp_fp                                             => CONNECTED_TO_ptp_tod_o_mac_ptp_fp,                                             --                           ptp_tod.o_mac_ptp_fp
			ptp_tod_o_mac_ptp_ts_req                                         => CONNECTED_TO_ptp_tod_o_mac_ptp_ts_req,                                         --                                  .o_mac_ptp_ts_req
			ptp_tod_i_mac_ptp_tx_ets_valid                                   => CONNECTED_TO_ptp_tod_i_mac_ptp_tx_ets_valid,                                   --                                  .i_mac_ptp_tx_ets_valid
			ptp_tod_i_mac_ptp_tx_ets                                         => CONNECTED_TO_ptp_tod_i_mac_ptp_tx_ets,                                         --                                  .i_mac_ptp_tx_ets
			ptp_tod_i_mac_ptp_tx_ets_fp                                      => CONNECTED_TO_ptp_tod_i_mac_ptp_tx_ets_fp,                                      --                                  .i_mac_ptp_tx_ets_fp
			ptp_tod_i_mac_ptp_rx_its_valid                                   => CONNECTED_TO_ptp_tod_i_mac_ptp_rx_its_valid,                                   --                                  .i_mac_ptp_rx_its_valid
			ptp_tod_i_mac_ptp_rx_its                                         => CONNECTED_TO_ptp_tod_i_mac_ptp_rx_its,                                         --                                  .i_mac_ptp_rx_its
			ptp_tod_i_ext_ptp_fp                                             => CONNECTED_TO_ptp_tod_i_ext_ptp_fp,                                             --                                  .i_ext_ptp_fp
			ptp_tod_i_ext_ptp_ts_req                                         => CONNECTED_TO_ptp_tod_i_ext_ptp_ts_req,                                         --                                  .i_ext_ptp_ts_req
			ptp_tod_o_ext_ptp_tx_ets_valid                                   => CONNECTED_TO_ptp_tod_o_ext_ptp_tx_ets_valid,                                   --                                  .o_ext_ptp_tx_ets_valid
			ptp_tod_o_ext_ptp_tx_ets                                         => CONNECTED_TO_ptp_tod_o_ext_ptp_tx_ets,                                         --                                  .o_ext_ptp_tx_ets
			ptp_tod_o_ext_ptp_tx_ets_fp                                      => CONNECTED_TO_ptp_tod_o_ext_ptp_tx_ets_fp,                                      --                                  .o_ext_ptp_tx_ets_fp
			ptp_tod_o_ext_ptp_rx_its                                         => CONNECTED_TO_ptp_tod_o_ext_ptp_rx_its,                                         --                                  .o_ext_ptp_rx_its
			ptp_tod_o_ext_ptp_rx_its_valid                                   => CONNECTED_TO_ptp_tod_o_ext_ptp_rx_its_valid,                                   --                                  .o_ext_ptp_rx_its_valid
			rx_pcs_ready_rx_pcs_ready                                        => CONNECTED_TO_rx_pcs_ready_rx_pcs_ready,                                        --                      rx_pcs_ready.rx_pcs_ready
			tx_lanes_stable_tx_lanes_stable                                  => CONNECTED_TO_tx_lanes_stable_tx_lanes_stable,                                  --                   tx_lanes_stable.tx_lanes_stable
			rst_soft_n_rst_soft_n                                            => CONNECTED_TO_rst_soft_n_rst_soft_n,                                            --                        rst_soft_n.rst_soft_n
			oran_tx_tod_96b_data_tdata                                       => CONNECTED_TO_oran_tx_tod_96b_data_tdata,                                       --              oran_tx_tod_96b_data.tdata
			oran_tx_tod_96b_data_tvalid                                      => CONNECTED_TO_oran_tx_tod_96b_data_tvalid,                                      --                                  .tvalid
			oran_rx_tod_96b_data_tdata                                       => CONNECTED_TO_oran_rx_tod_96b_data_tdata,                                       --              oran_rx_tod_96b_data.tdata
			oran_rx_tod_96b_data_tvalid                                      => CONNECTED_TO_oran_rx_tod_96b_data_tvalid,                                      --                                  .tvalid
			bw_config_cc1_bw_config_cc1                                      => CONNECTED_TO_bw_config_cc1_bw_config_cc1,                                      --                     bw_config_cc1.bw_config_cc1
			bw_config_cc2_bw_config_cc2                                      => CONNECTED_TO_bw_config_cc2_bw_config_cc2,                                      --                     bw_config_cc2.bw_config_cc2
			short_long_prach_select_data                                     => CONNECTED_TO_short_long_prach_select_data,                                     --           short_long_prach_select.data
			rx_rtc_id_rx_rtc_id                                              => CONNECTED_TO_rx_rtc_id_rx_rtc_id,                                              --                         rx_rtc_id.rx_rtc_id
			rx_rtc_id_dl_rx_rtc_id_dl                                        => CONNECTED_TO_rx_rtc_id_dl_rx_rtc_id_dl,                                        --                      rx_rtc_id_dl.rx_rtc_id_dl
			rx_u_axc_id_rx_u_axc_id                                          => CONNECTED_TO_rx_u_axc_id_rx_u_axc_id,                                          --                       rx_u_axc_id.rx_u_axc_id
			ul_rtc_id_intr_ul_rtc_id_intr                                    => CONNECTED_TO_ul_rtc_id_intr_ul_rtc_id_intr,                                    --                    ul_rtc_id_intr.ul_rtc_id_intr
			dl_rtc_id_intr_dl_rtc_id_intr                                    => CONNECTED_TO_dl_rtc_id_intr_dl_rtc_id_intr,                                    --                    dl_rtc_id_intr.dl_rtc_id_intr
			ul_axc_id_intr_ul_axc_id_intr                                    => CONNECTED_TO_ul_axc_id_intr_ul_axc_id_intr,                                    --                    ul_axc_id_intr.ul_axc_id_intr
			dl_axc_id_intr_dl_axc_id_intr                                    => CONNECTED_TO_dl_axc_id_intr_dl_axc_id_intr,                                    --                    dl_axc_id_intr.dl_axc_id_intr
			coupling_pusch_timing_ref_data                                   => CONNECTED_TO_coupling_pusch_timing_ref_data,                                   --         coupling_pusch_timing_ref.data
			coupling_prach_timing_ref_data                                   => CONNECTED_TO_coupling_prach_timing_ref_data,                                   --         coupling_prach_timing_ref.data
			coupling_prach_sink_l1_valid                                     => CONNECTED_TO_coupling_prach_sink_l1_valid,                                     --            coupling_prach_sink_l1.valid
			coupling_prach_sink_l1_data                                      => CONNECTED_TO_coupling_prach_sink_l1_data,                                      --                                  .data
			coupling_prach_sink_l1_channel                                   => CONNECTED_TO_coupling_prach_sink_l1_channel,                                   --                                  .channel
			coupling_prach_sink_l1_startofpacket                             => CONNECTED_TO_coupling_prach_sink_l1_startofpacket,                             --                                  .startofpacket
			coupling_prach_sink_l1_endofpacket                               => CONNECTED_TO_coupling_prach_sink_l1_endofpacket,                               --                                  .endofpacket
			downlink_eaxc_id_concat_data                                     => CONNECTED_TO_downlink_eaxc_id_concat_data,                                     --           downlink_eaxc_id_concat.data
			oran_rx_uplane_concat_data                                       => CONNECTED_TO_oran_rx_uplane_concat_data,                                       --             oran_rx_uplane_concat.data
			oran_rx_cplane_concat_data                                       => CONNECTED_TO_oran_rx_cplane_concat_data,                                       --             oran_rx_cplane_concat.data
			uplink_eaxc_id_concat_data                                       => CONNECTED_TO_uplink_eaxc_id_concat_data,                                       --             uplink_eaxc_id_concat.data
			coupling_ul_start_pulse_latch_data                               => CONNECTED_TO_coupling_ul_start_pulse_latch_data,                               --     coupling_ul_start_pulse_latch.data
			tod_data                                                         => CONNECTED_TO_tod_data,                                                         --                               tod.data
			radio_config_status_data                                         => CONNECTED_TO_radio_config_status_data,                                         --               radio_config_status.data
			dl_input_hfn_pulse_data                                          => CONNECTED_TO_dl_input_hfn_pulse_data,                                          --                dl_input_hfn_pulse.data
			xran_timestamp_mem_read                                          => CONNECTED_TO_xran_timestamp_mem_read,                                          --                xran_timestamp_mem.read
			xran_timestamp_mem_readdata                                      => CONNECTED_TO_xran_timestamp_mem_readdata,                                      --                                  .readdata
			timeout_cntr_intr_uplane_irq                                     => CONNECTED_TO_timeout_cntr_intr_uplane_irq,                                     --          timeout_cntr_intr_uplane.irq
			timeout_cntr_intr_cplane_irq                                     => CONNECTED_TO_timeout_cntr_intr_cplane_irq,                                     --          timeout_cntr_intr_cplane.irq
			fifo_full_intr_irq                                               => CONNECTED_TO_fifo_full_intr_irq,                                               --                    fifo_full_intr.irq
			h2f_lw_bridge_s0_waitrequest                                     => CONNECTED_TO_h2f_lw_bridge_s0_waitrequest,                                     --                  h2f_lw_bridge_s0.waitrequest
			h2f_lw_bridge_s0_readdata                                        => CONNECTED_TO_h2f_lw_bridge_s0_readdata,                                        --                                  .readdata
			h2f_lw_bridge_s0_readdatavalid                                   => CONNECTED_TO_h2f_lw_bridge_s0_readdatavalid,                                   --                                  .readdatavalid
			h2f_lw_bridge_s0_burstcount                                      => CONNECTED_TO_h2f_lw_bridge_s0_burstcount,                                      --                                  .burstcount
			h2f_lw_bridge_s0_writedata                                       => CONNECTED_TO_h2f_lw_bridge_s0_writedata,                                       --                                  .writedata
			h2f_lw_bridge_s0_address                                         => CONNECTED_TO_h2f_lw_bridge_s0_address,                                         --                                  .address
			h2f_lw_bridge_s0_write                                           => CONNECTED_TO_h2f_lw_bridge_s0_write,                                           --                                  .write
			h2f_lw_bridge_s0_read                                            => CONNECTED_TO_h2f_lw_bridge_s0_read,                                            --                                  .read
			h2f_lw_bridge_s0_byteenable                                      => CONNECTED_TO_h2f_lw_bridge_s0_byteenable,                                      --                                  .byteenable
			h2f_lw_bridge_s0_debugaccess                                     => CONNECTED_TO_h2f_lw_bridge_s0_debugaccess,                                     --                                  .debugaccess
			csr_in_reset_reset                                               => CONNECTED_TO_csr_in_reset_reset,                                               --                      csr_in_reset.reset
			dsp_in_reset_reset_n                                             => CONNECTED_TO_dsp_in_reset_reset_n,                                             --                      dsp_in_reset.reset_n
			eth_xran_dl_in_reset_reset_n                                     => CONNECTED_TO_eth_xran_dl_in_reset_reset_n,                                     --              eth_xran_dl_in_reset.reset_n
			eth_xran_ul_in_reset_reset_n                                     => CONNECTED_TO_eth_xran_ul_in_reset_reset_n                                      --              eth_xran_ul_in_reset.reset_n
		);

