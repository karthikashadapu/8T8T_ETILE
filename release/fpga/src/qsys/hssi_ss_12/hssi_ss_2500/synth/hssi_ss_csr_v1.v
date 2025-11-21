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


//-----------------------------------------------------------------------------------------------//
//   Generated with Magillem S.A. MRV generator.                                  
//   MRV generator version : 0.2
//   Protocol :  AVALON
//   Wait State : WS1_OUTPUT                                         
//   Date : Thu Aug 03 05:17:30 PDT 2023           
//-----------------------------------------------------------------------------------------------//


//-----------------------------------------------------------------------------------------------//
//   Verilog Register Bank
//   Component Name: hssi_ss_csr
//   Magillem Version :   5.11.2.1                                                                         
//-----------------------------------------------------------------------------------------------//
// 
module hssi_ss_csr (
// register offset : 0x000, field offset : 0, access : RO, sscsrif_dfh_lo.feature_id
input  [11:0] sscsrif_dfh_lo_feature_id_i,
// register offset : 0x000, field offset : 12, access : RO, sscsrif_dfh_lo.feature_rev
input  [3:0] sscsrif_dfh_lo_feature_rev_i,
// register offset : 0x000, field offset : 16, access : RO, sscsrif_dfh_lo.dfh_byte_offset
input  [15:0] sscsrif_dfh_lo_dfh_byte_offset_i,
// register offset : 0x004, field offset : 0, access : RO, sscsrif_dfh_hi.dfh_byte_offset
input  [7:0] sscsrif_dfh_hi_dfh_byte_offset_i,
// register offset : 0x004, field offset : 8, access : RO, sscsrif_dfh_hi.end_of_list
input   sscsrif_dfh_hi_end_of_list_i,
// register offset : 0x004, field offset : 9, access : RO, sscsrif_dfh_hi.rsvd
// register offset : 0x004, field offset : 16, access : RO, sscsrif_dfh_hi.feature_minor_revision
input  [3:0] sscsrif_dfh_hi_feature_minor_revision_i,
// register offset : 0x004, field offset : 20, access : RO, sscsrif_dfh_hi.dfh_version
input  [7:0] sscsrif_dfh_hi_dfh_version_i,
// register offset : 0x004, field offset : 28, access : RO, sscsrif_dfh_hi.feature_type
input  [3:0] sscsrif_dfh_hi_feature_type_i,
// register offset : 0x008, field offset : 0, access : RO, sscsrif_feature_guid_l_low.low_guid
input  [31:0] sscsrif_feature_guid_l_low_low_guid_i,
// register offset : 0x00c, field offset : 0, access : RO, sscsrif_feature_guid_l_high.low_guid
input  [31:0] sscsrif_feature_guid_l_high_low_guid_i,
// register offset : 0x010, field offset : 0, access : RO, sscsrif_feature_guid_h_low.high_guid
input  [31:0] sscsrif_feature_guid_h_low_high_guid_i,
// register offset : 0x014, field offset : 0, access : RO, sscsrif_feature_guid_h_high.high_guid
input  [31:0] sscsrif_feature_guid_h_high_high_guid_i,
// register offset : 0x018, field offset : 0, access : RO, sscsrif_csr_addr_l.csr_rel
input   sscsrif_csr_addr_l_csr_rel_i,
// register offset : 0x018, field offset : 1, access : RO, sscsrif_csr_addr_l.feature_csr
input  [30:0] sscsrif_csr_addr_l_feature_csr_i,
// register offset : 0x01c, field offset : 0, access : RO, sscsrif_csr_addr_h.feature_csr
input  [31:0] sscsrif_csr_addr_h_feature_csr_i,
// register offset : 0x020, field offset : 0, access : RO, sscsrif_csr_size_grp_l.instance_id
input  [15:0] sscsrif_csr_size_grp_l_instance_id_i,
// register offset : 0x020, field offset : 16, access : RO, sscsrif_csr_size_grp_l.grouping_id
input  [14:0] sscsrif_csr_size_grp_l_grouping_id_i,
// register offset : 0x020, field offset : 31, access : RO, sscsrif_csr_size_grp_l.has_params
input   sscsrif_csr_size_grp_l_has_params_i,
// register offset : 0x024, field offset : 0, access : RO, sscsrif_csr_size_grp_h.csr_size
input  [31:0] sscsrif_csr_size_grp_h_csr_size_i,
// register offset : 0x060, field offset : 0, access : RO, sscsrif_version.rsvd
// register offset : 0x060, field offset : 8, access : RO, sscsrif_version.min_ver
input  [7:0] sscsrif_version_min_ver_i,
// register offset : 0x060, field offset : 16, access : RO, sscsrif_version.maj_ver
input  [15:0] sscsrif_version_maj_ver_i,
// register offset : 0x064, field offset : 0, access : RO, sscsrif_feature_list.axi4_support
input   sscsrif_feature_list_axi4_support_i,
// register offset : 0x064, field offset : 1, access : RO, sscsrif_feature_list.hssi_num_ports
input  [4:0] sscsrif_feature_list_hssi_num_ports_i,
// register offset : 0x064, field offset : 6, access : RO, sscsrif_feature_list.physical_port_enable
input  [15:0] sscsrif_feature_list_physical_port_enable_i,
// register offset : 0x064, field offset : 22, access : RO, sscsrif_feature_list.rsvd
// register offset : 0x068, field offset : 0, access : RO, sscsrif_port0_param.port_0_profile
input  [5:0] sscsrif_port0_param_port_0_profile_i,
// register offset : 0x068, field offset : 6, access : RO, sscsrif_port0_param.port_0_ready_latency
input  [3:0] sscsrif_port0_param_port_0_ready_latency_i,
// register offset : 0x068, field offset : 10, access : RO, sscsrif_port0_param.port_0_databus_width
input  [2:0] sscsrif_port0_param_port_0_databus_width_i,
// register offset : 0x068, field offset : 13, access : RO, sscsrif_port0_param.port_0_lowspeed_eth_param
input  [1:0] sscsrif_port0_param_port_0_lowspeed_eth_param_i,
// register offset : 0x068, field offset : 15, access : RO, sscsrif_port0_param.port_0_drinpr_presence
input   sscsrif_port0_param_port_0_drinpr_presence_i,
// register offset : 0x068, field offset : 16, access : RO, sscsrif_port0_param.port_0_subprofile
input  [4:0] sscsrif_port0_param_port_0_subprofile_i,
// register offset : 0x068, field offset : 21, access : RO, sscsrif_port0_param.port_0_rsfec_enable
input   sscsrif_port0_param_port_0_rsfec_enable_i,
// register offset : 0x068, field offset : 22, access : RO, sscsrif_port0_param.port_0_anlt_enable
input   sscsrif_port0_param_port_0_anlt_enable_i,
// register offset : 0x068, field offset : 23, access : RO, sscsrif_port0_param.port_0_ptp_enable
input   sscsrif_port0_param_port_0_ptp_enable_i,
// register offset : 0x068, field offset : 24, access : RO, sscsrif_port0_param.rsvd
// register offset : 0x06c, field offset : 0, access : RO, sscsrif_port1_param.port_1_profile
input  [5:0] sscsrif_port1_param_port_1_profile_i,
// register offset : 0x06c, field offset : 6, access : RO, sscsrif_port1_param.port_1_ready_latency
input  [3:0] sscsrif_port1_param_port_1_ready_latency_i,
// register offset : 0x06c, field offset : 10, access : RO, sscsrif_port1_param.port_1_databus_width
input  [2:0] sscsrif_port1_param_port_1_databus_width_i,
// register offset : 0x06c, field offset : 13, access : RO, sscsrif_port1_param.port_1_lowspeed_eth_param
input  [1:0] sscsrif_port1_param_port_1_lowspeed_eth_param_i,
// register offset : 0x06c, field offset : 15, access : RO, sscsrif_port1_param.port_1_drinpr_presence
input   sscsrif_port1_param_port_1_drinpr_presence_i,
// register offset : 0x06c, field offset : 16, access : RO, sscsrif_port1_param.port_1_subprofile
input  [4:0] sscsrif_port1_param_port_1_subprofile_i,
// register offset : 0x06c, field offset : 21, access : RO, sscsrif_port1_param.port_1_rsfec_enable
input   sscsrif_port1_param_port_1_rsfec_enable_i,
// register offset : 0x06c, field offset : 22, access : RO, sscsrif_port1_param.port_1_anlt_enable
input   sscsrif_port1_param_port_1_anlt_enable_i,
// register offset : 0x06c, field offset : 23, access : RO, sscsrif_port1_param.port_1_ptp_enable
input   sscsrif_port1_param_port_1_ptp_enable_i,
// register offset : 0x06c, field offset : 24, access : RO, sscsrif_port1_param.rsvd
// register offset : 0x070, field offset : 0, access : RO, sscsrif_port2_param.port_2_profile
input  [5:0] sscsrif_port2_param_port_2_profile_i,
// register offset : 0x070, field offset : 6, access : RO, sscsrif_port2_param.port_2_ready_latency
input  [3:0] sscsrif_port2_param_port_2_ready_latency_i,
// register offset : 0x070, field offset : 10, access : RO, sscsrif_port2_param.port_2_databus_width
input  [2:0] sscsrif_port2_param_port_2_databus_width_i,
// register offset : 0x070, field offset : 13, access : RO, sscsrif_port2_param.port_2_lowspeed_eth_param
input  [1:0] sscsrif_port2_param_port_2_lowspeed_eth_param_i,
// register offset : 0x070, field offset : 15, access : RO, sscsrif_port2_param.port_2_drinpr_presence
input   sscsrif_port2_param_port_2_drinpr_presence_i,
// register offset : 0x070, field offset : 16, access : RO, sscsrif_port2_param.port_2_subprofile
input  [4:0] sscsrif_port2_param_port_2_subprofile_i,
// register offset : 0x070, field offset : 21, access : RO, sscsrif_port2_param.port_2_rsfec_enable
input   sscsrif_port2_param_port_2_rsfec_enable_i,
// register offset : 0x070, field offset : 22, access : RO, sscsrif_port2_param.port_2_anlt_enable
input   sscsrif_port2_param_port_2_anlt_enable_i,
// register offset : 0x070, field offset : 23, access : RO, sscsrif_port2_param.port_2_ptp_enable
input   sscsrif_port2_param_port_2_ptp_enable_i,
// register offset : 0x070, field offset : 24, access : RO, sscsrif_port2_param.rsvd
// register offset : 0x074, field offset : 0, access : RO, sscsrif_port3_param.port_3_profile
input  [5:0] sscsrif_port3_param_port_3_profile_i,
// register offset : 0x074, field offset : 6, access : RO, sscsrif_port3_param.port_3_ready_latency
input  [3:0] sscsrif_port3_param_port_3_ready_latency_i,
// register offset : 0x074, field offset : 10, access : RO, sscsrif_port3_param.port_3_databus_width
input  [2:0] sscsrif_port3_param_port_3_databus_width_i,
// register offset : 0x074, field offset : 13, access : RO, sscsrif_port3_param.port_3_lowspeed_eth_param
input  [1:0] sscsrif_port3_param_port_3_lowspeed_eth_param_i,
// register offset : 0x074, field offset : 15, access : RO, sscsrif_port3_param.port_3_drinpr_presence
input   sscsrif_port3_param_port_3_drinpr_presence_i,
// register offset : 0x074, field offset : 16, access : RO, sscsrif_port3_param.port_3_subprofile
input  [4:0] sscsrif_port3_param_port_3_subprofile_i,
// register offset : 0x074, field offset : 21, access : RO, sscsrif_port3_param.port_3_rsfec_enable
input   sscsrif_port3_param_port_3_rsfec_enable_i,
// register offset : 0x074, field offset : 22, access : RO, sscsrif_port3_param.port_3_anlt_enable
input   sscsrif_port3_param_port_3_anlt_enable_i,
// register offset : 0x074, field offset : 23, access : RO, sscsrif_port3_param.port_3_ptp_enable
input   sscsrif_port3_param_port_3_ptp_enable_i,
// register offset : 0x074, field offset : 24, access : RO, sscsrif_port3_param.rsvd
// register offset : 0x078, field offset : 0, access : RO, sscsrif_port4_param.port_4_profile
input  [5:0] sscsrif_port4_param_port_4_profile_i,
// register offset : 0x078, field offset : 6, access : RO, sscsrif_port4_param.port_4_ready_latency
input  [3:0] sscsrif_port4_param_port_4_ready_latency_i,
// register offset : 0x078, field offset : 10, access : RO, sscsrif_port4_param.port_4_databus_width
input  [2:0] sscsrif_port4_param_port_4_databus_width_i,
// register offset : 0x078, field offset : 13, access : RO, sscsrif_port4_param.port_4_lowspeed_eth_param
input  [1:0] sscsrif_port4_param_port_4_lowspeed_eth_param_i,
// register offset : 0x078, field offset : 15, access : RO, sscsrif_port4_param.port_4_drinpr_presence
input   sscsrif_port4_param_port_4_drinpr_presence_i,
// register offset : 0x078, field offset : 16, access : RO, sscsrif_port4_param.port_4_subprofile
input  [4:0] sscsrif_port4_param_port_4_subprofile_i,
// register offset : 0x078, field offset : 21, access : RO, sscsrif_port4_param.port_4_rsfec_enable
input   sscsrif_port4_param_port_4_rsfec_enable_i,
// register offset : 0x078, field offset : 22, access : RO, sscsrif_port4_param.port_4_anlt_enable
input   sscsrif_port4_param_port_4_anlt_enable_i,
// register offset : 0x078, field offset : 23, access : RO, sscsrif_port4_param.port_4_ptp_enable
input   sscsrif_port4_param_port_4_ptp_enable_i,
// register offset : 0x078, field offset : 24, access : RO, sscsrif_port4_param.rsvd
// register offset : 0x07c, field offset : 0, access : RO, sscsrif_port5_param.port_5_profile
input  [5:0] sscsrif_port5_param_port_5_profile_i,
// register offset : 0x07c, field offset : 6, access : RO, sscsrif_port5_param.port_5_ready_latency
input  [3:0] sscsrif_port5_param_port_5_ready_latency_i,
// register offset : 0x07c, field offset : 10, access : RO, sscsrif_port5_param.port_5_databus_width
input  [2:0] sscsrif_port5_param_port_5_databus_width_i,
// register offset : 0x07c, field offset : 13, access : RO, sscsrif_port5_param.port_5_lowspeed_eth_param
input  [1:0] sscsrif_port5_param_port_5_lowspeed_eth_param_i,
// register offset : 0x07c, field offset : 15, access : RO, sscsrif_port5_param.port_5_drinpr_presence
input   sscsrif_port5_param_port_5_drinpr_presence_i,
// register offset : 0x07c, field offset : 16, access : RO, sscsrif_port5_param.port_5_subprofile
input  [4:0] sscsrif_port5_param_port_5_subprofile_i,
// register offset : 0x07c, field offset : 21, access : RO, sscsrif_port5_param.port_5_rsfec_enable
input   sscsrif_port5_param_port_5_rsfec_enable_i,
// register offset : 0x07c, field offset : 22, access : RO, sscsrif_port5_param.port_5_anlt_enable
input   sscsrif_port5_param_port_5_anlt_enable_i,
// register offset : 0x07c, field offset : 23, access : RO, sscsrif_port5_param.port_5_ptp_enable
input   sscsrif_port5_param_port_5_ptp_enable_i,
// register offset : 0x07c, field offset : 24, access : RO, sscsrif_port5_param.rsvd
// register offset : 0x080, field offset : 0, access : RO, sscsrif_port6_param.port_6_profile
input  [5:0] sscsrif_port6_param_port_6_profile_i,
// register offset : 0x080, field offset : 6, access : RO, sscsrif_port6_param.port_6_ready_latency
input  [3:0] sscsrif_port6_param_port_6_ready_latency_i,
// register offset : 0x080, field offset : 10, access : RO, sscsrif_port6_param.port_6_databus_width
input  [2:0] sscsrif_port6_param_port_6_databus_width_i,
// register offset : 0x080, field offset : 13, access : RO, sscsrif_port6_param.port_6_lowspeed_eth_param
input  [1:0] sscsrif_port6_param_port_6_lowspeed_eth_param_i,
// register offset : 0x080, field offset : 15, access : RO, sscsrif_port6_param.port_6_drinpr_presence
input   sscsrif_port6_param_port_6_drinpr_presence_i,
// register offset : 0x080, field offset : 16, access : RO, sscsrif_port6_param.port_6_subprofile
input  [4:0] sscsrif_port6_param_port_6_subprofile_i,
// register offset : 0x080, field offset : 21, access : RO, sscsrif_port6_param.port_6_rsfec_enable
input   sscsrif_port6_param_port_6_rsfec_enable_i,
// register offset : 0x080, field offset : 22, access : RO, sscsrif_port6_param.port_6_anlt_enable
input   sscsrif_port6_param_port_6_anlt_enable_i,
// register offset : 0x080, field offset : 23, access : RO, sscsrif_port6_param.port_6_ptp_enable
input   sscsrif_port6_param_port_6_ptp_enable_i,
// register offset : 0x080, field offset : 24, access : RO, sscsrif_port6_param.rsvd
// register offset : 0x084, field offset : 0, access : RO, sscsrif_port7_param.port_7_profile
input  [5:0] sscsrif_port7_param_port_7_profile_i,
// register offset : 0x084, field offset : 6, access : RO, sscsrif_port7_param.port_7_ready_latency
input  [3:0] sscsrif_port7_param_port_7_ready_latency_i,
// register offset : 0x084, field offset : 10, access : RO, sscsrif_port7_param.port_7_databus_width
input  [2:0] sscsrif_port7_param_port_7_databus_width_i,
// register offset : 0x084, field offset : 13, access : RO, sscsrif_port7_param.port_7_lowspeed_eth_param
input  [1:0] sscsrif_port7_param_port_7_lowspeed_eth_param_i,
// register offset : 0x084, field offset : 15, access : RO, sscsrif_port7_param.port_7_drinpr_presence
input   sscsrif_port7_param_port_7_drinpr_presence_i,
// register offset : 0x084, field offset : 16, access : RO, sscsrif_port7_param.port_7_subprofile
input  [4:0] sscsrif_port7_param_port_7_subprofile_i,
// register offset : 0x084, field offset : 21, access : RO, sscsrif_port7_param.port_7_rsfec_enable
input   sscsrif_port7_param_port_7_rsfec_enable_i,
// register offset : 0x084, field offset : 22, access : RO, sscsrif_port7_param.port_7_anlt_enable
input   sscsrif_port7_param_port_7_anlt_enable_i,
// register offset : 0x084, field offset : 23, access : RO, sscsrif_port7_param.port_7_ptp_enable
input   sscsrif_port7_param_port_7_ptp_enable_i,
// register offset : 0x084, field offset : 24, access : RO, sscsrif_port7_param.rsvd
// register offset : 0x088, field offset : 0, access : RO, sscsrif_port8_param.port_8_profile
input  [5:0] sscsrif_port8_param_port_8_profile_i,
// register offset : 0x088, field offset : 6, access : RO, sscsrif_port8_param.port_8_ready_latency
input  [3:0] sscsrif_port8_param_port_8_ready_latency_i,
// register offset : 0x088, field offset : 10, access : RO, sscsrif_port8_param.port_8_databus_width
input  [2:0] sscsrif_port8_param_port_8_databus_width_i,
// register offset : 0x088, field offset : 13, access : RO, sscsrif_port8_param.port_8_lowspeed_eth_param
input  [1:0] sscsrif_port8_param_port_8_lowspeed_eth_param_i,
// register offset : 0x088, field offset : 15, access : RO, sscsrif_port8_param.port_8_drinpr_presence
input   sscsrif_port8_param_port_8_drinpr_presence_i,
// register offset : 0x088, field offset : 16, access : RO, sscsrif_port8_param.port_8_subprofile
input  [4:0] sscsrif_port8_param_port_8_subprofile_i,
// register offset : 0x088, field offset : 21, access : RO, sscsrif_port8_param.port_8_rsfec_enable
input   sscsrif_port8_param_port_8_rsfec_enable_i,
// register offset : 0x088, field offset : 22, access : RO, sscsrif_port8_param.port_8_anlt_enable
input   sscsrif_port8_param_port_8_anlt_enable_i,
// register offset : 0x088, field offset : 23, access : RO, sscsrif_port8_param.port_8_ptp_enable
input   sscsrif_port8_param_port_8_ptp_enable_i,
// register offset : 0x088, field offset : 24, access : RO, sscsrif_port8_param.rsvd
// register offset : 0x08c, field offset : 0, access : RO, sscsrif_port9_param.port_9_profile
input  [5:0] sscsrif_port9_param_port_9_profile_i,
// register offset : 0x08c, field offset : 6, access : RO, sscsrif_port9_param.port_9_ready_latency
input  [3:0] sscsrif_port9_param_port_9_ready_latency_i,
// register offset : 0x08c, field offset : 10, access : RO, sscsrif_port9_param.port_9_databus_width
input  [2:0] sscsrif_port9_param_port_9_databus_width_i,
// register offset : 0x08c, field offset : 13, access : RO, sscsrif_port9_param.port_9_lowspeed_eth_param
input  [1:0] sscsrif_port9_param_port_9_lowspeed_eth_param_i,
// register offset : 0x08c, field offset : 15, access : RO, sscsrif_port9_param.port_9_drinpr_presence
input   sscsrif_port9_param_port_9_drinpr_presence_i,
// register offset : 0x08c, field offset : 16, access : RO, sscsrif_port9_param.port_9_subprofile
input  [4:0] sscsrif_port9_param_port_9_subprofile_i,
// register offset : 0x08c, field offset : 21, access : RO, sscsrif_port9_param.port_9_rsfec_enable
input   sscsrif_port9_param_port_9_rsfec_enable_i,
// register offset : 0x08c, field offset : 22, access : RO, sscsrif_port9_param.port_9_anlt_enable
input   sscsrif_port9_param_port_9_anlt_enable_i,
// register offset : 0x08c, field offset : 23, access : RO, sscsrif_port9_param.port_9_ptp_enable
input   sscsrif_port9_param_port_9_ptp_enable_i,
// register offset : 0x08c, field offset : 24, access : RO, sscsrif_port9_param.rsvd
// register offset : 0x090, field offset : 0, access : RO, sscsrif_port10_param.port_10_profile
input  [5:0] sscsrif_port10_param_port_10_profile_i,
// register offset : 0x090, field offset : 6, access : RO, sscsrif_port10_param.port_10_ready_latency
input  [3:0] sscsrif_port10_param_port_10_ready_latency_i,
// register offset : 0x090, field offset : 10, access : RO, sscsrif_port10_param.port_10_databus_width
input  [2:0] sscsrif_port10_param_port_10_databus_width_i,
// register offset : 0x090, field offset : 13, access : RO, sscsrif_port10_param.port_10_lowspeed_eth_param
input  [1:0] sscsrif_port10_param_port_10_lowspeed_eth_param_i,
// register offset : 0x090, field offset : 15, access : RO, sscsrif_port10_param.port_10_drinpr_presence
input   sscsrif_port10_param_port_10_drinpr_presence_i,
// register offset : 0x090, field offset : 16, access : RO, sscsrif_port10_param.port_10_subprofile
input  [4:0] sscsrif_port10_param_port_10_subprofile_i,
// register offset : 0x090, field offset : 21, access : RO, sscsrif_port10_param.port_10_rsfec_enable
input   sscsrif_port10_param_port_10_rsfec_enable_i,
// register offset : 0x090, field offset : 22, access : RO, sscsrif_port10_param.port_10_anlt_enable
input   sscsrif_port10_param_port_10_anlt_enable_i,
// register offset : 0x090, field offset : 23, access : RO, sscsrif_port10_param.port_10_ptp_enable
input   sscsrif_port10_param_port_10_ptp_enable_i,
// register offset : 0x090, field offset : 24, access : RO, sscsrif_port10_param.rsvd
// register offset : 0x094, field offset : 0, access : RO, sscsrif_port11_param.port_11_profile
input  [5:0] sscsrif_port11_param_port_11_profile_i,
// register offset : 0x094, field offset : 6, access : RO, sscsrif_port11_param.port_11_ready_latency
input  [3:0] sscsrif_port11_param_port_11_ready_latency_i,
// register offset : 0x094, field offset : 10, access : RO, sscsrif_port11_param.port_11_databus_width
input  [2:0] sscsrif_port11_param_port_11_databus_width_i,
// register offset : 0x094, field offset : 13, access : RO, sscsrif_port11_param.port_11_lowspeed_eth_param
input  [1:0] sscsrif_port11_param_port_11_lowspeed_eth_param_i,
// register offset : 0x094, field offset : 15, access : RO, sscsrif_port11_param.port_11_drinpr_presence
input   sscsrif_port11_param_port_11_drinpr_presence_i,
// register offset : 0x094, field offset : 16, access : RO, sscsrif_port11_param.port_11_subprofile
input  [4:0] sscsrif_port11_param_port_11_subprofile_i,
// register offset : 0x094, field offset : 21, access : RO, sscsrif_port11_param.port_11_rsfec_enable
input   sscsrif_port11_param_port_11_rsfec_enable_i,
// register offset : 0x094, field offset : 22, access : RO, sscsrif_port11_param.port_11_anlt_enable
input   sscsrif_port11_param_port_11_anlt_enable_i,
// register offset : 0x094, field offset : 23, access : RO, sscsrif_port11_param.port_11_ptp_enable
input   sscsrif_port11_param_port_11_ptp_enable_i,
// register offset : 0x094, field offset : 24, access : RO, sscsrif_port11_param.rsvd
// register offset : 0x098, field offset : 0, access : RO, sscsrif_port12_param.port_12_profile
input  [5:0] sscsrif_port12_param_port_12_profile_i,
// register offset : 0x098, field offset : 6, access : RO, sscsrif_port12_param.port_12_ready_latency
input  [3:0] sscsrif_port12_param_port_12_ready_latency_i,
// register offset : 0x098, field offset : 10, access : RO, sscsrif_port12_param.port_12_databus_width
input  [2:0] sscsrif_port12_param_port_12_databus_width_i,
// register offset : 0x098, field offset : 13, access : RO, sscsrif_port12_param.port_12_lowspeed_eth_param
input  [1:0] sscsrif_port12_param_port_12_lowspeed_eth_param_i,
// register offset : 0x098, field offset : 15, access : RO, sscsrif_port12_param.port_12_drinpr_presence
input   sscsrif_port12_param_port_12_drinpr_presence_i,
// register offset : 0x098, field offset : 16, access : RO, sscsrif_port12_param.port_12_subprofile
input  [4:0] sscsrif_port12_param_port_12_subprofile_i,
// register offset : 0x098, field offset : 21, access : RO, sscsrif_port12_param.port_12_rsfec_enable
input   sscsrif_port12_param_port_12_rsfec_enable_i,
// register offset : 0x098, field offset : 22, access : RO, sscsrif_port12_param.port_12_anlt_enable
input   sscsrif_port12_param_port_12_anlt_enable_i,
// register offset : 0x098, field offset : 23, access : RO, sscsrif_port12_param.port_12_ptp_enable
input   sscsrif_port12_param_port_12_ptp_enable_i,
// register offset : 0x098, field offset : 24, access : RO, sscsrif_port12_param.rsvd
// register offset : 0x09c, field offset : 0, access : RO, sscsrif_port13_param.port_13_profile
input  [5:0] sscsrif_port13_param_port_13_profile_i,
// register offset : 0x09c, field offset : 6, access : RO, sscsrif_port13_param.port_13_ready_latency
input  [3:0] sscsrif_port13_param_port_13_ready_latency_i,
// register offset : 0x09c, field offset : 10, access : RO, sscsrif_port13_param.port_13_databus_width
input  [2:0] sscsrif_port13_param_port_13_databus_width_i,
// register offset : 0x09c, field offset : 13, access : RO, sscsrif_port13_param.port_13_lowspeed_eth_param
input  [1:0] sscsrif_port13_param_port_13_lowspeed_eth_param_i,
// register offset : 0x09c, field offset : 15, access : RO, sscsrif_port13_param.port_13_drinpr_presence
input   sscsrif_port13_param_port_13_drinpr_presence_i,
// register offset : 0x09c, field offset : 16, access : RO, sscsrif_port13_param.port_13_subprofile
input  [4:0] sscsrif_port13_param_port_13_subprofile_i,
// register offset : 0x09c, field offset : 21, access : RO, sscsrif_port13_param.port_13_rsfec_enable
input   sscsrif_port13_param_port_13_rsfec_enable_i,
// register offset : 0x09c, field offset : 22, access : RO, sscsrif_port13_param.port_13_anlt_enable
input   sscsrif_port13_param_port_13_anlt_enable_i,
// register offset : 0x09c, field offset : 23, access : RO, sscsrif_port13_param.port_13_ptp_enable
input   sscsrif_port13_param_port_13_ptp_enable_i,
// register offset : 0x09c, field offset : 24, access : RO, sscsrif_port13_param.rsvd
// register offset : 0x0a0, field offset : 0, access : RO, sscsrif_port14_param.port_14_profile
input  [5:0] sscsrif_port14_param_port_14_profile_i,
// register offset : 0x0a0, field offset : 6, access : RO, sscsrif_port14_param.port_14_ready_latency
input  [3:0] sscsrif_port14_param_port_14_ready_latency_i,
// register offset : 0x0a0, field offset : 10, access : RO, sscsrif_port14_param.port_14_databus_width
input  [2:0] sscsrif_port14_param_port_14_databus_width_i,
// register offset : 0x0a0, field offset : 13, access : RO, sscsrif_port14_param.port_14_lowspeed_eth_param
input  [1:0] sscsrif_port14_param_port_14_lowspeed_eth_param_i,
// register offset : 0x0a0, field offset : 15, access : RO, sscsrif_port14_param.port_14_drinpr_presence
input   sscsrif_port14_param_port_14_drinpr_presence_i,
// register offset : 0x0a0, field offset : 16, access : RO, sscsrif_port14_param.port_14_subprofile
input  [4:0] sscsrif_port14_param_port_14_subprofile_i,
// register offset : 0x0a0, field offset : 21, access : RO, sscsrif_port14_param.port_14_rsfec_enable
input   sscsrif_port14_param_port_14_rsfec_enable_i,
// register offset : 0x0a0, field offset : 22, access : RO, sscsrif_port14_param.port_14_anlt_enable
input   sscsrif_port14_param_port_14_anlt_enable_i,
// register offset : 0x0a0, field offset : 23, access : RO, sscsrif_port14_param.port_14_ptp_enable
input   sscsrif_port14_param_port_14_ptp_enable_i,
// register offset : 0x0a0, field offset : 24, access : RO, sscsrif_port14_param.rsvd
// register offset : 0x0a4, field offset : 0, access : RO, sscsrif_port15_param.port_15_profile
input  [5:0] sscsrif_port15_param_port_15_profile_i,
// register offset : 0x0a4, field offset : 6, access : RO, sscsrif_port15_param.port_15_ready_latency
input  [3:0] sscsrif_port15_param_port_15_ready_latency_i,
// register offset : 0x0a4, field offset : 10, access : RO, sscsrif_port15_param.port_15_databus_width
input  [2:0] sscsrif_port15_param_port_15_databus_width_i,
// register offset : 0x0a4, field offset : 13, access : RO, sscsrif_port15_param.port_15_lowspeed_eth_param
input  [1:0] sscsrif_port15_param_port_15_lowspeed_eth_param_i,
// register offset : 0x0a4, field offset : 15, access : RO, sscsrif_port15_param.port_15_drinpr_presence
input   sscsrif_port15_param_port_15_drinpr_presence_i,
// register offset : 0x0a4, field offset : 16, access : RO, sscsrif_port15_param.port_15_subprofile
input  [4:0] sscsrif_port15_param_port_15_subprofile_i,
// register offset : 0x0a4, field offset : 21, access : RO, sscsrif_port15_param.port_15_rsfec_enable
input   sscsrif_port15_param_port_15_rsfec_enable_i,
// register offset : 0x0a4, field offset : 22, access : RO, sscsrif_port15_param.port_15_anlt_enable
input   sscsrif_port15_param_port_15_anlt_enable_i,
// register offset : 0x0a4, field offset : 23, access : RO, sscsrif_port15_param.port_15_ptp_enable
input   sscsrif_port15_param_port_15_ptp_enable_i,
// register offset : 0x0a4, field offset : 24, access : RO, sscsrif_port15_param.rsvd
// register offset : 0x0a8, field offset : 0, access : RW, sscsrif_hssi_cmd_sts.read_command
output  reg sscsrif_hssi_cmd_sts_read_command,
// register offset : 0x0a8, field offset : 1, access : RW, sscsrif_hssi_cmd_sts.write_command
output  reg sscsrif_hssi_cmd_sts_write_command,
// register offset : 0x0a8, field offset : 2, access : RW, sscsrif_hssi_cmd_sts.ack_trans
input   sscsrif_hssi_cmd_sts_ack_trans_hwset,
output  reg sscsrif_hssi_cmd_sts_ack_trans,
// register offset : 0x0a8, field offset : 3, access : RO, sscsrif_hssi_cmd_sts.busy
input   sscsrif_hssi_cmd_sts_busy_i,
// register offset : 0x0a8, field offset : 4, access : RO, sscsrif_hssi_cmd_sts.error
input   sscsrif_hssi_cmd_sts_error_i,
// register offset : 0x0a8, field offset : 5, access : RW, sscsrif_hssi_cmd_sts.xcvr_reg_byte_no
output  reg[1:0] sscsrif_hssi_cmd_sts_xcvr_reg_byte_no,
// register offset : 0x0a8, field offset : 7, access : RO, sscsrif_hssi_cmd_sts.rsvd
// register offset : 0x0ac, field offset : 0, access : RW, sscsrif_hssi_ctrl_addr.sal_command
output  reg[7:0] sscsrif_hssi_ctrl_addr_sal_command,
// register offset : 0x0ac, field offset : 8, access : RW, sscsrif_hssi_ctrl_addr.port_addr
output  reg[3:0] sscsrif_hssi_ctrl_addr_port_addr,
// register offset : 0x0ac, field offset : 12, access : RW, sscsrif_hssi_ctrl_addr.channel_addr
output  reg[3:0] sscsrif_hssi_ctrl_addr_channel_addr,
// register offset : 0x0ac, field offset : 16, access : RW, sscsrif_hssi_ctrl_addr.addr_msb
output  reg[15:0] sscsrif_hssi_ctrl_addr_addr_msb,
// register offset : 0x0b0, field offset : 0, access : RO, sscsrif_hssi_rd_data.write_data
input  [31:0] sscsrif_hssi_rd_data_write_data_i,
// register offset : 0x0b4, field offset : 0, access : RW, sscsrif_hssi_wr_data.write_data
output  reg[31:0] sscsrif_hssi_wr_data_write_data,
// register offset : 0x0b8, field offset : 0, access : RO, sscsrif_gmii_xgmii_tx_latency.tx_latency
input  [23:0] sscsrif_gmii_xgmii_tx_latency_tx_latency_i,
// register offset : 0x0b8, field offset : 24, access : RO, sscsrif_gmii_xgmii_tx_latency.rsvd
// register offset : 0x0bc, field offset : 0, access : RO, sscsrif_gmii_xgmii_rx_latency.rx_latency
input  [23:0] sscsrif_gmii_xgmii_rx_latency_rx_latency_i,
// register offset : 0x0bc, field offset : 24, access : RO, sscsrif_gmii_xgmii_rx_latency.rsvd
// register offset : 0x0c0, field offset : 0, access : RO, sscsrif_hssi_eth_port0_status.o_ehip_ready
input   sscsrif_hssi_eth_port0_status_o_ehip_ready_i,
// register offset : 0x0c0, field offset : 1, access : RO, sscsrif_hssi_eth_port0_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port0_status_o_rx_hi_ber_i,
// register offset : 0x0c0, field offset : 2, access : RO, sscsrif_hssi_eth_port0_status.o_cdr_lock
input   sscsrif_hssi_eth_port0_status_o_cdr_lock_i,
// register offset : 0x0c0, field offset : 3, access : RO, sscsrif_hssi_eth_port0_status.rx_am_lock
input   sscsrif_hssi_eth_port0_status_rx_am_lock_i,
// register offset : 0x0c0, field offset : 4, access : RO, sscsrif_hssi_eth_port0_status.rx_block_lock
input   sscsrif_hssi_eth_port0_status_rx_block_lock_i,
// register offset : 0x0c0, field offset : 5, access : RO, sscsrif_hssi_eth_port0_status.link_fault_gen_en
input   sscsrif_hssi_eth_port0_status_link_fault_gen_en_i,
// register offset : 0x0c0, field offset : 6, access : RO, sscsrif_hssi_eth_port0_status.unidirectional_en
input   sscsrif_hssi_eth_port0_status_unidirectional_en_i,
// register offset : 0x0c0, field offset : 7, access : W1C, sscsrif_hssi_eth_port0_status.local_fault_status
input   sscsrif_hssi_eth_port0_status_local_fault_status_hwset,
// register offset : 0x0c0, field offset : 8, access : W1C, sscsrif_hssi_eth_port0_status.remote_fault_status
input   sscsrif_hssi_eth_port0_status_remote_fault_status_hwset,
// register offset : 0x0c0, field offset : 9, access : RO, sscsrif_hssi_eth_port0_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port0_status_unidirectional_force_remote_fault_i,
// register offset : 0x0c0, field offset : 10, access : RO, sscsrif_hssi_eth_port0_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port0_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0c0, field offset : 11, access : RO, sscsrif_hssi_eth_port0_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port0_status_pcs_eccstatus_i,
// register offset : 0x0c0, field offset : 13, access : RO, sscsrif_hssi_eth_port0_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port0_status_mac_eccstatus_i,
// register offset : 0x0c0, field offset : 15, access : RO, sscsrif_hssi_eth_port0_status.set_10
input   sscsrif_hssi_eth_port0_status_set_10_i,
// register offset : 0x0c0, field offset : 16, access : RO, sscsrif_hssi_eth_port0_status.set_1000
input   sscsrif_hssi_eth_port0_status_set_1000_i,
// register offset : 0x0c0, field offset : 17, access : RO, sscsrif_hssi_eth_port0_status.ena_10
input   sscsrif_hssi_eth_port0_status_ena_10_i,
// register offset : 0x0c0, field offset : 18, access : RO, sscsrif_hssi_eth_port0_status.eth_mode
input   sscsrif_hssi_eth_port0_status_eth_mode_i,
// register offset : 0x0c0, field offset : 19, access : RO, sscsrif_hssi_eth_port0_status.load_recipe_err
input   sscsrif_hssi_eth_port0_status_load_recipe_err_i,
// register offset : 0x0c0, field offset : 20, access : RO, sscsrif_hssi_eth_port0_status.cal_err
input   sscsrif_hssi_eth_port0_status_cal_err_i,
// register offset : 0x0c0, field offset : 21, access : RO, sscsrif_hssi_eth_port0_status.tx_lanes_stable
input   sscsrif_hssi_eth_port0_status_tx_lanes_stable_i,
// register offset : 0x0c0, field offset : 22, access : RO, sscsrif_hssi_eth_port0_status.rx_pcs_ready
input   sscsrif_hssi_eth_port0_status_rx_pcs_ready_i,
// register offset : 0x0c0, field offset : 23, access : RO, sscsrif_hssi_eth_port0_status.tx_pll_locked
input   sscsrif_hssi_eth_port0_status_tx_pll_locked_i,
// register offset : 0x0c0, field offset : 24, access : RO, sscsrif_hssi_eth_port0_status.o_ehip0_tx_pll_locked
input   sscsrif_hssi_eth_port0_status_o_ehip0_tx_pll_locked_i,
// register offset : 0x0c0, field offset : 25, access : RO, sscsrif_hssi_eth_port0_status.o_ehip1_tx_pll_locked
input   sscsrif_hssi_eth_port0_status_o_ehip1_tx_pll_locked_i,
// register offset : 0x0c0, field offset : 26, access : W1C, sscsrif_hssi_eth_port0_status.parity_error
input   sscsrif_hssi_eth_port0_status_parity_error_hwset,
// register offset : 0x0c0, field offset : 27, access : RO, sscsrif_hssi_eth_port0_status.local_fault_status_direct
input   sscsrif_hssi_eth_port0_status_local_fault_status_direct_i,
// register offset : 0x0c0, field offset : 28, access : RO, sscsrif_hssi_eth_port0_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port0_status_remote_fault_status_direct_i,
// register offset : 0x0c0, field offset : 29, access : RO, sscsrif_hssi_eth_port0_status.rsvd
// register offset : 0x0c4, field offset : 0, access : RO, sscsrif_hssi_eth_port1_status.o_ehip_ready
input   sscsrif_hssi_eth_port1_status_o_ehip_ready_i,
// register offset : 0x0c4, field offset : 1, access : RO, sscsrif_hssi_eth_port1_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port1_status_o_rx_hi_ber_i,
// register offset : 0x0c4, field offset : 2, access : RO, sscsrif_hssi_eth_port1_status.o_cdr_lock
input   sscsrif_hssi_eth_port1_status_o_cdr_lock_i,
// register offset : 0x0c4, field offset : 3, access : RO, sscsrif_hssi_eth_port1_status.rx_am_lock
input   sscsrif_hssi_eth_port1_status_rx_am_lock_i,
// register offset : 0x0c4, field offset : 4, access : RO, sscsrif_hssi_eth_port1_status.rx_block_lock
input   sscsrif_hssi_eth_port1_status_rx_block_lock_i,
// register offset : 0x0c4, field offset : 5, access : RO, sscsrif_hssi_eth_port1_status.link_fault_gen_en
input   sscsrif_hssi_eth_port1_status_link_fault_gen_en_i,
// register offset : 0x0c4, field offset : 6, access : RO, sscsrif_hssi_eth_port1_status.unidirectional_en
input   sscsrif_hssi_eth_port1_status_unidirectional_en_i,
// register offset : 0x0c4, field offset : 7, access : W1C, sscsrif_hssi_eth_port1_status.local_fault_status
input   sscsrif_hssi_eth_port1_status_local_fault_status_hwset,
// register offset : 0x0c4, field offset : 8, access : W1C, sscsrif_hssi_eth_port1_status.remote_fault_status
input   sscsrif_hssi_eth_port1_status_remote_fault_status_hwset,
// register offset : 0x0c4, field offset : 9, access : RO, sscsrif_hssi_eth_port1_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port1_status_unidirectional_force_remote_fault_i,
// register offset : 0x0c4, field offset : 10, access : RO, sscsrif_hssi_eth_port1_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port1_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0c4, field offset : 11, access : RO, sscsrif_hssi_eth_port1_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port1_status_pcs_eccstatus_i,
// register offset : 0x0c4, field offset : 13, access : RO, sscsrif_hssi_eth_port1_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port1_status_mac_eccstatus_i,
// register offset : 0x0c4, field offset : 15, access : RO, sscsrif_hssi_eth_port1_status.set_10
input   sscsrif_hssi_eth_port1_status_set_10_i,
// register offset : 0x0c4, field offset : 16, access : RO, sscsrif_hssi_eth_port1_status.set_1000
input   sscsrif_hssi_eth_port1_status_set_1000_i,
// register offset : 0x0c4, field offset : 17, access : RO, sscsrif_hssi_eth_port1_status.ena_10
input   sscsrif_hssi_eth_port1_status_ena_10_i,
// register offset : 0x0c4, field offset : 18, access : RO, sscsrif_hssi_eth_port1_status.eth_mode
input   sscsrif_hssi_eth_port1_status_eth_mode_i,
// register offset : 0x0c4, field offset : 19, access : RO, sscsrif_hssi_eth_port1_status.load_recipe_err
input   sscsrif_hssi_eth_port1_status_load_recipe_err_i,
// register offset : 0x0c4, field offset : 20, access : RO, sscsrif_hssi_eth_port1_status.cal_err
input   sscsrif_hssi_eth_port1_status_cal_err_i,
// register offset : 0x0c4, field offset : 21, access : RO, sscsrif_hssi_eth_port1_status.tx_lanes_stable
input   sscsrif_hssi_eth_port1_status_tx_lanes_stable_i,
// register offset : 0x0c4, field offset : 22, access : RO, sscsrif_hssi_eth_port1_status.rx_pcs_ready
input   sscsrif_hssi_eth_port1_status_rx_pcs_ready_i,
// register offset : 0x0c4, field offset : 23, access : RO, sscsrif_hssi_eth_port1_status.tx_pll_locked
input   sscsrif_hssi_eth_port1_status_tx_pll_locked_i,
// register offset : 0x0c4, field offset : 24, access : RO, sscsrif_hssi_eth_port1_status.o_ehip0_tx_pll_locked
input   sscsrif_hssi_eth_port1_status_o_ehip0_tx_pll_locked_i,
// register offset : 0x0c4, field offset : 25, access : RO, sscsrif_hssi_eth_port1_status.o_ehip1_tx_pll_locked
input   sscsrif_hssi_eth_port1_status_o_ehip1_tx_pll_locked_i,
// register offset : 0x0c4, field offset : 26, access : W1C, sscsrif_hssi_eth_port1_status.parity_error
input   sscsrif_hssi_eth_port1_status_parity_error_hwset,
// register offset : 0x0c4, field offset : 27, access : RO, sscsrif_hssi_eth_port1_status.local_fault_status_direct
input   sscsrif_hssi_eth_port1_status_local_fault_status_direct_i,
// register offset : 0x0c4, field offset : 28, access : RO, sscsrif_hssi_eth_port1_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port1_status_remote_fault_status_direct_i,
// register offset : 0x0c4, field offset : 29, access : RO, sscsrif_hssi_eth_port1_status.rsvd
// register offset : 0x0c8, field offset : 0, access : RO, sscsrif_hssi_eth_port2_status.o_ehip_ready
input   sscsrif_hssi_eth_port2_status_o_ehip_ready_i,
// register offset : 0x0c8, field offset : 1, access : RO, sscsrif_hssi_eth_port2_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port2_status_o_rx_hi_ber_i,
// register offset : 0x0c8, field offset : 2, access : RO, sscsrif_hssi_eth_port2_status.o_cdr_lock
input   sscsrif_hssi_eth_port2_status_o_cdr_lock_i,
// register offset : 0x0c8, field offset : 3, access : RO, sscsrif_hssi_eth_port2_status.rx_am_lock
input   sscsrif_hssi_eth_port2_status_rx_am_lock_i,
// register offset : 0x0c8, field offset : 4, access : RO, sscsrif_hssi_eth_port2_status.rx_block_lock
input   sscsrif_hssi_eth_port2_status_rx_block_lock_i,
// register offset : 0x0c8, field offset : 5, access : RO, sscsrif_hssi_eth_port2_status.link_fault_gen_en
input   sscsrif_hssi_eth_port2_status_link_fault_gen_en_i,
// register offset : 0x0c8, field offset : 6, access : RO, sscsrif_hssi_eth_port2_status.unidirectional_en
input   sscsrif_hssi_eth_port2_status_unidirectional_en_i,
// register offset : 0x0c8, field offset : 7, access : W1C, sscsrif_hssi_eth_port2_status.local_fault_status
input   sscsrif_hssi_eth_port2_status_local_fault_status_hwset,
// register offset : 0x0c8, field offset : 8, access : W1C, sscsrif_hssi_eth_port2_status.remote_fault_status
input   sscsrif_hssi_eth_port2_status_remote_fault_status_hwset,
// register offset : 0x0c8, field offset : 9, access : RO, sscsrif_hssi_eth_port2_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port2_status_unidirectional_force_remote_fault_i,
// register offset : 0x0c8, field offset : 10, access : RO, sscsrif_hssi_eth_port2_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port2_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0c8, field offset : 11, access : RO, sscsrif_hssi_eth_port2_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port2_status_pcs_eccstatus_i,
// register offset : 0x0c8, field offset : 13, access : RO, sscsrif_hssi_eth_port2_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port2_status_mac_eccstatus_i,
// register offset : 0x0c8, field offset : 15, access : RO, sscsrif_hssi_eth_port2_status.set_10
input   sscsrif_hssi_eth_port2_status_set_10_i,
// register offset : 0x0c8, field offset : 16, access : RO, sscsrif_hssi_eth_port2_status.set_1000
input   sscsrif_hssi_eth_port2_status_set_1000_i,
// register offset : 0x0c8, field offset : 17, access : RO, sscsrif_hssi_eth_port2_status.ena_10
input   sscsrif_hssi_eth_port2_status_ena_10_i,
// register offset : 0x0c8, field offset : 18, access : RO, sscsrif_hssi_eth_port2_status.eth_mode
input   sscsrif_hssi_eth_port2_status_eth_mode_i,
// register offset : 0x0c8, field offset : 19, access : RO, sscsrif_hssi_eth_port2_status.load_recipe_err
input   sscsrif_hssi_eth_port2_status_load_recipe_err_i,
// register offset : 0x0c8, field offset : 20, access : RO, sscsrif_hssi_eth_port2_status.cal_err
input   sscsrif_hssi_eth_port2_status_cal_err_i,
// register offset : 0x0c8, field offset : 21, access : RO, sscsrif_hssi_eth_port2_status.tx_lanes_stable
input   sscsrif_hssi_eth_port2_status_tx_lanes_stable_i,
// register offset : 0x0c8, field offset : 22, access : RO, sscsrif_hssi_eth_port2_status.rx_pcs_ready
input   sscsrif_hssi_eth_port2_status_rx_pcs_ready_i,
// register offset : 0x0c8, field offset : 23, access : RO, sscsrif_hssi_eth_port2_status.tx_pll_locked
input   sscsrif_hssi_eth_port2_status_tx_pll_locked_i,
// register offset : 0x0c8, field offset : 24, access : RO, sscsrif_hssi_eth_port2_status.o_ehip0_tx_pll_locked
input   sscsrif_hssi_eth_port2_status_o_ehip0_tx_pll_locked_i,
// register offset : 0x0c8, field offset : 25, access : RO, sscsrif_hssi_eth_port2_status.o_ehip1_tx_pll_locked
input   sscsrif_hssi_eth_port2_status_o_ehip1_tx_pll_locked_i,
// register offset : 0x0c8, field offset : 26, access : W1C, sscsrif_hssi_eth_port2_status.parity_error
input   sscsrif_hssi_eth_port2_status_parity_error_hwset,
// register offset : 0x0c8, field offset : 27, access : RO, sscsrif_hssi_eth_port2_status.local_fault_status_direct
input   sscsrif_hssi_eth_port2_status_local_fault_status_direct_i,
// register offset : 0x0c8, field offset : 28, access : RO, sscsrif_hssi_eth_port2_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port2_status_remote_fault_status_direct_i,
// register offset : 0x0c8, field offset : 29, access : RO, sscsrif_hssi_eth_port2_status.rsvd
// register offset : 0x0cc, field offset : 0, access : RO, sscsrif_hssi_eth_port3_status.o_ehip_ready
input   sscsrif_hssi_eth_port3_status_o_ehip_ready_i,
// register offset : 0x0cc, field offset : 1, access : RO, sscsrif_hssi_eth_port3_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port3_status_o_rx_hi_ber_i,
// register offset : 0x0cc, field offset : 2, access : RO, sscsrif_hssi_eth_port3_status.o_cdr_lock
input   sscsrif_hssi_eth_port3_status_o_cdr_lock_i,
// register offset : 0x0cc, field offset : 3, access : RO, sscsrif_hssi_eth_port3_status.rx_am_lock
input   sscsrif_hssi_eth_port3_status_rx_am_lock_i,
// register offset : 0x0cc, field offset : 4, access : RO, sscsrif_hssi_eth_port3_status.rx_block_lock
input   sscsrif_hssi_eth_port3_status_rx_block_lock_i,
// register offset : 0x0cc, field offset : 5, access : RO, sscsrif_hssi_eth_port3_status.link_fault_gen_en
input   sscsrif_hssi_eth_port3_status_link_fault_gen_en_i,
// register offset : 0x0cc, field offset : 6, access : RO, sscsrif_hssi_eth_port3_status.unidirectional_en
input   sscsrif_hssi_eth_port3_status_unidirectional_en_i,
// register offset : 0x0cc, field offset : 7, access : W1C, sscsrif_hssi_eth_port3_status.local_fault_status
input   sscsrif_hssi_eth_port3_status_local_fault_status_hwset,
// register offset : 0x0cc, field offset : 8, access : W1C, sscsrif_hssi_eth_port3_status.remote_fault_status
input   sscsrif_hssi_eth_port3_status_remote_fault_status_hwset,
// register offset : 0x0cc, field offset : 9, access : RO, sscsrif_hssi_eth_port3_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port3_status_unidirectional_force_remote_fault_i,
// register offset : 0x0cc, field offset : 10, access : RO, sscsrif_hssi_eth_port3_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port3_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0cc, field offset : 11, access : RO, sscsrif_hssi_eth_port3_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port3_status_pcs_eccstatus_i,
// register offset : 0x0cc, field offset : 13, access : RO, sscsrif_hssi_eth_port3_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port3_status_mac_eccstatus_i,
// register offset : 0x0cc, field offset : 15, access : RO, sscsrif_hssi_eth_port3_status.set_10
input   sscsrif_hssi_eth_port3_status_set_10_i,
// register offset : 0x0cc, field offset : 16, access : RO, sscsrif_hssi_eth_port3_status.set_1000
input   sscsrif_hssi_eth_port3_status_set_1000_i,
// register offset : 0x0cc, field offset : 17, access : RO, sscsrif_hssi_eth_port3_status.ena_10
input   sscsrif_hssi_eth_port3_status_ena_10_i,
// register offset : 0x0cc, field offset : 18, access : RO, sscsrif_hssi_eth_port3_status.eth_mode
input   sscsrif_hssi_eth_port3_status_eth_mode_i,
// register offset : 0x0cc, field offset : 19, access : RO, sscsrif_hssi_eth_port3_status.load_recipe_err
input   sscsrif_hssi_eth_port3_status_load_recipe_err_i,
// register offset : 0x0cc, field offset : 20, access : RO, sscsrif_hssi_eth_port3_status.cal_err
input   sscsrif_hssi_eth_port3_status_cal_err_i,
// register offset : 0x0cc, field offset : 21, access : RO, sscsrif_hssi_eth_port3_status.tx_lanes_stable
input   sscsrif_hssi_eth_port3_status_tx_lanes_stable_i,
// register offset : 0x0cc, field offset : 22, access : RO, sscsrif_hssi_eth_port3_status.rx_pcs_ready
input   sscsrif_hssi_eth_port3_status_rx_pcs_ready_i,
// register offset : 0x0cc, field offset : 23, access : RO, sscsrif_hssi_eth_port3_status.tx_pll_locked
input   sscsrif_hssi_eth_port3_status_tx_pll_locked_i,
// register offset : 0x0cc, field offset : 24, access : RO, sscsrif_hssi_eth_port3_status.o_ehip0_tx_pll_locked
input   sscsrif_hssi_eth_port3_status_o_ehip0_tx_pll_locked_i,
// register offset : 0x0cc, field offset : 25, access : RO, sscsrif_hssi_eth_port3_status.o_ehip1_tx_pll_locked
input   sscsrif_hssi_eth_port3_status_o_ehip1_tx_pll_locked_i,
// register offset : 0x0cc, field offset : 26, access : W1C, sscsrif_hssi_eth_port3_status.parity_error
input   sscsrif_hssi_eth_port3_status_parity_error_hwset,
// register offset : 0x0cc, field offset : 27, access : RO, sscsrif_hssi_eth_port3_status.local_fault_status_direct
input   sscsrif_hssi_eth_port3_status_local_fault_status_direct_i,
// register offset : 0x0cc, field offset : 28, access : RO, sscsrif_hssi_eth_port3_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port3_status_remote_fault_status_direct_i,
// register offset : 0x0cc, field offset : 29, access : RO, sscsrif_hssi_eth_port3_status.rsvd
// register offset : 0x0d0, field offset : 0, access : RO, sscsrif_hssi_eth_port4_status.o_ehip_ready
input   sscsrif_hssi_eth_port4_status_o_ehip_ready_i,
// register offset : 0x0d0, field offset : 1, access : RO, sscsrif_hssi_eth_port4_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port4_status_o_rx_hi_ber_i,
// register offset : 0x0d0, field offset : 2, access : RO, sscsrif_hssi_eth_port4_status.o_cdr_lock
input   sscsrif_hssi_eth_port4_status_o_cdr_lock_i,
// register offset : 0x0d0, field offset : 3, access : RO, sscsrif_hssi_eth_port4_status.rx_am_lock
input   sscsrif_hssi_eth_port4_status_rx_am_lock_i,
// register offset : 0x0d0, field offset : 4, access : RO, sscsrif_hssi_eth_port4_status.rx_block_lock
input   sscsrif_hssi_eth_port4_status_rx_block_lock_i,
// register offset : 0x0d0, field offset : 5, access : RO, sscsrif_hssi_eth_port4_status.link_fault_gen_en
input   sscsrif_hssi_eth_port4_status_link_fault_gen_en_i,
// register offset : 0x0d0, field offset : 6, access : RO, sscsrif_hssi_eth_port4_status.unidirectional_en
input   sscsrif_hssi_eth_port4_status_unidirectional_en_i,
// register offset : 0x0d0, field offset : 7, access : W1C, sscsrif_hssi_eth_port4_status.local_fault_status
input   sscsrif_hssi_eth_port4_status_local_fault_status_hwset,
// register offset : 0x0d0, field offset : 8, access : W1C, sscsrif_hssi_eth_port4_status.remote_fault_status
input   sscsrif_hssi_eth_port4_status_remote_fault_status_hwset,
// register offset : 0x0d0, field offset : 9, access : RO, sscsrif_hssi_eth_port4_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port4_status_unidirectional_force_remote_fault_i,
// register offset : 0x0d0, field offset : 10, access : RO, sscsrif_hssi_eth_port4_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port4_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0d0, field offset : 11, access : RO, sscsrif_hssi_eth_port4_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port4_status_pcs_eccstatus_i,
// register offset : 0x0d0, field offset : 13, access : RO, sscsrif_hssi_eth_port4_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port4_status_mac_eccstatus_i,
// register offset : 0x0d0, field offset : 15, access : RO, sscsrif_hssi_eth_port4_status.set_10
input   sscsrif_hssi_eth_port4_status_set_10_i,
// register offset : 0x0d0, field offset : 16, access : RO, sscsrif_hssi_eth_port4_status.set_1000
input   sscsrif_hssi_eth_port4_status_set_1000_i,
// register offset : 0x0d0, field offset : 17, access : RO, sscsrif_hssi_eth_port4_status.ena_10
input   sscsrif_hssi_eth_port4_status_ena_10_i,
// register offset : 0x0d0, field offset : 18, access : RO, sscsrif_hssi_eth_port4_status.eth_mode
input   sscsrif_hssi_eth_port4_status_eth_mode_i,
// register offset : 0x0d0, field offset : 19, access : RO, sscsrif_hssi_eth_port4_status.load_recipe_err
input   sscsrif_hssi_eth_port4_status_load_recipe_err_i,
// register offset : 0x0d0, field offset : 20, access : RO, sscsrif_hssi_eth_port4_status.cal_err
input   sscsrif_hssi_eth_port4_status_cal_err_i,
// register offset : 0x0d0, field offset : 21, access : RO, sscsrif_hssi_eth_port4_status.tx_lanes_stable
input   sscsrif_hssi_eth_port4_status_tx_lanes_stable_i,
// register offset : 0x0d0, field offset : 22, access : RO, sscsrif_hssi_eth_port4_status.rx_pcs_ready
input   sscsrif_hssi_eth_port4_status_rx_pcs_ready_i,
// register offset : 0x0d0, field offset : 23, access : RO, sscsrif_hssi_eth_port4_status.tx_pll_locked
input   sscsrif_hssi_eth_port4_status_tx_pll_locked_i,
// register offset : 0x0d0, field offset : 24, access : RO, sscsrif_hssi_eth_port4_status.o_ehip2_tx_pll_locked
input   sscsrif_hssi_eth_port4_status_o_ehip2_tx_pll_locked_i,
// register offset : 0x0d0, field offset : 25, access : RO, sscsrif_hssi_eth_port4_status.o_ehip3_tx_pll_locked
input   sscsrif_hssi_eth_port4_status_o_ehip3_tx_pll_locked_i,
// register offset : 0x0d0, field offset : 26, access : W1C, sscsrif_hssi_eth_port4_status.parity_error
input   sscsrif_hssi_eth_port4_status_parity_error_hwset,
// register offset : 0x0d0, field offset : 27, access : RO, sscsrif_hssi_eth_port4_status.local_fault_status_direct
input   sscsrif_hssi_eth_port4_status_local_fault_status_direct_i,
// register offset : 0x0d0, field offset : 28, access : RO, sscsrif_hssi_eth_port4_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port4_status_remote_fault_status_direct_i,
// register offset : 0x0d0, field offset : 29, access : RO, sscsrif_hssi_eth_port4_status.rsvd
// register offset : 0x0d4, field offset : 0, access : RO, sscsrif_hssi_eth_port5_status.o_ehip_ready
input   sscsrif_hssi_eth_port5_status_o_ehip_ready_i,
// register offset : 0x0d4, field offset : 1, access : RO, sscsrif_hssi_eth_port5_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port5_status_o_rx_hi_ber_i,
// register offset : 0x0d4, field offset : 2, access : RO, sscsrif_hssi_eth_port5_status.o_cdr_lock
input   sscsrif_hssi_eth_port5_status_o_cdr_lock_i,
// register offset : 0x0d4, field offset : 3, access : RO, sscsrif_hssi_eth_port5_status.rx_am_lock
input   sscsrif_hssi_eth_port5_status_rx_am_lock_i,
// register offset : 0x0d4, field offset : 4, access : RO, sscsrif_hssi_eth_port5_status.rx_block_lock
input   sscsrif_hssi_eth_port5_status_rx_block_lock_i,
// register offset : 0x0d4, field offset : 5, access : RO, sscsrif_hssi_eth_port5_status.link_fault_gen_en
input   sscsrif_hssi_eth_port5_status_link_fault_gen_en_i,
// register offset : 0x0d4, field offset : 6, access : RO, sscsrif_hssi_eth_port5_status.unidirectional_en
input   sscsrif_hssi_eth_port5_status_unidirectional_en_i,
// register offset : 0x0d4, field offset : 7, access : W1C, sscsrif_hssi_eth_port5_status.local_fault_status
input   sscsrif_hssi_eth_port5_status_local_fault_status_hwset,
// register offset : 0x0d4, field offset : 8, access : W1C, sscsrif_hssi_eth_port5_status.remote_fault_status
input   sscsrif_hssi_eth_port5_status_remote_fault_status_hwset,
// register offset : 0x0d4, field offset : 9, access : RO, sscsrif_hssi_eth_port5_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port5_status_unidirectional_force_remote_fault_i,
// register offset : 0x0d4, field offset : 10, access : RO, sscsrif_hssi_eth_port5_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port5_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0d4, field offset : 11, access : RO, sscsrif_hssi_eth_port5_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port5_status_pcs_eccstatus_i,
// register offset : 0x0d4, field offset : 13, access : RO, sscsrif_hssi_eth_port5_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port5_status_mac_eccstatus_i,
// register offset : 0x0d4, field offset : 15, access : RO, sscsrif_hssi_eth_port5_status.set_10
input   sscsrif_hssi_eth_port5_status_set_10_i,
// register offset : 0x0d4, field offset : 16, access : RO, sscsrif_hssi_eth_port5_status.set_1000
input   sscsrif_hssi_eth_port5_status_set_1000_i,
// register offset : 0x0d4, field offset : 17, access : RO, sscsrif_hssi_eth_port5_status.ena_10
input   sscsrif_hssi_eth_port5_status_ena_10_i,
// register offset : 0x0d4, field offset : 18, access : RO, sscsrif_hssi_eth_port5_status.eth_mode
input   sscsrif_hssi_eth_port5_status_eth_mode_i,
// register offset : 0x0d4, field offset : 19, access : RO, sscsrif_hssi_eth_port5_status.load_recipe_err
input   sscsrif_hssi_eth_port5_status_load_recipe_err_i,
// register offset : 0x0d4, field offset : 20, access : RO, sscsrif_hssi_eth_port5_status.cal_err
input   sscsrif_hssi_eth_port5_status_cal_err_i,
// register offset : 0x0d4, field offset : 21, access : RO, sscsrif_hssi_eth_port5_status.tx_lanes_stable
input   sscsrif_hssi_eth_port5_status_tx_lanes_stable_i,
// register offset : 0x0d4, field offset : 22, access : RO, sscsrif_hssi_eth_port5_status.rx_pcs_ready
input   sscsrif_hssi_eth_port5_status_rx_pcs_ready_i,
// register offset : 0x0d4, field offset : 23, access : RO, sscsrif_hssi_eth_port5_status.tx_pll_locked
input   sscsrif_hssi_eth_port5_status_tx_pll_locked_i,
// register offset : 0x0d4, field offset : 24, access : RO, sscsrif_hssi_eth_port5_status.o_ehip2_tx_pll_locked
input   sscsrif_hssi_eth_port5_status_o_ehip2_tx_pll_locked_i,
// register offset : 0x0d4, field offset : 25, access : RO, sscsrif_hssi_eth_port5_status.o_ehip3_tx_pll_locked
input   sscsrif_hssi_eth_port5_status_o_ehip3_tx_pll_locked_i,
// register offset : 0x0d4, field offset : 26, access : W1C, sscsrif_hssi_eth_port5_status.parity_error
input   sscsrif_hssi_eth_port5_status_parity_error_hwset,
// register offset : 0x0d4, field offset : 27, access : RO, sscsrif_hssi_eth_port5_status.local_fault_status_direct
input   sscsrif_hssi_eth_port5_status_local_fault_status_direct_i,
// register offset : 0x0d4, field offset : 28, access : RO, sscsrif_hssi_eth_port5_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port5_status_remote_fault_status_direct_i,
// register offset : 0x0d4, field offset : 29, access : RO, sscsrif_hssi_eth_port5_status.rsvd
// register offset : 0x0d8, field offset : 0, access : RO, sscsrif_hssi_eth_port6_status.o_ehip_ready
input   sscsrif_hssi_eth_port6_status_o_ehip_ready_i,
// register offset : 0x0d8, field offset : 1, access : RO, sscsrif_hssi_eth_port6_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port6_status_o_rx_hi_ber_i,
// register offset : 0x0d8, field offset : 2, access : RO, sscsrif_hssi_eth_port6_status.o_cdr_lock
input   sscsrif_hssi_eth_port6_status_o_cdr_lock_i,
// register offset : 0x0d8, field offset : 3, access : RO, sscsrif_hssi_eth_port6_status.rx_am_lock
input   sscsrif_hssi_eth_port6_status_rx_am_lock_i,
// register offset : 0x0d8, field offset : 4, access : RO, sscsrif_hssi_eth_port6_status.rx_block_lock
input   sscsrif_hssi_eth_port6_status_rx_block_lock_i,
// register offset : 0x0d8, field offset : 5, access : RO, sscsrif_hssi_eth_port6_status.link_fault_gen_en
input   sscsrif_hssi_eth_port6_status_link_fault_gen_en_i,
// register offset : 0x0d8, field offset : 6, access : RO, sscsrif_hssi_eth_port6_status.unidirectional_en
input   sscsrif_hssi_eth_port6_status_unidirectional_en_i,
// register offset : 0x0d8, field offset : 7, access : W1C, sscsrif_hssi_eth_port6_status.local_fault_status
input   sscsrif_hssi_eth_port6_status_local_fault_status_hwset,
// register offset : 0x0d8, field offset : 8, access : W1C, sscsrif_hssi_eth_port6_status.remote_fault_status
input   sscsrif_hssi_eth_port6_status_remote_fault_status_hwset,
// register offset : 0x0d8, field offset : 9, access : RO, sscsrif_hssi_eth_port6_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port6_status_unidirectional_force_remote_fault_i,
// register offset : 0x0d8, field offset : 10, access : RO, sscsrif_hssi_eth_port6_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port6_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0d8, field offset : 11, access : RO, sscsrif_hssi_eth_port6_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port6_status_pcs_eccstatus_i,
// register offset : 0x0d8, field offset : 13, access : RO, sscsrif_hssi_eth_port6_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port6_status_mac_eccstatus_i,
// register offset : 0x0d8, field offset : 15, access : RO, sscsrif_hssi_eth_port6_status.set_10
input   sscsrif_hssi_eth_port6_status_set_10_i,
// register offset : 0x0d8, field offset : 16, access : RO, sscsrif_hssi_eth_port6_status.set_1000
input   sscsrif_hssi_eth_port6_status_set_1000_i,
// register offset : 0x0d8, field offset : 17, access : RO, sscsrif_hssi_eth_port6_status.ena_10
input   sscsrif_hssi_eth_port6_status_ena_10_i,
// register offset : 0x0d8, field offset : 18, access : RO, sscsrif_hssi_eth_port6_status.eth_mode
input   sscsrif_hssi_eth_port6_status_eth_mode_i,
// register offset : 0x0d8, field offset : 19, access : RO, sscsrif_hssi_eth_port6_status.load_recipe_err
input   sscsrif_hssi_eth_port6_status_load_recipe_err_i,
// register offset : 0x0d8, field offset : 20, access : RO, sscsrif_hssi_eth_port6_status.cal_err
input   sscsrif_hssi_eth_port6_status_cal_err_i,
// register offset : 0x0d8, field offset : 21, access : RO, sscsrif_hssi_eth_port6_status.tx_lanes_stable
input   sscsrif_hssi_eth_port6_status_tx_lanes_stable_i,
// register offset : 0x0d8, field offset : 22, access : RO, sscsrif_hssi_eth_port6_status.rx_pcs_ready
input   sscsrif_hssi_eth_port6_status_rx_pcs_ready_i,
// register offset : 0x0d8, field offset : 23, access : RO, sscsrif_hssi_eth_port6_status.tx_pll_locked
input   sscsrif_hssi_eth_port6_status_tx_pll_locked_i,
// register offset : 0x0d8, field offset : 24, access : RO, sscsrif_hssi_eth_port6_status.o_ehip2_tx_pll_locked
input   sscsrif_hssi_eth_port6_status_o_ehip2_tx_pll_locked_i,
// register offset : 0x0d8, field offset : 25, access : RO, sscsrif_hssi_eth_port6_status.o_ehip3_tx_pll_locked
input   sscsrif_hssi_eth_port6_status_o_ehip3_tx_pll_locked_i,
// register offset : 0x0d8, field offset : 26, access : W1C, sscsrif_hssi_eth_port6_status.parity_error
input   sscsrif_hssi_eth_port6_status_parity_error_hwset,
// register offset : 0x0d8, field offset : 27, access : RO, sscsrif_hssi_eth_port6_status.local_fault_status_direct
input   sscsrif_hssi_eth_port6_status_local_fault_status_direct_i,
// register offset : 0x0d8, field offset : 28, access : RO, sscsrif_hssi_eth_port6_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port6_status_remote_fault_status_direct_i,
// register offset : 0x0d8, field offset : 29, access : RO, sscsrif_hssi_eth_port6_status.rsvd
// register offset : 0x0dc, field offset : 0, access : RO, sscsrif_hssi_eth_port7_status.o_ehip_ready
input   sscsrif_hssi_eth_port7_status_o_ehip_ready_i,
// register offset : 0x0dc, field offset : 1, access : RO, sscsrif_hssi_eth_port7_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port7_status_o_rx_hi_ber_i,
// register offset : 0x0dc, field offset : 2, access : RO, sscsrif_hssi_eth_port7_status.o_cdr_lock
input   sscsrif_hssi_eth_port7_status_o_cdr_lock_i,
// register offset : 0x0dc, field offset : 3, access : RO, sscsrif_hssi_eth_port7_status.rx_am_lock
input   sscsrif_hssi_eth_port7_status_rx_am_lock_i,
// register offset : 0x0dc, field offset : 4, access : RO, sscsrif_hssi_eth_port7_status.rx_block_lock
input   sscsrif_hssi_eth_port7_status_rx_block_lock_i,
// register offset : 0x0dc, field offset : 5, access : RO, sscsrif_hssi_eth_port7_status.link_fault_gen_en
input   sscsrif_hssi_eth_port7_status_link_fault_gen_en_i,
// register offset : 0x0dc, field offset : 6, access : RO, sscsrif_hssi_eth_port7_status.unidirectional_en
input   sscsrif_hssi_eth_port7_status_unidirectional_en_i,
// register offset : 0x0dc, field offset : 7, access : W1C, sscsrif_hssi_eth_port7_status.local_fault_status
input   sscsrif_hssi_eth_port7_status_local_fault_status_hwset,
// register offset : 0x0dc, field offset : 8, access : W1C, sscsrif_hssi_eth_port7_status.remote_fault_status
input   sscsrif_hssi_eth_port7_status_remote_fault_status_hwset,
// register offset : 0x0dc, field offset : 9, access : RO, sscsrif_hssi_eth_port7_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port7_status_unidirectional_force_remote_fault_i,
// register offset : 0x0dc, field offset : 10, access : RO, sscsrif_hssi_eth_port7_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port7_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0dc, field offset : 11, access : RO, sscsrif_hssi_eth_port7_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port7_status_pcs_eccstatus_i,
// register offset : 0x0dc, field offset : 13, access : RO, sscsrif_hssi_eth_port7_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port7_status_mac_eccstatus_i,
// register offset : 0x0dc, field offset : 15, access : RO, sscsrif_hssi_eth_port7_status.set_10
input   sscsrif_hssi_eth_port7_status_set_10_i,
// register offset : 0x0dc, field offset : 16, access : RO, sscsrif_hssi_eth_port7_status.set_1000
input   sscsrif_hssi_eth_port7_status_set_1000_i,
// register offset : 0x0dc, field offset : 17, access : RO, sscsrif_hssi_eth_port7_status.ena_10
input   sscsrif_hssi_eth_port7_status_ena_10_i,
// register offset : 0x0dc, field offset : 18, access : RO, sscsrif_hssi_eth_port7_status.eth_mode
input   sscsrif_hssi_eth_port7_status_eth_mode_i,
// register offset : 0x0dc, field offset : 19, access : RO, sscsrif_hssi_eth_port7_status.load_recipe_err
input   sscsrif_hssi_eth_port7_status_load_recipe_err_i,
// register offset : 0x0dc, field offset : 20, access : RO, sscsrif_hssi_eth_port7_status.cal_err
input   sscsrif_hssi_eth_port7_status_cal_err_i,
// register offset : 0x0dc, field offset : 21, access : RO, sscsrif_hssi_eth_port7_status.tx_lanes_stable
input   sscsrif_hssi_eth_port7_status_tx_lanes_stable_i,
// register offset : 0x0dc, field offset : 22, access : RO, sscsrif_hssi_eth_port7_status.rx_pcs_ready
input   sscsrif_hssi_eth_port7_status_rx_pcs_ready_i,
// register offset : 0x0dc, field offset : 23, access : RO, sscsrif_hssi_eth_port7_status.tx_pll_locked
input   sscsrif_hssi_eth_port7_status_tx_pll_locked_i,
// register offset : 0x0dc, field offset : 24, access : RO, sscsrif_hssi_eth_port7_status.o_ehip2_tx_pll_locked
input   sscsrif_hssi_eth_port7_status_o_ehip2_tx_pll_locked_i,
// register offset : 0x0dc, field offset : 25, access : RO, sscsrif_hssi_eth_port7_status.o_ehip3_tx_pll_locked
input   sscsrif_hssi_eth_port7_status_o_ehip3_tx_pll_locked_i,
// register offset : 0x0dc, field offset : 26, access : W1C, sscsrif_hssi_eth_port7_status.parity_error
input   sscsrif_hssi_eth_port7_status_parity_error_hwset,
// register offset : 0x0dc, field offset : 27, access : RO, sscsrif_hssi_eth_port7_status.local_fault_status_direct
input   sscsrif_hssi_eth_port7_status_local_fault_status_direct_i,
// register offset : 0x0dc, field offset : 28, access : RO, sscsrif_hssi_eth_port7_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port7_status_remote_fault_status_direct_i,
// register offset : 0x0dc, field offset : 29, access : RO, sscsrif_hssi_eth_port7_status.rsvd
// register offset : 0x0e0, field offset : 0, access : RO, sscsrif_hssi_eth_port8_status.o_ehip_ready
input   sscsrif_hssi_eth_port8_status_o_ehip_ready_i,
// register offset : 0x0e0, field offset : 1, access : RO, sscsrif_hssi_eth_port8_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port8_status_o_rx_hi_ber_i,
// register offset : 0x0e0, field offset : 2, access : RO, sscsrif_hssi_eth_port8_status.o_cdr_lock
input   sscsrif_hssi_eth_port8_status_o_cdr_lock_i,
// register offset : 0x0e0, field offset : 3, access : RO, sscsrif_hssi_eth_port8_status.rx_am_lock
input   sscsrif_hssi_eth_port8_status_rx_am_lock_i,
// register offset : 0x0e0, field offset : 4, access : RO, sscsrif_hssi_eth_port8_status.rx_block_lock
input   sscsrif_hssi_eth_port8_status_rx_block_lock_i,
// register offset : 0x0e0, field offset : 5, access : RO, sscsrif_hssi_eth_port8_status.link_fault_gen_en
input   sscsrif_hssi_eth_port8_status_link_fault_gen_en_i,
// register offset : 0x0e0, field offset : 6, access : RO, sscsrif_hssi_eth_port8_status.unidirectional_en
input   sscsrif_hssi_eth_port8_status_unidirectional_en_i,
// register offset : 0x0e0, field offset : 7, access : W1C, sscsrif_hssi_eth_port8_status.local_fault_status
input   sscsrif_hssi_eth_port8_status_local_fault_status_hwset,
// register offset : 0x0e0, field offset : 8, access : W1C, sscsrif_hssi_eth_port8_status.remote_fault_status
input   sscsrif_hssi_eth_port8_status_remote_fault_status_hwset,
// register offset : 0x0e0, field offset : 9, access : RO, sscsrif_hssi_eth_port8_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port8_status_unidirectional_force_remote_fault_i,
// register offset : 0x0e0, field offset : 10, access : RO, sscsrif_hssi_eth_port8_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port8_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0e0, field offset : 11, access : RO, sscsrif_hssi_eth_port8_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port8_status_pcs_eccstatus_i,
// register offset : 0x0e0, field offset : 13, access : RO, sscsrif_hssi_eth_port8_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port8_status_mac_eccstatus_i,
// register offset : 0x0e0, field offset : 15, access : RO, sscsrif_hssi_eth_port8_status.set_10
input   sscsrif_hssi_eth_port8_status_set_10_i,
// register offset : 0x0e0, field offset : 16, access : RO, sscsrif_hssi_eth_port8_status.set_1000
input   sscsrif_hssi_eth_port8_status_set_1000_i,
// register offset : 0x0e0, field offset : 17, access : RO, sscsrif_hssi_eth_port8_status.ena_10
input   sscsrif_hssi_eth_port8_status_ena_10_i,
// register offset : 0x0e0, field offset : 18, access : RO, sscsrif_hssi_eth_port8_status.eth_mode
input   sscsrif_hssi_eth_port8_status_eth_mode_i,
// register offset : 0x0e0, field offset : 19, access : RO, sscsrif_hssi_eth_port8_status.load_recipe_err
input   sscsrif_hssi_eth_port8_status_load_recipe_err_i,
// register offset : 0x0e0, field offset : 20, access : RO, sscsrif_hssi_eth_port8_status.cal_err
input   sscsrif_hssi_eth_port8_status_cal_err_i,
// register offset : 0x0e0, field offset : 21, access : RO, sscsrif_hssi_eth_port8_status.tx_lanes_stable
input   sscsrif_hssi_eth_port8_status_tx_lanes_stable_i,
// register offset : 0x0e0, field offset : 22, access : RO, sscsrif_hssi_eth_port8_status.rx_pcs_ready
input   sscsrif_hssi_eth_port8_status_rx_pcs_ready_i,
// register offset : 0x0e0, field offset : 23, access : RO, sscsrif_hssi_eth_port8_status.tx_pll_locked
input   sscsrif_hssi_eth_port8_status_tx_pll_locked_i,
// register offset : 0x0e0, field offset : 24, access : RO, sscsrif_hssi_eth_port8_status.o_ehip4_tx_pll_locked
input   sscsrif_hssi_eth_port8_status_o_ehip4_tx_pll_locked_i,
// register offset : 0x0e0, field offset : 25, access : RO, sscsrif_hssi_eth_port8_status.o_ehip5_tx_pll_locked
input   sscsrif_hssi_eth_port8_status_o_ehip5_tx_pll_locked_i,
// register offset : 0x0e0, field offset : 26, access : W1C, sscsrif_hssi_eth_port8_status.parity_error
input   sscsrif_hssi_eth_port8_status_parity_error_hwset,
// register offset : 0x0e0, field offset : 27, access : RO, sscsrif_hssi_eth_port8_status.local_fault_status_direct
input   sscsrif_hssi_eth_port8_status_local_fault_status_direct_i,
// register offset : 0x0e0, field offset : 28, access : RO, sscsrif_hssi_eth_port8_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port8_status_remote_fault_status_direct_i,
// register offset : 0x0e0, field offset : 29, access : RO, sscsrif_hssi_eth_port8_status.rsvd
// register offset : 0x0e4, field offset : 0, access : RO, sscsrif_hssi_eth_port9_status.o_ehip_ready
input   sscsrif_hssi_eth_port9_status_o_ehip_ready_i,
// register offset : 0x0e4, field offset : 1, access : RO, sscsrif_hssi_eth_port9_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port9_status_o_rx_hi_ber_i,
// register offset : 0x0e4, field offset : 2, access : RO, sscsrif_hssi_eth_port9_status.o_cdr_lock
input   sscsrif_hssi_eth_port9_status_o_cdr_lock_i,
// register offset : 0x0e4, field offset : 3, access : RO, sscsrif_hssi_eth_port9_status.rx_am_lock
input   sscsrif_hssi_eth_port9_status_rx_am_lock_i,
// register offset : 0x0e4, field offset : 4, access : RO, sscsrif_hssi_eth_port9_status.rx_block_lock
input   sscsrif_hssi_eth_port9_status_rx_block_lock_i,
// register offset : 0x0e4, field offset : 5, access : RO, sscsrif_hssi_eth_port9_status.link_fault_gen_en
input   sscsrif_hssi_eth_port9_status_link_fault_gen_en_i,
// register offset : 0x0e4, field offset : 6, access : RO, sscsrif_hssi_eth_port9_status.unidirectional_en
input   sscsrif_hssi_eth_port9_status_unidirectional_en_i,
// register offset : 0x0e4, field offset : 7, access : W1C, sscsrif_hssi_eth_port9_status.local_fault_status
input   sscsrif_hssi_eth_port9_status_local_fault_status_hwset,
// register offset : 0x0e4, field offset : 8, access : W1C, sscsrif_hssi_eth_port9_status.remote_fault_status
input   sscsrif_hssi_eth_port9_status_remote_fault_status_hwset,
// register offset : 0x0e4, field offset : 9, access : RO, sscsrif_hssi_eth_port9_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port9_status_unidirectional_force_remote_fault_i,
// register offset : 0x0e4, field offset : 10, access : RO, sscsrif_hssi_eth_port9_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port9_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0e4, field offset : 11, access : RO, sscsrif_hssi_eth_port9_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port9_status_pcs_eccstatus_i,
// register offset : 0x0e4, field offset : 13, access : RO, sscsrif_hssi_eth_port9_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port9_status_mac_eccstatus_i,
// register offset : 0x0e4, field offset : 15, access : RO, sscsrif_hssi_eth_port9_status.set_10
input   sscsrif_hssi_eth_port9_status_set_10_i,
// register offset : 0x0e4, field offset : 16, access : RO, sscsrif_hssi_eth_port9_status.set_1000
input   sscsrif_hssi_eth_port9_status_set_1000_i,
// register offset : 0x0e4, field offset : 17, access : RO, sscsrif_hssi_eth_port9_status.ena_10
input   sscsrif_hssi_eth_port9_status_ena_10_i,
// register offset : 0x0e4, field offset : 18, access : RO, sscsrif_hssi_eth_port9_status.eth_mode
input   sscsrif_hssi_eth_port9_status_eth_mode_i,
// register offset : 0x0e4, field offset : 19, access : RO, sscsrif_hssi_eth_port9_status.load_recipe_err
input   sscsrif_hssi_eth_port9_status_load_recipe_err_i,
// register offset : 0x0e4, field offset : 20, access : RO, sscsrif_hssi_eth_port9_status.cal_err
input   sscsrif_hssi_eth_port9_status_cal_err_i,
// register offset : 0x0e4, field offset : 21, access : RO, sscsrif_hssi_eth_port9_status.tx_lanes_stable
input   sscsrif_hssi_eth_port9_status_tx_lanes_stable_i,
// register offset : 0x0e4, field offset : 22, access : RO, sscsrif_hssi_eth_port9_status.rx_pcs_ready
input   sscsrif_hssi_eth_port9_status_rx_pcs_ready_i,
// register offset : 0x0e4, field offset : 23, access : RO, sscsrif_hssi_eth_port9_status.tx_pll_locked
input   sscsrif_hssi_eth_port9_status_tx_pll_locked_i,
// register offset : 0x0e4, field offset : 24, access : RO, sscsrif_hssi_eth_port9_status.o_ehip4_tx_pll_locked
input   sscsrif_hssi_eth_port9_status_o_ehip4_tx_pll_locked_i,
// register offset : 0x0e4, field offset : 25, access : RO, sscsrif_hssi_eth_port9_status.o_ehip5_tx_pll_locked
input   sscsrif_hssi_eth_port9_status_o_ehip5_tx_pll_locked_i,
// register offset : 0x0e4, field offset : 26, access : W1C, sscsrif_hssi_eth_port9_status.parity_error
input   sscsrif_hssi_eth_port9_status_parity_error_hwset,
// register offset : 0x0e4, field offset : 27, access : RO, sscsrif_hssi_eth_port9_status.local_fault_status_direct
input   sscsrif_hssi_eth_port9_status_local_fault_status_direct_i,
// register offset : 0x0e4, field offset : 28, access : RO, sscsrif_hssi_eth_port9_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port9_status_remote_fault_status_direct_i,
// register offset : 0x0e4, field offset : 29, access : RO, sscsrif_hssi_eth_port9_status.rsvd
// register offset : 0x0e8, field offset : 0, access : RO, sscsrif_hssi_eth_port10_status.o_ehip_ready
input   sscsrif_hssi_eth_port10_status_o_ehip_ready_i,
// register offset : 0x0e8, field offset : 1, access : RO, sscsrif_hssi_eth_port10_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port10_status_o_rx_hi_ber_i,
// register offset : 0x0e8, field offset : 2, access : RO, sscsrif_hssi_eth_port10_status.o_cdr_lock
input   sscsrif_hssi_eth_port10_status_o_cdr_lock_i,
// register offset : 0x0e8, field offset : 3, access : RO, sscsrif_hssi_eth_port10_status.rx_am_lock
input   sscsrif_hssi_eth_port10_status_rx_am_lock_i,
// register offset : 0x0e8, field offset : 4, access : RO, sscsrif_hssi_eth_port10_status.rx_block_lock
input   sscsrif_hssi_eth_port10_status_rx_block_lock_i,
// register offset : 0x0e8, field offset : 5, access : RO, sscsrif_hssi_eth_port10_status.link_fault_gen_en
input   sscsrif_hssi_eth_port10_status_link_fault_gen_en_i,
// register offset : 0x0e8, field offset : 6, access : RO, sscsrif_hssi_eth_port10_status.unidirectional_en
input   sscsrif_hssi_eth_port10_status_unidirectional_en_i,
// register offset : 0x0e8, field offset : 7, access : W1C, sscsrif_hssi_eth_port10_status.local_fault_status
input   sscsrif_hssi_eth_port10_status_local_fault_status_hwset,
// register offset : 0x0e8, field offset : 8, access : W1C, sscsrif_hssi_eth_port10_status.remote_fault_status
input   sscsrif_hssi_eth_port10_status_remote_fault_status_hwset,
// register offset : 0x0e8, field offset : 9, access : RO, sscsrif_hssi_eth_port10_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port10_status_unidirectional_force_remote_fault_i,
// register offset : 0x0e8, field offset : 10, access : RO, sscsrif_hssi_eth_port10_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port10_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0e8, field offset : 11, access : RO, sscsrif_hssi_eth_port10_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port10_status_pcs_eccstatus_i,
// register offset : 0x0e8, field offset : 13, access : RO, sscsrif_hssi_eth_port10_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port10_status_mac_eccstatus_i,
// register offset : 0x0e8, field offset : 15, access : RO, sscsrif_hssi_eth_port10_status.set_10
input   sscsrif_hssi_eth_port10_status_set_10_i,
// register offset : 0x0e8, field offset : 16, access : RO, sscsrif_hssi_eth_port10_status.set_1000
input   sscsrif_hssi_eth_port10_status_set_1000_i,
// register offset : 0x0e8, field offset : 17, access : RO, sscsrif_hssi_eth_port10_status.ena_10
input   sscsrif_hssi_eth_port10_status_ena_10_i,
// register offset : 0x0e8, field offset : 18, access : RO, sscsrif_hssi_eth_port10_status.eth_mode
input   sscsrif_hssi_eth_port10_status_eth_mode_i,
// register offset : 0x0e8, field offset : 19, access : RO, sscsrif_hssi_eth_port10_status.load_recipe_err
input   sscsrif_hssi_eth_port10_status_load_recipe_err_i,
// register offset : 0x0e8, field offset : 20, access : RO, sscsrif_hssi_eth_port10_status.cal_err
input   sscsrif_hssi_eth_port10_status_cal_err_i,
// register offset : 0x0e8, field offset : 21, access : RO, sscsrif_hssi_eth_port10_status.tx_lanes_stable
input   sscsrif_hssi_eth_port10_status_tx_lanes_stable_i,
// register offset : 0x0e8, field offset : 22, access : RO, sscsrif_hssi_eth_port10_status.rx_pcs_ready
input   sscsrif_hssi_eth_port10_status_rx_pcs_ready_i,
// register offset : 0x0e8, field offset : 23, access : RO, sscsrif_hssi_eth_port10_status.tx_pll_locked
input   sscsrif_hssi_eth_port10_status_tx_pll_locked_i,
// register offset : 0x0e8, field offset : 24, access : RO, sscsrif_hssi_eth_port10_status.o_ehip4_tx_pll_locked
input   sscsrif_hssi_eth_port10_status_o_ehip4_tx_pll_locked_i,
// register offset : 0x0e8, field offset : 25, access : RO, sscsrif_hssi_eth_port10_status.o_ehip5_tx_pll_locked
input   sscsrif_hssi_eth_port10_status_o_ehip5_tx_pll_locked_i,
// register offset : 0x0e8, field offset : 26, access : W1C, sscsrif_hssi_eth_port10_status.parity_error
input   sscsrif_hssi_eth_port10_status_parity_error_hwset,
// register offset : 0x0e8, field offset : 27, access : RO, sscsrif_hssi_eth_port10_status.local_fault_status_direct
input   sscsrif_hssi_eth_port10_status_local_fault_status_direct_i,
// register offset : 0x0e8, field offset : 28, access : RO, sscsrif_hssi_eth_port10_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port10_status_remote_fault_status_direct_i,
// register offset : 0x0e8, field offset : 29, access : RO, sscsrif_hssi_eth_port10_status.rsvd
// register offset : 0x0ec, field offset : 0, access : RO, sscsrif_hssi_eth_port11_status.o_ehip_ready
input   sscsrif_hssi_eth_port11_status_o_ehip_ready_i,
// register offset : 0x0ec, field offset : 1, access : RO, sscsrif_hssi_eth_port11_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port11_status_o_rx_hi_ber_i,
// register offset : 0x0ec, field offset : 2, access : RO, sscsrif_hssi_eth_port11_status.o_cdr_lock
input   sscsrif_hssi_eth_port11_status_o_cdr_lock_i,
// register offset : 0x0ec, field offset : 3, access : RO, sscsrif_hssi_eth_port11_status.rx_am_lock
input   sscsrif_hssi_eth_port11_status_rx_am_lock_i,
// register offset : 0x0ec, field offset : 4, access : RO, sscsrif_hssi_eth_port11_status.rx_block_lock
input   sscsrif_hssi_eth_port11_status_rx_block_lock_i,
// register offset : 0x0ec, field offset : 5, access : RO, sscsrif_hssi_eth_port11_status.link_fault_gen_en
input   sscsrif_hssi_eth_port11_status_link_fault_gen_en_i,
// register offset : 0x0ec, field offset : 6, access : RO, sscsrif_hssi_eth_port11_status.unidirectional_en
input   sscsrif_hssi_eth_port11_status_unidirectional_en_i,
// register offset : 0x0ec, field offset : 7, access : W1C, sscsrif_hssi_eth_port11_status.local_fault_status
input   sscsrif_hssi_eth_port11_status_local_fault_status_hwset,
// register offset : 0x0ec, field offset : 8, access : W1C, sscsrif_hssi_eth_port11_status.remote_fault_status
input   sscsrif_hssi_eth_port11_status_remote_fault_status_hwset,
// register offset : 0x0ec, field offset : 9, access : RO, sscsrif_hssi_eth_port11_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port11_status_unidirectional_force_remote_fault_i,
// register offset : 0x0ec, field offset : 10, access : RO, sscsrif_hssi_eth_port11_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port11_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0ec, field offset : 11, access : RO, sscsrif_hssi_eth_port11_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port11_status_pcs_eccstatus_i,
// register offset : 0x0ec, field offset : 13, access : RO, sscsrif_hssi_eth_port11_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port11_status_mac_eccstatus_i,
// register offset : 0x0ec, field offset : 15, access : RO, sscsrif_hssi_eth_port11_status.set_10
input   sscsrif_hssi_eth_port11_status_set_10_i,
// register offset : 0x0ec, field offset : 16, access : RO, sscsrif_hssi_eth_port11_status.set_1000
input   sscsrif_hssi_eth_port11_status_set_1000_i,
// register offset : 0x0ec, field offset : 17, access : RO, sscsrif_hssi_eth_port11_status.ena_10
input   sscsrif_hssi_eth_port11_status_ena_10_i,
// register offset : 0x0ec, field offset : 18, access : RO, sscsrif_hssi_eth_port11_status.eth_mode
input   sscsrif_hssi_eth_port11_status_eth_mode_i,
// register offset : 0x0ec, field offset : 19, access : RO, sscsrif_hssi_eth_port11_status.load_recipe_err
input   sscsrif_hssi_eth_port11_status_load_recipe_err_i,
// register offset : 0x0ec, field offset : 20, access : RO, sscsrif_hssi_eth_port11_status.cal_err
input   sscsrif_hssi_eth_port11_status_cal_err_i,
// register offset : 0x0ec, field offset : 21, access : RO, sscsrif_hssi_eth_port11_status.tx_lanes_stable
input   sscsrif_hssi_eth_port11_status_tx_lanes_stable_i,
// register offset : 0x0ec, field offset : 22, access : RO, sscsrif_hssi_eth_port11_status.rx_pcs_ready
input   sscsrif_hssi_eth_port11_status_rx_pcs_ready_i,
// register offset : 0x0ec, field offset : 23, access : RO, sscsrif_hssi_eth_port11_status.tx_pll_locked
input   sscsrif_hssi_eth_port11_status_tx_pll_locked_i,
// register offset : 0x0ec, field offset : 24, access : RO, sscsrif_hssi_eth_port11_status.o_ehip4_tx_pll_locked
input   sscsrif_hssi_eth_port11_status_o_ehip4_tx_pll_locked_i,
// register offset : 0x0ec, field offset : 25, access : RO, sscsrif_hssi_eth_port11_status.o_ehip5_tx_pll_locked
input   sscsrif_hssi_eth_port11_status_o_ehip5_tx_pll_locked_i,
// register offset : 0x0ec, field offset : 26, access : W1C, sscsrif_hssi_eth_port11_status.parity_error
input   sscsrif_hssi_eth_port11_status_parity_error_hwset,
// register offset : 0x0ec, field offset : 27, access : RO, sscsrif_hssi_eth_port11_status.local_fault_status_direct
input   sscsrif_hssi_eth_port11_status_local_fault_status_direct_i,
// register offset : 0x0ec, field offset : 28, access : RO, sscsrif_hssi_eth_port11_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port11_status_remote_fault_status_direct_i,
// register offset : 0x0ec, field offset : 29, access : RO, sscsrif_hssi_eth_port11_status.rsvd
// register offset : 0x0f0, field offset : 0, access : RO, sscsrif_hssi_eth_port12_status.o_ehip_ready
input   sscsrif_hssi_eth_port12_status_o_ehip_ready_i,
// register offset : 0x0f0, field offset : 1, access : RO, sscsrif_hssi_eth_port12_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port12_status_o_rx_hi_ber_i,
// register offset : 0x0f0, field offset : 2, access : RO, sscsrif_hssi_eth_port12_status.o_cdr_lock
input   sscsrif_hssi_eth_port12_status_o_cdr_lock_i,
// register offset : 0x0f0, field offset : 3, access : RO, sscsrif_hssi_eth_port12_status.rx_am_lock
input   sscsrif_hssi_eth_port12_status_rx_am_lock_i,
// register offset : 0x0f0, field offset : 4, access : RO, sscsrif_hssi_eth_port12_status.rx_block_lock
input   sscsrif_hssi_eth_port12_status_rx_block_lock_i,
// register offset : 0x0f0, field offset : 5, access : RO, sscsrif_hssi_eth_port12_status.link_fault_gen_en
input   sscsrif_hssi_eth_port12_status_link_fault_gen_en_i,
// register offset : 0x0f0, field offset : 6, access : RO, sscsrif_hssi_eth_port12_status.unidirectional_en
input   sscsrif_hssi_eth_port12_status_unidirectional_en_i,
// register offset : 0x0f0, field offset : 7, access : W1C, sscsrif_hssi_eth_port12_status.local_fault_status
input   sscsrif_hssi_eth_port12_status_local_fault_status_hwset,
// register offset : 0x0f0, field offset : 8, access : W1C, sscsrif_hssi_eth_port12_status.remote_fault_status
input   sscsrif_hssi_eth_port12_status_remote_fault_status_hwset,
// register offset : 0x0f0, field offset : 9, access : RO, sscsrif_hssi_eth_port12_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port12_status_unidirectional_force_remote_fault_i,
// register offset : 0x0f0, field offset : 10, access : RO, sscsrif_hssi_eth_port12_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port12_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0f0, field offset : 11, access : RO, sscsrif_hssi_eth_port12_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port12_status_pcs_eccstatus_i,
// register offset : 0x0f0, field offset : 13, access : RO, sscsrif_hssi_eth_port12_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port12_status_mac_eccstatus_i,
// register offset : 0x0f0, field offset : 15, access : RO, sscsrif_hssi_eth_port12_status.set_10
input   sscsrif_hssi_eth_port12_status_set_10_i,
// register offset : 0x0f0, field offset : 16, access : RO, sscsrif_hssi_eth_port12_status.set_1000
input   sscsrif_hssi_eth_port12_status_set_1000_i,
// register offset : 0x0f0, field offset : 17, access : RO, sscsrif_hssi_eth_port12_status.ena_10
input   sscsrif_hssi_eth_port12_status_ena_10_i,
// register offset : 0x0f0, field offset : 18, access : RO, sscsrif_hssi_eth_port12_status.eth_mode
input   sscsrif_hssi_eth_port12_status_eth_mode_i,
// register offset : 0x0f0, field offset : 19, access : RO, sscsrif_hssi_eth_port12_status.load_recipe_err
input   sscsrif_hssi_eth_port12_status_load_recipe_err_i,
// register offset : 0x0f0, field offset : 20, access : RO, sscsrif_hssi_eth_port12_status.cal_err
input   sscsrif_hssi_eth_port12_status_cal_err_i,
// register offset : 0x0f0, field offset : 21, access : RO, sscsrif_hssi_eth_port12_status.tx_lanes_stable
input   sscsrif_hssi_eth_port12_status_tx_lanes_stable_i,
// register offset : 0x0f0, field offset : 22, access : RO, sscsrif_hssi_eth_port12_status.rx_pcs_ready
input   sscsrif_hssi_eth_port12_status_rx_pcs_ready_i,
// register offset : 0x0f0, field offset : 23, access : RO, sscsrif_hssi_eth_port12_status.tx_pll_locked
input   sscsrif_hssi_eth_port12_status_tx_pll_locked_i,
// register offset : 0x0f0, field offset : 24, access : RO, sscsrif_hssi_eth_port12_status.o_ehip6_tx_pll_locked
input   sscsrif_hssi_eth_port12_status_o_ehip6_tx_pll_locked_i,
// register offset : 0x0f0, field offset : 25, access : RO, sscsrif_hssi_eth_port12_status.o_ehip7_tx_pll_locked
input   sscsrif_hssi_eth_port12_status_o_ehip7_tx_pll_locked_i,
// register offset : 0x0f0, field offset : 26, access : W1C, sscsrif_hssi_eth_port12_status.parity_error
input   sscsrif_hssi_eth_port12_status_parity_error_hwset,
// register offset : 0x0f0, field offset : 27, access : RO, sscsrif_hssi_eth_port12_status.local_fault_status_direct
input   sscsrif_hssi_eth_port12_status_local_fault_status_direct_i,
// register offset : 0x0f0, field offset : 28, access : RO, sscsrif_hssi_eth_port12_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port12_status_remote_fault_status_direct_i,
// register offset : 0x0f0, field offset : 29, access : RO, sscsrif_hssi_eth_port12_status.rsvd
// register offset : 0x0f4, field offset : 0, access : RO, sscsrif_hssi_eth_port13_status.o_ehip_ready
input   sscsrif_hssi_eth_port13_status_o_ehip_ready_i,
// register offset : 0x0f4, field offset : 1, access : RO, sscsrif_hssi_eth_port13_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port13_status_o_rx_hi_ber_i,
// register offset : 0x0f4, field offset : 2, access : RO, sscsrif_hssi_eth_port13_status.o_cdr_lock
input   sscsrif_hssi_eth_port13_status_o_cdr_lock_i,
// register offset : 0x0f4, field offset : 3, access : RO, sscsrif_hssi_eth_port13_status.rx_am_lock
input   sscsrif_hssi_eth_port13_status_rx_am_lock_i,
// register offset : 0x0f4, field offset : 4, access : RO, sscsrif_hssi_eth_port13_status.rx_block_lock
input   sscsrif_hssi_eth_port13_status_rx_block_lock_i,
// register offset : 0x0f4, field offset : 5, access : RO, sscsrif_hssi_eth_port13_status.link_fault_gen_en
input   sscsrif_hssi_eth_port13_status_link_fault_gen_en_i,
// register offset : 0x0f4, field offset : 6, access : RO, sscsrif_hssi_eth_port13_status.unidirectional_en
input   sscsrif_hssi_eth_port13_status_unidirectional_en_i,
// register offset : 0x0f4, field offset : 7, access : W1C, sscsrif_hssi_eth_port13_status.local_fault_status
input   sscsrif_hssi_eth_port13_status_local_fault_status_hwset,
// register offset : 0x0f4, field offset : 8, access : W1C, sscsrif_hssi_eth_port13_status.remote_fault_status
input   sscsrif_hssi_eth_port13_status_remote_fault_status_hwset,
// register offset : 0x0f4, field offset : 9, access : RO, sscsrif_hssi_eth_port13_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port13_status_unidirectional_force_remote_fault_i,
// register offset : 0x0f4, field offset : 10, access : RO, sscsrif_hssi_eth_port13_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port13_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0f4, field offset : 11, access : RO, sscsrif_hssi_eth_port13_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port13_status_pcs_eccstatus_i,
// register offset : 0x0f4, field offset : 13, access : RO, sscsrif_hssi_eth_port13_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port13_status_mac_eccstatus_i,
// register offset : 0x0f4, field offset : 15, access : RO, sscsrif_hssi_eth_port13_status.set_10
input   sscsrif_hssi_eth_port13_status_set_10_i,
// register offset : 0x0f4, field offset : 16, access : RO, sscsrif_hssi_eth_port13_status.set_1000
input   sscsrif_hssi_eth_port13_status_set_1000_i,
// register offset : 0x0f4, field offset : 17, access : RO, sscsrif_hssi_eth_port13_status.ena_10
input   sscsrif_hssi_eth_port13_status_ena_10_i,
// register offset : 0x0f4, field offset : 18, access : RO, sscsrif_hssi_eth_port13_status.eth_mode
input   sscsrif_hssi_eth_port13_status_eth_mode_i,
// register offset : 0x0f4, field offset : 19, access : RO, sscsrif_hssi_eth_port13_status.load_recipe_err
input   sscsrif_hssi_eth_port13_status_load_recipe_err_i,
// register offset : 0x0f4, field offset : 20, access : RO, sscsrif_hssi_eth_port13_status.cal_err
input   sscsrif_hssi_eth_port13_status_cal_err_i,
// register offset : 0x0f4, field offset : 21, access : RO, sscsrif_hssi_eth_port13_status.tx_lanes_stable
input   sscsrif_hssi_eth_port13_status_tx_lanes_stable_i,
// register offset : 0x0f4, field offset : 22, access : RO, sscsrif_hssi_eth_port13_status.rx_pcs_ready
input   sscsrif_hssi_eth_port13_status_rx_pcs_ready_i,
// register offset : 0x0f4, field offset : 23, access : RO, sscsrif_hssi_eth_port13_status.tx_pll_locked
input   sscsrif_hssi_eth_port13_status_tx_pll_locked_i,
// register offset : 0x0f4, field offset : 24, access : RO, sscsrif_hssi_eth_port13_status.o_ehip6_tx_pll_locked
input   sscsrif_hssi_eth_port13_status_o_ehip6_tx_pll_locked_i,
// register offset : 0x0f4, field offset : 25, access : RO, sscsrif_hssi_eth_port13_status.o_ehip7_tx_pll_locked
input   sscsrif_hssi_eth_port13_status_o_ehip7_tx_pll_locked_i,
// register offset : 0x0f4, field offset : 26, access : W1C, sscsrif_hssi_eth_port13_status.parity_error
input   sscsrif_hssi_eth_port13_status_parity_error_hwset,
// register offset : 0x0f4, field offset : 27, access : RO, sscsrif_hssi_eth_port13_status.local_fault_status_direct
input   sscsrif_hssi_eth_port13_status_local_fault_status_direct_i,
// register offset : 0x0f4, field offset : 28, access : RO, sscsrif_hssi_eth_port13_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port13_status_remote_fault_status_direct_i,
// register offset : 0x0f4, field offset : 29, access : RO, sscsrif_hssi_eth_port13_status.rsvd
// register offset : 0x0f8, field offset : 0, access : RO, sscsrif_hssi_eth_port14_status.o_ehip_ready
input   sscsrif_hssi_eth_port14_status_o_ehip_ready_i,
// register offset : 0x0f8, field offset : 1, access : RO, sscsrif_hssi_eth_port14_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port14_status_o_rx_hi_ber_i,
// register offset : 0x0f8, field offset : 2, access : RO, sscsrif_hssi_eth_port14_status.o_cdr_lock
input   sscsrif_hssi_eth_port14_status_o_cdr_lock_i,
// register offset : 0x0f8, field offset : 3, access : RO, sscsrif_hssi_eth_port14_status.rx_am_lock
input   sscsrif_hssi_eth_port14_status_rx_am_lock_i,
// register offset : 0x0f8, field offset : 4, access : RO, sscsrif_hssi_eth_port14_status.rx_block_lock
input   sscsrif_hssi_eth_port14_status_rx_block_lock_i,
// register offset : 0x0f8, field offset : 5, access : RO, sscsrif_hssi_eth_port14_status.link_fault_gen_en
input   sscsrif_hssi_eth_port14_status_link_fault_gen_en_i,
// register offset : 0x0f8, field offset : 6, access : RO, sscsrif_hssi_eth_port14_status.unidirectional_en
input   sscsrif_hssi_eth_port14_status_unidirectional_en_i,
// register offset : 0x0f8, field offset : 7, access : W1C, sscsrif_hssi_eth_port14_status.local_fault_status
input   sscsrif_hssi_eth_port14_status_local_fault_status_hwset,
// register offset : 0x0f8, field offset : 8, access : W1C, sscsrif_hssi_eth_port14_status.remote_fault_status
input   sscsrif_hssi_eth_port14_status_remote_fault_status_hwset,
// register offset : 0x0f8, field offset : 9, access : RO, sscsrif_hssi_eth_port14_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port14_status_unidirectional_force_remote_fault_i,
// register offset : 0x0f8, field offset : 10, access : RO, sscsrif_hssi_eth_port14_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port14_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0f8, field offset : 11, access : RO, sscsrif_hssi_eth_port14_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port14_status_pcs_eccstatus_i,
// register offset : 0x0f8, field offset : 13, access : RO, sscsrif_hssi_eth_port14_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port14_status_mac_eccstatus_i,
// register offset : 0x0f8, field offset : 15, access : RO, sscsrif_hssi_eth_port14_status.set_10
input   sscsrif_hssi_eth_port14_status_set_10_i,
// register offset : 0x0f8, field offset : 16, access : RO, sscsrif_hssi_eth_port14_status.set_1000
input   sscsrif_hssi_eth_port14_status_set_1000_i,
// register offset : 0x0f8, field offset : 17, access : RO, sscsrif_hssi_eth_port14_status.ena_10
input   sscsrif_hssi_eth_port14_status_ena_10_i,
// register offset : 0x0f8, field offset : 18, access : RO, sscsrif_hssi_eth_port14_status.eth_mode
input   sscsrif_hssi_eth_port14_status_eth_mode_i,
// register offset : 0x0f8, field offset : 19, access : RO, sscsrif_hssi_eth_port14_status.load_recipe_err
input   sscsrif_hssi_eth_port14_status_load_recipe_err_i,
// register offset : 0x0f8, field offset : 20, access : RO, sscsrif_hssi_eth_port14_status.cal_err
input   sscsrif_hssi_eth_port14_status_cal_err_i,
// register offset : 0x0f8, field offset : 21, access : RO, sscsrif_hssi_eth_port14_status.tx_lanes_stable
input   sscsrif_hssi_eth_port14_status_tx_lanes_stable_i,
// register offset : 0x0f8, field offset : 22, access : RO, sscsrif_hssi_eth_port14_status.rx_pcs_ready
input   sscsrif_hssi_eth_port14_status_rx_pcs_ready_i,
// register offset : 0x0f8, field offset : 23, access : RO, sscsrif_hssi_eth_port14_status.tx_pll_locked
input   sscsrif_hssi_eth_port14_status_tx_pll_locked_i,
// register offset : 0x0f8, field offset : 24, access : RO, sscsrif_hssi_eth_port14_status.o_ehip6_tx_pll_locked
input   sscsrif_hssi_eth_port14_status_o_ehip6_tx_pll_locked_i,
// register offset : 0x0f8, field offset : 25, access : RO, sscsrif_hssi_eth_port14_status.o_ehip7_tx_pll_locked
input   sscsrif_hssi_eth_port14_status_o_ehip7_tx_pll_locked_i,
// register offset : 0x0f8, field offset : 26, access : W1C, sscsrif_hssi_eth_port14_status.parity_error
input   sscsrif_hssi_eth_port14_status_parity_error_hwset,
// register offset : 0x0f8, field offset : 27, access : RO, sscsrif_hssi_eth_port14_status.local_fault_status_direct
input   sscsrif_hssi_eth_port14_status_local_fault_status_direct_i,
// register offset : 0x0f8, field offset : 28, access : RO, sscsrif_hssi_eth_port14_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port14_status_remote_fault_status_direct_i,
// register offset : 0x0f8, field offset : 29, access : RO, sscsrif_hssi_eth_port14_status.rsvd
// register offset : 0x0fc, field offset : 0, access : RO, sscsrif_hssi_eth_port15_status.o_ehip_ready
input   sscsrif_hssi_eth_port15_status_o_ehip_ready_i,
// register offset : 0x0fc, field offset : 1, access : RO, sscsrif_hssi_eth_port15_status.o_rx_hi_ber
input   sscsrif_hssi_eth_port15_status_o_rx_hi_ber_i,
// register offset : 0x0fc, field offset : 2, access : RO, sscsrif_hssi_eth_port15_status.o_cdr_lock
input   sscsrif_hssi_eth_port15_status_o_cdr_lock_i,
// register offset : 0x0fc, field offset : 3, access : RO, sscsrif_hssi_eth_port15_status.rx_am_lock
input   sscsrif_hssi_eth_port15_status_rx_am_lock_i,
// register offset : 0x0fc, field offset : 4, access : RO, sscsrif_hssi_eth_port15_status.rx_block_lock
input   sscsrif_hssi_eth_port15_status_rx_block_lock_i,
// register offset : 0x0fc, field offset : 5, access : RO, sscsrif_hssi_eth_port15_status.link_fault_gen_en
input   sscsrif_hssi_eth_port15_status_link_fault_gen_en_i,
// register offset : 0x0fc, field offset : 6, access : RO, sscsrif_hssi_eth_port15_status.unidirectional_en
input   sscsrif_hssi_eth_port15_status_unidirectional_en_i,
// register offset : 0x0fc, field offset : 7, access : W1C, sscsrif_hssi_eth_port15_status.local_fault_status
input   sscsrif_hssi_eth_port15_status_local_fault_status_hwset,
// register offset : 0x0fc, field offset : 8, access : W1C, sscsrif_hssi_eth_port15_status.remote_fault_status
input   sscsrif_hssi_eth_port15_status_remote_fault_status_hwset,
// register offset : 0x0fc, field offset : 9, access : RO, sscsrif_hssi_eth_port15_status.unidirectional_force_remote_fault
input   sscsrif_hssi_eth_port15_status_unidirectional_force_remote_fault_i,
// register offset : 0x0fc, field offset : 10, access : RO, sscsrif_hssi_eth_port15_status.unidirectional_remote_fault_dis
input   sscsrif_hssi_eth_port15_status_unidirectional_remote_fault_dis_i,
// register offset : 0x0fc, field offset : 11, access : RO, sscsrif_hssi_eth_port15_status.pcs_eccstatus
input  [1:0] sscsrif_hssi_eth_port15_status_pcs_eccstatus_i,
// register offset : 0x0fc, field offset : 13, access : RO, sscsrif_hssi_eth_port15_status.mac_eccstatus
input  [1:0] sscsrif_hssi_eth_port15_status_mac_eccstatus_i,
// register offset : 0x0fc, field offset : 15, access : RO, sscsrif_hssi_eth_port15_status.set_10
input   sscsrif_hssi_eth_port15_status_set_10_i,
// register offset : 0x0fc, field offset : 16, access : RO, sscsrif_hssi_eth_port15_status.set_1000
input   sscsrif_hssi_eth_port15_status_set_1000_i,
// register offset : 0x0fc, field offset : 17, access : RO, sscsrif_hssi_eth_port15_status.ena_10
input   sscsrif_hssi_eth_port15_status_ena_10_i,
// register offset : 0x0fc, field offset : 18, access : RO, sscsrif_hssi_eth_port15_status.eth_mode
input   sscsrif_hssi_eth_port15_status_eth_mode_i,
// register offset : 0x0fc, field offset : 19, access : RO, sscsrif_hssi_eth_port15_status.load_recipe_err
input   sscsrif_hssi_eth_port15_status_load_recipe_err_i,
// register offset : 0x0fc, field offset : 20, access : RO, sscsrif_hssi_eth_port15_status.cal_err
input   sscsrif_hssi_eth_port15_status_cal_err_i,
// register offset : 0x0fc, field offset : 21, access : RO, sscsrif_hssi_eth_port15_status.tx_lanes_stable
input   sscsrif_hssi_eth_port15_status_tx_lanes_stable_i,
// register offset : 0x0fc, field offset : 22, access : RO, sscsrif_hssi_eth_port15_status.rx_pcs_ready
input   sscsrif_hssi_eth_port15_status_rx_pcs_ready_i,
// register offset : 0x0fc, field offset : 23, access : RO, sscsrif_hssi_eth_port15_status.tx_pll_locked
input   sscsrif_hssi_eth_port15_status_tx_pll_locked_i,
// register offset : 0x0fc, field offset : 24, access : RO, sscsrif_hssi_eth_port15_status.o_ehip6_tx_pll_locked
input   sscsrif_hssi_eth_port15_status_o_ehip6_tx_pll_locked_i,
// register offset : 0x0fc, field offset : 25, access : RO, sscsrif_hssi_eth_port15_status.o_ehip7_tx_pll_locked
input   sscsrif_hssi_eth_port15_status_o_ehip7_tx_pll_locked_i,
// register offset : 0x0fc, field offset : 26, access : W1C, sscsrif_hssi_eth_port15_status.parity_error
input   sscsrif_hssi_eth_port15_status_parity_error_hwset,
// register offset : 0x0fc, field offset : 27, access : RO, sscsrif_hssi_eth_port15_status.local_fault_status_direct
input   sscsrif_hssi_eth_port15_status_local_fault_status_direct_i,
// register offset : 0x0fc, field offset : 28, access : RO, sscsrif_hssi_eth_port15_status.remote_fault_status_direct
input   sscsrif_hssi_eth_port15_status_remote_fault_status_direct_i,
// register offset : 0x0fc, field offset : 29, access : RO, sscsrif_hssi_eth_port15_status.rsvd
// register offset : 0x100, field offset : 0, access : RO, sscsrif_hssi_tse_ctrl.Magic_wakeup
input   sscsrif_hssi_tse_ctrl_Magic_wakeup_i,
// register offset : 0x100, field offset : 1, access : RW, sscsrif_hssi_tse_ctrl.Magic_sleep_n
output  reg sscsrif_hssi_tse_ctrl_Magic_sleep_n,
// register offset : 0x100, field offset : 2, access : RO, sscsrif_hssi_tse_ctrl.rsvd
// register offset : 0x108, field offset : 0, access : RW, sscsrif_hssi_debug_ctrl.override_led_speed
output  reg[2:0] sscsrif_hssi_debug_ctrl_override_led_speed,
// register offset : 0x108, field offset : 3, access : RW, sscsrif_hssi_debug_ctrl.override_led_status
output  reg[2:0] sscsrif_hssi_debug_ctrl_override_led_status,
// register offset : 0x108, field offset : 6, access : RW, sscsrif_hssi_debug_ctrl.port_led_status_override
output  reg[3:0] sscsrif_hssi_debug_ctrl_port_led_status_override,
// register offset : 0x108, field offset : 10, access : RW, sscsrif_hssi_debug_ctrl.led_status_override_enable
output  reg sscsrif_hssi_debug_ctrl_led_status_override_enable,
// register offset : 0x108, field offset : 11, access : RW, sscsrif_hssi_debug_ctrl.led_status_blinking_timer
output  reg[7:0] sscsrif_hssi_debug_ctrl_led_status_blinking_timer,
// register offset : 0x108, field offset : 19, access : RO, sscsrif_hssi_debug_ctrl.rsvd
// register offset : 0x10c, field offset : 0, access : RW, sscsrif_hssi_hotplug_debug_ctrl.hotplug_control
output  reg[31:0] sscsrif_hssi_hotplug_debug_ctrl_hotplug_control,
// register offset : 0x110, field offset : 0, access : RO, sscsrif_hssi_hotplug_debug_sts.hotplug_status
input  [7:0] sscsrif_hssi_hotplug_debug_sts_hotplug_status_i,
// register offset : 0x110, field offset : 8, access : RO, sscsrif_hssi_hotplug_debug_sts.rsvd
// register offset : 0x114, field offset : 0, access : W1C, sscsrif_hssi_general_status.ecc_error_m20k_sal_nios
input   sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset,
// register offset : 0x114, field offset : 1, access : W1C, sscsrif_hssi_general_status.ecc_error_m20k_avst
input   sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset,
// register offset : 0x114, field offset : 2, access : W1C, sscsrif_hssi_general_status.ecc_error_m20k_jtag
input   sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset,
// register offset : 0x114, field offset : 3, access : RO, sscsrif_hssi_general_status.rsvd
//Bus Interface
input clk,
input reset,
input [31:0] writedata,
input read,
input write,
input [3:0] byteenable,
output reg [31:0] readdata,
output reg readdatavalid,
input [8:0] address

);


wire reset_n = !reset;	
// Protocol management
// combinatorial read data signal declaration
reg [31:0] rdata_comb;

// synchronous process for the read
always @(negedge reset_n ,posedge clk)  
   if (!reset_n) readdata[31:0] <= 32'h0; else readdata[31:0] <= rdata_comb[31:0];

// read data is always returned on the next cycle
always @(negedge reset_n , posedge clk)
   if (!reset_n) readdatavalid <= 1'b0; else readdatavalid <= read;
//
//  Protocol specific assignment to inside signals
//
wire  we = write;
wire  re = read;
wire [8:0] addr = address[8:0];
wire [31:0] din  = writedata [31:0];
// A write byte enable for each register
// register sscsrif_hssi_cmd_sts with  writeType: write
wire	  we_sscsrif_hssi_cmd_sts		=	we  & (addr[8:0]  == 9'h0a8)	?	byteenable[0]	:	1'b0;
// register sscsrif_hssi_ctrl_addr with  writeType: write
wire	[3:0]  we_sscsrif_hssi_ctrl_addr		=	we  & (addr[8:0]  == 9'h0ac)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_wr_data with  writeType: write
wire	[3:0]  we_sscsrif_hssi_wr_data		=	we  & (addr[8:0]  == 9'h0b4)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port0_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port0_status		=	we  & (addr[8:0]  == 9'h0c0)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port1_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port1_status		=	we  & (addr[8:0]  == 9'h0c4)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port2_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port2_status		=	we  & (addr[8:0]  == 9'h0c8)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port3_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port3_status		=	we  & (addr[8:0]  == 9'h0cc)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port4_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port4_status		=	we  & (addr[8:0]  == 9'h0d0)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port5_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port5_status		=	we  & (addr[8:0]  == 9'h0d4)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port6_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port6_status		=	we  & (addr[8:0]  == 9'h0d8)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port7_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port7_status		=	we  & (addr[8:0]  == 9'h0dc)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port8_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port8_status		=	we  & (addr[8:0]  == 9'h0e0)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port9_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port9_status		=	we  & (addr[8:0]  == 9'h0e4)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port10_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port10_status		=	we  & (addr[8:0]  == 9'h0e8)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port11_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port11_status		=	we  & (addr[8:0]  == 9'h0ec)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port12_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port12_status		=	we  & (addr[8:0]  == 9'h0f0)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port13_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port13_status		=	we  & (addr[8:0]  == 9'h0f4)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port14_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port14_status		=	we  & (addr[8:0]  == 9'h0f8)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_eth_port15_status with  writeType: write
wire	[3:0]  we_sscsrif_hssi_eth_port15_status		=	we  & (addr[8:0]  == 9'h0fc)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_tse_ctrl with  writeType: write
wire	  we_sscsrif_hssi_tse_ctrl		=	we  & (addr[8:0]  == 9'h100)	?	byteenable[0]	:	1'b0;
// register sscsrif_hssi_debug_ctrl with  writeType: write
wire	[2:0]  we_sscsrif_hssi_debug_ctrl		=	we  & (addr[8:0]  == 9'h108)	?	byteenable[2:0]	:	{3{1'b0}};
// register sscsrif_hssi_hotplug_debug_ctrl with  writeType: write
wire	[3:0]  we_sscsrif_hssi_hotplug_debug_ctrl		=	we  & (addr[8:0]  == 9'h10c)	?	byteenable[3:0]	:	{4{1'b0}};
// register sscsrif_hssi_general_status with  writeType: write
wire	  we_sscsrif_hssi_general_status		=	we  & (addr[8:0]  == 9'h114)	?	byteenable[0]	:	1'b0;

// A read byte enable for each register

/* Definitions of REGISTER "sscsrif_dfh_lo" */

// sscsrif_dfh_lo_feature_id
// bitfield description: Feature ID
// customType:  RO
// hwAccess: WO 
// reset value : 0x015 
// inputPort: sscsrif_dfh_lo_feature_id_i 
// outputPort:  "" 
// NO register generated




// sscsrif_dfh_lo_feature_rev
// bitfield description: Feature Revision
// customType:  RO
// hwAccess: WO 
// reset value : 0x2 
// inputPort: sscsrif_dfh_lo_feature_rev_i 
// outputPort:  "" 
// NO register generated




// sscsrif_dfh_lo_dfh_byte_offset
// bitfield description: Next DFH Byte Offset Bit [15:0] Next DFH Address = 0x1000 (Current DFH Address + Next DFH Byte Offset Used to figure out Next DFH Address and as an indication for the maximum size of MMIO region occupied by this feature. For last feature, this offset points to the beginning of the unallocated MMIO region, if any (or beyond the end of the MMIOspace).
// customType:  RO
// hwAccess: WO 
// reset value : 0x1000 
// inputPort: sscsrif_dfh_lo_dfh_byte_offset_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_dfh_hi" */

// sscsrif_dfh_hi_dfh_byte_offset
// bitfield description: Next DFH Byte Offset Bit [39:32] Next DFH Address = 0x00 (Current DFH Address + Next DFH Byte Offset Used to figure out Next DFH Address and as an indication for the maximum size of MMIO region occupied by this feature. For last feature, this offset points to the beginning of the unallocated MMIO region, if any (or beyond the end of the MMIO space).
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_dfh_hi_dfh_byte_offset_i 
// outputPort:  "" 
// NO register generated




// sscsrif_dfh_hi_end_of_list
// bitfield description: End of List 
// 1'b0 = This is last feature header (see Next DFH Byte Offset)
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_dfh_hi_end_of_list_i 
// outputPort:  "" 
// NO register generated




// sscsrif_dfh_hi_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated



// sscsrif_dfh_hi_feature_minor_revision
// bitfield description: Feature Minor Revision
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_dfh_hi_feature_minor_revision_i 
// outputPort:  "" 
// NO register generated




// sscsrif_dfh_hi_dfh_version
// bitfield description: DFH Version. It is 0 is CSR doesn't exist and 1 if CSR exist(for OSC).As per HAS, current version is v0.5 , till it is approved dfh version has to be 0x0
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_dfh_hi_dfh_version_i 
// outputPort:  "" 
// NO register generated




// sscsrif_dfh_hi_feature_type
// bitfield description: Feature Type 
// 4'b0011 - v0 feature/interface
// customType:  RO
// hwAccess: WO 
// reset value : 0x3 
// inputPort: sscsrif_dfh_hi_feature_type_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_feature_guid_l_low" */

// sscsrif_feature_guid_l_low_low_guid
// bitfield description: lower 32 bit of Low 64-bit of GUID
// customType:  RO
// hwAccess: WO 
// reset value : 0x18418b9d 
// inputPort: sscsrif_feature_guid_l_low_low_guid_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_feature_guid_l_high" */

// sscsrif_feature_guid_l_high_low_guid
// bitfield description: upper 32bit of Low 64-bit of GUID
// customType:  RO
// hwAccess: WO 
// reset value : 0x99a078ad 
// inputPort: sscsrif_feature_guid_l_high_low_guid_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_feature_guid_h_low" */

// sscsrif_feature_guid_h_low_high_guid
// bitfield description: lower 32 bit of High 64-bit of GUID
// customType:  RO
// hwAccess: WO 
// reset value : 0xd9db4a9b 
// inputPort: sscsrif_feature_guid_h_low_high_guid_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_feature_guid_h_high" */

// sscsrif_feature_guid_h_high_high_guid
// bitfield description: higher 32 bit of High 64-bit of GUID
// customType:  RO
// hwAccess: WO 
// reset value : 0x4118a7cb 
// inputPort: sscsrif_feature_guid_h_high_high_guid_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_csr_addr_l" */

// sscsrif_csr_addr_l_csr_rel
// bitfield description: Point to CSR located in a different address space which may be outside of PCI BAR, mainly for ARM 1'b0 = relative (offset from feature DFH start),1'b1 = absolute For all IP/SS, this field shall be 1b0.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_csr_addr_l_csr_rel_i 
// outputPort:  "" 
// NO register generated




// sscsrif_csr_addr_l_feature_csr
// bitfield description: Points to where the IP/SS proprietary feature CSRs start. Need to provision space for future std DFH registers to grow For all IP/SS, this field shall point to 0x60
// customType:  RO
// hwAccess: WO 
// reset value : 0x00000060 
// inputPort: sscsrif_csr_addr_l_feature_csr_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_csr_addr_h" */

// sscsrif_csr_addr_h_feature_csr
// bitfield description: Points to where the IP/SS proprietary feature CSRs start. Need to provision space for future std DFH registers to grow For all IP/SS, this field shall point to 0x60
// customType:  RO
// hwAccess: WO 
// reset value : 0x00000000 
// inputPort: sscsrif_csr_addr_h_feature_csr_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_csr_size_grp_l" */

// sscsrif_csr_size_grp_l_instance_id
// bitfield description: Enumeration of instantiated IP A counter to differentiate each instances of the IP, advertise the instance ID assigned by Quartus To allow software to build the graph. Value derived from DFHv1_INSTID parameter
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: sscsrif_csr_size_grp_l_instance_id_i 
// outputPort:  "" 
// NO register generated




// sscsrif_csr_size_grp_l_grouping_id
// bitfield description: Used to group features / interfaces . To differentiate & group different blocks within the pipeline For all IP/SS, this field is driver to zeros.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: sscsrif_csr_size_grp_l_grouping_id_i 
// outputPort:  "" 
// NO register generated




// sscsrif_csr_size_grp_l_has_params
// bitfield description: Indicates whether the optional Param Header and Param Y CSR are present or not. For all IP/SS, this field shall be 1b0 (no Param Header and no Param Y CSR)
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_csr_size_grp_l_has_params_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_csr_size_grp_h" */

// sscsrif_csr_size_grp_h_csr_size
// bitfield description: Size of CSR block in bytes Specifies the size of the IP/SS proprietary feature CSR in Bytes
// customType:  RO
// hwAccess: WO 
// reset value : 0x00000044 
// inputPort: sscsrif_csr_size_grp_h_csr_size_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_version" */

// sscsrif_version_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated



// sscsrif_version_min_ver
// bitfield description: Minor Version Number (MNR): Indicates the minor version.
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_version_min_ver_i 
// outputPort:  "" 
// NO register generated




// sscsrif_version_maj_ver
// bitfield description: Major Version Number (MNR): Indicates the minor version.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0001 
// inputPort: sscsrif_version_maj_ver_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_feature_list" */

// sscsrif_feature_list_axi4_support
// bitfield description: AXI-4 Support
// customType:  RO
// hwAccess: WO 
// reset value : 0x1 
// inputPort: sscsrif_feature_list_axi4_support_i 
// outputPort:  "" 
// NO register generated




// sscsrif_feature_list_hssi_num_ports
// bitfield description: Number of HSSI Ports Instantiated (NUM_PORTS parameter)
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_feature_list_hssi_num_ports_i 
// outputPort:  "" 
// NO register generated




// sscsrif_feature_list_physical_port_enable
// bitfield description: Physical Port Enable 
// [ 6] - Port 0 Enable
// [ 7] - Port 1 Enable
// .
// .
// [21] - Port 15 Enable
// customType:  RO
// hwAccess: WO 
// reset value : 0x0000 
// inputPort: sscsrif_feature_list_physical_port_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_feature_list_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x000 
// NO register generated


/* Definitions of REGISTER "sscsrif_port0_param" */

// sscsrif_port0_param_port_0_profile
// bitfield description: Port 0 Profiles (PORT0_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port0_param_port_0_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_port_0_ready_latency
// bitfield description: Port 0 Ready Latency (PORT0_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port0_param_port_0_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_port_0_databus_width
// bitfield description: Port 0 Data Bus Width (PORT0_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port0_param_port_0_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_port_0_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT0_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port0_param_port_0_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_port_0_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port0_param_port_0_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_port_0_subprofile
// bitfield description: Port 0 Sub-Profiles. 
// 5'b10000 and above - Reserved
// 5'b01111 - 24G PCS
// 5'b01110 - 12G PCS
// 5'b01101 - 10G PCS
// 5'b01100 - 9.8G PMA
// 5'b01011 - 8.1G PMA
// 5'b01010 - 6.1G PMA
// 5'b01001 - 4.9G PMA
// 5'b01000 - 3.0G PMA
// 5'b00111 - 2.4G PMA
// 5'b00110 - 1.2G PMA
// 5'b00101 - 0.6G PMA
// 5'b00100 - MAC + PCS
// 5'b00011 - PCS
// 5'b00010 - FlexE
// 5'b00001 - OTN
// 5'b00000 - None
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port0_param_port_0_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_port_0_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port0_param_port_0_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_port_0_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port0_param_port_0_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_port_0_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port0_param_port_0_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port0_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port1_param" */

// sscsrif_port1_param_port_1_profile
// bitfield description: Port 1 Profiles (PORT1_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port1_param_port_1_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_port_1_ready_latency
// bitfield description: Port 1 Ready Latency (PORT1_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port1_param_port_1_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_port_1_databus_width
// bitfield description: Port 1 Data Bus Width (PORT1_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port1_param_port_1_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_port_1_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT1_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port1_param_port_1_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_port_1_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port1_param_port_1_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_port_1_subprofile
// bitfield description: Port 1 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port1_param_port_1_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_port_1_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port1_param_port_1_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_port_1_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port1_param_port_1_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_port_1_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port1_param_port_1_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port1_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port2_param" */

// sscsrif_port2_param_port_2_profile
// bitfield description: Port 2 Profiles (PORT2_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port2_param_port_2_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_port_2_ready_latency
// bitfield description: Port 2 Ready Latency (PORT2_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port2_param_port_2_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_port_2_databus_width
// bitfield description: Port 2 Data Bus Width (PORT2_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port2_param_port_2_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_port_2_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT2_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port2_param_port_2_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_port_2_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port2_param_port_2_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_port_2_subprofile
// bitfield description: Port 2 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port2_param_port_2_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_port_2_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port2_param_port_2_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_port_2_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port2_param_port_2_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_port_2_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port2_param_port_2_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port2_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port3_param" */

// sscsrif_port3_param_port_3_profile
// bitfield description: Port 3 Profiles (PORT3_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port3_param_port_3_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_port_3_ready_latency
// bitfield description: Port 3 Ready Latency (PORT3_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port3_param_port_3_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_port_3_databus_width
// bitfield description: Port 3 Data Bus Width (PORT3_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port3_param_port_3_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_port_3_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT3_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port3_param_port_3_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_port_3_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port3_param_port_3_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_port_3_subprofile
// bitfield description: Port 3 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port3_param_port_3_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_port_3_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port3_param_port_3_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_port_3_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port3_param_port_3_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_port_3_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port3_param_port_3_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port3_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port4_param" */

// sscsrif_port4_param_port_4_profile
// bitfield description: Port 4 Profiles (PORT4_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port4_param_port_4_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_port_4_ready_latency
// bitfield description: Port 4 Ready Latency (PORT4_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port4_param_port_4_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_port_4_databus_width
// bitfield description: Port 4 Data Bus Width (PORT4_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port4_param_port_4_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_port_4_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT4_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port4_param_port_4_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_port_4_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port4_param_port_4_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_port_4_subprofile
// bitfield description: Port 4 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port4_param_port_4_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_port_4_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port4_param_port_4_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_port_4_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port4_param_port_4_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_port_4_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port4_param_port_4_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port4_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port5_param" */

// sscsrif_port5_param_port_5_profile
// bitfield description: Port 5 Profiles (PORT5_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port5_param_port_5_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_port_5_ready_latency
// bitfield description: Port 5 Ready Latency (PORT5_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port5_param_port_5_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_port_5_databus_width
// bitfield description: Port 5 Data Bus Width (PORT5_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port5_param_port_5_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_port_5_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT5_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port5_param_port_5_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_port_5_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port5_param_port_5_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_port_5_subprofile
// bitfield description: Port 5 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port5_param_port_5_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_port_5_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port5_param_port_5_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_port_5_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port5_param_port_5_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_port_5_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port5_param_port_5_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port5_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port6_param" */

// sscsrif_port6_param_port_6_profile
// bitfield description: Port 6 Profiles (PORT6_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port6_param_port_6_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_port_6_ready_latency
// bitfield description: Port 6 Ready Latency (PORT6_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port6_param_port_6_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_port_6_databus_width
// bitfield description: Port 6 Data Bus Width (PORT6_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port6_param_port_6_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_port_6_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT6_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port6_param_port_6_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_port_6_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port6_param_port_6_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_port_6_subprofile
// bitfield description: Port 6 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port6_param_port_6_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_port_6_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port6_param_port_6_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_port_6_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port6_param_port_6_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_port_6_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port6_param_port_6_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port6_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port7_param" */

// sscsrif_port7_param_port_7_profile
// bitfield description: Port 7 Profiles (PORT7_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port7_param_port_7_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_port_7_ready_latency
// bitfield description: Port 7 Ready Latency (PORT7_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port7_param_port_7_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_port_7_databus_width
// bitfield description: Port 7 Data Bus Width (PORT7_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port7_param_port_7_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_port_7_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT7_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port7_param_port_7_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_port_7_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port7_param_port_7_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_port_7_subprofile
// bitfield description: Port 7 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port7_param_port_7_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_port_7_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port7_param_port_7_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_port_7_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port7_param_port_7_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_port_7_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port7_param_port_7_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port7_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port8_param" */

// sscsrif_port8_param_port_8_profile
// bitfield description: Port 8 Profiles (PORT8_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port8_param_port_8_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_port_8_ready_latency
// bitfield description: Port 8 Ready Latency (PORT8_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port8_param_port_8_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_port_8_databus_width
// bitfield description: Port 8 Data Bus Width (PORT8_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port8_param_port_8_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_port_8_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT8_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port8_param_port_8_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_port_8_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port8_param_port_8_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_port_8_subprofile
// bitfield description: Port 8 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port8_param_port_8_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_port_8_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port8_param_port_8_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_port_8_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port8_param_port_8_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_port_8_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port8_param_port_8_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port8_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port9_param" */

// sscsrif_port9_param_port_9_profile
// bitfield description: Port 9 Profiles (PORT9_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port9_param_port_9_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_port_9_ready_latency
// bitfield description: Port 9 Ready Latency (PORT9_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port9_param_port_9_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_port_9_databus_width
// bitfield description: Port 9 Data Bus Width (PORT9_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port9_param_port_9_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_port_9_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT9_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port9_param_port_9_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_port_9_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port9_param_port_9_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_port_9_subprofile
// bitfield description: Port 9 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port9_param_port_9_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_port_9_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port9_param_port_9_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_port_9_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port9_param_port_9_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_port_9_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port9_param_port_9_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port9_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port10_param" */

// sscsrif_port10_param_port_10_profile
// bitfield description: Port 10 Profiles (PORT10_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port10_param_port_10_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_port_10_ready_latency
// bitfield description: Port 10 Ready Latency (PORT10_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port10_param_port_10_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_port_10_databus_width
// bitfield description: Port 10 Data Bus Width (PORT10_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port10_param_port_10_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_port_10_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT10_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port10_param_port_10_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_port_10_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port10_param_port_10_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_port_10_subprofile
// bitfield description: Port 10 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port10_param_port_10_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_port_10_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port10_param_port_10_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_port_10_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port10_param_port_10_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_port_10_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port10_param_port_10_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port10_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port11_param" */

// sscsrif_port11_param_port_11_profile
// bitfield description: Port 11 Profiles (PORT11_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port11_param_port_11_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_port_11_ready_latency
// bitfield description: Port 11 Ready Latency (PORT11_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port11_param_port_11_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_port_11_databus_width
// bitfield description: Port 11 Data Bus Width (PORT11_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port11_param_port_11_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_port_11_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT11_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port11_param_port_11_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_port_11_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port11_param_port_11_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_port_11_subprofile
// bitfield description: Port 11 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port11_param_port_11_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_port_11_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port11_param_port_11_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_port_11_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port11_param_port_11_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_port_11_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port11_param_port_11_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port11_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port12_param" */

// sscsrif_port12_param_port_12_profile
// bitfield description: Port 12 Profiles (PORT12_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port12_param_port_12_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_port_12_ready_latency
// bitfield description: Port 12 Ready Latency (PORT12_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port12_param_port_12_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_port_12_databus_width
// bitfield description: Port 12 Data Bus Width (PORT12_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port12_param_port_12_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_port_12_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT12_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port12_param_port_12_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_port_12_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port12_param_port_12_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_port_12_subprofile
// bitfield description: Port 12 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port12_param_port_12_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_port_12_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port12_param_port_12_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_port_12_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port12_param_port_12_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_port_12_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port12_param_port_12_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port12_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port13_param" */

// sscsrif_port13_param_port_13_profile
// bitfield description: Port 13 Profiles (PORT13_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port13_param_port_13_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_port_13_ready_latency
// bitfield description: Port 13 Ready Latency (PORT13_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port13_param_port_13_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_port_13_databus_width
// bitfield description: Port 13 Data Bus Width (PORT13_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port13_param_port_13_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_port_13_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT13_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port13_param_port_13_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_port_13_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port13_param_port_13_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_port_13_subprofile
// bitfield description: Port 13 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port13_param_port_13_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_port_13_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port13_param_port_13_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_port_13_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port13_param_port_13_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_port_13_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port13_param_port_13_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port13_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port14_param" */

// sscsrif_port14_param_port_14_profile
// bitfield description: Port 14 Profiles (PORT14_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port14_param_port_14_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_port_14_ready_latency
// bitfield description: Port 14 Ready Latency (PORT14_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port14_param_port_14_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_port_14_databus_width
// bitfield description: Port 14 Data Bus Width (PORT14_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port14_param_port_14_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_port_14_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT14_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port14_param_port_14_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_port_14_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port14_param_port_14_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_port_14_subprofile
// bitfield description: Port 14 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port14_param_port_14_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_port_14_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port14_param_port_14_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_port_14_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port14_param_port_14_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_port_14_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port14_param_port_14_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port14_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_port15_param" */

// sscsrif_port15_param_port_15_profile
// bitfield description: Port 15 Profiles (PORT15_PROFILE).
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port15_param_port_15_profile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_port_15_ready_latency
// bitfield description: Port 15 Ready Latency (PORT15_READY_LATENCY parameter).
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port15_param_port_15_ready_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_port_15_databus_width
// bitfield description: Port 15 Data Bus Width (PORT15_DATA_WIDTH parameter).
// 3'b101: 1024
// 3'b100: 512
// 3'b011: 256
// 3'b010: 128
// 3'b001: 64
// 3'b000: 32
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port15_param_port_15_databus_width_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_port_15_lowspeed_eth_param
// bitfield description: Low Speed Ethernet MAC Interface (PORT15_LOW_SPEED_ETH parameter).
// 2'b10: XGMII
// 2'b01: GMII
// 2'b00: MII
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port15_param_port_15_lowspeed_eth_param_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_port_15_drinpr_presence
// bitfield description: Indicate presence of Dynamic Reconfiguration in Partial Reconfiguration use case.
// 1: Dynamic Reconfiguration in Partial Reconfiguration use case presence
// 0: Dynamic Reconfiguration in Partial Reconfiguration use case not presence
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port15_param_port_15_drinpr_presence_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_port_15_subprofile
// bitfield description: Port 15 Sub-Profiles.
// 6'b100000: 400GAUI-8,
// 6'b011111: 400GAUI-4,
// 6'b011110: 200GAUI-8,
// 6'b011101: 200GAUI-4,
// 6'b011100: 200GAUI-2,
// 6'b011011: 100GCAUI-4,
// 6'b011010: 100GAUI-2,
// 6'b011001: 100GAUI-1,
// 6'b011000: 50GAUI-1,
// 6'b010111: 50GAUI-2,
// 6'b010110: 40GCAUI-4,
// 6'b010101: 25GbE,
// 6'b010100: 10GbE,
// 6'b010011: Ethernet PMA-Direct,
// 6'b010010: Ethernet FEC-Direct,
// 6'b010001: Ethernet PCS-Direct,
// 6'b010000: MII,
// 6'b001111: General PMA-Direct,
// 6'b001110: General FEC-Direct,
// 6'b001101: General PCS-Direct,
// 6'b001100: OTN,
// 6'b001011: Flex-E,
// 6'b001010: TSE MAC,
// 6'b001001: TSE PCS,
// 6'b001000: LL10G,
// 6'b000111: MRPHY,
// 6'b000110: 10_25G,
// 6'b000101: 25_50G,
// 6'b000100: Ultra40G,
// 6'b000011: LL40G,
// 6'b000010: LL50G,
// 6'b000001: Ultra100G,
// 6'b000000: LL100G
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_port15_param_port_15_subprofile_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_port_15_rsfec_enable
// bitfield description: RSFEC Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port15_param_port_15_rsfec_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_port_15_anlt_enable
// bitfield description: ANLT Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port15_param_port_15_anlt_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_port_15_ptp_enable
// bitfield description: PTP Enabled
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_port15_param_port_15_ptp_enable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_port15_param_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_cmd_sts" */

// sscsrif_hssi_cmd_sts_read_command
// bitfield description: Read Command
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_cmd_sts_read_command <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_cmd_sts) begin 
      sscsrif_hssi_cmd_sts_read_command   <=  din[0];  //
   end
end

// sscsrif_hssi_cmd_sts_write_command
// bitfield description: Write Command
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_cmd_sts_write_command <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_cmd_sts) begin 
      sscsrif_hssi_cmd_sts_write_command   <=  din[1];  //
   end
end

// sscsrif_hssi_cmd_sts_ack_trans
// bitfield description: ACK_TRANS: Bit gets asserted by hw when transaction is complete. Gets cleared by hw, when hw receives the next command. 
// 0- indicates, a command is getting processed.
// 1- Indicates, the earlier command processing is complete and it's ready to accept next command.
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_cmd_sts_ack_trans_hwset 
// hardware set:  "sscsrif_hssi_cmd_sts_ack_trans_hwset" 

reg  sscsrif_hssi_cmd_sts_ack_trans_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_cmd_sts_ack_trans_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_cmd_sts_ack_trans_hwset_sync <=  sscsrif_hssi_cmd_sts_ack_trans_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_cmd_sts_ack_trans = (sscsrif_hssi_cmd_sts_ack_trans_hwset ^ sscsrif_hssi_cmd_sts_ack_trans_hwset_sync) & ~(sscsrif_hssi_cmd_sts_ack_trans_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_cmd_sts_ack_trans <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_cmd_sts) begin 
      sscsrif_hssi_cmd_sts_ack_trans   <=  din[2];  //
   end
   else if (hw_we_hwset_sscsrif_hssi_cmd_sts_ack_trans && !we_sscsrif_hssi_cmd_sts) begin
   	sscsrif_hssi_cmd_sts_ack_trans<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_cmd_sts_busy
// bitfield description: Busy
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_cmd_sts_busy_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_cmd_sts_error
// bitfield description: Error
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_cmd_sts_error_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_cmd_sts_xcvr_reg_byte_no
// bitfield description: XCVR Reg Byte Num
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_cmd_sts_xcvr_reg_byte_no <= 2'h0;
   end
   else begin
   if (we_sscsrif_hssi_cmd_sts) begin 
      sscsrif_hssi_cmd_sts_xcvr_reg_byte_no[1:0]   <=  din[6:5];  //
   end
end

// sscsrif_hssi_cmd_sts_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000000 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_ctrl_addr" */

// sscsrif_hssi_ctrl_addr_sal_command
// bitfield description: RSAL Command:
// 0x0 NOP
// 0x1 get_hssi_profile
// 0x2 set_hssi_profile
// 0x3 read_MAC_statistic
// 0x4 get_mtu
// 0x5 Set CSR
// 0x6 Get CSR
// 0x7 Enable loopback
// 0x8 Disable loopback
// 0x9 - 0xFE reserved
// 0xFF firmware_versionserved
// customType:  RW
// hwAccess: RO 
// reset value : 0x00 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_ctrl_addr_sal_command <= 8'h00;
   end
   else begin
   if (we_sscsrif_hssi_ctrl_addr[0]) begin 
      sscsrif_hssi_ctrl_addr_sal_command[7:0]   <=  din[7:0];  //
   end
end

// sscsrif_hssi_ctrl_addr_port_addr
// bitfield description: Port/Address: 
// When SAL command = get_hssi_profile, set_hssi_profile, enable loopback, disable loopback, [11:8] = Port
// When SAL command = get_csr, set_csr, [11:8] = Address[3:0]
// Others[11:8] = 4'b0
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_ctrl_addr_port_addr <= 4'h0;
   end
   else begin
   if (we_sscsrif_hssi_ctrl_addr[1]) begin 
      sscsrif_hssi_ctrl_addr_port_addr[3:0]   <=  din[11:8];  //
   end
end

// sscsrif_hssi_ctrl_addr_channel_addr
// bitfield description: Channel/Address:
// When SAL command = get_hssi_profile, set_hssi_profile, enable loopback, disable loopback, [15:12] = Channel
// When SAL command = get_csr, set_csr, [15:12] = Address[7:4]
// Others, [15:12] = 4'b0
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_ctrl_addr_channel_addr <= 4'h0;
   end
   else begin
   if (we_sscsrif_hssi_ctrl_addr[1]) begin 
      sscsrif_hssi_ctrl_addr_channel_addr[3:0]   <=  din[15:12];  //
   end
end

// sscsrif_hssi_ctrl_addr_addr_msb
// bitfield description: Address bit [23:8]
// customType:  RW
// hwAccess: RO 
// reset value : 0x0000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_ctrl_addr_addr_msb <= 16'h0000;
   end
   else begin
   if (we_sscsrif_hssi_ctrl_addr[2]) begin 
      sscsrif_hssi_ctrl_addr_addr_msb[7:0]   <=  din[23:16];  //
   end
   if (we_sscsrif_hssi_ctrl_addr[3]) begin 
      sscsrif_hssi_ctrl_addr_addr_msb[15:8]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "sscsrif_hssi_rd_data" */

// sscsrif_hssi_rd_data_write_data
// bitfield description: Read data
// customType:  RO
// hwAccess: WO 
// reset value : 0x00000000 
// inputPort: sscsrif_hssi_rd_data_write_data_i 
// outputPort:  "" 
// NO register generated



/* Definitions of REGISTER "sscsrif_hssi_wr_data" */

// sscsrif_hssi_wr_data_write_data
// bitfield description: Write data
// customType:  RW
// hwAccess: RO 
// reset value : 0x00000000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_wr_data_write_data <= 32'h00000000;
   end
   else begin
   if (we_sscsrif_hssi_wr_data[0]) begin 
      sscsrif_hssi_wr_data_write_data[7:0]   <=  din[7:0];  //
   end
   if (we_sscsrif_hssi_wr_data[1]) begin 
      sscsrif_hssi_wr_data_write_data[15:8]   <=  din[15:8];  //
   end
   if (we_sscsrif_hssi_wr_data[2]) begin 
      sscsrif_hssi_wr_data_write_data[23:16]   <=  din[23:16];  //
   end
   if (we_sscsrif_hssi_wr_data[3]) begin 
      sscsrif_hssi_wr_data_write_data[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "sscsrif_gmii_xgmii_tx_latency" */

// sscsrif_gmii_xgmii_tx_latency_tx_latency
// bitfield description: gmii_tx_latency/xgmii_tx_latency The latency of the PHY excluding the PMA block on the TX datapath:
// Bits [15:10], [21:10] and [23:10]: The number of clock cycles.
// Bits [9:0]: The fractional number of clock cycles.
// The width is:
// 16 bits for 1G/2.5G/10G (MGBASE-T) with IEEE 1588 configurations.
// 22 bits for 2.5G, 1G/2.5G, 10M/100M/1G/2.5G, 1G/2.5G/10G (MGBASE-T),10M/100M/1G/2.5G/10G(MGBASE-T)
// 24 bits for 10M/100M/1G/2.5G/5G/10G (USXGMII) configurations.
// This signal is available when only the Enable IEEE 1588 Precision Time Protocol parameter is selected. Note: For USXGMII configuration, the latency value may be unstable for the first three transmitted packets times (at least 64 bytes). You should not use the latency value within this period. Only applicable for MRPHY profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x000000 
// inputPort: sscsrif_gmii_xgmii_tx_latency_tx_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_gmii_xgmii_tx_latency_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_gmii_xgmii_rx_latency" */

// sscsrif_gmii_xgmii_rx_latency_rx_latency
// bitfield description: gmii_rx_latency/xgmii_rx_latency The latency of the PHY excluding the PMA block on the TX datapath:
// Bits [15:10], [21:10] and [23:10]: The number of clock cycles.
// Bits [9:0]: The fractional number of clock cycles.
// The width is:
// 16 bits for 1G/2.5G/10G (MGBASE-T) with IEEE 1588 configurations.
// 22 bits for 2.5G, 1G/2.5G, 10M/100M/1G/2.5G, 1G/2.5G/10G (MGBASE-T),10M/100M/1G/2.5G/10G(MGBASE-T)
// 24 bits for 10M/100M/1G/2.5G/5G/10G (USXGMII) configurations.
// This signal is available when only the Enable IEEE 1588 Precision Time Protocol parameter is selected. Note: For USXGMII configuration, the latency value may be unstable for the first three transmitted packets times (at least 64 bytes). You should not use the latency value within this period. Only applicable for MRPHY profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x000000 
// inputPort: sscsrif_gmii_xgmii_rx_latency_rx_latency_i 
// outputPort:  "" 
// NO register generated




// sscsrif_gmii_xgmii_rx_latency_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port0_status" */

// sscsrif_hssi_eth_port0_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port0_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port0_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port0_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port0_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port0_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port0_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port0_status_local_fault_status = (sscsrif_hssi_eth_port0_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port0_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port0_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port0_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port0_status[0]) begin
      sscsrif_hssi_eth_port0_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port0_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port0_status_local_fault_status && !we_sscsrif_hssi_eth_port0_status[0]) begin
   	sscsrif_hssi_eth_port0_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port0_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port0_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port0_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port0_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port0_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port0_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port0_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port0_status_remote_fault_status = (sscsrif_hssi_eth_port0_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port0_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port0_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port0_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port0_status[1]) begin
      sscsrif_hssi_eth_port0_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port0_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port0_status_remote_fault_status && !we_sscsrif_hssi_eth_port0_status[1]) begin
   	sscsrif_hssi_eth_port0_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port0_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_o_ehip0_tx_pll_locked
// bitfield description: o_ehip0_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_o_ehip0_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_o_ehip1_tx_pll_locked
// bitfield description: o_ehip1_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_o_ehip1_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port0_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port0_status_parity_error; // 
reg  sscsrif_hssi_eth_port0_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port0_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port0_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port0_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port0_status_parity_error = (sscsrif_hssi_eth_port0_status_parity_error_hwset ^ sscsrif_hssi_eth_port0_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port0_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port0_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port0_status[3]) begin
      sscsrif_hssi_eth_port0_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port0_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port0_status_parity_error && !we_sscsrif_hssi_eth_port0_status[3]) begin
   	sscsrif_hssi_eth_port0_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port0_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port0_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port0_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port0_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port1_status" */

// sscsrif_hssi_eth_port1_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port1_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port1_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port1_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port1_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port1_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port1_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port1_status_local_fault_status = (sscsrif_hssi_eth_port1_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port1_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port1_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port1_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port1_status[0]) begin
      sscsrif_hssi_eth_port1_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port1_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port1_status_local_fault_status && !we_sscsrif_hssi_eth_port1_status[0]) begin
   	sscsrif_hssi_eth_port1_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port1_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port1_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port1_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port1_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port1_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port1_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port1_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port1_status_remote_fault_status = (sscsrif_hssi_eth_port1_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port1_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port1_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port1_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port1_status[1]) begin
      sscsrif_hssi_eth_port1_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port1_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port1_status_remote_fault_status && !we_sscsrif_hssi_eth_port1_status[1]) begin
   	sscsrif_hssi_eth_port1_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port1_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_o_ehip0_tx_pll_locked
// bitfield description: o_ehip0_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_o_ehip0_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_o_ehip1_tx_pll_locked
// bitfield description: o_ehip1_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_o_ehip1_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port1_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port1_status_parity_error; // 
reg  sscsrif_hssi_eth_port1_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port1_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port1_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port1_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port1_status_parity_error = (sscsrif_hssi_eth_port1_status_parity_error_hwset ^ sscsrif_hssi_eth_port1_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port1_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port1_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port1_status[3]) begin
      sscsrif_hssi_eth_port1_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port1_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port1_status_parity_error && !we_sscsrif_hssi_eth_port1_status[3]) begin
   	sscsrif_hssi_eth_port1_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port1_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port1_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port1_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port1_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port2_status" */

// sscsrif_hssi_eth_port2_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port2_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port2_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port2_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port2_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port2_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port2_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port2_status_local_fault_status = (sscsrif_hssi_eth_port2_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port2_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port2_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port2_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port2_status[0]) begin
      sscsrif_hssi_eth_port2_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port2_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port2_status_local_fault_status && !we_sscsrif_hssi_eth_port2_status[0]) begin
   	sscsrif_hssi_eth_port2_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port2_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port2_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port2_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port2_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port2_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port2_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port2_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port2_status_remote_fault_status = (sscsrif_hssi_eth_port2_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port2_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port2_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port2_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port2_status[1]) begin
      sscsrif_hssi_eth_port2_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port2_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port2_status_remote_fault_status && !we_sscsrif_hssi_eth_port2_status[1]) begin
   	sscsrif_hssi_eth_port2_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port2_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_o_ehip0_tx_pll_locked
// bitfield description: o_ehip0_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_o_ehip0_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_o_ehip1_tx_pll_locked
// bitfield description: o_ehip1_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_o_ehip1_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port2_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port2_status_parity_error; // 
reg  sscsrif_hssi_eth_port2_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port2_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port2_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port2_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port2_status_parity_error = (sscsrif_hssi_eth_port2_status_parity_error_hwset ^ sscsrif_hssi_eth_port2_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port2_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port2_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port2_status[3]) begin
      sscsrif_hssi_eth_port2_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port2_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port2_status_parity_error && !we_sscsrif_hssi_eth_port2_status[3]) begin
   	sscsrif_hssi_eth_port2_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port2_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port2_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port2_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port2_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port3_status" */

// sscsrif_hssi_eth_port3_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port3_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port3_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port3_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port3_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port3_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port3_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port3_status_local_fault_status = (sscsrif_hssi_eth_port3_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port3_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port3_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port3_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port3_status[0]) begin
      sscsrif_hssi_eth_port3_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port3_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port3_status_local_fault_status && !we_sscsrif_hssi_eth_port3_status[0]) begin
   	sscsrif_hssi_eth_port3_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port3_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port3_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port3_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port3_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port3_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port3_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port3_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port3_status_remote_fault_status = (sscsrif_hssi_eth_port3_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port3_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port3_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port3_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port3_status[1]) begin
      sscsrif_hssi_eth_port3_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port3_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port3_status_remote_fault_status && !we_sscsrif_hssi_eth_port3_status[1]) begin
   	sscsrif_hssi_eth_port3_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port3_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_o_ehip0_tx_pll_locked
// bitfield description: o_ehip0_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_o_ehip0_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_o_ehip1_tx_pll_locked
// bitfield description: o_ehip1_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_o_ehip1_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port3_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port3_status_parity_error; // 
reg  sscsrif_hssi_eth_port3_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port3_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port3_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port3_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port3_status_parity_error = (sscsrif_hssi_eth_port3_status_parity_error_hwset ^ sscsrif_hssi_eth_port3_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port3_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port3_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port3_status[3]) begin
      sscsrif_hssi_eth_port3_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port3_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port3_status_parity_error && !we_sscsrif_hssi_eth_port3_status[3]) begin
   	sscsrif_hssi_eth_port3_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port3_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port3_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port3_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port3_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port4_status" */

// sscsrif_hssi_eth_port4_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port4_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port4_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port4_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port4_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port4_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port4_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port4_status_local_fault_status = (sscsrif_hssi_eth_port4_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port4_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port4_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port4_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port4_status[0]) begin
      sscsrif_hssi_eth_port4_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port4_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port4_status_local_fault_status && !we_sscsrif_hssi_eth_port4_status[0]) begin
   	sscsrif_hssi_eth_port4_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port4_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port4_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port4_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port4_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port4_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port4_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port4_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port4_status_remote_fault_status = (sscsrif_hssi_eth_port4_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port4_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port4_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port4_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port4_status[1]) begin
      sscsrif_hssi_eth_port4_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port4_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port4_status_remote_fault_status && !we_sscsrif_hssi_eth_port4_status[1]) begin
   	sscsrif_hssi_eth_port4_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port4_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_o_ehip2_tx_pll_locked
// bitfield description: o_ehip2_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_o_ehip2_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_o_ehip3_tx_pll_locked
// bitfield description: o_ehip3_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_o_ehip3_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port4_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port4_status_parity_error; // 
reg  sscsrif_hssi_eth_port4_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port4_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port4_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port4_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port4_status_parity_error = (sscsrif_hssi_eth_port4_status_parity_error_hwset ^ sscsrif_hssi_eth_port4_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port4_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port4_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port4_status[3]) begin
      sscsrif_hssi_eth_port4_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port4_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port4_status_parity_error && !we_sscsrif_hssi_eth_port4_status[3]) begin
   	sscsrif_hssi_eth_port4_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port4_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port4_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port4_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port4_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port5_status" */

// sscsrif_hssi_eth_port5_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port5_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port5_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port5_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port5_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port5_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port5_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port5_status_local_fault_status = (sscsrif_hssi_eth_port5_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port5_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port5_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port5_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port5_status[0]) begin
      sscsrif_hssi_eth_port5_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port5_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port5_status_local_fault_status && !we_sscsrif_hssi_eth_port5_status[0]) begin
   	sscsrif_hssi_eth_port5_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port5_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port5_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port5_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port5_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port5_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port5_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port5_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port5_status_remote_fault_status = (sscsrif_hssi_eth_port5_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port5_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port5_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port5_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port5_status[1]) begin
      sscsrif_hssi_eth_port5_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port5_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port5_status_remote_fault_status && !we_sscsrif_hssi_eth_port5_status[1]) begin
   	sscsrif_hssi_eth_port5_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port5_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_o_ehip2_tx_pll_locked
// bitfield description: o_ehip2_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_o_ehip2_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_o_ehip3_tx_pll_locked
// bitfield description: o_ehip3_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_o_ehip3_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port5_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port5_status_parity_error; // 
reg  sscsrif_hssi_eth_port5_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port5_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port5_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port5_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port5_status_parity_error = (sscsrif_hssi_eth_port5_status_parity_error_hwset ^ sscsrif_hssi_eth_port5_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port5_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port5_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port5_status[3]) begin
      sscsrif_hssi_eth_port5_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port5_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port5_status_parity_error && !we_sscsrif_hssi_eth_port5_status[3]) begin
   	sscsrif_hssi_eth_port5_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port5_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port5_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port5_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port5_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port6_status" */

// sscsrif_hssi_eth_port6_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port6_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port6_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port6_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port6_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port6_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port6_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port6_status_local_fault_status = (sscsrif_hssi_eth_port6_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port6_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port6_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port6_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port6_status[0]) begin
      sscsrif_hssi_eth_port6_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port6_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port6_status_local_fault_status && !we_sscsrif_hssi_eth_port6_status[0]) begin
   	sscsrif_hssi_eth_port6_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port6_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port6_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port6_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port6_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port6_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port6_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port6_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port6_status_remote_fault_status = (sscsrif_hssi_eth_port6_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port6_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port6_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port6_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port6_status[1]) begin
      sscsrif_hssi_eth_port6_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port6_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port6_status_remote_fault_status && !we_sscsrif_hssi_eth_port6_status[1]) begin
   	sscsrif_hssi_eth_port6_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port6_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_o_ehip2_tx_pll_locked
// bitfield description: o_ehip2_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_o_ehip2_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_o_ehip3_tx_pll_locked
// bitfield description: o_ehip3_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_o_ehip3_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port6_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port6_status_parity_error; // 
reg  sscsrif_hssi_eth_port6_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port6_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port6_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port6_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port6_status_parity_error = (sscsrif_hssi_eth_port6_status_parity_error_hwset ^ sscsrif_hssi_eth_port6_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port6_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port6_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port6_status[3]) begin
      sscsrif_hssi_eth_port6_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port6_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port6_status_parity_error && !we_sscsrif_hssi_eth_port6_status[3]) begin
   	sscsrif_hssi_eth_port6_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port6_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port6_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port6_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port6_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port7_status" */

// sscsrif_hssi_eth_port7_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port7_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port7_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port7_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port7_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port7_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port7_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port7_status_local_fault_status = (sscsrif_hssi_eth_port7_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port7_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port7_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port7_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port7_status[0]) begin
      sscsrif_hssi_eth_port7_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port7_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port7_status_local_fault_status && !we_sscsrif_hssi_eth_port7_status[0]) begin
   	sscsrif_hssi_eth_port7_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port7_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port7_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port7_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port7_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port7_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port7_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port7_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port7_status_remote_fault_status = (sscsrif_hssi_eth_port7_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port7_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port7_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port7_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port7_status[1]) begin
      sscsrif_hssi_eth_port7_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port7_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port7_status_remote_fault_status && !we_sscsrif_hssi_eth_port7_status[1]) begin
   	sscsrif_hssi_eth_port7_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port7_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_o_ehip2_tx_pll_locked
// bitfield description: o_ehip2_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_o_ehip2_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_o_ehip3_tx_pll_locked
// bitfield description: o_ehip3_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_o_ehip3_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port7_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port7_status_parity_error; // 
reg  sscsrif_hssi_eth_port7_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port7_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port7_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port7_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port7_status_parity_error = (sscsrif_hssi_eth_port7_status_parity_error_hwset ^ sscsrif_hssi_eth_port7_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port7_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port7_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port7_status[3]) begin
      sscsrif_hssi_eth_port7_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port7_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port7_status_parity_error && !we_sscsrif_hssi_eth_port7_status[3]) begin
   	sscsrif_hssi_eth_port7_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port7_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port7_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port7_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port7_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port8_status" */

// sscsrif_hssi_eth_port8_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port8_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port8_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port8_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port8_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port8_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port8_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port8_status_local_fault_status = (sscsrif_hssi_eth_port8_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port8_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port8_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port8_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port8_status[0]) begin
      sscsrif_hssi_eth_port8_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port8_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port8_status_local_fault_status && !we_sscsrif_hssi_eth_port8_status[0]) begin
   	sscsrif_hssi_eth_port8_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port8_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port8_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port8_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port8_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port8_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port8_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port8_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port8_status_remote_fault_status = (sscsrif_hssi_eth_port8_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port8_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port8_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port8_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port8_status[1]) begin
      sscsrif_hssi_eth_port8_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port8_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port8_status_remote_fault_status && !we_sscsrif_hssi_eth_port8_status[1]) begin
   	sscsrif_hssi_eth_port8_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port8_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_o_ehip4_tx_pll_locked
// bitfield description: o_ehip4_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_o_ehip4_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_o_ehip5_tx_pll_locked
// bitfield description: o_ehip5_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_o_ehip5_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port8_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port8_status_parity_error; // 
reg  sscsrif_hssi_eth_port8_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port8_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port8_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port8_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port8_status_parity_error = (sscsrif_hssi_eth_port8_status_parity_error_hwset ^ sscsrif_hssi_eth_port8_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port8_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port8_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port8_status[3]) begin
      sscsrif_hssi_eth_port8_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port8_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port8_status_parity_error && !we_sscsrif_hssi_eth_port8_status[3]) begin
   	sscsrif_hssi_eth_port8_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port8_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port8_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port8_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port8_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port9_status" */

// sscsrif_hssi_eth_port9_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port9_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port9_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port9_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port9_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port9_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port9_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port9_status_local_fault_status = (sscsrif_hssi_eth_port9_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port9_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port9_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port9_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port9_status[0]) begin
      sscsrif_hssi_eth_port9_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port9_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port9_status_local_fault_status && !we_sscsrif_hssi_eth_port9_status[0]) begin
   	sscsrif_hssi_eth_port9_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port9_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port9_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port9_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port9_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port9_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port9_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port9_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port9_status_remote_fault_status = (sscsrif_hssi_eth_port9_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port9_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port9_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port9_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port9_status[1]) begin
      sscsrif_hssi_eth_port9_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port9_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port9_status_remote_fault_status && !we_sscsrif_hssi_eth_port9_status[1]) begin
   	sscsrif_hssi_eth_port9_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port9_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_o_ehip4_tx_pll_locked
// bitfield description: o_ehip4_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_o_ehip4_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_o_ehip5_tx_pll_locked
// bitfield description: o_ehip5_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_o_ehip5_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port9_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port9_status_parity_error; // 
reg  sscsrif_hssi_eth_port9_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port9_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port9_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port9_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port9_status_parity_error = (sscsrif_hssi_eth_port9_status_parity_error_hwset ^ sscsrif_hssi_eth_port9_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port9_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port9_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port9_status[3]) begin
      sscsrif_hssi_eth_port9_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port9_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port9_status_parity_error && !we_sscsrif_hssi_eth_port9_status[3]) begin
   	sscsrif_hssi_eth_port9_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port9_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port9_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port9_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port9_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port10_status" */

// sscsrif_hssi_eth_port10_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port10_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port10_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port10_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port10_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port10_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port10_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port10_status_local_fault_status = (sscsrif_hssi_eth_port10_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port10_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port10_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port10_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port10_status[0]) begin
      sscsrif_hssi_eth_port10_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port10_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port10_status_local_fault_status && !we_sscsrif_hssi_eth_port10_status[0]) begin
   	sscsrif_hssi_eth_port10_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port10_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port10_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port10_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port10_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port10_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port10_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port10_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port10_status_remote_fault_status = (sscsrif_hssi_eth_port10_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port10_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port10_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port10_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port10_status[1]) begin
      sscsrif_hssi_eth_port10_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port10_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port10_status_remote_fault_status && !we_sscsrif_hssi_eth_port10_status[1]) begin
   	sscsrif_hssi_eth_port10_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port10_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_o_ehip4_tx_pll_locked
// bitfield description: o_ehip4_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_o_ehip4_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_o_ehip5_tx_pll_locked
// bitfield description: o_ehip5_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_o_ehip5_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port10_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port10_status_parity_error; // 
reg  sscsrif_hssi_eth_port10_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port10_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port10_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port10_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port10_status_parity_error = (sscsrif_hssi_eth_port10_status_parity_error_hwset ^ sscsrif_hssi_eth_port10_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port10_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port10_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port10_status[3]) begin
      sscsrif_hssi_eth_port10_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port10_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port10_status_parity_error && !we_sscsrif_hssi_eth_port10_status[3]) begin
   	sscsrif_hssi_eth_port10_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port10_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port10_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port10_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port10_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port11_status" */

// sscsrif_hssi_eth_port11_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port11_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port11_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port11_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port11_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port11_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port11_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port11_status_local_fault_status = (sscsrif_hssi_eth_port11_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port11_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port11_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port11_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port11_status[0]) begin
      sscsrif_hssi_eth_port11_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port11_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port11_status_local_fault_status && !we_sscsrif_hssi_eth_port11_status[0]) begin
   	sscsrif_hssi_eth_port11_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port11_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port11_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port11_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port11_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port11_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port11_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port11_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port11_status_remote_fault_status = (sscsrif_hssi_eth_port11_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port11_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port11_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port11_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port11_status[1]) begin
      sscsrif_hssi_eth_port11_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port11_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port11_status_remote_fault_status && !we_sscsrif_hssi_eth_port11_status[1]) begin
   	sscsrif_hssi_eth_port11_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port11_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_o_ehip4_tx_pll_locked
// bitfield description: o_ehip4_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_o_ehip4_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_o_ehip5_tx_pll_locked
// bitfield description: o_ehip5_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_o_ehip5_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port11_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port11_status_parity_error; // 
reg  sscsrif_hssi_eth_port11_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port11_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port11_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port11_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port11_status_parity_error = (sscsrif_hssi_eth_port11_status_parity_error_hwset ^ sscsrif_hssi_eth_port11_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port11_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port11_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port11_status[3]) begin
      sscsrif_hssi_eth_port11_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port11_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port11_status_parity_error && !we_sscsrif_hssi_eth_port11_status[3]) begin
   	sscsrif_hssi_eth_port11_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port11_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port11_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port11_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port11_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port12_status" */

// sscsrif_hssi_eth_port12_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port12_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port12_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port12_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port12_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port12_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port12_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port12_status_local_fault_status = (sscsrif_hssi_eth_port12_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port12_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port12_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port12_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port12_status[0]) begin
      sscsrif_hssi_eth_port12_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port12_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port12_status_local_fault_status && !we_sscsrif_hssi_eth_port12_status[0]) begin
   	sscsrif_hssi_eth_port12_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port12_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port12_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port12_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port12_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port12_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port12_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port12_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port12_status_remote_fault_status = (sscsrif_hssi_eth_port12_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port12_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port12_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port12_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port12_status[1]) begin
      sscsrif_hssi_eth_port12_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port12_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port12_status_remote_fault_status && !we_sscsrif_hssi_eth_port12_status[1]) begin
   	sscsrif_hssi_eth_port12_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port12_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_o_ehip6_tx_pll_locked
// bitfield description: o_ehip6_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_o_ehip6_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_o_ehip7_tx_pll_locked
// bitfield description: o_ehip7_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_o_ehip7_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port12_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port12_status_parity_error; // 
reg  sscsrif_hssi_eth_port12_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port12_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port12_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port12_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port12_status_parity_error = (sscsrif_hssi_eth_port12_status_parity_error_hwset ^ sscsrif_hssi_eth_port12_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port12_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port12_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port12_status[3]) begin
      sscsrif_hssi_eth_port12_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port12_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port12_status_parity_error && !we_sscsrif_hssi_eth_port12_status[3]) begin
   	sscsrif_hssi_eth_port12_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port12_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port12_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port12_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port12_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port13_status" */

// sscsrif_hssi_eth_port13_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port13_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port13_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port13_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port13_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port13_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port13_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port13_status_local_fault_status = (sscsrif_hssi_eth_port13_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port13_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port13_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port13_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port13_status[0]) begin
      sscsrif_hssi_eth_port13_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port13_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port13_status_local_fault_status && !we_sscsrif_hssi_eth_port13_status[0]) begin
   	sscsrif_hssi_eth_port13_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port13_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port13_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port13_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port13_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port13_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port13_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port13_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port13_status_remote_fault_status = (sscsrif_hssi_eth_port13_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port13_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port13_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port13_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port13_status[1]) begin
      sscsrif_hssi_eth_port13_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port13_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port13_status_remote_fault_status && !we_sscsrif_hssi_eth_port13_status[1]) begin
   	sscsrif_hssi_eth_port13_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port13_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_o_ehip6_tx_pll_locked
// bitfield description: o_ehip6_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_o_ehip6_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_o_ehip7_tx_pll_locked
// bitfield description: o_ehip7_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_o_ehip7_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port13_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port13_status_parity_error; // 
reg  sscsrif_hssi_eth_port13_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port13_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port13_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port13_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port13_status_parity_error = (sscsrif_hssi_eth_port13_status_parity_error_hwset ^ sscsrif_hssi_eth_port13_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port13_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port13_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port13_status[3]) begin
      sscsrif_hssi_eth_port13_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port13_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port13_status_parity_error && !we_sscsrif_hssi_eth_port13_status[3]) begin
   	sscsrif_hssi_eth_port13_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port13_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port13_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port13_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port13_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port14_status" */

// sscsrif_hssi_eth_port14_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port14_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port14_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port14_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port14_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port14_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port14_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port14_status_local_fault_status = (sscsrif_hssi_eth_port14_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port14_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port14_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port14_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port14_status[0]) begin
      sscsrif_hssi_eth_port14_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port14_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port14_status_local_fault_status && !we_sscsrif_hssi_eth_port14_status[0]) begin
   	sscsrif_hssi_eth_port14_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port14_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port14_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port14_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port14_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port14_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port14_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port14_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port14_status_remote_fault_status = (sscsrif_hssi_eth_port14_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port14_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port14_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port14_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port14_status[1]) begin
      sscsrif_hssi_eth_port14_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port14_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port14_status_remote_fault_status && !we_sscsrif_hssi_eth_port14_status[1]) begin
   	sscsrif_hssi_eth_port14_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port14_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_o_ehip6_tx_pll_locked
// bitfield description: o_ehip6_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_o_ehip6_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_o_ehip7_tx_pll_locked
// bitfield description: o_ehip7_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_o_ehip7_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port14_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port14_status_parity_error; // 
reg  sscsrif_hssi_eth_port14_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port14_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port14_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port14_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port14_status_parity_error = (sscsrif_hssi_eth_port14_status_parity_error_hwset ^ sscsrif_hssi_eth_port14_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port14_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port14_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port14_status[3]) begin
      sscsrif_hssi_eth_port14_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port14_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port14_status_parity_error && !we_sscsrif_hssi_eth_port14_status[3]) begin
   	sscsrif_hssi_eth_port14_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port14_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port14_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port14_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port14_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_eth_port15_status" */

// sscsrif_hssi_eth_port15_status_o_ehip_ready
// bitfield description: o_ehip_ready:
// The Ethernet channel deasserts this signal in response to an i_csr_rst_n or i_tx_rst_n reset, or either of the corresponding soft resets. After the reset process completes, the channel reasserts this signal to indicate that the Hard IP for Ethernet block has completed initialization and is ready to interoperate with the main Intel Stratix 10 die. While the o_ehip_ready signal is low, the channel's datapath is not ready for data on the client interface nor ready for register accesses on the Ethernet reconfiguration interface.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_o_ehip_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_o_rx_hi_ber
// bitfield description: o_rx_hi_ber:
// Asserted to indicate the RX PCS of the corresponding Ethernet channel is in a HI BER state according to Figure 82-15 in the IEEE 802.3- 2015 Standard. The IP core uses this signal in autonegotiation and link training.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_o_rx_hi_ber_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_o_cdr_lock
// bitfield description: o_cdr_lock:
// Indicates that the recovered clocks are locked to data. The o_clk_rec_div64[n] and o_clk_rec_div66[n] clocks are reliable only after o_cdr_lock[n] is asserted.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_o_cdr_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_rx_am_lock
// bitfield description: rx_am_lock:
// Asserted when the RX PCS completes detection of alignment markers and deskew of the virtual PCS lanes in the corresponding Ethernet 100G channel.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_rx_am_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_rx_block_lock
// bitfield description: rx_block_lock:
// Asserted when the corresponding Ethernet channel completes 66-bit block boundary alignment on all PCS lanes. Each channel has its own block lock signal.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_rx_block_lock_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_link_fault_gen_en
// bitfield description: link_fault_gen_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_link_fault_gen_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_unidirectional_en
// bitfield description: unidirectional_en:
// Asserted if the IP core includes Clause 66 for unidirectional support. This signal is available if you turn on Enable link fault generation in the parameter editor.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_unidirectional_en_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_local_fault_status
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_local_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port15_status_local_fault_status_hwset" 

reg  sscsrif_hssi_eth_port15_status_local_fault_status; // 
reg  sscsrif_hssi_eth_port15_status_local_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port15_status_local_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port15_status_local_fault_status_hwset_sync <=  sscsrif_hssi_eth_port15_status_local_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port15_status_local_fault_status = (sscsrif_hssi_eth_port15_status_local_fault_status_hwset ^ sscsrif_hssi_eth_port15_status_local_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port15_status_local_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port15_status_local_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port15_status[0]) begin
      sscsrif_hssi_eth_port15_status_local_fault_status <= ~din[7] & sscsrif_hssi_eth_port15_status_local_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port15_status_local_fault_status && !we_sscsrif_hssi_eth_port15_status[0]) begin
   	sscsrif_hssi_eth_port15_status_local_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port15_status_remote_fault_status
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_remote_fault_status_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port15_status_remote_fault_status_hwset" 

reg  sscsrif_hssi_eth_port15_status_remote_fault_status; // 
reg  sscsrif_hssi_eth_port15_status_remote_fault_status_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port15_status_remote_fault_status_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port15_status_remote_fault_status_hwset_sync <=  sscsrif_hssi_eth_port15_status_remote_fault_status_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port15_status_remote_fault_status = (sscsrif_hssi_eth_port15_status_remote_fault_status_hwset ^ sscsrif_hssi_eth_port15_status_remote_fault_status_hwset_sync) & ~(sscsrif_hssi_eth_port15_status_remote_fault_status_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port15_status_remote_fault_status <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port15_status[1]) begin
      sscsrif_hssi_eth_port15_status_remote_fault_status <= ~din[8] & sscsrif_hssi_eth_port15_status_remote_fault_status; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port15_status_remote_fault_status && !we_sscsrif_hssi_eth_port15_status[1]) begin
   	sscsrif_hssi_eth_port15_status_remote_fault_status<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_eth_port15_status_unidirectional_force_remote_fault
// bitfield description: unidirectional_force_remote_fault:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 2.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_unidirectional_force_remote_fault_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_unidirectional_remote_fault_dis
// bitfield description: unidirectional_remote_fault_dis:
// When asserted, this signal indicates the state of the tx_unidir_control register bit 1.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_unidirectional_remote_fault_dis_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_pcs_eccstatus
// bitfield description: pcs_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error Only applicable for TSE_PCS profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_pcs_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_mac_eccstatus
// bitfield description: mac_eccstatus[1:0]:
// Indicates the ECC status. This signal is synchronized to the reg_clk clock domain. 11: An uncorrectable error occurred and the error data appears at the output. 10: A correctable error occurred and the error has been corrected at the output. However, the memory array has not been updated. 01: Not valid. 00: No error. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_mac_eccstatus_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_set_10
// bitfield description: set_10:
// 10 Mbps selection. Can be driven to 1 by an external device, for example a PHY device, to indicate that the MAC function is connected to a 10-Mbps PHY device. When set to 0, the MAC function is set to operate in 100-Mbps or gigabit mode. This signal is ignored when the ETH_SPEED or ENA_10 bit in the command_config register is set to 1. The ENA_10 bit has a higher priority than this signal. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_set_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_set_1000
// bitfield description: set_1000:
// Gigabit mode selection. Can be driven to 1 by an external device, for example a PHY device, to set the MAC function to operate in gigabit. When set to 0, the MAC is set to operate in 10/100 Mbps. This signal is ignored when the ETH_SPEED bit in the command_config register is set to 1. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_set_1000_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_ena_10
// bitfield description: ena_10:
// 10 Mbps enable. This signal is set to 1 to indicate that the PHY interface should operate at 10 Mbps. Valid only when the eth_mode signal is set to 0. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_ena_10_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_eth_mode
// bitfield description: eth_mode:
// Ethernet mode. This signal is set to 1 when the MAC function is configured to operate at 1000 Mbps; set to 0 when it is configured to operate at 10/100 Mbps. Only applicable for TSE_MAC profile. Reserved for other profiles.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_eth_mode_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_load_recipe_err
// bitfield description: load_recipe_err:
// Load Recipe Error Status.This bit reports the error status of load PMA recipe at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_load_recipe_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_cal_err
// bitfield description: cal_err:
// Calibration Error Status.This bit reports the error status of ical/pcal at power on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_cal_err_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_tx_lanes_stable
// bitfield description: Tx_lanes_stable:
// Asserted when physical TX lanes are stable and ready to transmit data for the corresponding Ethernet port.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_tx_lanes_stable_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_rx_pcs_ready
// bitfield description: Rx_pcs_ready:
// Asserted when the RX lanes of the corresponding Ethernet port are fully aligned and ready to receive data.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_rx_pcs_ready_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_tx_pll_locked
// bitfield description: Tx_pll_locked: 
// Tx Ethernet port pll lock
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_o_ehip6_tx_pll_locked
// bitfield description: o_ehip6_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_o_ehip6_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_o_ehip7_tx_pll_locked
// bitfield description: o_ehip7_tx_pll_locked: 
// PTP channels Tx_pll_locked (o_ehip{0..NUM_PORT/2}_tx_pll_locked, applicable only in E-tile.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_o_ehip7_tx_pll_locked_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_parity_error
// bitfield description: Parity Error on received packet
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_parity_error_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_eth_port15_status_parity_error_hwset" 

reg  sscsrif_hssi_eth_port15_status_parity_error; // 
reg  sscsrif_hssi_eth_port15_status_parity_error_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_eth_port15_status_parity_error_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_eth_port15_status_parity_error_hwset_sync <=  sscsrif_hssi_eth_port15_status_parity_error_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_eth_port15_status_parity_error = (sscsrif_hssi_eth_port15_status_parity_error_hwset ^ sscsrif_hssi_eth_port15_status_parity_error_hwset_sync) & ~(sscsrif_hssi_eth_port15_status_parity_error_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_eth_port15_status_parity_error <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_eth_port15_status[3]) begin
      sscsrif_hssi_eth_port15_status_parity_error <= ~din[26] & sscsrif_hssi_eth_port15_status_parity_error; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_eth_port15_status_parity_error && !we_sscsrif_hssi_eth_port15_status[3]) begin
   	sscsrif_hssi_eth_port15_status_parity_error<=  1'b1; // hw to set
   end
end
// sscsrif_hssi_eth_port15_status_local_fault_status_direct
// bitfield description: local_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a local fault: the RX PCS detected a problem that prevents it from receiving data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional or Unidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir or lf_unidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_local_fault_status_direct_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_eth_port15_status_remote_fault_status_direct
// bitfield description: remote_fault_status:
// Asserted when the RX MAC of the corresponding Ethernet channel detects a remote fault: the remote link partner sent remote fault ordered sets indicating that it is unable to receive data. This signal is functional only if you set the Choose Link Fault generation option parameter to the value of Bidirectional in the parameter editor or if you overwrite the parameter editor parameter by setting the link_fault_mode RTL parameter to the value of lf_bidir.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_eth_port15_status_remote_fault_status_direct_i 
// outputPort:  "" 
// NO register generated

// sscsrif_hssi_eth_port15_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_tse_ctrl" */

// sscsrif_hssi_tse_ctrl_Magic_wakeup
// bitfield description: Magic_wakeup:
// If the MAC function is in the power-down state, the MAC function asserts this signal to indicate that a magic packet has been detected and the node is requested to restore its normal frame reception mode. This signal is present only if the Enable magic packet detection option is turned on.
// customType:  RO
// hwAccess: WO 
// reset value : 0x0 
// inputPort: sscsrif_hssi_tse_ctrl_Magic_wakeup_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_tse_ctrl_Magic_sleep_n
// bitfield description: Magic_sleep_n:
// Assert this active-low signal to put the node into a power-down state. If magic packets are supported (the MAGIC_ENA bit in the command_config register is set to 1), the receiver logic stops writing data to the receive FIFO buffer and the magic packet detection logic is enabled. Setting this signal to 1 restores the normal frame reception mode. This signal is present only if the Enable magic packet detection option is turned on.
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_tse_ctrl_Magic_sleep_n <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_tse_ctrl) begin 
      sscsrif_hssi_tse_ctrl_Magic_sleep_n   <=  din[1];  //
   end
end

// sscsrif_hssi_tse_ctrl_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_debug_ctrl" */

// sscsrif_hssi_debug_ctrl_override_led_speed
// bitfield description: Override value for portN_led_speed[2:0], used for debug and testing.
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_debug_ctrl_override_led_speed <= 3'h0;
   end
   else begin
   if (we_sscsrif_hssi_debug_ctrl[0]) begin 
      sscsrif_hssi_debug_ctrl_override_led_speed[2:0]   <=  din[2:0];  //
   end
end

// sscsrif_hssi_debug_ctrl_override_led_status
// bitfield description: Override value for portN_led_status[5:3], used for debug and testing
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_debug_ctrl_override_led_status <= 3'h0;
   end
   else begin
   if (we_sscsrif_hssi_debug_ctrl[0]) begin 
      sscsrif_hssi_debug_ctrl_override_led_status[2:0]   <=  din[5:3];  //
   end
end

// sscsrif_hssi_debug_ctrl_port_led_status_override
// bitfield description: Port N LED status override:
// Select which port to override the LED status interface signals. LED status override bit must be set to 1 together with Port N LED status override ports and values to take effect. 4'b1111 - port 15 : 4'b0000 - port 0.
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_debug_ctrl_port_led_status_override <= 4'h0;
   end
   else begin
   if (we_sscsrif_hssi_debug_ctrl[0]) begin 
      sscsrif_hssi_debug_ctrl_port_led_status_override[1:0]   <=  din[7:6];  //
   end
   if (we_sscsrif_hssi_debug_ctrl[1]) begin 
      sscsrif_hssi_debug_ctrl_port_led_status_override[3:2]   <=  din[9:8];  //
   end
end

// sscsrif_hssi_debug_ctrl_led_status_override_enable
// bitfield description: LED status override enable: 
// Enable the LED status interface signals override.
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_debug_ctrl_led_status_override_enable <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_debug_ctrl[1]) begin 
      sscsrif_hssi_debug_ctrl_led_status_override_enable   <=  din[10];  //
   end
end

// sscsrif_hssi_debug_ctrl_led_status_blinking_timer
// bitfield description: LED status signal blinking timer (in terms of 10ms)
// customType:  RW
// hwAccess: RO 
// reset value : 0x31 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_debug_ctrl_led_status_blinking_timer <= 8'h31;
   end
   else begin
   if (we_sscsrif_hssi_debug_ctrl[1]) begin 
      sscsrif_hssi_debug_ctrl_led_status_blinking_timer[4:0]   <=  din[15:11];  //
   end
   if (we_sscsrif_hssi_debug_ctrl[2]) begin 
      sscsrif_hssi_debug_ctrl_led_status_blinking_timer[7:5]   <=  din[18:16];  //
   end
end

// sscsrif_hssi_debug_ctrl_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_hotplug_debug_ctrl" */

// sscsrif_hssi_hotplug_debug_ctrl_hotplug_control
// bitfield description: Hotplug control bits used for debug and testing.
// customType:  RW
// hwAccess: RO 
// reset value : 0x9c400000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_hotplug_debug_ctrl_hotplug_control <= 32'h9c400000;
   end
   else begin
   if (we_sscsrif_hssi_hotplug_debug_ctrl[0]) begin 
      sscsrif_hssi_hotplug_debug_ctrl_hotplug_control[7:0]   <=  din[7:0];  //
   end
   if (we_sscsrif_hssi_hotplug_debug_ctrl[1]) begin 
      sscsrif_hssi_hotplug_debug_ctrl_hotplug_control[15:8]   <=  din[15:8];  //
   end
   if (we_sscsrif_hssi_hotplug_debug_ctrl[2]) begin 
      sscsrif_hssi_hotplug_debug_ctrl_hotplug_control[23:16]   <=  din[23:16];  //
   end
   if (we_sscsrif_hssi_hotplug_debug_ctrl[3]) begin 
      sscsrif_hssi_hotplug_debug_ctrl_hotplug_control[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "sscsrif_hssi_hotplug_debug_sts" */

// sscsrif_hssi_hotplug_debug_sts_hotplug_status
// bitfield description: Hotplug module status.
// customType:  RO
// hwAccess: WO 
// reset value : 0x00 
// inputPort: sscsrif_hssi_hotplug_debug_sts_hotplug_status_i 
// outputPort:  "" 
// NO register generated




// sscsrif_hssi_hotplug_debug_sts_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x000000 
// NO register generated


/* Definitions of REGISTER "sscsrif_hssi_general_status" */

// sscsrif_hssi_general_status_ecc_error_m20k_sal_nios
// bitfield description: ECC error on M20K 
// 1'b1 - ECC error detected
// 1'b0 - No ECC error detected
// [0:0] - SAL NIOS M20K Error
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset" 

reg  sscsrif_hssi_general_status_ecc_error_m20k_sal_nios; // 
reg  sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset_sync <=  sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_general_status_ecc_error_m20k_sal_nios = (sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset ^ sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset_sync) & ~(sscsrif_hssi_general_status_ecc_error_m20k_sal_nios_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_general_status_ecc_error_m20k_sal_nios <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_general_status) begin
      sscsrif_hssi_general_status_ecc_error_m20k_sal_nios <= ~din[0] & sscsrif_hssi_general_status_ecc_error_m20k_sal_nios; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_general_status_ecc_error_m20k_sal_nios && !we_sscsrif_hssi_general_status) begin
   	sscsrif_hssi_general_status_ecc_error_m20k_sal_nios<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_general_status_ecc_error_m20k_avst
// bitfield description: ECC error on M20K 
// 1'b1 - ECC error detected
// 1'b0 - No ECC error detected
// [1:1] - AVST Bridge M20K Error (M20K ECC status from all active ports OR together)
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset" 

reg  sscsrif_hssi_general_status_ecc_error_m20k_avst; // 
reg  sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset_sync <=  sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_general_status_ecc_error_m20k_avst = (sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset ^ sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset_sync) & ~(sscsrif_hssi_general_status_ecc_error_m20k_avst_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_general_status_ecc_error_m20k_avst <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_general_status) begin
      sscsrif_hssi_general_status_ecc_error_m20k_avst <= ~din[1] & sscsrif_hssi_general_status_ecc_error_m20k_avst; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_general_status_ecc_error_m20k_avst && !we_sscsrif_hssi_general_status) begin
   	sscsrif_hssi_general_status_ecc_error_m20k_avst<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_general_status_ecc_error_m20k_jtag
// bitfield description: ECC error on M20K 
// 1'b1 - ECC error detected
// 1'b0 - No ECC error detected
// [2:2] - JTAG Avalon Master M20K Error
// customType:  W1C
// hwAccess: WOS 
// reset value : 0x0 
// inputPort: sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset 
// outputPort:  "" 
// hardware set:  "sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset" 

reg  sscsrif_hssi_general_status_ecc_error_m20k_jtag; // 
reg  sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset_sync;
always @( negedge  reset_n , posedge clk)
   if (!reset_n)  begin
       sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset_sync <= 1'h0;
   end else begin
       sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset_sync <=  sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset;
   end

wire hw_we_hwset_sscsrif_hssi_general_status_ecc_error_m20k_jtag = (sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset ^ sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset_sync) & ~(sscsrif_hssi_general_status_ecc_error_m20k_jtag_hwset ^ 1'b1);

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      sscsrif_hssi_general_status_ecc_error_m20k_jtag <= 1'h0;
   end
   else begin
   if (we_sscsrif_hssi_general_status) begin
      sscsrif_hssi_general_status_ecc_error_m20k_jtag <= ~din[2] & sscsrif_hssi_general_status_ecc_error_m20k_jtag; // 1 to clear
   end
   else if (hw_we_hwset_sscsrif_hssi_general_status_ecc_error_m20k_jtag && !we_sscsrif_hssi_general_status) begin
   	sscsrif_hssi_general_status_ecc_error_m20k_jtag<=  1'b1; // hw to set
   end
end

// sscsrif_hssi_general_status_rsvd
// bitfield description: Reserved
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated




// read process
always @ (*)
begin
rdata_comb = 32'h00000000;
   if(re) begin
      case (addr)  
	9'h000 : begin
		rdata_comb [11:0]	= sscsrif_dfh_lo_feature_id_i [11:0] ;		// readType = read   writeType =illegal
		rdata_comb [15:12]	= sscsrif_dfh_lo_feature_rev_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= sscsrif_dfh_lo_dfh_byte_offset_i [15:0] ;		// readType = read   writeType =illegal
	end
	9'h004 : begin
		rdata_comb [7:0]	= sscsrif_dfh_hi_dfh_byte_offset_i [7:0] ;		// readType = read   writeType =illegal
		rdata_comb [8]	= sscsrif_dfh_hi_end_of_list_i  ;		// readType = read   writeType =illegal
		rdata_comb [15:9]	= 7'h00 ;  // sscsrif_dfh_hi_rsvd 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [19:16]	= sscsrif_dfh_hi_feature_minor_revision_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [27:20]	= sscsrif_dfh_hi_dfh_version_i [7:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:28]	= sscsrif_dfh_hi_feature_type_i [3:0] ;		// readType = read   writeType =illegal
	end
	9'h008 : begin
		rdata_comb [31:0]	= sscsrif_feature_guid_l_low_low_guid_i [31:0] ;		// readType = read   writeType =illegal
	end
	9'h00c : begin
		rdata_comb [31:0]	= sscsrif_feature_guid_l_high_low_guid_i [31:0] ;		// readType = read   writeType =illegal
	end
	9'h010 : begin
		rdata_comb [31:0]	= sscsrif_feature_guid_h_low_high_guid_i [31:0] ;		// readType = read   writeType =illegal
	end
	9'h014 : begin
		rdata_comb [31:0]	= sscsrif_feature_guid_h_high_high_guid_i [31:0] ;		// readType = read   writeType =illegal
	end
	9'h018 : begin
		rdata_comb [0]	= sscsrif_csr_addr_l_csr_rel_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:1]	= sscsrif_csr_addr_l_feature_csr_i [30:0] ;		// readType = read   writeType =illegal
	end
	9'h01c : begin
		rdata_comb [31:0]	= sscsrif_csr_addr_h_feature_csr_i [31:0] ;		// readType = read   writeType =illegal
	end
	9'h020 : begin
		rdata_comb [15:0]	= sscsrif_csr_size_grp_l_instance_id_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [30:16]	= sscsrif_csr_size_grp_l_grouping_id_i [14:0] ;		// readType = read   writeType =illegal
		rdata_comb [31]	= sscsrif_csr_size_grp_l_has_params_i  ;		// readType = read   writeType =illegal
	end
	9'h024 : begin
		rdata_comb [31:0]	= sscsrif_csr_size_grp_h_csr_size_i [31:0] ;		// readType = read   writeType =illegal
	end
	9'h060 : begin
		rdata_comb [7:0]	= 8'h00 ;  // sscsrif_version_rsvd 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:8]	= sscsrif_version_min_ver_i [7:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:16]	= sscsrif_version_maj_ver_i [15:0] ;		// readType = read   writeType =illegal
	end
	9'h064 : begin
		rdata_comb [0]	= sscsrif_feature_list_axi4_support_i  ;		// readType = read   writeType =illegal
		rdata_comb [5:1]	= sscsrif_feature_list_hssi_num_ports_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21:6]	= sscsrif_feature_list_physical_port_enable_i [15:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:22]	= 10'h000 ;  // sscsrif_feature_list_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h068 : begin
		rdata_comb [5:0]	= sscsrif_port0_param_port_0_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port0_param_port_0_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port0_param_port_0_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port0_param_port_0_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port0_param_port_0_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port0_param_port_0_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port0_param_port_0_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port0_param_port_0_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port0_param_port_0_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port0_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h06c : begin
		rdata_comb [5:0]	= sscsrif_port1_param_port_1_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port1_param_port_1_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port1_param_port_1_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port1_param_port_1_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port1_param_port_1_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port1_param_port_1_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port1_param_port_1_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port1_param_port_1_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port1_param_port_1_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port1_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h070 : begin
		rdata_comb [5:0]	= sscsrif_port2_param_port_2_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port2_param_port_2_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port2_param_port_2_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port2_param_port_2_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port2_param_port_2_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port2_param_port_2_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port2_param_port_2_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port2_param_port_2_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port2_param_port_2_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port2_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h074 : begin
		rdata_comb [5:0]	= sscsrif_port3_param_port_3_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port3_param_port_3_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port3_param_port_3_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port3_param_port_3_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port3_param_port_3_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port3_param_port_3_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port3_param_port_3_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port3_param_port_3_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port3_param_port_3_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port3_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h078 : begin
		rdata_comb [5:0]	= sscsrif_port4_param_port_4_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port4_param_port_4_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port4_param_port_4_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port4_param_port_4_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port4_param_port_4_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port4_param_port_4_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port4_param_port_4_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port4_param_port_4_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port4_param_port_4_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port4_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h07c : begin
		rdata_comb [5:0]	= sscsrif_port5_param_port_5_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port5_param_port_5_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port5_param_port_5_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port5_param_port_5_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port5_param_port_5_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port5_param_port_5_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port5_param_port_5_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port5_param_port_5_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port5_param_port_5_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port5_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h080 : begin
		rdata_comb [5:0]	= sscsrif_port6_param_port_6_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port6_param_port_6_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port6_param_port_6_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port6_param_port_6_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port6_param_port_6_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port6_param_port_6_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port6_param_port_6_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port6_param_port_6_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port6_param_port_6_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port6_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h084 : begin
		rdata_comb [5:0]	= sscsrif_port7_param_port_7_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port7_param_port_7_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port7_param_port_7_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port7_param_port_7_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port7_param_port_7_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port7_param_port_7_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port7_param_port_7_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port7_param_port_7_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port7_param_port_7_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port7_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h088 : begin
		rdata_comb [5:0]	= sscsrif_port8_param_port_8_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port8_param_port_8_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port8_param_port_8_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port8_param_port_8_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port8_param_port_8_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port8_param_port_8_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port8_param_port_8_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port8_param_port_8_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port8_param_port_8_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port8_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h08c : begin
		rdata_comb [5:0]	= sscsrif_port9_param_port_9_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port9_param_port_9_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port9_param_port_9_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port9_param_port_9_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port9_param_port_9_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port9_param_port_9_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port9_param_port_9_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port9_param_port_9_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port9_param_port_9_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port9_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h090 : begin
		rdata_comb [5:0]	= sscsrif_port10_param_port_10_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port10_param_port_10_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port10_param_port_10_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port10_param_port_10_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port10_param_port_10_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port10_param_port_10_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port10_param_port_10_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port10_param_port_10_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port10_param_port_10_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port10_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h094 : begin
		rdata_comb [5:0]	= sscsrif_port11_param_port_11_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port11_param_port_11_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port11_param_port_11_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port11_param_port_11_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port11_param_port_11_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port11_param_port_11_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port11_param_port_11_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port11_param_port_11_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port11_param_port_11_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port11_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h098 : begin
		rdata_comb [5:0]	= sscsrif_port12_param_port_12_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port12_param_port_12_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port12_param_port_12_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port12_param_port_12_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port12_param_port_12_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port12_param_port_12_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port12_param_port_12_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port12_param_port_12_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port12_param_port_12_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port12_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h09c : begin
		rdata_comb [5:0]	= sscsrif_port13_param_port_13_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port13_param_port_13_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port13_param_port_13_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port13_param_port_13_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port13_param_port_13_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port13_param_port_13_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port13_param_port_13_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port13_param_port_13_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port13_param_port_13_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port13_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0a0 : begin
		rdata_comb [5:0]	= sscsrif_port14_param_port_14_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port14_param_port_14_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port14_param_port_14_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port14_param_port_14_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port14_param_port_14_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port14_param_port_14_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port14_param_port_14_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port14_param_port_14_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port14_param_port_14_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port14_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0a4 : begin
		rdata_comb [5:0]	= sscsrif_port15_param_port_15_profile_i [5:0] ;		// readType = read   writeType =illegal
		rdata_comb [9:6]	= sscsrif_port15_param_port_15_ready_latency_i [3:0] ;		// readType = read   writeType =illegal
		rdata_comb [12:10]	= sscsrif_port15_param_port_15_databus_width_i [2:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_port15_param_port_15_lowspeed_eth_param_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_port15_param_port_15_drinpr_presence_i  ;		// readType = read   writeType =illegal
		rdata_comb [20:16]	= sscsrif_port15_param_port_15_subprofile_i [4:0] ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_port15_param_port_15_rsfec_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_port15_param_port_15_anlt_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_port15_param_port_15_ptp_enable_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_port15_param_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0a8 : begin
		rdata_comb [0]	= sscsrif_hssi_cmd_sts_read_command  ;		// readType = read   writeType =write
		rdata_comb [1]	= sscsrif_hssi_cmd_sts_write_command  ;		// readType = read   writeType =write
		rdata_comb [2]	= sscsrif_hssi_cmd_sts_ack_trans  ;		// readType = read   writeType =write
		rdata_comb [3]	= sscsrif_hssi_cmd_sts_busy_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_cmd_sts_error_i  ;		// readType = read   writeType =illegal
		rdata_comb [6:5]	= sscsrif_hssi_cmd_sts_xcvr_reg_byte_no [1:0] ;		// readType = read   writeType =write
		rdata_comb [31:7]	= 25'h0000000 ;  // sscsrif_hssi_cmd_sts_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0ac : begin
		rdata_comb [7:0]	= sscsrif_hssi_ctrl_addr_sal_command [7:0] ;		// readType = read   writeType =write
		rdata_comb [11:8]	= sscsrif_hssi_ctrl_addr_port_addr [3:0] ;		// readType = read   writeType =write
		rdata_comb [15:12]	= sscsrif_hssi_ctrl_addr_channel_addr [3:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= sscsrif_hssi_ctrl_addr_addr_msb [15:0] ;		// readType = read   writeType =write
	end
	9'h0b0 : begin
		rdata_comb [31:0]	= sscsrif_hssi_rd_data_write_data_i [31:0] ;		// readType = read   writeType =illegal
	end
	9'h0b4 : begin
		rdata_comb [31:0]	= sscsrif_hssi_wr_data_write_data [31:0] ;		// readType = read   writeType =write
	end
	9'h0b8 : begin
		rdata_comb [23:0]	= sscsrif_gmii_xgmii_tx_latency_tx_latency_i [23:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_gmii_xgmii_tx_latency_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0bc : begin
		rdata_comb [23:0]	= sscsrif_gmii_xgmii_rx_latency_rx_latency_i [23:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:24]	= 8'h00 ;  // sscsrif_gmii_xgmii_rx_latency_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0c0 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port0_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port0_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port0_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port0_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port0_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port0_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port0_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port0_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port0_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port0_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port0_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port0_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port0_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port0_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port0_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port0_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port0_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port0_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port0_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port0_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port0_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port0_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port0_status_o_ehip0_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port0_status_o_ehip1_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port0_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port0_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port0_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port0_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0c4 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port1_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port1_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port1_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port1_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port1_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port1_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port1_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port1_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port1_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port1_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port1_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port1_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port1_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port1_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port1_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port1_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port1_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port1_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port1_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port1_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port1_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port1_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port1_status_o_ehip0_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port1_status_o_ehip1_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port1_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port1_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port1_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port1_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0c8 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port2_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port2_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port2_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port2_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port2_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port2_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port2_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port2_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port2_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port2_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port2_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port2_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port2_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port2_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port2_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port2_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port2_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port2_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port2_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port2_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port2_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port2_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port2_status_o_ehip0_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port2_status_o_ehip1_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port2_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port2_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port2_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port2_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0cc : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port3_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port3_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port3_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port3_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port3_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port3_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port3_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port3_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port3_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port3_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port3_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port3_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port3_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port3_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port3_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port3_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port3_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port3_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port3_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port3_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port3_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port3_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port3_status_o_ehip0_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port3_status_o_ehip1_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port3_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port3_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port3_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port3_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0d0 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port4_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port4_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port4_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port4_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port4_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port4_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port4_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port4_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port4_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port4_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port4_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port4_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port4_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port4_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port4_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port4_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port4_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port4_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port4_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port4_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port4_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port4_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port4_status_o_ehip2_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port4_status_o_ehip3_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port4_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port4_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port4_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port4_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0d4 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port5_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port5_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port5_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port5_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port5_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port5_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port5_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port5_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port5_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port5_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port5_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port5_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port5_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port5_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port5_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port5_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port5_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port5_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port5_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port5_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port5_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port5_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port5_status_o_ehip2_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port5_status_o_ehip3_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port5_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port5_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port5_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port5_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0d8 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port6_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port6_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port6_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port6_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port6_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port6_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port6_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port6_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port6_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port6_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port6_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port6_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port6_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port6_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port6_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port6_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port6_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port6_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port6_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port6_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port6_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port6_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port6_status_o_ehip2_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port6_status_o_ehip3_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port6_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port6_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port6_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port6_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0dc : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port7_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port7_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port7_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port7_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port7_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port7_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port7_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port7_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port7_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port7_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port7_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port7_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port7_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port7_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port7_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port7_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port7_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port7_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port7_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port7_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port7_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port7_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port7_status_o_ehip2_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port7_status_o_ehip3_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port7_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port7_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port7_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port7_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0e0 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port8_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port8_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port8_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port8_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port8_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port8_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port8_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port8_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port8_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port8_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port8_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port8_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port8_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port8_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port8_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port8_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port8_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port8_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port8_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port8_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port8_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port8_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port8_status_o_ehip4_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port8_status_o_ehip5_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port8_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port8_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port8_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port8_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0e4 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port9_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port9_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port9_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port9_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port9_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port9_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port9_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port9_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port9_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port9_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port9_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port9_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port9_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port9_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port9_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port9_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port9_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port9_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port9_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port9_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port9_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port9_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port9_status_o_ehip4_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port9_status_o_ehip5_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port9_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port9_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port9_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port9_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0e8 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port10_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port10_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port10_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port10_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port10_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port10_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port10_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port10_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port10_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port10_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port10_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port10_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port10_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port10_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port10_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port10_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port10_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port10_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port10_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port10_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port10_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port10_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port10_status_o_ehip4_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port10_status_o_ehip5_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port10_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port10_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port10_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port10_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0ec : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port11_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port11_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port11_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port11_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port11_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port11_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port11_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port11_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port11_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port11_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port11_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port11_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port11_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port11_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port11_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port11_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port11_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port11_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port11_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port11_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port11_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port11_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port11_status_o_ehip4_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port11_status_o_ehip5_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port11_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port11_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port11_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port11_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0f0 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port12_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port12_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port12_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port12_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port12_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port12_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port12_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port12_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port12_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port12_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port12_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port12_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port12_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port12_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port12_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port12_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port12_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port12_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port12_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port12_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port12_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port12_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port12_status_o_ehip6_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port12_status_o_ehip7_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port12_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port12_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port12_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port12_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0f4 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port13_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port13_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port13_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port13_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port13_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port13_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port13_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port13_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port13_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port13_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port13_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port13_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port13_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port13_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port13_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port13_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port13_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port13_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port13_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port13_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port13_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port13_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port13_status_o_ehip6_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port13_status_o_ehip7_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port13_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port13_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port13_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port13_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0f8 : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port14_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port14_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port14_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port14_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port14_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port14_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port14_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port14_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port14_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port14_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port14_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port14_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port14_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port14_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port14_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port14_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port14_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port14_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port14_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port14_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port14_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port14_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port14_status_o_ehip6_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port14_status_o_ehip7_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port14_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port14_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port14_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port14_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h0fc : begin
		rdata_comb [0]	= sscsrif_hssi_eth_port15_status_o_ehip_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_eth_port15_status_o_rx_hi_ber_i  ;		// readType = read   writeType =illegal
		rdata_comb [2]	= sscsrif_hssi_eth_port15_status_o_cdr_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [3]	= sscsrif_hssi_eth_port15_status_rx_am_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [4]	= sscsrif_hssi_eth_port15_status_rx_block_lock_i  ;		// readType = read   writeType =illegal
		rdata_comb [5]	= sscsrif_hssi_eth_port15_status_link_fault_gen_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [6]	= sscsrif_hssi_eth_port15_status_unidirectional_en_i  ;		// readType = read   writeType =illegal
		rdata_comb [7]	= sscsrif_hssi_eth_port15_status_local_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= sscsrif_hssi_eth_port15_status_remote_fault_status  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= sscsrif_hssi_eth_port15_status_unidirectional_force_remote_fault_i  ;		// readType = read   writeType =illegal
		rdata_comb [10]	= sscsrif_hssi_eth_port15_status_unidirectional_remote_fault_dis_i  ;		// readType = read   writeType =illegal
		rdata_comb [12:11]	= sscsrif_hssi_eth_port15_status_pcs_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [14:13]	= sscsrif_hssi_eth_port15_status_mac_eccstatus_i [1:0] ;		// readType = read   writeType =illegal
		rdata_comb [15]	= sscsrif_hssi_eth_port15_status_set_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [16]	= sscsrif_hssi_eth_port15_status_set_1000_i  ;		// readType = read   writeType =illegal
		rdata_comb [17]	= sscsrif_hssi_eth_port15_status_ena_10_i  ;		// readType = read   writeType =illegal
		rdata_comb [18]	= sscsrif_hssi_eth_port15_status_eth_mode_i  ;		// readType = read   writeType =illegal
		rdata_comb [19]	= sscsrif_hssi_eth_port15_status_load_recipe_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [20]	= sscsrif_hssi_eth_port15_status_cal_err_i  ;		// readType = read   writeType =illegal
		rdata_comb [21]	= sscsrif_hssi_eth_port15_status_tx_lanes_stable_i  ;		// readType = read   writeType =illegal
		rdata_comb [22]	= sscsrif_hssi_eth_port15_status_rx_pcs_ready_i  ;		// readType = read   writeType =illegal
		rdata_comb [23]	= sscsrif_hssi_eth_port15_status_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [24]	= sscsrif_hssi_eth_port15_status_o_ehip6_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [25]	= sscsrif_hssi_eth_port15_status_o_ehip7_tx_pll_locked_i  ;		// readType = read   writeType =illegal
		rdata_comb [26]	= sscsrif_hssi_eth_port15_status_parity_error  ;		// readType = read   writeType =oneToClear
		rdata_comb [27]	= sscsrif_hssi_eth_port15_status_local_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [28]	= sscsrif_hssi_eth_port15_status_remote_fault_status_direct_i  ;		// readType = read   writeType =illegal
		rdata_comb [31:29]	= 3'h0 ;  // sscsrif_hssi_eth_port15_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h100 : begin
		rdata_comb [0]	= sscsrif_hssi_tse_ctrl_Magic_wakeup_i  ;		// readType = read   writeType =illegal
		rdata_comb [1]	= sscsrif_hssi_tse_ctrl_Magic_sleep_n  ;		// readType = read   writeType =write
		rdata_comb [31:2]	= 30'h00000000 ;  // sscsrif_hssi_tse_ctrl_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h108 : begin
		rdata_comb [2:0]	= sscsrif_hssi_debug_ctrl_override_led_speed [2:0] ;		// readType = read   writeType =write
		rdata_comb [5:3]	= sscsrif_hssi_debug_ctrl_override_led_status [2:0] ;		// readType = read   writeType =write
		rdata_comb [9:6]	= sscsrif_hssi_debug_ctrl_port_led_status_override [3:0] ;		// readType = read   writeType =write
		rdata_comb [10]	= sscsrif_hssi_debug_ctrl_led_status_override_enable  ;		// readType = read   writeType =write
		rdata_comb [18:11]	= sscsrif_hssi_debug_ctrl_led_status_blinking_timer [7:0] ;		// readType = read   writeType =write
		rdata_comb [31:19]	= 13'h0000 ;  // sscsrif_hssi_debug_ctrl_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h10c : begin
		rdata_comb [31:0]	= sscsrif_hssi_hotplug_debug_ctrl_hotplug_control [31:0] ;		// readType = read   writeType =write
	end
	9'h110 : begin
		rdata_comb [7:0]	= sscsrif_hssi_hotplug_debug_sts_hotplug_status_i [7:0] ;		// readType = read   writeType =illegal
		rdata_comb [31:8]	= 24'h000000 ;  // sscsrif_hssi_hotplug_debug_sts_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	9'h114 : begin
		rdata_comb [0]	= sscsrif_hssi_general_status_ecc_error_m20k_sal_nios  ;		// readType = read   writeType =oneToClear
		rdata_comb [1]	= sscsrif_hssi_general_status_ecc_error_m20k_avst  ;		// readType = read   writeType =oneToClear
		rdata_comb [2]	= sscsrif_hssi_general_status_ecc_error_m20k_jtag  ;		// readType = read   writeType =oneToClear
		rdata_comb [31:3]	= 29'h00000000 ;  // sscsrif_hssi_general_status_rsvd 	is reserved or a constant value, a read access gives the reset value
	end
	default : begin
		rdata_comb = 32'h00000000;
	end
      endcase
   end
end

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ysSU+dh+Zz59+ZUzwBi0HHcCq8XJPJDFhK+5r5a5OtHV3GGiYwVAMLli79DlJnBa2Cjh+bFIdAWV2IC60xWWh2KTBREKSyU8CcrI/HtdhQsbPydRcQGtf4Qdib3HAn2koRR156iBZPHs9tPPuPvfyHscsaZRPzetMsgAHvjBQRS0KnTrQl0iE9WHY1tGJGamuTBPi4cUH5ryBu0qhxqfIuzM1EXAYxTx7IDQGfyAHHI6yUCQG1DntZ1w0+mNNHPyRt1jG/RU1YhBoRlybjqKVf4MW1PkD0mETR62y6aMIWvA1YRYe1dlasuCQebi7u+LSkBryvKDgCN39HSnGnI/RV2zo/rZEi17OjxPkIMd1o0H+uSeXVsA/EDt83XnQvKn447yTvJlzze6GgVnmE5/PEj810p0X0GiD+6oYFglNMr0zVWZAgX/96TPoniGbMIMLygSl+C74bf3g8pwIUo8ZuWmJOkKDF+7fple2bBtildaUGA8KNn0uSunMI/we9LjWd5SVTfxUaZg9Thv7bBMpOR18Vw8bl5B0metNlGdItDDG4wTz52nKVTZQsuLBCW6YlRppp+wd21rDF1B4Bh++uTkpRvZ363hQg7sKhcvR2LU3AMvvmfOv9CE+nk7queEsB03+f833T0YDHEU8zUE3X3WjyW11RxomfeLNZ+TpE58KxBadV+yxEmeB8qt8nwimexVD7q8TFeVYL31PDxxCj6HSmWCkuRmDqfwuPIgmlt9Ufd8Eo5GzHRVdqwtg16ibsPkwq9xszSJF6lhHRDpirQ"
`endif