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
`ifndef O_RU_AVSTS_AGENT_ENV_SV
`define O_RU_AVSTS_AGENT_ENV_SV
//------------------------------------------------------------------------------
// CLASS: o_ru_avsts_agent_env
//------------------------------------------------------------------------------
class o_ru_avsts_agent_env #(int DATA_WIDTH =64 ,int DRIVER =1, int SOP_EOP_DIS = 0) extends uvm_env;
  `uvm_component_param_utils(o_ru_avsts_agent_env#(DATA_WIDTH,DRIVER,SOP_EOP_DIS))

  // Environment ports
  uvm_analysis_port#(avsts_item) m_axp;
  uvm_analysis_port#(avsts_item) my_aap;
  uvm_tlm_analysis_fifo#(avsts_item) m_avsts;

  // Components of the environment
  avsts_pkg::avsts_config cfg;
  avsts_agent#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS))        m_avsts_agent;
  avsts_item pkt_item;

 // o_ru_item tmp;
    avsts_item tmp;


  // Constructor - Required UVM syntax
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // Class Functions or Tasks
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : o_ru_avsts_agent_env

// UVM build_phase
function void o_ru_avsts_agent_env::build_phase(uvm_phase phase);
  virtual avsts_if#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)) dut_if; //TODO data width
  super.build_phase(phase);

   if(!uvm_config_db #(avsts_config)::get(this,"","avsts_config",cfg)) begin
     `uvm_error(get_type_name(),"Get avsts Config fail")
   end
  if(!uvm_config_db #(virtual avsts_if#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)))::get(this, "", "avsts_if", dut_if))
    uvm_config_db#(virtual avsts_if#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS)))::set(this,"*","avsts_if",dut_if);
  else
     `uvm_info(get_type_name(),"avsts VIF SET",UVM_LOW)

  m_axp               = new("m_axp", this);
  my_aap              = new ("my_aap", this);
  m_avsts = new ("m_avsts", this);
  pkt_item = avsts_item::type_id::create("pkt_item",this);
  m_avsts_agent    = avsts_agent#(.DATA_WIDTH(DATA_WIDTH),.DRIVER(DRIVER),.SOP_EOP_DIS(SOP_EOP_DIS))::type_id::create("m_avsts_agent",this);

endfunction : build_phase

function void o_ru_avsts_agent_env::connect_phase(uvm_phase phase);
  super.connect_phase(.phase(phase));

  //Connect to extern port
  m_avsts_agent.m_aap.connect(my_aap);
  this.my_aap.connect(.provider(this.m_avsts.analysis_export));

endfunction : connect_phase

task o_ru_avsts_agent_env::run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
       m_avsts.get(pkt_item);
       $cast(tmp,pkt_item); 
       m_axp.write(tmp);
    end
endtask

`endif
