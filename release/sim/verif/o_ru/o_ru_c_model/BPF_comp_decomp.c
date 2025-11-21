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

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#include <pcap.h>

typedef	unsigned int	u_int;
typedef	unsigned char	u_char;

//errno_t error_code;
int error_code;

struct data_struct {
    int No_of_PRBS;
    int compBitWidth;
    int fs_offset;
};

/*
 * Decompression model for c-plane
 * @param: pointer of the data struct
 * Data struct contains number of PRBss, and pointers for input and output arrays
 */
void cplane_decompression(struct data_struct* decomp_data, int16_t* fPRB, unsigned char* cPRB_bytes)
{
    int i, j;
    int k = 0;
    if (decomp_data->No_of_PRBS == 0)
    {
        decomp_data->No_of_PRBS = 273;
    }
    uint8_t data[200];
    
    int16_t cPRB[80000];

    if (decomp_data->compBitWidth == 9)
    {
        //converting 144 bytes array (1 PRB) into 1+128 iqs: (1)8 bit exponent and (128)9 bit cPRBs(9bit I_values and 9bit Q_values).
        for (j = 0;j < decomp_data->No_of_PRBS;j++)
        {
            for (i = 0;i < 145;i++)
            {
                data[i] = *(cPRB_bytes + k);
                k++;
                //printf("%d:\t%x\n",i, data[i]);
            }
           cPRB[129*j+0]=data[0];
           for(i=0;i<16;i++)
           {
              cPRB[129*j+8*i+1]=((data[9*i+1]&0xff)<<1)|((data[9*i+2]&0x80)>>7);
              cPRB[129*j+8*i+2]=((data[9*i+2]&0x7f)<<2)|((data[9*i+3]&0xc0)>>6);
              cPRB[129*j+8*i+3]=((data[9*i+3]&0x3f)<<3)|((data[9*i+4]&0xe0)>>5);
              cPRB[129*j+8*i+4]=((data[9*i+4]&0x1f)<<4)|((data[9*i+5]&0xf0)>>4);
              cPRB[129*j+8*i+5]=((data[9*i+5]&0x0f)<<5)|((data[9*i+6]&0xf8)>>3);
              cPRB[129*j+8*i+6]=((data[9*i+6]&0x07)<<6)|((data[9*i+7]&0xfc)>>2);
              cPRB[129*j+8*i+7]=((data[9*i+7]&0x03)<<7)|((data[9*i+8]&0xfe)>>1);
              cPRB[129*j+8*i+8]=((data[9*i+8]&0x01)<<8)|(data[9*i+9]&0xff);
           }

        }

        for (i = 0;i < decomp_data->No_of_PRBS*129;i++)
        {
            if(cPRB[i]&0x0100)
            {
                cPRB[i]=cPRB[i]|0xfe00;
            }
            //printf("%d:\t%x\n",i, cPRB[i]);
        }

    }

    else if (decomp_data->compBitWidth == 12)
    {
        //converting 192 bytes array (1 PRB) into 1+128 iqs: (1)8 bit exponent and (128)12 bit cPRBs(12 I_values and 12 Q_values).
        for (j = 0;j < decomp_data->No_of_PRBS;j++)
        {
            for (i = 0;i < 193;i++)
            {
                data[i] = *(cPRB_bytes + k);
                k++;
            }
            cPRB[129*j+0]=data[0];
            for(i=0;i<64;i++)
            {
               cPRB[129*j+2*i+1]=((data[3*i+1]&0xff)<<4)|((data[3*i+2]&0xf0)>>4);
               cPRB[129*j+2*i+2]=((data[3*i+2]&0x0f)<<8)|(data[3*i+3]&0xff);
            }   
        }

        for (i = 0;i < (decomp_data->No_of_PRBS * 129);i++)
        {
            if(cPRB[i]&0x0800)
            {
                cPRB[i]=cPRB[i]|0xf000;
            }
            //printf("%d:\t%d\n", i, cPRB[i]);
        }
    }

    int scaler_decomp[273], fPRB_out[50000];

    //Decompression Operation 
    for (i = 0;i < decomp_data->No_of_PRBS;i++)
    {
        scaler_decomp[i] = pow(2, cPRB [i * 128 + i]);
        for (j = 0;j < 128;j++)
        {
            fPRB_out[i * 128 + j] = scaler_decomp[i] * (cPRB [i * 128 + i + 1 + j]);
            //printf("%d:%d\t%d\n", i * 24 + j,scaler_decomp[i],fPRB_out[i*24+j]);
        }
    }

    for (i = 0;i < decomp_data->No_of_PRBS * 128;i++)
    {
        *(fPRB+i)=fPRB_out[i];
    }


    //for (i = 0;i < decomp_data->No_of_PRBS * 24;i++)
    //{
    //    printf("%d\n", *(fPRB + i));
    //}
}

/*
 * Decompression model
 * @param: pointer of the data struct
 * Data struct contains number of PRBss, and pointers for input and output arrays
 */
void decompression(struct data_struct* decomp_data, int16_t* fPRB, unsigned char* cPRB_bytes)
{
    if (decomp_data->No_of_PRBS == 0)
    {
        decomp_data->No_of_PRBS = 273;
    }
    
    int i, j;
    //for (i = 0;i < decomp_data->No_of_PRBS*28;i++)
    //{
     //   printf("Input %d:\t%x\n",i, *(cPRB_bytes + i));
    //}
    int k = 0;
    uint8_t data[37];
    
    int16_t cPRB[8000];

    if (decomp_data->compBitWidth == 9)
    {
        //converting 28 bytes array (1 PRB) into 1+24 iqs: (1)8 bit exponent and (24)9 bit cPRBs(9bit I_values and 9bit Q_values).
        for (j = 0;j < decomp_data->No_of_PRBS;j++)
        {
            for (i = 0;i < 28;i++)
            {
                data[i] = *(cPRB_bytes + k);
                k++;
                //printf("%d:\t%x\n",i, data[i]);
            }
           cPRB[25*j+0]=data[0];
           for(i=0;i<3;i++)
           {
              cPRB[25*j+8*i+1]=((data[9*i+1]&0xff)<<1)|((data[9*i+2]&0x80)>>7);
              cPRB[25*j+8*i+2]=((data[9*i+2]&0x7f)<<2)|((data[9*i+3]&0xc0)>>6);
              cPRB[25*j+8*i+3]=((data[9*i+3]&0x3f)<<3)|((data[9*i+4]&0xe0)>>5);
              cPRB[25*j+8*i+4]=((data[9*i+4]&0x1f)<<4)|((data[9*i+5]&0xf0)>>4);
              cPRB[25*j+8*i+5]=((data[9*i+5]&0x0f)<<5)|((data[9*i+6]&0xf8)>>3);
              cPRB[25*j+8*i+6]=((data[9*i+6]&0x07)<<6)|((data[9*i+7]&0xfc)>>2);
              cPRB[25*j+8*i+7]=((data[9*i+7]&0x03)<<7)|((data[9*i+8]&0xfe)>>1);
              cPRB[25*j+8*i+8]=((data[9*i+8]&0x01)<<8)|(data[9*i+9]&0xff);
           }

        }

        for (i = 0;i < decomp_data->No_of_PRBS*25;i++)
        {
            if(cPRB[i]&0x0100)
            {
                cPRB[i]=cPRB[i]|0xfe00;
            }
            //printf("%d:\t%x\n",i, cPRB[i]);
        }

    }

    else if (decomp_data->compBitWidth == 12)
    {
        //converting 37 bytes array (1 PRB) into 1+24 iqs: (1)8 bit exponent and (24)12 bit cPRBs(12 I_values and 12 Q_values).
        for (j = 0;j < decomp_data->No_of_PRBS;j++)
        {
            for (i = 0;i < 37;i++)
            {
                data[i] = *(cPRB_bytes + k);
                k++;
            }
            cPRB[25*j+0]=data[0];
            for(i=0;i<12;i++)
            {
               cPRB[25*j+2*i+1]=((data[3*i+1]&0xff)<<4)|((data[3*i+2]&0xf0)>>4);
               cPRB[25*j+2*i+2]=((data[3*i+2]&0x0f)<<8)|(data[3*i+3]&0xff);
            }   
        }

        for (i = 0;i < (decomp_data->No_of_PRBS * 25);i++)
        {
            if(cPRB[i]&0x0800)
            {
                cPRB[i]=cPRB[i]|0xf000;
            }
            //printf("%d:\t%d\n", i, cPRB[i]);
        }
    }

    int scaler_decomp[273], fPRB_out[6552];
    int pow_val , sqr_val , FS_24bit_data;
    double sqr_val_r ;
   
    pow_val   = pow(2,decomp_data->fs_offset);
    sqr_val_r = sqrt(pow_val);
    sqr_val   = round(sqr_val_r * pow(2,7));
    //Decompression Operation 
    for (i = 0;i < decomp_data->No_of_PRBS;i++)
    {
        scaler_decomp[i] = pow(2, cPRB [i * 24 + i]);
        for (j = 0;j < 24;j++)
        {
            FS_24bit_data        = scaler_decomp[i] * (cPRB [i * 24 + i + 1 + j]);
            FS_24bit_data        = FS_24bit_data * sqr_val ;
            fPRB_out[i * 24 + j] = FS_24bit_data >> 15 ;
           
            //fPRB_out[i * 24 + j] = scaler_decomp[i] * (cPRB [i * 24 + i + 1 + j]);
            //printf("%d:%d\t%d\n", i * 24 + j,scaler_decomp[i],fPRB_out[i*24+j]);
        }
    }

    for (i = 0;i < decomp_data->No_of_PRBS * 24;i++)
    {
        *(fPRB+i)=fPRB_out[i];
    }


    //for (i = 0;i < decomp_data->No_of_PRBS * 24;i++)
    //{
    //    printf("%d\n", *(fPRB + i));
    //}
}

void compression(struct data_struct* comp_data, int16_t* fPRB, unsigned char* cPRB)
{
    if (comp_data->No_of_PRBS == 0)
    {
        comp_data->No_of_PRBS = 273;
    }

    double fPRB_real[1000][12], fPRB_imag[1000][12];
    int cPRB1_I[1000][12], cPRB2_Q[1000][12];
    int exponent[1000];
    double max_fPRB_real[1000], max_fPRB_imag[1000], min_fPRB_real[1000], min_fPRB_imag[1000], max_fPRB[1000], min_fPRB[1000], min_abs_fPRB[1000], max_value[1000], exp[1000], scaler_comp[1000];
    int i = 0, j = 0, k = 0;
    int16_t cPRB_16[6825];
    int16_t data_16[25];
    double FS_24bit_data_r[1000][12], FS_24bit_data_i[1000][12], sqr_val, pow_val;

    pow_val = pow(2,-(comp_data->fs_offset));
        //printf("power_value:%lf \n",pow_val);
    sqr_val = sqrt(pow_val);
        //printf("square_value:%lf \n",sqr_val);

    for (j = 0;j < comp_data->No_of_PRBS;j++)
    {
        for (i = 0;i < 12;i++)
        {
            fPRB_real[j][i] = *(fPRB + k);
            k++;
            fPRB_imag[j][i] = *(fPRB + k);
            k++;
        }
       
        for (i = 0;i < 12;i++)
        {
            FS_24bit_data_r[j][i] = fPRB_real[j][i] * (pow(2,8)) ;
            FS_24bit_data_i[j][i] = fPRB_imag[j][i] * (pow(2,8)) ;
            
            FS_24bit_data_r[j][i] = FS_24bit_data_r[j][i] * sqr_val ;
            FS_24bit_data_i[j][i] = FS_24bit_data_i[j][i] * sqr_val ;
        }

        max_fPRB_real[j] = FS_24bit_data_r[j][0];
        max_fPRB_imag[j] = FS_24bit_data_i[j][0];
        min_fPRB_real[j] = FS_24bit_data_r[j][0];
        min_fPRB_imag[j] = FS_24bit_data_i[j][0];

        for (i = 0;i < 12;i++)
        {

            if (FS_24bit_data_r[j][i] > max_fPRB_real[j])
                max_fPRB_real[j] = FS_24bit_data_r[j][i];
            if (FS_24bit_data_i[j][i] > max_fPRB_imag[j])
                max_fPRB_imag[j] = FS_24bit_data_i[j][i];

            if (FS_24bit_data_r[j][i] < min_fPRB_real[j])
                min_fPRB_real[j] = FS_24bit_data_r[j][i];

            if (FS_24bit_data_i[j][i] < min_fPRB_imag[j])
                min_fPRB_imag[j] = FS_24bit_data_i[j][i];
        }

        //printf("max_r:%lf max_i:%lf\n",max_fPRB_real[j],max_fPRB_imag[j]);
        //printf("min_r:%lf min_i:%lf\n",min_fPRB_real[j],min_fPRB_imag[j]);

        if (max_fPRB_real[j] > max_fPRB_imag[j])
            max_fPRB[j] = max_fPRB_real[j];
        else
            max_fPRB[j] = max_fPRB_imag[j];

        if (min_fPRB_real[j] < min_fPRB_imag[j])
            min_fPRB[j] = min_fPRB_real[j];
        else
            min_fPRB[j] = min_fPRB_imag[j];

        //printf("max:%lf min:%lf\n",max_fPRB[j],min_fPRB[j]);

        min_abs_fPRB[j] = abs(min_fPRB[j]) - 1;

        if (max_fPRB[j] > min_abs_fPRB[j])
            max_value[j] = max_fPRB[j];
        else
            max_value[j] = min_abs_fPRB[j];

        exp[j] = floor(log2(max_value[j]) + 1);
        exponent[j] = exp[j] - comp_data->compBitWidth + 1;

        if (exponent[j] < 0)
            exponent[j] = 0;

        scaler_comp[j] = pow(2, (-exponent[j]));
        //printf("scalar_comp : %f \n",scaler_comp[j]);
        double cPRB1_I_tem[12], cPRB2_Q_tem[12];
        //double pow_val , sqr_val_r , FS_24bit_data_r[1000][12] , FS_24bit_data_i[1000][12], sqr_val;

        //pow_val = pow(2,-(comp_data->fs_offset));
        //sqr_val = sqrt(pow_val);
        //sqr_val   = (sqr_val_r / pow(2,7));
        //printf("Pow Val : %f Square Val : %f \n",pow_val,sqr_val);
        for (i = 0;i < 12;i++)
        {
            FS_24bit_data_r[j][i] = fPRB_real[j][i] * (pow(2,8)) ;
            //printf("fs_24_real : %f \n",FS_24bit_data_r[j][i]);
            FS_24bit_data_i[j][i] = fPRB_imag[j][i] * (pow(2,8)) ;
            //printf("fs_24_imag : %f \n",FS_24bit_data_i[j][i]);
            
            //printf("square_value:%lf \n",sqr_val);
            FS_24bit_data_r[j][i] = FS_24bit_data_r[j][i] * sqr_val ;
            FS_24bit_data_i[j][i] = FS_24bit_data_i[j][i] * sqr_val ;
            //printf("After Multi Real : %f Imag : %f \n",FS_24bit_data_r[j][i],FS_24bit_data_i[j][i]);

            if (scaler_comp[j] * FS_24bit_data_r[j][i] < 0)
            {
                cPRB1_I_tem[i] = (scaler_comp[j] * FS_24bit_data_r[j][i]) + 0.002;
                //printf("cprb_i_neg : %lf \n",cPRB1_I_tem[i]);
            }
            else
            {
                cPRB1_I_tem[i] = (scaler_comp[j] * FS_24bit_data_r[j][i]);
                //printf("cprb_i_pos : %lf \n",cPRB1_I_tem[i]);
            }

            if (scaler_comp[j] * FS_24bit_data_i[j][i] < 0)
            {
                cPRB2_Q_tem[i] = (scaler_comp[j] * FS_24bit_data_i[j][i]) + 0.002;
                //printf("cprb_q_neg : %lf \n",cPRB2_Q_tem[i]);
            }
            else
            {
                cPRB2_Q_tem[i] = (scaler_comp[j] * FS_24bit_data_i[j][i]);
                //printf("cprb_q_pos : %lf \n",cPRB2_Q_tem[i]);
            }
            
            //printf(" Real %d:\t%lf\t%lf\n",(12*j+i+1),scaler_comp[j]*FS_24bit_data_r,cPRB1_I_tem[i]);
            //if (scaler_comp[j] * fPRB_real[j][i] < 0)
            //    cPRB1_I_tem[i] = (scaler_comp[j] * fPRB_real[j][i]) + 0.002;
            //else
            //    cPRB1_I_tem[i] = (scaler_comp[j] * fPRB_real[j][i]);

            //if (scaler_comp[j] * fPRB_imag[j][i] < 0)
            //    cPRB2_Q_tem[i] = (scaler_comp[j] * fPRB_imag[j][i]) + 0.002;
            //else
            //    cPRB2_Q_tem[i] = (scaler_comp[j] * fPRB_imag[j][i]);

            cPRB1_I[j][i] = round(cPRB1_I_tem[i]);
            cPRB2_Q[j][i] = round(cPRB2_Q_tem[i]);

            if (cPRB1_I[j][i] ==256)cPRB1_I[j][i] = 255;
	    if (cPRB2_Q[j][i] ==256)cPRB2_Q[j][i] = 255;
            //cPRB1_I[j][i] = cPRB1_I[j][i] / pow(2,7);
            //cPRB2_Q[j][i] = cPRB2_Q[j][i] / pow(2,7);
            //printf(" Compressed Data %d\t%d\t%d %0d %0d\n", cPRB1_I[j][i], cPRB2_Q[j][i], exponent[j],FS_24bit_data_r,FS_24bit_data_i);
        }
    }

    k = 0;
    for (j = 0;j < comp_data->No_of_PRBS;j++)
    {
        cPRB_16[k] = exponent[j];
        k++;
        for (i = 0;i < 12;i++)
        {
            cPRB_16[k] = cPRB1_I[j][i];
            k++;
            cPRB_16[k] = cPRB2_Q[j][i];
            k++;
        }
    }

    for (i = 0;i < (comp_data->No_of_PRBS * 25);i++)
    {
        //printf(" Compressed data %d:%d\n",i,cPRB_16[i]);
    }

    k=0;
    //printf("Comp Width %d",comp_data->compBitWidth);
    if (comp_data->compBitWidth == 9)
    {
        //converting 1+24 iqs: (1)8 bit exponent and (24)9 bit cPRBs(9bit I_values and 9bit Q_values) into 28 bytes array (1 PRB).
        for (j = 0;j < 273;j++)
        {
            for (i = 0;i < 25;i++)
            {
                data_16[i] = cPRB_16[k];
                k++;
            }
            *(cPRB+(28*j+0))=data_16[0]&0x00ff;
            for(i=0;i<3;i++)
            {
                *(cPRB+(28*j+9*i+1))=((data_16[8*i+1]&0x01fe)>>1);
                *(cPRB+(28*j+9*i+2))=((data_16[8*i+1]&0x0001)<<7)|((data_16[8*i+2]&0x01fc)>>2);
                *(cPRB+(28*j+9*i+3))=((data_16[8*i+2]&0x0003)<<6)|((data_16[8*i+3]&0x01f8)>>3);
                *(cPRB+(28*j+9*i+4))=((data_16[8*i+3]&0x0007)<<5)|((data_16[8*i+4]&0x01f0)>>4);
                *(cPRB+(28*j+9*i+5))=((data_16[8*i+4]&0x000f)<<4)|((data_16[8*i+5]&0x01e0)>>5);
                *(cPRB+(28*j+9*i+6))=((data_16[8*i+5]&0x001f)<<3)|((data_16[8*i+6]&0x01c0)>>6);
                *(cPRB+(28*j+9*i+7))=((data_16[8*i+6]&0x003f)<<2)|((data_16[8*i+7]&0x0180)>>7);
                *(cPRB+(28*j+9*i+8))=((data_16[8*i+7]&0x007f)<<1)|((data_16[8*i+8]&0x0100)>>8);
                *(cPRB+(28*j+9*i+9))=(data_16[8*i+8]&0x0ff);
            }
        }
    }
    else if (comp_data->compBitWidth == 12)
    {
        //converting 28 bytes array (1 PRB) into 8 bit exponent and 9 bit cPRBs(9 I_values and 9 Q_values).
        for (j = 0;j < comp_data->No_of_PRBS;j++)
        {
            for (i = 0;i < 25;i++)
            {
                data_16[i] = cPRB_16[k];
                k++;
            }
            *(cPRB+(37*j+0))=data_16[0];
            for(i=0;i<12;i++)
            {
               *(cPRB+(37*j+3*i+1))=((data_16[2*i+1]&0x0ff0)>>4);
               *(cPRB+(37*j+3*i+2))=((data_16[2*i+1]&0x000f)<<4)|((data_16[2*i+2]&0x0f00)>>12);
               *(cPRB+(37*j+3*i+3))=(data_16[2*i+2]&0x00ff);
            }   
        }
    }
    for (i = 0;i < (comp_data->No_of_PRBS);i++)
    {
      //printf("o%d:%d\n",i,*(cPRB+i));
    }
}

