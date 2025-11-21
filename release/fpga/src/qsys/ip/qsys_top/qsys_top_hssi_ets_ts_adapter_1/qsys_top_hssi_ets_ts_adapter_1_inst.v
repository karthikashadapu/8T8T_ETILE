	qsys_top_hssi_ets_ts_adapter_1 #(
		.FP_WIDTH (INTEGER_VALUE_FOR_FP_WIDTH)
	) u0 (
		.timestamp_fp_valid     (_connected_to_timestamp_fp_valid_),     //   input,                      width = 1, egrs_ts_hssi.tvalid
		.timestamp_fp_data      (_connected_to_timestamp_fp_data_),      //   input,  width = (((FP_WIDTH+95)-0)+1),             .tdata
		.aso_timestamp_fp_valid (_connected_to_aso_timestamp_fp_valid_), //  output,                      width = 1,  egrs_ts_dma.valid
		.aso_timestamp_fp       (_connected_to_aso_timestamp_fp_),       //  output,                     width = 32,             .fingerprint
		.aso_timestamp_data     (_connected_to_aso_timestamp_data_)      //  output,                     width = 96,             .data
	);

