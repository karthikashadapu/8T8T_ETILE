	qsys_top_avst_axist_bridge_0 #(
		.DATA_WIDTH   (INTEGER_VALUE_FOR_DATA_WIDTH),
		.NUM_CHANNELS (INTEGER_VALUE_FOR_NUM_CHANNELS),
		.NO_OF_BYTES  (INTEGER_VALUE_FOR_NO_OF_BYTES),
		.EMPTY_BITS   (INTEGER_VALUE_FOR_EMPTY_BITS),
		.Tiles        (STRING_VALUE_FOR_Tiles),
		.SIM_EMULATE  (INTEGER_VALUE_FOR_SIM_EMULATE)
	) u0 (
		.i_tx_clk                       (_connected_to_i_tx_clk_),                       //   input,                        width = 1,      i_tx_clk.clk
		.i_rx_clk                       (_connected_to_i_rx_clk_),                       //   input,                        width = 1,      i_rx_clk.clk
		.i_tx_rst_n                     (_connected_to_i_tx_rst_n_),                     //   input,                        width = 1,    i_tx_rst_n.reset_n
		.i_rx_rst_n                     (_connected_to_i_rx_rst_n_),                     //   input,                        width = 1,    i_rx_rst_n.reset_n
		.o_av_st_tx_ready               (_connected_to_o_av_st_tx_ready_),               //  output,                        width = 1,    avst_tx_if.ready
		.i_av_st_tx_valid               (_connected_to_i_av_st_tx_valid_),               //   input,                        width = 1,              .valid
		.i_av_st_tx_data                (_connected_to_i_av_st_tx_data_),                //   input,   width = (((DATA_WIDTH-1)-0)+1),              .data
		.i_av_st_tx_startofpacket       (_connected_to_i_av_st_tx_startofpacket_),       //   input,                        width = 1,              .startofpacket
		.i_av_st_tx_endofpacket         (_connected_to_i_av_st_tx_endofpacket_),         //   input,                        width = 1,              .endofpacket
		.i_av_st_tx_empty               (_connected_to_i_av_st_tx_empty_),               //   input,   width = (((EMPTY_BITS-1)-0)+1),              .empty
		.i_av_st_tx_error               (_connected_to_i_av_st_tx_error_),               //   input,                        width = 1,              .error
		.i_av_st_tx_skip_crc            (_connected_to_i_av_st_tx_skip_crc_),            //   input,                        width = 1,   avst_tx_ptp.i_av_st_tx_skip_crc
		.i_av_st_tx_ptp_ts_valid        (_connected_to_i_av_st_tx_ptp_ts_valid_),        //   input,                        width = 2,              .i_av_st_tx_ptp_ts_valid
		.i_av_st_tx_ptp_ts_req          (_connected_to_i_av_st_tx_ptp_ts_req_),          //   input,                        width = 1,              .i_av_st_tx_ptp_ts_req
		.i_av_st_tx_ptp_ins_ets         (_connected_to_i_av_st_tx_ptp_ins_ets_),         //   input,                        width = 1,              .i_av_st_tx_ptp_ins_ets
		.i_av_st_tx_ptp_fp              (_connected_to_i_av_st_tx_ptp_fp_),              //   input,                       width = 32,              .i_av_st_tx_ptp_fp
		.i_av_st_tx_ptp_ins_cf          (_connected_to_i_av_st_tx_ptp_ins_cf_),          //   input,                        width = 1,              .i_av_st_tx_ptp_ins_cf
		.i_av_st_tx_ptp_tx_its          (_connected_to_i_av_st_tx_ptp_tx_its_),          //   input,                       width = 96,              .i_av_st_tx_ptp_tx_its
		.i_av_st_tx_ptp_asym_p2p_idx    (_connected_to_i_av_st_tx_ptp_asym_p2p_idx_),    //   input,                        width = 7,              .i_av_st_tx_ptp_asym_p2p_idx
		.i_av_st_tx_ptp_asym_sign       (_connected_to_i_av_st_tx_ptp_asym_sign_),       //   input,                        width = 1,              .i_av_st_tx_ptp_asym_sign
		.i_av_st_tx_ptp_asym            (_connected_to_i_av_st_tx_ptp_asym_),            //   input,                        width = 1,              .i_av_st_tx_ptp_asym
		.i_av_st_tx_ptp_p2p             (_connected_to_i_av_st_tx_ptp_p2p_),             //   input,                        width = 1,              .i_av_st_tx_ptp_p2p
		.i_av_st_tx_ptp_ts_format       (_connected_to_i_av_st_tx_ptp_ts_format_),       //   input,                        width = 1,              .i_av_st_tx_ptp_ts_format
		.i_av_st_tx_ptp_update_eb       (_connected_to_i_av_st_tx_ptp_update_eb_),       //   input,                        width = 1,              .i_av_st_tx_ptp_update_eb
		.i_av_st_tx_ptp_zero_csum       (_connected_to_i_av_st_tx_ptp_zero_csum_),       //   input,                        width = 1,              .i_av_st_tx_ptp_zero_csum
		.i_av_st_tx_ptp_eb_offset       (_connected_to_i_av_st_tx_ptp_eb_offset_),       //   input,                       width = 16,              .i_av_st_tx_ptp_eb_offset
		.i_av_st_tx_ptp_csum_offset     (_connected_to_i_av_st_tx_ptp_csum_offset_),     //   input,                       width = 16,              .i_av_st_tx_ptp_csum_offset
		.i_av_st_tx_ptp_cf_offset       (_connected_to_i_av_st_tx_ptp_cf_offset_),       //   input,                       width = 16,              .i_av_st_tx_ptp_cf_offset
		.i_av_st_tx_ptp_ts_offset       (_connected_to_i_av_st_tx_ptp_ts_offset_),       //   input,                       width = 16,              .i_av_st_tx_ptp_ts_offset
		.i_axi_st_tx_tready             (_connected_to_i_axi_st_tx_tready_),             //   input,                        width = 1,    axit_tx_if.tready
		.o_axi_st_tx_tvalid             (_connected_to_o_axi_st_tx_tvalid_),             //  output,                        width = 1,              .tvalid
		.o_axi_st_tx_tdata              (_connected_to_o_axi_st_tx_tdata_),              //  output,   width = (((DATA_WIDTH-1)-0)+1),              .tdata
		.o_axi_st_tx_tlast              (_connected_to_o_axi_st_tx_tlast_),              //  output,                        width = 1,              .tlast
		.o_axi_st_tx_tkeep              (_connected_to_o_axi_st_tx_tkeep_),              //  output,  width = (((NO_OF_BYTES-1)-0)+1),              .tkeep
		.o_axi_st_tx_tuser_client       (_connected_to_o_axi_st_tx_tuser_client_),       //  output,                        width = 2,              .tuser
		.o_axi_st_tx_tuser_ptp          (_connected_to_o_axi_st_tx_tuser_ptp_),          //  output,                       width = 94, axist_tx_user.o_axi_st_tx_tuser_ptp
		.o_axi_st_tx_tuser_ptp_extended (_connected_to_o_axi_st_tx_tuser_ptp_extended_), //  output,                      width = 328,              .o_axi_st_tx_tuser_ptp_extended
		.o_av_st_rx_valid               (_connected_to_o_av_st_rx_valid_),               //  output,                        width = 1,    avst_rx_if.valid
		.o_av_st_rx_data                (_connected_to_o_av_st_rx_data_),                //  output,   width = (((DATA_WIDTH-1)-0)+1),              .data
		.o_av_st_rx_startofpacket       (_connected_to_o_av_st_rx_startofpacket_),       //  output,                        width = 1,              .startofpacket
		.o_av_st_rx_endofpacket         (_connected_to_o_av_st_rx_endofpacket_),         //  output,                        width = 1,              .endofpacket
		.o_av_st_rx_empty               (_connected_to_o_av_st_rx_empty_),               //  output,   width = (((EMPTY_BITS-1)-0)+1),              .empty
		.o_av_st_rx_error               (_connected_to_o_av_st_rx_error_),               //  output,                        width = 6,              .error
		.o_av_st_rxstatus_data          (_connected_to_o_av_st_rxstatus_data_),          //  output,                       width = 40,   avst_rx_ptp.o_av_st_rxstatus_data
		.o_av_st_rxstatus_valid         (_connected_to_o_av_st_rxstatus_valid_),         //  output,                        width = 1,              .o_av_st_rxstatus_valid
		.o_av_st_ptp_rx_its             (_connected_to_o_av_st_ptp_rx_its_),             //  output,                       width = 96,              .o_av_st_ptp_rx_its
		.i_axi_st_rx_tvalid             (_connected_to_i_axi_st_rx_tvalid_),             //   input,                        width = 1,   axist_rx_if.tvalid
		.i_axi_st_rx_tdata              (_connected_to_i_axi_st_rx_tdata_),              //   input,   width = (((DATA_WIDTH-1)-0)+1),              .tdata
		.i_axi_st_rx_tlast              (_connected_to_i_axi_st_rx_tlast_),              //   input,                        width = 1,              .tlast
		.i_axi_st_rx_tkeep              (_connected_to_i_axi_st_rx_tkeep_),              //   input,  width = (((NO_OF_BYTES-1)-0)+1),              .tkeep
		.i_axi_st_rx_tuser_client       (_connected_to_i_axi_st_rx_tuser_client_),       //   input,                        width = 7,              .tuser
		.i_axi_st_rx_tuser_sts          (_connected_to_i_axi_st_rx_tuser_sts_),          //   input,                        width = 5, axist_rx_user.i_axi_st_rx_tuser_sts
		.i_axi_st_rx_tuser_sts_extended (_connected_to_i_axi_st_rx_tuser_sts_extended_), //   input,                       width = 32,              .i_axi_st_rx_tuser_sts_extended
		.i_axi_st_rx_ingrts0_tdata      (_connected_to_i_axi_st_rx_ingrts0_tdata_),      //   input,                       width = 96,              .i_axi_st_rx_ingrts0_tdata
		.i_axi_st_rx_ingrts0_tvalid     (_connected_to_i_axi_st_rx_ingrts0_tvalid_)      //   input,                        width = 1,              .i_axi_st_rx_ingrts0_tvalid
	);

