// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 15:28:13
// ------------------------------------------------------------------------- 
#include "demo_fft_FFT_4K.h"

void demo_fft_FFT_4K::reset()
{
    csl_fill_n(m_n, 39, 0);
    m_demo_fft_FFT_4K_BitReverseCoreC_inst0.reset();
    m_demo_fft_FFT_4K_FFT_inst0.reset();
    m_demo_fft_FFT_4K_RXGainComp_inst0.reset();
    m_demo_fft_FFT_4K_RXScaling_inst0.reset();
    csl_fill_n(m_io_cycle, 12, -1);
    csl_fill_n(m_segment_cycle, 6, -1);
    m_update_cycle = -1;
}

void demo_fft_FFT_4K::execute_segment_0()
{
    int64_t n[2] = { 0 };
    csl_set(m_n[CONST1_CONST1_Q_3], 0); // set constant
    csl_set(m_n[CONST_RSRVD_FIX_CONST_RSRVD_FIX_Q_2], 8192); // set constant
    csl_set(m_n[CONST3_CONST3_Q_5], 0); // set constant
}

void demo_fft_FFT_4K::execute_segment_1()
{
    
}

void demo_fft_FFT_4K::execute_segment_2()
{
    
}

void demo_fft_FFT_4K::execute_segment_3()
{
    
}

void demo_fft_FFT_4K::execute_segment_4()
{
    
}

void demo_fft_FFT_4K::execute_segment_5()
{
    int64_t n[9] = { 0 };
    csl_mask_lower(n[0], m_n[XV_S_XV_S_XV_S_10], 1);
    csl_mask_lower(n[1], m_n[XC_S_XC_S_XC_S_11], 8);
    csl_step_reduce(n[2], m_n[XR_IM_XR_IM_XR_IM_12], 16);
    csl_step_reduce(n[3], m_n[XR_RE_XR_RE_XR_RE_13], 16);
    csl_step_reduce(n[4], m_n[CONST1_CONST1_Q_3], 16);
    csl_step_reduce(n[5], m_n[CONST1_CONST1_Q_3], 16);
    csl_step_reduce(n[6], m_n[CONST_RSRVD_FIX_CONST_RSRVD_FIX_Q_2], 16);
    csl_step_reduce(n[7], m_n[CONST1_CONST1_Q_3], 16);
    csl_step_reduce(n[8], m_n[CONST1_CONST1_Q_3], 16);
    // StepModelWrite
    {
        demo_fft_FFT_4K_RXGainComp::io_struct_channel_RXG1_in bbWriteStruct_0;
        csl_memcpy(&bbWriteStruct_0.port_in_1_vin_tpl, &n[0], 1);
        csl_memcpy(&bbWriteStruct_0.port_in_2_chin_tpl, &n[1], 1);
        csl_memcpy(&bbWriteStruct_0.port_in_3_imag_din_tpl, &n[2], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_3_real_din_tpl, &n[3], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_4_nsc_tpl, &n[4], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_5_size_tpl, &n[5], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_6_fft_gain_re_tpl, &n[6], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_7_fft_gain_im_tpl, &n[7], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_8_time_in_tpl, &n[8], 2);
        m_demo_fft_FFT_4K_RXGainComp_inst0.write(bbWriteStruct_0);
    }
    // StepModelRead
    {
        demo_fft_FFT_4K_RXGainComp::io_struct_channel_RXG1_out bbReaderStruct_0;
        m_demo_fft_FFT_4K_RXGainComp_inst0.read(bbReaderStruct_0);
        m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_1_VOUT_TPL_8] = 0;
        csl_memcpy(&m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_1_VOUT_TPL_8], &bbReaderStruct_0.port_out_1_vout_tpl, 1);
        m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_2_CHOUT_TPL_8] = 0;
        csl_memcpy(&m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_2_CHOUT_TPL_8], &bbReaderStruct_0.port_out_2_chout_tpl, 1);
        m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_8] = 0;
        csl_memcpy(&m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_8], &bbReaderStruct_0.port_out_3_imag_dout_tpl, 2);
        m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_REAL_DOUT_TPL_8] = 0;
        csl_memcpy(&m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_REAL_DOUT_TPL_8], &bbReaderStruct_0.port_out_3_real_dout_tpl, 2);
        m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_4_NSC_OUT_TPL_8] = 0;
        csl_memcpy(&m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_4_NSC_OUT_TPL_8], &bbReaderStruct_0.port_out_4_nsc_out_tpl, 2);
        m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_5_SIZE_OUT_TPL_8] = 0;
        csl_memcpy(&m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_5_SIZE_OUT_TPL_8], &bbReaderStruct_0.port_out_5_size_out_tpl, 2);
        m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_6_TIME_OUT_TPL_8] = 0;
        csl_memcpy(&m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_6_TIME_OUT_TPL_8], &bbReaderStruct_0.port_out_6_time_out_tpl, 2);
    }
    csl_mask_lower(n[0], m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_1_VOUT_TPL_8], 1);
    csl_mask_lower(n[1], m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_2_CHOUT_TPL_8], 8);
    csl_step_reduce(n[2], m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_8], 16);
    csl_step_reduce(n[3], m_n[RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_REAL_DOUT_TPL_8], 16);
    // StepModelWrite
    {
        demo_fft_FFT_4K_BitReverseCoreC::io_struct_ChannelIn bbWriteStruct_1;
        csl_memcpy(&bbWriteStruct_1.port_in_1_v_tpl, &n[0], 1);
        csl_memcpy(&bbWriteStruct_1.port_in_2_c_tpl, &n[1], 1);
        csl_memcpy(&bbWriteStruct_1.port_in_3_imag_x_tpl, &n[2], 2);
        csl_memcpy(&bbWriteStruct_1.port_in_3_real_x_tpl, &n[3], 2);
        m_demo_fft_FFT_4K_BitReverseCoreC_inst0.write(bbWriteStruct_1);
    }
    // StepModelRead
    {
        demo_fft_FFT_4K_BitReverseCoreC::io_struct_ChannelOut bbReaderStruct_1;
        m_demo_fft_FFT_4K_BitReverseCoreC_inst0.read(bbReaderStruct_1);
        m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_6] = 0;
        csl_memcpy(&m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_6], &bbReaderStruct_1.port_out_1_qv_tpl, 1);
        m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_6] = 0;
        csl_memcpy(&m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_6], &bbReaderStruct_1.port_out_2_qc_tpl, 1);
        m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_6] = 0;
        csl_memcpy(&m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_6], &bbReaderStruct_1.port_out_3_imag_q_tpl, 2);
        m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_6] = 0;
        csl_memcpy(&m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_6], &bbReaderStruct_1.port_out_3_real_q_tpl, 2);
    }
    csl_step_reduce(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_6], 16);
    m_n[YR_RE_YR_RE_21] = n[0];
    csl_step_reduce(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_6], 16);
    m_n[YR_IM_YR_IM_20] = n[0];
    csl_mask_lower(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_6], 8);
    m_n[YC_S_YC_S_19] = n[0];
    csl_mask_lower(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_6], 1);
    m_n[YV_S_YV_S_18] = n[0];
    csl_mask_lower(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_6], 1);
    csl_mask_lower(n[1], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_6], 8);
    csl_step_reduce(n[2], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_6], 16);
    csl_step_reduce(n[3], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_6], 16);
    // StepModelWrite
    {
        demo_fft_FFT_4K_FFT::io_struct_ChannelIn bbWriteStruct_2;
        csl_memcpy(&bbWriteStruct_2.port_in_1_v_tpl, &n[0], 1);
        csl_memcpy(&bbWriteStruct_2.port_in_2_c_tpl, &n[1], 1);
        csl_memcpy(&bbWriteStruct_2.port_in_3_imag_d_tpl, &n[2], 2);
        csl_memcpy(&bbWriteStruct_2.port_in_3_real_d_tpl, &n[3], 2);
        m_demo_fft_FFT_4K_FFT_inst0.write(bbWriteStruct_2);
    }
    // StepModelRead
    {
        demo_fft_FFT_4K_FFT::io_struct_ChannelOut1 bbReaderStruct_2;
        m_demo_fft_FFT_4K_FFT_inst0.read(bbReaderStruct_2);
        m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_7] = 0;
        csl_memcpy(&m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_7], &bbReaderStruct_2.port_out_1_qv_tpl, 1);
        m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_7] = 0;
        csl_memcpy(&m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_7], &bbReaderStruct_2.port_out_2_qc_tpl, 1);
        m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_7] = 0;
        csl_memcpy(&m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_7], &bbReaderStruct_2.port_out_3_imag_q_tpl, 4);
        m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_7] = 0;
        csl_memcpy(&m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_7], &bbReaderStruct_2.port_out_3_real_q_tpl, 4);
    }
    csl_mask_lower(n[0], m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_7], 1);
    csl_mask_lower(n[1], m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_7], 8);
    csl_step_reduce(n[2], m_n[CONST1_CONST1_Q_3], 16);
    csl_step_reduce(n[3], m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_7], 29);
    csl_step_reduce(n[4], m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_7], 29);
    csl_step_reduce(n[5], m_n[CONST1_CONST1_Q_3], 16);
    csl_mask_lower(n[6], m_n[CONST3_CONST3_Q_5], 4);
    csl_step_reduce(n[7], m_n[CONST1_CONST1_Q_3], 16);
    // StepModelWrite
    {
        demo_fft_FFT_4K_RXScaling::io_struct_channel_RXS1_in bbWriteStruct_3;
        csl_memcpy(&bbWriteStruct_3.port_in_1_vin_tpl, &n[0], 1);
        csl_memcpy(&bbWriteStruct_3.port_in_2_chin_tpl, &n[1], 1);
        csl_memcpy(&bbWriteStruct_3.port_in_3_size_tpl, &n[2], 2);
        csl_memcpy(&bbWriteStruct_3.port_in_4_imag_din_tpl, &n[3], 4);
        csl_memcpy(&bbWriteStruct_3.port_in_4_real_din_tpl, &n[4], 4);
        csl_memcpy(&bbWriteStruct_3.port_in_5_nsc_tpl, &n[5], 2);
        csl_memcpy(&bbWriteStruct_3.port_in_6_fft_shift_tpl, &n[6], 1);
        csl_memcpy(&bbWriteStruct_3.port_in_7_time_in_tpl, &n[7], 2);
        m_demo_fft_FFT_4K_RXScaling_inst0.write(bbWriteStruct_3);
    }
    // StepModelRead
    {
        demo_fft_FFT_4K_RXScaling::io_struct_channel_RXS1_out bbReaderStruct_3;
        m_demo_fft_FFT_4K_RXScaling_inst0.read(bbReaderStruct_3);
        m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_1_VOUT_TPL_9] = 0;
        csl_memcpy(&m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_1_VOUT_TPL_9], &bbReaderStruct_3.port_out_1_vout_tpl, 1);
        m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_2_CHOUT_TPL_9] = 0;
        csl_memcpy(&m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_2_CHOUT_TPL_9], &bbReaderStruct_3.port_out_2_chout_tpl, 1);
        m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_9] = 0;
        csl_memcpy(&m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_9], &bbReaderStruct_3.port_out_3_imag_dout_tpl, 2);
        m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_REAL_DOUT_TPL_9] = 0;
        csl_memcpy(&m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_REAL_DOUT_TPL_9], &bbReaderStruct_3.port_out_3_real_dout_tpl, 2);
        m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_4_SIZE_OUT_TPL_9] = 0;
        csl_memcpy(&m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_4_SIZE_OUT_TPL_9], &bbReaderStruct_3.port_out_4_size_out_tpl, 2);
        m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_5_NSC_OUT_TPL_9] = 0;
        csl_memcpy(&m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_5_NSC_OUT_TPL_9], &bbReaderStruct_3.port_out_5_nsc_out_tpl, 2);
        m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_6_TIME_OUT_TPL_9] = 0;
        csl_memcpy(&m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_6_TIME_OUT_TPL_9], &bbReaderStruct_3.port_out_6_time_out_tpl, 2);
    }
    csl_step_reduce(n[0], m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_REAL_DOUT_TPL_9], 16);
    m_n[ZR_RE_ZR_RE_17] = n[0];
    csl_step_reduce(n[0], m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_9], 16);
    m_n[ZR_IM_ZR_IM_16] = n[0];
    csl_mask_lower(n[0], m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_2_CHOUT_TPL_9], 8);
    m_n[ZC_S_ZC_S_15] = n[0];
    csl_mask_lower(n[0], m_n[RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_1_VOUT_TPL_9], 1);
    m_n[ZV_S_ZV_S_14] = n[0];
}

void demo_fft_FFT_4K::execute_segment_update()
{
    
}

const size_t demo_fft_FFT_4K::GND_GND_Q_0 = 0;
const size_t demo_fft_FFT_4K::FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_7 = 10;
const size_t demo_fft_FFT_4K::FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_7 = 11;
const size_t demo_fft_FFT_4K::FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_7 = 12;
const size_t demo_fft_FFT_4K::RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_1_VOUT_TPL_8 = 13;
const size_t demo_fft_FFT_4K::RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_2_CHOUT_TPL_8 = 14;
const size_t demo_fft_FFT_4K::RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_8 = 15;
const size_t demo_fft_FFT_4K::RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_3_REAL_DOUT_TPL_8 = 16;
const size_t demo_fft_FFT_4K::RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_4_NSC_OUT_TPL_8 = 17;
const size_t demo_fft_FFT_4K::RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_5_SIZE_OUT_TPL_8 = 18;
const size_t demo_fft_FFT_4K::RXGAINCOMP_CUNROLL_X_RXGAINCOMP_CUNROLL_X_OUT_6_TIME_OUT_TPL_8 = 19;
const size_t demo_fft_FFT_4K::VCC_VCC_Q_1 = 1;
const size_t demo_fft_FFT_4K::RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_1_VOUT_TPL_9 = 20;
const size_t demo_fft_FFT_4K::RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_2_CHOUT_TPL_9 = 21;
const size_t demo_fft_FFT_4K::RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_IMAG_DOUT_TPL_9 = 22;
const size_t demo_fft_FFT_4K::RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_3_REAL_DOUT_TPL_9 = 23;
const size_t demo_fft_FFT_4K::RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_4_SIZE_OUT_TPL_9 = 24;
const size_t demo_fft_FFT_4K::RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_5_NSC_OUT_TPL_9 = 25;
const size_t demo_fft_FFT_4K::RXSCALING_CUNROLL_X_RXSCALING_CUNROLL_X_OUT_6_TIME_OUT_TPL_9 = 26;
const size_t demo_fft_FFT_4K::XV_S_XV_S_XV_S_10 = 27;
const size_t demo_fft_FFT_4K::XC_S_XC_S_XC_S_11 = 28;
const size_t demo_fft_FFT_4K::XR_IM_XR_IM_XR_IM_12 = 29;
const size_t demo_fft_FFT_4K::CONST_RSRVD_FIX_CONST_RSRVD_FIX_Q_2 = 2;
const size_t demo_fft_FFT_4K::XR_RE_XR_RE_XR_RE_13 = 30;
const size_t demo_fft_FFT_4K::YR_RE_YR_RE_21 = 31;
const size_t demo_fft_FFT_4K::YR_IM_YR_IM_20 = 32;
const size_t demo_fft_FFT_4K::YC_S_YC_S_19 = 33;
const size_t demo_fft_FFT_4K::YV_S_YV_S_18 = 34;
const size_t demo_fft_FFT_4K::ZR_RE_ZR_RE_17 = 35;
const size_t demo_fft_FFT_4K::ZR_IM_ZR_IM_16 = 36;
const size_t demo_fft_FFT_4K::ZC_S_ZC_S_15 = 37;
const size_t demo_fft_FFT_4K::ZV_S_ZV_S_14 = 38;
const size_t demo_fft_FFT_4K::CONST1_CONST1_Q_3 = 3;
const size_t demo_fft_FFT_4K::CONST3_CONST3_Q_5 = 4;
const size_t demo_fft_FFT_4K::BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_6 = 5;
const size_t demo_fft_FFT_4K::BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_6 = 6;
const size_t demo_fft_FFT_4K::BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_6 = 7;
const size_t demo_fft_FFT_4K::BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_6 = 8;
const size_t demo_fft_FFT_4K::FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_7 = 9;

