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


`ifndef O_RU_REF_ECPRI_HEADER_EXTRACT_SV
`define O_RU_REF_ECPRI_HEADER_EXTRACT_SV
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_ecpri_header_extract
//------------------------------------------------------------------------------ 

class o_ru_ref_ecpri_header_extract extends o_ru_base_ref;
`uvm_component_utils(o_ru_ref_ecpri_header_extract)

  o_ru_ref_avsts_item m_item;
  o_ru_ref_avsts_item ref_item;
  avsts_item m_item_inp;

   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task          run_phase(uvm_phase phase);
extern virtual task          ecpri_reference_header_extract(ref o_ru_ref_avsts_item pkt ,ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          ethernet_header_extract(ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config, ref o_ru_ref_avsts_item pkt);
extern virtual task          ecpri_header_extract(ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config,ref o_ru_ref_avsts_item pkt);

endclass: o_ru_ref_ecpri_header_extract 

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_ecpri_header_extract::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_ecpri_header_extract::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_ecpri_header_extract::run_phase(uvm_phase phase);
     fork
        begin
           forever
           begin
              m_item_inp  = new();
              m_item      = new();
              ref_item    = new();
              m_fifo[0].get(m_item_inp);
              $cast(m_item,m_item_inp);
              ref_item.buf_packet_out = new[m_item.buf_packet_out.size] (m_item.buf_packet_out) ;


              ref_item.pc_id            = m_config.pc_id;
              ref_item.seq_id           = m_config.seq_id;
              ref_item.port_id          = m_config.port_id;
              ref_item.msg_type         = m_config.msg_type;
              ref_item.protocol_rev     = m_config.protocol_rev;
              ref_item.reserved         = m_config.reserved;
              ref_item.conc             = m_config.conc;
              ref_item.destination_addr = m_config.destination_addr;
              ref_item.source_addr      = m_config.source_addr;
              ref_item.vlan_tag         = m_config.vlan_tag;
              ref_item.eth_type         = m_config.eth_type;
              ref_item.payload_size     = m_config.payload_size;
 

              m_config.msg_type  = ref_item.buf_packet_out [ref_item.MSG_TYPE] ;
              ref_item.rx_data_q = ref_item.buf_packet_out;
              `uvm_info("ECPRI_HDR_EXTRACT", $sformatf("Ref packet size: %0d Queue size %0d", ref_item.buf_packet_out.size(),ref_item.rx_data_q.size()), UVM_DEBUG);
              ecpri_reference_header_extract(ref_item,ref_item.rx_data_q, m_config);
           end
        end                  // Fork
     join_none
endtask : run_phase

task o_ru_ref_ecpri_header_extract::ecpri_reference_header_extract(ref o_ru_ref_avsts_item pkt,ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config);
   ethernet_header_extract(rx_data_queue, m_config, ref_item);
   ecpri_header_extract(rx_data_queue, m_config,ref_item);
endtask


// ----------------------------
// Ethernet Header Extraction
// ----------------------------

// Input to eCPRI IP block - packet with Ethernet header, eCPRI header, ORAN header and IQ data

// ---------------------------------------------------------------------------------
// |   Ethernet header  |   eCPRI header   |     ORAN header    |    IQ data       |
// |     (18 bytes)     |     (8 bytes)    |                    |                  |
// ----------------------------------------------------------------------------------


task o_ru_ref_ecpri_header_extract::ethernet_header_extract(ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config, ref o_ru_ref_avsts_item pkt);

   m_config.destination_addr = {rx_data_queue[0], rx_data_queue[1], rx_data_queue[2], rx_data_queue[3], rx_data_queue[4], rx_data_queue[5]};
   m_config.source_addr      = {rx_data_queue[6], rx_data_queue[7], rx_data_queue[8], rx_data_queue[9], rx_data_queue[10], rx_data_queue[11]};
   m_config.vlan_tag         = {rx_data_queue[12], rx_data_queue[13], rx_data_queue[14], rx_data_queue[15]};
   m_config.eth_type         = {rx_data_queue[16], rx_data_queue[17]};

endtask

// ----------------------------
// eCPRI Header extraction
// ----------------------------


task o_ru_ref_ecpri_header_extract::ecpri_header_extract(ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config,ref o_ru_ref_avsts_item pkt);

   bit [7:0] rev;
   rev               = rx_data_queue[18];
   m_config.protocol_rev  = rev[7:4];
   m_config.reserved      = rev[3:1];
   m_config.conc          = rev[0];
   m_config.msg_type      = rx_data_queue[19];
   m_config.payload_size  = {rx_data_queue[20], rx_data_queue[21]};
   m_config.pc_id         = {rx_data_queue[22], rx_data_queue[23]};
   m_config.seq_id        = {rx_data_queue[24], rx_data_queue[25]};

endtask

`endif
                                                                                                                                                                                               
