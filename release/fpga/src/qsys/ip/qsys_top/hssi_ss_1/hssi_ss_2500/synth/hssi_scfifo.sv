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


  // (C) 2001-2020 Intel Corporation. All rights reserved.
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

// ==========================================================================
// Project           : HSSI Subsystem 
// Module            : hssi_scfifo.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================1

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module hssi_scfifo # ( 
   parameter ASYNC_RST              = 1,
   parameter SIM_EMULATE            = 0,
   parameter enable_ecc             = "FALSE",
   parameter intended_device_family = "Agilex",
   parameter lpm_hint               = "RAM_BLOCK_TYPE=M20K",
   parameter lpm_width              = 494,
   parameter lpm_widthu             = 5,
   parameter lpm_numwords           = 32,
   parameter lpm_type               = "scfifo",
   parameter lpm_showahead          = "OFF",
   parameter overflow_checking      = "OFF",
   parameter underflow_checking     = "OFF",
   parameter almost_full_value      = 4,
   // parameter almost_empty_value     = 31,
   parameter use_eab                = "ON"
)(
                    
   input                       clock,
   input                       aclr,
   input                       sclr,
   
   input                       wrreq,
   input  [lpm_width -1 :0]    data,
   
   input                       rdreq,
   output [lpm_width -1 :0]    q,
           
   output                      almost_empty,
   output                      almost_full,
   output                      empty,
   output                      full,
   output [1:0]                eccstatus,
   output [lpm_widthu-1:0]     usedw,
   output                      flag
);

   localparam almost_empty_value     = 2;

 // reg                           empty_d1;
 wire [lpm_width -1 :0]        data_out ;
 reg                           flg = 1 ;

//Fifo read latency = 1. When consecutive resets are applied, Fifo dataout(q) holds the previous 
//value causing o_avst_tx_valid to get asserted when first rd_req is high after reset. Flag condition is added to mask this extra valid generation
generate 
   if (ASYNC_RST) begin: FIFO_ASYNC_RST
 always @(posedge clock or posedge aclr) 
 begin
    if (aclr) begin
            flg <= 1'b1;
    end 
    else begin
            flg <= (flg & rdreq)? 1'b0 : flg;
    end
 end
   end
   else begin: FIFO_SYNC_RST
      always @(posedge clock) 
      begin
         if (sclr) begin
            flg <= 1'b1;
         end 
         else begin
            flg <= (flg & rdreq)? 1'b0 : flg;
         end
      end  
   end  
endgenerate       
 
 assign q = (flg)? '0: data_out;
 assign flag = flg;
 
/* 
generate 
   if (SIM_EMULATE) begin: FIFO_SIM_EMULATE_ON
   
      always @(posedge clock or posedge aclr) 
      begin
         if (aclr) begin
            flag <= 1'b1;
         end 
         else begin
            flag <= (flag & (!empty))? 1'b0 : flag;
         end
      end
      
      assign q = data_out;
      
   end
   else begin: FIFO_SIM_EMULATE_OFF
      assign q = data_out;
   end
endgenerate  
*/
 
 /*always @(posedge clock) 
 begin
    empty_d1 <= empty;
 end*/
      
// assign q = data_out;   
      
generate      

if (enable_ecc == "TRUE") begin : SCFIFO_WITH_ECC
scfifo  sc_fifo_inst (
   .clock        ( clock        ),
   .data         ( data         ),
   .wrreq        ( wrreq        ),
   .rdreq        ( rdreq        ),
   .empty        ( empty        ),
   .full         ( full         ),
   .q            ( data_out     ),
   .usedw        ( usedw        ),
   .aclr         ( aclr         ),
   .almost_empty ( almost_empty ),
   .almost_full  ( almost_full  ),
   .eccstatus    ( eccstatus    ),
   .sclr         ( sclr         )
   );
  defparam
    sc_fifo_inst.add_ram_output_register  = "ON",
    sc_fifo_inst.enable_ecc               = enable_ecc,
    sc_fifo_inst.intended_device_family   = intended_device_family,
    sc_fifo_inst.lpm_numwords             = lpm_numwords,
    sc_fifo_inst.lpm_hint                 = lpm_hint,
    sc_fifo_inst.lpm_showahead            = "OFF",
    sc_fifo_inst.lpm_type                 = lpm_type,
    sc_fifo_inst.lpm_width                = lpm_width,
    sc_fifo_inst.lpm_widthu               = lpm_widthu,
    sc_fifo_inst.overflow_checking        = overflow_checking,
    sc_fifo_inst.underflow_checking       = underflow_checking,
    sc_fifo_inst.almost_full_value        = almost_full_value,
    sc_fifo_inst.almost_empty_value       = almost_empty_value,
    sc_fifo_inst.use_eab                  = use_eab;
    
end
else begin : SCFIFO_WITHOUT_ECC
scfifo  sc_fifo_inst (
   .clock        ( clock        ),
   .data         ( data         ),
   .wrreq        ( wrreq        ),
   .rdreq        ( rdreq        ),
   .empty        ( empty        ),
   .full         ( full         ),
   .q            ( data_out     ),
   .usedw        ( usedw        ),
   .aclr         ( aclr         ),
   .almost_empty ( almost_empty ),
   .almost_full  ( almost_full  ),
   .eccstatus    (     ),
   .sclr         ( sclr         )
   );
  defparam
    sc_fifo_inst.add_ram_output_register  = "ON",
    // sc_fifo_inst.enable_ecc               = enable_ecc,
    sc_fifo_inst.intended_device_family   = intended_device_family,
    sc_fifo_inst.lpm_numwords             = lpm_numwords,
    sc_fifo_inst.lpm_hint                 = lpm_hint,
    sc_fifo_inst.lpm_showahead            = "OFF",
    sc_fifo_inst.lpm_type                 = lpm_type,
    sc_fifo_inst.lpm_width                = lpm_width,
    sc_fifo_inst.lpm_widthu               = lpm_widthu,
    sc_fifo_inst.overflow_checking        = overflow_checking,
    sc_fifo_inst.underflow_checking       = underflow_checking,
    sc_fifo_inst.almost_full_value        = almost_full_value,
    sc_fifo_inst.almost_empty_value       = almost_empty_value,
    sc_fifo_inst.use_eab                  = use_eab;
    
end

endgenerate

endmodule

`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yt3t4WY2nznz08IOGiFP69pHW1K+C8Y6DSnuRRpw9V72BmMxqZIneGhKXy84wivVyQXuXROIjmqtdK4v/T7HeXgAf+dNL6j8Nax/H1LhjFHs6ianOZfTpDTPnkpQ3I9gkFljpIxo97IeDyU5Z0aztpLWMRwznbePvr3B/jjmIt2r8PiEptZ+1sGXvk2Olw8rWaLzYTzjsMFo5eAcokPqGyHJK1JFl5qXRCHMM2k9Rp1SSY7E6tbqu75JZccaPf1TkQ2YTBY3ebIjBhWpZZ9ODyrBwZRY4j1Cc44t+l+XuSU8jTELLmhko8UkGwlgtOx4WTHYnr/cc658o8yUN8ad8iTSvlhpKgLBAdC7XgCosdqlNug9pyNc8aPv6B4bb4qAfsbicm8JfnByhoFfTseCweMbNUoxqW+C30Z+XZb8PBjF0EOmQ7vB0gcUzopQG6pqZF6R5G4Ply8hxqLZfbN5zS7xb5+Nd5snqaLAA59qCBZB2kzM7rjlw1HCwc/+EY5sGwJf8P5bATJRza+vCvKkyDhCX1x3TjjTab7us2oAtl98LKfHOENrUirt7OMpi5TpnAxGyptObU0SZZGJfedFnHlK/zk8tkfeRZ/JEM4N1dxrNou9akxNdPZ1bYKsxRnWanhu3el4h7FFBtfvW6kgZ84YXOmvgRnBUuYBeKXIR5IU12VYLeF3yR0Tsmc1xNc4vSFRpUykxYImVNs3/HAkt/YqDayHrPI5Pn1iqPlA3GXRt4WbIAILQ+DL7Nf43sUNLe3xSzI8YTmOCqE29a52khM"
`endif