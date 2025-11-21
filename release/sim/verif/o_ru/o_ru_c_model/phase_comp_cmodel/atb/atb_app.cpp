// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#include "phase_comp_phase_comp_atb.h"
#include <iostream>
#include "phase_comp_phase_comp_ComplexMixer_ComplexMixer_atb.h"
#include "phase_comp_phase_comp_ComplexMixer_Scalei_atb.h"
#include "phase_comp_phase_comp_ComplexMixer_Scaleq_atb.h"
#include "phase_comp_phase_comp_ComplexMixer_atb.h"
#include "phase_comp_phase_comp_PhasorGenerate_atb.h"

#include "connector.h"

void csl_error(const char* msg)   { std::cout << "Error: " << msg << "\n"; }
void csl_warning(const char* msg) { std::cout << "Warning: " << msg << "\n"; }
void csl_info(const char* msg)    { std::cout << "Info: " << msg << "\n"; }

int phase_compensation(unsigned int* data_param_arr, unsigned char* phase_comp_in, unsigned char* phase_comp_out)
{
	int j = 0, s = 0, m = 0, x = 0;
	struct data_struct pc_in[5000];
	struct data_struct pc_out[5000];

	phase_comp_phase_compATB deviceAtb;
	struct param_struct* data_param;

	data_param = (struct param_struct*)data_param_arr;
//	int x = 0;
	int error_code;

	int no_of_sc;

	no_of_sc = 12 * data_param->No_of_prbs;//no of subcarriers or samples is equal to 12 times no of prbs


	//printf("IFFT\nprocessing...\n");

	for (j = 0;j < no_of_sc;j++)
	{
		pc_in[j].imag = (phase_comp_in[4 * m] << 8) | (phase_comp_in[(4 * m) + 1] & 0xFF);
		pc_in[j].real = (phase_comp_in[(4 * m) + 2] << 8) | (phase_comp_in[(4 * m) + 3] & 0xFF);
		pc_in[j].valid = 1;
		pc_in[j].channel = 1;
		m = m + 1;
	}

	//for (j = 0;j < 3276;j++)
	//{
	//      printf("pc_in_%d: %d :%d,%d\n", j, pc_in[j].valid, pc_in[j].real, pc_in[j].imag);
	//}

	deviceAtb.phase_comp(data_param->tx_rx_sel, pc_in, pc_out);

	//for (j = 0;j < 3276;j++)
	//{
	//      printf("pc_out_%d: %d :%hu,%hu\n", j, pc_out[j].valid, pc_out[j].real, pc_out[j].imag);
	//}
	s = 0;
	for (j = 0;j < 5000;j++)
	{
		if (pc_out[j].valid == 1)
		{
			phase_comp_out[x] = pc_out[j].imag >> 8 & 0xFF;
			phase_comp_out[x + 1] = pc_out[j].imag & 0xFF;
			phase_comp_out[x + 2] = pc_out[j].real >> 8 & 0xFF;
			phase_comp_out[x + 3] = pc_out[j].real & 0xFF;
			x = x + 4;
		}
	}
	return 0;
}
/*
int main()
{

	unsigned int d_param[2];
	d_param[0] = 273;//No_of_prbs
	d_param[1] = 0;//tx_rx_sel

	int i, j;
	FILE* fptr1;
	FILE* fptr2;
	int error_code;

	data_struct* temp = (data_struct*)malloc(10 * sizeof(data_struct));

	data_struct* in_data = (data_struct*)malloc(3276 * 28 * sizeof(data_struct));
	data_struct* out_data = (data_struct*)malloc(122880 * sizeof(data_struct));

	//opening Input data file
	if ((error_code = fopen_s(&fptr1, "in_ax1.txt", "r")) != 0) {
		exit(1);
	}
	if ((error_code = fopen_s(&fptr2, "output_f_1.txt", "w")) != 0) {
		exit(1);
	}

	for (j = 0; j < 1; j++)
	{
		for (i = 0;i < 3276;i++)
		{
			fscanf_s(fptr1, "%d,%d", &in_data[i].imag, &in_data[i].real);
			//printf("in_%d:%d,%d\t\t",i, in_data[i].real, in_data[i].imag);
		}

		phase_compensation(d_param, in_data, out_data);

		int16_t x, y;
		for (i = 0;i < 3276;i++)
		{
			x = out_data[i].imag;
			y = out_data[i].real;
			fprintf_s(fptr2, "%d,%d\n", x, y);
		}
	}

	fclose(fptr1);
	fclose(fptr2);

	return 0;
}
*/
