// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:39:27
// ------------------------------------------------------------------------- 
#include "demo_ifft_IFFT_4K_atb.h"
#include <iostream>
#include "demo_ifft_IFFT_4K_BitReverseCoreC_atb.h"
#include "demo_ifft_IFFT_4K_FFT_atb.h"
#include "connector.h"

void csl_error(const char* msg)   { std::cout << "Error: " << msg << "\n"; }
void csl_warning(const char* msg) { std::cout << "Warning: " << msg << "\n"; }
void csl_info(const char* msg)    { std::cout << "Info: " << msg << "\n"; }

int ifft(unsigned int* data_param_arr, unsigned char* ifft_in, unsigned char* ifft_out)
{
	int i = 0, k = 0, j = 0, s = 0, m = 0;
	struct data_struct in[3276];
	struct data_struct brsc_out[4096];
	struct data_struct cp_in[4096];
	struct data_struct cp_out[4448];
	struct data_struct ifft_fun_in[12400];
	struct data_struct ifft_fun_out[12400];
	demo_ifft_IFFT_4KATB deviceAtb;
	struct param_struct* data_param;

	data_param = (struct param_struct*)data_param_arr;
	int x = 0;
	int error_code;

	int no_of_sc;
	int zero_pading;
	int first_cp;
	int second_cp;

	
	no_of_sc = 12 * data_param->No_of_prbs;//no of subcarriers or samples is equal to 12 times no of prbs
	zero_pading = data_param->FFT_size - no_of_sc;

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

	int dc_sbc_dis = 1;
	//printf("IFFT\nprocessing...\n");
	//printf("sym_no : %d\nFFT_size : %d\nNo_of_prbs : %d\nMu : %d\ncp_enable : %d\n", data_param->sym_no, data_param->FFT_size, data_param->No_of_prbs, data_param->Mu, data_param->cp_enable);
	//printf("no_of_sc:%d\nzero_pading:%d\nfirst_cp:%d\nsecond_cp:%d\n", no_of_sc, zero_pading, first_cp, second_cp);

	for (j = 0;j < no_of_sc;j++)
	{
		in[j].imag = (ifft_in[4 * m] << 8) | (ifft_in[(4 * m) + 1] & 0xFF);
		in[j].real = (ifft_in[(4 * m) + 2] << 8) | (ifft_in[(4 * m) + 3] & 0xFF);
		m = m + 1;
	}
//	for (j = 0;j < 100;j++)
//	{
//	      printf("before bitreversel ifft_in_%d:%d,%d\n", j, in[j].real, in[j].imag);
//	}
	//Bit reversal and subcarrier mapping
	if (dc_sbc_dis == 1)
	{
		brsc_out[0].real = 0;
		brsc_out[0].imag = 0;
		s = 1;
		zero_pading = zero_pading - 1;
	}

	for (j = no_of_sc / 2;j < no_of_sc;j++)
	{
		brsc_out[s].real = in[j].real;
		brsc_out[s].imag = in[j].imag;
		s++;
	}
	for (j = 0;j < zero_pading;j++)
	{
		brsc_out[s].real = 0;
		brsc_out[s].imag = 0;
		s++;
	}
	for (j = 0;j < no_of_sc / 2;j++)
	{
		brsc_out[s].real = in[j].real;
		brsc_out[s].imag = in[j].imag;
		s++;
	}

	for (j = 0;j < data_param->FFT_size;j++)
	{
		ifft_fun_in[j].valid = 1;
		ifft_fun_in[j].channel = 0;
		ifft_fun_in[j].real = brsc_out[j].real;
		ifft_fun_in[j].imag = brsc_out[j].imag;
	}

//	for (j = 0;j < 100;j++)
//	{
//	      printf("ifft_in_%d:%d,%d\n", j, ifft_fun_in[j].real, ifft_fun_in[j].imag);
//	}
	deviceAtb.ifft_fun(ifft_fun_in, ifft_fun_out);

	for (j = 8225;j < 13000;j++)
	{
//	  printf("ifft_out_%d:%d,%d\n", j, ifft_fun_out[j].real, ifft_fun_out[j].imag);
		//printf("ifft_out_%d: %d :%hu,%hu\n", j, ifft_fun_out[j].valid, ifft_fun_out[j].real, ifft_fun_out[j].imag);
	}
	s = 0;
	for (j = 8200;j < 12400;j++)
	{
		if (ifft_fun_out[j].valid == 1)
		{
			cp_in[s].real = (ifft_fun_out[j + 3].real);
			cp_in[s].imag = (ifft_fun_out[j + 3].imag);
	                //printf("ifft_out_at_cp%d:%hu,%hu\n", (j-8230), cp_in[s].real, cp_in[s].imag);
			s++;
		}
	}
	//Adding cyclic prefix
	if ((data_param->sym_no == 0) | (data_param->sym_no == 14))
	{
		for (j = 0;j < first_cp;j++)
		{
			cp_out[j].real = cp_in[data_param->FFT_size - first_cp + j].real;
			cp_out[j].imag = cp_in[data_param->FFT_size - first_cp + j].imag;
		}
		for (j = 0;j < data_param->FFT_size;j++)
		{
			cp_out[j + first_cp].real = cp_in[j].real;
			cp_out[j + first_cp].imag = cp_in[j].imag;
		}
		for (j = 0;j < data_param->FFT_size + first_cp;j++)
		{
			ifft_out[x] = cp_out[j].imag >> 8 & 0xFF;
			ifft_out[x + 1] = cp_out[j].imag & 0xFF;
			ifft_out[x + 2] = cp_out[j].real >> 8 & 0xFF;
			ifft_out[x + 3] = cp_out[j].real & 0xFF;
            //printf("ifft_last_in_first_cp%d:%d,%d,%d,%d\n", x, ifft_out[x], ifft_out[x+1],ifft_out[x+2], ifft_out[x+3]);
            //printf("cp_out_first_cp%d:%d,%d\n", j, cp_out[j].real,cp_out[j].imag);
			x = x + 4;
		}
	}
	else
	{
		for (j = 0;j < second_cp;j++)
		{
			cp_out[j].real = cp_in[data_param->FFT_size - second_cp + j].real;
			cp_out[j].imag = cp_in[data_param->FFT_size - second_cp + j].imag;
		}
		for (j = 0;j < data_param->FFT_size;j++)
		{
			cp_out[j + second_cp].real = cp_in[j].real;
			cp_out[j + second_cp].imag = cp_in[j].imag;
		}
		for (j = 0;j < data_param->FFT_size + second_cp;j++)
		{
			ifft_out[x] = cp_out[j].imag >> 8 & 0xFF;
			ifft_out[x + 1] = cp_out[j].imag & 0xFF;
			ifft_out[x + 2] = cp_out[j].real >> 8 & 0xFF;
			ifft_out[x + 3] = cp_out[j].real & 0xFF;
            //printf("ifft_last_in_second_cp%d:%d,%d,%d,%d\n", x, ifft_out[x], ifft_out[x+1],ifft_out[x+2], ifft_out[x+3]);
            //printf("cp_out_second_cp%d:%d,%d\n", j, cp_out[j].real,cp_out[j].imag);
			x = x + 4;
		}
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

	int i, j;
	FILE* fptr1;
	FILE* fptr2;
	int error_code;

	data_struct* temp = (data_struct*)malloc(10 * sizeof(data_struct));

	data_struct* in_data = (data_struct*)malloc(3276 * 28 * sizeof(data_struct));
	data_struct* out_data = (data_struct*)malloc(122880 * sizeof(data_struct));

	//opening Input data file
	if ((error_code = fopen_s(&fptr1, "po_ifft_in.txt", "r")) != 0) {
		exit(1);
	}
	if ((error_code = fopen_s(&fptr2, "output_res.txt", "w")) != 0) {
		exit(1);
	}

	for (j = 0; j < 1; j++)
	{
		for (i = 0;i < 3276;i++)
		{
			//fscanf_s(fptr1, "%d,%d,%d,%d,%d,%d,%d,%d", &x, &y, &temp[1].imag, &temp[1].real, &temp[1].imag, &temp[1].real, &temp[1].imag, &temp[1].real);
			//fscanf_s(fptr1, "%d,%d,%d,%d", &in_data[i].imag, &in_data[i].real, &temp[1].imag, &temp[1].real);
			fscanf_s(fptr1, "%d,%d", &in_data[i].imag, &in_data[i].real);
			//printf("in_%d:%d,%d\t\t",i, in_data[i].real, in_data[i].imag);
		}

		ifft(d_param, in_data, out_data);

		for (i = 0;i < 4096;i++)
		{
			fprintf_s(fptr2, "%hu,%hu\n", out_data[i].imag, out_data[i].real);
		}
	}

	fclose(fptr1);
	fclose(fptr2);

	return 0;
}
*/
