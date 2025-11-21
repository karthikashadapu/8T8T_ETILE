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


`ifndef TC_REG_HW_RESET_BASE_SV
`define TC_REG_HW_RESET_BASE_SV

  //------------------------------------------------------------------------------
  // CLASS: simple test declaration
  //--------------------------------------------------------------------
  class tc_reg_hw_reset_base extends o_ru_base_test;
    `uvm_component_utils(tc_reg_hw_reset_base)
    function new (string name = "tc_reg_hw_reset_base", uvm_component parent=null);
      super.new(name, parent);
    endfunction
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern task run_hw_reset_reg(uvm_reg_block model);
  endclass
  
  function void tc_reg_hw_reset_base::build_phase(uvm_phase phase);
    super.build_phase(phase);
     $display("Super Build  Done .....");
  endfunction
  
  function void tc_reg_hw_reset_base::connect_phase(uvm_phase phase);
    super.connect_phase(.phase(phase));
  endfunction : connect_phase	

  task tc_reg_hw_reset_base::run_hw_reset_reg(uvm_reg_block model);
      uvm_reg_hw_reset_seq hw_reset_seq;
      hw_reset_seq = uvm_reg_hw_reset_seq::type_id::create("hw_reset_seq");
      hw_reset_seq.model = model;
      hw_reset_seq.start(m_env.m_avstmm_env[0].m_agent.m_sequencer);
  endtask: run_hw_reset_reg
  

`endif

