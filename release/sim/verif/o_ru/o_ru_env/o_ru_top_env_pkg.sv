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
`ifndef O_RU_TOP_ENV_PKG_SV
`define O_RU_TOP_ENV_PKG_SV

package o_ru_top_env_pkg;
  
  import uvm_pkg::*;
  import o_ru_clk_pkg::*;
  import  o_ru_config_pkg::*;
  import  avsts_pkg::*;
  import  avmm_pkg::*;
  import o_ru_scb_pkg::*;
  `include "uvm_macros.svh"

  `include "../o_ru_env/o_ru_avsts_agent_env.sv"
  `include "../o_ru_env/o_ru_avmm_agent_env.sv"
  `include "../o_ru_env/o_ru_top_env.sv"


endpackage : o_ru_top_env_pkg
`endif
