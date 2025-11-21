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
`ifndef AVSTS_AGENT_SV 
`define AVSTS_AGENT_SV 
//------------------------------------------------------------------------------ 
// CLASS: interface_name_agent 
//------------------------------------------------------------------------------ 
class avsts_agent#(int DATA_WIDTH =64 ,int DRIVER =1, int SOP_EOP_DIS = 0 ) extends uvm_agent; 
`uvm_component_param_utils(avsts_agent#(DATA_WIDTH,DRIVER,SOP_EOP_DIS)) 

uvm_analysis_port#(avsts_item) m_aap; 

avsts_config                    m_config; 
avsts_monitor#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)) m_monitor; 
avsts_sequencer                 m_sequencer;     
avsts_driver#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS))	                 m_driver; 

 // new - constructor 
 function new (string name, uvm_component parent); 
    super.new(name, parent);
 endfunction : new 

 // Additional class methods 
 extern virtual function void build_phase(uvm_phase phase); 
 extern virtual function void connect_phase(uvm_phase phase); 

endclass : avsts_agent

// UVM build_phase 
function void avsts_agent::build_phase(uvm_phase phase);
   virtual avsts_if#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)) avsts_vif;
   super.build_phase(phase);

   if(!uvm_config_db #(virtual avsts_if#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)))::get(this, "", "avsts_if",avsts_vif))
       uvm_config_db#(virtual avsts_if#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)))::set(this,"*","avsts_if",avsts_vif);

   if(!uvm_config_db #(avsts_config)::get(this, "", "avsts_config",m_config))
      `uvm_error(get_type_name(), "avsts config not found")

   m_aap   = new("m_aap", this); //used to connect to the ref model 
   m_monitor = avsts_monitor#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS))::type_id::create("m_monitor", this);

   if(m_config.c_is_active == UVM_ACTIVE) begin
      m_sequencer = avsts_sequencer::type_id::create("m_sequencer",this);
      m_driver    = avsts_driver#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS))::type_id::create("m_driver",this);
   end
endfunction : build_phase

// UVM connect_phase
function void avsts_agent::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   if (m_config.c_is_active == UVM_ACTIVE) begin
       m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
   end
   m_monitor.m_item_collected_port.connect(m_aap);
endfunction : connect_phase

`endif
