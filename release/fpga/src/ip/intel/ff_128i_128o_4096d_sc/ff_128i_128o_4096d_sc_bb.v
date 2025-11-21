module ff_128i_128o_4096d_sc (
		input  wire [127:0] data,  //  fifo_input.datain
		input  wire         wrreq, //            .wrreq
		input  wire         rdreq, //            .rdreq
		input  wire         clock, //            .clk
		input  wire         aclr,  //            .aclr
		output wire [127:0] q,     // fifo_output.dataout
		output wire [11:0]  usedw, //            .usedw
		output wire         full,  //            .full
		output wire         empty  //            .empty
	);
endmodule

