// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#include "phase_comp_phase_comp_ComplexMixer.h"

void phase_comp_phase_comp_ComplexMixer::reset()
{
    csl_fill_n(m_n, 24, 0);
    csl_fill_n(m_io_cycle, 10, -1);
    m_phase_comp_phase_comp_ComplexMixer_ComplexMixer_inst0.reset();
    m_phase_comp_phase_comp_ComplexMixer_Scalei_inst0.reset();
    m_phase_comp_phase_comp_ComplexMixer_Scaleq_inst0.reset();
    csl_fill_n(m_segment_cycle, 7, -1);
    m_update_cycle = -1;
#ifdef WRITE_STM_FILES
    m_stm_in_1_imag_din1_tpl.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_qIn.stm");
    m_stm_in_1_real_din1_tpl.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_iIn.stm");
    m_stm_in_2_vin_tpl.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_iIn.stm");
    m_stm_in_3_cin_tpl.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_iIn.stm");
    m_stm_in_4_sin_tpl.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_sIn.stm");
    m_stm_in_5_cos_tpl.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_cIn.stm");
    m_stm_out_1_imag_dout1_tpl.open("phase_comp_phase_comp_ComplexMixer_Scaleq_qOut.stm");
    m_stm_out_1_real_dout1_tpl.open("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
    m_stm_out_2_vout_tpl.open("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
    m_stm_out_3_cout_tpl.open("phase_comp_phase_comp_ComplexMixer_Scalei_qOut.stm");
#endif
}

void phase_comp_phase_comp_ComplexMixer::execute_segment_0()
{
    int64_t n[2] = { 0 };
    // StepModelRead
    {
        phase_comp_phase_comp_ComplexMixer_Scalei::io_struct_qOut bbReaderStruct_0;
        m_phase_comp_phase_comp_ComplexMixer_Scalei_inst0.read(bbReaderStruct_0);
        m_n[SCALEI_SCALEI_QOUT_0_4] = 0;
        csl_memcpy(&m_n[SCALEI_SCALEI_QOUT_0_4], &bbReaderStruct_0.port_0, 2);
        m_n[SCALEI_SCALEI_QOUT_V_4] = 0;
        csl_memcpy(&m_n[SCALEI_SCALEI_QOUT_V_4], &bbReaderStruct_0.port_v, 1);
        m_n[SCALEI_SCALEI_QOUT_C_4] = 0;
        csl_memcpy(&m_n[SCALEI_SCALEI_QOUT_C_4], &bbReaderStruct_0.port_c, 1);
        m_n[SCALEI_SCALEI_EOUT_0_4] = 0;
        csl_memcpy(&m_n[SCALEI_SCALEI_EOUT_0_4], &bbReaderStruct_0.port_eout_0, 1);
    }
    csl_mask_lower(n[0], m_n[SCALEI_SCALEI_QOUT_C_4], 8);
    m_n[OUT_3_COUT_TPL_OUT_3_COUT_TPL_15] = n[0];
    csl_mask_lower(n[0], m_n[SCALEI_SCALEI_QOUT_V_4], 1);
    m_n[OUT_2_VOUT_TPL_OUT_2_VOUT_TPL_14] = n[0];
    csl_step_reduce(n[0], m_n[SCALEI_SCALEI_QOUT_0_4], 16);
    m_n[OUT_1_REAL_DOUT1_TPL_OUT_1_REAL_DOUT1_TPL_13] = n[0];
    // StepModelRead
    {
        phase_comp_phase_comp_ComplexMixer_Scaleq::io_struct_qOut bbReaderStruct_1;
        m_phase_comp_phase_comp_ComplexMixer_Scaleq_inst0.read(bbReaderStruct_1);
        m_n[SCALEQ_SCALEQ_QOUT_0_5] = 0;
        csl_memcpy(&m_n[SCALEQ_SCALEQ_QOUT_0_5], &bbReaderStruct_1.port_0, 2);
        m_n[SCALEQ_SCALEQ_QOUT_V_5] = 0;
        csl_memcpy(&m_n[SCALEQ_SCALEQ_QOUT_V_5], &bbReaderStruct_1.port_v, 1);
        m_n[SCALEQ_SCALEQ_QOUT_C_5] = 0;
        csl_memcpy(&m_n[SCALEQ_SCALEQ_QOUT_C_5], &bbReaderStruct_1.port_c, 1);
        m_n[SCALEQ_SCALEQ_EOUT_0_5] = 0;
        csl_memcpy(&m_n[SCALEQ_SCALEQ_EOUT_0_5], &bbReaderStruct_1.port_eout_0, 1);
    }
    csl_step_reduce(n[0], m_n[SCALEQ_SCALEQ_QOUT_0_5], 16);
    m_n[OUT_1_IMAG_DOUT1_TPL_OUT_1_IMAG_DOUT1_TPL_12] = n[0];
    csl_set(m_n[VCC_VCC_Q_1], 1); // set constant
    // StepModelRead
    {
        phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_iOut bbReaderStruct_2;
        m_phase_comp_phase_comp_ComplexMixer_ComplexMixer_inst0.read(bbReaderStruct_2);
        m_n[COMPLEXMIXER_COMPLEXMIXER_IOUT_0_2] = 0;
        csl_memcpy(&m_n[COMPLEXMIXER_COMPLEXMIXER_IOUT_0_2], &bbReaderStruct_2.port_0, 8);
        m_n[COMPLEXMIXER_COMPLEXMIXER_OUT_V_2] = 0;
        csl_memcpy(&m_n[COMPLEXMIXER_COMPLEXMIXER_OUT_V_2], &bbReaderStruct_2.port_out_v, 1);
        m_n[COMPLEXMIXER_COMPLEXMIXER_OUT_C_2] = 0;
        csl_memcpy(&m_n[COMPLEXMIXER_COMPLEXMIXER_OUT_C_2], &bbReaderStruct_2.port_out_c, 1);
    }
    // StepModelRead
    {
        phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_qOut bbReaderStruct_3;
        m_phase_comp_phase_comp_ComplexMixer_ComplexMixer_inst0.read(bbReaderStruct_3);
        m_n[COMPLEXMIXER_COMPLEXMIXER_QOUT_0_2] = 0;
        csl_memcpy(&m_n[COMPLEXMIXER_COMPLEXMIXER_QOUT_0_2], &bbReaderStruct_3.port_0, 8);
    }
}

void phase_comp_phase_comp_ComplexMixer::execute_segment_1()
{
    
}

void phase_comp_phase_comp_ComplexMixer::execute_segment_2()
{
    
}

void phase_comp_phase_comp_ComplexMixer::execute_segment_3()
{
    
}

void phase_comp_phase_comp_ComplexMixer::execute_segment_4()
{
    
}

void phase_comp_phase_comp_ComplexMixer::execute_segment_5()
{
    
}

void phase_comp_phase_comp_ComplexMixer::execute_segment_6()
{
    
}

void phase_comp_phase_comp_ComplexMixer::execute_segment_update()
{
    int64_t n[2] = { 0 };
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer_Scalei::io_struct_xIn bbWriteStruct_0;
        csl_memcpy(&bbWriteStruct_0.port_0, &m_n[COMPLEXMIXER_COMPLEXMIXER_IOUT_0_2], 8);
        csl_memcpy(&bbWriteStruct_0.port_v, &m_n[COMPLEXMIXER_COMPLEXMIXER_OUT_V_2], 1);
        csl_memcpy(&bbWriteStruct_0.port_c, &m_n[COMPLEXMIXER_COMPLEXMIXER_OUT_C_2], 1);
        csl_memcpy(&bbWriteStruct_0.port_gain_i, &m_n[VCC_VCC_Q_1], 1);
        m_phase_comp_phase_comp_ComplexMixer_Scalei_inst0.write(bbWriteStruct_0);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer_Scaleq::io_struct_xIn bbWriteStruct_1;
        csl_memcpy(&bbWriteStruct_1.port_0, &m_n[COMPLEXMIXER_COMPLEXMIXER_QOUT_0_2], 8);
        csl_memcpy(&bbWriteStruct_1.port_v, &m_n[COMPLEXMIXER_COMPLEXMIXER_OUT_V_2], 1);
        csl_memcpy(&bbWriteStruct_1.port_c, &m_n[COMPLEXMIXER_COMPLEXMIXER_OUT_C_2], 1);
        csl_memcpy(&bbWriteStruct_1.port_gain_i, &m_n[VCC_VCC_Q_1], 1);
        m_phase_comp_phase_comp_ComplexMixer_Scaleq_inst0.write(bbWriteStruct_1);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_cIn bbWriteStruct_2;
        csl_memcpy(&bbWriteStruct_2.port_0, &m_n[IN_5_COS_TPL_IN_5_COS_TPL_IN_5_COS_TPL_11], 4);
        m_phase_comp_phase_comp_ComplexMixer_ComplexMixer_inst0.write(bbWriteStruct_2);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_iIn bbWriteStruct_3;
        csl_memcpy(&bbWriteStruct_3.port_0, &m_n[IN_1_REAL_DIN1_TPL_IN_1_REAL_DIN1_TPL_IN_1_REAL_DIN1_TPL_7], 2);
        csl_memcpy(&bbWriteStruct_3.port_in_v, &m_n[IN_2_VIN_TPL_IN_2_VIN_TPL_IN_2_VIN_TPL_8], 1);
        csl_memcpy(&bbWriteStruct_3.port_in_c, &m_n[IN_3_CIN_TPL_IN_3_CIN_TPL_IN_3_CIN_TPL_9], 1);
        m_phase_comp_phase_comp_ComplexMixer_ComplexMixer_inst0.write(bbWriteStruct_3);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_qIn bbWriteStruct_4;
        csl_memcpy(&bbWriteStruct_4.port_0, &m_n[IN_1_IMAG_DIN1_TPL_IN_1_IMAG_DIN1_TPL_IN_1_IMAG_DIN1_TPL_6], 2);
        m_phase_comp_phase_comp_ComplexMixer_ComplexMixer_inst0.write(bbWriteStruct_4);
    }
    // StepModelWrite
    {
        phase_comp_phase_comp_ComplexMixer_ComplexMixer::io_struct_sIn bbWriteStruct_5;
        csl_memcpy(&bbWriteStruct_5.port_0, &m_n[IN_4_SIN_TPL_IN_4_SIN_TPL_IN_4_SIN_TPL_10], 4);
        m_phase_comp_phase_comp_ComplexMixer_ComplexMixer_inst0.write(bbWriteStruct_5);
    }
}

const size_t phase_comp_phase_comp_ComplexMixer::GND_GND_Q_0 = 0;
const size_t phase_comp_phase_comp_ComplexMixer::SCALEQ_SCALEQ_QOUT_0_5 = 10;
const size_t phase_comp_phase_comp_ComplexMixer::SCALEQ_SCALEQ_QOUT_V_5 = 11;
const size_t phase_comp_phase_comp_ComplexMixer::SCALEQ_SCALEQ_QOUT_C_5 = 12;
const size_t phase_comp_phase_comp_ComplexMixer::SCALEQ_SCALEQ_EOUT_0_5 = 13;
const size_t phase_comp_phase_comp_ComplexMixer::IN_1_IMAG_DIN1_TPL_IN_1_IMAG_DIN1_TPL_IN_1_IMAG_DIN1_TPL_6 = 14;
const size_t phase_comp_phase_comp_ComplexMixer::IN_1_REAL_DIN1_TPL_IN_1_REAL_DIN1_TPL_IN_1_REAL_DIN1_TPL_7 = 15;
const size_t phase_comp_phase_comp_ComplexMixer::IN_2_VIN_TPL_IN_2_VIN_TPL_IN_2_VIN_TPL_8 = 16;
const size_t phase_comp_phase_comp_ComplexMixer::IN_3_CIN_TPL_IN_3_CIN_TPL_IN_3_CIN_TPL_9 = 17;
const size_t phase_comp_phase_comp_ComplexMixer::IN_4_SIN_TPL_IN_4_SIN_TPL_IN_4_SIN_TPL_10 = 18;
const size_t phase_comp_phase_comp_ComplexMixer::IN_5_COS_TPL_IN_5_COS_TPL_IN_5_COS_TPL_11 = 19;
const size_t phase_comp_phase_comp_ComplexMixer::VCC_VCC_Q_1 = 1;
const size_t phase_comp_phase_comp_ComplexMixer::OUT_3_COUT_TPL_OUT_3_COUT_TPL_15 = 20;
const size_t phase_comp_phase_comp_ComplexMixer::OUT_2_VOUT_TPL_OUT_2_VOUT_TPL_14 = 21;
const size_t phase_comp_phase_comp_ComplexMixer::OUT_1_REAL_DOUT1_TPL_OUT_1_REAL_DOUT1_TPL_13 = 22;
const size_t phase_comp_phase_comp_ComplexMixer::OUT_1_IMAG_DOUT1_TPL_OUT_1_IMAG_DOUT1_TPL_12 = 23;
const size_t phase_comp_phase_comp_ComplexMixer::COMPLEXMIXER_COMPLEXMIXER_IOUT_0_2 = 2;
const size_t phase_comp_phase_comp_ComplexMixer::COMPLEXMIXER_COMPLEXMIXER_QOUT_0_2 = 3;
const size_t phase_comp_phase_comp_ComplexMixer::COMPLEXMIXER_COMPLEXMIXER_OUT_V_2 = 4;
const size_t phase_comp_phase_comp_ComplexMixer::COMPLEXMIXER_COMPLEXMIXER_OUT_C_2 = 5;
const size_t phase_comp_phase_comp_ComplexMixer::SCALEI_SCALEI_QOUT_0_4 = 6;
const size_t phase_comp_phase_comp_ComplexMixer::SCALEI_SCALEI_QOUT_V_4 = 7;
const size_t phase_comp_phase_comp_ComplexMixer::SCALEI_SCALEI_QOUT_C_4 = 8;
const size_t phase_comp_phase_comp_ComplexMixer::SCALEI_SCALEI_EOUT_0_4 = 9;

