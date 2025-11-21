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

`ifndef O_RU_BASE_TEST_SV 
`define O_RU_BASE_TEST_SV 

//------------------------------------------------------------------------------ 
// CLASS: o_ru_base_test 
//------------------------------------------------------------------------------ 

import "DPI-C" context function void readPcap(output longint tim,output byte unsigned buf_packet_out[9500],int len);
import "DPI-C" context function void pcap_init_file(string file);
`include "../o_ru_tb_files/o_ru_defines.sv" 

class o_ru_base_test extends uvm_test; 
`uvm_component_utils(o_ru_base_test) 

   // Environment component 
   o_ru_top_env      m_env; 
   //  Configuration components 
   o_ru_config_pkg::o_ru_config   m_o_ru_config; 
   o_ru_clk_pkg::o_ru_clk_config  m_clk_config[]; 
   avsts_pkg::avsts_config    m_avsts_drv_data_config[]; 
   avsts_pkg::avsts_config    m_avsts_mon_data_config[]; 
   avmm_pkg::avmm_config      m_avstmm_config[];
  
   o_ru_config_pkg::o_ru_reg_adapter_avmm   reg_adapter ; 
   Top_Subsystem_mmap_urm               ral_blk     ;             
   uvm_reg regs[$];
   uvm_reg_map maps[$];
   uvm_table_printer printer; 
   bit  m_test_pass; 
   bit  exp_o_ru_empty; 
   time delay_end_time; 
   uvm_event timer_start_event; 
    
   // Constructor 
   function new (string name="o_ru_base_test", uvm_component parent); 
     super.new(name, parent); 
     m_test_pass    = 0; 
     exp_o_ru_empty = 1;
     delay_end_time = 0.09ms;
   endfunction : new
   
   
   extern virtual function void build_phase(uvm_phase phase);
   extern virtual function void connect_phase(uvm_phase phase);
   extern virtual task run_phase(uvm_phase phase);
   extern virtual task start_timer();
   
   endclass : o_ru_base_test
   
   task o_ru_base_test::start_timer();
      #5us;
      timer_start_event.trigger();
   endtask 
   
   //Declare the build_phase method 
   function void o_ru_base_test::build_phase(uvm_phase phase);
     int m_avsts_data_if_max_cnt;
     super.build_phase(phase);
     timer_start_event = new();
     uvm_config_db#(uvm_event)::set(this,"*","timer_start_event",timer_start_event);
     // Enable transaction recording for everything.
     uvm_config_db#(int)::set(this, "*", "recording_detail", UVM_FULL);
    
     if(!uvm_config_db #(o_ru_config)::get(this, "", "o_ru_config", m_o_ru_config)) begin
       `uvm_error(get_type_name(), "BCW config not found")
     end else begin
       `uvm_info(get_type_name(), $psprintf("BCW Config received"), UVM_LOW)
     end
     ral_blk   = Top_Subsystem_mmap_urm::type_id::create("ral_blk");
     ral_blk.build();
     ral_blk.lock_model();  
     reg_adapter = o_ru_reg_adapter_avmm::type_id::create("reg_adapter", this); 
     // Create the testbench.
     m_env = o_ru_top_env::type_id::create("m_env", this);
 
    
    //  Config Clock Components.
    m_clk_config = new [o_ru_config_pkg::c_clk_cnt];
    for(int i=0; i<o_ru_config_pkg::c_clk_cnt; i++) begin
      m_clk_config[i]                    = o_ru_clk_config::type_id::create($sformatf("m_clk_config[%0d]",i), this);
      m_clk_config[i].c_id               = i; 
      m_clk_config[i].c_name             = "CLOCK CPU";
      m_clk_config[i].c_reset_off        = 4ns; //TODO
      m_clk_config[i].c_is_active        = UVM_ACTIVE;
      m_clk_config[i].c_is_reset         = UVM_ACTIVE;
      m_clk_config[i].c_coverage_enable  = 1'b1; 
      void'(uvm_config_db#(o_ru_clk_config)::set(this,$sformatf("*m_env.m_clk_env[%0d]*",i),"o_ru_clk_config", m_clk_config[i]));
    end
    
    // Config REG and provided it to the sub classes
     m_avstmm_config = new [o_ru_config_pkg::c_avstmm_cnt];
     for(int i=0; i<o_ru_config_pkg::c_avstmm_cnt; i++) begin
       case (i)
         0 : begin
               m_avstmm_config[i]                    = avmm_config::type_id::create($sformatf("m_avstmm_config[%0d]",i), this);
               m_avstmm_config[i].c_id               = i;
               m_avstmm_config[i].c_type_id          = 0;
               m_avstmm_config[i].c_name             = "TX AVSTMM";
               m_avstmm_config[i].c_is_active        = UVM_ACTIVE;
               m_avstmm_config[i].c_coverage_enable  = 1'b1;
               void'(uvm_config_db#(avmm_config)::set(this,$sformatf("m_env.m_avstmm_env[%0d]*",i),"avmm_config", m_avstmm_config[i]));
             end

         1 : begin
               m_avstmm_config[i]                    = avmm_config::type_id::create($sformatf("m_avstmm_config[%0d]",i), this);
               m_avstmm_config[i].c_id               = i;
               m_avstmm_config[i].c_type_id          = 1;
               m_avstmm_config[i].c_name             = "RX AVSTMM";
               m_avstmm_config[i].c_is_active        = UVM_ACTIVE;
               m_avstmm_config[i].c_coverage_enable  = 1'b1;
               void'(uvm_config_db#(avmm_config)::set(this,$sformatf("m_env.m_avstmm_env[%0d]*",i),"avmm_config", m_avstmm_config[i]));
             end
         default : `uvm_fatal("Base Test", "Data config id out of bounce")
       endcase
     end

    
    //Config DRIVER DATA config and provided it to the sub classes
     m_avsts_data_if_max_cnt = 0;
     foreach(o_ru_config_pkg::c_avsts_drv_data_cnt[index]) begin
       m_avsts_data_if_max_cnt += c_avsts_drv_data_cnt[index]; 
     end
     m_avsts_drv_data_config = new [m_avsts_data_if_max_cnt];

       m_avsts_drv_data_config[0]                    = avsts_config::type_id::create($sformatf("m_avsts_drv_data_config[0]"), this);
       m_avsts_drv_data_config[0].c_type_id          = 0;
       m_avsts_drv_data_config[0].c_id               = 0;
       m_avsts_drv_data_config[0].c_name             = {"TX SERDES",0};
       m_avsts_drv_data_config[0].c_is_active        = UVM_ACTIVE;
       m_avsts_drv_data_config[0].c_is_tx            = 1; 
       m_avsts_drv_data_config[0].c_coverage_enable  = 1'b1;
       void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_drv0_data_env*"),"avsts_config", m_avsts_drv_data_config[0]));
    
       m_avsts_drv_data_config[1]                    = avsts_config::type_id::create($sformatf("m_avsts_drv_data_config[1]"), this);
       m_avsts_drv_data_config[1].c_type_id          = 0;
       m_avsts_drv_data_config[1].c_id               = 1;
       m_avsts_drv_data_config[1].c_name             = {"TX SERDES",1};
       m_avsts_drv_data_config[1].c_is_active        = UVM_ACTIVE;
       m_avsts_drv_data_config[1].c_is_tx            = 1; 
       m_avsts_drv_data_config[1].c_coverage_enable  = 1'b1;
       void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_drv1_data_env*"),"avsts_config", m_avsts_drv_data_config[1]));

       m_avsts_drv_data_config[2]                    = avsts_config::type_id::create($sformatf("m_avsts_drv_data_config[2]"), this);
       m_avsts_drv_data_config[2].c_type_id          = 0;
       m_avsts_drv_data_config[2].c_id               = 2;
       m_avsts_drv_data_config[2].c_name             = {"TX SERDES",2};
       m_avsts_drv_data_config[2].c_is_active        = UVM_ACTIVE;
       m_avsts_drv_data_config[2].c_is_tx            = 1; 
       m_avsts_drv_data_config[2].c_coverage_enable  = 1'b1;
       void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_drv2_data_env*"),"avsts_config", m_avsts_drv_data_config[2]));

       m_avsts_drv_data_config[3]                    = avsts_config::type_id::create($sformatf("m_avsts_drv_data_config[3]"), this);
       m_avsts_drv_data_config[3].c_type_id          = 0;
       m_avsts_drv_data_config[3].c_id               = 3;
       m_avsts_drv_data_config[3].c_name             = {"TX SERDES",3};
       m_avsts_drv_data_config[3].c_is_active        = UVM_ACTIVE;
       m_avsts_drv_data_config[3].c_is_tx            = 1; 
       m_avsts_drv_data_config[3].c_coverage_enable  = 1'b1;
       void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_drv3_data_env*"),"avsts_config", m_avsts_drv_data_config[3]));

       m_avsts_drv_data_config[4]                    = avsts_config::type_id::create($sformatf("m_avsts_drv_data_config[4]"), this);
       m_avsts_drv_data_config[4].c_type_id          = 0;
       m_avsts_drv_data_config[4].c_id               = 4;
       m_avsts_drv_data_config[4].c_name             = {"TX SERDES",4};
       m_avsts_drv_data_config[4].c_is_active        = UVM_ACTIVE;
       m_avsts_drv_data_config[4].c_is_tx            = 1; 
       m_avsts_drv_data_config[4].c_coverage_enable  = 1'b1;
       void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_drv4_data_env*"),"avsts_config", m_avsts_drv_data_config[4]));

       m_avsts_drv_data_config[5]                    = avsts_config::type_id::create($sformatf("m_avsts_drv_data_config[5]"), this);
       m_avsts_drv_data_config[5].c_type_id          = 0;
       m_avsts_drv_data_config[5].c_id               = 5;
       m_avsts_drv_data_config[5].c_name             = {"TX SERDES",5};
       m_avsts_drv_data_config[5].c_is_active        = UVM_ACTIVE;
       m_avsts_drv_data_config[5].c_is_tx            = 1; 
       m_avsts_drv_data_config[5].c_coverage_enable  = 1'b1;
       void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_drv5_data_env*"),"avsts_config", m_avsts_drv_data_config[5]));
 
    //Config MONITOR DATA and provided it to the sub classes
    m_avsts_data_if_max_cnt = 0; 
    foreach(c_avsts_mon_data_cnt[index]) begin
      m_avsts_data_if_max_cnt += c_avsts_mon_data_cnt[index];
    end  
    m_avsts_mon_data_config = new [m_avsts_data_if_max_cnt];

      m_avsts_mon_data_config[0]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[0]"), this);
      m_avsts_mon_data_config[0].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[0].c_id               = 0;
      m_avsts_mon_data_config[0].c_name             = {"RX SERDES",0};
      m_avsts_mon_data_config[0].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[0].c_is_tx            = 0;
      m_avsts_mon_data_config[0].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon0_data_env*"),"avsts_config", m_avsts_mon_data_config[0]));
    
      m_avsts_mon_data_config[1]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[1]"), this);
      m_avsts_mon_data_config[1].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[1].c_id               = 1;
      m_avsts_mon_data_config[1].c_name             = {"RX SERDES",1};
      m_avsts_mon_data_config[1].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[1].c_is_tx            = 0;
      m_avsts_mon_data_config[1].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon1_data_env*"),"avsts_config", m_avsts_mon_data_config[1]));

      m_avsts_mon_data_config[2]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[2]"), this);
      m_avsts_mon_data_config[2].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[2].c_id               = 2;
      m_avsts_mon_data_config[2].c_name             = {"RX SERDES",2};
      m_avsts_mon_data_config[2].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[2].c_is_tx            = 0;
      m_avsts_mon_data_config[2].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon2_data_env*"),"avsts_config", m_avsts_mon_data_config[2]));

      m_avsts_mon_data_config[3]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[3]"), this);
      m_avsts_mon_data_config[3].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[3].c_id               = 3;
      m_avsts_mon_data_config[3].c_name             = {"RX SERDES",3};
      m_avsts_mon_data_config[3].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[3].c_is_tx            = 0;
      m_avsts_mon_data_config[3].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon3_data_env*"),"avsts_config", m_avsts_mon_data_config[3]));

      m_avsts_mon_data_config[4]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[4]"), this);
      m_avsts_mon_data_config[4].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[4].c_id               = 4;
      m_avsts_mon_data_config[4].c_name             = {"RX SERDES",4};
      m_avsts_mon_data_config[4].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[4].c_is_tx            = 0;
      m_avsts_mon_data_config[4].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon4_data_env*"),"avsts_config", m_avsts_mon_data_config[4]));

      m_avsts_mon_data_config[5]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[5]"), this);
      m_avsts_mon_data_config[5].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[5].c_id               = 5;
      m_avsts_mon_data_config[5].c_name             = {"RX SERDES",5};
      m_avsts_mon_data_config[5].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[5].c_is_tx            = 0;
      m_avsts_mon_data_config[5].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon5_data_env*"),"avsts_config", m_avsts_mon_data_config[5]));

      m_avsts_mon_data_config[6]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[6]"), this);
      m_avsts_mon_data_config[6].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[6].c_id               = 6;
      m_avsts_mon_data_config[6].c_name             = {"RX SERDES",6};
      m_avsts_mon_data_config[6].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[6].c_is_tx            = 0;
      m_avsts_mon_data_config[6].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon6_data_env*"),"avsts_config", m_avsts_mon_data_config[6]));

      m_avsts_mon_data_config[7]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[7]"), this);
      m_avsts_mon_data_config[7].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[7].c_id               = 7;
      m_avsts_mon_data_config[7].c_name             = {"RX SERDES",7};
      m_avsts_mon_data_config[7].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[7].c_is_tx            = 0;
      m_avsts_mon_data_config[7].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon7_data_env*"),"avsts_config", m_avsts_mon_data_config[7]));

      m_avsts_mon_data_config[8]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[8]"), this);
      m_avsts_mon_data_config[8].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[8].c_id               = 8;
      m_avsts_mon_data_config[8].c_name             = {"RX SERDES",8};
      m_avsts_mon_data_config[8].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[8].c_is_tx            = 0;
      m_avsts_mon_data_config[8].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon8_data_env*"),"avsts_config", m_avsts_mon_data_config[8]));

      m_avsts_mon_data_config[9]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[9]"), this);
      m_avsts_mon_data_config[9].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[9].c_id               = 9;
      m_avsts_mon_data_config[9].c_name             = {"RX SERDES",9};
      m_avsts_mon_data_config[9].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[9].c_is_tx            = 0;
      m_avsts_mon_data_config[9].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon9_data_env*"),"avsts_config", m_avsts_mon_data_config[9]));

      m_avsts_mon_data_config[10]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[10]"), this);
      m_avsts_mon_data_config[10].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[10].c_id               = 10;
      m_avsts_mon_data_config[10].c_name             = {"RX SERDES",10};
      m_avsts_mon_data_config[10].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[10].c_is_tx            = 0;
      m_avsts_mon_data_config[10].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon10_data_env*"),"avsts_config", m_avsts_mon_data_config[10]));

      m_avsts_mon_data_config[11]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[11]"), this);
      m_avsts_mon_data_config[11].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[11].c_id               = 11;
      m_avsts_mon_data_config[11].c_name             = {"RX SERDES",11};
      m_avsts_mon_data_config[11].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[11].c_is_tx            = 0;
      m_avsts_mon_data_config[11].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon11_data_env*"),"avsts_config", m_avsts_mon_data_config[11]));

      m_avsts_mon_data_config[12]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[12]"), this);
      m_avsts_mon_data_config[12].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[12].c_id               = 12;
      m_avsts_mon_data_config[12].c_name             = {"RX SERDES",12};
      m_avsts_mon_data_config[12].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[12].c_is_tx            = 0;
      m_avsts_mon_data_config[12].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon12_data_env*"),"avsts_config", m_avsts_mon_data_config[12]));

      m_avsts_mon_data_config[13]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[13]"), this);
      m_avsts_mon_data_config[13].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[13].c_id               = 13;
      m_avsts_mon_data_config[13].c_name             = {"RX SERDES",13};
      m_avsts_mon_data_config[13].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[13].c_is_tx            = 0;
      m_avsts_mon_data_config[13].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon13_data_env*"),"avsts_config", m_avsts_mon_data_config[13]));

      m_avsts_mon_data_config[14]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[14]"), this);
      m_avsts_mon_data_config[14].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[14].c_id               = 14;
      m_avsts_mon_data_config[14].c_name             = {"RX SERDES",14};
      m_avsts_mon_data_config[14].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[14].c_is_tx            = 0;
      m_avsts_mon_data_config[14].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon14_data_env*"),"avsts_config", m_avsts_mon_data_config[14]));

      m_avsts_mon_data_config[15]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[15]"), this);
      m_avsts_mon_data_config[15].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[15].c_id               = 15;
      m_avsts_mon_data_config[15].c_name             = {"RX SERDES",15};
      m_avsts_mon_data_config[15].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[15].c_is_tx            = 0;
      m_avsts_mon_data_config[15].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon15_data_env*"),"avsts_config", m_avsts_mon_data_config[15]));

      m_avsts_mon_data_config[16]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[16]"), this);
      m_avsts_mon_data_config[16].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[16].c_id               = 16;
      m_avsts_mon_data_config[16].c_name             = {"RX SERDES",16};
      m_avsts_mon_data_config[16].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[16].c_is_tx            = 0;
      m_avsts_mon_data_config[16].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon16_data_env*"),"avsts_config", m_avsts_mon_data_config[16]));

      m_avsts_mon_data_config[17]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[17]"), this);
      m_avsts_mon_data_config[17].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[17].c_id               = 17;
      m_avsts_mon_data_config[17].c_name             = {"RX SERDES",17};
      m_avsts_mon_data_config[17].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[17].c_is_tx            = 0;
      m_avsts_mon_data_config[17].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon17_data_env*"),"avsts_config", m_avsts_mon_data_config[17]));

      m_avsts_mon_data_config[18]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[18]"), this);
      m_avsts_mon_data_config[18].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[18].c_id               = 18;
      m_avsts_mon_data_config[18].c_name             = {"RX SERDES",18};
      m_avsts_mon_data_config[18].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[18].c_is_tx            = 0;
      m_avsts_mon_data_config[18].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon18_data_env*"),"avsts_config", m_avsts_mon_data_config[18]));

      m_avsts_mon_data_config[19]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[19]"), this);
      m_avsts_mon_data_config[19].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[19].c_id               = 19;
      m_avsts_mon_data_config[19].c_name             = {"RX SERDES",19};
      m_avsts_mon_data_config[19].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[19].c_is_tx            = 0;
      m_avsts_mon_data_config[19].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon19_data_env*"),"avsts_config", m_avsts_mon_data_config[19]));

      m_avsts_mon_data_config[20]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[20]"), this);
      m_avsts_mon_data_config[20].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[20].c_id               = 20;
      m_avsts_mon_data_config[20].c_name             = {"RX SERDES",20};
      m_avsts_mon_data_config[20].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[20].c_is_tx            = 0;
      m_avsts_mon_data_config[20].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon20_data_env*"),"avsts_config", m_avsts_mon_data_config[20]));

      m_avsts_mon_data_config[21]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[21]"), this);
      m_avsts_mon_data_config[21].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[21].c_id               = 21;
      m_avsts_mon_data_config[21].c_name             = {"RX SERDES",21};
      m_avsts_mon_data_config[21].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[21].c_is_tx            = 0;
      m_avsts_mon_data_config[21].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon21_data_env*"),"avsts_config", m_avsts_mon_data_config[21]));

      m_avsts_mon_data_config[22]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[22]"), this);
      m_avsts_mon_data_config[22].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[22].c_id               = 22;
      m_avsts_mon_data_config[22].c_name             = {"RX SERDES",22};
      m_avsts_mon_data_config[22].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[22].c_is_tx            = 0;
      m_avsts_mon_data_config[22].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon22_data_env*"),"avsts_config", m_avsts_mon_data_config[22]));

      m_avsts_mon_data_config[23]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[23]"), this);
      m_avsts_mon_data_config[23].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[23].c_id               = 23;
      m_avsts_mon_data_config[23].c_name             = {"RX SERDES",23};
      m_avsts_mon_data_config[23].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[23].c_is_tx            = 0;
      m_avsts_mon_data_config[23].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon23_data_env*"),"avsts_config", m_avsts_mon_data_config[23]));

      m_avsts_mon_data_config[24]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[24]"), this);
      m_avsts_mon_data_config[24].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[24].c_id               = 24;
      m_avsts_mon_data_config[24].c_name             = {"RX SERDES",24};
      m_avsts_mon_data_config[24].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[24].c_is_tx            = 0;
      m_avsts_mon_data_config[24].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon24_data_env*"),"avsts_config", m_avsts_mon_data_config[24]));

      m_avsts_mon_data_config[25]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[25]"), this);
      m_avsts_mon_data_config[25].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[25].c_id               = 25;
      m_avsts_mon_data_config[25].c_name             = {"RX SERDES",25};
      m_avsts_mon_data_config[25].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[25].c_is_tx            = 0;
      m_avsts_mon_data_config[25].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon25_data_env*"),"avsts_config", m_avsts_mon_data_config[25]));

      m_avsts_mon_data_config[26]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[26]"), this);
      m_avsts_mon_data_config[26].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[26].c_id               = 26;
      m_avsts_mon_data_config[26].c_name             = {"RX SERDES",26};
      m_avsts_mon_data_config[26].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[26].c_is_tx            = 0;
      m_avsts_mon_data_config[26].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon26_data_env*"),"avsts_config", m_avsts_mon_data_config[26]));

      m_avsts_mon_data_config[27]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[27]"), this);
      m_avsts_mon_data_config[27].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[27].c_id               = 27;
      m_avsts_mon_data_config[27].c_name             = {"RX SERDES",27};
      m_avsts_mon_data_config[27].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[27].c_is_tx            = 0;
      m_avsts_mon_data_config[27].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon27_data_env*"),"avsts_config", m_avsts_mon_data_config[27]));

      m_avsts_mon_data_config[28]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[28]"), this);
      m_avsts_mon_data_config[28].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[28].c_id               = 28;
      m_avsts_mon_data_config[28].c_name             = {"RX SERDES",28};
      m_avsts_mon_data_config[28].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[28].c_is_tx            = 0;
      m_avsts_mon_data_config[28].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon28_data_env*"),"avsts_config", m_avsts_mon_data_config[28]));

      m_avsts_mon_data_config[29]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[29]"), this);
      m_avsts_mon_data_config[29].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[29].c_id               = 29;
      m_avsts_mon_data_config[29].c_name             = {"RX SERDES",29};
      m_avsts_mon_data_config[29].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[29].c_is_tx            = 0;
      m_avsts_mon_data_config[29].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon29_data_env*"),"avsts_config", m_avsts_mon_data_config[29]));

      m_avsts_mon_data_config[30]                    = avsts_config::type_id::create($sformatf("m_avsts_mon_data_config[30]"), this);
      m_avsts_mon_data_config[30].c_type_id          = 0; //TODO
      m_avsts_mon_data_config[30].c_id               = 30;
      m_avsts_mon_data_config[30].c_name             = {"RX SERDES",30};
      m_avsts_mon_data_config[30].c_is_active        = UVM_PASSIVE;
      m_avsts_mon_data_config[30].c_is_tx            = 0;
      m_avsts_mon_data_config[30].c_coverage_enable  = 1'b1;
      void'(uvm_config_db#(avsts_config)::set(this,$sformatf("*m_env.m_avsts_mon30_data_env*"),"avsts_config", m_avsts_mon_data_config[30]));

      // Create specific-depth printer for printing the created topology.
      printer = new();
      printer.knobs.depth = 3;
      super.build_phase(phase);
    endfunction : build_phase
    
    function void o_ru_base_test::connect_phase(uvm_phase phase);
      super.connect_phase(.phase(phase));
      ral_blk.default_map.set_auto_predict(1);


      ral_blk.get_registers(regs);
      ral_blk.get_maps(maps);
      
      foreach(maps[ii]) begin
         ral_blk.get_map_by_name(maps[ii].get_name()).set_check_on_read(1);
         `uvm_info(get_type_name(), $sformatf("DEBUG:: Maps Size : %0d regs.size: %0d regs[0]:%s, full name: %s",maps.size(),regs.size(), regs[0].convert2string(), regs[0].get_full_name()), UVM_HIGH)
      end
      foreach(regs[ii]) begin
         uvm_reg_field fields[$];
         ral_blk.get_block_by_name(regs[ii].get_parent().get_name()).get_reg_by_name(regs[ii].get_name()).get_fields(fields);
         `uvm_info(get_type_name(), $sformatf("DEBUG:: Maps Size : %0d regs.size: %0d regs[0]:%s, full name: %s",maps.size(),regs.size(), regs[ii].convert2string(), regs[ii].get_full_name()), UVM_HIGH)
         foreach(fields[jj]) begin
            ral_blk.get_block_by_name(regs[ii].get_parent().get_name()).get_reg_by_name(regs[ii].get_name()).get_field_by_name(fields[jj].get_name()).set_compare(UVM_CHECK);
         end
      end

      ral_blk.default_map.set_sequencer(m_env.m_avstmm_env[0].m_agent.m_sequencer,reg_adapter);
      m_o_ru_config.ral_blk = ral_blk;
      m_o_ru_config.reg_model.ral_blk = ral_blk ;
     foreach(m_avsts_drv_data_config[i]) 
      begin
        m_avsts_drv_data_config[i].randomize();
        m_o_ru_config.avsts_drv_cfg[i] =m_avsts_drv_data_config[i] ;
      end
      foreach(m_avsts_mon_data_config[i]) 
      begin
        m_avsts_mon_data_config[i].randomize();
        m_o_ru_config.avsts_mon_cfg[i] =m_avsts_mon_data_config[i] ;
      end
    endfunction : connect_phase	
    
    // Declaration of the UVM run_phase method.
    task o_ru_base_test::run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.phase_done.set_drain_time(this, 100);
    endtask : run_phase
    
`endif // O_RU_BASE_TEST_SV 

  //Place holder for any other user specific routines
  //----------------------------------------------------------------------------
  // To be Added //



   //----------------------------------------------------------------------------
