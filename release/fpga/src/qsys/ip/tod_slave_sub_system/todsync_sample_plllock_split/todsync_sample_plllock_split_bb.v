module todsync_sample_plllock_split #(
		parameter SIGNAL_WIDTH = 1
	) (
		input  wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_in,     //    conduit_end.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_1,  //  conduit_end_1.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_2,  //  conduit_end_2.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_3,  //  conduit_end_3.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_4,  //  conduit_end_4.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_5,  //  conduit_end_5.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_6,  //  conduit_end_6.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_7,  //  conduit_end_7.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_8,  //  conduit_end_8.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_9,  //  conduit_end_9.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_10, // conduit_end_10.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_11, // conduit_end_11.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_12, // conduit_end_12.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_13, // conduit_end_13.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_14, // conduit_end_14.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_15, // conduit_end_15.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_16, // conduit_end_16.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_17, // conduit_end_17.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_18, // conduit_end_18.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_19, // conduit_end_19.lock
		output wire [(((SIGNAL_WIDTH-1)-0)+1)-1:0] conduit_out_20  // conduit_end_20.lock
	);
endmodule

