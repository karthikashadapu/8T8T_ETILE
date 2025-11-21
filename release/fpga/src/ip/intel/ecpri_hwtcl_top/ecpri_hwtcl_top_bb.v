module ecpri_hwtcl_top (
		input  wire        mac_clk_tx,                                     //                                     mac_clk_tx.clk
		input  wire        mac_clk_rx,                                     //                                     mac_clk_rx.clk
		input  wire        clk_tx,                                         //                                         clk_tx.clk
		input  wire        clk_rx,                                         //                                         clk_rx.clk
		input  wire        clk_csr,                                        //                                        clk_csr.clk
		input  wire        ext_sink_clk,                                   //                                   ext_sink_clk.clk
		input  wire        rst_tx_n,                                       //                                       rst_tx_n.reset_n
		input  wire        rst_rx_n,                                       //                                       rst_rx_n.reset_n
		input  wire        rst_csr_n,                                      //                                      rst_csr_n.reset_n
		input  wire [15:0] csr_address,                                    //                                            csr.address
		input  wire        csr_write,                                      //                                               .write
		input  wire [31:0] csr_writedata,                                  //                                               .writedata
		input  wire        csr_read,                                       //                                               .read
		output wire [31:0] csr_readdata,                                   //                                               .readdata
		output wire        csr_readdatavalid,                              //                                               .readdatavalid
		output wire        csr_waitrequest,                                //                                               .waitrequest
		output wire        mac_source_valid,                               //                                     mac_source.valid
		output wire [63:0] mac_source_data,                                //                                               .data
		output wire        mac_source_sop,                                 //                                               .startofpacket
		output wire        mac_source_eop,                                 //                                               .endofpacket
		output wire [2:0]  mac_source_empty,                               //                                               .empty
		output wire        mac_source_error,                               //                                               .error
		input  wire        mac_source_ready,                               //                                               .ready
		input  wire        avst_sink_valid,                                //                                      avst_sink.valid
		input  wire [63:0] avst_sink_data,                                 //                                               .data
		input  wire        avst_sink_sop,                                  //                                               .startofpacket
		input  wire        avst_sink_eop,                                  //                                               .endofpacket
		input  wire [2:0]  avst_sink_empty,                                //                                               .empty
		input  wire        avst_sink_error,                                //                                               .error
		output wire        avst_sink_ready,                                //                                               .ready
		output wire        avst_source_valid,                              //                                    avst_source.valid
		output wire [63:0] avst_source_data,                               //                                               .data
		output wire        avst_source_sop,                                //                                               .startofpacket
		output wire        avst_source_eop,                                //                                               .endofpacket
		output wire [2:0]  avst_source_empty,                              //                                               .empty
		output wire        avst_source_error,                              //                                               .error
		input  wire        mac_sink_valid,                                 //                                       mac_sink.valid
		input  wire [63:0] mac_sink_data,                                  //                                               .data
		input  wire        mac_sink_sop,                                   //                                               .startofpacket
		input  wire        mac_sink_eop,                                   //                                               .endofpacket
		input  wire [2:0]  mac_sink_empty,                                 //                                               .empty
		input  wire [5:0]  mac_sink_error,                                 //                                               .error
		output wire        mac_sink_ready,                                 //                                               .ready
		input  wire        ext_sink_0_valid,                               //                                     ext_sink_0.valid
		input  wire [63:0] ext_sink_0_data,                                //                                               .data
		input  wire        ext_sink_0_sop,                                 //                                               .startofpacket
		input  wire        ext_sink_0_eop,                                 //                                               .endofpacket
		input  wire [2:0]  ext_sink_0_empty,                               //                                               .empty
		input  wire        ext_sink_0_error,                               //                                               .error
		output wire        ext_sink_0_ready,                               //                                               .ready
		output wire        ext_source_valid,                               //                                     ext_source.valid
		output wire [63:0] ext_source_data,                                //                                               .data
		output wire        ext_source_sop,                                 //                                               .startofpacket
		output wire        ext_source_eop,                                 //                                               .endofpacket
		output wire [2:0]  ext_source_empty,                               //                                               .empty
		output wire [5:0]  ext_source_error,                               //                                               .error
		output wire [2:0]  ext_source_pkt_type,                            //                            ext_source_pkt_type.conduit
		output wire        err_interrupt,                                  //                                  err_interrupt.conduit
		output wire [31:0] source_pc_id,                                   //                                   source_pc_id.conduit
		output wire [31:0] source_seq_id,                                  //                                  source_seq_id.conduit
		output wire [15:0] source_rtc_id,                                  //                                  source_rtc_id.conduit
		output wire [7:0]  source_msg_type,                                //                                source_msg_type.conduit
		output wire [7:0]  source_mem_acc_id,                              //                              source_mem_acc_id.conduit
		output wire [7:0]  source_op_type,                                 //                                 source_op_type.conduit
		output wire [15:0] source_element_id,                              //                              source_element_id.conduit
		output wire [47:0] source_address,                                 //                                 source_address.conduit
		output wire [15:0] source_length,                                  //                                  source_length.conduit
		output wire [15:0] source_reset_id,                                //                                source_reset_id.conduit
		output wire [7:0]  source_reset_op,                                //                                source_reset_op.conduit
		output wire [7:0]  source_event_id,                                //                                source_event_id.conduit
		output wire [7:0]  source_event_type,                              //                              source_event_type.conduit
		output wire [7:0]  source_notif,                                   //                                   source_notif.conduit
		output wire        source_concatenation,                           //                           source_concatenation.conduit
		input  wire [31:0] sink_pc_id,                                     //                                     sink_pc_id.conduit
		input  wire [31:0] sink_seq_id,                                    //                                    sink_seq_id.conduit
		input  wire [15:0] sink_rtc_id,                                    //                                    sink_rtc_id.conduit
		input  wire        sink_concatenation,                             //                             sink_concatenation.conduit
		input  wire [7:0]  sink_msg_type,                                  //                                  sink_msg_type.conduit
		input  wire [7:0]  sink_mem_acc_id,                                //                                sink_mem_acc_id.conduit
		input  wire [7:0]  sink_op_type,                                   //                                   sink_op_type.conduit
		input  wire [15:0] sink_element_id,                                //                                sink_element_id.conduit
		input  wire [47:0] sink_address,                                   //                                   sink_address.conduit
		input  wire [15:0] sink_length,                                    //                                    sink_length.conduit
		input  wire [15:0] sink_reset_id,                                  //                                  sink_reset_id.conduit
		input  wire [7:0]  sink_reset_op,                                  //                                  sink_reset_op.conduit
		input  wire [7:0]  sink_event_id,                                  //                                  sink_event_id.conduit
		input  wire [7:0]  sink_event_type,                                //                                sink_event_type.conduit
		input  wire        tx_lanes_stable,                                //                                tx_lanes_stable.conduit
		input  wire        rx_pcs_ready,                                   //                                   rx_pcs_ready.conduit
		output wire [15:0] ptp_offset_timestamp,                           //                           ptp_offset_timestamp.conduit
		output wire [15:0] ptp_offset_correction_field,                    //                    ptp_offset_correction_field.conduit
		output wire        ptp_timestamp_insert,                           //                           ptp_timestamp_insert.conduit
		output wire        ptp_tx_etstamp_ins_ctrl_residence_time_update,  //  ptp_tx_etstamp_ins_ctrl_residence_time_update.conduit
		output wire [7:0]  ptp_timestamp_request_fingerprint,              //              ptp_timestamp_request_fingerprint.conduit
		output wire        ptp_timestamp_request_valid,                    //                    ptp_timestamp_request_valid.conduit
		output wire        tx_etstamp_ins_ctrl_timestamp_format,           //           tx_etstamp_ins_ctrl_timestamp_format.conduit
		output wire        tx_etstamp_ins_ctrl_residence_time_calc_format, // tx_etstamp_ins_ctrl_residence_time_calc_format.conduit
		output wire [15:0] tx_etstamp_ins_ctrl_offset_checksum_field,      //      tx_etstamp_ins_ctrl_offset_checksum_field.conduit
		output wire [15:0] tx_etstamp_ins_ctrl_offset_checksum_correction, // tx_etstamp_ins_ctrl_offset_checksum_correction.conduit
		output wire [95:0] tx_etstamp_ins_ctrl_ingress_timestamp_96b,      //      tx_etstamp_ins_ctrl_ingress_timestamp_96b.conduit
		output wire        tx_etstamp_ins_ctrl_checksum_zero,              //              tx_etstamp_ins_ctrl_checksum_zero.conduit
		output wire        tx_etstamp_ins_ctrl_checksum_correct,           //           tx_etstamp_ins_ctrl_checksum_correct.conduit
		input  wire        tx_egress_timestamp_96b_valid,                  //                  tx_egress_timestamp_96b_valid.conduit
		input  wire [95:0] tx_egress_timestamp_96b_data,                   //                   tx_egress_timestamp_96b_data.conduit
		input  wire [7:0]  tx_egress_timestamp_96b_fingerprint,            //            tx_egress_timestamp_96b_fingerprint.conduit
		input  wire        rx_ingress_timestamp_96b_valid,                 //                 rx_ingress_timestamp_96b_valid.conduit
		input  wire [95:0] rx_ingress_timestamp_96b_data,                  //                  rx_ingress_timestamp_96b_data.conduit
		output wire        ext_sink_0_tx_egress_timestamp_96b_valid,       //       ext_sink_0_tx_egress_timestamp_96b_valid.conduit
		output wire [95:0] ext_sink_0_tx_egress_timestamp_96b_data,        //        ext_sink_0_tx_egress_timestamp_96b_data.conduit
		output wire [95:0] ext_rx_ingress_timestamp_96b_data,              //              ext_rx_ingress_timestamp_96b_data.conduit
		input  wire [95:0] ext_sink_0_tx_ingress_timestamp_96b_data,       //       ext_sink_0_tx_ingress_timestamp_96b_data.conduit
		output wire [95:0] ptp_tx_ingress_timestamp_96b_data,              //              ptp_tx_ingress_timestamp_96b_data.conduit
		input  wire [95:0] rx_tod_time_of_day_96b_data,                    //                    rx_tod_time_of_day_96b_data.conduit
		input  wire [95:0] tx_tod_time_of_day_96b_data,                    //                    tx_tod_time_of_day_96b_data.conduit
		input  wire        tx_transport_c_u,                               //                               tx_transport_c_u.conduit
		output wire        rx_transport_c_u,                               //                               rx_transport_c_u.conduit
		input  wire [15:0] sink_pkt_size,                                  //                                  sink_pkt_size.conduit
		input  wire [15:0] sink_pkt_checksum,                              //                              sink_pkt_checksum.conduit
		output wire [5:0]  ext_sink_0_tx_egress_timestamp_96b_fingerprint, // ext_sink_0_tx_egress_timestamp_96b_fingerprint.conduit
		input  wire [5:0]  ext_sink_0_timestamp_request_fingerprint,       //       ext_sink_0_timestamp_request_fingerprint.conduit
		input  wire        ext_sink_0_timestamp_request_valid              //             ext_sink_0_timestamp_request_valid.conduit
	);
endmodule

