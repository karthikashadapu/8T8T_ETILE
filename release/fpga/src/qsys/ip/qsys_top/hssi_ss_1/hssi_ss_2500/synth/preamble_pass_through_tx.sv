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
// Module            : preamble_pass_through_rx.sv
// Description       : 
// Author            : 
// Created           : 
// Changes           : 
//                   : 
// ==========================================================================


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on


module preamble_pass_through_tx #(
    parameter TDATA             = 256,
    parameter TEMPTY_BITS       = 5, 
    parameter TUSER             = 2 +90 +328,
    parameter DATA_WIDTH        = 128,
    parameter EMPTY_BITS        = 4, 
    parameter USER_WIDTH        = 2 +90 +328,
    parameter SIM_EMULATE       = 0 
) (
    input                           i_tx_clk, 
    input                           i_tx_reset_n,   
    /////tx_if
    output reg                      o_user_avst_tx_ready,
    input                           i_user_avst_tx_valid,
    input  [TDATA-1:0]              i_user_avst_tx_data,
    input                           i_user_avst_tx_sop,
    input                           i_user_avst_tx_eop,
    input  [TEMPTY_BITS-1:0]        i_user_avst_tx_empty,
    input  [TUSER-1:0]              i_user_avst_tx_user,
    input                           i_mac_avst_tx_ready,
    //to MAC
    output                          o_mac_avst_tx_valid,
    output  [DATA_WIDTH-1:0]        o_mac_avst_tx_data,
    output  [EMPTY_BITS-1:0]        o_mac_avst_tx_empty,
    output                          o_mac_avst_tx_sop,
    output                          o_mac_avst_tx_eop,
    output  [USER_WIDTH-1:0]        o_mac_avst_tx_user,
    output  [63:0]                  o_mac_avst_tx_preamble
);


//***********************************************************
//***********************************************************

reg  [1:0]                  ready_cntr, valid_cntr, eop_cntr;
wire                        mac_avst_tx_valid_tmp, mac_avst_tx_eop_tmp;
reg  [TEMPTY_BITS-1:0]      empty_bytes_temp;
wire [EMPTY_BITS-1:0]       empty_bytes;
reg  [191:0]                left_over_data;
// wire [30:0]                 avst_tx_fifo_level;
wire                        av_st_tx_fifo_af;
wire                        av_st_tx_fifo_empty;
reg                         mac_avst_tx_ready;
reg                         mac_avst_tx_ready_d1;
reg                         mac_avst_tx_ready_d2;
        
reg                         user_avst_tx_valid;
reg [TDATA-1:0]             user_avst_tx_data;
reg                         user_avst_tx_sop;
reg                         user_avst_tx_eop;
reg [TEMPTY_BITS-1:0]       user_avst_tx_empty;
reg [TUSER-1:0]             user_avst_tx_user;
reg [TUSER-1:0]             avst_tx_user;
//reg                       user_avst_tx_ready;

reg                         user_avst_tx_sop_prev;
reg                         user_avst_tx_eop_prev;

reg                         mac_avst_tx_valid;
reg  [DATA_WIDTH-1:0]       mac_avst_tx_data;
reg  [EMPTY_BITS-1:0]       mac_avst_tx_empty;
reg                         mac_avst_tx_sop;
reg                         mac_avst_tx_eop;
reg  [USER_WIDTH-1:0]       mac_avst_tx_user;
reg  [63:0]                 mac_avst_tx_preamble;
wire [TEMPTY_BITS:0]        user_avst_tx_empty_less_8,user_avst_tx_empty_less_24;

localparam FIFO_DEPTH              = 8;  
localparam FIFO_LEVEL_CHECK        = 4;  

//***********************************************************
//***********************************************************
always @(posedge i_tx_clk or negedge i_tx_reset_n)
begin
  if(~i_tx_reset_n)
    mac_avst_tx_ready <= 1'b0;
  else if(i_mac_avst_tx_ready)
    mac_avst_tx_ready <= 1'b1;
  // else if(avst_tx_fifo_level[4] == 1'b1) //this depends on delay and fifo size
  else if(av_st_tx_fifo_af == 1'b1) //this depends on delay and fifo size
    mac_avst_tx_ready <= 1'b0;
end    

always @(posedge i_tx_clk or negedge i_tx_reset_n)
begin
        if (~i_tx_reset_n)
  begin
    mac_avst_tx_ready_d1 <= 1'b0;
    mac_avst_tx_ready_d2 <= 1'b0;
end
else 
  begin
    mac_avst_tx_ready_d1 <= mac_avst_tx_ready;
    mac_avst_tx_ready_d2 <= mac_avst_tx_ready_d1;
    end
end

always @(*) //posedge i_tx_clk or negedge i_tx_reset_n)
begin
  if(~i_tx_reset_n)
  begin
    user_avst_tx_valid  <= 1'b0;
    user_avst_tx_data   <= {TDATA{1'b0}};
    user_avst_tx_sop    <= 1'b0;
    user_avst_tx_eop    <= 1'b0;
    user_avst_tx_empty  <= {TEMPTY_BITS{1'b0}};
    user_avst_tx_user   <= {TUSER{1'b0}};
    end
  else //if(o_user_avst_tx_ready)
  begin
    user_avst_tx_valid  <= i_user_avst_tx_valid && o_user_avst_tx_ready;
    user_avst_tx_data   <= i_user_avst_tx_data;
    user_avst_tx_sop    <= i_user_avst_tx_sop;
    user_avst_tx_eop    <= i_user_avst_tx_eop;
    user_avst_tx_empty  <= i_user_avst_tx_empty;
    user_avst_tx_user   <= i_user_avst_tx_user;
    end
end


    always @(posedge i_tx_clk or negedge i_tx_reset_n) 
    begin
        if (~i_tx_reset_n) 
  begin
    user_avst_tx_sop_prev    <= 1'b0;
    user_avst_tx_eop_prev    <= 1'b0;
        end
  else if(o_user_avst_tx_ready)
begin
    user_avst_tx_sop_prev    <= i_user_avst_tx_sop && i_user_avst_tx_valid;
    user_avst_tx_eop_prev    <= i_user_avst_tx_eop && i_user_avst_tx_valid;
    end
end

    always @(posedge i_tx_clk or negedge i_tx_reset_n) 
    begin
  if(~i_tx_reset_n)
    ready_cntr <= 2'd0;
  else if(i_user_avst_tx_valid && i_user_avst_tx_eop && i_user_avst_tx_sop)
    ready_cntr <= 2'd0; 
  else if(i_user_avst_tx_valid && i_user_avst_tx_eop)
      ready_cntr <= (i_user_avst_tx_empty > 5'd23) ? 2'd0 : ((i_user_avst_tx_empty > 5'd7) ? 2'd0 : 2'd1);
    else if(o_user_avst_tx_ready)
      ready_cntr <= 2'd0;
  else if(mac_avst_tx_ready_d1)
  begin
    if(ready_cntr > 2'd0)
      ready_cntr <= ready_cntr - 2'd1;
        end
        end


    always @(posedge i_tx_clk or negedge i_tx_reset_n) 
    begin
        if (~i_tx_reset_n) 
    o_user_avst_tx_ready <= 1'b0;
  else if(i_user_avst_tx_valid && i_user_avst_tx_sop)
    o_user_avst_tx_ready <= i_user_avst_tx_eop ? ((i_user_avst_tx_empty > 5'd7) ? mac_avst_tx_ready : 1'b0) : mac_avst_tx_ready;
    else if(i_user_avst_tx_valid && i_user_avst_tx_eop && (i_user_avst_tx_empty > 5'd23)) //at eop <= 8 bytes
    o_user_avst_tx_ready <= mac_avst_tx_ready;
  else if(mac_avst_tx_ready)
  begin
    if(~mac_avst_tx_ready_d1 && user_avst_tx_sop_prev && ~user_avst_tx_eop_prev)  //sop latch case to takecare ready_cntr delay2
      o_user_avst_tx_ready <= 1'b1;
    else if(~mac_avst_tx_ready_d1 && (valid_cntr > 2'd0))  //eop latch case to takecare ready_cntr delay2
      o_user_avst_tx_ready <= 1'b0;
    else if(ready_cntr == 2'd0)
      o_user_avst_tx_ready <= ~o_user_avst_tx_ready;
  end
        else 
    o_user_avst_tx_ready <= 1'b0;
    end
    
    always @(posedge i_tx_clk or negedge i_tx_reset_n) 
    begin
        if (~i_tx_reset_n) 
    valid_cntr <= 2'd0;
  else if(mac_avst_tx_ready_d1)
  begin
    if(user_avst_tx_valid && user_avst_tx_eop)
    begin
      if (user_avst_tx_sop)
        valid_cntr <= (user_avst_tx_empty > 5'd7) ? 2'd0 : 2'd1;
        else 
        valid_cntr <= (user_avst_tx_empty > 5'd23) ? 2'd0 : ((user_avst_tx_empty > 5'd7) ? 2'd1 : 2'd2);
    end
    else if(user_avst_tx_valid)
      valid_cntr <= 2'd1;
    else if(valid_cntr > 2'd0)
      valid_cntr <= valid_cntr - 2'd1;
  end
end  

assign mac_avst_tx_valid_tmp = user_avst_tx_valid || (valid_cntr > 2'd0); 
        
    always @(posedge i_tx_clk or negedge i_tx_reset_n) 
    begin
        if (~i_tx_reset_n) 
    eop_cntr <= 2'd0;
  else if(mac_avst_tx_ready_d1)
  begin
    if(user_avst_tx_valid && user_avst_tx_eop)
    begin
      if (user_avst_tx_sop)
        eop_cntr <= (user_avst_tx_empty > 5'd7) ? 2'd0 : 2'd1;
            else
        eop_cntr <= (user_avst_tx_empty > 5'd23) ? 2'd0 : ((user_avst_tx_empty > 5'd7) ? 2'd1 : 2'd2);
        end
    else if(eop_cntr > 2'd0)
      eop_cntr <= eop_cntr - 2'd1;
        end                 
    end 
    
assign mac_avst_tx_eop_tmp = (user_avst_tx_valid && user_avst_tx_eop && ~user_avst_tx_sop && (user_avst_tx_empty > 5'd23)) || (eop_cntr == 2'd1) 
                         || (user_avst_tx_valid && user_avst_tx_eop && user_avst_tx_sop && (user_avst_tx_empty > 5'd7));  

    always @(posedge i_tx_clk or negedge i_tx_reset_n) 
    begin
        if (~i_tx_reset_n) 
    avst_tx_user <= {USER_WIDTH{1'b0}};
  else if(mac_avst_tx_ready_d1)
  begin
    if(user_avst_tx_valid)
      avst_tx_user <= user_avst_tx_user;
    end
end  

always @(posedge i_tx_clk or negedge i_tx_reset_n) 
begin
  if(~i_tx_reset_n)
    empty_bytes_temp  <= 4'd0;
  else if(mac_avst_tx_ready_d1)
  begin
    if(user_avst_tx_valid && user_avst_tx_eop)
    begin
      if (user_avst_tx_sop)
        empty_bytes_temp <= 5'd8 + user_avst_tx_empty;
      else
        empty_bytes_temp <= (user_avst_tx_empty > 5'd7) ? (user_avst_tx_empty - 5'd8)  : (user_avst_tx_empty + 5'd8);
    end
    end
end

assign empty_bytes = empty_bytes_temp[EMPTY_BITS-1:0];

assign user_avst_tx_empty_less_8  = (user_avst_tx_empty - 5'd8);
assign user_avst_tx_empty_less_24  = (user_avst_tx_empty - 5'd24);
 
always @(posedge i_tx_clk or negedge i_tx_reset_n) 
begin
  if(~i_tx_reset_n)
  begin
    mac_avst_tx_valid     <= 1'b0;
    mac_avst_tx_data      <= {DATA_WIDTH{1'b0}};
    mac_avst_tx_empty     <= {EMPTY_BITS{1'b0}};
    mac_avst_tx_sop       <= 1'b0;
    mac_avst_tx_eop       <= 1'b0;
    mac_avst_tx_user      <= {USER_WIDTH{1'b0}};
    mac_avst_tx_preamble  <= 64'd0;
    left_over_data          <= 192'd0;
    end   
  else if(mac_avst_tx_ready_d1)
  begin
    if(user_avst_tx_valid && user_avst_tx_sop)
    begin
      mac_avst_tx_data      <= user_avst_tx_data[191:64];  //MSB's are valid 
      left_over_data          <= {user_avst_tx_data[63:0], 128'd0};  //MSB's are valid
        end
    else if(o_user_avst_tx_ready)
    begin
      mac_avst_tx_data      <= {left_over_data[191:128], user_avst_tx_data[255:192]}; 
      left_over_data          <= user_avst_tx_data[191:0];
        end
    else
    begin
      mac_avst_tx_data      <= left_over_data[191:64]; 
      left_over_data          <= {left_over_data[63:0], 128'd0};
        end
    mac_avst_tx_preamble  <= (user_avst_tx_valid && user_avst_tx_sop) ? user_avst_tx_data[255:192] : mac_avst_tx_preamble;

    if(mac_avst_tx_eop_tmp)
    begin
      if(o_user_avst_tx_ready && user_avst_tx_sop) //single word packet
        mac_avst_tx_empty     <= (user_avst_tx_empty > 5'd7) ? user_avst_tx_empty_less_8[EMPTY_BITS-1:0] : 4'd0;
      else if(o_user_avst_tx_ready) //left over are 24bytes
        mac_avst_tx_empty     <= (user_avst_tx_empty > 5'd23) ? user_avst_tx_empty_less_24[EMPTY_BITS-1:0] : 4'd0;
 
      else  
        mac_avst_tx_empty     <= empty_bytes; 
        end
    else 
    begin
      mac_avst_tx_empty   <= 4'd0; 
        end
    mac_avst_tx_valid     <= mac_avst_tx_valid_tmp; 
    mac_avst_tx_sop       <= user_avst_tx_sop && user_avst_tx_valid;
    mac_avst_tx_eop       <= mac_avst_tx_eop_tmp;
    mac_avst_tx_user      <= (user_avst_tx_sop | user_avst_tx_eop) ? user_avst_tx_user : avst_tx_user;  //Assuming fifo o/p stays when data is not ready is not there;
    end
  else
  begin
      mac_avst_tx_sop       <= 1'b0;
end

end
    // hssi_ss_scfifo_mlab #(
        // .SIM_EMULATE (SIM_EMULATE),
        // .WIDTH       (64+USER_WIDTH+3+EMPTY_BITS+DATA_WIDTH) //Depth is 'd32 TBD to 4  
    // ) U_av_st_tx_fifo (
        // .clk     (i_tx_clk),
        // .sclr    (~i_tx_reset_n),
        // .wdata   ({mac_avst_tx_preamble, mac_avst_tx_user, mac_avst_tx_eop, mac_avst_tx_sop, mac_avst_tx_valid, mac_avst_tx_empty, mac_avst_tx_data}),
        // .wreq    (mac_avst_tx_ready_d2),
       // .full    (),
        // .rdata   ({o_mac_avst_tx_preamble, o_mac_avst_tx_user, o_mac_avst_tx_eop, o_mac_avst_tx_sop, o_mac_avst_tx_valid, o_mac_avst_tx_empty, o_mac_avst_tx_data}),
        // .used    (avst_tx_fifo_level),
        // .rreq    (i_mac_avst_tx_ready), //empty check is inside fifo
        // .empty   ()
    // );
                 
      hssi_scfifo  # (                      
         .ASYNC_RST                (0),
         .SIM_EMULATE              (SIM_EMULATE),
         // .enable_ecc               (EN_ECC),
         .intended_device_family   ("Agilex"),
         .lpm_hint                 ("RAM_BLOCK_TYPE=MLAB"),
         .lpm_width                (64+USER_WIDTH+3+EMPTY_BITS+DATA_WIDTH),
         .lpm_widthu               (FIFO_DEPTH),
         .lpm_numwords             (2**FIFO_DEPTH),
         .lpm_type                 ("scfifo"),
         .lpm_showahead            ("ON"),
         .overflow_checking        ("OFF"),
         .underflow_checking       ("OFF"), 
         .almost_full_value        (FIFO_LEVEL_CHECK),         
         .use_eab                  ("ON")         
      ) U_av_st_tx_fifo (
         .clock                    (i_tx_clk),
         .data                     ({mac_avst_tx_preamble, mac_avst_tx_user, mac_avst_tx_eop, mac_avst_tx_sop, mac_avst_tx_valid, mac_avst_tx_empty, mac_avst_tx_data}),
         .wrreq                    (mac_avst_tx_ready_d2),
         .rdreq                    (i_mac_avst_tx_ready & ~av_st_tx_fifo_empty), 
         .empty                    (av_st_tx_fifo_empty),
         .full                     (),
         .q                        ({o_mac_avst_tx_preamble, o_mac_avst_tx_user, o_mac_avst_tx_eop, o_mac_avst_tx_sop, o_mac_avst_tx_valid, o_mac_avst_tx_empty, o_mac_avst_tx_data}),
         .usedw                    (), 
         .aclr                     (1'b0),
         .almost_empty             (),
         .almost_full              (av_st_tx_fifo_af),
         .eccstatus                (),
         .sclr                     (~i_tx_reset_n)
         );

endmodule




`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ysI0WZUWdWjvTf9aIxTsDyQ9BD35Xu5ZO4QiLLb2zgrHtH7fHTVt7PISHxzwHheRffP9sumg7girhsPHpFcgZgHYj+ZLOOHote28vVKUuhMgCCCtFBYjz9IlNRa5icUxJS60/5CwGmqjea0sIe7Lj1HvmlQEXPgpCC677Umj4D940WSDWv0Wp7ZlO0S3BL6EAKrvtCflsvufpw43pUrNqzcND3VZcS7n6vdWpddV7S25Z3Qm/j7O2grj29RpsQ21jV3hBir1i7ZK8FPx2ZGKZY2QtFzli9hZcy/Ft1iKT7cPXMlCFDI5I3AuqpSbfwLTmK0++l6rK17yJx4dXsWnw0a4DpbiOq0m+O+hvnjT9DHZOPyVbyR9FRZ1d9fL3zrVx214lKaPVZizDTUXHCzWGwMpIc+vcVhHqXBgqgW2TO7tWhjZt8KBkGEOaRcwaagNlZd5bgY5CBanxbEARRq9UXgxMzm7r97yK2aunlymLVWgiaD8Ai8KDtNyRJCMpkBeswzNLKxOGkLdXOScn2OaGgsYS6LP6aTOe3GPKy2OLbW9qXMfiMdidiol2nzSh0KnESJ5nM+yXqAe4k5KhDqOvsZLQx/9UrUHzPm+a3hW2MmdMFiklMr1ZksgaOlIfpmVF7QsIN7acOgg2KOh5s86gj6ARE3VE4sJETGG96acQd8WmsHObjTNo+Fk2CaHna/pt4O2ua5L/pxN4RlJuZEfZr7JtX5pg7gRmeOjX1Eknyz1yAY/m/G/+dRzGdCN6l9lFlpQ5+0+BgwDO1nTM5sNEVQ"
`endif