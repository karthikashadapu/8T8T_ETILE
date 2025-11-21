// (C) 2001-2024 Intel Corporation. All rights reserved.
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


`timescale 1 ps / 1 ps
// baeckler - 07-12-2014
// DESCRIPTION
// Wrapper for MLAB hardware cells in typical arrangement

module alt_ehipc3_fm_mlab #(
	parameter WIDTH = 20,
	parameter ADDR_WIDTH = 5,
	parameter SIM_EMULATE = 1'b0   // this may not be exactly the same at the fine grain timing level 
)
(
	input wclk,
	input wena,
	input [ADDR_WIDTH-1:0] waddr_reg,
	input [WIDTH-1:0] wdata_reg,
	input [ADDR_WIDTH-1:0] raddr,
	output [WIDTH-1:0] rdata		
);

genvar i;
generate
	if (!SIM_EMULATE) begin
        /////////////////////////////////////////////
        // hardware cells

        // the fourteen nm only (the Stratix 10) needs another data register
        reg [WIDTH-1:0] wdata_reg_2 /* synthesis preserve */;
        always @(posedge wclk) wdata_reg_2 <= wdata_reg;


		for (i=0; i<WIDTH; i=i+1)  begin : ml
			wire wclk_w = wclk;  // workaround strange modelsim warning due to cell model tristate
            // Note: the stratix 5 cell is the same other than timing
			//stratixv_mlab_cell lrm (
                        tennm_mlab_cell lrm (
				.clk0(wclk_w),
				.ena0(wena),
				
				// synthesis translate_off
				.clk1(1'b0),
				.ena1(1'b1),
				//.ena2(1'b1),
				.clr(1'b0),
				.devclrn(1'b1),
				.devpor(1'b1),
				// synthesis translate_on			

				.portabyteenamasks(1'b1),
				.portadatain(wdata_reg[i]),
				.portaaddr(waddr_reg),
				.portbaddr(raddr),
				.portbdataout(rdata[i])			
				
			);

			defparam lrm .mixed_port_feed_through_mode = "dont_care";
			defparam lrm .logical_ram_name = "lrm";
			defparam lrm .logical_ram_depth = 1 << ADDR_WIDTH;
			defparam lrm .logical_ram_width = WIDTH;
			defparam lrm .first_address = 0;
			defparam lrm .last_address = (1 << ADDR_WIDTH)-1;
			defparam lrm .first_bit_number = i;
			defparam lrm .data_width = 1;
			defparam lrm .address_width = ADDR_WIDTH;
		end
	end
	else begin
		/////////////////////////////////////////////
		// sim equivalent

		localparam NUM_WORDS = (1 << ADDR_WIDTH);
		reg [WIDTH-1:0] storage [0:NUM_WORDS-1];
		integer k = 0;
		initial begin
			for (k=0; k<NUM_WORDS; k=k+1) begin
				storage[k] = 0;
			end
		end

		always @(posedge wclk) begin
			if (wena) storage [waddr_reg] <= wdata_reg;	
		end

		reg [WIDTH-1:0] rdata_b = 0;
		always @(*) begin
			rdata_b = storage[raddr];
		end
		
		assign rdata = rdata_b;
	end
	
endgenerate

endmodule	

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "saGjb1xDblePCNY2eWcU/WvrOpZ5y9L4HgH/STvXeTRjyVb5Hg3phAWHKa+Ja3uOaKCFTl5kfGSVJrSHGZIU2CdcxmhdytRqbQ0UcBPifegPrKd6dYg79K0bkZ61/NICQ+UJ9yoeMywH7wFow65pcDvjNEkGcPKTqnQsCsy/RLnS+cZK1GzMa0/iQAhI9wypwGpArU02scNBymXHbs0QD3gEL/csPen+0fxLO07kEh2QG8rziqG6a7OXxcaxzevl+bQNNJ1aLtgDfmPsOTR64Kr1vuq5x3Oa6cw2aQ31qQ7Hqwx4FYKN2SA5EB5S84+sWJzF1ll/CoYGJM0nsubbRZM+Y23sssy+TDFxew/Wkn4QFkjqv+04dkpJ7JFLZoYeFwC9fILZOamsQNrveuzB2yL1S0JSZOtHec4qeP+iaA7C2mI4xv8+/t5geMIfAh8Y0DSVmyN9CAIS2XD0HLf+iESVyCT7KCTYsXOwbLkGsjmMjzIzVU6YCEdHxlGXjYol3Z1SxnaDMVFmhWevwvE/A1SvAjaQUh7I5r31aRCyTgYzYigianJHtL3E3Q17dOt6dA1XCT+56Eor3J+stAeUcsPm63QVyLkIED9BFe+tTmXwN19i2arOoECKeEBwS5o4xrgXwrdB13lzudopJpmHo+UNAC+sL4ecFm5fbC8/oMdabCUiRdp/VQ/pe8NXWdEdq77+n6KrjGVELJxtcqNtZbBH9mv8IqFjyeAawl3HJnAW8uJqAnELvWed4cLl9BuTKQ0+wzd97AUWC1LOQDmW9xRKmC/ZIHcIWyVKCGd5lMvp65zJfHpnjMt1I+6NZpahZJnty4R5nagNAd5VLggtl+8OpYCjGmuB0xGM6SGyh8l1TW+pobD6yWwyJfoLgjalZ+lMlxXB7lfQbhZYHZ9NKrPC39foy9jNzMasnTUizCGv0SVlT/yBpcm76MhqmGeI6rlQ0vX20vzchxQ0/f1pc4fmwXjJOnq8BIq3bcDjPX2/s/aH0o+l87MJm1fNXoY+"
`endif