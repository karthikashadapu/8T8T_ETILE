module j204c_f_rx_tx_ip_reset_sequencer_0 #(
		parameter NUM_OUTPUTS                   = 6,
		parameter ENABLE_DEASSERTION_INPUT_QUAL = 22,
		parameter ENABLE_ASSERTION_SEQUENCE     = 0,
		parameter ENABLE_DEASSERTION_SEQUENCE   = 1,
		parameter MIN_ASRT_TIME                 = 20,
		parameter ASRT_DELAY0                   = 0,
		parameter DSRT_DELAY0                   = 2,
		parameter ASRT_REMAP0                   = 0,
		parameter DSRT_REMAP0                   = 0,
		parameter DSRT_QUALCNT_0                = 0,
		parameter ASRT_DELAY1                   = 0,
		parameter DSRT_DELAY1                   = 0,
		parameter ASRT_REMAP1                   = 1,
		parameter DSRT_REMAP1                   = 1,
		parameter DSRT_QUALCNT_1                = 2,
		parameter ASRT_DELAY2                   = 0,
		parameter DSRT_DELAY2                   = 0,
		parameter ASRT_REMAP2                   = 2,
		parameter DSRT_REMAP2                   = 2,
		parameter DSRT_QUALCNT_2                = 0,
		parameter ASRT_DELAY3                   = 0,
		parameter DSRT_DELAY3                   = 100,
		parameter ASRT_REMAP3                   = 3,
		parameter DSRT_REMAP3                   = 3,
		parameter DSRT_QUALCNT_3                = 0,
		parameter ASRT_DELAY4                   = 0,
		parameter DSRT_DELAY4                   = 0,
		parameter ASRT_REMAP4                   = 4,
		parameter DSRT_REMAP4                   = 4,
		parameter DSRT_QUALCNT_4                = 0,
		parameter ASRT_DELAY5                   = 0,
		parameter DSRT_DELAY5                   = 50,
		parameter ASRT_REMAP5                   = 5,
		parameter DSRT_REMAP5                   = 5,
		parameter DSRT_QUALCNT_5                = 0,
		parameter ASRT_DELAY6                   = 0,
		parameter DSRT_DELAY6                   = 0,
		parameter ASRT_REMAP6                   = 6,
		parameter DSRT_REMAP6                   = 6,
		parameter DSRT_QUALCNT_6                = 0,
		parameter ASRT_DELAY7                   = 0,
		parameter DSRT_DELAY7                   = 0,
		parameter ASRT_REMAP7                   = 7,
		parameter DSRT_REMAP7                   = 7,
		parameter DSRT_QUALCNT_7                = 0,
		parameter ASRT_DELAY8                   = 0,
		parameter DSRT_DELAY8                   = 0,
		parameter ASRT_REMAP8                   = 8,
		parameter DSRT_REMAP8                   = 8,
		parameter DSRT_QUALCNT_8                = 0,
		parameter ASRT_DELAY9                   = 0,
		parameter DSRT_DELAY9                   = 0,
		parameter ASRT_REMAP9                   = 9,
		parameter DSRT_REMAP9                   = 9,
		parameter DSRT_QUALCNT_9                = 0
	) (
		input  wire        clk,              //              clk.clk
		input  wire        reset_in0,        //        reset_in0.reset
		output wire        reset_out0,       //       reset_out0.reset
		output wire        reset_out1,       //       reset_out1.reset
		output wire        reset_out2,       //       reset_out2.reset
		output wire        reset_out3,       //       reset_out3.reset
		output wire        reset_out4,       //       reset_out4.reset
		output wire        reset_out5,       //       reset_out5.reset
		input  wire        reset1_dsrt_qual, // reset1_dsrt_qual.reset1_dsrt_qual
		input  wire        reset2_dsrt_qual, // reset2_dsrt_qual.reset2_dsrt_qual
		input  wire        reset4_dsrt_qual, // reset4_dsrt_qual.reset4_dsrt_qual
		input  wire        csr_reset,        //        csr_reset.reset
		input  wire [7:0]  av_address,       //           av_csr.address
		output wire [31:0] av_readdata,      //                 .readdata
		input  wire        av_read,          //                 .read
		input  wire [31:0] av_writedata,     //                 .writedata
		input  wire        av_write,         //                 .write
		output wire        irq               //       av_csr_irq.irq
	);
endmodule

