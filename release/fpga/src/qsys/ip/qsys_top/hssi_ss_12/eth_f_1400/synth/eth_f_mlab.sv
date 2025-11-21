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

module eth_f_mlab #(
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
`pragma questa_oem_00 "Jbn39HeDxGqNcYGZOx4Z9ucCs2oEh/b8uMkRaNvB5DRjzJrJYrpJKWFCISE85ii6tH9zuuCEo6X0af6OauTQ+Ozwk1tsZmSo/aK9UOYVqiI4L0mMLnnDyFPJBEUN+znp6d+oie84TxrwJugN/66eG6ek4cTulks0EXWtTfhwKcotsw0Xz4/SS3GVym/4tne0z9smydSL74/eJ6ocrXzqMjpfEjy1qL7mzZl6AEz+onrJNiuE54fRNBxsx8b4Wpzc0GtocRJ2aUT3cBP76xWKOsD4luzIhgRok7iJT96zlaC0ESCKQpIwbHnk4LjZZwjXDlcdsfGz25bUG4inw6nrcSuqfMKDnpmJlHasXIiu4qbsBphseLiUDkWeL0xT2WoFh/NWqEYlrUIvqPPVym5nuDThQRY/Lgs+BedkHY3ycimH4kog+x1dtmFy/nETCxehvmtEaIknNfAXABJeCXGOI7KH+q4t99FJxALL70n8kWbVPdRl/dcobIM4mowoD/udpliuzdWDlic+ysfy+yapknQsdTN3C3z32duja5toy9OxESzS2Lv6uFbeEWBuca0qteWulNBnZLD/yb5dshcGwxyWKWOh2Q4GOvbn8Wq+SzdWJsGpMUmwlG6EbXkuW8h+u85mY6eE6hM7mQHge+R3VoIndSXw4DMRx1+5bGgcjkV6ROm8KJSl18ScD1bouBMp2JF8pMve6RtlCNAgXEAoo+1hG0+hz6Aik34ZlCMytp5/vtNO8iFZe166YOjX7Q8lYTAGWdPcUdofgM2bI4JWf1k9geIvLrrOWoeZOJ3Mpuz6juGeOMqByyQfwullXKDFWG0FO+RKtJl8nRlIh4g5WxIxcolNmtuIh8OTXH3BoEehJDAegbEDoAHopvInoI0gEOLuzW8DDQDFmEJ3l9+fyVu/R04YPDHczmx9Jwkim4P9oPCQRaZOIp403h4WyPp5IoNr98I2p0SrMwXJ6WhV7Hv2E36X7nz+Fi6yuItZfaKYNkavGq/9D1K7OCKysepZ"
`endif