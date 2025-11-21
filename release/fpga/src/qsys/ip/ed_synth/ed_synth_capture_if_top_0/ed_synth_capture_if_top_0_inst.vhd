	component ed_synth_capture_if_top_0 is
		generic (
			NUM_OF_ANT              : integer := 8;
			CAPTURE_DMA_WIDTH       : integer := 128;
			ECPRI_CAPTURE_INSTANCES : integer := 2;
			DSP_CAPTURE_INSTANCES   : integer := 30;
			LPHY_DSP_CAPTURE_INST   : integer := 6;
			DXC_DSP_CAPTURE_INST    : integer := 22;
			IQ_DATAWIDTH            : integer := 32;
			NUM_OF_FFT              : integer := 2;
			CPRI_ETH_DATAWIDTH      : integer := 128;
			XRAN_ETH_DATAWIDTH      : integer := 128;
			CH_DW                   : integer := 8;
			NUM_OF_PRACH            : integer := 2;
			ANTENNA_DWIDTH          : integer := 3
		);
		port (
			csr_dsp_capture_address          : in  std_logic_vector(4 downto 0)                               := (others => 'X'); -- address
			csr_dsp_capture_write            : in  std_logic                                                  := 'X';             -- write
			csr_dsp_capture_read             : in  std_logic                                                  := 'X';             -- read
			csr_dsp_capture_writedata        : in  std_logic_vector(31 downto 0)                              := (others => 'X'); -- writedata
			csr_dsp_capture_readdata         : out std_logic_vector(31 downto 0);                                                 -- readdata
			csr_dsp_capture_waitrequest      : out std_logic;                                                                     -- waitrequest
			csr_dsp_capture_readdatavalid    : out std_logic;                                                                     -- readdatavalid
			clk_dsp                          : in  std_logic                                                  := 'X';             -- clk
			clk_csr                          : in  std_logic                                                  := 'X';             -- clk
			clk_eth_xran_ul                  : in  std_logic                                                  := 'X';             -- clk
			clk_capture_dma                  : in  std_logic                                                  := 'X';             -- clk
			rst_csr_n                        : in  std_logic                                                  := 'X';             -- reset_n
			rst_dsp_n                        : in  std_logic                                                  := 'X';             -- reset_n
			rst_eth_xran_n_ul                : in  std_logic                                                  := 'X';             -- reset_n
			rst_capture_dma_n                : in  std_logic                                                  := 'X';             -- reset_n
			rst_soft_n                       : in  std_logic                                                  := 'X';             -- rst_soft_n
			avst_src_capture_valid           : out std_logic;                                                                     -- valid
			avst_src_capture_data            : out std_logic_vector((((CAPTURE_DMA_WIDTH-1)-0)+1)-1 downto 0);                    -- data
			avst_src_capture_ready           : in  std_logic                                                  := 'X';             -- ready
			radio_config_status              : in  std_logic_vector(55 downto 0)                              := (others => 'X'); -- radio_config_status
			lphy_avst_sink_dsp_capture_valid : in  std_logic                                                  := 'X';             -- valid
			lphy_avst_sink_dsp_capture_data  : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0)      := (others => 'X'); -- data
			lphy_avst_sink_dsp_capture_chan  : in  std_logic_vector((((ANTENNA_DWIDTH-1)-0)+1)-1 downto 0)    := (others => 'X'); -- channel
			dxc_avst_sink_dsp_capture_valid  : in  std_logic                                                  := 'X';             -- valid
			dxc_avst_sink_dsp_capture_data   : in  std_logic_vector((((IQ_DATAWIDTH-1)-0)+1)-1 downto 0)      := (others => 'X'); -- data
			dxc_avst_sink_dsp_capture_chan   : in  std_logic_vector((((ANTENNA_DWIDTH-1)-0)+1)-1 downto 0)    := (others => 'X'); -- channel
			interface_sel                    : out std_logic_vector(31 downto 0)                                                  -- data
		);
	end component ed_synth_capture_if_top_0;

	u0 : component ed_synth_capture_if_top_0
		generic map (
			NUM_OF_ANT              => INTEGER_VALUE_FOR_NUM_OF_ANT,
			CAPTURE_DMA_WIDTH       => INTEGER_VALUE_FOR_CAPTURE_DMA_WIDTH,
			ECPRI_CAPTURE_INSTANCES => INTEGER_VALUE_FOR_ECPRI_CAPTURE_INSTANCES,
			DSP_CAPTURE_INSTANCES   => INTEGER_VALUE_FOR_DSP_CAPTURE_INSTANCES,
			LPHY_DSP_CAPTURE_INST   => INTEGER_VALUE_FOR_LPHY_DSP_CAPTURE_INST,
			DXC_DSP_CAPTURE_INST    => INTEGER_VALUE_FOR_DXC_DSP_CAPTURE_INST,
			IQ_DATAWIDTH            => INTEGER_VALUE_FOR_IQ_DATAWIDTH,
			NUM_OF_FFT              => INTEGER_VALUE_FOR_NUM_OF_FFT,
			CPRI_ETH_DATAWIDTH      => INTEGER_VALUE_FOR_CPRI_ETH_DATAWIDTH,
			XRAN_ETH_DATAWIDTH      => INTEGER_VALUE_FOR_XRAN_ETH_DATAWIDTH,
			CH_DW                   => INTEGER_VALUE_FOR_CH_DW,
			NUM_OF_PRACH            => INTEGER_VALUE_FOR_NUM_OF_PRACH,
			ANTENNA_DWIDTH          => INTEGER_VALUE_FOR_ANTENNA_DWIDTH
		)
		port map (
			csr_dsp_capture_address          => CONNECTED_TO_csr_dsp_capture_address,          --            csr_dsp_capture.address
			csr_dsp_capture_write            => CONNECTED_TO_csr_dsp_capture_write,            --                           .write
			csr_dsp_capture_read             => CONNECTED_TO_csr_dsp_capture_read,             --                           .read
			csr_dsp_capture_writedata        => CONNECTED_TO_csr_dsp_capture_writedata,        --                           .writedata
			csr_dsp_capture_readdata         => CONNECTED_TO_csr_dsp_capture_readdata,         --                           .readdata
			csr_dsp_capture_waitrequest      => CONNECTED_TO_csr_dsp_capture_waitrequest,      --                           .waitrequest
			csr_dsp_capture_readdatavalid    => CONNECTED_TO_csr_dsp_capture_readdatavalid,    --                           .readdatavalid
			clk_dsp                          => CONNECTED_TO_clk_dsp,                          --                  clock_dsp.clk
			clk_csr                          => CONNECTED_TO_clk_csr,                          --                  clock_csr.clk
			clk_eth_xran_ul                  => CONNECTED_TO_clk_eth_xran_ul,                  --                  clock_eth.clk
			clk_capture_dma                  => CONNECTED_TO_clk_capture_dma,                  --                  clock_dma.clk
			rst_csr_n                        => CONNECTED_TO_rst_csr_n,                        --                reset_csr_n.reset_n
			rst_dsp_n                        => CONNECTED_TO_rst_dsp_n,                        --                reset_dsp_n.reset_n
			rst_eth_xran_n_ul                => CONNECTED_TO_rst_eth_xran_n_ul,                --                reset_eth_n.reset_n
			rst_capture_dma_n                => CONNECTED_TO_rst_capture_dma_n,                --                reset_dma_n.reset_n
			rst_soft_n                       => CONNECTED_TO_rst_soft_n,                       --               reset_soft_n.rst_soft_n
			avst_src_capture_valid           => CONNECTED_TO_avst_src_capture_valid,           --        avst_source_capture.valid
			avst_src_capture_data            => CONNECTED_TO_avst_src_capture_data,            --                           .data
			avst_src_capture_ready           => CONNECTED_TO_avst_src_capture_ready,           --                           .ready
			radio_config_status              => CONNECTED_TO_radio_config_status,              --        radio_config_status.radio_config_status
			lphy_avst_sink_dsp_capture_valid => CONNECTED_TO_lphy_avst_sink_dsp_capture_valid, -- lphy_avst_sink_dsp_capture.valid
			lphy_avst_sink_dsp_capture_data  => CONNECTED_TO_lphy_avst_sink_dsp_capture_data,  --                           .data
			lphy_avst_sink_dsp_capture_chan  => CONNECTED_TO_lphy_avst_sink_dsp_capture_chan,  --                           .channel
			dxc_avst_sink_dsp_capture_valid  => CONNECTED_TO_dxc_avst_sink_dsp_capture_valid,  --  dxc_avst_sink_dsp_capture.valid
			dxc_avst_sink_dsp_capture_data   => CONNECTED_TO_dxc_avst_sink_dsp_capture_data,   --                           .data
			dxc_avst_sink_dsp_capture_chan   => CONNECTED_TO_dxc_avst_sink_dsp_capture_chan,   --                           .channel
			interface_sel                    => CONNECTED_TO_interface_sel                     --              interface_sel.data
		);

