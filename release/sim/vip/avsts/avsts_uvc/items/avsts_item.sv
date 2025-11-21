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
`ifndef AVSTS_ITEM_SV 
`define AVSTS_ITEM_SV 
//------------------------------------------------------------------------------ 
// CLASS: avsts_item 
//------------------------------------------------------------------------------ 
class avsts_item extends uvm_sequence_item; 
`uvm_object_utils(avsts_item) 

 
    rand int pkt_cnt;
    rand int pkt_id = -1;
    byte     eth_raw_data[$];
	
    rand byte unsigned buf_packet_out[] = new [9500];
    int ready_latency = 0;
    rand longint tim  ;
    rand int len ;
    rand int input_enb;
    bit break_enb = 0;
 // new - constructor 
  function new (string name="avsts_item"); 
    super.new(name);
  endfunction : new 

    extern virtual function string convert2string();
    extern virtual function void do_copy(uvm_object rhs);
    extern virtual function bit do_compare(uvm_object rhs,uvm_comparer comparer);
    extern virtual function void do_print(uvm_printer printer);
    extern virtual function void do_record(uvm_recorder recorder);
    extern virtual function void do_pack(uvm_packer packer);
    extern virtual function void do_unpack(uvm_packer packer);
	
	extern virtual function void init(longint timer,byte unsigned payload[],int length);
    extern function void post_randomize(); 

endclass : avsts_item

  function void avsts_item::init(longint timer,byte unsigned payload[],int length);
    this.tim            = timer   ;
    this.len            = length  ;
    this.buf_packet_out=new[len] (payload) ; 
  endfunction


  function string avsts_item::convert2string();
    int cnt = 0;
    string s = super.convert2string();
    return s;
  endfunction: convert2string

  function void avsts_item::do_copy( uvm_object rhs);
    avsts_item that;
    
    if( !$cast(that, rhs) ) begin
      `uvm_error(get_name(), "rhs is not a avsts_item")
      return;
    end
  
    super.do_copy( rhs );
    

  endfunction: do_copy
  

  function bit avsts_item::do_compare( uvm_object rhs, uvm_comparer comparer );

  avsts_item that;
  if( !$cast(that, rhs) ) begin
    `uvm_error(get_name(), "rhs is not a data_item")
    return 0;
  end

  endfunction: do_compare
  
  function void avsts_item::do_print(uvm_printer printer);
    if (printer.knobs.sprint == 0)
      `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
    else
      printer.m_string = convert2string();
  endfunction : do_print
 

  function void avsts_item::do_record(uvm_recorder recorder);
    super.do_record(recorder);
  endfunction : do_record

  function void avsts_item::do_pack(uvm_packer packer);
    super.do_pack(packer);
    foreach(buf_packet_out[i]) packer.pack_field_int(buf_packet_out[i],$bits(buf_packet_out[i]));
  endfunction : do_pack
  
  //
  // class do_unpack method 
  //
  function void avsts_item::do_unpack(uvm_packer packer);
    super.do_unpack(packer);
    buf_packet_out = new[len];
    foreach(buf_packet_out[i]) buf_packet_out[i] = packer.unpack_field_int($bits(buf_packet_out[i]));
  endfunction : do_unpack

function void avsts_item::post_randomize(); 
   //ADD Post randomization logic if needed
  endfunction 
     
`endif
