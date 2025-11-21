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
`ifndef O_RU_TOP_ENV_SV
`define O_RU_TOP_ENV_SV
  //------------------------------------------------------------------------------
  // CLASS: o_ru_top_env
  //------------------------------------------------------------------------------
  class o_ru_top_env extends uvm_env;
    `uvm_component_utils(o_ru_top_env)

    // Environment ports

    //
    // Configuration components
    //
    o_ru_config                     m_o_ru_config;

    //
    // ENV Components of the environment
    //
    o_ru_clk_env                       m_clk_env[];
    avmm_env                         m_avstmm_env[];

    o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(1),.SOP_EOP_DIS(0)) m_avsts_drv0_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(1),.SOP_EOP_DIS(0)) m_avsts_drv1_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(1),.SOP_EOP_DIS(0)) m_avsts_drv2_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(1),.SOP_EOP_DIS(0)) m_avsts_drv3_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(1),.SOP_EOP_DIS(0)) m_avsts_drv4_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(256),.DRIVER(1),.SOP_EOP_DIS(0)) m_avsts_drv5_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0)) m_avsts_mon0_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(0)) m_avsts_mon1_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon2_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0)) m_avsts_mon3_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0)) m_avsts_mon4_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(0)) m_avsts_mon5_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon6_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon7_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon8_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon9_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon10_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon11_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon12_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon13_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon14_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon15_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(256),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon16_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon17_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon18_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon19_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon20_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon21_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon22_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon23_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon24_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon25_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon26_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1)) m_avsts_mon27_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0)) m_avsts_mon28_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0)) m_avsts_mon29_data_env;
    o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0)) m_avsts_mon30_data_env;
    o_ru_scb m_scb;

    int                           m_data_if_max_cnt;
    int                           m_avsts_data_if_max_cnt;
    int                           scb_if_cnt;


    // Constructor - Required UVM syntax
    function new(string name, uvm_component parent);
      super.new(name, parent);
      this.m_data_if_max_cnt = 0;
      this.m_avsts_data_if_max_cnt = 0;
    endfunction : new

    // Class Functions or Tasks
    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

  endclass : o_ru_top_env

  // UVM build_phase
  function void o_ru_top_env::build_phase(uvm_phase phase);
    int m_data_if_cnt;
    int m_avsts_data_if_cnt;

    super.build_phase(phase);

    // Create CLK envs
   
    m_clk_env = new [o_ru_config_pkg::c_clk_cnt];
    for(int i=0; i< o_ru_config_pkg::c_clk_cnt; i++) begin
      m_clk_env[i] = o_ru_clk_env::type_id::create(.name($sformatf("m_clk_env[%0d]",i)), .parent(this));
    end
    
    m_avstmm_env = new [o_ru_config_pkg::c_avstmm_cnt];
    for(int i=0; i< o_ru_config_pkg::c_avstmm_cnt; i++) begin
      m_avstmm_env[i] = avmm_env::type_id::create(.name($sformatf("m_avstmm_env[%0d]",i)), .parent(this));
    end
   
    // Create DRIVER envs
   
    m_data_if_cnt     = 0;
    m_avsts_data_if_cnt     = 0;
    foreach(o_ru_config_pkg::c_drv_data_cnt[index]) begin
      m_data_if_max_cnt += c_drv_data_cnt[index];
    end
    foreach(o_ru_config_pkg::c_avsts_drv_data_cnt[index]) begin
      m_avsts_data_if_max_cnt += c_avsts_drv_data_cnt[index];
    end

    `uvm_info(get_type_name(), $psprintf("TOP_ENV_DRV  m_data_if_max_cnt :%d m_avsts_data_if_max_cnt:%d ",m_data_if_max_cnt,m_avsts_data_if_max_cnt), UVM_LOW)
        `uvm_info(get_type_name(), $psprintf("CREATING TOP_ENV_DRIVER"), UVM_LOW)
        m_avsts_drv0_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(1),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_drv0_data_env")), .parent(this));
        m_avsts_drv1_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(1),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_drv1_data_env")), .parent(this));
        m_avsts_drv2_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(1),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_drv2_data_env")), .parent(this));
        m_avsts_drv3_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(1),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_drv3_data_env")), .parent(this));
        m_avsts_drv4_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(1),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_drv4_data_env")), .parent(this));
        m_avsts_drv5_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(256),.DRIVER(1),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_drv5_data_env")), .parent(this));
        m_avsts_data_if_cnt += 1;
   
    // Create MONITOR envs
   
    m_data_if_cnt     = 0;
    m_avsts_data_if_cnt     = 0;
        
      `uvm_info(get_type_name(), $psprintf("CREATING TOP_ENV_MONITOR"), UVM_LOW)
        m_avsts_mon0_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_mon0_data_env")), .parent(this));
        m_avsts_mon1_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_mon1_data_env")), .parent(this));
        m_avsts_mon2_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon2_data_env")), .parent(this));
        m_avsts_mon3_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_mon3_data_env")), .parent(this));
        m_avsts_mon4_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_mon4_data_env")), .parent(this));
        m_avsts_mon5_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_mon5_data_env")), .parent(this));
        m_avsts_mon6_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon6_data_env")), .parent(this));
        m_avsts_mon7_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon7_data_env")), .parent(this));
        m_avsts_mon8_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon8_data_env")), .parent(this));
        m_avsts_mon9_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon9_data_env")), .parent(this));
        m_avsts_mon10_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon10_data_env")), .parent(this));
        m_avsts_mon11_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon11_data_env")), .parent(this));
        m_avsts_mon12_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon12_data_env")), .parent(this));
        m_avsts_mon13_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon13_data_env")), .parent(this));
        m_avsts_mon14_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon14_data_env")), .parent(this));
        m_avsts_mon15_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon15_data_env")), .parent(this));
        m_avsts_mon16_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(256),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon16_data_env")), .parent(this));
        m_avsts_mon17_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon17_data_env")), .parent(this));
        m_avsts_mon18_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon18_data_env")), .parent(this));
        m_avsts_mon19_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon19_data_env")), .parent(this));
        m_avsts_mon20_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon20_data_env")), .parent(this));
        m_avsts_mon21_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon21_data_env")), .parent(this));
        m_avsts_mon22_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon22_data_env")), .parent(this));
        m_avsts_mon23_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon23_data_env")), .parent(this));
        m_avsts_mon24_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon24_data_env")), .parent(this));
        m_avsts_mon25_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon25_data_env")), .parent(this));
        m_avsts_mon26_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon26_data_env")), .parent(this));
        m_avsts_mon27_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(32),.DRIVER(0),.SOP_EOP_DIS(1))::type_id::create(.name($sformatf("m_avsts_mon27_data_env")), .parent(this));
        m_avsts_mon28_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(128),.DRIVER(0))::type_id::create(.name($sformatf("m_avsts_mon28_data_env")), .parent(this));
        m_avsts_mon29_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_mon29_data_env")), .parent(this));
        m_avsts_mon30_data_env = o_ru_avsts_agent_env#(.DATA_WIDTH(64),.DRIVER(0),.SOP_EOP_DIS(0))::type_id::create(.name($sformatf("m_avsts_mon30_data_env")), .parent(this));


        m_avsts_data_if_cnt += 1;
        m_scb =o_ru_scb::type_id::create (.name("m_scb"), .parent(this));
        `uvm_info(get_type_name(), $sformatf("Build done"), UVM_LOW)
  endfunction : build_phase

  function void o_ru_top_env::connect_phase(uvm_phase phase);
    super.connect_phase(.phase(phase));

    
    // Connect driver data analysis port to Scoreboard
    

    `uvm_info(get_type_name(), $psprintf("TOP_ENV_CONN  m_avsts_data_if_max_cnt: %d ",m_avsts_data_if_max_cnt), UVM_LOW)
      m_avsts_drv0_data_env.m_axp.connect(m_scb.m_axp_drv_port[0]);
      m_avsts_drv1_data_env.m_axp.connect(m_scb.m_axp_drv_port[1]);
      m_avsts_drv2_data_env.m_axp.connect(m_scb.m_axp_drv_port[2]);
      m_avsts_drv3_data_env.m_axp.connect(m_scb.m_axp_drv_port[3]);
      m_avsts_drv4_data_env.m_axp.connect(m_scb.m_axp_drv_port[4]);
      m_avsts_drv5_data_env.m_axp.connect(m_scb.m_axp_drv_port[5]);
    
    // Connect montor data analysis port to Scoreboard

      m_avsts_mon0_data_env.m_axp.connect(m_scb.m_axp_mon_port[0]);
      m_avsts_mon1_data_env.m_axp.connect(m_scb.m_axp_mon_port[1]);
      m_avsts_mon2_data_env.m_axp.connect(m_scb.m_axp_mon_port[2]);
      m_avsts_mon3_data_env.m_axp.connect(m_scb.m_axp_mon_port[3]);
      m_avsts_mon4_data_env.m_axp.connect(m_scb.m_axp_mon_port[4]);
      m_avsts_mon5_data_env.m_axp.connect(m_scb.m_axp_mon_port[5]);
      m_avsts_mon6_data_env.m_axp.connect(m_scb.m_axp_mon_port[6]);
      m_avsts_mon7_data_env.m_axp.connect(m_scb.m_axp_mon_port[7]);
      m_avsts_mon8_data_env.m_axp.connect(m_scb.m_axp_mon_port[8]);
      m_avsts_mon9_data_env.m_axp.connect(m_scb.m_axp_mon_port[9]);
      m_avsts_mon10_data_env.m_axp.connect(m_scb.m_axp_mon_port[10]);
      m_avsts_mon11_data_env.m_axp.connect(m_scb.m_axp_mon_port[11]);
      m_avsts_mon12_data_env.m_axp.connect(m_scb.m_axp_mon_port[12]);
      m_avsts_mon13_data_env.m_axp.connect(m_scb.m_axp_mon_port[13]);
      m_avsts_mon14_data_env.m_axp.connect(m_scb.m_axp_mon_port[14]);
      m_avsts_mon15_data_env.m_axp.connect(m_scb.m_axp_mon_port[15]);
      m_avsts_mon16_data_env.m_axp.connect(m_scb.m_axp_mon_port[16]);
      m_avsts_mon17_data_env.m_axp.connect(m_scb.m_axp_mon_port[17]);
      m_avsts_mon18_data_env.m_axp.connect(m_scb.m_axp_mon_port[18]);
      m_avsts_mon19_data_env.m_axp.connect(m_scb.m_axp_mon_port[19]);
      m_avsts_mon20_data_env.m_axp.connect(m_scb.m_axp_mon_port[20]);
      m_avsts_mon21_data_env.m_axp.connect(m_scb.m_axp_mon_port[21]);
      m_avsts_mon22_data_env.m_axp.connect(m_scb.m_axp_mon_port[22]);
      m_avsts_mon23_data_env.m_axp.connect(m_scb.m_axp_mon_port[23]);
      m_avsts_mon24_data_env.m_axp.connect(m_scb.m_axp_mon_port[24]);
      m_avsts_mon25_data_env.m_axp.connect(m_scb.m_axp_mon_port[25]);
      m_avsts_mon26_data_env.m_axp.connect(m_scb.m_axp_mon_port[26]);
      m_avsts_mon27_data_env.m_axp.connect(m_scb.m_axp_mon_port[27]);
      m_avsts_mon28_data_env.m_axp.connect(m_scb.m_axp_mon_port[28]);
      m_avsts_mon29_data_env.m_axp.connect(m_scb.m_axp_mon_port[29]);
      m_avsts_mon30_data_env.m_axp.connect(m_scb.m_axp_mon_port[30]);

     endfunction : connect_phase	

`endif
