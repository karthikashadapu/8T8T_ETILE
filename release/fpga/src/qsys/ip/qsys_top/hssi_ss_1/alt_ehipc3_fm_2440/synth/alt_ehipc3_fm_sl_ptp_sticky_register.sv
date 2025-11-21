// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


//==============================================================================
//
// (C) 2011-2017 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other
// software and tools, and its AMPP partner logic functions, and any output
// files any of the foregoing (including device programming or simulation
// files), and any associated documentation or information are expressly subject
// to the terms and conditions of the Altera Program License Subscription
// Agreement, Altera MegaCore Function License Agreement, or other applicable
// license agreement, including, without limitation, that your use is for the
// sole purpose of programming logic devices manufactured by Altera and sold by
// Altera or its authorized distributors.  Please refer to the applicable
// agreement for further details.
//
//------------------------------------------------------------------------------
//
// Filename         : ptp_sticky_register.sv
// Author           : Tholu Kiran Kumar <kktholu@intel.com>
// Created On       : Wed Jun 21/06/2017 02:16:18 PM MYT
//
//------------------------------------------------------------------------------
//
// $File: $
// $Revision: $
// $Date: $
// $Author: $
//
//==============================================================================

//------------------------------------------------------------------------------
//
// Description :-
//   
//
//------------------------------------------------------------------------------

`timescale 1ns / 1ns
module alt_ehipc3_fm_sl_ptp_sticky_register (
  input  logic i_clk,
  input  logic i_rst_n,
  input  logic i_set_sticky,
  input  logic i_clear_sticky,
  output logic o_sticky_reg
);

  always @ (posedge i_clk)
  begin
    if (!i_rst_n)
    begin
      o_sticky_reg <= 0;
    end
    else
     begin
       if (i_set_sticky)
       begin
         o_sticky_reg <= 1;
       end
       else
       begin
         if (i_clear_sticky)
         begin
           o_sticky_reg <= 0;
         end
       end
     end
  end

  endmodule : alt_ehipc3_fm_sl_ptp_sticky_register

//============================================================================//
//                           E N D   O F   F I L E                            //
//============================================================================//
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "zxbEFFp84WYRbJsb0HIMeuWjbOOv1K7QQFpH53Gb3V5p0ZRDdhsMAxwP11nnT9uCTG31WcRFMGv1Y3sp3Jccq/UYKIiEbrkv+dnQkRqN6m6gKWqiXtHiiORyaZNWlpsJ1uOJVOw5+WI+1xrepR1EmwGCsDi2F6K1UWIUsyOHvXTbPREtmL97zvP7WTaw1mXrLe+4BbR/6Dd7pfQ4tTt2P5iQPOMdgtxNDjbWzf8Mv5Ov+5Q7D+YlDaacJnTrYZBVkbN3ReSj7zxrHS9gZRk5/2lin7xLBYLmrICXonhjyo6K1EROHBgeiJswIHhESKIzjC2j6JmgO8xSgXiqb4nX9VH0atUSeE6Ai+lZGuJ2rDqOARs0UMYzriL2Do893SJuaW9ZCsy6VjvXtFjCzRhLVsDYD8etJWhdhyo13LA075Jekhe/OLXo/1uEOh8SFDqfBl7w21M+d5pAMmy/yCP/IY8W4jmXz5xSRRmUHXOkDRxLkYuVkHbSpgPByIFhA2eR4v4WtWHMdoS51OAoLDHuPy+X4AiR1/BVwNdOKVJ5nBX8riEzD45bWET9QPVWjAhnc9Oo3xk4wztaLy23PDrYV9TcW2CLT3mUgFccFzP7EiYi1YPix6T5Xck1/hek9YUZabYl9ltwhWPLXeKKvMrG83ABNnFGILZGzM3gerIKJJT6tjXASxhYipF3Gm8gQNqHmLOVu5fuSqFGEwkkBg464HX5RHHiyrwwiCHx/Zr1MvN7yLjBwSFVbn+EqyHIrUPdXJS1WizuhyDDItPRIzvC4KiNSosJKbO7QS0m8RplSV/KOIymRX/19p+OlPVlTHgcJ6JKd90EmwV7e0KEw6r7ivvkE0nK6NmVWOmA9jO0P5w9bxjOG9w15a+zDAP1LUMQH1RI+r9mcZTC8Zp4m4ygeEKaI4JBYbOsGV+33ns29OavjJ7/QjyZRG3gncjuDb0OTZIfti+nnSHFjNHlUqO49/c9zYp8oDT94XrRpkraKDGlgcpqrnRbIaMpcCacBTrH"
`endif