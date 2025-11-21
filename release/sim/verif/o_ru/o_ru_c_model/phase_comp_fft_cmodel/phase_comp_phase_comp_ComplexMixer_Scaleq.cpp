// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-19 18:12:09
// ------------------------------------------------------------------------- 
#include "phase_comp_phase_comp_ComplexMixer_Scaleq.h"

void phase_comp_phase_comp_ComplexMixer_Scaleq::reset()
{
    csl_fill_n(m_n, 67, 0);
    csl_fill_n(m_io_cycle, 2, -1);
    csl_fill_n(m_segment_cycle, 2, -1);
    m_update_cycle = -1;
#ifdef WRITE_STM_FILES
    m_stm_qout.open("phase_comp_phase_comp_ComplexMixer_Scaleq_qOut.stm");
    m_stm_xin.open("phase_comp_phase_comp_ComplexMixer_Scaleq_xIn.stm");
#endif
}

void phase_comp_phase_comp_ComplexMixer_Scaleq::execute_segment_0()
{
    int64_t n[4] = { 0 };
    csl_set(m_n[VCC_VCC_Q_1], 1); // set constant
    m_n[U0_RND_ADD_P3_OF_3_U0_RND_ADD_P3_OF_3_Q_22] = m_n[U0_RND_ADD_P3_OF_3_PIPELINE_STATE_0_22];
    m_n[U0_RND_ADD_P3_OF_3_U0_RND_ADD_P3_OF_3_C_22] = m_n[U0_RND_ADD_P3_OF_3_PIPELINE_STATE_1_22];
    m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_REDIST2_U0_RND_ADD_P2_OF_3_Q_1_Q_80] = m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_OUT_80];
    m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_REDIST3_U0_RND_ADD_P1_OF_3_Q_2_Q_81] = m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_OUT_81];
    csl_step_reduce(n[0], m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_REDIST3_U0_RND_ADD_P1_OF_3_Q_2_Q_81], 10);
    csl_step_reduce(n[1], m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_REDIST2_U0_RND_ADD_P2_OF_3_Q_1_Q_80], 10);
    csl_step_reduce(n[2], m_n[U0_RND_ADD_P3_OF_3_U0_RND_ADD_P3_OF_3_Q_22], 1);
    csl_step_bit_combine(m_n[U0_RND_ADD_BITJOIN_FOR_Q_U0_RND_ADD_BITJOIN_FOR_Q_Q_23], n[0], n[1], 3, 1, 10, 20);
    csl_step_bit_combine(m_n[U0_RND_ADD_BITJOIN_FOR_Q_U0_RND_ADD_BITJOIN_FOR_Q_Q_23], m_n[U0_RND_ADD_BITJOIN_FOR_Q_U0_RND_ADD_BITJOIN_FOR_Q_Q_23], n[2], 3, 2, 20, 0);
    csl_step_reduce(n[0], m_n[U0_RND_ADD_BITJOIN_FOR_Q_U0_RND_ADD_BITJOIN_FOR_Q_Q_23], 21);
    csl_step_shift_right(m_n[U0_RND_SHIFT_U0_RND_SHIFT_Q_10], n[0], 1);
    m_n[REDIST5_XIN_C_3_REDIST5_XIN_C_3_Q_83] = m_n[REDIST5_XIN_C_3_DELAY_OUT_83];
    m_n[REDIST4_XIN_V_3_REDIST4_XIN_V_3_Q_82] = m_n[REDIST4_XIN_V_3_DELAY_OUT_82];
    csl_mask_lower(n[0], m_n[REDIST4_XIN_V_3_REDIST4_XIN_V_3_Q_82], 1);
    csl_mask_lower(n[1], m_n[REDIST5_XIN_C_3_REDIST5_XIN_C_3_Q_83], 8);
    csl_step_reduce(n[2], m_n[U0_RND_SHIFT_U0_RND_SHIFT_Q_10], 16);
    csl_step_reduce(n[3], m_n[VCC_VCC_Q_1], 1);
    m_n[QOUT_V_6] = n[0];
    m_n[QOUT_C_6] = n[1];
    m_n[QOUT_0_6] = n[2];
    m_n[QOUT_EOUT_0_6] = n[3];
    m_n[U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_Q_21] = m_n[U0_RND_ADD_P2_OF_3_PIPELINE_STATE_0_21];
    m_n[U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_C_21] = m_n[U0_RND_ADD_P2_OF_3_PIPELINE_STATE_1_21];
    csl_set(m_n[GND_GND_Q_0], 0); // set constant
    m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_Q_78] = m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_OUT_78];
    csl_step_reduce(n[0], m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_Q_78], 1);
    m_n[U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_D_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_D_Q_29] = n[0];
    m_n[U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_Q_20] = m_n[U0_RND_ADD_P1_OF_3_PIPELINE_STATE_0_20];
    m_n[U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_C_20] = m_n[U0_RND_ADD_P1_OF_3_PIPELINE_STATE_1_20];
    csl_set(m_n[U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_C_Q_CONST_U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_C_Q_CONST_Q_75], 0); // set constant
    m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_Q_79] = m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_OUT_79];
    csl_step_reduce(n[0], m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_Q_79], 10);
    m_n[U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_C_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_C_Q_27] = n[0];
    csl_set(m_n[U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_B_Q_CONST_U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_B_Q_CONST_Q_64], 1); // set constant
}

void phase_comp_phase_comp_ComplexMixer_Scaleq::execute_segment_1()
{
    int64_t n[1] = { 0 };
    csl_step_reduce(n[0], m_n[XIN_XIN_0_2], 35);
    csl_step_shift_right(m_n[U0_SHIFTSEL_U0_SHIFTSEL_Q_4], n[0], 0);
    csl_step_reduce(n[0], m_n[U0_SHIFTSEL_U0_SHIFTSEL_Q_4], 35);
    csl_step_shift_right(m_n[U0_RND_TRUNC_U0_RND_TRUNC_Q_8], n[0], 15);
    csl_step_reduce(n[0], m_n[U0_RND_TRUNC_U0_RND_TRUNC_Q_8], 20);
    csl_step_bit_extract(m_n[U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_28], n[0], 1, true, 19);
    csl_step_reduce(n[0], m_n[U0_RND_TRUNC_U0_RND_TRUNC_Q_8], 20);
    csl_step_bit_extract(m_n[U0_RND_ADD_BITSELECT_FOR_A_TESSEL0_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL0_0_B_24], n[0], 10, true, 0);
    csl_step_reduce(n[0], m_n[U0_RND_ADD_BITSELECT_FOR_A_TESSEL0_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL0_0_B_24], 10);
    m_n[U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_B_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_B_Q_25] = n[0];
    csl_step_reduce(n[0], m_n[U0_RND_TRUNC_U0_RND_TRUNC_Q_8], 20);
    csl_step_bit_extract(m_n[U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_26], n[0], 10, true, 10);
}

void phase_comp_phase_comp_ComplexMixer_Scaleq::execute_segment_update()
{
    int64_t n[5] = { 0 };
    csl_step_reduce(n[0], m_n[U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_D_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_D_Q_29], 1);
    csl_step_reduce(n[1], m_n[GND_GND_Q_0], 1);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[3], m_n[U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_C_21], 1);
    if (n[2] != 0)
    {
        csl_step_add(n[4], n[1], n[3]);
    }
    if (n[2] != 0)
    {
        csl_step_add(m_n[U0_RND_ADD_P3_OF_3_PIPELINE_STATE_0_22], n[0], n[4]);
    }
    if (n[2] != 0)
    {
        csl_step_sign_bit(m_n[U0_RND_ADD_P3_OF_3_PIPELINE_STATE_1_22], m_n[U0_RND_ADD_P3_OF_3_PIPELINE_STATE_0_22], 2);
    }
    csl_step_reduce(n[0], m_n[U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_Q_21], 10);
    csl_step_reduce(n[1], m_n[VCC_VCC_Q_1], 1);
    if (m_n[VCC_VCC_Q_1] != 0)
    {
        m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_STATE_0_80 + m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_IDX_80]] = m_n[U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_Q_21];
        m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_IDX_80] = (m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_IDX_80] + 1) % 1;
        m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_OUT_80] = m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_STATE_0_80 + m_n[REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_IDX_80]];
    }
    csl_step_reduce(n[0], m_n[U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_Q_20], 10);
    csl_step_reduce(n[1], m_n[VCC_VCC_Q_1], 1);
    if (m_n[VCC_VCC_Q_1] != 0)
    {
        m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_STATE_0_81 + m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_IDX_81]] = m_n[U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_Q_20];
        m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_IDX_81] = (m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_IDX_81] + 1) % 2;
        m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_OUT_81] = m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_STATE_0_81 + m_n[REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_IDX_81]];
    }
    csl_step_reduce(n[0], m_n[XIN_XIN_C_2], 8);
    csl_step_reduce(n[1], m_n[VCC_VCC_Q_1], 1);
    if (m_n[VCC_VCC_Q_1] != 0)
    {
        m_n[REDIST5_XIN_C_3_DELAY_STATE_0_83 + m_n[REDIST5_XIN_C_3_DELAY_IDX_83]] = m_n[XIN_XIN_C_2];
        m_n[REDIST5_XIN_C_3_DELAY_IDX_83] = (m_n[REDIST5_XIN_C_3_DELAY_IDX_83] + 1) % 3;
        m_n[REDIST5_XIN_C_3_DELAY_OUT_83] = m_n[REDIST5_XIN_C_3_DELAY_STATE_0_83 + m_n[REDIST5_XIN_C_3_DELAY_IDX_83]];
    }
    csl_step_reduce(n[0], m_n[XIN_XIN_V_2], 1);
    csl_step_reduce(n[1], m_n[VCC_VCC_Q_1], 1);
    if (m_n[VCC_VCC_Q_1] != 0)
    {
        m_n[REDIST4_XIN_V_3_DELAY_STATE_0_82 + m_n[REDIST4_XIN_V_3_DELAY_IDX_82]] = m_n[XIN_XIN_V_2];
        m_n[REDIST4_XIN_V_3_DELAY_IDX_82] = (m_n[REDIST4_XIN_V_3_DELAY_IDX_82] + 1) % 3;
        m_n[REDIST4_XIN_V_3_DELAY_OUT_82] = m_n[REDIST4_XIN_V_3_DELAY_STATE_0_82 + m_n[REDIST4_XIN_V_3_DELAY_IDX_82]];
    }
    csl_mask_lower(n[0], m_n[U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_C_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_C_Q_27], 10);
    csl_mask_lower(n[1], m_n[U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_C_Q_CONST_U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_C_Q_CONST_Q_75], 10);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[3], m_n[U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_C_20], 1);
    if (n[2] != 0)
    {
        csl_step_add(n[4], n[1], n[3]);
    }
    if (n[2] != 0)
    {
        csl_step_add(m_n[U0_RND_ADD_P2_OF_3_PIPELINE_STATE_0_21], n[0], n[4]);
    }
    if (n[2] != 0)
    {
        csl_step_sign_bit(m_n[U0_RND_ADD_P2_OF_3_PIPELINE_STATE_1_21], m_n[U0_RND_ADD_P2_OF_3_PIPELINE_STATE_0_21], 11);
    }
    csl_step_reduce(n[0], m_n[U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_28], 1);
    csl_step_reduce(n[1], m_n[VCC_VCC_Q_1], 1);
    if (m_n[VCC_VCC_Q_1] != 0)
    {
        m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_STATE_0_78 + m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_IDX_78]] = m_n[U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_28];
        m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_IDX_78] = (m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_IDX_78] + 1) % 2;
        m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_OUT_78] = m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_STATE_0_78 + m_n[REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_IDX_78]];
    }
    csl_mask_lower(n[0], m_n[U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_B_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_B_Q_25], 10);
    csl_mask_lower(n[1], m_n[U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_B_Q_CONST_U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_B_Q_CONST_Q_64], 10);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[3], m_n[GND_GND_Q_0], 1);
    if (n[2] != 0)
    {
        csl_step_add(n[4], n[1], n[3]);
    }
    if (n[2] != 0)
    {
        csl_step_add(m_n[U0_RND_ADD_P1_OF_3_PIPELINE_STATE_0_20], n[0], n[4]);
    }
    if (n[2] != 0)
    {
        csl_step_sign_bit(m_n[U0_RND_ADD_P1_OF_3_PIPELINE_STATE_1_20], m_n[U0_RND_ADD_P1_OF_3_PIPELINE_STATE_0_20], 11);
    }
    csl_step_reduce(n[0], m_n[U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_26], 10);
    csl_step_reduce(n[1], m_n[VCC_VCC_Q_1], 1);
    if (m_n[VCC_VCC_Q_1] != 0)
    {
        m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_STATE_0_79 + m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_IDX_79]] = m_n[U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_26];
        m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_IDX_79] = (m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_IDX_79] + 1) % 1;
        m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_OUT_79] = m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_STATE_0_79 + m_n[REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_IDX_79]];
    }
}

const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::GND_GND_Q_0 = 0;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_Q_21 = 10;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P3_OF_3_U0_RND_ADD_P3_OF_3_Q_22 = 11;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_C_20 = 12;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P2_OF_3_U0_RND_ADD_P2_OF_3_C_21 = 13;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P3_OF_3_U0_RND_ADD_P3_OF_3_C_22 = 14;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITJOIN_FOR_Q_U0_RND_ADD_BITJOIN_FOR_Q_Q_23 = 15;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITSELECT_FOR_A_TESSEL0_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL0_0_B_24 = 16;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_B_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_B_Q_25 = 17;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_26 = 18;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_C_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_C_Q_27 = 19;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::VCC_VCC_Q_1 = 1;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_28 = 20;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_D_U0_RND_ADD_BITSELECT_FOR_A_BITJOIN_FOR_D_Q_29 = 21;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_B_Q_CONST_U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_B_Q_CONST_Q_64 = 22;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_C_Q_CONST_U0_RND_ADD_BITSELECT_FOR_B_BITJOIN_FOR_C_Q_CONST_Q_75 = 23;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_Q_78 = 24;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_Q_79 = 25;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST2_U0_RND_ADD_P2_OF_3_Q_1_REDIST2_U0_RND_ADD_P2_OF_3_Q_1_Q_80 = 26;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST3_U0_RND_ADD_P1_OF_3_Q_2_REDIST3_U0_RND_ADD_P1_OF_3_Q_2_Q_81 = 27;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST4_XIN_V_3_REDIST4_XIN_V_3_Q_82 = 28;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST5_XIN_C_3_REDIST5_XIN_C_3_Q_83 = 29;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::XIN_XIN_0_2 = 2;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P3_OF_3_PIPELINE_STATE_0_22 = 30;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P3_OF_3_PIPELINE_STATE_1_22 = 31;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P3_OF_3_PIPELINE_OUTPUT_TEMP_22 = 32;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_OUT_80 = 33;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_IDX_80 = 34;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST2_U0_RND_ADD_P2_OF_3_Q_1_DELAY_STATE_0_80 = 35;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_OUT_81 = 36;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_IDX_81 = 37;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_STATE_0_81 = 38;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST3_U0_RND_ADD_P1_OF_3_Q_2_DELAY_STATE_1_81 = 39;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::XIN_XIN_GAIN_I_2 = 3;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST5_XIN_C_3_DELAY_OUT_83 = 40;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST5_XIN_C_3_DELAY_IDX_83 = 41;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST5_XIN_C_3_DELAY_STATE_0_83 = 42;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST5_XIN_C_3_DELAY_STATE_1_83 = 43;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST5_XIN_C_3_DELAY_STATE_2_83 = 44;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST4_XIN_V_3_DELAY_OUT_82 = 45;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST4_XIN_V_3_DELAY_IDX_82 = 46;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST4_XIN_V_3_DELAY_STATE_0_82 = 47;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST4_XIN_V_3_DELAY_STATE_1_82 = 48;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST4_XIN_V_3_DELAY_STATE_2_82 = 49;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::XIN_XIN_V_2 = 4;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::QOUT_V_6 = 50;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::QOUT_C_6 = 51;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::QOUT_0_6 = 52;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::QOUT_EOUT_0_6 = 53;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P2_OF_3_PIPELINE_STATE_0_21 = 54;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P2_OF_3_PIPELINE_STATE_1_21 = 55;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P2_OF_3_PIPELINE_OUTPUT_TEMP_21 = 56;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_OUT_78 = 57;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_IDX_78 = 58;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_STATE_0_78 = 59;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::XIN_XIN_C_2 = 5;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST0_U0_RND_ADD_BITSELECT_FOR_A_TESSEL2_0_B_2_DELAY_STATE_1_78 = 60;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P1_OF_3_PIPELINE_STATE_0_20 = 61;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P1_OF_3_PIPELINE_STATE_1_20 = 62;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P1_OF_3_PIPELINE_OUTPUT_TEMP_20 = 63;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_OUT_79 = 64;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_IDX_79 = 65;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::REDIST1_U0_RND_ADD_BITSELECT_FOR_A_TESSEL1_0_B_1_DELAY_STATE_0_79 = 66;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_SHIFTSEL_U0_SHIFTSEL_Q_4 = 6;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_SHIFT_U0_RND_SHIFT_Q_10 = 7;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_TRUNC_U0_RND_TRUNC_Q_8 = 8;
const size_t phase_comp_phase_comp_ComplexMixer_Scaleq::U0_RND_ADD_P1_OF_3_U0_RND_ADD_P1_OF_3_Q_20 = 9;

