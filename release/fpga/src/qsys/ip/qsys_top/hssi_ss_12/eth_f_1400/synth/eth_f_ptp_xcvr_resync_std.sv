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
			.depth(INT_LEN),
			.turn_off_add_pipeline(1)
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
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX+SM7k2RPe0Ysxxv8DkA1gmLnvKn9DhCGdSrqeff/wKNV8o8OncoKiEpH0MRiRVBjVW8v8filUDJ43O3vKj0SfA+2QLkNtoVrdyt8sq+IJKlE5CjFNh54PMp7RkcDUyy4qY6tBhLbKuaXSC+Me5c3seECQRsBQCn9qhdb+1B3E8jPLK0PzRerdTHgnI0+7MvHY19fOTnFvMjSKf0IWbvo2M+MUiQbzqgrseOIvZxqsHR3PSMbCPnvBIzkPpj+UpfxAFR7d4vK8P24AHPuJA2aCrLQzKPgQXN8afJDq3B1z8GP2j6N5AynfP9MXnqCF8MG3QB5xpNiLMX5fw9JaSE+wW0XXBWWaRVcFAM4FkfrhNYQov+7q8xl+ptSafrONvtB6mjmpGaknUt20e/xlXITk3HJJjdwL/JVDA4qXVFr/ujdDBtGQVR0V+4eIjPwLnKiQ5EMWiHVpD83YOCVo0PrKJ8lAS4Tji3WyprOTumdcFXElh0cBvYMoxFRw8hDtt4ra0BJq9emLa4z/Gz/7FEeDwUGTbf4lTXWtmz7UGkl8jIddn0TonGSpO6PceuZkif/V1d87z9lz0Kjrwpf9RpK7CS+ooIzBYKw4x86IKstBSrCjCDKKEuxQr+X1BsQg/48SIqsGCHvXqMhOUVLOMDqBBYGM47MBqPag9c6Dt1FmBcVmJ5gfqV2TQwFfTxMzfINAktXRNC0zQEG7MBS05ilu+adNRLQ/ADmwP770gTC+cGXAjnPqxTjHg0WxSR6I/sWzSzPfDZ0ggnmCvcmCpDSin"
`endif