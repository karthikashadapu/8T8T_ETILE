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


module axil_const_passthrough #(
    
    parameter  int CONST_BASE_OFFSET       = 16'hF8
   ,parameter  int BASE_OFFSET             = 16'h100
   ,parameter  int AXI_SL_ADDR_WIDTH       = parser_pkg::get_width(BASE_OFFSET+1)
   ,parameter  int AXI_OUT_ADDR_WIDTH      = 9
   ,parameter  int PREAMBLE_EN             = 0
   ,localparam int AXI_SL_DATA_WIDTH       = 32
   ,localparam int AXI_SL_RESP_WIDTH       = 2
   ,localparam int AXI_SL_STRB_WIDTH       = AXI_SL_DATA_WIDTH / 8
   ,localparam int CONST_ADDR              = CONST_BASE_OFFSET + BASE_OFFSET
   ,localparam int SECOND_CONST_REG        = CONST_ADDR + 16'h4
   ,localparam int RESERVED_LO             = 16'h188
   ,localparam int RESERVED_HI             = 16'h1f8
) (
    input  logic                               clk
   ,input  logic                               axi_clk
   ,input  logic                               axi_rst_n
   //low rate AXI slave Write Address Channel
   ,output logic                               axi_awready
   ,input  logic                               axi_awvalid
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]     axi_awaddr
   //low rate AXI slave Write Data Channel
   ,output logic                               axi_wready
   ,input  logic                               axi_wvalid
   ,input  logic [AXI_SL_STRB_WIDTH - 1:0]     axi_wstrb
   ,input  logic [AXI_SL_DATA_WIDTH - 1:0]     axi_wdata
   //low rate AXI slave Write Response Channel
   ,input  logic                               axi_bready
   ,output logic                               axi_bvalid
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]     axi_bresp
   //low rate AXI slave Read Address Channel
   ,output logic                               axi_arready
   ,input  logic                               axi_arvalid
   ,input  logic [AXI_SL_ADDR_WIDTH - 1:0]     axi_araddr
   //low rate AXI slave Read Data Channel
   ,input  logic                               axi_rready
   ,output logic                               axi_rvalid
   ,output logic [AXI_SL_RESP_WIDTH - 1:0]     axi_rresp
   ,output logic [AXI_SL_DATA_WIDTH - 1:0]     axi_rdata
   //output const
   ,output logic [AXI_SL_DATA_WIDTH - 1:0]     o_ptp_data
   ,output logic                               o_preamble_en

   //low rate AXI slave Write Address Channel
   ,input  logic                               axi_pt_awready
   ,output logic                               axi_pt_awvalid
   ,output logic [AXI_OUT_ADDR_WIDTH - 1:0]     axi_pt_awaddr
   //low rate AXI slave Write Data Channel
   ,input  logic                               axi_pt_wready
   ,output logic                               axi_pt_wvalid
   ,output logic [AXI_SL_STRB_WIDTH - 1:0]     axi_pt_wstrb
   ,output logic [AXI_SL_DATA_WIDTH - 1:0]     axi_pt_wdata
   //low rate AXI slave Write Response Channel
   ,output logic                               axi_pt_bready
   ,input  logic                               axi_pt_bvalid
   ,input  logic [AXI_SL_RESP_WIDTH - 1:0]     axi_pt_bresp
   //low rate AXI slave Read Address Channel
   ,input  logic                               axi_pt_arready
   ,output logic                               axi_pt_arvalid
   ,output logic [AXI_OUT_ADDR_WIDTH - 1:0]     axi_pt_araddr
   //low rate AXI slave Read Data Channel
   ,output logic                               axi_pt_rready
   ,input  logic                               axi_pt_rvalid
   ,input  logic [AXI_SL_RESP_WIDTH - 1:0]     axi_pt_rresp
   ,input  logic [AXI_SL_DATA_WIDTH - 1:0]     axi_pt_rdata
);

logic                               axic_AWREADY;
logic                               axic_AWVALID;
logic [AXI_SL_ADDR_WIDTH - 1:0]     axic_AWADDR;
logic                               axic_WREADY;
logic                               axic_WVALID;
logic [AXI_SL_STRB_WIDTH - 1:0]     axic_WSTRB;
logic [AXI_SL_DATA_WIDTH - 1:0]     axic_WDATA;
logic                               axic_BREADY;
logic                               axic_BVALID;
logic [AXI_SL_RESP_WIDTH - 1:0]     axic_BRESP;
logic                               axic_ARREADY;
logic                               axic_ARVALID;
logic [AXI_SL_ADDR_WIDTH - 1:0]     axic_ARADDR;
logic                               axic_RREADY;
logic                               axic_RVALID;
logic [AXI_SL_RESP_WIDTH - 1:0]     axic_RRESP;
logic [AXI_SL_DATA_WIDTH - 1:0]     axic_RDATA;
logic [AXI_SL_DATA_WIDTH - 1:0]     o_ptp_data_r;
logic                               o_preamble_en_r;

logic                               axir_AWREADY;
logic                               axir_AWVALID;
logic [AXI_SL_ADDR_WIDTH - 1:0]     axir_AWADDR;
logic                               axir_WREADY;
logic                               axir_WVALID;
logic [AXI_SL_STRB_WIDTH - 1:0]     axir_WSTRB;
logic [AXI_SL_DATA_WIDTH - 1:0]     axir_WDATA;
logic                               axir_BREADY;
logic                               axir_BVALID;
logic [AXI_SL_RESP_WIDTH - 1:0]     axir_BRESP;
logic                               axir_ARREADY;
logic                               axir_ARVALID;
logic [AXI_SL_ADDR_WIDTH - 1:0]     axir_ARADDR;
logic                               axir_RREADY;
logic                               axir_RVALID;
logic [AXI_SL_RESP_WIDTH - 1:0]     axir_RRESP;
logic [AXI_SL_DATA_WIDTH - 1:0]     axir_RDATA;

logic [AXI_SL_ADDR_WIDTH - 1:0]     axi_awaddr_d;
logic [AXI_SL_ADDR_WIDTH - 1:0]     axi_araddr_d;

always_ff @(posedge axi_clk) begin
  if (!axi_rst_n)begin
    axi_awaddr_d <= '0;
    axi_araddr_d <= '0;
  end else begin
    if (axi_awvalid) begin
      axi_awaddr_d <= axi_awaddr;
    end
    if (axi_arvalid) begin
      axi_araddr_d <= axi_araddr; 
    end  
  end
end

always_comb begin
   o_ptp_data = o_ptp_data_r;
   o_preamble_en = o_preamble_en_r;
   axic_WDATA = axi_wdata;
   axir_WDATA = axi_wdata;
   axi_pt_wdata = axi_wdata;

   if(axi_awaddr == CONST_ADDR || axi_awaddr == SECOND_CONST_REG) begin
      axi_awready = axic_AWREADY;
      axic_AWVALID = axi_awvalid;
      axic_AWADDR = axi_awaddr;

      axi_wready = axic_WREADY;
      axic_WSTRB = axi_wstrb;
      axic_WVALID = axi_wvalid;

      axir_WVALID = '0;
      axir_AWVALID = '0;
      axir_AWADDR = '0;
      axir_WSTRB = '0;
      axi_pt_wvalid = '0;
      axi_pt_awvalid = '0;
      axi_pt_awaddr = '0;
      axi_pt_wstrb = '0;
   end else begin
      if((axi_awaddr >= RESERVED_LO) && (axi_awaddr < RESERVED_HI)) begin
         axi_awready = axir_AWREADY;
         axir_AWVALID = axi_awvalid;
         axir_AWADDR = axi_awaddr;

         axi_wready = axir_WREADY;
         axir_WSTRB = axi_wstrb;
         axir_WVALID = axi_wvalid;
     
         axic_WVALID = '0;
         axic_AWVALID = '0;
         axic_AWADDR = '0;
         axic_WSTRB = '0;
         axi_pt_wvalid = '0;
         axi_pt_awvalid = '0;
         axi_pt_awaddr = '0;
         axi_pt_wstrb = '0;
      end else begin
         axi_awready = axi_pt_awready;
         axi_pt_awvalid = axi_awvalid;
         axi_pt_awaddr = axi_awaddr[AXI_OUT_ADDR_WIDTH - 1:0];

         axi_wready = axi_pt_wready;
         axi_pt_wstrb = axi_wstrb;
         axi_pt_wvalid = axi_wvalid;

         axic_WVALID = '0;
         axic_AWVALID = '0;
         axic_AWADDR = '0;
         axic_WSTRB = '0;
         axir_WVALID = '0;
         axir_AWVALID = '0;
         axir_AWADDR = '0;
         axir_WSTRB = '0;
      end
   end

   if(axi_awaddr_d == CONST_ADDR || axi_awaddr_d == SECOND_CONST_REG) begin
      axi_bresp = axic_BRESP;
      axi_bvalid = axic_BVALID;
      axic_BREADY = axi_bready;
      axi_pt_bready = '0;
      axir_BREADY = '0;
   end else begin
      axi_bresp = axi_pt_bresp;
      axi_bvalid = axi_pt_bvalid;
      axi_pt_bready = axi_bready;
      axic_BREADY = '0;
      axir_BREADY = '0;
      if((axi_awaddr_d >= RESERVED_LO) && (axi_awaddr_d < RESERVED_HI)) begin
         axi_bresp = axir_BRESP;
         axi_bvalid = axir_BVALID;
         axir_BREADY = axi_bready;
         axi_pt_bready = '0;
         axic_BREADY = '0;
      end
   end

   if(axi_araddr == CONST_ADDR || axi_araddr == SECOND_CONST_REG) begin
      axi_arready = axic_ARREADY;
      axic_ARVALID = axi_arvalid;
      axic_ARADDR = axi_araddr;
      axir_ARVALID = '0;
      axir_ARADDR = '0;
      axi_pt_arvalid = '0;
      axi_pt_araddr = '0;
   end else begin
      if((axi_araddr >= RESERVED_LO) && (axi_araddr < RESERVED_HI)) begin
         axi_arready = axir_ARREADY;
         axir_ARVALID = axi_arvalid;
         axir_ARADDR = axi_araddr;
         axic_ARVALID = '0;
         axic_ARADDR = '0;
         axi_pt_arvalid = '0;
         axi_pt_araddr = '0;
      end else begin
         axi_arready = axi_pt_arready;
         axi_pt_arvalid = axi_arvalid;
         axi_pt_araddr = axi_araddr[AXI_OUT_ADDR_WIDTH - 1:0];
         axic_ARVALID = '0;
         axic_ARADDR = '0;
         axir_ARVALID = '0;
         axir_ARADDR = '0;
      end
   end

   if(axi_araddr_d == CONST_ADDR || axi_araddr_d == SECOND_CONST_REG) begin
      axi_rvalid = axic_RVALID;
      axi_rresp = axic_RRESP;
      axi_rdata = axic_RDATA;
      axic_RREADY = axi_rready;
      axi_pt_rready = '0;
      axir_RREADY = '0;
   end else begin
      if((axi_araddr_d >= RESERVED_LO) && (axi_araddr_d < RESERVED_HI)) begin
         axi_rvalid = axir_RVALID;
         axi_rresp = axir_RRESP;
         axi_rdata = axir_RDATA;
         axir_RREADY = axi_rready;
         axi_pt_rready = '0;
         axic_RREADY = '0;
      end else begin
         axi_rvalid = axi_pt_rvalid;
         axi_rresp = axi_pt_rresp;
         axi_rdata = axi_pt_rdata;
         axi_pt_rready = axi_rready;
         axic_RREADY = '0;
         axir_RREADY = '0;
      end
   end
end

//reserved space response
always_ff@(posedge axi_clk) begin
   if(!axi_rst_n) begin
      axir_AWREADY <= 1'b1;
      axir_WREADY <= 1'b1;
      axir_BVALID <= 1'b0;
      axir_BRESP <= 2'b11;
      axir_ARREADY <= 1'b1;
      axir_RRESP <= 2'b11;
      axir_RVALID <= 1'b0;
      axir_RDATA <= '0;
   end else begin
      if(axir_BVALID && axir_BREADY) begin
         axir_BVALID <= 1'b0;
      end
      if(axir_WVALID) begin
         axir_BVALID <= 1'b1;
      end

      if(axir_RVALID && axir_RREADY) begin
         axir_RVALID <= 1'b0;
      end
      if(axir_ARVALID) begin
         axir_RVALID <= 1'b1;
      end
   end
end

axil_const #(
       .BASE_OFFSET        (CONST_ADDR)
      ,.AXI_SL_ADDR_WIDTH  (AXI_SL_ADDR_WIDTH)
      ,.PREAMBLE_EN        (PREAMBLE_EN)
   ) axil_const (
       .clk                           (clk)
      ,.axi_sl_clk                    (axi_clk)
      ,.axi_sl_rst_n                  (axi_rst_n)
      //AXI slave Write Address Channel
      ,.axi_sl_awready                (axic_AWREADY)
      ,.axi_sl_awvalid                (axic_AWVALID)
      ,.axi_sl_awaddr                 (axic_AWADDR )
      //AXI slave Write Data Channel
      ,.axi_sl_wready                 (axic_WREADY )
      ,.axi_sl_wvalid                 (axic_WVALID )
      ,.axi_sl_wstrb                  (axic_WSTRB  )
      ,.axi_sl_wdata                  (axic_WDATA  )
      //AXI slave Write Response Channel
      ,.axi_sl_bready                 (axic_BREADY )
      ,.axi_sl_bvalid                 (axic_BVALID )
      ,.axi_sl_bresp                  (axic_BRESP  )
      //AXI slave Read Address Channel
      ,.axi_sl_arready                (axic_ARREADY)
      ,.axi_sl_arvalid                (axic_ARVALID)
      ,.axi_sl_araddr                 (axic_ARADDR )
      //AXI slave Read Data Channel
      ,.axi_sl_rready                 (axic_RREADY )
      ,.axi_sl_rvalid                 (axic_RVALID )
      ,.axi_sl_rresp                  (axic_RRESP  )
      ,.axi_sl_rdata                  (axic_RDATA  )
      //output const
      ,.o_ptp_data                    (o_ptp_data_r)
      ,.o_preamble_en                 (o_preamble_en_r)
   );
   
endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "12eGHzhuzwzE3Jk0jEeOiewN6nwHALu32POyTf1JRNCV1OO/za2V4D/fHTxv4w7+HdY5I0a3bv3Hpe5d23LTkzUBWr/DOPSEcj3Y+bJ17gyFGyQY/gCPSyoX2LFpcR+gNWbGsGAYxdn8Ifv81Gif4S4dqthNm6DrNrNks867RzF0KuP2oTdv1KiuGKLRWAqy545AlItbNT/UEmyH9cDTkvw7JpmnyySAW+TVRIaxiRjaC7IahskBuCXKLDOuHXreBM7LlqNOoNS/bbizDTnmMEI7/nbcvnSqhHKQaPykV2E1Z0aKxha1ry2fsElaarqC4s/dF0SHzYGcPiny4oDyS3+W+tOlek5B4nIAEAqCjFQRwtDpt1YHK8iVFh2Tlu3H7z9jQKh17DGvOKQUC10wxvul1TNui0FB0Abe9+/9Nqfe5dgcj5ZdZfw/n12GIPJy0DuRLFKgzX95gS0ejb5isP0IbvqA+gGfc4NcbWtawnZcaONFqfN3LOJa2QNZWU2QLo+tTHpbNAEOT4UrmQ/ODrU2wZNvK8DvvPOxtzV9vg/RF6kGh5bX33OvsBBl3BRJUNBU1PMVsIVPT+Gr6rfHwZQE+GDgPgOwxd5UcBsottIFGW2dwQW+2ycEqpR/7lApKc6zvid9246Ee+adbwhRSzohg3bmmbpYY+N+/9FP20FT64/r1N/yMMYZcqEZgZniANRBYiLwqMbW7Ak2Wxz9sZwUk3rMi/fwJIani0HNCgAYjLSFB2cTTxN/I9ZMmIVog5IuiSkA/qdCfg5MdwQnD6ujtsz20vc9FuZxVs02cMUbxLkW0fO/9jKY29CD5ckBZ/CebEbHBajcKVcLDdc49CSX+TKME6z6XB0KluScdmGXnt+UPj+UZH1xuWRTGC5F1w1aHipWD+cS8ISUOKGXV/StFR4hI5spWhz+Dbk8bT6TobUdR4ckb24aB3BA+/ZkF8nVW3xBXw36blTvgzT2Q6U4G1GHnnKa4/GCOoYRLuaX822GQE4NybZhg6aADNfV"
`endif