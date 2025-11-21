module ff_32i_32o_1024d_dc (
		input  wire [31:0] data,    //  fifo_input.datain
		input  wire        wrreq,   //            .wrreq
		input  wire        rdreq,   //            .rdreq
		input  wire        wrclk,   //            .wrclk
		input  wire        rdclk,   //            .rdclk
		output wire [31:0] q,       // fifo_output.dataout
		output wire [9:0]  wrusedw, //            .wrusedw
		output wire        rdempty, //            .rdempty
		output wire        wrfull   //            .wrfull
	);
endmodule

