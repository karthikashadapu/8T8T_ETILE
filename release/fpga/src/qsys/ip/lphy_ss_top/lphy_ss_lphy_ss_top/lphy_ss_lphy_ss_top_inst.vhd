	component lphy_ss_lphy_ss_top is
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
			LPHY_DSP_CAPTURE_INST   : integer := 8
		);
		port (
			ifft1_busIn_writedata                    : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			ifft1_busIn_address                      : in  std_logic_vector(13 downto 0)                               := (others => 'X'); -- address
			ifft1_busIn_write                        : in  std_logic                                                   := 'X';             -- write
			ifft1_busIn_read                         : in  std_logic                                                   := 'X';             -- read
			ifft1_busOut_readdatavalid               : out std_logic;                                                                      -- readdatavalid
			ifft1_busOut_readdata                    : out std_logic_vector(31 downto 0);                                                  -- readdata
			ifft1_busOut_waitrequest                 : out std_logic;                                                                      -- waitrequest
			ifft2_busIn_writedata                    : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			ifft2_busIn_address                      : in  std_logic_vector(13 downto 0)                               := (others => 'X'); -- address
			ifft2_busIn_write                        : in  std_logic                                                   := 'X';             -- write
			ifft2_busIn_read                         : in  std_logic                                                   := 'X';             -- read
			ifft2_busOut_readdatavalid               : out std_logic;                                                                      -- readdatavalid
			ifft2_busOut_readdata                    : out std_logic_vector(31 downto 0);                                                  -- readdata
			ifft2_busOut_waitrequest                 : out std_logic;                                                                      -- waitrequest
			fft1_busIn_writedata                     : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			fft1_busIn_address                       : in  std_logic_vector(13 downto 0)                               := (others => 'X'); -- address
			fft1_busIn_write                         : in  std_logic                                                   := 'X';             -- write
			fft1_busIn_read                          : in  std_logic                                                   := 'X';             -- read
			fft1_busOut_readdatavalid                : out std_logic;                                                                      -- readdatavalid
			fft1_busOut_readdata                     : out std_logic_vector(31 downto 0);                                                  -- readdata
			fft1_busOut_waitrequest                  : out std_logic;                                                                      -- waitrequest
			fft2_busIn_writedata                     : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			fft2_busIn_address                       : in  std_logic_vector(13 downto 0)                               := (others => 'X'); -- address
			fft2_busIn_write                         : in  std_logic                                                   := 'X';             -- write
			fft2_busIn_read                          : in  std_logic                                                   := 'X';             -- read
			fft2_busOut_readdatavalid                : out std_logic;                                                                      -- readdatavalid
			fft2_busOut_readdata                     : out std_logic_vector(31 downto 0);                                                  -- readdata
			fft2_busOut_waitrequest                  : out std_logic;                                                                      -- waitrequest
			pb_ddr_csr_address                       : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- address
			pb_ddr_csr_write                         : in  std_logic                                                   := 'X';             -- write
			pb_ddr_csr_writedata                     : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pb_ddr_csr_readdata                      : out std_logic_vector(31 downto 0);                                                  -- readdata
			pb_mm_bridge_address                     : in  std_logic_vector(16 downto 0)                               := (others => 'X'); -- address
			pb_mm_bridge_chipselect                  : in  std_logic                                                   := 'X';             -- chipselect
			pb_mm_bridge_read                        : in  std_logic                                                   := 'X';             -- read
			pb_mm_bridge_readdata                    : out std_logic_vector(31 downto 0);                                                  -- readdata
			pb_mm_bridge_write                       : in  std_logic                                                   := 'X';             -- write
			pb_mm_bridge_writedata                   : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pb_mm_bridge_byteenable                  : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pb_mm_bridge_waitrequest                 : out std_logic;                                                                      -- waitrequest
			lphy_ss_config_csr_address               : in  std_logic_vector(7 downto 0)                                := (others => 'X'); -- address
			lphy_ss_config_csr_write                 : in  std_logic                                                   := 'X';             -- write
			lphy_ss_config_csr_writedata             : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			lphy_ss_config_csr_readdata              : out std_logic_vector(31 downto 0);                                                  -- readdata
			lphy_ss_config_csr_read                  : in  std_logic                                                   := 'X';             -- read
			lphy_ss_config_csr_waitrequest           : out std_logic;                                                                      -- waitrequest
			lphy_ss_config_csr_readdatavalid         : out std_logic;                                                                      -- readdatavalid
			long_prach_lw_bridge_address_l2          : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- address
			long_prach_lw_bridge_write_l2            : in  std_logic                                                   := 'X';             -- write
			long_prach_lw_bridge_readdata_l2         : out std_logic_vector(31 downto 0);                                                  -- readdata
			long_prach_lw_bridge_writedata_l2        : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			long_prach_lw_bridge_waitrequest_l2      : out std_logic;                                                                      -- waitrequest
			long_prach_lw_bridge_readdatavalid_l2    : out std_logic;                                                                      -- readdatavalid
			long_prach_lw_bridge_read_l2             : in  std_logic                                                   := 'X';             -- read
			long_prach_lw_bridge_address_l1          : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- address
			long_prach_lw_bridge_write_l1            : in  std_logic                                                   := 'X';             -- write
			long_prach_lw_bridge_readdata_l1         : out std_logic_vector(31 downto 0);                                                  -- readdata
			long_prach_lw_bridge_writedata_l1        : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			long_prach_lw_bridge_waitrequest_l1      : out std_logic;                                                                      -- waitrequest
			long_prach_lw_bridge_readdatavalid_l1    : out std_logic;                                                                      -- readdatavalid
			long_prach_lw_bridge_read_l1             : in  std_logic                                                   := 'X';             -- read
			short_prach2_busIn_writedata             : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			short_prach2_busIn_address               : in  std_logic_vector(9 downto 0)                                := (others => 'X'); -- address
			short_prach2_busIn_write                 : in  std_logic                                                   := 'X';             -- write
			short_prach2_busIn_read                  : in  std_logic                                                   := 'X';             -- read
			short_prach2_busOut_readdatavalid        : out std_logic;                                                                      -- readdatavalid
			short_prach2_busOut_readdata             : out std_logic_vector(31 downto 0);                                                  -- readdata
			short_prach2_busOut_waitrequest          : out std_logic;                                                                      -- waitrequest
			short_prach1_busIn_writedata             : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			short_prach1_busIn_address               : in  std_logic_vector(9 downto 0)                                := (others => 'X'); -- address
			short_prach1_busIn_write                 : in  std_logic                                                   := 'X';             -- write
			short_prach1_busIn_read                  : in  std_logic                                                   := 'X';             -- read
			short_prach1_busOut_readdatavalid        : out std_logic;                                                                      -- readdatavalid
			short_prach1_busOut_readdata             : out std_logic_vector(31 downto 0);                                                  -- readdata
			short_prach1_busOut_waitrequest          : out std_logic;                                                                      -- waitrequest
			clk_dsp                                  : in  std_logic                                                   := 'X';             -- clk
			clk_csr                                  : in  std_logic                                                   := 'X';             -- clk
			clk_eth_xran_dl                          : in  std_logic                                                   := 'X';             -- clk
			clk_eth_xran_ul                          : in  std_logic                                                   := 'X';             -- clk
			rst_dsp_n                                : in  std_logic                                                   := 'X';             -- reset_n
			rst_csr_n                                : in  std_logic                                                   := 'X';             -- reset_n
			rst_eth_xran_n_dl                        : in  std_logic                                                   := 'X';             -- reset_n
			rst_eth_xran_n_ul                        : in  std_logic                                                   := 'X';             -- reset_n
			xran_demapper_source_valid               : in  std_logic                                                   := 'X';             -- valid
			xran_demapper_source_data                : in  std_logic_vector((((XRAN_ETH_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- data
			xran_demapper_source_endofpacket         : in  std_logic                                                   := 'X';             -- endofpacket
			xran_demapper_source_startofpacket       : in  std_logic                                                   := 'X';             -- startofpacket
			xran_demapper_source_ready               : out std_logic;                                                                      -- ready
			xran_demapper_source_channel             : in  std_logic_vector(15 downto 0)                               := (others => 'X'); -- channel
			ifft_source_valid1                       : out std_logic;                                                                      -- valid
			ifft_source_data1                        : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                          -- data
			ifft_source_channel1                     : out std_logic_vector(7 downto 0);                                                   -- channel
			ifft_source_valid2                       : out std_logic;                                                                      -- valid
			ifft_source_data2                        : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                          -- data
			ifft_source_channel2                     : out std_logic_vector(7 downto 0);                                                   -- channel
			coupling_pusch_avst_sink_valid_l1        : out std_logic;                                                                      -- valid
			coupling_pusch_avst_sink_data_l1         : out std_logic_vector(31 downto 0);                                                  -- data
			coupling_pusch_avst_sink_channel_l1      : out std_logic_vector(15 downto 0);                                                  -- channel
			coupling_pusch_avst_sink_sop_l1          : out std_logic;                                                                      -- startofpacket
			coupling_pusch_avst_sink_eop_l1          : out std_logic;                                                                      -- endofpacket
			coupling_pusch_avst_sink_valid_l2        : out std_logic;                                                                      -- valid
			coupling_pusch_avst_sink_data_l2         : out std_logic_vector(31 downto 0);                                                  -- data
			coupling_pusch_avst_sink_channel_l2      : out std_logic_vector(15 downto 0);                                                  -- channel
			coupling_pusch_avst_sink_sop_l2          : out std_logic;                                                                      -- startofpacket
			coupling_pusch_avst_sink_eop_l2          : out std_logic;                                                                      -- endofpacket
			coupling_prach_avst_sink_valid_l1        : out std_logic;                                                                      -- valid
			coupling_prach_avst_sink_data_l1         : out std_logic_vector(31 downto 0);                                                  -- data
			coupling_prach_avst_sink_channel_l1      : out std_logic_vector(15 downto 0);                                                  -- channel
			coupling_prach_avst_sink_sop_l1          : out std_logic;                                                                      -- startofpacket
			coupling_prach_avst_sink_eop_l1          : out std_logic;                                                                      -- endofpacket
			coupling_prach_avst_sink_valid_l2        : out std_logic;                                                                      -- valid
			coupling_prach_avst_sink_data_l2         : out std_logic_vector(31 downto 0);                                                  -- data
			coupling_prach_avst_sink_channel_l2      : out std_logic_vector(15 downto 0);                                                  -- channel
			coupling_prach_avst_sink_sop_l2          : out std_logic;                                                                      -- startofpacket
			coupling_prach_avst_sink_eop_l2          : out std_logic;                                                                      -- endofpacket
			xran_demapper_cplane_valid               : in  std_logic                                                   := 'X';             -- valid
			xran_demapper_cplane_startofpacket       : in  std_logic                                                   := 'X';             -- startofpacket
			xran_demapper_cplane_endofpacket         : in  std_logic                                                   := 'X';             -- endofpacket
			pb_avst_sink_valid                       : in  std_logic                                                   := 'X';             -- valid
			pb_avst_sink_data                        : in  std_logic_vector(63 downto 0)                               := (others => 'X'); -- data
			pb_avst_sink_ready                       : out std_logic;                                                                      -- ready
			bw_config_cc1                            : out std_logic_vector(7 downto 0);                                                   -- bw_config_cc1
			bw_config_cc2                            : out std_logic_vector(7 downto 0);                                                   -- bw_config_cc2
			radio_config_status                      : out std_logic_vector(55 downto 0);                                                  -- radio_config_status
			short_long_prach_select                  : out std_logic;                                                                      -- data
			rx_rtc_id                                : in  std_logic_vector(15 downto 0)                               := (others => 'X'); -- rx_rtc_id
			rx_u_axc_id                              : in  std_logic_vector(15 downto 0)                               := (others => 'X'); -- rx_u_axc_id
			rx_rtc_id_dl                             : in  std_logic_vector(15 downto 0)                               := (others => 'X'); -- rx_rtc_id_dl
			lphy_ss_ul_sink_valid1                   : in  std_logic                                                   := 'X';             -- valid
			lphy_ss_ul_sink_data1                    : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0)       := (others => 'X'); -- data
			lphy_ss_ul_sink_channel1                 : in  std_logic_vector(7 downto 0)                                := (others => 'X'); -- channel
			lphy_ss_ul_sink_valid2                   : in  std_logic                                                   := 'X';             -- valid
			lphy_ss_ul_sink_data2                    : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0)       := (others => 'X'); -- data
			lphy_ss_ul_sink_channel2                 : in  std_logic_vector(7 downto 0)                                := (others => 'X'); -- channel
			rst_soft_n                               : out std_logic;                                                                      -- rst_soft_n
			coupling_pusch_timing_ref                : out std_logic_vector(31 downto 0);                                                  -- data
			coupling_prach_timing_ref                : out std_logic_vector(31 downto 0);                                                  -- data
			oran_rx_cplane_concat                    : in  std_logic_vector(189 downto 0)                              := (others => 'X'); -- data
			oran_rx_uplane_concat                    : in  std_logic_vector(67 downto 0)                               := (others => 'X'); -- data
			lphy_avst_selctd_cap_intf_valid          : out std_logic;                                                                      -- valid
			lphy_avst_selctd_cap_intf_data           : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                          -- data
			lphy_avst_selctd_cap_intf_chan           : out std_logic_vector(2 downto 0);                                                   -- channel
			ul_start_pulse_latch                     : out std_logic;                                                                      -- data
			frame_status_counter_reset               : in  std_logic                                                   := 'X';             -- data
			interface_sel                            : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- data
			dl_input_hfn_pulse                       : out std_logic;                                                                      -- data
			pm_ifft_threash_mm_bridge_address_l1     : in  std_logic_vector(5 downto 0)                                := (others => 'X'); -- address
			pm_ifft_threash_mm_bridge_chipselect_l1  : in  std_logic                                                   := 'X';             -- chipselect
			pm_ifft_threash_mm_bridge_read_l1        : in  std_logic                                                   := 'X';             -- read
			pm_ifft_threash_mm_bridge_write_l1       : in  std_logic                                                   := 'X';             -- write
			pm_ifft_threash_mm_bridge_writedata_l1   : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_ifft_threash_mm_bridge_byteenable_l1  : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_ifft_threash_mm_bridge_readdata_l1    : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_ifft_threash_mm_bridge_waitrequest_l1 : out std_logic;                                                                      -- waitrequest
			pwr_mtr_ifft_hist_done_intr_l1           : out std_logic;                                                                      -- irq
			pwr_mtr_ifft_hist_done_intr_l2           : out std_logic;                                                                      -- irq
			pm_ifft_threash_mm_bridge_address_l2     : in  std_logic_vector(5 downto 0)                                := (others => 'X'); -- address
			pm_ifft_threash_mm_bridge_chipselect_l2  : in  std_logic                                                   := 'X';             -- chipselect
			pm_ifft_threash_mm_bridge_read_l2        : in  std_logic                                                   := 'X';             -- read
			pm_ifft_threash_mm_bridge_write_l2       : in  std_logic                                                   := 'X';             -- write
			pm_ifft_threash_mm_bridge_writedata_l2   : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_ifft_threash_mm_bridge_byteenable_l2  : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_ifft_threash_mm_bridge_readdata_l2    : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_ifft_threash_mm_bridge_waitrequest_l2 : out std_logic;                                                                      -- waitrequest
			pwr_mtr_ifft_config_csr_writedata_l1     : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pwr_mtr_ifft_config_csr_read_l1          : in  std_logic                                                   := 'X';             -- read
			pwr_mtr_ifft_config_csr_write_l1         : in  std_logic                                                   := 'X';             -- write
			pwr_mtr_ifft_config_csr_readdata_l1      : out std_logic_vector(31 downto 0);                                                  -- readdata
			pwr_mtr_ifft_config_csr_readdatavalid_l1 : out std_logic;                                                                      -- readdatavalid
			pwr_mtr_ifft_config_csr_address_l1       : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- address
			pwr_mtr_ifft_config_csr_waitrequest_l1   : out std_logic;                                                                      -- waitrequest
			pwr_mtr_ifft_config_csr_writedata_l2     : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pwr_mtr_ifft_config_csr_read_l2          : in  std_logic                                                   := 'X';             -- read
			pwr_mtr_ifft_config_csr_write_l2         : in  std_logic                                                   := 'X';             -- write
			pwr_mtr_ifft_config_csr_readdata_l2      : out std_logic_vector(31 downto 0);                                                  -- readdata
			pwr_mtr_ifft_config_csr_readdatavalid_l2 : out std_logic;                                                                      -- readdatavalid
			pwr_mtr_ifft_config_csr_address_l2       : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- address
			pwr_mtr_ifft_config_csr_waitrequest_l2   : out std_logic;                                                                      -- waitrequest
			pm_ifft_hist_mm_bridge_address_l1        : in  std_logic_vector(11 downto 0)                               := (others => 'X'); -- address
			pm_ifft_hist_mm_bridge_chipselect_l1     : in  std_logic                                                   := 'X';             -- chipselect
			pm_ifft_hist_mm_bridge_read_l1           : in  std_logic                                                   := 'X';             -- read
			pm_ifft_hist_mm_bridge_write_l1          : in  std_logic                                                   := 'X';             -- write
			pm_ifft_hist_mm_bridge_writedata_l1      : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_ifft_hist_mm_bridge_byteenable_l1     : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_ifft_hist_mm_bridge_readdata_l1       : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_ifft_hist_mm_bridge_readdatavalid_l1  : out std_logic;                                                                      -- readdatavalid
			pm_ifft_hist_mm_bridge_waitrequest_l1    : out std_logic;                                                                      -- waitrequest
			pm_ifft_hist_mm_bridge_address_l2        : in  std_logic_vector(11 downto 0)                               := (others => 'X'); -- address
			pm_ifft_hist_mm_bridge_chipselect_l2     : in  std_logic                                                   := 'X';             -- chipselect
			pm_ifft_hist_mm_bridge_read_l2           : in  std_logic                                                   := 'X';             -- read
			pm_ifft_hist_mm_bridge_write_l2          : in  std_logic                                                   := 'X';             -- write
			pm_ifft_hist_mm_bridge_writedata_l2      : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_ifft_hist_mm_bridge_byteenable_l2     : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_ifft_hist_mm_bridge_readdata_l2       : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_ifft_hist_mm_bridge_readdatavalid_l2  : out std_logic;                                                                      -- readdatavalid
			pm_ifft_hist_mm_bridge_waitrequest_l2    : out std_logic;                                                                      -- waitrequest
			pwr_mtr_fft_hist_done_intr_l1            : out std_logic;                                                                      -- irq
			pwr_mtr_fft_hist_done_intr_l2            : out std_logic;                                                                      -- irq
			duc_ddc_lpbk_en                          : out std_logic;                                                                      -- data
			pm_fft_threash_mm_bridge_address_l1      : in  std_logic_vector(5 downto 0)                                := (others => 'X'); -- address
			pm_fft_threash_mm_bridge_chipselect_l1   : in  std_logic                                                   := 'X';             -- chipselect
			pm_fft_threash_mm_bridge_read_l1         : in  std_logic                                                   := 'X';             -- read
			pm_fft_threash_mm_bridge_write_l1        : in  std_logic                                                   := 'X';             -- write
			pm_fft_threash_mm_bridge_writedata_l1    : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_fft_threash_mm_bridge_byteenable_l1   : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_fft_threash_mm_bridge_readdata_l1     : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_fft_threash_mm_bridge_waitrequest_l1  : out std_logic;                                                                      -- waitrequest
			pm_fft_threash_mm_bridge_address_l2      : in  std_logic_vector(5 downto 0)                                := (others => 'X'); -- address
			pm_fft_threash_mm_bridge_chipselect_l2   : in  std_logic                                                   := 'X';             -- chipselect
			pm_fft_threash_mm_bridge_read_l2         : in  std_logic                                                   := 'X';             -- read
			pm_fft_threash_mm_bridge_write_l2        : in  std_logic                                                   := 'X';             -- write
			pm_fft_threash_mm_bridge_writedata_l2    : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_fft_threash_mm_bridge_byteenable_l2   : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_fft_threash_mm_bridge_readdata_l2     : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_fft_threash_mm_bridge_waitrequest_l2  : out std_logic;                                                                      -- waitrequest
			pwr_mtr_fft_config_csr_writedata_l1      : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pwr_mtr_fft_config_csr_read_l1           : in  std_logic                                                   := 'X';             -- read
			pwr_mtr_fft_config_csr_write_l1          : in  std_logic                                                   := 'X';             -- write
			pwr_mtr_fft_config_csr_readdata_l1       : out std_logic_vector(31 downto 0);                                                  -- readdata
			pwr_mtr_fft_config_csr_readdatavalid_l1  : out std_logic;                                                                      -- readdatavalid
			pwr_mtr_fft_config_csr_address_l1        : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- address
			pwr_mtr_fft_config_csr_waitrequest_l1    : out std_logic;                                                                      -- waitrequest
			pwr_mtr_fft_config_csr_writedata_l2      : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pwr_mtr_fft_config_csr_read_l2           : in  std_logic                                                   := 'X';             -- read
			pwr_mtr_fft_config_csr_write_l2          : in  std_logic                                                   := 'X';             -- write
			pwr_mtr_fft_config_csr_readdata_l2       : out std_logic_vector(31 downto 0);                                                  -- readdata
			pwr_mtr_fft_config_csr_readdatavalid_l2  : out std_logic;                                                                      -- readdatavalid
			pwr_mtr_fft_config_csr_address_l2        : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- address
			pwr_mtr_fft_config_csr_waitrequest_l2    : out std_logic;                                                                      -- waitrequest
			pm_fft_hist_mm_bridge_address_l1         : in  std_logic_vector(11 downto 0)                               := (others => 'X'); -- address
			pm_fft_hist_mm_bridge_chipselect_l1      : in  std_logic                                                   := 'X';             -- chipselect
			pm_fft_hist_mm_bridge_read_l1            : in  std_logic                                                   := 'X';             -- read
			pm_fft_hist_mm_bridge_write_l1           : in  std_logic                                                   := 'X';             -- write
			pm_fft_hist_mm_bridge_writedata_l1       : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_fft_hist_mm_bridge_byteenable_l1      : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_fft_hist_mm_bridge_readdata_l1        : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_fft_hist_mm_bridge_readdatavalid_l1   : out std_logic;                                                                      -- readdatavalid
			pm_fft_hist_mm_bridge_waitrequest_l1     : out std_logic;                                                                      -- waitrequest
			pm_fft_hist_mm_bridge_address_l2         : in  std_logic_vector(11 downto 0)                               := (others => 'X'); -- address
			pm_fft_hist_mm_bridge_chipselect_l2      : in  std_logic                                                   := 'X';             -- chipselect
			pm_fft_hist_mm_bridge_read_l2            : in  std_logic                                                   := 'X';             -- read
			pm_fft_hist_mm_bridge_write_l2           : in  std_logic                                                   := 'X';             -- write
			pm_fft_hist_mm_bridge_writedata_l2       : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_fft_hist_mm_bridge_byteenable_l2      : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_fft_hist_mm_bridge_readdata_l2        : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_fft_hist_mm_bridge_readdatavalid_l2   : out std_logic;                                                                      -- readdatavalid
			pm_fft_hist_mm_bridge_waitrequest_l2     : out std_logic;                                                                      -- waitrequest
			pm_stat_ifft_mm_bridge_address_l1        : in  std_logic_vector(9 downto 0)                                := (others => 'X'); -- address
			pm_stat_ifft_mm_bridge_chipselect_l1     : in  std_logic                                                   := 'X';             -- chipselect
			pm_stat_ifft_mm_bridge_read_l1           : in  std_logic                                                   := 'X';             -- read
			pm_stat_ifft_mm_bridge_write_l1          : in  std_logic                                                   := 'X';             -- write
			pm_stat_ifft_mm_bridge_writedata_l1      : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_stat_ifft_mm_bridge_byteenable_l1     : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_stat_ifft_mm_bridge_readdata_l1       : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_stat_ifft_mm_bridge_readdatavalid_l1  : out std_logic;                                                                      -- readdatavalid
			pm_stat_ifft_mm_bridge_waitrequest_l1    : out std_logic;                                                                      -- waitrequest
			pm_stat_ifft_mm_bridge_address_l2        : in  std_logic_vector(9 downto 0)                                := (others => 'X'); -- address
			pm_stat_ifft_mm_bridge_chipselect_l2     : in  std_logic                                                   := 'X';             -- chipselect
			pm_stat_ifft_mm_bridge_read_l2           : in  std_logic                                                   := 'X';             -- read
			pm_stat_ifft_mm_bridge_write_l2          : in  std_logic                                                   := 'X';             -- write
			pm_stat_ifft_mm_bridge_writedata_l2      : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_stat_ifft_mm_bridge_byteenable_l2     : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_stat_ifft_mm_bridge_readdata_l2       : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_stat_ifft_mm_bridge_readdatavalid_l2  : out std_logic;                                                                      -- readdatavalid
			pm_stat_ifft_mm_bridge_waitrequest_l2    : out std_logic;                                                                      -- waitrequest
			pm_stat_fft_mm_bridge_address_l1         : in  std_logic_vector(9 downto 0)                                := (others => 'X'); -- address
			pm_stat_fft_mm_bridge_chipselect_l1      : in  std_logic                                                   := 'X';             -- chipselect
			pm_stat_fft_mm_bridge_read_l1            : in  std_logic                                                   := 'X';             -- read
			pm_stat_fft_mm_bridge_write_l1           : in  std_logic                                                   := 'X';             -- write
			pm_stat_fft_mm_bridge_writedata_l1       : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_stat_fft_mm_bridge_byteenable_l1      : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_stat_fft_mm_bridge_readdata_l1        : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_stat_fft_mm_bridge_readdatavalid_l1   : out std_logic;                                                                      -- readdatavalid
			pm_stat_fft_mm_bridge_waitrequest_l1     : out std_logic;                                                                      -- waitrequest
			pm_stat_fft_mm_bridge_address_l2         : in  std_logic_vector(9 downto 0)                                := (others => 'X'); -- address
			pm_stat_fft_mm_bridge_chipselect_l2      : in  std_logic                                                   := 'X';             -- chipselect
			pm_stat_fft_mm_bridge_read_l2            : in  std_logic                                                   := 'X';             -- read
			pm_stat_fft_mm_bridge_write_l2           : in  std_logic                                                   := 'X';             -- write
			pm_stat_fft_mm_bridge_writedata_l2       : in  std_logic_vector(31 downto 0)                               := (others => 'X'); -- writedata
			pm_stat_fft_mm_bridge_byteenable_l2      : in  std_logic_vector(3 downto 0)                                := (others => 'X'); -- byteenable
			pm_stat_fft_mm_bridge_readdata_l2        : out std_logic_vector(31 downto 0);                                                  -- readdata
			pm_stat_fft_mm_bridge_readdatavalid_l2   : out std_logic;                                                                      -- readdatavalid
			pm_stat_fft_mm_bridge_waitrequest_l2     : out std_logic                                                                       -- waitrequest
		);
	end component lphy_ss_lphy_ss_top;

	u0 : component lphy_ss_lphy_ss_top
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
			LPHY_DSP_CAPTURE_INST   => INTEGER_VALUE_FOR_LPHY_DSP_CAPTURE_INST
		)
		port map (
			ifft1_busIn_writedata                    => CONNECTED_TO_ifft1_busIn_writedata,                    --                    ifft1_busin.writedata
			ifft1_busIn_address                      => CONNECTED_TO_ifft1_busIn_address,                      --                               .address
			ifft1_busIn_write                        => CONNECTED_TO_ifft1_busIn_write,                        --                               .write
			ifft1_busIn_read                         => CONNECTED_TO_ifft1_busIn_read,                         --                               .read
			ifft1_busOut_readdatavalid               => CONNECTED_TO_ifft1_busOut_readdatavalid,               --                               .readdatavalid
			ifft1_busOut_readdata                    => CONNECTED_TO_ifft1_busOut_readdata,                    --                               .readdata
			ifft1_busOut_waitrequest                 => CONNECTED_TO_ifft1_busOut_waitrequest,                 --                               .waitrequest
			ifft2_busIn_writedata                    => CONNECTED_TO_ifft2_busIn_writedata,                    --                    ifft2_busin.writedata
			ifft2_busIn_address                      => CONNECTED_TO_ifft2_busIn_address,                      --                               .address
			ifft2_busIn_write                        => CONNECTED_TO_ifft2_busIn_write,                        --                               .write
			ifft2_busIn_read                         => CONNECTED_TO_ifft2_busIn_read,                         --                               .read
			ifft2_busOut_readdatavalid               => CONNECTED_TO_ifft2_busOut_readdatavalid,               --                               .readdatavalid
			ifft2_busOut_readdata                    => CONNECTED_TO_ifft2_busOut_readdata,                    --                               .readdata
			ifft2_busOut_waitrequest                 => CONNECTED_TO_ifft2_busOut_waitrequest,                 --                               .waitrequest
			fft1_busIn_writedata                     => CONNECTED_TO_fft1_busIn_writedata,                     --                     fft1_busin.writedata
			fft1_busIn_address                       => CONNECTED_TO_fft1_busIn_address,                       --                               .address
			fft1_busIn_write                         => CONNECTED_TO_fft1_busIn_write,                         --                               .write
			fft1_busIn_read                          => CONNECTED_TO_fft1_busIn_read,                          --                               .read
			fft1_busOut_readdatavalid                => CONNECTED_TO_fft1_busOut_readdatavalid,                --                               .readdatavalid
			fft1_busOut_readdata                     => CONNECTED_TO_fft1_busOut_readdata,                     --                               .readdata
			fft1_busOut_waitrequest                  => CONNECTED_TO_fft1_busOut_waitrequest,                  --                               .waitrequest
			fft2_busIn_writedata                     => CONNECTED_TO_fft2_busIn_writedata,                     --                     fft2_busin.writedata
			fft2_busIn_address                       => CONNECTED_TO_fft2_busIn_address,                       --                               .address
			fft2_busIn_write                         => CONNECTED_TO_fft2_busIn_write,                         --                               .write
			fft2_busIn_read                          => CONNECTED_TO_fft2_busIn_read,                          --                               .read
			fft2_busOut_readdatavalid                => CONNECTED_TO_fft2_busOut_readdatavalid,                --                               .readdatavalid
			fft2_busOut_readdata                     => CONNECTED_TO_fft2_busOut_readdata,                     --                               .readdata
			fft2_busOut_waitrequest                  => CONNECTED_TO_fft2_busOut_waitrequest,                  --                               .waitrequest
			pb_ddr_csr_address                       => CONNECTED_TO_pb_ddr_csr_address,                       --                     pb_ddr_csr.address
			pb_ddr_csr_write                         => CONNECTED_TO_pb_ddr_csr_write,                         --                               .write
			pb_ddr_csr_writedata                     => CONNECTED_TO_pb_ddr_csr_writedata,                     --                               .writedata
			pb_ddr_csr_readdata                      => CONNECTED_TO_pb_ddr_csr_readdata,                      --                               .readdata
			pb_mm_bridge_address                     => CONNECTED_TO_pb_mm_bridge_address,                     --                   pb_mm_bridge.address
			pb_mm_bridge_chipselect                  => CONNECTED_TO_pb_mm_bridge_chipselect,                  --                               .chipselect
			pb_mm_bridge_read                        => CONNECTED_TO_pb_mm_bridge_read,                        --                               .read
			pb_mm_bridge_readdata                    => CONNECTED_TO_pb_mm_bridge_readdata,                    --                               .readdata
			pb_mm_bridge_write                       => CONNECTED_TO_pb_mm_bridge_write,                       --                               .write
			pb_mm_bridge_writedata                   => CONNECTED_TO_pb_mm_bridge_writedata,                   --                               .writedata
			pb_mm_bridge_byteenable                  => CONNECTED_TO_pb_mm_bridge_byteenable,                  --                               .byteenable
			pb_mm_bridge_waitrequest                 => CONNECTED_TO_pb_mm_bridge_waitrequest,                 --                               .waitrequest
			lphy_ss_config_csr_address               => CONNECTED_TO_lphy_ss_config_csr_address,               --             lphy_ss_config_csr.address
			lphy_ss_config_csr_write                 => CONNECTED_TO_lphy_ss_config_csr_write,                 --                               .write
			lphy_ss_config_csr_writedata             => CONNECTED_TO_lphy_ss_config_csr_writedata,             --                               .writedata
			lphy_ss_config_csr_readdata              => CONNECTED_TO_lphy_ss_config_csr_readdata,              --                               .readdata
			lphy_ss_config_csr_read                  => CONNECTED_TO_lphy_ss_config_csr_read,                  --                               .read
			lphy_ss_config_csr_waitrequest           => CONNECTED_TO_lphy_ss_config_csr_waitrequest,           --                               .waitrequest
			lphy_ss_config_csr_readdatavalid         => CONNECTED_TO_lphy_ss_config_csr_readdatavalid,         --                               .readdatavalid
			long_prach_lw_bridge_address_l2          => CONNECTED_TO_long_prach_lw_bridge_address_l2,          --        long_prach_lw_bridge_l2.address
			long_prach_lw_bridge_write_l2            => CONNECTED_TO_long_prach_lw_bridge_write_l2,            --                               .write
			long_prach_lw_bridge_readdata_l2         => CONNECTED_TO_long_prach_lw_bridge_readdata_l2,         --                               .readdata
			long_prach_lw_bridge_writedata_l2        => CONNECTED_TO_long_prach_lw_bridge_writedata_l2,        --                               .writedata
			long_prach_lw_bridge_waitrequest_l2      => CONNECTED_TO_long_prach_lw_bridge_waitrequest_l2,      --                               .waitrequest
			long_prach_lw_bridge_readdatavalid_l2    => CONNECTED_TO_long_prach_lw_bridge_readdatavalid_l2,    --                               .readdatavalid
			long_prach_lw_bridge_read_l2             => CONNECTED_TO_long_prach_lw_bridge_read_l2,             --                               .read
			long_prach_lw_bridge_address_l1          => CONNECTED_TO_long_prach_lw_bridge_address_l1,          --        long_prach_lw_bridge_l1.address
			long_prach_lw_bridge_write_l1            => CONNECTED_TO_long_prach_lw_bridge_write_l1,            --                               .write
			long_prach_lw_bridge_readdata_l1         => CONNECTED_TO_long_prach_lw_bridge_readdata_l1,         --                               .readdata
			long_prach_lw_bridge_writedata_l1        => CONNECTED_TO_long_prach_lw_bridge_writedata_l1,        --                               .writedata
			long_prach_lw_bridge_waitrequest_l1      => CONNECTED_TO_long_prach_lw_bridge_waitrequest_l1,      --                               .waitrequest
			long_prach_lw_bridge_readdatavalid_l1    => CONNECTED_TO_long_prach_lw_bridge_readdatavalid_l1,    --                               .readdatavalid
			long_prach_lw_bridge_read_l1             => CONNECTED_TO_long_prach_lw_bridge_read_l1,             --                               .read
			short_prach2_busIn_writedata             => CONNECTED_TO_short_prach2_busIn_writedata,             --       short_prach_lw_bridge_l2.writedata
			short_prach2_busIn_address               => CONNECTED_TO_short_prach2_busIn_address,               --                               .address
			short_prach2_busIn_write                 => CONNECTED_TO_short_prach2_busIn_write,                 --                               .write
			short_prach2_busIn_read                  => CONNECTED_TO_short_prach2_busIn_read,                  --                               .read
			short_prach2_busOut_readdatavalid        => CONNECTED_TO_short_prach2_busOut_readdatavalid,        --                               .readdatavalid
			short_prach2_busOut_readdata             => CONNECTED_TO_short_prach2_busOut_readdata,             --                               .readdata
			short_prach2_busOut_waitrequest          => CONNECTED_TO_short_prach2_busOut_waitrequest,          --                               .waitrequest
			short_prach1_busIn_writedata             => CONNECTED_TO_short_prach1_busIn_writedata,             --       short_prach_lw_bridge_l1.writedata
			short_prach1_busIn_address               => CONNECTED_TO_short_prach1_busIn_address,               --                               .address
			short_prach1_busIn_write                 => CONNECTED_TO_short_prach1_busIn_write,                 --                               .write
			short_prach1_busIn_read                  => CONNECTED_TO_short_prach1_busIn_read,                  --                               .read
			short_prach1_busOut_readdatavalid        => CONNECTED_TO_short_prach1_busOut_readdatavalid,        --                               .readdatavalid
			short_prach1_busOut_readdata             => CONNECTED_TO_short_prach1_busOut_readdata,             --                               .readdata
			short_prach1_busOut_waitrequest          => CONNECTED_TO_short_prach1_busOut_waitrequest,          --                               .waitrequest
			clk_dsp                                  => CONNECTED_TO_clk_dsp,                                  --                      clock_dsp.clk
			clk_csr                                  => CONNECTED_TO_clk_csr,                                  --                      clock_csr.clk
			clk_eth_xran_dl                          => CONNECTED_TO_clk_eth_xran_dl,                          --              clock_eth_xran_dl.clk
			clk_eth_xran_ul                          => CONNECTED_TO_clk_eth_xran_ul,                          --              clock_eth_xran_ul.clk
			rst_dsp_n                                => CONNECTED_TO_rst_dsp_n,                                --                    reset_dsp_n.reset_n
			rst_csr_n                                => CONNECTED_TO_rst_csr_n,                                --                    reset_csr_n.reset_n
			rst_eth_xran_n_dl                        => CONNECTED_TO_rst_eth_xran_n_dl,                        --            reset_eth_xran_dl_n.reset_n
			rst_eth_xran_n_ul                        => CONNECTED_TO_rst_eth_xran_n_ul,                        --            reset_eth_xran_ul_n.reset_n
			xran_demapper_source_valid               => CONNECTED_TO_xran_demapper_source_valid,               --           xran_demapper_source.valid
			xran_demapper_source_data                => CONNECTED_TO_xran_demapper_source_data,                --                               .data
			xran_demapper_source_endofpacket         => CONNECTED_TO_xran_demapper_source_endofpacket,         --                               .endofpacket
			xran_demapper_source_startofpacket       => CONNECTED_TO_xran_demapper_source_startofpacket,       --                               .startofpacket
			xran_demapper_source_ready               => CONNECTED_TO_xran_demapper_source_ready,               --                               .ready
			xran_demapper_source_channel             => CONNECTED_TO_xran_demapper_source_channel,             --                               .channel
			ifft_source_valid1                       => CONNECTED_TO_ifft_source_valid1,                       --                 ifft_source_l1.valid
			ifft_source_data1                        => CONNECTED_TO_ifft_source_data1,                        --                               .data
			ifft_source_channel1                     => CONNECTED_TO_ifft_source_channel1,                     --                               .channel
			ifft_source_valid2                       => CONNECTED_TO_ifft_source_valid2,                       --                 ifft_source_l2.valid
			ifft_source_data2                        => CONNECTED_TO_ifft_source_data2,                        --                               .data
			ifft_source_channel2                     => CONNECTED_TO_ifft_source_channel2,                     --                               .channel
			coupling_pusch_avst_sink_valid_l1        => CONNECTED_TO_coupling_pusch_avst_sink_valid_l1,        --    coupling_pusch_avst_sink_l1.valid
			coupling_pusch_avst_sink_data_l1         => CONNECTED_TO_coupling_pusch_avst_sink_data_l1,         --                               .data
			coupling_pusch_avst_sink_channel_l1      => CONNECTED_TO_coupling_pusch_avst_sink_channel_l1,      --                               .channel
			coupling_pusch_avst_sink_sop_l1          => CONNECTED_TO_coupling_pusch_avst_sink_sop_l1,          --                               .startofpacket
			coupling_pusch_avst_sink_eop_l1          => CONNECTED_TO_coupling_pusch_avst_sink_eop_l1,          --                               .endofpacket
			coupling_pusch_avst_sink_valid_l2        => CONNECTED_TO_coupling_pusch_avst_sink_valid_l2,        --    coupling_pusch_avst_sink_l2.valid
			coupling_pusch_avst_sink_data_l2         => CONNECTED_TO_coupling_pusch_avst_sink_data_l2,         --                               .data
			coupling_pusch_avst_sink_channel_l2      => CONNECTED_TO_coupling_pusch_avst_sink_channel_l2,      --                               .channel
			coupling_pusch_avst_sink_sop_l2          => CONNECTED_TO_coupling_pusch_avst_sink_sop_l2,          --                               .startofpacket
			coupling_pusch_avst_sink_eop_l2          => CONNECTED_TO_coupling_pusch_avst_sink_eop_l2,          --                               .endofpacket
			coupling_prach_avst_sink_valid_l1        => CONNECTED_TO_coupling_prach_avst_sink_valid_l1,        --    coupling_prach_avst_sink_l1.valid
			coupling_prach_avst_sink_data_l1         => CONNECTED_TO_coupling_prach_avst_sink_data_l1,         --                               .data
			coupling_prach_avst_sink_channel_l1      => CONNECTED_TO_coupling_prach_avst_sink_channel_l1,      --                               .channel
			coupling_prach_avst_sink_sop_l1          => CONNECTED_TO_coupling_prach_avst_sink_sop_l1,          --                               .startofpacket
			coupling_prach_avst_sink_eop_l1          => CONNECTED_TO_coupling_prach_avst_sink_eop_l1,          --                               .endofpacket
			coupling_prach_avst_sink_valid_l2        => CONNECTED_TO_coupling_prach_avst_sink_valid_l2,        --    coupling_prach_avst_sink_l2.valid
			coupling_prach_avst_sink_data_l2         => CONNECTED_TO_coupling_prach_avst_sink_data_l2,         --                               .data
			coupling_prach_avst_sink_channel_l2      => CONNECTED_TO_coupling_prach_avst_sink_channel_l2,      --                               .channel
			coupling_prach_avst_sink_sop_l2          => CONNECTED_TO_coupling_prach_avst_sink_sop_l2,          --                               .startofpacket
			coupling_prach_avst_sink_eop_l2          => CONNECTED_TO_coupling_prach_avst_sink_eop_l2,          --                               .endofpacket
			xran_demapper_cplane_valid               => CONNECTED_TO_xran_demapper_cplane_valid,               --    xran_demapper_cplane_source.valid
			xran_demapper_cplane_startofpacket       => CONNECTED_TO_xran_demapper_cplane_startofpacket,       --                               .startofpacket
			xran_demapper_cplane_endofpacket         => CONNECTED_TO_xran_demapper_cplane_endofpacket,         --                               .endofpacket
			pb_avst_sink_valid                       => CONNECTED_TO_pb_avst_sink_valid,                       --                   pb_avst_sink.valid
			pb_avst_sink_data                        => CONNECTED_TO_pb_avst_sink_data,                        --                               .data
			pb_avst_sink_ready                       => CONNECTED_TO_pb_avst_sink_ready,                       --                               .ready
			bw_config_cc1                            => CONNECTED_TO_bw_config_cc1,                            --                   bw_confg_cc1.bw_config_cc1
			bw_config_cc2                            => CONNECTED_TO_bw_config_cc2,                            --                   bw_confg_cc2.bw_config_cc2
			radio_config_status                      => CONNECTED_TO_radio_config_status,                      --            radio_config_status.radio_config_status
			short_long_prach_select                  => CONNECTED_TO_short_long_prach_select,                  --        short_long_prach_select.data
			rx_rtc_id                                => CONNECTED_TO_rx_rtc_id,                                --                      rx_rtc_id.rx_rtc_id
			rx_u_axc_id                              => CONNECTED_TO_rx_u_axc_id,                              --                    rx_u_axc_id.rx_u_axc_id
			rx_rtc_id_dl                             => CONNECTED_TO_rx_rtc_id_dl,                             --                   rx_rtc_id_dl.rx_rtc_id_dl
			lphy_ss_ul_sink_valid1                   => CONNECTED_TO_lphy_ss_ul_sink_valid1,                   --             lphy_ss_ul_sink_l1.valid
			lphy_ss_ul_sink_data1                    => CONNECTED_TO_lphy_ss_ul_sink_data1,                    --                               .data
			lphy_ss_ul_sink_channel1                 => CONNECTED_TO_lphy_ss_ul_sink_channel1,                 --                               .channel
			lphy_ss_ul_sink_valid2                   => CONNECTED_TO_lphy_ss_ul_sink_valid2,                   --             lphy_ss_ul_sink_l2.valid
			lphy_ss_ul_sink_data2                    => CONNECTED_TO_lphy_ss_ul_sink_data2,                    --                               .data
			lphy_ss_ul_sink_channel2                 => CONNECTED_TO_lphy_ss_ul_sink_channel2,                 --                               .channel
			rst_soft_n                               => CONNECTED_TO_rst_soft_n,                               --                     rst_soft_n.rst_soft_n
			coupling_pusch_timing_ref                => CONNECTED_TO_coupling_pusch_timing_ref,                --      coupling_pusch_timing_ref.data
			coupling_prach_timing_ref                => CONNECTED_TO_coupling_prach_timing_ref,                --      coupling_prach_timing_ref.data
			oran_rx_cplane_concat                    => CONNECTED_TO_oran_rx_cplane_concat,                    --          oran_rx_cplane_concat.data
			oran_rx_uplane_concat                    => CONNECTED_TO_oran_rx_uplane_concat,                    --          oran_rx_uplane_concat.data
			lphy_avst_selctd_cap_intf_valid          => CONNECTED_TO_lphy_avst_selctd_cap_intf_valid,          --      lphy_avst_selctd_cap_intf.valid
			lphy_avst_selctd_cap_intf_data           => CONNECTED_TO_lphy_avst_selctd_cap_intf_data,           --                               .data
			lphy_avst_selctd_cap_intf_chan           => CONNECTED_TO_lphy_avst_selctd_cap_intf_chan,           --                               .channel
			ul_start_pulse_latch                     => CONNECTED_TO_ul_start_pulse_latch,                     --           ul_start_pulse_latch.data
			frame_status_counter_reset               => CONNECTED_TO_frame_status_counter_reset,               --     frame_status_counter_reset.data
			interface_sel                            => CONNECTED_TO_interface_sel,                            --                  interface_sel.data
			dl_input_hfn_pulse                       => CONNECTED_TO_dl_input_hfn_pulse,                       --             dl_input_hfn_pulse.data
			pm_ifft_threash_mm_bridge_address_l1     => CONNECTED_TO_pm_ifft_threash_mm_bridge_address_l1,     --   pm_ifft_threash_mm_bridge_l1.address
			pm_ifft_threash_mm_bridge_chipselect_l1  => CONNECTED_TO_pm_ifft_threash_mm_bridge_chipselect_l1,  --                               .chipselect
			pm_ifft_threash_mm_bridge_read_l1        => CONNECTED_TO_pm_ifft_threash_mm_bridge_read_l1,        --                               .read
			pm_ifft_threash_mm_bridge_write_l1       => CONNECTED_TO_pm_ifft_threash_mm_bridge_write_l1,       --                               .write
			pm_ifft_threash_mm_bridge_writedata_l1   => CONNECTED_TO_pm_ifft_threash_mm_bridge_writedata_l1,   --                               .writedata
			pm_ifft_threash_mm_bridge_byteenable_l1  => CONNECTED_TO_pm_ifft_threash_mm_bridge_byteenable_l1,  --                               .byteenable
			pm_ifft_threash_mm_bridge_readdata_l1    => CONNECTED_TO_pm_ifft_threash_mm_bridge_readdata_l1,    --                               .readdata
			pm_ifft_threash_mm_bridge_waitrequest_l1 => CONNECTED_TO_pm_ifft_threash_mm_bridge_waitrequest_l1, --                               .waitrequest
			pwr_mtr_ifft_hist_done_intr_l1           => CONNECTED_TO_pwr_mtr_ifft_hist_done_intr_l1,           -- pwr_mtr_ifft_hist_done_intr_l1.irq
			pwr_mtr_ifft_hist_done_intr_l2           => CONNECTED_TO_pwr_mtr_ifft_hist_done_intr_l2,           -- pwr_mtr_ifft_hist_done_intr_l2.irq
			pm_ifft_threash_mm_bridge_address_l2     => CONNECTED_TO_pm_ifft_threash_mm_bridge_address_l2,     --   pm_ifft_threash_mm_bridge_l2.address
			pm_ifft_threash_mm_bridge_chipselect_l2  => CONNECTED_TO_pm_ifft_threash_mm_bridge_chipselect_l2,  --                               .chipselect
			pm_ifft_threash_mm_bridge_read_l2        => CONNECTED_TO_pm_ifft_threash_mm_bridge_read_l2,        --                               .read
			pm_ifft_threash_mm_bridge_write_l2       => CONNECTED_TO_pm_ifft_threash_mm_bridge_write_l2,       --                               .write
			pm_ifft_threash_mm_bridge_writedata_l2   => CONNECTED_TO_pm_ifft_threash_mm_bridge_writedata_l2,   --                               .writedata
			pm_ifft_threash_mm_bridge_byteenable_l2  => CONNECTED_TO_pm_ifft_threash_mm_bridge_byteenable_l2,  --                               .byteenable
			pm_ifft_threash_mm_bridge_readdata_l2    => CONNECTED_TO_pm_ifft_threash_mm_bridge_readdata_l2,    --                               .readdata
			pm_ifft_threash_mm_bridge_waitrequest_l2 => CONNECTED_TO_pm_ifft_threash_mm_bridge_waitrequest_l2, --                               .waitrequest
			pwr_mtr_ifft_config_csr_writedata_l1     => CONNECTED_TO_pwr_mtr_ifft_config_csr_writedata_l1,     --     pwr_mtr_ifft_config_csr_l1.writedata
			pwr_mtr_ifft_config_csr_read_l1          => CONNECTED_TO_pwr_mtr_ifft_config_csr_read_l1,          --                               .read
			pwr_mtr_ifft_config_csr_write_l1         => CONNECTED_TO_pwr_mtr_ifft_config_csr_write_l1,         --                               .write
			pwr_mtr_ifft_config_csr_readdata_l1      => CONNECTED_TO_pwr_mtr_ifft_config_csr_readdata_l1,      --                               .readdata
			pwr_mtr_ifft_config_csr_readdatavalid_l1 => CONNECTED_TO_pwr_mtr_ifft_config_csr_readdatavalid_l1, --                               .readdatavalid
			pwr_mtr_ifft_config_csr_address_l1       => CONNECTED_TO_pwr_mtr_ifft_config_csr_address_l1,       --                               .address
			pwr_mtr_ifft_config_csr_waitrequest_l1   => CONNECTED_TO_pwr_mtr_ifft_config_csr_waitrequest_l1,   --                               .waitrequest
			pwr_mtr_ifft_config_csr_writedata_l2     => CONNECTED_TO_pwr_mtr_ifft_config_csr_writedata_l2,     --     pwr_mtr_ifft_config_csr_l2.writedata
			pwr_mtr_ifft_config_csr_read_l2          => CONNECTED_TO_pwr_mtr_ifft_config_csr_read_l2,          --                               .read
			pwr_mtr_ifft_config_csr_write_l2         => CONNECTED_TO_pwr_mtr_ifft_config_csr_write_l2,         --                               .write
			pwr_mtr_ifft_config_csr_readdata_l2      => CONNECTED_TO_pwr_mtr_ifft_config_csr_readdata_l2,      --                               .readdata
			pwr_mtr_ifft_config_csr_readdatavalid_l2 => CONNECTED_TO_pwr_mtr_ifft_config_csr_readdatavalid_l2, --                               .readdatavalid
			pwr_mtr_ifft_config_csr_address_l2       => CONNECTED_TO_pwr_mtr_ifft_config_csr_address_l2,       --                               .address
			pwr_mtr_ifft_config_csr_waitrequest_l2   => CONNECTED_TO_pwr_mtr_ifft_config_csr_waitrequest_l2,   --                               .waitrequest
			pm_ifft_hist_mm_bridge_address_l1        => CONNECTED_TO_pm_ifft_hist_mm_bridge_address_l1,        --      pm_ifft_hist_mm_bridge_l1.address
			pm_ifft_hist_mm_bridge_chipselect_l1     => CONNECTED_TO_pm_ifft_hist_mm_bridge_chipselect_l1,     --                               .chipselect
			pm_ifft_hist_mm_bridge_read_l1           => CONNECTED_TO_pm_ifft_hist_mm_bridge_read_l1,           --                               .read
			pm_ifft_hist_mm_bridge_write_l1          => CONNECTED_TO_pm_ifft_hist_mm_bridge_write_l1,          --                               .write
			pm_ifft_hist_mm_bridge_writedata_l1      => CONNECTED_TO_pm_ifft_hist_mm_bridge_writedata_l1,      --                               .writedata
			pm_ifft_hist_mm_bridge_byteenable_l1     => CONNECTED_TO_pm_ifft_hist_mm_bridge_byteenable_l1,     --                               .byteenable
			pm_ifft_hist_mm_bridge_readdata_l1       => CONNECTED_TO_pm_ifft_hist_mm_bridge_readdata_l1,       --                               .readdata
			pm_ifft_hist_mm_bridge_readdatavalid_l1  => CONNECTED_TO_pm_ifft_hist_mm_bridge_readdatavalid_l1,  --                               .readdatavalid
			pm_ifft_hist_mm_bridge_waitrequest_l1    => CONNECTED_TO_pm_ifft_hist_mm_bridge_waitrequest_l1,    --                               .waitrequest
			pm_ifft_hist_mm_bridge_address_l2        => CONNECTED_TO_pm_ifft_hist_mm_bridge_address_l2,        --      pm_ifft_hist_mm_bridge_l2.address
			pm_ifft_hist_mm_bridge_chipselect_l2     => CONNECTED_TO_pm_ifft_hist_mm_bridge_chipselect_l2,     --                               .chipselect
			pm_ifft_hist_mm_bridge_read_l2           => CONNECTED_TO_pm_ifft_hist_mm_bridge_read_l2,           --                               .read
			pm_ifft_hist_mm_bridge_write_l2          => CONNECTED_TO_pm_ifft_hist_mm_bridge_write_l2,          --                               .write
			pm_ifft_hist_mm_bridge_writedata_l2      => CONNECTED_TO_pm_ifft_hist_mm_bridge_writedata_l2,      --                               .writedata
			pm_ifft_hist_mm_bridge_byteenable_l2     => CONNECTED_TO_pm_ifft_hist_mm_bridge_byteenable_l2,     --                               .byteenable
			pm_ifft_hist_mm_bridge_readdata_l2       => CONNECTED_TO_pm_ifft_hist_mm_bridge_readdata_l2,       --                               .readdata
			pm_ifft_hist_mm_bridge_readdatavalid_l2  => CONNECTED_TO_pm_ifft_hist_mm_bridge_readdatavalid_l2,  --                               .readdatavalid
			pm_ifft_hist_mm_bridge_waitrequest_l2    => CONNECTED_TO_pm_ifft_hist_mm_bridge_waitrequest_l2,    --                               .waitrequest
			pwr_mtr_fft_hist_done_intr_l1            => CONNECTED_TO_pwr_mtr_fft_hist_done_intr_l1,            --  pwr_mtr_fft_hist_done_intr_l1.irq
			pwr_mtr_fft_hist_done_intr_l2            => CONNECTED_TO_pwr_mtr_fft_hist_done_intr_l2,            --  pwr_mtr_fft_hist_done_intr_l2.irq
			duc_ddc_lpbk_en                          => CONNECTED_TO_duc_ddc_lpbk_en,                          --                duc_ddc_lpbk_en.data
			pm_fft_threash_mm_bridge_address_l1      => CONNECTED_TO_pm_fft_threash_mm_bridge_address_l1,      --    pm_fft_threash_mm_bridge_l1.address
			pm_fft_threash_mm_bridge_chipselect_l1   => CONNECTED_TO_pm_fft_threash_mm_bridge_chipselect_l1,   --                               .chipselect
			pm_fft_threash_mm_bridge_read_l1         => CONNECTED_TO_pm_fft_threash_mm_bridge_read_l1,         --                               .read
			pm_fft_threash_mm_bridge_write_l1        => CONNECTED_TO_pm_fft_threash_mm_bridge_write_l1,        --                               .write
			pm_fft_threash_mm_bridge_writedata_l1    => CONNECTED_TO_pm_fft_threash_mm_bridge_writedata_l1,    --                               .writedata
			pm_fft_threash_mm_bridge_byteenable_l1   => CONNECTED_TO_pm_fft_threash_mm_bridge_byteenable_l1,   --                               .byteenable
			pm_fft_threash_mm_bridge_readdata_l1     => CONNECTED_TO_pm_fft_threash_mm_bridge_readdata_l1,     --                               .readdata
			pm_fft_threash_mm_bridge_waitrequest_l1  => CONNECTED_TO_pm_fft_threash_mm_bridge_waitrequest_l1,  --                               .waitrequest
			pm_fft_threash_mm_bridge_address_l2      => CONNECTED_TO_pm_fft_threash_mm_bridge_address_l2,      --    pm_fft_threash_mm_bridge_l2.address
			pm_fft_threash_mm_bridge_chipselect_l2   => CONNECTED_TO_pm_fft_threash_mm_bridge_chipselect_l2,   --                               .chipselect
			pm_fft_threash_mm_bridge_read_l2         => CONNECTED_TO_pm_fft_threash_mm_bridge_read_l2,         --                               .read
			pm_fft_threash_mm_bridge_write_l2        => CONNECTED_TO_pm_fft_threash_mm_bridge_write_l2,        --                               .write
			pm_fft_threash_mm_bridge_writedata_l2    => CONNECTED_TO_pm_fft_threash_mm_bridge_writedata_l2,    --                               .writedata
			pm_fft_threash_mm_bridge_byteenable_l2   => CONNECTED_TO_pm_fft_threash_mm_bridge_byteenable_l2,   --                               .byteenable
			pm_fft_threash_mm_bridge_readdata_l2     => CONNECTED_TO_pm_fft_threash_mm_bridge_readdata_l2,     --                               .readdata
			pm_fft_threash_mm_bridge_waitrequest_l2  => CONNECTED_TO_pm_fft_threash_mm_bridge_waitrequest_l2,  --                               .waitrequest
			pwr_mtr_fft_config_csr_writedata_l1      => CONNECTED_TO_pwr_mtr_fft_config_csr_writedata_l1,      --      pwr_mtr_fft_config_csr_l1.writedata
			pwr_mtr_fft_config_csr_read_l1           => CONNECTED_TO_pwr_mtr_fft_config_csr_read_l1,           --                               .read
			pwr_mtr_fft_config_csr_write_l1          => CONNECTED_TO_pwr_mtr_fft_config_csr_write_l1,          --                               .write
			pwr_mtr_fft_config_csr_readdata_l1       => CONNECTED_TO_pwr_mtr_fft_config_csr_readdata_l1,       --                               .readdata
			pwr_mtr_fft_config_csr_readdatavalid_l1  => CONNECTED_TO_pwr_mtr_fft_config_csr_readdatavalid_l1,  --                               .readdatavalid
			pwr_mtr_fft_config_csr_address_l1        => CONNECTED_TO_pwr_mtr_fft_config_csr_address_l1,        --                               .address
			pwr_mtr_fft_config_csr_waitrequest_l1    => CONNECTED_TO_pwr_mtr_fft_config_csr_waitrequest_l1,    --                               .waitrequest
			pwr_mtr_fft_config_csr_writedata_l2      => CONNECTED_TO_pwr_mtr_fft_config_csr_writedata_l2,      --      pwr_mtr_fft_config_csr_l2.writedata
			pwr_mtr_fft_config_csr_read_l2           => CONNECTED_TO_pwr_mtr_fft_config_csr_read_l2,           --                               .read
			pwr_mtr_fft_config_csr_write_l2          => CONNECTED_TO_pwr_mtr_fft_config_csr_write_l2,          --                               .write
			pwr_mtr_fft_config_csr_readdata_l2       => CONNECTED_TO_pwr_mtr_fft_config_csr_readdata_l2,       --                               .readdata
			pwr_mtr_fft_config_csr_readdatavalid_l2  => CONNECTED_TO_pwr_mtr_fft_config_csr_readdatavalid_l2,  --                               .readdatavalid
			pwr_mtr_fft_config_csr_address_l2        => CONNECTED_TO_pwr_mtr_fft_config_csr_address_l2,        --                               .address
			pwr_mtr_fft_config_csr_waitrequest_l2    => CONNECTED_TO_pwr_mtr_fft_config_csr_waitrequest_l2,    --                               .waitrequest
			pm_fft_hist_mm_bridge_address_l1         => CONNECTED_TO_pm_fft_hist_mm_bridge_address_l1,         --       pm_fft_hist_mm_bridge_l1.address
			pm_fft_hist_mm_bridge_chipselect_l1      => CONNECTED_TO_pm_fft_hist_mm_bridge_chipselect_l1,      --                               .chipselect
			pm_fft_hist_mm_bridge_read_l1            => CONNECTED_TO_pm_fft_hist_mm_bridge_read_l1,            --                               .read
			pm_fft_hist_mm_bridge_write_l1           => CONNECTED_TO_pm_fft_hist_mm_bridge_write_l1,           --                               .write
			pm_fft_hist_mm_bridge_writedata_l1       => CONNECTED_TO_pm_fft_hist_mm_bridge_writedata_l1,       --                               .writedata
			pm_fft_hist_mm_bridge_byteenable_l1      => CONNECTED_TO_pm_fft_hist_mm_bridge_byteenable_l1,      --                               .byteenable
			pm_fft_hist_mm_bridge_readdata_l1        => CONNECTED_TO_pm_fft_hist_mm_bridge_readdata_l1,        --                               .readdata
			pm_fft_hist_mm_bridge_readdatavalid_l1   => CONNECTED_TO_pm_fft_hist_mm_bridge_readdatavalid_l1,   --                               .readdatavalid
			pm_fft_hist_mm_bridge_waitrequest_l1     => CONNECTED_TO_pm_fft_hist_mm_bridge_waitrequest_l1,     --                               .waitrequest
			pm_fft_hist_mm_bridge_address_l2         => CONNECTED_TO_pm_fft_hist_mm_bridge_address_l2,         --       pm_fft_hist_mm_bridge_l2.address
			pm_fft_hist_mm_bridge_chipselect_l2      => CONNECTED_TO_pm_fft_hist_mm_bridge_chipselect_l2,      --                               .chipselect
			pm_fft_hist_mm_bridge_read_l2            => CONNECTED_TO_pm_fft_hist_mm_bridge_read_l2,            --                               .read
			pm_fft_hist_mm_bridge_write_l2           => CONNECTED_TO_pm_fft_hist_mm_bridge_write_l2,           --                               .write
			pm_fft_hist_mm_bridge_writedata_l2       => CONNECTED_TO_pm_fft_hist_mm_bridge_writedata_l2,       --                               .writedata
			pm_fft_hist_mm_bridge_byteenable_l2      => CONNECTED_TO_pm_fft_hist_mm_bridge_byteenable_l2,      --                               .byteenable
			pm_fft_hist_mm_bridge_readdata_l2        => CONNECTED_TO_pm_fft_hist_mm_bridge_readdata_l2,        --                               .readdata
			pm_fft_hist_mm_bridge_readdatavalid_l2   => CONNECTED_TO_pm_fft_hist_mm_bridge_readdatavalid_l2,   --                               .readdatavalid
			pm_fft_hist_mm_bridge_waitrequest_l2     => CONNECTED_TO_pm_fft_hist_mm_bridge_waitrequest_l2,     --                               .waitrequest
			pm_stat_ifft_mm_bridge_address_l1        => CONNECTED_TO_pm_stat_ifft_mm_bridge_address_l1,        --      pm_stat_ifft_mm_bridge_l1.address
			pm_stat_ifft_mm_bridge_chipselect_l1     => CONNECTED_TO_pm_stat_ifft_mm_bridge_chipselect_l1,     --                               .chipselect
			pm_stat_ifft_mm_bridge_read_l1           => CONNECTED_TO_pm_stat_ifft_mm_bridge_read_l1,           --                               .read
			pm_stat_ifft_mm_bridge_write_l1          => CONNECTED_TO_pm_stat_ifft_mm_bridge_write_l1,          --                               .write
			pm_stat_ifft_mm_bridge_writedata_l1      => CONNECTED_TO_pm_stat_ifft_mm_bridge_writedata_l1,      --                               .writedata
			pm_stat_ifft_mm_bridge_byteenable_l1     => CONNECTED_TO_pm_stat_ifft_mm_bridge_byteenable_l1,     --                               .byteenable
			pm_stat_ifft_mm_bridge_readdata_l1       => CONNECTED_TO_pm_stat_ifft_mm_bridge_readdata_l1,       --                               .readdata
			pm_stat_ifft_mm_bridge_readdatavalid_l1  => CONNECTED_TO_pm_stat_ifft_mm_bridge_readdatavalid_l1,  --                               .readdatavalid
			pm_stat_ifft_mm_bridge_waitrequest_l1    => CONNECTED_TO_pm_stat_ifft_mm_bridge_waitrequest_l1,    --                               .waitrequest
			pm_stat_ifft_mm_bridge_address_l2        => CONNECTED_TO_pm_stat_ifft_mm_bridge_address_l2,        --      pm_stat_ifft_mm_bridge_l2.address
			pm_stat_ifft_mm_bridge_chipselect_l2     => CONNECTED_TO_pm_stat_ifft_mm_bridge_chipselect_l2,     --                               .chipselect
			pm_stat_ifft_mm_bridge_read_l2           => CONNECTED_TO_pm_stat_ifft_mm_bridge_read_l2,           --                               .read
			pm_stat_ifft_mm_bridge_write_l2          => CONNECTED_TO_pm_stat_ifft_mm_bridge_write_l2,          --                               .write
			pm_stat_ifft_mm_bridge_writedata_l2      => CONNECTED_TO_pm_stat_ifft_mm_bridge_writedata_l2,      --                               .writedata
			pm_stat_ifft_mm_bridge_byteenable_l2     => CONNECTED_TO_pm_stat_ifft_mm_bridge_byteenable_l2,     --                               .byteenable
			pm_stat_ifft_mm_bridge_readdata_l2       => CONNECTED_TO_pm_stat_ifft_mm_bridge_readdata_l2,       --                               .readdata
			pm_stat_ifft_mm_bridge_readdatavalid_l2  => CONNECTED_TO_pm_stat_ifft_mm_bridge_readdatavalid_l2,  --                               .readdatavalid
			pm_stat_ifft_mm_bridge_waitrequest_l2    => CONNECTED_TO_pm_stat_ifft_mm_bridge_waitrequest_l2,    --                               .waitrequest
			pm_stat_fft_mm_bridge_address_l1         => CONNECTED_TO_pm_stat_fft_mm_bridge_address_l1,         --       pm_stat_fft_mm_bridge_l1.address
			pm_stat_fft_mm_bridge_chipselect_l1      => CONNECTED_TO_pm_stat_fft_mm_bridge_chipselect_l1,      --                               .chipselect
			pm_stat_fft_mm_bridge_read_l1            => CONNECTED_TO_pm_stat_fft_mm_bridge_read_l1,            --                               .read
			pm_stat_fft_mm_bridge_write_l1           => CONNECTED_TO_pm_stat_fft_mm_bridge_write_l1,           --                               .write
			pm_stat_fft_mm_bridge_writedata_l1       => CONNECTED_TO_pm_stat_fft_mm_bridge_writedata_l1,       --                               .writedata
			pm_stat_fft_mm_bridge_byteenable_l1      => CONNECTED_TO_pm_stat_fft_mm_bridge_byteenable_l1,      --                               .byteenable
			pm_stat_fft_mm_bridge_readdata_l1        => CONNECTED_TO_pm_stat_fft_mm_bridge_readdata_l1,        --                               .readdata
			pm_stat_fft_mm_bridge_readdatavalid_l1   => CONNECTED_TO_pm_stat_fft_mm_bridge_readdatavalid_l1,   --                               .readdatavalid
			pm_stat_fft_mm_bridge_waitrequest_l1     => CONNECTED_TO_pm_stat_fft_mm_bridge_waitrequest_l1,     --                               .waitrequest
			pm_stat_fft_mm_bridge_address_l2         => CONNECTED_TO_pm_stat_fft_mm_bridge_address_l2,         --       pm_stat_fft_mm_bridge_l2.address
			pm_stat_fft_mm_bridge_chipselect_l2      => CONNECTED_TO_pm_stat_fft_mm_bridge_chipselect_l2,      --                               .chipselect
			pm_stat_fft_mm_bridge_read_l2            => CONNECTED_TO_pm_stat_fft_mm_bridge_read_l2,            --                               .read
			pm_stat_fft_mm_bridge_write_l2           => CONNECTED_TO_pm_stat_fft_mm_bridge_write_l2,           --                               .write
			pm_stat_fft_mm_bridge_writedata_l2       => CONNECTED_TO_pm_stat_fft_mm_bridge_writedata_l2,       --                               .writedata
			pm_stat_fft_mm_bridge_byteenable_l2      => CONNECTED_TO_pm_stat_fft_mm_bridge_byteenable_l2,      --                               .byteenable
			pm_stat_fft_mm_bridge_readdata_l2        => CONNECTED_TO_pm_stat_fft_mm_bridge_readdata_l2,        --                               .readdata
			pm_stat_fft_mm_bridge_readdatavalid_l2   => CONNECTED_TO_pm_stat_fft_mm_bridge_readdatavalid_l2,   --                               .readdatavalid
			pm_stat_fft_mm_bridge_waitrequest_l2     => CONNECTED_TO_pm_stat_fft_mm_bridge_waitrequest_l2      --                               .waitrequest
		);

