	dxc_ss_top_dxc_ss_0 #(
		.NUM_OF_ANT              (INTEGER_VALUE_FOR_NUM_OF_ANT),
		.NUM_OF_FFT              (INTEGER_VALUE_FOR_NUM_OF_FFT),
		.CPRI_ETH_DATAWIDTH      (INTEGER_VALUE_FOR_CPRI_ETH_DATAWIDTH),
		.XRAN_ETH_DATAWIDTH      (INTEGER_VALUE_FOR_XRAN_ETH_DATAWIDTH),
		.CH_DW                   (INTEGER_VALUE_FOR_CH_DW),
		.NUM_OF_PRACH            (INTEGER_VALUE_FOR_NUM_OF_PRACH),
		.CAPTURE_DMA_WIDTH       (INTEGER_VALUE_FOR_CAPTURE_DMA_WIDTH),
		.IQ_DATAWIDTH            (INTEGER_VALUE_FOR_IQ_DATAWIDTH),
		.CPRI_FRAME_DATAWIDTH    (INTEGER_VALUE_FOR_CPRI_FRAME_DATAWIDTH),
		.ECPRI_CAPTURE_INSTANCES (INTEGER_VALUE_FOR_ECPRI_CAPTURE_INSTANCES),
		.DSP_CAPTURE_INSTANCES   (INTEGER_VALUE_FOR_DSP_CAPTURE_INSTANCES),
		.DXC_DSP_CAPTURE_INST    (INTEGER_VALUE_FOR_DXC_DSP_CAPTURE_INST)
	) u0 (
		.clk_csr                           (_connected_to_clk_csr_),                           //   input,                         width = 1,                clock_csr.clk
		.clk_dsp                           (_connected_to_clk_dsp_),                           //   input,                         width = 1,                clock_dsp.clk
		.rst_csr_n                         (_connected_to_rst_csr_n_),                         //   input,                         width = 1,                rst_csr_n.reset_n
		.rst_dsp_n                         (_connected_to_rst_dsp_n_),                         //   input,                         width = 1,                rst_dsp_n.reset_n
		.rst_soft_n                        (_connected_to_rst_soft_n_),                        //   input,                         width = 1,                 soft_rst.rst_soft_n
		.ifft_duc_sink_valid1              (_connected_to_ifft_duc_sink_valid1_),              //   input,                         width = 1,         ifft_duc_sink_l1.valid
		.ifft_duc_sink_data1               (_connected_to_ifft_duc_sink_data1_),               //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .data
		.ifft_duc_sink_channel1            (_connected_to_ifft_duc_sink_channel1_),            //   input,                         width = 8,                         .channel
		.ifft_duc_sink_valid2              (_connected_to_ifft_duc_sink_valid2_),              //   input,                         width = 1,         ifft_duc_sink_l2.valid
		.ifft_duc_sink_data2               (_connected_to_ifft_duc_sink_data2_),               //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .data
		.ifft_duc_sink_channel2            (_connected_to_ifft_duc_sink_channel2_),            //   input,                         width = 8,                         .channel
		.avst_sink_valid                   (_connected_to_avst_sink_valid_),                   //   input,                         width = 1,            ddc_avst_sink.avst_sink_valid
		.avst_sink_channel                 (_connected_to_avst_sink_channel_),                 //   input,                         width = 8,                         .avst_sink_channel
		.avst_sink_data_l1                 (_connected_to_avst_sink_data_l1_),                 //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .avst_sink_data_l1
		.avst_sink_data_l2                 (_connected_to_avst_sink_data_l2_),                 //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .avst_sink_data_l2
		.avst_sink_data_l3                 (_connected_to_avst_sink_data_l3_),                 //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .avst_sink_data_l3
		.avst_sink_data_l4                 (_connected_to_avst_sink_data_l4_),                 //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .avst_sink_data_l4
		.avst_sink_data_l5                 (_connected_to_avst_sink_data_l5_),                 //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .avst_sink_data_l5
		.avst_sink_data_l6                 (_connected_to_avst_sink_data_l6_),                 //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .avst_sink_data_l6
		.avst_sink_data_l7                 (_connected_to_avst_sink_data_l7_),                 //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .avst_sink_data_l7
		.avst_sink_data_l8                 (_connected_to_avst_sink_data_l8_),                 //   input,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .avst_sink_data_l8
		.duc_avst_source_valid             (_connected_to_duc_avst_source_valid_),             //  output,                         width = 1,          duc_avst_source.duc_avst_source_valid
		.duc_avst_source_data0             (_connected_to_duc_avst_source_data0_),             //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .duc_avst_source_data0
		.duc_avst_source_data1             (_connected_to_duc_avst_source_data1_),             //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .duc_avst_source_data1
		.duc_avst_source_data2             (_connected_to_duc_avst_source_data2_),             //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .duc_avst_source_data2
		.duc_avst_source_data3             (_connected_to_duc_avst_source_data3_),             //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .duc_avst_source_data3
		.duc_avst_source_data4             (_connected_to_duc_avst_source_data4_),             //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .duc_avst_source_data4
		.duc_avst_source_data5             (_connected_to_duc_avst_source_data5_),             //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .duc_avst_source_data5
		.duc_avst_source_data6             (_connected_to_duc_avst_source_data6_),             //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .duc_avst_source_data6
		.duc_avst_source_data7             (_connected_to_duc_avst_source_data7_),             //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .duc_avst_source_data7
		.duc_avst_source_channel           (_connected_to_duc_avst_source_channel_),           //  output,                         width = 8,                         .duc_avst_source_channel
		.ddc_source_valid1                 (_connected_to_ddc_source_valid1_),                 //  output,                         width = 1,            ddc_source_l1.valid
		.ddc_source_data1                  (_connected_to_ddc_source_data1_),                  //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .data
		.ddc_source_channel1               (_connected_to_ddc_source_channel1_),               //  output,                         width = 8,                         .channel
		.ddc_source_valid2                 (_connected_to_ddc_source_valid2_),                 //  output,                         width = 1,            ddc_source_l2.valid
		.ddc_source_data2                  (_connected_to_ddc_source_data2_),                  //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .data
		.ddc_source_channel2               (_connected_to_ddc_source_channel2_),               //  output,                         width = 8,                         .channel
		.rfp_pul                           (_connected_to_rfp_pul_),                           //   input,                         width = 1,                rfp_pulse.data
		.bw_config_cc1                     (_connected_to_bw_config_cc1_),                     //   input,                         width = 8,            bw_config_cc1.bw_config_cc1
		.bw_config_cc2                     (_connected_to_bw_config_cc2_),                     //   input,                         width = 8,            bw_config_cc2.bw_config_cc2
		.dxc_avst_selctd_cap_intf_valid    (_connected_to_dxc_avst_selctd_cap_intf_valid_),    //  output,                         width = 1, dxc_avst_selctd_cap_intf.valid
		.dxc_avst_selctd_cap_intf_data     (_connected_to_dxc_avst_selctd_cap_intf_data_),     //  output,  width = (((IQ_DATAWIDTH-1)-0)+1),                         .data
		.dxc_avst_selctd_cap_intf_chan     (_connected_to_dxc_avst_selctd_cap_intf_chan_),     //  output,                         width = 3,                         .channel
		.dxc_ss_config_csr_address         (_connected_to_dxc_ss_config_csr_address_),         //   input,                         width = 7,        dxc_ss_config_csr.address
		.dxc_ss_config_csr_write           (_connected_to_dxc_ss_config_csr_write_),           //   input,                         width = 1,                         .write
		.dxc_ss_config_csr_writedata       (_connected_to_dxc_ss_config_csr_writedata_),       //   input,                        width = 32,                         .writedata
		.dxc_ss_config_csr_readdata        (_connected_to_dxc_ss_config_csr_readdata_),        //  output,                        width = 32,                         .readdata
		.dxc_ss_config_csr_readdatavalid   (_connected_to_dxc_ss_config_csr_readdatavalid_),   //  output,                         width = 1,                         .readdatavalid
		.dxc_ss_config_csr_waitrequest     (_connected_to_dxc_ss_config_csr_waitrequest_),     //  output,                         width = 1,                         .waitrequest
		.dxc_ss_config_csr_read            (_connected_to_dxc_ss_config_csr_read_),            //   input,                         width = 1,                         .read
		.duc_l1_busIn_writedata            (_connected_to_duc_l1_busIn_writedata_),            //   input,                        width = 32,               duc_csr_l1.writedata
		.duc_l1_busIn_address              (_connected_to_duc_l1_busIn_address_),              //   input,                        width = 12,                         .address
		.duc_l1_busIn_write                (_connected_to_duc_l1_busIn_write_),                //   input,                         width = 1,                         .write
		.duc_l1_busIn_read                 (_connected_to_duc_l1_busIn_read_),                 //   input,                         width = 1,                         .read
		.duc_l1_busOut_readdatavalid       (_connected_to_duc_l1_busOut_readdatavalid_),       //  output,                         width = 1,                         .readdatavalid
		.duc_l1_busOut_readdata            (_connected_to_duc_l1_busOut_readdata_),            //  output,                        width = 32,                         .readdata
		.duc_l1_busOut_waitrequest         (_connected_to_duc_l1_busOut_waitrequest_),         //  output,                         width = 1,                         .waitrequest
		.ddc_l1_busIn_writedata            (_connected_to_ddc_l1_busIn_writedata_),            //   input,                        width = 32,               ddc_csr_l1.writedata
		.ddc_l1_busIn_address              (_connected_to_ddc_l1_busIn_address_),              //   input,                        width = 12,                         .address
		.ddc_l1_busIn_write                (_connected_to_ddc_l1_busIn_write_),                //   input,                         width = 1,                         .write
		.ddc_l1_busIn_read                 (_connected_to_ddc_l1_busIn_read_),                 //   input,                         width = 1,                         .read
		.ddc_l1_busOut_readdatavalid       (_connected_to_ddc_l1_busOut_readdatavalid_),       //  output,                         width = 1,                         .readdatavalid
		.ddc_l1_busOut_readdata            (_connected_to_ddc_l1_busOut_readdata_),            //  output,                        width = 32,                         .readdata
		.ddc_l1_busOut_waitrequest         (_connected_to_ddc_l1_busOut_waitrequest_),         //  output,                         width = 1,                         .waitrequest
		.duc_l2_busIn_writedata            (_connected_to_duc_l2_busIn_writedata_),            //   input,                        width = 32,               duc_csr_l2.writedata
		.duc_l2_busIn_address              (_connected_to_duc_l2_busIn_address_),              //   input,                        width = 12,                         .address
		.duc_l2_busIn_write                (_connected_to_duc_l2_busIn_write_),                //   input,                         width = 1,                         .write
		.duc_l2_busIn_read                 (_connected_to_duc_l2_busIn_read_),                 //   input,                         width = 1,                         .read
		.duc_l2_busOut_readdatavalid       (_connected_to_duc_l2_busOut_readdatavalid_),       //  output,                         width = 1,                         .readdatavalid
		.duc_l2_busOut_readdata            (_connected_to_duc_l2_busOut_readdata_),            //  output,                        width = 32,                         .readdata
		.duc_l2_busOut_waitrequest         (_connected_to_duc_l2_busOut_waitrequest_),         //  output,                         width = 1,                         .waitrequest
		.ddc_l2_busIn_writedata            (_connected_to_ddc_l2_busIn_writedata_),            //   input,                        width = 32,               ddc_csr_l2.writedata
		.ddc_l2_busIn_address              (_connected_to_ddc_l2_busIn_address_),              //   input,                        width = 12,                         .address
		.ddc_l2_busIn_write                (_connected_to_ddc_l2_busIn_write_),                //   input,                         width = 1,                         .write
		.ddc_l2_busIn_read                 (_connected_to_ddc_l2_busIn_read_),                 //   input,                         width = 1,                         .read
		.ddc_l2_busOut_readdatavalid       (_connected_to_ddc_l2_busOut_readdatavalid_),       //  output,                         width = 1,                         .readdatavalid
		.ddc_l2_busOut_readdata            (_connected_to_ddc_l2_busOut_readdata_),            //  output,                        width = 32,                         .readdata
		.ddc_l2_busOut_waitrequest         (_connected_to_ddc_l2_busOut_waitrequest_),         //  output,                         width = 1,                         .waitrequest
		.ca_interp_busIn_writedata         (_connected_to_ca_interp_busIn_writedata_),         //   input,                        width = 32,            ca_interp_csr.writedata
		.ca_interp_busIn_address           (_connected_to_ca_interp_busIn_address_),           //   input,                         width = 7,                         .address
		.ca_interp_busIn_write             (_connected_to_ca_interp_busIn_write_),             //   input,                         width = 1,                         .write
		.ca_interp_busIn_read              (_connected_to_ca_interp_busIn_read_),              //   input,                         width = 1,                         .read
		.ca_interp_busOut_readdatavalid    (_connected_to_ca_interp_busOut_readdatavalid_),    //  output,                         width = 1,                         .readdatavalid
		.ca_interp_busOut_readdata         (_connected_to_ca_interp_busOut_readdata_),         //  output,                        width = 32,                         .readdata
		.ca_interp_busOut_waitrequest      (_connected_to_ca_interp_busOut_waitrequest_),      //  output,                         width = 1,                         .waitrequest
		.dec_dly_comp_busIn_writedata      (_connected_to_dec_dly_comp_busIn_writedata_),      //   input,                        width = 32,         dec_dly_comp_csr.writedata
		.dec_dly_comp_busIn_address        (_connected_to_dec_dly_comp_busIn_address_),        //   input,                         width = 7,                         .address
		.dec_dly_comp_busIn_write          (_connected_to_dec_dly_comp_busIn_write_),          //   input,                         width = 1,                         .write
		.dec_dly_comp_busIn_read           (_connected_to_dec_dly_comp_busIn_read_),           //   input,                         width = 1,                         .read
		.dec_dly_comp_busOut_readdatavalid (_connected_to_dec_dly_comp_busOut_readdatavalid_), //  output,                         width = 1,                         .readdatavalid
		.dec_dly_comp_busOut_readdata      (_connected_to_dec_dly_comp_busOut_readdata_),      //  output,                        width = 32,                         .readdata
		.dec_dly_comp_busOut_waitrequest   (_connected_to_dec_dly_comp_busOut_waitrequest_),   //  output,                         width = 1,                         .waitrequest
		.interface_sel                     (_connected_to_interface_sel_)                      //   input,                        width = 32,            interface_sel.data
	);

