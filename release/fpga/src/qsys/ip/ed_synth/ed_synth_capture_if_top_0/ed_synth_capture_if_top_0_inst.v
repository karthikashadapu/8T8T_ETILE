	ed_synth_capture_if_top_0 #(
		.NUM_OF_ANT              (INTEGER_VALUE_FOR_NUM_OF_ANT),
		.CAPTURE_DMA_WIDTH       (INTEGER_VALUE_FOR_CAPTURE_DMA_WIDTH),
		.ECPRI_CAPTURE_INSTANCES (INTEGER_VALUE_FOR_ECPRI_CAPTURE_INSTANCES),
		.DSP_CAPTURE_INSTANCES   (INTEGER_VALUE_FOR_DSP_CAPTURE_INSTANCES),
		.LPHY_DSP_CAPTURE_INST   (INTEGER_VALUE_FOR_LPHY_DSP_CAPTURE_INST),
		.DXC_DSP_CAPTURE_INST    (INTEGER_VALUE_FOR_DXC_DSP_CAPTURE_INST),
		.IQ_DATAWIDTH            (INTEGER_VALUE_FOR_IQ_DATAWIDTH),
		.NUM_OF_FFT              (INTEGER_VALUE_FOR_NUM_OF_FFT),
		.CPRI_ETH_DATAWIDTH      (INTEGER_VALUE_FOR_CPRI_ETH_DATAWIDTH),
		.XRAN_ETH_DATAWIDTH      (INTEGER_VALUE_FOR_XRAN_ETH_DATAWIDTH),
		.CH_DW                   (INTEGER_VALUE_FOR_CH_DW),
		.NUM_OF_PRACH            (INTEGER_VALUE_FOR_NUM_OF_PRACH),
		.ANTENNA_DWIDTH          (INTEGER_VALUE_FOR_ANTENNA_DWIDTH)
	) u0 (
		.csr_dsp_capture_address          (_connected_to_csr_dsp_capture_address_),          //   input,                              width = 5,            csr_dsp_capture.address
		.csr_dsp_capture_write            (_connected_to_csr_dsp_capture_write_),            //   input,                              width = 1,                           .write
		.csr_dsp_capture_read             (_connected_to_csr_dsp_capture_read_),             //   input,                              width = 1,                           .read
		.csr_dsp_capture_writedata        (_connected_to_csr_dsp_capture_writedata_),        //   input,                             width = 32,                           .writedata
		.csr_dsp_capture_readdata         (_connected_to_csr_dsp_capture_readdata_),         //  output,                             width = 32,                           .readdata
		.csr_dsp_capture_waitrequest      (_connected_to_csr_dsp_capture_waitrequest_),      //  output,                              width = 1,                           .waitrequest
		.csr_dsp_capture_readdatavalid    (_connected_to_csr_dsp_capture_readdatavalid_),    //  output,                              width = 1,                           .readdatavalid
		.clk_dsp                          (_connected_to_clk_dsp_),                          //   input,                              width = 1,                  clock_dsp.clk
		.clk_csr                          (_connected_to_clk_csr_),                          //   input,                              width = 1,                  clock_csr.clk
		.clk_eth_xran_ul                  (_connected_to_clk_eth_xran_ul_),                  //   input,                              width = 1,                  clock_eth.clk
		.clk_capture_dma                  (_connected_to_clk_capture_dma_),                  //   input,                              width = 1,                  clock_dma.clk
		.rst_csr_n                        (_connected_to_rst_csr_n_),                        //   input,                              width = 1,                reset_csr_n.reset_n
		.rst_dsp_n                        (_connected_to_rst_dsp_n_),                        //   input,                              width = 1,                reset_dsp_n.reset_n
		.rst_eth_xran_n_ul                (_connected_to_rst_eth_xran_n_ul_),                //   input,                              width = 1,                reset_eth_n.reset_n
		.rst_capture_dma_n                (_connected_to_rst_capture_dma_n_),                //   input,                              width = 1,                reset_dma_n.reset_n
		.rst_soft_n                       (_connected_to_rst_soft_n_),                       //   input,                              width = 1,               reset_soft_n.rst_soft_n
		.avst_src_capture_valid           (_connected_to_avst_src_capture_valid_),           //  output,                              width = 1,        avst_source_capture.valid
		.avst_src_capture_data            (_connected_to_avst_src_capture_data_),            //  output,  width = (((CAPTURE_DMA_WIDTH-1)-0)+1),                           .data
		.avst_src_capture_ready           (_connected_to_avst_src_capture_ready_),           //   input,                              width = 1,                           .ready
		.radio_config_status              (_connected_to_radio_config_status_),              //   input,                             width = 56,        radio_config_status.radio_config_status
		.lphy_avst_sink_dsp_capture_valid (_connected_to_lphy_avst_sink_dsp_capture_valid_), //   input,                              width = 1, lphy_avst_sink_dsp_capture.valid
		.lphy_avst_sink_dsp_capture_data  (_connected_to_lphy_avst_sink_dsp_capture_data_),  //   input,       width = (((IQ_DATAWIDTH-1)-0)+1),                           .data
		.lphy_avst_sink_dsp_capture_chan  (_connected_to_lphy_avst_sink_dsp_capture_chan_),  //   input,     width = (((ANTENNA_DWIDTH-1)-0)+1),                           .channel
		.dxc_avst_sink_dsp_capture_valid  (_connected_to_dxc_avst_sink_dsp_capture_valid_),  //   input,                              width = 1,  dxc_avst_sink_dsp_capture.valid
		.dxc_avst_sink_dsp_capture_data   (_connected_to_dxc_avst_sink_dsp_capture_data_),   //   input,       width = (((IQ_DATAWIDTH-1)-0)+1),                           .data
		.dxc_avst_sink_dsp_capture_chan   (_connected_to_dxc_avst_sink_dsp_capture_chan_),   //   input,     width = (((ANTENNA_DWIDTH-1)-0)+1),                           .channel
		.interface_sel                    (_connected_to_interface_sel_)                     //  output,                             width = 32,              interface_sel.data
	);

