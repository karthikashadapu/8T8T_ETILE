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
`ifndef AVSTS_DRIVER_SV 
`define AVSTS_DRIVER_SV 
//------------------------------------------------------------------------------ 
// CLASS: avsts_driver Declaration 
//------------------------------------------------------------------------------ 
class avsts_driver#(int DATA_WIDTH =64 ,int DRIVER =1, int SOP_EOP_DIS = 0 ) extends uvm_driver #(avsts_item); 
`uvm_component_param_utils(avsts_driver#(DATA_WIDTH,DRIVER,SOP_EOP_DIS)) 

protected virtual avsts_if #(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)) avsts_vif; 
avsts_config              m_config;
avsts_item                m_item;

 // new - constructor 
 function new (string name="avsts_driver", uvm_component parent); 
    super.new(name, parent);
 endfunction : new 

 // Additional class methods 
extern virtual function void build_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);
//extern virtual task automatic DriveData(ref avsts_pkg::avsts_item item);
//extern virtual task automatic drive_pkt(ref avsts_pkg::avsts_item item);

endclass : avsts_driver

// UVM build_phase 
function void avsts_driver::build_phase(uvm_phase phase);
   super.build_phase(phase);

    if(!uvm_config_db #(virtual avsts_if#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)))::get(this, "", "avsts_if", avsts_vif))
      `uvm_fatal(get_type_name(), "AVSTS_DRIVER gets AVSTS_IF as NULL")

   if(!uvm_config_db #(avsts_config)::get(this, "", "avsts_config", m_config))
      `uvm_fatal(get_type_name(), "AVSTS_DRIVER config not found")
   if(m_config.c_is_active == UVM_ACTIVE) begin
         if(avsts_vif == null) begin
          `uvm_fatal(get_type_name(), "AVSTS_DRIVER Virtual interface is not set!") 
         end else begin
           `uvm_info(get_type_name(), $sformatf("vif received"), UVM_MEDIUM)
         end
   end

endfunction : build_phase

// Declaration of the UVM run_phase method.
task avsts_driver::run_phase(uvm_phase phase);
   super.run_phase(phase);

   if(m_config.c_is_active == UVM_ACTIVE) begin
      wait(avsts_vif.rst_n);
         forever begin
           seq_item_port.get_next_item(req); 
           m_item = new();
           $cast(m_item, req);
           avsts_vif.DriveData(req);
           for(int i=0; i<m_config.ipg; i++) begin
              @(posedge avsts_vif.clk);
              avsts_vif.avsts_tx_data  <=0 ;
              avsts_vif.avsts_tx_valid <=0 ;
              avsts_vif.avsts_tx_sop   <=0 ;
              avsts_vif.avsts_tx_eop   <=0 ;
              avsts_vif.avsts_tx_empty <=0 ;
           end
           `uvm_info(get_type_name(), $psprintf("AVSTS_DRIVER data driven on interface :\n%s",req.sprint()), UVM_DEBUG)
           $cast(req, m_item);
           seq_item_port.item_done();
         end
   end
endtask : run_phase
/*
task automatic avsts_driver::DriveData(ref avsts_pkg::avsts_item item);

   $cast(m_item, item);
   drive_pkt(m_item);
endtask : DriveData

task automatic avsts_driver::drive_pkt(ref avsts_pkg::avsts_item item);
 // Add the Driver interface logic based on your requirement
endtask : drive_pkt
*/
`endif
