// ********************************************************************************
// DisplayPort Core test code main
//
// All rights reserved. Property of Bitec.
// Restricted rights to use, duplicate or disclose this code are
// granted through contract.
//
// (C) Copyright Bitec 2012
//    All rights reserved
//
// Author         : $Author: skatla $ @ bitec-dsp.com
// Department     :
// Date           : $Date: 2024/01/18 $
// Revision       : $Revision: #1 $
// URL            : $URL: svn://nas-bitec-fi/dp/trunk/software/dp_demo/main.c $
//
// Description:
//
// ********************************************************************************

#include <stdio.h>
#include <unistd.h>
#include <io.h>
#include <fcntl.h>
#include <string.h>
#include "sys/alt_timestamp.h"
#include "alt_types.h"
#include "sys/alt_irq.h"
#include "./../btc_dptx_syslib/btc_dptx_syslib.h"
#include "./../btc_dptxll_syslib/btc_dptxll_syslib.h"
#include "debug.h"
#include "config.h"
#include "tx_utils.h"


void bitec_menu_print();
void bitec_menu_cmd();
// void bitec_dprx_init();


int main()
{
  // Force non-blocking jtag uart
  fcntl(STDOUT_FILENO, F_SETFL, O_NONBLOCK);
  fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);
  printf("Started...\n");

#ifdef ALT_VIP_MIX_0_BASE
  // Enable TPG Background : Disable DP image
  IOWR(ALT_VIP_MIX_0_BASE, 0, 0); // Stop
  IOWR(ALT_VIP_MIX_0_BASE, 3, 1920); // Set up background width
  IOWR(ALT_VIP_MIX_0_BASE, 4, 1080); // Set up background height
  IOWR(ALT_VIP_MIX_0_BASE, 5, 0); // Set up uniform background Red/Y
  IOWR(ALT_VIP_MIX_0_BASE, 6, 0); // Set up uniform background Green/Cb
  IOWR(ALT_VIP_MIX_0_BASE, 7, 0); // Set up uniform background Blue/Cr
  IOWR(ALT_VIP_MIX_0_BASE, 8, 0); // Stream 0 offset X
  IOWR(ALT_VIP_MIX_0_BASE, 9, 0); // Stream 0 offset Y
  IOWR(ALT_VIP_MIX_0_BASE, 10, 1); // Stream 0 on
  IOWR(ALT_VIP_MIX_0_BASE, 13, 1614); // Stream 0 offset X
  IOWR(ALT_VIP_MIX_0_BASE, 14, 889); // Stream 0 offset Y
  IOWR(ALT_VIP_MIX_0_BASE, 15, 1); // Stream 0 on
  IOWR(ALT_VIP_MIX_0_BASE, 0, 1); // Go
#endif


  // Init Bitec DP system library
  btc_dptx_syslib_add_tx(0,
  					   BITEC_DP_0_BASE,
                       BITEC_DP_0_IRQ_INTERRUPT_CONTROLLER_ID,
                       BITEC_DP_0_IRQ);
  btc_dptx_syslib_init();

  // Init sink and source
  bitec_dptx_init();

#if BITEC_AUX_DEBUG
  bitec_dp_dump_aux_debug_init(AUX_FIFO_IN_CSR_BASE);
#endif

  // Check if a Sink is readily connected
  {
    unsigned int sr;
    sr = IORD(btc_dptx_baseaddr(0),DPTX_REG_TX_STATUS); // Reading SR clears IRQ
    if(sr & 0x04)
    {
#if BITEC_TX_CAPAB_MST
      btc_dptxll_hpd_change(0,1);
      pc_fsm = PC_FSM_START;
#else
      btc_dptx_hpd_change(0,1);
      bitec_dptx_linktrain(0);
#endif
    }
  }

  BTC_DPTX_ENABLE_HPD_IRQ(0); // Enable IRQ on HPD changes from the sink

  // Main loop
  while(1)
  {
    // Serve Syslib periodic tasks
    btc_dptx_syslib_monitor();
#if BITEC_TX_CAPAB_MST
    btc_dptxll_syslib_monitor();
#endif

#if BITEC_TX_CAPAB_MST
    // Simulate the user MST TX application
    bitec_dptx_pc();
#endif

#if BITEC_AUX_DEBUG
    // Dump AUX channel traffic
    bitec_dp_dump_aux_debug(AUX_FIFO_IN_CSR_BASE, AUX_FIFO_OUT_BASE, 0);
#endif

    // Serve menu commands, if any
    bitec_menu_cmd();

    if(IORD(PIO_0_BASE,0))
    {
      // User pushbutton pressed
#if 0
#else

      // Wait for 500 ms to avoid bouncing
      {
        unsigned int tout;
        alt_timestamp_start();
        tout = alt_timestamp_freq()/2;
        while(alt_timestamp() < tout);
      }

#if BITEC_STATUS_DEBUG
      // Dump MSA
      bitec_dp_dump_source_msa(btc_dptx_baseaddr(0));
      bitec_dp_dump_source_config(btc_dptx_baseaddr(0));
#endif

#endif
    }
  }

  return 0; // Should never get here
}

// Printout all menu commands
void bitec_menu_print()
{
#if BITEC_STATUS_DEBUG
	printf("h = Help\n");
	printf("s = Status\n");
	printf("c = Read Sink DPCD CRC\n");
#if BITEC_DP_0_AV_TX_CONTROL_BITEC_CFG_TX_SUPPORT_HDCP1
	printf("ha1 = HDCP 1.3 TX authenticate\n");
#endif
#if BITEC_DP_0_AV_TX_CONTROL_BITEC_CFG_TX_SUPPORT_HDCP2
  printf("ha2 = HDCP 2.2 TX authenticate\n");
#endif
#if BITEC_DP_0_AV_TX_CONTROL_BITEC_CFG_TX_SUPPORT_HDCP1 || BITEC_DP_0_AV_TX_CONTROL_BITEC_CFG_TX_SUPPORT_HDCP2
	printf("h0 = HDCP TX encryption off\n");
	printf("h1 = HDCP TX encryption on\n");
#endif
#endif
}

// Implementation of menu commands
void bitec_menu_cmd()
{
#if BITEC_STATUS_DEBUG
	char *cmd;

	cmd = bitec_get_stdin();
    if(cmd != NULL)
    {
        if(cmd[0] == 'c')
        {
          BYTE d[6];
          // Sink CRC
          d[0]=1;
          btc_dptx_aux_write(0,DPCD_ADDR_TEST_SINK,1,d);
          usleep(50000);
          btc_dptx_aux_read(0,DPCD_ADDR_TEST_CRC_R_CR_LSB,6,d);
          printf("CRC R : %4.4x  CRC G : %4.4x  CRC B : %4.4x\n", d[0]+(d[1]<<8),d[2]+(d[3]<<8),d[4]+(d[5]<<8));
          d[0]=0;
          btc_dptx_aux_write(0,DPCD_ADDR_TEST_SINK,1,d);
        }
      if(cmd[0] == 's')
      {
        // Dump MSA
        bitec_dp_dump_source_msa(btc_dptx_baseaddr(0));
        bitec_dp_dump_source_config(btc_dptx_baseaddr(0));
      }
      if((cmd[0] == 'h') && (cmd[1] == 0))
		bitec_menu_print();
#if BITEC_DP_0_AV_TX_CONTROL_BITEC_CFG_TX_SUPPORT_HDCP1
      if((cmd[0] == 'h') && (cmd[1] == 'a') && (cmd[2] == '1'))
      {
        BYTE An[8] = {0x34,0x27,0x1c,0x13,0x0c,0x07,0x04,0x03};
        btc_dptx_hdcp1_authenticate(0,An);
      }
#endif
#if BITEC_DP_0_AV_TX_CONTROL_BITEC_CFG_TX_SUPPORT_HDCP2
      if((cmd[0] == 'h') && (cmd[1] == 'a') && (cmd[2] == '2'))
        btc_dptx_hdcp2_authenticate(0,1);
#endif
#if BITEC_DP_0_AV_TX_CONTROL_BITEC_CFG_TX_SUPPORT_HDCP1 || BITEC_DP_0_AV_TX_CONTROL_BITEC_CFG_TX_SUPPORT_HDCP2
      if((cmd[0] == 'h') && (cmd[1] == '0'))
      {
        if(btc_dptx_hdcp_encryption_enable(0,0,0))
          printf("Encryption stop error\n");
        else
          printf("Encryption stop Ok\n");
      }
      if((cmd[0] == 'h') && (cmd[1] == '1'))
      {
        BTC_HDCPTX_STAT s;
        btc_dptx_hdcp_status(0,&s);
        if((s.state != BTC_HDCPTX_STATE_HDCP1_AUTH) && (s.state != BTC_HDCPTX_STATE_HDCP2_AUTH))
          printf("HDCP not Authenticated\n");
        else
        {
            printf("HDCP Authentication ok\n");
            if(btc_dptx_hdcp_encryption_enable(0,0,1))
              printf("Encryption start error\n");
            else
              printf("Encryption start Ok\n");
        }
      }
#endif
    }
#endif
}


