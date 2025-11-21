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

`ifndef TC_FFT_INJECTION_PRACH_WINDOW_ON_TIME_SV
`define TC_FFT_INJECTION_PRACH_WINDOW_ON_TIME_SV
    
  //------------------------------------------------------------------------------
  // CLASS: simple test declaration
  //--------------------------------------------------------------------

  class tc_fft_injection_prach_window_ontime extends o_ru_base_test;
    `uvm_component_utils( tc_fft_injection_prach_window_ontime)
  
    function new (string name = "tc_fft_injection_prach_window_ontime", uvm_component parent = null);
      super.new(name, parent);
    endfunction
    
  
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);
    o_ru_pcap_dl_sequence avsts_seq0[];
    o_ru_coupling_sequence avsts_seq1[];
    o_ru_prach_ul_inj_sequence avsts_seq2[];
  endclass
  
  function void tc_fft_injection_prach_window_ontime::build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("Super Build  Done .....");
  endfunction

 function void tc_fft_injection_prach_window_ontime::connect_phase(uvm_phase phase);
    super.connect_phase(.phase(phase));
  endfunction : connect_phase
  
  // Declaration of the UVM run_phase method.
  task tc_fft_injection_prach_window_ontime::run_phase(uvm_phase phase);
    //Run Packet sequence
    avsts_seq0 = new[1]; 
    avsts_seq1 = new[2]; 
    avsts_seq2 = new[2]; 
    phase.raise_objection(this);
    `uvm_info(get_type_name(), "Simple Test called", UVM_LOW)

    m_o_ru_config.init_config();
    m_o_ru_config.o_ru_cfg.ud_comp_width    = 8'h91      ;
    m_o_ru_config.o_ru_cfg.frame_config     = 32'd1      ;
    m_o_ru_config.o_ru_cfg.c_hps            = 1'd0       ;
    m_o_ru_config.o_ru_cfg.rx_window_enable = 32'd0      ;
    m_o_ru_config.o_ru_cfg.tx_window_enable = 32'd1      ;
    m_o_ru_config.o_ru_cfg.t3a_min_up       = 32'd0      ;    
    m_o_ru_config.o_ru_cfg.t3a_max_up       = 32'd150000 ;   
    m_o_ru_config.o_ru_cfg.ta3_min_cp       = 32'd0      ;    
    m_o_ru_config.o_ru_cfg.ta3_max_cp       = 32'd1000000;  
    m_o_ru_config.o_ru_cfg.fs_offset        = 12         ; 
    #5us;
    m_o_ru_config.deploy_write_registers();
    `uvm_info(get_type_name(), "Register write done", UVM_LOW)
    #10us;
 
    foreach(avsts_seq0[i])
     avsts_seq0[i] = o_ru_pcap_dl_sequence::type_id::create($sformatf("avsts_seq0_[%0d]",i));
    foreach(avsts_seq1[i])
     avsts_seq1[i] = o_ru_coupling_sequence::type_id::create($sformatf("avsts_seq1_[%0d]",i));
    foreach(avsts_seq2[i])
     avsts_seq2[i] = o_ru_prach_ul_inj_sequence::type_id::create($sformatf("avsts_seq2_[%0d]",i));

    start_timer();
    fork
      begin
         avsts_seq0[0].pcap_string = {`PCAP_PATH, "/tcs_01/tcs_01_100_9000_tc1_bfp9_fs_12.pcap"};
         avsts_seq0[0].start(m_env.m_avsts_drv0_data_env.m_avsts_agent.m_sequencer); //TODO incase of multiple seq and env
      end
      begin
         #200us;
         fork
          begin 
            avsts_seq2[0].seq_cnt = 0;
            avsts_seq2[0].lines   = 864;
            avsts_seq2[0].start(m_env.m_avsts_drv3_data_env.m_avsts_agent.m_sequencer); //TODO incase of multiple seq and env
          end
          `ifdef NUM_CC_TWO
             begin
               avsts_seq2[1].seq_cnt = 1;
               avsts_seq2[1].lines   = 864;
               avsts_seq2[1].start(m_env.m_avsts_drv4_data_env.m_avsts_agent.m_sequencer); //TODO incase of multiple seq and env
             end
          `endif
         join
      end
    join
    #20us;
    m_o_ru_config.reg_model.check_oran_registers()    ;
    phase.drop_objection(this);
  
    //global_stop_request();
  endtask : run_phase

`endif
