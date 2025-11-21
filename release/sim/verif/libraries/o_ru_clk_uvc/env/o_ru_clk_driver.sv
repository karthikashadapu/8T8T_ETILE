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
`ifndef O_RU_CLK_DRIVER_SV
`define O_RU_CLK_DRIVER_SV

  //------------------------------------------------------------------------------
  // CLASS: o_ru_clk_driver declaration
  //------------------------------------------------------------------------------
  class o_ru_clk_driver extends uvm_driver;
    `uvm_component_utils(o_ru_clk_driver)

    virtual o_ru_clk_if vif;
    o_ru_config_pkg::o_ru_config m_o_ru_config;
    o_ru_clk_config m_config;

    function new (string name = "o_ru_clk_driver", uvm_component parent);
      super.new(name, parent);
    endfunction : new
    
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
//    extern virtual protected task reset();
//    extern virtual protected task drive_o_ru_clk ();

  endclass : o_ru_clk_driver

  //Declare the build_phase method
  function void o_ru_clk_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(o_ru_config)::get(this, "", "o_ru_config", m_o_ru_config)) begin
      `uvm_error(get_type_name(), "BCW config not found")
    end else begin
      `uvm_info(get_type_name(), $sformatf("BCW Config received"), UVM_LOW)
    end

    if(!uvm_config_db #(o_ru_clk_config)::get(this, "", "o_ru_clk_config", m_config)) begin
      `uvm_error(get_type_name(), "o_ru_clk config not found")
    end else begin
      `uvm_info(get_type_name(), $sformatf("Clk Config received"), UVM_LOW)
    end

    if(m_config.c_id == -1) begin
      `uvm_fatal(get_type_name(), "o_ru_clk id not set!") 
    end

    if(m_o_ru_config.o_ru_clk_vif[m_config.c_id] == null) begin
      `uvm_fatal(get_type_name(), "o_ru_clk virtual interface is not set!") 
    end else begin
      `uvm_info(get_type_name(), $sformatf("vif received"), UVM_MEDIUM)
    end

  endfunction : build_phase

   //Declare the build_phase method
  function void o_ru_clk_driver::connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    //
    // Connect config
    //
    m_o_ru_config.o_ru_clk_vif[m_config.c_id].c_reset_off = m_config.c_reset_off;
  endfunction : connect_phase

  // Declaration of the UVM run_phase method.
  task o_ru_clk_driver::run_phase(uvm_phase phase);
    super.run_phase(phase);

//     fork 
//       drive_o_ru_clk();
//     join_none
//
//     forever begin
//       wait(this.m_config.is_reset == UVM_ACTIVE);
//       reset();
//       this.m_config.is_reset = UVM_PASSIVE;
//     end
  endtask : run_phase

//  // Drive all signals to reset state 
//  task o_ru_clk_driver::reset();
//    // o_ru_clk_driver tag required for Debug Lab
//    `uvm_info(get_type_name(), $psprintf("Reset called"), UVM_MEDIUM)
//    if(m_config.reset_active_low) begin
//      vif.master.rst <= 1'b0;
//    end else begin
//      vif.master.rst <= 1'b1;
//    end
//    #m_config.reset_off;
//    vif.master.rst <= ~vif.master.rst;
//  endtask : reset
//
//  // Drive the data phase of the item
//  task o_ru_clk_driver::drive_o_ru_clk ();
//    `uvm_info(get_type_name(), $psprintf("drive_o_ru_clk: Drive Clk"), UVM_MEDIUM)
//    forever begin
//      #(m_config.time_period / 2);
//      vif.master.o_ru_clk <= ~vif.master.o_ru_clk;
//    end
//  endtask : drive_o_ru_clk
`endif // CLK_DRIVER_SV
