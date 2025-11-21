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


//check for one or n -channels, use all rst & clk's per channel
//check reset connectvity based on access vs traffic
//use

module hssi_ss_hotplug #(
        parameter NUM_CHANNELS = 1,
        parameter PORT_PROFILE = "25GbE",
        parameter PORT_DR_EN   = 1'b0,
        parameter PORT_ANLT_EN = 1'b0,
        parameter SIM_MODE     = 0
        ) ( 
        input                             i_csr_rst_n,
        input                             i_reconfig_reset,
        input                             i_reconfig_clk,
        input                             i_pulse_1ms,
        input                             i_rx_pma_ready,
        input                             i_po_cal_done,
        input                             i_rx_is_lockedtodata,
        input                             i_rx_is_lockedtodata_all,
        input                             i_rx_pcs_ready,
        input [5:0]                       i_port_profile, 
        input                             i_port_ch_enable,  //1st channel incase of 100G

        input                             i_anlt_paused,
        output reg                        o_anlt_paused,
        output reg                        o_self_anlt_pause_state,//to make sure all lanes unpuase at same time
        input                             i_all_anlt_pause_state,//incase where fast link-up down happens, link break happens before HP complete, but not detected by all lanes
        output reg                        o_self_lane_down,  //lane down after hotplug complete 
        input                             i_any_lane_down,  //any one of lane is down
        //
        input                             i_hotplug_disable, // to disable the hotplug
        input                             i_hotplug_lpbk_en_fm, // loopback enabled from FW 
        input                             i_load_recipe_disable, //loads only standard VSR/LR recipe only, not the user selected
        input                             i_load_lr_recipe_only,
        input                             i_load_vsr_recipe_only,
        input                             i_hotplug_pause, //this it to pause the hotplug logic after the signal is in lock state, stop checks the signal present
        input                             i_hotplug_ilb_cal_disable, //this it to disable the ILB calibration   
        input [15:0]                      i_sig_wait_cntr, 
        //
        output reg                        o_hotplug_busy,
        output reg                        o_hotplug_complete, //hot plug FSM completed with pass
        output reg                        o_hotplug_disabled, //hot plug FSM pause indication to the user (incase of hotplug disable or pause)
        output reg                        o_hotplug_paused, //hot plug FSM pause indication to the user (incase of hotplug disable or pause)
        output                            o_vsr_lr_recipe_enabled,
        output                            o_rcp_mail_timeout,
        output reg [15:0]                 o_eye_value,
        //Eth reconfig interface
        input [19*NUM_CHANNELS-1:0]       i_eth_reconfig_address,                                                             
        input [NUM_CHANNELS-1:0]          i_eth_reconfig_read,                                                                
        input [NUM_CHANNELS-1:0]          i_eth_reconfig_write,                                                               
        input [32*NUM_CHANNELS-1:0]       i_eth_reconfig_writedata,                                                            
        output [32*NUM_CHANNELS-1:0]      o_eth_reconfig_readdata,                                                             
        output [NUM_CHANNELS-1:0]         o_eth_reconfig_waitrequest, 
        output [NUM_CHANNELS-1:0]         o_eth_reconfig_readdatavalid, 
        //
        // XCVR reconfig, hssi-facing side
        output wire [NUM_CHANNELS-1:0]    eth_reconfig_write,
        output wire [NUM_CHANNELS-1:0]    eth_reconfig_read,
        output wire [19*NUM_CHANNELS-1:0] eth_reconfig_address,
        output wire [32*NUM_CHANNELS-1:0] eth_reconfig_writedata,
        input wire [32*NUM_CHANNELS-1:0]  eth_reconfig_readdata,
        input wire [NUM_CHANNELS-1:0]     eth_reconfig_waitrequest,
        input wire [NUM_CHANNELS-1:0]     eth_reconfig_readdatavalid,
        // Seperate XCVR reconfig Interfaces for each xcvr lane                                                          
        // User-facing side                                                                                              
        input [19*NUM_CHANNELS-1:0]       i_xcvr_reconfig_address,                                                             
        input [NUM_CHANNELS-1:0]          i_xcvr_reconfig_read,                                                                
        input [NUM_CHANNELS-1:0]          i_xcvr_reconfig_write,                                                               
        input [8*NUM_CHANNELS-1:0]        i_xcvr_reconfig_writedata,                                                            
        output [8*NUM_CHANNELS-1:0]       o_xcvr_reconfig_readdata,                                                             
        output [NUM_CHANNELS-1:0]         o_xcvr_reconfig_waitrequest, 
        //
        // XCVR reconfig, hssi-facing side
        output wire [NUM_CHANNELS-1:0]    xcvr_reconfig_write,
        output wire [NUM_CHANNELS-1:0]    xcvr_reconfig_read,
        output wire [19*NUM_CHANNELS-1:0] xcvr_reconfig_address,
        output wire [8*NUM_CHANNELS-1:0]  xcvr_reconfig_writedata,
        input wire [8*NUM_CHANNELS-1:0]   xcvr_reconfig_readdata,
        input wire [NUM_CHANNELS-1:0]     xcvr_reconfig_waitrequest

        );

  localparam SIGNAL_MON_CNT = SIM_MODE ? 17'd125 : 17'd125000; //1msec        
  localparam ROM_ADDR_WIDTH = PORT_DR_EN ? 'd10 : 'd8;

  localparam MAIL_TO_CNTR_VAL     = 7'd100;
  localparam WAIT_10MSEC_CNTR_VAL = SIM_MODE ? 'd3 : 'd10; 
  localparam WAIT_1SEC_CNTR_VAL   = SIM_MODE ? 'd300 : 'd1000; 
  
  localparam [3:0] IDLE         = 4'h0; 
  localparam [3:0] LOAD_PMA_VSR = 4'h1; 
  localparam [3:0] LOAD_PMA_LR  = 4'h2; 
//  localparam [3:0] RX_INIT      = 4'h3; 
  localparam [3:0] CHK_HF_LF_GAIN  = 4'h3; 
  localparam [3:0] RUN_ICAL     = 4'h4; 
  localparam [3:0] CHK_ICAL     = 4'h5; 
  localparam [3:0] RUN_PCAL     = 4'h6; 
  localparam [3:0] CHK_PCAL     = 4'h7; 
  localparam [3:0] WAIT_10MSEC  = 4'h8; 
  localparam [3:0] CHK_SIGNAL   = 4'h9; 
  localparam [3:0] CHK_EYE      = 4'hA; 
  localparam [3:0] STOP_PCAL    = 4'hB; 
  localparam [3:0] CHK_STOP_PCAL= 4'hC; 
  localparam [3:0] WAIT_1SEC    = 4'hD; 
  localparam [3:0] ILB_CAL	    = 4'hE; 
  localparam [3:0] ANLT_PAUSE   = 4'hF; 

  // Parser states
  localparam [4:0] RCP_IDLE        = 5'h00;
  localparam [4:0] INIT_RCP        = 5'h01;
  localparam [4:0] READ_ROM        = 5'h02;
  localparam [4:0] WAIT_ROM_DATA   = 5'h03;
  localparam [4:0] SEND_DATA       = 5'h05;
  localparam [4:0] END_OF_RCP      = 5'h06;
  localparam [4:0] RCP_TIMEOUT     = 5'h0B;
  localparam [4:0] RCP_FINISH      = 5'h0C;

  localparam [7:0] MAIL_IDLE        = 8'h00;
  localparam [7:0] MAIL_WRITE       = 8'h01;
  localparam [7:0] WAIT_WRITE       = 8'h02;
  localparam [7:0] READ_8A          = 8'h03;
  localparam [7:0] WAIT_8A          = 8'h04;
  localparam [7:0] READ_8B          = 8'h05;
  localparam [7:0] WAIT_8B          = 8'h06;
  localparam [7:0] READ_88          = 8'h07;
  localparam [7:0] WAIT_88          = 8'h08;
  localparam [7:0] READ_89          = 8'h09;
  localparam [7:0] WAIT_89          = 8'h0A;
  localparam [7:0] MAIL_TO          = 8'h0B;
  localparam [7:0] MAIL_FINISH      = 8'h0C;
  localparam [7:0] WRITE_8A         = 8'h0D;
  localparam [7:0] WAIT_WRITE_8A    = 8'h0E;

//generate
//  if(PORT_DR_EN)
//    localparam PORT_RECIPE_ROM_SEL = "DR";
//  else if(PORT_PROFILE == "10GbE")
//    localparam PORT_RECIPE_ROM_SEL = "10G_NRZ";
//  else if((PORT_PROFILE == "25GbE") || (PORT_PROFILE == "100GCAUI-4"))
//    localparam PORT_RECIPE_ROM_SEL = "25G_NRZ";
//  else if(PORT_PROFILE == "100GAUI-2")
//    localparam PORT_RECIPE_ROM_SEL = "50G_PAM4";
//  else //CPRI
//    localparam PORT_RECIPE_ROM_SEL = "10G_NRZ";
//endgenerate

localparam PORT_RECIPE_ROM_SEL = PORT_DR_EN ? "DR" : ((PORT_PROFILE == "100GAUI-2") ? "50G_PAM4" : 
                                 (((PORT_PROFILE == "25GbE") || (PORT_PROFILE == "100GCAUI-4")) ? "25G_NRZ" : "10G_NRZ"));  

  wire        rx_is_lockedtodata_sync;
  wire        rx_pma_ready_sync; 
  wire        rx_pcs_ready_sync; 
  reg  [16:0] rx_freq_locked_cntr;
  reg         rx_freq_locked_1msec;
  wire        po_cal_done;
  //
  reg  [3:0]  state;
  reg  [3:0]  state_prev;
  reg  [3:0]  state_cntr;
  reg         lr_recipe_en;
  reg         vsr_recipe_en;
  reg         rcp_load;
  reg         rcp_load_d1;
  reg         rcp_load_busy;
  reg         rcp_load_timeout;
  reg         rcp_load_finish;
  reg         cal_mail_en;
  reg  [31:0] cal_mail_data;
  reg         signal_detect_cntr_en;
  reg         eye_ok, eye_fail;
  reg         wait_done;
  reg         pam4_en;
  reg  [2:0]  eye_cntr;
  reg  [1:0]  port_rcp_no;
  reg  [15:0] lf_gain;
  reg         read_hf_gain;

  reg  [ROM_ADDR_WIDTH:0]    rcp_address;
  reg  [ROM_ADDR_WIDTH-1:0]  rom_address;
  wire [31:0] rom_readdata;
  reg  [7:0]  recipe_length;

  reg  [4:0]  load_state;
  reg  [4:0]  rcp_load_state;

  reg         mail_timer_en;
  reg         anlt_timer_en;
  reg  [6:0]  mail_timer;
  reg  [7:0]  mail_state;
  reg         new_mail;
  reg         mail_readdata_state_en;
  reg  [31:0] mail_data;
  reg  [15:0] mail_readdata;
  reg         mail_timeout, mail_finish;
  reg  [2:0]  write_cntr;

  reg         rcp_avmm_write;
  reg         rcp_avmm_read;
  reg  [18:0] rcp_avmm_address; 
  reg  [7:0]  rcp_avmm_writedata;
  wire [7:0]  rcp_avmm_readdata;
  wire        rcp_avmm_waitrequest;

  reg  [15:0] wait_cntr;
  reg  [2:0]  ilb_cal_cntr;
  reg         enable_ilb_cal;
  wire [15:0] ical_timeout_cntr; 
  reg         wr_pma_effort_lvl;
  reg  [1:0]  effort_wr_cntr;
  reg  [1:0]  wr_rx_en_cntr;
  reg         pcal_cntr;
  reg         anlt_pause_en;
  reg         hotplug_disable_gated;
  reg         lf_reg_cfg_en;


//***********************************************************************************
// 1. dummy waitrequest to axilite xcvr reconfig if if hotplug is busy.
// 2. each recipe willbe 256 locations, 1st location indicate the length or no of valid configs
// 3. 10g only one recipe 
// 4. 1-256 - VSR recipe, 257-512 LR recipe
//  -- not possible to try with last recipe. as its not possible to determine the signal detect without loading and calibration
//


// 1. hotplug disable will work only in rx_init so wait_1sec states, so it will take time to disable logic, but will be disabled
// 2. reciepe_disable can be set to high to disable hot plug logic fast
// 3. hotplug pause is to stop the continuous monitoring of RX signal, if it enabled it will start from the pause 
//***********************************************************************************

  alt_xcvr_resync_std #(
    .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
      ) U_rx_cdr_lock_sync_inst (
        .clk     (i_reconfig_clk),
        .reset   (1'b0),
        .d       (i_rx_is_lockedtodata),
        .q       (rx_is_lockedtodata_sync)
      );

  alt_xcvr_resync_std #(
    .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
      ) U_rx_pma_ready_sync (
        .clk     (i_reconfig_clk),
        .reset   (1'b0),
        .d       (i_rx_pma_ready),
        .q       (rx_pma_ready_sync)
      );

  alt_xcvr_resync_std #(
    .SYNC_CHAIN_LENGTH(3),    .WIDTH(NUM_CHANNELS),  .INIT_VALUE(0)
      ) U_rx_pcs_ready_sync_inst (
        .clk     (i_reconfig_clk),
        .reset   (1'b0),
        .d       (i_rx_pcs_ready),
        .q       (rx_pcs_ready_sync)
      );

//Signal detect logic

    always@(posedge i_reconfig_clk or negedge i_csr_rst_n)
    begin
      if(~i_csr_rst_n)
        rx_freq_locked_cntr <= 17'd0;
      else if(signal_detect_cntr_en)
      begin
        if(rx_is_lockedtodata_sync == 1'b0) 
          rx_freq_locked_cntr <= 17'd0;
        else if(rx_freq_locked_cntr >= SIGNAL_MON_CNT)
          rx_freq_locked_cntr <= SIGNAL_MON_CNT; 
        else
          rx_freq_locked_cntr <= rx_freq_locked_cntr + 1'd1; 
      end
      else
        rx_freq_locked_cntr <= 17'd0;
    end

    always@(posedge i_reconfig_clk or negedge i_csr_rst_n)
    begin
      if(~i_csr_rst_n)
        rx_freq_locked_1msec <= 1'b0;
      else if(rx_freq_locked_cntr == SIGNAL_MON_CNT)
        rx_freq_locked_1msec <= 1'b1;
      else
        rx_freq_locked_1msec <= 1'b0;
    end
    
    /*
    always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
    begin
      if(~i_csr_rst_n)
      begin
        rx_freq_locked_1msec_d1    <= 1'b0;
        rx_freq_locked_1msec_d2    <= 1'b0;
        rx_freq_locked_1msec_pedge <= 1'b0;
      end
      else
      begin
        rx_freq_locked_1msec_d1    <= rx_freq_locked_1msec; 
        rx_freq_locked_1msec_d2    <= rx_freq_locked_1msec_d1;
        rx_freq_locked_1msec_pedge <= rx_freq_locked_1msec_d1 && ~rx_freq_locked_1msec_d2;
      end
    end
    */

  assign po_cal_done = SIM_MODE ? 1'b1 : i_po_cal_done;
  assign o_vsr_lr_recipe_enabled = lr_recipe_en;

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
      o_hotplug_complete <= 1'b0;
    else if(i_hotplug_lpbk_en_fm && (state_cntr == 'd4))
      o_hotplug_complete <= 1'b1;
    else if(eye_ok && (state_cntr == 'd4))
      o_hotplug_complete <= 1'b1;
    else if(eye_fail || ~rx_is_lockedtodata_sync)
      o_hotplug_complete <= 1'b0;
  end

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
      o_hotplug_busy <= 1'b0; 
    else if(state == IDLE)
      o_hotplug_busy <= 1'b0; 
    else if(state == WAIT_1SEC)
      o_hotplug_busy <= 1'b0; 
    else
      o_hotplug_busy <= 1'b1; 
  end

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
      o_hotplug_disabled <= 1'b0;
    else if(state == IDLE)
      o_hotplug_disabled <= 1'b1;
    else
      o_hotplug_disabled <= 1'b0;
  end

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
      o_hotplug_paused <= 1'b0;
    else if((state == WAIT_1SEC) && i_hotplug_pause)
      o_hotplug_paused <= 1'b1;
    else
      o_hotplug_paused <= 1'b0;
  end

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
    begin
    if(~i_csr_rst_n)
      pam4_en <= 1'b0;
    else if(PORT_DR_EN)
      pam4_en <= (i_port_profile[5:4] == 2'd3) ? (i_port_profile[3:0] == 4'd4) : 1'b0;
    else if(PORT_PROFILE == "100GAUI-2")
      pam4_en <= 1'b1;
    else
      pam4_en <= 1'b0;
    end

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
    begin
    if(~i_csr_rst_n)
      eye_cntr <= 3'd0;
    else if(state == CHK_EYE)
    begin
      if(pam4_en && mail_finish)
      begin
        if(eye_cntr <= 'd6)
          eye_cntr <= eye_cntr + 1'd1;
        else
          eye_cntr <= 'd6;
      end
      else if(mail_finish)
        eye_cntr <= 'd6;
    end
    else
      eye_cntr <= 3'd0;
  end

//eye value is always 0x0 in simulation
  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
    begin
      eye_ok   <= 1'b0;
      eye_fail <= 1'b0;
      o_eye_value <= 16'd0;
    end
    else if(state == CHK_EYE) 
    begin
      if(i_hotplug_lpbk_en_fm && mail_finish)
      begin
        eye_fail <= 1'b0;
        eye_ok   <= 1'b1;
        o_eye_value <= mail_readdata; 
      end
      else if(state_cntr == 'd4) //checking eye status during link down, wait 1sec state
      begin
        if(pam4_en && mail_finish)
        begin
          eye_fail <= SIM_MODE ? 1'b0 : ((mail_readdata <= 16'd10) ? 1'b1 : 1'b0);
          eye_ok   <= SIM_MODE ? (eye_cntr == 'd5) : (((eye_cntr == 'd5) && (mail_readdata > 'd10)) ? 1'b1 : 1'b0);
          o_eye_value <= mail_readdata; 
        end
        else if(mail_finish)
        begin
          eye_ok   <= SIM_MODE ? 1'b1 : ((mail_readdata > 16'd50) ? 1'b1 : 1'b0);
          eye_fail <= SIM_MODE ? 1'b0 : ((mail_readdata > 16'd50) ? 1'b0 : 1'b1);
          o_eye_value <= mail_readdata; 
        end
      end
      else  //checking eye status during linkup, after ical
      begin
      if(pam4_en && mail_finish)
      begin
        eye_fail <= SIM_MODE ? 1'b0 : ((mail_readdata <= 16'd20) ? 1'b1 : 1'b0);
        eye_ok   <= SIM_MODE ? (eye_cntr == 'd5) : (((eye_cntr == 'd5) && (mail_readdata > 'd20)) ? 1'b1 : 1'b0);
        o_eye_value <= mail_readdata; 
      end
      else if(mail_finish)
      begin
        eye_ok   <= SIM_MODE ? 1'b1 : ((mail_readdata > 16'd80) ? 1'b1 : 1'b0);
        eye_fail <= SIM_MODE ? 1'b0 : ((mail_readdata > 16'd80) ? 1'b0 : 1'b1);
        o_eye_value <= mail_readdata; 
        end
      end
    end
    else
    begin
      eye_ok   <= 1'b0;
      eye_fail <= 1'b0;
      o_eye_value <= 16'd0; 
    end
  end

  //Checking the signal fail after hotplug complete, used to reset the other lanes in 100G-ANLT case only
  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
      o_self_lane_down <= 1'b0;
    else if(PORT_ANLT_EN == 0)
      o_self_lane_down <= 1'b0;
    else if(((state == CHK_SIGNAL) && (rx_is_lockedtodata_sync == 1'b0)) || ((state == CHK_EYE) && (eye_fail == 1'b1))) 
    //else if((state_cntr == 'd4) && ((rx_is_lockedtodata_sync == 1'b0) || (eye_fail == 1'b1))) 
      o_self_lane_down <= 1'b1;
    else if(state == IDLE)
      o_self_lane_down <= 1'b0;
  end

  always @(posedge i_reconfig_clk)
  begin
    o_self_anlt_pause_state <= (state == ANLT_PAUSE) ? 1'b1 : 1'b0;
  end

  assign ical_timeout_cntr = SIM_MODE ? WAIT_10MSEC_CNTR_VAL : ((PORT_DR_EN || (PORT_PROFILE == "100GAUI-2")) ? i_sig_wait_cntr : (i_sig_wait_cntr >> 3)); 

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
      wait_cntr <= 16'd0;
    else if(state != state_prev)
      wait_cntr <= 16'd0; //resetting the counter on state change 
    else if((state == CHK_ICAL) || (state == CHK_STOP_PCAL) || (state == CHK_PCAL))
    begin
      if(i_pulse_1ms)
      begin
        if(wait_cntr < ical_timeout_cntr)
          wait_cntr <= wait_cntr + 1'd1;
        else
          wait_cntr <= 16'd0; //wait_cntr;
      end
      else
        wait_cntr <= wait_cntr;
    end
    else if(state == WAIT_1SEC)
    begin
      if(i_pulse_1ms)
      begin
        if(wait_cntr < WAIT_1SEC_CNTR_VAL)
          wait_cntr <= wait_cntr + 1'd1;
        else
          wait_cntr <= 16'd0; //wait_cntr;
      end
      else
        wait_cntr <= wait_cntr;
    end
    else if(state == WAIT_10MSEC)
    begin
      if(i_pulse_1ms)
      begin
        if(wait_cntr < WAIT_10MSEC_CNTR_VAL)
          wait_cntr <= wait_cntr + 1'd1;
        else
          wait_cntr <= 16'd0; //wait_cntr;
      end
      else
        wait_cntr <= wait_cntr;
    end
    else
      wait_cntr <= 16'd0;
  end

  always @(*) //posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    //if(~i_csr_rst_n)
    //  wait_done <= 1'b0;
    if(state != state_prev)
      wait_done <= 1'd0; //resetting on state change 
    else if(state == WAIT_10MSEC) 
    begin
      if (wr_rx_en_cntr == 'd1)
        wait_done <= ~rx_pma_ready_sync;
      else if (wr_rx_en_cntr == 'd2)
        wait_done <= rx_pma_ready_sync;
      else
        wait_done <= (wait_cntr >= WAIT_10MSEC_CNTR_VAL);
    end
    else if((state == WAIT_1SEC) && (wait_cntr >= WAIT_1SEC_CNTR_VAL))
      wait_done <= 1'b1;
    else if(((state == CHK_ICAL) || (state == CHK_STOP_PCAL) || (state == CHK_PCAL)) && (wait_cntr >= ical_timeout_cntr))
      wait_done <= 1'b1;
   else
      wait_done <= 1'b0;
 end      

 always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
 begin
  if(~i_csr_rst_n)
    effort_wr_cntr <= 2'd0;
  else if(state == RUN_ICAL)
  begin
    if(mail_finish)
    begin
      if(wr_rx_en_cntr > 'd1)
      effort_wr_cntr <= effort_wr_cntr + 2'd1;
    else
        effort_wr_cntr <= 2'd0;
    end
    else
      effort_wr_cntr <= effort_wr_cntr;
  end
  else
    effort_wr_cntr <= 2'd0;
 end

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
    wr_rx_en_cntr <= 2'd0;
    else if(PORT_ANLT_EN)   //ANLT case bypassing Rx disable to avoid local fault and linkdown
      wr_rx_en_cntr <= 2'd3;
  else if(state == RUN_ICAL)
  begin
    if(mail_finish)
    begin
      if(wr_rx_en_cntr > 'd2)
        wr_rx_en_cntr <= 2'd3;
      else
        wr_rx_en_cntr <= wr_rx_en_cntr + 2'd1;
    end
    else
      wr_rx_en_cntr <= wr_rx_en_cntr;
  end
  else if(state == WAIT_10MSEC)
    wr_rx_en_cntr <= wr_rx_en_cntr; 
  else
    wr_rx_en_cntr <= 2'd0;
 end

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
      pcal_cntr <= 1'd0;
    else if(state == STOP_PCAL)
    begin
      if(mail_finish)
        pcal_cntr <= 1'd1; 
      else
        pcal_cntr <= pcal_cntr;
    end
    else
      pcal_cntr <= 1'd0;
 end

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
    begin
      state_prev  <= IDLE;
      rcp_load_d1 <= 1'b0;
    end
    else
    begin
      state_prev  <= state;
      rcp_load_d1 <= rcp_load;
    end
  end

  //FSM for hotplug
  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
    begin
      state                   <= IDLE;
      state_cntr              <= 4'd0;
      lr_recipe_en            <= 1'b0;
      vsr_recipe_en           <= 1'b0;
      rcp_load                <= 1'b0;
      cal_mail_en             <= 1'b0;
      cal_mail_data           <= 32'h0;
      mail_readdata_state_en  <= 1'b0;
      enable_ilb_cal          <= 1'b0;
			ilb_cal_cntr            <= 3'd0;
      wr_pma_effort_lvl       <= 1'b1;
      read_hf_gain            <= 1'b0;
      lf_gain                 <= 16'd0;
      anlt_pause_en           <= 1'b1;
    end
    else
    begin
      case(state)
        IDLE :      begin
                      state_cntr              <= 4'd0;
                      rcp_load                <= 1'b0;
                      lr_recipe_en            <= 1'b0;
                      vsr_recipe_en           <= 1'b0;
                      signal_detect_cntr_en   <= 1'b0;
                      mail_readdata_state_en  <= 1'b0;
                      cal_mail_en             <= 1'b0;
      								enable_ilb_cal          <= SIM_MODE ? 1'b0 : (PORT_ANLT_EN ? 1'b0 : ~i_hotplug_ilb_cal_disable);
			                ilb_cal_cntr            <= 3'd0;
                      wr_pma_effort_lvl       <= 1'b1;
                      read_hf_gain            <= 1'b0;
                      lf_gain                 <= 16'd0;
                      anlt_pause_en           <= 1'b1;
                      if(PORT_ANLT_EN && rx_pcs_ready_sync && i_rx_is_lockedtodata_all && rx_pma_ready_sync && ~i_hotplug_disable)
                        state <= ANLT_PAUSE; 
                      else if((PORT_ANLT_EN == 0) && rx_pma_ready_sync && po_cal_done && ~i_hotplug_disable)
                        state <= STOP_PCAL; //Stopping PCAL which is enabled in PO CAL FW
                      else
                        state <= IDLE;
                    end
        ANLT_PAUSE : begin
                       if(o_anlt_paused && i_all_anlt_pause_state)
                       begin
                         if(anlt_pause_en)
                           state <= STOP_PCAL; //Stopping PCAL which is enabled in ANLT FW, during signal up  
                         else
                          state <= IDLE; //during signal down
                       end
                       else
                         state <= ANLT_PAUSE;
                     end
				ILB_CAL :		begin
                      state_cntr <= 4'd0; 
      								enable_ilb_cal <= (PORT_ANLT_EN || SIM_MODE) ? 1'b0 : ~i_hotplug_ilb_cal_disable;
                      cal_mail_en   <= mail_finish ? 1'b0 : 1'b1; 
											//cal_mail_en   <= (mail_finish && (((ilb_cal_cntr == 'd6) && ~i_hotplug_lpbk_en_fm) || ((ilb_cal_cntr == 'd5) && (mail_readdata[15:0] == 16'h2) && i_hotplug_lpbk_en_fm))) ? 1'b0 : 1'b1;
                      wr_pma_effort_lvl <= (ilb_cal_cntr == 'd4) ? 1'b0 : 1'b1;
                      

											if(ilb_cal_cntr == 3'd0)
												cal_mail_data <= 32'h00080101; //Enable ILB
											else if(ilb_cal_cntr == 3'd1) 
												cal_mail_data <= 32'h00020325;  //Enable PRBS31
											else if(ilb_cal_cntr == 3'd2)
												cal_mail_data <= 32'h002C0118; //Enable effort level to medium
											else if(ilb_cal_cntr == 3'd3)
												cal_mail_data <= 32'h006C0010; //Enable effort level to medium //TBD for PAM4
											else if(ilb_cal_cntr == 3'd4)
												cal_mail_data <= 32'h000AFFFF; // Rx EQ reset DFE
											else if(ilb_cal_cntr == 3'd5)
												cal_mail_data <= 32'h000203FF; //Disable PRBS
											else if(ilb_cal_cntr == 3'd6)
												cal_mail_data <= 32'h00080100; //Disable ILB
											
											if(mail_finish)
											begin
                        if((ilb_cal_cntr == 3'd1) && (mail_readdata[15:0] != 16'h2))
                          ilb_cal_cntr <= ilb_cal_cntr; //Holding the cal counter till PRBS write is successful
                        else if((ilb_cal_cntr == 3'd5) && (mail_readdata[15:0] != 16'h2))
                          ilb_cal_cntr <= ilb_cal_cntr; //Holding the cal counter till PRBS write is successful
                        else 
                          ilb_cal_cntr <= ilb_cal_cntr + 3'd1;

												if(i_hotplug_disable)
													state <= IDLE;
												else if(ilb_cal_cntr == 'd4)
													state <= RUN_ICAL;
												else if(((ilb_cal_cntr == 'd6) && ~i_hotplug_lpbk_en_fm) || ((ilb_cal_cntr == 'd5) && (mail_readdata[15:0] == 16'h2) && i_hotplug_lpbk_en_fm))
												begin
													enable_ilb_cal <= 1'b0;
                        	if(i_load_recipe_disable)
                        	  state <= RUN_ICAL;
                        	else if(i_load_lr_recipe_only)
                        	  state <= LOAD_PMA_LR; 
                        	else if(i_load_vsr_recipe_only)
                        	  state <= LOAD_PMA_VSR; 
                        	else
                        	  state <= LOAD_PMA_VSR; 
												end
												else
													state <= ILB_CAL;
											end
										end								
        LOAD_PMA_VSR :  begin
                      lr_recipe_en  <= 1'b0;
                      vsr_recipe_en <= 1'b1;
                      rcp_load      <= 1'b1; 
                      mail_readdata_state_en <= 1'b0;
									    enable_ilb_cal <= 1'b0;
			                ilb_cal_cntr <= 3'd0;
                      wr_pma_effort_lvl <= 1'b1;

                      if(rcp_load_finish || rcp_load_timeout)
                      begin
												if(i_hotplug_disable) //rcp_load_finish will become high if hotplug is disabled
													state <= IDLE;
                        else if(state_cntr == 4'd0)
                          state <= RUN_ICAL;
                        else if(state_cntr == 4'd1)
                          state <= RUN_ICAL;
                        else// if(state_cntr == 4'd3)
                          state <= RUN_PCAL;
                        //else
                        //  state <= LOAD_PMA_VSR;
                      end
                      else
                        state <= LOAD_PMA_VSR;
                    end
        LOAD_PMA_LR :  begin
                      lr_recipe_en  <= 1'b1;
                      vsr_recipe_en <= 1'b0;
                      rcp_load      <= 1'b1;
                      mail_readdata_state_en <= 1'b0;
									    enable_ilb_cal <= 1'b0;
			                ilb_cal_cntr <= 3'd0;
                      wr_pma_effort_lvl <= 1'b1;
                      if(rcp_load_finish || rcp_load_timeout)
                      begin
												if(i_hotplug_disable) //rcp_load_finish will become high if hotplug is disabled
													state <= IDLE;
                        else if(state_cntr <= 4'd2)  //ical stateges for LR only is 0&1, for mix VSR&LR is 0-2
                          state <= RUN_ICAL;
                        else //if(state_cntr == 4'd3)
                          state <= RUN_PCAL;
                        //else
                        //  state <= LOAD_PMA_LR;
                      end
                      else
                        state <= LOAD_PMA_LR;
                    end
//        RX_INIT  : //This to is to disable LPM, disable Rx, enalbe Rx, enable LPM (can be done for every 10sec's instead of evvery iteration) 
//                 begin
//                  rcp_load <= 1'b0;
//                  state_cntr <= 4'd0; 
//									enable_ilb_cal <= 1'b0;
//			            ilb_cal_cntr <= 3'd0;
//                  if(i_hotplug_disable)
//                    state    <= IDLE;
//                  else
//                  	state    <= RUN_ICAL;
//                 end
        RUN_ICAL :
                  begin
                    rcp_load <= 1'b0;
                    read_hf_gain            <= 1'b0;
                    cal_mail_en   <= mail_finish ? 1'b0 : 1'b1; 

                    if(wr_rx_en_cntr == 'd0)
                      cal_mail_data <= 32'h00010005; //Disable Rx
                    else if (wr_rx_en_cntr == 'd1)
                      cal_mail_data <= 32'h00010007; //Enable Rx
                    else if(wr_pma_effort_lvl && (effort_wr_cntr < 'd2))
                    begin
                      if(pam4_en)  // PAM4 LR and VSR
                        cal_mail_data <= (effort_wr_cntr == 'd0) ? 32'h002C0118 : 32'h006C0001; //High effort
                      else if(lr_recipe_en) // LR NRZ case
                        cal_mail_data <= (effort_wr_cntr == 'd0) ? 32'h002C0118 : 32'h006C0001; //High effort
                      else  //VSR NRZ case
                        cal_mail_data <= (effort_wr_cntr == 'd0) ? 32'h002C0118 : 32'h006C0000; //Low effort
                    end
                    else 
                    begin
                      cal_mail_data <= 32'h000A0001;  //iCAL command
                    end

                    if(mail_finish)
                    begin
											if(i_hotplug_disable && (wr_rx_en_cntr >= 'd2) && (cal_mail_data != 32'h000A0001))//if iCAL is triggered dont apply loopback till iCAL finish
                        //if Rx is disabled wait for to enable again 
                        state <= IDLE;
                      else if(wr_rx_en_cntr < 'd2)
                        state <= WAIT_10MSEC;
                      else if((effort_wr_cntr == 2'd2) || (~wr_pma_effort_lvl && (wr_rx_en_cntr > 'd1)))
                      begin
                        state_cntr    <= state_cntr + 1'd1; 
                        state <= CHK_ICAL;
                      end
                      else 
                        state <= RUN_ICAL;
                    end
                    else
                      state <= RUN_ICAL;
                  end
        CHK_ICAL : begin
                    cal_mail_en   <= 1'b1; 
                    cal_mail_data <= 32'h01260B00;
                    mail_readdata_state_en <= 1'b1;
                    wr_pma_effort_lvl <= 1'b0;
                    if(mail_finish)
                    begin
                      cal_mail_en   <= 1'b0; 
                      if(wait_done || (mail_readdata[7:0] == 8'h80) || (SIM_MODE == 1)) 
                      begin
                        if(i_hotplug_disable)  //disabled after iCAL complete otherwise SAL loopback command not working
                        state <= IDLE;
                        else
                        state <= WAIT_10MSEC; 
                      end
                      else
                        state <= CHK_ICAL; 
                    end
                    else
                      state <= CHK_ICAL;
                   end
        RUN_PCAL : 
                  begin
                    rcp_load <= 1'b0;
                    cal_mail_en   <= 1'b1; 
                    cal_mail_data <= 32'h000A0006;
                    if(mail_finish)
                    begin
                      state_cntr    <= state_cntr + 1'd1;
                      cal_mail_en   <= 1'b0; 
                      if(i_hotplug_disable)
                        state <= IDLE;
											else
                      	state <= CHK_PCAL; 
                    end
                    else
                      state <= RUN_PCAL;
                  end
        CHK_PCAL : 
                  begin
                    cal_mail_en   <= 1'b1; 
                    cal_mail_data <= 32'h01260B00;
                    mail_readdata_state_en <= 1'b1;
                    signal_detect_cntr_en  <= 1'b0;
                    if(mail_finish)
                    begin
                      cal_mail_en   <= 1'b0; 
                      if(i_hotplug_disable)
                        state <= IDLE;
                      else if(wait_done || (mail_readdata[7:0] == 8'hE2) || (SIM_MODE == 1))
                        state <= CHK_SIGNAL; 
                      else
                        state <= CHK_PCAL; 
                    end
                    else
                      state <= CHK_PCAL;
                   end
        WAIT_10MSEC : begin
                      signal_detect_cntr_en  <= 1'b0;
                      cal_mail_en <= 1'b0;
											if(i_hotplug_disable)
                      begin
                        if((wr_rx_en_cntr == 'd1) && wait_done)
                          state <= RUN_ICAL;
                        else if((wr_rx_en_cntr == 'd2) && wait_done)
                          state <= IDLE;
                        else if((wr_rx_en_cntr == 'd0) || (wr_rx_en_cntr > 'd2))
                          state <= IDLE;
                        else
												  state <= WAIT_10MSEC;
                      end
                      else if(wait_done)
                      begin
											  if((wr_rx_en_cntr == 'd1) || (wr_rx_en_cntr == 'd2))
                          state <= RUN_ICAL; //going back to ical after enable/disable Rx
											  else if(enable_ilb_cal)
                          state <= ILB_CAL;
											  else if(i_hotplug_lpbk_en_fm)
                        begin
                          state <= WAIT_1SEC;
                          state_cntr <= 4'd4;
                        end
                        else if (state_cntr == 'd1)
                          state <= CHK_EYE; // 1st time ical no need to check rx is lock status
                        else
                          state <= CHK_SIGNAL;
                      end
                      else
                        state <= WAIT_10MSEC;
                   end
        CHK_SIGNAL : //Check for rx_freq_locked_1msec and eye
                    begin
                      signal_detect_cntr_en  <= 1'b1;
                      mail_readdata_state_en <= 1'b0;
                      wr_pma_effort_lvl <= (state_cntr > 'd2) ? 1'b1 : 1'b0;

											if(i_hotplug_disable)
												state <= IDLE;
                      else if(rx_is_lockedtodata_sync == 1'b0)
                      begin
                        state_cntr <= 4'd0;
                        if(PORT_ANLT_EN)
                          state <= ANLT_PAUSE; //to unpause ANLT
                        else if(state_cntr >= 4'd3) //at cntr=3 to load the vsr recipe, cntr=4 stop and load vsr
                          state <= STOP_PCAL;
                        else //if(state <= 'd2) //eye check failed in 1st or 2nd ical then no need to load recipe 
                          state <= RUN_ICAL;
                      end
                      else if(i_any_lane_down) 
                      //else if((state_cntr == 4'd4) && i_any_lane_down) 
                        state <= ANLT_PAUSE; //going to unpause ANLT if other lanes detect failure
                      else if(rx_freq_locked_1msec)
                        state <= CHK_EYE;
                      else
                        state <= CHK_SIGNAL;
                    end
         CHK_EYE :
                    begin
                      signal_detect_cntr_en <= 1'b0;
                      mail_readdata_state_en <= 1'b1;
                      read_hf_gain            <= 1'b0;
                      wr_pma_effort_lvl <= (state_cntr > 'd2) ? 1'b1 : 1'b0;

                      if(eye_cntr < 'd6) 
                      begin
                        cal_mail_en   <= mail_finish ? 1'b0 : 1'b1; 
                        //cal_mail_en   <= (mail_finish | eye_ok | eye_fail) ? 1'b0 : 1'b1; 
                        cal_mail_data <= 32'h002C1700 + eye_cntr;
                      end 
                      else 
                      begin
                        cal_mail_en   <= 1'b0; 
                        cal_mail_data <= 32'h002C1700;
                      end

                      if(i_any_lane_down) 
                      //if((state_cntr == 4'd4) && i_any_lane_down) 
                        state <= ANLT_PAUSE; //going to unpause ANLT if other lanes detect failure
                      else if(eye_ok)
                      begin
                        if (state_cntr == 4'd1)  //1st iCAL passed, to run iCAL again 
                          state <= RUN_ICAL;
                        else if(state_cntr == 4'd2)  //2nd iCAL passed, to load pCAL parameters
                        begin
                          if(i_load_recipe_disable) 
                          begin
                            state <= RUN_PCAL;
                            state_cntr <= state_cntr + 'd1; 
                          end
                          else if(i_load_lr_recipe_only)
                          begin
                            state <= LOAD_PMA_LR; //to load lr pcal recipe
                            state_cntr <= state_cntr + 'd1; 
                          end
                          else if(i_load_vsr_recipe_only)
                          begin
                            state <= LOAD_PMA_VSR; //to load vsr pcal recipe
                            state_cntr <= state_cntr + 'd1; 
                          end
                          else
                            state <= CHK_HF_LF_GAIN;  //to check LR  
                        end
                        else if((state_cntr == 'd3) && lr_recipe_en)
                          state <= LOAD_PMA_LR; // to load LR pcal recipe
                        else
                          state <= WAIT_1SEC;
                      end
                      else if(eye_fail)
                      begin
                        state_cntr <= 4'd0;
                        if(PORT_ANLT_EN)
                          state <= ANLT_PAUSE;
                        else if(state_cntr >= 4'd3) //at cntr=3 to load the vsr recipe, cntr=4 stop and load vsr
                          state <= STOP_PCAL;
                        else //if(state <= 'd2) //eye check failed in 1st or 2nd ical then no need to load recipe 
                          state <= RUN_ICAL;
                      end
                      else
                        state <= CHK_EYE;
                    end
         CHK_HF_LF_GAIN :
                    begin
                      signal_detect_cntr_en <= 1'b0;
                      mail_readdata_state_en <= 1'b1;

                      cal_mail_en   <= 1'b1; 
                      cal_mail_data <= read_hf_gain ? 32'h002C0900 : 32'h002C0901;

                      if(mail_finish)
                      begin
                        lf_gain <= mail_readdata[15:0];
                        read_hf_gain <= 1'b1;
                      end

                      if(mail_finish && read_hf_gain)
                      begin
                        cal_mail_en   <= 1'b0; 
                        if(i_hotplug_disable)
                          state <= IDLE;
                        //else if(mail_readdata[15:0] < 16'd8) //LR recipe to be loaded
                        else if(mail_readdata < lf_gain) //VSR recipe to be loaded when HF gain is less than LF gain
                        begin
                          state <= LOAD_PMA_VSR;   //to load VSR pcal recipe
                          state_cntr    <= state_cntr + 1'd1;  //going to pcal state cntr='d3
                        end
                        else if((~pam4_en && (mail_readdata - lf_gain > 16'd7)) || (pam4_en && ((mail_readdata - lf_gain) > 16'd5))) //LR recipe to be loaded whne HF-LF > 7/5
                          state <= LOAD_PMA_LR;   //to load LR ical recipe
                        else
                        begin
                          state <= LOAD_PMA_VSR;  //to load VSR pcal recipe 
                          state_cntr    <= state_cntr + 1'd1;  //going to pcal state cntr='d3
                        end
                      end
                      else
                        state <= CHK_HF_LF_GAIN;
                    end
         STOP_PCAL : begin
                      cal_mail_data <= (pcal_cntr == 1'd0) ? 32'h01260B00 : 32'h000A0002;
                      mail_readdata_state_en <= (pcal_cntr == 1'd0) ? 1'b1 : 1'b0;
                      anlt_pause_en <= 1'b0;
                      if(mail_finish)
                      begin
                        if(pcal_cntr == 1'd0)
                        begin
                          //if(mail_readdata[7:0] == 8'hE2)  //pCAL is enabled  
                          if((mail_readdata[6] == 1'b1) || (mail_readdata[1] == 1'b1))  //pCAL is enabled so disable
                          begin
                            cal_mail_en   <= 1'b1; 
                            state <= STOP_PCAL; 
                          end
                          else   //pCAL not enabled, no need to stop
                          begin
                            cal_mail_en   <= 1'b0; 
                            state <= CHK_STOP_PCAL; 
                          end
                        end
                        else
                        begin
                          cal_mail_en   <= 1'b0; 
                          state <= CHK_STOP_PCAL; 
                        end
                      end
                      else
                      begin
                        cal_mail_en   <= 1'b1; 
                        state <= STOP_PCAL;
                      end
                    end 
        CHK_STOP_PCAL : 
                  begin
                    cal_mail_en   <= 1'b1; 
                    cal_mail_data <= 32'h01260B00;
                    mail_readdata_state_en <= 1'b1;
                    wr_pma_effort_lvl     <= 1'b1;
                    if(mail_finish)
                    begin
                      cal_mail_en   <= 1'b0; 
                      if(i_hotplug_disable)
                        state <= IDLE;
                      //else if(mail_readdata[7:0] == 8'h80)
                      else if(wait_done || ((mail_readdata[6] == 1'b0) && (mail_readdata[1] == 1'b0)) || (SIM_MODE == 1)) 
                      begin
												if(enable_ilb_cal)
													state <= ILB_CAL;
                        else if(i_load_recipe_disable)
                          state <= RUN_ICAL;
                        else if(i_load_lr_recipe_only)
                          state <= LOAD_PMA_LR; 
                        else if(i_load_vsr_recipe_only)
                          state <= LOAD_PMA_VSR; 
                        else 
                          state <= LOAD_PMA_VSR; 
                      end
                      else
                        state <= CHK_STOP_PCAL; 
                    end
                    else
                      state <= CHK_STOP_PCAL;
                  end 
         WAIT_1SEC :
                   begin
                   signal_detect_cntr_en <= 1'b0;
      						 enable_ilb_cal <= (PORT_ANLT_EN || SIM_MODE) ? 1'b0 : ~i_hotplug_ilb_cal_disable;
                    if((i_hotplug_disable && (PORT_ANLT_EN == 0)) || (hotplug_disable_gated && (PORT_ANLT_EN == 1)))
                      state <= IDLE;
                    else if(i_hotplug_pause)
                      state <= WAIT_1SEC;
                    else if(i_any_lane_down && ~lf_reg_cfg_en && (PORT_ANLT_EN == 1)) 
                      state <= ANLT_PAUSE; //going to unpause ANLT if other lanes detect failure
                    else if(wait_done)
                      state <= CHK_SIGNAL;
                    else
                      state <= WAIT_1SEC;
                   end
         default :  begin
                      state <= IDLE;
                    end
      endcase
    end
  end

//***********************************************************************
//*************************ROM LOAD State Machine************************
//***********************************************************************
//on DR ROM, 1st profile is 10g, 2nd is 25G, 3rd is 50g all with lr and vsr
always @(posedge i_reconfig_clk)
begin
  if(i_reconfig_reset)
    port_rcp_no <= 2'd0;
  else if(PORT_DR_EN)
  begin
    if(i_port_profile[5:4] <= 2'd1)  //eth only and eth+cpri
      port_rcp_no <= (i_port_profile[3:0] <= 4'd1) ? 2'd1 : 2'd0; //25G NRZ or 10G NRZ
    else if(i_port_profile[5:4] == 2'd3) //100G DR
      port_rcp_no <= (i_port_profile[3:0] == 4'd4) ? 2'd2 : 2'd1; //PAM4 or 25G/100G NRZ
    else //CPRI only 
      port_rcp_no <= 2'd0; 
  end
  else
    port_rcp_no <= 2'd0;
end

always@(posedge i_reconfig_clk) begin
  if (i_reconfig_reset) 
    rcp_address <= {(ROM_ADDR_WIDTH+1){1'b0}}; 
  else if(lr_recipe_en)
  begin
    if(state_cntr == 4'd3)  //pcal
      rcp_address <= (port_rcp_no << 8) + 8'd128 + 8'd64;
    else                  //ical
      rcp_address <= (port_rcp_no << 8) + 8'd128 + 8'd0;
  end
  else
  begin
    if(state_cntr == 4'd3)
      rcp_address <= (port_rcp_no << 8) + 8'd64;
    else 
      rcp_address <= (port_rcp_no << 8) + 8'd0; 
  end
end

always@(posedge i_reconfig_clk) begin
   if (i_reconfig_reset) begin
       load_state                    <= 5'h00;
       rcp_load_state                <= 5'h00;
       new_mail                      <= 1'b0;
       mail_data                     <= 32'h0000_0000;
       rom_address                   <= {ROM_ADDR_WIDTH{1'b0}};  //TO BE FIXED WITH REAL ROM ADD WIDTH
       rcp_load_finish               <= 1'b0;
       rcp_load_busy                 <= 1'b0;
       rcp_load_timeout              <= 1'b0;
   end else begin
       case(load_state)
       RCP_IDLE: begin
          new_mail                      <= 1'b0;
          mail_data                     <= 32'h0000_0000;
          rom_address                   <= rcp_address[ROM_ADDR_WIDTH-1:0]; 
          rcp_load_finish               <= 1'b0;
          rcp_load_timeout              <= 1'b0;

          if (rcp_load_d1) begin
             rcp_load_busy                 <= 1'b1;
             load_state                    <= INIT_RCP;
          end else begin
             rcp_load_busy                 <= 1'b0;
             load_state                    <= RCP_IDLE;
          end
       end
       INIT_RCP: begin
          //new_mail     <= 1'b1;
          //mail_data     <= 32'h90_00_00_02; // Initializa PMA ADAPTATION PART A+B
          rcp_load_state <= load_state;
          recipe_length  <= rom_readdata[7:0];
          if (rcp_load_state == load_state) 
          begin
            load_state    <= READ_ROM; 
            rom_address   <= rom_address + 1'd1;
          end
       end

       READ_ROM: begin
					if(i_hotplug_disable)
						 load_state <= END_OF_RCP;
          else if (rom_address[5:0] <= recipe_length) begin //NEW MESSAGE, NOT END OF PMA ADAPTATION SETTINGS
             load_state   <= SEND_DATA; 
             rcp_load_state <= load_state;
          end else begin
              load_state <= END_OF_RCP;
          end
       end

       SEND_DATA: begin
          new_mail        <= 1'b1;
          mail_data       <= rom_readdata;
          rcp_load_state  <= load_state;
          if (mail_timeout) load_state <= RCP_TIMEOUT;
          else if (mail_finish) begin
              load_state  <= WAIT_ROM_DATA;
              rom_address <= rom_address + 1'b1;
          end
          if (rcp_load_state == load_state) new_mail <= 1'b0;
       end
       WAIT_ROM_DATA:begin
              load_state  <= READ_ROM;
       end

       END_OF_RCP: begin
          rcp_load_state <= load_state;
          load_state <= RCP_FINISH;
       end

       RCP_TIMEOUT: begin
          rcp_load_busy     <= 1'b0;
          rcp_load_timeout  <= 1'b1;
          rcp_load_finish   <= 1'b0;
          if(!rcp_load_d1)       load_state        <= RCP_IDLE;
       end

       RCP_FINISH: begin
          rcp_load_busy     <= 1'b0;
          rcp_load_timeout  <= 1'b0;
          rcp_load_finish   <= 1'b1;
          if(!rcp_load_d1)   load_state        <= RCP_IDLE;
       end

       default: load_state <= RCP_IDLE;
       endcase
   end

end

generate
if (PORT_DR_EN)
begin : DR_ROM
  hssi_ss_hotplug_rcp_load_dr_rom #(.RCP_ROM_SEL(PORT_RECIPE_ROM_SEL), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH)) U_RCP_DR_ROM
      (
      .clk(i_reconfig_clk),
      .addr(rom_address),
      .data(rom_readdata)
      );
end
else
begin : NON_DR_ROM
hssi_ss_hotplug_rcp_load_rom #(.RCP_ROM_SEL(PORT_RECIPE_ROM_SEL), .ROM_ADDR_WIDTH(ROM_ADDR_WIDTH)) U_RCP_ROM
    (
    .clk(i_reconfig_clk),
    .addr(rom_address),
    .data(rom_readdata)
    );
end
endgenerate

//****************************************************************************
//********************  PMA Attribute Code State Machine  ********************
//****************************************************************************
  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      mail_timer <= 7'd0;
    else if(mail_timer_en || (state == ANLT_PAUSE))
    begin
      if(mail_timer >= MAIL_TO_CNTR_VAL)
        mail_timer <= MAIL_TO_CNTR_VAL;
      else if(i_pulse_1ms)
        mail_timer <= mail_timer + 7'd1;
      else
        mail_timer <= mail_timer;
    end
    else
      mail_timer <= 7'd0;
  end

always@(posedge i_reconfig_clk) begin
   if (i_reconfig_reset) begin
       mail_state           <= MAIL_IDLE;
       mail_timer_en        <= 1'b0;
       write_cntr           <= 3'd0;
       rcp_avmm_write       <= 1'b0;
       rcp_avmm_read        <= 1'b0;
       rcp_avmm_writedata   <= 8'h00;
       rcp_avmm_address     <= 19'h0_0000;
       mail_readdata        <= 16'd0;
       mail_timeout         <= 1'b0;
       mail_finish          <= 1'b0;
   end else begin
     case (mail_state)
       MAIL_IDLE: begin
              write_cntr           <= 3'd0;
              rcp_avmm_write       <= 1'b0;
              rcp_avmm_read        <= 1'b0;
              rcp_avmm_writedata   <= 8'h00;
              rcp_avmm_address     <= 19'h0_0000;
              mail_readdata        <= 16'd0;
              mail_timeout         <= 1'b0;
              mail_finish          <= 1'b0;
              if ((new_mail || cal_mail_en) && ~mail_finish) begin
                mail_state      <= MAIL_WRITE;
                mail_timer_en   <= 1'b1;
              end
              else begin
                mail_state      <= MAIL_IDLE;
                mail_timer_en   <= 1'b0;
              end
            end
       MAIL_WRITE: begin
              rcp_avmm_write           <= 1'b1;
              rcp_avmm_read            <= 1'b0;
              mail_state               <= WAIT_WRITE;
              if (write_cntr == 3'd0) begin
                 rcp_avmm_writedata     <= cal_mail_en ? cal_mail_data[7:0] : mail_data[7:0];
                 rcp_avmm_address       <= 19'h0_0084;
              end else if (write_cntr == 3'd1) begin
                 rcp_avmm_writedata     <= cal_mail_en ? cal_mail_data[15:8] : mail_data[15:8];
                 rcp_avmm_address       <= 19'h0_0085;
              end else if (write_cntr == 3'd2) begin
                 rcp_avmm_writedata     <= cal_mail_en ? cal_mail_data[23:16] : mail_data[23:16];
                 rcp_avmm_address       <= 19'h0_0086;
              end else if (write_cntr == 3'd3) begin
                 rcp_avmm_writedata     <= cal_mail_en ? cal_mail_data[31:24] : mail_data[31:24];
                 rcp_avmm_address       <= 19'h0_0087;
              end else if(write_cntr == 3'd4) begin
                 rcp_avmm_writedata     <= 8'h01; 
                 rcp_avmm_address       <= 19'h0_0090;
              end
            end
       WAIT_WRITE: begin
              rcp_avmm_write    <= 1'b1;
              if ((rcp_avmm_waitrequest==1'b0) && (write_cntr == 3'd4)) begin
                 mail_state        <= READ_8A;
                 write_cntr        <= 3'd0;
                 rcp_avmm_write    <= 1'b0;
              end else if ((rcp_avmm_waitrequest==1'b0) && (write_cntr != 3'd4)) begin
                 mail_state        <= MAIL_WRITE;
                 write_cntr        <= write_cntr + 1'b1;
                 rcp_avmm_write    <= 1'b0;
              end else if (mail_timer >= MAIL_TO_CNTR_VAL) begin  //Access fail time out
                 mail_state        <= MAIL_TO;
                 write_cntr        <= 3'd0;
                 rcp_avmm_write    <= 1'b0;
              end
              else
                 mail_state        <= WAIT_WRITE;
            end
       READ_8A: begin
              rcp_avmm_write           <= 1'b0;
              rcp_avmm_read            <= 1'b1;
              mail_state               <= WAIT_8A;
              rcp_avmm_writedata       <= 8'h00;
              rcp_avmm_address         <= 19'h0_008A;
            end
       WAIT_8A : begin
              rcp_avmm_write       <= 1'b0;
              rcp_avmm_read        <= 1'b1;
              if ((rcp_avmm_waitrequest==1'b0) && (rcp_avmm_readdata[7] == 1'b1)) //checking for 0x8A reg bit[7] = 1'b1
              begin
                 mail_state        <= READ_8B;
                 rcp_avmm_read     <= 1'b0;
              end
              else if ((rcp_avmm_waitrequest==1'b0) && (rcp_avmm_readdata[7] != 1'b1))
              begin
                 mail_state         <= READ_8A ;
                 rcp_avmm_read     <= 1'b0;
              end
              else if (mail_timer >= MAIL_TO_CNTR_VAL)
              begin
                 mail_state        <= MAIL_TO;
                 rcp_avmm_read     <= 1'b0;
              end
            end
       READ_8B : begin
              rcp_avmm_write           <= 1'b0;
              rcp_avmm_read            <= 1'b1;
              mail_state               <= WAIT_8B;
              rcp_avmm_address         <= 19'h0_008B;
            end
       WAIT_8B : begin
              rcp_avmm_write       <= 1'b0;
              rcp_avmm_read        <= 1'b1;
              if ((rcp_avmm_waitrequest==1'b0) && (rcp_avmm_readdata[0] == 1'b0)) begin//checking for 0x8B reg bit[0] = 1'b0
                rcp_avmm_read        <= 1'b0;
                if(mail_readdata_state_en)
                  mail_state        <= READ_88;
                else
                  mail_state        <= WRITE_8A;
              end else if ((rcp_avmm_waitrequest==1'b0) && (rcp_avmm_readdata[0] != 1'b0))
              begin
                 rcp_avmm_read      <= 1'b0;
                 mail_state         <= READ_8B ;
              end
              else if (mail_timer >= MAIL_TO_CNTR_VAL) 
              begin
                 rcp_avmm_read     <= 1'b0;
                 mail_state        <= MAIL_TO;
              end
            end
       READ_88: begin
              rcp_avmm_write           <= 1'b0;
              rcp_avmm_read            <= 1'b1;
              mail_state               <= WAIT_88;
              rcp_avmm_writedata       <= 8'h00;
              rcp_avmm_address         <= 19'h0_0088;
            end
       WAIT_88 : begin
            rcp_avmm_write       <= 1'b0;
            rcp_avmm_read        <= 1'b1;
            mail_readdata        <= {8'h0, rcp_avmm_readdata};
            if (rcp_avmm_waitrequest==1'b0) 
            begin
               mail_state        <= READ_89;
               rcp_avmm_read     <= 1'b0;
            end
            else if (mail_timer >= MAIL_TO_CNTR_VAL) 
            begin
               mail_state        <= MAIL_TO;
               rcp_avmm_read     <= 1'b0;
            end
          end
       READ_89: begin
            rcp_avmm_write           <= 1'b0;
            rcp_avmm_read            <= 1'b1;
            mail_state               <= WAIT_89;
            rcp_avmm_writedata       <= 8'h00;
            rcp_avmm_address         <= 19'h0_0089;
          end
       WAIT_89 : begin
            rcp_avmm_write       <= 1'b0;
            rcp_avmm_read        <= 1'b1;
            mail_readdata        <= {rcp_avmm_readdata, mail_readdata[7:0]};
            if (rcp_avmm_waitrequest==1'b0) 
            begin
               mail_state        <= WRITE_8A;
               rcp_avmm_read     <= 1'b0;
            end
            else if (mail_timer >= MAIL_TO_CNTR_VAL) 
            begin
               mail_state        <= MAIL_TO;
               rcp_avmm_read     <= 1'b0;
            end
        end
       WRITE_8A: begin
            rcp_avmm_write           <= 1'b1;
            rcp_avmm_read            <= 1'b0;
            mail_state               <= WAIT_WRITE_8A;
            rcp_avmm_writedata       <= 8'h80;
            rcp_avmm_address         <= 19'h0_008A;
          end
       WAIT_WRITE_8A : begin
            rcp_avmm_write       <= 1'b1;
            rcp_avmm_read        <= 1'b0;
            if (rcp_avmm_waitrequest==1'b0) 
            begin
               mail_state        <= MAIL_FINISH;
               rcp_avmm_write    <= 1'b0;
            end
            else if (mail_timer >= MAIL_TO_CNTR_VAL) 
            begin
               mail_state        <= MAIL_TO;
               rcp_avmm_write    <= 1'b0;
            end
        end
       MAIL_TO: begin
           rcp_avmm_write           <= 1'b0;
           rcp_avmm_read            <= 1'b0;
           rcp_avmm_writedata       <= 8'h00;
           rcp_avmm_address         <= 19'h0_0000;
           mail_timeout             <= 1'b1;
           mail_finish              <= 1'b1;
           mail_state               <= MAIL_IDLE;
           mail_timer_en            <= 1'b0;
         end
       MAIL_FINISH: begin
           rcp_avmm_write           <= 1'b0;
           rcp_avmm_read            <= 1'b0;
           rcp_avmm_writedata       <= 8'h00;
           rcp_avmm_address         <= 19'h0_0000;
           mail_timeout             <= 1'b0;
           mail_finish              <= 1'b1;
           mail_state               <= MAIL_IDLE;
           mail_timer_en            <= 1'b0;
         end
       default: mail_state <= MAIL_IDLE;
     endcase
  end
end

//**********************************************************************************************************************************
//Reconfig interface muxing b/w user XCVR if and internal if
//**********************************************************************************************************************************
    alt_ehipc3_rcfg_arb #(
            .total_masters  (3),
            .channels       (NUM_CHANNELS),
            .address_width  (19),
            .data_width     (8) 
    ) U_XCVR_RCA (
            // Basic AVMM inputs
            .reconfig_clk         (i_reconfig_clk),
            .reconfig_reset       (i_reconfig_reset),
    
            // User AVMM input
            .user_read            (i_xcvr_reconfig_read),
            .user_write           (i_xcvr_reconfig_write),
            .user_address         (i_xcvr_reconfig_address),
            .user_writedata       (i_xcvr_reconfig_writedata),
            .user_read_write      (i_xcvr_reconfig_read || i_xcvr_reconfig_write),
            .user_waitrequest     (o_xcvr_reconfig_waitrequest),
    
            // Training CPU intput
            .cpu_read             (rcp_avmm_read),
            .cpu_write            (rcp_avmm_write),
            .cpu_address          (rcp_avmm_address[18:0]),
            .cpu_writedata        (rcp_avmm_writedata),
            .cpu_read_write       (rcp_avmm_read || rcp_avmm_write),
            .cpu_waitrequest      (rcp_avmm_waitrequest),
    
            // Reconfig Steamer AVMM input
            .adapt_read            (1'b0),
            .adapt_write           (1'b0),
            .adapt_address         (19'b0),
            .adapt_writedata       (8'b0),
            .adapt_read_write      (1'b0),
            .adapt_waitrequest     (), 
    
            // AVMM output the channel and the CSR
            .avmm_waitrequest     (xcvr_reconfig_waitrequest),
            .avmm_read            (xcvr_reconfig_read),
            .avmm_write           (xcvr_reconfig_write),
            .avmm_address         (xcvr_reconfig_address),
            .avmm_writedata       (xcvr_reconfig_writedata) 
           );

assign rcp_avmm_readdata = xcvr_reconfig_readdata;
assign o_xcvr_reconfig_readdata = xcvr_reconfig_readdata;

//**********************************************************************************************************************************
//Reconfig interface muxing b/w user Eth if and internal if
//**********************************************************************************************************************************

generate
if(PORT_ANLT_EN)
begin : ANLT_RCG_LOGIC
  
  reg  ehip_write;
  reg  ehip_read;
  reg  [1:0] ehip_read_gate_cntr;
  reg  [18:0] ehip_addr;
  reg  [31:0] ehip_writedata;
  wire [31:0] ehip_readdata;
  reg  [31:0] ehip_readdata_latched;
  wire ehip_waitrequest;
  wire ehip_readdatavalid;
  reg  [2:0] anlt_cntr;
  reg  hp_eth_reconfig_en;

  reg  [31:0] lf_user_val;
  reg         lf_written;
  reg  [1:0]  lf_wr_en_cntr;
  
  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
    begin
      ehip_write <= 1'b0;
      ehip_read  <= 1'b0;
      ehip_addr  <= 19'd0;
      ehip_writedata <= 32'd0;
      anlt_cntr  <= 3'd0;
    end
    else if(lf_reg_cfg_en) //setting LF value to user value after HP complete
    begin
      ehip_write      <= i_port_ch_enable; 
      ehip_read       <= 1'b0;
      ehip_addr       <= 19'h405;
      ehip_writedata  <= lf_user_val;
      anlt_cntr       <= 3'd0;
    end
    else if((state == ANLT_PAUSE) && i_port_ch_enable)
    begin
      ehip_write <= ((anlt_cntr == 3'd1) || (anlt_cntr == 3'd3)) ? i_port_ch_enable : 1'b0;
      ehip_read  <= ((anlt_cntr == 3'd1) || (anlt_cntr == 3'd3)) ? 1'b0 : i_port_ch_enable;
      ehip_addr  <= (anlt_cntr < 3'd2) ? 19'h405 : ((anlt_cntr < 3'd4) ? 19'hB0 : 19'hB1); 

      if(anlt_cntr < 3'd2)
        ehip_writedata <= anlt_pause_en ? {lf_user_val[31:1], 1'b0} : lf_user_val;
      else
        ehip_writedata <= anlt_pause_en ? {1'b1, ehip_readdata_latched[30:0]} : {1'b0, ehip_readdata_latched[30:0]};

      if(((ehip_waitrequest == 1'b0) && (eth_reconfig_read || eth_reconfig_write)) || (mail_timer >= MAIL_TO_CNTR_VAL)) //Access fail time out
      begin
        if(anlt_cntr >= 3'd5)  //TBD timeout for pause check
          anlt_cntr <= anlt_cntr;
        else
          anlt_cntr <= anlt_cntr + 3'd1;
      end
      else
        anlt_cntr <= anlt_cntr;
    end
    else
    begin
      ehip_write <= 1'b0;
      ehip_read  <= 1'b0;
      ehip_addr  <= 19'd0;
      ehip_writedata <= 32'd0;
      anlt_cntr  <= 3'd0;
    end
  end

  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      ehip_read_gate_cntr <= 2'd0;
    else if(i_eth_reconfig_read || i_eth_reconfig_write) //to wait for 3 clocks after axi read/write
      ehip_read_gate_cntr <= 2'd0;
    else if((ehip_waitrequest == 1'b0) && (eth_reconfig_read || eth_reconfig_write))  //to avoid back to back read access
      ehip_read_gate_cntr <= 2'd0;
    else if(ehip_read_gate_cntr < 2'd3)
      ehip_read_gate_cntr <= ehip_read_gate_cntr + 2'd1;
    else
      ehip_read_gate_cntr <= 2'd3;
  end

//The below is to avoid the case where hotplug is disabled in the middle of eth read/write
  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      hotplug_disable_gated <= 1'b0;
    else if(hp_eth_reconfig_en)
    begin
      if(~eth_reconfig_read && ~eth_reconfig_write)
        hotplug_disable_gated <= i_hotplug_disable;
      else
        hotplug_disable_gated <= hotplug_disable_gated;
    end
    else
      hotplug_disable_gated <= i_hotplug_disable;
  end
  
 
  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      o_anlt_paused <= 1'b0;
    else if(i_port_ch_enable)
    begin
      if(state == ANLT_PAUSE)
      begin
        if((ehip_readdatavalid && (anlt_cntr > 3'd3)) || (mail_timer >= MAIL_TO_CNTR_VAL) || hotplug_disable_gated)
        begin
          if(hotplug_disable_gated || (mail_timer >= MAIL_TO_CNTR_VAL))
            o_anlt_paused <= 1'b1;
          else if(ehip_readdata[31] && anlt_pause_en)  //ANLT pause
            o_anlt_paused <= 1'b1;
          else if(~ehip_readdata[31] && ~anlt_pause_en)  //ANLT unpause 
            o_anlt_paused <= 1'b1;
        end
      end
      else
        o_anlt_paused <= 1'b0;
    end
    else
      o_anlt_paused <= i_anlt_paused;
  end
  
  //*********************************************************
  // during iCAL state, local fault is getting generated, in this case MAC is sending remote fault to the link partner
  // due to RF recive by link partner AN is getting stuck some times (1/30). may be due to link partner restarting the ANLT but 
  // ANLT is paused at local node. So disabling fault mechanism during hotplug in ANLT modes.

  always @(posedge i_reconfig_clk or negedge i_csr_rst_n)
  begin
    if(~i_csr_rst_n)
      lf_user_val <= 32'd0;
    else if(ANLT_PAUSE && anlt_pause_en && (anlt_cntr < 3'd2) && ehip_readdatavalid)
      lf_user_val <= ehip_readdata;
    else if(i_eth_reconfig_write && (i_eth_reconfig_address == 19'h405))
      lf_user_val <= i_eth_reconfig_writedata;
  end    

  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      lf_wr_en_cntr <= 2'd3;
    else if(state == IDLE)
      lf_wr_en_cntr <= 2'd0;
    else if((state == WAIT_1SEC) && wait_done)
    begin
      if(lf_wr_en_cntr >= 2'd3)
        lf_wr_en_cntr <= lf_wr_en_cntr;
      else
        lf_wr_en_cntr <= lf_wr_en_cntr + 2'd1;
    end
  end

  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      lf_reg_cfg_en <= 1'b0;
    else if(state == IDLE)
      lf_reg_cfg_en <= 1'b0;
    else if(lf_written)
      lf_reg_cfg_en <= 1'b0;
    else if((state == WAIT_1SEC) && (lf_wr_en_cntr == 2'd3))  //enabling LF after 1sec as if Local fault alarm clearing is taking time which is causing link flap
      lf_reg_cfg_en <= 1'b1;
  end

  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      lf_written <= 1'b0;
    else if(state == IDLE)
      lf_written <= 1'b0;
    else if(lf_reg_cfg_en && ~eth_reconfig_waitrequest && ehip_write)
      lf_written <= 1'b1;
  end
  
  //**********************************************************************************************************************************
  //Reconfig interface muxing b/w user Eth if and internal if
  //**********************************************************************************************************************************
  //assuming pause/unpause will not take much time as during this ANLT FSM will be in data good state only.
  //no need of arbiter b/w user eth_reconfig and internal reconfig. when FSM enters ANLT_PAUSE state, waits for current user access to complete then
  //FSM will take control to write ANLT registers. Any user access during this time will be hold and process after PAUSE state

  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      hp_eth_reconfig_en <= 1'b0;
    else if(~i_eth_reconfig_read && ~i_eth_reconfig_write && ((state == ANLT_PAUSE) || lf_reg_cfg_en) && (ehip_read_gate_cntr == 'd3))  //enabling after any axi lite pending 
      hp_eth_reconfig_en <= 1'b1;
    else if(lf_reg_cfg_en)
      hp_eth_reconfig_en <= lf_written ? 1'b0 : hp_eth_reconfig_en;
    else if(state != ANLT_PAUSE) 
      hp_eth_reconfig_en <= 1'b0;
  end

  always @(posedge i_reconfig_clk)
  begin
    if(i_reconfig_reset)
      ehip_readdata_latched <= 32'd0;
    else if(ehip_readdatavalid)
      ehip_readdata_latched <= ehip_readdata; 
  end
  
  assign eth_reconfig_read      = i_port_ch_enable ? (hp_eth_reconfig_en ?  (ehip_read && (ehip_read_gate_cntr == 2'd3)) : i_eth_reconfig_read)      : 1'hz;           
  assign eth_reconfig_write     = i_port_ch_enable ? (hp_eth_reconfig_en ? (ehip_write && (ehip_read_gate_cntr == 2'd3)) : i_eth_reconfig_write)     : 1'hz;           
  assign eth_reconfig_address   = i_port_ch_enable ? (hp_eth_reconfig_en ?  ehip_addr      : i_eth_reconfig_address)   : 19'hz_zzzz;           
  assign eth_reconfig_writedata = i_port_ch_enable ? (hp_eth_reconfig_en ?  ehip_writedata : i_eth_reconfig_writedata) : 32'hzzzz_zzzz;           
  assign ehip_waitrequest       = i_port_ch_enable ? (hp_eth_reconfig_en ? eth_reconfig_waitrequest   : 1'b1)          : 1'b1;
  assign ehip_readdatavalid     = i_port_ch_enable ? (hp_eth_reconfig_en ? eth_reconfig_readdatavalid : 1'b0)          : 1'b0;
  assign ehip_readdata          = eth_reconfig_readdata;
  
  assign o_eth_reconfig_waitrequest   = i_port_ch_enable ? (hp_eth_reconfig_en || eth_reconfig_waitrequest) : 1'hz; 
  assign o_eth_reconfig_readdatavalid = i_port_ch_enable ? (~hp_eth_reconfig_en && eth_reconfig_readdatavalid) : 1'hz; 
  assign o_eth_reconfig_readdata      = i_port_ch_enable ? eth_reconfig_readdata : 32'hzzzz_zzzz;

end
else
begin : NO_ANLT_RCG_LOGIC
  wire [31:0] ehip_readdata;
  
  assign eth_reconfig_read      = i_port_ch_enable ? i_eth_reconfig_read      : 1'hz;           
  assign eth_reconfig_write     = i_port_ch_enable ? i_eth_reconfig_write     : 1'hz;           
  assign eth_reconfig_address   = i_port_ch_enable ? i_eth_reconfig_address   : 19'hz_zzzz;           
  assign eth_reconfig_writedata = i_port_ch_enable ? i_eth_reconfig_writedata : 32'hzzzz_zzzz;           
  assign ehip_waitrequest       = 1'b1;
  assign ehip_readdatavalid     = 1'b0;
  assign ehip_readdata          = eth_reconfig_readdata;
  
  assign o_eth_reconfig_waitrequest   = i_port_ch_enable ? eth_reconfig_waitrequest : 1'hz; 
  assign o_eth_reconfig_readdatavalid = i_port_ch_enable ? eth_reconfig_readdatavalid : 1'hz; 
  assign o_eth_reconfig_readdata      = i_port_ch_enable ? eth_reconfig_readdata : 32'hzzzz_zzzz;
  always @(*)
  begin
    hotplug_disable_gated <= 1'b0;
    lf_reg_cfg_en <= 1'b0;
  end
end
endgenerate

endmodule        
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "SsA75YSYGF80sMxcVcIJz7qC/bu5/GFmyOQtDL/x79k9awhwrs1/rpWwdMSdZM2X+KK5OPl7NlHx7SPY5wRckyl2RR/pULB4Gr4ljG7XN4DaAxjnUEsFPGaSXMbeLmHIwmOgVpfePQEWBImt9G4xgjV0kVX3ONW9Qk4+e/sQSunDVn3fkI+oox1qImh/vDaEBsdPebXpztP0C0MXDID9QjOct1HHbd4YOYjU6rRW6yviucx1L6JFIGx413EJZtW2LWcAxtE5UnFkp61plc+zczLWzFFfFnwUItI4NdekrcDUgMDNttMGShr1L8+wBtInk34ixHBp1aC8tIi4D7vJ2lp8l6woZe2HzK38qYv/ho73jYGwBLjxFXsA0MS0MoV6yL6uGY4/rG2X7luGMfquQIyC6XXESmENJd7Y9ud1XkTH7FNgZ4yNYDXOBJcmWP8l5varXUXmSld28tMpayv6pFvfonTH4+AjZQK2NXvY4ck4MI2NBbNxZuqhTxvcfQUAb7BtSqx4EXSKkgby7r3b/fKwxkQvR10nQTlxsQ0v5yq70PxKV8qGvqQ7rNFXGg4vnIwOlAtMglLUWMkvMYaH7z60Nv2LTd2Dpf1z6zobW/bbmiWz/BxyWr57F74KpFWgnRyDGjRzXvEFlUoa4NZnzsAMXWoQcr8I9eSXs0B2+cvQwWOe/tR/A8s3xwM93sZdVOZvq/FOZw0eatH6rhmsz8hkky+BRXQC2hzjPByKvN6nmIFSqtDRlYLHMBIsxWzMjPrUMVAo8zHGR05xz+L7uiuYEIthoS5hQLj6Usw5ZHnjHavKHSf4fD41Vj9eBB5KS0FT3R0xiti4m4RsChJfiCmLeXOqgdAoNGvl0FB/Rce3vwqpRHJHOVoNKlvja98JdysI11wo+S9QOJ+NS6pej0l8Wr4WsKvbsYan3urB8fJ0sujHgZMH2btjmstrPNX3W0mtbmPRtZklHjE057iFRTt6NfwYujncxpUbIvlQkDKrbKFKnfjYVXBRm/Q34ENP"
`endif