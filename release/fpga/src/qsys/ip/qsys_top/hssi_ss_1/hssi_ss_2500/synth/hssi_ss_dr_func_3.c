#include "io.h"
#include "hssi_ss_reconfig.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

extern unsigned char sim_mode;
unsigned long rdata;

void dr_wait()
{
        //each nop = ~5 cpu cycles
        //1GHz clk = 1ns * 5cycles, n=200 => 1us
        unsigned int n = 0;
        for (n=0; n<2000; n++)
        {   
                __asm volatile ("nop" ::);
        }   
}


void c3_100g_dr_reset(unsigned char ch_num){

        unsigned long ehip_reconfig_base_addr = (unsigned long)(((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
        //printf("EHIP_BASE_ADDRESS = %lx\n", EHIP_BASE_ADDRESS);

        //reset assert
        IOWR(ehip_reconfig_base_addr, 0xe, 0x8);
        dr_wait();
        IOWR(ehip_reconfig_base_addr, 0xe, 0xC);
        dr_wait();
        IOWR(ehip_reconfig_base_addr, 0xe, 0xE);
        dr_wait();
        IOWR(ehip_reconfig_base_addr, 0xe, 0xF);
        dr_wait();

        //reset de-assert
        IOWR(ehip_reconfig_base_addr, 0xe, 0xE);
        dr_wait();
        IOWR(ehip_reconfig_base_addr, 0xe, 0xC);
        dr_wait();
        IOWR(ehip_reconfig_base_addr, 0xe, 0x8);
        dr_wait();
        IOWR(ehip_reconfig_base_addr, 0xe, 0x0);
        dr_wait();
  
}

unsigned char serdes_disable_4ch(unsigned char ch_num){
        unsigned int return_value = 0;
        return_value += serdes_disable(ch_num+0);
        return_value += serdes_disable(ch_num+1);
        return_value += serdes_disable(ch_num+2);
        return_value += serdes_disable(ch_num+3);
        return return_value;
}

unsigned char serdes_enable_4ch(unsigned char ch_num){
        unsigned int return_value = 0;
        return_value += serdes_enable(ch_num+0);
        return_value += serdes_enable(ch_num+1);
        return_value += serdes_enable(ch_num+2);
        return_value += serdes_enable(ch_num+3);
        return return_value;
}

unsigned char serdes_enable_pam4(unsigned char ch_num){
        unsigned int return_value = 0;
        return_value += serdes_enable(ch_num+0);
        return_value += serdes_enable(ch_num+2);
        return return_value;
}

unsigned char pma_analog_reset_4ch(unsigned char ch_num){
        unsigned int return_value = 0;
        return_value += pma_analog_reset(ch_num+0);
        return_value += pma_analog_reset(ch_num+1);
        return_value += pma_analog_reset(ch_num+2);
        return_value += pma_analog_reset(ch_num+3);
        return return_value;
}

void restart_pma_sequncer_4ch(unsigned char ch_num){
        unsigned long xcvr_pma_base_addr0 = (unsigned long)(((ch_num+1) << 21) + PMA_BASE_ADDRESS);
        unsigned long xcvr_pma_base_addr1 = (unsigned long)(((ch_num+2) << 21) + PMA_BASE_ADDRESS);
        unsigned long xcvr_pma_base_addr2 = (unsigned long)(((ch_num+3) << 21) + PMA_BASE_ADDRESS);
        unsigned long xcvr_pma_base_addr3 = (unsigned long)(((ch_num+4) << 21) + PMA_BASE_ADDRESS);
        //printf("PMA_BASE_ADDRESS = %lx\n", PMA_BASE_ADDRESS);
        IOWR_8DIRECT(xcvr_pma_base_addr0, 0x91, 0x1);
        IOWR_8DIRECT(xcvr_pma_base_addr1, 0x91, 0x1);
        IOWR_8DIRECT(xcvr_pma_base_addr2, 0x91, 0x1);
        IOWR_8DIRECT(xcvr_pma_base_addr3, 0x91, 0x1);
}

unsigned char loop_on_4ch(unsigned char ch_num){
         unsigned int return_value = 0;
         return_value += pma_cfg_code(ch_num+0, 0x8, 0x101);
         return_value += pma_cfg_code(ch_num+1, 0x8, 0x101);
         return_value += pma_cfg_code(ch_num+2, 0x8, 0x101);
         return_value += pma_cfg_code(ch_num+3, 0x8, 0x101);
         return return_value;
}

unsigned char loop_off_4ch(unsigned char ch_num){
         unsigned int return_value = 0;
         return_value += pma_cfg_code(ch_num+0, 0x8, 0x100);
         return_value += pma_cfg_code(ch_num+1, 0x8, 0x100);
         return_value += pma_cfg_code(ch_num+2, 0x8, 0x100);
         return_value += pma_cfg_code(ch_num+3, 0x8, 0x100);
         return return_value;
}

unsigned char pma_03_init_adaptation_effort_2_4ch(unsigned char ch_num){
        unsigned int return_value = 0;
        return_value += pma_cfg_code_ana_param(ch_num+0, 0x002C, 0x0118);
        return_value += pma_cfg_code_ana_param(ch_num+1, 0x002C, 0x0118);
        return_value += pma_cfg_code_ana_param(ch_num+2, 0x002C, 0x0118);
        return_value += pma_cfg_code_ana_param(ch_num+3, 0x002C, 0x0118);
        //
        return_value += pma_cfg_code_ana_param(ch_num+0, 0x006C, 0x0001);
        return_value += pma_cfg_code_ana_param(ch_num+1, 0x006C, 0x0001);
        return_value += pma_cfg_code_ana_param(ch_num+2, 0x006C, 0x0001);
        return_value += pma_cfg_code_ana_param(ch_num+3, 0x006C, 0x0001);
        //
        return_value += pma_cfg_code(ch_num+0, 0x000A, 0x0001);
        return_value += pma_cfg_code(ch_num+1, 0x000A, 0x0001);
        return_value += pma_cfg_code(ch_num+2, 0x000A, 0x0001);
        return_value += pma_cfg_code(ch_num+3, 0x000A, 0x0001);
        return return_value;
}

unsigned char pma_03_init_adaptation_4ch(unsigned char ch_num){
        unsigned int return_value = 0;
        return_value += pma_cfg_code(ch_num+0, 0x000A, 0x0001);
        return_value += pma_cfg_code(ch_num+1, 0x000A, 0x0001);
        return_value += pma_cfg_code(ch_num+2, 0x000A, 0x0001);
        return_value += pma_cfg_code(ch_num+3, 0x000A, 0x0001);
        return return_value;
}

//--------------------------------------DR_PROFILE_3_100geth_rsfec_Start-----------------------------------------------------

//***************************************************************************************************************************
unsigned int HSSI_TO_100G_FEC(unsigned int port_num){
        unsigned int return_value = 0;
        unsigned int ch_num = 0;
        unsigned long rdata;
        ch_num = get_ch_num(port_num);

        unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
        unsigned long ehip_reconfig_base_addr = (unsigned long)(((ch_num+1) << 21) + EHIP_BASE_ADDRESS);

        //Temp setting of curr profile to EHIP/100G for DR configuration of C3 NIOS  
        //as C3 NIOS DR registers are accessible through EHIP eth reconfig only
        unsigned long curr_profile_addr = (unsigned long)(0x4110400) + (unsigned long)(port_num*0x10);
        IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);

     if (sim_mode == 0) {
        // 1. serdes disable
        return_value += serdes_disable_4ch(ch_num);
		    alt_timestamp_start();
        // 2. tx/rx asserting based on traget profile //CHECK
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);

		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
        // 3. pma analog reset
        return_value += pma_analog_reset_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };

        // 4. Restart pma sequncer
        restart_pma_sequncer_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };
     }
     else {
        //------------------------------------ SIM Mode ------------------------------------------------
          // tx/rx asserting
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xe);
     }


        // 5. DR switch based on traget profile
        //setting to fec enable
        IOWR(ehip_reconfig_base_addr,0x15,0xf);

        //from testbench, indicating reset sequencer that fec is enabled 
        IOWR(ehip_reconfig_base_addr,0x313,0x0);

        //setting to 100g mode
        IOWR(ehip_reconfig_base_addr,0x13,0x10000);
        //IOWR(ehip_reconfig_base_addr,0x14,0x5);

        //dr switch trigger
        IOWR(ehip_reconfig_base_addr,0x09,0x1);

        //Poll till 1'b0.
        //return_value += polling_for_cfg_bit (ehip_reconfig_base_addr, 0x0, 0);
        do {
          rdata = IORD(ehip_reconfig_base_addr, 0x0);
        } while (rdata & 0x00000001); 
        //printf("DR Done\n");

     if (sim_mode == 0) {
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 6. serdes enable based on target profile
        return_value += serdes_enable_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 7. DR reset from c3 firmware
        c3_100g_dr_reset(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 8. Tx reset de-assert, rx reset assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xA);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER3) { };

        // 9. enabled serial loopback
        return_value += loop_on_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 10. PMA 03 adaptation with effort 2(full effort)
        return_value += pma_03_init_adaptation_effort_2_4ch(ch_num);

        // 11. PMA 03 adaptation //CHECK 
        return_value += pma_03_init_adaptation_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 12. disable serial loopback
        return_value += loop_off_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 13. Rx reset de-assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xE);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

     }

        //8. tx/rx resetting
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
        //IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
        if (return_value == 0) {
          return 0;
        }
        else {
          return 1;
        }
}


//***************************************************************************************************************************
unsigned int HSSI_TO_100G_NOFEC(unsigned int port_num){
        unsigned int return_value = 0;
        unsigned int ch_num = 0;
        ch_num = get_ch_num(port_num);

        unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
        unsigned long ehip_reconfig_base_addr = (unsigned long)(((ch_num+1) << 21) + EHIP_BASE_ADDRESS);

        //Temp setting of curr profile to EHIP/100G for DR configuration of C3 NIOS  
        //as C3 NIOS DR registers are accessible through EHIP eth reconfig only
        unsigned long curr_profile_addr = (unsigned long)(0x4110400) + (unsigned long)(port_num*0x10);
        IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);

     if (sim_mode == 0) {
        // 1. serdes disable
        return_value += serdes_disable_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };

        // 2. tx/rx asserting based on traget profile //CHECK
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };

        // 3. pma analog reset
        return_value += pma_analog_reset_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };

        // 4. Restart pma sequncer
        restart_pma_sequncer_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };
     }
     else {
        //------------------------------------ SIM Mode ------------------------------------------------
          // tx/rx asserting
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xe);
     }

        // 5. DR switch based on traget profile
        //setting to fec disable
        IOWR(ehip_reconfig_base_addr,0x15,0x0);

        //from testbench, indicating reset sequencer that fec is disabled 
        IOWR(ehip_reconfig_base_addr,0x313,0x20);

        //setting to 100g mode
        IOWR(ehip_reconfig_base_addr,0x13,0x10000);
        //IOWR(ehip_reconfig_base_addr,0x14,0x5);

        //dr switch trigger
        IOWR(ehip_reconfig_base_addr,0x09,0x1);

        //Poll till 1'b0.
        //return_value += polling_for_cfg_bit (ehip_reconfig_base_addr, 0x0, 0);
        do {
          rdata = IORD(ehip_reconfig_base_addr, 0x0);
        } while (rdata & 0x00000001); 
        //printf("DR Done\n");


     if (sim_mode == 0) {
        alt_timestamp_start();
        while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 6. serdes enable based on target profile
        return_value += serdes_enable_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };
        // 7. DR reset from c3 firmware
        c3_100g_dr_reset(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 8. Tx reset de-assert, rx reset assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xA);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER3) { };

        // 9. enabled serial loopback
        return_value += loop_on_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 10. PMA 03 adaptation with effort 2(full effort)
        return_value += pma_03_init_adaptation_effort_2_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 11. PMA 03 adaptation //CHECK 
        return_value += pma_03_init_adaptation_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 12. disable serial loopback
        return_value += loop_off_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 13. Rx reset de-assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xE);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

     }


        //8. tx/rx resetting
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
        //IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
        if (return_value == 0) {
          return 0;
        }
        else {
          return 1;
        }
}

//***************************************************************************************************************************
unsigned int HSSI_TO_4x25g_fec(unsigned int port_num){
        unsigned int return_value = 0;
        unsigned int ch_num = 0;
        ch_num = get_ch_num(port_num);

        unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
        unsigned long ehip_reconfig_base_addr = (unsigned long)(((ch_num+1) << 21) + EHIP_BASE_ADDRESS);

        //Temp setting of curr profile to EHIP/100G for DR configuration of C3 NIOS  
        //as C3 NIOS DR registers are accessible through EHIP eth reconfig only
        unsigned long curr_profile_addr = (unsigned long)(0x4110400) + (unsigned long)(port_num*0x10);
        IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);


     if (sim_mode == 0) {
        // 1. serdes disable
        return_value += serdes_disable_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };

        // 2. tx/rx asserting based on traget profile //CHECK
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);

        // 3. pma analog reset
        return_value += pma_analog_reset_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };

        // 4. Restart pma sequncer
        restart_pma_sequncer_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };
     }
     else {
        //------------------------------------ SIM Mode ------------------------------------------------
          // tx/rx asserting
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xe);
     }


        // 5. DR switch based on traget profile
        //setting to fec disable
        IOWR(ehip_reconfig_base_addr,0x15,0xf);

        //from testbench, indicating reset sequencer that fec is enabled 
        IOWR(ehip_reconfig_base_addr,0x313,0x0);

        //setting to 100g mode
        IOWR(ehip_reconfig_base_addr,0x13,0xf);
        //IOWR(ehip_reconfig_base_addr,0x14,0x05050505);

        //dr switch trigger
        IOWR(ehip_reconfig_base_addr,0x09,0x1);

        //Poll till 1'b0.
        //return_value += polling_for_cfg_bit (ehip_reconfig_base_addr, 0x0, 0);
        do {
          rdata = IORD(ehip_reconfig_base_addr, 0x0);
        } while (rdata & 0x00000001); 
     
     if (sim_mode == 0) {
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 6. serdes enable based on target profile
        return_value += serdes_enable_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 7. DR reset from c3 firmware
        c3_100g_dr_reset(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 8. Tx reset de-assert, rx reset assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xA);
        alt_timestamp_start();
       	while (alt_timestamp() < GRP3_DR_TIMER3) { };
        // 9. enabled serial loopback
        return_value += loop_on_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 10. PMA 03 adaptation with effort 2(full effort)
        return_value += pma_03_init_adaptation_effort_2_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 11. PMA 03 adaptation //CHECK 
        return_value += pma_03_init_adaptation_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 12. disable serial loopback
        return_value += loop_off_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 13. Rx reset de-assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xE);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

     }

        //8. tx/rx resetting
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
        //IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
         if (return_value == 0) {
          return 0;
        }
        else {
          return 1;
        }
}

//***************************************************************************************************************************
unsigned int HSSI_TO_4x25g_nofec(unsigned int port_num){
        unsigned int return_value = 0;
        unsigned int ch_num = 0;
        ch_num = get_ch_num(port_num);

        unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
        unsigned long ehip_reconfig_base_addr = (unsigned long)(((ch_num+1) << 21) + EHIP_BASE_ADDRESS);

        //Temp setting of curr profile to EHIP/100G for DR configuration of C3 NIOS  
        //as C3 NIOS DR registers are accessible through EHIP eth reconfig only
        unsigned long curr_profile_addr = (unsigned long)(0x4110400) + (unsigned long)(port_num*0x10);
        IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);

     if (sim_mode == 0) {
        // 1. serdes disable
        return_value += serdes_disable_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
        // 2. tx/rx asserting based on traget profile //CHECK
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);

		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
        // 3. pma analog reset
        return_value += pma_analog_reset_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
        // 4. Restart pma sequncer
        restart_pma_sequncer_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };
     }
     else {
        //------------------------------------ SIM Mode ------------------------------------------------
          // tx/rx asserting
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xe);
     }


        // 5. DR switch based on traget profile
        //setting to fec disable
        IOWR(ehip_reconfig_base_addr,0x15,0x0);

        //from testbench, indicating reset sequencer that fec is disabled 
        IOWR(ehip_reconfig_base_addr,0x313,0x20);

        //setting to 100g mode
        IOWR(ehip_reconfig_base_addr,0x13,0xf);
        //IOWR(ehip_reconfig_base_addr,0x14,0x05050505);

        //dr switch trigger
        IOWR(ehip_reconfig_base_addr,0x09,0x1);

        //Poll till 1'b0.
        //return_value += polling_for_cfg_bit (ehip_reconfig_base_addr, 0x0, 0);

        do {
           rdata = IORD(ehip_reconfig_base_addr, 0x0);
        } while (rdata & 0x00000001); 
        
      if (sim_mode == 0) {
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 6. serdes enable based on target profile
        return_value += serdes_enable_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 7. DR reset from c3 firmware
        c3_100g_dr_reset(ch_num);

        // 8. Tx reset de-assert, rx reset assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xA);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER3) { };

        // 9. enabled serial loopback
        return_value += loop_on_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 10. PMA 03 adaptation with effort 2(full effort)
        return_value += pma_03_init_adaptation_effort_2_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 11. PMA 03 adaptation //CHECK 
        return_value += pma_03_init_adaptation_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 12. disable serial loopback
        return_value += loop_off_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 13. Rx reset de-assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xE);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

     }


        //8. tx/rx resetting
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
        //IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xf);
         if (return_value == 0) {
          return 0;
        }
        else {
          return 1;
        }
}

//***************************************************************************************************************************
unsigned int HSSI_TO_PAM4(unsigned int port_num){
        unsigned int return_value = 0;
        unsigned int ch_num = 0;
        unsigned long rdata;
        
        ch_num = get_ch_num(port_num);

        unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
        unsigned long ehip_reconfig_base_addr = (unsigned long)(((ch_num+1) << 21) + EHIP_BASE_ADDRESS);
        //printf("EHIP_BASE_ADDRESS = %lx, Ch = %x\n", EHIP_BASE_ADDRESS, ch_num);

        //Temp setting of curr profile to EHIP/100G for DR configuration of C3 NIOS  
        //as C3 NIOS DR registers are accessible through EHIP eth reconfig only
        unsigned long curr_profile_addr = (unsigned long)(0x4110400) + (unsigned long)(port_num*0x10);
        IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);
        //printf("Running PAM4\n");

     if (sim_mode == 0) {
        // 1. serdes disable
        return_value += serdes_disable_4ch(ch_num);
		    alt_timestamp_start();
       // printf("time stmap = %lx\n", alt_timestamp());
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
       // printf("time stmap = %lx\n", alt_timestamp());

        // 2. tx/rx asserting based on traget profile //CHECK
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
		    alt_timestamp_start();
       // printf("time stmap = %lx\n", alt_timestamp());
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
        //printf("time stmap = %lx\n", alt_timestamp());

        // 3. pma analog reset
        return_value +=  pma_analog_reset_4ch(ch_num);
		    alt_timestamp_start();
        //printf("time stmap = %lx\n", alt_timestamp());
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
        //printf("time stmap = %lx\n", alt_timestamp());

        // 4. Restart pma 
        restart_pma_sequncer_4ch(ch_num);
		    alt_timestamp_start();
        //printf("time stmap = %lx\n", alt_timestamp());
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };
        //printf("time stmap = %lx\n", alt_timestamp());
     }
     else {
        //------------------------------------ SIM Mode ------------------------------------------------
          // tx/rx asserting
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xe);
     }


        // 5. DR switch based on traget profile
        //setting to PAM4 with 544/514 fec enable
        IOWR(ehip_reconfig_base_addr,0x15,0x30f);

        //from testbench, indicating reset sequencer that fec is enabled 
        IOWR(ehip_reconfig_base_addr,0x313,0x0);

        //setting to 100g mode
        IOWR(ehip_reconfig_base_addr,0x13,0x10000);
        //IOWR(ehip_reconfig_base_addr,0x14,0x5

        //dr switch trigger
        IOWR(ehip_reconfig_base_addr,0x09,0x1);
        //printf("DR begin\n");
        //Poll till 1'b0.
        //return_value += polling_for_cfg_bit (ehip_reconfig_base_addr, 0x0, 0);
        do {
          rdata = IORD(ehip_reconfig_base_addr, 0x0);
        } while (rdata & 0x00000001); 
        //printf("DR Done\n");


     if (sim_mode == 0) {
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 6. serdes enable based on target profile
        return_value += serdes_enable_pam4(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 7. DR reset from c3 firmware
        c3_100g_dr_reset(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 8. Tx reset de-assert, rx reset assert
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x4);
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xA);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER3) { };

        // 9. enabled serial loopback
        return_value += loop_on_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 10. PMA 03 adaptation with effort 2(full effort)
        pma_03_init_adaptation_effort_2_4ch(ch_num);

        // 11. PMA 03 adaptation //CHECK 
        pma_03_init_adaptation_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 12. disable serial loopback
        return_value += loop_off_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 13. Rx reset de-assert
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xE);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

     }

        //8. tx/rx resetting
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
        if (return_value == 0) {
          return 0;
        }
        else {
          return 1;
        }
}

//***************************************************************************************************************************
unsigned int HSSI_TO_100G_KPFEC(unsigned int port_num){
        unsigned int return_value = 0;
        unsigned int ch_num = 0;
        
        ch_num = get_ch_num(port_num);

        unsigned long pio_reset_addr = (unsigned long)(0x4110500) + (unsigned long)(port_num*0x10);
        unsigned long ehip_reconfig_base_addr = (unsigned long)(((ch_num+1) << 21) + EHIP_BASE_ADDRESS);

        //Temp setting of curr profile to EHIP/100G for DR configuration of C3 NIOS  
        //as C3 NIOS DR registers are accessible through EHIP eth reconfig only
        unsigned long curr_profile_addr = (unsigned long)(0x4110400) + (unsigned long)(port_num*0x10);
        IOWR_ALTERA_AVALON_PIO_DATA(curr_profile_addr,0x0);

     if (sim_mode == 0) {
        // 1. serdes disable
        return_value += serdes_disable_4ch(ch_num);
		    alt_timestamp_start();

	      while (alt_timestamp() < GRP3_DR_TIMER1) { };
        // 2. tx/rx asserting based on traget profile //CHECK
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x6);
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0x8);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };

        // 3. pma analog reset
        return_value += pma_analog_reset_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER1) { };

        // 4. Restart pma sequncer
        restart_pma_sequncer_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };
     }
     else {
        //------------------------------------ SIM Mode ------------------------------------------------
          // tx/rx asserting
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xe);
     }


        // 5. DR switch based on traget profile
        //setting to 100G NRZ with 544/514 fec enable
        IOWR(ehip_reconfig_base_addr,0x15,0x10f);

        //from testbench, indicating reset sequencer that fec is enabled 
        IOWR(ehip_reconfig_base_addr,0x313,0x0);

        //setting to 100g mode
        IOWR(ehip_reconfig_base_addr,0x13,0x10000);
        //IOWR(ehip_reconfig_base_addr,0x14,0x5);

        //dr switch trigger
        IOWR(ehip_reconfig_base_addr,0x09,0x1);

        //Poll till 1'b0.
         do {
                rdata = IORD(ehip_reconfig_base_addr, 0x0);
        } while (rdata & 0x00000001); 
        //printf("DR Done\n");

        //return_value += polling_for_cfg_bit (ehip_reconfig_base_addr, 0x0, 0);

     if (sim_mode == 0) {
        alt_timestamp_start();
        while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 6. serdes enable based on target profile
        return_value += serdes_enable_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 7. DR reset from c3 firmware
        c3_100g_dr_reset(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 8. Tx reset de-assert, rx reset assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xA);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER3) { };

        // 9. enabled serial loopback
        return_value += loop_on_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 10. PMA 03 adaptation with effort 2(full effort)
        return_value += pma_03_init_adaptation_effort_2_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 11. PMA 03 adaptation //CHECK 
        return_value += pma_03_init_adaptation_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 12. disable serial loopback
        return_value += loop_off_4ch(ch_num);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

        // 13. Rx reset de-assert
        IOWR_ALTERA_AVALON_PIO_DATA(pio_reset_addr,0xE);
		    alt_timestamp_start();
	      while (alt_timestamp() < GRP3_DR_TIMER2) { };

     }

        //8. tx/rx resetting
        //IOWR(ehip_reconfig_base_addr, 0x310, 0x0);
         if (return_value == 0) {
          return 0;
        }
        else {
          return 1;
        }
}



//--------------------------------------DR_PROFILE_3_100geth_rsfec_End-----------------------------------------------------

