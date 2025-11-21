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
`ifndef O_RU_BASE_REF_SV 
`define O_RU_BASE_REF_SV 
//------------------------------------------------------------------------------ 
// CLASS: o_ru_base_ref
//------------------------------------------------------------------------------ 


`include "../o_ru_tb_files/o_ru_defines.sv"
import "DPI-C" context function void compression(inout trans_struct struct_1, shortint fPRB[6552],byte unsigned cPRB[9500]);
import "DPI-C" context function int phase_compensation(int data_param_arr[2], byte unsigned phase_comp_in[13104],output byte unsigned phase_comp_out[13104]);
import "DPI-C" context function int ifft(int data_param_arr[5], byte unsigned ifft_in[13104],output byte unsigned ifft_out[16384]);
import "DPI-C" context function int fft(int data_param_arr[5], byte unsigned fft_in[16384],output byte unsigned fft_out[13104]);
import "DPI-C" context function int phase_compensation_fft(int data_param_arr[2], byte unsigned phase_comp_in[13104],output byte unsigned phase_comp_out[13104]);
class o_ru_base_ref extends uvm_component; 
`uvm_component_utils(o_ru_base_ref) 

  uvm_analysis_export #(avsts_item) m_input[]; 
  uvm_analysis_port #(avsts_item) m_output[];    

  uvm_tlm_analysis_fifo #(avsts_item) m_fifo[];    

  o_ru_config_pkg::o_ru_config m_o_ru_config;
  o_ru_config_pkg::o_ru_ip_config m_config;

  o_ru_tbstruct::trans_struct struct_1  ;
  int data_param_arr_ifft[5];
  int data_param_arr_phase_comp[2];

  int m_data_if_max_cnt;
  int m_mon_data_if_max_cnt;

   //------------------------------------------------------------------------------ 
   // Constructor 
   //------------------------------------------------------------------------------ 

   function new (string name, uvm_component parent); 
      super.new(name, parent);
      this.m_data_if_max_cnt = 0;
   endfunction : new 

extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);
extern virtual task file_read(ref int file,ref longint size,ref longint lines_to_read,ref byte unsigned buf8[]); 

endclass: o_ru_base_ref

   //------------------------------------------------------------------------------ 
   // BUILD Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_base_ref::build_phase(uvm_phase phase);
     super.build_phase(phase);
     `uvm_info(get_type_name(), "Build phase called", UVM_FULL)

   if(!uvm_config_db #(o_ru_config)::get(this, "","o_ru_config",m_o_ru_config)) begin 
      `uvm_error(get_type_name(), "o_ru_config not found")
   end else begin 
      `uvm_info(get_type_name(), $psprintf(" o_ru_Config received"),UVM_LOW)
   end 
   m_config = m_o_ru_config.o_ru_cfg;

     foreach(o_ru_config_pkg::c_avsts_drv_data_cnt[index]) begin
        m_data_if_max_cnt += c_avsts_drv_data_cnt[index];
     end 

//
// check drv and mon count must match
//
    foreach( o_ru_config_pkg::c_drv_data_cnt[index]) begin
       if(o_ru_config_pkg::c_drv_data_cnt[index] != o_ru_config_pkg::c_mon_data_cnt[index]) begin
          `uvm_fatal("SCB", "Count of drivers and monitors does not match....")
        end
     end

    //
    // Create input data ports and related TLM fifoes 
    //
  m_input   = new [m_data_if_max_cnt];
  m_fifo    = new [m_data_if_max_cnt];
  for(int i=0; i<m_data_if_max_cnt; i++) begin
    m_input[i]  = new(.name($sformatf("m_input_port[%0d]",i)), .parent(this));  
    m_fifo[i]   = new(.name($sformatf("m_fifo[%0d]",i)),  .parent(this));
  end

//
// Create input output ports.
//
  foreach(o_ru_config_pkg::c_avsts_mon_data_cnt[index]) begin
     m_mon_data_if_max_cnt += c_avsts_mon_data_cnt[index];
  end 

  m_output     = new [m_mon_data_if_max_cnt];
  for(int i=0; i<m_mon_data_if_max_cnt; i++) begin
    m_output[i]  = new(.name($sformatf("m_output_port[%0d]",i)), .parent(this));  
     end

  endfunction: build_phase

   //------------------------------------------------------------------------------ 
   // CONNECT Phase 
   //------------------------------------------------------------------------------ 

  function void o_ru_base_ref::connect_phase(uvm_phase phase);
  //
  // Connect input ports to fifo
  //
  `uvm_info(get_type_name(), "Connect phase called", UVM_FULL)

  for(int i=0; i<m_data_if_max_cnt; i++) begin
    this.m_input[i].connect(.provider(this.m_fifo[i].analysis_export)); 
  end

  endfunction: connect_phase

   //------------------------------------------------------------------------------ 
   // RUN Phase 
   //------------------------------------------------------------------------------ 

  task o_ru_base_ref::run_phase(uvm_phase phase);
  `uvm_info("Base Ref called", $psprintf("Extend ref will run"), UVM_LOW)
endtask : run_phase

 task o_ru_base_ref::file_read(ref int file,ref longint size,ref longint lines_to_read,ref byte unsigned buf8[]);
   int temp1[];
   temp1 = new[lines_to_read];
   for(int i=0;i < lines_to_read ;i++) begin
       $fscanf(file,"%h",temp1[i]);
   end
   {>>{buf8}} = temp1;
 endtask

`endif 
