// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 15:28:13
// ------------------------------------------------------------------------- 
#include "demo_fft_FFT_4K_RXScaling.h"

void demo_fft_FFT_4K_RXScaling::reset()
{
    csl_fill_n(m_n, 45, 0);
    csl_fill_n(m_io_cycle, 2, -1);
    csl_fill_n(m_segment_cycle, 2, -1);
    m_update_cycle = -1;
#ifdef WRITE_STM_FILES
    m_stm_channel_rxs1_in.open("demo_fft_FFT_4K_RXScaling_channel_RXS1_in.stm");
    m_stm_channel_rxs1_out.open("demo_fft_FFT_4K_RXScaling_channel_RXS1_out.stm");
#endif
    m_delay_correction_channel_RXS1_out_port_out_1_vout_tpl.reset();
    m_delay_correction_channel_RXS1_out_port_out_2_chout_tpl.reset();
    m_delay_correction_channel_RXS1_out_port_out_3_real_dout_tpl.reset();
    m_delay_correction_channel_RXS1_out_port_out_3_imag_dout_tpl.reset();
    m_delay_correction_channel_RXS1_out_port_out_4_size_out_tpl.reset();
    m_delay_correction_channel_RXS1_out_port_out_5_nsc_out_tpl.reset();
    m_delay_correction_channel_RXS1_out_port_out_6_time_out_tpl.reset();
}

void demo_fft_FFT_4K_RXScaling::execute_segment_0()
{
    int64_t n[2] = { 0 };
    csl_set(m_n[VCC_VCC_Q_1], 1); // set constant
    csl_set(m_n[SCALE2_HCONST_SCALE2_HCONST_Q_11], 32767); // set constant
    csl_set(m_n[GND_GND_Q_0], 0); // set constant
    csl_set(m_n[SCALE2_LCONST_SCALE2_LCONST_Q_13], -32767); // set constant
    csl_set(m_n[SCALE1_HCONST_SCALE1_HCONST_Q_5], 32767); // set constant
    csl_set(m_n[SCALE1_LCONST_SCALE1_LCONST_Q_7], -32767); // set constant
}

void demo_fft_FFT_4K_RXScaling::execute_segment_1()
{
    int64_t n[7] = { 0 };
    csl_step_reduce(n[0], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_4_IMAG_DIN_TPL_18], 29);
    csl_step_biased_round(m_n[SCALE2_RND_SCALE2_RND_Q_15], n[0], 3);
    csl_step_reduce(n[0], m_n[SCALE2_RND_SCALE2_RND_Q_15], 27);
    csl_step_bit_extract(m_n[SCALE2_SEL_X_SCALE2_SEL_X_B_21], n[0], 16, true, 0);
    csl_step_reduce(n[0], m_n[SCALE2_HCONST_SCALE2_HCONST_Q_11], 16);
    csl_step_reduce(n[1], m_n[SCALE2_RND_SCALE2_RND_Q_15], 27);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE2_HCMP_PIPELINE_OUTPUT_TEMP_10], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE2_HCMP_SCALE2_HCMP_N_10], m_n[SCALE2_HCMP_PIPELINE_OUTPUT_TEMP_10], 29);
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE2_HCMP_SCALE2_HCMP_N_10], 1);
    csl_step_not(m_n[DUPNAME_1_SCALE2_X_DUPNAME_1_SCALE2_X_Q_25], n[1], 1);
    csl_step_reduce(n[0], m_n[SCALE2_RND_SCALE2_RND_Q_15], 27);
    csl_step_reduce(n[1], m_n[SCALE2_LCONST_SCALE2_LCONST_Q_13], 16);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE2_LCMP_PIPELINE_OUTPUT_TEMP_12], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE2_LCMP_SCALE2_LCMP_N_12], m_n[SCALE2_LCMP_PIPELINE_OUTPUT_TEMP_12], 29);
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE2_LCMP_SCALE2_LCMP_N_12], 1);
    csl_step_not(m_n[DUPNAME_0_SCALE2_X_DUPNAME_0_SCALE2_X_Q_23], n[1], 1);
    csl_mask_lower(n[0], m_n[DUPNAME_0_SCALE2_X_DUPNAME_0_SCALE2_X_Q_23], 1);
    csl_step_reduce(n[1], m_n[SCALE2_LCONST_SCALE2_LCONST_Q_13], 16);
    csl_mask_lower(n[2], m_n[DUPNAME_1_SCALE2_X_DUPNAME_1_SCALE2_X_Q_25], 1);
    csl_step_reduce(n[3], m_n[SCALE2_HCONST_SCALE2_HCONST_Q_11], 16);
    csl_step_reduce(n[4], m_n[SCALE2_SEL_X_SCALE2_SEL_X_B_21], 16);
    csl_set(n[5], 1); // set constant
    csl_set(n[6], 0); // set constant
    { // Selector
        if (csl_to_i64(n[0]))
        {
            csl_set(m_n[SCALE2_MUX_SCALE2_MUX_Q_14], n[1]); // data
        }
        else if (csl_to_i64(n[2]))
        {
            csl_set(m_n[SCALE2_MUX_SCALE2_MUX_Q_14], n[3]); // data
        }
        else if (csl_to_i64(n[5]))
        {
            csl_set(m_n[SCALE2_MUX_SCALE2_MUX_Q_14], n[4]); // data
        }
    }
    csl_step_reduce(n[0], m_n[SCALE2_MUX_SCALE2_MUX_Q_14], 16);
    csl_mask_lower(n[1], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_6_FFT_SHIFT_TPL_18], 4);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_step_ld_exp(m_n[SHIFT1_SHIFT1_Q_17], n[0], n[1], true);
    csl_step_reduce(n[0], m_n[SHIFT1_SHIFT1_Q_17], 16);
    csl_step_shift_right(m_n[DUPNAME_0_SHIFT1_RND_X_DUPNAME_0_SHIFT1_RND_X_Q_3], n[0], 0);
    csl_step_reduce(n[0], m_n[DUPNAME_0_SHIFT1_RND_X_DUPNAME_0_SHIFT1_RND_X_Q_3], 16);
    csl_step_bit_extract(m_n[DUPNAME_0_SHIFT1_SEL_X_DUPNAME_0_SHIFT1_SEL_X_B_27], n[0], 16, true, 0);
    csl_step_reduce(n[0], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_4_REAL_DIN_TPL_18], 29);
    csl_step_biased_round(m_n[SCALE1_RND_SCALE1_RND_Q_9], n[0], 3);
    csl_step_reduce(n[0], m_n[SCALE1_RND_SCALE1_RND_Q_9], 27);
    csl_step_bit_extract(m_n[SCALE1_SEL_X_SCALE1_SEL_X_B_20], n[0], 16, true, 0);
    csl_step_reduce(n[0], m_n[SCALE1_HCONST_SCALE1_HCONST_Q_5], 16);
    csl_step_reduce(n[1], m_n[SCALE1_RND_SCALE1_RND_Q_9], 27);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_HCMP_PIPELINE_OUTPUT_TEMP_4], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_HCMP_SCALE1_HCMP_N_4], m_n[SCALE1_HCMP_PIPELINE_OUTPUT_TEMP_4], 29);
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_HCMP_SCALE1_HCMP_N_4], 1);
    csl_step_not(m_n[DUPNAME_1_SCALE1_X_DUPNAME_1_SCALE1_X_Q_24], n[1], 1);
    csl_step_reduce(n[0], m_n[SCALE1_RND_SCALE1_RND_Q_9], 27);
    csl_step_reduce(n[1], m_n[SCALE1_LCONST_SCALE1_LCONST_Q_7], 16);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_LCMP_PIPELINE_OUTPUT_TEMP_6], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_LCMP_SCALE1_LCMP_N_6], m_n[SCALE1_LCMP_PIPELINE_OUTPUT_TEMP_6], 29);
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_LCMP_SCALE1_LCMP_N_6], 1);
    csl_step_not(m_n[DUPNAME_0_SCALE1_X_DUPNAME_0_SCALE1_X_Q_22], n[1], 1);
    csl_mask_lower(n[0], m_n[DUPNAME_0_SCALE1_X_DUPNAME_0_SCALE1_X_Q_22], 1);
    csl_step_reduce(n[1], m_n[SCALE1_LCONST_SCALE1_LCONST_Q_7], 16);
    csl_mask_lower(n[2], m_n[DUPNAME_1_SCALE1_X_DUPNAME_1_SCALE1_X_Q_24], 1);
    csl_step_reduce(n[3], m_n[SCALE1_HCONST_SCALE1_HCONST_Q_5], 16);
    csl_step_reduce(n[4], m_n[SCALE1_SEL_X_SCALE1_SEL_X_B_20], 16);
    csl_set(n[5], 1); // set constant
    csl_set(n[6], 0); // set constant
    { // Selector
        if (csl_to_i64(n[0]))
        {
            csl_set(m_n[SCALE1_MUX_SCALE1_MUX_Q_8], n[1]); // data
        }
        else if (csl_to_i64(n[2]))
        {
            csl_set(m_n[SCALE1_MUX_SCALE1_MUX_Q_8], n[3]); // data
        }
        else if (csl_to_i64(n[5]))
        {
            csl_set(m_n[SCALE1_MUX_SCALE1_MUX_Q_8], n[4]); // data
        }
    }
    csl_step_reduce(n[0], m_n[SCALE1_MUX_SCALE1_MUX_Q_8], 16);
    csl_mask_lower(n[1], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_6_FFT_SHIFT_TPL_18], 4);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_step_ld_exp(m_n[SHIFT_SHIFT_Q_16], n[0], n[1], true);
    csl_step_reduce(n[0], m_n[SHIFT_SHIFT_Q_16], 16);
    csl_step_shift_right(m_n[DUPNAME_0_SHIFT_RND_X_DUPNAME_0_SHIFT_RND_X_Q_2], n[0], 0);
    csl_step_reduce(n[0], m_n[DUPNAME_0_SHIFT_RND_X_DUPNAME_0_SHIFT_RND_X_Q_2], 16);
    csl_step_bit_extract(m_n[DUPNAME_0_SHIFT_SEL_X_DUPNAME_0_SHIFT_SEL_X_B_26], n[0], 16, true, 0);
    csl_mask_lower(n[0], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_1_VIN_TPL_18], 1);
    csl_mask_lower(n[1], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_2_CHIN_TPL_18], 8);
    csl_step_reduce(n[2], m_n[DUPNAME_0_SHIFT_SEL_X_DUPNAME_0_SHIFT_SEL_X_B_26], 16);
    csl_step_reduce(n[3], m_n[DUPNAME_0_SHIFT1_SEL_X_DUPNAME_0_SHIFT1_SEL_X_B_27], 16);
    csl_step_reduce(n[4], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_3_SIZE_TPL_18], 16);
    csl_step_reduce(n[5], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_5_NSC_TPL_18], 16);
    csl_step_reduce(n[6], m_n[CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_7_TIME_IN_TPL_18], 16);
    m_n[CHANNEL_RXS1_OUT_OUT_1_VOUT_TPL_19] = n[0];
    m_n[CHANNEL_RXS1_OUT_OUT_2_CHOUT_TPL_19] = n[1];
    m_n[CHANNEL_RXS1_OUT_OUT_3_REAL_DOUT_TPL_19] = n[2];
    m_n[CHANNEL_RXS1_OUT_OUT_3_IMAG_DOUT_TPL_19] = n[3];
    m_n[CHANNEL_RXS1_OUT_OUT_4_SIZE_OUT_TPL_19] = n[4];
    m_n[CHANNEL_RXS1_OUT_OUT_5_NSC_OUT_TPL_19] = n[5];
    m_n[CHANNEL_RXS1_OUT_OUT_6_TIME_OUT_TPL_19] = n[6];
}

void demo_fft_FFT_4K_RXScaling::execute_segment_update()
{
    
}

const size_t demo_fft_FFT_4K_RXScaling::GND_GND_Q_0 = 0;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_HCMP_SCALE2_HCMP_N_10 = 10;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_HCONST_SCALE2_HCONST_Q_11 = 11;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_LCMP_SCALE2_LCMP_N_12 = 12;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_LCONST_SCALE2_LCONST_Q_13 = 13;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_MUX_SCALE2_MUX_Q_14 = 14;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_RND_SCALE2_RND_Q_15 = 15;
const size_t demo_fft_FFT_4K_RXScaling::SHIFT_SHIFT_Q_16 = 16;
const size_t demo_fft_FFT_4K_RXScaling::SHIFT1_SHIFT1_Q_17 = 17;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_4_REAL_DIN_TPL_18 = 18;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_4_IMAG_DIN_TPL_18 = 19;
const size_t demo_fft_FFT_4K_RXScaling::VCC_VCC_Q_1 = 1;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_3_SIZE_TPL_18 = 20;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_5_NSC_TPL_18 = 21;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_6_FFT_SHIFT_TPL_18 = 22;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_7_TIME_IN_TPL_18 = 23;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_2_CHIN_TPL_18 = 24;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_IN_CHANNEL_RXS1_IN_IN_1_VIN_TPL_18 = 25;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_SEL_X_SCALE1_SEL_X_B_20 = 26;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_SEL_X_SCALE2_SEL_X_B_21 = 27;
const size_t demo_fft_FFT_4K_RXScaling::DUPNAME_0_SCALE1_X_DUPNAME_0_SCALE1_X_Q_22 = 28;
const size_t demo_fft_FFT_4K_RXScaling::DUPNAME_0_SCALE2_X_DUPNAME_0_SCALE2_X_Q_23 = 29;
const size_t demo_fft_FFT_4K_RXScaling::DUPNAME_0_SHIFT_RND_X_DUPNAME_0_SHIFT_RND_X_Q_2 = 2;
const size_t demo_fft_FFT_4K_RXScaling::DUPNAME_1_SCALE1_X_DUPNAME_1_SCALE1_X_Q_24 = 30;
const size_t demo_fft_FFT_4K_RXScaling::DUPNAME_1_SCALE2_X_DUPNAME_1_SCALE2_X_Q_25 = 31;
const size_t demo_fft_FFT_4K_RXScaling::DUPNAME_0_SHIFT_SEL_X_DUPNAME_0_SHIFT_SEL_X_B_26 = 32;
const size_t demo_fft_FFT_4K_RXScaling::DUPNAME_0_SHIFT1_SEL_X_DUPNAME_0_SHIFT1_SEL_X_B_27 = 33;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_HCMP_PIPELINE_OUTPUT_TEMP_10 = 34;
const size_t demo_fft_FFT_4K_RXScaling::SCALE2_LCMP_PIPELINE_OUTPUT_TEMP_12 = 35;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_HCMP_PIPELINE_OUTPUT_TEMP_4 = 36;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_LCMP_PIPELINE_OUTPUT_TEMP_6 = 37;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_OUT_OUT_1_VOUT_TPL_19 = 38;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_OUT_OUT_2_CHOUT_TPL_19 = 39;
const size_t demo_fft_FFT_4K_RXScaling::DUPNAME_0_SHIFT1_RND_X_DUPNAME_0_SHIFT1_RND_X_Q_3 = 3;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_OUT_OUT_3_REAL_DOUT_TPL_19 = 40;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_OUT_OUT_3_IMAG_DOUT_TPL_19 = 41;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_OUT_OUT_4_SIZE_OUT_TPL_19 = 42;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_OUT_OUT_5_NSC_OUT_TPL_19 = 43;
const size_t demo_fft_FFT_4K_RXScaling::CHANNEL_RXS1_OUT_OUT_6_TIME_OUT_TPL_19 = 44;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_HCMP_SCALE1_HCMP_N_4 = 4;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_HCONST_SCALE1_HCONST_Q_5 = 5;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_LCMP_SCALE1_LCMP_N_6 = 6;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_LCONST_SCALE1_LCONST_Q_7 = 7;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_MUX_SCALE1_MUX_Q_8 = 8;
const size_t demo_fft_FFT_4K_RXScaling::SCALE1_RND_SCALE1_RND_Q_9 = 9;

