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
`ifndef O_RU_SCB_SV 
`define O_RU_SCB_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_scb
//------------------------------------------------------------------------------ 


class o_ru_scb extends uvm_scoreboard; 
`uvm_component_utils(o_ru_scb) 

    uvm_analysis_export #(avsts_item) m_axp_drv_port[];
    uvm_analysis_export #(avsts_item) m_axp_mon_port[];

    o_ru_config_pkg::o_ru_config         m_o_ru_config;
    o_ru_ref                           m_ref;
    o_ru_cmp                           m_cmp;
    int                              m_data_if_max_cnt;

   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 
   function new (string name, uvm_component parent); 
      super.new(name, parent);
      this.m_data_if_max_cnt = 0;
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);

endclass: o_ru_scb
   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 
  function void o_ru_scb::build_phase(uvm_phase phase);
     super.build_phase(phase);

   //
   // Get global config
   //
   if(!uvm_config_db #(o_ru_config)::get(this, "", "o_ru_config", m_o_ru_config)) begin
     `uvm_error(get_type_name(), " o_ru_ config not found")
   end else begin
     `uvm_info(get_type_name(), $psprintf(" o_ru_ Config received"), UVM_LOW)
   end

     foreach(o_ru_config_pkg::c_avsts_drv_data_cnt[index]) begin
        m_data_if_max_cnt += c_avsts_drv_data_cnt[index];
     end 

    //Check that the driver and monitor interface count matches
    foreach( o_ru_config_pkg::c_drv_data_cnt[index]) begin
       if(o_ru_config_pkg::c_drv_data_cnt[index] != o_ru_config_pkg::c_mon_data_cnt[index]) begin
          `uvm_fatal("SCB", "Count of drivers and monitors does not match....")
        end
     end

    //
    // Create driver analysis ports
    //
    m_axp_drv_port = new[m_data_if_max_cnt];
    for(int i=0; i<m_data_if_max_cnt; i++) begin
      m_axp_drv_port[i] = new(.name($sformatf("m_axp_drv_port[%0d]",i)), .parent(this));  
    end

     m_data_if_max_cnt = 0 ;
     foreach(o_ru_config_pkg::c_avsts_mon_data_cnt[index]) begin
        m_data_if_max_cnt += c_avsts_mon_data_cnt[index];
     end 
    //
    // Create monitor analysis ports
    //
    m_axp_mon_port = new[m_data_if_max_cnt];
    for(int i=0; i<m_data_if_max_cnt; i++) begin
      m_axp_mon_port[i] = new(.name($sformatf("m_axp_mon_port[%0d]",i)), .parent(this));  
    end

    // Create Reference Model 
    //
    m_ref             = o_ru_ref::type_id::create(.name("m_ref"), .parent(this));

    //
    // Create Compare Model 
    //
    m_cmp             = o_ru_cmp::type_id::create(.name("m_cmp"), .parent(this));
	
  endfunction : build_phase  
  
   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_scb::connect_phase(uvm_phase phase);
    super.connect_phase(.phase(phase));

    //
    // Connect driver ports to reference model 
    //
    for(int i=0; i<6; i++) begin
      m_axp_drv_port[i].connect(m_ref.m_input[i]);
    end
    for(int i=0; i<m_data_if_max_cnt; i++) begin
      m_axp_mon_port[i].connect(m_cmp.m_input_dut[i]);
      m_ref.m_output[i].connect(m_cmp.m_input_ref[i]);
    end   


  endfunction: connect_phase


`endif 
