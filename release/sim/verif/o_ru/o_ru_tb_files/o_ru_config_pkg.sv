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

`ifndef O_RU_CONFIG_PKG_SV 
`define O_RU_CONFIG_PKG_SV
 
//------------------------------------------------------------------------------ 
// Name        : o_ru_config_pkg 
// Description : Main test config package for the TB 
//------------------------------------------------------------------------------ 

package o_ru_config_pkg ; 

  //Import the UVM Class libraries and UVM Automation Macros 
  import uvm_pkg::*; 
  import avsts_pkg::*;
  import avmm_pkg::*; 
  `include "uvm_macros.svh" 

  //Configure Interface Counts
  //Control of VIP parametes TODO
  localparam int c_clk_cnt              = 1;      //Number of clk interfaces
  localparam int c_drv_data_cnt[]       = {0,0};  // Count of a specific driver interface type
  localparam int c_mon_data_cnt[]       = {0,0};  // Count of a specific monitor interface type
  localparam int c_avsts_drv_data_cnt[] = {6,0};  //Number of Specific Driver interface types
  localparam int c_avsts_mon_data_cnt[] = {31,0}; //Number of Specific monitor interface types
  localparam int c_avstmm_cnt           = 1;
  `include "o_ru_reg_adapter_avmm.sv"
  `include "o_ru_defines.sv"
  `include "o_ru_ip_config.sv"
  `include "Top_Subsystem_mmap_urm.svh"
  `include "o_ru_reg.sv"
  `include "o_ru_config.sv"

endpackage : o_ru_config_pkg

`endif 
