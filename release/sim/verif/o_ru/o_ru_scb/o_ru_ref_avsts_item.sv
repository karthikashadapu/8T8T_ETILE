/* ******************************************************************************************************************
 INTEL CONFIDENTIAL
 Copyright 2023 Intel Corporation All Rights Reserved.
 The source code contained or described herein and all documents related to the
 source code ("Material") are owned by Intel Corporation or its suppliers or
 licensors. Title to the Material remains with Intel Corporation or its
 suppliers and licensors. The Material may contain trade secrets and proprietary
 and confidential information of Intel Corporation and its suppliers and
 licensors, and is protected by worldwide copyright and trade secret laws and
 treaty provisions. No part of the Material may be used, copied, reproduced,
 modified, published, uploaded, posted, transmitted, distributed, or disclosed
 in any way without Intels prior express written permission.
 No license under any patent, copyright, trade secret or other intellectual
 property right is granted to or conferred upon you by disclosure or delivery
 of the Materials, either expressly, by implication, inducement, estoppel or
 otherwise. Any license under such intellectual property rights must be
 express and approved by Intel in writing.
 Unless otherwise agreed by Intel in writing, you may not remove or alter this
 notice or any other notice embedded in Materials by Intel or Intels suppliers
 or licensors in any way.
****************************************************************************************************************** */
`ifndef O_RU_REF_AVSTS_ITEM_SV
`define O_RU_REF_AVSTS_ITEM_SV
//------------------------------------------------------------------------------
// CLASS: o_ru_ref_avsts_item
//------------------------------------------------------------------------------
class o_ru_ref_avsts_item extends avsts_item;
  `uvm_object_utils(o_ru_ref_avsts_item)
  
   byte unsigned rx_data_q[$];
   byte unsigned buf8[9500]  ;   
   shortint fprb[6552]       ;   
   bit pass_array            ;
   int section_count         ;
   shortint c_fprb[]         ;   
   int comp_arr []           ;
   typedef bit[8:0] data_t   ;
   bit window_valid_pkt      ;
   
   localparam int MSG_TYPE = 19        ;            //Defines
   localparam int ECPRI_PAYLOAD_LEN = 2;
   localparam int PORT_ID =5           ;
   localparam int SAMPLES    = 3276       ;
   localparam int SAMPLES_60 = 1944       ;
   localparam int AXC = 8              ;
   localparam int PKT = 5000      ;

   int SEED              ;
   bit [31:0] t2a_max_up ;
   bit [31:0] t2a_min_up ;
   bit [31:0] pkt_time   ;
   real time_cnt         ;
   shortint pc_id        ;
   shortint seq_id       ;
   bit [7:0] port_id     ;
   bit [7:0] msg_type    ;
   bit [3:0] protocol_rev;
   bit [2:0] reserved    ;
   bit       conc        ;
   bit [47:0] destination_addr;
   bit [47:0] source_addr  ;
   bit [31:0] vlan_tag     ;
   bit [15:0] eth_type     ;
   shortint payload_size   ;
   
   bit        data_direction [PKT]; 
   bit [2:0]  payload_version[PKT];
   bit [3:0]  filter_index   [PKT];
   bit [7:0]  frame_id       [PKT];
   bit [3:0]  subframe_id    [PKT];
   bit [5:0]  slot_id        [PKT];
   bit [5:0]  symbol_id      [PKT];

   bit [11:0] section_id[PKT][]   ;
   bit        rb        [PKT][]   ;
   bit        syminc    [PKT][]   ;
   bit [9:0]  startprb_u[PKT][]   ;
   bit [7:0]  numprb_u  [PKT][]   ;

   bit      c_dataDirection   [AXC][];
   bit[2:0] c_payloadVersion  [AXC][];
   bit[3:0] c_filterIndex     [AXC][];
   bit[7:0] c_frameId         [AXC][];
   bit[3:0] c_subframeId      [AXC][];
   bit[5:0] c_slotID          [AXC][];
   bit[5:0] c_startSymbolid   [AXC][];
   bit[7:0] c_numberOfSections[AXC][];
   bit[7:0] c_sectionType     [AXC][];
   bit[7:0] c_udCompHdr       [AXC][];
   bit[7:0] c_reserved        [AXC][];
   bit[11:0] c_sectionId[][][] ;
   bit       c_rb[][][]        ;
   bit       c_symInc[][][]    ;
   bit[9:0]  c_startprb_c[][][];
   bit[7:0]  c_numprb_c[][][]  ;
   bit[11:0] c_reMask   [][][] ;
   bit[3:0]  c_numSymbol[][][] ;
   bit       c_ef       [][][] ;
   bit[15:0] c_beamId   [][][] ;

   bit[7:0] ext_typ   ;
   bit[7:0] ext_len   ;
   bit[7:0] ucomp_hdr ;

   int mtu_size       ;
   bit[7:0] comp_width;
   int c_pkt_cnt      ;

   int prach_pkt      ;
   int symbol_number  ; 
  // Constructor - Required UVM syntax
  function new(string name = " o_ru_ref_avsts_item");
    super.new(name);
  endfunction : new

  endclass : o_ru_ref_avsts_item
`endif
