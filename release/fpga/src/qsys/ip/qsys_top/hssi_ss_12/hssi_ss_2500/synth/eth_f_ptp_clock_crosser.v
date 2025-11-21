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


// $File: //acds/main/ip/avalon_st/altera_avalon_st_handshake_clock_crosser/altera_avalon_st_clock_crosser.v $
// $Revision: #6 $
// $Date: 2012/01/18 $
// $Author: pscheidt $
//------------------------------------------------------------------------------

`timescale 1ns / 1ns

module eth_f_ptp_clock_crosser(
                                 in_clk,
                                 in_reset,
                                 in_ready,
                                 in_valid,
                                 in_data,
                                 out_clk,
                                 out_reset,
                                 out_ready,
                                 out_valid,
                                 out_data
                                );

  parameter  SYMBOLS_PER_BEAT    = 1;
  parameter  BITS_PER_SYMBOL     = 8;
  parameter  FORWARD_SYNC_DEPTH  = 2;
  parameter  BACKWARD_SYNC_DEPTH = 2;
  
  localparam  DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL;

  input                   in_clk;
  input                   in_reset;
  output                  in_ready;
  input                   in_valid;
  input  [DATA_WIDTH-1:0] in_data;

  input                   out_clk;
  input                   out_reset;
  input                   out_ready;
  output                  out_valid;
  output [DATA_WIDTH-1:0] out_data;

  // Data is guaranteed valid by control signal clock crossing.  Cut data
  // buffer false path.
  (* altera_attribute = {"-name SUPPRESS_DA_RULE_INTERNAL \"D101,D102\""} *) reg [DATA_WIDTH-1:0] in_data_buffer;
  reg    [DATA_WIDTH-1:0] out_data_buffer;

  reg                     in_data_toggle;
  wire                    in_data_toggle_returned;
  wire                    out_data_toggle;
  reg                     out_data_toggle_flopped;

  wire                    take_in_data;
  wire                    out_data_taken;

  wire                    out_valid_internal;
  wire                    out_ready_internal;

  assign in_ready = ~(in_data_toggle_returned ^ in_data_toggle);
  assign take_in_data = in_valid & in_ready;
  assign out_valid_internal = out_data_toggle ^ out_data_toggle_flopped;
  assign out_data_taken = out_ready_internal & out_valid_internal;

  always @(posedge in_clk) begin
    if (in_reset) begin
      in_data_buffer <= 'b0;
      in_data_toggle <= 1'b0;
    end else begin
      if (take_in_data) begin
        in_data_toggle <= ~in_data_toggle;
        in_data_buffer <= in_data;
      end
    end //in_reset
  end //in_clk always block

  always @(posedge out_clk) begin
    out_data_buffer <= in_data_buffer; // Multibit Clock crossing, sync reset cause AND combi before clock crossing
    if (out_reset) begin
      out_data_toggle_flopped <= 1'b0;
    end else begin
      if (out_data_taken) begin
        out_data_toggle_flopped <= out_data_toggle;
      end
    end //end if
  end //out_clk always block

  eth_f_altera_std_synchronizer_nocut #(.depth(FORWARD_SYNC_DEPTH)) in_to_out_synchronizer (
                     .clk(out_clk),
                     .reset_n(1'b1),
                     .din(in_data_toggle),
                     .dout(out_data_toggle)
                     );
  
  eth_f_altera_std_synchronizer_nocut #(.depth(BACKWARD_SYNC_DEPTH)) out_to_in_synchronizer (
                     .clk(in_clk),
                     .reset_n(1'b1),
                     .din(out_data_toggle_flopped),
                     .dout(in_data_toggle_returned)
                     );

    
      assign out_valid = out_valid_internal;
      assign out_ready_internal = out_ready;
      assign out_data = out_data_buffer;




endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRgiOvR9Sve7cTUDrwOSG1tgeFFlOUHRl9oNEWsiUSp/0LTBC/vm3d2Nc2H5KUMerzHEKC872A44um4QoBGMbtYSQ5a4dYbh0MNO0lDS4hIk3Y/eYKJYj8BncmWhpfTIE9pdwLyuMxObNeU1CW7g35jizYWIJvkjxJtpgYG1KxK06+QM60hvd9ZxwPBHb6Kso+HXbwUpd0DGmdQhvVCpOFcOVVmyBiE2qTk2kfMz5iiNCj+25psn0OltS/IpZbF42K0dA7B8JmwPdanSm0raCup+4Ir/zinaXOUDSwyk0/iT9V6JChL9EXrsJS6zGldcKC36ewx4WZBfnC4dfGyrFe6x73YO2ZJcZ7FSScPS2+3LH/sotQN0H9gYRdEaAojVaOwsQ386bFvzeBBkRXk+XP60hA/ALWStXT/mEbJTIHT+ekg+TFJtys1hmhgEi76dtItRf5d5Wr+ZgnOQmgFYDXG/HqRaYRPI1b24zCOAzsiXJ7H0NiO0AX4ATPyDZJFy1pg6Kulv9U5qyVhEgN929HpQBvmRqN+VGwD00vWiM90shJ85jJqcaOmP6gKPKFzRFbxsL4zFbndIoq28s2KegmiTgo9Cc4CS1lMQAdccg2cKT4Y9c7meuAMhdOpxjNddFtcXnXlvEwJStc6YCdFjOihPwILeIDnn08xkOYckgr8z+4v8DCwCg4713Weq4srw7wGnD4R3flXDsqUpI2Z9XZrl5dTpf5X2fYRB7NDPJqkAtHVezeCT7pc72uuc7Ksg7RswcEb0+pulH2+FCT61EHwv"
`endif