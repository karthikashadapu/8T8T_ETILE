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
//    default_channel         -1
//    default_destid          0
//    default_rd_channel      1
//    default_wr_channel      0
//    has_default_slave       1
//    memory_aliasing_decode  1
//    output_name             hssi_ss_1_altera_merlin_router_1921_obd62ei
//    pkt_addr_h              61
//    pkt_addr_l              36
//    pkt_dest_id_h           100
//    pkt_dest_id_l           96
//    pkt_protection_h        104
//    pkt_protection_l        102
//    pkt_trans_read          65
//    pkt_trans_write         64
//    slaves_info             16:0000000000010000000000:0x0:0x200:both:1:0:0:1,2:0000000000100000000000:0x200000:0x204000:both:1:0:0:1,6:0010000000000000000000:0x204000:0x204400:both:1:0:0:1,1:0000001000000000000000:0x240000:0x260000:both:1:0:0:1,5:0000000000000000000100:0x261100:0x261200:write:1:0:0:1,5:0000000000000000001000:0x261100:0x261200:read:1:0:0:1,8:0000000001000000000000:0x400000:0x404000:both:1:0:0:1,7:0000010000000000000000:0x440000:0x460000:both:1:0:0:1,9:0000000000000000010000:0x461100:0x461200:write:1:0:0:1,9:0000000000000000100000:0x461100:0x461200:read:1:0:0:1,11:0000000010000000000000:0x600000:0x604000:both:1:0:0:1,10:0000100000000000000000:0x640000:0x660000:both:1:0:0:1,12:0000000000000001000000:0x661100:0x661200:write:1:0:0:1,12:0000000000000010000000:0x661100:0x661200:read:1:0:0:1,14:0000000100000000000000:0x800000:0x804000:both:1:0:0:1,13:0001000000000000000000:0x840000:0x860000:both:1:0:0:1,15:0000000000000100000000:0x861100:0x861200:write:1:0:0:1,15:0000000000001000000000:0x861100:0x861200:read:1:0:0:1,3:0100000000000000000000:0xa40000:0xa60000:both:1:0:0:1,4:1000000000000000000000:0xc40000:0xc60000:both:1:0:0:1
//    st_channel_w            22
//    st_data_w               138
// ------------------------------------------

module hssi_ss_1_altera_merlin_router_1921_obd62ei_default_decode
  #(
     parameter DEFAULT_CHANNEL = -1,
               DEFAULT_WR_CHANNEL = 0,
               DEFAULT_RD_CHANNEL = 1,
               DEFAULT_DESTID = 0 
   )
  (output [100 - 96 : 0] default_destination_id,
   output [22-1 : 0] default_wr_channel,
   output [22-1 : 0] default_rd_channel,
   output [22-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[100 - 96 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 22'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 22'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 22'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module hssi_ss_1_altera_merlin_router_1921_obd62ei
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
    input  [138-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [138-1    : 0] src_data,
    output reg [22-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 61;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 100;
    localparam PKT_DEST_ID_L = 96;
    localparam PKT_PROTECTION_H = 104;
    localparam PKT_PROTECTION_L = 102;
    localparam ST_DATA_W = 138;
    localparam ST_CHANNEL_W = 22;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 64;
    localparam PKT_TRANS_READ  = 65;

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
    localparam ADDR_RANGE = 64'hc60000;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;
    localparam ADDRESS_ALIASING_W = PKT_ADDR_H > OPTIMIZED_ADDR_H + 1 ? PKT_ADDR_H - OPTIMIZED_ADDR_H - 1 : 0;

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
    wire [22-1 : 0] default_rd_channel;
    wire [22-1 : 0] default_wr_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    hssi_ss_1_altera_merlin_router_1921_obd62ei_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (default_wr_channel),
      .default_rd_channel   (default_rd_channel),
      .default_src_channel  ()
    );

    always @* begin
        src_data    = sink_data;
        src_channel = write_transaction ? default_wr_channel : default_rd_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address aliasing will be routed to default slave (if present)
        // --------------------------------------------------
        if ( PKT_ADDR_H == OPTIMIZED_ADDR_H || 
             (|sink_data[PKT_ADDR_H:PKT_ADDR_H - ADDRESS_ALIASING_W] == 0) ) begin

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

        // slave 0: [0x0, 0x200) : sel [23:9]
        if ( {address[23:9],{9 {1'b0}}} == 24'h0   ) begin
            src_channel = 22'b0000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
        end

        // slave 1: [0x200000, 0x204000) : sel [23:14]
        if ( {address[23:14],{14 {1'b0}}} == 24'h200000   ) begin
            src_channel = 22'b0000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // slave 2: [0x204000, 0x204400) : sel [23:10]
        if ( {address[23:10],{10 {1'b0}}} == 24'h204000   ) begin
            src_channel = 22'b0010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // slave 3: [0x240000, 0x260000) : sel [23:17]
        if ( {address[23:17],{17 {1'b0}}} == 24'h240000   ) begin
            src_channel = 22'b0000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end

        // slave 4: [0x261100, 0x261200) : sel [23:8]
        if ( {address[23:8],{8 {1'b0}}} == 24'h261100  && write_transaction  ) begin
            src_channel = 22'b0000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // slave 5: [0x261100, 0x261200) : sel [23:8]
        if ( {address[23:8],{8 {1'b0}}} == 24'h261100  && read_transaction  ) begin
            src_channel = 22'b0000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // slave 6: [0x400000, 0x404000) : sel [23:14]
        if ( {address[23:14],{14 {1'b0}}} == 24'h400000   ) begin
            src_channel = 22'b0000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
        end

        // slave 7: [0x440000, 0x460000) : sel [23:17]
        if ( {address[23:17],{17 {1'b0}}} == 24'h440000   ) begin
            src_channel = 22'b0000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // slave 8: [0x461100, 0x461200) : sel [23:8]
        if ( {address[23:8],{8 {1'b0}}} == 24'h461100  && write_transaction  ) begin
            src_channel = 22'b0000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
        end

        // slave 9: [0x461100, 0x461200) : sel [23:8]
        if ( {address[23:8],{8 {1'b0}}} == 24'h461100  && read_transaction  ) begin
            src_channel = 22'b0000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
        end

        // slave 10: [0x600000, 0x604000) : sel [23:14]
        if ( {address[23:14],{14 {1'b0}}} == 24'h600000   ) begin
            src_channel = 22'b0000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
        end

        // slave 11: [0x640000, 0x660000) : sel [23:17]
        if ( {address[23:17],{17 {1'b0}}} == 24'h640000   ) begin
            src_channel = 22'b0000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
        end

        // slave 12: [0x661100, 0x661200) : sel [23:8]
        if ( {address[23:8],{8 {1'b0}}} == 24'h661100  && write_transaction  ) begin
            src_channel = 22'b0000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
        end

        // slave 13: [0x661100, 0x661200) : sel [23:8]
        if ( {address[23:8],{8 {1'b0}}} == 24'h661100  && read_transaction  ) begin
            src_channel = 22'b0000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
        end

        // slave 14: [0x800000, 0x804000) : sel [23:14]
        if ( {address[23:14],{14 {1'b0}}} == 24'h800000   ) begin
            src_channel = 22'b0000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
        end

        // slave 15: [0x840000, 0x860000) : sel [23:17]
        if ( {address[23:17],{17 {1'b0}}} == 24'h840000   ) begin
            src_channel = 22'b0001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
        end

        // slave 16: [0x861100, 0x861200) : sel [23:8]
        if ( {address[23:8],{8 {1'b0}}} == 24'h861100  && write_transaction  ) begin
            src_channel = 22'b0000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
        end

        // slave 17: [0x861100, 0x861200) : sel [23:8]
        if ( {address[23:8],{8 {1'b0}}} == 24'h861100  && read_transaction  ) begin
            src_channel = 22'b0000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
        end

        // slave 18: [0xa40000, 0xa60000) : sel [23:17]
        if ( {address[23:17],{17 {1'b0}}} == 24'ha40000   ) begin
            src_channel = 22'b0100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // slave 19: [0xc40000, 0xc60000) : sel [23:17]
        if ( {address[23:17],{17 {1'b0}}} == 24'hc40000   ) begin
            src_channel = 22'b1000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end
        end // end for if-else for memory aliasing decode
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


