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


// Module: eth_f_ptp_xcvr_resync_std
//
// Description:
//  A general purpose resynchronization module that uses the recommended eth_f_altera_std_synchronizer
//  and eth_f_altera_std_synchronizer_nocut synchronizer
//  
//  Parameters:
//    SYNC_CHAIN_LENGTH
//      - Specifies the length of the synchronizer chain for metastability
//        retiming.
//    WIDTH
//      - Specifies the number of bits you want to synchronize. Controls the width of the
//        d and q ports.
//    SLOW_CLOCK - USE WITH CAUTION. 
//      - Leaving this setting at its default will create a standard resynch circuit that
//        merely passes the input data through a chain of flip-flops. This setting assumes
//        that the input data has a pulse width longer than one clock cycle sufficient to
//        satisfy setup and hold requirements on at least one clock edge.
//      - By setting this to 1 (USE CAUTION) you are creating an asynchronous
//        circuit that will capture the input data regardless of the pulse width and 
//        its relationship to the clock. However it is more difficult to apply static
//        timing constraints as it ties the data input to the clock input of the flop.
//        This implementation assumes the data rate is slow enough
//    INIT_VALUE
//      - Specifies the initial values of the synchronization registers.
//	  NO_CUT
//		- Specifies whether to apply embedded false path timing constraint. 
//		  0: Apply the constraint 1: Not applying the constraint
//

`timescale 1ps/1ps 

module eth_f_ptp_xcvr_resync_std #(
    parameter SYNC_CHAIN_LENGTH = 2,  // Number of flip-flops for retiming. Must be >1
    parameter WIDTH             = 1,  // Number of bits to resync
    parameter SLOW_CLOCK        = 0,  // See description above
    parameter INIT_VALUE        = 0,
    parameter NO_CUT		= 1	  // See description above
  ) (
  input   wire              clk,
  input   wire              reset,
  input   wire  [WIDTH-1:0] d,
  output  wire  [WIDTH-1:0] q
  );

localparam  INT_LEN       = (SYNC_CHAIN_LENGTH > 1) ? SYNC_CHAIN_LENGTH : 2;
localparam  L_INIT_VALUE  = (INIT_VALUE == 1) ? 1'b1 : 1'b0;

genvar ig;

// Generate a synchronizer chain for each bit
generate for(ig=0;ig<WIDTH;ig=ig+1) begin : resync_chains
	wire                d_in;   // Input to sychronization chain.
	wire				sync_d_in;
	wire		        sync_q_out;
	
	// Adding inverter to the input of first sync register and output of the last sync register to implement power-up high for INIT_VALUE=1
	assign sync_d_in = (INIT_VALUE == 1) ? ~d_in : d_in;
	assign q[ig] = (INIT_VALUE == 1)  ? ~sync_q_out : sync_q_out;
	
	// NOT SUPPORTED if (NO_CUT == 0) begin		
	// NOT SUPPORTED 	eth_f_altera_std_synchronizer #(
	// NOT SUPPORTED 		.depth(INT_LEN)				
	// NOT SUPPORTED 	) synchronizer (
	// NOT SUPPORTED 		.clk		(clk),
	// NOT SUPPORTED 		.reset_n	(~reset),
	// NOT SUPPORTED 		.din		(sync_d_in),
	// NOT SUPPORTED 		.dout		(sync_q_out)
	// NOT SUPPORTED 	);
	// NOT SUPPORTED 	
	// NOT SUPPORTED 	//synthesis translate_off			
	// NOT SUPPORTED 	initial begin
	// NOT SUPPORTED 		synchronizer.dreg = {(INT_LEN-1){1'b0}};
	// NOT SUPPORTED 		synchronizer.din_s1 = 1'b0;
	// NOT SUPPORTED 	end
	// NOT SUPPORTED 	//synthesis translate_on
	// NOT SUPPORTED 			
	// NOT SUPPORTED end else begin
		eth_f_altera_std_synchronizer_nocut #(
			.depth(INT_LEN)				
		) synchronizer_nocut (
			.clk		(clk),
			.reset_n	(~reset),
			.din		(sync_d_in),
			.dout		(sync_q_out)
		);
				
		//synthesis translate_off
		initial begin
			synchronizer_nocut.dreg = {(INT_LEN-1){1'b0}};
			synchronizer_nocut.din_s1 = 1'b0;
		end
		//synthesis translate_on	
	// NOT SUPPORTED end
	
    // Generate asynchronous capture circuit if specified.
    if(SLOW_CLOCK == 0) begin
      assign  d_in = d[ig];
    end else begin
      wire  d_clk;
      reg   d_r = L_INIT_VALUE;
      wire  clr_n;

      assign  d_clk = d[ig];
      assign  d_in  = d_r;
      assign  clr_n = ~q[ig] | d_clk; // Clear when output is logic 1 and input is logic 0

      // Asynchronously latch the input signal.
      always @(posedge d_clk or negedge clr_n)
        if(!clr_n)      d_r <= 1'b0;
        else if(d_clk)  d_r <= 1'b1;
    end // SLOW_CLOCK
  end // for loop
endgenerate

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhGgDAkv06Dmv1okzaOdf/9s6yblbSFl7tFZSV3oEL807RpEtiNcKUHZh8jnuBhU5JrwJhi/D5ul3U4aEU4dbJ04q1lhhY9DGnR1mR8j2Xuqoh1dxF0XHySkAVC/ru0ZHbj62Q+JQttgdq+GSlOsrGI4WlWzBRnR8O9n5ETc2KEB1kNoLfuP5B5+Pdw78wTrWW/wZrzsLec2R/0VodMEl+xcyIdeCVCTzI7ONszR5TaaGNhNEx2rDat9DEll4LI7BoxHmeAq8/q0jeSvtDpEFuDYIQel5FDxkMG+Qdu9hKC7czk4fXLU3Ki/+4twnW3YDkUBjSQtcd9aC4Yw56043qcv+muaFPcqBD6TytgG1Vz5Ek3gQSqoubqBc7S/j9ay4EfpeL7zCtSF7TDd78Uym6ZRE1aaR8v8iQA8LPiWAYHP4P7VQjzSrrsEZJORps34JKX83UQZNeZvaFoNGA+YYou1psxrqSRWgGnuhCIeGE1EJkwn+5YyijnGhxnktHB1f867OIy62WFkNaNkL8agqowTq4103g6UTGrcWt7NPWXbAs/ekgp3HV8vaJv6FZGXAHxlugx8afubglhSRhtDSOAYNWUgejPS1/gSspGZ+RmTkFKfZ+0DmzZOkx/w9Wpw7B+2euV20yo08NRmjf28H4LFj6Qex+VRRv4R5u+KcsLLeov9wMxgt2xiEuIKWpR9b4O3jhhlTg3IcLd1kJRGbZZTc/4LF6YouKxI/f2bQ/yX4vEIaZlop0/hnh7XJmgN3cgeRmX8LzMetDmeWqeLjKR"
`endif