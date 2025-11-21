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

`ifndef TC_WRITE_READ_DFE_REGISTERS_sV
`define TC_WRITE_READ_DFE_REGISTERS_sV

  //--------------------------------------------------------------------
  // CLASS: simple test declaration
  //--------------------------------------------------------------------

  class tc_write_read_dfe_registers extends o_ru_base_test;
     `uvm_component_utils( tc_write_read_dfe_registers)

     function new (string name = "tc_write_read_dfe_registers", uvm_component parent = null);
       super.new(name, parent);
     endfunction

     extern virtual function void build_phase(uvm_phase phase);
     extern virtual function void connect_phase(uvm_phase phase);
     extern virtual task run_phase(uvm_phase phase);
  endclass

  function void tc_write_read_dfe_registers::build_phase(uvm_phase phase);
     super.build_phase(phase);
     $display("Super Build  Done .....");
  endfunction

  function void tc_write_read_dfe_registers::connect_phase(uvm_phase phase);
     super.connect_phase(.phase(phase));
  endfunction : connect_phase

// Declaration of the UVM run_phase method.
  task tc_write_read_dfe_registers::run_phase(uvm_phase phase);
     phase.raise_objection(this);
     `uvm_info(get_type_name(), "Simple Test called", UVM_LOW)

     m_o_ru_config.init_config();
     m_o_ru_config.o_ru_cfg.ud_comp_width = 8'h91 ;
     #5us;
     m_o_ru_config.deploy_write_registers()                 ;
     `ifndef SHORT_PRACH_FORMAT
        m_o_ru_config.reg_model.deploy_long_prach1_nco()       ;
        m_o_ru_config.reg_model.deploy_long_prach1_nco_1()     ;
        m_o_ru_config.reg_model.deploy_long_prach1_nco_2()     ;
        m_o_ru_config.reg_model.deploy_long_prach1_nco_3()     ;
        m_o_ru_config.reg_model.deploy_long_prach1_nco_offset();
        m_o_ru_config.reg_model.deploy_long_prach2_nco()       ;
        m_o_ru_config.reg_model.deploy_long_prach2_nco_1()     ;
        m_o_ru_config.reg_model.deploy_long_prach2_nco_2()     ;
        m_o_ru_config.reg_model.deploy_long_prach2_nco_3()     ;
        m_o_ru_config.reg_model.deploy_long_prach2_nco_offset();
     `else
        m_o_ru_config.reg_model.deploy_prach1_cfg_index()      ;
        m_o_ru_config.reg_model.deploy_prach1_cfg_time_index() ;
        m_o_ru_config.reg_model.deploy_n_prach1_slot()         ;
        m_o_ru_config.reg_model.deploy_active_prach1_slot()    ;
        m_o_ru_config.reg_model.deploy_prach1_freq_idx()       ;
        m_o_ru_config.reg_model.deploy_prach2_cfg_index()      ;
        m_o_ru_config.reg_model.deploy_prach2_cfg_time_index() ;
        m_o_ru_config.reg_model.deploy_n_prach2_slot()         ;
        m_o_ru_config.reg_model.deploy_active_prach2_slot()    ;
        m_o_ru_config.reg_model.deploy_prach2_freq_idx()       ;
     `endif
     `uvm_info(get_type_name(), "Register write done", UVM_LOW)
     #10us;
     start_timer();

     m_o_ru_config.reg_model.check_oran_ss_registers()        ;
     m_o_ru_config.reg_model.check_lowphy_ss_registers()      ;
     m_o_ru_config.reg_model.check_ifft_l1_registers()        ;
     m_o_ru_config.reg_model.check_ifft_l2_registers()        ;
     m_o_ru_config.reg_model.check_fft_l1_registers()         ;
     m_o_ru_config.reg_model.check_fft_l2_registers()         ;
     m_o_ru_config.reg_model.check_duc_l1_registers()         ;
     m_o_ru_config.reg_model.check_duc_l2_registers()         ;
     m_o_ru_config.reg_model.check_ca_interp_registers()      ; 
     m_o_ru_config.reg_model.check_dec_dly_comp_registers()   ; 
     m_o_ru_config.reg_model.check_ddc_l1_registers()         ;
     m_o_ru_config.reg_model.check_ddc_l2_registers()         ;
     `ifdef SHORT_PRACH_FORMAT
        m_o_ru_config.reg_model.check_short_prach_l1_registers() ;   
        m_o_ru_config.reg_model.check_short_prach_l2_registers() ; 
     `else
        m_o_ru_config.reg_model.check_long_prach_l1_registers()  ;
        m_o_ru_config.reg_model.check_long_prach_l2_registers()  ;
     `endif

     m_o_ru_config.reg_model.check_pwr_mtr_registers() ;
       
     #10us;
     phase.drop_objection(this);

  endtask : run_phase

`endif

