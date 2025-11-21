module dxc_ss_top (
		input  wire        csr_in_clk_clk,                          //               csr_in_clk.clk
		input  wire        dsp_in_clk_clk,                          //               dsp_in_clk.clk
		input  wire        soft_rst_rst_soft_n,                     //                 soft_rst.rst_soft_n
		input  wire        ifft_duc_sink_l1_valid,                  //         ifft_duc_sink_l1.valid
		input  wire [31:0] ifft_duc_sink_l1_data,                   //                         .data
		input  wire [7:0]  ifft_duc_sink_l1_channel,                //                         .channel
		input  wire        ifft_duc_sink_l2_valid,                  //         ifft_duc_sink_l2.valid
		input  wire [31:0] ifft_duc_sink_l2_data,                   //                         .data
		input  wire [7:0]  ifft_duc_sink_l2_channel,                //                         .channel
		input  wire        ddc_avst_sink_avst_sink_valid,           //            ddc_avst_sink.avst_sink_valid
		input  wire [7:0]  ddc_avst_sink_avst_sink_channel,         //                         .avst_sink_channel
		input  wire [31:0] ddc_avst_sink_avst_sink_data_l1,         //                         .avst_sink_data_l1
		input  wire [31:0] ddc_avst_sink_avst_sink_data_l2,         //                         .avst_sink_data_l2
		input  wire [31:0] ddc_avst_sink_avst_sink_data_l3,         //                         .avst_sink_data_l3
		input  wire [31:0] ddc_avst_sink_avst_sink_data_l4,         //                         .avst_sink_data_l4
		input  wire [31:0] ddc_avst_sink_avst_sink_data_l5,         //                         .avst_sink_data_l5
		input  wire [31:0] ddc_avst_sink_avst_sink_data_l6,         //                         .avst_sink_data_l6
		input  wire [31:0] ddc_avst_sink_avst_sink_data_l7,         //                         .avst_sink_data_l7
		input  wire [31:0] ddc_avst_sink_avst_sink_data_l8,         //                         .avst_sink_data_l8
		output wire        duc_avst_source_duc_avst_source_valid,   //          duc_avst_source.duc_avst_source_valid
		output wire [31:0] duc_avst_source_duc_avst_source_data0,   //                         .duc_avst_source_data0
		output wire [31:0] duc_avst_source_duc_avst_source_data1,   //                         .duc_avst_source_data1
		output wire [31:0] duc_avst_source_duc_avst_source_data2,   //                         .duc_avst_source_data2
		output wire [31:0] duc_avst_source_duc_avst_source_data3,   //                         .duc_avst_source_data3
		output wire [31:0] duc_avst_source_duc_avst_source_data4,   //                         .duc_avst_source_data4
		output wire [31:0] duc_avst_source_duc_avst_source_data5,   //                         .duc_avst_source_data5
		output wire [31:0] duc_avst_source_duc_avst_source_data6,   //                         .duc_avst_source_data6
		output wire [31:0] duc_avst_source_duc_avst_source_data7,   //                         .duc_avst_source_data7
		output wire [7:0]  duc_avst_source_duc_avst_source_channel, //                         .duc_avst_source_channel
		output wire        ddc_source_l1_valid,                     //            ddc_source_l1.valid
		output wire [31:0] ddc_source_l1_data,                      //                         .data
		output wire [7:0]  ddc_source_l1_channel,                   //                         .channel
		output wire        ddc_source_l2_valid,                     //            ddc_source_l2.valid
		output wire [31:0] ddc_source_l2_data,                      //                         .data
		output wire [7:0]  ddc_source_l2_channel,                   //                         .channel
		input  wire        rfp_pulse_data,                          //                rfp_pulse.data
		input  wire [7:0]  bw_config_cc1_bw_config_cc1,             //            bw_config_cc1.bw_config_cc1
		input  wire [7:0]  bw_config_cc2_bw_config_cc2,             //            bw_config_cc2.bw_config_cc2
		output wire        dxc_avst_selctd_cap_intf_valid,          // dxc_avst_selctd_cap_intf.valid
		output wire [31:0] dxc_avst_selctd_cap_intf_data,           //                         .data
		output wire [2:0]  dxc_avst_selctd_cap_intf_channel,        //                         .channel
		input  wire [31:0] dxc_ss_0_interface_sel_data,             //   dxc_ss_0_interface_sel.data
		output wire        h2f_lw_bridge_s0_waitrequest,            //         h2f_lw_bridge_s0.waitrequest
		output wire [31:0] h2f_lw_bridge_s0_readdata,               //                         .readdata
		output wire        h2f_lw_bridge_s0_readdatavalid,          //                         .readdatavalid
		input  wire [0:0]  h2f_lw_bridge_s0_burstcount,             //                         .burstcount
		input  wire [31:0] h2f_lw_bridge_s0_writedata,              //                         .writedata
		input  wire [16:0] h2f_lw_bridge_s0_address,                //                         .address
		input  wire        h2f_lw_bridge_s0_write,                  //                         .write
		input  wire        h2f_lw_bridge_s0_read,                   //                         .read
		input  wire [3:0]  h2f_lw_bridge_s0_byteenable,             //                         .byteenable
		input  wire        h2f_lw_bridge_s0_debugaccess,            //                         .debugaccess
		input  wire        csr_in_reset_reset,                      //             csr_in_reset.reset
		input  wire        dsp_in_reset_reset_n                     //             dsp_in_reset.reset_n
	);
endmodule

