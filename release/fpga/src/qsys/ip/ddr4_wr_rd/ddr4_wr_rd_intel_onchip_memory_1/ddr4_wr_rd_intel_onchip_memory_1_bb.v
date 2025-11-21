module ddr4_wr_rd_intel_onchip_memory_1 (
		input  wire         clk,        //   clk1.clk
		input  wire [12:0]  address,    //     s1.address
		input  wire [15:0]  byteenable, //       .byteenable
		input  wire         write,      //       .write
		input  wire [127:0] writedata,  //       .writedata
		input  wire         reset,      // reset1.reset
		input  wire         reset_req,  //       .reset_req
		input  wire [12:0]  address2,   //     s2.address
		input  wire         read2,      //       .read
		output wire [127:0] readdata2,  //       .readdata
		input  wire         clk2,       //   clk2.clk
		input  wire         reset2,     // reset2.reset
		input  wire         reset_req2  //       .reset_req
	);
endmodule

