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
//    default_channel         2
//    default_destid          0
//    default_rd_channel      -1
//    default_wr_channel      -1
//    has_default_slave       0
//    memory_aliasing_decode  0
//    output_name             qsys_top_altera_merlin_router_1921_rx2ukqy
//    pkt_addr_h              175
//    pkt_addr_l              144
//    pkt_dest_id_h           225
//    pkt_dest_id_l           222
//    pkt_protection_h        232
//    pkt_protection_l        230
//    pkt_trans_read          179
//    pkt_trans_write         178
//    slaves_info             3:000000000001:0x0:0x4000000:write:1:0:0:1,5:001000000000:0x4000000:0x4040000:both:1:0:0:1,10:000000100000:0x4040000:0x4040040:both:1:0:0:1,9:100000000000:0x4040040:0x4040050:both:1:0:0:1,8:010000000000:0x4040050:0x4040060:both:1:0:0:1,2:000100000000:0x4040060:0x4040070:both:1:0:0:1,11:000001000000:0x4040100:0x4040200:both:1:0:0:1,1:000000000010:0x4480000:0x4480100:both:1:0:0:1,6:000000001000:0x5000000:0x5800000:both:1:0:0:1,7:000010000000:0x5800000:0x5820000:both:1:0:0:1,4:000000010000:0x6000000:0x6800000:both:1:0:0:1,0:000000000100:0x10000000:0x20000000:both:1:0:0:1
//    st_channel_w            13
//    st_data_w               266
// ------------------------------------------

module qsys_top_altera_merlin_router_1921_rx2ukqy_default_decode
  #(
     parameter DEFAULT_CHANNEL = 2,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 0 
   )
  (output [225 - 222 : 0] default_destination_id,
   output [13-1 : 0] default_wr_channel,
   output [13-1 : 0] default_rd_channel,
   output [13-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[225 - 222 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 13'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 13'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 13'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module qsys_top_altera_merlin_router_1921_rx2ukqy
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
    input  [266-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [266-1    : 0] src_data,
    output reg [13-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 175;
    localparam PKT_ADDR_L = 144;
    localparam PKT_DEST_ID_H = 225;
    localparam PKT_DEST_ID_L = 222;
    localparam PKT_PROTECTION_H = 232;
    localparam PKT_PROTECTION_L = 230;
    localparam ST_DATA_W = 266;
    localparam ST_CHANNEL_W = 13;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 178;
    localparam PKT_TRANS_READ  = 179;

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
    localparam ADDR_RANGE = 64'h20000000;
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
    wire [13-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire write_transaction;
    assign write_transaction = sink_data[PKT_TRANS_WRITE];


    qsys_top_altera_merlin_router_1921_rx2ukqy_default_decode the_default_decode(
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

        // slave 0: [0x0, 0x4000000) : sel [28:26]
        if ( {address[28:26],{26 {1'b0}}} == 29'h0  && write_transaction  ) begin
            src_channel = 13'b000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // slave 1: [0x4000000, 0x4040000) : sel [28:18]
        if ( {address[28:18],{18 {1'b0}}} == 29'h4000000   ) begin
            src_channel = 13'b001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // slave 2: [0x4040000, 0x4040040) : sel [28:6]
        if ( {address[28:6],{6 {1'b0}}} == 29'h4040000   ) begin
            src_channel = 13'b000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
        end

        // slave 3: [0x4040040, 0x4040050) : sel [28:4]
        if ( {address[28:4],{4 {1'b0}}} == 29'h4040040   ) begin
            src_channel = 13'b100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
        end

        // slave 4: [0x4040050, 0x4040060) : sel [28:4]
        if ( {address[28:4],{4 {1'b0}}} == 29'h4040050   ) begin
            src_channel = 13'b010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
        end

        // slave 5: [0x4040060, 0x4040070) : sel [28:4]
        if ( {address[28:4],{4 {1'b0}}} == 29'h4040060   ) begin
            src_channel = 13'b000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // slave 6: [0x4040100, 0x4040200) : sel [28:8]
        if ( {address[28:8],{8 {1'b0}}} == 29'h4040100   ) begin
            src_channel = 13'b000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
        end

        // slave 7: [0x4480000, 0x4480100) : sel [28:8]
        if ( {address[28:8],{8 {1'b0}}} == 29'h4480000   ) begin
            src_channel = 13'b000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end

        // slave 8: [0x5000000, 0x5800000) : sel [28:23]
        if ( {address[28:23],{23 {1'b0}}} == 29'h5000000   ) begin
            src_channel = 13'b000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // slave 9: [0x5800000, 0x5820000) : sel [28:17]
        if ( {address[28:17],{17 {1'b0}}} == 29'h5800000   ) begin
            src_channel = 13'b000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // slave 10: [0x6000000, 0x6800000) : sel [28:23]
        if ( {address[28:23],{23 {1'b0}}} == 29'h6000000   ) begin
            src_channel = 13'b000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // slave 11: [0x10000000, 0x20000000) : sel [28:28]
        if ( {address[28:28],{28 {1'b0}}} == 29'h10000000   ) begin
            src_channel = 13'b000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
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


