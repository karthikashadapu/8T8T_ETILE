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

/**
 * @file pcap_parser.c
 * @author BigCat
 * @brief Application main file
 * */


#include "fun_pcap_parser.h"
#include "pcap_parser.h"
int init_pcap(const char* file) {
    pcap = pcap_open_offline(file, errbuff);
    if(pcap == NULL)
    {
        printf("Could not open pcap file. %s\n%s\n", errbuff,file);
        return -1;
    }
    return 0;
}

//void readPcap(int64_t* time, unsigned char* out_dat, int* length)
int readPcap(unsigned char* out_dat,int* length)
{
    const u_char* data;

    int returnValue = pcap_next_ex(pcap, &header, &data);
    if(returnValue<0)
        return returnValue;

    *((uint32_t*)length)=header->len;
    //printf("Packet size: %d bytes\n", header->len);
    // Show a warning if the length captured is different
    if (header->len != header->caplen)
        printf("Warning! Capture size different than packet size: %ld bytes\n", header->len);

    memcpy(out_dat, data, header->caplen);

    return returnValue;
}

int pcap_extraction(char* pcap_file, double *n_axc, double *c_type,double *fs_off,double *eaxc_id, double *out)
{
    num_axc=n_axc[0];
	compression_type=c_type[0];
	sprintf(p_file,pcap_file);
	fs_offset=fs_off[0];
	eaxc_id_sel=eaxc_id[0];
	 
	
	int dl_cplane_no=0, dl_uplane_no=0, ul_cplane_no=0, ul_uplane_no=0;
    unsigned char p_data[10000];
    int ru_port_id ,msg_type, data_dir, length ,prach_dir;
    int32_t eaxc_port_id;
    int i, j;
    int32_t pcap_16b[80000];
    int out_c;
	int a;
 //   char file_name[1000];
 // /* eaxc_port_id =p_data[22]|p_data[23];*/
 //FILE* fptr_dl[num_axc];
 //FILE* fptr_ul[num_axc];
 //int check_dl = mkdir("Dl_Vectors",0777);
 //int check_ul = mkdir("Ul_Vectors",0777);
 //
 //for (i = 0;i < num_axc;i++)
 //{    
 //    //opening data file
 //   sprintf(file_name, "Dl_Vectors/dl_iq_uplane_%d.txt", i);
 //   fptr_dl[i]=fopen(file_name, "w");
 //   sprintf(file_name, "Ul_Vectors/ul_iq_uplane_%d.txt",i);
 //    fptr_ul[i]=fopen(file_name, "w");
 //}   
 //      
 //
 //FILE* fptr_t_dl[2];
 //FILE* fptr_t_ul[2];
 //int check_t=mkdir("temp",0777);
 //for (i = 0;i < 2;i++)
 //{
 //    //opening data file
 //    sprintf(file_name, "temp/dl_iq_uplane_l%d.txt", i+1);
 //    fptr_t_dl[i]=fopen(file_name, "w");
 //    sprintf(file_name, "temp/ul_iq_uplane_l%d.txt", i+1);
 //    fptr_t_ul[i]=fopen(file_name, "w");
 //} 

    int ret_init = init_pcap(p_file);
    if(ret_init<0)
        return -1;
    int ret;
    i=0;
    int mat_cnt=0;
    printf("Extracting pcap......\n");
    
    while((ret=readPcap(p_data, &length))>=0)
    {
        msg_type = p_data[19];
        ru_port_id = p_data[23]&0x0f;        
        eaxc_port_id =((p_data[22]&0xff)<<8|(p_data[23]&0xff));      
        data_dir = p_data[26]&0x80;
        prach_dir=p_data[26]&0x01;
		    
        	      

//-------------------------------------downlink-uplane--------------------------------------------------
        if((msg_type == msg_type_up) && (data_dir == data_dir_dl)&&(prach_dir!=1))
        {
            //printf("\n\nDL: Packet_no:%d\tru_port_id:%d\tlength:%d\n",i,ru_port_id,length);
            dl_uplane_no++;
            iq_extraction(p_data, length, pcap_16b, &out_c);
			for(j=0;j < out_c;j++)
			{
				out[mat_cnt]=pcap_16b[j];
				mat_cnt++;
			}
           /* if(eaxc_id_sel==1) {
            switch (eaxc_port_id){
		case 4100:
			a=0;
			break;
		case 4440:
			a=1;
			break;
		case 4708:
			a=2;
			break;
		case 4633:
			a=3;
			break;
		case 9543:
			a=4;
			break;
		case 13433:
			a=5;
			break;
		case 1383:
			a=6;
			break;
		case 9778:
			a=7;
			break;
		}
		}
                  
            for(j=0;j < out_c;j++)
            {   
                if(eaxc_id_sel==1) {
           	fprintf(fptr_dl[a],"%d,%d\n", pcap_16b[j], pcap_16b[j+1]);
                //printf("out: %d,%d\n", pcap_16b[j], pcap_16b[j+1]);
                j=j+1;}
                else
                {fprintf(fptr_dl[ru_port_id],"%d,%d\n", pcap_16b[j], pcap_16b[j+1]);
                //printf("out: %d,%d\n", pcap_16b[j], pcap_16b[j+1]);
                j=j+1;}
            }*/
              
            /*for(j=0;j < out_c;j++)
            {
                if(ru_port_id<8)
                {
                    fprintf(fptr_t_dl[0],"%d,%d,%d,%d,%d,%d,%d,%d\n", pcap_16b[j], pcap_16b[j+1], pcap_16b[j+2], pcap_16b[j+3], pcap_16b[j+4], pcap_16b[j+5], pcap_16b[j+6], pcap_16b[j+7]);
                    j=j+7;
                }
                else
                {
                    fprintf(fptr_t_dl[1],"%d,%d,%d,%d,%d,%d,%d,%d\n", pcap_16b[j], pcap_16b[j+1], pcap_16b[j+2], pcap_16b[j+3], pcap_16b[j+4], pcap_16b[j+5], pcap_16b[j+6], pcap_16b[j+7]);
                    j=j+7;
                }
            }*/
        }
//-------------------------------------uplink-uplane--------------------------------------------------
        else if((msg_type == msg_type_up) && (data_dir == data_dir_ul) && (prach_dir!=1))
        {
           // printf("\n\nUL: Packet_no:%d\tru_port_id:%d\tlength:%d\n",i,ru_port_id,length);
            ul_uplane_no++;
	
            iq_extraction(p_data, length, pcap_16b, &out_c);			
            /*if(eaxc_id_sel==1) {
            switch (eaxc_port_id){
		case 4100:
			a=0;
			break;
		case 4440:
			a=1;
			break;
		case 4708:
			a=2;
			break;
		case 4633:
			a=3;
			break;
		case 9543:
			a=4;
			break;
		case 13433:
			a=5;
			break;
		case 1383:
			a=6;
			break;
		case 9778:
			a=7;
			break;
		}
		}
           
            for(j=0;j < out_c;j++)
            {
                 if(eaxc_id_sel==1) {	
				 fprintf(fptr_ul[a],"%d,%d\n", pcap_16b[j], pcap_16b[j+1]);
                //printf("out: %d,%d\n", pcap_16b[j], pcap_16b[j+1]);
                j=j+1;}
				else{fprintf(fptr_ul[ru_port_id],"%d,%d\n", pcap_16b[j], pcap_16b[j+1]);
                //printf("out: %d,%d\n", pcap_16b[j], pcap_16b[j+1]);
			j=j+1;} 
            }
          
            for(j=0;j < out_c;j++)
            {
                if(ru_port_id<8)
                {
                    fprintf(fptr_t_ul[1],"%d,%d,%d,%d,%d,%d,%d,%d\n", pcap_16b[j], pcap_16b[j+1], pcap_16b[j+2], pcap_16b[j+3], pcap_16b[j+4], pcap_16b[j+5], pcap_16b[j+6], pcap_16b[j+7]);
                    j=j+7;
                }
                else
                {
                    fprintf(fptr_t_ul[2],"%d,%d,%d,%d,%d,%d,%d,%d\n", pcap_16b[j], pcap_16b[j+1], pcap_16b[j+2], pcap_16b[j+3], pcap_16b[j+4], pcap_16b[j+5], pcap_16b[j+6], pcap_16b[j+7]);
                    j=j+7;
                }
            }*/
        }
//-------------------------------------downlink-cplane--------------------------------------------------
        else if((msg_type == msg_type_cp) && (data_dir == data_dir_dl))
        {
            dl_cplane_no++;
        }
//-------------------------------------uplink-cplane--------------------------------------------------
        else if((msg_type == msg_type_cp) && (data_dir == data_dir_ul))
        {
            ul_cplane_no++;
        }
        i++;
    }
    

  // for (i = 0;i < num_axc;i++)
  // {
  //     fclose(fptr_dl[i]);
  //     fclose(fptr_ul[i]);
  // }
  // for (i = 0;i < 2;i++)
  // {
  //     fclose(fptr_t_dl[i]);
  //     fclose(fptr_t_ul[i]);
  // }

    printf("\nno.of downlink uplane packects : %d\n",dl_uplane_no);
    printf("no.of uplink uplane packects   : %d\n",ul_uplane_no);
    printf("no.of downlink cplane packects : %d\n",dl_cplane_no);
    printf("no.of uplink cplane packects   : %d\n\n",ul_cplane_no);
    printf("Total no.of packects           : %d\n\n",dl_uplane_no+ul_uplane_no+dl_cplane_no+ul_cplane_no);
    return 0;
}

int iq_extraction(unsigned char* pcap_out, int length, int32_t* pcap_16b, int* out_c)
{

    unsigned char pcap_iq[10000];
    unsigned char pcap_data[28];
    int32_t pcap_9b[80000];
    int32_t FS_24b[800000];  
    int32_t pcap_32b[800000];
    int num_prb, counter, exp, section_no;
     
    
    int i,j,k,l,m;

    section_no=0;
    *out_c=0;
    counter=29;
    			int pow_value=pow(2,fs_offset);				
                    float sq_value_r=sqrt(pow_value);	
										
                    int sq_value=sq_value_r*pow(2,7);

   while(counter<length-1)
    {  
        counter=counter+4;
        num_prb=pcap_out[counter];
        if(num_prb==0)
            num_prb=273;

        //printf("num_prb:%d\t",num_prb);
    
        if(compression_type == 9)
        {
            for(j=0;j<(num_prb*28);j++)
			
            {
                pcap_iq[j]=pcap_out[j+counter+1];
            }
            counter=counter+(num_prb*28);
			
            k=0;

            for (j = 0;j < num_prb;j++)
			
			{
                for (l = 0;l < 28;l++)
				
                {
                    pcap_data[l] = pcap_iq[k];
                    k++;
                    //printf("section_no:%d\t num_prb:%d\t%d: %x\n",section_no,j,l, data[l]);
                }
                exp=pow(2,pcap_data[0]);
                //printf("exp:%d\n",exp);
                for(l=0;l<3;l++)
                {
                    pcap_9b[8*l+0]=((pcap_data[9*l+1]&0xff)<<1)|((pcap_data[9*l+2]&0x80)>>7);
                    pcap_9b[8*l+1]=((pcap_data[9*l+2]&0x7f)<<2)|((pcap_data[9*l+3]&0xc0)>>6);
                    pcap_9b[8*l+2]=((pcap_data[9*l+3]&0x3f)<<3)|((pcap_data[9*l+4]&0xe0)>>5);
                    pcap_9b[8*l+3]=((pcap_data[9*l+4]&0x1f)<<4)|((pcap_data[9*l+5]&0xf0)>>4);
                    pcap_9b[8*l+4]=((pcap_data[9*l+5]&0x0f)<<5)|((pcap_data[9*l+6]&0xf8)>>3);
                    pcap_9b[8*l+5]=((pcap_data[9*l+6]&0x07)<<6)|((pcap_data[9*l+7]&0xfc)>>2);
                    pcap_9b[8*l+6]=((pcap_data[9*l+7]&0x03)<<7)|((pcap_data[9*l+8]&0xfe)>>1);
                    pcap_9b[8*l+7]=((pcap_data[9*l+8]&0x01)<<8)|(pcap_data[9*l+9]&0xff);
                }
               for(l=0;l<24;l++)				 
				
                {
                    if(pcap_9b[l]&0x0100)
                    {
                        pcap_9b[l]=pcap_9b[l]|0xfffffe00; 
							
                    }
                    pcap_16b[*out_c]=exp*pcap_9b[l];       
										
                    //printf("out_c:%d  pcap_16b:%d\n",*out_c,pcap_16b[*out_c]);              
                    FS_24b[*out_c]= pcap_16b[*out_c]*sq_value;          
                                      
                    pcap_16b[*out_c]= (FS_24b[*out_c])>>15;
                    //printf("out_c:%d  pcap_16b:%d\n",*out_c,pcap_16b[*out_c]);                    
                    //printf("out_c:%d   pcap_9b:%d\n",*out_c,pcap_9b[l]);
                    // printf("out_c:%d   pcap_9b:%d  \n",*out_c,pcap_9b[l]);
                   	
                   	*out_c=*out_c+1;	
                   				
                }
						
            }
             
				
        }
        else
        {
            for(j=0;j<(num_prb*48);j++)
				
            {
                pcap_iq[j]=pcap_out[j+counter+1];
            }
            counter=counter+(num_prb*48);
            k=0;

            for (j = 0;j < num_prb;j++)
            {
                for (l = 0;l < 48;l++)
                {
                    pcap_data[l] = pcap_iq[k];
                    k++;
                    //printf("section_no:%d\t num_prb:%d\t%d: %x\n",section_no,j,l, pcap_data[l]);
                }
				
                for(l=0;l<12;l++)
                {
					
                    pcap_16b[*out_c]=((pcap_data[4*l+0]&0xff)<<8)|(pcap_data[4*l+1]&0xff);
					if(pcap_16b[*out_c]&0x00008000)
					{
					pcap_16b[*out_c]=pcap_16b[*out_c]|0xffff0000;
					}

                    pcap_16b[*out_c+1]=((pcap_data[4*l+2]&0xff)<<8)|(pcap_data[4*l+3]&0xff);
					if(pcap_16b[*out_c+1]&0x00008000)
					{
					pcap_16b[*out_c+1]=pcap_16b[*out_c+1]|0xffff0000;
					}
					
					
                    //printf("out_c:%d  pcap_16b:%d\nout_c:%d  pcap_16b:%d\n",*out_c, pcap_16b[*out_c],*out_c+1, pcap_16b[*out_c+1]);
                    *out_c = *out_c+2;					
                }
            }
        }
        section_no++;
        //printf("counter:%d\tout_c:%d\n\n",counter,*out_c);
    }
 
				
    return 0;
}

/*int main(int argc,char **argv)
{
  
    int arg_index=1;
    num_axc=16;
    compression_type=9;    
    sprintf(p_file, "TestSetup.pcap");

    while(arg_index < argc)
    {
        if(strcmp("--help",argv[arg_index])==0)
        {
            printf("\nUsage:\n\nOptions:\n"
                   "\t--num_axc         Number of Axcs(8 or 16)\n"
                   "\t--compression     Copression type(9 or 16)\n"
                   "\t--fs_offset       frequency offset\n"
                   "\t--eaxc_id_sel     eaxc_id_pcap(1 or 0)\n"
                   "\t--p_file          path with pcap file name\n"                   
                   "\nEg: ./out --num_axc 16 --compression 9 --fs_offset 10 --eaxc_id_sel 0 --p_file pcap/TestSetup.pcap\n\n");
            return 0;
        }
        else if(strcmp("--num_axc",argv[arg_index])==0)
        {
            arg_index++;
            sscanf(argv[arg_index],"%d",&num_axc);
            if(!(num_axc==8|num_axc==16))
            {
                printf("No of Axc should be either 8 or 16\n");
                return -1;
            }
        }
        if(strcmp("--compression",argv[arg_index])==0)
        {
            arg_index++;
            sscanf(argv[arg_index],"%d",&compression_type);
            if(!(compression_type==9|compression_type==16))
            {
                printf("Compression type %d is not supported\n", compression_type);
                return -1;
            }
        }
        if(strcmp("--fs_offset",argv[arg_index])==0)
        {
            arg_index++;
            sscanf(argv[arg_index],"%d",&fs_offset);
            
        }
        if(strcmp("--eaxc_id_sel",argv[arg_index])==0)
        {
            arg_index++;
            sscanf(argv[arg_index],"%d",&eaxc_id_sel);
            
        }
        if(strcmp("--p_file",argv[arg_index])==0)
        {
            arg_index++;
            sscanf(argv[arg_index],"%s",&p_file);
        }
        arg_index++;
    }

    printf("\nnumber of Axc    : %d\n",num_axc);
    printf("compression type   : %d\n",compression_type);
    printf("fs_offset  	       : %d\n",fs_offset);
    printf("Pcap file          : %s\n\n",p_file);
    printf("Eaxc_id pcap select:%d\n",eaxc_id_sel);

    pcap_extraction();

    return 0;
}

*/