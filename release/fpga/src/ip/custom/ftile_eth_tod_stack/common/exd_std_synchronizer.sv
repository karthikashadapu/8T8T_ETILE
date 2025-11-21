// (C) 2001-2022 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.




module exd_std_synchronizer #(parameter DW=8) 
    (

     input  clk,
     
     input  logic [DW-1:0] din,
     output logic [DW-1:0] dout


     );

    logic [DW-1:0] 	   din_c1, din_c2;

    always_ff @(posedge clk) begin
	din_c1 <= din;
	din_c2 <= din_c1;

	dout <= din_c2;

    end

endmodule 


