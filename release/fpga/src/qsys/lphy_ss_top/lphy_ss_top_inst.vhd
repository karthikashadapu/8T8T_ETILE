	component lphy_ss_top is
		port (
			clk_csr_clk                                    : in  std_logic                      := 'X';             -- clk
			clk_dsp_clk                                    : in  std_logic                      := 'X';             -- clk
			clk_xran_dl_clk                                : in  std_logic                      := 'X';             -- clk
			clk_xran_ul_clk                                : in  std_logic                      := 'X';             -- clk
			pwr_mtr_h2f_bridge_s0_waitrequest              : out std_logic;                                         -- waitrequest
			pwr_mtr_h2f_bridge_s0_readdata                 : out std_logic_vector(31 downto 0);                     -- readdata
			pwr_mtr_h2f_bridge_s0_readdatavalid            : out std_logic;                                         -- readdatavalid
			pwr_mtr_h2f_bridge_s0_burstcount               : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			pwr_mtr_h2f_bridge_s0_writedata                : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			pwr_mtr_h2f_bridge_s0_address                  : in  std_logic_vector(16 downto 0)  := (others => 'X'); -- address
			pwr_mtr_h2f_bridge_s0_write                    : in  std_logic                      := 'X';             -- write
			pwr_mtr_h2f_bridge_s0_read                     : in  std_logic                      := 'X';             -- read
			pwr_mtr_h2f_bridge_s0_byteenable               : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			pwr_mtr_h2f_bridge_s0_debugaccess              : in  std_logic                      := 'X';             -- debugaccess
			h2f_lw_bridge_s0_waitrequest                   : out std_logic;                                         -- waitrequest
			h2f_lw_bridge_s0_readdata                      : out std_logic_vector(31 downto 0);                     -- readdata
			h2f_lw_bridge_s0_readdatavalid                 : out std_logic;                                         -- readdatavalid
			h2f_lw_bridge_s0_burstcount                    : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			h2f_lw_bridge_s0_writedata                     : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			h2f_lw_bridge_s0_address                       : in  std_logic_vector(18 downto 0)  := (others => 'X'); -- address
			h2f_lw_bridge_s0_write                         : in  std_logic                      := 'X';             -- write
			h2f_lw_bridge_s0_read                          : in  std_logic                      := 'X';             -- read
			h2f_lw_bridge_s0_byteenable                    : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			h2f_lw_bridge_s0_debugaccess                   : in  std_logic                      := 'X';             -- debugaccess
			pb_mm_bridge_address                           : in  std_logic_vector(16 downto 0)  := (others => 'X'); -- address
			pb_mm_bridge_chipselect                        : in  std_logic                      := 'X';             -- chipselect
			pb_mm_bridge_read                              : in  std_logic                      := 'X';             -- read
			pb_mm_bridge_readdata                          : out std_logic_vector(31 downto 0);                     -- readdata
			pb_mm_bridge_write                             : in  std_logic                      := 'X';             -- write
			pb_mm_bridge_writedata                         : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			pb_mm_bridge_byteenable                        : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			pb_mm_bridge_waitrequest                       : out std_logic;                                         -- waitrequest
			xran_demapper_source_valid                     : in  std_logic                      := 'X';             -- valid
			xran_demapper_source_data                      : in  std_logic_vector(127 downto 0) := (others => 'X'); -- data
			xran_demapper_source_endofpacket               : in  std_logic                      := 'X';             -- endofpacket
			xran_demapper_source_startofpacket             : in  std_logic                      := 'X';             -- startofpacket
			xran_demapper_source_ready                     : out std_logic;                                         -- ready
			xran_demapper_source_channel                   : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- channel
			ifft_source_l1_valid                           : out std_logic;                                         -- valid
			ifft_source_l1_data                            : out std_logic_vector(31 downto 0);                     -- data
			ifft_source_l1_channel                         : out std_logic_vector(7 downto 0);                      -- channel
			ifft_source_l2_valid                           : out std_logic;                                         -- valid
			ifft_source_l2_data                            : out std_logic_vector(31 downto 0);                     -- data
			ifft_source_l2_channel                         : out std_logic_vector(7 downto 0);                      -- channel
			coupling_pusch_avst_sink_l1_valid              : out std_logic;                                         -- valid
			coupling_pusch_avst_sink_l1_data               : out std_logic_vector(31 downto 0);                     -- data
			coupling_pusch_avst_sink_l1_channel            : out std_logic_vector(15 downto 0);                     -- channel
			coupling_pusch_avst_sink_l1_startofpacket      : out std_logic;                                         -- startofpacket
			coupling_pusch_avst_sink_l1_endofpacket        : out std_logic;                                         -- endofpacket
			coupling_pusch_avst_sink_l2_valid              : out std_logic;                                         -- valid
			coupling_pusch_avst_sink_l2_data               : out std_logic_vector(31 downto 0);                     -- data
			coupling_pusch_avst_sink_l2_channel            : out std_logic_vector(15 downto 0);                     -- channel
			coupling_pusch_avst_sink_l2_startofpacket      : out std_logic;                                         -- startofpacket
			coupling_pusch_avst_sink_l2_endofpacket        : out std_logic;                                         -- endofpacket
			coupling_prach_avst_sink_l1_valid              : out std_logic;                                         -- valid
			coupling_prach_avst_sink_l1_data               : out std_logic_vector(31 downto 0);                     -- data
			coupling_prach_avst_sink_l1_channel            : out std_logic_vector(15 downto 0);                     -- channel
			coupling_prach_avst_sink_l1_startofpacket      : out std_logic;                                         -- startofpacket
			coupling_prach_avst_sink_l1_endofpacket        : out std_logic;                                         -- endofpacket
			coupling_prach_avst_sink_l2_valid              : out std_logic;                                         -- valid
			coupling_prach_avst_sink_l2_data               : out std_logic_vector(31 downto 0);                     -- data
			coupling_prach_avst_sink_l2_channel            : out std_logic_vector(15 downto 0);                     -- channel
			coupling_prach_avst_sink_l2_startofpacket      : out std_logic;                                         -- startofpacket
			coupling_prach_avst_sink_l2_endofpacket        : out std_logic;                                         -- endofpacket
			xran_demapper_cplane_source_valid              : in  std_logic                      := 'X';             -- valid
			xran_demapper_cplane_source_startofpacket      : in  std_logic                      := 'X';             -- startofpacket
			xran_demapper_cplane_source_endofpacket        : in  std_logic                      := 'X';             -- endofpacket
			pb_avst_sink_valid                             : in  std_logic                      := 'X';             -- valid
			pb_avst_sink_data                              : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- data
			pb_avst_sink_ready                             : out std_logic;                                         -- ready
			bw_confg_cc1_bw_config_cc1                     : out std_logic_vector(7 downto 0);                      -- bw_config_cc1
			bw_confg_cc2_bw_config_cc2                     : out std_logic_vector(7 downto 0);                      -- bw_config_cc2
			radio_config_status_radio_config_status        : out std_logic_vector(55 downto 0);                     -- radio_config_status
			short_long_prach_select_data                   : out std_logic;                                         -- data
			rx_rtc_id_rx_rtc_id                            : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- rx_rtc_id
			rx_u_axc_id_rx_u_axc_id                        : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- rx_u_axc_id
			rx_rtc_id_dl_rx_rtc_id_dl                      : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- rx_rtc_id_dl
			lphy_ss_ul_sink_l1_valid                       : in  std_logic                      := 'X';             -- valid
			lphy_ss_ul_sink_l1_data                        : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			lphy_ss_ul_sink_l1_channel                     : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- channel
			lphy_ss_ul_sink_l2_valid                       : in  std_logic                      := 'X';             -- valid
			lphy_ss_ul_sink_l2_data                        : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			lphy_ss_ul_sink_l2_channel                     : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- channel
			rst_soft_n_rst_soft_n                          : out std_logic;                                         -- rst_soft_n
			coupling_pusch_timing_ref_data                 : out std_logic_vector(31 downto 0);                     -- data
			coupling_prach_timing_ref_data                 : out std_logic_vector(31 downto 0);                     -- data
			oran_rx_cplane_concat_data                     : in  std_logic_vector(189 downto 0) := (others => 'X'); -- data
			oran_rx_uplane_concat_data                     : in  std_logic_vector(67 downto 0)  := (others => 'X'); -- data
			lphy_avst_selctd_cap_intf_valid                : out std_logic;                                         -- valid
			lphy_avst_selctd_cap_intf_data                 : out std_logic_vector(31 downto 0);                     -- data
			lphy_avst_selctd_cap_intf_channel              : out std_logic_vector(2 downto 0);                      -- channel
			ul_start_pulse_latch_data                      : out std_logic;                                         -- data
			frame_status_counter_reset_data                : in  std_logic                      := 'X';             -- data
			lphy_ss_top_interface_sel_data                 : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			lphy_ss_top_dl_input_hfn_pulse_data            : out std_logic;                                         -- data
			lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1_irq : out std_logic;                                         -- irq
			lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2_irq : out std_logic;                                         -- irq
			lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1_irq  : out std_logic;                                         -- irq
			lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2_irq  : out std_logic;                                         -- irq
			lphy_ss_top_duc_ddc_lpbk_en_data               : out std_logic;                                         -- data
			reset_csr_reset                                : in  std_logic                      := 'X';             -- reset
			reset_dsp_in_reset_n                           : in  std_logic                      := 'X';             -- reset_n
			reset_xran_dl_reset_n                          : in  std_logic                      := 'X';             -- reset_n
			reset_xran_ul_reset_n                          : in  std_logic                      := 'X'              -- reset_n
		);
	end component lphy_ss_top;

	u0 : component lphy_ss_top
		port map (
			clk_csr_clk                                    => CONNECTED_TO_clk_csr_clk,                                    --                                    clk_csr.clk
			clk_dsp_clk                                    => CONNECTED_TO_clk_dsp_clk,                                    --                                    clk_dsp.clk
			clk_xran_dl_clk                                => CONNECTED_TO_clk_xran_dl_clk,                                --                                clk_xran_dl.clk
			clk_xran_ul_clk                                => CONNECTED_TO_clk_xran_ul_clk,                                --                                clk_xran_ul.clk
			pwr_mtr_h2f_bridge_s0_waitrequest              => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_waitrequest,              --                      pwr_mtr_h2f_bridge_s0.waitrequest
			pwr_mtr_h2f_bridge_s0_readdata                 => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_readdata,                 --                                           .readdata
			pwr_mtr_h2f_bridge_s0_readdatavalid            => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_readdatavalid,            --                                           .readdatavalid
			pwr_mtr_h2f_bridge_s0_burstcount               => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_burstcount,               --                                           .burstcount
			pwr_mtr_h2f_bridge_s0_writedata                => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_writedata,                --                                           .writedata
			pwr_mtr_h2f_bridge_s0_address                  => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_address,                  --                                           .address
			pwr_mtr_h2f_bridge_s0_write                    => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_write,                    --                                           .write
			pwr_mtr_h2f_bridge_s0_read                     => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_read,                     --                                           .read
			pwr_mtr_h2f_bridge_s0_byteenable               => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_byteenable,               --                                           .byteenable
			pwr_mtr_h2f_bridge_s0_debugaccess              => CONNECTED_TO_pwr_mtr_h2f_bridge_s0_debugaccess,              --                                           .debugaccess
			h2f_lw_bridge_s0_waitrequest                   => CONNECTED_TO_h2f_lw_bridge_s0_waitrequest,                   --                           h2f_lw_bridge_s0.waitrequest
			h2f_lw_bridge_s0_readdata                      => CONNECTED_TO_h2f_lw_bridge_s0_readdata,                      --                                           .readdata
			h2f_lw_bridge_s0_readdatavalid                 => CONNECTED_TO_h2f_lw_bridge_s0_readdatavalid,                 --                                           .readdatavalid
			h2f_lw_bridge_s0_burstcount                    => CONNECTED_TO_h2f_lw_bridge_s0_burstcount,                    --                                           .burstcount
			h2f_lw_bridge_s0_writedata                     => CONNECTED_TO_h2f_lw_bridge_s0_writedata,                     --                                           .writedata
			h2f_lw_bridge_s0_address                       => CONNECTED_TO_h2f_lw_bridge_s0_address,                       --                                           .address
			h2f_lw_bridge_s0_write                         => CONNECTED_TO_h2f_lw_bridge_s0_write,                         --                                           .write
			h2f_lw_bridge_s0_read                          => CONNECTED_TO_h2f_lw_bridge_s0_read,                          --                                           .read
			h2f_lw_bridge_s0_byteenable                    => CONNECTED_TO_h2f_lw_bridge_s0_byteenable,                    --                                           .byteenable
			h2f_lw_bridge_s0_debugaccess                   => CONNECTED_TO_h2f_lw_bridge_s0_debugaccess,                   --                                           .debugaccess
			pb_mm_bridge_address                           => CONNECTED_TO_pb_mm_bridge_address,                           --                               pb_mm_bridge.address
			pb_mm_bridge_chipselect                        => CONNECTED_TO_pb_mm_bridge_chipselect,                        --                                           .chipselect
			pb_mm_bridge_read                              => CONNECTED_TO_pb_mm_bridge_read,                              --                                           .read
			pb_mm_bridge_readdata                          => CONNECTED_TO_pb_mm_bridge_readdata,                          --                                           .readdata
			pb_mm_bridge_write                             => CONNECTED_TO_pb_mm_bridge_write,                             --                                           .write
			pb_mm_bridge_writedata                         => CONNECTED_TO_pb_mm_bridge_writedata,                         --                                           .writedata
			pb_mm_bridge_byteenable                        => CONNECTED_TO_pb_mm_bridge_byteenable,                        --                                           .byteenable
			pb_mm_bridge_waitrequest                       => CONNECTED_TO_pb_mm_bridge_waitrequest,                       --                                           .waitrequest
			xran_demapper_source_valid                     => CONNECTED_TO_xran_demapper_source_valid,                     --                       xran_demapper_source.valid
			xran_demapper_source_data                      => CONNECTED_TO_xran_demapper_source_data,                      --                                           .data
			xran_demapper_source_endofpacket               => CONNECTED_TO_xran_demapper_source_endofpacket,               --                                           .endofpacket
			xran_demapper_source_startofpacket             => CONNECTED_TO_xran_demapper_source_startofpacket,             --                                           .startofpacket
			xran_demapper_source_ready                     => CONNECTED_TO_xran_demapper_source_ready,                     --                                           .ready
			xran_demapper_source_channel                   => CONNECTED_TO_xran_demapper_source_channel,                   --                                           .channel
			ifft_source_l1_valid                           => CONNECTED_TO_ifft_source_l1_valid,                           --                             ifft_source_l1.valid
			ifft_source_l1_data                            => CONNECTED_TO_ifft_source_l1_data,                            --                                           .data
			ifft_source_l1_channel                         => CONNECTED_TO_ifft_source_l1_channel,                         --                                           .channel
			ifft_source_l2_valid                           => CONNECTED_TO_ifft_source_l2_valid,                           --                             ifft_source_l2.valid
			ifft_source_l2_data                            => CONNECTED_TO_ifft_source_l2_data,                            --                                           .data
			ifft_source_l2_channel                         => CONNECTED_TO_ifft_source_l2_channel,                         --                                           .channel
			coupling_pusch_avst_sink_l1_valid              => CONNECTED_TO_coupling_pusch_avst_sink_l1_valid,              --                coupling_pusch_avst_sink_l1.valid
			coupling_pusch_avst_sink_l1_data               => CONNECTED_TO_coupling_pusch_avst_sink_l1_data,               --                                           .data
			coupling_pusch_avst_sink_l1_channel            => CONNECTED_TO_coupling_pusch_avst_sink_l1_channel,            --                                           .channel
			coupling_pusch_avst_sink_l1_startofpacket      => CONNECTED_TO_coupling_pusch_avst_sink_l1_startofpacket,      --                                           .startofpacket
			coupling_pusch_avst_sink_l1_endofpacket        => CONNECTED_TO_coupling_pusch_avst_sink_l1_endofpacket,        --                                           .endofpacket
			coupling_pusch_avst_sink_l2_valid              => CONNECTED_TO_coupling_pusch_avst_sink_l2_valid,              --                coupling_pusch_avst_sink_l2.valid
			coupling_pusch_avst_sink_l2_data               => CONNECTED_TO_coupling_pusch_avst_sink_l2_data,               --                                           .data
			coupling_pusch_avst_sink_l2_channel            => CONNECTED_TO_coupling_pusch_avst_sink_l2_channel,            --                                           .channel
			coupling_pusch_avst_sink_l2_startofpacket      => CONNECTED_TO_coupling_pusch_avst_sink_l2_startofpacket,      --                                           .startofpacket
			coupling_pusch_avst_sink_l2_endofpacket        => CONNECTED_TO_coupling_pusch_avst_sink_l2_endofpacket,        --                                           .endofpacket
			coupling_prach_avst_sink_l1_valid              => CONNECTED_TO_coupling_prach_avst_sink_l1_valid,              --                coupling_prach_avst_sink_l1.valid
			coupling_prach_avst_sink_l1_data               => CONNECTED_TO_coupling_prach_avst_sink_l1_data,               --                                           .data
			coupling_prach_avst_sink_l1_channel            => CONNECTED_TO_coupling_prach_avst_sink_l1_channel,            --                                           .channel
			coupling_prach_avst_sink_l1_startofpacket      => CONNECTED_TO_coupling_prach_avst_sink_l1_startofpacket,      --                                           .startofpacket
			coupling_prach_avst_sink_l1_endofpacket        => CONNECTED_TO_coupling_prach_avst_sink_l1_endofpacket,        --                                           .endofpacket
			coupling_prach_avst_sink_l2_valid              => CONNECTED_TO_coupling_prach_avst_sink_l2_valid,              --                coupling_prach_avst_sink_l2.valid
			coupling_prach_avst_sink_l2_data               => CONNECTED_TO_coupling_prach_avst_sink_l2_data,               --                                           .data
			coupling_prach_avst_sink_l2_channel            => CONNECTED_TO_coupling_prach_avst_sink_l2_channel,            --                                           .channel
			coupling_prach_avst_sink_l2_startofpacket      => CONNECTED_TO_coupling_prach_avst_sink_l2_startofpacket,      --                                           .startofpacket
			coupling_prach_avst_sink_l2_endofpacket        => CONNECTED_TO_coupling_prach_avst_sink_l2_endofpacket,        --                                           .endofpacket
			xran_demapper_cplane_source_valid              => CONNECTED_TO_xran_demapper_cplane_source_valid,              --                xran_demapper_cplane_source.valid
			xran_demapper_cplane_source_startofpacket      => CONNECTED_TO_xran_demapper_cplane_source_startofpacket,      --                                           .startofpacket
			xran_demapper_cplane_source_endofpacket        => CONNECTED_TO_xran_demapper_cplane_source_endofpacket,        --                                           .endofpacket
			pb_avst_sink_valid                             => CONNECTED_TO_pb_avst_sink_valid,                             --                               pb_avst_sink.valid
			pb_avst_sink_data                              => CONNECTED_TO_pb_avst_sink_data,                              --                                           .data
			pb_avst_sink_ready                             => CONNECTED_TO_pb_avst_sink_ready,                             --                                           .ready
			bw_confg_cc1_bw_config_cc1                     => CONNECTED_TO_bw_confg_cc1_bw_config_cc1,                     --                               bw_confg_cc1.bw_config_cc1
			bw_confg_cc2_bw_config_cc2                     => CONNECTED_TO_bw_confg_cc2_bw_config_cc2,                     --                               bw_confg_cc2.bw_config_cc2
			radio_config_status_radio_config_status        => CONNECTED_TO_radio_config_status_radio_config_status,        --                        radio_config_status.radio_config_status
			short_long_prach_select_data                   => CONNECTED_TO_short_long_prach_select_data,                   --                    short_long_prach_select.data
			rx_rtc_id_rx_rtc_id                            => CONNECTED_TO_rx_rtc_id_rx_rtc_id,                            --                                  rx_rtc_id.rx_rtc_id
			rx_u_axc_id_rx_u_axc_id                        => CONNECTED_TO_rx_u_axc_id_rx_u_axc_id,                        --                                rx_u_axc_id.rx_u_axc_id
			rx_rtc_id_dl_rx_rtc_id_dl                      => CONNECTED_TO_rx_rtc_id_dl_rx_rtc_id_dl,                      --                               rx_rtc_id_dl.rx_rtc_id_dl
			lphy_ss_ul_sink_l1_valid                       => CONNECTED_TO_lphy_ss_ul_sink_l1_valid,                       --                         lphy_ss_ul_sink_l1.valid
			lphy_ss_ul_sink_l1_data                        => CONNECTED_TO_lphy_ss_ul_sink_l1_data,                        --                                           .data
			lphy_ss_ul_sink_l1_channel                     => CONNECTED_TO_lphy_ss_ul_sink_l1_channel,                     --                                           .channel
			lphy_ss_ul_sink_l2_valid                       => CONNECTED_TO_lphy_ss_ul_sink_l2_valid,                       --                         lphy_ss_ul_sink_l2.valid
			lphy_ss_ul_sink_l2_data                        => CONNECTED_TO_lphy_ss_ul_sink_l2_data,                        --                                           .data
			lphy_ss_ul_sink_l2_channel                     => CONNECTED_TO_lphy_ss_ul_sink_l2_channel,                     --                                           .channel
			rst_soft_n_rst_soft_n                          => CONNECTED_TO_rst_soft_n_rst_soft_n,                          --                                 rst_soft_n.rst_soft_n
			coupling_pusch_timing_ref_data                 => CONNECTED_TO_coupling_pusch_timing_ref_data,                 --                  coupling_pusch_timing_ref.data
			coupling_prach_timing_ref_data                 => CONNECTED_TO_coupling_prach_timing_ref_data,                 --                  coupling_prach_timing_ref.data
			oran_rx_cplane_concat_data                     => CONNECTED_TO_oran_rx_cplane_concat_data,                     --                      oran_rx_cplane_concat.data
			oran_rx_uplane_concat_data                     => CONNECTED_TO_oran_rx_uplane_concat_data,                     --                      oran_rx_uplane_concat.data
			lphy_avst_selctd_cap_intf_valid                => CONNECTED_TO_lphy_avst_selctd_cap_intf_valid,                --                  lphy_avst_selctd_cap_intf.valid
			lphy_avst_selctd_cap_intf_data                 => CONNECTED_TO_lphy_avst_selctd_cap_intf_data,                 --                                           .data
			lphy_avst_selctd_cap_intf_channel              => CONNECTED_TO_lphy_avst_selctd_cap_intf_channel,              --                                           .channel
			ul_start_pulse_latch_data                      => CONNECTED_TO_ul_start_pulse_latch_data,                      --                       ul_start_pulse_latch.data
			frame_status_counter_reset_data                => CONNECTED_TO_frame_status_counter_reset_data,                --                 frame_status_counter_reset.data
			lphy_ss_top_interface_sel_data                 => CONNECTED_TO_lphy_ss_top_interface_sel_data,                 --                  lphy_ss_top_interface_sel.data
			lphy_ss_top_dl_input_hfn_pulse_data            => CONNECTED_TO_lphy_ss_top_dl_input_hfn_pulse_data,            --             lphy_ss_top_dl_input_hfn_pulse.data
			lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1_irq => CONNECTED_TO_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1_irq, -- lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l1.irq
			lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2_irq => CONNECTED_TO_lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2_irq, -- lphy_ss_top_pwr_mtr_ifft_hist_done_intr_l2.irq
			lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1_irq  => CONNECTED_TO_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1_irq,  --  lphy_ss_top_pwr_mtr_fft_hist_done_intr_l1.irq
			lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2_irq  => CONNECTED_TO_lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2_irq,  --  lphy_ss_top_pwr_mtr_fft_hist_done_intr_l2.irq
			lphy_ss_top_duc_ddc_lpbk_en_data               => CONNECTED_TO_lphy_ss_top_duc_ddc_lpbk_en_data,               --                lphy_ss_top_duc_ddc_lpbk_en.data
			reset_csr_reset                                => CONNECTED_TO_reset_csr_reset,                                --                                  reset_csr.reset
			reset_dsp_in_reset_n                           => CONNECTED_TO_reset_dsp_in_reset_n,                           --                               reset_dsp_in.reset_n
			reset_xran_dl_reset_n                          => CONNECTED_TO_reset_xran_dl_reset_n,                          --                              reset_xran_dl.reset_n
			reset_xran_ul_reset_n                          => CONNECTED_TO_reset_xran_ul_reset_n                           --                              reset_xran_ul.reset_n
		);

