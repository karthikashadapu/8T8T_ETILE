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
//------------------------------------------------------------------------------
//

// ==========================================================================
// Project           : HSSI Subsystem 
// Module            : SS_RST_SEQ.sv 
// Description       : 
// Author            : Sibajit Patnaik
// Created           : 04-Aug-2020
// ===============================================================================
//  History
//
//  Aug-2020	Sibajit Patnaik		Created
//  Oct-2021	Sajith Kunnathu		Added support for ACK from initiator interface
//
// ===============================================================================

module SS_RST_SEQ #(
  parameter       NUM_RESPONDERS = 10,
  parameter       NUM_INITIATORS = 12,
  parameter       NUM_RESPONDER_HANDSHAKES = 2,
  parameter       DLY_COUNTWIDTH = 8,
  parameter [NUM_RESPONDERS:1-0] INIT_RESP_IN_EN_PATTERN    [NUM_INITIATORS-1:0] = '{default:{NUM_RESPONDERS{1'b1}}},
  parameter [DLY_COUNTWIDTH-1:0] RESP_ACK_ASSERT_DELAY_CYCLE_COUNT   [NUM_RESPONDERS-1:0] = '{default:32},
  parameter [DLY_COUNTWIDTH-1:0] RESP_ACK_DEASSERT_DELAY_CYCLE_COUNT [NUM_RESPONDERS-1:0] = '{default:32},
  parameter                      MAX_NUM_RESP_TO_INIT_HS = 16,
  parameter [$clog2(MAX_NUM_RESP_TO_INIT_HS):0] NUM_RESP_TO_INIT_HS [NUM_RESPONDER_HANDSHAKES-1:0] = '{default:4},
  parameter [NUM_INITIATORS-1:0] INIT_ACK_MODE_SELECT = 0

)(
  input                             rst_seq_clk,
  input                             reset_n,

  // Responder Reset Interface
  input        [NUM_RESPONDERS-1:0] resp_reset_n,
  output       [NUM_RESPONDERS-1:0] resp_reset_ack_n,

  // Responder Handshake Interface
  input        [NUM_RESPONDER_HANDSHAKES-1:0] resp_handshakes_req,
  output logic [NUM_RESPONDER_HANDSHAKES-1:0] resp_handshakes_ready,

  // Initiator Reset Interface
  output logic [NUM_INITIATORS-1:0] init_reset_n,
  input        [NUM_INITIATORS-1:0] init_reset_ack_n,

  // Initiator Handshake Interface
  output        [MAX_NUM_RESP_TO_INIT_HS-1:0] init_handshakes_req   [NUM_RESPONDER_HANDSHAKES-1:0],
  input         [MAX_NUM_RESP_TO_INIT_HS-1:0] init_handshakes_ready [NUM_RESPONDER_HANDSHAKES-1:0]
);

  //----------------------------------------
  // Signals
  //----------------------------------------

  genvar h,i,r;
  logic [NUM_RESPONDERS-1:0] resp_reset_sync_n;
  logic [NUM_RESPONDERS-1:0] resp_reset_sync_data_n;
  logic [NUM_RESPONDERS-1:0] ncycle_ack_n = {NUM_RESPONDERS{1'b1}};
  logic [DLY_COUNTWIDTH-1:0] ncycle_count[NUM_RESPONDERS-1:0] = '{default:0};

  logic  [NUM_RESPONDER_HANDSHAKES-1:0] resp_hs_req_sync;
  logic  [MAX_NUM_RESP_TO_INIT_HS-1:0]  resp_hs_rdy_sync[NUM_RESPONDER_HANDSHAKES-1:0];
  logic  [NUM_INITIATORS-1:0]           init_reset_ack_n_sync;
  logic  [NUM_RESPONDERS-1:0]           resp_reset_ack_n_assert;
  logic  [NUM_RESPONDERS-1:0]           resp_reset_ack_n_deassert;
  logic  [NUM_RESPONDERS-1:0]           resp_reset_ack_n_int = {NUM_RESPONDERS{1'b1}};
  
  //----------------------------------------
  // Initiator Request Sync
  //----------------------------------------

  // Mapping of handshake req from responder to initiator. Initiator side port width is fixed
  // by a parameter MAX_NUM_RESP_TO_INIT_HS. For a initiator N, Only Number of bits defined by
  // NUM_RESP_TO_INIT_HS[n] will be driven by below logic. Slave device may ignore remaining upper bits

generate for ( h=0;h<NUM_RESPONDER_HANDSHAKES;h++) begin : gen_hs_req_sync

  hssi_ss_std_synchronizer_nocut hs_req_sync (.clk (rst_seq_clk), .reset_n (reset_n), .din (resp_handshakes_req[h]), .dout (resp_hs_req_sync[h]));
  
  if (NUM_RESP_TO_INIT_HS[h] == 0) begin
    assign init_handshakes_req[h][MAX_NUM_RESP_TO_INIT_HS-1:NUM_RESP_TO_INIT_HS[h]] = '0;
  end else if (NUM_RESP_TO_INIT_HS[h] == MAX_NUM_RESP_TO_INIT_HS) begin
    assign init_handshakes_req[h][MAX_NUM_RESP_TO_INIT_HS-1:0] = {MAX_NUM_RESP_TO_INIT_HS{resp_hs_req_sync[h]}};
  end else begin
    assign init_handshakes_req[h][MAX_NUM_RESP_TO_INIT_HS-1:NUM_RESP_TO_INIT_HS[h]] = '0;
	assign init_handshakes_req[h][NUM_RESP_TO_INIT_HS[h]-1:0] = {NUM_RESP_TO_INIT_HS[h]{resp_hs_req_sync[h]}};
  end
  
end endgenerate

  //----------------------------------------
  // Initiator Ready Sync
  //----------------------------------------

  // Mapping of handshake ready from initiator to responder. Initiator side port width is fixed
  // by a parameter MAX_NUM_RESP_TO_INIT_HS. For a initiator N, Only Number of bits defined by
  // NUM_RESP_TO_INIT_HS[n] will be considered for ready aggregation. Slave device may ignore
  // remaining upper bits or may drive zeroes.

generate for ( h=0;h<NUM_RESPONDER_HANDSHAKES;h++) begin : gen_hs_rdy_sync

  if (NUM_RESP_TO_INIT_HS[h] == 0) begin
    assign resp_handshakes_ready[h] = 1'b0;
  end else begin

    for ( i=0;i<NUM_RESP_TO_INIT_HS[h];i++) begin : gen_init_to_hs_sync
      hssi_ss_std_synchronizer_nocut hs_rdy_sync (.clk (rst_seq_clk), .reset_n (reset_n), .din (init_handshakes_ready[h][i]), .dout (resp_hs_rdy_sync[h][i]));
    end
    
    always_comb begin
      resp_handshakes_ready[h] = 1'b1;
      for (int k=0;k<NUM_RESP_TO_INIT_HS[h];k++) begin
        resp_handshakes_ready[h] = resp_handshakes_ready[h] & resp_hs_rdy_sync[h][k];
      end
    end
	 
  end
  
end endgenerate

  //----------------------------------------
  // Responder Reset Synchronizer
  //----------------------------------------

  // Responder reset is synchronized as reset inorder to assert initiator reset asynchronously
  // Responder reset is synchronized as data inorder to use this signal in ACK aggregation.
  // Spyglass cdc issue will be flagged if the later is not taken care.

generate for ( r=0;r<NUM_RESPONDERS;r++) begin : gen_resp_rst_sync
  hssi_ss_std_synchronizer_nocut resp_rst_sync (.clk (rst_seq_clk), .reset_n (resp_reset_n[r]), .din (1'b1), .dout (resp_reset_sync_n[r]));
  hssi_ss_std_synchronizer_nocut #(.rst_value(1)) resp_data_sync (.clk (rst_seq_clk), .reset_n (reset_n), .din (resp_reset_n[r]), .dout (resp_reset_sync_data_n[r]));
end endgenerate

  //----------------------------------------
  // Initiator Reset Out Pattern
  //----------------------------------------

  // Aggregates all responder transactions to a particular initiator interface N, depending on mapping
  // enabled in pattern INIT_RESP_IN_EN_PATTERN[N]. When this for loop is unwinded during synth/sim,
  // it gets simplified to pura AND gate logic

generate for ( i=0;i<NUM_INITIATORS;i++) begin : gen_init_rst_out
  always_comb begin
    init_reset_n[i] = 1'b1;
    for (int k=0;k<NUM_RESPONDERS;k++) begin
      if(((INIT_RESP_IN_EN_PATTERN[i]>>k) & {{(NUM_RESPONDERS-1){1'b0}},1'b1}) != '0) begin
        init_reset_n[i] = init_reset_n[i] & resp_reset_sync_n[k];
      end
    end
  end
end endgenerate

  //----------------------------------------
  // Initiator Reset ACK Synchronizer
  //----------------------------------------

  // Synchronize acknowledge from initiator interface to common clock only if it is enabled.
  // Following logic will consider ack from counter logic otherwise.

generate for ( i=0;i<NUM_INITIATORS;i++) begin : gen_init_ack_sync
  if (INIT_ACK_MODE_SELECT[i]) begin : gen_use_init_ack
    hssi_ss_std_synchronizer_nocut #(.rst_value(1)) init_ack_sync (.clk (rst_seq_clk), .reset_n (reset_n), .din (init_reset_ack_n[i]), .dout (init_reset_ack_n_sync[i]));
  end else begin : gen_use_delay_count
   assign init_reset_ack_n_sync[i] = 1'b0;
  end
end endgenerate

  //----------------------------------------
  // Responder Ack
  //----------------------------------------

  // Below logic is modifed to support ACknowledge from Initiator interface. Type of acknowledgement
  // can be selected using a parameter INIT_ACK_MODE_SELECT. Each bit of this parameter indicates to
  // use ACK from interface or internal delay counter before issuing ACK to Responder.

generate for ( r=0;r<NUM_RESPONDERS;r++) begin : gen_resp_reset_ack

  // A delay counter per responder is implemented to keep backward compatibility with IPs which are
  // already using this block. When a responder initiates assertion/deassertion of reset, delay
  // counter starts counting up. Counter stops when it matches with parameterized value of delay for
  // that particular responder, and asserts/deasserts ncycle_ack_n. This delay based ack signal is
  // used for an initiator N if its ACK signal usage is disabled by parameter INIT_ACK_MODE_SELECT[N].

  always @(posedge rst_seq_clk, negedge reset_n) begin
    if (!reset_n) begin
	  ncycle_count[r] <= {DLY_COUNTWIDTH{1'b0}};
	  ncycle_ack_n[r] <= 1'b1;
    end else begin
      case({ncycle_ack_n[r],resp_reset_sync_data_n[r]})
        2'b10:
          if(ncycle_count[r] == (RESP_ACK_ASSERT_DELAY_CYCLE_COUNT[r] - 2)) begin
            ncycle_count[r] <= {DLY_COUNTWIDTH{1'b0}};
            ncycle_ack_n[r] <= resp_reset_sync_data_n[r];
          end else if(resp_reset_sync_data_n[r] ^ ncycle_ack_n[r]) begin
            ncycle_count[r] <= ncycle_count[r] + 1'b1;
          end else begin
            ncycle_count[r] <= 'h0;
          end
        2'b01:
          if(ncycle_count[r] == (RESP_ACK_DEASSERT_DELAY_CYCLE_COUNT[r] - 2)) begin
           ncycle_count[r] <= {DLY_COUNTWIDTH{1'b0}};
           ncycle_ack_n[r] <= resp_reset_sync_data_n[r];
          end else if(resp_reset_sync_data_n[r] ^ ncycle_ack_n[r]) begin
            ncycle_count[r] <= ncycle_count[r] + 1'b1;
          end else begin
            ncycle_count[r] <= 'h0;
          end
        default: begin
          ncycle_count[r] <= ncycle_count[r];
          ncycle_ack_n[r] <= ncycle_ack_n[r];
        end
      endcase
    end
  end

  // Acknowledgement towards responder is generated only when all of its enabled initiators are acknowledged.
  // For every assertion & deassertion, acknowledgement is required, and has to be correctly decoded from its
  // only enabled initiators. If INIT_ACK_MODE_SELECT for that initiator is 0, delay counter is used to interpret
  // its acknowledge.Here, INIT_RESP_IN_EN_PATTERN is used to recognize a responder's mapped initiators. For
  // every mapped initiator n, ACK is aggregated from initiator interface if INIT_ACK_MODE_SELECT[n] is true,
  // delay counter based ACK is used otherwise.

  // During synthesis & Simulation, below for loop is unwinded to form simple AND/NOT gate logic where it performs
  // AND of either ACK from initiator or ACK from counter logic
  always_comb begin
    resp_reset_ack_n_assert[r] = 1'b1;
    resp_reset_ack_n_deassert[r] = 1'b1;
    for (int p=0;p<NUM_INITIATORS;p++) begin
      if(((INIT_RESP_IN_EN_PATTERN[p]>>r) & {{(NUM_RESPONDERS-1){1'b0}},1'b1}) != '0) begin
        if (INIT_ACK_MODE_SELECT[p]) begin
          resp_reset_ack_n_assert[r]   = resp_reset_ack_n_assert[r]   & ~init_reset_ack_n_sync[p];
          resp_reset_ack_n_deassert[r] = resp_reset_ack_n_deassert[r] &  init_reset_ack_n_sync[p];
        end else begin
          resp_reset_ack_n_assert[r]   = resp_reset_ack_n_assert[r]   & ~ncycle_ack_n[r];
          resp_reset_ack_n_deassert[r] = resp_reset_ack_n_deassert[r] &  ncycle_ack_n[r];
        end
      end
    end
  end

  // Above logic aggregates ACK signal assertion & deassertion from all initiators. Since there is m:n mapping
  // from responder to initiator, the same initiator ACK gets aggregated towards multiple reponders when ACK
  // from initiator interface is used. This is prevented by monitoring asert & deassert only when resp_reset_n &
  // resp_reset_ack_n differs.
  // Scenario: If Acknowledge is sent out only the active responder, other responders are not aware of current
  // initiator interface activity. And any conflicting activity from other responders may result in inintented
  // results. It is better to let all respondersof particular initiator know about current bus activity. This scenario
  // is not handled here

  always @(posedge rst_seq_clk, negedge reset_n) begin
    if(!reset_n) begin
      resp_reset_ack_n_int[r] <= 1'b1;
    end else begin
      case({resp_reset_ack_n_int[r],resp_reset_sync_data_n[r]})
        2'b01:begin
          resp_reset_ack_n_int[r] <= resp_reset_ack_n_assert[r]? 1'b0 : resp_reset_ack_n_deassert[r]? 1'b1 : resp_reset_ack_n_int[r];
	end
	2'b10:begin
          resp_reset_ack_n_int[r] <= resp_reset_ack_n_assert[r]? 1'b0 : resp_reset_ack_n_deassert[r]? 1'b1 : resp_reset_ack_n_int[r];
	end
	default:begin
          resp_reset_ack_n_int[r] <= resp_reset_ack_n_int[r]; 	  
	end
      endcase
      //resp_reset_ack_n_int[r] <= (resp_reset_ack_n_int[r] ^ resp_reset_sync_data_n[r]) ?
      //                             resp_reset_ack_n_assert[r]? 1'b0 : resp_reset_ack_n_deassert[r]? 1'b1 : resp_reset_ack_n_int[r] :
      //                       resp_reset_ack_n_int[r];
      //resp_reset_ack_n[r] <= resp_reset_ack_n_assert[r]? 1'b0 : resp_reset_ack_n_deassert[r]? 1'b1 : resp_reset_ack_n[r];
    end
  end

  assign resp_reset_ack_n[r] = resp_reset_ack_n_int[r];

end endgenerate
  

endmodule
//------------------------------------------------------------------------------
//
//
// End SS_RST_SEQ.sv
//
//------------------------------------------------------------------------------
 
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yvsK06dFZit+y8XuVOJ22Ut7iO8qpm8GMlL8Hii955oPtez4GZt2V2ltUijfqLp761dZH64FRFTSd2/GWt6awA+kQIoNXfqQvICwD9jVEm8be/GBQhcGtg3gEW1MsiODoVHwk8luedAIlJapj5g0XYqukWND4lJn3fpnlywTh8ciGTxRVDg9Oc3xNExkN7hSepDXXGhb+RMX0Lgl/OW/iXsW8LyCzKl5jJtOhKqebvARfudFncMsXfP6dE7+tiHYsib3x3VcgzubzHNIaYE44LrMgSnPiPmDqSOF6bLTaJGvKpjkwiRhva2YZU/qYUH5yQnuRorelpn6JZhIvgxuaueJu08aTOGtkYVP5y/hfXk+4gtt7669AIPhDKcGIyRXUxUcVv/fHTLR1I05+6JcKSU47teMVmY1iwmB1f6lPneo43+t7KpcPqEhXt3Xzz6DUSih+imdMyQIWTTN5BoSClK4CBv+tBnTLem+d4Vh7xeWolHPK5JUN0UwneMLt4RkrcIOiR1mBItv8fwO7zLwpJetS7CFOe4/otnXkcHa4mXco7aeQVqlcZwPtzJpzQUIdA/dXVPvpelOO+mJeGic9Y8aKYMoRnmsHWDEVJBEXNWKy1oCyUTbtdeEekrUQvT3FV0qBQ7Xw1Xp6jymz8bYf4unw5hle27HU+wy2HN9jz03LPINbrSVLtNbLQ0pASut9ihj93fELwz3kuHwpC6r+r3hUpueyC9YgOTjWSh7XPqOUpHVgC8APvWENs4IYeLjyIWEihlzdu663Wz/EuFjK6r"
`endif