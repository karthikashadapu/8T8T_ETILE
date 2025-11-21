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

`ifndef AVMM_CONFIG_SV
`define AVMM_CONFIG_SV

  // AVMM has one master and N slaves
  // AVMM Slave Configuration Information
  class avmm_config extends uvm_object;
    
    `uvm_object_utils(avmm_config)

  
    int                       c_type_id         =-1; 
    int                       c_id              =-1; 
    string                    c_name            = "";
    uvm_active_passive_enum   c_is_active       = UVM_ACTIVE;  
    bit                       c_coverage_enable = 1;  
    bit                       c_is_tx           = 1;
    bit                       c_is_par          = 1;
    bit                       c_loop_enable     = 0;

    // AVSTMM has one master and N slaves
    int                       num_slaves;
    avmm_config                slave_configs[$]; 
    int                       psel_val = 0;

    string name;
    int    start_address;
    int    end_address;
    int    psel_index;
  
  
    localparam int c_avstmm_if_cnt     = 1;     // Count of data interface types
    localparam int c_drv_avstmm_cnt[]  = {1};   // Count of a specific driver interface type
    localparam int c_mon_avstmm_cnt[]  = {1};   // Count of a specific monitor interface type

    virtual avmm_if drv_avstmm_vif_0[c_drv_avstmm_cnt[0]];
    virtual avmm_if mon_avstmm_vif_0[c_mon_avstmm_cnt[0]];
    virtual avmm_if reg_vif[c_mon_avstmm_cnt[0]];


  
    // Constructor - UVM required syntax
    function new (string name = "avmm_config");
      super.new(name);
    endfunction
  
    // Checks to see if an address is in the configured range
    function bit check_address_range(int unsigned addr);
      return (!((start_address > addr) || (end_address < addr)));
    endfunction
  

  
  
    // Additional class methods
    extern function void add_slave(string name, int start_addr, int end_addr, int psel_index);  
    extern function int get_slave_psel_by_addr(int addr);
    extern function string get_slave_name_by_addr(int addr);
  endclass  : avmm_config
  
  // avmm_config - Creates and configures a slave agent config and adds to a queue
  function void avmm_config::add_slave(string name, int start_addr, int end_addr, int psel_index);
    avmm_config m_config;
    num_slaves++;
    m_config = avmm_config::type_id::create("slave_config");
    m_config.name          = name;
    m_config.start_address = start_addr;
    m_config.end_address   = end_addr;
    m_config.psel_index    = psel_index;
    
    slave_configs.push_back(m_config);
  endfunction : add_slave
  
  
  // avmm_config - Returns the slave psel index
  function int avmm_config::get_slave_psel_by_addr(int addr);
    for (int i = 0; i < slave_configs.size(); i++)
      if(slave_configs[i].check_address_range(addr)) begin
        return slave_configs[i].psel_index;
      end
  endfunction : get_slave_psel_by_addr
  
  // avmm_config - Return the name of the slave
  function string avmm_config::get_slave_name_by_addr(int addr);
    for (int i = 0; i < slave_configs.size(); i++)
      if(slave_configs[i].check_address_range(addr)) begin
        return slave_configs[i].name;
      end
  endfunction : get_slave_name_by_addr


`endif // AVSTMM_CONFIG_SV

