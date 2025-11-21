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

// DESCRIPTION
// Wrapper for MLAB hardware cells in typical arrangement

module alt_ehipc3_fm_sl_mlab #(
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
`pragma questa_oem_00 "sj2EnSVIknGz65j61L+DMMO3HDcSN2jhvr55koJ1ECJkPtG0Fw9q9R2fIYYgv2BPR8BrsR+RYKuIJjlYQNmgnXVjvtJtJool3uQURgCFpQL23pok+Wr2TXSNbySMdXxV2gz6CwxUk+0+/rDLrsroCzkAiFw2amgz6Do5tJQltYjCIPqHFj/3UZep9T4dBvB83T//SpBFZzgCz+Lzrx+1A17RXSmjyar6SF3JSJg+7B0+JUbq1aght/5R/om3oZ2yGnTAF9HrPQ0t78+2l20v4uZPAuobX2DapWmHOvQNCAlWsbn+42VDReg/n/Apzg++SUb8NTZamlQgQCQpXx0bVjXeaSmSca2N+hxkg2Rd92VyLX50krnXc/CxqmO0/Rw2V64rUEx6838kCtnEPaMRe1A9mHvWgHxGq+7QLgg9Ee1DedESMxkU+kHCneFHRx5guADrF5aFn0W3GtlDdLs/dyoaf643J6ddHmHHaVO4Po7klaANdTMySqXYOXLJmxzsGKpi9lRWxtCqdEBN4X3LO/bA8nPdA8rEzVvKi9uP2QHjQpH2t1TvxYV+v55DzcZia/5XeVvqxglaIDePUJQFi7EFxwBukUjuWl6SXLL7Cif5kxU+/HgMG+0BqCIgepq5d/D4OH/gjtpzilwIltAMn+QuIa7utsvNk5jS5/9MzH8dd/i1rv8NyoB74DnrGswA+9U2VvAlE3sDXX4NuhfgaLMAZPN+DI1lMBT8qoZpJ+r7YHJXCi7Sdz46aEQ8rfjCneX/HR1SUJfVjJmVoJFPPf/P6Jy49ZwSwr0zqEVtMv80aEDBNXMWvTEvfzJzDzzhvf/jk/KnWLt/DfNS6hYEYv53Dk10/KLPR6ZZEHlHDPv0hksymtjBgLL/MVIewek0rYy1VW+MYKQ/MQXs+IS9jFF6K5UCo+r6GSTMvi5dZbNqMtN0QJZGkpkSeqdpRDHtFJGtYsX/U7DDcHee+eW90LGjlJCe1UkyDTiAa9WupLWgA5KlpTRTXsj2eYEjbNPp"
`endif