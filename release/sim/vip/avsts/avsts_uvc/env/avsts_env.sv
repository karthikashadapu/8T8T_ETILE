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
`ifndef AVSTS_ENV_SV 
`define AVSTS_ENV_SV 
//------------------------------------------------------------------------------ 
// CLASS: avsts_env 
//------------------------------------------------------------------------------ 
class avsts_env#(int DRIVER=1) extends uvm_env; 
`uvm_component_param_utils(avsts_env#(DRIVER)) 

uvm_analysis_port#(avsts_item) m_axp; 

avsts_config                    m_config; 
avsts_agent	                 m_agent; 

 // new - constructor 
 function new (string name, uvm_component parent); 
    super.new(name, parent);
 endfunction : new 

 // Additional class methods 
 extern virtual function void build_phase(uvm_phase phase); 
 extern virtual function void connect_phase(uvm_phase phase); 

endclass : avsts_env

// UVM build_phase 
function void avsts_env::build_phase(uvm_phase phase);
   virtual avsts_if#(.DRIVER(DRIVER)) avsts_vif;
   super.build_phase(phase);

   if(!uvm_config_db #(virtual avsts_if#(.DRIVER(DRIVER)))::get(this, "", "avsts_if",avsts_vif))
       uvm_config_db#(virtual avsts_if#(.DRIVER(DRIVER)))::set(this,"*","avsts_if",avsts_vif);

   if(!uvm_config_db #(avsts_config)::get(this, "", "avsts_config",m_config))
      `uvm_error(get_type_name(), "avsts config not found")

   m_axp   = new("m_axp", this);
   m_agent = avsts_agent#(.DRIVER(DRIVER))::type_id::create("m_agent", this);

  // if (m_config.c_coverage_enable)
   //   m_coverage = avsts_coverage::type_id::create("m_coverage",this);
endfunction : build_phase

// UVM connect_phase
function void avsts_env::connect_phase(uvm_phase phase);
   super.connect_phase(phase);

//if (m_config.c_coverage_enable)
//    m_agent.m_aap.connect(m_coverage.analysis_export);

//Connect to extern port
   m_agent.m_aap.connect(m_axp);
endfunction : connect_phase

`endif
