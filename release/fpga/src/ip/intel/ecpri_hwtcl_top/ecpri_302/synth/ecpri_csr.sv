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
//   Date : Thu Mar 31 09:34:52 MYT 2022           
//-----------------------------------------------------------------------------------------------//


//-----------------------------------------------------------------------------------------------//
//   Verilog Register Bank
//   Component Name: ecpri_csr
//   File Ref: /nfs/site/disks/swip_cpri_1/users/wquee/cpri_regtest_22p1/p4/ecpri/csrgen/csrgen_output/_workspace_mrv_gen_py_/xmlProject/_local_copy_Vendor_Library_ecpri_csr_1.0.xml                                             
//   Magillem Version :   5.11.2.1                                                                         
//-----------------------------------------------------------------------------------------------//
// 
module ecpri_csr (

// Hack
output        intr_msg5_id_err,
output        intr_msg5_noresp_err,
output        intr_rsvd_msg_rx_err,
output        intr_rsvd_msg_tx_err,
output        intr_msg4_noresp_err,
output        mac_vlan_tag_0_dei, 
output [15:0] mac_vlan_tag_0_tpid,
output        mac_vlan_tag_1_dei, 
output [15:0] mac_vlan_tag_1_tpid,
output        mac_vlan_tag_2_dei, 
output [15:0] mac_vlan_tag_2_tpid,
output        mac_vlan_tag_3_dei, 
output [15:0] mac_vlan_tag_3_tpid,
output        mac_vlan_tag_4_dei, 
output [15:0] mac_vlan_tag_4_tpid,
output        mac_vlan_tag_5_dei, 
output [15:0] mac_vlan_tag_5_tpid,
output        mac_vlan_tag_6_dei, 
output [15:0] mac_vlan_tag_6_tpid,
output        mac_vlan_tag_7_dei, 
output [15:0] mac_vlan_tag_7_tpid,
output [15:0] mac_ethertype_ethtype,


// register offset : 0x00000, field offset : 0, access : RO, ecpri_version.ip_version
input  [31:0] iprev_defaultValue_i,
// register offset : 0x00004, field offset : 0, access : RW, ecpri_scratch.scratch
output  reg[31:0] ecpri_scratch_scratch,
// register offset : 0x00008, field offset : 0, access : RO, ecpri_common_ctrl.rev
input  [3:0] rev_defaultValue_i,
// register offset : 0x00008, field offset : 4, access : RW, ecpri_common_ctrl.msg4_mode
output  reg ecpri_common_ctrl_msg4_mode,
// register offset : 0x00008, field offset : 5, access : RW, ecpri_common_ctrl.frag_en
output  reg ecpri_common_ctrl_frag_en,
// register offset : 0x00008, field offset : 6, access : RW, ecpri_common_ctrl.frag_sz
output  reg[1:0] ecpri_common_ctrl_frag_sz,
// register offset : 0x00008, field offset : 8, access : RW, ecpri_common_ctrl.err_mask
output  reg ecpri_common_ctrl_err_mask,
// register offset : 0x00008, field offset : 9, access : RW, ecpri_common_ctrl.irq_en
output  reg ecpri_common_ctrl_irq_en,
// register offset : 0x00008, field offset : 10, access : RW, ecpri_common_ctrl.mf_en
output  reg ecpri_common_ctrl_mf_en,
// register offset : 0x00008, field offset : 11, access : RO, ecpri_common_ctrl.reserved
output   irq_ecpri_msg5_ctrl,
// register offset : 0x0000c, field offset : 0, access : RW, ecpri_msg5_ctrl.meas_mode
input   msg5_op_defaultValue_i,
output  reg ecpri_msg5_ctrl_meas_mode,
// register offset : 0x0000c, field offset : 1, access : RW, ecpri_msg5_ctrl.meas_id
output  reg[7:0] ecpri_msg5_ctrl_meas_id,
// register offset : 0x0000c, field offset : 9, access : RW, ecpri_msg5_ctrl.remote_request
output  reg ecpri_msg5_ctrl_remote_request,
// register offset : 0x0000c, field offset : 10, access : RW, ecpri_msg5_ctrl.meas_start
output  reg ecpri_msg5_ctrl_meas_start,
// register offset : 0x0000c, field offset : 11, access : W1C, interrupt : Status
input   ecpri_msg5_ctrl_meas_complete_i,
// register offset : 0x0000c, field offset : 12, access : RW, ecpri_msg5_ctrl.dummy_bytes
output  reg[7:0] ecpri_msg5_ctrl_dummy_bytes,
// register offset : 0x0000c, field offset : 20, access : RO, ecpri_msg5_ctrl.reserved
output   irq_ecpri_tx_err_msg,
// register offset : 0x00010, field offset : 0, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_tx_miss_sop_err_i,
// register offset : 0x00010, field offset : 1, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_tx_miss_eop_err_i,
// register offset : 0x00010, field offset : 2, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_tx_overflow_err_i,
// register offset : 0x00010, field offset : 3, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_tx_ecc_err_i,
// register offset : 0x00010, field offset : 4, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_tx_msg_type_err_i,
// register offset : 0x00010, field offset : 5, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_con_timeout_err_i,
// register offset : 0x00010, field offset : 6, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_m_msg_size_err_i,
// register offset : 0x00010, field offset : 7, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_s_msg_size_err_i,
// register offset : 0x00010, field offset : 8, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_usr_msg_size_err_i,
// register offset : 0x00010, field offset : 9, access : W1C, interrupt : Status
input   ecpri_tx_err_msg_avst_if_err_i,
// register offset : 0x00010, field offset : 10, access : RO, ecpri_tx_err_msg.reserved
output   irq_ecpri_rx_err_msg,
// register offset : 0x00014, field offset : 0, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_rx_miss_sop_err_i,
// register offset : 0x00014, field offset : 1, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_rx_miss_eop_err_i,
// register offset : 0x00014, field offset : 2, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_rx_overflow_err_i,
// register offset : 0x00014, field offset : 3, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_rx_ecc_err_i,
// register offset : 0x00014, field offset : 4, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_rx_msg_type_err_i,
// register offset : 0x00014, field offset : 5, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_rx_meas_id_err_i,
// register offset : 0x00014, field offset : 6, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_inv_msg5_req_err_i,
// register offset : 0x00014, field offset : 7, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_inv_msg5_fup_err_i,
// register offset : 0x00014, field offset : 8, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_inv_msg5_resp_err_i,
// register offset : 0x00014, field offset : 9, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_msg5_pkt_err_i,
// register offset : 0x00014, field offset : 10, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_no_resp_msg5_err_i,
// register offset : 0x00014, field offset : 11, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_no_rst_resp_err_i,
// register offset : 0x00014, field offset : 12, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_no_mem_resp_err_i,
// register offset : 0x00014, field offset : 13, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_msg4_buffer_mode_err_i,
// register offset : 0x00014, field offset : 14, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_payload_length_mismatch_err_i,
// register offset : 0x00014, field offset : 15, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_invalid_concan_bit_received_err_i,
// register offset : 0x00014, field offset : 16, access : W1C, interrupt : Status
input   ecpri_rx_err_msg_rx_in_avst_err_i,
// register offset : 0x00014, field offset : 17, access : RO, ecpri_rx_err_msg.reserved
// register offset : 0x00018, field offset : 0, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 1, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 2, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 3, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 4, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 5, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 6, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 7, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 8, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 9, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 10, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 11, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 12, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 13, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 14, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 15, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 16, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 17, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 18, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 19, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 20, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 21, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 22, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 23, access : RW, interrupt : Mask
// register offset : 0x00018, field offset : 24, access : RO, ecpri_err_mask_msg.reserved
// register offset : 0x0001c, field offset : 0, access : W1C, ecpri_err_log_msg.mem_acc_id_log_err
input   we_ecpri_err_log_msg_mem_acc_id_log_err,
input  [7:0] ecpri_err_log_msg_mem_acc_id_log_err_i,
// register offset : 0x0001c, field offset : 8, access : W1C, ecpri_err_log_msg.msg_type_log_err
input   we_ecpri_err_log_msg_msg_type_log_err,
input  [5:0] ecpri_err_log_msg_msg_type_log_err_i,
// register offset : 0x0001c, field offset : 14, access : W1C, ecpri_err_log_msg.msg5_actype_log_err
input   we_ecpri_err_log_msg_msg5_actype_log_err,
input  [7:0] ecpri_err_log_msg_msg5_actype_log_err_i,
// register offset : 0x0001c, field offset : 22, access : W1C, ecpri_err_log_msg.meas_id_log_err
input   we_ecpri_err_log_msg_meas_id_log_err,
input  [7:0] ecpri_err_log_msg_meas_id_log_err_i,
// register offset : 0x0001c, field offset : 30, access : RO, ecpri_err_log_msg.reserved
// register offset : 0x00020, field offset : 0, access : RW, ecpri_msg5_cv0.msg5_cv0
input   we_ecpri_msg5_cv0_msg5_cv0,
input  [31:0] ecpri_msg5_cv0_msg5_cv0_i,
output  reg[31:0] ecpri_msg5_cv0_msg5_cv0,
// register offset : 0x00024, field offset : 0, access : RW, ecpri_msg5_cv1.msg5_cv1
input   we_ecpri_msg5_cv1_msg5_cv1,
input  [31:0] ecpri_msg5_cv1_msg5_cv1_i,
output  reg[31:0] ecpri_msg5_cv1_msg5_cv1,
// register offset : 0x00028, field offset : 0, access : RW, ecpri_msg5_td0.ecpri_msg5_td0
input   we_ecpri_msg5_td0_ecpri_msg5_td0,
input  [31:0] ecpri_msg5_td0_ecpri_msg5_td0_i,
output  reg[31:0] ecpri_msg5_td0_ecpri_msg5_td0,
// register offset : 0x0002c, field offset : 0, access : RW, ecpri_msg5_td1.ecpri_msg5_td1
input   we_ecpri_msg5_td1_ecpri_msg5_td1,
input  [31:0] ecpri_msg5_td1_ecpri_msg5_td1_i,
output  reg[31:0] ecpri_msg5_td1_ecpri_msg5_td1,
// register offset : 0x00030, field offset : 0, access : RW, ecpri_msg5_td2.ecpri_msg5_td2
input   we_ecpri_msg5_td2_ecpri_msg5_td2,
input  [15:0] ecpri_msg5_td2_ecpri_msg5_td2_i,
output  reg[15:0] ecpri_msg5_td2_ecpri_msg5_td2,
// register offset : 0x00030, field offset : 16, access : RO, ecpri_msg5_td2.reserved
// register offset : 0x00040, field offset : 0, access : RW, eth_frame_scratch.ethfrm_scratch
output  reg[31:0] eth_frame_scratch_ethfrm_scratch,
// register offset : 0x00044, field offset : 0, access : RW, source_mac_addr0_0.mac_sa_addr0_0
input  [31:0] source_mac_addr0_0_defaultValue_i,
output  reg[31:0] source_mac_addr0_0_mac_sa_addr0_0,
// register offset : 0x00048, field offset : 0, access : RW, source_mac_addr0_1.mac_sa_addr0_1
input  [15:0] source_mac_addr0_1_defaultValue_i,
output  reg[15:0] source_mac_addr0_1_mac_sa_addr0_1,
// register offset : 0x00048, field offset : 16, access : RO, source_mac_addr0_1.reserved
// register offset : 0x0004c, field offset : 0, access : RW, dest_mac_addr0_0.mac_addr0_0
input  [31:0] dest_mac_addr0_0_defaultValue_i,
output  reg[31:0] dest_mac_addr0_0_mac_addr0_0,
// register offset : 0x00050, field offset : 0, access : RW, dest_mac_addr0_1.mac_addr0_1
input  [15:0] dest_mac_addr0_1_defaultValue_i,
output  reg[15:0] dest_mac_addr0_1_mac_addr0_1,
// register offset : 0x00050, field offset : 16, access : RO, dest_mac_addr0_1.reserved
// register offset : 0x00054, field offset : 0, access : RW, dest_mac_addr1_0.mac_addr1_0
input  [31:0] dest_mac_addr1_0_defaultValue_i,
output  reg[31:0] dest_mac_addr1_0_mac_addr1_0,
// register offset : 0x00058, field offset : 0, access : RW, dest_mac_addr1_1.mac_addr1_1
input  [15:0] dest_mac_addr1_1_defaultValue_i,
output  reg[15:0] dest_mac_addr1_1_mac_addr1_1,
// register offset : 0x00058, field offset : 16, access : RO, dest_mac_addr1_1.reserved
// register offset : 0x0005c, field offset : 0, access : RW, dest_mac_addr2_0.mac_addr2_0
input  [31:0] dest_mac_addr2_0_defaultValue_i,
output  reg[31:0] dest_mac_addr2_0_mac_addr2_0,
// register offset : 0x00060, field offset : 0, access : RW, dest_mac_addr2_1.mac_addr2_1
input  [15:0] dest_mac_addr2_1_defaultValue_i,
output  reg[15:0] dest_mac_addr2_1_mac_addr2_1,
// register offset : 0x00060, field offset : 16, access : RO, dest_mac_addr2_1.reserved
// register offset : 0x00064, field offset : 0, access : RW, dest_mac_addr3_0.mac_addr3_0
input  [31:0] dest_mac_addr3_0_defaultValue_i,
output  reg[31:0] dest_mac_addr3_0_mac_addr3_0,
// register offset : 0x00068, field offset : 0, access : RW, dest_mac_addr3_1.mac_addr3_1
input  [15:0] dest_mac_addr3_1_defaultValue_i,
output  reg[15:0] dest_mac_addr3_1_mac_addr3_1,
// register offset : 0x00068, field offset : 16, access : RO, dest_mac_addr3_1.reserved
// register offset : 0x0006c, field offset : 0, access : RW, dest_mac_addr4_0.mac_addr4_0
input  [31:0] dest_mac_addr4_0_defaultValue_i,
output  reg[31:0] dest_mac_addr4_0_mac_addr4_0,
// register offset : 0x00070, field offset : 0, access : RW, dest_mac_addr4_1.mac_addr4_1
input  [15:0] dest_mac_addr4_1_defaultValue_i,
output  reg[15:0] dest_mac_addr4_1_mac_addr4_1,
// register offset : 0x00070, field offset : 16, access : RO, dest_mac_addr4_1.reserved
// register offset : 0x00074, field offset : 0, access : RW, dest_mac_addr5_0.mac_addr5_0
input  [31:0] dest_mac_addr5_0_defaultValue_i,
output  reg[31:0] dest_mac_addr5_0_mac_addr5_0,
// register offset : 0x00078, field offset : 0, access : RW, dest_mac_addr5_1.mac_addr5_1
input  [15:0] dest_mac_addr5_1_defaultValue_i,
output  reg[15:0] dest_mac_addr5_1_mac_addr5_1,
// register offset : 0x00078, field offset : 16, access : RO, dest_mac_addr5_1.reserved
// register offset : 0x0007c, field offset : 0, access : RW, dest_mac_addr6_0.mac_addr6_0
input  [31:0] dest_mac_addr6_0_defaultValue_i,
output  reg[31:0] dest_mac_addr6_0_mac_addr6_0,
// register offset : 0x00080, field offset : 0, access : RW, dest_mac_addr6_1.mac_addr6_1
input  [15:0] dest_mac_addr6_1_defaultValue_i,
output  reg[15:0] dest_mac_addr6_1_mac_addr6_1,
// register offset : 0x00080, field offset : 16, access : RO, dest_mac_addr6_1.reserved
// register offset : 0x00084, field offset : 0, access : RW, dest_mac_addr7_0.mac_addr7_0
input  [31:0] dest_mac_addr7_0_defaultValue_i,
output  reg[31:0] dest_mac_addr7_0_mac_addr7_0,
// register offset : 0x00088, field offset : 0, access : RW, dest_mac_addr7_1.mac_addr7_1
input  [15:0] dest_mac_addr7_1_defaultValue_i,
output  reg[15:0] dest_mac_addr7_1_mac_addr7_1,
// register offset : 0x00088, field offset : 16, access : RO, dest_mac_addr7_1.reserved
// register offset : 0x0008c, field offset : 0, access : RW, mac_vlan_tag_0.vid
output  reg[11:0] mac_vlan_tag_0_vid,
// register offset : 0x0008c, field offset : 12, access : RO, mac_vlan_tag_0.dei
input   ipv4_dei_defaultValue_i,
// register offset : 0x0008c, field offset : 13, access : RW, mac_vlan_tag_0.pcp
output  reg[2:0] mac_vlan_tag_0_pcp,
// register offset : 0x0008c, field offset : 16, access : RO, mac_vlan_tag_0.tpid
input  [15:0] ipv4_tpid_defaultValue_i,
// register offset : 0x00090, field offset : 0, access : RW, mac_vlan_tag_1.vid
output  reg[11:0] mac_vlan_tag_1_vid,
// register offset : 0x00090, field offset : 12, access : RO, mac_vlan_tag_1.dei
// register offset : 0x00090, field offset : 13, access : RW, mac_vlan_tag_1.pcp
output  reg[2:0] mac_vlan_tag_1_pcp,
// register offset : 0x00090, field offset : 16, access : RO, mac_vlan_tag_1.tpid
// register offset : 0x00094, field offset : 0, access : RW, mac_vlan_tag_2.vid
output  reg[11:0] mac_vlan_tag_2_vid,
// register offset : 0x00094, field offset : 12, access : RO, mac_vlan_tag_2.dei
// register offset : 0x00094, field offset : 13, access : RW, mac_vlan_tag_2.pcp
output  reg[2:0] mac_vlan_tag_2_pcp,
// register offset : 0x00094, field offset : 16, access : RO, mac_vlan_tag_2.tpid
// register offset : 0x00098, field offset : 0, access : RW, mac_vlan_tag_3.vid
output  reg[11:0] mac_vlan_tag_3_vid,
// register offset : 0x00098, field offset : 12, access : RO, mac_vlan_tag_3.dei
// register offset : 0x00098, field offset : 13, access : RW, mac_vlan_tag_3.pcp
output  reg[2:0] mac_vlan_tag_3_pcp,
// register offset : 0x00098, field offset : 16, access : RO, mac_vlan_tag_3.tpid
// register offset : 0x0009c, field offset : 0, access : RW, mac_vlan_tag_4.vid
output  reg[11:0] mac_vlan_tag_4_vid,
// register offset : 0x0009c, field offset : 12, access : RO, mac_vlan_tag_4.dei
// register offset : 0x0009c, field offset : 13, access : RW, mac_vlan_tag_4.pcp
output  reg[2:0] mac_vlan_tag_4_pcp,
// register offset : 0x0009c, field offset : 16, access : RO, mac_vlan_tag_4.tpid
// register offset : 0x000a0, field offset : 0, access : RW, mac_vlan_tag_5.vid
output  reg[11:0] mac_vlan_tag_5_vid,
// register offset : 0x000a0, field offset : 12, access : RO, mac_vlan_tag_5.dei
// register offset : 0x000a0, field offset : 13, access : RW, mac_vlan_tag_5.pcp
output  reg[2:0] mac_vlan_tag_5_pcp,
// register offset : 0x000a0, field offset : 16, access : RO, mac_vlan_tag_5.tpid
// register offset : 0x000a4, field offset : 0, access : RW, mac_vlan_tag_6.vid
output  reg[11:0] mac_vlan_tag_6_vid,
// register offset : 0x000a4, field offset : 12, access : RO, mac_vlan_tag_6.dei
// register offset : 0x000a4, field offset : 13, access : RW, mac_vlan_tag_6.pcp
output  reg[2:0] mac_vlan_tag_6_pcp,
// register offset : 0x000a4, field offset : 16, access : RO, mac_vlan_tag_6.tpid
// register offset : 0x000a8, field offset : 0, access : RW, mac_vlan_tag_7.vid
output  reg[11:0] mac_vlan_tag_7_vid,
// register offset : 0x000a8, field offset : 12, access : RO, mac_vlan_tag_7.dei
// register offset : 0x000a8, field offset : 13, access : RW, mac_vlan_tag_7.pcp
output  reg[2:0] mac_vlan_tag_7_pcp,
// register offset : 0x000a8, field offset : 16, access : RO, mac_vlan_tag_7.tpid
// register offset : 0x000ac, field offset : 0, access : RO, mac_ethertype.ethtype
input  [15:0] ecpri_ethertype_defaultValue_i,
// register offset : 0x000ac, field offset : 16, access : RO, mac_ethertype.reserved
// register offset : 0x000b0, field offset : 0, access : RO, ipv4_dw0_address.dw0_tl
output  reg[15:0] ipv4_dw0_address_dw0_tl,
// register offset : 0x000b0, field offset : 16, access : RW, ipv4_dw0_address.dw0_tos
output  reg[7:0] ipv4_dw0_address_dw0_tos,
// register offset : 0x000b0, field offset : 24, access : RO, ipv4_dw0_address.dw0_hl
output  reg[3:0] ipv4_dw0_address_dw0_hl,
// register offset : 0x000b0, field offset : 28, access : RO, ipv4_dw0_address.dw0_ver
output  reg[3:0] ipv4_dw0_address_dw0_ver,
// register offset : 0x000b4, field offset : 0, access : RW, ipv4_dw1_address.dw1_frag_offs
output  reg[12:0] ipv4_dw1_address_dw1_frag_offs,
// register offset : 0x000b4, field offset : 13, access : RW, ipv4_dw1_address.dw1_flg
output  reg[2:0] ipv4_dw1_address_dw1_flg,
// register offset : 0x000b4, field offset : 16, access : RW, ipv4_dw1_address.dw1_id
output  reg[15:0] ipv4_dw1_address_dw1_id,
// register offset : 0x000b8, field offset : 0, access : RO, ipv4_dw2_address.dw2_hdchksum
output  reg[15:0] ipv4_dw2_address_dw2_hdchksum,
// register offset : 0x000b8, field offset : 16, access : RO, ipv4_dw2_address.dw2_prot
output  reg[7:0] ipv4_dw2_address_dw2_prot,
// register offset : 0x000b8, field offset : 24, access : RW, ipv4_dw2_address.dw2_tol
output  reg[7:0] ipv4_dw2_address_dw2_tol,
// register offset : 0x000bc, field offset : 0, access : RW, ipv4_src_address_0.ipv4_src_address_0
output  reg[31:0] ipv4_src_address_0_ipv4_src_address_0,
// register offset : 0x000c0, field offset : 0, access : RW, ipv4_dst_address_0.ipv4_dst_address_0
output  reg[31:0] ipv4_dst_address_0_ipv4_dst_address_0,
// register offset : 0x000c4, field offset : 0, access : RW, mudp_dw0_address.udp_dw0_chksum
output  reg[15:0] mudp_dw0_address_udp_dw0_chksum,
// register offset : 0x000c4, field offset : 16, access : RW, mudp_dw0_address.udp_dw0_length
output  reg[15:0] mudp_dw0_address_udp_dw0_length,
// register offset : 0x000c8, field offset : 0, access : RW, mudp_address_0.udp_src_port
output  reg[15:0] mudp_address_0_udp_src_port,
// register offset : 0x000c8, field offset : 16, access : RW, mudp_address_0.udp_dest_port
output  reg[15:0] mudp_address_0_udp_dest_port,
// register offset : 0x000f4, field offset : 0, access : RW, packet_type_enable.ipv6_en
output  reg packet_type_enable_ipv6_en,
// register offset : 0x000f4, field offset : 1, access : RW, packet_type_enable.ipv4_en
output  reg packet_type_enable_ipv4_en,
// register offset : 0x000f4, field offset : 2, access : RW, packet_type_enable.vlan_en
output  reg packet_type_enable_vlan_en,
// register offset : 0x000f4, field offset : 3, access : RW, packet_type_enable.svlan_en
output  reg packet_type_enable_svlan_en,
// register offset : 0x000f4, field offset : 4, access : RW, packet_type_enable.udp_en
output  reg packet_type_enable_udp_en,
// register offset : 0x000f4, field offset : 5, access : RO, packet_type_enable.rx_err_resv
output   irq_rx_error_address,
// register offset : 0x000f8, field offset : 0, access : W1C, interrupt : Status
input   rx_error_address_ipv4_chksum_err_i,
// register offset : 0x000f8, field offset : 1, access : W1C, interrupt : Status
input   rx_error_address_udp_chksum_err_i,
// register offset : 0x000f8, field offset : 2, access : RO, rx_error_address.rx_err_resv
// register offset : 0x000fc, field offset : 0, access : RW, cu_vlanid_match_address.vid_addr
input  [11:0] cu_vlanid_match_address_vid_addr_defaultValue_i,
output  reg[11:0] cu_vlanid_match_address_vid_addr,
// register offset : 0x000fc, field offset : 12, access : RW, cu_vlanid_match_address.match_macaddr_vlanid
input   cu_vlanid_match_address_match_macaddr_vlanid_defaultValue_i,
output  reg cu_vlanid_match_address_match_macaddr_vlanid,
// register offset : 0x000fc, field offset : 13, access : RO, cu_vlanid_match_address.reserved
// register offset : 0x00100, field offset : 0, access : RW, ecpri_priority.ecpri_priority_value
input  [2:0] ecpri_priority_defaultValue_i,
output  reg[2:0] ecpri_priority_ecpri_priority_value,
// register offset : 0x00100, field offset : 3, access : RO, ecpri_priority.reserved
// register offset : 0x00104, field offset : 0, access : RW, ptp_priority.ptp_priority_value
input  [2:0] ptp_priority_defaultValue_i,
output  reg[2:0] ptp_priority_ptp_priority_value,
// register offset : 0x00104, field offset : 3, access : RO, ptp_priority.reserved
// register offset : 0x00108, field offset : 0, access : RW, misc_priority.misc_priority_value
input  [2:0] misc_priority_defaultValue_i,
output  reg[2:0] misc_priority_misc_priority_value,
// register offset : 0x00108, field offset : 3, access : RO, misc_priority.reserved
// register offset : 0x0010c, field offset : 0, access : RW, pq_starvation.en_pq_starvation_ext0
output  reg pq_starvation_en_pq_starvation_ext0,
// register offset : 0x0010c, field offset : 1, access : RW, pq_starvation.en_pq_starvation_ext1
output  reg pq_starvation_en_pq_starvation_ext1,
// register offset : 0x0010c, field offset : 2, access : RO, pq_starvation.reserved
// register offset : 0x3ffff, field offset : 0, access : RO, farend_address.reserved
//Bus Interface
input clk,
input reset,
input [31:0] writedata,
input read,
input write,
input [3:0] byteenable,
output reg [31:0] readdata,
output reg readdatavalid,
input [17:0] address,
output reg waitrequest

);


wire reset_n = !reset;	
// Protocol management
// combinatorial read data signal declaration
reg [31:0] rdata_comb;

// synchronous process for the read
always @(negedge reset_n ,posedge clk)  
   if (!reset_n) readdata[31:0] <= 32'h0; else readdata[31:0] <= rdata_comb[31:0];

// read data is always returned on the next cycle
always @(negedge reset_n , posedge clk) begin
   if (!reset_n) begin
      readdatavalid <= 1'b0; 
      waitrequest   <= 1'b1;
   end else begin
      readdatavalid <= read & !waitrequest;
      waitrequest   <= !(read|write);
   end
end
//
//  Protocol specific assignment to inside signals
//
wire  we = write;
wire  re = read;
wire [17:0] addr = address[17:0];
wire [31:0] din  = writedata [31:0];
// A write byte enable for each register
// register ecpri_scratch with  writeType: write
wire	[3:0]  we_ecpri_scratch		=	we  & (addr[17:0]  == 18'h00004)	?	byteenable[3:0]	:	{4{1'b0}};
// register ecpri_common_ctrl with  writeType: write
wire	[1:0]  we_ecpri_common_ctrl		=	we  & (addr[17:0]  == 18'h00008)	?	byteenable[1:0]	:	{2{1'b0}};
// register ecpri_msg5_ctrl with  writeType: write
wire	[2:0]  we_ecpri_msg5_ctrl		=	we  & (addr[17:0]  == 18'h0000c)	?	byteenable[2:0]	:	{3{1'b0}};
// register ecpri_tx_err_msg with  writeType: write
wire	[1:0]  we_ecpri_tx_err_msg		=	we  & (addr[17:0]  == 18'h00010)	?	byteenable[1:0]	:	{2{1'b0}};
// register ecpri_rx_err_msg with  writeType: write
wire	[2:0]  we_ecpri_rx_err_msg		=	we  & (addr[17:0]  == 18'h00014)	?	byteenable[2:0]	:	{3{1'b0}};
// register ecpri_err_mask_msg with  writeType: write
wire	[2:0]  we_ecpri_err_mask_msg		=	we  & (addr[17:0]  == 18'h00018)	?	byteenable[2:0]	:	{3{1'b0}};
// register ecpri_err_log_msg with  writeType: write
wire	[3:0]  we_ecpri_err_log_msg		=	we  & (addr[17:0]  == 18'h0001c)	?	byteenable[3:0]	:	{4{1'b0}};
// register ecpri_msg5_cv0 with  writeType: write
wire	[3:0]  we_ecpri_msg5_cv0		=	we  & (addr[17:0]  == 18'h00020)	?	byteenable[3:0]	:	{4{1'b0}};
// register ecpri_msg5_cv1 with  writeType: write
wire	[3:0]  we_ecpri_msg5_cv1		=	we  & (addr[17:0]  == 18'h00024)	?	byteenable[3:0]	:	{4{1'b0}};
// register ecpri_msg5_td0 with  writeType: write
wire	[3:0]  we_ecpri_msg5_td0		=	we  & (addr[17:0]  == 18'h00028)	?	byteenable[3:0]	:	{4{1'b0}};
// register ecpri_msg5_td1 with  writeType: write
wire	[3:0]  we_ecpri_msg5_td1		=	we  & (addr[17:0]  == 18'h0002c)	?	byteenable[3:0]	:	{4{1'b0}};
// register ecpri_msg5_td2 with  writeType: write
wire	[1:0]  we_ecpri_msg5_td2		=	we  & (addr[17:0]  == 18'h00030)	?	byteenable[1:0]	:	{2{1'b0}};
// register eth_frame_scratch with  writeType: write
wire	[3:0]  we_eth_frame_scratch		=	we  & (addr[17:0]  == 18'h00040)	?	byteenable[3:0]	:	{4{1'b0}};
// register source_mac_addr0_0 with  writeType: write
wire	[3:0]  we_source_mac_addr0_0		=	we  & (addr[17:0]  == 18'h00044)	?	byteenable[3:0]	:	{4{1'b0}};
// register source_mac_addr0_1 with  writeType: write
wire	[1:0]  we_source_mac_addr0_1		=	we  & (addr[17:0]  == 18'h00048)	?	byteenable[1:0]	:	{2{1'b0}};
// register dest_mac_addr0_0 with  writeType: write
wire	[3:0]  we_dest_mac_addr0_0		=	we  & (addr[17:0]  == 18'h0004c)	?	byteenable[3:0]	:	{4{1'b0}};
// register dest_mac_addr0_1 with  writeType: write
wire	[1:0]  we_dest_mac_addr0_1		=	we  & (addr[17:0]  == 18'h00050)	?	byteenable[1:0]	:	{2{1'b0}};
// register dest_mac_addr1_0 with  writeType: write
wire	[3:0]  we_dest_mac_addr1_0		=	we  & (addr[17:0]  == 18'h00054)	?	byteenable[3:0]	:	{4{1'b0}};
// register dest_mac_addr1_1 with  writeType: write
wire	[1:0]  we_dest_mac_addr1_1		=	we  & (addr[17:0]  == 18'h00058)	?	byteenable[1:0]	:	{2{1'b0}};
// register dest_mac_addr2_0 with  writeType: write
wire	[3:0]  we_dest_mac_addr2_0		=	we  & (addr[17:0]  == 18'h0005c)	?	byteenable[3:0]	:	{4{1'b0}};
// register dest_mac_addr2_1 with  writeType: write
wire	[1:0]  we_dest_mac_addr2_1		=	we  & (addr[17:0]  == 18'h00060)	?	byteenable[1:0]	:	{2{1'b0}};
// register dest_mac_addr3_0 with  writeType: write
wire	[3:0]  we_dest_mac_addr3_0		=	we  & (addr[17:0]  == 18'h00064)	?	byteenable[3:0]	:	{4{1'b0}};
// register dest_mac_addr3_1 with  writeType: write
wire	[1:0]  we_dest_mac_addr3_1		=	we  & (addr[17:0]  == 18'h00068)	?	byteenable[1:0]	:	{2{1'b0}};
// register dest_mac_addr4_0 with  writeType: write
wire	[3:0]  we_dest_mac_addr4_0		=	we  & (addr[17:0]  == 18'h0006c)	?	byteenable[3:0]	:	{4{1'b0}};
// register dest_mac_addr4_1 with  writeType: write
wire	[1:0]  we_dest_mac_addr4_1		=	we  & (addr[17:0]  == 18'h00070)	?	byteenable[1:0]	:	{2{1'b0}};
// register dest_mac_addr5_0 with  writeType: write
wire	[3:0]  we_dest_mac_addr5_0		=	we  & (addr[17:0]  == 18'h00074)	?	byteenable[3:0]	:	{4{1'b0}};
// register dest_mac_addr5_1 with  writeType: write
wire	[1:0]  we_dest_mac_addr5_1		=	we  & (addr[17:0]  == 18'h00078)	?	byteenable[1:0]	:	{2{1'b0}};
// register dest_mac_addr6_0 with  writeType: write
wire	[3:0]  we_dest_mac_addr6_0		=	we  & (addr[17:0]  == 18'h0007c)	?	byteenable[3:0]	:	{4{1'b0}};
// register dest_mac_addr6_1 with  writeType: write
wire	[1:0]  we_dest_mac_addr6_1		=	we  & (addr[17:0]  == 18'h00080)	?	byteenable[1:0]	:	{2{1'b0}};
// register dest_mac_addr7_0 with  writeType: write
wire	[3:0]  we_dest_mac_addr7_0		=	we  & (addr[17:0]  == 18'h00084)	?	byteenable[3:0]	:	{4{1'b0}};
// register dest_mac_addr7_1 with  writeType: write
wire	[1:0]  we_dest_mac_addr7_1		=	we  & (addr[17:0]  == 18'h00088)	?	byteenable[1:0]	:	{2{1'b0}};
// register mac_vlan_tag_0 with  writeType: write
wire	[1:0]  we_mac_vlan_tag_0		=	we  & (addr[17:0]  == 18'h0008c)	?	byteenable[1:0]	:	{2{1'b0}};
// register mac_vlan_tag_1 with  writeType: write
wire	[1:0]  we_mac_vlan_tag_1		=	we  & (addr[17:0]  == 18'h00090)	?	byteenable[1:0]	:	{2{1'b0}};
// register mac_vlan_tag_2 with  writeType: write
wire	[1:0]  we_mac_vlan_tag_2		=	we  & (addr[17:0]  == 18'h00094)	?	byteenable[1:0]	:	{2{1'b0}};
// register mac_vlan_tag_3 with  writeType: write
wire	[1:0]  we_mac_vlan_tag_3		=	we  & (addr[17:0]  == 18'h00098)	?	byteenable[1:0]	:	{2{1'b0}};
// register mac_vlan_tag_4 with  writeType: write
wire	[1:0]  we_mac_vlan_tag_4		=	we  & (addr[17:0]  == 18'h0009c)	?	byteenable[1:0]	:	{2{1'b0}};
// register mac_vlan_tag_5 with  writeType: write
wire	[1:0]  we_mac_vlan_tag_5		=	we  & (addr[17:0]  == 18'h000a0)	?	byteenable[1:0]	:	{2{1'b0}};
// register mac_vlan_tag_6 with  writeType: write
wire	[1:0]  we_mac_vlan_tag_6		=	we  & (addr[17:0]  == 18'h000a4)	?	byteenable[1:0]	:	{2{1'b0}};
// register mac_vlan_tag_7 with  writeType: write
wire	[1:0]  we_mac_vlan_tag_7		=	we  & (addr[17:0]  == 18'h000a8)	?	byteenable[1:0]	:	{2{1'b0}};
// register ipv4_dw0_address with  writeType: write
wire	  we_ipv4_dw0_address		=	we  & (addr[17:0]  == 18'h000b0)	?	byteenable[2]	:	1'b0;
// register ipv4_dw1_address with  writeType: write
wire	[3:0]  we_ipv4_dw1_address		=	we  & (addr[17:0]  == 18'h000b4)	?	byteenable[3:0]	:	{4{1'b0}};
// register ipv4_dw2_address with  writeType: write
wire	  we_ipv4_dw2_address		=	we  & (addr[17:0]  == 18'h000b8)	?	byteenable[3]	:	1'b0;
// register ipv4_src_address_0 with  writeType: write
wire	[3:0]  we_ipv4_src_address_0		=	we  & (addr[17:0]  == 18'h000bc)	?	byteenable[3:0]	:	{4{1'b0}};
// register ipv4_dst_address_0 with  writeType: write
wire	[3:0]  we_ipv4_dst_address_0		=	we  & (addr[17:0]  == 18'h000c0)	?	byteenable[3:0]	:	{4{1'b0}};
// register mudp_dw0_address with  writeType: write
wire	[3:0]  we_mudp_dw0_address		=	we  & (addr[17:0]  == 18'h000c4)	?	byteenable[3:0]	:	{4{1'b0}};
// register mudp_address_0 with  writeType: write
wire	[3:0]  we_mudp_address_0		=	we  & (addr[17:0]  == 18'h000c8)	?	byteenable[3:0]	:	{4{1'b0}};
// register packet_type_enable with  writeType: write
wire	  we_packet_type_enable		=	we  & (addr[17:0]  == 18'h000f4)	?	byteenable[0]	:	1'b0;
// register rx_error_address with  writeType: write
wire	  we_rx_error_address		=	we  & (addr[17:0]  == 18'h000f8)	?	byteenable[0]	:	1'b0;
// register cu_vlanid_match_address with  writeType: write
wire	[1:0]  we_cu_vlanid_match_address		=	we  & (addr[17:0]  == 18'h000fc)	?	byteenable[1:0]	:	{2{1'b0}};
// register ecpri_priority with  writeType: write
wire	  we_ecpri_priority		=	we  & (addr[17:0]  == 18'h00100)	?	byteenable[0]	:	1'b0;
// register ptp_priority with  writeType: write
wire	  we_ptp_priority		=	we  & (addr[17:0]  == 18'h00104)	?	byteenable[0]	:	1'b0;
// register misc_priority with  writeType: write
wire	  we_misc_priority		=	we  & (addr[17:0]  == 18'h00108)	?	byteenable[0]	:	1'b0;
// register pq_starvation with  writeType: write
wire	  we_pq_starvation		=	we  & (addr[17:0]  == 18'h0010c)	?	byteenable[0]	:	1'b0;

// A read byte enable for each register

/* Definitions of REGISTER "ecpri_version" */

// ecpri_version_ip_version
// bitfield description: eCPRI IP Version
// customType:  RO
// hwAccess: RO 
// reset Value signal:  "iprev_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "ecpri_scratch" */

// ecpri_scratch_scratch
// customType:  RW
// hwAccess: RO 
// reset value : 0x00000000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_scratch_scratch <= 32'h00000000;
   end
   else begin
   if (we_ecpri_scratch[0]) begin 
      ecpri_scratch_scratch[7:0]   <=  din[7:0];  //
   end
   if (we_ecpri_scratch[1]) begin 
      ecpri_scratch_scratch[15:8]   <=  din[15:8];  //
   end
   if (we_ecpri_scratch[2]) begin 
      ecpri_scratch_scratch[23:16]   <=  din[23:16];  //
   end
   if (we_ecpri_scratch[3]) begin 
      ecpri_scratch_scratch[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "ecpri_common_ctrl" */

// ecpri_common_ctrl_rev
// bitfield description: 0001b - The interpretation of the eCPRI message shall follow eCPRI specification version 1.0
// customType:  RO
// hwAccess: RO 
// reset value : 4'bxxxx 
// reset Value signal:  "rev_defaultValue_i" 
// NO register generated



// ecpri_common_ctrl_msg4_mode
// bitfield description: 1'b0 - Basic Mode; 1'b1 - Buffer Mode
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_common_ctrl_msg4_mode <= 1'h0;
   end
   else begin
   if (we_ecpri_common_ctrl[0]) begin 
      ecpri_common_ctrl_msg4_mode   <=  din[4];  //
   end
end

// ecpri_common_ctrl_frag_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_common_ctrl_frag_en <= 1'h0;
   end
   else begin
   if (we_ecpri_common_ctrl[0]) begin 
      ecpri_common_ctrl_frag_en   <=  din[5];  //
   end
end

// ecpri_common_ctrl_frag_sz
// bitfield description: 2'b01 - MTU 1500 Bytes; 2'b10 - MTU 9000 Bytes
// customType:  RW
// hwAccess: RO 
// reset value : 0x1 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_common_ctrl_frag_sz <= 2'h1;
   end
   else begin
   if (we_ecpri_common_ctrl[0]) begin 
      ecpri_common_ctrl_frag_sz[1:0]   <=  din[7:6];  //
   end
end

// ecpri_common_ctrl_err_mask
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_common_ctrl_err_mask <= 1'h0;
   end
   else begin
   if (we_ecpri_common_ctrl[1]) begin 
      ecpri_common_ctrl_err_mask   <=  din[8];  //
   end
end

// ecpri_common_ctrl_irq_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_common_ctrl_irq_en <= 1'h0;
   end
   else begin
   if (we_ecpri_common_ctrl[1]) begin 
      ecpri_common_ctrl_irq_en   <=  din[9];  //
   end
end

// ecpri_common_ctrl_mf_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_common_ctrl_mf_en <= 1'h0;
   end
   else begin
   if (we_ecpri_common_ctrl[1]) begin 
      ecpri_common_ctrl_mf_en   <=  din[10];  //
   end
end

// ecpri_common_ctrl_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x000000 
// NO register generated


/* Definitions of REGISTER "ecpri_msg5_ctrl" */

// ecpri_msg5_ctrl_meas_mode
// bitfield description: 1'b0: 1-step operation mode, 1'b1: 2-step operation mode
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 
// reset Value signal:  "msg5_op_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_ctrl_meas_mode <= msg5_op_defaultValue_i;
   end
   else begin
   if (we_ecpri_msg5_ctrl[0]) begin 
      ecpri_msg5_ctrl_meas_mode   <=  din[0];  //
   end
end

// ecpri_msg5_ctrl_meas_id
// bitfield description: Measurement ID
// customType:  RW
// hwAccess: RO 
// reset value : 0x00 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_ctrl_meas_id <= 8'h00;
   end
   else begin
   if (we_ecpri_msg5_ctrl[0]) begin 
      ecpri_msg5_ctrl_meas_id[6:0]   <=  din[7:1];  //
   end
   if (we_ecpri_msg5_ctrl[1]) begin 
      ecpri_msg5_ctrl_meas_id[7]   <=  din[8];  //
   end
end

// ecpri_msg5_ctrl_remote_request
// bitfield description: 1'b0 - Request Action Type; 1'b1 - Remote Request Action Type
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_ctrl_remote_request <= 1'h0;
   end
   else begin
   if (we_ecpri_msg5_ctrl[1]) begin 
      ecpri_msg5_ctrl_remote_request   <=  din[9];  //
   end
end

// ecpri_msg5_ctrl_meas_start
// bitfield description: One way measurement start
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_ctrl_meas_start <= 1'h0;
   end
   else begin
   if (we_ecpri_msg5_ctrl[1]) begin 
      ecpri_msg5_ctrl_meas_start   <=  din[10];  //
   end
end

// ecpri_msg5_ctrl_meas_complete
// bitfield description: One-way measurement completion
// customType:  W1C
// hwAccess: WO1S 
// reset value : 0x0 
// inputPort: ecpri_msg5_ctrl_meas_complete_i 
// hardware levelAccess:  "true" 

reg  ecpri_msg5_ctrl_meas_complete;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_ctrl_meas_complete <= 1'h0;
   end
   else begin
   if (we_ecpri_msg5_ctrl[1]) begin
      ecpri_msg5_ctrl_meas_complete <= ~din[11] & ecpri_msg5_ctrl_meas_complete; // 1 to clear
   end
   else begin
      ecpri_msg5_ctrl_meas_complete<=  ecpri_msg5_ctrl_meas_complete_i | ecpri_msg5_ctrl_meas_complete;
   end
end

// ecpri_msg5_ctrl_dummy_bytes
// bitfield description: Dummy bytes
// customType:  RW
// hwAccess: RO 
// reset value : 0x00 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_ctrl_dummy_bytes <= 8'h00;
   end
   else begin
   if (we_ecpri_msg5_ctrl[1]) begin 
      ecpri_msg5_ctrl_dummy_bytes[3:0]   <=  din[15:12];  //
   end
   if (we_ecpri_msg5_ctrl[2]) begin 
      ecpri_msg5_ctrl_dummy_bytes[7:4]   <=  din[19:16];  //
   end
end

// ecpri_msg5_ctrl_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x000 
// NO register generated


/* Definitions of REGISTER "ecpri_tx_err_msg" */

// ecpri_tx_err_msg_tx_miss_sop_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_tx_miss_sop_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_tx_miss_sop_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_tx_miss_sop_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[0]) begin
      ecpri_tx_err_msg_tx_miss_sop_err <= ~din[0] & ecpri_tx_err_msg_tx_miss_sop_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_tx_miss_sop_err<=  ecpri_tx_err_msg_tx_miss_sop_err_i | ecpri_tx_err_msg_tx_miss_sop_err;
   end
end

// ecpri_tx_err_msg_tx_miss_eop_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_tx_miss_eop_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_tx_miss_eop_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_tx_miss_eop_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[0]) begin
      ecpri_tx_err_msg_tx_miss_eop_err <= ~din[1] & ecpri_tx_err_msg_tx_miss_eop_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_tx_miss_eop_err<=  ecpri_tx_err_msg_tx_miss_eop_err_i | ecpri_tx_err_msg_tx_miss_eop_err;
   end
end

// ecpri_tx_err_msg_tx_overflow_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_tx_overflow_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_tx_overflow_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_tx_overflow_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[0]) begin
      ecpri_tx_err_msg_tx_overflow_err <= ~din[2] & ecpri_tx_err_msg_tx_overflow_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_tx_overflow_err<=  ecpri_tx_err_msg_tx_overflow_err_i | ecpri_tx_err_msg_tx_overflow_err;
   end
end

// ecpri_tx_err_msg_tx_ecc_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_tx_ecc_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_tx_ecc_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_tx_ecc_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[0]) begin
      ecpri_tx_err_msg_tx_ecc_err <= ~din[3] & ecpri_tx_err_msg_tx_ecc_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_tx_ecc_err<=  ecpri_tx_err_msg_tx_ecc_err_i | ecpri_tx_err_msg_tx_ecc_err;
   end
end

// ecpri_tx_err_msg_tx_msg_type_err
// bitfield description: eCPRI packet message type 8 63(Reserved) are received
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_tx_msg_type_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_tx_msg_type_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_tx_msg_type_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[0]) begin
      ecpri_tx_err_msg_tx_msg_type_err <= ~din[4] & ecpri_tx_err_msg_tx_msg_type_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_tx_msg_type_err<=  ecpri_tx_err_msg_tx_msg_type_err_i | ecpri_tx_err_msg_tx_msg_type_err;
   end
end

// ecpri_tx_err_msg_con_timeout_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_con_timeout_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_con_timeout_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_con_timeout_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[0]) begin
      ecpri_tx_err_msg_con_timeout_err <= ~din[5] & ecpri_tx_err_msg_con_timeout_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_con_timeout_err<=  ecpri_tx_err_msg_con_timeout_err_i | ecpri_tx_err_msg_con_timeout_err;
   end
end

// ecpri_tx_err_msg_m_msg_size_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_m_msg_size_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_m_msg_size_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_m_msg_size_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[0]) begin
      ecpri_tx_err_msg_m_msg_size_err <= ~din[6] & ecpri_tx_err_msg_m_msg_size_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_m_msg_size_err<=  ecpri_tx_err_msg_m_msg_size_err_i | ecpri_tx_err_msg_m_msg_size_err;
   end
end

// ecpri_tx_err_msg_s_msg_size_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_s_msg_size_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_s_msg_size_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_s_msg_size_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[0]) begin
      ecpri_tx_err_msg_s_msg_size_err <= ~din[7] & ecpri_tx_err_msg_s_msg_size_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_s_msg_size_err<=  ecpri_tx_err_msg_s_msg_size_err_i | ecpri_tx_err_msg_s_msg_size_err;
   end
end

// ecpri_tx_err_msg_usr_msg_size_err
// bitfield description: Assertion of this register indicate the actual payload size do not match user-enter payload size
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_usr_msg_size_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_usr_msg_size_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_usr_msg_size_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[1]) begin
      ecpri_tx_err_msg_usr_msg_size_err <= ~din[8] & ecpri_tx_err_msg_usr_msg_size_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_usr_msg_size_err<=  ecpri_tx_err_msg_usr_msg_size_err_i | ecpri_tx_err_msg_usr_msg_size_err;
   end
end

// ecpri_tx_err_msg_avst_if_err
// bitfield description: User AVST interface error flag when user do not follow the AVST requirement when ETH_MTU = 9000 is set.
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_tx_err_msg_avst_if_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_tx_err_msg_avst_if_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_tx_err_msg_avst_if_err <= 1'h0;
   end
   else begin
   if (we_ecpri_tx_err_msg[1]) begin
      ecpri_tx_err_msg_avst_if_err <= ~din[9] & ecpri_tx_err_msg_avst_if_err; // 1 to clear
   end
   else begin
      ecpri_tx_err_msg_avst_if_err<=  ecpri_tx_err_msg_avst_if_err_i | ecpri_tx_err_msg_avst_if_err;
   end
end

// ecpri_tx_err_msg_reserved
// bitfield description: reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x000000 
// NO register generated


/* Definitions of REGISTER "ecpri_rx_err_msg" */

// ecpri_rx_err_msg_rx_miss_sop_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_rx_miss_sop_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_rx_miss_sop_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_rx_miss_sop_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[0]) begin
      ecpri_rx_err_msg_rx_miss_sop_err <= ~din[0] & ecpri_rx_err_msg_rx_miss_sop_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_rx_miss_sop_err<=  ecpri_rx_err_msg_rx_miss_sop_err_i | ecpri_rx_err_msg_rx_miss_sop_err;
   end
end

// ecpri_rx_err_msg_rx_miss_eop_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_rx_miss_eop_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_rx_miss_eop_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_rx_miss_eop_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[0]) begin
      ecpri_rx_err_msg_rx_miss_eop_err <= ~din[1] & ecpri_rx_err_msg_rx_miss_eop_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_rx_miss_eop_err<=  ecpri_rx_err_msg_rx_miss_eop_err_i | ecpri_rx_err_msg_rx_miss_eop_err;
   end
end

// ecpri_rx_err_msg_rx_overflow_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_rx_overflow_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_rx_overflow_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_rx_overflow_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[0]) begin
      ecpri_rx_err_msg_rx_overflow_err <= ~din[2] & ecpri_rx_err_msg_rx_overflow_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_rx_overflow_err<=  ecpri_rx_err_msg_rx_overflow_err_i | ecpri_rx_err_msg_rx_overflow_err;
   end
end

// ecpri_rx_err_msg_rx_ecc_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_rx_ecc_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_rx_ecc_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_rx_ecc_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[0]) begin
      ecpri_rx_err_msg_rx_ecc_err <= ~din[3] & ecpri_rx_err_msg_rx_ecc_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_rx_ecc_err<=  ecpri_rx_err_msg_rx_ecc_err_i | ecpri_rx_err_msg_rx_ecc_err;
   end
end

// ecpri_rx_err_msg_rx_msg_type_err
// bitfield description: eCPRI packet message type 8 63(Reserved) are received
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_rx_msg_type_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_rx_msg_type_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_rx_msg_type_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[0]) begin
      ecpri_rx_err_msg_rx_msg_type_err <= ~din[4] & ecpri_rx_err_msg_rx_msg_type_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_rx_msg_type_err<=  ecpri_rx_err_msg_rx_msg_type_err_i | ecpri_rx_err_msg_rx_msg_type_err;
   end
end

// ecpri_rx_err_msg_rx_meas_id_err
// bitfield description: Invalid measurement ID received
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_rx_meas_id_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_rx_meas_id_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_rx_meas_id_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[0]) begin
      ecpri_rx_err_msg_rx_meas_id_err <= ~din[5] & ecpri_rx_err_msg_rx_meas_id_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_rx_meas_id_err<=  ecpri_rx_err_msg_rx_meas_id_err_i | ecpri_rx_err_msg_rx_meas_id_err;
   end
end

// ecpri_rx_err_msg_inv_msg5_req_err
// bitfield description: This bit indicate the eCPRI message 5 packet parser is receiving invalid eCPRI action type
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_inv_msg5_req_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_inv_msg5_req_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_inv_msg5_req_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[0]) begin
      ecpri_rx_err_msg_inv_msg5_req_err <= ~din[6] & ecpri_rx_err_msg_inv_msg5_req_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_inv_msg5_req_err<=  ecpri_rx_err_msg_inv_msg5_req_err_i | ecpri_rx_err_msg_inv_msg5_req_err;
   end
end

// ecpri_rx_err_msg_inv_msg5_fup_err
// bitfield description: This bit indicate the eCPRI message 5 packet parser is receiving invalid eCPRI action type
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_inv_msg5_fup_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_inv_msg5_fup_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_inv_msg5_fup_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[0]) begin
      ecpri_rx_err_msg_inv_msg5_fup_err <= ~din[7] & ecpri_rx_err_msg_inv_msg5_fup_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_inv_msg5_fup_err<=  ecpri_rx_err_msg_inv_msg5_fup_err_i | ecpri_rx_err_msg_inv_msg5_fup_err;
   end
end

// ecpri_rx_err_msg_inv_msg5_resp_err
// bitfield description: This bit indicate the eCPRI message 5 packet parser is receiving invalid eCPRI action type
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_inv_msg5_resp_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_inv_msg5_resp_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_inv_msg5_resp_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[1]) begin
      ecpri_rx_err_msg_inv_msg5_resp_err <= ~din[8] & ecpri_rx_err_msg_inv_msg5_resp_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_inv_msg5_resp_err<=  ecpri_rx_err_msg_inv_msg5_resp_err_i | ecpri_rx_err_msg_inv_msg5_resp_err;
   end
end

// ecpri_rx_err_msg_msg5_pkt_err
// bitfield description: This bit indicate eCPRI RX receive an error MSG5 packet from MAC
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_msg5_pkt_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_msg5_pkt_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_msg5_pkt_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[1]) begin
      ecpri_rx_err_msg_msg5_pkt_err <= ~din[9] & ecpri_rx_err_msg_msg5_pkt_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_msg5_pkt_err<=  ecpri_rx_err_msg_msg5_pkt_err_i | ecpri_rx_err_msg_msg5_pkt_err;
   end
end

// ecpri_rx_err_msg_no_resp_msg5_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_no_resp_msg5_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_no_resp_msg5_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_no_resp_msg5_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[1]) begin
      ecpri_rx_err_msg_no_resp_msg5_err <= ~din[10] & ecpri_rx_err_msg_no_resp_msg5_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_no_resp_msg5_err<=  ecpri_rx_err_msg_no_resp_msg5_err_i | ecpri_rx_err_msg_no_resp_msg5_err;
   end
end

// ecpri_rx_err_msg_no_rst_resp_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_no_rst_resp_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_no_rst_resp_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_no_rst_resp_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[1]) begin
      ecpri_rx_err_msg_no_rst_resp_err <= ~din[11] & ecpri_rx_err_msg_no_rst_resp_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_no_rst_resp_err<=  ecpri_rx_err_msg_no_rst_resp_err_i | ecpri_rx_err_msg_no_rst_resp_err;
   end
end

// ecpri_rx_err_msg_no_mem_resp_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_no_mem_resp_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_no_mem_resp_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_no_mem_resp_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[1]) begin
      ecpri_rx_err_msg_no_mem_resp_err <= ~din[12] & ecpri_rx_err_msg_no_mem_resp_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_no_mem_resp_err<=  ecpri_rx_err_msg_no_mem_resp_err_i | ecpri_rx_err_msg_no_mem_resp_err;
   end
end

// ecpri_rx_err_msg_msg4_buffer_mode_err
// bitfield description: 1b0 No error, 1b1 Pending request queue overflow
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_msg4_buffer_mode_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_msg4_buffer_mode_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_msg4_buffer_mode_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[1]) begin
      ecpri_rx_err_msg_msg4_buffer_mode_err <= ~din[13] & ecpri_rx_err_msg_msg4_buffer_mode_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_msg4_buffer_mode_err<=  ecpri_rx_err_msg_msg4_buffer_mode_err_i | ecpri_rx_err_msg_msg4_buffer_mode_err;
   end
end

// ecpri_rx_err_msg_payload_length_mismatch_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_payload_length_mismatch_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_payload_length_mismatch_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_payload_length_mismatch_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[1]) begin
      ecpri_rx_err_msg_payload_length_mismatch_err <= ~din[14] & ecpri_rx_err_msg_payload_length_mismatch_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_payload_length_mismatch_err<=  ecpri_rx_err_msg_payload_length_mismatch_err_i | ecpri_rx_err_msg_payload_length_mismatch_err;
   end
end

// ecpri_rx_err_msg_invalid_concan_bit_received_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_invalid_concan_bit_received_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_invalid_concan_bit_received_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_invalid_concan_bit_received_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[1]) begin
      ecpri_rx_err_msg_invalid_concan_bit_received_err <= ~din[15] & ecpri_rx_err_msg_invalid_concan_bit_received_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_invalid_concan_bit_received_err<=  ecpri_rx_err_msg_invalid_concan_bit_received_err_i | ecpri_rx_err_msg_invalid_concan_bit_received_err;
   end
end

// ecpri_rx_err_msg_rx_in_avst_err
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: ecpri_rx_err_msg_rx_in_avst_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  ecpri_rx_err_msg_rx_in_avst_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_rx_err_msg_rx_in_avst_err <= 1'h0;
   end
   else begin
   if (we_ecpri_rx_err_msg[2]) begin
      ecpri_rx_err_msg_rx_in_avst_err <= ~din[16] & ecpri_rx_err_msg_rx_in_avst_err; // 1 to clear
   end
   else begin
      ecpri_rx_err_msg_rx_in_avst_err<=  ecpri_rx_err_msg_rx_in_avst_err_i | ecpri_rx_err_msg_rx_in_avst_err;
   end
end

// ecpri_rx_err_msg_reserved
// bitfield description: reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "ecpri_err_mask_msg" */

// ecpri_err_mask_msg_inv_msg5_req_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_inv_msg5_req_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_inv_msg5_req_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[0]) begin 
      ecpri_err_mask_msg_inv_msg5_req_err_en   <=  din[0];  //
   end
end

// ecpri_err_mask_msg_inv_msg5_fup_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_inv_msg5_fup_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_inv_msg5_fup_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[0]) begin 
      ecpri_err_mask_msg_inv_msg5_fup_err_en   <=  din[1];  //
   end
end

// ecpri_err_mask_msg_inv_msg5_resp_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_inv_msg5_resp_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_inv_msg5_resp_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[0]) begin 
      ecpri_err_mask_msg_inv_msg5_resp_err_en   <=  din[2];  //
   end
end

// ecpri_err_mask_msg_meas_id_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_meas_id_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_meas_id_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[0]) begin 
      ecpri_err_mask_msg_meas_id_err_en   <=  din[3];  //
   end
end

// ecpri_err_mask_msg_msg_type_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_msg_type_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_msg_type_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[0]) begin 
      ecpri_err_mask_msg_msg_type_err_en   <=  din[4];  //
   end
end

// ecpri_err_mask_msg_msg5_pkt_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_msg5_pkt_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_msg5_pkt_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[0]) begin 
      ecpri_err_mask_msg_msg5_pkt_err_en   <=  din[5];  //
   end
end

// ecpri_err_mask_msg_no_resp_msg5_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_no_resp_msg5_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_no_resp_msg5_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[0]) begin 
      ecpri_err_mask_msg_no_resp_msg5_err_en   <=  din[6];  //
   end
end

// ecpri_err_mask_msg_con_timeout_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_con_timeout_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_con_timeout_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[0]) begin 
      ecpri_err_mask_msg_con_timeout_err_en   <=  din[7];  //
   end
end

// ecpri_err_mask_msg_m_msg_size_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_m_msg_size_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_m_msg_size_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[1]) begin 
      ecpri_err_mask_msg_m_msg_size_err_en   <=  din[8];  //
   end
end

// ecpri_err_mask_msg_s_msg_size_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_s_msg_size_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_s_msg_size_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[1]) begin 
      ecpri_err_mask_msg_s_msg_size_err_en   <=  din[9];  //
   end
end

// ecpri_err_mask_msg_no_rst_resp_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_no_rst_resp_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_no_rst_resp_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[1]) begin 
      ecpri_err_mask_msg_no_rst_resp_err_en   <=  din[10];  //
   end
end

// ecpri_err_mask_msg_no_mem_resp_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_no_mem_resp_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_no_mem_resp_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[1]) begin 
      ecpri_err_mask_msg_no_mem_resp_err_en   <=  din[11];  //
   end
end

// ecpri_err_mask_msg_miss_sop_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_miss_sop_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_miss_sop_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[1]) begin 
      ecpri_err_mask_msg_miss_sop_err_en   <=  din[12];  //
   end
end

// ecpri_err_mask_msg_miss_eop_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_miss_eop_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_miss_eop_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[1]) begin 
      ecpri_err_mask_msg_miss_eop_err_en   <=  din[13];  //
   end
end

// ecpri_err_mask_msg_overflow_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_overflow_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_overflow_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[1]) begin 
      ecpri_err_mask_msg_overflow_err_en   <=  din[14];  //
   end
end

// ecpri_err_mask_msg_ecc_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_ecc_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_ecc_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[1]) begin 
      ecpri_err_mask_msg_ecc_err_en   <=  din[15];  //
   end
end

// ecpri_err_mask_msg_msg4_buffer_mode_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_msg4_buffer_mode_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_msg4_buffer_mode_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[2]) begin 
      ecpri_err_mask_msg_msg4_buffer_mode_err_en   <=  din[16];  //
   end
end

// ecpri_err_mask_msg_payload_length_mismatch_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_payload_length_mismatch_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_payload_length_mismatch_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[2]) begin 
      ecpri_err_mask_msg_payload_length_mismatch_err_en   <=  din[17];  //
   end
end

// ecpri_err_mask_msg_invalid_concan_bit_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_invalid_concan_bit_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_invalid_concan_bit_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[2]) begin 
      ecpri_err_mask_msg_invalid_concan_bit_err_en   <=  din[18];  //
   end
end

// ecpri_err_mask_msg_usr_msg_size_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_usr_msg_size_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_usr_msg_size_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[2]) begin 
      ecpri_err_mask_msg_usr_msg_size_err_en   <=  din[19];  //
   end
end

// ecpri_err_mask_msg_ipv4_chksum_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_ipv4_chksum_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_ipv4_chksum_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[2]) begin 
      ecpri_err_mask_msg_ipv4_chksum_err_en   <=  din[20];  //
   end
end

// ecpri_err_mask_msg_udp_chksum_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_udp_chksum_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_udp_chksum_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[2]) begin 
      ecpri_err_mask_msg_udp_chksum_err_en   <=  din[21];  //
   end
end

// ecpri_err_mask_msg_avst_if_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_avst_if_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_avst_if_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[2]) begin 
      ecpri_err_mask_msg_avst_if_err_en   <=  din[22];  //
   end
end

// ecpri_err_mask_msg_rx_in_avst_err_en
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 

reg  ecpri_err_mask_msg_rx_in_avst_err_en;

always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_mask_msg_rx_in_avst_err_en <= 1'h0;
   end
   else begin
   if (we_ecpri_err_mask_msg[2]) begin 
      ecpri_err_mask_msg_rx_in_avst_err_en   <=  din[23];  //
   end
end

// ecpri_err_mask_msg_reserved
// bitfield description: reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x00 
// NO register generated


/* Definitions of REGISTER "ecpri_err_log_msg" */

// ecpri_err_log_msg_mem_acc_id_log_err
// customType:  W1C
// hwAccess: WO 
// reset value : 0x00 
// inputPort: ecpri_err_log_msg_mem_acc_id_log_err_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_err_log_msg_mem_acc_id_log_err"  

reg [7:0] ecpri_err_log_msg_mem_acc_id_log_err; // 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_log_msg_mem_acc_id_log_err <= 8'h00;
   end
   else begin
   if (we_ecpri_err_log_msg[0]) begin
      ecpri_err_log_msg_mem_acc_id_log_err[7:0] <= ~din[7:0] & ecpri_err_log_msg_mem_acc_id_log_err[7:0]; // 1 to clear
   end
   else if (we_ecpri_err_log_msg_mem_acc_id_log_err && !we_ecpri_err_log_msg[0]) begin
      ecpri_err_log_msg_mem_acc_id_log_err[7:0]   <=  ecpri_err_log_msg_mem_acc_id_log_err_i[7:0];
   end	
end

// ecpri_err_log_msg_msg_type_log_err
// customType:  W1C
// hwAccess: WO 
// reset value : 0x00 
// inputPort: ecpri_err_log_msg_msg_type_log_err_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_err_log_msg_msg_type_log_err"  

reg [5:0] ecpri_err_log_msg_msg_type_log_err; // 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_log_msg_msg_type_log_err <= 6'h00;
   end
   else begin
   if (we_ecpri_err_log_msg[1]) begin
      ecpri_err_log_msg_msg_type_log_err[5:0] <= ~din[13:8] & ecpri_err_log_msg_msg_type_log_err[5:0]; // 1 to clear
   end
   else if (we_ecpri_err_log_msg_msg_type_log_err && !we_ecpri_err_log_msg[1]) begin
      ecpri_err_log_msg_msg_type_log_err[5:0]   <=  ecpri_err_log_msg_msg_type_log_err_i[5:0];
   end	
end

// ecpri_err_log_msg_msg5_actype_log_err
// customType:  W1C
// hwAccess: WO 
// reset value : 0x00 
// inputPort: ecpri_err_log_msg_msg5_actype_log_err_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_err_log_msg_msg5_actype_log_err"  

reg [7:0] ecpri_err_log_msg_msg5_actype_log_err; // 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_log_msg_msg5_actype_log_err <= 8'h00;
   end
   else begin
   if (we_ecpri_err_log_msg[1]) begin
      ecpri_err_log_msg_msg5_actype_log_err[1:0] <= ~din[15:14] & ecpri_err_log_msg_msg5_actype_log_err[1:0]; // 1 to clear
   end
   if (we_ecpri_err_log_msg[2]) begin
      ecpri_err_log_msg_msg5_actype_log_err[7:2] <= ~din[21:16] & ecpri_err_log_msg_msg5_actype_log_err[7:2]; // 1 to clear
   end
   else if (we_ecpri_err_log_msg_msg5_actype_log_err && !we_ecpri_err_log_msg[1] && !we_ecpri_err_log_msg[2]) begin
      ecpri_err_log_msg_msg5_actype_log_err[7:0]   <=  ecpri_err_log_msg_msg5_actype_log_err_i[7:0];
   end	
end

// ecpri_err_log_msg_meas_id_log_err
// customType:  W1C
// hwAccess: WO 
// reset value : 0x00 
// inputPort: ecpri_err_log_msg_meas_id_log_err_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_err_log_msg_meas_id_log_err"  

reg [7:0] ecpri_err_log_msg_meas_id_log_err; // 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_err_log_msg_meas_id_log_err <= 8'h00;
   end
   else begin
   if (we_ecpri_err_log_msg[2]) begin
      ecpri_err_log_msg_meas_id_log_err[1:0] <= ~din[23:22] & ecpri_err_log_msg_meas_id_log_err[1:0]; // 1 to clear
   end
   if (we_ecpri_err_log_msg[3]) begin
      ecpri_err_log_msg_meas_id_log_err[7:2] <= ~din[29:24] & ecpri_err_log_msg_meas_id_log_err[7:2]; // 1 to clear
   end
   else if (we_ecpri_err_log_msg_meas_id_log_err && !we_ecpri_err_log_msg[2] && !we_ecpri_err_log_msg[3]) begin
      ecpri_err_log_msg_meas_id_log_err[7:0]   <=  ecpri_err_log_msg_meas_id_log_err_i[7:0];
   end	
end

// ecpri_err_log_msg_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0 
// NO register generated


/* Definitions of REGISTER "ecpri_msg5_cv0" */

// ecpri_msg5_cv0_msg5_cv0
// bitfield description: LSB
// customType:  RW
// hwAccess: RW 
// reset value : 0x00000000 
// inputPort: ecpri_msg5_cv0_msg5_cv0_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_msg5_cv0_msg5_cv0"  



always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_cv0_msg5_cv0 <= 32'h00000000;
   end
   else begin
   if (we_ecpri_msg5_cv0[0]) begin 
      ecpri_msg5_cv0_msg5_cv0[7:0]   <=  din[7:0];  //
   end
   if (we_ecpri_msg5_cv0[1]) begin 
      ecpri_msg5_cv0_msg5_cv0[15:8]   <=  din[15:8];  //
   end
   if (we_ecpri_msg5_cv0[2]) begin 
      ecpri_msg5_cv0_msg5_cv0[23:16]   <=  din[23:16];  //
   end
   if (we_ecpri_msg5_cv0[3]) begin 
      ecpri_msg5_cv0_msg5_cv0[31:24]   <=  din[31:24];  //
   end
   else if (we_ecpri_msg5_cv0_msg5_cv0 && !we_ecpri_msg5_cv0[0] && !we_ecpri_msg5_cv0[1] && !we_ecpri_msg5_cv0[2] && !we_ecpri_msg5_cv0[3]) begin
      ecpri_msg5_cv0_msg5_cv0[31:0]   <=  ecpri_msg5_cv0_msg5_cv0_i[31:0];
   end	
end
/* Definitions of REGISTER "ecpri_msg5_cv1" */

// ecpri_msg5_cv1_msg5_cv1
// bitfield description: MSB
// customType:  RW
// hwAccess: RW 
// reset value : 0x00000000 
// inputPort: ecpri_msg5_cv1_msg5_cv1_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_msg5_cv1_msg5_cv1"  



always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_cv1_msg5_cv1 <= 32'h00000000;
   end
   else begin
   if (we_ecpri_msg5_cv1[0]) begin 
      ecpri_msg5_cv1_msg5_cv1[7:0]   <=  din[7:0];  //
   end
   if (we_ecpri_msg5_cv1[1]) begin 
      ecpri_msg5_cv1_msg5_cv1[15:8]   <=  din[15:8];  //
   end
   if (we_ecpri_msg5_cv1[2]) begin 
      ecpri_msg5_cv1_msg5_cv1[23:16]   <=  din[23:16];  //
   end
   if (we_ecpri_msg5_cv1[3]) begin 
      ecpri_msg5_cv1_msg5_cv1[31:24]   <=  din[31:24];  //
   end
   else if (we_ecpri_msg5_cv1_msg5_cv1 && !we_ecpri_msg5_cv1[0] && !we_ecpri_msg5_cv1[1] && !we_ecpri_msg5_cv1[2] && !we_ecpri_msg5_cv1[3]) begin
      ecpri_msg5_cv1_msg5_cv1[31:0]   <=  ecpri_msg5_cv1_msg5_cv1_i[31:0];
   end	
end
/* Definitions of REGISTER "ecpri_msg5_td0" */

// ecpri_msg5_td0_ecpri_msg5_td0
// customType:  RW
// hwAccess: RW 
// reset value : 0x00000000 
// inputPort: ecpri_msg5_td0_ecpri_msg5_td0_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_msg5_td0_ecpri_msg5_td0"  



always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_td0_ecpri_msg5_td0 <= 32'h00000000;
   end
   else begin
   if (we_ecpri_msg5_td0[0]) begin 
      ecpri_msg5_td0_ecpri_msg5_td0[7:0]   <=  din[7:0];  //
   end
   if (we_ecpri_msg5_td0[1]) begin 
      ecpri_msg5_td0_ecpri_msg5_td0[15:8]   <=  din[15:8];  //
   end
   if (we_ecpri_msg5_td0[2]) begin 
      ecpri_msg5_td0_ecpri_msg5_td0[23:16]   <=  din[23:16];  //
   end
   if (we_ecpri_msg5_td0[3]) begin 
      ecpri_msg5_td0_ecpri_msg5_td0[31:24]   <=  din[31:24];  //
   end
   else if (we_ecpri_msg5_td0_ecpri_msg5_td0 && !we_ecpri_msg5_td0[0] && !we_ecpri_msg5_td0[1] && !we_ecpri_msg5_td0[2] && !we_ecpri_msg5_td0[3]) begin
      ecpri_msg5_td0_ecpri_msg5_td0[31:0]   <=  ecpri_msg5_td0_ecpri_msg5_td0_i[31:0];
   end	
end
/* Definitions of REGISTER "ecpri_msg5_td1" */

// ecpri_msg5_td1_ecpri_msg5_td1
// customType:  RW
// hwAccess: RW 
// reset value : 0x00000000 
// inputPort: ecpri_msg5_td1_ecpri_msg5_td1_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_msg5_td1_ecpri_msg5_td1"  



always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_td1_ecpri_msg5_td1 <= 32'h00000000;
   end
   else begin
   if (we_ecpri_msg5_td1[0]) begin 
      ecpri_msg5_td1_ecpri_msg5_td1[7:0]   <=  din[7:0];  //
   end
   if (we_ecpri_msg5_td1[1]) begin 
      ecpri_msg5_td1_ecpri_msg5_td1[15:8]   <=  din[15:8];  //
   end
   if (we_ecpri_msg5_td1[2]) begin 
      ecpri_msg5_td1_ecpri_msg5_td1[23:16]   <=  din[23:16];  //
   end
   if (we_ecpri_msg5_td1[3]) begin 
      ecpri_msg5_td1_ecpri_msg5_td1[31:24]   <=  din[31:24];  //
   end
   else if (we_ecpri_msg5_td1_ecpri_msg5_td1 && !we_ecpri_msg5_td1[0] && !we_ecpri_msg5_td1[1] && !we_ecpri_msg5_td1[2] && !we_ecpri_msg5_td1[3]) begin
      ecpri_msg5_td1_ecpri_msg5_td1[31:0]   <=  ecpri_msg5_td1_ecpri_msg5_td1_i[31:0];
   end	
end
/* Definitions of REGISTER "ecpri_msg5_td2" */

// ecpri_msg5_td2_ecpri_msg5_td2
// bitfield description: eCPRI Message 5 Transport Delay, Bytes [9:8]
// customType:  RW
// hwAccess: RW 
// reset value : 0x0000 
// inputPort: ecpri_msg5_td2_ecpri_msg5_td2_i 
// outputPort:  "" 
// hardware write enable:  "we_ecpri_msg5_td2_ecpri_msg5_td2"  



always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_msg5_td2_ecpri_msg5_td2 <= 16'h0000;
   end
   else begin
   if (we_ecpri_msg5_td2[0]) begin 
      ecpri_msg5_td2_ecpri_msg5_td2[7:0]   <=  din[7:0];  //
   end
   if (we_ecpri_msg5_td2[1]) begin 
      ecpri_msg5_td2_ecpri_msg5_td2[15:8]   <=  din[15:8];  //
   end
   else if (we_ecpri_msg5_td2_ecpri_msg5_td2 && !we_ecpri_msg5_td2[0] && !we_ecpri_msg5_td2[1]) begin
      ecpri_msg5_td2_ecpri_msg5_td2[15:0]   <=  ecpri_msg5_td2_ecpri_msg5_td2_i[15:0];
   end	
end

// ecpri_msg5_td2_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "eth_frame_scratch" */

// eth_frame_scratch_ethfrm_scratch
// customType:  RW
// hwAccess: RO 
// reset value : 0x00000000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      eth_frame_scratch_ethfrm_scratch <= 32'h00000000;
   end
   else begin
   if (we_eth_frame_scratch[0]) begin 
      eth_frame_scratch_ethfrm_scratch[7:0]   <=  din[7:0];  //
   end
   if (we_eth_frame_scratch[1]) begin 
      eth_frame_scratch_ethfrm_scratch[15:8]   <=  din[15:8];  //
   end
   if (we_eth_frame_scratch[2]) begin 
      eth_frame_scratch_ethfrm_scratch[23:16]   <=  din[23:16];  //
   end
   if (we_eth_frame_scratch[3]) begin 
      eth_frame_scratch_ethfrm_scratch[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "source_mac_addr0_0" */

// source_mac_addr0_0_mac_sa_addr0_0
// bitfield description: Lower four bytes of the source MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "source_mac_addr0_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      source_mac_addr0_0_mac_sa_addr0_0 <= source_mac_addr0_0_defaultValue_i;
   end
   else begin
   if (we_source_mac_addr0_0[0]) begin 
      source_mac_addr0_0_mac_sa_addr0_0[7:0]   <=  din[7:0];  //
   end
   if (we_source_mac_addr0_0[1]) begin 
      source_mac_addr0_0_mac_sa_addr0_0[15:8]   <=  din[15:8];  //
   end
   if (we_source_mac_addr0_0[2]) begin 
      source_mac_addr0_0_mac_sa_addr0_0[23:16]   <=  din[23:16];  //
   end
   if (we_source_mac_addr0_0[3]) begin 
      source_mac_addr0_0_mac_sa_addr0_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "source_mac_addr0_1" */

// source_mac_addr0_1_mac_sa_addr0_1
// bitfield description: Upper two bytes of the source MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "source_mac_addr0_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      source_mac_addr0_1_mac_sa_addr0_1 <= source_mac_addr0_1_defaultValue_i;
   end
   else begin
   if (we_source_mac_addr0_1[0]) begin 
      source_mac_addr0_1_mac_sa_addr0_1[7:0]   <=  din[7:0];  //
   end
   if (we_source_mac_addr0_1[1]) begin 
      source_mac_addr0_1_mac_sa_addr0_1[15:8]   <=  din[15:8];  //
   end
end

// source_mac_addr0_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "dest_mac_addr0_0" */

// dest_mac_addr0_0_mac_addr0_0
// bitfield description: Lower four bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "dest_mac_addr0_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr0_0_mac_addr0_0 <= dest_mac_addr0_0_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr0_0[0]) begin 
      dest_mac_addr0_0_mac_addr0_0[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr0_0[1]) begin 
      dest_mac_addr0_0_mac_addr0_0[15:8]   <=  din[15:8];  //
   end
   if (we_dest_mac_addr0_0[2]) begin 
      dest_mac_addr0_0_mac_addr0_0[23:16]   <=  din[23:16];  //
   end
   if (we_dest_mac_addr0_0[3]) begin 
      dest_mac_addr0_0_mac_addr0_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "dest_mac_addr0_1" */

// dest_mac_addr0_1_mac_addr0_1
// bitfield description: Upper two bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "dest_mac_addr0_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr0_1_mac_addr0_1 <= dest_mac_addr0_1_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr0_1[0]) begin 
      dest_mac_addr0_1_mac_addr0_1[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr0_1[1]) begin 
      dest_mac_addr0_1_mac_addr0_1[15:8]   <=  din[15:8];  //
   end
end

// dest_mac_addr0_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "dest_mac_addr1_0" */

// dest_mac_addr1_0_mac_addr1_0
// bitfield description: Lower four bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "dest_mac_addr1_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr1_0_mac_addr1_0 <= dest_mac_addr1_0_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr1_0[0]) begin 
      dest_mac_addr1_0_mac_addr1_0[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr1_0[1]) begin 
      dest_mac_addr1_0_mac_addr1_0[15:8]   <=  din[15:8];  //
   end
   if (we_dest_mac_addr1_0[2]) begin 
      dest_mac_addr1_0_mac_addr1_0[23:16]   <=  din[23:16];  //
   end
   if (we_dest_mac_addr1_0[3]) begin 
      dest_mac_addr1_0_mac_addr1_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "dest_mac_addr1_1" */

// dest_mac_addr1_1_mac_addr1_1
// bitfield description: Upper two bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "dest_mac_addr1_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr1_1_mac_addr1_1 <= dest_mac_addr1_1_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr1_1[0]) begin 
      dest_mac_addr1_1_mac_addr1_1[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr1_1[1]) begin 
      dest_mac_addr1_1_mac_addr1_1[15:8]   <=  din[15:8];  //
   end
end

// dest_mac_addr1_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "dest_mac_addr2_0" */

// dest_mac_addr2_0_mac_addr2_0
// bitfield description: Lower four bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "dest_mac_addr2_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr2_0_mac_addr2_0 <= dest_mac_addr2_0_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr2_0[0]) begin 
      dest_mac_addr2_0_mac_addr2_0[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr2_0[1]) begin 
      dest_mac_addr2_0_mac_addr2_0[15:8]   <=  din[15:8];  //
   end
   if (we_dest_mac_addr2_0[2]) begin 
      dest_mac_addr2_0_mac_addr2_0[23:16]   <=  din[23:16];  //
   end
   if (we_dest_mac_addr2_0[3]) begin 
      dest_mac_addr2_0_mac_addr2_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "dest_mac_addr2_1" */

// dest_mac_addr2_1_mac_addr2_1
// bitfield description: Upper two bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "dest_mac_addr2_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr2_1_mac_addr2_1 <= dest_mac_addr2_1_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr2_1[0]) begin 
      dest_mac_addr2_1_mac_addr2_1[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr2_1[1]) begin 
      dest_mac_addr2_1_mac_addr2_1[15:8]   <=  din[15:8];  //
   end
end

// dest_mac_addr2_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "dest_mac_addr3_0" */

// dest_mac_addr3_0_mac_addr3_0
// bitfield description: Lower four bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "dest_mac_addr3_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr3_0_mac_addr3_0 <= dest_mac_addr3_0_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr3_0[0]) begin 
      dest_mac_addr3_0_mac_addr3_0[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr3_0[1]) begin 
      dest_mac_addr3_0_mac_addr3_0[15:8]   <=  din[15:8];  //
   end
   if (we_dest_mac_addr3_0[2]) begin 
      dest_mac_addr3_0_mac_addr3_0[23:16]   <=  din[23:16];  //
   end
   if (we_dest_mac_addr3_0[3]) begin 
      dest_mac_addr3_0_mac_addr3_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "dest_mac_addr3_1" */

// dest_mac_addr3_1_mac_addr3_1
// bitfield description: Upper two bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "dest_mac_addr3_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr3_1_mac_addr3_1 <= dest_mac_addr3_1_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr3_1[0]) begin 
      dest_mac_addr3_1_mac_addr3_1[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr3_1[1]) begin 
      dest_mac_addr3_1_mac_addr3_1[15:8]   <=  din[15:8];  //
   end
end

// dest_mac_addr3_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "dest_mac_addr4_0" */

// dest_mac_addr4_0_mac_addr4_0
// bitfield description: Lower four bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "dest_mac_addr4_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr4_0_mac_addr4_0 <= dest_mac_addr4_0_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr4_0[0]) begin 
      dest_mac_addr4_0_mac_addr4_0[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr4_0[1]) begin 
      dest_mac_addr4_0_mac_addr4_0[15:8]   <=  din[15:8];  //
   end
   if (we_dest_mac_addr4_0[2]) begin 
      dest_mac_addr4_0_mac_addr4_0[23:16]   <=  din[23:16];  //
   end
   if (we_dest_mac_addr4_0[3]) begin 
      dest_mac_addr4_0_mac_addr4_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "dest_mac_addr4_1" */

// dest_mac_addr4_1_mac_addr4_1
// bitfield description: Upper two bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "dest_mac_addr4_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr4_1_mac_addr4_1 <= dest_mac_addr4_1_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr4_1[0]) begin 
      dest_mac_addr4_1_mac_addr4_1[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr4_1[1]) begin 
      dest_mac_addr4_1_mac_addr4_1[15:8]   <=  din[15:8];  //
   end
end

// dest_mac_addr4_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "dest_mac_addr5_0" */

// dest_mac_addr5_0_mac_addr5_0
// bitfield description: Lower four bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "dest_mac_addr5_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr5_0_mac_addr5_0 <= dest_mac_addr5_0_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr5_0[0]) begin 
      dest_mac_addr5_0_mac_addr5_0[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr5_0[1]) begin 
      dest_mac_addr5_0_mac_addr5_0[15:8]   <=  din[15:8];  //
   end
   if (we_dest_mac_addr5_0[2]) begin 
      dest_mac_addr5_0_mac_addr5_0[23:16]   <=  din[23:16];  //
   end
   if (we_dest_mac_addr5_0[3]) begin 
      dest_mac_addr5_0_mac_addr5_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "dest_mac_addr5_1" */

// dest_mac_addr5_1_mac_addr5_1
// bitfield description: Upper two bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "dest_mac_addr5_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr5_1_mac_addr5_1 <= dest_mac_addr5_1_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr5_1[0]) begin 
      dest_mac_addr5_1_mac_addr5_1[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr5_1[1]) begin 
      dest_mac_addr5_1_mac_addr5_1[15:8]   <=  din[15:8];  //
   end
end

// dest_mac_addr5_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "dest_mac_addr6_0" */

// dest_mac_addr6_0_mac_addr6_0
// bitfield description: Lower four bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "dest_mac_addr6_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr6_0_mac_addr6_0 <= dest_mac_addr6_0_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr6_0[0]) begin 
      dest_mac_addr6_0_mac_addr6_0[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr6_0[1]) begin 
      dest_mac_addr6_0_mac_addr6_0[15:8]   <=  din[15:8];  //
   end
   if (we_dest_mac_addr6_0[2]) begin 
      dest_mac_addr6_0_mac_addr6_0[23:16]   <=  din[23:16];  //
   end
   if (we_dest_mac_addr6_0[3]) begin 
      dest_mac_addr6_0_mac_addr6_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "dest_mac_addr6_1" */

// dest_mac_addr6_1_mac_addr6_1
// bitfield description: Upper two bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "dest_mac_addr6_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr6_1_mac_addr6_1 <= dest_mac_addr6_1_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr6_1[0]) begin 
      dest_mac_addr6_1_mac_addr6_1[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr6_1[1]) begin 
      dest_mac_addr6_1_mac_addr6_1[15:8]   <=  din[15:8];  //
   end
end

// dest_mac_addr6_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "dest_mac_addr7_0" */

// dest_mac_addr7_0_mac_addr7_0
// bitfield description: Lower four bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset Value signal:  "dest_mac_addr7_0_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr7_0_mac_addr7_0 <= dest_mac_addr7_0_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr7_0[0]) begin 
      dest_mac_addr7_0_mac_addr7_0[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr7_0[1]) begin 
      dest_mac_addr7_0_mac_addr7_0[15:8]   <=  din[15:8];  //
   end
   if (we_dest_mac_addr7_0[2]) begin 
      dest_mac_addr7_0_mac_addr7_0[23:16]   <=  din[23:16];  //
   end
   if (we_dest_mac_addr7_0[3]) begin 
      dest_mac_addr7_0_mac_addr7_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "dest_mac_addr7_1" */

// dest_mac_addr7_1_mac_addr7_1
// bitfield description: Upper two bytes of the destination MAC address. Configure this register with a non-zero value before you enable the eCPRI IP for operations
// customType:  RW
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "dest_mac_addr7_1_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      dest_mac_addr7_1_mac_addr7_1 <= dest_mac_addr7_1_defaultValue_i;
   end
   else begin
   if (we_dest_mac_addr7_1[0]) begin 
      dest_mac_addr7_1_mac_addr7_1[7:0]   <=  din[7:0];  //
   end
   if (we_dest_mac_addr7_1[1]) begin 
      dest_mac_addr7_1_mac_addr7_1[15:8]   <=  din[15:8];  //
   end
end

// dest_mac_addr7_1_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "mac_vlan_tag_0" */

// mac_vlan_tag_0_vid
// bitfield description: VLAN Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_0_vid <= 12'h000;
   end
   else begin
   if (we_mac_vlan_tag_0[0]) begin 
      mac_vlan_tag_0_vid[7:0]   <=  din[7:0];  //
   end
   if (we_mac_vlan_tag_0[1]) begin 
      mac_vlan_tag_0_vid[11:8]   <=  din[11:8];  //
   end
end

// mac_vlan_tag_0_dei
// bitfield description: Drop Eligible Indicator
// customType:  RO
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "ipv4_dei_defaultValue_i" 
// NO register generated



// mac_vlan_tag_0_pcp
// bitfield description: Priority Code Point
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_0_pcp <= 3'h0;
   end
   else begin
   if (we_mac_vlan_tag_0[1]) begin 
      mac_vlan_tag_0_pcp[2:0]   <=  din[15:13];  //
   end
end

// mac_vlan_tag_0_tpid
// bitfield description: Tag Protocol Identifier
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ipv4_tpid_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "mac_vlan_tag_1" */

// mac_vlan_tag_1_vid
// bitfield description: VLAN Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_1_vid <= 12'h000;
   end
   else begin
   if (we_mac_vlan_tag_1[0]) begin 
      mac_vlan_tag_1_vid[7:0]   <=  din[7:0];  //
   end
   if (we_mac_vlan_tag_1[1]) begin 
      mac_vlan_tag_1_vid[11:8]   <=  din[11:8];  //
   end
end

// mac_vlan_tag_1_dei
// bitfield description: Drop Eligible Indicator
// customType:  RO
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "ipv4_dei_defaultValue_i" 
// NO register generated



// mac_vlan_tag_1_pcp
// bitfield description: Priority Code Point
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_1_pcp <= 3'h0;
   end
   else begin
   if (we_mac_vlan_tag_1[1]) begin 
      mac_vlan_tag_1_pcp[2:0]   <=  din[15:13];  //
   end
end

// mac_vlan_tag_1_tpid
// bitfield description: Tag Protocol Identifier
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ipv4_tpid_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "mac_vlan_tag_2" */

// mac_vlan_tag_2_vid
// bitfield description: VLAN Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_2_vid <= 12'h000;
   end
   else begin
   if (we_mac_vlan_tag_2[0]) begin 
      mac_vlan_tag_2_vid[7:0]   <=  din[7:0];  //
   end
   if (we_mac_vlan_tag_2[1]) begin 
      mac_vlan_tag_2_vid[11:8]   <=  din[11:8];  //
   end
end

// mac_vlan_tag_2_dei
// bitfield description: Drop Eligible Indicator
// customType:  RO
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "ipv4_dei_defaultValue_i" 
// NO register generated



// mac_vlan_tag_2_pcp
// bitfield description: Priority Code Point
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_2_pcp <= 3'h0;
   end
   else begin
   if (we_mac_vlan_tag_2[1]) begin 
      mac_vlan_tag_2_pcp[2:0]   <=  din[15:13];  //
   end
end

// mac_vlan_tag_2_tpid
// bitfield description: Tag Protocol Identifier
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ipv4_tpid_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "mac_vlan_tag_3" */

// mac_vlan_tag_3_vid
// bitfield description: VLAN Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_3_vid <= 12'h000;
   end
   else begin
   if (we_mac_vlan_tag_3[0]) begin 
      mac_vlan_tag_3_vid[7:0]   <=  din[7:0];  //
   end
   if (we_mac_vlan_tag_3[1]) begin 
      mac_vlan_tag_3_vid[11:8]   <=  din[11:8];  //
   end
end

// mac_vlan_tag_3_dei
// bitfield description: Drop Eligible Indicator
// customType:  RO
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "ipv4_dei_defaultValue_i" 
// NO register generated



// mac_vlan_tag_3_pcp
// bitfield description: Priority Code Point
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_3_pcp <= 3'h0;
   end
   else begin
   if (we_mac_vlan_tag_3[1]) begin 
      mac_vlan_tag_3_pcp[2:0]   <=  din[15:13];  //
   end
end

// mac_vlan_tag_3_tpid
// bitfield description: Tag Protocol Identifier
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ipv4_tpid_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "mac_vlan_tag_4" */

// mac_vlan_tag_4_vid
// bitfield description: VLAN Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_4_vid <= 12'h000;
   end
   else begin
   if (we_mac_vlan_tag_4[0]) begin 
      mac_vlan_tag_4_vid[7:0]   <=  din[7:0];  //
   end
   if (we_mac_vlan_tag_4[1]) begin 
      mac_vlan_tag_4_vid[11:8]   <=  din[11:8];  //
   end
end

// mac_vlan_tag_4_dei
// bitfield description: Drop Eligible Indicator
// customType:  RO
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "ipv4_dei_defaultValue_i" 
// NO register generated



// mac_vlan_tag_4_pcp
// bitfield description: Priority Code Point
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_4_pcp <= 3'h0;
   end
   else begin
   if (we_mac_vlan_tag_4[1]) begin 
      mac_vlan_tag_4_pcp[2:0]   <=  din[15:13];  //
   end
end

// mac_vlan_tag_4_tpid
// bitfield description: Tag Protocol Identifier
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ipv4_tpid_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "mac_vlan_tag_5" */

// mac_vlan_tag_5_vid
// bitfield description: VLAN Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_5_vid <= 12'h000;
   end
   else begin
   if (we_mac_vlan_tag_5[0]) begin 
      mac_vlan_tag_5_vid[7:0]   <=  din[7:0];  //
   end
   if (we_mac_vlan_tag_5[1]) begin 
      mac_vlan_tag_5_vid[11:8]   <=  din[11:8];  //
   end
end

// mac_vlan_tag_5_dei
// bitfield description: Drop Eligible Indicator
// customType:  RO
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "ipv4_dei_defaultValue_i" 
// NO register generated



// mac_vlan_tag_5_pcp
// bitfield description: Priority Code Point
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_5_pcp <= 3'h0;
   end
   else begin
   if (we_mac_vlan_tag_5[1]) begin 
      mac_vlan_tag_5_pcp[2:0]   <=  din[15:13];  //
   end
end

// mac_vlan_tag_5_tpid
// bitfield description: Tag Protocol Identifier
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ipv4_tpid_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "mac_vlan_tag_6" */

// mac_vlan_tag_6_vid
// bitfield description: VLAN Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_6_vid <= 12'h000;
   end
   else begin
   if (we_mac_vlan_tag_6[0]) begin 
      mac_vlan_tag_6_vid[7:0]   <=  din[7:0];  //
   end
   if (we_mac_vlan_tag_6[1]) begin 
      mac_vlan_tag_6_vid[11:8]   <=  din[11:8];  //
   end
end

// mac_vlan_tag_6_dei
// bitfield description: Drop Eligible Indicator
// customType:  RO
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "ipv4_dei_defaultValue_i" 
// NO register generated



// mac_vlan_tag_6_pcp
// bitfield description: Priority Code Point
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_6_pcp <= 3'h0;
   end
   else begin
   if (we_mac_vlan_tag_6[1]) begin 
      mac_vlan_tag_6_pcp[2:0]   <=  din[15:13];  //
   end
end

// mac_vlan_tag_6_tpid
// bitfield description: Tag Protocol Identifier
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ipv4_tpid_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "mac_vlan_tag_7" */

// mac_vlan_tag_7_vid
// bitfield description: VLAN Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_7_vid <= 12'h000;
   end
   else begin
   if (we_mac_vlan_tag_7[0]) begin 
      mac_vlan_tag_7_vid[7:0]   <=  din[7:0];  //
   end
   if (we_mac_vlan_tag_7[1]) begin 
      mac_vlan_tag_7_vid[11:8]   <=  din[11:8];  //
   end
end

// mac_vlan_tag_7_dei
// bitfield description: Drop Eligible Indicator
// customType:  RO
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "ipv4_dei_defaultValue_i" 
// NO register generated



// mac_vlan_tag_7_pcp
// bitfield description: Priority Code Point
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mac_vlan_tag_7_pcp <= 3'h0;
   end
   else begin
   if (we_mac_vlan_tag_7[1]) begin 
      mac_vlan_tag_7_pcp[2:0]   <=  din[15:13];  //
   end
end

// mac_vlan_tag_7_tpid
// bitfield description: Tag Protocol Identifier
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ipv4_tpid_defaultValue_i" 
// NO register generated


/* Definitions of REGISTER "mac_ethertype" */

// mac_ethertype_ethtype
// bitfield description: Ethertype for eCPRI - 16'hAEFE
// customType:  RO
// hwAccess: RO 
// reset value : 16'bxxxxxxxxxxxxxxxx 
// reset Value signal:  "ecpri_ethertype_defaultValue_i" 
// NO register generated



// mac_ethertype_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated


/* Definitions of REGISTER "ipv4_dw0_address" */

// ipv4_dw0_address_dw0_tl
// bitfield description: Total Length
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated

assign ipv4_dw0_address_dw0_tl = 16'h0000;

// ipv4_dw0_address_dw0_tos
// bitfield description: Type of Service/DiffServ
// customType:  RW
// hwAccess: RO 
// reset value : 0x00 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ipv4_dw0_address_dw0_tos <= 8'h00;
   end
   else begin
   if (we_ipv4_dw0_address) begin 
      ipv4_dw0_address_dw0_tos[7:0]   <=  din[23:16];  //
   end
end

// ipv4_dw0_address_dw0_hl
// bitfield description: Header Length
// customType:  RO
// hwAccess: RO 
// reset value : 0x5 
// NO register generated

assign ipv4_dw0_address_dw0_hl = 4'h5;

// ipv4_dw0_address_dw0_ver
// bitfield description: Version
// customType:  RO
// hwAccess: RO 
// reset value : 0x4 
// NO register generated

assign ipv4_dw0_address_dw0_ver = 4'h4;

/* Definitions of REGISTER "ipv4_dw1_address" */

// ipv4_dw1_address_dw1_frag_offs
// bitfield description: Fragment Offset
// customType:  RW
// hwAccess: RO 
// reset value : 0x0000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ipv4_dw1_address_dw1_frag_offs <= 13'h0000;
   end
   else begin
   if (we_ipv4_dw1_address[0]) begin 
      ipv4_dw1_address_dw1_frag_offs[7:0]   <=  din[7:0];  //
   end
   if (we_ipv4_dw1_address[1]) begin 
      ipv4_dw1_address_dw1_frag_offs[12:8]   <=  din[12:8];  //
   end
end

// ipv4_dw1_address_dw1_flg
// bitfield description: Flag
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ipv4_dw1_address_dw1_flg <= 3'h0;
   end
   else begin
   if (we_ipv4_dw1_address[1]) begin 
      ipv4_dw1_address_dw1_flg[2:0]   <=  din[15:13];  //
   end
end

// ipv4_dw1_address_dw1_id
// bitfield description: Identifier
// customType:  RW
// hwAccess: RO 
// reset value : 0x0000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ipv4_dw1_address_dw1_id <= 16'h0000;
   end
   else begin
   if (we_ipv4_dw1_address[2]) begin 
      ipv4_dw1_address_dw1_id[7:0]   <=  din[23:16];  //
   end
   if (we_ipv4_dw1_address[3]) begin 
      ipv4_dw1_address_dw1_id[15:8]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "ipv4_dw2_address" */

// ipv4_dw2_address_dw2_hdchksum
// bitfield description: Header Checksum
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000 
// NO register generated

assign ipv4_dw2_address_dw2_hdchksum = 16'h0000;

// ipv4_dw2_address_dw2_prot
// bitfield description: Protocol
// customType:  RO
// hwAccess: RO 
// reset value : 0x11 
// NO register generated

assign ipv4_dw2_address_dw2_prot = 8'h11;

// ipv4_dw2_address_dw2_tol
// bitfield description: Time to live
// customType:  RW
// hwAccess: RO 
// reset value : 0x00 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ipv4_dw2_address_dw2_tol <= 8'h00;
   end
   else begin
   if (we_ipv4_dw2_address) begin 
      ipv4_dw2_address_dw2_tol[7:0]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "ipv4_src_address_0" */

// ipv4_src_address_0_ipv4_src_address_0
// customType:  RW
// hwAccess: RO 
// reset value : 0x00000000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ipv4_src_address_0_ipv4_src_address_0 <= 32'h00000000;
   end
   else begin
   if (we_ipv4_src_address_0[0]) begin 
      ipv4_src_address_0_ipv4_src_address_0[7:0]   <=  din[7:0];  //
   end
   if (we_ipv4_src_address_0[1]) begin 
      ipv4_src_address_0_ipv4_src_address_0[15:8]   <=  din[15:8];  //
   end
   if (we_ipv4_src_address_0[2]) begin 
      ipv4_src_address_0_ipv4_src_address_0[23:16]   <=  din[23:16];  //
   end
   if (we_ipv4_src_address_0[3]) begin 
      ipv4_src_address_0_ipv4_src_address_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "ipv4_dst_address_0" */

// ipv4_dst_address_0_ipv4_dst_address_0
// customType:  RW
// hwAccess: RO 
// reset value : 0x00000000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ipv4_dst_address_0_ipv4_dst_address_0 <= 32'h00000000;
   end
   else begin
   if (we_ipv4_dst_address_0[0]) begin 
      ipv4_dst_address_0_ipv4_dst_address_0[7:0]   <=  din[7:0];  //
   end
   if (we_ipv4_dst_address_0[1]) begin 
      ipv4_dst_address_0_ipv4_dst_address_0[15:8]   <=  din[15:8];  //
   end
   if (we_ipv4_dst_address_0[2]) begin 
      ipv4_dst_address_0_ipv4_dst_address_0[23:16]   <=  din[23:16];  //
   end
   if (we_ipv4_dst_address_0[3]) begin 
      ipv4_dst_address_0_ipv4_dst_address_0[31:24]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "mudp_dw0_address" */

// mudp_dw0_address_udp_dw0_chksum
// bitfield description: UDP Checksum
// customType:  RW
// hwAccess: RO 
// reset value : 0x0000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mudp_dw0_address_udp_dw0_chksum <= 16'h0000;
   end
   else begin
   if (we_mudp_dw0_address[0]) begin 
      mudp_dw0_address_udp_dw0_chksum[7:0]   <=  din[7:0];  //
   end
   if (we_mudp_dw0_address[1]) begin 
      mudp_dw0_address_udp_dw0_chksum[15:8]   <=  din[15:8];  //
   end
end

// mudp_dw0_address_udp_dw0_length
// bitfield description: UDP Length
// customType:  RW
// hwAccess: RO 
// reset value : 0x0000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mudp_dw0_address_udp_dw0_length <= 16'h0000;
   end
   else begin
   if (we_mudp_dw0_address[2]) begin 
      mudp_dw0_address_udp_dw0_length[7:0]   <=  din[23:16];  //
   end
   if (we_mudp_dw0_address[3]) begin 
      mudp_dw0_address_udp_dw0_length[15:8]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "mudp_address_0" */

// mudp_address_0_udp_src_port
// bitfield description: UDP Source ports
// customType:  RW
// hwAccess: RO 
// reset value : 0x0000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mudp_address_0_udp_src_port <= 16'h0000;
   end
   else begin
   if (we_mudp_address_0[0]) begin 
      mudp_address_0_udp_src_port[7:0]   <=  din[7:0];  //
   end
   if (we_mudp_address_0[1]) begin 
      mudp_address_0_udp_src_port[15:8]   <=  din[15:8];  //
   end
end

// mudp_address_0_udp_dest_port
// bitfield description: UDP Destination ports
// customType:  RW
// hwAccess: RO 
// reset value : 0x0000 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      mudp_address_0_udp_dest_port <= 16'h0000;
   end
   else begin
   if (we_mudp_address_0[2]) begin 
      mudp_address_0_udp_dest_port[7:0]   <=  din[23:16];  //
   end
   if (we_mudp_address_0[3]) begin 
      mudp_address_0_udp_dest_port[15:8]   <=  din[31:24];  //
   end
end
/* Definitions of REGISTER "packet_type_enable" */

// packet_type_enable_ipv6_en
// bitfield description: IPv6 Enable
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      packet_type_enable_ipv6_en <= 1'h0;
   end
   else begin
   if (we_packet_type_enable) begin 
      packet_type_enable_ipv6_en   <=  din[0];  //
   end
end

// packet_type_enable_ipv4_en
// bitfield description: IPv4 Enable
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      packet_type_enable_ipv4_en <= 1'h0;
   end
   else begin
   if (we_packet_type_enable) begin 
      packet_type_enable_ipv4_en   <=  din[1];  //
   end
end

// packet_type_enable_vlan_en
// bitfield description: VLAN Enable
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      packet_type_enable_vlan_en <= 1'h0;
   end
   else begin
   if (we_packet_type_enable) begin 
      packet_type_enable_vlan_en   <=  din[2];  //
   end
end

// packet_type_enable_svlan_en
// bitfield description: SVLAN Enable
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      packet_type_enable_svlan_en <= 1'h0;
   end
   else begin
   if (we_packet_type_enable) begin 
      packet_type_enable_svlan_en   <=  din[3];  //
   end
end

// packet_type_enable_udp_en
// bitfield description: UDP Enable
// customType:  RW
// hwAccess: RO 
// reset value : 0x0 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      packet_type_enable_udp_en <= 1'h0;
   end
   else begin
   if (we_packet_type_enable) begin 
      packet_type_enable_udp_en   <=  din[4];  //
   end
end

// packet_type_enable_rx_err_resv
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x0000000 
// NO register generated


/* Definitions of REGISTER "rx_error_address" */

// rx_error_address_ipv4_chksum_err
// bitfield description: IPV4 Header Checksum Error
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: rx_error_address_ipv4_chksum_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  rx_error_address_ipv4_chksum_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      rx_error_address_ipv4_chksum_err <= 1'h0;
   end
   else begin
   if (we_rx_error_address) begin
      rx_error_address_ipv4_chksum_err <= ~din[0] & rx_error_address_ipv4_chksum_err; // 1 to clear
   end
   else begin
      rx_error_address_ipv4_chksum_err<=  rx_error_address_ipv4_chksum_err_i | rx_error_address_ipv4_chksum_err;
   end
end

// rx_error_address_udp_chksum_err
// bitfield description: UDP Checksum Error
// customType:  W1C
// hwAccess: W1S 
// reset value : 0x0 
// inputPort: rx_error_address_udp_chksum_err_i 
// outputPort:  "" 
// hardware levelAccess:  "true" 

reg  rx_error_address_udp_chksum_err;
always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      rx_error_address_udp_chksum_err <= 1'h0;
   end
   else begin
   if (we_rx_error_address) begin
      rx_error_address_udp_chksum_err <= ~din[1] & rx_error_address_udp_chksum_err; // 1 to clear
   end
   else begin
      rx_error_address_udp_chksum_err<=  rx_error_address_udp_chksum_err_i | rx_error_address_udp_chksum_err;
   end
end

// rx_error_address_rx_err_resv
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "cu_vlanid_match_address" */

// cu_vlanid_match_address_vid_addr
// bitfield description: ORAN C/U Plane VLAN ID Match Value
// customType:  RW
// hwAccess: RO 
// reset value : 12'bxxxxxxxxxxxx 
// reset Value signal:  "cu_vlanid_match_address_vid_addr_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      cu_vlanid_match_address_vid_addr <= cu_vlanid_match_address_vid_addr_defaultValue_i;
   end
   else begin
   if (we_cu_vlanid_match_address[0]) begin 
      cu_vlanid_match_address_vid_addr[7:0]   <=  din[7:0];  //
   end
   if (we_cu_vlanid_match_address[1]) begin 
      cu_vlanid_match_address_vid_addr[11:8]   <=  din[11:8];  //
   end
end

// cu_vlanid_match_address_match_macaddr_vlanid
// bitfield description: Data Flow Matching Mechanism - MAC Address or VLAN ID
// customType:  RW
// hwAccess: RO 
// reset value : 1'bx 
// reset Value signal:  "cu_vlanid_match_address_match_macaddr_vlanid_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      cu_vlanid_match_address_match_macaddr_vlanid <= cu_vlanid_match_address_match_macaddr_vlanid_defaultValue_i;
   end
   else begin
   if (we_cu_vlanid_match_address[1]) begin 
      cu_vlanid_match_address_match_macaddr_vlanid   <=  din[12];  //
   end
end

// cu_vlanid_match_address_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x00000 
// NO register generated


/* Definitions of REGISTER "ecpri_priority" */

// ecpri_priority_ecpri_priority_value
// bitfield description: Priority value assign to eCPRI packets for fixed priority & L2COS without VLAN tag packets. Valid value 0 - 7
// customType:  RW
// hwAccess: RO 
// reset value : 3'bxxx 
// reset Value signal:  "ecpri_priority_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ecpri_priority_ecpri_priority_value <= ecpri_priority_defaultValue_i;
   end
   else begin
   if (we_ecpri_priority) begin 
      ecpri_priority_ecpri_priority_value[2:0]   <=  din[2:0];  //
   end
end

// ecpri_priority_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "ptp_priority" */

// ptp_priority_ptp_priority_value
// bitfield description: This value assign to PTP packets entering from external sink 0/1 interface during the fixed priority & in L2COS priority assign to PTP packets without VLAN tag. Valid value: 0 to 7
// customType:  RW
// hwAccess: RO 
// reset value : 3'bxxx 
// reset Value signal:  "ptp_priority_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      ptp_priority_ptp_priority_value <= ptp_priority_defaultValue_i;
   end
   else begin
   if (we_ptp_priority) begin 
      ptp_priority_ptp_priority_value[2:0]   <=  din[2:0];  //
   end
end

// ptp_priority_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "misc_priority" */

// misc_priority_misc_priority_value
// bitfield description: This value assign to miscellaneous packets (C&M/Other types) packets entering from external sink 0/1 interface during the fixed priority & in L2COS priority assign to miscellaneous packets without VLAN tag. Valid value: 0 to 7
// customType:  RW
// hwAccess: RO 
// reset value : 3'bxxx 
// reset Value signal:  "misc_priority_defaultValue_i" 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      misc_priority_misc_priority_value <= misc_priority_defaultValue_i;
   end
   else begin
   if (we_misc_priority) begin 
      misc_priority_misc_priority_value[2:0]   <=  din[2:0];  //
   end
end

// misc_priority_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "pq_starvation" */

// pq_starvation_en_pq_starvation_ext0
// bitfield description: Enable 10:1 ration starvation handling for external sink interface 0
// customType:  RW
// hwAccess: RO 
// reset value : 0x1 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pq_starvation_en_pq_starvation_ext0 <= 1'h1;
   end
   else begin
   if (we_pq_starvation) begin 
      pq_starvation_en_pq_starvation_ext0   <=  din[0];  //
   end
end

// pq_starvation_en_pq_starvation_ext1
// bitfield description: Enable 10:1 ration starvation handling for external sink interface 1
// customType:  RW
// hwAccess: RO 
// reset value : 0x1 


always @( negedge  reset_n,  posedge clk)
   if (!reset_n)  begin
      pq_starvation_en_pq_starvation_ext1 <= 1'h1;
   end
   else begin
   if (we_pq_starvation) begin 
      pq_starvation_en_pq_starvation_ext1   <=  din[1];  //
   end
end

// pq_starvation_reserved
// bitfield description: Reserved
// customType:  RO
// hwAccess: RO 
// reset value : 0x00000000 
// NO register generated


/* Definitions of REGISTER "farend_address" */

// farend_address_reserved
// bitfield description: This is not real IP register. It is here to set maximum addressing to 16-bit
// customType:  RO
// hwAccess: NA 
// reset value : 0x00000000 
// NO register generated



// interupt ecpri_msg5_ctrl_meas_complete
wire   it_ecpri_msg5_ctrl_meas_complete;
assign it_ecpri_msg5_ctrl_meas_complete = ecpri_msg5_ctrl_meas_complete;

// interupt ecpri_tx_err_msg_tx_miss_sop_err
wire   masked_ecpri_tx_err_msg_tx_miss_sop_err;
assign masked_ecpri_tx_err_msg_tx_miss_sop_err = ecpri_tx_err_msg_tx_miss_sop_err & !ecpri_err_mask_msg_miss_sop_err_en;
// interupt ecpri_tx_err_msg_tx_miss_eop_err
wire   masked_ecpri_tx_err_msg_tx_miss_eop_err;
assign masked_ecpri_tx_err_msg_tx_miss_eop_err = ecpri_tx_err_msg_tx_miss_eop_err & !ecpri_err_mask_msg_miss_eop_err_en;
// interupt ecpri_tx_err_msg_tx_overflow_err
wire   masked_ecpri_tx_err_msg_tx_overflow_err;
assign masked_ecpri_tx_err_msg_tx_overflow_err = ecpri_tx_err_msg_tx_overflow_err & !ecpri_err_mask_msg_overflow_err_en;
// interupt ecpri_tx_err_msg_tx_ecc_err
wire   masked_ecpri_tx_err_msg_tx_ecc_err;
assign masked_ecpri_tx_err_msg_tx_ecc_err = ecpri_tx_err_msg_tx_ecc_err & !ecpri_err_mask_msg_ecc_err_en;
// interupt ecpri_tx_err_msg_tx_msg_type_err
wire   masked_ecpri_tx_err_msg_tx_msg_type_err;
assign masked_ecpri_tx_err_msg_tx_msg_type_err = ecpri_tx_err_msg_tx_msg_type_err & !ecpri_err_mask_msg_msg_type_err_en;
// interupt ecpri_tx_err_msg_con_timeout_err
wire   masked_ecpri_tx_err_msg_con_timeout_err;
assign masked_ecpri_tx_err_msg_con_timeout_err = ecpri_tx_err_msg_con_timeout_err & !ecpri_err_mask_msg_con_timeout_err_en;
// interupt ecpri_tx_err_msg_m_msg_size_err
wire   masked_ecpri_tx_err_msg_m_msg_size_err;
assign masked_ecpri_tx_err_msg_m_msg_size_err = ecpri_tx_err_msg_m_msg_size_err & !ecpri_err_mask_msg_m_msg_size_err_en;
// interupt ecpri_tx_err_msg_s_msg_size_err
wire   masked_ecpri_tx_err_msg_s_msg_size_err;
assign masked_ecpri_tx_err_msg_s_msg_size_err = ecpri_tx_err_msg_s_msg_size_err & !ecpri_err_mask_msg_s_msg_size_err_en;
// interupt ecpri_tx_err_msg_usr_msg_size_err
wire   masked_ecpri_tx_err_msg_usr_msg_size_err;
assign masked_ecpri_tx_err_msg_usr_msg_size_err = ecpri_tx_err_msg_usr_msg_size_err & !ecpri_err_mask_msg_usr_msg_size_err_en;
// interupt ecpri_tx_err_msg_avst_if_err
wire   masked_ecpri_tx_err_msg_avst_if_err;
assign masked_ecpri_tx_err_msg_avst_if_err = ecpri_tx_err_msg_avst_if_err & !ecpri_err_mask_msg_avst_if_err_en;
// interupt ecpri_rx_err_msg_rx_miss_sop_err
wire   masked_ecpri_rx_err_msg_rx_miss_sop_err;
assign masked_ecpri_rx_err_msg_rx_miss_sop_err = ecpri_rx_err_msg_rx_miss_sop_err & !ecpri_err_mask_msg_miss_sop_err_en;
// interupt ecpri_rx_err_msg_rx_miss_eop_err
wire   masked_ecpri_rx_err_msg_rx_miss_eop_err;
assign masked_ecpri_rx_err_msg_rx_miss_eop_err = ecpri_rx_err_msg_rx_miss_eop_err & !ecpri_err_mask_msg_miss_eop_err_en;
// interupt ecpri_rx_err_msg_rx_overflow_err
wire   masked_ecpri_rx_err_msg_rx_overflow_err;
assign masked_ecpri_rx_err_msg_rx_overflow_err = ecpri_rx_err_msg_rx_overflow_err & !ecpri_err_mask_msg_overflow_err_en;
// interupt ecpri_rx_err_msg_rx_ecc_err
wire   masked_ecpri_rx_err_msg_rx_ecc_err;
assign masked_ecpri_rx_err_msg_rx_ecc_err = ecpri_rx_err_msg_rx_ecc_err & !ecpri_err_mask_msg_ecc_err_en;
// interupt ecpri_rx_err_msg_rx_msg_type_err
wire   masked_ecpri_rx_err_msg_rx_msg_type_err;
assign masked_ecpri_rx_err_msg_rx_msg_type_err = ecpri_rx_err_msg_rx_msg_type_err & !ecpri_err_mask_msg_msg_type_err_en;
// interupt ecpri_rx_err_msg_rx_meas_id_err
wire   masked_ecpri_rx_err_msg_rx_meas_id_err;
assign masked_ecpri_rx_err_msg_rx_meas_id_err = ecpri_rx_err_msg_rx_meas_id_err & !ecpri_err_mask_msg_meas_id_err_en;
// interupt ecpri_rx_err_msg_inv_msg5_req_err
wire   masked_ecpri_rx_err_msg_inv_msg5_req_err;
assign masked_ecpri_rx_err_msg_inv_msg5_req_err = ecpri_rx_err_msg_inv_msg5_req_err & !ecpri_err_mask_msg_inv_msg5_req_err_en;
// interupt ecpri_rx_err_msg_inv_msg5_fup_err
wire   masked_ecpri_rx_err_msg_inv_msg5_fup_err;
assign masked_ecpri_rx_err_msg_inv_msg5_fup_err = ecpri_rx_err_msg_inv_msg5_fup_err & !ecpri_err_mask_msg_inv_msg5_fup_err_en;
// interupt ecpri_rx_err_msg_inv_msg5_resp_err
wire   masked_ecpri_rx_err_msg_inv_msg5_resp_err;
assign masked_ecpri_rx_err_msg_inv_msg5_resp_err = ecpri_rx_err_msg_inv_msg5_resp_err & !ecpri_err_mask_msg_inv_msg5_resp_err_en;
// interupt ecpri_rx_err_msg_msg5_pkt_err
wire   masked_ecpri_rx_err_msg_msg5_pkt_err;
assign masked_ecpri_rx_err_msg_msg5_pkt_err = ecpri_rx_err_msg_msg5_pkt_err & !ecpri_err_mask_msg_msg5_pkt_err_en;
// interupt ecpri_rx_err_msg_no_resp_msg5_err
wire   masked_ecpri_rx_err_msg_no_resp_msg5_err;
assign masked_ecpri_rx_err_msg_no_resp_msg5_err = ecpri_rx_err_msg_no_resp_msg5_err & !ecpri_err_mask_msg_no_resp_msg5_err_en;
// interupt ecpri_rx_err_msg_no_rst_resp_err
wire   masked_ecpri_rx_err_msg_no_rst_resp_err;
assign masked_ecpri_rx_err_msg_no_rst_resp_err = ecpri_rx_err_msg_no_rst_resp_err & !ecpri_err_mask_msg_no_rst_resp_err_en;
// interupt ecpri_rx_err_msg_no_mem_resp_err
wire   masked_ecpri_rx_err_msg_no_mem_resp_err;
assign masked_ecpri_rx_err_msg_no_mem_resp_err = ecpri_rx_err_msg_no_mem_resp_err & !ecpri_err_mask_msg_no_mem_resp_err_en;
// interupt ecpri_rx_err_msg_msg4_buffer_mode_err
wire   masked_ecpri_rx_err_msg_msg4_buffer_mode_err;
assign masked_ecpri_rx_err_msg_msg4_buffer_mode_err = ecpri_rx_err_msg_msg4_buffer_mode_err & !ecpri_err_mask_msg_msg4_buffer_mode_err_en;
// interupt ecpri_rx_err_msg_payload_length_mismatch_err
wire   masked_ecpri_rx_err_msg_payload_length_mismatch_err;
assign masked_ecpri_rx_err_msg_payload_length_mismatch_err = ecpri_rx_err_msg_payload_length_mismatch_err & !ecpri_err_mask_msg_payload_length_mismatch_err_en;
// interupt ecpri_rx_err_msg_invalid_concan_bit_received_err
wire   masked_ecpri_rx_err_msg_invalid_concan_bit_received_err;
assign masked_ecpri_rx_err_msg_invalid_concan_bit_received_err = ecpri_rx_err_msg_invalid_concan_bit_received_err & !ecpri_err_mask_msg_invalid_concan_bit_err_en;
// interupt ecpri_rx_err_msg_rx_in_avst_err
wire   masked_ecpri_rx_err_msg_rx_in_avst_err;
assign masked_ecpri_rx_err_msg_rx_in_avst_err = ecpri_rx_err_msg_rx_in_avst_err & !ecpri_err_mask_msg_rx_in_avst_err_en;
// interupt rx_error_address_ipv4_chksum_err
wire   masked_rx_error_address_ipv4_chksum_err;
assign masked_rx_error_address_ipv4_chksum_err = rx_error_address_ipv4_chksum_err & !ecpri_err_mask_msg_ipv4_chksum_err_en;
// interupt rx_error_address_udp_chksum_err
wire   masked_rx_error_address_udp_chksum_err;
assign masked_rx_error_address_udp_chksum_err = rx_error_address_udp_chksum_err & !ecpri_err_mask_msg_udp_chksum_err_en;
assign irq_ecpri_msg5_ctrl = it_ecpri_msg5_ctrl_meas_complete ;



assign irq_ecpri_tx_err_msg = masked_ecpri_tx_err_msg_tx_miss_sop_err |
			 masked_ecpri_tx_err_msg_tx_miss_eop_err |
			 masked_ecpri_tx_err_msg_tx_overflow_err |
			 masked_ecpri_tx_err_msg_tx_ecc_err |
			 masked_ecpri_tx_err_msg_tx_msg_type_err |
			 masked_ecpri_tx_err_msg_con_timeout_err |
			 masked_ecpri_tx_err_msg_m_msg_size_err |
			 masked_ecpri_tx_err_msg_s_msg_size_err |
			 masked_ecpri_tx_err_msg_usr_msg_size_err |
			 masked_ecpri_tx_err_msg_avst_if_err ;



assign irq_ecpri_rx_err_msg = masked_ecpri_rx_err_msg_rx_miss_sop_err |
			 masked_ecpri_rx_err_msg_rx_miss_eop_err |
			 masked_ecpri_rx_err_msg_rx_overflow_err |
			 masked_ecpri_rx_err_msg_rx_ecc_err |
			 masked_ecpri_rx_err_msg_rx_msg_type_err |
			 masked_ecpri_rx_err_msg_rx_meas_id_err |
			 masked_ecpri_rx_err_msg_inv_msg5_req_err |
			 masked_ecpri_rx_err_msg_inv_msg5_fup_err |
			 masked_ecpri_rx_err_msg_inv_msg5_resp_err |
			 masked_ecpri_rx_err_msg_msg5_pkt_err |
			 masked_ecpri_rx_err_msg_no_resp_msg5_err |
			 masked_ecpri_rx_err_msg_no_rst_resp_err |
			 masked_ecpri_rx_err_msg_no_mem_resp_err |
			 masked_ecpri_rx_err_msg_msg4_buffer_mode_err |
			 masked_ecpri_rx_err_msg_payload_length_mismatch_err |
			 masked_ecpri_rx_err_msg_invalid_concan_bit_received_err |
			 masked_ecpri_rx_err_msg_rx_in_avst_err ;



assign irq_rx_error_address = masked_rx_error_address_ipv4_chksum_err |
			 masked_rx_error_address_udp_chksum_err ;




// read process
always @ (*)
begin
rdata_comb = 32'h00000000;
   if(re) begin
      case (addr)  
	18'h00000 : begin
		rdata_comb [31:0]	= iprev_defaultValue_i;  // ecpri_version_ip_version 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00004 : begin
		rdata_comb [31:0]	= ecpri_scratch_scratch [31:0] ;		// readType = read   writeType =write
	end
	18'h00008 : begin
		rdata_comb [3:0]	= rev_defaultValue_i;  // ecpri_common_ctrl_rev 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [4]	= ecpri_common_ctrl_msg4_mode  ;		// readType = read   writeType =write
		rdata_comb [5]	= ecpri_common_ctrl_frag_en  ;		// readType = read   writeType =write
		rdata_comb [7:6]	= ecpri_common_ctrl_frag_sz [1:0] ;		// readType = read   writeType =write
		rdata_comb [8]	= ecpri_common_ctrl_err_mask  ;		// readType = read   writeType =write
		rdata_comb [9]	= ecpri_common_ctrl_irq_en  ;		// readType = read   writeType =write
		rdata_comb [10]	= ecpri_common_ctrl_mf_en  ;		// readType = read   writeType =write
		rdata_comb [31:11]	= 21'h000000 ;  // ecpri_common_ctrl_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0000c : begin
		rdata_comb [0]	= ecpri_msg5_ctrl_meas_mode  ;		// readType = read   writeType =write
		rdata_comb [8:1]	= ecpri_msg5_ctrl_meas_id [7:0] ;		// readType = read   writeType =write
		rdata_comb [9]	= ecpri_msg5_ctrl_remote_request  ;		// readType = read   writeType =write
		rdata_comb [10]	= ecpri_msg5_ctrl_meas_start  ;		// readType = read   writeType =write
		rdata_comb [11]	= ecpri_msg5_ctrl_meas_complete  ;		// readType = read   writeType =oneToClear
		rdata_comb [19:12]	= ecpri_msg5_ctrl_dummy_bytes [7:0] ;		// readType = read   writeType =write
		rdata_comb [31:20]	= 12'h000 ;  // ecpri_msg5_ctrl_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00010 : begin
		rdata_comb [0]	= ecpri_tx_err_msg_tx_miss_sop_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [1]	= ecpri_tx_err_msg_tx_miss_eop_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [2]	= ecpri_tx_err_msg_tx_overflow_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [3]	= ecpri_tx_err_msg_tx_ecc_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [4]	= ecpri_tx_err_msg_tx_msg_type_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [5]	= ecpri_tx_err_msg_con_timeout_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [6]	= ecpri_tx_err_msg_m_msg_size_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [7]	= ecpri_tx_err_msg_s_msg_size_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= ecpri_tx_err_msg_usr_msg_size_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= ecpri_tx_err_msg_avst_if_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [31:10]	= 22'h000000 ;  // ecpri_tx_err_msg_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00014 : begin
		rdata_comb [0]	= ecpri_rx_err_msg_rx_miss_sop_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [1]	= ecpri_rx_err_msg_rx_miss_eop_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [2]	= ecpri_rx_err_msg_rx_overflow_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [3]	= ecpri_rx_err_msg_rx_ecc_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [4]	= ecpri_rx_err_msg_rx_msg_type_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [5]	= ecpri_rx_err_msg_rx_meas_id_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [6]	= ecpri_rx_err_msg_inv_msg5_req_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [7]	= ecpri_rx_err_msg_inv_msg5_fup_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [8]	= ecpri_rx_err_msg_inv_msg5_resp_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [9]	= ecpri_rx_err_msg_msg5_pkt_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [10]	= ecpri_rx_err_msg_no_resp_msg5_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [11]	= ecpri_rx_err_msg_no_rst_resp_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [12]	= ecpri_rx_err_msg_no_mem_resp_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [13]	= ecpri_rx_err_msg_msg4_buffer_mode_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [14]	= ecpri_rx_err_msg_payload_length_mismatch_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [15]	= ecpri_rx_err_msg_invalid_concan_bit_received_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [16]	= ecpri_rx_err_msg_rx_in_avst_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [31:17]	= 15'h0000 ;  // ecpri_rx_err_msg_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00018 : begin
		rdata_comb [0]	= ecpri_err_mask_msg_inv_msg5_req_err_en  ;		// readType = read   writeType =write
		rdata_comb [1]	= ecpri_err_mask_msg_inv_msg5_fup_err_en  ;		// readType = read   writeType =write
		rdata_comb [2]	= ecpri_err_mask_msg_inv_msg5_resp_err_en  ;		// readType = read   writeType =write
		rdata_comb [3]	= ecpri_err_mask_msg_meas_id_err_en  ;		// readType = read   writeType =write
		rdata_comb [4]	= ecpri_err_mask_msg_msg_type_err_en  ;		// readType = read   writeType =write
		rdata_comb [5]	= ecpri_err_mask_msg_msg5_pkt_err_en  ;		// readType = read   writeType =write
		rdata_comb [6]	= ecpri_err_mask_msg_no_resp_msg5_err_en  ;		// readType = read   writeType =write
		rdata_comb [7]	= ecpri_err_mask_msg_con_timeout_err_en  ;		// readType = read   writeType =write
		rdata_comb [8]	= ecpri_err_mask_msg_m_msg_size_err_en  ;		// readType = read   writeType =write
		rdata_comb [9]	= ecpri_err_mask_msg_s_msg_size_err_en  ;		// readType = read   writeType =write
		rdata_comb [10]	= ecpri_err_mask_msg_no_rst_resp_err_en  ;		// readType = read   writeType =write
		rdata_comb [11]	= ecpri_err_mask_msg_no_mem_resp_err_en  ;		// readType = read   writeType =write
		rdata_comb [12]	= ecpri_err_mask_msg_miss_sop_err_en  ;		// readType = read   writeType =write
		rdata_comb [13]	= ecpri_err_mask_msg_miss_eop_err_en  ;		// readType = read   writeType =write
		rdata_comb [14]	= ecpri_err_mask_msg_overflow_err_en  ;		// readType = read   writeType =write
		rdata_comb [15]	= ecpri_err_mask_msg_ecc_err_en  ;		// readType = read   writeType =write
		rdata_comb [16]	= ecpri_err_mask_msg_msg4_buffer_mode_err_en  ;		// readType = read   writeType =write
		rdata_comb [17]	= ecpri_err_mask_msg_payload_length_mismatch_err_en  ;		// readType = read   writeType =write
		rdata_comb [18]	= ecpri_err_mask_msg_invalid_concan_bit_err_en  ;		// readType = read   writeType =write
		rdata_comb [19]	= ecpri_err_mask_msg_usr_msg_size_err_en  ;		// readType = read   writeType =write
		rdata_comb [20]	= ecpri_err_mask_msg_ipv4_chksum_err_en  ;		// readType = read   writeType =write
		rdata_comb [21]	= ecpri_err_mask_msg_udp_chksum_err_en  ;		// readType = read   writeType =write
		rdata_comb [22]	= ecpri_err_mask_msg_avst_if_err_en  ;		// readType = read   writeType =write
		rdata_comb [23]	= ecpri_err_mask_msg_rx_in_avst_err_en  ;		// readType = read   writeType =write
		rdata_comb [31:24]	= 8'h00 ;  // ecpri_err_mask_msg_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0001c : begin
		rdata_comb [7:0]	= ecpri_err_log_msg_mem_acc_id_log_err [7:0] ;		// readType = read   writeType =oneToClear
		rdata_comb [13:8]	= ecpri_err_log_msg_msg_type_log_err [5:0] ;		// readType = read   writeType =oneToClear
		rdata_comb [21:14]	= ecpri_err_log_msg_msg5_actype_log_err [7:0] ;		// readType = read   writeType =oneToClear
		rdata_comb [29:22]	= ecpri_err_log_msg_meas_id_log_err [7:0] ;		// readType = read   writeType =oneToClear
		rdata_comb [31:30]	= 2'h0 ;  // ecpri_err_log_msg_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00020 : begin
		rdata_comb [31:0]	= ecpri_msg5_cv0_msg5_cv0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00024 : begin
		rdata_comb [31:0]	= ecpri_msg5_cv1_msg5_cv1 [31:0] ;		// readType = read   writeType =write
	end
	18'h00028 : begin
		rdata_comb [31:0]	= ecpri_msg5_td0_ecpri_msg5_td0 [31:0] ;		// readType = read   writeType =write
	end
	18'h0002c : begin
		rdata_comb [31:0]	= ecpri_msg5_td1_ecpri_msg5_td1 [31:0] ;		// readType = read   writeType =write
	end
	18'h00030 : begin
		rdata_comb [15:0]	= ecpri_msg5_td2_ecpri_msg5_td2 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // ecpri_msg5_td2_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00040 : begin
		rdata_comb [31:0]	= eth_frame_scratch_ethfrm_scratch [31:0] ;		// readType = read   writeType =write
	end
	18'h00044 : begin
		rdata_comb [31:0]	= source_mac_addr0_0_mac_sa_addr0_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00048 : begin
		rdata_comb [15:0]	= source_mac_addr0_1_mac_sa_addr0_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // source_mac_addr0_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0004c : begin
		rdata_comb [31:0]	= dest_mac_addr0_0_mac_addr0_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00050 : begin
		rdata_comb [15:0]	= dest_mac_addr0_1_mac_addr0_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // dest_mac_addr0_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00054 : begin
		rdata_comb [31:0]	= dest_mac_addr1_0_mac_addr1_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00058 : begin
		rdata_comb [15:0]	= dest_mac_addr1_1_mac_addr1_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // dest_mac_addr1_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0005c : begin
		rdata_comb [31:0]	= dest_mac_addr2_0_mac_addr2_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00060 : begin
		rdata_comb [15:0]	= dest_mac_addr2_1_mac_addr2_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // dest_mac_addr2_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00064 : begin
		rdata_comb [31:0]	= dest_mac_addr3_0_mac_addr3_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00068 : begin
		rdata_comb [15:0]	= dest_mac_addr3_1_mac_addr3_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // dest_mac_addr3_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0006c : begin
		rdata_comb [31:0]	= dest_mac_addr4_0_mac_addr4_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00070 : begin
		rdata_comb [15:0]	= dest_mac_addr4_1_mac_addr4_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // dest_mac_addr4_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00074 : begin
		rdata_comb [31:0]	= dest_mac_addr5_0_mac_addr5_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00078 : begin
		rdata_comb [15:0]	= dest_mac_addr5_1_mac_addr5_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // dest_mac_addr5_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0007c : begin
		rdata_comb [31:0]	= dest_mac_addr6_0_mac_addr6_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00080 : begin
		rdata_comb [15:0]	= dest_mac_addr6_1_mac_addr6_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // dest_mac_addr6_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00084 : begin
		rdata_comb [31:0]	= dest_mac_addr7_0_mac_addr7_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h00088 : begin
		rdata_comb [15:0]	= dest_mac_addr7_1_mac_addr7_1 [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= 16'h0000 ;  // dest_mac_addr7_1_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0008c : begin
		rdata_comb [11:0]	= mac_vlan_tag_0_vid [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= ipv4_dei_defaultValue_i;  // mac_vlan_tag_0_dei 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:13]	= mac_vlan_tag_0_pcp [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_tpid_defaultValue_i;  // mac_vlan_tag_0_tpid 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00090 : begin
		rdata_comb [11:0]	= mac_vlan_tag_1_vid [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= ipv4_dei_defaultValue_i;  // mac_vlan_tag_1_dei 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:13]	= mac_vlan_tag_1_pcp [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_tpid_defaultValue_i;  // mac_vlan_tag_1_tpid 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00094 : begin
		rdata_comb [11:0]	= mac_vlan_tag_2_vid [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= ipv4_dei_defaultValue_i;  // mac_vlan_tag_2_dei 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:13]	= mac_vlan_tag_2_pcp [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_tpid_defaultValue_i;  // mac_vlan_tag_2_tpid 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00098 : begin
		rdata_comb [11:0]	= mac_vlan_tag_3_vid [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= ipv4_dei_defaultValue_i;  // mac_vlan_tag_3_dei 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:13]	= mac_vlan_tag_3_pcp [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_tpid_defaultValue_i;  // mac_vlan_tag_3_tpid 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0009c : begin
		rdata_comb [11:0]	= mac_vlan_tag_4_vid [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= ipv4_dei_defaultValue_i;  // mac_vlan_tag_4_dei 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:13]	= mac_vlan_tag_4_pcp [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_tpid_defaultValue_i;  // mac_vlan_tag_4_tpid 	is reserved or a constant value, a read access gives the reset value
	end
	18'h000a0 : begin
		rdata_comb [11:0]	= mac_vlan_tag_5_vid [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= ipv4_dei_defaultValue_i;  // mac_vlan_tag_5_dei 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:13]	= mac_vlan_tag_5_pcp [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_tpid_defaultValue_i;  // mac_vlan_tag_5_tpid 	is reserved or a constant value, a read access gives the reset value
	end
	18'h000a4 : begin
		rdata_comb [11:0]	= mac_vlan_tag_6_vid [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= ipv4_dei_defaultValue_i;  // mac_vlan_tag_6_dei 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:13]	= mac_vlan_tag_6_pcp [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_tpid_defaultValue_i;  // mac_vlan_tag_6_tpid 	is reserved or a constant value, a read access gives the reset value
	end
	18'h000a8 : begin
		rdata_comb [11:0]	= mac_vlan_tag_7_vid [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= ipv4_dei_defaultValue_i;  // mac_vlan_tag_7_dei 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [15:13]	= mac_vlan_tag_7_pcp [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_tpid_defaultValue_i;  // mac_vlan_tag_7_tpid 	is reserved or a constant value, a read access gives the reset value
	end
	18'h000ac : begin
		rdata_comb [15:0]	= ecpri_ethertype_defaultValue_i;  // mac_ethertype_ethtype 	is reserved or a constant value, a read access gives the reset value
		rdata_comb [31:16]	= 16'h0000 ;  // mac_ethertype_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h000b0 : begin
		rdata_comb [15:0]	= ipv4_dw0_address_dw0_tl [15:0] ;		// is reserved or a constant value, a read access gives the reset value
		rdata_comb [23:16]	= ipv4_dw0_address_dw0_tos [7:0] ;		// readType = read   writeType =write
		rdata_comb [27:24]	= ipv4_dw0_address_dw0_hl [3:0] ;		// is reserved or a constant value, a read access gives the reset value
		rdata_comb [31:28]	= ipv4_dw0_address_dw0_ver [3:0] ;		// is reserved or a constant value, a read access gives the reset value
	end
	18'h000b4 : begin
		rdata_comb [12:0]	= ipv4_dw1_address_dw1_frag_offs [12:0] ;		// readType = read   writeType =write
		rdata_comb [15:13]	= ipv4_dw1_address_dw1_flg [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= ipv4_dw1_address_dw1_id [15:0] ;		// readType = read   writeType =write
	end
	18'h000b8 : begin
		rdata_comb [15:0]	= ipv4_dw2_address_dw2_hdchksum [15:0] ;		// is reserved or a constant value, a read access gives the reset value
		rdata_comb [23:16]	= ipv4_dw2_address_dw2_prot [7:0] ;		// is reserved or a constant value, a read access gives the reset value
		rdata_comb [31:24]	= ipv4_dw2_address_dw2_tol [7:0] ;		// readType = read   writeType =write
	end
	18'h000bc : begin
		rdata_comb [31:0]	= ipv4_src_address_0_ipv4_src_address_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h000c0 : begin
		rdata_comb [31:0]	= ipv4_dst_address_0_ipv4_dst_address_0 [31:0] ;		// readType = read   writeType =write
	end
	18'h000c4 : begin
		rdata_comb [15:0]	= mudp_dw0_address_udp_dw0_chksum [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= mudp_dw0_address_udp_dw0_length [15:0] ;		// readType = read   writeType =write
	end
	18'h000c8 : begin
		rdata_comb [15:0]	= mudp_address_0_udp_src_port [15:0] ;		// readType = read   writeType =write
		rdata_comb [31:16]	= mudp_address_0_udp_dest_port [15:0] ;		// readType = read   writeType =write
	end
	18'h000f4 : begin
		rdata_comb [0]	= packet_type_enable_ipv6_en  ;		// readType = read   writeType =write
		rdata_comb [1]	= packet_type_enable_ipv4_en  ;		// readType = read   writeType =write
		rdata_comb [2]	= packet_type_enable_vlan_en  ;		// readType = read   writeType =write
		rdata_comb [3]	= packet_type_enable_svlan_en  ;		// readType = read   writeType =write
		rdata_comb [4]	= packet_type_enable_udp_en  ;		// readType = read   writeType =write
		rdata_comb [31:5]	= 27'h0000000 ;  // packet_type_enable_rx_err_resv 	is reserved or a constant value, a read access gives the reset value
	end
	18'h000f8 : begin
		rdata_comb [0]	= rx_error_address_ipv4_chksum_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [1]	= rx_error_address_udp_chksum_err  ;		// readType = read   writeType =oneToClear
		rdata_comb [31:2]	= 30'h00000000 ;  // rx_error_address_rx_err_resv 	is reserved or a constant value, a read access gives the reset value
	end
	18'h000fc : begin
		rdata_comb [11:0]	= cu_vlanid_match_address_vid_addr [11:0] ;		// readType = read   writeType =write
		rdata_comb [12]	= cu_vlanid_match_address_match_macaddr_vlanid  ;		// readType = read   writeType =write
		rdata_comb [31:13]	= 19'h00000 ;  // cu_vlanid_match_address_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00100 : begin
		rdata_comb [2:0]	= ecpri_priority_ecpri_priority_value [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // ecpri_priority_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00104 : begin
		rdata_comb [2:0]	= ptp_priority_ptp_priority_value [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // ptp_priority_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h00108 : begin
		rdata_comb [2:0]	= misc_priority_misc_priority_value [2:0] ;		// readType = read   writeType =write
		rdata_comb [31:3]	= 29'h00000000 ;  // misc_priority_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h0010c : begin
		rdata_comb [0]	= pq_starvation_en_pq_starvation_ext0  ;		// readType = read   writeType =write
		rdata_comb [1]	= pq_starvation_en_pq_starvation_ext1  ;		// readType = read   writeType =write
		rdata_comb [31:2]	= 30'h00000000 ;  // pq_starvation_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	18'h3ffff : begin
		rdata_comb [31:0]	= 32'h00000000 ;  // farend_address_reserved 	is reserved or a constant value, a read access gives the reset value
	end
	default : begin
		rdata_comb = 32'h00000000;
	end
      endcase
   end
end

// Hack
assign intr_msg5_id_err       = ecpri_rx_err_msg_rx_meas_id_err;
assign intr_msg5_noresp_err   = ecpri_rx_err_msg_no_resp_msg5_err;
assign intr_rsvd_msg_rx_err   = ecpri_rx_err_msg_rx_msg_type_err;
assign intr_rsvd_msg_tx_err   = ecpri_tx_err_msg_tx_msg_type_err;
assign intr_msg4_noresp_err   = ecpri_rx_err_msg_no_mem_resp_err;
assign mac_vlan_tag_0_dei     = ipv4_dei_defaultValue_i ;
assign mac_vlan_tag_0_tpid    = ipv4_tpid_defaultValue_i;
assign mac_vlan_tag_1_dei     = ipv4_dei_defaultValue_i ;
assign mac_vlan_tag_1_tpid    = ipv4_tpid_defaultValue_i;
assign mac_vlan_tag_2_dei     = ipv4_dei_defaultValue_i ;
assign mac_vlan_tag_2_tpid    = ipv4_tpid_defaultValue_i;
assign mac_vlan_tag_3_dei     = ipv4_dei_defaultValue_i ;
assign mac_vlan_tag_3_tpid    = ipv4_tpid_defaultValue_i;
assign mac_vlan_tag_4_dei     = ipv4_dei_defaultValue_i ;
assign mac_vlan_tag_4_tpid    = ipv4_tpid_defaultValue_i;
assign mac_vlan_tag_5_dei     = ipv4_dei_defaultValue_i ;
assign mac_vlan_tag_5_tpid    = ipv4_tpid_defaultValue_i;
assign mac_vlan_tag_6_dei     = ipv4_dei_defaultValue_i ;
assign mac_vlan_tag_6_tpid    = ipv4_tpid_defaultValue_i;
assign mac_vlan_tag_7_dei     = ipv4_dei_defaultValue_i ;
assign mac_vlan_tag_7_tpid    = ipv4_tpid_defaultValue_i;
assign mac_ethertype_ethtype  = ecpri_ethertype_defaultValue_i;
endmodule
