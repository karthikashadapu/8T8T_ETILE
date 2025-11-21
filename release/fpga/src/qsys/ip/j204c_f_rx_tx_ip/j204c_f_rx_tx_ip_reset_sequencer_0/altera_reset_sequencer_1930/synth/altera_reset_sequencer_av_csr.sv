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


// -------------------------------------------------------------------
// This block contains the CSR of the reset sequencer
// - Decodes the Avalon interface signal access
// - Generate different CSR outputs that is used in sequencer
// -------------------------------------------------------------------
`timescale 1 ns / 1 ns

module altera_reset_sequencer_av_csr #(

    parameter AV_ADDR_W = 8,
    parameter AV_DATA_W = 32,
    parameter REGISTER_CSR_INTERFACE = 1,
    parameter MAX_OUTPUT = 10

)
(

    // --------------------
    // Clock and resets
    // --------------------
    input       clk,
    input       reset,

    // -----------------
    // IRQ output
    // -----------------
    output logic            irq,

    //----------------------------
    // Avalon CSR Interface
    //----------------------------
    input  [AV_ADDR_W-1:0]       av_address,
    input                        av_write,
    input                        av_read,
    input  [AV_DATA_W-1:0]       av_writedata,
    output logic [AV_DATA_W-1:0] av_readdata,

    // ---------------------------
    // CSR output controls
    // ---------------------------
    output logic                    csr_sw_rst,
    output logic [MAX_OUTPUT-1:0]   csr_sw_aseq_bit_en_out,
    output logic                    csr_sw_aseq_seq_next,
    output logic [MAX_OUTPUT-1:0]   csr_sw_dseq_bit_en_out,
    output logic                    csr_sw_dseq_seq_next,
    output logic [MAX_OUTPUT-1:0]   csr_rst_ovr,
    output logic [MAX_OUTPUT-1:0]   csr_rst_ovr_en,
    output logic [MAX_OUTPUT-1:0]   csr_rst_msk,

    // ---------------------------
    // CSR input status
    // ---------------------------
    input                   csr_sts_reset_act,
    input                   csr_sts_asrt_act,
    input [MAX_OUTPUT-1:0]  csr_set_in_dsrt_qual,
    input [MAX_OUTPUT-1:0]  csr_set_reset_in_sts,
    input                   csr_set_asrt_wait_sw,
    input                   csr_set_dsrt_wait_sw
);

// ------------------------------------
// Internal Logic/Wire Declaration
// ------------------------------------
logic [31:0]    csr_readdata[7];
logic csr_hit_sts;
logic csr_hit_intren;
logic csr_hit_ctrl;
logic csr_hit_swaseq;
logic csr_hit_swdseq;
logic csr_hit_resetovr;
logic csr_hit_resetmask;

// Avalon CSR input staging
logic                   av_write_in;
logic                   av_read_in;
logic [AV_ADDR_W-1:0]   av_address_in;
logic [AV_DATA_W-1:0]   av_writedata_in;
logic [AV_DATA_W-1:0]   av_readdata_wire, av_readdata_reg;

// CSR registers
logic                   csr_sts_sw_rst;
logic                   csr_sts_pow_rst;
logic                   csr_intr_en_pow_rst;
logic                   csr_intr_en_sw_rst;
logic [MAX_OUTPUT-1:0]  csr_intr_en_reset_in;
logic [MAX_OUTPUT-1:0]  csr_intr_en_rst_dsrt_qual;
logic                   csr_intr_en_wait_dsrt_sw;
logic                   csr_intr_en_wait_asrt_sw;
logic                   irq_pow_rst;
logic                   irq_sw_rst;
logic [MAX_OUTPUT-1:0]  irq_reset_in;
logic [MAX_OUTPUT-1:0]  irq_rst_dsrt_qual;
logic                   irq_csr_wait_sw;
logic [MAX_OUTPUT-1:0]  csr_sts_reset_in;
logic [MAX_OUTPUT-1:0]  csr_sts_in_dsrt_qual;
logic [MAX_OUTPUT-1:0]  csr_set_in_dsrt_qual_q;
logic                   csr_sw_aseq_en;
logic                   csr_sw_dseq_en;
logic [MAX_OUTPUT-1:0]  csr_sw_aseq_bit_en;
logic [MAX_OUTPUT-1:0]  csr_sw_dseq_bit_en;
logic                   csr_sts_pow_rst_nxt;
logic                   csr_sts_sw_rst_nxt;
logic [MAX_OUTPUT-1:0]  csr_sts_reset_in_nxt;
logic [MAX_OUTPUT-1:0]  csr_sts_reset_in_clr;
logic [MAX_OUTPUT-1:0]  csr_sts_in_dsrt_qual_nxt;
logic [MAX_OUTPUT-1:0]  csr_sts_in_dsrt_qual_clr;
logic [MAX_OUTPUT-1:0]  csr_rst_ovr_en_set, csr_rst_ovr_en_clr;
logic                   csr_sts_dsrt_wait_sw_nxt, csr_sts_dsrt_wait_sw;
logic                   csr_sts_asrt_wait_sw_nxt, csr_sts_asrt_wait_sw;

// ------------------------
// Avalon Input Pipeline
// ------------------------
    generate
      if (REGISTER_CSR_INTERFACE == 1) begin
        always_ff @(posedge clk or posedge reset) begin
          if (reset) begin
            av_writedata_in    <= '0;
            av_address_in      <= '0;
            av_write_in        <= '0;
            av_read_in         <= '0;
          end
          else begin
            av_writedata_in    <= av_writedata;
            av_address_in      <= av_address;
            av_write_in        <= av_write;
            av_read_in         <= av_read;
          end
        end
      end
      else begin
        always @* begin
            av_writedata_in    = av_writedata;
            av_address_in      = av_address;
            av_write_in        = av_write;
            av_read_in         = av_read;
        end
      end
    endgenerate

// ------------------------
// Avalon CSR Logic
// ------------------------
always_ff @(posedge clk, posedge reset)
begin
    if (reset)
        av_readdata_reg <= '0;
    else
        av_readdata_reg   <= av_readdata_wire;
end

assign av_readdata_wire = { AV_DATA_W{av_read_in}} & (
                             (csr_readdata[0] & {AV_DATA_W{csr_hit_sts}}    ) |
                             (csr_readdata[1] & {AV_DATA_W{csr_hit_intren}} ) |
                             (csr_readdata[2] & {AV_DATA_W{csr_hit_ctrl}}   ) |
                             (csr_readdata[3] & {AV_DATA_W{csr_hit_swaseq}} ) |
                             (csr_readdata[4] & {AV_DATA_W{csr_hit_swdseq}} ) |
                             (csr_readdata[5] & {AV_DATA_W{csr_hit_resetovr}}   ) |
                             (csr_readdata[6] & {AV_DATA_W{csr_hit_resetmask}}  )
                             );

assign av_readdata      = (REGISTER_CSR_INTERFACE == 1) ? av_readdata_reg : av_readdata_wire;

// --------------
// CSR address decode
// --------------

always @* begin

    csr_hit_sts         = 1'b0;
    csr_hit_intren      = 1'b0;
    csr_hit_ctrl        = 1'b0;
    csr_hit_swaseq      = 1'b0;
    csr_hit_swdseq      = 1'b0;
    csr_hit_resetovr    = 1'b0;
    csr_hit_resetmask   = 1'b0;

    if (av_address_in[AV_ADDR_W-1:0] == 8'h18)  csr_hit_resetmask   = 1'b1;
    if (av_address_in[AV_ADDR_W-1:0] == 8'h14)  csr_hit_resetovr    = 1'b1;
    if (av_address_in[AV_ADDR_W-1:0] == 8'h10)  csr_hit_swdseq      = 1'b1;
    if (av_address_in[AV_ADDR_W-1:0] == 8'h0C)  csr_hit_swaseq      = 1'b1;
    if (av_address_in[AV_ADDR_W-1:0] == 8'h08)  csr_hit_ctrl        = 1'b1;
    if (av_address_in[AV_ADDR_W-1:0] == 8'h04)  csr_hit_intren      = 1'b1;
    if (av_address_in[AV_ADDR_W-1:0] == 8'h00)  csr_hit_sts         = 1'b1;

end

// ------------------
// Status register
// ------------------

// Set by reset. Cleared by SW
assign csr_sts_pow_rst_nxt  = csr_sts_pow_rst & ~( av_write_in & csr_hit_sts & av_writedata_in[0]);

// Set by csr_sw_rst and reset active (qualify to ensure reset has been activated by the sw_rst)
assign csr_sts_sw_rst_nxt   = (csr_sw_rst & csr_sts_asrt_act) | 
                              csr_sts_sw_rst & ~( av_write_in & csr_hit_sts & av_writedata_in[1] );

// Set by HW, cleared by SW
assign csr_sts_reset_in_nxt = csr_set_reset_in_sts | 
                              csr_sts_reset_in & ~csr_sts_reset_in_clr;
assign csr_sts_reset_in_clr = av_write_in & csr_hit_sts ? av_writedata_in[MAX_OUTPUT-1+2:2] : '0;

// Set by HW, cleared by SW, reflecting when a deassertion qual is received. (set on rising edge only)
assign csr_sts_in_dsrt_qual_nxt  = csr_set_in_dsrt_qual & ~csr_set_in_dsrt_qual_q |
                                   csr_sts_in_dsrt_qual &  ~csr_sts_in_dsrt_qual_clr;
assign csr_sts_in_dsrt_qual_clr  = av_write_in & csr_hit_sts ? av_writedata_in[MAX_OUTPUT-1+16:16] : '0;

// Set by HW, cleared by SW
assign csr_sts_dsrt_wait_sw_nxt  =  csr_set_dsrt_wait_sw |   
                                    csr_sts_dsrt_wait_sw & ~ ( av_write_in & csr_hit_sts & av_writedata_in[29] );
assign csr_sts_asrt_wait_sw_nxt  =  csr_set_asrt_wait_sw |
                                    csr_sts_asrt_wait_sw & ~ ( av_write_in & csr_hit_sts & av_writedata_in[30] );

assign csr_sw_dseq_seq_next      = csr_sts_dsrt_wait_sw & ( av_write_in & csr_hit_sts & av_writedata_in[29] );
assign csr_sw_aseq_seq_next      = csr_sts_asrt_wait_sw & ( av_write_in & csr_hit_sts & av_writedata_in[30] );

always_ff @(posedge clk, posedge reset)
begin
    if (reset) begin
        csr_sts_pow_rst         <= 1'b1;
        csr_sts_sw_rst          <= 1'b0;
        csr_sts_reset_in        <= '0;
        csr_sts_in_dsrt_qual    <= '0;
        csr_set_in_dsrt_qual_q  <= '0;
        csr_sts_dsrt_wait_sw    <= 1'b0;
        csr_sts_asrt_wait_sw    <= 1'b0;
        irq                     <= 1'b0;        
    end
    else begin
        csr_sts_pow_rst         <= csr_sts_pow_rst_nxt; 
        csr_sts_sw_rst          <= csr_sts_sw_rst_nxt; 
        csr_sts_reset_in        <= csr_sts_reset_in_nxt;
        csr_sts_in_dsrt_qual    <= csr_sts_in_dsrt_qual_nxt;
        csr_set_in_dsrt_qual_q  <= csr_set_in_dsrt_qual;
        csr_sts_dsrt_wait_sw    <= csr_sts_dsrt_wait_sw_nxt;
        csr_sts_asrt_wait_sw    <= csr_sts_asrt_wait_sw_nxt;
        irq                     <= irq_pow_rst | irq_csr_wait_sw | irq_sw_rst | (|irq_reset_in[MAX_OUTPUT-1:0]) | (|irq_rst_dsrt_qual[MAX_OUTPUT-1:0]);
    end
end

assign csr_readdata[0] = {  csr_sts_reset_act,  csr_sts_asrt_wait_sw, csr_sts_dsrt_wait_sw, {(13-MAX_OUTPUT){1'b0}}, csr_sts_in_dsrt_qual, 
                            {(14-MAX_OUTPUT){1'b0}} , csr_sts_reset_in, csr_sts_sw_rst, csr_sts_pow_rst };

assign irq_pow_rst          = csr_sts_pow_rst_nxt & csr_intr_en_pow_rst;
assign irq_sw_rst           = csr_sts_sw_rst_nxt & csr_intr_en_sw_rst;
assign irq_reset_in         = csr_sts_reset_in_nxt & csr_intr_en_reset_in;
assign irq_rst_dsrt_qual    = csr_sts_in_dsrt_qual_nxt & csr_intr_en_rst_dsrt_qual;
assign irq_csr_wait_sw      = (csr_sts_dsrt_wait_sw_nxt & csr_intr_en_wait_dsrt_sw) |
                              (csr_sts_asrt_wait_sw_nxt & csr_intr_en_wait_asrt_sw);


// ------------------
// Interrup Enable register
// ------------------

always_ff @(posedge clk, posedge reset)
begin
    if (reset) begin    
        csr_intr_en_pow_rst         <= '0;
        csr_intr_en_sw_rst          <= '0;
        csr_intr_en_reset_in        <= '0;
        csr_intr_en_rst_dsrt_qual   <= '0;
        csr_intr_en_wait_dsrt_sw    <= '0;  
        csr_intr_en_wait_asrt_sw    <= '0;
    end
    else begin
        // Basic R/W registers
        csr_intr_en_pow_rst         <= av_write_in & csr_hit_intren ? av_writedata_in[0]    : csr_intr_en_pow_rst;
        csr_intr_en_sw_rst          <= av_write_in & csr_hit_intren ? av_writedata_in[1]    : csr_intr_en_sw_rst;
        csr_intr_en_reset_in        <= av_write_in & csr_hit_intren ? av_writedata_in[11:2] : csr_intr_en_reset_in;
        csr_intr_en_rst_dsrt_qual   <= av_write_in & csr_hit_intren ? av_writedata_in[25:16]: csr_intr_en_rst_dsrt_qual;
        csr_intr_en_wait_dsrt_sw    <= av_write_in & csr_hit_intren ? av_writedata_in[29]   : csr_intr_en_wait_dsrt_sw;
        csr_intr_en_wait_asrt_sw    <= av_write_in & csr_hit_intren ? av_writedata_in[30]   : csr_intr_en_wait_asrt_sw;
    end
end

assign csr_readdata[1]  = { 1'b0 , csr_intr_en_wait_asrt_sw, csr_intr_en_wait_dsrt_sw, {(13-MAX_OUTPUT){1'b0}} , csr_intr_en_rst_dsrt_qual, 
                            {(14-MAX_OUTPUT){1'b0}}, csr_intr_en_reset_in, csr_intr_en_sw_rst , csr_intr_en_pow_rst };
// ------------------
// Control register
// ------------------

always_ff @(posedge clk, posedge reset)
begin
    if (reset) begin
        csr_sw_aseq_en      <= 1'b0;
        csr_sw_dseq_en      <= 1'b0;
        csr_sw_rst          <= 1'b0;
    end
    else begin
        // Basic R/W registers
        csr_sw_aseq_en      <= av_write_in & csr_hit_ctrl ? av_writedata_in[2] : csr_sw_aseq_en;
        csr_sw_dseq_en      <= av_write_in & csr_hit_ctrl ? av_writedata_in[1] : csr_sw_dseq_en;
        // SW reset: Set by SW, cleared by HW, when reset goes active
        csr_sw_rst          <= csr_sw_rst ? ~csr_sts_asrt_act : av_write_in & csr_hit_ctrl & av_writedata_in[0];
    end
end

assign csr_readdata[2]  = { {29{1'b0}} , csr_sw_aseq_en, csr_sw_dseq_en , 1'b0 };

// ------------------
// SW sequenced reset entry controls
// ------------------

always_ff @(posedge clk, posedge reset)
begin
    if (reset) begin
        csr_sw_aseq_bit_en      <= '1;
    end
    else begin
        csr_sw_aseq_bit_en      <= av_write_in & csr_hit_swaseq ? av_writedata_in[MAX_OUTPUT-1:0] : csr_sw_aseq_bit_en;
    end
end

assign csr_readdata[3] = { {(32-MAX_OUTPUT){1'b0}}, csr_sw_aseq_bit_en };
assign csr_sw_aseq_bit_en_out    = csr_sw_aseq_en ? csr_sw_aseq_bit_en : '0;

// ------------------
// SW sequenced reset entry controls
// ------------------

always_ff @(posedge clk, posedge reset)
begin
    if (reset) begin
        csr_sw_dseq_bit_en      <= '1;
    end
    else begin
        // Basic R/W registers
        csr_sw_dseq_bit_en      <= av_write_in & csr_hit_swdseq ? av_writedata_in[MAX_OUTPUT-1:0] : csr_sw_dseq_bit_en;
    end
end

assign csr_readdata[4] = { {(32-MAX_OUTPUT){1'b0}}, csr_sw_dseq_bit_en };
assign csr_sw_dseq_bit_en_out    = csr_sw_dseq_en ? csr_sw_dseq_bit_en : '0;

// ------------------
// SW direct controlled resets
// ------------------

always_ff @(posedge clk, posedge reset)
begin
    if (reset) begin
        csr_rst_ovr_en  <= '0;
        csr_rst_ovr     <= '0;
    end
    else begin
        csr_rst_ovr_en  <= csr_rst_ovr_en_set | (~csr_rst_ovr_en_clr & csr_rst_ovr_en);
        csr_rst_ovr     <= av_write_in & csr_hit_resetovr ? 
                                csr_rst_ovr_en_set & av_writedata_in[MAX_OUTPUT-1:0] : csr_rst_ovr;
    end
end

// Ovr_en is trigger qualification to ovr_set/ovr_clr
assign csr_rst_ovr_en_set  = av_write_in & csr_hit_resetovr ? av_writedata_in[MAX_OUTPUT-1+16:16] : '0;
assign csr_rst_ovr_en_clr  = av_write_in & csr_hit_resetovr ? ~av_writedata_in[MAX_OUTPUT-1+16:16]: '0;

// Register is all RO/WO. Read is always 0
assign csr_readdata[5] = { {(32-MAX_OUTPUT){1'b0}}, csr_rst_ovr };

// ------------------
// SW reset masking
// ------------------

always_ff @(posedge clk, posedge reset)
begin
    if (reset) begin
        csr_rst_msk <= '0;
    end
    else begin
        // Basic R/W registers
        csr_rst_msk <= av_write_in & csr_hit_resetmask ? av_writedata_in[MAX_OUTPUT-1:0] : csr_rst_msk;
    end
end

assign csr_readdata[6] = { {(32-MAX_OUTPUT){1'b0}}, csr_rst_msk };

endmodule // altera_reset_sequencer_av_csr
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "4XeedYC2d5cuadvCJho763aSSkl1DRkxkQvoksMJv2VSpzATyoN8DqHo//teYnH8r162T4uH+BCa200GxyJP31cBno1sEsJk77E+qkjc8lZYjykrG0EIfQmjezkrpycnghQBNehMvorEdlwQS1QrIwscD7jaPxEU/CLR7ot04MotVla9fxGEAryOoaYgp4YUIXkzbQ53M3Az+ttWfnaiDklcQ3ejpqjMrKcwpwFZLnbvQh0wG1LEsRb1Wk2lTeZA1UB3Nlj6OeeXIIVX1vWoP1nJlwmNDR23XTuIBAM7fgYDsXVL2MD2jBa9kGVZIcKQvHPUow7KTtfGD+iYgOvXN3ICkVZOwhpv8rJVa0HZ6N5b3WzLZFIHbylJKAsRrONKkRql1OSm42StlsuZ+t+JKpMwy40on6nNVLAxY09yuoaOE+TlX6MY/5ewADecsrB7FGd7+6/3sBDx3EDJwgKv/x/0kEyqc9oHB8VpzgvlOF6JPaG04qZzLZZFwS8E0Nii1s42aXI1MLcxOPe42D2rqp+x3wpjmlGLpYYqIozNUHRvycPtC53tMsIp4MN7g67Vl+hyOvspSQ5GTD7r3N9u4TVUwWAcJpyVcM8+kT/yZBZEsjOni/VJGtvSBOlKEUOfDqCapu359xt+Rn7kTW9Rv/Yy53dhkdyfxd/lX9oXblvtvBQH99hDGpEjpprn8k/mybbmtcQcAyOjwOo6Y714QXbuF9/1qoyYC0PZBOra4YuDoxOhxap5JhzraenC7F4z0UR9TbsFN3k99ZC4F3glhw/AAACCMV+S4TvSrxOMSXYOml8wJcjsByHz/E/Un8uya19buc8xcPCkLQ94/Xt92RRvdyh3lcinSDilzglPYn3kOB8Gy3Y3IkBEp8/0nBvUdsWfqZP8H12omQTIeGOgMnIfUoERv8+tL4Pb0vh8aRsmyp2YXY0gR/VyblKyziKOA1KenqypY2PBkPtVDwlkUDcZUjy6+xiO1mEGNDqsF3lhkz7i4Ji0EJ03uI+4XXR0"
`endif