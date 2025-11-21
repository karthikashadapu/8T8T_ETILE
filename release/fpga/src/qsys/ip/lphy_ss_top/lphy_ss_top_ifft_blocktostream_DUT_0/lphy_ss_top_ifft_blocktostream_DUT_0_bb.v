module lphy_ss_top_ifft_blocktostream_DUT_0 (
		input  wire        clk,                  //           clock.clk
		input  wire        areset,               //     clock_reset.reset
		input  wire        bus_clk,              //       bus_clock.clk
		input  wire        bus_areset,           // bus_clock_reset.reset
		input  wire [13:0] busIn_address,        //             bus.address
		input  wire [0:0]  busIn_read,           //                .read
		input  wire [0:0]  busIn_write,          //                .write
		input  wire [31:0] busIn_writedata,      //                .writedata
		output wire [31:0] busOut_readdata,      //                .readdata
		output wire [0:0]  busOut_readdatavalid, //                .readdatavalid
		output wire [0:0]  busOut_waitrequest,   //                .waitrequest
		input  wire [15:0] data1_im,             //             exp.data_data1_im
		input  wire [15:0] data1_re,             //                .data_data1_re
		input  wire [0:0]  valid1_s,             //                .valid_valid1_s
		input  wire [7:0]  channel1_s,           //                .channel_channel1_s
		input  wire [3:0]  size1_s,              //                .data_size1_s
		input  wire [10:0] cplen1_s,             //                .data_cplen1_s
		input  wire [11:0] nsc1_s,               //                .data_nsc1_s
		input  wire [15:0] ifft_gain_re_l1_s,    //                .data_ifft_gain_re_l1_s
		input  wire [15:0] ifft_gain_im_l1_s,    //                .data_ifft_gain_im_l1_s
		input  wire [3:0]  ifft_shift_l1_s,      //                .data_ifft_shift_l1_s
		input  wire [15:0] ifft_mux_const_l1_s,  //                .data_ifft_mux_const_l1_s
		input  wire [0:0]  muxsel_l1_s,          //                .data_muxsel_l1_s
		input  wire [0:0]  DC_SC_EN_s,           //                .data_DC_SC_EN_s
		input  wire [0:0]  CP_EN1_s,             //                .data_CP_EN1_s
		input  wire [0:0]  ripple_comp_en_s,     //                .data_ripple_comp_en_s
		input  wire [0:0]  rc_bw_sel_s,          //                .data_rc_bw_sel_s
		input  wire [63:0] timeref_in_s,         //                .data_timeref_in_s
		output wire [0:0]  vout2_s,              //                .data_vout2_s
		output wire [1:0]  cout2_s,              //                .data_cout2_s
		output wire [15:0] dout2_im,             //                .data_dout2_im
		output wire [15:0] dout2_re,             //                .data_dout2_re
		output wire [15:0] td_ifft_out_data_im,  //                .data_td_ifft_out_data_im
		output wire [15:0] td_ifft_out_data_re,  //                .data_td_ifft_out_data_re
		output wire [7:0]  td_ifft_out_ch_s,     //                .channel_td_ifft_out_ch_s
		output wire [0:0]  td_ifft_out_valid_s,  //                .valid_td_ifft_out_valid_s
		output wire [3:0]  ifft_size_out_s,      //                .data_ifft_size_out_s
		output wire [10:0] ifft_cp_out_s,        //                .data_ifft_cp_out_s
		output wire [0:0]  fd_data_v_s,          //                .valid_fd_data_v_s
		output wire [7:0]  fd_data_c_s,          //                .channel_fd_data_c_s
		output wire [15:0] fd_data_q_im,         //                .data_fd_data_q_im
		output wire [15:0] fd_data_q_re,         //                .data_fd_data_q_re
		output wire [63:0] fd_timeref_out_s      //                .data_fd_timeref_out_s
	);
endmodule

