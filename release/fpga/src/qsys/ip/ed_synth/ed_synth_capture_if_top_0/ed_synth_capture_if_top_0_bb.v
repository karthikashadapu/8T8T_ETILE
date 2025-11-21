module ed_synth_capture_if_top_0 #(
		parameter NUM_OF_ANT              = 8,
		parameter CAPTURE_DMA_WIDTH       = 128,
		parameter ECPRI_CAPTURE_INSTANCES = 2,
		parameter DSP_CAPTURE_INSTANCES   = 30,
		parameter LPHY_DSP_CAPTURE_INST   = 6,
		parameter DXC_DSP_CAPTURE_INST    = 22,
		parameter IQ_DATAWIDTH            = 32,
		parameter NUM_OF_FFT              = 2,
		parameter CPRI_ETH_DATAWIDTH      = 128,
		parameter XRAN_ETH_DATAWIDTH      = 128,
		parameter CH_DW                   = 8,
		parameter NUM_OF_PRACH            = 2,
		parameter ANTENNA_DWIDTH          = 3
	) (
		input  wire [4:0]                               csr_dsp_capture_address,          //            csr_dsp_capture.address
		input  wire                                     csr_dsp_capture_write,            //                           .write
		input  wire                                     csr_dsp_capture_read,             //                           .read
		input  wire [31:0]                              csr_dsp_capture_writedata,        //                           .writedata
		output wire [31:0]                              csr_dsp_capture_readdata,         //                           .readdata
		output wire                                     csr_dsp_capture_waitrequest,      //                           .waitrequest
		output wire                                     csr_dsp_capture_readdatavalid,    //                           .readdatavalid
		input  wire                                     clk_dsp,                          //                  clock_dsp.clk
		input  wire                                     clk_csr,                          //                  clock_csr.clk
		input  wire                                     clk_eth_xran_ul,                  //                  clock_eth.clk
		input  wire                                     clk_capture_dma,                  //                  clock_dma.clk
		input  wire                                     rst_csr_n,                        //                reset_csr_n.reset_n
		input  wire                                     rst_dsp_n,                        //                reset_dsp_n.reset_n
		input  wire                                     rst_eth_xran_n_ul,                //                reset_eth_n.reset_n
		input  wire                                     rst_capture_dma_n,                //                reset_dma_n.reset_n
		input  wire                                     rst_soft_n,                       //               reset_soft_n.rst_soft_n
		output wire                                     avst_src_capture_valid,           //        avst_source_capture.valid
		output wire [(((CAPTURE_DMA_WIDTH-1)-0)+1)-1:0] avst_src_capture_data,            //                           .data
		input  wire                                     avst_src_capture_ready,           //                           .ready
		input  wire [55:0]                              radio_config_status,              //        radio_config_status.radio_config_status
		input  wire                                     lphy_avst_sink_dsp_capture_valid, // lphy_avst_sink_dsp_capture.valid
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0]      lphy_avst_sink_dsp_capture_data,  //                           .data
		input  wire [(((ANTENNA_DWIDTH-1)-0)+1)-1:0]    lphy_avst_sink_dsp_capture_chan,  //                           .channel
		input  wire                                     dxc_avst_sink_dsp_capture_valid,  //  dxc_avst_sink_dsp_capture.valid
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0]      dxc_avst_sink_dsp_capture_data,   //                           .data
		input  wire [(((ANTENNA_DWIDTH-1)-0)+1)-1:0]    dxc_avst_sink_dsp_capture_chan,   //                           .channel
		output wire [31:0]                              interface_sel                     //              interface_sel.data
	);
endmodule

