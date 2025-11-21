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

`ifndef TC_EAXC_BLANKING_CASE_1_COMPRESSION_CC2_DIS_SV
`define TC_EAXC_BLANKING_CASE_1_COMPRESSION_CC2_DIS_SV

  //--------------------------------------------------------------------
  // CLASS: simple test declaration
  //--------------------------------------------------------------------

  class tc_eaxc_blanking_case_1_compression_cc2_dis extends o_ru_base_test;
     `uvm_component_utils( tc_eaxc_blanking_case_1_compression_cc2_dis)

     function new (string name = "tc_eaxc_blanking_case_1_compression_cc2_dis", uvm_component parent = null);
       super.new(name, parent);
     endfunction

     extern virtual function void build_phase(uvm_phase phase);
     extern virtual function void connect_phase(uvm_phase phase);
     extern virtual task run_phase(uvm_phase phase);
     o_ru_pcap_dl_sequence avsts_seq[];
     o_ru_coupling_sequence avsts_seq1[];
     o_ru_prach_ul_inj_sequence avsts_seq2[];
  endclass

  function void tc_eaxc_blanking_case_1_compression_cc2_dis::build_phase(uvm_phase phase);
     super.build_phase(phase);
     $display("Super Build  Done .....");
  endfunction

  function void tc_eaxc_blanking_case_1_compression_cc2_dis::connect_phase(uvm_phase phase);
     super.connect_phase(.phase(phase));
  endfunction : connect_phase

  // Declaration of the UVM run_phase method.
  task tc_eaxc_blanking_case_1_compression_cc2_dis::run_phase(uvm_phase phase);
     //Run Packet sequence
    avsts_seq  = new[1];
    avsts_seq1 = new[1]; 
    avsts_seq2 = new[1]; 
    phase.raise_objection(this);
    `uvm_info(get_type_name(), "Simple Test called", UVM_LOW)
    
    m_o_ru_config.init_config();
    m_o_ru_config.o_ru_cfg.ud_comp_width = 8'h91    ;
    m_o_ru_config.o_ru_cfg.frame_config  = 32'd1    ;
    m_o_ru_config.o_ru_cfg.c_hps         = 1'd0     ;
    m_o_ru_config.o_ru_cfg.cc2_dis       = 1'b1     ;
    m_o_ru_config.o_ru_cfg.dl_mac_axc[0] = 16'h1004 ;
    m_o_ru_config.o_ru_cfg.dl_mac_axc[2] = 16'h1264 ;
    m_o_ru_config.o_ru_cfg.dl_mac_axc[4] = 16'h2547 ;
    m_o_ru_config.o_ru_cfg.dl_mac_axc[6] = 16'h0567 ;
    m_o_ru_config.o_ru_cfg.ul_mac_axc[0] = 16'h0132 ;
    m_o_ru_config.o_ru_cfg.ul_mac_axc[2] = 16'h0165 ;
    m_o_ru_config.o_ru_cfg.ul_mac_axc[4] = 16'h1640 ;
    m_o_ru_config.o_ru_cfg.ul_mac_axc[6] = 16'h0231 ;
    m_o_ru_config.o_ru_cfg.ul_mac_axc[8] = 16'h0060 ;
    m_o_ru_config.o_ru_cfg.ul_mac_axc[10]= 16'h0045 ;
    m_o_ru_config.o_ru_cfg.ul_mac_axc[12]= 16'h0090 ;
    m_o_ru_config.o_ru_cfg.ul_mac_axc[14]= 16'h0053 ;
    m_o_ru_config.o_ru_cfg.fs_offset     = 6        ;
    #5us;
    m_o_ru_config.deploy_write_registers();
    `uvm_info(get_type_name(), "Register write done", UVM_LOW)
    #10us;

    foreach(avsts_seq[i])
     avsts_seq[i] = o_ru_pcap_dl_sequence::type_id::create($sformatf("avsts_seq_[%0d]",i));
    foreach(avsts_seq1[i])
     avsts_seq1[i] = o_ru_coupling_sequence::type_id::create($sformatf("avsts_seq1_[%0d]",i));
    foreach(avsts_seq2[i])
     avsts_seq2[i] = o_ru_prach_ul_inj_sequence::type_id::create($sformatf("avsts_seq2_[%0d]",i));

    start_timer();
    fork
      begin
         avsts_seq[0].pcap_string = {`PCAP_PATH, "/tcs_11/tcs_11_100_9000_tc1_bfp9_eaxc_cfg_21_fs_6.pcap"};
         avsts_seq[0].no_axc = 4 ;
         avsts_seq[0].start(m_env.m_avsts_drv0_data_env.m_avsts_agent.m_sequencer); //TODO incase of multiple seq and env
      end
      begin
         #180us;
         fork
          begin
            avsts_seq1[0].seq_cnt = 0;
            avsts_seq1[0].lines   = 3276;
            avsts_seq1[0].start(m_env.m_avsts_drv1_data_env.m_avsts_agent.m_sequencer); //TODO incase of multiple seq and env
          end
         join
      end
      begin
         #180us;
         fork
          begin
            avsts_seq2[0].seq_cnt = 0;
            avsts_seq2[0].lines   = 864;
            avsts_seq2[0].condition = 2;
            avsts_seq2[0].start(m_env.m_avsts_drv3_data_env.m_avsts_agent.m_sequencer); //TODO incase of multiple seq and env
          end
         join
      end
    join
    #150us;
    phase.drop_objection(this);

    //global_stop_request();
  endtask : run_phase

`endif

