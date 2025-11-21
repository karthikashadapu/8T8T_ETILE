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

`ifndef AVMM_DRIVER_SV
`define AVMM_DRIVER_SV
  //------------------------------------------------------------------------------
  // CLASS: avmm_driver declaration
  //------------------------------------------------------------------------------
  class avmm_driver extends uvm_driver #(avmm_item);
    `uvm_component_utils(avmm_driver)
  
    virtual avmm_if avstmm_vif;
    avmm_config              m_config;
    avmm_item                m_item;

    function new (string name = "avmm_driver", uvm_component parent);
      super.new(name, parent);
    endfunction : new
    
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
  
  endclass : avmm_driver
  
  //Declare the build_phase method
  function void avmm_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db #(virtual avmm_if)::get(this, "", "avmm_if", avstmm_vif))
      `uvm_fatal(get_type_name(), "AVMM Driver gets AVSTMM IF as NULL")

    if(!uvm_config_db #(avmm_config)::get(this, "", "avmm_config", m_config))
      `uvm_fatal(get_type_name(), "bcw avmm config not found")

    if(m_config.c_type_id == -1) 
      `uvm_fatal("AVMM DRIVER", "Type id not set")

    if(m_config.c_id == -1) 
      `uvm_fatal("AVMM DRIVER", "Id not set")

    if(m_config.c_is_active == UVM_ACTIVE) begin
      case(m_config.c_type_id)
        0 : begin
              if(avstmm_vif == null) begin
                `uvm_fatal(get_type_name(), "Virtual interface is not set!") 
              end else begin
                `uvm_info(get_type_name(), $sformatf("vif received"), UVM_MEDIUM)
              end
            end
        default : `uvm_fatal("AVMM Driver", "Type ID out of bounce")
      endcase 
    end
 
  endfunction : build_phase


  // Declaration of the UVM run_phase method.
  task avmm_driver::run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info(get_type_name(), $sformatf("Entered into driver code"), UVM_HIGH)
    if(m_config.c_is_active == UVM_ACTIVE) begin
      case(m_config.c_type_id)
        0 : begin
              if(m_config.c_is_tx == 1) begin
                wait(avstmm_vif.rst_n);
                forever begin
                `uvm_info(get_type_name(), $sformatf("Entered into forever loop"), UVM_HIGH)
                  seq_item_port.get_next_item(req);  
                  `uvm_info(get_type_name(), $sformatf("Item :\n%s",req.sprint()), UVM_HIGH)
                  m_item = new();
                  $cast(m_item, req);
                  avstmm_vif.DriveData(m_item);
                  $cast(req, m_item);
                  seq_item_port.item_done();  
                  `uvm_info(get_type_name(), $sformatf("Entered into end of forever loop"), UVM_HIGH)
                end	  
              end 
            end
        default : `uvm_fatal("AVMM Driver", "Type ID out of bounce")
      endcase
 
    end
  endtask : run_phase

`endif 

