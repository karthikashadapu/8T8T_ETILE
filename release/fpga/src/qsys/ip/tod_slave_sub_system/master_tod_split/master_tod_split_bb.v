module master_tod_split (
		input  wire [95:0] data_conduit_in,      //    conduit_end.data
		input  wire        valid_conduit_in,     //               .valid
		output wire [95:0] data_conduit_out_1,   //  conduit_end_1.data
		output wire        valid_conduit_out_1,  //               .valid
		output wire [95:0] data_conduit_out_2,   //  conduit_end_2.data
		output wire        valid_conduit_out_2,  //               .valid
		output wire [95:0] data_conduit_out_3,   //  conduit_end_3.data
		output wire        valid_conduit_out_3,  //               .valid
		output wire [95:0] data_conduit_out_4,   //  conduit_end_4.data
		output wire        valid_conduit_out_4,  //               .valid
		output wire [95:0] data_conduit_out_5,   //  conduit_end_5.data
		output wire        valid_conduit_out_5,  //               .valid
		output wire [95:0] data_conduit_out_6,   //  conduit_end_6.data
		output wire        valid_conduit_out_6,  //               .valid
		output wire [95:0] data_conduit_out_7,   //  conduit_end_7.data
		output wire        valid_conduit_out_7,  //               .valid
		output wire [95:0] data_conduit_out_8,   //  conduit_end_8.data
		output wire        valid_conduit_out_8,  //               .valid
		output wire [95:0] data_conduit_out_9,   //  conduit_end_9.data
		output wire        valid_conduit_out_9,  //               .valid
		output wire [95:0] data_conduit_out_10,  // conduit_end_10.data
		output wire        valid_conduit_out_10  //               .valid
	);
endmodule

