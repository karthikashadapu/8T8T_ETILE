// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 15:28:13
// ------------------------------------------------------------------------- 
#include "demo_fft_FFT_4K_RXGainComp.h"

void demo_fft_FFT_4K_RXGainComp::reset()
{
    csl_fill_n(m_n, 48, 0);
    csl_fill_n(m_io_cycle, 2, -1);
    csl_fill_n(m_segment_cycle, 2, -1);
    m_update_cycle = -1;
#ifdef WRITE_STM_FILES
    m_stm_channel_rxg1_in.open("demo_fft_FFT_4K_RXGainComp_channel_RXG1_in_cunroll_x.stm");
    m_stm_channel_rxg1_out.open("demo_fft_FFT_4K_RXGainComp_channel_RXG1_out_cunroll_x.stm");
#endif
    m_delay_correction_channel_RXG1_out_port_out_1_vout_tpl.reset();
    m_delay_correction_channel_RXG1_out_port_out_2_chout_tpl.reset();
    m_delay_correction_channel_RXG1_out_port_out_3_real_dout_tpl.reset();
    m_delay_correction_channel_RXG1_out_port_out_3_imag_dout_tpl.reset();
    m_delay_correction_channel_RXG1_out_port_out_5_size_out_tpl.reset();
    m_delay_correction_channel_RXG1_out_port_out_4_nsc_out_tpl.reset();
    m_delay_correction_channel_RXG1_out_port_out_6_time_out_tpl.reset();
}

void demo_fft_FFT_4K_RXGainComp::execute_segment_0()
{
    int64_t n[2] = { 0 };
    csl_set(m_n[VCC_VCC_Q_1], 1); // set constant
    csl_set(m_n[SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3], 32767); // set constant
    csl_set(m_n[GND_GND_Q_0], 0); // set constant
    csl_set(m_n[SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5], -32767); // set constant
    csl_set(m_n[SCALE1_REAL_HCONST_X_SCALE1_REAL_HCONST_X_Q_9], 32767); // set constant
    csl_set(m_n[SCALE1_REAL_LCONST_X_SCALE1_REAL_LCONST_X_Q_11], -32767); // set constant
}

void demo_fft_FFT_4K_RXGainComp::execute_segment_1()
{
    int64_t n[7] = { 0 };
    csl_step_reduce(n[0], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_IMAG_DIN_TPL_20], 16);
    csl_step_reduce(n[1], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_6_FFT_GAIN_RE_TPL_20], 16);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_step_mul(m_n[MULT_IMAGMULT2_X_MULT_IMAGMULT2_X_Q_16], n[0], n[1]);
    csl_step_reduce(n[0], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_REAL_DIN_TPL_20], 16);
    csl_step_reduce(n[1], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_7_FFT_GAIN_IM_TPL_20], 16);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_step_mul(m_n[MULT_IMAGMULT1_X_MULT_IMAGMULT1_X_Q_15], n[0], n[1]);
    csl_step_reduce(n[0], m_n[MULT_IMAGMULT1_X_MULT_IMAGMULT1_X_Q_15], 32);
    csl_step_reduce(n[1], m_n[MULT_IMAGMULT2_X_MULT_IMAGMULT2_X_Q_16], 32);
    csl_step_add(m_n[MULT_IMAGADD_X_MULT_IMAGADD_X_Q_14], n[0], n[1]);
    csl_step_reduce(n[0], m_n[MULT_IMAGADD_X_MULT_IMAGADD_X_Q_14], 32);
    csl_step_biased_round(m_n[SCALE1_IMAG_RND_X_SCALE1_IMAG_RND_X_Q_7], n[0], 13);
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_RND_X_SCALE1_IMAG_RND_X_Q_7], 20);
    csl_step_bit_extract(m_n[SCALE1_IMAG_SEL_X_SCALE1_IMAG_SEL_X_B_26], n[0], 16, true, 0);
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3], 16);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_RND_X_SCALE1_IMAG_RND_X_Q_7], 20);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_IMAG_HCMP_X_PIPELINE_OUTPUT_TEMP_2], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_IMAG_HCMP_X_SCALE1_IMAG_HCMP_X_N_2], m_n[SCALE1_IMAG_HCMP_X_PIPELINE_OUTPUT_TEMP_2], 22);
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_IMAG_HCMP_X_SCALE1_IMAG_HCMP_X_N_2], 1);
    csl_step_not(m_n[DUPNAME_1_SCALE1_IMAG_X_DUPNAME_1_SCALE1_IMAG_X_Q_24], n[1], 1);
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_RND_X_SCALE1_IMAG_RND_X_Q_7], 20);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5], 16);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_IMAG_LCMP_X_PIPELINE_OUTPUT_TEMP_4], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_IMAG_LCMP_X_SCALE1_IMAG_LCMP_X_N_4], m_n[SCALE1_IMAG_LCMP_X_PIPELINE_OUTPUT_TEMP_4], 22);
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_IMAG_LCMP_X_SCALE1_IMAG_LCMP_X_N_4], 1);
    csl_step_not(m_n[DUPNAME_0_SCALE1_IMAG_X_DUPNAME_0_SCALE1_IMAG_X_Q_22], n[1], 1);
    csl_mask_lower(n[0], m_n[DUPNAME_0_SCALE1_IMAG_X_DUPNAME_0_SCALE1_IMAG_X_Q_22], 1);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5], 16);
    csl_mask_lower(n[2], m_n[DUPNAME_1_SCALE1_IMAG_X_DUPNAME_1_SCALE1_IMAG_X_Q_24], 1);
    csl_step_reduce(n[3], m_n[SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3], 16);
    csl_step_reduce(n[4], m_n[SCALE1_IMAG_SEL_X_SCALE1_IMAG_SEL_X_B_26], 16);
    csl_set(n[5], 1); // set constant
    csl_set(n[6], 0); // set constant
    { // Selector
        if (csl_to_i64(n[0]))
        {
            csl_set(m_n[SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6], n[1]); // data
        }
        else if (csl_to_i64(n[2]))
        {
            csl_set(m_n[SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6], n[3]); // data
        }
        else if (csl_to_i64(n[5]))
        {
            csl_set(m_n[SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6], n[4]); // data
        }
    }
    csl_step_reduce(n[0], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_IMAG_DIN_TPL_20], 16);
    csl_step_reduce(n[1], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_7_FFT_GAIN_IM_TPL_20], 16);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_step_mul(m_n[MULT_REALMULT2_X_MULT_REALMULT2_X_Q_18], n[0], n[1]);
    csl_step_reduce(n[0], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_REAL_DIN_TPL_20], 16);
    csl_step_reduce(n[1], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_6_FFT_GAIN_RE_TPL_20], 16);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_step_mul(m_n[MULT_REALMULT1_X_MULT_REALMULT1_X_Q_17], n[0], n[1]);
    csl_step_reduce(n[0], m_n[MULT_REALMULT1_X_MULT_REALMULT1_X_Q_17], 32);
    csl_step_reduce(n[1], m_n[MULT_REALMULT2_X_MULT_REALMULT2_X_Q_18], 32);
    csl_step_sub(m_n[MULT_REALSUB_X_MULT_REALSUB_X_Q_19], n[0], n[1]);
    csl_step_reduce(n[0], m_n[MULT_REALSUB_X_MULT_REALSUB_X_Q_19], 32);
    csl_step_biased_round(m_n[SCALE1_REAL_RND_X_SCALE1_REAL_RND_X_Q_13], n[0], 13);
    csl_step_reduce(n[0], m_n[SCALE1_REAL_RND_X_SCALE1_REAL_RND_X_Q_13], 20);
    csl_step_bit_extract(m_n[SCALE1_REAL_SEL_X_SCALE1_REAL_SEL_X_B_27], n[0], 16, true, 0);
    csl_step_reduce(n[0], m_n[SCALE1_REAL_HCONST_X_SCALE1_REAL_HCONST_X_Q_9], 16);
    csl_step_reduce(n[1], m_n[SCALE1_REAL_RND_X_SCALE1_REAL_RND_X_Q_13], 20);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_REAL_HCMP_X_PIPELINE_OUTPUT_TEMP_8], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_REAL_HCMP_X_SCALE1_REAL_HCMP_X_N_8], m_n[SCALE1_REAL_HCMP_X_PIPELINE_OUTPUT_TEMP_8], 22);
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_REAL_HCMP_X_SCALE1_REAL_HCMP_X_N_8], 1);
    csl_step_not(m_n[DUPNAME_1_SCALE1_REAL_X_DUPNAME_1_SCALE1_REAL_X_Q_25], n[1], 1);
    csl_step_reduce(n[0], m_n[SCALE1_REAL_RND_X_SCALE1_REAL_RND_X_Q_13], 20);
    csl_step_reduce(n[1], m_n[SCALE1_REAL_LCONST_X_SCALE1_REAL_LCONST_X_Q_11], 16);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_REAL_LCMP_X_PIPELINE_OUTPUT_TEMP_10], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_REAL_LCMP_X_SCALE1_REAL_LCMP_X_N_10], m_n[SCALE1_REAL_LCMP_X_PIPELINE_OUTPUT_TEMP_10], 22);
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_REAL_LCMP_X_SCALE1_REAL_LCMP_X_N_10], 1);
    csl_step_not(m_n[DUPNAME_0_SCALE1_REAL_X_DUPNAME_0_SCALE1_REAL_X_Q_23], n[1], 1);
    csl_mask_lower(n[0], m_n[DUPNAME_0_SCALE1_REAL_X_DUPNAME_0_SCALE1_REAL_X_Q_23], 1);
    csl_step_reduce(n[1], m_n[SCALE1_REAL_LCONST_X_SCALE1_REAL_LCONST_X_Q_11], 16);
    csl_mask_lower(n[2], m_n[DUPNAME_1_SCALE1_REAL_X_DUPNAME_1_SCALE1_REAL_X_Q_25], 1);
    csl_step_reduce(n[3], m_n[SCALE1_REAL_HCONST_X_SCALE1_REAL_HCONST_X_Q_9], 16);
    csl_step_reduce(n[4], m_n[SCALE1_REAL_SEL_X_SCALE1_REAL_SEL_X_B_27], 16);
    csl_set(n[5], 1); // set constant
    csl_set(n[6], 0); // set constant
    { // Selector
        if (csl_to_i64(n[0]))
        {
            csl_set(m_n[SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12], n[1]); // data
        }
        else if (csl_to_i64(n[2]))
        {
            csl_set(m_n[SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12], n[3]); // data
        }
        else if (csl_to_i64(n[5]))
        {
            csl_set(m_n[SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12], n[4]); // data
        }
    }
    csl_mask_lower(n[0], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_1_VIN_TPL_20], 1);
    csl_mask_lower(n[1], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_2_CHIN_TPL_20], 8);
    csl_step_reduce(n[2], m_n[SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12], 16);
    csl_step_reduce(n[3], m_n[SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6], 16);
    csl_step_reduce(n[4], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_5_SIZE_TPL_20], 16);
    csl_step_reduce(n[5], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_4_NSC_TPL_20], 16);
    csl_step_reduce(n[6], m_n[CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_8_TIME_IN_TPL_20], 16);
    m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_1_VOUT_TPL_21] = n[0];
    m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_2_CHOUT_TPL_21] = n[1];
    m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_REAL_DOUT_TPL_21] = n[2];
    m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_21] = n[3];
    m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_5_SIZE_OUT_TPL_21] = n[4];
    m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_4_NSC_OUT_TPL_21] = n[5];
    m_n[CHANNEL_RXG1_OUT_CUNROLL_X_OUT_6_TIME_OUT_TPL_21] = n[6];
}

void demo_fft_FFT_4K_RXGainComp::execute_segment_update()
{
    
}

const size_t demo_fft_FFT_4K_RXGainComp::GND_GND_Q_0 = 0;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_LCMP_X_SCALE1_REAL_LCMP_X_N_10 = 10;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_LCONST_X_SCALE1_REAL_LCONST_X_Q_11 = 11;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12 = 12;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_RND_X_SCALE1_REAL_RND_X_Q_13 = 13;
const size_t demo_fft_FFT_4K_RXGainComp::MULT_IMAGADD_X_MULT_IMAGADD_X_Q_14 = 14;
const size_t demo_fft_FFT_4K_RXGainComp::MULT_IMAGMULT1_X_MULT_IMAGMULT1_X_Q_15 = 15;
const size_t demo_fft_FFT_4K_RXGainComp::MULT_IMAGMULT2_X_MULT_IMAGMULT2_X_Q_16 = 16;
const size_t demo_fft_FFT_4K_RXGainComp::MULT_REALMULT1_X_MULT_REALMULT1_X_Q_17 = 17;
const size_t demo_fft_FFT_4K_RXGainComp::MULT_REALMULT2_X_MULT_REALMULT2_X_Q_18 = 18;
const size_t demo_fft_FFT_4K_RXGainComp::MULT_REALSUB_X_MULT_REALSUB_X_Q_19 = 19;
const size_t demo_fft_FFT_4K_RXGainComp::VCC_VCC_Q_1 = 1;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_REAL_DIN_TPL_20 = 20;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_3_IMAG_DIN_TPL_20 = 21;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_5_SIZE_TPL_20 = 22;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_4_NSC_TPL_20 = 23;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_6_FFT_GAIN_RE_TPL_20 = 24;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_7_FFT_GAIN_IM_TPL_20 = 25;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_8_TIME_IN_TPL_20 = 26;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_2_CHIN_TPL_20 = 27;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_IN_CUNROLL_X_CHANNEL_RXG1_IN_CUNROLL_X_IN_1_VIN_TPL_20 = 28;
const size_t demo_fft_FFT_4K_RXGainComp::DUPNAME_0_SCALE1_IMAG_X_DUPNAME_0_SCALE1_IMAG_X_Q_22 = 29;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_HCMP_X_SCALE1_IMAG_HCMP_X_N_2 = 2;
const size_t demo_fft_FFT_4K_RXGainComp::DUPNAME_0_SCALE1_REAL_X_DUPNAME_0_SCALE1_REAL_X_Q_23 = 30;
const size_t demo_fft_FFT_4K_RXGainComp::DUPNAME_1_SCALE1_IMAG_X_DUPNAME_1_SCALE1_IMAG_X_Q_24 = 31;
const size_t demo_fft_FFT_4K_RXGainComp::DUPNAME_1_SCALE1_REAL_X_DUPNAME_1_SCALE1_REAL_X_Q_25 = 32;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_SEL_X_SCALE1_IMAG_SEL_X_B_26 = 33;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_SEL_X_SCALE1_REAL_SEL_X_B_27 = 34;
const size_t demo_fft_FFT_4K_RXGainComp::MULT_IMAGADD_X_PIPELINE_OUTPUT_TEMP_14 = 35;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_HCMP_X_PIPELINE_OUTPUT_TEMP_2 = 36;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_LCMP_X_PIPELINE_OUTPUT_TEMP_4 = 37;
const size_t demo_fft_FFT_4K_RXGainComp::MULT_REALSUB_X_PIPELINE_OUTPUT_TEMP_19 = 38;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_HCMP_X_PIPELINE_OUTPUT_TEMP_8 = 39;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3 = 3;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_LCMP_X_PIPELINE_OUTPUT_TEMP_10 = 40;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_OUT_CUNROLL_X_OUT_1_VOUT_TPL_21 = 41;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_OUT_CUNROLL_X_OUT_2_CHOUT_TPL_21 = 42;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_REAL_DOUT_TPL_21 = 43;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_OUT_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_21 = 44;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_OUT_CUNROLL_X_OUT_5_SIZE_OUT_TPL_21 = 45;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_OUT_CUNROLL_X_OUT_4_NSC_OUT_TPL_21 = 46;
const size_t demo_fft_FFT_4K_RXGainComp::CHANNEL_RXG1_OUT_CUNROLL_X_OUT_6_TIME_OUT_TPL_21 = 47;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_LCMP_X_SCALE1_IMAG_LCMP_X_N_4 = 4;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5 = 5;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6 = 6;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_IMAG_RND_X_SCALE1_IMAG_RND_X_Q_7 = 7;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_HCMP_X_SCALE1_REAL_HCMP_X_N_8 = 8;
const size_t demo_fft_FFT_4K_RXGainComp::SCALE1_REAL_HCONST_X_SCALE1_REAL_HCONST_X_Q_9 = 9;

