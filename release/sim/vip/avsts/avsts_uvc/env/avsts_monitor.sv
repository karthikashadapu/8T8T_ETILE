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
`ifndef AVSTS_MONITOR_SV 
`define AVSTS_MONITOR_SV 
//------------------------------------------------------------------------------ 
// CLASS: avsts_monitor Declaration 
//------------------------------------------------------------------------------ 
class avsts_monitor#(int DATA_WIDTH =64 ,int DRIVER =0, int SOP_EOP_DIS = 0 ) extends uvm_monitor; 
`uvm_component_param_utils(avsts_monitor#(DATA_WIDTH,DRIVER,SOP_EOP_DIS)) 

protected virtual avsts_if #(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)) avsts_vif; 
uvm_analysis_port #(avsts_item)   m_item_collected_port;
avsts_config              m_config;
avsts_item                m_item;
bit                      m_is_covered;

 // new - constructor 
 function new (string name="avsts_monitor", uvm_component parent); 
    super.new(name, parent);
    m_is_covered  = 0;
 endfunction : new 

 // Additional class methods 
extern virtual function void build_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);
//extern task automatic MonitorData(ref avsts_pkg::avsts_item item);
//extern task automatic MonitorData_avsts_pkt(ref avsts_pkg::avsts_item item);

endclass : avsts_monitor

// UVM build_phase 
function void avsts_monitor::build_phase(uvm_phase phase);
   super.build_phase(phase);

    if(!uvm_config_db #(virtual avsts_if#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)))::get(this, "", "avsts_if", avsts_vif))
      `uvm_fatal(get_type_name(), "AVSTS_MONITOR gets AVSTS_IF as NULL")

   if(!uvm_config_db #(avsts_config)::get(this, "", "avsts_config", m_config))
      `uvm_fatal(get_type_name(), "AVSTS_MONITOR config not found")

         if(avsts_vif == null) begin
          `uvm_fatal("AVSTS_MONITOR"," Virtual interface is not set!") 
         end else begin
           `uvm_info("AVSTS_MONITOR", $sformatf("vif received"), UVM_MEDIUM)
         end
  m_item_collected_port = new(.name("m_item_collected_port"), .parent(this));

endfunction : build_phase

// Declaration of the UVM run_phase method.
task avsts_monitor::run_phase(uvm_phase phase);
   super.run_phase(phase);

        m_item = avsts_item::type_id::create("m_item",this);
    //m_coverage = new(m_item);

            wait(avsts_vif.rst_n);
             `uvm_info(get_type_name(), "AVSTS_MONITOR Detected Reset Done", UVM_LOW)
             forever begin
               m_item = new();
               avsts_vif.MonitorData(m_item);
       	       m_item_collected_port.write(m_item);
               `uvm_info(get_type_name(), $psprintf("AVSTS_MONITOR data Transfer collected :\n%s",m_item.sprint()), UVM_MEDIUM)
             end
  endtask : run_phase
/*
task automatic avsts_monitor::MonitorData(ref avsts_pkg::avsts_item item);

   $cast(m_item, item);
   MonitorData_avsts_pkt(m_item);
endtask : MonitorData

task automatic avsts_monitor::MonitorData_avsts_pkt(ref avsts_pkg::avsts_item item);
 // Add the Monitor interface logic based on your requirement
endtask : MonitorData_avsts_pkt
*/
`endif
