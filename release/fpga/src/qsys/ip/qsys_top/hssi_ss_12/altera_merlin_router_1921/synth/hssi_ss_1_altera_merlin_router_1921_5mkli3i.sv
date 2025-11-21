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


// $Id: //acds/rel/24.1/ip/iconnect/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2024/02/01 $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// the address.
//
// Also sets the binary-encoded destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

// ------------------------------------------
// Generation parameters:
//    decoder_type            0 (address decoder)
//    default_channel         7
//    default_destid          65
//    default_rd_channel      -1
//    default_wr_channel      -1
//    has_default_slave       0
//    memory_aliasing_decode  0
//    output_name             hssi_ss_1_altera_merlin_router_1921_5mkli3i
//    pkt_addr_h              67
//    pkt_addr_l              36
//    pkt_dest_id_h           100
//    pkt_dest_id_l           94
//    pkt_protection_h        104
//    pkt_protection_l        102
//    pkt_trans_read          71
//    pkt_trans_write         70
//    slaves_info             67:00000000000000000000000000000000000000000000000000000000000000001000000:0x1000000:0x1004000:both:1:0:0:1,70:00000000000000000000000000000000000000000000000000000000000010000000000:0x1004000:0x1004020:both:1:0:0:1,69:00000000000000000000000000000000000000000000000000000000000001000000000:0x1004020:0x1004040:both:1:0:0:1,4:00000000000000000000000000000000000000000000000000000000010000000000000:0x1004040:0x1004050:read:1:0:0:1,37:00000000000000000000000000000000000000000000000000000010000000000000000:0x1004050:0x1004060:read:1:0:0:1,40:00000000000000000000000000000000000000000000000000010000000000000000000:0x1004060:0x1004070:read:1:0:0:1,43:00000000000000000000000000000000000000000000000010000000000000000000000:0x1004070:0x1004080:read:1:0:0:1,46:00000000000000000000000000000000000000000000010000000000000000000000000:0x1004080:0x1004090:read:1:0:0:1,49:00000000000000000000000000000000000000000010000000000000000000000000000:0x1004090:0x10040a0:read:1:0:0:1,52:00000000000000000000000000000000000000010000000000000000000000000000000:0x10040a0:0x10040b0:read:1:0:0:1,55:00000000000000000000000000000000000010000000000000000000000000000000000:0x10040b0:0x10040c0:read:1:0:0:1,58:00000000000000000000000000000000010000000000000000000000000000000000000:0x10040c0:0x10040d0:read:1:0:0:1,61:00000000000000000000000000000010000000000000000000000000000000000000000:0x10040d0:0x10040e0:read:1:0:0:1,7:00000000000000000000000000010000000000000000000000000000000000000000000:0x10040e0:0x10040f0:read:1:0:0:1,10:00000000000000000000000010000000000000000000000000000000000000000000000:0x10040f0:0x1004100:read:1:0:0:1,13:00000000000000000000010000000000000000000000000000000000000000000000000:0x1004100:0x1004110:read:1:0:0:1,16:00000000000000000010000000000000000000000000000000000000000000000000000:0x1004110:0x1004120:read:1:0:0:1,19:00000000000000010000000000000000000000000000000000000000000000000000000:0x1004120:0x1004130:read:1:0:0:1,22:00000000000010000000000000000000000000000000000000000000000000000000000:0x1004130:0x1004140:read:1:0:0:1,25:00000000010000000000000000000000000000000000000000000000000000000000000:0x1004140:0x1004150:read:1:0:0:1,28:00000010000000000000000000000000000000000000000000000000000000000000000:0x1004150:0x1004160:read:1:0:0:1,31:00010000000000000000000000000000000000000000000000000000000000000000000:0x1004160:0x1004170:read:1:0:0:1,34:10000000000000000000000000000000000000000000000000000000000000000000000:0x1004170:0x1004180:read:1:0:0:1,5:00000000000000000000000000000000000000000000000000000000001000000000000:0x10041a0:0x10041b0:read:1:0:0:1,38:00000000000000000000000000000000000000000000000000000001000000000000000:0x10041b0:0x10041c0:read:1:0:0:1,41:00000000000000000000000000000000000000000000000000001000000000000000000:0x10041c0:0x10041d0:read:1:0:0:1,44:00000000000000000000000000000000000000000000000001000000000000000000000:0x10041d0:0x10041e0:read:1:0:0:1,47:00000000000000000000000000000000000000000000001000000000000000000000000:0x10041e0:0x10041f0:read:1:0:0:1,50:00000000000000000000000000000000000000000001000000000000000000000000000:0x10041f0:0x1004200:read:1:0:0:1,53:00000000000000000000000000000000000000001000000000000000000000000000000:0x1004200:0x1004210:read:1:0:0:1,56:00000000000000000000000000000000000001000000000000000000000000000000000:0x1004210:0x1004220:read:1:0:0:1,59:00000000000000000000000000000000001000000000000000000000000000000000000:0x1004220:0x1004230:read:1:0:0:1,62:00000000000000000000000000000001000000000000000000000000000000000000000:0x1004230:0x1004240:read:1:0:0:1,8:00000000000000000000000000001000000000000000000000000000000000000000000:0x1004240:0x1004250:read:1:0:0:1,11:00000000000000000000000001000000000000000000000000000000000000000000000:0x1004250:0x1004260:read:1:0:0:1,14:00000000000000000000001000000000000000000000000000000000000000000000000:0x1004260:0x1004270:read:1:0:0:1,17:00000000000000000001000000000000000000000000000000000000000000000000000:0x1004270:0x1004280:read:1:0:0:1,20:00000000000000001000000000000000000000000000000000000000000000000000000:0x1004280:0x1004290:read:1:0:0:1,23:00000000000001000000000000000000000000000000000000000000000000000000000:0x1004290:0x10042a0:read:1:0:0:1,26:00000000001000000000000000000000000000000000000000000000000000000000000:0x10042a0:0x10042b0:read:1:0:0:1,29:00000001000000000000000000000000000000000000000000000000000000000000000:0x10042b0:0x10042c0:read:1:0:0:1,32:00001000000000000000000000000000000000000000000000000000000000000000000:0x10042c0:0x10042d0:read:1:0:0:1,35:01000000000000000000000000000000000000000000000000000000000000000000000:0x10042d0:0x10042e0:read:1:0:0:1,6:00000000000000000000000000000000000000000000000000000000000100000000000:0x10042e0:0x10042f0:both:1:0:0:1,39:00000000000000000000000000000000000000000000000000000000100000000000000:0x10042f0:0x1004300:both:1:0:0:1,42:00000000000000000000000000000000000000000000000000000100000000000000000:0x1004300:0x1004310:both:1:0:0:1,45:00000000000000000000000000000000000000000000000000100000000000000000000:0x1004310:0x1004320:both:1:0:0:1,48:00000000000000000000000000000000000000000000000100000000000000000000000:0x1004320:0x1004330:both:1:0:0:1,51:00000000000000000000000000000000000000000000100000000000000000000000000:0x1004330:0x1004340:both:1:0:0:1,54:00000000000000000000000000000000000000000100000000000000000000000000000:0x1004340:0x1004350:both:1:0:0:1,57:00000000000000000000000000000000000000100000000000000000000000000000000:0x1004350:0x1004360:both:1:0:0:1,60:00000000000000000000000000000000000100000000000000000000000000000000000:0x1004360:0x1004370:both:1:0:0:1,63:00000000000000000000000000000000100000000000000000000000000000000000000:0x1004370:0x1004380:both:1:0:0:1,9:00000000000000000000000000000100000000000000000000000000000000000000000:0x1004380:0x1004390:both:1:0:0:1,12:00000000000000000000000000100000000000000000000000000000000000000000000:0x1004390:0x10043a0:both:1:0:0:1,15:00000000000000000000000100000000000000000000000000000000000000000000000:0x10043a0:0x10043b0:both:1:0:0:1,18:00000000000000000000100000000000000000000000000000000000000000000000000:0x10043b0:0x10043c0:both:1:0:0:1,21:00000000000000000100000000000000000000000000000000000000000000000000000:0x10043c0:0x10043d0:both:1:0:0:1,24:00000000000000100000000000000000000000000000000000000000000000000000000:0x10043d0:0x10043e0:both:1:0:0:1,27:00000000000100000000000000000000000000000000000000000000000000000000000:0x10043e0:0x10043f0:both:1:0:0:1,30:00000000100000000000000000000000000000000000000000000000000000000000000:0x10043f0:0x1004400:both:1:0:0:1,33:00000100000000000000000000000000000000000000000000000000000000000000000:0x1004400:0x1004410:both:1:0:0:1,36:00100000000000000000000000000000000000000000000000000000000000000000000:0x1004410:0x1004420:both:1:0:0:1,64:00000000000000000000000000000000000000000000000000000000000000000100000:0x1004420:0x1004430:both:1:0:0:1,66:00000000000000000000000000000000000000000000000000000000000000000000100:0x1004430:0x1004440:read:1:0:0:1,1:00000000000000000000000000000000000000000000000000000000000000000000010:0x1004440:0x1004450:read:1:0:0:1,0:00000000000000000000000000000000000000000000000000000000000000000010000:0x1004450:0x1004460:both:1:0:0:1,2:00000000000000000000000000000000000000000000000000000000000000000001000:0x1004460:0x1004470:both:1:0:0:1,3:00000000000000000000000000000000000000000000000000000000000000000000001:0x1004470:0x1004480:read:1:0:0:1,68:00000000000000000000000000000000000000000000000000000000000000100000000:0x1004480:0x1004488:both:1:0:0:1,65:00000000000000000000000000000000000000000000000000000000000000010000000:0x20000000:0x24000000:both:1:0:0:1
//    st_channel_w            71
//    st_data_w               132
// ------------------------------------------

module hssi_ss_1_altera_merlin_router_1921_5mkli3i_default_decode
  #(
     parameter DEFAULT_CHANNEL = 7,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 65 
   )
  (output [100 - 94 : 0] default_destination_id,
   output [71-1 : 0] default_wr_channel,
   output [71-1 : 0] default_rd_channel,
   output [71-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[100 - 94 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 71'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 71'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 71'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module hssi_ss_1_altera_merlin_router_1921_5mkli3i
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [132-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [132-1    : 0] src_data,
    output reg [71-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 100;
    localparam PKT_DEST_ID_L = 94;
    localparam PKT_PROTECTION_H = 104;
    localparam PKT_PROTECTION_L = 102;
    localparam ST_DATA_W = 132;
    localparam ST_CHANNEL_W = 71;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h24000000;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [71-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    hssi_ss_1_altera_merlin_router_1921_5mkli3i_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

        // slave 0: [0x1000000, 0x1004000) : sel [29:14]
        if ( {address[29:14],{14 {1'b0}}} == 30'h1000000   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 67;
        end

        // slave 1: [0x1004000, 0x1004020) : sel [29:5]
        if ( {address[29:5],{5 {1'b0}}} == 30'h1004000   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 70;
        end

        // slave 2: [0x1004020, 0x1004040) : sel [29:5]
        if ( {address[29:5],{5 {1'b0}}} == 30'h1004020   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 69;
        end

        // slave 3: [0x1004040, 0x1004050) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004040  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // slave 4: [0x1004050, 0x1004060) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004050  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 37;
        end

        // slave 5: [0x1004060, 0x1004070) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004060  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 40;
        end

        // slave 6: [0x1004070, 0x1004080) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004070  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 43;
        end

        // slave 7: [0x1004080, 0x1004090) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004080  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 46;
        end

        // slave 8: [0x1004090, 0x10040a0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004090  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 49;
        end

        // slave 9: [0x10040a0, 0x10040b0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10040a0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000010000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 52;
        end

        // slave 10: [0x10040b0, 0x10040c0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10040b0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000010000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 55;
        end

        // slave 11: [0x10040c0, 0x10040d0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10040c0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000010000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 58;
        end

        // slave 12: [0x10040d0, 0x10040e0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10040d0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000010000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 61;
        end

        // slave 13: [0x10040e0, 0x10040f0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10040e0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000010000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // slave 14: [0x10040f0, 0x1004100) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10040f0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000010000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
        end

        // slave 15: [0x1004100, 0x1004110) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004100  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000010000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
        end

        // slave 16: [0x1004110, 0x1004120) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004110  && read_transaction  ) begin
            src_channel = 71'b00000000000000000010000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
        end

        // slave 17: [0x1004120, 0x1004130) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004120  && read_transaction  ) begin
            src_channel = 71'b00000000000000010000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
        end

        // slave 18: [0x1004130, 0x1004140) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004130  && read_transaction  ) begin
            src_channel = 71'b00000000000010000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
        end

        // slave 19: [0x1004140, 0x1004150) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004140  && read_transaction  ) begin
            src_channel = 71'b00000000010000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
        end

        // slave 20: [0x1004150, 0x1004160) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004150  && read_transaction  ) begin
            src_channel = 71'b00000010000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 28;
        end

        // slave 21: [0x1004160, 0x1004170) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004160  && read_transaction  ) begin
            src_channel = 71'b00010000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 31;
        end

        // slave 22: [0x1004170, 0x1004180) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004170  && read_transaction  ) begin
            src_channel = 71'b10000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 34;
        end

        // slave 23: [0x10041a0, 0x10041b0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10041a0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // slave 24: [0x10041b0, 0x10041c0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10041b0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 38;
        end

        // slave 25: [0x10041c0, 0x10041d0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10041c0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 41;
        end

        // slave 26: [0x10041d0, 0x10041e0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10041d0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 44;
        end

        // slave 27: [0x10041e0, 0x10041f0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10041e0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 47;
        end

        // slave 28: [0x10041f0, 0x1004200) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10041f0  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 50;
        end

        // slave 29: [0x1004200, 0x1004210) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004200  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000001000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 53;
        end

        // slave 30: [0x1004210, 0x1004220) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004210  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000001000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 56;
        end

        // slave 31: [0x1004220, 0x1004230) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004220  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000001000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 59;
        end

        // slave 32: [0x1004230, 0x1004240) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004230  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000001000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 62;
        end

        // slave 33: [0x1004240, 0x1004250) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004240  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000001000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
        end

        // slave 34: [0x1004250, 0x1004260) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004250  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000001000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
        end

        // slave 35: [0x1004260, 0x1004270) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004260  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000001000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
        end

        // slave 36: [0x1004270, 0x1004280) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004270  && read_transaction  ) begin
            src_channel = 71'b00000000000000000001000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
        end

        // slave 37: [0x1004280, 0x1004290) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004280  && read_transaction  ) begin
            src_channel = 71'b00000000000000001000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
        end

        // slave 38: [0x1004290, 0x10042a0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004290  && read_transaction  ) begin
            src_channel = 71'b00000000000001000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
        end

        // slave 39: [0x10042a0, 0x10042b0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10042a0  && read_transaction  ) begin
            src_channel = 71'b00000000001000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 26;
        end

        // slave 40: [0x10042b0, 0x10042c0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10042b0  && read_transaction  ) begin
            src_channel = 71'b00000001000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 29;
        end

        // slave 41: [0x10042c0, 0x10042d0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10042c0  && read_transaction  ) begin
            src_channel = 71'b00001000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 32;
        end

        // slave 42: [0x10042d0, 0x10042e0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10042d0  && read_transaction  ) begin
            src_channel = 71'b01000000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 35;
        end

        // slave 43: [0x10042e0, 0x10042f0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10042e0   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // slave 44: [0x10042f0, 0x1004300) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10042f0   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 39;
        end

        // slave 45: [0x1004300, 0x1004310) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004300   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 42;
        end

        // slave 46: [0x1004310, 0x1004320) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004310   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 45;
        end

        // slave 47: [0x1004320, 0x1004330) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004320   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 48;
        end

        // slave 48: [0x1004330, 0x1004340) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004330   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 51;
        end

        // slave 49: [0x1004340, 0x1004350) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004340   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 54;
        end

        // slave 50: [0x1004350, 0x1004360) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004350   ) begin
            src_channel = 71'b00000000000000000000000000000000000000100000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 57;
        end

        // slave 51: [0x1004360, 0x1004370) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004360   ) begin
            src_channel = 71'b00000000000000000000000000000000000100000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 60;
        end

        // slave 52: [0x1004370, 0x1004380) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004370   ) begin
            src_channel = 71'b00000000000000000000000000000000100000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 63;
        end

        // slave 53: [0x1004380, 0x1004390) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004380   ) begin
            src_channel = 71'b00000000000000000000000000000100000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
        end

        // slave 54: [0x1004390, 0x10043a0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004390   ) begin
            src_channel = 71'b00000000000000000000000000100000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
        end

        // slave 55: [0x10043a0, 0x10043b0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10043a0   ) begin
            src_channel = 71'b00000000000000000000000100000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
        end

        // slave 56: [0x10043b0, 0x10043c0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10043b0   ) begin
            src_channel = 71'b00000000000000000000100000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
        end

        // slave 57: [0x10043c0, 0x10043d0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10043c0   ) begin
            src_channel = 71'b00000000000000000100000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
        end

        // slave 58: [0x10043d0, 0x10043e0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10043d0   ) begin
            src_channel = 71'b00000000000000100000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
        end

        // slave 59: [0x10043e0, 0x10043f0) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10043e0   ) begin
            src_channel = 71'b00000000000100000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 27;
        end

        // slave 60: [0x10043f0, 0x1004400) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h10043f0   ) begin
            src_channel = 71'b00000000100000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 30;
        end

        // slave 61: [0x1004400, 0x1004410) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004400   ) begin
            src_channel = 71'b00000100000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 33;
        end

        // slave 62: [0x1004410, 0x1004420) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004410   ) begin
            src_channel = 71'b00100000000000000000000000000000000000000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 36;
        end

        // slave 63: [0x1004420, 0x1004430) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004420   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 64;
        end

        // slave 64: [0x1004430, 0x1004440) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004430  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 66;
        end

        // slave 65: [0x1004440, 0x1004450) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004440  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end

        // slave 66: [0x1004450, 0x1004460) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004450   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
        end

        // slave 67: [0x1004460, 0x1004470) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004460   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // slave 68: [0x1004470, 0x1004480) : sel [29:4]
        if ( {address[29:4],{4 {1'b0}}} == 30'h1004470  && read_transaction  ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // slave 69: [0x1004480, 0x1004488) : sel [29:3]
        if ( {address[29:3],{3 {1'b0}}} == 30'h1004480   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 68;
        end

        // slave 70: [0x20000000, 0x24000000) : sel [29:26]
        if ( {address[29:26],{26 {1'b0}}} == 30'h20000000   ) begin
            src_channel = 71'b00000000000000000000000000000000000000000000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 65;
        end
    end


    // --------------------------------------------------
    // Ceil(log2()) function
    // It's the 21st century. Consider using $clog2().
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


