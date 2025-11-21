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

`ifndef O_RU_AVMM_AGENT_ENV_SV
`define O_RU_AVMM_AGENT_ENV_SV
  //------------------------------------------------------------------------------
  // CLASS: o_ru_avmm_agent_env
  //------------------------------------------------------------------------------
  class o_ru_avmm_agent_env #(int DRIVER=1) extends uvm_env;
    `uvm_component_param_utils(o_ru_avmm_agent_env#(DRIVER))
  
    // Environment ports
    uvm_analysis_port#(avmm_item) m_axp;

    uvm_analysis_port#(avmm_item) my_aap; 

    uvm_tlm_analysis_fifo#(avmm_item) m_avstmm;

    // Components of the environment
    avmm_pkg::avmm_config cfg;
    avmm_agent m_avstmm_agent;
    avmm_item pkt_item;

   // int_item tmp;
      avmm_item tmp;
     

    // Constructor - Required UVM syntax
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction : new
    
    // Class Functions or Tasks
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    
  endclass : o_ru_avmm_agent_env
  
  // UVM build_phase
  function void o_ru_avmm_agent_env::build_phase(uvm_phase phase);
    virtual avmm_if  dut_if;
    super.build_phase(phase);

     if(!uvm_config_db #(avmm_config)::get(this,"","avmm_config",cfg)) begin
       `uvm_error(get_type_name(),"Get INT AVMM Config fail")
     end
    if(!uvm_config_db #(virtual avmm_if)::get(this, "", "avmm_if", dut_if))
      uvm_config_db#(virtual avmm_if)::set(this,"*","avmm_if",dut_if);


    m_axp               = new("m_axp", this);
    my_aap              = new ("my_aap", this);
    m_avstmm = new ("m_avstmm", this);
    pkt_item = avmm_item::type_id::create("pkt_item",this);
    m_avstmm_agent    = avmm_agent::type_id::create("m_avstmm_agent",this);
        
  endfunction : build_phase  
  
  function void o_ru_avmm_agent_env::connect_phase(uvm_phase phase);
    super.connect_phase(.phase(phase));
  
    //Connect to extern port
    m_avstmm_agent.m_aap.connect(my_aap);
    this.my_aap.connect(.provider(this.m_avstmm.analysis_export));
   
  endfunction : connect_phase	

task o_ru_avmm_agent_env::run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
       m_avstmm.get(pkt_item);
       $cast(tmp,pkt_item); 
       m_axp.write(tmp);
    end
endtask

`endif
