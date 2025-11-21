// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 15:28:13
// ------------------------------------------------------------------------- 
#include "demo_fft_FFT_4K_atb.h"
#include <iostream>
#include "demo_fft_FFT_4K_BitReverseCoreC_atb.h"
#include "demo_fft_FFT_4K_FFT_atb.h"
#include "demo_fft_FFT_4K_RXGainComp_atb.h"
#include "demo_fft_FFT_4K_RXScaling_atb.h"

#include "connector.h"

void csl_error(const char* msg)   { std::cout << "Error: " << msg << "\n"; }
void csl_warning(const char* msg) { std::cout << "Warning: " << msg << "\n"; }
void csl_info(const char* msg)    { std::cout << "Info: " << msg << "\n"; }


int fft(unsigned int* data_param_arr, unsigned char* fft_in, unsigned char* fft_out)
{
    int i = 0, k = 0, j = 0, s = 0, m = 0;
    struct data_struct in[4448];
    struct data_struct ibrsc_in[4096];
    struct data_struct icp_out[4096];
    struct data_struct fft_out_temp[4000];

    struct data_struct fft_fun_in[12400];
    struct data_struct fft_fun_out[12400];
    demo_fft_FFT_4KATB deviceAtb;

    struct param_struct* data_param;

    data_param = (struct param_struct*)data_param_arr;

    int x = 0, y = 0;
    int error_code;

    int no_of_sc;
    int zero_pading;
    int first_cp;
    int second_cp;

    no_of_sc = 12 * data_param->No_of_prbs;//no of subcarriers or samples is equal to 12 times no of prbs
    zero_pading = data_param->FFT_size - no_of_sc - 1;


    if (data_param->cp_enable == 1)
    {
        first_cp = ((144 * pow(2, -data_param->Mu)) + 16) * (data_param->FFT_size / (2048 * pow(2, -data_param->Mu)));
        second_cp = (144 * pow(2, -data_param->Mu)) * (data_param->FFT_size / (2048 * pow(2, -data_param->Mu)));
    }
    else
    {
        first_cp = 0;
        second_cp = 0;
    }


    //printf("FFT\nprocessing...");
    //printf("sym_no : %d\nFFT_size : %d\nNo_of_prbs : %d\nMu : %d\ncp_enable : %d\n", data_param->sym_no, data_param->FFT_size, data_param->No_of_prbs, data_param->Mu, data_param->cp_enable);
    //printf("no_of_sc:%d\nzero_pading:%d\nfirst_cp:%d\nsecond_cp:%d\n", no_of_sc, zero_pading, first_cp, second_cp);

    //removing cyclic prefix
    if ((data_param->sym_no == 0) | (data_param->sym_no == 14))
    {
        for (j = 0;j < data_param->FFT_size + first_cp;j++)
        {
            in[j].imag = (fft_in[4 * m] << 8) | (fft_in[(4 * m) + 1] & 0xFF);
            in[j].real = (fft_in[(4 * m) + 2] << 8) | (fft_in[(4 * m) + 3] & 0xFF);
            m = m + 1;
        }
        for (j = 0;j < data_param->FFT_size;j++)
        {
            icp_out[j].real = in[j + first_cp].real;
            icp_out[j].imag = in[j + first_cp].imag;
        }
    }
    else
    {
        for (j = 0;j < data_param->FFT_size + second_cp;j++)
        {
            in[j].imag = (fft_in[4 * m] << 8) | (fft_in[(4 * m) + 1] & 0xFF);
            in[j].real = (fft_in[(4 * m) + 2] << 8) | (fft_in[(4 * m) + 3] & 0xFF);
            m = m + 1;
        }
        for (j = 0;j < data_param->FFT_size;j++)
        {
            icp_out[j].real = in[j + second_cp].real;
            icp_out[j].imag = in[j + second_cp].imag;
        }
    }

    for (j = 0;j < data_param->FFT_size;j++)
    {
        fft_fun_in[j].valid = 1;
        fft_fun_in[j].channel = 0;
        fft_fun_in[j].real = icp_out[j].real;
        fft_fun_in[j].imag = icp_out[j].imag;
    }

    //for (j = 0;j < 4096;j++)
    //{
    //    printf("fft_in_%d: %d :%hu,%hu\n", j, fft_fun_in[j].valid, fft_fun_in[j].real, fft_fun_in[j].imag);
    //}

    deviceAtb.fft_fun(fft_fun_in, fft_fun_out);

    //for (j = 8225;j < 8235 + 4096;j++)
    //{
    //    printf("fft_out_%d: %d :%hu,%hu\n", j, fft_fun_out[j].valid, fft_fun_out[j].real, fft_fun_out[j].imag);
    //}
    s = 0;
    for (j = 8200;j < 12400;j++)
    {
        if (fft_fun_out[j].valid == 1)
        {
            ibrsc_in[s].real = (fft_fun_out[j + 0].real);
            ibrsc_in[s].imag = (fft_fun_out[j + 0].imag);
            //printf("fft_out_%d: %d,%d\n", s, ibrsc_in[s].real, ibrsc_in[s].imag);
            s++;
        }
    }

    //Inverse Bit reversal and subcarrier mapping
    for (j = 0;j < no_of_sc / 2;j++)
    {
        fft_out_temp[x].real = ibrsc_in[j + no_of_sc / 2 + zero_pading + 1].real;
        fft_out_temp[x].imag = ibrsc_in[j + no_of_sc / 2 + zero_pading + 1].imag;
        x++;
    }
    for (j = no_of_sc / 2;j < no_of_sc;j++)
    {
        fft_out_temp[x].real = ibrsc_in[j - (no_of_sc / 2) + 1].real;
        fft_out_temp[x].imag = ibrsc_in[j - (no_of_sc / 2) + 1].imag;
        x++;
    }

    x = 0;
    for (j = 0;j < no_of_sc;j++)
    {
        fft_out[x] = fft_out_temp[j].imag >> 8 & 0xFF;
        fft_out[x + 1] = fft_out_temp[j].imag & 0xFF;
        fft_out[x + 2] = fft_out_temp[j].real >> 8 & 0xFF;
        fft_out[x + 3] = fft_out_temp[j].real & 0xFF;
        x = x + 4;
        //printf("inv_scm_out_%d:%d,%d\n", j, fft_out_temp[j].real, fft_out_temp[j].imag);
    }
    return 0;
}
/*
int main()
{
    unsigned int d_param[5];
    d_param[0] = 0;//sym_no
    d_param[1] = 4096;//FFT_size
    d_param[2] = 273;//No_of_prbs
    d_param[3] = 1;//Mu
    d_param[4] = 0;//cp_enable

    int i;
    FILE* fptr1;
    FILE* fptr2;
    int error_code;

    data_struct* in_data = (data_struct*)malloc(122880 * sizeof(data_struct));
    data_struct* out_data = (data_struct*)malloc(3276 * 28 * sizeof(data_struct));

    //opening Input data file
    if ((error_code = fopen_s(&fptr1, "fft_in.txt", "r")) != 0) {
        exit(1);
    }
    if ((error_code = fopen_s(&fptr2, "output.txt", "w")) != 0) {
        exit(1);
    }

    for (i = 0;i < 4096;i++)
    {
        fscanf_s(fptr1, "%d,%d", &in_data[i].imag, &in_data[i].real);
        //printf("in:%d,%d\n", in_data[i].real, in_data[i].imag);
    }

    fft(d_param, in_data, out_data);

    for (i = 0;i < 273 * 12;i++)
    {
        fprintf_s(fptr2, "%hu,%hu\n", out_data[i].imag, out_data[i].real);
    }

    fclose(fptr1);
    fclose(fptr2);

    return 0;
}
*/
