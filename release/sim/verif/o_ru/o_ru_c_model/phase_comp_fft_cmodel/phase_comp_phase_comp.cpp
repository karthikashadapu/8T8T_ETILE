// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 18:12:09
// ------------------------------------------------------------------------- 
#include "phase_comp_phase_comp.h"

void phase_comp_phase_comp::reset()
{
    csl_fill_n(m_n, 28, 0);
    csl_fill_n(m_io_cycle, 9, -1);
    m_phase_comp_phase_comp_ComplexMixer_inst0.reset();
    m_phase_comp_phase_comp_PhasorGenerate_inst0.reset();
    csl_fill_n(m_segment_cycle, 7, -1);
    m_update_cycle = -1;
}

void phase_comp_phase_comp::execute_segment_0()
{
    int64_t n[2] = { 0 };
    // StepModelRead
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_out_1_real_dout1_tpl bbReaderStruct_0;
        m_phase_comp_phase_comp_ComplexMixer_inst0.read(bbReaderStruct_0);
        m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_8] = 0;
        csl_memcpy(&m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_8], &bbReaderStruct_0.port_out_1_real_dout1_tpl, 2);
    }
    csl_step_reduce(n[0], m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_8], 16);
    m_n[JR_RE_JR_RE_18] = n[0];
    // StepModelRead
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_out_1_imag_dout1_tpl bbReaderStruct_1;
        m_phase_comp_phase_comp_ComplexMixer_inst0.read(bbReaderStruct_1);
        m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_8] = 0;
        csl_memcpy(&m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_8], &bbReaderStruct_1.port_out_1_imag_dout1_tpl, 2);
    }
    csl_step_reduce(n[0], m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_8], 16);
    m_n[JR_IM_JR_IM_17] = n[0];
    // StepModelRead
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_out_3_cout_tpl bbReaderStruct_2;
        m_phase_comp_phase_comp_ComplexMixer_inst0.read(bbReaderStruct_2);
        m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_3_COUT_TPL_8] = 0;
        csl_memcpy(&m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_3_COUT_TPL_8], &bbReaderStruct_2.port_out_3_cout_tpl, 1);
    }
    csl_mask_lower(n[0], m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_3_COUT_TPL_8], 8);
    m_n[JC_S_JC_S_16] = n[0];
    // StepModelRead
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_out_2_vout_tpl bbReaderStruct_3;
        m_phase_comp_phase_comp_ComplexMixer_inst0.read(bbReaderStruct_3);
        m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_2_VOUT_TPL_8] = 0;
        csl_memcpy(&m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_2_VOUT_TPL_8], &bbReaderStruct_3.port_out_2_vout_tpl, 1);
    }
    csl_mask_lower(n[0], m_n[COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_2_VOUT_TPL_8], 1);
    m_n[JV_S_JV_S_15] = n[0];
    csl_set(m_n[CONSTANT_RSRVD_FIX_CONSTANT_RSRVD_FIX_Q_7], 4659422415258910720); // set constant
    csl_set(m_n[CONST7_CONST7_Q_6], 0); // set constant
    csl_set(m_n[CONST4_CONST4_Q_4], 12); // set constant
    csl_set(m_n[VCC_VCC_Q_1], 1); // set constant
    csl_set(m_n[CONST2_CONST2_Q_2], 0); // set constant
}

void phase_comp_phase_comp::execute_segment_1()
{
    
}

void phase_comp_phase_comp::execute_segment_2()
{
    
}

void phase_comp_phase_comp::execute_segment_3()
{
    
}

void phase_comp_phase_comp::execute_segment_4()
{
    
}

void phase_comp_phase_comp::execute_segment_5()
{
    
}

void phase_comp_phase_comp::execute_segment_6()
{
    int64_t n[11] = { 0 };
    csl_mask_lower(n[0], m_n[XV_S_XV_S_XV_S_10], 1);
    csl_mask_lower(n[1], m_n[XC_S_XC_S_XC_S_11], 8);
    csl_step_reduce(n[2], m_n[XR_IM_XR_IM_XR_IM_12], 16);
    csl_step_reduce(n[3], m_n[XR_RE_XR_RE_XR_RE_13], 16);
    csl_step_reduce(n[4], m_n[CONST2_CONST2_Q_2], 16);
    csl_step_reduce(n[5], m_n[CONST2_CONST2_Q_2], 16);
    csl_mask_lower(n[6], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[7], m_n[CONST4_CONST4_Q_4], 4);
    csl_mask_lower(n[8], m_n[CONST7_CONST7_Q_6], 11);
    csl_step_reduce(n[9], m_n[CONSTANT_RSRVD_FIX_CONSTANT_RSRVD_FIX_Q_7], 64);
    csl_mask_lower(n[10], m_n[XD_S_XD_S_XD_S_14], 1);
    // StepModelWrite
    {
        phase_comp_phase_comp_PhasorGenerate::io_struct_ChannelIn bbWriteStruct_0;
        csl_memcpy(&bbWriteStruct_0.port_in_1_v_tpl, &n[0], 1);
        csl_memcpy(&bbWriteStruct_0.port_in_2_c_tpl, &n[1], 1);
        csl_memcpy(&bbWriteStruct_0.port_in_3_imag_d1_tpl, &n[2], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_3_real_d1_tpl, &n[3], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_4_tsym1_tpl, &n[4], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_5_cp_t1_tpl, &n[5], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_6_cp_en1_tpl, &n[6], 1);
        csl_memcpy(&bbWriteStruct_0.port_in_7_fft_size_tpl, &n[7], 1);
        csl_memcpy(&bbWriteStruct_0.port_in_8_cplen_tpl, &n[8], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_9_nsc_tpl, &n[9], 8);
        csl_memcpy(&bbWriteStruct_0.port_in_10_dir_tpl, &n[10], 1);
        m_phase_comp_phase_comp_PhasorGenerate_inst0.write(bbWriteStruct_0);
    }
    // StepModelRead
    {
        phase_comp_phase_comp_PhasorGenerate::io_struct_ChannelOut bbReaderStruct_4;
        m_phase_comp_phase_comp_PhasorGenerate_inst0.read(bbReaderStruct_4);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_9], &bbReaderStruct_4.port_out_1_imag_dout1_tpl, 2);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_9], &bbReaderStruct_4.port_out_1_real_dout1_tpl, 2);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_2_VOUT_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_2_VOUT_TPL_9], &bbReaderStruct_4.port_out_2_vout_tpl, 1);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_3_COUT_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_3_COUT_TPL_9], &bbReaderStruct_4.port_out_3_cout_tpl, 1);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_4_SIN_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_4_SIN_TPL_9], &bbReaderStruct_4.port_out_4_sin_tpl, 4);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_5_COS_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_5_COS_TPL_9], &bbReaderStruct_4.port_out_5_cos_tpl, 4);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_6_FFT_SIZE_OUT_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_6_FFT_SIZE_OUT_TPL_9], &bbReaderStruct_4.port_out_6_fft_size_out_tpl, 1);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_7_CPLENOUT_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_7_CPLENOUT_TPL_9], &bbReaderStruct_4.port_out_7_cplenout_tpl, 2);
        m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_8_NSC_OUT_TPL_9] = 0;
        csl_memcpy(&m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_8_NSC_OUT_TPL_9], &bbReaderStruct_4.port_out_8_nsc_out_tpl, 8);
    }
}

void phase_comp_phase_comp::execute_segment_update()
{
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_in_1_imag_din1_tpl bbWriteStruct_1;
        csl_memcpy(&bbWriteStruct_1.port_in_1_imag_din1_tpl, &m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_9], 2);
        m_phase_comp_phase_comp_ComplexMixer_inst0.write(bbWriteStruct_1);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_in_1_real_din1_tpl bbWriteStruct_2;
        csl_memcpy(&bbWriteStruct_2.port_in_1_real_din1_tpl, &m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_9], 2);
        m_phase_comp_phase_comp_ComplexMixer_inst0.write(bbWriteStruct_2);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_in_2_vin_tpl bbWriteStruct_3;
        csl_memcpy(&bbWriteStruct_3.port_in_2_vin_tpl, &m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_2_VOUT_TPL_9], 1);
        m_phase_comp_phase_comp_ComplexMixer_inst0.write(bbWriteStruct_3);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_in_3_cin_tpl bbWriteStruct_4;
        csl_memcpy(&bbWriteStruct_4.port_in_3_cin_tpl, &m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_3_COUT_TPL_9], 1);
        m_phase_comp_phase_comp_ComplexMixer_inst0.write(bbWriteStruct_4);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_in_4_sin_tpl bbWriteStruct_5;
        csl_memcpy(&bbWriteStruct_5.port_in_4_sin_tpl, &m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_4_SIN_TPL_9], 4);
        m_phase_comp_phase_comp_ComplexMixer_inst0.write(bbWriteStruct_5);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer::io_struct_in_5_cos_tpl bbWriteStruct_6;
        csl_memcpy(&bbWriteStruct_6.port_in_5_cos_tpl, &m_n[PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_5_COS_TPL_9], 4);
        m_phase_comp_phase_comp_ComplexMixer_inst0.write(bbWriteStruct_6);
    }
}

const size_t phase_comp_phase_comp::GND_GND_Q_0 = 0;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_9 = 10;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_9 = 11;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_2_VOUT_TPL_9 = 12;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_3_COUT_TPL_9 = 13;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_4_SIN_TPL_9 = 14;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_5_COS_TPL_9 = 15;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_6_FFT_SIZE_OUT_TPL_9 = 16;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_7_CPLENOUT_TPL_9 = 17;
const size_t phase_comp_phase_comp::PHASORGENERATE_CUNROLL_X_PHASORGENERATE_CUNROLL_X_OUT_8_NSC_OUT_TPL_9 = 18;
const size_t phase_comp_phase_comp::XV_S_XV_S_XV_S_10 = 19;
const size_t phase_comp_phase_comp::VCC_VCC_Q_1 = 1;
const size_t phase_comp_phase_comp::XC_S_XC_S_XC_S_11 = 20;
const size_t phase_comp_phase_comp::XR_IM_XR_IM_XR_IM_12 = 21;
const size_t phase_comp_phase_comp::XR_RE_XR_RE_XR_RE_13 = 22;
const size_t phase_comp_phase_comp::XD_S_XD_S_XD_S_14 = 23;
const size_t phase_comp_phase_comp::JR_RE_JR_RE_18 = 24;
const size_t phase_comp_phase_comp::JR_IM_JR_IM_17 = 25;
const size_t phase_comp_phase_comp::JC_S_JC_S_16 = 26;
const size_t phase_comp_phase_comp::JV_S_JV_S_15 = 27;
const size_t phase_comp_phase_comp::CONST2_CONST2_Q_2 = 2;
const size_t phase_comp_phase_comp::CONST4_CONST4_Q_4 = 3;
const size_t phase_comp_phase_comp::CONST7_CONST7_Q_6 = 4;
const size_t phase_comp_phase_comp::CONSTANT_RSRVD_FIX_CONSTANT_RSRVD_FIX_Q_7 = 5;
const size_t phase_comp_phase_comp::COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_IMAG_DOUT1_TPL_8 = 6;
const size_t phase_comp_phase_comp::COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_1_REAL_DOUT1_TPL_8 = 7;
const size_t phase_comp_phase_comp::COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_2_VOUT_TPL_8 = 8;
const size_t phase_comp_phase_comp::COMPLEXMIXER_CUNROLL_X_COMPLEXMIXER_CUNROLL_X_OUT_3_COUT_TPL_8 = 9;

