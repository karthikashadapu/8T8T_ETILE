module ram_128i_128o_128d_sc (
		input  wire [127:0] data,      //      data.datain,    Data input of the memory.The data port is required for all RAM operation modes:SINGLE_PORT,DUAL_PORT,BIDIR_DUAL_PORT,QUAD_PORT
		output wire [127:0] q,         //         q.dataout,   Data output from the memory
		input  wire [6:0]   wraddress, // wraddress.wraddress, Write address input to the memory.
		input  wire [6:0]   rdaddress, // rdaddress.rdaddress, Read address input to the memory.
		input  wire         wren,      //      wren.wren,      Write enable input for address port.The wren signal is required for all RAM operation modes:SINGLE_PORT,DUAL_PORT,BIDIR_DUAL_PORT,QUAD_PORT
		input  wire         clock,     //     clock.clk,       Memory clock, refer to user guide for specific details
		input  wire         rden       //      rden.rden,      Read enable input for rdaddress port
	);
endmodule

