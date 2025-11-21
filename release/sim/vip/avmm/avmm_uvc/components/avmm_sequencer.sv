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

`ifndef AVMM_SEQUENCER_SV
`define AVMM_SEQUENCER_SV

  //------------------------------------------------------------------------------
  // CLASS: avmm_sequencer declaration
  //------------------------------------------------------------------------------
  class avmm_sequencer extends uvm_sequencer #(avmm_item);
    `uvm_component_utils(avmm_sequencer)
    avmm_config m_config;  
    // Constructor
    function new (string name="avmm_sequencer", uvm_component parent);
      super.new(name, parent);
    endfunction : new
  
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
  endclass : avmm_sequencer
  
  //Declare the build_phase method
  function void avmm_sequencer::build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction : build_phase
  
  // Declaration of the UVM run_phase method.
  task avmm_sequencer::run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask : run_phase


`endif // AVMM_SEQUENCER_SV

