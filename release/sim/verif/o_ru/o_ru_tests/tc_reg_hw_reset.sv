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


// Testcase Description: Comparing the register read value with the expected value at reset
// ****************************************************************

`ifndef TC_REG_HW_RESET_SV
`define TC_REG_HW_RESET_SV

  //------------------------------------------------------------------------------
  // CLASS: simple test declaration
  //--------------------------------------------------------------------
  class tc_reg_hw_reset extends tc_reg_hw_reset_base ;
    `uvm_component_utils(tc_reg_hw_reset)
    function new (string name = "tc_reg_hw_reset", uvm_component parent=null);
      super.new(name, parent);
    endfunction
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
  endclass:tc_reg_hw_reset
  
  function void tc_reg_hw_reset::build_phase(uvm_phase phase);
    super.build_phase(phase);
     $display("Super Build  Done .....");
  endfunction
  
  function void tc_reg_hw_reset::connect_phase(uvm_phase phase);
    super.connect_phase(.phase(phase));

    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ecpri_ip_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("oran_ip_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("fh_comp_ip_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("coupling_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ifft1_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ifft2_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("fft1_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("fft2_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ca_interp_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("dec_dly_comp_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("duc_l1_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("duc_l2_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ddc_l1_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ddc_l2_version").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("csr_functional_mode").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ifft1_rc_lut_100").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ifft1_rc_lut_60").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ifft2_rc_lut_100").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("ifft2_rc_lut_60").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("fft1_rc_lut_100").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("fft1_rc_lut_60").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("fft2_rc_lut_100").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("fft2_rc_lut_60").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_hist_data").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_hist_data_1").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_hist_data_2").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_hist_data_3").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_thrsh_data").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_thrsh_data_1").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_thrsh_data_2").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_thrsh_data_3").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_stat_data").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_stat_data_1").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_stat_data_2").get_full_name(),""},"NO_REG_TESTS",1,this);
    uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("pwr_mtr_stat_data_3").get_full_name(),""},"NO_REG_TESTS",1,this);

    `ifndef SHORT_PRACH_FORMAT 
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_Prach1_cfg_index").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_Prach1_cfg_time_index").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("n_short_prach1_slot").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("active_short_prach1_slot").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_prach1_freq_idx").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_prach1_gain_real").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_prach1_gain_imag").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_Prach2_cfg_index").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_Prach2_cfg_time_index").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("n_short_prach2_slot").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("active_short_prach2_slot").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_prach2_freq_idx").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_prach2_gain_real").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("short_prach2_gain_imag").get_full_name(),""},"NO_REG_TESTS",1,this);
    `else
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach1_nco_ant1").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach1_nco_ant2").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach1_nco_ant3").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach1_nco_ant4").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach2_nco_ant1").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach2_nco_ant2").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach2_nco_ant3").get_full_name(),""},"NO_REG_TESTS",1,this);
       uvm_resource_db#(bit)::set({"REG::",ral_blk.get_reg_by_name("long_prach2_nco_ant4").get_full_name(),""},"NO_REG_TESTS",1,this);
    `endif

  endfunction : connect_phase	

  task tc_reg_hw_reset::run_phase(uvm_phase phase);
    uvm_reg regs[$];
    phase.raise_objection(this);
    #20us;
    run_hw_reset_reg(ral_blk);
    phase.drop_objection(this);
  endtask : run_phase

`endif

