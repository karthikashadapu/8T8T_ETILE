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


// Copyright 2022-2022 Intel Corporation.
//
// This software and the related documents are Intel copyrighted materials, and
// your use of them is governed by the express license under which they were
// provided to you ("License"). Unless the License provides otherwise, you may
// not use, modify, copy, publish, distribute, disclose or transmit this
// software or the related documents without Intel's prior written permission.
// This software and the related documents are provided as is, with no express
// or implied warranties, other than those that are expressly stated in the
// License.

(* altera_attribute = {"\
   -name SDC_STATEMENT \"set_false_path -to   [get_registers *axil_const*_sync*]\"\
"} *)

module axil_const #(
    parameter  int BASE_OFFSET             = 16'h100
   ,parameter  int AXI_SL_ADDR_WIDTH       = parser_pkg::get_width(BASE_OFFSET+1)
   ,parameter  int PREAMBLE_EN             = 0
   ,localparam int AXI_SL_DATA_WIDTH       = 32
   ,localparam int AXI_SL_RESP_WIDTH       = 2
   ,localparam int AXI_SL_STRB_WIDTH       = AXI_SL_DATA_WIDTH / 8
) (
    input  logic                               clk
   ,input  logic                               axi_sl_clk
   ,input  logic                               axi_sl_rst_n
   //low rate AXI slave Write Address Channel
   ,output logic                               axi_sl_awready
   ,input  logic                               axi_sl_awvalid
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]     axi_sl_awaddr
   //low rate AXI slave Write Data Channel
   ,output logic                               axi_sl_wready
   ,input  logic                               axi_sl_wvalid
   ,input  logic [AXI_SL_STRB_WIDTH - 1:0]     axi_sl_wstrb
   ,input  logic [AXI_SL_DATA_WIDTH - 1:0]     axi_sl_wdata
   //low rate AXI slave Write Response Channel
   ,input  logic                               axi_sl_bready
   ,output logic                               axi_sl_bvalid
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]     axi_sl_bresp
   //low rate AXI slave Read Address Channel
   ,output logic                               axi_sl_arready
   ,input  logic                               axi_sl_arvalid
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]     axi_sl_araddr
   //low rate AXI slave Read Data Channel
   ,input  logic                               axi_sl_rready
   ,output logic                               axi_sl_rvalid
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]     axi_sl_rresp
   ,output logic [AXI_SL_DATA_WIDTH - 1:0]     axi_sl_rdata
   //output const
   ,output logic [AXI_SL_DATA_WIDTH - 1:0]     o_ptp_data
   ,output logic                               o_preamble_en
);

   localparam logic [AXI_SL_RESP_WIDTH - 1:0] RESP_OK = '0;
   localparam logic [AXI_SL_RESP_WIDTH - 1:0] RESP_DECERR = 'b11;
   localparam logic [AXI_SL_ADDR_WIDTH - 1:0] ADDR_0 = BASE_OFFSET;
   localparam logic [AXI_SL_ADDR_WIDTH - 1:0] ADDR_1 = BASE_OFFSET + 4'h4;

   logic                           cor_wr_req, awvalid_r, preamble_en, preamble_en_sync;
   logic [AXI_SL_DATA_WIDTH - 1:0] wdata_r, ptp_data, ptp_data_sync;
   logic [AXI_SL_ADDR_WIDTH - 1:0] awaddr_r;

   function automatic logic cor_addr(
      logic [AXI_SL_ADDR_WIDTH - 1:0] addr
   );
      if(addr == ADDR_0) begin
         return '1;
      end else if(addr == ADDR_1) begin
         return '1;
      end
      return '0;
   endfunction

   always_comb begin
      axi_sl_awready = '1;
      axi_sl_wready  = '1;
      axi_sl_arready = '1;
      o_ptp_data = ptp_data_sync;
      o_preamble_en = preamble_en_sync;
   end

   always_ff@(posedge axi_sl_clk) begin
      if(!axi_sl_rst_n) begin
         cor_wr_req <= '0;
         awvalid_r <= '0;
      end else begin
         if(axi_sl_awvalid && axi_sl_wvalid) begin
            awvalid_r <= '1;
            cor_wr_req <= axi_sl_awvalid & cor_addr(axi_sl_awaddr) & (&axi_sl_wstrb);
            wdata_r <= axi_sl_wdata;
            awaddr_r <= axi_sl_awaddr;
         end else if(axi_sl_bready) begin
            awvalid_r <= '0;
            cor_wr_req <= '0;
         end
      end
   end

   always_ff@(posedge axi_sl_clk) begin
      if(!axi_sl_rst_n) begin
         axi_sl_bvalid <= '0;
         ptp_data <= '0;
         preamble_en <= PREAMBLE_EN;
      end else begin
         if(axi_sl_bready && axi_sl_bvalid) begin
            axi_sl_bvalid <= '0;
         end else begin
            if(awvalid_r) begin
               axi_sl_bvalid <= '1;
               if(cor_wr_req) begin
                  if(awaddr_r == ADDR_0) begin
                     ptp_data <= wdata_r;
                  end else if(awaddr_r == ADDR_1) begin
                     preamble_en <= wdata_r[0];
                  end
                  axi_sl_bresp <= RESP_OK;
               end else begin
                  axi_sl_bresp <= RESP_DECERR;
               end
            end
         end
      end
   end

   always_comb axi_sl_rresp = RESP_OK;
   always_ff@(posedge axi_sl_clk) begin
      if(!axi_sl_rst_n) begin
         axi_sl_rvalid <= '0;
      end else begin
         if(axi_sl_arvalid) begin
            axi_sl_rvalid <= '1;
            if(axi_sl_araddr == BASE_OFFSET) begin
               axi_sl_rdata <= ptp_data;
            end else begin
               axi_sl_rdata <= '0;
            end
         end else if(axi_sl_rready) begin
            axi_sl_rvalid <= '0;
         end
      end
   end

   always_ff@(posedge clk) begin
      ptp_data_sync <= ptp_data;
      preamble_en_sync <= preamble_en;
   end
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRhenBFflOOpIHjMdbgmXtkAQT/a+OtR09D2cOxr84Vsb6Dqnk6QyIWtLINYsGv8m0SFCxPsAnhycUrsHkHZ12VRN6+LPi4qqNMSLjCud4eXBtq43zZbTZLwNtlqntxIIBJAq1kHQiloHuPvammk7ELt37eZUQlt2ZMDLaagkZaz/TohgUXF3qFrno4n4H91CKLtQuFSheWQg/wwOj9Y0Fprw1CFXpwE0ZB0EDC8+iIXmEa/d24eba6t9n2XTaPGgvAP0y4XxK61lx8Geg+hpq5/2uN6F/6Iuhkwa4UqW1o4DVea9PS81xgR8nr+FjgSns2YMn/Jd1fdXYaE5+/UiH49Md7We/Il6Qto76vzgbP5mhta+2xMiG4ryy5BNy4FDAAqjIq7BFYsnFri6EPW9qAD5m+6tDj8RuFQTYQumC2AeGj+ii34HqYhlpLai+SszWsNUm+VSB/sT6yzC97VCqPHV+fJpAjmcQlE5evwaoOWVzOJG+QtYZBbJGF0wYiC5ru2vwfUcCQ+0fDffD76SqcK3R4mhDloDI9ks8Mg1h3YYOlgNoiO6Tx85q3nTuTcWrUnA2u0tJpxR2otZIDnGU1UxkHvZTSx0mAy2nRAL4XFU1focafQojvRbWs8ILcFqiElnDQXZ4qu9UsiWoELkzbo8u/wNY3W0SlYo14MB3WxF5T8sjWHEOC6npBiRv9jB6eatCWz/iMAPpJlLK8a5a/XBjNBaCpXEa+q8q93E3NWKBonU9QHncGbP6d49uek6ssVP5JK4HD0CHUt501Ml/2O"
`endif