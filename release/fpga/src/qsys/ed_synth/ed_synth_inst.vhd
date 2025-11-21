	component ed_synth is
		port (
			capture_if_reset_soft_n_rst_soft_n                 : in  std_logic                      := 'X';             -- rst_soft_n
			capture_if_radio_config_status_radio_config_status : in  std_logic_vector(55 downto 0)  := (others => 'X'); -- radio_config_status
			lphy_avst_sink_dsp_capture_valid                   : in  std_logic                      := 'X';             -- valid
			lphy_avst_sink_dsp_capture_data                    : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			lphy_avst_sink_dsp_capture_channel                 : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- channel
			dxc_avst_sink_dsp_capture_valid                    : in  std_logic                      := 'X';             -- valid
			dxc_avst_sink_dsp_capture_data                     : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- data
			dxc_avst_sink_dsp_capture_channel                  : in  std_logic_vector(2 downto 0)   := (others => 'X'); -- channel
			interface_sel_data                                 : out std_logic_vector(31 downto 0);                     -- data
			dsp_in_clk_clk                                     : in  std_logic                      := 'X';             -- clk
			eth_in_clk_clk                                     : in  std_logic                      := 'X';             -- clk
			clock_csr_clk                                      : in  std_logic                      := 'X';             -- clk
			clock_bridge_dspby2_in_clk_clk                     : in  std_logic                      := 'X';             -- clk
			ed_synth_h2f_bridge_s0_waitrequest                 : out std_logic;                                         -- waitrequest
			ed_synth_h2f_bridge_s0_readdata                    : out std_logic_vector(511 downto 0);                    -- readdata
			ed_synth_h2f_bridge_s0_readdatavalid               : out std_logic;                                         -- readdatavalid
			ed_synth_h2f_bridge_s0_burstcount                  : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			ed_synth_h2f_bridge_s0_writedata                   : in  std_logic_vector(511 downto 0) := (others => 'X'); -- writedata
			ed_synth_h2f_bridge_s0_address                     : in  std_logic_vector(27 downto 0)  := (others => 'X'); -- address
			ed_synth_h2f_bridge_s0_write                       : in  std_logic                      := 'X';             -- write
			ed_synth_h2f_bridge_s0_read                        : in  std_logic                      := 'X';             -- read
			ed_synth_h2f_bridge_s0_byteenable                  : in  std_logic_vector(63 downto 0)  := (others => 'X'); -- byteenable
			ed_synth_h2f_bridge_s0_debugaccess                 : in  std_logic                      := 'X';             -- debugaccess
			h2f_lw_bridge_s0_waitrequest                       : out std_logic;                                         -- waitrequest
			h2f_lw_bridge_s0_readdata                          : out std_logic_vector(31 downto 0);                     -- readdata
			h2f_lw_bridge_s0_readdatavalid                     : out std_logic;                                         -- readdatavalid
			h2f_lw_bridge_s0_burstcount                        : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- burstcount
			h2f_lw_bridge_s0_writedata                         : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			h2f_lw_bridge_s0_address                           : in  std_logic_vector(12 downto 0)  := (others => 'X'); -- address
			h2f_lw_bridge_s0_write                             : in  std_logic                      := 'X';             -- write
			h2f_lw_bridge_s0_read                              : in  std_logic                      := 'X';             -- read
			h2f_lw_bridge_s0_byteenable                        : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			h2f_lw_bridge_s0_debugaccess                       : in  std_logic                      := 'X';             -- debugaccess
			dsp_in_reset_reset_n                               : in  std_logic                      := 'X';             -- reset_n
			eth_in_reset_reset_n                               : in  std_logic                      := 'X';             -- reset_n
			reset_csr_reset_n                                  : in  std_logic                      := 'X'              -- reset_n
		);
	end component ed_synth;

	u0 : component ed_synth
		port map (
			capture_if_reset_soft_n_rst_soft_n                 => CONNECTED_TO_capture_if_reset_soft_n_rst_soft_n,                 --        capture_if_reset_soft_n.rst_soft_n
			capture_if_radio_config_status_radio_config_status => CONNECTED_TO_capture_if_radio_config_status_radio_config_status, -- capture_if_radio_config_status.radio_config_status
			lphy_avst_sink_dsp_capture_valid                   => CONNECTED_TO_lphy_avst_sink_dsp_capture_valid,                   --     lphy_avst_sink_dsp_capture.valid
			lphy_avst_sink_dsp_capture_data                    => CONNECTED_TO_lphy_avst_sink_dsp_capture_data,                    --                               .data
			lphy_avst_sink_dsp_capture_channel                 => CONNECTED_TO_lphy_avst_sink_dsp_capture_channel,                 --                               .channel
			dxc_avst_sink_dsp_capture_valid                    => CONNECTED_TO_dxc_avst_sink_dsp_capture_valid,                    --      dxc_avst_sink_dsp_capture.valid
			dxc_avst_sink_dsp_capture_data                     => CONNECTED_TO_dxc_avst_sink_dsp_capture_data,                     --                               .data
			dxc_avst_sink_dsp_capture_channel                  => CONNECTED_TO_dxc_avst_sink_dsp_capture_channel,                  --                               .channel
			interface_sel_data                                 => CONNECTED_TO_interface_sel_data,                                 --                  interface_sel.data
			dsp_in_clk_clk                                     => CONNECTED_TO_dsp_in_clk_clk,                                     --                     dsp_in_clk.clk
			eth_in_clk_clk                                     => CONNECTED_TO_eth_in_clk_clk,                                     --                     eth_in_clk.clk
			clock_csr_clk                                      => CONNECTED_TO_clock_csr_clk,                                      --                      clock_csr.clk
			clock_bridge_dspby2_in_clk_clk                     => CONNECTED_TO_clock_bridge_dspby2_in_clk_clk,                     --     clock_bridge_dspby2_in_clk.clk
			ed_synth_h2f_bridge_s0_waitrequest                 => CONNECTED_TO_ed_synth_h2f_bridge_s0_waitrequest,                 --         ed_synth_h2f_bridge_s0.waitrequest
			ed_synth_h2f_bridge_s0_readdata                    => CONNECTED_TO_ed_synth_h2f_bridge_s0_readdata,                    --                               .readdata
			ed_synth_h2f_bridge_s0_readdatavalid               => CONNECTED_TO_ed_synth_h2f_bridge_s0_readdatavalid,               --                               .readdatavalid
			ed_synth_h2f_bridge_s0_burstcount                  => CONNECTED_TO_ed_synth_h2f_bridge_s0_burstcount,                  --                               .burstcount
			ed_synth_h2f_bridge_s0_writedata                   => CONNECTED_TO_ed_synth_h2f_bridge_s0_writedata,                   --                               .writedata
			ed_synth_h2f_bridge_s0_address                     => CONNECTED_TO_ed_synth_h2f_bridge_s0_address,                     --                               .address
			ed_synth_h2f_bridge_s0_write                       => CONNECTED_TO_ed_synth_h2f_bridge_s0_write,                       --                               .write
			ed_synth_h2f_bridge_s0_read                        => CONNECTED_TO_ed_synth_h2f_bridge_s0_read,                        --                               .read
			ed_synth_h2f_bridge_s0_byteenable                  => CONNECTED_TO_ed_synth_h2f_bridge_s0_byteenable,                  --                               .byteenable
			ed_synth_h2f_bridge_s0_debugaccess                 => CONNECTED_TO_ed_synth_h2f_bridge_s0_debugaccess,                 --                               .debugaccess
			h2f_lw_bridge_s0_waitrequest                       => CONNECTED_TO_h2f_lw_bridge_s0_waitrequest,                       --               h2f_lw_bridge_s0.waitrequest
			h2f_lw_bridge_s0_readdata                          => CONNECTED_TO_h2f_lw_bridge_s0_readdata,                          --                               .readdata
			h2f_lw_bridge_s0_readdatavalid                     => CONNECTED_TO_h2f_lw_bridge_s0_readdatavalid,                     --                               .readdatavalid
			h2f_lw_bridge_s0_burstcount                        => CONNECTED_TO_h2f_lw_bridge_s0_burstcount,                        --                               .burstcount
			h2f_lw_bridge_s0_writedata                         => CONNECTED_TO_h2f_lw_bridge_s0_writedata,                         --                               .writedata
			h2f_lw_bridge_s0_address                           => CONNECTED_TO_h2f_lw_bridge_s0_address,                           --                               .address
			h2f_lw_bridge_s0_write                             => CONNECTED_TO_h2f_lw_bridge_s0_write,                             --                               .write
			h2f_lw_bridge_s0_read                              => CONNECTED_TO_h2f_lw_bridge_s0_read,                              --                               .read
			h2f_lw_bridge_s0_byteenable                        => CONNECTED_TO_h2f_lw_bridge_s0_byteenable,                        --                               .byteenable
			h2f_lw_bridge_s0_debugaccess                       => CONNECTED_TO_h2f_lw_bridge_s0_debugaccess,                       --                               .debugaccess
			dsp_in_reset_reset_n                               => CONNECTED_TO_dsp_in_reset_reset_n,                               --                   dsp_in_reset.reset_n
			eth_in_reset_reset_n                               => CONNECTED_TO_eth_in_reset_reset_n,                               --                   eth_in_reset.reset_n
			reset_csr_reset_n                                  => CONNECTED_TO_reset_csr_reset_n                                   --                      reset_csr.reset_n
		);

