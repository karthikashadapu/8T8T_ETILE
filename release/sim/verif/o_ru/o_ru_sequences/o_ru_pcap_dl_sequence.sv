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

`ifndef O_RU_PCAP_DL_SEQUENCE_SV
`define O_RU_PCAP_DL_SEQUENCE_SV

class o_ru_pcap_dl_sequence extends uvm_sequence #(avsts_item);
   `uvm_object_utils(o_ru_pcap_dl_sequence)
   `uvm_declare_p_sequencer(avsts_sequencer)
   avsts_pkg::avsts_config m_config;
   o_ru_config_pkg::o_ru_ip_config m_ip_config = new() ;
   avsts_item req;
   int t, u_pkt_cnt;
   int pkt = 1;
   int no_axc = 0;
   int no_sym = 0;
   string pcap_string;

  function new(string name = "o_ru_pcap_dl_sequence");
    super.new(name);
    m_config = new();
  endfunction
  extern virtual task body();
endclass : o_ru_pcap_dl_sequence

task o_ru_pcap_dl_sequence::body();
   `uvm_info(get_type_name(), "Starting...", UVM_HIGH)

   req    = avsts_item::type_id::create("req");

   req.input_enb = 2;                                                              // 2 for pcap based input 

   pcap_init_file(pcap_string);

   while(1) begin                                                                  // TODO no.of pkts from test                                                                                                           
      req.buf_packet_out = new [9500];                                             // Initialize with Max Ethernet Frame Size will be overwritten from PCAP read
      readPcap(req.tim,req.buf_packet_out,req.len);                                // Read PCAP from C-Model Packet by Packet 
      if(t==0) p_sequencer.m_config.time_cnt = req.tim;                            // Initialize PCAP time for the first Packet alone to speed up Simulation
      req.init(req.tim,req.buf_packet_out,req.len);
      p_sequencer.m_config.ipg = 30 ;                                              // CDC from 402.83 to 390.625, Ethernet Header and Ecpri Header Removal will take around 30 clocks by eCPRI IP                                                                              
      wait(((p_sequencer.m_config.time_cnt) > (req.tim)));                         // Schedule the PCAP based on PCAP time against local time count which is incremented in o_ru_vif in Mac_clk (2.4824) 
      start_item(this.req);
      this.req.do_pack(uvm_default_packer);
      finish_item(this.req);
      if(req.buf_packet_out[19] == 0)                                              // Check for Message Type 0 (U-Plane Packet)            
        u_pkt_cnt = u_pkt_cnt + 1;

      if(u_pkt_cnt == ((`SYM_NUM - no_sym) * `SF_NUM) * pkt * (`AXC_NUM - no_axc))            // Stop the Packet Scheduling based on Simulation Run time options
        break;
      t= t+ 1;
   end

   `uvm_info(get_type_name(), $psprintf("Sending item Done"), UVM_HIGH)
endtask : body

`endif
