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
`ifndef AVSTS_SEQUENCES_SV 
`define AVSTS_SEQUENCES_SV 
//------------------------------------------------------------------------------
// SEQUENCE: base_seq
//------------------------------------------------------------------------------
class avsts_base_seq extends uvm_sequence #(avsts_item);
  `uvm_object_utils(avsts_base_seq)
  `uvm_declare_p_sequencer(avsts_sequencer)
avsts_pkg::avsts_config m_config;
avsts_item req;

  function new(string name="avsts_base_seq");
    super.new(name);
    m_config = new();
  endfunction
  extern virtual task pre_start();
  extern virtual task post_start();
  extern virtual task body();
endclass : avsts_base_seq

// Use a base sequence to raise/drop objections if this is a default sequence
task avsts_base_seq::pre_start();
  if (starting_phase != null)
   starting_phase.raise_objection(this, {"Running sequence '", get_full_name(), "'"});
endtask

task avsts_base_seq::post_start();
  if (starting_phase != null)
   starting_phase.drop_objection(this, {"Completed sequence '", get_full_name(), "'"});
endtask

task avsts_base_seq::body();
  `uvm_info(get_type_name(), "Starting...", UVM_HIGH)
   req    = avsts_item::type_id::create("req");

 //ADD sequence here
   start_item(this.req);
   this.req.do_pack(uvm_default_packer); 
   finish_item(this.req);

   `uvm_info(get_type_name(), $psprintf("Sending item"), UVM_HIGH)
endtask : body

`endif
