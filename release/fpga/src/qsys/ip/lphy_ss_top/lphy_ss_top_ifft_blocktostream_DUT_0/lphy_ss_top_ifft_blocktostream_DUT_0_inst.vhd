	component lphy_ss_top_ifft_blocktostream_DUT_0 is
		port (
			clk                  : in  std_logic                     := 'X';             -- clk
			areset               : in  std_logic                     := 'X';             -- reset
			bus_clk              : in  std_logic                     := 'X';             -- clk
			bus_areset           : in  std_logic                     := 'X';             -- reset
			busIn_address        : in  std_logic_vector(13 downto 0) := (others => 'X'); -- address
			busIn_read           : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- read
			busIn_write          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- write
			busIn_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			busOut_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			busOut_readdatavalid : out std_logic_vector(0 downto 0);                     -- readdatavalid
			busOut_waitrequest   : out std_logic_vector(0 downto 0);                     -- waitrequest
			data1_im             : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_data1_im
			data1_re             : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_data1_re
			valid1_s             : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- valid_valid1_s
			channel1_s           : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- channel_channel1_s
			size1_s              : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_size1_s
			cplen1_s             : in  std_logic_vector(10 downto 0) := (others => 'X'); -- data_cplen1_s
			nsc1_s               : in  std_logic_vector(11 downto 0) := (others => 'X'); -- data_nsc1_s
			ifft_gain_re_l1_s    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_ifft_gain_re_l1_s
			ifft_gain_im_l1_s    : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_ifft_gain_im_l1_s
			ifft_shift_l1_s      : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- data_ifft_shift_l1_s
			ifft_mux_const_l1_s  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- data_ifft_mux_const_l1_s
			muxsel_l1_s          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_muxsel_l1_s
			DC_SC_EN_s           : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_DC_SC_EN_s
			CP_EN1_s             : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_CP_EN1_s
			ripple_comp_en_s     : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_ripple_comp_en_s
			rc_bw_sel_s          : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- data_rc_bw_sel_s
			timeref_in_s         : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data_timeref_in_s
			vout2_s              : out std_logic_vector(0 downto 0);                     -- data_vout2_s
			cout2_s              : out std_logic_vector(1 downto 0);                     -- data_cout2_s
			dout2_im             : out std_logic_vector(15 downto 0);                    -- data_dout2_im
			dout2_re             : out std_logic_vector(15 downto 0);                    -- data_dout2_re
			td_ifft_out_data_im  : out std_logic_vector(15 downto 0);                    -- data_td_ifft_out_data_im
			td_ifft_out_data_re  : out std_logic_vector(15 downto 0);                    -- data_td_ifft_out_data_re
			td_ifft_out_ch_s     : out std_logic_vector(7 downto 0);                     -- channel_td_ifft_out_ch_s
			td_ifft_out_valid_s  : out std_logic_vector(0 downto 0);                     -- valid_td_ifft_out_valid_s
			ifft_size_out_s      : out std_logic_vector(3 downto 0);                     -- data_ifft_size_out_s
			ifft_cp_out_s        : out std_logic_vector(10 downto 0);                    -- data_ifft_cp_out_s
			fd_data_v_s          : out std_logic_vector(0 downto 0);                     -- valid_fd_data_v_s
			fd_data_c_s          : out std_logic_vector(7 downto 0);                     -- channel_fd_data_c_s
			fd_data_q_im         : out std_logic_vector(15 downto 0);                    -- data_fd_data_q_im
			fd_data_q_re         : out std_logic_vector(15 downto 0);                    -- data_fd_data_q_re
			fd_timeref_out_s     : out std_logic_vector(63 downto 0)                     -- data_fd_timeref_out_s
		);
	end component lphy_ss_top_ifft_blocktostream_DUT_0;

	u0 : component lphy_ss_top_ifft_blocktostream_DUT_0
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
			data1_im             => CONNECTED_TO_data1_im,             --             exp.data_data1_im
			data1_re             => CONNECTED_TO_data1_re,             --                .data_data1_re
			valid1_s             => CONNECTED_TO_valid1_s,             --                .valid_valid1_s
			channel1_s           => CONNECTED_TO_channel1_s,           --                .channel_channel1_s
			size1_s              => CONNECTED_TO_size1_s,              --                .data_size1_s
			cplen1_s             => CONNECTED_TO_cplen1_s,             --                .data_cplen1_s
			nsc1_s               => CONNECTED_TO_nsc1_s,               --                .data_nsc1_s
			ifft_gain_re_l1_s    => CONNECTED_TO_ifft_gain_re_l1_s,    --                .data_ifft_gain_re_l1_s
			ifft_gain_im_l1_s    => CONNECTED_TO_ifft_gain_im_l1_s,    --                .data_ifft_gain_im_l1_s
			ifft_shift_l1_s      => CONNECTED_TO_ifft_shift_l1_s,      --                .data_ifft_shift_l1_s
			ifft_mux_const_l1_s  => CONNECTED_TO_ifft_mux_const_l1_s,  --                .data_ifft_mux_const_l1_s
			muxsel_l1_s          => CONNECTED_TO_muxsel_l1_s,          --                .data_muxsel_l1_s
			DC_SC_EN_s           => CONNECTED_TO_DC_SC_EN_s,           --                .data_DC_SC_EN_s
			CP_EN1_s             => CONNECTED_TO_CP_EN1_s,             --                .data_CP_EN1_s
			ripple_comp_en_s     => CONNECTED_TO_ripple_comp_en_s,     --                .data_ripple_comp_en_s
			rc_bw_sel_s          => CONNECTED_TO_rc_bw_sel_s,          --                .data_rc_bw_sel_s
			timeref_in_s         => CONNECTED_TO_timeref_in_s,         --                .data_timeref_in_s
			vout2_s              => CONNECTED_TO_vout2_s,              --                .data_vout2_s
			cout2_s              => CONNECTED_TO_cout2_s,              --                .data_cout2_s
			dout2_im             => CONNECTED_TO_dout2_im,             --                .data_dout2_im
			dout2_re             => CONNECTED_TO_dout2_re,             --                .data_dout2_re
			td_ifft_out_data_im  => CONNECTED_TO_td_ifft_out_data_im,  --                .data_td_ifft_out_data_im
			td_ifft_out_data_re  => CONNECTED_TO_td_ifft_out_data_re,  --                .data_td_ifft_out_data_re
			td_ifft_out_ch_s     => CONNECTED_TO_td_ifft_out_ch_s,     --                .channel_td_ifft_out_ch_s
			td_ifft_out_valid_s  => CONNECTED_TO_td_ifft_out_valid_s,  --                .valid_td_ifft_out_valid_s
			ifft_size_out_s      => CONNECTED_TO_ifft_size_out_s,      --                .data_ifft_size_out_s
			ifft_cp_out_s        => CONNECTED_TO_ifft_cp_out_s,        --                .data_ifft_cp_out_s
			fd_data_v_s          => CONNECTED_TO_fd_data_v_s,          --                .valid_fd_data_v_s
			fd_data_c_s          => CONNECTED_TO_fd_data_c_s,          --                .channel_fd_data_c_s
			fd_data_q_im         => CONNECTED_TO_fd_data_q_im,         --                .data_fd_data_q_im
			fd_data_q_re         => CONNECTED_TO_fd_data_q_re,         --                .data_fd_data_q_re
			fd_timeref_out_s     => CONNECTED_TO_fd_timeref_out_s      --                .data_fd_timeref_out_s
		);

