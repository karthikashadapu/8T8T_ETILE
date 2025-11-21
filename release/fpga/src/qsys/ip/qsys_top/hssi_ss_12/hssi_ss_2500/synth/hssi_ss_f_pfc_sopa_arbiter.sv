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


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on


//Strict-priority: Grant is one clock delayed of request/increment_top_priority. Request for the current queue should be 0b0 at increment_top_priority if its the last word of the packet.

module hssi_ss_f_pfc_sopa_arbiter
#(
    parameter NUM_REQUESTERS = 8,  //NO OF QUEUES
    // --------------------------------------
    // Implemented schemes
    // "round-robin"
    // "strict-priority"
    // "no-arb"          //not supported
    // --------------------------------------
    parameter SCHEME         = "round-robin",
    parameter PIPELINE       = 0,  //not used
    parameter SYNC_RESET     = 0   //not used
)
(
    input clk,
    input reset,
   
    // --------------------------------------
    // Requests
    // --------------------------------------
    input [NUM_REQUESTERS-1:0]  request,
    // --------------------------------------
    // Grants
    // --------------------------------------
    output [NUM_REQUESTERS-1:0] grant,  

    // --------------------------------------
    // Control Signals
    // --------------------------------------
    input                       increment_top_priority,  //Change grant
    input                       save_top_priority  //not used
);

    localparam [7:0]GRANT_ARRAY[8:0] = {8'h00, 8'h80, 8'h40, 8'h20, 8'h10, 8'h08, 8'h04, 8'h02, 8'h01};

//******************************************************************************
    wire                     sch_enb_in;
    wire [NUM_REQUESTERS - 1 : 0 ]  sch_data_in;
    wire [3:0]               next_q;

    reg                      sch_enb_out;
    wire [3:0]               sch_data_out;
    reg  [3:0]               sch_data_out_lcl [NUM_REQUESTERS-1:0];
    reg  [3-1:0]             d_next_q;
        reg                                          no_request_d1;
        wire                                         request_edge;

//******************************************************************************

    assign sch_enb_in   = increment_top_priority || request_edge;
    assign sch_data_in  = request;
    assign grant        = GRANT_ARRAY[sch_data_out];
    //assign grant        = (no_request_d1 == 1'b1) ? 'h0 : GRANT_ARRAY[sch_data_out];
    //assign next_q       = sch_data_out + 1'd1;
    assign sch_data_out = sch_data_out_lcl[d_next_q];

    assign request_edge = (sch_data_in != 'd0) && (no_request_d1 == 'd1);

    always @ (posedge clk or posedge reset) 
    begin
      if(reset)
      begin
        no_request_d1 <= 1'b1;
        d_next_q      <= 'h7;  //this is to start from Q7 
        //d_next_q      <= 'h0;
      end
      else
      begin
        no_request_d1 <= (sch_data_in == 'd0);
        //d_next_q      <= (SCHEME == "round-robin") ? next_q[2:0] : 'h0; 
        if(SCHEME == "round-robin") 
        begin
          if(sch_enb_in && ~sch_data_out[3]) //this is added to continue from the prev queue
             d_next_q      <= (sch_data_out == 4'd0) ? 3'd7 : (sch_data_out[2:0] - 1'd1);
        end
        else
         d_next_q      <= 3'h7; 
      end
    end

    always @ (posedge clk or posedge reset) 
    begin
      if(reset)
        sch_enb_out <= 'd0;
      else
      begin
        if (sch_enb_in == 1'b1)
        begin
          if (sch_data_in == 0) 
            sch_enb_out <= 1'b0;
          else
            sch_enb_out <= 1'b1;
        end
        else
          sch_enb_out <= 1'b0;
      end
    end

    always @ ( posedge clk or posedge reset ) begin
            if (reset)
            begin
                sch_data_out_lcl[0] <= 4'h8;
                sch_data_out_lcl[1] <= 4'h8;
                sch_data_out_lcl[2] <= 4'h8;
                sch_data_out_lcl[3] <= 4'h8;
                sch_data_out_lcl[4] <= 4'h8;
                sch_data_out_lcl[5] <= 4'h8;
                sch_data_out_lcl[6] <= 4'h8;
                sch_data_out_lcl[7] <= 4'h8;
          end
          else if((sch_data_in == 'd0) && sch_enb_in)
          begin
                sch_data_out_lcl[0] <= 4'h8;
                sch_data_out_lcl[1] <= 4'h8;
                sch_data_out_lcl[2] <= 4'h8;
                sch_data_out_lcl[3] <= 4'h8;
                sch_data_out_lcl[4] <= 4'h8;
                sch_data_out_lcl[5] <= 4'h8;
                sch_data_out_lcl[6] <= 4'h8;
                sch_data_out_lcl[7] <= 4'h8;
          end
            else begin
       if (sch_enb_in == 1'b1)
       begin
          if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 4'h7;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 4'h6;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 4'h5;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 4'h4;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 4'h3;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 4'h2;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 4'h1;
          else 
              sch_data_out_lcl [ 7 ] <= 4'h0;

          if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 4'h6;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 4'h5;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 4'h4;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 4'h3;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 4'h2;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 4'h1;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 4'h0;
          else 
              sch_data_out_lcl [ 6 ] <= 4'h7;

          if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 4'h5;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 4'h4;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 4'h3;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 4'h2;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 4'h1;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 4'h0;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 4'h7;
          else 
              sch_data_out_lcl [ 5 ] <= 4'h6;

          if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 4'h4;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 4'h3;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 4'h2;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 4'h1;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 4'h0;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 4'h7;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 4'h6;
          else 
              sch_data_out_lcl [ 4 ] <= 4'h5;

          if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 4'h3;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 4'h2;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 4'h1;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 4'h0;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 4'h7;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 4'h6;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 4'h5;
          else 
              sch_data_out_lcl [ 3 ] <= 4'h4;

          if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 4'h2;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 4'h1;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 4'h0;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 4'h7;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 4'h6;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 4'h5;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 4'h4;
          else 
              sch_data_out_lcl [ 2 ] <= 4'h3;

          if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 4'h1;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 4'h0;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 4'h7;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 4'h6;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 4'h5;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 4'h4;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 4'h3;
          else 
              sch_data_out_lcl [ 1 ] <= 4'h2;

          if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 4'h0;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 4'h7;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 4'h6;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 4'h5;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 4'h4;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 4'h3;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 4'h2;
          else 
              sch_data_out_lcl [ 0 ] <= 4'h1;

       end
          end    
    end

        /*
    always @ ( posedge clk or posedge reset ) begin
            if (reset)
            begin
                sch_data_out_lcl[0] <= 3'h0;
                sch_data_out_lcl[1] <= 3'h1;
                sch_data_out_lcl[2] <= 3'h2;
                sch_data_out_lcl[3] <= 3'h3;
                sch_data_out_lcl[4] <= 3'h4;
                sch_data_out_lcl[5] <= 3'h5;
                sch_data_out_lcl[6] <= 3'h6;
                sch_data_out_lcl[7] <= 3'h7;
          end
            else begin
       if (sch_enb_in == 1'b1)
       begin
          if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 3'h0;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 3'h1;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 3'h2;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 3'h3;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 3'h4;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 3'h5;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 0 ] <= 3'h6;
          else 
              sch_data_out_lcl [ 0 ] <= 3'h7;

          if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 3'h1;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 3'h2;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 3'h3;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 3'h4;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 3'h5;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 3'h6;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 1 ] <= 3'h7;
          else 
              sch_data_out_lcl [ 1 ] <= 3'h0;

          if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 3'h2;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 3'h3;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 3'h4;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 3'h5;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 3'h6;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 3'h7;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 2 ] <= 3'h0;
          else 
              sch_data_out_lcl [ 2 ] <= 3'h1;

          if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 3'h3;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 3'h4;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 3'h5;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 3'h6;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 3'h7;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 3'h0;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 3 ] <= 3'h1;
          else 
              sch_data_out_lcl [ 3 ] <= 3'h2;

          if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 3'h4;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 3'h5;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 3'h6;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 3'h7;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 3'h0;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 3'h1;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 4 ] <= 3'h2;
          else 
              sch_data_out_lcl [ 4 ] <= 3'h3;

          if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 3'h5;
          else if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 3'h6;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 3'h7;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 3'h0;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 3'h1;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 3'h2;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 5 ] <= 3'h3;
          else 
              sch_data_out_lcl [ 5 ] <= 3'h4;

          if ( sch_data_in [ 6 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 3'h6;
          else if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 3'h7;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 3'h0;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 3'h1;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 3'h2;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 3'h3;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 6 ] <= 3'h4;
          else 
              sch_data_out_lcl [ 6 ] <= 3'h5;

          if ( sch_data_in [ 7 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 3'h7;
          else if ( sch_data_in [ 0 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 3'h0;
          else if ( sch_data_in [ 1 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 3'h1;
          else if ( sch_data_in [ 2 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 3'h2;
          else if ( sch_data_in [ 3 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 3'h3;
          else if ( sch_data_in [ 4 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 3'h4;
          else if ( sch_data_in [ 5 ] == 1'b1 )
              sch_data_out_lcl [ 7 ] <= 3'h5;
          else 
              sch_data_out_lcl [ 7 ] <= 3'h6;

       end
          end    
    end
        */

endmodule
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6ythZnd1+AbE/D8XbWleWX7k2GgDP/XADoFYRBei5SC2zuIgYm0HQYoI0ISBQyPlmsLertnpHl2KUgXDMRuokkDCZPcIX3C7Ip8mBZ4siNHQTa2tHpu+zOFPMzNGBlVABVHjUe3J18ZXZLv0I0p9H4NFSNLkh1YMl1/UVlM70joZIdFaJqkW5ztJaE26jE9bLs85crTN/48pLC3UScl49ILaGQ2q4I0/8Zw8IsGmv9/J0QHlV9rKzb4lUWKHqn/3fsfE1zFHhiz5u+5eY8HsNPPJFiIRPkW9DgoN1VQFoCatCvECM9xMdtCddOYFecCIlxA3ZX6elipXXSuPaB60W3vnaTudetCdoSA3HqNTnKvEK/SFItC8HzGjYYKZWwTmA/bzSKkVn7wfBhrk5QcfChgIArxFlSLLblZ5wGV9gCwQyWolAkVwMv8Lx4sLjwEEUoqmOQ55Goz+96ZKN449j8vOAIuZcIC46iL1t5XYPzh/XuWE5jH2DGd2a1cBXZI+rEMk9aqaHdACgHYx6etcfi5CHpHsDSMSLjkJWRIFtnJVhYy9RgAuKYViM430BNV+fFxWw/j97RiIbWg909Vn67ySg8V0OsLwIc8xl74SIT4sXoFO507P4d468FVMj6xJDXO7cUvHEA2Oj4Kg2FG2CBrTa6EwnL/I0K7nbS0OnZHlT7jzcaKgWZV5IErvEKFP1APy/OgSSn396Xoj974YsqCz2z++TIw7qSUOHghAHYAKNTmH0MYMctrO2HfCITgGdPRzPhkUBDUVxchg807HgjMY"
`endif