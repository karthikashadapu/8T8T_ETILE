module subsys_ftile_25gbe_1588_avst_axist_bridge_0 #(
		parameter DATA_WIDTH   = 64,
		parameter NUM_CHANNELS = 1,
		parameter NO_OF_BYTES  = 8,
		parameter EMPTY_BITS   = 3,
		parameter Tiles        = "F",
		parameter SIM_EMULATE  = 1
	) (
		input  wire                               i_tx_clk,                       //      i_tx_clk.clk
		input  wire                               i_rx_clk,                       //      i_rx_clk.clk
		input  wire                               i_tx_rst_n,                     //    i_tx_rst_n.reset_n
		input  wire                               i_rx_rst_n,                     //    i_rx_rst_n.reset_n
		output wire                               o_av_st_tx_ready,               //    avst_tx_if.ready
		input  wire                               i_av_st_tx_valid,               //              .valid
		input  wire [(((DATA_WIDTH-1)-0)+1)-1:0]  i_av_st_tx_data,                //              .data
		input  wire                               i_av_st_tx_startofpacket,       //              .startofpacket
		input  wire                               i_av_st_tx_endofpacket,         //              .endofpacket
		input  wire [(((EMPTY_BITS-1)-0)+1)-1:0]  i_av_st_tx_empty,               //              .empty
		input  wire                               i_av_st_tx_error,               //              .error
		input  wire                               i_av_st_tx_skip_crc,            //   avst_tx_ptp.i_av_st_tx_skip_crc
		input  wire [1:0]                         i_av_st_tx_ptp_ts_valid,        //              .i_av_st_tx_ptp_ts_valid
		input  wire                               i_av_st_tx_ptp_ts_req,          //              .i_av_st_tx_ptp_ts_req
		input  wire                               i_av_st_tx_ptp_ins_ets,         //              .i_av_st_tx_ptp_ins_ets
		input  wire [31:0]                        i_av_st_tx_ptp_fp,              //              .i_av_st_tx_ptp_fp
		input  wire                               i_av_st_tx_ptp_ins_cf,          //              .i_av_st_tx_ptp_ins_cf
		input  wire [95:0]                        i_av_st_tx_ptp_tx_its,          //              .i_av_st_tx_ptp_tx_its
		input  wire [6:0]                         i_av_st_tx_ptp_asym_p2p_idx,    //              .i_av_st_tx_ptp_asym_p2p_idx
		input  wire                               i_av_st_tx_ptp_asym_sign,       //              .i_av_st_tx_ptp_asym_sign
		input  wire                               i_av_st_tx_ptp_asym,            //              .i_av_st_tx_ptp_asym
		input  wire                               i_av_st_tx_ptp_p2p,             //              .i_av_st_tx_ptp_p2p
		input  wire                               i_av_st_tx_ptp_ts_format,       //              .i_av_st_tx_ptp_ts_format
		input  wire                               i_av_st_tx_ptp_update_eb,       //              .i_av_st_tx_ptp_update_eb
		input  wire                               i_av_st_tx_ptp_zero_csum,       //              .i_av_st_tx_ptp_zero_csum
		input  wire [15:0]                        i_av_st_tx_ptp_eb_offset,       //              .i_av_st_tx_ptp_eb_offset
		input  wire [15:0]                        i_av_st_tx_ptp_csum_offset,     //              .i_av_st_tx_ptp_csum_offset
		input  wire [15:0]                        i_av_st_tx_ptp_cf_offset,       //              .i_av_st_tx_ptp_cf_offset
		input  wire [15:0]                        i_av_st_tx_ptp_ts_offset,       //              .i_av_st_tx_ptp_ts_offset
		input  wire                               i_axi_st_tx_tready,             //    axit_tx_if.tready
		output wire                               o_axi_st_tx_tvalid,             //              .tvalid
		output wire [(((DATA_WIDTH-1)-0)+1)-1:0]  o_axi_st_tx_tdata,              //              .tdata
		output wire                               o_axi_st_tx_tlast,              //              .tlast
		output wire [(((NO_OF_BYTES-1)-0)+1)-1:0] o_axi_st_tx_tkeep,              //              .tkeep
		output wire [1:0]                         o_axi_st_tx_tuser_client,       //              .tuser
		output wire [93:0]                        o_axi_st_tx_tuser_ptp,          // axist_tx_user.o_axi_st_tx_tuser_ptp
		output wire [327:0]                       o_axi_st_tx_tuser_ptp_extended, //              .o_axi_st_tx_tuser_ptp_extended
		output wire                               o_av_st_rx_valid,               //    avst_rx_if.valid
		output wire [(((DATA_WIDTH-1)-0)+1)-1:0]  o_av_st_rx_data,                //              .data
		output wire                               o_av_st_rx_startofpacket,       //              .startofpacket
		output wire                               o_av_st_rx_endofpacket,         //              .endofpacket
		output wire [(((EMPTY_BITS-1)-0)+1)-1:0]  o_av_st_rx_empty,               //              .empty
		output wire [5:0]                         o_av_st_rx_error,               //              .error
		output wire [39:0]                        o_av_st_rxstatus_data,          //   avst_rx_ptp.o_av_st_rxstatus_data
		output wire                               o_av_st_rxstatus_valid,         //              .o_av_st_rxstatus_valid
		output wire [95:0]                        o_av_st_ptp_rx_its,             //              .o_av_st_ptp_rx_its
		input  wire                               i_axi_st_rx_tvalid,             //   axist_rx_if.tvalid
		input  wire [(((DATA_WIDTH-1)-0)+1)-1:0]  i_axi_st_rx_tdata,              //              .tdata
		input  wire                               i_axi_st_rx_tlast,              //              .tlast
		input  wire [(((NO_OF_BYTES-1)-0)+1)-1:0] i_axi_st_rx_tkeep,              //              .tkeep
		input  wire [6:0]                         i_axi_st_rx_tuser_client,       //              .tuser
		input  wire [4:0]                         i_axi_st_rx_tuser_sts,          // axist_rx_user.i_axi_st_rx_tuser_sts
		input  wire [31:0]                        i_axi_st_rx_tuser_sts_extended, //              .i_axi_st_rx_tuser_sts_extended
		input  wire [95:0]                        i_axi_st_rx_ingrts0_tdata,      //              .i_axi_st_rx_ingrts0_tdata
		input  wire                               i_axi_st_rx_ingrts0_tvalid      //              .i_axi_st_rx_ingrts0_tvalid
	);
endmodule

