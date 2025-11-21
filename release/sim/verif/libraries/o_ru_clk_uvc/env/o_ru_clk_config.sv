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
`ifndef O_RU_CLK_CONFIG_SV
`define O_RU_CLK_CONFIG_SV

  // CLK Configuration Information 
  class o_ru_clk_config extends uvm_object;
    `uvm_object_utils(o_ru_clk_config)

    // Local configurations
    int                       c_id                   = -1;
    string                    c_name                 = "";
    realtime                  c_reset_off            = 0.0ns;
    uvm_active_passive_enum   c_is_active            = UVM_PASSIVE;
    uvm_active_passive_enum   c_is_reset             = UVM_PASSIVE;
    bit                       c_coverage_enable      = 1'b0;

    function new (string name = "o_ru_clk_config");
      super.new(name);
    endfunction

  endclass  : o_ru_clk_config

`endif // CLK_CONFIG_SV
