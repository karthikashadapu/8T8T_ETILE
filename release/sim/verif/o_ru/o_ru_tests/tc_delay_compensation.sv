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

`ifndef TC_DELAY_COMPENSATION_SV
`define TC_DELAY_COMPENSATION_SV

  //--------------------------------------------------------------------
  // CLASS: simple test declaration
  //--------------------------------------------------------------------

  class tc_delay_compensation extends o_ru_base_test;
     `uvm_component_utils( tc_delay_compensation)

     function new (string name = "tc_delay_compensation", uvm_component parent = null);
       super.new(name, parent);
     endfunction

     extern virtual function void build_phase(uvm_phase phase);
     extern virtual function void connect_phase(uvm_phase phase);
     extern virtual task run_phase(uvm_phase phase);
     o_ru_pcap_dl_sequence avsts_seq[];
  endclass

  function void tc_delay_compensation::build_phase(uvm_phase phase);
     super.build_phase(phase);
     $display("Super Build  Done .....");
  endfunction

  function void tc_delay_compensation::connect_phase(uvm_phase phase);
     super.connect_phase(.phase(phase));
  endfunction : connect_phase

  // Declaration of the UVM run_phase method.
  task tc_delay_compensation::run_phase(uvm_phase phase);
     //Run Packet sequence
     avsts_seq = new[1];
     phase.raise_objection(this);
     `uvm_info(get_type_name(), "Simple Test called", UVM_LOW)

     m_o_ru_config.init_config();
     m_o_ru_config.o_ru_cfg.delay_testing = 1'h1 ;
     m_o_ru_config.o_ru_cfg.duc_delay_comp_offset_ant1_1 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.duc_delay_comp_offset_ant2_1 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.duc_delay_comp_offset_ant3_1 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.duc_delay_comp_offset_ant4_1 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.duc_delay_comp_offset_ant1_2 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.duc_delay_comp_offset_ant2_2 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.duc_delay_comp_offset_ant3_2 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.duc_delay_comp_offset_ant4_2 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.ddc_delay_comp_offset_ant1_1 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.ddc_delay_comp_offset_ant2_1 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.ddc_delay_comp_offset_ant3_1 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.ddc_delay_comp_offset_ant4_1 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.ddc_delay_comp_offset_ant1_2 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.ddc_delay_comp_offset_ant2_2 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.ddc_delay_comp_offset_ant3_2 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.ddc_delay_comp_offset_ant4_2 = 8'h2 ;
     m_o_ru_config.o_ru_cfg.dl_input_config              = 32'h53050 ;
     m_o_ru_config.o_ru_cfg.ul_input_config              = 32'h70e30 ; 
     m_o_ru_config.o_ru_cfg.fs_offset                    = 0    ;
     #5us;
     m_o_ru_config.deploy_write_registers();
     `uvm_info(get_type_name(), "Register write done", UVM_LOW)
     #10us;

     foreach(avsts_seq[i])
        avsts_seq[i] = o_ru_pcap_dl_sequence::type_id::create($sformatf("avsts_seq_[%0d]",i));

        start_timer();
        avsts_seq[0].pcap_string = {`PCAP_PATH, "/tcs_05/tcs_05_100_9000_tc1_fs_0.pcap"};
        avsts_seq[0].pkt     = 2;
        avsts_seq[0].start(m_env.m_avsts_drv0_data_env.m_avsts_agent.m_sequencer); //TODO incase of multiple seq and env
        #150us;
     phase.drop_objection(this);

     //global_stop_request();
  endtask : run_phase

`endif

