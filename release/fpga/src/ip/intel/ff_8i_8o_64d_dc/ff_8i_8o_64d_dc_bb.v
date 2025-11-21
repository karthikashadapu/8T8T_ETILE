module ff_8i_8o_64d_dc (
		input  wire [7:0] data,    //  fifo_input.datain
		input  wire       wrreq,   //            .wrreq
		input  wire       rdreq,   //            .rdreq
		input  wire       wrclk,   //            .wrclk
		input  wire       rdclk,   //            .rdclk
		output wire [7:0] q,       // fifo_output.dataout
		output wire [5:0] wrusedw, //            .wrusedw
		output wire       rdempty, //            .rdempty
		output wire       wrfull   //            .wrfull
	);
endmodule

