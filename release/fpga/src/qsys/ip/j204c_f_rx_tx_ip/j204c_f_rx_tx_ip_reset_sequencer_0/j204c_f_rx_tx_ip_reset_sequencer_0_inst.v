	j204c_f_rx_tx_ip_reset_sequencer_0 #(
		.NUM_OUTPUTS                   (INTEGER_VALUE_FOR_NUM_OUTPUTS),
		.ENABLE_DEASSERTION_INPUT_QUAL (INTEGER_VALUE_FOR_ENABLE_DEASSERTION_INPUT_QUAL),
		.ENABLE_ASSERTION_SEQUENCE     (INTEGER_VALUE_FOR_ENABLE_ASSERTION_SEQUENCE),
		.ENABLE_DEASSERTION_SEQUENCE   (INTEGER_VALUE_FOR_ENABLE_DEASSERTION_SEQUENCE),
		.MIN_ASRT_TIME                 (INTEGER_VALUE_FOR_MIN_ASRT_TIME),
		.ASRT_DELAY0                   (INTEGER_VALUE_FOR_ASRT_DELAY0),
		.DSRT_DELAY0                   (INTEGER_VALUE_FOR_DSRT_DELAY0),
		.ASRT_REMAP0                   (INTEGER_VALUE_FOR_ASRT_REMAP0),
		.DSRT_REMAP0                   (INTEGER_VALUE_FOR_DSRT_REMAP0),
		.DSRT_QUALCNT_0                (INTEGER_VALUE_FOR_DSRT_QUALCNT_0),
		.ASRT_DELAY1                   (INTEGER_VALUE_FOR_ASRT_DELAY1),
		.DSRT_DELAY1                   (INTEGER_VALUE_FOR_DSRT_DELAY1),
		.ASRT_REMAP1                   (INTEGER_VALUE_FOR_ASRT_REMAP1),
		.DSRT_REMAP1                   (INTEGER_VALUE_FOR_DSRT_REMAP1),
		.DSRT_QUALCNT_1                (INTEGER_VALUE_FOR_DSRT_QUALCNT_1),
		.ASRT_DELAY2                   (INTEGER_VALUE_FOR_ASRT_DELAY2),
		.DSRT_DELAY2                   (INTEGER_VALUE_FOR_DSRT_DELAY2),
		.ASRT_REMAP2                   (INTEGER_VALUE_FOR_ASRT_REMAP2),
		.DSRT_REMAP2                   (INTEGER_VALUE_FOR_DSRT_REMAP2),
		.DSRT_QUALCNT_2                (INTEGER_VALUE_FOR_DSRT_QUALCNT_2),
		.ASRT_DELAY3                   (INTEGER_VALUE_FOR_ASRT_DELAY3),
		.DSRT_DELAY3                   (INTEGER_VALUE_FOR_DSRT_DELAY3),
		.ASRT_REMAP3                   (INTEGER_VALUE_FOR_ASRT_REMAP3),
		.DSRT_REMAP3                   (INTEGER_VALUE_FOR_DSRT_REMAP3),
		.DSRT_QUALCNT_3                (INTEGER_VALUE_FOR_DSRT_QUALCNT_3),
		.ASRT_DELAY4                   (INTEGER_VALUE_FOR_ASRT_DELAY4),
		.DSRT_DELAY4                   (INTEGER_VALUE_FOR_DSRT_DELAY4),
		.ASRT_REMAP4                   (INTEGER_VALUE_FOR_ASRT_REMAP4),
		.DSRT_REMAP4                   (INTEGER_VALUE_FOR_DSRT_REMAP4),
		.DSRT_QUALCNT_4                (INTEGER_VALUE_FOR_DSRT_QUALCNT_4),
		.ASRT_DELAY5                   (INTEGER_VALUE_FOR_ASRT_DELAY5),
		.DSRT_DELAY5                   (INTEGER_VALUE_FOR_DSRT_DELAY5),
		.ASRT_REMAP5                   (INTEGER_VALUE_FOR_ASRT_REMAP5),
		.DSRT_REMAP5                   (INTEGER_VALUE_FOR_DSRT_REMAP5),
		.DSRT_QUALCNT_5                (INTEGER_VALUE_FOR_DSRT_QUALCNT_5),
		.ASRT_DELAY6                   (INTEGER_VALUE_FOR_ASRT_DELAY6),
		.DSRT_DELAY6                   (INTEGER_VALUE_FOR_DSRT_DELAY6),
		.ASRT_REMAP6                   (INTEGER_VALUE_FOR_ASRT_REMAP6),
		.DSRT_REMAP6                   (INTEGER_VALUE_FOR_DSRT_REMAP6),
		.DSRT_QUALCNT_6                (INTEGER_VALUE_FOR_DSRT_QUALCNT_6),
		.ASRT_DELAY7                   (INTEGER_VALUE_FOR_ASRT_DELAY7),
		.DSRT_DELAY7                   (INTEGER_VALUE_FOR_DSRT_DELAY7),
		.ASRT_REMAP7                   (INTEGER_VALUE_FOR_ASRT_REMAP7),
		.DSRT_REMAP7                   (INTEGER_VALUE_FOR_DSRT_REMAP7),
		.DSRT_QUALCNT_7                (INTEGER_VALUE_FOR_DSRT_QUALCNT_7),
		.ASRT_DELAY8                   (INTEGER_VALUE_FOR_ASRT_DELAY8),
		.DSRT_DELAY8                   (INTEGER_VALUE_FOR_DSRT_DELAY8),
		.ASRT_REMAP8                   (INTEGER_VALUE_FOR_ASRT_REMAP8),
		.DSRT_REMAP8                   (INTEGER_VALUE_FOR_DSRT_REMAP8),
		.DSRT_QUALCNT_8                (INTEGER_VALUE_FOR_DSRT_QUALCNT_8),
		.ASRT_DELAY9                   (INTEGER_VALUE_FOR_ASRT_DELAY9),
		.DSRT_DELAY9                   (INTEGER_VALUE_FOR_DSRT_DELAY9),
		.ASRT_REMAP9                   (INTEGER_VALUE_FOR_ASRT_REMAP9),
		.DSRT_REMAP9                   (INTEGER_VALUE_FOR_DSRT_REMAP9),
		.DSRT_QUALCNT_9                (INTEGER_VALUE_FOR_DSRT_QUALCNT_9)
	) u0 (
		.clk              (_connected_to_clk_),              //   input,   width = 1,              clk.clk
		.reset_in0        (_connected_to_reset_in0_),        //   input,   width = 1,        reset_in0.reset
		.reset_out0       (_connected_to_reset_out0_),       //  output,   width = 1,       reset_out0.reset
		.reset_out1       (_connected_to_reset_out1_),       //  output,   width = 1,       reset_out1.reset
		.reset_out2       (_connected_to_reset_out2_),       //  output,   width = 1,       reset_out2.reset
		.reset_out3       (_connected_to_reset_out3_),       //  output,   width = 1,       reset_out3.reset
		.reset_out4       (_connected_to_reset_out4_),       //  output,   width = 1,       reset_out4.reset
		.reset_out5       (_connected_to_reset_out5_),       //  output,   width = 1,       reset_out5.reset
		.reset1_dsrt_qual (_connected_to_reset1_dsrt_qual_), //   input,   width = 1, reset1_dsrt_qual.reset1_dsrt_qual
		.reset2_dsrt_qual (_connected_to_reset2_dsrt_qual_), //   input,   width = 1, reset2_dsrt_qual.reset2_dsrt_qual
		.reset4_dsrt_qual (_connected_to_reset4_dsrt_qual_), //   input,   width = 1, reset4_dsrt_qual.reset4_dsrt_qual
		.csr_reset        (_connected_to_csr_reset_),        //   input,   width = 1,        csr_reset.reset
		.av_address       (_connected_to_av_address_),       //   input,   width = 8,           av_csr.address
		.av_readdata      (_connected_to_av_readdata_),      //  output,  width = 32,                 .readdata
		.av_read          (_connected_to_av_read_),          //   input,   width = 1,                 .read
		.av_writedata     (_connected_to_av_writedata_),     //   input,  width = 32,                 .writedata
		.av_write         (_connected_to_av_write_),         //   input,   width = 1,                 .write
		.irq              (_connected_to_irq_)               //  output,   width = 1,       av_csr_irq.irq
	);

