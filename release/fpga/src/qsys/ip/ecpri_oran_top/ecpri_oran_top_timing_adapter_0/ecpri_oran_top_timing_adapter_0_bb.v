module ecpri_oran_top_timing_adapter_0 (
		input  wire        clk,               //   clk.clk
		input  wire        reset_n,           // reset.reset_n
		input  wire [87:0] in_data,           //    in.data
		input  wire        in_valid,          //      .valid
		output wire        in_ready,          //      .ready
		input  wire        in_startofpacket,  //      .startofpacket
		input  wire        in_endofpacket,    //      .endofpacket
		input  wire [3:0]  in_empty,          //      .empty
		output wire [87:0] out_data,          //   out.data
		output wire        out_valid,         //      .valid
		input  wire        out_ready,         //      .ready
		output wire        out_startofpacket, //      .startofpacket
		output wire        out_endofpacket,   //      .endofpacket
		output wire [3:0]  out_empty          //      .empty
	);
endmodule

