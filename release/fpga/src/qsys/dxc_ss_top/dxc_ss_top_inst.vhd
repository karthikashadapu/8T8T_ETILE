	component dxc_ss_top is
		port (
			csr_in_clk_clk                          : in  std_logic                     := 'X';             -- clk
			dsp_in_clk_clk                          : in  std_logic                     := 'X';             -- clk
			soft_rst_rst_soft_n                     : in  std_logic                     := 'X';             -- rst_soft_n
			ifft_duc_sink_l1_valid                  : in  std_logic                     := 'X';             -- valid
			ifft_duc_sink_l1_data                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			ifft_duc_sink_l1_channel                : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- channel
			ifft_duc_sink_l2_valid                  : in  std_logic                     := 'X';             -- valid
			ifft_duc_sink_l2_data                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			ifft_duc_sink_l2_channel                : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- channel
			ddc_avst_sink_avst_sink_valid           : in  std_logic                     := 'X';             -- avst_sink_valid
			ddc_avst_sink_avst_sink_channel         : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- avst_sink_channel
			ddc_avst_sink_avst_sink_data_l1         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- avst_sink_data_l1
			ddc_avst_sink_avst_sink_data_l2         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- avst_sink_data_l2
			ddc_avst_sink_avst_sink_data_l3         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- avst_sink_data_l3
			ddc_avst_sink_avst_sink_data_l4         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- avst_sink_data_l4
			ddc_avst_sink_avst_sink_data_l5         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- avst_sink_data_l5
			ddc_avst_sink_avst_sink_data_l6         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- avst_sink_data_l6
			ddc_avst_sink_avst_sink_data_l7         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- avst_sink_data_l7
			ddc_avst_sink_avst_sink_data_l8         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- avst_sink_data_l8
			duc_avst_source_duc_avst_source_valid   : out std_logic;                                        -- duc_avst_source_valid
			duc_avst_source_duc_avst_source_data0   : out std_logic_vector(31 downto 0);                    -- duc_avst_source_data0
			duc_avst_source_duc_avst_source_data1   : out std_logic_vector(31 downto 0);                    -- duc_avst_source_data1
			duc_avst_source_duc_avst_source_data2   : out std_logic_vector(31 downto 0);                    -- duc_avst_source_data2
			duc_avst_source_duc_avst_source_data3   : out std_logic_vector(31 downto 0);                    -- duc_avst_source_data3
			duc_avst_source_duc_avst_source_data4   : out std_logic_vector(31 downto 0);                    -- duc_avst_source_data4
			duc_avst_source_duc_avst_source_data5   : out std_logic_vector(31 downto 0);                    -- duc_avst_source_data5
			duc_avst_source_duc_avst_source_data6   : out std_logic_vector(31 downto 0);                    -- duc_avst_source_data6
			duc_avst_source_duc_avst_source_data7   : out std_logic_vector(31 downto 0);                    -- duc_avst_source_data7
			duc_avst_source_duc_avst_source_channel : out std_logic_vector(7 downto 0);                     -- duc_avst_source_channel
			ddc_source_l1_valid                     : out std_logic;                                        -- valid
			ddc_source_l1_data                      : out std_logic_vector(31 downto 0);                    -- data
			ddc_source_l1_channel                   : out std_logic_vector(7 downto 0);                     -- channel
			ddc_source_l2_valid                     : out std_logic;                                        -- valid
			ddc_source_l2_data                      : out std_logic_vector(31 downto 0);                    -- data
			ddc_source_l2_channel                   : out std_logic_vector(7 downto 0);                     -- channel
			rfp_pulse_data                          : in  std_logic                     := 'X';             -- data
			bw_config_cc1_bw_config_cc1             : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- bw_config_cc1
			bw_config_cc2_bw_config_cc2             : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- bw_config_cc2
			dxc_avst_selctd_cap_intf_valid          : out std_logic;                                        -- valid
			dxc_avst_selctd_cap_intf_data           : out std_logic_vector(31 downto 0);                    -- data
			dxc_avst_selctd_cap_intf_channel        : out std_logic_vector(2 downto 0);                     -- channel
			dxc_ss_0_interface_sel_data             : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data
			h2f_lw_bridge_s0_waitrequest            : out std_logic;                                        -- waitrequest
			h2f_lw_bridge_s0_readdata               : out std_logic_vector(31 downto 0);                    -- readdata
			h2f_lw_bridge_s0_readdatavalid          : out std_logic;                                        -- readdatavalid
			h2f_lw_bridge_s0_burstcount             : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			h2f_lw_bridge_s0_writedata              : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			h2f_lw_bridge_s0_address                : in  std_logic_vector(16 downto 0) := (others => 'X'); -- address
			h2f_lw_bridge_s0_write                  : in  std_logic                     := 'X';             -- write
			h2f_lw_bridge_s0_read                   : in  std_logic                     := 'X';             -- read
			h2f_lw_bridge_s0_byteenable             : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			h2f_lw_bridge_s0_debugaccess            : in  std_logic                     := 'X';             -- debugaccess
			csr_in_reset_reset                      : in  std_logic                     := 'X';             -- reset
			dsp_in_reset_reset_n                    : in  std_logic                     := 'X'              -- reset_n
		);
	end component dxc_ss_top;

	u0 : component dxc_ss_top
		port map (
			csr_in_clk_clk                          => CONNECTED_TO_csr_in_clk_clk,                          --               csr_in_clk.clk
			dsp_in_clk_clk                          => CONNECTED_TO_dsp_in_clk_clk,                          --               dsp_in_clk.clk
			soft_rst_rst_soft_n                     => CONNECTED_TO_soft_rst_rst_soft_n,                     --                 soft_rst.rst_soft_n
			ifft_duc_sink_l1_valid                  => CONNECTED_TO_ifft_duc_sink_l1_valid,                  --         ifft_duc_sink_l1.valid
			ifft_duc_sink_l1_data                   => CONNECTED_TO_ifft_duc_sink_l1_data,                   --                         .data
			ifft_duc_sink_l1_channel                => CONNECTED_TO_ifft_duc_sink_l1_channel,                --                         .channel
			ifft_duc_sink_l2_valid                  => CONNECTED_TO_ifft_duc_sink_l2_valid,                  --         ifft_duc_sink_l2.valid
			ifft_duc_sink_l2_data                   => CONNECTED_TO_ifft_duc_sink_l2_data,                   --                         .data
			ifft_duc_sink_l2_channel                => CONNECTED_TO_ifft_duc_sink_l2_channel,                --                         .channel
			ddc_avst_sink_avst_sink_valid           => CONNECTED_TO_ddc_avst_sink_avst_sink_valid,           --            ddc_avst_sink.avst_sink_valid
			ddc_avst_sink_avst_sink_channel         => CONNECTED_TO_ddc_avst_sink_avst_sink_channel,         --                         .avst_sink_channel
			ddc_avst_sink_avst_sink_data_l1         => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l1,         --                         .avst_sink_data_l1
			ddc_avst_sink_avst_sink_data_l2         => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l2,         --                         .avst_sink_data_l2
			ddc_avst_sink_avst_sink_data_l3         => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l3,         --                         .avst_sink_data_l3
			ddc_avst_sink_avst_sink_data_l4         => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l4,         --                         .avst_sink_data_l4
			ddc_avst_sink_avst_sink_data_l5         => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l5,         --                         .avst_sink_data_l5
			ddc_avst_sink_avst_sink_data_l6         => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l6,         --                         .avst_sink_data_l6
			ddc_avst_sink_avst_sink_data_l7         => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l7,         --                         .avst_sink_data_l7
			ddc_avst_sink_avst_sink_data_l8         => CONNECTED_TO_ddc_avst_sink_avst_sink_data_l8,         --                         .avst_sink_data_l8
			duc_avst_source_duc_avst_source_valid   => CONNECTED_TO_duc_avst_source_duc_avst_source_valid,   --          duc_avst_source.duc_avst_source_valid
			duc_avst_source_duc_avst_source_data0   => CONNECTED_TO_duc_avst_source_duc_avst_source_data0,   --                         .duc_avst_source_data0
			duc_avst_source_duc_avst_source_data1   => CONNECTED_TO_duc_avst_source_duc_avst_source_data1,   --                         .duc_avst_source_data1
			duc_avst_source_duc_avst_source_data2   => CONNECTED_TO_duc_avst_source_duc_avst_source_data2,   --                         .duc_avst_source_data2
			duc_avst_source_duc_avst_source_data3   => CONNECTED_TO_duc_avst_source_duc_avst_source_data3,   --                         .duc_avst_source_data3
			duc_avst_source_duc_avst_source_data4   => CONNECTED_TO_duc_avst_source_duc_avst_source_data4,   --                         .duc_avst_source_data4
			duc_avst_source_duc_avst_source_data5   => CONNECTED_TO_duc_avst_source_duc_avst_source_data5,   --                         .duc_avst_source_data5
			duc_avst_source_duc_avst_source_data6   => CONNECTED_TO_duc_avst_source_duc_avst_source_data6,   --                         .duc_avst_source_data6
			duc_avst_source_duc_avst_source_data7   => CONNECTED_TO_duc_avst_source_duc_avst_source_data7,   --                         .duc_avst_source_data7
			duc_avst_source_duc_avst_source_channel => CONNECTED_TO_duc_avst_source_duc_avst_source_channel, --                         .duc_avst_source_channel
			ddc_source_l1_valid                     => CONNECTED_TO_ddc_source_l1_valid,                     --            ddc_source_l1.valid
			ddc_source_l1_data                      => CONNECTED_TO_ddc_source_l1_data,                      --                         .data
			ddc_source_l1_channel                   => CONNECTED_TO_ddc_source_l1_channel,                   --                         .channel
			ddc_source_l2_valid                     => CONNECTED_TO_ddc_source_l2_valid,                     --            ddc_source_l2.valid
			ddc_source_l2_data                      => CONNECTED_TO_ddc_source_l2_data,                      --                         .data
			ddc_source_l2_channel                   => CONNECTED_TO_ddc_source_l2_channel,                   --                         .channel
			rfp_pulse_data                          => CONNECTED_TO_rfp_pulse_data,                          --                rfp_pulse.data
			bw_config_cc1_bw_config_cc1             => CONNECTED_TO_bw_config_cc1_bw_config_cc1,             --            bw_config_cc1.bw_config_cc1
			bw_config_cc2_bw_config_cc2             => CONNECTED_TO_bw_config_cc2_bw_config_cc2,             --            bw_config_cc2.bw_config_cc2
			dxc_avst_selctd_cap_intf_valid          => CONNECTED_TO_dxc_avst_selctd_cap_intf_valid,          -- dxc_avst_selctd_cap_intf.valid
			dxc_avst_selctd_cap_intf_data           => CONNECTED_TO_dxc_avst_selctd_cap_intf_data,           --                         .data
			dxc_avst_selctd_cap_intf_channel        => CONNECTED_TO_dxc_avst_selctd_cap_intf_channel,        --                         .channel
			dxc_ss_0_interface_sel_data             => CONNECTED_TO_dxc_ss_0_interface_sel_data,             --   dxc_ss_0_interface_sel.data
			h2f_lw_bridge_s0_waitrequest            => CONNECTED_TO_h2f_lw_bridge_s0_waitrequest,            --         h2f_lw_bridge_s0.waitrequest
			h2f_lw_bridge_s0_readdata               => CONNECTED_TO_h2f_lw_bridge_s0_readdata,               --                         .readdata
			h2f_lw_bridge_s0_readdatavalid          => CONNECTED_TO_h2f_lw_bridge_s0_readdatavalid,          --                         .readdatavalid
			h2f_lw_bridge_s0_burstcount             => CONNECTED_TO_h2f_lw_bridge_s0_burstcount,             --                         .burstcount
			h2f_lw_bridge_s0_writedata              => CONNECTED_TO_h2f_lw_bridge_s0_writedata,              --                         .writedata
			h2f_lw_bridge_s0_address                => CONNECTED_TO_h2f_lw_bridge_s0_address,                --                         .address
			h2f_lw_bridge_s0_write                  => CONNECTED_TO_h2f_lw_bridge_s0_write,                  --                         .write
			h2f_lw_bridge_s0_read                   => CONNECTED_TO_h2f_lw_bridge_s0_read,                   --                         .read
			h2f_lw_bridge_s0_byteenable             => CONNECTED_TO_h2f_lw_bridge_s0_byteenable,             --                         .byteenable
			h2f_lw_bridge_s0_debugaccess            => CONNECTED_TO_h2f_lw_bridge_s0_debugaccess,            --                         .debugaccess
			csr_in_reset_reset                      => CONNECTED_TO_csr_in_reset_reset,                      --             csr_in_reset.reset
			dsp_in_reset_reset_n                    => CONNECTED_TO_dsp_in_reset_reset_n                     --             dsp_in_reset.reset_n
		);

