	component dxc_ss_top_dxc_ss_0 is
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
			DXC_DSP_CAPTURE_INST    : integer := 22
		);
		port (
			clk_csr                           : in  std_logic                                             := 'X';             -- clk
			clk_dsp                           : in  std_logic                                             := 'X';             -- clk
			rst_csr_n                         : in  std_logic                                             := 'X';             -- reset_n
			rst_dsp_n                         : in  std_logic                                             := 'X';             -- reset_n
			rst_soft_n                        : in  std_logic                                             := 'X';             -- rst_soft_n
			ifft_duc_sink_valid1              : in  std_logic                                             := 'X';             -- valid
			ifft_duc_sink_data1               : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- data
			ifft_duc_sink_channel1            : in  std_logic_vector(7 downto 0)                          := (others => 'X'); -- channel
			ifft_duc_sink_valid2              : in  std_logic                                             := 'X';             -- valid
			ifft_duc_sink_data2               : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- data
			ifft_duc_sink_channel2            : in  std_logic_vector(7 downto 0)                          := (others => 'X'); -- channel
			avst_sink_valid                   : in  std_logic                                             := 'X';             -- avst_sink_valid
			avst_sink_channel                 : in  std_logic_vector(7 downto 0)                          := (others => 'X'); -- avst_sink_channel
			avst_sink_data_l1                 : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- avst_sink_data_l1
			avst_sink_data_l2                 : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- avst_sink_data_l2
			avst_sink_data_l3                 : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- avst_sink_data_l3
			avst_sink_data_l4                 : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- avst_sink_data_l4
			avst_sink_data_l5                 : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- avst_sink_data_l5
			avst_sink_data_l6                 : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- avst_sink_data_l6
			avst_sink_data_l7                 : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- avst_sink_data_l7
			avst_sink_data_l8                 : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0) := (others => 'X'); -- avst_sink_data_l8
			duc_avst_source_valid             : out std_logic;                                                                -- duc_avst_source_valid
			duc_avst_source_data0             : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- duc_avst_source_data0
			duc_avst_source_data1             : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- duc_avst_source_data1
			duc_avst_source_data2             : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- duc_avst_source_data2
			duc_avst_source_data3             : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- duc_avst_source_data3
			duc_avst_source_data4             : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- duc_avst_source_data4
			duc_avst_source_data5             : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- duc_avst_source_data5
			duc_avst_source_data6             : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- duc_avst_source_data6
			duc_avst_source_data7             : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- duc_avst_source_data7
			duc_avst_source_channel           : out std_logic_vector(7 downto 0);                                             -- duc_avst_source_channel
			ddc_source_valid1                 : out std_logic;                                                                -- valid
			ddc_source_data1                  : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- data
			ddc_source_channel1               : out std_logic_vector(7 downto 0);                                             -- channel
			ddc_source_valid2                 : out std_logic;                                                                -- valid
			ddc_source_data2                  : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- data
			ddc_source_channel2               : out std_logic_vector(7 downto 0);                                             -- channel
			rfp_pul                           : in  std_logic                                             := 'X';             -- data
			bw_config_cc1                     : in  std_logic_vector(7 downto 0)                          := (others => 'X'); -- bw_config_cc1
			bw_config_cc2                     : in  std_logic_vector(7 downto 0)                          := (others => 'X'); -- bw_config_cc2
			dxc_avst_selctd_cap_intf_valid    : out std_logic;                                                                -- valid
			dxc_avst_selctd_cap_intf_data     : out std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0);                    -- data
			dxc_avst_selctd_cap_intf_chan     : out std_logic_vector(2 downto 0);                                             -- channel
			dxc_ss_config_csr_address         : in  std_logic_vector(6 downto 0)                          := (others => 'X'); -- address
			dxc_ss_config_csr_write           : in  std_logic                                             := 'X';             -- write
			dxc_ss_config_csr_writedata       : in  std_logic_vector(31 downto 0)                         := (others => 'X'); -- writedata
			dxc_ss_config_csr_readdata        : out std_logic_vector(31 downto 0);                                            -- readdata
			dxc_ss_config_csr_readdatavalid   : out std_logic;                                                                -- readdatavalid
			dxc_ss_config_csr_waitrequest     : out std_logic;                                                                -- waitrequest
			dxc_ss_config_csr_read            : in  std_logic                                             := 'X';             -- read
			duc_l1_busIn_writedata            : in  std_logic_vector(31 downto 0)                         := (others => 'X'); -- writedata
			duc_l1_busIn_address              : in  std_logic_vector(11 downto 0)                         := (others => 'X'); -- address
			duc_l1_busIn_write                : in  std_logic                                             := 'X';             -- write
			duc_l1_busIn_read                 : in  std_logic                                             := 'X';             -- read
			duc_l1_busOut_readdatavalid       : out std_logic;                                                                -- readdatavalid
			duc_l1_busOut_readdata            : out std_logic_vector(31 downto 0);                                            -- readdata
			duc_l1_busOut_waitrequest         : out std_logic;                                                                -- waitrequest
			ddc_l1_busIn_writedata            : in  std_logic_vector(31 downto 0)                         := (others => 'X'); -- writedata
			ddc_l1_busIn_address              : in  std_logic_vector(11 downto 0)                         := (others => 'X'); -- address
			ddc_l1_busIn_write                : in  std_logic                                             := 'X';             -- write
			ddc_l1_busIn_read                 : in  std_logic                                             := 'X';             -- read
			ddc_l1_busOut_readdatavalid       : out std_logic;                                                                -- readdatavalid
			ddc_l1_busOut_readdata            : out std_logic_vector(31 downto 0);                                            -- readdata
			ddc_l1_busOut_waitrequest         : out std_logic;                                                                -- waitrequest
			duc_l2_busIn_writedata            : in  std_logic_vector(31 downto 0)                         := (others => 'X'); -- writedata
			duc_l2_busIn_address              : in  std_logic_vector(11 downto 0)                         := (others => 'X'); -- address
			duc_l2_busIn_write                : in  std_logic                                             := 'X';             -- write
			duc_l2_busIn_read                 : in  std_logic                                             := 'X';             -- read
			duc_l2_busOut_readdatavalid       : out std_logic;                                                                -- readdatavalid
			duc_l2_busOut_readdata            : out std_logic_vector(31 downto 0);                                            -- readdata
			duc_l2_busOut_waitrequest         : out std_logic;                                                                -- waitrequest
			ddc_l2_busIn_writedata            : in  std_logic_vector(31 downto 0)                         := (others => 'X'); -- writedata
			ddc_l2_busIn_address              : in  std_logic_vector(11 downto 0)                         := (others => 'X'); -- address
			ddc_l2_busIn_write                : in  std_logic                                             := 'X';             -- write
			ddc_l2_busIn_read                 : in  std_logic                                             := 'X';             -- read
			ddc_l2_busOut_readdatavalid       : out std_logic;                                                                -- readdatavalid
			ddc_l2_busOut_readdata            : out std_logic_vector(31 downto 0);                                            -- readdata
			ddc_l2_busOut_waitrequest         : out std_logic;                                                                -- waitrequest
			ca_interp_busIn_writedata         : in  std_logic_vector(31 downto 0)                         := (others => 'X'); -- writedata
			ca_interp_busIn_address           : in  std_logic_vector(6 downto 0)                          := (others => 'X'); -- address
			ca_interp_busIn_write             : in  std_logic                                             := 'X';             -- write
			ca_interp_busIn_read              : in  std_logic                                             := 'X';             -- read
			ca_interp_busOut_readdatavalid    : out std_logic;                                                                -- readdatavalid
			ca_interp_busOut_readdata         : out std_logic_vector(31 downto 0);                                            -- readdata
			ca_interp_busOut_waitrequest      : out std_logic;                                                                -- waitrequest
			dec_dly_comp_busIn_writedata      : in  std_logic_vector(31 downto 0)                         := (others => 'X'); -- writedata
			dec_dly_comp_busIn_address        : in  std_logic_vector(6 downto 0)                          := (others => 'X'); -- address
			dec_dly_comp_busIn_write          : in  std_logic                                             := 'X';             -- write
			dec_dly_comp_busIn_read           : in  std_logic                                             := 'X';             -- read
			dec_dly_comp_busOut_readdatavalid : out std_logic;                                                                -- readdatavalid
			dec_dly_comp_busOut_readdata      : out std_logic_vector(31 downto 0);                                            -- readdata
			dec_dly_comp_busOut_waitrequest   : out std_logic;                                                                -- waitrequest
			interface_sel                     : in  std_logic_vector(31 downto 0)                         := (others => 'X')  -- data
		);
	end component dxc_ss_top_dxc_ss_0;

	u0 : component dxc_ss_top_dxc_ss_0
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
			DXC_DSP_CAPTURE_INST    => INTEGER_VALUE_FOR_DXC_DSP_CAPTURE_INST
		)
		port map (
			clk_csr                           => CONNECTED_TO_clk_csr,                           --                clock_csr.clk
			clk_dsp                           => CONNECTED_TO_clk_dsp,                           --                clock_dsp.clk
			rst_csr_n                         => CONNECTED_TO_rst_csr_n,                         --                rst_csr_n.reset_n
			rst_dsp_n                         => CONNECTED_TO_rst_dsp_n,                         --                rst_dsp_n.reset_n
			rst_soft_n                        => CONNECTED_TO_rst_soft_n,                        --                 soft_rst.rst_soft_n
			ifft_duc_sink_valid1              => CONNECTED_TO_ifft_duc_sink_valid1,              --         ifft_duc_sink_l1.valid
			ifft_duc_sink_data1               => CONNECTED_TO_ifft_duc_sink_data1,               --                         .data
			ifft_duc_sink_channel1            => CONNECTED_TO_ifft_duc_sink_channel1,            --                         .channel
			ifft_duc_sink_valid2              => CONNECTED_TO_ifft_duc_sink_valid2,              --         ifft_duc_sink_l2.valid
			ifft_duc_sink_data2               => CONNECTED_TO_ifft_duc_sink_data2,               --                         .data
			ifft_duc_sink_channel2            => CONNECTED_TO_ifft_duc_sink_channel2,            --                         .channel
			avst_sink_valid                   => CONNECTED_TO_avst_sink_valid,                   --            ddc_avst_sink.avst_sink_valid
			avst_sink_channel                 => CONNECTED_TO_avst_sink_channel,                 --                         .avst_sink_channel
			avst_sink_data_l1                 => CONNECTED_TO_avst_sink_data_l1,                 --                         .avst_sink_data_l1
			avst_sink_data_l2                 => CONNECTED_TO_avst_sink_data_l2,                 --                         .avst_sink_data_l2
			avst_sink_data_l3                 => CONNECTED_TO_avst_sink_data_l3,                 --                         .avst_sink_data_l3
			avst_sink_data_l4                 => CONNECTED_TO_avst_sink_data_l4,                 --                         .avst_sink_data_l4
			avst_sink_data_l5                 => CONNECTED_TO_avst_sink_data_l5,                 --                         .avst_sink_data_l5
			avst_sink_data_l6                 => CONNECTED_TO_avst_sink_data_l6,                 --                         .avst_sink_data_l6
			avst_sink_data_l7                 => CONNECTED_TO_avst_sink_data_l7,                 --                         .avst_sink_data_l7
			avst_sink_data_l8                 => CONNECTED_TO_avst_sink_data_l8,                 --                         .avst_sink_data_l8
			duc_avst_source_valid             => CONNECTED_TO_duc_avst_source_valid,             --          duc_avst_source.duc_avst_source_valid
			duc_avst_source_data0             => CONNECTED_TO_duc_avst_source_data0,             --                         .duc_avst_source_data0
			duc_avst_source_data1             => CONNECTED_TO_duc_avst_source_data1,             --                         .duc_avst_source_data1
			duc_avst_source_data2             => CONNECTED_TO_duc_avst_source_data2,             --                         .duc_avst_source_data2
			duc_avst_source_data3             => CONNECTED_TO_duc_avst_source_data3,             --                         .duc_avst_source_data3
			duc_avst_source_data4             => CONNECTED_TO_duc_avst_source_data4,             --                         .duc_avst_source_data4
			duc_avst_source_data5             => CONNECTED_TO_duc_avst_source_data5,             --                         .duc_avst_source_data5
			duc_avst_source_data6             => CONNECTED_TO_duc_avst_source_data6,             --                         .duc_avst_source_data6
			duc_avst_source_data7             => CONNECTED_TO_duc_avst_source_data7,             --                         .duc_avst_source_data7
			duc_avst_source_channel           => CONNECTED_TO_duc_avst_source_channel,           --                         .duc_avst_source_channel
			ddc_source_valid1                 => CONNECTED_TO_ddc_source_valid1,                 --            ddc_source_l1.valid
			ddc_source_data1                  => CONNECTED_TO_ddc_source_data1,                  --                         .data
			ddc_source_channel1               => CONNECTED_TO_ddc_source_channel1,               --                         .channel
			ddc_source_valid2                 => CONNECTED_TO_ddc_source_valid2,                 --            ddc_source_l2.valid
			ddc_source_data2                  => CONNECTED_TO_ddc_source_data2,                  --                         .data
			ddc_source_channel2               => CONNECTED_TO_ddc_source_channel2,               --                         .channel
			rfp_pul                           => CONNECTED_TO_rfp_pul,                           --                rfp_pulse.data
			bw_config_cc1                     => CONNECTED_TO_bw_config_cc1,                     --            bw_config_cc1.bw_config_cc1
			bw_config_cc2                     => CONNECTED_TO_bw_config_cc2,                     --            bw_config_cc2.bw_config_cc2
			dxc_avst_selctd_cap_intf_valid    => CONNECTED_TO_dxc_avst_selctd_cap_intf_valid,    -- dxc_avst_selctd_cap_intf.valid
			dxc_avst_selctd_cap_intf_data     => CONNECTED_TO_dxc_avst_selctd_cap_intf_data,     --                         .data
			dxc_avst_selctd_cap_intf_chan     => CONNECTED_TO_dxc_avst_selctd_cap_intf_chan,     --                         .channel
			dxc_ss_config_csr_address         => CONNECTED_TO_dxc_ss_config_csr_address,         --        dxc_ss_config_csr.address
			dxc_ss_config_csr_write           => CONNECTED_TO_dxc_ss_config_csr_write,           --                         .write
			dxc_ss_config_csr_writedata       => CONNECTED_TO_dxc_ss_config_csr_writedata,       --                         .writedata
			dxc_ss_config_csr_readdata        => CONNECTED_TO_dxc_ss_config_csr_readdata,        --                         .readdata
			dxc_ss_config_csr_readdatavalid   => CONNECTED_TO_dxc_ss_config_csr_readdatavalid,   --                         .readdatavalid
			dxc_ss_config_csr_waitrequest     => CONNECTED_TO_dxc_ss_config_csr_waitrequest,     --                         .waitrequest
			dxc_ss_config_csr_read            => CONNECTED_TO_dxc_ss_config_csr_read,            --                         .read
			duc_l1_busIn_writedata            => CONNECTED_TO_duc_l1_busIn_writedata,            --               duc_csr_l1.writedata
			duc_l1_busIn_address              => CONNECTED_TO_duc_l1_busIn_address,              --                         .address
			duc_l1_busIn_write                => CONNECTED_TO_duc_l1_busIn_write,                --                         .write
			duc_l1_busIn_read                 => CONNECTED_TO_duc_l1_busIn_read,                 --                         .read
			duc_l1_busOut_readdatavalid       => CONNECTED_TO_duc_l1_busOut_readdatavalid,       --                         .readdatavalid
			duc_l1_busOut_readdata            => CONNECTED_TO_duc_l1_busOut_readdata,            --                         .readdata
			duc_l1_busOut_waitrequest         => CONNECTED_TO_duc_l1_busOut_waitrequest,         --                         .waitrequest
			ddc_l1_busIn_writedata            => CONNECTED_TO_ddc_l1_busIn_writedata,            --               ddc_csr_l1.writedata
			ddc_l1_busIn_address              => CONNECTED_TO_ddc_l1_busIn_address,              --                         .address
			ddc_l1_busIn_write                => CONNECTED_TO_ddc_l1_busIn_write,                --                         .write
			ddc_l1_busIn_read                 => CONNECTED_TO_ddc_l1_busIn_read,                 --                         .read
			ddc_l1_busOut_readdatavalid       => CONNECTED_TO_ddc_l1_busOut_readdatavalid,       --                         .readdatavalid
			ddc_l1_busOut_readdata            => CONNECTED_TO_ddc_l1_busOut_readdata,            --                         .readdata
			ddc_l1_busOut_waitrequest         => CONNECTED_TO_ddc_l1_busOut_waitrequest,         --                         .waitrequest
			duc_l2_busIn_writedata            => CONNECTED_TO_duc_l2_busIn_writedata,            --               duc_csr_l2.writedata
			duc_l2_busIn_address              => CONNECTED_TO_duc_l2_busIn_address,              --                         .address
			duc_l2_busIn_write                => CONNECTED_TO_duc_l2_busIn_write,                --                         .write
			duc_l2_busIn_read                 => CONNECTED_TO_duc_l2_busIn_read,                 --                         .read
			duc_l2_busOut_readdatavalid       => CONNECTED_TO_duc_l2_busOut_readdatavalid,       --                         .readdatavalid
			duc_l2_busOut_readdata            => CONNECTED_TO_duc_l2_busOut_readdata,            --                         .readdata
			duc_l2_busOut_waitrequest         => CONNECTED_TO_duc_l2_busOut_waitrequest,         --                         .waitrequest
			ddc_l2_busIn_writedata            => CONNECTED_TO_ddc_l2_busIn_writedata,            --               ddc_csr_l2.writedata
			ddc_l2_busIn_address              => CONNECTED_TO_ddc_l2_busIn_address,              --                         .address
			ddc_l2_busIn_write                => CONNECTED_TO_ddc_l2_busIn_write,                --                         .write
			ddc_l2_busIn_read                 => CONNECTED_TO_ddc_l2_busIn_read,                 --                         .read
			ddc_l2_busOut_readdatavalid       => CONNECTED_TO_ddc_l2_busOut_readdatavalid,       --                         .readdatavalid
			ddc_l2_busOut_readdata            => CONNECTED_TO_ddc_l2_busOut_readdata,            --                         .readdata
			ddc_l2_busOut_waitrequest         => CONNECTED_TO_ddc_l2_busOut_waitrequest,         --                         .waitrequest
			ca_interp_busIn_writedata         => CONNECTED_TO_ca_interp_busIn_writedata,         --            ca_interp_csr.writedata
			ca_interp_busIn_address           => CONNECTED_TO_ca_interp_busIn_address,           --                         .address
			ca_interp_busIn_write             => CONNECTED_TO_ca_interp_busIn_write,             --                         .write
			ca_interp_busIn_read              => CONNECTED_TO_ca_interp_busIn_read,              --                         .read
			ca_interp_busOut_readdatavalid    => CONNECTED_TO_ca_interp_busOut_readdatavalid,    --                         .readdatavalid
			ca_interp_busOut_readdata         => CONNECTED_TO_ca_interp_busOut_readdata,         --                         .readdata
			ca_interp_busOut_waitrequest      => CONNECTED_TO_ca_interp_busOut_waitrequest,      --                         .waitrequest
			dec_dly_comp_busIn_writedata      => CONNECTED_TO_dec_dly_comp_busIn_writedata,      --         dec_dly_comp_csr.writedata
			dec_dly_comp_busIn_address        => CONNECTED_TO_dec_dly_comp_busIn_address,        --                         .address
			dec_dly_comp_busIn_write          => CONNECTED_TO_dec_dly_comp_busIn_write,          --                         .write
			dec_dly_comp_busIn_read           => CONNECTED_TO_dec_dly_comp_busIn_read,           --                         .read
			dec_dly_comp_busOut_readdatavalid => CONNECTED_TO_dec_dly_comp_busOut_readdatavalid, --                         .readdatavalid
			dec_dly_comp_busOut_readdata      => CONNECTED_TO_dec_dly_comp_busOut_readdata,      --                         .readdata
			dec_dly_comp_busOut_waitrequest   => CONNECTED_TO_dec_dly_comp_busOut_waitrequest,   --                         .waitrequest
			interface_sel                     => CONNECTED_TO_interface_sel                      --            interface_sel.data
		);

