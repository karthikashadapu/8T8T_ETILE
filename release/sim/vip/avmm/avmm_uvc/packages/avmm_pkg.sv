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
`ifndef AVMM_PKG_SV
`define AVMM_PKG_SV


  package avmm_pkg;
  
    // Import the UVM class library  and UVM automation macros
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    `include "../items/avmm_item.sv"
    `include "../components/avmm_config.sv"
    `include "../components/avmm_sequencer.sv"
    `include "../components/avmm_monitor.sv"
    `include "../components/avmm_driver.sv"
    `include "../components/avmm_agent.sv"
  
    `include "../components/avmm_env.sv"
    //`include "../components/reg_adapter.sv"
    
    `include "../sequences/avmm_sequences.sv"
  
  endpackage : avmm_pkg
`endif  

