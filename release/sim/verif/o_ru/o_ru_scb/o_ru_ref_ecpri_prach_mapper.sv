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

`ifndef O_RU_REF_ECPRI_PRACH_MAPPER_SV 
`define O_RU_REF_ECPRI_PRACH_MAPPER_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_ref_ecpri_prach_mapper
//------------------------------------------------------------------------------ 


`include "../o_ru_tb_files/o_ru_defines.sv"
class o_ru_ref_ecpri_prach_mapper extends o_ru_base_ref; 
`uvm_component_utils(o_ru_ref_ecpri_prach_mapper) 

  o_ru_ref_avsts_item ref_item; 
  o_ru_ref_avsts_item m_item;
  avsts_item m_item_inp;
  bit[7:0] swap_array[8][];   
  int out_trig_counter;
  int local_counter,pkt_cnt;

  shortint pc_id_cnt=0,seq_id_cnt=0;
   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task          run_phase(uvm_phase phase);
extern virtual task          ecpri_reference_mapper(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          ecpri_header_add_prach(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          ethernet_header_add(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
extern virtual task          axc_pc_id_change(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);

endclass: o_ru_ref_ecpri_prach_mapper

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_ref_ecpri_prach_mapper::build_phase(uvm_phase phase);
     super.build_phase(phase);
  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_ref_ecpri_prach_mapper::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_ref_ecpri_prach_mapper::run_phase(uvm_phase phase);
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
              ref_item.rx_data_q = ref_item.buf_packet_out;
              ref_item.pc_id   = m_item.pc_id;
              ref_item.seq_id  = m_item.seq_id;
              ref_item.prach_pkt = m_item.prach_pkt ;
              ecpri_reference_mapper(ref_item,m_config);
              axc_pc_id_change(ref_item,m_config); 
              $cast(m_item_inp,ref_item);
              `uvm_info("ECPRI_MAPPER PRACH", $sformatf("ECPRI mpr prach exp_output(1st 8bytes) : %0h", {ref_item.buf_packet_out[0],ref_item.buf_packet_out[1],ref_item.buf_packet_out[2],ref_item.buf_packet_out[3],ref_item.buf_packet_out[4],ref_item.buf_packet_out[5],ref_item.buf_packet_out[6],ref_item.buf_packet_out[7]}), UVM_HIGH);           // Displaying first 8 bytes (64 bits) of ORAN demapper output
              m_output[0].write(m_item_inp);
	   end	
        end  // Fork
     join_none
  endtask : run_phase

task o_ru_ref_ecpri_prach_mapper::ecpri_reference_mapper(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);		
   ecpri_header_add_prach(pkt,m_config); 
   ethernet_header_add(pkt,m_config); 
endtask

// ----------------------------
// eCPRI Header insertion
// ----------------------------

// eCPRI header format

// ----------------------------------------------------------------------------------
// | Protocol revision (4 bits)  |   Reserved (3 bits)  |   Concatenation(1 bit)    |                  
// ----------------------------------------------------------------------------------
// |                            Message Type (1 byte)                               |                                                       |
// ----------------------------------------------------------------------------------
// |                            Payload Size (2 bytes)                              |
// ----------------------------------------------------------------------------------
// |                               PC_ID (2 bytes)                                  | 
// ----------------------------------------------------------------------------------
// |                               SEQ_ID (2 bytes)                                 |  
// ----------------------------------------------------------------------------------


// Input to eCPRI IP block - packet with ORAN header and IQ data
// Adds eCPRI header to the packet

// -------------------------------------------------------------
// |    eCPRI header   |     ORAN header    |     IQ data      |
// |      (8 bytes)    |                    |                  |
// -------------------------------------------------------------


task o_ru_ref_ecpri_prach_mapper::ecpri_header_add_prach(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
   byte unsigned packet[];
   byte unsigned ecpri_arr[];

   ecpri_arr = new[8];
   m_config.payload_size = pkt.buf_packet_out.size + 4;
   seq_id_cnt[7:0] = 8'h80 ;
   ecpri_arr[0] = {4'h1,m_config.reserved[2:0],m_config.conc};
   ecpri_arr[1] = 0 ;
   ecpri_arr[2] = {m_config.payload_size[15:8]};
   ecpri_arr[3] = {m_config.payload_size[7:0]};
   pc_id_cnt[7:0]   = pkt.pc_id[7:0];
   seq_id_cnt[15:8] = pkt.seq_id[15:8];
   ecpri_arr[4]     = {pc_id_cnt[15:8]};
   ecpri_arr[5]     = {pc_id_cnt[7:0]};
   ecpri_arr[6]     = {seq_id_cnt[15:8]};
   ecpri_arr[7]     = {seq_id_cnt[7:0]};
     
   packet = new[ecpri_arr.size + pkt.buf_packet_out.size];

   foreach(ecpri_arr[i]) begin
      packet[i] = ecpri_arr[i];
   end      
         
   foreach(pkt.buf_packet_out[i]) begin
      packet[i+8] = pkt.buf_packet_out[i];
   end
   pkt.buf_packet_out = new[packet.size](packet);
endtask


// Output of eCPRI IP block - packet with eCPRI header, ORAN header and IQ data



// ---------------------------
// Ethernet Header insertion
// ---------------------------

// Ethernet header format
// -------------------------------------------------------------------------------------
// | Destination address  |   Source address   |     VLAN tag       |   Ethernet Type  |
// |     (6 bytes)        |     (6 bytes)      |     (4 bytes)      |     (2 bytes)    |
// -------------------------------------------------------------------------------------


// Input to Ethernet block - packet with eCPRI header, ORAN header and IQ data
// Adds Ethernet header to the packet

// ---------------------------------------------------------------------------------
// |   Ethernet header  |   eCPRI header   |     ORAN header    |    IQ data       |
// |     (18 bytes)     |     (8 bytes)    |                    |                  |
// ---------------------------------------------------------------------------------


task o_ru_ref_ecpri_prach_mapper::ethernet_header_add(ref o_ru_ref_avsts_item pkt, ref o_ru_config_pkg::o_ru_ip_config m_config);
   byte unsigned packet[];
   byte unsigned ethernet_arr[];


   ethernet_arr = new[14];
   ethernet_arr[0] =  {m_config.destination_mac_msb[15:8]};
   ethernet_arr[1] =  {m_config.destination_mac_msb[7:0]};
   ethernet_arr[2] =  {m_config.destination_mac_lsb[31:24]};
   ethernet_arr[3] =  {m_config.destination_mac_lsb[23:16]};
   ethernet_arr[4] =  {m_config.destination_mac_lsb[15:8]};
   ethernet_arr[5] =  {m_config.destination_mac_lsb[7:0]};
   ethernet_arr[6] =  {m_config.source_mac_msb[15:8]};
   ethernet_arr[7] =  {m_config.source_mac_msb[7:0]};
   ethernet_arr[8] =  {m_config.source_mac_lsb[31:24]};
   ethernet_arr[9] =  {m_config.source_mac_lsb[23:16]};
   ethernet_arr[10] = {m_config.source_mac_lsb[15:8]};
   ethernet_arr[11] = {m_config.source_mac_lsb[7:0]};
   ethernet_arr[12] = 8'hae;
   ethernet_arr[13] = 8'hfe;

   packet = new[ethernet_arr.size + pkt.buf_packet_out.size];

   foreach(ethernet_arr[i]) begin
      packet[i] = ethernet_arr[i];
   end
   
   foreach(pkt.buf_packet_out[i]) begin
      packet[i+14] = pkt.buf_packet_out[i];
   end
   pkt.buf_packet_out = new[packet.size](packet);
endtask

task o_ru_ref_ecpri_prach_mapper::axc_pc_id_change(ref o_ru_ref_avsts_item pkt,ref o_ru_config_pkg::o_ru_ip_config m_config);		

  bit[15:0] temp;
 
  temp = {pkt.buf_packet_out[18],pkt.buf_packet_out[19]};

   {pkt.buf_packet_out[18],pkt.buf_packet_out[19]}  =  m_config.ul_mac_axc[temp];  

endtask

`endif 
