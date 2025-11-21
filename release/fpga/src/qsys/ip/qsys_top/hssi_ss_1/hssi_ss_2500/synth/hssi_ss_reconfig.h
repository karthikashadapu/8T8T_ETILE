
#ifndef HSSI_RECONFIG_H_
#define HSSI_RECONFIG_H_

#include <stdio.h>
#include <unistd.h>
#include "io.h"

// Optimize for simulation
//#define SIM_ONLY

// EHIP lane register offsets
#define PHY_REVID                         0x300
#define PHY_SCRATCH                       0x301
#define PHY_NAME_0                        0x302
#define PHY_NAME_1                        0x303
#define PHY_NAME_2                        0x304
#define PHY_EHIP_MODE_MUXES               0x30D
#define PHY_EHIP_PCS_MODES                0x30E
#define PHY_EHIP_CLOCK_GATING             0x30F
#define PHY_EHIP_CSR_SOFT_RESET           0x310
#define PHY_FRAME_ERROR                   0x323
#define PHY_SCLR_FRAME_ERROR              0x324
#define PHY_EIO_SFTRESET                  0x325
#define PHY_RXPCS_STATUS                  0x326
#define ERR_INJ                           0x327
#define AM_LOCK                           0x328
#define LANES_DESKEWED                    0x329
#define BER_COUNT                         0x32A
#define PCS_VLANE_0                       0x330
#define PCS_VLANE_1                       0x331
#define PCS_VLANE_2                       0x332
#define PCS_VLANE_3                       0x333
#define PHY_REFCLK_KHZ                    0x340
#define PHY_RECCLK_KHZ                    0x341
#define PHY_TXCLK_KHZ                     0x342
#define TX_PLD_CONF                       0x350
#define TX_PLD_STATUS                     0x351
#define PHY_RXPMA_STATUS                  0x354
#define RX_PLD_CONF                       0x355
#define RX_PLD_STATUS                     0x356
#define RXPCS_CONF                        0x360
#define BIP_COUNTER_0                     0x361
#define BIP_COUNTER_1                     0x362
#define BIP_COUNTER_2                     0x363
#define BIP_COUNTER_3                     0x364
#define BIP_COUNTER_4                     0x365
#define BIP_COUNTER_5                     0x366
#define BIP_COUNTER_6                     0x367
#define BIP_COUNTER_7                     0x368
#define BIP_COUNTER_8                     0x369
#define BIP_COUNTER_9                     0x36A
#define BIP_COUNTER_10                    0x36B
#define BIP_COUNTER_11                    0x36C
#define BIP_COUNTER_12                    0x36D
#define BIP_COUNTER_13                    0x36E
#define BIP_COUNTER_14                    0x36F
#define BIP_COUNTER_15                    0x370
#define BIP_COUNTER_16                    0x371
#define BIP_COUNTER_17                    0x372
#define BIP_COUNTER_18                    0x373
#define BIP_COUNTER_19                    0x374
#define AM_ENCODING_0                     0x376
#define AM_ENCODING_1                     0x377
#define AM_ENCODING_2                     0x378
#define AM_ENCODING_3                     0x379
#define XUS_TIMER_WINDOW                  0x37A
#define BER_INVALID_COUNT                 0x37B
#define ERR_BLOCK_CNT                     0x37C
#define RX_PCS_INT_ERR                    0x37D
#define RX_PCS_INT_ERR_MASK               0x37E
#define DSK_DEPTH_0                       0x37F
#define DSK_DEPTH_1                       0x380
#define DSK_DEPTH_2                       0x381
#define DSK_DEPTH_3                       0x382
#define RX_PCS_TEST_ERR_CNT               0x383
#define DPRIO_CONTROL_0                   0x384
#define DPRIO_CONTROL_1                   0x385
#define DPRIO_CONTROL_2                   0x386
#define DPRIO_CONTROL_3                   0x387
#define DPRIO_CONTROL_4                   0x388
#define DPRIO_CONTROL_5                   0x389
#define TXMAC_REVID                       0x400
#define TXMAC_SCRATCH                     0x401
#define TXMAC_NAME_0                      0x402
#define TXMAC_NAME_1                      0x403
#define TXMAC_NAME_2                      0x404
#define LINK_FAULT_CONFIG                 0x405
#define IPG_COL_REM                       0x406
#define MAX_TX_SIZE_CONFIG                0x407
#define TXMAC_CONTROL                     0x40A
#define TXMAC_EHIP_CFG                    0x40B
#define TXMAC_SADDRL                      0x40C
#define TXMAC_SADDRH                      0x40D
#define RXMAC_REVID                       0x500
#define RXMAC_SCRATCH                     0x501
#define RXMAC_NAME_0                      0x502
#define RXMAC_NAME_1                      0x503
#define RXMAC_NAME_2                      0x504
#define MAX_RX_SIZE_CONFIG                0x506
#define MAC_CRC_CONFIG                    0x507
#define LINK_FAULT_STATUS                 0x508
#define RXMAC_CONTROL                     0x50A
#define RXMAC_EHIP_CFG                    0x50B
#define TXSFC_REVID                       0x600
#define TXSFC_SCRATCH                     0x601
#define TXSFC_NAME_0                      0x602
#define TXSFC_NAME_1                      0x603
#define TXSFC_NAME_2                      0x604
#define TX_PAUSE_EN                       0x605
#define TX_PAUSE_REQUEST                  0x606
#define RETRANSMIT_XOFF_HOLDOFF_EN        0x607
#define RETRANSMIT_XOFF_HOLDOFF_QUANTA    0x608
#define TX_PAUSE_QUANTA                   0x609
#define TX_XOF_EN_TX_PAUSE_QNUMBER        0x60A
#define CFG_RETRANSMIT_HOLDOFF_EN         0x60B
#define CFG_RETRANSMIT_HOLDOFF_QUANTA     0x60C
#define TX_PFC_DADDRL                     0x60D
#define TX_PFC_DADDRH                     0x60E
#define TX_PFC_SADDRL                     0x60F
#define TX_PFC_SADDRH                     0x610
#define TXSFC_EHIP_CFG                    0x611
#define PFC_PAUSE_QUANTA_0                0x620
#define PFC_PAUSE_QUANTA_1                0x621
#define PFC_PAUSE_QUANTA_2                0x622
#define PFC_PAUSE_QUANTA_3                0x623
#define PFC_PAUSE_QUANTA_4                0x624
#define PFC_PAUSE_QUANTA_5                0x625
#define PFC_PAUSE_QUANTA_6                0x626
#define PFC_PAUSE_QUANTA_7                0x627
#define PFC_HOLDOFF_QUANTA_0              0x628
#define PFC_HOLDOFF_QUANTA_1              0x629
#define PFC_HOLDOFF_QUANTA_2              0x62A
#define PFC_HOLDOFF_QUANTA_3              0x62B
#define PFC_HOLDOFF_QUANTA_4              0x62C
#define PFC_HOLDOFF_QUANTA_5              0x62D
#define PFC_HOLDOFF_QUANTA_6              0x62E
#define PFC_HOLDOFF_QUANTA_7              0x62F
#define RXSFC_REVID                       0x700
#define RXSFC_SCRATCH                     0x701
#define RXSFC_NAME_0                      0x702
#define RXSFC_NAME_1                      0x703
#define RXSFC_NAME_2                      0x704
#define RX_PAUSE_ENABLE                   0x705
#define RX_PAUSE_FWD                      0x706
#define RX_PAUSE_DADDRL                   0x707
#define RX_PAUSE_DADDRH                   0x708
#define RXSFC_EHIP_CFG                    0x709
#define CNTR_TX_FRAGMENTS_LO              0x800
#define CNTR_TX_FRAGMENTS_HI              0x801
#define CNTR_TX_JABBERS_LO                0x802
#define CNTR_TX_JABBERS_HI                0x803
#define CNTR_TX_FCS_LO                    0x804
#define CNTR_TX_FCS_HI                    0x805
#define CNTR_TX_FCS_ERR_OKPKT_LO          0x806
#define CNTR_TX_FCS_ERR_OKPKT_HI          0x807
#define CNTR_TX_MCAST_DATA_ERR_LO         0x808
#define CNTR_TX_MCAST_DATA_ERR_HI         0x809
#define CNTR_TX_BCAST_DATA_ERR_LO         0x80A
#define CNTR_TX_BCAST_DATA_ERR_HI         0x80B
#define CNTR_TX_UCAST_DATA_ERR_LO         0x80C
#define CNTR_TX_UCAST_DATA_ERR_HI         0x80D
#define CNTR_TX_MCAST_CTRL_ERR_LO         0x80E
#define CNTR_TX_MCAST_CTRL_ERR_HI         0x80F
#define CNTR_TX_BCAST_CTRL_ERR_LO         0x810
#define CNTR_TX_BCAST_CTRL_ERR_HI         0x811
#define CNTR_TX_UCAST_CTRL_ERR_LO         0x812
#define CNTR_TX_UCAST_CTRL_ERR_HI         0x813
#define CNTR_TX_PAUSE_ERR_LO              0x814
#define CNTR_TX_PAUSE_ERR_HI              0x815
#define CNTR_TX_64B_LO                    0x816
#define CNTR_TX_64B_HI                    0x817
#define CNTR_TX_65TO127B_LO               0x818
#define CNTR_TX_65TO127B_HI               0x819
#define CNTR_TX_128TO255B_LO              0x81A
#define CNTR_TX_128TO255B_HI              0x81B
#define CNTR_TX_256TO511B_LO              0x81C
#define CNTR_TX_256TO511B_HI              0x81D
#define CNTR_TX_512TO1023B_LO             0x81E
#define CNTR_TX_512TO1023B_HI             0x81F
#define CNTR_TX_1024TO1518B_LO            0x820
#define CNTR_TX_1024TO1518B_HI            0x821
#define CNTR_TX_1519TOMAXB_LO             0x822
#define CNTR_TX_1519TOMAXB_HI             0x823
#define CNTR_TX_OVERSIZE_LO               0x824
#define CNTR_TX_OVERSIZE_HI               0x825
#define CNTR_TX_MCAST_DATA_OK_LO          0x826
#define CNTR_TX_MCAST_DATA_OK_HI          0x827
#define CNTR_TX_BCAST_DATA_OK_LO          0x828
#define CNTR_TX_BCAST_DATA_OK_HI          0x829
#define CNTR_TX_UCAST_DATA_OK_LO          0x82A
#define CNTR_TX_UCAST_DATA_OK_HI          0x82B
#define CNTR_TX_MCAST_CTRL_LO             0x82C
#define CNTR_TX_MCAST_CTRL_HI             0x82D
#define CNTR_TX_BCAST_CTRL_LO             0x82E
#define CNTR_TX_BCAST_CTRL_HI             0x82F
#define CNTR_TX_UCAST_CTRL_LO             0x830
#define CNTR_TX_UCAST_CTRL_HI             0x831
#define CNTR_TX_PAUSE_LO                  0x832
#define CNTR_TX_PAUSE_HI                  0x833
#define CNTR_TX_RUNT_LO                   0x834
#define CNTR_TX_RUNT_HI                   0x835
#define CNTR_TX_ST_LO                     0x836
#define CNTR_TX_ST_HI                     0x837
#define CNTR_TX_LENERR_LO                 0x838
#define CNTR_TX_LENERR_HI                 0x839
#define CNTR_TX_PFC_ERR_LO                0x83A
#define CNTR_TX_PFC_ERR_HI                0x83B
#define CNTR_TX_PFC_LO                    0x83C
#define CNTR_TX_PFC_HI                    0x83D
#define TXSTAT_REVID                      0x840
#define TXSTAT_SCRATCH                    0x841
#define TXSTAT_NAME_0                     0x842
#define TXSTAT_NAME_1                     0x843
#define TXSTAT_NAME_2                     0x844
#define CNTR_TX_CONFIG                    0x845
#define CNTR_TX_STATUS                    0x846
#define CNTR_TX_PAYLOADOCTETSOK_LO        0x860
#define CNTR_TX_PAYLOADOCTETSOK_HI        0x861
#define TXOCTETSOK_LO                     0x862
#define TXOCTETSOK_HI                     0x863
#define CNTR_TX_MALFORMED_LO              0x864
#define CNTR_TX_MALFORMED_HI              0x865
#define CNTR_TX_DROPPED_LO                0x866
#define CNTR_TX_DROPPED_HI                0x867
#define CNTR_TX_BADLT_LO                  0x868
#define CNTR_TX_BADLT_HI                  0x869
#define CNTR_RX_FRAGMENTS_LO              0x900
#define CNTR_RX_FRAGMENTS_HI              0x901
#define CNTR_RX_JABBERS_LO                0x902
#define CNTR_RX_JABBERS_HI                0x903
#define CNTR_RX_FCS_LO                    0x904
#define CNTR_RX_FCS_HI                    0x905
#define CNTR_RX_FCS_ERR_OKPKT_LO          0x906
#define CNTR_RX_FCS_ERR_OKPKT_HI          0x907
#define CNTR_RX_MCAST_DATA_ERR_LO         0x908
#define CNTR_RX_MCAST_DATA_ERR_HI         0x909
#define CNTR_RX_BCAST_DATA_ERR_LO         0x90A
#define CNTR_RX_BCAST_DATA_ERR_HI         0x90B
#define CNTR_RX_UCAST_DATA_ERR_LO         0x90C
#define CNTR_RX_UCAST_DATA_ERR_HI         0x90D
#define CNTR_RX_MCAST_CTRL_ERR_LO         0x90E
#define CNTR_RX_MCAST_CTRL_ERR_HI         0x90F
#define CNTR_RX_BCAST_CTRL_ERR_LO         0x910
#define CNTR_RX_BCAST_CTRL_ERR_HI         0x911
#define CNTR_RX_UCAST_CTRL_ERR_LO         0x912
#define CNTR_RX_UCAST_CTRL_ERR_HI         0x913
#define CNTR_RX_PAUSE_ERR_LO              0x914
#define CNTR_RX_PAUSE_ERR_HI              0x915
#define CNTR_RX_64B_LO                    0x916
#define CNTR_RX_64B_HI                    0x917
#define CNTR_RX_65TO127B_LO               0x918
#define CNTR_RX_65TO127B_HI               0x919
#define CNTR_RX_128TO255B_LO              0x91A
#define CNTR_RX_128TO255B_HI              0x91B
#define CNTR_RX_256TO511B_LO              0x91C
#define CNTR_RX_256TO511B_HI              0x91D
#define CNTR_RX_512TO1023B_LO             0x91E
#define CNTR_RX_512TO1023B_HI             0x91F
#define CNTR_RX_1024TO1518B_LO            0x920
#define CNTR_RX_1024TO1518B_HI            0x921
#define CNTR_RX_1519TOMAXB_LO             0x922
#define CNTR_RX_1519TOMAXB_HI             0x923
#define CNTR_RX_OVERSIZE_LO               0x924
#define CNTR_RX_OVERSIZE_HI               0x925
#define CNTR_RX_MCAST_DATA_OK_LO          0x926
#define CNTR_RX_MCAST_DATA_OK_HI          0x927
#define CNTR_RX_BCAST_DATA_OK_LO          0x928
#define CNTR_RX_BCAST_DATA_OK_HI          0x929
#define CNTR_RX_UCAST_DATA_OK_LO          0x92A
#define CNTR_RX_UCAST_DATA_OK_HI          0x92B
#define CNTR_RX_MCAST_CTRL_LO             0x92C
#define CNTR_RX_MCAST_CTRL_HI             0x92D
#define CNTR_RX_BCAST_CTRL_LO             0x92E
#define CNTR_RX_BCAST_CTRL_HI             0x92F
#define CNTR_RX_UCAST_CTRL_LO             0x930
#define CNTR_RX_UCAST_CTRL_HI             0x931
#define CNTR_RX_PAUSE_LO                  0x932
#define CNTR_RX_PAUSE_HI                  0x933
#define CNTR_RX_RUNT_LO                   0x934
#define CNTR_RX_RUNT_HI                   0x935
#define CNTR_RX_ST_LO                     0x936
#define CNTR_RX_ST_HI                     0x937
#define CNTR_RX_LENERR_LO                 0x938
#define CNTR_RX_LENERR_HI                 0x939
#define CNTR_RX_PFC_ERR_LO                0x93A
#define CNTR_RX_PFC_ERR_HI                0x93B
#define CNTR_RX_PFC_LO                    0x93C
#define CNTR_RX_PFC_HI                    0x93D
#define RXSTAT_REVID                      0x940
#define RXSTAT_SCRATCH                    0x941
#define RXSTAT_NAME_0                     0x942
#define RXSTAT_NAME_1                     0x943
#define RXSTAT_NAME_2                     0x944
#define CNTR_RX_CONFIG                    0x945
#define CNTR_RX_STATUS                    0x946
#define CNTR_RX_PAYLOADOCTETSOK_LO        0x960
#define CNTR_RX_PAYLOADOCTETSOK_HI        0x961
#define RXOCTETSOK_LO                     0x962
#define RXOCTETSOK_HI                     0x963
#define CNTR_RX_MALFORMED_LO              0x964
#define CNTR_RX_MALFORMED_HI              0x965
#define CNTR_RX_DROPPED_LO                0x966
#define CNTR_RX_DROPPED_HI                0x967
#define CNTR_RX_BADLT_LO                  0x968
#define CNTR_RX_BADLT_HI                  0x969
#define TXPTP_REVID                       0xA00
#define TXPTP_SCRATCH                     0xA01
#define TXPTP_NAME_0                      0xA02
#define TXPTP_NAME_1                      0xA03
#define TXPTP_NAME_2                      0xA04
#define TX_PTP_CLK_PERIOD                 0xA05
#define TX_PTP_STATUS                     0xA09
#define TX_PTP_EXTRA_LATENCY              0xA0A
#define TX_PTP_ASYM_LATENCY               0xA0B
#define TX_PTP_DP_LATENCY                 0xA0C
#define PTP_DEBUG                         0xA0D
#define TX_AIB_DP_LATENCY_LATENCY         0xA0E
#define RXPTP_REVID                       0xB00
#define RXPTP_SCRATCH                     0xB01
#define RXPTP_NAME_0                      0xB02
#define RXPTP_NAME_1                      0xB03
#define RXPTP_NAME_2                      0xB04
#define RX_PTP_CLK_PERIOD                 0xB05
#define RX_PTP_EXTRA_LATENCY              0xB06
#define RX_PTP_DP_LATENCY                 0xB07


//BASE Registers

#define PMA_BASE_ADDRESS 				 0x50000
#define EHIP_BASE_ADDRESS 				 0x0
#define RSFEC_BASE_ADDRESS 			 	 0x4000
#define PMA_CAPABILITY_BASE_ADDRESS      0x40000

//Reconfig Base
#define SS_RECONFIG_BASE             0x00000000
#define ETH_RECONFIG_BASE            0x00000000
#define XCVR_RECONFIG_BASE           0x00040000
#define RSFEC_RECONFIG_BASE          0x00004000

#define CSR_ACCESS_TIMER 1250000

//Group-3 100G DR wait timer values
#define GRP3_DR_TIMER1 1000000
#define GRP3_DR_TIMER2 10000000 
#define GRP3_DR_TIMER3 30000000 

//SAL functions
unsigned char polling_for_cfg_bit (unsigned long , unsigned long , unsigned short);
unsigned char polling_for_cfg_value_compare (unsigned long , unsigned long , unsigned short);
unsigned char pma_cfg_code(unsigned char , unsigned int, unsigned int);
unsigned char pma_cfg_code_ana_param(unsigned char , unsigned int, unsigned int);
unsigned char get_ch_num (unsigned char); 
unsigned char get_port_num (unsigned char); 
unsigned char enable_serial_loopback (unsigned int);
unsigned char disable_serial_loopback (unsigned int);
void get_mtu (unsigned int);
void set_mtu (unsigned int);
unsigned char set_csr(unsigned long, unsigned char, unsigned char);
unsigned char get_csr(unsigned long, unsigned char, unsigned char);
void read_stats (unsigned int, unsigned int, unsigned int);
void firmware_version ();
unsigned char set_hssi_profile (unsigned int);
unsigned char reset_MAC_stats (unsigned int, unsigned char, unsigned char);
unsigned char xcvr_pma_config ();
void get_link_status (unsigned int);
//DR funcs
unsigned char serdes_disable (unsigned char );
unsigned char serdes_enable (unsigned char );
unsigned char pma_analog_reset (unsigned char );
unsigned char switch_pma_uc_clk_1(unsigned char );
unsigned char switch_pma_uc_clk_0(unsigned char );
unsigned char tx_rx_width_mode (unsigned char , unsigned char );
unsigned char rx_phase_slip (unsigned char );
void port_config_update(unsigned int, unsigned int);

//DR functions
int HSSI_25GPTPFEC_TO_25GPTPNOFEC(int, int);
int HSSI_25GPTPNOFEC_TO_25GPTPFEC(int, int);
int HSSI_25GPTPFEC_TO_10GPTP(int, int);
int HSSI_10GPTP_TO_25GPTPFEC(int, int);
int HSSI_25GPTPNOFEC_TO_10GPTP(int);
int HSSI_10GPTP_TO_25GPTPNOFEC(int);

int HSSI_25GPTPFEC_TO_24GCPRIFEC(int ,int );
int HSSI_24GCPRIFEC_TO_25GPTPFEC(int ,int );
int HSSI_25GPTPFEC_TO_10GCPRI(int ,int );
int HSSI_10GCPRI_TO_25GPTPFEC(int ,int );
int HSSI_25GPTPFEC_TO_9P8CPRI(int );
int HSSI_9P8CPRI_TO_25GPTPFEC(int ,int );
int HSSI_25GPTPFEC_TO_4P9CPRI(int );
int HSSI_4P9CPRI_TO_25GPTPFEC(int ,int );
int HSSI_25GPTPFEC_TO_2P4CPRI(int );
int HSSI_2P4CPRI_TO_25GPTPFEC(int ,int );
int HSSI_24GCPRIFEC_TO_10GCPRI(int ,int );
int HSSI_10GCPRI_TO_9P8CPRI(int );
int HSSI_9P8CPRI_TO_4P9CPRI(int );
int HSSI_4P9CPRI_TO_2P4CPRI(int );
int HSSI_2P4CPRI_TO_24GCPRIFEC(int ,int );
int HSSI_12GCPRI_TO_25GPTPFEC(int ,int );
int HSSI_25GPTPFEC_TO_12GCPRI(int ,int );
int HSSI_24GCPRIFEC_TO_12GCPRI(int ,int );
int HSSI_12GCPRI_TO_10GCPRI(int ,int );

int HSSI_cpri9P8Gabove_TO_cpri9P8Gabove(int  ,int , int  ,int );
int HSSI_cpri9P8Gabove_TO_cpri9P8G(int  ,int , int );
int HSSI_cpri9P8Gabove_TO_cpri9P8Gbelow(int  ,int , int  );
int HSSI_cpri9P8G_TO_cpri9P8Gabove(int  ,int , int  ,int );
int HSSI_cpri9P8G_TO_cpri9P8Gbelow(int  ,int , int  );
int HSSI_cpri9P8Gbelow_TO_cpri9P8Gabove(int ,int ,int , int );
int HSSI_cpri9P8Gbelow_TO_cpri9P8G(int  ,int , int  );
int HSSI_cpri9P8Gbelow_TO_cpri9P8Gbelow(int  ,int , int  );

unsigned int HSSI_TO_100G_FEC(unsigned int);
unsigned int HSSI_TO_100G_NOFEC(unsigned int);
unsigned int HSSI_TO_4x25g_fec(unsigned int);
unsigned int HSSI_TO_4x25g_nofec(unsigned int);
unsigned int HSSI_TO_PAM4(unsigned int);
unsigned int HSSI_TO_100G_KPFEC(unsigned int);

#endif /* HSSI_RECONFIG_H_ */
