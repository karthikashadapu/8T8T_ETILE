	component lphy_ss_top_LongPRACH_prach_wrap_0 is
		port (
			clk                  : in  std_logic                     := 'X';             -- clk
			areset               : in  std_logic                     := 'X';             -- reset
			bus_clk              : in  std_logic                     := 'X';             -- clk
			bus_areset           : in  std_logic                     := 'X';             -- reset
			busIn_address        : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			busIn_read           : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- read
			busIn_write          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- write
			busIn_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			busOut_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			busOut_readdatavalid : out std_logic_vector(0 downto 0);                     -- readdatavalid
			busOut_waitrequest   : out std_logic_vector(0 downto 0);                     -- waitrequest
			vin0_s               : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- valid_vin0_s
			chin0_s              : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- channel_chin0_s
			din0_im              : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_din0_im
			din0_re              : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_din0_re
			RFN_s                : in  std_logic_vector(11 downto 0) := (others => 'X'); -- data_RFN_s
			subframe_s           : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_subframe_s
			prach_cfg_idx_s      : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_prach_cfg_idx_s
			cp_len_s             : in  std_logic_vector(20 downto 0) := (others => 'X'); -- data_cp_len_s
			offset_s             : in  std_logic_vector(20 downto 0) := (others => 'X'); -- data_offset_s
			c_m_plane_sel_s      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_c_m_plane_sel_s
			prach_tech_s         : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_prach_tech_s
			filt_flush_en_s      : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_filt_flush_en_s
			start_sym_s          : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_start_sym_s
			SubFrame_cplane_s    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data_SubFrame_cplane_s
			gain_re_s            : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_gain_re_s
			gain_im_s            : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_gain_im_s
			ch0_info_s           : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_ch0_info_s
			ch1_info_s           : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_ch1_info_s
			ch2_info_s           : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_ch2_info_s
			ch3_info_s           : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_ch3_info_s
			RFN_cplane_s         : in  std_logic_vector(11 downto 0) := (others => 'X'); -- data_RFN_cplane_s
			dout_im              : out std_logic_vector(15 downto 0);                    -- data_dout_im
			dout_re              : out std_logic_vector(15 downto 0);                    -- data_dout_re
			vout_s               : out std_logic_vector(0 downto 0);                     -- valid_vout_s
			cout_s               : out std_logic_vector(7 downto 0);                     -- channel_cout_s
			TimeReference_s      : out std_logic_vector(31 downto 0);                    -- data_TimeReference_s
			ch_info_s            : out std_logic_vector(15 downto 0)                     -- data_ch_info_s
		);
	end component lphy_ss_top_LongPRACH_prach_wrap_0;

	u0 : component lphy_ss_top_LongPRACH_prach_wrap_0
		port map (
			clk                  => CONNECTED_TO_clk,                  --           clock.clk
			areset               => CONNECTED_TO_areset,               --     clock_reset.reset
			bus_clk              => CONNECTED_TO_bus_clk,              --       bus_clock.clk
			bus_areset           => CONNECTED_TO_bus_areset,           -- bus_clock_reset.reset
			busIn_address        => CONNECTED_TO_busIn_address,        --             bus.address
			busIn_read           => CONNECTED_TO_busIn_read,           --                .read
			busIn_write          => CONNECTED_TO_busIn_write,          --                .write
			busIn_writedata      => CONNECTED_TO_busIn_writedata,      --                .writedata
			busOut_readdata      => CONNECTED_TO_busOut_readdata,      --                .readdata
			busOut_readdatavalid => CONNECTED_TO_busOut_readdatavalid, --                .readdatavalid
			busOut_waitrequest   => CONNECTED_TO_busOut_waitrequest,   --                .waitrequest
			vin0_s               => CONNECTED_TO_vin0_s,               --             exp.valid_vin0_s
			chin0_s              => CONNECTED_TO_chin0_s,              --                .channel_chin0_s
			din0_im              => CONNECTED_TO_din0_im,              --                .data_din0_im
			din0_re              => CONNECTED_TO_din0_re,              --                .data_din0_re
			RFN_s                => CONNECTED_TO_RFN_s,                --                .data_RFN_s
			subframe_s           => CONNECTED_TO_subframe_s,           --                .data_subframe_s
			prach_cfg_idx_s      => CONNECTED_TO_prach_cfg_idx_s,      --                .data_prach_cfg_idx_s
			cp_len_s             => CONNECTED_TO_cp_len_s,             --                .data_cp_len_s
			offset_s             => CONNECTED_TO_offset_s,             --                .data_offset_s
			c_m_plane_sel_s      => CONNECTED_TO_c_m_plane_sel_s,      --                .data_c_m_plane_sel_s
			prach_tech_s         => CONNECTED_TO_prach_tech_s,         --                .data_prach_tech_s
			filt_flush_en_s      => CONNECTED_TO_filt_flush_en_s,      --                .data_filt_flush_en_s
			start_sym_s          => CONNECTED_TO_start_sym_s,          --                .data_start_sym_s
			SubFrame_cplane_s    => CONNECTED_TO_SubFrame_cplane_s,    --                .data_SubFrame_cplane_s
			gain_re_s            => CONNECTED_TO_gain_re_s,            --                .data_gain_re_s
			gain_im_s            => CONNECTED_TO_gain_im_s,            --                .data_gain_im_s
			ch0_info_s           => CONNECTED_TO_ch0_info_s,           --                .data_ch0_info_s
			ch1_info_s           => CONNECTED_TO_ch1_info_s,           --                .data_ch1_info_s
			ch2_info_s           => CONNECTED_TO_ch2_info_s,           --                .data_ch2_info_s
			ch3_info_s           => CONNECTED_TO_ch3_info_s,           --                .data_ch3_info_s
			RFN_cplane_s         => CONNECTED_TO_RFN_cplane_s,         --                .data_RFN_cplane_s
			dout_im              => CONNECTED_TO_dout_im,              --                .data_dout_im
			dout_re              => CONNECTED_TO_dout_re,              --                .data_dout_re
			vout_s               => CONNECTED_TO_vout_s,               --                .valid_vout_s
			cout_s               => CONNECTED_TO_cout_s,               --                .channel_cout_s
			TimeReference_s      => CONNECTED_TO_TimeReference_s,      --                .data_TimeReference_s
			ch_info_s            => CONNECTED_TO_ch_info_s             --                .data_ch_info_s
		);

