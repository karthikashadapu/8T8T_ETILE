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

`ifndef AVMM_MONITOR_SV
`define AVMM_MONITOR_SV

  //------------------------------------------------------------------------------
  // CLASS: avmm_monitor
  //------------------------------------------------------------------------------
  class avmm_monitor extends uvm_monitor;
    `uvm_component_utils(avmm_monitor)
    
    uvm_analysis_port #(avmm_item) m_item_collected_port;
    
    protected virtual     avmm_if avstmm_vif;
    avmm_item              m_item;
    avmm_config            m_config;

   function new (string name, uvm_component parent);
      super.new(name, parent);
    endfunction : new
    
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
  
  endclass : avmm_monitor
  
  // UVM build_phase
  function void avmm_monitor::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(virtual avmm_if)::get(this, "", "avmm_if", avstmm_vif))
      `uvm_fatal(get_type_name(), "BCW AVMM Monitor gets AVSTMM IF as NULL")

    if(!uvm_config_db #(avmm_config)::get(this, "", "avmm_config", m_config))
      `uvm_fatal("BCW AVMM MONITOR", "bcw avmm config not found")

    if(m_config.c_type_id == -1) 
      `uvm_fatal("BCW AVMM MONITOR", "Type id not set")

    if(m_config.c_id == -1) 
      `uvm_fatal("BCW AVMM MONITOR", "Id not set")

      case(m_config.c_type_id)
        0 : begin
              if(avstmm_vif == null) begin
                `uvm_fatal("BCW AVMM Monitor", "Virtual interface is not set!") 
              end else begin
                `uvm_info("BCW AVMM Monitor", $sformatf("vif received"), UVM_MEDIUM)
              end
            end
        default : `uvm_fatal("BCW AVMM Monitor", "Type ID out of bounce")
      endcase

 
    m_item_collected_port = new(.name("m_item_collected_port"), .parent(this));   
  endfunction : build_phase  
  
  // UVM run_phase
  task avmm_monitor::run_phase(uvm_phase phase);
    super.run_phase(phase);
    m_item = avmm_item::type_id::create("m_item",this);

     case(m_config.c_type_id)
        0 : begin
              wait(avstmm_vif.rst_n);
              `uvm_info(get_type_name(), "BCW AVMM Detected Reset Done", UVM_LOW)
              forever begin
                m_item = new();
                avstmm_vif.MonitorData(m_item);
        	m_item_collected_port.write(m_item);
                `uvm_info(get_type_name(), $psprintf("BCW AVMM data Transfer collected :\n%s",m_item.sprint()), UVM_MEDIUM)
              end
            end
        default : `uvm_fatal("BCW AVMM Monitor", "Type ID out of bounce")
      endcase


  endtask : run_phase

`endif // AVMM_MONITOR_SV

