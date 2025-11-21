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
`ifndef O_RU_CLK_ENV_SV
`define O_RU_CLK_ENV_SV
  //------------------------------------------------------------------------------
  // CLASS: o_ru_clk_env
  //------------------------------------------------------------------------------
  class o_ru_clk_env extends uvm_env;
    `uvm_component_utils(o_ru_clk_env)

    // Components of the environment
    o_ru_clk_agent        m_agent;
    o_ru_clk_config       m_config;

    // Constructor - Required UVM syntax
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction : new

    // Class Functions or Tasks
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

  endclass : o_ru_clk_env

  // UVM build_phase
  function void o_ru_clk_env::build_phase(uvm_phase phase);
    super.build_phase(.phase(phase));
    m_agent    = o_ru_clk_agent::type_id::create("m_agent",this);
  endfunction : build_phase  

  function void o_ru_clk_env::connect_phase(uvm_phase phase);
    super.connect_phase(.phase(phase));
  endfunction : connect_phase	

`endif // CLK_ENV_SV
