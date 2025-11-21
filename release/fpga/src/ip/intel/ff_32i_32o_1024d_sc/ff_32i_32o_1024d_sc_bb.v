module ff_32i_32o_1024d_sc (
		input  wire [31:0] data,  //  fifo_input.datain
		input  wire        wrreq, //            .wrreq
		input  wire        rdreq, //            .rdreq
		input  wire        clock, //            .clk
		input  wire        aclr,  //            .aclr
		output wire [31:0] q,     // fifo_output.dataout
		output wire [9:0]  usedw, //            .usedw
		output wire        full,  //            .full
		output wire        empty  //            .empty
	);
endmodule

