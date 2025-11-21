module lphy_ss_top_streamtoblock_fft_DUT_0 (
		input  wire        clk,                     //           clock.clk
		input  wire        areset,                  //     clock_reset.reset
		input  wire        bus_clk,                 //       bus_clock.clk
		input  wire        bus_areset,              // bus_clock_reset.reset
		input  wire [13:0] busIn_address,           //             bus.address
		input  wire [0:0]  busIn_read,              //                .read
		input  wire [0:0]  busIn_write,             //                .write
		input  wire [31:0] busIn_writedata,         //                .writedata
		output wire [31:0] busOut_readdata,         //                .readdata
		output wire [0:0]  busOut_readdatavalid,    //                .readdatavalid
		output wire [0:0]  busOut_waitrequest,      //                .waitrequest
		input  wire [0:0]  rx_vin_s,                //             exp.valid_rx_vin_s
		input  wire [7:0]  rx_chin_s,               //                .channel_rx_chin_s
		input  wire [15:0] rx_din_im,               //                .data_rx_din_im
		input  wire [15:0] rx_din_re,               //                .data_rx_din_re
		input  wire [3:0]  fft_in_s,                //                .data_fft_in_s
		input  wire [15:0] cp_in_s,                 //                .data_cp_in_s
		input  wire [15:0] nprb_s,                  //                .data_nprb_s
		input  wire [0:0]  hcs_bypass_s,            //                .data_hcs_bypass_s
		input  wire [15:0] fft_gain_s,              //                .data_fft_gain_s
		input  wire [15:0] fft_gain_im_s,           //                .data_fft_gain_im_s
		input  wire [3:0]  fft_shift_s,             //                .data_fft_shift_s
		input  wire [63:0] time_ref_in_s,           //                .data_time_ref_in_s
		input  wire [0:0]  DC_SC_EN_s,              //                .data_DC_SC_EN_s
		input  wire [0:0]  CP_EN_s,                 //                .data_CP_EN_s
		input  wire [0:0]  ripple_comp_en_s,        //                .data_ripple_comp_en_s
		input  wire [0:0]  rc_bw_sel_s,             //                .data_rc_bw_sel_s
		input  wire [63:0] sym_metadata_in_s,       //                .data_sym_metadata_in_s
		input  wire [0:0]  sym_metadata_in_valid_s, //                .data_sym_metadata_in_valid_s
		output wire [0:0]  rx_valid_s,              //                .valid_rx_valid_s
		output wire [7:0]  rx_chout_s,              //                .channel_rx_chout_s
		output wire [15:0] rx_dout_im,              //                .data_rx_dout_im
		output wire [15:0] rx_dout_re,              //                .data_rx_dout_re
		output wire [0:0]  fft_vout_s,              //                .valid_fft_vout_s
		output wire [7:0]  fft_chout_s,             //                .channel_fft_chout_s
		output wire [15:0] fft_dout_im,             //                .data_fft_dout_im
		output wire [15:0] fft_dout_re,             //                .data_fft_dout_re
		output wire [15:0] nsc_out_s,               //                .data_nsc_out_s
		output wire [3:0]  size_out_s,              //                .data_size_out_s
		output wire [63:0] td_time_out_s,           //                .data_td_time_out_s
		output wire [0:0]  fd_data_v_s,             //                .valid_fd_data_v_s
		output wire [7:0]  fd_data_c_s,             //                .channel_fd_data_c_s
		output wire [15:0] fd_data_q_im,            //                .data_fd_data_q_im
		output wire [15:0] fd_data_q_re,            //                .data_fd_data_q_re
		output wire [1:0]  eAxCout_s,               //                .data_eAxCout_s
		output wire [0:0]  eop_eAxC_s,              //                .data_eop_eAxC_s
		output wire [0:0]  eop_sym_s,               //                .data_eop_sym_s
		output wire [0:0]  sop_eAxC_s,              //                .data_sop_eAxC_s
		output wire [0:0]  sop_sym_s                //                .data_sop_sym_s
	);
endmodule

