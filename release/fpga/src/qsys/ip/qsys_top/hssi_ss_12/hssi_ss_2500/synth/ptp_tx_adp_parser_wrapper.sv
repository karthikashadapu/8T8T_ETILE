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


// Copyright 2021-2022 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

module ptp_tx_adp_parser_wrapper #(
    parameter  int LOG2_DATA_WIDTH               = 9
   ,parameter  int LOG2_EXTRACT_FIELD_BYTE_WIDTH = 2
   ,parameter  int TUSER_WIDTH                   = 1
   ,parameter  int ENABLE_STATS_CNTRS            = 1
   ,parameter  int BASE_OFFSET                   = 16'h100
   ,parameter  int AXIS_DATA_LIT_ENDIAN_EN       = 1
   ,parameter  int MEM_BASED_STATS_EN            = 1
   ,parameter  int IN_OFFSET_BYTE_WIDTH          = 8
   ,parameter  int CONST_PARSER_LATENCY          = 0 //0-parser has constant latency, 1-source can rise valid when !in_axis_TREADY
   ,localparam int RESULT_LENGTH                 = 16
   ,localparam int FAR_PATTERN_BYTE_OFFSET       = ptp_tx_adp_packet_parser_auto_pkg::FAR_PATTERN_BYTE_OFFSET //should count possible in offset too!!!!
   ,localparam int FAR_EXT_OFFSET                = ptp_tx_adp_packet_parser_auto_pkg::FAR_PATTERN_BYTE_OFFSET + 2 + 8//source of bugs, should be automatically derived from json !!!!
   ,localparam int DETECTING_CHAINS_NUMBER       = ptp_tx_adp_packet_parser_auto_pkg::DETECTING_CHAINS_NUMBER
   ,localparam int RESULT_NUM                    = ptp_tx_adp_packet_parser_auto_pkg::RESULT_NUM
   ,localparam int EXTRACT_CMD_NUM               = ptp_tx_adp_packet_parser_auto_pkg::EXTRACT_CMD_NUM
   ,localparam int HEADER_ATTRIBUTES_NUMBER      = ptp_tx_adp_packet_parser_auto_pkg::HEADER_ATTRIBUTES_NUMBER
   ,localparam int EXTRACT_FIELD_WIDTH           = 2**LOG2_EXTRACT_FIELD_BYTE_WIDTH
   ,localparam int ADDITIONAL_REGS_NUM           = 2
   ,localparam int RESULT_PKTS_NUM_WIDTH         = parser_pkg::get_width(DETECTING_CHAINS_NUMBER)
   ,localparam int REGISTERS_NUM                 = DETECTING_CHAINS_NUMBER + ADDITIONAL_REGS_NUM
   ,localparam int AXI_SL_ADDR_WIDTH             = parser_pkg::get_width(BASE_OFFSET + (REGISTERS_NUM * 2 * 4))
   ,localparam int AXI_SL_DATA_WIDTH             = 32
   ,localparam int AXI_SL_RESP_WIDTH             = 2
   ,localparam int AXI_SL_STRB_WIDTH             = AXI_SL_DATA_WIDTH / 8
) (
    input  logic                                                         clk
   ,input  logic                                                         rst_n
   ,input  logic                                                         axi_sl_clk
   ,input  logic                                                         axi_sl_rst_n

   ,input  logic [IN_OFFSET_BYTE_WIDTH - 1:0]                            in_prev_offset
   //AXIs sink/input
   ,output logic                                                         in_axis_TREADY
   ,input  logic                                                         in_axis_TVALID
   ,input  logic                                                         in_axis_TLAST
   ,input  logic [2**LOG2_DATA_WIDTH - 1:0]                              in_axis_TDATA
   ,input  logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]                        in_axis_TKEEP
   ,input  logic [TUSER_WIDTH - 1:0]                                     in_axis_TUSER
   //AXIs source/output
   ,input  logic                                                         out_axis_TREADY
   ,output logic                                                         out_axis_TVALID
   ,output logic                                                         out_axis_TLAST
   ,output logic [2**LOG2_DATA_WIDTH - 1:0]                              out_axis_TDATA
   ,output logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]                        out_axis_TKEEP
   ,output logic [TUSER_WIDTH - 1:0]                                     out_axis_TUSER
   //AXI slave Write Address Channel
   ,output logic                                                         axi_sl_AWREADY
   ,input  logic                                                         axi_sl_AWVALID
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]                               axi_sl_AWADDR
   //AXI slave Write Data Channel
   ,output logic                                                         axi_sl_WREADY
   ,input  logic                                                         axi_sl_WVALID
   ,input  logic [AXI_SL_STRB_WIDTH - 1:0]                               axi_sl_WSTRB
   ,input  logic [AXI_SL_DATA_WIDTH - 1:0]                               axi_sl_WDATA
   //AXI slave Write Response Channel
   ,input  logic                                                         axi_sl_BREADY
   ,output logic                                                         axi_sl_BVALID
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]                               axi_sl_BRESP
   //AXI slave Read Address Channel
   ,output logic                                                         axi_sl_ARREADY
   ,input  logic                                                         axi_sl_ARVALID
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]                               axi_sl_ARADDR
   //AXI slave Read Data Channel
   ,input  logic                                                         axi_sl_RREADY
   ,output logic                                                         axi_sl_RVALID
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]                               axi_sl_RRESP
   ,output logic [AXI_SL_DATA_WIDTH - 1:0]                               axi_sl_RDATA
   //result
   ,output logic                                                         o_parser_result_valid
   ,output logic                                                         o_parser_result_pkt_recognized
   ,output logic [RESULT_PKTS_NUM_WIDTH - 1:0]                           o_parser_result_pkt_num
   ,output logic [RESULT_NUM - 1:0][RESULT_LENGTH - 1:0]                 o_parser_result_data
   ,output logic [EXTRACT_CMD_NUM - 1:0][EXTRACT_FIELD_WIDTH - 1:0][7:0] o_parser_result_ext_data
);

   localparam int HEADER_OFFSET_SIZE = parser_pkg::get_width(FAR_PATTERN_BYTE_OFFSET) + 1;

   typedef struct packed {
      logic valid;
      logic pkt_recognized;
   } p_result_t;

   typedef struct packed {
      logic [HEADER_OFFSET_SIZE - 1:0] offset;
      logic [1:0]                      size; //0 - first nibble of the byte,  1 - 1byte, 2 - 2bytes
      logic [1:0][7:0]                 data; //max.footprint
   } header_attributes_t;

   logic [2**LOG2_DATA_WIDTH - 1:0]                     axis_TDATA_in;
   logic [2**LOG2_DATA_WIDTH - 1:0]                     axis_TDATA_out;

   logic                                                axis_TREADY;
   logic                                                axis_TVALID;
   logic                                                axis_TLAST;
   logic [2**LOG2_DATA_WIDTH - 1:0]                     axis_TDATA;
   logic [2**(LOG2_DATA_WIDTH - 3) - 1:0]               axis_TKEEP;
   logic [TUSER_WIDTH - 1:0]                            axis_TUSER;

   header_attributes_t [HEADER_ATTRIBUTES_NUMBER - 1:0] header_attributes;
   logic [HEADER_ATTRIBUTES_NUMBER - 1:0]               pkt_type_classifiers[DETECTING_CHAINS_NUMBER];
   logic [RESULT_PKTS_NUM_WIDTH - 1:0]                  result_pkts_num[DETECTING_CHAINS_NUMBER];
   logic [RESULT_NUM - 1:0][DETECTING_CHAINS_NUMBER - 1:0][RESULT_LENGTH - 1:0] parser_result;
   logic [EXTRACT_CMD_NUM - 1:0][DETECTING_CHAINS_NUMBER - 1:0][RESULT_LENGTH - 1:0] extract_cmd;

   p_result_t                                           p_result, p_result_out;
   logic [RESULT_PKTS_NUM_WIDTH - 1:0]                  p_parser_result_pkt_num;
   logic [EXTRACT_CMD_NUM - 1:0][RESULT_LENGTH - 1:0]   p_result_extract_cmd;

// synthesis translate_off
   int deb_pkt_num;
   logic sop;

   //SOP detecting
   always_ff@(posedge clk) begin
      if(in_axis_TREADY) begin
         if(!in_axis_TVALID) begin
            sop <= '1;
         end else if(in_axis_TVALID && in_axis_TLAST) begin
            sop <= '1;
         end else if(in_axis_TVALID) begin
            sop <= '0;
         end
      end
   end

   //debug cntrs
   always_ff@(posedge clk) begin
      if(!rst_n) begin
         deb_pkt_num <= '0;
      end else if(in_axis_TREADY && in_axis_TVALID && sop) begin
         deb_pkt_num <= deb_pkt_num + 1;
      end
   end
// synthesis translate_on

   if(LOG2_DATA_WIDTH != 6 && LOG2_DATA_WIDTH != 7 && LOG2_DATA_WIDTH != 8 && LOG2_DATA_WIDTH != 9 && LOG2_DATA_WIDTH != 10) begin
// synthesis translate_off
      initial begin
         $display("ERROR: Unsuported AXI-S bus size. Supported sizes: 64b, 128b, 256b, 512b");
         $stop;
      end
// synthesis translate_on
      instantiated_with_wrong_parameters_error_see_comment_above
      axi_s_buswidth_check ( .error(1'b1) );
   end

   if(AXIS_DATA_LIT_ENDIAN_EN) begin
      always_comb begin
         axis_TDATA_in = {<<8{in_axis_TDATA}};
         out_axis_TDATA = {<<8{axis_TDATA_out}};
      end
   end else begin
      always_comb begin
         axis_TDATA_in = in_axis_TDATA;
         out_axis_TDATA = axis_TDATA_out;
      end
   end

   `include "ptp_tx_adp_packet_parser_auto_config.vh"

   parser_el #(
       .LOG2_DATA_WIDTH                (LOG2_DATA_WIDTH)
      ,.LOG2_EXTRACT_FIELD_BYTE_WIDTH  (LOG2_EXTRACT_FIELD_BYTE_WIDTH)
      ,.TUSER_WIDTH                    (TUSER_WIDTH)
      ,.RESULT_PKTS_NUM_WIDTH          (RESULT_PKTS_NUM_WIDTH)
      ,.EXTRACT_CMD_NUM                (EXTRACT_CMD_NUM)
      ,.IN_OFFSET_BYTE_WIDTH           (IN_OFFSET_BYTE_WIDTH)
      ,.FAR_EXT_OFFSET                 (FAR_EXT_OFFSET)
      ,.DETECTING_CHAINS_NUMBER        (DETECTING_CHAINS_NUMBER)
      ,.FAR_PATTERN_BYTE_OFFSET        (FAR_PATTERN_BYTE_OFFSET)
      ,.HEADER_ATTRIBUTES_NUMBER       (HEADER_ATTRIBUTES_NUMBER)
      ,.RESULT_NUM                     (RESULT_NUM)
      ,.HEADER_ATTRIBUTES_SIZE         ($bits(header_attributes))
      ,.CONST_PARSER_LATENCY           (CONST_PARSER_LATENCY)
   ) el (
       .clk                            (clk)
      ,.rst                            (~rst_n)

      ,.in_prev_offset                 (in_prev_offset)
      ,.in_header_attributes           (header_attributes)
      ,.in_pkt_type_classifiers        (pkt_type_classifiers)
      ,.in_result_pkts_num             (result_pkts_num)
      ,.in_result                      (parser_result)
      ,.in_extract_cmd                 (extract_cmd)
      //AXIs sink/input
      ,.in_axis_TREADY                 (in_axis_TREADY)
      ,.in_axis_TVALID                 (in_axis_TVALID)
      ,.in_axis_TLAST                  (in_axis_TLAST)
      ,.in_axis_TDATA                  (axis_TDATA_in)
      ,.in_axis_TKEEP                  (in_axis_TKEEP)
      ,.in_axis_TUSER                  (in_axis_TUSER)
      //AXIs source/output
      ,.out_axis_TREADY                (out_axis_TREADY)
      ,.out_axis_TVALID                (out_axis_TVALID)
      ,.out_axis_TLAST                 (out_axis_TLAST)
      ,.out_axis_TDATA                 (axis_TDATA_out)
      ,.out_axis_TKEEP                 (out_axis_TKEEP)
      ,.out_axis_TUSER                 (out_axis_TUSER)
      //result
      ,.o_parser_result_valid          (o_parser_result_valid)
      ,.o_parser_result_pkt_recognized (o_parser_result_pkt_recognized)
      ,.o_parser_result_data           (o_parser_result_data)
      ,.o_parser_result_pkt_num        (o_parser_result_pkt_num)
      ,.o_parser_result_ext_data       (o_parser_result_ext_data)
   );

   if(ENABLE_STATS_CNTRS) begin : regs_enabled
      parser_regs_wrapper #(
          .DETECTING_CHAINS_NUMBER       (DETECTING_CHAINS_NUMBER)
         ,.CNT_WIDTH                     (48)
         ,.BASE_OFFSET                   (BASE_OFFSET)
         ,.MEM_BASED_STATS_EN            (MEM_BASED_STATS_EN)
      ) parser_regs (
          .clk                           (clk)
         ,.rst_n                         (rst_n)
         ,.axi_sl_clk                    (axi_sl_clk)
         ,.axi_sl_rst_n                  (axi_sl_rst_n)
         //AXI slave Write Address Channel
         ,.axi_sl_awready                (axi_sl_AWREADY)
         ,.axi_sl_awvalid                (axi_sl_AWVALID)
         ,.axi_sl_awaddr                 (axi_sl_AWADDR)
         //AXI slave Write Data Channel
         ,.axi_sl_wready                 (axi_sl_WREADY)
         ,.axi_sl_wvalid                 (axi_sl_WVALID)
         ,.axi_sl_wstrb                  (axi_sl_WSTRB)
         ,.axi_sl_wdata                  (axi_sl_WDATA)
         //AXI slave Write Response Channel
         ,.axi_sl_bready                 (axi_sl_BREADY)
         ,.axi_sl_bvalid                 (axi_sl_BVALID)
         ,.axi_sl_bresp                  (axi_sl_BRESP)
         //AXI slave Read Address Channel
         ,.axi_sl_arready                (axi_sl_ARREADY)
         ,.axi_sl_arvalid                (axi_sl_ARVALID)
         ,.axi_sl_araddr                 (axi_sl_ARADDR)
         //AXI slave Read Data Channel
         ,.axi_sl_rready                 (axi_sl_RREADY)
         ,.axi_sl_rvalid                 (axi_sl_RVALID)
         ,.axi_sl_rresp                  (axi_sl_RRESP)
         ,.axi_sl_rdata                  (axi_sl_RDATA)
         //parser result
         ,.i_parser_result_valid         (out_axis_TREADY & o_parser_result_valid)
         ,.i_parser_result_pkt_recognized(o_parser_result_pkt_recognized)
         ,.i_parser_result_pkt_num       (o_parser_result_pkt_num)
      );
   end else begin : regs_disabled
      always_comb begin
         axi_sl_AWREADY = '1;
         axi_sl_WREADY = '1;
         axi_sl_ARREADY = '1;

         axi_sl_RRESP = '0;
         axi_sl_BRESP = '0;

         axi_sl_RDATA <= 32'hDEADC0DE;
      end

      always_ff@(posedge axi_sl_clk) begin
         axi_sl_BVALID <= axi_sl_WVALID;
         axi_sl_RVALID <= axi_sl_ARVALID;
      end
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRg/RuVhccpTEPyPm+gTsuO5U/I7UCVzdFZer36tPrvakX0jCcqKc7lG9wFZvSOKwBFUJPCZcxUqPc41QkfewZaOIOgJVvrrif330zHd8xNv9oRDAtPJfeB+oUIFCgxJdcd2RUKjNUkLdP96tWiiU1anaAN+pvEy0tL0Cq5LQEW2waVe9miRMeMoaSbJgxXPXq/bdagJIua3ZBmNuqp8Lx+wnXdoMfXfvpHTfzxwsA/VTlThYgwPTRZPtvS8+TGY/Q6JNxBKD5cqd1SJnRtSafskIBNdOpFzOPs9AeX+x17XBs1SV83jGkkqnij6sRGTHcs959+dYCxJg84ulH5Lbbvo7mjBSkJFlj6ZY8igKCzVwdq39It4hLKx+9k90jQ+/sWy2DI1ERItqKCb2zZ9xtLqXp44d6duFf1/slPD+ucv5s7SignEwKDEndbQugl9GPmnFc21Y6jRsw/ScLU49l3yzeKKUNTIcfTjanYoP86DUa7zQULEHDR6npGSJg7sf78p7MIM8GGnMy+yySJ1Jdor18fxZufz+spcnSLEpJ7B/Bf/w5HVCAYqKYOpVEOG4IKj5h+SycwkXqYtHHMVPRKCTQUXF2nZqzfAXI3oOktFwEnqVs53Nhl1lRTCif/GONcbNWwe6M1YHlBejkjRJmd0yrVNYbt/SZnh6vF/3Fsi4OyV+o7gOijNXl810RVwknVzDJGjJosIZ9VSOlULuoL9vcQcf/W5+HZkZ9Es6w03LAP7rZFRcvTABfwfYpE1hfgB+eBndl9aOvP0GNxS5S3J"
`endif