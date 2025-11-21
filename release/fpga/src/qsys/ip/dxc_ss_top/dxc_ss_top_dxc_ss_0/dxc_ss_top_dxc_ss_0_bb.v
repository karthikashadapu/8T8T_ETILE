module dxc_ss_top_dxc_ss_0 #(
		parameter NUM_OF_ANT              = 8,
		parameter NUM_OF_FFT              = 2,
		parameter CPRI_ETH_DATAWIDTH      = 128,
		parameter XRAN_ETH_DATAWIDTH      = 128,
		parameter CH_DW                   = 8,
		parameter NUM_OF_PRACH            = 2,
		parameter CAPTURE_DMA_WIDTH       = 512,
		parameter IQ_DATAWIDTH            = 32,
		parameter CPRI_FRAME_DATAWIDTH    = 64,
		parameter ECPRI_CAPTURE_INSTANCES = 2,
		parameter DSP_CAPTURE_INSTANCES   = 30,
		parameter DXC_DSP_CAPTURE_INST    = 22
	) (
		input  wire                                clk_csr,                           //                clock_csr.clk
		input  wire                                clk_dsp,                           //                clock_dsp.clk
		input  wire                                rst_csr_n,                         //                rst_csr_n.reset_n
		input  wire                                rst_dsp_n,                         //                rst_dsp_n.reset_n
		input  wire                                rst_soft_n,                        //                 soft_rst.rst_soft_n
		input  wire                                ifft_duc_sink_valid1,              //         ifft_duc_sink_l1.valid
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] ifft_duc_sink_data1,               //                         .data
		input  wire [7:0]                          ifft_duc_sink_channel1,            //                         .channel
		input  wire                                ifft_duc_sink_valid2,              //         ifft_duc_sink_l2.valid
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] ifft_duc_sink_data2,               //                         .data
		input  wire [7:0]                          ifft_duc_sink_channel2,            //                         .channel
		input  wire                                avst_sink_valid,                   //            ddc_avst_sink.avst_sink_valid
		input  wire [7:0]                          avst_sink_channel,                 //                         .avst_sink_channel
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] avst_sink_data_l1,                 //                         .avst_sink_data_l1
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] avst_sink_data_l2,                 //                         .avst_sink_data_l2
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] avst_sink_data_l3,                 //                         .avst_sink_data_l3
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] avst_sink_data_l4,                 //                         .avst_sink_data_l4
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] avst_sink_data_l5,                 //                         .avst_sink_data_l5
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] avst_sink_data_l6,                 //                         .avst_sink_data_l6
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] avst_sink_data_l7,                 //                         .avst_sink_data_l7
		input  wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] avst_sink_data_l8,                 //                         .avst_sink_data_l8
		output wire                                duc_avst_source_valid,             //          duc_avst_source.duc_avst_source_valid
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] duc_avst_source_data0,             //                         .duc_avst_source_data0
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] duc_avst_source_data1,             //                         .duc_avst_source_data1
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] duc_avst_source_data2,             //                         .duc_avst_source_data2
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] duc_avst_source_data3,             //                         .duc_avst_source_data3
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] duc_avst_source_data4,             //                         .duc_avst_source_data4
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] duc_avst_source_data5,             //                         .duc_avst_source_data5
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] duc_avst_source_data6,             //                         .duc_avst_source_data6
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] duc_avst_source_data7,             //                         .duc_avst_source_data7
		output wire [7:0]                          duc_avst_source_channel,           //                         .duc_avst_source_channel
		output wire                                ddc_source_valid1,                 //            ddc_source_l1.valid
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] ddc_source_data1,                  //                         .data
		output wire [7:0]                          ddc_source_channel1,               //                         .channel
		output wire                                ddc_source_valid2,                 //            ddc_source_l2.valid
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] ddc_source_data2,                  //                         .data
		output wire [7:0]                          ddc_source_channel2,               //                         .channel
		input  wire                                rfp_pul,                           //                rfp_pulse.data
		input  wire [7:0]                          bw_config_cc1,                     //            bw_config_cc1.bw_config_cc1
		input  wire [7:0]                          bw_config_cc2,                     //            bw_config_cc2.bw_config_cc2
		output wire                                dxc_avst_selctd_cap_intf_valid,    // dxc_avst_selctd_cap_intf.valid
		output wire [(((IQ_DATAWIDTH-1)-0)+1)-1:0] dxc_avst_selctd_cap_intf_data,     //                         .data
		output wire [2:0]                          dxc_avst_selctd_cap_intf_chan,     //                         .channel
		input  wire [6:0]                          dxc_ss_config_csr_address,         //        dxc_ss_config_csr.address
		input  wire                                dxc_ss_config_csr_write,           //                         .write
		input  wire [31:0]                         dxc_ss_config_csr_writedata,       //                         .writedata
		output wire [31:0]                         dxc_ss_config_csr_readdata,        //                         .readdata
		output wire                                dxc_ss_config_csr_readdatavalid,   //                         .readdatavalid
		output wire                                dxc_ss_config_csr_waitrequest,     //                         .waitrequest
		input  wire                                dxc_ss_config_csr_read,            //                         .read
		input  wire [31:0]                         duc_l1_busIn_writedata,            //               duc_csr_l1.writedata
		input  wire [11:0]                         duc_l1_busIn_address,              //                         .address
		input  wire                                duc_l1_busIn_write,                //                         .write
		input  wire                                duc_l1_busIn_read,                 //                         .read
		output wire                                duc_l1_busOut_readdatavalid,       //                         .readdatavalid
		output wire [31:0]                         duc_l1_busOut_readdata,            //                         .readdata
		output wire                                duc_l1_busOut_waitrequest,         //                         .waitrequest
		input  wire [31:0]                         ddc_l1_busIn_writedata,            //               ddc_csr_l1.writedata
		input  wire [11:0]                         ddc_l1_busIn_address,              //                         .address
		input  wire                                ddc_l1_busIn_write,                //                         .write
		input  wire                                ddc_l1_busIn_read,                 //                         .read
		output wire                                ddc_l1_busOut_readdatavalid,       //                         .readdatavalid
		output wire [31:0]                         ddc_l1_busOut_readdata,            //                         .readdata
		output wire                                ddc_l1_busOut_waitrequest,         //                         .waitrequest
		input  wire [31:0]                         duc_l2_busIn_writedata,            //               duc_csr_l2.writedata
		input  wire [11:0]                         duc_l2_busIn_address,              //                         .address
		input  wire                                duc_l2_busIn_write,                //                         .write
		input  wire                                duc_l2_busIn_read,                 //                         .read
		output wire                                duc_l2_busOut_readdatavalid,       //                         .readdatavalid
		output wire [31:0]                         duc_l2_busOut_readdata,            //                         .readdata
		output wire                                duc_l2_busOut_waitrequest,         //                         .waitrequest
		input  wire [31:0]                         ddc_l2_busIn_writedata,            //               ddc_csr_l2.writedata
		input  wire [11:0]                         ddc_l2_busIn_address,              //                         .address
		input  wire                                ddc_l2_busIn_write,                //                         .write
		input  wire                                ddc_l2_busIn_read,                 //                         .read
		output wire                                ddc_l2_busOut_readdatavalid,       //                         .readdatavalid
		output wire [31:0]                         ddc_l2_busOut_readdata,            //                         .readdata
		output wire                                ddc_l2_busOut_waitrequest,         //                         .waitrequest
		input  wire [31:0]                         ca_interp_busIn_writedata,         //            ca_interp_csr.writedata
		input  wire [6:0]                          ca_interp_busIn_address,           //                         .address
		input  wire                                ca_interp_busIn_write,             //                         .write
		input  wire                                ca_interp_busIn_read,              //                         .read
		output wire                                ca_interp_busOut_readdatavalid,    //                         .readdatavalid
		output wire [31:0]                         ca_interp_busOut_readdata,         //                         .readdata
		output wire                                ca_interp_busOut_waitrequest,      //                         .waitrequest
		input  wire [31:0]                         dec_dly_comp_busIn_writedata,      //         dec_dly_comp_csr.writedata
		input  wire [6:0]                          dec_dly_comp_busIn_address,        //                         .address
		input  wire                                dec_dly_comp_busIn_write,          //                         .write
		input  wire                                dec_dly_comp_busIn_read,           //                         .read
		output wire                                dec_dly_comp_busOut_readdatavalid, //                         .readdatavalid
		output wire [31:0]                         dec_dly_comp_busOut_readdata,      //                         .readdata
		output wire                                dec_dly_comp_busOut_waitrequest,   //                         .waitrequest
		input  wire [31:0]                         interface_sel                      //            interface_sel.data
	);
endmodule

