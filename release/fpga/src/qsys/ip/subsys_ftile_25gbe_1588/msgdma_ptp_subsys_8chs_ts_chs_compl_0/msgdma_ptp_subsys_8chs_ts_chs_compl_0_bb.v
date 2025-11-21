module msgdma_ptp_subsys_8chs_ts_chs_compl_0 #(
		parameter NUM_PORTS        = 1,
		parameter ID_WIDTH         = 20,
		parameter DATA_WIDTH       = 96,
		parameter TO_CNTR_WIDTH    = 11,
		parameter CHANNEL_WIDTH    = 1,
		parameter FP_WIDTH         = 20,
		parameter AVST_DATA_WIDTH  = 128,
		parameter AVST_ERROR_WIDTH = 6,
		parameter AVST_EMPTY_WIDTH = 4
	) (
		input  wire                                          i_ts_req_clk, //   ts_req_clk.clk
		input  wire                                          i_ts_req_rst, // ts_req_reset.reset
		input  wire [(((NUM_PORTS-1)-0)+1)-1:0]              i_clk_bus,    //   clk_bus_in.clk
		input  wire [(((NUM_PORTS-1)-0)+1)-1:0]              i_rst_bus,    //   rst_bus_in.reset_n
		output wire                                          in_st_ready,  //        in_st.ready
		input  wire                                          in_st_sop,    //             .startofpacket
		input  wire                                          in_st_valid,  //             .valid
		input  wire                                          in_st_eop,    //             .endofpacket
		input  wire [(((AVST_DATA_WIDTH-1)-0)+1)-1:0]        in_st_data,   //             .data
		input  wire [(((AVST_EMPTY_WIDTH-1)-0)+1)-1:0]       in_st_empty,  //             .empty
		input  wire [(((AVST_ERROR_WIDTH-1)-0)+1)-1:0]       in_st_error,  //             .error
		input  wire                                          out_st_ready, //       out_st.ready
		output wire                                          out_st_sop,   //             .startofpacket
		output wire                                          out_st_valid, //             .valid
		output wire                                          out_st_eop,   //             .endofpacket
		output wire [(((AVST_DATA_WIDTH-1)-0)+1)-1:0]        out_st_data,  //             .data
		output wire [(((AVST_EMPTY_WIDTH-1)-0)+1)-1:0]       out_st_empty, //             .empty
		output wire [(((AVST_ERROR_WIDTH-1)-0)+1)-1:0]       out_st_error, //             .error
		input  wire [(((NUM_PORTS-1)-0)+1)-1:0]              i_ts_valid,   //         i_ts.valid
		input  wire [((((NUM_PORTS*FP_WIDTH)-1)-0)+1)-1:0]   i_ts_fp,      //             .fingerprint
		input  wire [((((NUM_PORTS*DATA_WIDTH)-1)-0)+1)-1:0] i_ts_data,    //             .data
		output wire [(((NUM_PORTS-1)-0)+1)-1:0]              o_ts_valid,   //         o_ts.valid
		output wire [((((NUM_PORTS*ID_WIDTH)-1)-0)+1)-1:0]   o_ts_fp,      //             .fingerprint
		output wire [((((NUM_PORTS*DATA_WIDTH)-1)-0)+1)-1:0] o_ts_data     //             .data
	);
endmodule

