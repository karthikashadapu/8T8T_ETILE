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

`ifndef AVSTS_CONFIG_SV 
`define AVSTS_CONFIG_SV 
//------------------------------------------------------------------------------ 
// CLASS: avsts_config 
//------------------------------------------------------------------------------ 
class avsts_config extends uvm_object; 
`uvm_object_utils(avsts_config) 

    int                       c_type_id         =-1; 
    int                       c_id              =-1; 
    string                    c_name            = "";
    uvm_active_passive_enum   c_is_active       = UVM_ACTIVE; 
    bit                       c_coverage_enable = 1;  
    bit                       c_is_tx           = 1;
    bit                       c_is_par          = 1;
    bit                       c_loop_enable     = 0;
 
    rand int pkt_cnt;
    rand int ipg  ;
    int sf    ;
    int sf_pu ;
    rand int idle_cnt;
    rand int pkt_id = -1;
    real time_cnt ;


 // new - constructor 
 function new (string name="avsts_config"); 
    super.new(name);
 endfunction : new 

    localparam int c_avsts_if_cnt     = 1;     // Count of data interface types
    localparam int c_drv_avsts_cnt[]  = {1};   // Count of a specific driver interface type
    localparam int c_mon_avsts_cnt[]  = {1};   // Count of a specific monitor interface type
    virtual avsts_if drv_avsts_vif_0[c_drv_avsts_cnt[0]];
    virtual avsts_if mon_avsts_vif_0[c_mon_avsts_cnt[0]];
  

    constraint pkt_cnt_c {
      soft pkt_cnt == 2;
    }

endclass : avsts_config

`endif
