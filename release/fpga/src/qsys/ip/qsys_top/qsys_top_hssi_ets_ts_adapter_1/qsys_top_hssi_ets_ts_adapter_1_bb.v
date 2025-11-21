module qsys_top_hssi_ets_ts_adapter_1 #(
		parameter FP_WIDTH = 10
	) (
		input  wire                             timestamp_fp_valid,     // egrs_ts_hssi.tvalid
		input  wire [(((FP_WIDTH+95)-0)+1)-1:0] timestamp_fp_data,      //             .tdata
		output wire                             aso_timestamp_fp_valid, //  egrs_ts_dma.valid
		output wire [31:0]                      aso_timestamp_fp,       //             .fingerprint
		output wire [95:0]                      aso_timestamp_data      //             .data
	);
endmodule

