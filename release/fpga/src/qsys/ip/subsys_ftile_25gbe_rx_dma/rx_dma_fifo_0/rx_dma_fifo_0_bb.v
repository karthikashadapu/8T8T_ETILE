module rx_dma_fifo_0 #(
		parameter DEVICE                = "s10",
		parameter USE_RX_READY          = 0,
		parameter MEMORY_CAPACITY_WORDS = 16384,
		parameter AVST_DATA_WIDTH       = 64,
		parameter AVST_ERROR_WIDTH      = 6,
		parameter TS_WIDTH              = 96,
		parameter TS_RESP_WIDTH         = 256,
		parameter AVST_EMPTY_WIDTH      = 3,
		parameter TO_CNTR_WIDTH         = 20
	) (
		input  wire                                    in_st_clk,         //   in_st_clk.clk
		input  wire                                    in_st_rst,         //   in_st_rst.reset
		input  wire                                    out_st_clk,        //  out_st_clk.clk
		input  wire                                    out_st_rst,        //  out_st_rst.reset
		input  wire                                    csr_clk,           //     csr_clk.clk
		input  wire                                    csr_rst,           //     csr_rst.reset
		input  wire                                    in_st_sop,         //     in_avst.startofpacket
		input  wire                                    in_st_valid,       //            .valid
		input  wire                                    in_st_eop,         //            .endofpacket
		input  wire [(((AVST_DATA_WIDTH-1)-0)+1)-1:0]  in_st_data,        //            .data
		input  wire [(((AVST_EMPTY_WIDTH-1)-0)+1)-1:0] in_st_empty,       //            .empty
		input  wire [(((AVST_ERROR_WIDTH-1)-0)+1)-1:0] in_st_error,       //            .error
		input  wire                                    in_ts_valid,       //       in_ts.valid
		input  wire [(((TS_WIDTH-1)-0)+1)-1:0]         in_ts_data,        //            .data
		input  wire                                    out_st_ready,      //    out_avst.ready
		output wire                                    out_st_sop,        //            .startofpacket
		output wire                                    out_st_valid,      //            .valid
		output wire                                    out_st_eop,        //            .endofpacket
		output wire [(((AVST_DATA_WIDTH-1)-0)+1)-1:0]  out_st_data,       //            .data
		output wire [(((AVST_EMPTY_WIDTH-1)-0)+1)-1:0] out_st_empty,      //            .empty
		output wire [(((AVST_ERROR_WIDTH-1)-0)+1)-1:0] out_st_error,      //            .error
		output wire                                    in_ts_resp_ready,  //  in_ts_resp.ready
		input  wire                                    in_ts_resp_valid,  //            .valid
		input  wire [(((TS_RESP_WIDTH-1)-0)+1)-1:0]    in_ts_resp_data,   //            .data
		input  wire                                    out_ts_resp_ready, // out_ts_resp.ready
		output wire                                    out_ts_resp_valid, //            .valid
		output wire [(((TS_RESP_WIDTH-1)-0)+1)-1:0]    out_ts_resp_data   //            .data
	);
endmodule

