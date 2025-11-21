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

`ifndef O_RU_REF_ECPRI_DEMAPPER_SV 
`define O_RU_REF_ECPRI_DEMAPPER_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_ecpri_demapper
//------------------------------------------------------------------------------ 


class o_ru_ref_ecpri_demapper extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_ecpri_demapper) 
  
  localparam int ETHERNET = 18;
  localparam int ECPRI = 8;  
  
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
extern virtual task          ecpri_reference_demapper(ref o_ru_ref_avsts_item pkt ,ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          ethernet_header_rem(ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          ecpri_header_rem(ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config,ref o_ru_ref_avsts_item pkt);

endclass: o_ru_ref_ecpri_demapper

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_ecpri_demapper::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_ecpri_demapper::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_ecpri_demapper::run_phase(uvm_phase phase);
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
          `uvm_info("ECPRI_DEMAP", $sformatf("Ref packet size: %0d", ref_item.buf_packet_out.size()), UVM_DEBUG);


          ref_item.port_id      = m_config.port_id;
          ref_item.msg_type     = m_config.msg_type;
          ref_item.payload_size = m_config.payload_size;


          `uvm_info("ECPRI_DEMAP", $psprintf("ECPRI HEADER REMOVAL ENTRY"), UVM_DEBUG);
          m_config.msg_type = ref_item.buf_packet_out [ref_item.MSG_TYPE] ;
          ref_item.rx_data_q = ref_item.buf_packet_out;
          `uvm_info("ECPRI_DEMAP", $sformatf("Ref packet size: %0d Queue size %0d", ref_item.buf_packet_out.size(),ref_item.rx_data_q.size()), UVM_DEBUG);
          ecpri_reference_demapper(ref_item,ref_item.rx_data_q, m_config);
          `uvm_info("ECPRI_DEMAP", $psprintf("ECPRI HEADER REMOVAL EXIT"), UVM_DEBUG); 
          $cast(m_item_inp,ref_item);

          `uvm_info("ECPRI_DEMAP", $sformatf("eCPRI dmpr exp_output(1st 8bytes): %0h", {ref_item.buf_packet_out[0],ref_item.buf_packet_out[1],ref_item.buf_packet_out[2],ref_item.buf_packet_out[3],ref_item.buf_packet_out[4],ref_item.buf_packet_out[5],ref_item.buf_packet_out[6],ref_item.buf_packet_out[7]}), UVM_DEBUG);
          m_output[0].write(m_item_inp);
       end	
    end  // Fork
    join_none
  endtask : run_phase

task o_ru_ref_ecpri_demapper::ecpri_reference_demapper(ref o_ru_ref_avsts_item pkt,ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config);
   ethernet_header_rem(rx_data_queue, m_config);
   m_config.payload_size = {rx_data_queue[ref_item.ECPRI_PAYLOAD_LEN],rx_data_queue[ref_item.ECPRI_PAYLOAD_LEN+1]} ;
   ecpri_header_rem(rx_data_queue, m_config,ref_item);
   m_config.payload_size = m_config.payload_size - 4;
endtask


// ----------------------------
// Ethernet Header removal
// ----------------------------

// Input to eCPRI IP block - packet with Ethernet header, eCPRI header, ORAN header and IQ data

// ---------------------------------------------------------------------------------
// |   Ethernet header  |   eCPRI header   |     ORAN header    |    IQ data       |
// |     (18 bytes)     |     (8 bytes)    |                    |                  |
// ---------------------------------------------------------------------------------


// Removes Ethernet header in the packet

// -------------------------------------------------------------
// |    eCPRI header   |     ORAN header    |     IQ data      |
// |      (8 bytes)    |                    |                  |
// -------------------------------------------------------------


task o_ru_ref_ecpri_demapper::ethernet_header_rem(ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config);
  for(int i=0; i<ETHERNET; i++) begin		
     rx_data_queue.delete(0);		        // Removes ethernet header fields
  end
endtask


// ----------------------------
// eCPRI Header removal
// ----------------------------


// Removes eCPRI header in the packet

// ---------------------------------------
// |   ORAN header    |     IQ data      |
// ---------------------------------------

task o_ru_ref_ecpri_demapper::ecpri_header_rem(ref byte unsigned rx_data_queue[$], ref o_ru_config_pkg::o_ru_ip_config m_config,ref o_ru_ref_avsts_item pkt);

   int bal_payload_size ;
   int rmn_bytes , bal_size;
   for(int i=0; i<ECPRI; i++) begin		
      rx_data_queue.delete(0);                     // Removes eCPRI header fields
   end
   if(m_config.msg_type == 2) begin
      bal_payload_size = m_config.payload_size - 4 ;
      rmn_bytes = ((rx_data_queue.size()) - bal_payload_size) ;
      if(bal_payload_size != rx_data_queue.size()) begin
         for(int i=0 ; i< rmn_bytes ; i++ ) begin
            rx_data_queue.delete(rx_data_queue.size()-1) ;
         end
      end
   end  
   ref_item.buf_packet_out = new[rx_data_queue.size()](rx_data_queue) ;

endtask

// Output of eCPRI IP block - packet with ORAN header and IQ data

`endif 
