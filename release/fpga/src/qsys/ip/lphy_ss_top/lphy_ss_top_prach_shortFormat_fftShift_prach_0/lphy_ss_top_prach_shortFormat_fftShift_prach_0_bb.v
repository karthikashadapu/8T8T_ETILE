module lphy_ss_top_prach_shortFormat_fftShift_prach_0 (
		input  wire        clk,                      //           clock.clk
		input  wire        areset,                   //     clock_reset.reset
		input  wire        bus_clk,                  //       bus_clock.clk
		input  wire        bus_areset,               // bus_clock_reset.reset
		input  wire [9:0]  busIn_address,            //             bus.address
		input  wire [0:0]  busIn_read,               //                .read
		input  wire [0:0]  busIn_write,              //                .write
		input  wire [31:0] busIn_writedata,          //                .writedata
		output wire [31:0] busOut_readdata,          //                .readdata
		output wire [0:0]  busOut_readdatavalid,     //                .readdatavalid
		output wire [0:0]  busOut_waitrequest,       //                .waitrequest
		input  wire [0:0]  vin1_s,                   //             exp.valid_vin1_s
		input  wire [7:0]  chin1_s,                  //                .channel_chin1_s
		input  wire [15:0] din1_im,                  //                .data_din1_im
		input  wire [15:0] din1_re,                  //                .data_din1_re
		input  wire [11:0] SFN_s,                    //                .data_SFN_s
		input  wire [7:0]  SubFN_s,                  //                .data_SubFN_s
		input  wire [1:0]  SCSby15_s,                //                .data_SCSby15_s
		input  wire [7:0]  BWby10_s,                 //                .data_BWby10_s
		input  wire [22:0] CPLen_cplane_s,           //                .data_CPLen_cplane_s
		input  wire [22:0] timeoffset_cplane_s,      //                .data_timeoffset_cplane_s
		input  wire [3:0]  numsym_cplane_s,          //                .data_numsym_cplane_s
		input  wire [1:0]  slotID_cplane_s,          //                .data_slotID_cplane_s
		input  wire [3:0]  startsym_cplane_s,        //                .data_startsym_cplane_s
		input  wire [28:0] timerefin_cplane_s,       //                .data_timerefin_cplane_s
		input  wire [1:0]  cur_slot_s,               //                .data_cur_slot_s
		input  wire [7:0]  SubFN_cplane_s,           //                .data_SubFN_cplane_s
		input  wire [0:0]  cbar_mplane_s,            //                .data_cbar_mplane_s
		input  wire [22:0] timeoffset_bias_cplane_s, //                .data_timeoffset_bias_cplane_s
		input  wire [22:0] startsym_bias_cplane_s,   //                .data_startsym_bias_cplane_s
		input  wire [15:0] gain_in_re_s,             //                .data_gain_in_re_s
		input  wire [15:0] gain_in_imag_s,           //                .data_gain_in_imag_s
		output wire [0:0]  fftShift_v_s,             //                .valid_fftShift_v_s
		output wire [7:0]  fftShift_c_s,             //                .channel_fftShift_c_s
		output wire [15:0] fftShift_d_im,            //                .data_fftShift_d_im
		output wire [15:0] fftShift_d_re,            //                .data_fftShift_d_re
		output wire [28:0] TimeReference_s           //                .data_TimeReference_s
	);
endmodule

