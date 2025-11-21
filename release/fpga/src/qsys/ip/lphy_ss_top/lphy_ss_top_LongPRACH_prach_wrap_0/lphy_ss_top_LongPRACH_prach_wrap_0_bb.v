module lphy_ss_top_LongPRACH_prach_wrap_0 (
		input  wire        clk,                  //           clock.clk
		input  wire        areset,               //     clock_reset.reset
		input  wire        bus_clk,              //       bus_clock.clk
		input  wire        bus_areset,           // bus_clock_reset.reset
		input  wire [1:0]  busIn_address,        //             bus.address
		input  wire [0:0]  busIn_read,           //                .read
		input  wire [0:0]  busIn_write,          //                .write
		input  wire [31:0] busIn_writedata,      //                .writedata
		output wire [31:0] busOut_readdata,      //                .readdata
		output wire [0:0]  busOut_readdatavalid, //                .readdatavalid
		output wire [0:0]  busOut_waitrequest,   //                .waitrequest
		input  wire [0:0]  vin0_s,               //             exp.valid_vin0_s
		input  wire [7:0]  chin0_s,              //                .channel_chin0_s
		input  wire [15:0] din0_im,              //                .data_din0_im
		input  wire [15:0] din0_re,              //                .data_din0_re
		input  wire [11:0] RFN_s,                //                .data_RFN_s
		input  wire [7:0]  subframe_s,           //                .data_subframe_s
		input  wire [15:0] prach_cfg_idx_s,      //                .data_prach_cfg_idx_s
		input  wire [20:0] cp_len_s,             //                .data_cp_len_s
		input  wire [20:0] offset_s,             //                .data_offset_s
		input  wire [0:0]  c_m_plane_sel_s,      //                .data_c_m_plane_sel_s
		input  wire [0:0]  prach_tech_s,         //                .data_prach_tech_s
		input  wire [0:0]  filt_flush_en_s,      //                .data_filt_flush_en_s
		input  wire [3:0]  start_sym_s,          //                .data_start_sym_s
		input  wire [7:0]  SubFrame_cplane_s,    //                .data_SubFrame_cplane_s
		input  wire [15:0] gain_re_s,            //                .data_gain_re_s
		input  wire [15:0] gain_im_s,            //                .data_gain_im_s
		input  wire [15:0] ch0_info_s,           //                .data_ch0_info_s
		input  wire [15:0] ch1_info_s,           //                .data_ch1_info_s
		input  wire [15:0] ch2_info_s,           //                .data_ch2_info_s
		input  wire [15:0] ch3_info_s,           //                .data_ch3_info_s
		input  wire [11:0] RFN_cplane_s,         //                .data_RFN_cplane_s
		output wire [15:0] dout_im,              //                .data_dout_im
		output wire [15:0] dout_re,              //                .data_dout_re
		output wire [0:0]  vout_s,               //                .valid_vout_s
		output wire [7:0]  cout_s,               //                .channel_cout_s
		output wire [31:0] TimeReference_s,      //                .data_TimeReference_s
		output wire [15:0] ch_info_s             //                .data_ch_info_s
	);
endmodule

