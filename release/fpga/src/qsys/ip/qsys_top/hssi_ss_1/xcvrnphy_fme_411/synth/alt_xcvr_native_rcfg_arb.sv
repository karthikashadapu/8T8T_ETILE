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


`timescale 1 ps/1 ps

module alt_xcvr_native_rcfg_arb #(
  parameter total_masters   = 4,
  parameter channels        = 1,
  parameter address_width   = 10,
  parameter data_width      = 32
) (
  // Basic AVMM inputs
  input  [channels-1:0]              reconfig_clk,
  input  [channels-1:0]              reconfig_reset,

  // User AVMM input
  input  [channels-1:0]               user_read,
  input  [channels-1:0]               user_write,
  input  [channels*address_width-1:0] user_address,
  input  [channels*data_width-1:0]    user_writedata,
  input  [channels-1:0]               user_read_write,
  output [channels-1:0]               user_waitrequest,

  // Reconfig Steamer AVMM input
  input  [channels-1:0]               strm_read,
  input  [channels-1:0]               strm_write,
  input  [channels*address_width-1:0] strm_address,
  input  [channels*data_width-1:0]    strm_writedata,
  input  [channels-1:0]               strm_read_write,
  output [channels-1:0]               strm_waitrequest,

  // ODI AVMM input
  input  [channels-1:0]               odi_read,
  input  [channels-1:0]               odi_write,
  input  [channels*address_width-1:0] odi_address,
  input  [channels*data_width-1:0]    odi_writedata,
  input  [channels-1:0]               odi_read_write,
  output [channels-1:0]               odi_waitrequest,
  
  // ADME AVMM input
  input  [channels-1:0]               jtag_read,
  input  [channels-1:0]               jtag_write,
  input  [channels*address_width-1:0] jtag_address,
  input  [channels*data_width-1:0]    jtag_writedata,
  input  [channels-1:0]               jtag_read_write,
  output [channels-1:0]               jtag_waitrequest,

  // AVMM output the channel and the CSR
  input  [channels-1:0]               avmm_waitrequest,
  output [channels-1:0]               avmm_read,
  output [channels-1:0]               avmm_write,
  output [channels*address_width-1:0] avmm_address,
  output [channels*data_width-1:0]    avmm_writedata
);

// General wires
wire [channels*total_masters-1:0] grant;
wire [channels-1:0]               strm_grants;
wire [channels-1:0]               user_read_write_lcl;

// Variables for the generate loops 
genvar ig; // For bus widths
genvar jg; // For Channels
generate for(jg=0;jg<channels;jg=jg+1) begin: g_arb

    /*********************************************************************/
    // case: 309705
    // Simulation fix.  When the user inputs drive x at the beginning of simulation,
    // then even after a reset, the grant will have been assigned a value of x.
    // since there is a loopback in the RTL, the value will continue to be x,
    // and gets reflected on avmm_readdata and avmm_waitrequest.  once an avmm master
    // requests a read or write, the x value for grant will correct itself.
    /**********************************************************************/
    assign user_read_write_lcl[jg] = 
                                     // synthesis translate_off
                                       (user_read_write[jg] === 1'bx) ? 1'b0 : 
                                     // synthesis translate_on
                                       user_read_write[jg];
    


    /**********************************************************************/
    // Per Instance instantiations and assignments
    // Priority in decreasing order is embedded reconfig -> odi -> user AVMM -> JTAG
    /**********************************************************************/
    alt_xcvr_arbiter #(
          .width (total_masters)
    ) arbiter_inst (
          .clock (reconfig_clk[jg]),
          .req   ({jtag_read_write[jg], user_read_write_lcl[jg], odi_read_write[jg], strm_read_write[jg]}),
          .grant (grant[jg*total_masters+:total_masters])
    );
   
    // Assign the grant signal
    assign strm_grants[jg] = grant[jg*total_masters];
    
    // Use the grant as a mask for the varoius read and writs signals
    // if you or them all together, it will generate the read/write request if any are high
    // For streamer write/read condition - if broadcasting, wait for all channels to receive grant before asserting write/read
    assign avmm_write[jg] =  |(grant[jg*total_masters+:total_masters] & {jtag_write[jg], user_write[jg], odi_write[jg], ((~&strm_write | &strm_grants) & strm_write[jg])});
    assign avmm_read[jg]  =  |(grant[jg*total_masters+:total_masters] & {jtag_read[jg],  user_read[jg],  odi_read[jg],  ((~&strm_read  | &strm_grants) & strm_read[jg])});
    
    // Split the wait request, and if the grant is asserted to any one master, assert wait request to all others
    assign {jtag_waitrequest[jg], user_waitrequest[jg], odi_waitrequest[jg], strm_waitrequest[jg]} = (~grant[jg*total_masters+:total_masters] | {total_masters{avmm_waitrequest[jg]}});
    
    // Since thse are busses, the logic must be done in a bit-wise fashion; hence the for loop
    // Generate the address for the bus width 
    for(ig=0; ig<address_width;ig=ig+1) begin: g_avmm_address
      assign avmm_address[jg*address_width + ig] = |(grant[jg*total_masters+:total_masters] & {jtag_address[jg*address_width + ig], user_address[jg*address_width + ig], odi_address[jg*address_width + ig], strm_address[jg*address_width + ig]});
    end // End g_avmm_address
    
    // Generate the write data for the bus width
    for(ig=0; ig<data_width;ig=ig+1) begin: g_avmm_writdata
      assign avmm_writedata[jg*data_width+ ig] = |(grant[jg*total_masters+:total_masters] & {jtag_writedata[jg*data_width + ig], user_writedata[jg*data_width + ig],odi_writedata[jg*data_width + ig], strm_writedata[jg*data_width + ig]});
    end // End g_avmm_writedata
  
  end //End for channel-wise for loop
endgenerate // End generate 
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "gWvZQJuy3cgLOv0tRs1qUJ7l9DPIFHBslIjmReh83yW+6Fr8uwnXoVTcuGQwv0Q0whNK+r6SK6uHHBmHQVn/rw+C3atJKVAzL6ri4jktmdTUjwEnQWJyOkTnH6oYBLwlgnfl+Mr7p1SkVzsmd8ZhAdDlh+tBo8K6dynI2S9bBcxtVvMq9ES8ZVhRmmpTX4goGWMQ/UipnjBwEMXjHTUXk+HGvg38VjGHImYbxYmiX4Eq8ZZr/I9b59KX7ZOO1I2TGNxj+eAVLPKqwkjdl6/cC6YvPnDC11N6HzsNZe6WXkg3iOzVzTTi8aZxZP032Bcrm6Qgcr0fnEw7JbHEm+FudZK2FgvPbiEHj+BzDj+jdaRl+l9TlH37q6KziOF9iPPaxAoAMsgWjTvYr4uTYQNGSE4njzlWztjpcsKJaCxl2nlA89wvOeC19ebkcZNHZHU7EGu6LXSpKWWMpLMgtVUgjHr9+g8KtPTQwNQ4MqOdRtcylTFDX250UuG6xwqJwzTfuRf19ESndsvOccJ4Yga1VSpynkG+QuBROPNOPKWl181sAtc2tev1YARKIOl83S5YS866Ue/nRMSJmEE2BhiD5I/uFn8MCiBQXGflHRGA5PiY6aTETlR2lXzhcHba1OsVV8kwll8VTDN+aprxuhuX/mTeLQ1sLscnzilS+I+ngkILvXmRDsm09FRRYgiE8nMg+kHUWhj3/6r+HFXwklpHfGiLsXOzqi5C6cauJH6jiEjd2MnxGskkmz1cXxG6C7Fndj76WWPx76fUMD98OQbYKZ9FkGtnt9Q0vwWx8hc6yntkpdYhx3A1beMdKSOuaxhnP5OQj0MmW4dgZnYgJ+w/4eS1nMVmXJzHQOzcjBpcaeFTQ012jLidKPyUh2ArjT3ARbGbW4BL5LtMFZLjQLAv453I2HKLgWu/m5s6GrIuHoJS7wIVion6gKmZkxBcaJwS5EO85jDpI7KaYXr6DxHjLHOsjHMwFcCHxDddgvU6Hmm+30T9Hmp1/44D7Z05nBcp"
`endif