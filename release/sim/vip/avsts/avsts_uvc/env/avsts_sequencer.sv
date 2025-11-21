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
`ifndef AVSTS_SEQUENCER_SV 
`define AVSTS_SEQUENCER_SV 
//------------------------------------------------------------------------------ 
// CLASS: avsts_sequencer Declaration 
//------------------------------------------------------------------------------ 
class avsts_sequencer extends uvm_sequencer #(avsts_item); 
`uvm_component_utils(avsts_sequencer) 

avsts_config              m_config;

 // new - constructor 
 function new (string name="avsts_sequencer", uvm_component parent); 
    super.new(name, parent);
 endfunction : new 

 // Additional class methods 
extern virtual function void build_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);

endclass : avsts_sequencer

// UVM build_phase 
function void avsts_sequencer::build_phase(uvm_phase phase);
   super.build_phase(phase);

    if(!uvm_config_db #(avsts_config)::get(this, "", "avsts_config",  m_config))
      `uvm_fatal("AVSTS_SEQUENCER", "avsts_sequencer config not found")

endfunction : build_phase

// Declaration of the UVM run_phase method.
task avsts_sequencer::run_phase(uvm_phase phase);
   super.run_phase(phase);

endtask : run_phase
`endif
