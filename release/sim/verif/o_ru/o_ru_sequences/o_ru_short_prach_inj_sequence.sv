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

`ifndef O_RU_SHORT_PRACH_INJ_SEQUENCE_SV
`define O_RU_SHORT_PRACH_INJ_SEQUENCE_SV

class o_ru_short_prach_inj_sequence extends uvm_sequence #(avsts_item);
  `uvm_object_utils(o_ru_short_prach_inj_sequence)
  `uvm_declare_p_sequencer(avsts_sequencer)
   avsts_pkg::avsts_config m_config;
   o_ru_config_pkg::o_ru_ip_config m_ip_config = new() ;
   avsts_item req1;
   int temp1[];
   int seq_cnt;
   longint lines;

  function new(string name="o_ru_short_prach_inj_sequence");
    super.new(name);
    m_config = new();
  endfunction
  extern virtual task body();
endclass : o_ru_short_prach_inj_sequence

task o_ru_short_prach_inj_sequence::body();

  int file_read_short[2];

  `uvm_info(get_type_name(), "Starting...", UVM_HIGH)

    req1    = avsts_item::type_id::create("req1");

    for(int k=0; k<`SF_NUM ; k++) begin                                   //no. of symbols
      file_read_short[0] = $fopen(`PRACH_OUT_SHORT_LINEUP1_EXP, "r");   
      file_read_short[1] = $fopen(`PRACH_OUT_SHORT_LINEUP2_EXP, "r");   
      if(k != 0) #600us;
      for(int t=0; t< 12; t++) begin                
         for(int j=0; j<(`AXC_NUM/2); j++) begin                          //no. of layers for each link  
           temp1 = new[lines];
           for(int i=0; i<lines; i++) begin
             $fscanf(file_read_short[seq_cnt],"%h",temp1[i]);
           end
           {>>{req1.buf_packet_out}} = temp1;
           p_sequencer.m_config.ipg = 3952 ;
           p_sequencer.m_config.sf[16:9]  = k    ;
           start_item(this.req1);
           this.req1.do_pack(uvm_default_packer);
           finish_item(this.req1);
         end
      end
    end

  `uvm_info(get_type_name(), $psprintf("Sending item Done"), UVM_HIGH)
endtask : body

`endif
