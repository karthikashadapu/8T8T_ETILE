module timingadapter (
		input  wire         clk,               //   clk.clk
		input  wire         reset_n,           // reset.reset_n
		input  wire [255:0] in_data,           //    in.data
		input  wire         in_valid,          //      .valid
		output wire         in_ready,          //      .ready
		input  wire         in_startofpacket,  //      .startofpacket
		input  wire         in_endofpacket,    //      .endofpacket
		input  wire         in_empty,          //      .empty
		input  wire [15:0]  in_channel,        //      .channel
		output wire [255:0] out_data,          //   out.data
		output wire         out_valid,         //      .valid
		input  wire         out_ready,         //      .ready
		output wire         out_startofpacket, //      .startofpacket
		output wire         out_endofpacket,   //      .endofpacket
		output wire         out_empty,         //      .empty
		output wire [15:0]  out_channel        //      .channel
	);
endmodule

