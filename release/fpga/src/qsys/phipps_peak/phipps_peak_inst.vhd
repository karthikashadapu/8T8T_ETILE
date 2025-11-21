	component phipps_peak is
		port (
			clock_bridge_csr_in_clk_clk                                      : in  std_logic                      := 'X';             -- clk
			clock_bridge_dsp_in_clk_clk                                      : in  std_logic                      := 'X';             -- clk
			clock_bridge_ecpri_rx_in_clk_clk                                 : in  std_logic                      := 'X';             -- clk
			clock_bridge_ecpri_tx_in_clk_clk                                 : in  std_logic                      := 'X';             -- clk
			clock_bridge_eth_in_clk_clk                                      : in  std_logic                      := 'X';             -- clk
			h2f_bridge_s0_waitrequest                                        : out std_logic;                                         -- waitrequest
			h2f_bridge_s0_readdata                                           : out std_logic_vector(31 downto 0);                     -- readdata
			h2f_bridge_s0_readdatavalid                                      : out std_logic;                                         -- readdatavalid
			h2f_bridge_s0_burstcount                                         : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			h2f_bridge_s0_writedata                                          : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			h2f_bridge_s0_address                                            : in  std_logic_vector(22 downto 0)  := (others => 'X'); -- address
			h2f_bridge_s0_write                                              : in  std_logic                      := 'X';             -- write
			h2f_bridge_s0_read                                               : in  std_logic                      := 'X';             -- read
			h2f_bridge_s0_byteenable                                         : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			h2f_bridge_s0_debugaccess                                        : in  std_logic                      := 'X';             -- debugaccess
			h2f_lw_bridge_s0_waitrequest                                     : out std_logic;                                         -- waitrequest
			h2f_lw_bridge_s0_readdata                                        : out std_logic_vector(31 downto 0);                     -- readdata
			h2f_lw_bridge_s0_readdatavalid                                   : out std_logic;                                         -- readdatavalid
			h2f_lw_bridge_s0_burstcount                                      : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			h2f_lw_bridge_s0_writedata                                       : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			h2f_lw_bridge_s0_address                                         : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- address
			h2f_lw_bridge_s0_write                                           : in  std_logic                      := 'X';             -- write
			h2f_lw_bridge_s0_read                                            : in  std_logic                      := 'X';             -- read
			h2f_lw_bridge_s0_byteenable                                      : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			h2f_lw_bridge_s0_debugaccess                                     : in  std_logic                      := 'X';             -- debugaccess
			csr_in_reset_reset_n                                             : in  std_logic                      := 'X';             -- reset_n
			dsp_in_reset_reset_n                                             : in  std_logic                      := 'X';             -- reset_n
			eth_in_reset_reset_n                                             : in  std_logic                      := 'X';             -- reset_n
			rst_ecpri_n_reset_n                                              : in  std_logic                      := 'X';             -- reset_n
			radio_config_status_dup2_radio_config_status                     : out std_logic_vector(55 downto 0);                     -- radio_config_status
			rst_soft_n_dup4_rst_soft_n                                       : out std_logic;                                         -- rst_soft_n
			interface_sel_data                                               : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			ddc_avst_sink_avst_sink_valid                                    : in  std_logic                      := 'X';             -- avst_sink_valid
			ddc_avst_sink_avst_sink_channel                                  : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- avst_sink_channel
			ddc_avst_sink_avst_sink_data_l1                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- avst_sink_data_l1
			ddc_avst_sink_avst_sink_data_l2                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- avst_sink_data_l2
			ddc_avst_sink_avst_sink_data_l3                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- avst_sink_data_l3
			ddc_avst_sink_avst_sink_data_l4                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- avst_sink_data_l4
			ddc_avst_sink_avst_sink_data_l5                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- avst_sink_data_l5
			ddc_avst_sink_avst_sink_data_l6                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- avst_sink_data_l6
			ddc_avst_sink_avst_sink_data_l7                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- avst_sink_data_l7
			ddc_avst_sink_avst_sink_data_l8                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- avst_sink_data_l8
			duc_avst_source_duc_avst_source_valid                            : out std_logic;                                         -- duc_avst_source_valid
			duc_avst_source_duc_avst_source_data0                            : out std_logic_vector(31 downto 0);                     -- duc_avst_source_data0
			duc_avst_source_duc_avst_source_data1                            : out std_logic_vector(31 downto 0);                     -- duc_avst_source_data1
			duc_avst_source_duc_avst_source_data2                            : out std_logic_vector(31 downto 0);                     -- duc_avst_source_data2
			duc_avst_source_duc_avst_source_data3                            : out std_logic_vector(31 downto 0);                     -- duc_avst_source_data3
			duc_avst_source_duc_avst_source_data4                            : out std_logic_vector(31 downto 0);                     -- duc_avst_source_data4
			duc_avst_source_duc_avst_source_data5                            : out std_logic_vector(31 downto 0);                     -- duc_avst_source_data5
			duc_avst_source_duc_avst_source_data6                            : out std_logic_vector(31 downto 0);                     -- duc_avst_source_data6
			duc_avst_source_duc_avst_source_data7                            : out std_logic_vector(31 downto 0);                     -- duc_avst_source_data7
			duc_avst_source_duc_avst_source_channel                          : out std_logic_vector(7 downto 0);                      -- duc_avst_source_channel
			dxc_ss_top_0_rfp_pulse_data                                      : in  std_logic                      := 'X';             -- data
			dxc_avst_selctd_cap_intf_valid                                   : out std_logic;                                         -- valid
			dxc_avst_selctd_cap_intf_data                                    : out std_logic_vector(31 downto 0);                     -- data
			dxc_avst_selctd_cap_intf_channel                                 : out std_logic_vector(2 downto 0);                      -- channel
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
			ptp_tod_concat_out_o_mac_ptp_fp                                  : out std_logic_vector(21 downto 0);                     -- o_mac_ptp_fp
			ptp_tod_concat_out_o_mac_ptp_ts_req                              : out std_logic;                                         -- o_mac_ptp_ts_req
			ptp_tod_concat_out_i_mac_ptp_tx_ets_valid                        : in  std_logic                      := 'X';             -- i_mac_ptp_tx_ets_valid
			ptp_tod_concat_out_i_mac_ptp_tx_ets                              : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- i_mac_ptp_tx_ets
			ptp_tod_concat_out_i_mac_ptp_tx_ets_fp                           : in  std_logic_vector(21 downto 0)  := (others => 'X'); -- i_mac_ptp_tx_ets_fp
			ptp_tod_concat_out_i_mac_ptp_rx_its_valid                        : in  std_logic                      := 'X';             -- i_mac_ptp_rx_its_valid
			ptp_tod_concat_out_i_mac_ptp_rx_its                              : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- i_mac_ptp_rx_its
			ptp_tod_concat_out_i_ext_ptp_fp                                  : in  std_logic_vector(19 downto 0)  := (others => 'X'); -- i_ext_ptp_fp
			ptp_tod_concat_out_i_ext_ptp_ts_req                              : in  std_logic                      := 'X';             -- i_ext_ptp_ts_req
			ptp_tod_concat_out_o_ext_ptp_tx_ets_valid                        : out std_logic;                                         -- o_ext_ptp_tx_ets_valid
			ptp_tod_concat_out_o_ext_ptp_tx_ets                              : out std_logic_vector(95 downto 0);                     -- o_ext_ptp_tx_ets
			ptp_tod_concat_out_o_ext_ptp_tx_ets_fp                           : out std_logic_vector(19 downto 0);                     -- o_ext_ptp_tx_ets_fp
			ptp_tod_concat_out_o_ext_ptp_rx_its                              : out std_logic_vector(95 downto 0);                     -- o_ext_ptp_rx_its
			ptp_tod_concat_out_o_ext_ptp_rx_its_valid                        : out std_logic;                                         -- o_ext_ptp_rx_its_valid
			rx_pcs_ready_rx_pcs_ready                                        : in  std_logic                      := 'X';             -- rx_pcs_ready
			tx_lanes_stable_tx_lanes_stable                                  : in  std_logic                      := 'X';             -- tx_lanes_stable
			ecpri_oran_top_0_oran_tx_tod_96b_data_tdata                      : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- tdata
			ecpri_oran_top_0_oran_tx_tod_96b_data_tvalid                     : in  std_logic                      := 'X';             -- tvalid
			ecpri_oran_top_0_oran_rx_tod_96b_data_tdata                      : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- tdata
			ecpri_oran_top_0_oran_rx_tod_96b_data_tvalid                     : in  std_logic                      := 'X';             -- tvalid
			xran_timestamp_tod_in_data                                       : in  std_logic_vector(95 downto 0)  := (others => 'X'); -- data
			timeout_cntr_intr_uplane_irq                                     : out std_logic;                                         -- irq
			timeout_cntr_intr_cplane_irq                                     : out std_logic;                                         -- irq
			fifo_full_intr_irq                                               : out std_logic;                                         -- irq
			pwr_mtr_h2f_bridge_s0_waitrequest                                : out std_logic;                                         -- waitrequest
			pwr_mtr_h2f_bridge_s0_readdata                                   : out std_logic_vector(31 downto 0);                     -- readdata
			pwr_mtr_h2f_bridge_s0_readdatavalid                              : out std_logic;                                         -- readdatavalid
			pwr_mtr_h2f_bridge_s0_burstcount                                 : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			pwr_mtr_h2f_bridge_s0_writedata                                  : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			pwr_mtr_h2f_bridge_s0_address                                    : in  std_logic_vector(16 downto 0)  := (others => 'X'); -- address
			pwr_mtr_h2f_bridge_s0_write                                      : in  std_logic                      := 'X';             -- write
			pwr_mtr_h2f_bridge_s0_read                                       : in  std_logic                      := 'X';             -- read
			pwr_mtr_h2f_bridge_s0_byteenable                                 : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			pwr_mtr_h2f_bridge_s0_debugaccess                                : in  std_logic                      := 'X';             -- debugaccess
			lphy_ss_top_0_pb_avst_sink_valid                                 : in  std_logic                      := 'X';             -- valid
			lphy_ss_top_0_pb_avst_sink_data                                  : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			lphy_ss_top_0_pb_avst_sink_ready                                 : out std_logic;                                         -- ready
			lphy_avst_selctd_cap_intf_valid                                  : out std_logic;                                         -- valid
			lphy_avst_selctd_cap_intf_data                                   : out std_logic_vector(31 downto 0);                     -- data
			lphy_avst_selctd_cap_intf_channel                                : out std_logic_vector(2 downto 0);                      -- channel
			lphy_ss_top_0_frame_status_counter_reset_data                    : in  std_logic                      := 'X';             -- data
			lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1_irq     : out std_logic;                                         -- irq
			lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2_irq     : out std_logic;                                         -- irq
			lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1_irq      : out std_logic;                                         -- irq
			lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2_irq      : out std_logic;                                         -- irq
			lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en_data                   : out std_logic                                          -- data
		);
	end component phipps_peak;

	u0 : component phipps_peak
		port map (
			clock_bridge_csr_in_clk_clk                                      => CONNECTED_TO_clock_bridge_csr_in_clk_clk,                                      --                                  clock_bridge_csr_in_clk.clk
			clock_bridge_dsp_in_clk_clk                                      => CONNECTED_TO_clock_bridge_dsp_in_clk_clk,                                      --                                  clock_bridge_dsp_in_clk.clk
			clock_bridge_ecpri_rx_in_clk_clk                                 => CONNECTED_TO_clock_bridge_ecpri_rx_in_clk_clk,                                 --                             clock_bridge_ecpri_rx_in_clk.clk
			clock_bridge_ecpri_tx_in_clk_clk                                 => CONNECTED_TO_clock_bridge_ecpri_tx_in_clk_clk,                                 --                             clock_bridge_ecpri_tx_in_clk.clk
			clock_bridge_eth_in_clk_clk                                      => CONNECTED_TO_clock_bridge_eth_in_clk_clk,                                      --                                  clock_bridge_eth_in_clk.clk
			h2f_bridge_s0_waitrequest                                        => CONNECTED_TO_h2f_bridge_s0_waitrequest,                                        --                                            h2f_bridge_s0.waitrequest
			h2f_bridge_s0_readdata                                           => CONNECTED_TO_h2f_bridge_s0_readdata,                                           --                                                         .readdata
			h2f_bridge_s0_readdatavalid                                      => CONNECTED_TO_h2f_bridge_s0_readdatavalid,                                      --                                                         .readdatavalid
			h2f_bridge_s0_burstcount                                         => CONNECTED_TO_h2f_bridge_s0_burstcount,                                         --                                                         .burstcount
			h2f_bridge_s0_writedata                                          => CONNECTED_TO_h2f_bridge_s0_writedata,                                          --                                                         .writedata
			h2f_bridge_s0_address                                            => CONNECTED_TO_h2f_bridge_s0_address,                                            --                                                         .address
			h2f_bridge_s0_write                                              => CONNECTED_TO_h2f_bridge_s0_write,                                              --                                                         .write
			h2f_bridge_s0_read                                               => CONNECTED_TO_h2f_bridge_s0_read,                                               --                                                         .read
			h2f_bridge_s0_byteenable                                         => CONNECTED_TO_h2f_bridge_s0_byteenable,                                         --                                                         .byteenable
			h2f_bridge_s0_debugaccess                                        => CONNECTED_TO_h2f_bridge_s0_debugaccess,                                        --                                                         .debugaccess
			h2f_lw_bridge_s0_waitrequest                                     => CONNECTED_TO_h2f_lw_bridge_s0_waitrequest,                                     --                                         h2f_lw_bridge_s0.waitrequest
			h2f_lw_bridge_s0_readdata                                        => CONNECTED_TO_h2f_lw_bridge_s0_readdata,                                        --                                                         .readdata
			h2f_lw_bridge_s0_readdatavalid                                   => CONNECTED_TO_h2f_lw_bridge_s0_readdatavalid,                                   --                                                         .readdatavalid
			h2f_lw_bridge_s0_burstcount                                      => CONNECTED_TO_h2f_lw_bridge_s0_burstcount,                                      --                                                         .burstcount
			h2f_lw_bridge_s0_writedata                                       => CONNECTED_TO_h2f_lw_bridge_s0_writedata,                                       --                                                         .writedata
			h2f_lw_bridge_s0_address                                         => CONNECTED_TO_h2f_lw_bridge_s0_address,                                         --                                                         .address
			h2f_lw_bridge_s0_write                                           => CONNECTED_TO_h2f_lw_bridge_s0_write,                                           --                                                         .write
			h2f_lw_bridge_s0_read                                            => CONNECTED_TO_h2f_lw_bridge_s0_read,                                            --                                                         .read
			h2f_lw_bridge_s0_byteenable                                      => CONNECTED_TO_h2f_lw_bridge_s0_byteenable,                                      --                                                         .byteenable
			h2f_lw_bridge_s0_debugaccess                                     => CONNECTED_TO_h2f_lw_bridge_s0_debugaccess,                                     --                                                         .debugaccess
			csr_in_reset_reset_n                                             => CONNECTED_TO_csr_in_reset_reset_n,                                             --                                             csr_in_reset.reset_n
			dsp_in_reset_reset_n                                             => CONNECTED_TO_dsp_in_reset_reset_n,                                             --                                             dsp_in_reset.reset_n
			eth_in_reset_reset_n                                             => CONNECTED_TO_eth_in_reset_reset_n,                                             --                                             eth_in_reset.reset_n
			rst_ecpri_n_reset_n                                              => CONNECTED_TO_rst_ecpri_n_reset_n,                                              --                                              rst_ecpri_n.reset_n
			radio_config_status_dup2_radio_config_status                     => CONNECTED_TO_radio_config_status_dup2_radio_config_status,                     --                                 radio_config_status_dup2.radio_config_status
			rst_soft_n_dup4_rst_soft_n                                       => CONNECTED_TO_rst_soft_n_dup4_rst_soft_n,                                       --                                          rst_soft_n_dup4.rst_soft_n
			interface_sel_data                                               => CONNECTED_TO_interface_sel_data,                                               --                                            interface_sel.data
			ddc_avst_sink_avst_sink_valid                                    => CONNECTED_TO_ddc_avst_sink_avst_sink_valid,                                    --                                            ddc_avst_sink.avst_sink_valid
			ddc_avst_sink_avst_sink_channel                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_channel,                                  --                                                         .avst_sink_channel
			ddc_avst_sink_avst_sink_data_l1                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l1,                                  --                                                         .avst_sink_data_l1
			ddc_avst_sink_avst_sink_data_l2                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l2,                                  --                                                         .avst_sink_data_l2
			ddc_avst_sink_avst_sink_data_l3                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l3,                                  --                                                         .avst_sink_data_l3
			ddc_avst_sink_avst_sink_data_l4                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l4,                                  --                                                         .avst_sink_data_l4
			ddc_avst_sink_avst_sink_data_l5                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l5,                                  --                                                         .avst_sink_data_l5
			ddc_avst_sink_avst_sink_data_l6                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l6,                                  --                                                         .avst_sink_data_l6
			ddc_avst_sink_avst_sink_data_l7                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l7,                                  --                                                         .avst_sink_data_l7
			ddc_avst_sink_avst_sink_data_l8                                  => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l8,                                  --                                                         .avst_sink_data_l8
			duc_avst_source_duc_avst_source_valid                            => CONNECTED_TO_duc_avst_source_duc_avst_source_valid,                            --                                          duc_avst_source.duc_avst_source_valid
			duc_avst_source_duc_avst_source_data0                            => CONNECTED_TO_duc_avst_source_duc_avst_source_data0,                            --                                                         .duc_avst_source_data0
			duc_avst_source_duc_avst_source_data1                            => CONNECTED_TO_duc_avst_source_duc_avst_source_data1,                            --                                                         .duc_avst_source_data1
			duc_avst_source_duc_avst_source_data2                            => CONNECTED_TO_duc_avst_source_duc_avst_source_data2,                            --                                                         .duc_avst_source_data2
			duc_avst_source_duc_avst_source_data3                            => CONNECTED_TO_duc_avst_source_duc_avst_source_data3,                            --                                                         .duc_avst_source_data3
			duc_avst_source_duc_avst_source_data4                            => CONNECTED_TO_duc_avst_source_duc_avst_source_data4,                            --                                                         .duc_avst_source_data4
			duc_avst_source_duc_avst_source_data5                            => CONNECTED_TO_duc_avst_source_duc_avst_source_data5,                            --                                                         .duc_avst_source_data5
			duc_avst_source_duc_avst_source_data6                            => CONNECTED_TO_duc_avst_source_duc_avst_source_data6,                            --                                                         .duc_avst_source_data6
			duc_avst_source_duc_avst_source_data7                            => CONNECTED_TO_duc_avst_source_duc_avst_source_data7,                            --                                                         .duc_avst_source_data7
			duc_avst_source_duc_avst_source_channel                          => CONNECTED_TO_duc_avst_source_duc_avst_source_channel,                          --                                                         .duc_avst_source_channel
			dxc_ss_top_0_rfp_pulse_data                                      => CONNECTED_TO_dxc_ss_top_0_rfp_pulse_data,                                      --                                   dxc_ss_top_0_rfp_pulse.data
			dxc_avst_selctd_cap_intf_valid                                   => CONNECTED_TO_dxc_avst_selctd_cap_intf_valid,                                   --                                 dxc_avst_selctd_cap_intf.valid
			dxc_avst_selctd_cap_intf_data                                    => CONNECTED_TO_dxc_avst_selctd_cap_intf_data,                                    --                                                         .data
			dxc_avst_selctd_cap_intf_channel                                 => CONNECTED_TO_dxc_avst_selctd_cap_intf_channel,                                 --                                                         .channel
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_skip_crc              => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_skip_crc,              --                          avst_axist_bridge_0_avst_tx_ptp.i_av_st_tx_skip_crc
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_valid          => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_valid,          --                                                         .i_av_st_tx_ptp_ts_valid
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_ets           => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_ets,           --                                                         .i_av_st_tx_ptp_ins_ets
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_cf            => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ins_cf,            --                                                         .i_av_st_tx_ptp_ins_cf
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_tx_its            => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_tx_its,            --                                                         .i_av_st_tx_ptp_tx_its
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx      => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_p2p_idx,      --                                                         .i_av_st_tx_ptp_asym_p2p_idx
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_sign         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym_sign,         --                                                         .i_av_st_tx_ptp_asym_sign
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym              => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_asym,              --                                                         .i_av_st_tx_ptp_asym
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_p2p               => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_p2p,               --                                                         .i_av_st_tx_ptp_p2p
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_format         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_format,         --                                                         .i_av_st_tx_ptp_ts_format
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_update_eb         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_update_eb,         --                                                         .i_av_st_tx_ptp_update_eb
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_zero_csum         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_zero_csum,         --                                                         .i_av_st_tx_ptp_zero_csum
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_eb_offset         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_eb_offset,         --                                                         .i_av_st_tx_ptp_eb_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_csum_offset       => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_csum_offset,       --                                                         .i_av_st_tx_ptp_csum_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_cf_offset         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_cf_offset,         --                                                         .i_av_st_tx_ptp_cf_offset
			avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_offset         => CONNECTED_TO_avst_axist_bridge_0_avst_tx_ptp_i_av_st_tx_ptp_ts_offset,         --                                                         .i_av_st_tx_ptp_ts_offset
			avst_axist_bridge_0_axit_tx_if_tready                            => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tready,                            --                           avst_axist_bridge_0_axit_tx_if.tready
			avst_axist_bridge_0_axit_tx_if_tvalid                            => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tvalid,                            --                                                         .tvalid
			avst_axist_bridge_0_axit_tx_if_tdata                             => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tdata,                             --                                                         .tdata
			avst_axist_bridge_0_axit_tx_if_tlast                             => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tlast,                             --                                                         .tlast
			avst_axist_bridge_0_axit_tx_if_tkeep                             => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tkeep,                             --                                                         .tkeep
			avst_axist_bridge_0_axit_tx_if_tuser                             => CONNECTED_TO_avst_axist_bridge_0_axit_tx_if_tuser,                             --                                                         .tuser
			avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp          => CONNECTED_TO_avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp,          --                        avst_axist_bridge_0_axist_tx_user.o_axi_st_tx_tuser_ptp
			avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp_extended => CONNECTED_TO_avst_axist_bridge_0_axist_tx_user_o_axi_st_tx_tuser_ptp_extended, --                                                         .o_axi_st_tx_tuser_ptp_extended
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_data            => CONNECTED_TO_avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_data,            --                          avst_axist_bridge_0_avst_rx_ptp.o_av_st_rxstatus_data
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_valid           => CONNECTED_TO_avst_axist_bridge_0_avst_rx_ptp_o_av_st_rxstatus_valid,           --                                                         .o_av_st_rxstatus_valid
			avst_axist_bridge_0_avst_rx_ptp_o_av_st_ptp_rx_its               => CONNECTED_TO_avst_axist_bridge_0_avst_rx_ptp_o_av_st_ptp_rx_its,               --                                                         .o_av_st_ptp_rx_its
			avst_axist_bridge_0_axist_rx_if_tvalid                           => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tvalid,                           --                          avst_axist_bridge_0_axist_rx_if.tvalid
			avst_axist_bridge_0_axist_rx_if_tdata                            => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tdata,                            --                                                         .tdata
			avst_axist_bridge_0_axist_rx_if_tlast                            => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tlast,                            --                                                         .tlast
			avst_axist_bridge_0_axist_rx_if_tkeep                            => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tkeep,                            --                                                         .tkeep
			avst_axist_bridge_0_axist_rx_if_tuser                            => CONNECTED_TO_avst_axist_bridge_0_axist_rx_if_tuser,                            --                                                         .tuser
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts          => CONNECTED_TO_avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts,          --                        avst_axist_bridge_0_axist_rx_user.i_axi_st_rx_tuser_sts
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts_extended => CONNECTED_TO_avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_tuser_sts_extended, --                                                         .i_axi_st_rx_tuser_sts_extended
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tdata      => CONNECTED_TO_avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tdata,      --                                                         .i_axi_st_rx_ingrts0_tdata
			avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tvalid     => CONNECTED_TO_avst_axist_bridge_0_axist_rx_user_i_axi_st_rx_ingrts0_tvalid,     --                                                         .i_axi_st_rx_ingrts0_tvalid
			ecpri_ext_sink_valid                                             => CONNECTED_TO_ecpri_ext_sink_valid,                                             --                                           ecpri_ext_sink.valid
			ecpri_ext_sink_data                                              => CONNECTED_TO_ecpri_ext_sink_data,                                              --                                                         .data
			ecpri_ext_sink_startofpacket                                     => CONNECTED_TO_ecpri_ext_sink_startofpacket,                                     --                                                         .startofpacket
			ecpri_ext_sink_endofpacket                                       => CONNECTED_TO_ecpri_ext_sink_endofpacket,                                       --                                                         .endofpacket
			ecpri_ext_sink_empty                                             => CONNECTED_TO_ecpri_ext_sink_empty,                                             --                                                         .empty
			ecpri_ext_sink_error                                             => CONNECTED_TO_ecpri_ext_sink_error,                                             --                                                         .error
			ecpri_ext_sink_ready                                             => CONNECTED_TO_ecpri_ext_sink_ready,                                             --                                                         .ready
			ecpri_ext_source_valid                                           => CONNECTED_TO_ecpri_ext_source_valid,                                           --                                         ecpri_ext_source.valid
			ecpri_ext_source_data                                            => CONNECTED_TO_ecpri_ext_source_data,                                            --                                                         .data
			ecpri_ext_source_startofpacket                                   => CONNECTED_TO_ecpri_ext_source_startofpacket,                                   --                                                         .startofpacket
			ecpri_ext_source_endofpacket                                     => CONNECTED_TO_ecpri_ext_source_endofpacket,                                     --                                                         .endofpacket
			ecpri_ext_source_empty                                           => CONNECTED_TO_ecpri_ext_source_empty,                                           --                                                         .empty
			ecpri_ext_source_error                                           => CONNECTED_TO_ecpri_ext_source_error,                                           --                                                         .error
			ptp_tod_concat_out_o_mac_ptp_fp                                  => CONNECTED_TO_ptp_tod_concat_out_o_mac_ptp_fp,                                  --                                       ptp_tod_concat_out.o_mac_ptp_fp
			ptp_tod_concat_out_o_mac_ptp_ts_req                              => CONNECTED_TO_ptp_tod_concat_out_o_mac_ptp_ts_req,                              --                                                         .o_mac_ptp_ts_req
			ptp_tod_concat_out_i_mac_ptp_tx_ets_valid                        => CONNECTED_TO_ptp_tod_concat_out_i_mac_ptp_tx_ets_valid,                        --                                                         .i_mac_ptp_tx_ets_valid
			ptp_tod_concat_out_i_mac_ptp_tx_ets                              => CONNECTED_TO_ptp_tod_concat_out_i_mac_ptp_tx_ets,                              --                                                         .i_mac_ptp_tx_ets
			ptp_tod_concat_out_i_mac_ptp_tx_ets_fp                           => CONNECTED_TO_ptp_tod_concat_out_i_mac_ptp_tx_ets_fp,                           --                                                         .i_mac_ptp_tx_ets_fp
			ptp_tod_concat_out_i_mac_ptp_rx_its_valid                        => CONNECTED_TO_ptp_tod_concat_out_i_mac_ptp_rx_its_valid,                        --                                                         .i_mac_ptp_rx_its_valid
			ptp_tod_concat_out_i_mac_ptp_rx_its                              => CONNECTED_TO_ptp_tod_concat_out_i_mac_ptp_rx_its,                              --                                                         .i_mac_ptp_rx_its
			ptp_tod_concat_out_i_ext_ptp_fp                                  => CONNECTED_TO_ptp_tod_concat_out_i_ext_ptp_fp,                                  --                                                         .i_ext_ptp_fp
			ptp_tod_concat_out_i_ext_ptp_ts_req                              => CONNECTED_TO_ptp_tod_concat_out_i_ext_ptp_ts_req,                              --                                                         .i_ext_ptp_ts_req
			ptp_tod_concat_out_o_ext_ptp_tx_ets_valid                        => CONNECTED_TO_ptp_tod_concat_out_o_ext_ptp_tx_ets_valid,                        --                                                         .o_ext_ptp_tx_ets_valid
			ptp_tod_concat_out_o_ext_ptp_tx_ets                              => CONNECTED_TO_ptp_tod_concat_out_o_ext_ptp_tx_ets,                              --                                                         .o_ext_ptp_tx_ets
			ptp_tod_concat_out_o_ext_ptp_tx_ets_fp                           => CONNECTED_TO_ptp_tod_concat_out_o_ext_ptp_tx_ets_fp,                           --                                                         .o_ext_ptp_tx_ets_fp
			ptp_tod_concat_out_o_ext_ptp_rx_its                              => CONNECTED_TO_ptp_tod_concat_out_o_ext_ptp_rx_its,                              --                                                         .o_ext_ptp_rx_its
			ptp_tod_concat_out_o_ext_ptp_rx_its_valid                        => CONNECTED_TO_ptp_tod_concat_out_o_ext_ptp_rx_its_valid,                        --                                                         .o_ext_ptp_rx_its_valid
			rx_pcs_ready_rx_pcs_ready                                        => CONNECTED_TO_rx_pcs_ready_rx_pcs_ready,                                        --                                             rx_pcs_ready.rx_pcs_ready
			tx_lanes_stable_tx_lanes_stable                                  => CONNECTED_TO_tx_lanes_stable_tx_lanes_stable,                                  --                                          tx_lanes_stable.tx_lanes_stable
			ecpri_oran_top_0_oran_tx_tod_96b_data_tdata                      => CONNECTED_TO_ecpri_oran_top_0_oran_tx_tod_96b_data_tdata,                      --                    ecpri_oran_top_0_oran_tx_tod_96b_data.tdata
			ecpri_oran_top_0_oran_tx_tod_96b_data_tvalid                     => CONNECTED_TO_ecpri_oran_top_0_oran_tx_tod_96b_data_tvalid,                     --                                                         .tvalid
			ecpri_oran_top_0_oran_rx_tod_96b_data_tdata                      => CONNECTED_TO_ecpri_oran_top_0_oran_rx_tod_96b_data_tdata,                      --                    ecpri_oran_top_0_oran_rx_tod_96b_data.tdata
			ecpri_oran_top_0_oran_rx_tod_96b_data_tvalid                     => CONNECTED_TO_ecpri_oran_top_0_oran_rx_tod_96b_data_tvalid,                     --                                                         .tvalid
			xran_timestamp_tod_in_data                                       => CONNECTED_TO_xran_timestamp_tod_in_data,                                       --                                    xran_timestamp_tod_in.data
			timeout_cntr_intr_uplane_irq                                     => CONNECTED_TO_timeout_cntr_intr_uplane_irq,                                     --                                 timeout_cntr_intr_uplane.irq
			timeout_cntr_intr_cplane_irq                                     => CONNECTED_TO_timeout_cntr_intr_cplane_irq,                                     --                                 timeout_cntr_intr_cplane.irq
			fifo_full_intr_irq                                               => CONNECTED_TO_fifo_full_intr_irq,                                               --                                           fifo_full_intr.irq
			pwr_mtr_h2f_bridge_s0_waitrequest                                => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_waitrequest,                                --                                    pwr_mtr_h2f_bridge_s0.waitrequest
			pwr_mtr_h2f_bridge_s0_readdata                                   => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_readdata,                                   --                                                         .readdata
			pwr_mtr_h2f_bridge_s0_readdatavalid                              => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_readdatavalid,                              --                                                         .readdatavalid
			pwr_mtr_h2f_bridge_s0_burstcount                                 => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_burstcount,                                 --                                                         .burstcount
			pwr_mtr_h2f_bridge_s0_writedata                                  => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_writedata,                                  --                                                         .writedata
			pwr_mtr_h2f_bridge_s0_address                                    => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_address,                                    --                                                         .address
			pwr_mtr_h2f_bridge_s0_write                                      => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_write,                                      --                                                         .write
			pwr_mtr_h2f_bridge_s0_read                                       => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_read,                                       --                                                         .read
			pwr_mtr_h2f_bridge_s0_byteenable                                 => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_byteenable,                                 --                                                         .byteenable
			pwr_mtr_h2f_bridge_s0_debugaccess                                => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_debugaccess,                                --                                                         .debugaccess
			lphy_ss_top_0_pb_avst_sink_valid                                 => CONNECTED_TO_lphy_ss_top_0_pb_avst_sink_valid,                                 --                               lphy_ss_top_0_pb_avst_sink.valid
			lphy_ss_top_0_pb_avst_sink_data                                  => CONNECTED_TO_lphy_ss_top_0_pb_avst_sink_data,                                  --                                                         .data
			lphy_ss_top_0_pb_avst_sink_ready                                 => CONNECTED_TO_lphy_ss_top_0_pb_avst_sink_ready,                                 --                                                         .ready
			lphy_avst_selctd_cap_intf_valid                                  => CONNECTED_TO_lphy_avst_selctd_cap_intf_valid,                                  --                                lphy_avst_selctd_cap_intf.valid
			lphy_avst_selctd_cap_intf_data                                   => CONNECTED_TO_lphy_avst_selctd_cap_intf_data,                                   --                                                         .data
			lphy_avst_selctd_cap_intf_channel                                => CONNECTED_TO_lphy_avst_selctd_cap_intf_channel,                                --                                                         .channel
			lphy_ss_top_0_frame_status_counter_reset_data                    => CONNECTED_TO_lphy_ss_top_0_frame_status_counter_reset_data,                    --                 lphy_ss_top_0_frame_status_counter_reset.data
			lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1_irq     => CONNECTED_TO_lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1_irq,     -- lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1.irq
			lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2_irq     => CONNECTED_TO_lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2_irq,     -- lphy_ss_top_0_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2.irq
			lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1_irq      => CONNECTED_TO_lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1_irq,      --  lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1.irq
			lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2_irq      => CONNECTED_TO_lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2_irq,      --  lphy_ss_top_0_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2.irq
			lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en_data                   => CONNECTED_TO_lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en_data                    --                lphy_ss_top_0_lphy_ss_top_duc_ddc_lpbk_en.data
		);

