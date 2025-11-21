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
`ifndef AVMM_ITEM_SV
`define AVMM_ITEM_SV

//---------------------------------------------------------------------
// CLASS: avmm_item declaration
//---------------------------------------------------------------------

class avmm_item extends uvm_sequence_item;                                  
  
  `uvm_object_utils(avmm_item)
  
  rand logic [31:0]         m_addr;
  rand uvm_access_e         m_direction;
  rand logic [31:0]         m_data;
  rand int unsigned         m_transmit_delay = 0;
  string                    m_slave = "";
   
  constraint c_direction { m_direction inside { uvm_pkg::UVM_WRITE,uvm_pkg::UVM_READ }; }
  constraint c_transmit_delay { m_transmit_delay <= 10 ; }

  function new (string name = "avmm_item");
    super.new(name);
  endfunction
  
  extern virtual function string convert2string();
  extern virtual function void do_copy( uvm_object rhs );
  extern virtual function bit  do_compare( uvm_object rhs, uvm_comparer comparer );
  extern virtual function void do_print(uvm_printer printer);
  extern virtual function void do_record(uvm_recorder recorder);
  extern virtual function void do_pack(uvm_packer packer);
  extern virtual function void do_unpack(uvm_packer packer);

endclass : avmm_item

//common do_method overrides
//---------------------------------------------------------------------
function string avmm_item::convert2string();
  string s = super.convert2string();
  s = { s, $sformatf( "\n m_addr           : %h", m_addr	     ) };
  s = { s, $sformatf( "\n m_direction      : %s", m_direction.name() ) };
  s = { s, $sformatf( "\n m_data           : %h", m_data	     ) };
  s = { s, $sformatf( "\n m_transmit_delay : %d", m_transmit_delay   ) };
  s = { s, $sformatf( "\n m_slave          : %s", m_slave            ) };
  return s;
endfunction: convert2string

function void avmm_item::do_copy( uvm_object rhs );
  avmm_item that;

  if( !$cast(that, rhs) ) begin
    `uvm_error(get_name(), "rhs is not a avmm_item")
    return;
  end

  super.do_copy( rhs );
  this.m_addr            = that.m_addr;
  this.m_direction       = that.m_direction;
  this.m_data            = that.m_data;
  this.m_transmit_delay  = that.m_transmit_delay;
  this.m_slave           = that.m_slave;
endfunction: do_copy

function bit avmm_item::do_compare( uvm_object rhs, uvm_comparer comparer );
  avmm_item that;

  if( !$cast(that, rhs) ) begin
    `uvm_error(get_name(), "rhs is not a avmm_item")
    return 0;
  end
  
  return ( super.do_compare( rhs, comparer )               &&
           this.m_addr            == that.m_addr           &&
           this.m_direction       == that.m_direction      &&
           this.m_data            == that.m_data           &&
           this.m_transmit_delay  == that.m_transmit_delay &&
           this.m_slave           == that.m_slave  );
endfunction: do_compare

function void avmm_item::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0)
    `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else
    printer.m_string = convert2string();
endfunction

function void avmm_item::do_record(uvm_recorder recorder);
  super.do_record(recorder);
  `uvm_record_field("m_addr",  m_addr)
  `uvm_record_field("m_direction", m_direction)
  `uvm_record_field("m_data",  m_data)
  `uvm_record_field("m_transmit_delay", m_transmit_delay)
  `uvm_record_field("m_slave", m_slave)
endfunction

function void avmm_item::do_pack(uvm_packer packer);
  super.do_pack(packer);
  `uvm_pack_int(m_addr)
  `uvm_pack_enum(m_direction)
  `uvm_pack_int(m_data)
  `uvm_pack_int(m_transmit_delay)
  `uvm_pack_string(m_slave)
endfunction

function void avmm_item::do_unpack(uvm_packer packer);
  super.do_unpack(packer);
  `uvm_unpack_int(m_addr)
  `uvm_unpack_enum(m_direction, uvm_access_e)
  `uvm_unpack_int(m_data)
  `uvm_unpack_int(m_transmit_delay)
  `uvm_unpack_string(m_slave)
endfunction

`endif // AVSTMM_TRANSFER_SV

