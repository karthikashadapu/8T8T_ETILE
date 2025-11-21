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

`ifndef O_RU_BASE_CMP_SV 
`define O_RU_BASE_CMP_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_base_cmp
//------------------------------------------------------------------------------ 


class o_ru_base_cmp extends uvm_component; 
`uvm_component_utils(o_ru_base_cmp) 

  uvm_analysis_export #(avsts_item) m_input_ref[]; 
  uvm_analysis_export #(avsts_item) m_input_dut[];    

  o_ru_config_pkg::o_ru_config m_o_ru_config;

  int m_data_if_max_cnt;
  bit m_test_pass;
  int vect_cnt;
  int pass_cnt;
  int error_cnt;

  uvm_tlm_analysis_fifo #(avsts_item) m_fifo_ref[];
  uvm_tlm_analysis_fifo #(avsts_item) m_fifo_dut[];

   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 

   function new (string name, uvm_component parent); 
      super.new(name, parent);
      this.m_test_pass       = 0;
      this.vect_cnt          = 0;
      this.pass_cnt          = 0;
      this.error_cnt         = 0;
      this.m_data_if_max_cnt = 0;
   endfunction : new 
extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual function void report_phase(uvm_phase phase);

endclass: o_ru_base_cmp

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_base_cmp::build_phase(uvm_phase phase);
     super.build_phase(phase);
  `uvm_info(get_type_name(), "Build phase called", UVM_FULL)

     if(!uvm_config_db #(o_ru_config)::get(this, "","o_ru_config",m_o_ru_config)) begin 
        `uvm_error(get_type_name(), "o_ru_config not found")
     end else begin 
        `uvm_info(get_type_name(), $psprintf(" o_ru_Config received"),UVM_LOW)
     end 

//
// check drv and mon count must match
//
    foreach( o_ru_config_pkg::c_drv_data_cnt[index]) begin
       if(o_ru_config_pkg::c_drv_data_cnt[index] != o_ru_config_pkg::c_mon_data_cnt[index]) begin
          `uvm_fatal("SCB", "Count of drivers and monitors does not match....")
       end
    end

    foreach(o_ru_config_pkg::c_avsts_mon_data_cnt[index]) begin
       m_data_if_max_cnt += c_avsts_mon_data_cnt[index];
    end 


  m_input_ref   = new [m_data_if_max_cnt];
  m_fifo_ref    = new [m_data_if_max_cnt];
  for(int i=0; i<m_data_if_max_cnt; i++) begin
     m_input_ref[i]  = new(.name($sformatf("m_input_ref[%0d]",i)), .parent(this));  
     m_fifo_ref[i]   = new(.name($sformatf("m_fifo_ref[%0d]",i)),  .parent(this));
  end


  m_input_dut    = new [m_data_if_max_cnt];
  m_fifo_dut     = new [m_data_if_max_cnt];
  for(int i=0; i<m_data_if_max_cnt; i++) begin
     m_input_dut[i]  = new(.name($sformatf("m_input_dut[%0d]",i)), .parent(this));  
     m_fifo_dut[i]   = new(.name($sformatf("m_fifo_dut[%0d]",i)),  .parent(this));
  end

  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_base_cmp::connect_phase(uvm_phase phase);
  //
  // Connect input ports to fifo
  //
  `uvm_info(get_type_name(), "Connect phase called", UVM_FULL)

  for(int i=0; i<m_data_if_max_cnt; i++) begin
     this.m_input_ref[i].connect(.provider(this.m_fifo_ref[i].analysis_export)); 
  end

  for(int i=0; i<m_data_if_max_cnt; i++) begin
     this.m_input_dut[i].connect(.provider(this.m_fifo_dut[i].analysis_export)); 
  end

  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // REPORT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_base_cmp::report_phase(uvm_phase phase);
  bit failed = 0;
  super.report_phase(phase);
  `uvm_info(get_type_name(), "Report phase called", UVM_FULL)

  // Check size of drv fifo's
  foreach(m_fifo_ref[i]) begin
     if(!m_fifo_ref[i].is_empty()) begin
        `uvm_error("Scorboard: ", "m_fifo_ref not empty")
        failed = failed | 1;
     end
  end

  foreach(m_fifo_dut[i]) begin
     if(!m_fifo_dut[i].is_empty()) begin
        `uvm_error("Scorboard: ", "m_fifo_dut not empty")
        failed = failed | 1;
     end
  end
 
  // Check error cnt 
  if(this.error_cnt != 0) begin
     `uvm_error("Scorboard: ", "error_cnt greater than 0")
     failed = failed | 1;
  end

  if((this.pass_cnt == 0) || (this.vect_cnt == 0)) begin
     `uvm_info("Scorboard: ", $psprintf("No packets compared ref pkts:%d, dut pkts:%d ",m_fifo_ref.size(), m_fifo_dut.size()), UVM_LOW) 
  end
  
  this.m_test_pass = !failed;
endfunction : report_phase


`endif 
