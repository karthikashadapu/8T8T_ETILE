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

`ifndef TC_PRACH_LONG_FORMAT_C_PLANE_SV
`define TC_PRACH_LONG_FORMAT_C_PLANE_SV

  //--------------------------------------------------------------------
  // CLASS: simple test declaration
  //--------------------------------------------------------------------

  class tc_prach_long_format_c_plane extends o_ru_base_test;
     `uvm_component_utils( tc_prach_long_format_c_plane)

     function new (string name = "tc_prach_long_format_c_plane", uvm_component parent = null);
       super.new(name, parent);
     endfunction

     extern virtual function void build_phase(uvm_phase phase);
     extern virtual function void connect_phase(uvm_phase phase);
     extern virtual task run_phase(uvm_phase phase);
     o_ru_pcap_dl_sequence avsts_seq[];
  endclass

  function void tc_prach_long_format_c_plane::build_phase(uvm_phase phase);
     super.build_phase(phase);
     $display("Super Build  Done .....");
  endfunction

  function void tc_prach_long_format_c_plane::connect_phase(uvm_phase phase);
     super.connect_phase(.phase(phase));
  endfunction : connect_phase

  // Declaration of the UVM run_phase method.
  task tc_prach_long_format_c_plane::run_phase(uvm_phase phase);
     //Run Packet sequence
     int stop_val;
     avsts_seq = new[1];
     phase.raise_objection(this);
     `uvm_info(get_type_name(), "Simple Test called", UVM_LOW)

     m_o_ru_config.o_ru_cfg.prach_tc        = 1        ;   
     m_o_ru_config.o_ru_cfg.force_dut       = 1        ;   
     m_o_ru_config.init_config();
     m_o_ru_config.o_ru_cfg.frame_config    = 32'd2    ;
     m_o_ru_config.o_ru_cfg.ud_comp_width   = 8'h91    ;
     m_o_ru_config.o_ru_cfg.ul_input_config = 32'h40000;   
     m_o_ru_config.o_ru_cfg.prach_pat_en    = 1'd1     ;
     m_o_ru_config.o_ru_cfg.prach_pb_sel    = 1'd1     ;
     m_o_ru_config.o_ru_cfg.c_hps           = 1'd0     ;
     m_o_ru_config.o_ru_cfg.fs_offset       = 12       ;
     #5us;
     m_o_ru_config.reg_model.deploy_ecpri_source_lsb()        ;
     m_o_ru_config.reg_model.deploy_ecpri_source_msb()        ;
     m_o_ru_config.reg_model.deploy_ecpri_dest_lsb()          ;
     m_o_ru_config.reg_model.deploy_ecpri_dest_msb()          ;
     m_o_ru_config.reg_model.deploy_oran_func_mode()          ;
     m_o_ru_config.reg_model.deploy_oran_udcomp_hdr()         ;
     m_o_ru_config.reg_model.deploy_dl_eaxc_config_reg()      ;
     m_o_ru_config.reg_model.deploy_ul_eaxc_config_reg()      ;
     m_o_ru_config.reg_model.deploy_fh_compress()             ;
     m_o_ru_config.reg_model.deploy_decomp_fs_offset()        ; 
     m_o_ru_config.reg_model.deploy_comp_fs_offset()          ;
     m_o_ru_config.reg_model.deploy_arbiter_config()          ;
     m_o_ru_config.reg_model.deploy_arbiter_priority()        ;
     m_o_ru_config.reg_model.deploy_long_prach_filt_flush_en();
     m_o_ru_config.reg_model.deploy_c_hps()                   ;
     m_o_ru_config.reg_model.deploy_ul_input_config()         ;
     m_o_ru_config.reg_model.deploy_frame_config()            ;
     m_o_ru_config.reg_model.deploy_long_prach1_nco()         ;
     m_o_ru_config.reg_model.deploy_long_prach1_nco_1()       ;
     m_o_ru_config.reg_model.deploy_long_prach1_nco_2()       ;
     m_o_ru_config.reg_model.deploy_long_prach1_nco_3()       ;
     m_o_ru_config.reg_model.deploy_long_prach1_nco_offset()  ;
     m_o_ru_config.reg_model.deploy_long_prach1_gain_real()   ;
     `ifdef NUM_CC_TWO 
       m_o_ru_config.reg_model.deploy_long_prach2_nco()       ;
       m_o_ru_config.reg_model.deploy_long_prach2_nco_1()     ;
       m_o_ru_config.reg_model.deploy_long_prach2_nco_2()     ;
       m_o_ru_config.reg_model.deploy_long_prach2_nco_3()     ;
       m_o_ru_config.reg_model.deploy_long_prach2_nco_offset();
       m_o_ru_config.reg_model.deploy_long_prach2_gain_real() ;
     `endif
     m_o_ru_config.reg_model.deploy_prach_pat_en();
     m_o_ru_config.reg_model.delpoy_prach_pb_sel();
     `uvm_info(get_type_name(), "Register write done", UVM_LOW)
     #10us;
     foreach(avsts_seq[i])
        avsts_seq[i] = o_ru_pcap_dl_sequence::type_id::create($sformatf("avsts_seq_[%0d]",i));

     start_timer();
     avsts_seq[0].pcap_string = {`PCAP_PATH, "/tcs_01/tcs_01_100_9000_tc1_bfp9_fs_12.pcap"};
     #10us;
     avsts_seq[0].start(m_env.m_avsts_drv0_data_env.m_avsts_agent.m_sequencer); //TODO incase of multiple seq and env
     #50us;
     phase.drop_objection(this);

     //global_stop_request();
  endtask : run_phase

`endif

