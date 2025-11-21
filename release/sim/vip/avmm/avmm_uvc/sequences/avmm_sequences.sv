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
`ifndef AVMM_SEQUENCES_SV
`define AVMM_SEQUENCES_SV

  //------------------------------------------------------------------------------
  // SEQUENCE: read_byte_seq
  //------------------------------------------------------------------------------
  //class avmm_base_seq extends uvm_sequence #(avmm_item);
  class avmm_base_seq extends uvm_reg_sequence;
    `uvm_object_utils(avmm_base_seq)
    //`uvm_declare_p_sequencer(avmm_sequencer) 
    avmm_config   m_config;
 
    function new(string name="avmm_base_seq");
      super.new(name);
    endfunction
  
    extern virtual task pre_start();
    extern virtual task post_start();
  
  endclass : avmm_base_seq
  
  // Use a base sequence to raise/drop objections if this is a default sequence
  task avmm_base_seq::pre_start();
     if (starting_phase != null)
        starting_phase.raise_objection(this, {"Running sequence '", get_full_name(), "'"});
  endtask
  
  task avmm_base_seq::post_start();
     if (starting_phase != null)
        starting_phase.drop_objection(this, {"Completed sequence '", get_full_name(), "'"});
  endtask
  // SEQUENCE: write_byte_seq
  class write_byte_seq extends avmm_base_seq;
    
    `uvm_object_param_utils(write_byte_seq)
    
    rand bit [31:0] m_start_addr;
    rand bit [7:0]  m_write_data;
    rand int unsigned m_transmit_del;
    
    constraint transmit_del_ct { (m_transmit_del <= 10); }
  
    function new(string name="write_byte_seq");
      super.new(name);
    endfunction
   
    extern virtual task body();
      
  endclass : write_byte_seq
  
  task write_byte_seq::body();
    avmm_item req ;  
    `uvm_info(get_type_name(), "Starting...", UVM_HIGH)
    
    req = avmm_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {req.m_addr == m_start_addr; req.m_direction == uvm_pkg::UVM_WRITE;
                               req.m_data == m_write_data; req.m_transmit_delay == m_transmit_del;})
       `uvm_error(get_type_name(), "Randomize failed")
    finish_item(req);    
  
    `uvm_info(get_type_name(), $psprintf("addr = 'h%0h, write_data = 'h%0h", req.m_addr, req.m_data), UVM_HIGH)
  endtask
  
  
  //------------------------------------------------------------------------------
  // SEQUENCE: read_byte_seq
  //------------------------------------------------------------------------------
  class read_byte_seq extends avmm_base_seq;
    
    `uvm_object_param_utils(read_byte_seq)
    
    rand bit [31:0]   m_start_addr;
    rand int unsigned m_transmit_del;
    
    constraint transmit_del_ct { (m_transmit_del <= 10); }
  
    function new(string name="read_byte_seq");
      super.new(name);
    endfunction
      
    extern virtual task body();
  endclass : read_byte_seq
  
  task read_byte_seq::body();
    avmm_item req ;  
    `uvm_info(get_type_name(), "Starting...", UVM_HIGH)
    
    req = avmm_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {req.m_addr == m_start_addr; req.m_direction == uvm_pkg::UVM_READ;
                               req.m_transmit_delay == m_transmit_del;})
       `uvm_error(get_type_name(), "Randomize failed")
    finish_item(req);
    `uvm_info(get_type_name(), $psprintf("req_addr = 'h%0h, response_data = 'h%0h", req.m_addr, req.m_data), UVM_HIGH)
  endtask
  
  //------------------------------------------------------------------------------
  // SEQUENCE: avstmm_read_word_seq
  //------------------------------------------------------------------------------
  class avstmm_read_word_seq extends avmm_base_seq;
    `uvm_object_utils(avstmm_read_word_seq)
   
    rand bit [31:0]   m_start_addr;
    rand int unsigned m_transmit_del;
    
    constraint transmit_del_ct { (m_transmit_del <= 10); }
    constraint addr_ct {(m_start_addr[1:0] == 0); }  
  
    function new(string name="avstmm_read_word_seq");
      super.new(name);
    endfunction
      
    extern virtual task body();
  endclass : avstmm_read_word_seq
  
  task avstmm_read_word_seq::body();
    avmm_item req ;  
    `uvm_info(get_type_name(), "Starting...", UVM_HIGH)
    
    req = avmm_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {req.m_addr == m_start_addr; req.m_direction == uvm_pkg::UVM_READ;
                               req.m_transmit_delay == m_transmit_del;})
       `uvm_error(get_type_name(), "Randomize failed")
    finish_item(req);     
    
    `uvm_info(get_type_name(), $psprintf("req_addr = 'h%0h, response_data = 'h%0h", req.m_addr, req.m_data), UVM_HIGH)
  endtask
  
  
  // SEQUENCE: avstmm_write_word_seq
  class avstmm_write_word_seq extends avmm_base_seq;
  
    `uvm_object_utils(avstmm_write_word_seq)
    
    rand bit [31:0]   m_start_addr = 'h100;
    rand bit [31:0]   m_write_data = 'hAAA;
    rand int unsigned m_transmit_del;
    
    constraint transmit_del_ct { (m_transmit_del <= 10); }
    constraint addr_ct {(m_start_addr[1:0] == 0); }  
  
    function new(string name="avmm_write_word_seq");
      super.new(name);
    endfunction
      
    extern virtual task body();
  endclass : avstmm_write_word_seq
  
  task avstmm_write_word_seq::body();
    avmm_item req ;  
    `uvm_info(get_type_name(), "Starting...", UVM_HIGH)
    
    req = avmm_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {req.m_addr == m_start_addr; req.m_direction == uvm_pkg::UVM_WRITE;
                               req.m_data == m_write_data; req.m_transmit_delay == m_transmit_del;})
       `uvm_error(get_type_name(), "Randomize failed")
    finish_item(req);    
  
    `uvm_info(get_type_name(), $psprintf("addr = 'h%0h, data = 'h%0h", 
        req.m_addr, req.m_data), UVM_HIGH)
  endtask
  
  
  // SEQUENCE: read_after_write_seq
  class read_after_write_seq extends avmm_base_seq;
  
    `uvm_object_param_utils(read_after_write_seq)
    
    rand bit [31:0]   m_start_addr;
    rand bit [31:0]   m_write_data;
    rand int unsigned m_transmit_del;
    
    constraint transmit_del_ct { (m_transmit_del <= 10); }
    constraint addr_ct {(m_start_addr[1:0] == 0); }  
  
    function new(string name="read_after_write_seq");
      super.new(name);
    endfunction
      
    extern virtual task body();
   
  endclass : read_after_write_seq
  
  task read_after_write_seq::body();
    avmm_item req ;  
    `uvm_info(get_type_name(), "Starting...", UVM_MEDIUM)
    
    req = avmm_item::type_id::create("req");
    start_item(req);
    if (!req.randomize() with {req.m_addr == m_start_addr; req.m_direction == uvm_pkg::UVM_WRITE;
                               req.m_data == m_write_data; req.m_transmit_delay == m_transmit_del;})
       `uvm_error(get_type_name(), "Randomize failed")
    finish_item(req);    
  
    `uvm_info(get_type_name(), $psprintf("addr = 'h%0h, write_data = 'h%0h",  req.m_addr, req.m_data), UVM_HIGH)    
    
    start_item(req);
    if (!req.randomize() with {req.m_addr == m_start_addr; req.m_direction == uvm_pkg::UVM_READ;
                               req.m_transmit_delay == m_transmit_del;})
       `uvm_error(get_type_name(), "Randomize failed")
    finish_item(req);
    `uvm_info(get_type_name(), $psprintf("req_addr = 'h%0h, response_data = 'h%0h", req.m_addr, req.m_data), UVM_HIGH)
  endtask
   
  
  // SEQUENCE: multiple_read_after_write_seq
  class multiple_read_after_write_seq extends avmm_base_seq;
  
     `uvm_object_param_utils(multiple_read_after_write_seq)
     `uvm_declare_p_sequencer(avmm_sequencer) 
     
      read_after_write_seq raw_seq;
      write_byte_seq w_seq;
      read_byte_seq r_seq;
      rand int unsigned num_of_seq;
      
      constraint num_of_seq_c { num_of_seq <= 10; num_of_seq >= 5; }
  
      function new(string name="multiple_read_after_write_seq");
        super.new(name);
      endfunction
      
      extern virtual task body();
  
  endclass : multiple_read_after_write_seq
  
  task multiple_read_after_write_seq::body();
    `uvm_info(get_type_name(), "Starting...", UVM_MEDIUM)
    for (int i = 0; i < num_of_seq; i++) begin
      `uvm_info(get_type_name(), $psprintf("Executing sequence # %0d", i), UVM_HIGH)
      raw_seq = read_after_write_seq::type_id::create("raw_seq");
      if ( !raw_seq.randomize() )
        `uvm_error( get_type_name(), "Randomize failed" )
      raw_seq.start(p_sequencer);
  
    end
    repeat (3) begin
      w_seq = write_byte_seq::type_id::create("w_seq");
      if ( !w_seq.randomize() with {m_transmit_del == 1;} )
        `uvm_error( get_type_name(), "Randomize failed" )
      w_seq.start(p_sequencer);        
    end
    repeat (3) begin
      r_seq = read_byte_seq::type_id::create("r_seq");
      if ( !r_seq.randomize() with {m_transmit_del == 1;} )
        `uvm_error( get_type_name(), "Randomize failed" )
      r_seq.start(p_sequencer);        
    end      
  
  endtask

`endif 

