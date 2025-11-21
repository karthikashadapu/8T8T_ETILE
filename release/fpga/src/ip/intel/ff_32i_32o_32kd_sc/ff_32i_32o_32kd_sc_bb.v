module ff_32i_32o_32kd_sc (
		input  wire [31:0] data,  //  fifo_input.datain
		input  wire        wrreq, //            .wrreq
		input  wire        rdreq, //            .rdreq
		input  wire        clock, //            .clk
		input  wire        sclr,  //            .sclr
		output wire [31:0] q,     // fifo_output.dataout
		output wire        full,  //            .full
		output wire        empty  //            .empty
	);
endmodule

