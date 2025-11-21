/* ******************************************************************************************************************
 INTEL CONFIDENTIAL
 Copyright 2023 Intel Corporation All Rights Reserved.

 The source code contained or described herein and all documents related to the
 source code ("Material") are owned by Intel Corporation or its suppliers or
 licensors. Title to the Material remains with Intel Corporation or its
 suppliers and licensors. The Material may contain trade secrets and proprietary
 and confidential information of Intel Corporation and its suppliers and
 licensors, and is protected by worldwide copyright and trade secret laws and
 treaty provisions. No part of the Material may be used, copied, reproduced,
 modified, published, uploaded, posted, transmitted, distributed, or disclosed
 in any way without Intel's prior express written permission.
 No license under any patent, copyright, trade secret or other intellectual
 property right is granted to or conferred upon you by disclosure or delivery
 of the Materials, either expressly, by implication, inducement, estoppel or
 otherwise. Any license under such intellectual property rights must be
 express and approved by Intel in writing.

 Unless otherwise agreed by Intel in writing, you may not remove or alter this
 notice or any other notice embedded in Materials by Intel or Intel's suppliers
 or licensors in any way.
****************************************************************************************************************** */
/*
* How to read a packet capture file.
*/
 
/*
* Step 1 - Add includes
*/
#include <string.h>
#include <stdlib.h>
#include <pcap.h>
#include "/home/sibgath/intelFPGA_pro/questasim/include/svdpi.h"
//#include "parse.h"
 
u_int packetCount = 0;
char errbuff[PCAP_ERRBUF_SIZE];
char errbuff_2[PCAP_ERRBUF_SIZE];
pcap_t * pcap ; 
struct pcap_pkthdr *header;
const u_char *data;
//for link2
pcap_t * pcap_2 ; 
struct pcap_pkthdr *header_2;
const u_char *data_2;

void pcap_init_file(const char* file) {
    pcap  = pcap_open_offline(file, errbuff);
}
void readPcap(int64_t* time,unsigned char* out_dat,int* length)
{

    int returnValue = pcap_next_ex(pcap, &header, &data) ;
    // Show the packet number
    printf("Packet # %i\n", ++packetCount);
    // Show the size in bytes of the packet
    printf("Packet size: %d bytes\n", header->len);
 
    // Show a warning if the length captured is different
    if (header->len != header->caplen)
        printf("Warning! Capture size different than packet size: %ld bytes\n", header->len);
 
    // Show Epoch Time
    printf("Epoch Time: %d:%d seconds\n", header->ts.tv_sec, header->ts.tv_usec);
    *((uint64_t *)time) = header->ts.tv_usec ;
    *((uint32_t *)length) = header->caplen ; 
    //printf("Packet size after capture : %d bytes  length : %d time : %d \n", header->caplen,*((uint32_t *)length),*((uint32_t *)time));
    memcpy(out_dat,data,header->caplen); 
    //    // Print each octet as hex (x), make sure there is always two characters (.2).
    //    printf("%.2x ", out_dat[i]);
}

//for link2
void pcap_init_2(const char* file) {
    pcap_2  = pcap_open_offline(file, errbuff_2);
}
void readPcap_2(int64_t* time_2,unsigned char* out_dat_2,int* length_2)
{

    int returnValue = pcap_next_ex(pcap_2, &header_2, &data_2) ;
    // Show the packet number
    printf("Packet # %i\n", ++packetCount);
    // Show the size in bytes of the packet
    printf("Packet size: %d bytes\n", header_2->len);
 
    // Show a warning if the length captured is different
    if (header_2->len != header_2->caplen)
        printf("Warning! Capture size different than packet size: %ld bytes\n", header_2->len);
 
    // Show Epoch Time
    printf("Epoch Time: %d:%d seconds\n", header_2->ts.tv_sec, header_2->ts.tv_usec);
    *((uint64_t *)time_2) = header_2->ts.tv_usec ;
    *((uint32_t *)length_2) = header_2->caplen ; 
    //printf("Packet size after capture : %d bytes  length : %d time : %d \n", header_2->caplen,*((uint32_t *)length),*((uint32_t *)time));
    memcpy(out_dat_2,data_2,header_2->caplen); 
    //    // Print each octet as hex (x), make sure there is always two characters (.2).
    //    printf("%.2x ", out_dat[i]);
}
int main(){
        printf("C Call Started");
}
