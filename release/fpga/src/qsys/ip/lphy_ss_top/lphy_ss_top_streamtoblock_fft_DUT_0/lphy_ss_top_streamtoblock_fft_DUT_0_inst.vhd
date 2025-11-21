	component lphy_ss_top_streamtoblock_fft_DUT_0 is
		port (
			clk                     : in  std_logic                     := 'X';             -- clk
			areset                  : in  std_logic                     := 'X';             -- reset
			bus_clk                 : in  std_logic                     := 'X';             -- clk
			bus_areset              : in  std_logic                     := 'X';             -- reset
			busIn_address           : in  std_logic_vector(13 downto 0) := (others => 'X'); -- address
			busIn_read              : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- read
			busIn_write             : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- write
			busIn_writedata         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			busOut_readdata         : out std_logic_vector(31 downto 0);                    -- readdata
			busOut_readdatavalid    : out std_logic_vector(0 downto 0);                     -- readdatavalid
			busOut_waitrequest      : out std_logic_vector(0 downto 0);                     -- waitrequest
			rx_vin_s                : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- valid_rx_vin_s
			rx_chin_s               : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- channel_rx_chin_s
			rx_din_im               : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_rx_din_im
			rx_din_re               : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_rx_din_re
			fft_in_s                : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_fft_in_s
			cp_in_s                 : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_cp_in_s
			nprb_s                  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_nprb_s
			hcs_bypass_s            : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_hcs_bypass_s
			fft_gain_s              : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_fft_gain_s
			fft_gain_im_s           : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_fft_gain_im_s
			fft_shift_s             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_fft_shift_s
			time_ref_in_s           : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data_time_ref_in_s
			DC_SC_EN_s              : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_DC_SC_EN_s
			CP_EN_s                 : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_CP_EN_s
			ripple_comp_en_s        : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_ripple_comp_en_s
			rc_bw_sel_s             : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_rc_bw_sel_s
			sym_metadata_in_s       : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data_sym_metadata_in_s
			sym_metadata_in_valid_s : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_sym_metadata_in_valid_s
			rx_valid_s              : out std_logic_vector(0 downto 0);                     -- valid_rx_valid_s
			rx_chout_s              : out std_logic_vector(7 downto 0);                     -- channel_rx_chout_s
			rx_dout_im              : out std_logic_vector(15 downto 0);                    -- data_rx_dout_im
			rx_dout_re              : out std_logic_vector(15 downto 0);                    -- data_rx_dout_re
			fft_vout_s              : out std_logic_vector(0 downto 0);                     -- valid_fft_vout_s
			fft_chout_s             : out std_logic_vector(7 downto 0);                     -- channel_fft_chout_s
			fft_dout_im             : out std_logic_vector(15 downto 0);                    -- data_fft_dout_im
			fft_dout_re             : out std_logic_vector(15 downto 0);                    -- data_fft_dout_re
			nsc_out_s               : out std_logic_vector(15 downto 0);                    -- data_nsc_out_s
			size_out_s              : out std_logic_vector(3 downto 0);                     -- data_size_out_s
			td_time_out_s           : out std_logic_vector(63 downto 0);                    -- data_td_time_out_s
			fd_data_v_s             : out std_logic_vector(0 downto 0);                     -- valid_fd_data_v_s
			fd_data_c_s             : out std_logic_vector(7 downto 0);                     -- channel_fd_data_c_s
			fd_data_q_im            : out std_logic_vector(15 downto 0);                    -- data_fd_data_q_im
			fd_data_q_re            : out std_logic_vector(15 downto 0);                    -- data_fd_data_q_re
			eAxCout_s               : out std_logic_vector(1 downto 0);                     -- data_eAxCout_s
			eop_eAxC_s              : out std_logic_vector(0 downto 0);                     -- data_eop_eAxC_s
			eop_sym_s               : out std_logic_vector(0 downto 0);                     -- data_eop_sym_s
			sop_eAxC_s              : out std_logic_vector(0 downto 0);                     -- data_sop_eAxC_s
			sop_sym_s               : out std_logic_vector(0 downto 0)                      -- data_sop_sym_s
		);
	end component lphy_ss_top_streamtoblock_fft_DUT_0;

	u0 : component lphy_ss_top_streamtoblock_fft_DUT_0
		port map (
			clk                     => CONNECTED_TO_clk,                     --           clock.clk
			areset                  => CONNECTED_TO_areset,                  --     clock_reset.reset
			bus_clk                 => CONNECTED_TO_bus_clk,                 --       bus_clock.clk
			bus_areset              => CONNECTED_TO_bus_areset,              -- bus_clock_reset.reset
			busIn_address           => CONNECTED_TO_busIn_address,           --             bus.address
			busIn_read              => CONNECTED_TO_busIn_read,              --                .read
			busIn_write             => CONNECTED_TO_busIn_write,             --                .write
			busIn_writedata         => CONNECTED_TO_busIn_writedata,         --                .writedata
			busOut_readdata         => CONNECTED_TO_busOut_readdata,         --                .readdata
			busOut_readdatavalid    => CONNECTED_TO_busOut_readdatavalid,    --                .readdatavalid
			busOut_waitrequest      => CONNECTED_TO_busOut_waitrequest,      --                .waitrequest
			rx_vin_s                => CONNECTED_TO_rx_vin_s,                --             exp.valid_rx_vin_s
			rx_chin_s               => CONNECTED_TO_rx_chin_s,               --                .channel_rx_chin_s
			rx_din_im               => CONNECTED_TO_rx_din_im,               --                .data_rx_din_im
			rx_din_re               => CONNECTED_TO_rx_din_re,               --                .data_rx_din_re
			fft_in_s                => CONNECTED_TO_fft_in_s,                --                .data_fft_in_s
			cp_in_s                 => CONNECTED_TO_cp_in_s,                 --                .data_cp_in_s
			nprb_s                  => CONNECTED_TO_nprb_s,                  --                .data_nprb_s
			hcs_bypass_s            => CONNECTED_TO_hcs_bypass_s,            --                .data_hcs_bypass_s
			fft_gain_s              => CONNECTED_TO_fft_gain_s,              --                .data_fft_gain_s
			fft_gain_im_s           => CONNECTED_TO_fft_gain_im_s,           --                .data_fft_gain_im_s
			fft_shift_s             => CONNECTED_TO_fft_shift_s,             --                .data_fft_shift_s
			time_ref_in_s           => CONNECTED_TO_time_ref_in_s,           --                .data_time_ref_in_s
			DC_SC_EN_s              => CONNECTED_TO_DC_SC_EN_s,              --                .data_DC_SC_EN_s
			CP_EN_s                 => CONNECTED_TO_CP_EN_s,                 --                .data_CP_EN_s
			ripple_comp_en_s        => CONNECTED_TO_ripple_comp_en_s,        --                .data_ripple_comp_en_s
			rc_bw_sel_s             => CONNECTED_TO_rc_bw_sel_s,             --                .data_rc_bw_sel_s
			sym_metadata_in_s       => CONNECTED_TO_sym_metadata_in_s,       --                .data_sym_metadata_in_s
			sym_metadata_in_valid_s => CONNECTED_TO_sym_metadata_in_valid_s, --                .data_sym_metadata_in_valid_s
			rx_valid_s              => CONNECTED_TO_rx_valid_s,              --                .valid_rx_valid_s
			rx_chout_s              => CONNECTED_TO_rx_chout_s,              --                .channel_rx_chout_s
			rx_dout_im              => CONNECTED_TO_rx_dout_im,              --                .data_rx_dout_im
			rx_dout_re              => CONNECTED_TO_rx_dout_re,              --                .data_rx_dout_re
			fft_vout_s              => CONNECTED_TO_fft_vout_s,              --                .valid_fft_vout_s
			fft_chout_s             => CONNECTED_TO_fft_chout_s,             --                .channel_fft_chout_s
			fft_dout_im             => CONNECTED_TO_fft_dout_im,             --                .data_fft_dout_im
			fft_dout_re             => CONNECTED_TO_fft_dout_re,             --                .data_fft_dout_re
			nsc_out_s               => CONNECTED_TO_nsc_out_s,               --                .data_nsc_out_s
			size_out_s              => CONNECTED_TO_size_out_s,              --                .data_size_out_s
			td_time_out_s           => CONNECTED_TO_td_time_out_s,           --                .data_td_time_out_s
			fd_data_v_s             => CONNECTED_TO_fd_data_v_s,             --                .valid_fd_data_v_s
			fd_data_c_s             => CONNECTED_TO_fd_data_c_s,             --                .channel_fd_data_c_s
			fd_data_q_im            => CONNECTED_TO_fd_data_q_im,            --                .data_fd_data_q_im
			fd_data_q_re            => CONNECTED_TO_fd_data_q_re,            --                .data_fd_data_q_re
			eAxCout_s               => CONNECTED_TO_eAxCout_s,               --                .data_eAxCout_s
			eop_eAxC_s              => CONNECTED_TO_eop_eAxC_s,              --                .data_eop_eAxC_s
			eop_sym_s               => CONNECTED_TO_eop_sym_s,               --                .data_eop_sym_s
			sop_eAxC_s              => CONNECTED_TO_sop_eAxC_s,              --                .data_sop_eAxC_s
			sop_sym_s               => CONNECTED_TO_sop_sym_s                --                .data_sop_sym_s
		);

