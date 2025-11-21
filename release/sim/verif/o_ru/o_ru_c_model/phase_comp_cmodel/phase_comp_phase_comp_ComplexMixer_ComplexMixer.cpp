// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:07:02
// ------------------------------------------------------------------------- 
#include "phase_comp_phase_comp_ComplexMixer_ComplexMixer.h"

void phase_comp_phase_comp_ComplexMixer_ComplexMixer::reset()
{
    csl_fill_n(m_n, 62, 0);
    csl_fill_n(m_io_cycle, 6, -1);
    csl_fill_n(m_segment_cycle, 5, -1);
    m_update_cycle = -1;
#ifdef WRITE_STM_FILES
    m_stm_cin.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_cIn.stm");
    m_stm_iin.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_iIn.stm");
    m_stm_iout.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_iOut.stm");
    m_stm_qin.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_qIn.stm");
    m_stm_qout.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_qOut.stm");
    m_stm_sin.open("phase_comp_phase_comp_ComplexMixer_ComplexMixer_sIn.stm");
#endif
}

void phase_comp_phase_comp_ComplexMixer_ComplexMixer::execute_segment_0()
{
    int64_t n[3] = { 0 };
    m_n[U0_AS_MULT_I_CMA_U0_AS_MULT_I_CMA_Q_10] = m_n[U0_AS_MULT_I_CMA_CMA_STATE_0_0_10];
    m_n[U0_AS_MULT_I_CMA_CMA_STATE_0_0_10] = m_n[U0_AS_MULT_I_CMA_CMA_SUM_0_0_10];
    m_n[D_IIN_IN_C_4_D_IIN_IN_C_4_Q_13] = m_n[D_IIN_IN_C_4_DELAY_OUT_13];
    m_n[D_IIN_IN_V_4_D_IIN_IN_V_4_Q_12] = m_n[D_IIN_IN_V_4_DELAY_OUT_12];
    csl_mask_lower(n[0], m_n[D_IIN_IN_V_4_D_IIN_IN_V_4_Q_12], 1);
    csl_mask_lower(n[1], m_n[D_IIN_IN_C_4_D_IIN_IN_C_4_Q_13], 8);
    csl_step_reduce(n[2], m_n[U0_AS_MULT_I_CMA_U0_AS_MULT_I_CMA_Q_10], 35);
    m_n[IOUT_OUT_V_8] = n[0];
    m_n[IOUT_OUT_C_8] = n[1];
    m_n[IOUT_0_8] = n[2];
    m_n[U0_AS_MULT_Q_CMA_U0_AS_MULT_Q_CMA_Q_11] = m_n[U0_AS_MULT_Q_CMA_CMA_STATE_0_0_11];
    m_n[U0_AS_MULT_Q_CMA_CMA_STATE_0_0_11] = m_n[U0_AS_MULT_Q_CMA_CMA_SUM_0_0_11];
    csl_step_reduce(n[0], m_n[U0_AS_MULT_Q_CMA_U0_AS_MULT_Q_CMA_Q_11], 35);
    m_n[QOUT_0_9] = n[0];
    csl_set(m_n[VCC_VCC_Q_1], 1); // set constant
    csl_set(m_n[GND_GND_Q_0], 0); // set constant
}

void phase_comp_phase_comp_ComplexMixer_ComplexMixer::execute_segment_1()
{
    
}

void phase_comp_phase_comp_ComplexMixer_ComplexMixer::execute_segment_2()
{
    
}

void phase_comp_phase_comp_ComplexMixer_ComplexMixer::execute_segment_3()
{
    
}

void phase_comp_phase_comp_ComplexMixer_ComplexMixer::execute_segment_4()
{
    
}

void phase_comp_phase_comp_ComplexMixer_ComplexMixer::execute_segment_update()
{
    int64_t n[11] = { 0 };
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_step_reduce(n[1], m_n[VCC_VCC_Q_1], 1);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    csl_step_reduce(n[3], m_n[SIN_SIN_0_4], 18);
    csl_step_reduce(n[4], m_n[QIN_QIN_0_3], 16);
    csl_step_reduce(n[5], m_n[CIN_CIN_0_5], 18);
    csl_step_reduce(n[6], m_n[IIN_IIN_0_2], 16);
    csl_step_shift_right(m_n[U0_AS_MULT_I_CMA_CMA_CTRL_ACC_PIPELINE_10], m_n[U0_AS_MULT_I_CMA_CMA_CTRL_ACC_PIPELINE_10], 1);
    csl_step_shift_right(m_n[U0_AS_MULT_I_CMA_CMA_CTRL_SUB_PIPELINE_10], m_n[U0_AS_MULT_I_CMA_CMA_CTRL_SUB_PIPELINE_10], 1);
    csl_step_shift_right(m_n[U0_AS_MULT_I_CMA_CMA_CTRL_NEG_PIPELINE_10], m_n[U0_AS_MULT_I_CMA_CMA_CTRL_NEG_PIPELINE_10], 1);
    m_n[U0_AS_MULT_I_CMA_CMA_PROD_0_0_0_A_10] = m_n[U0_AS_MULT_I_CMA_CMA_PROD_0_0_0_B_10];
    m_n[U0_AS_MULT_I_CMA_CMA_PROD_0_1_0_A_10] = m_n[U0_AS_MULT_I_CMA_CMA_PROD_0_1_0_B_10];
    csl_step_mul(m_n[U0_AS_MULT_I_CMA_CMA_PROD_0_0_0_B_10], m_n[U0_AS_MULT_I_CMA_CMA_REG_A_0_0_10], m_n[U0_AS_MULT_I_CMA_CMA_REG_C_0_0_10]);
    csl_step_mul(m_n[U0_AS_MULT_I_CMA_CMA_PROD_0_1_0_B_10], m_n[U0_AS_MULT_I_CMA_CMA_REG_A_0_1_10], m_n[U0_AS_MULT_I_CMA_CMA_REG_C_0_1_10]);
    if (n[1] != 0)
    {
        {
            csl_cma_add_params params;
            params.m_pipeline_depth = 1;
            params.m_systolic_block_count = 1;
            params.m_systolic_block_size = 2;
            params.m_n_mults = 2;
            params.m_sums_loc = U0_AS_MULT_I_CMA_CMA_SUM_0_0_10;
            params.m_prod_pipeline_loc = U0_AS_MULT_I_CMA_CMA_PROD_0_0_0_A_10;
            csl_step_cma_add(m_n, params, m_n[U0_AS_MULT_I_CMA_CMA_CTRL_SUB_PIPELINE_10], m_n[U0_AS_MULT_I_CMA_CMA_CTRL_NEG_PIPELINE_10], n[8]);
        }
    }
    csl_set(n[7], 0); // set constant
    csl_step_test_bit(n[9], m_n[U0_AS_MULT_I_CMA_CMA_CTRL_ACC_PIPELINE_10], 0);
    csl_mask_lower(n[10], n[9], 1);
    switch (n[10])
    {
    case 0:
        csl_set(n[7], n[7]);
        break;
    
    case 1:
        csl_set(n[7], m_n[U0_AS_MULT_I_CMA_CMA_CTRL_ACC_PIPELINE_10]);
        break;
    
    default:
        csl_set(n[7], 0);
        break;
    }
    if (n[1] != 0)
    {
        csl_step_add(m_n[U0_AS_MULT_I_CMA_CMA_SUM_0_0_10], m_n[U0_AS_MULT_I_CMA_CMA_SUM_0_0_10], n[7]);
    }
    if (n[0] != 0)
    {
        m_n[U0_AS_MULT_I_CMA_CMA_REG_A_0_0_10] = n[3];
    }
    if (n[0] != 0)
    {
        m_n[U0_AS_MULT_I_CMA_CMA_REG_C_0_0_10] = n[4];
    }
    if (n[0] != 0)
    {
        csl_step_set_bit(m_n[U0_AS_MULT_I_CMA_CMA_CTRL_SUB_PIPELINE_10], n[2], 2);
    }
    if (n[0] != 0)
    {
        m_n[U0_AS_MULT_I_CMA_CMA_REG_A_0_1_10] = n[5];
    }
    if (n[0] != 0)
    {
        m_n[U0_AS_MULT_I_CMA_CMA_REG_C_0_1_10] = n[6];
    }
    if (n[0] != 0)
    {
        csl_step_set_bit(m_n[U0_AS_MULT_I_CMA_CMA_CTRL_SUB_PIPELINE_10], n[2], 2);
    }
    csl_mask_lower(n[0], m_n[IIN_IIN_IN_C_2], 8);
    m_n[D_IIN_IN_C_4_DELAY_STATE_0_13 + m_n[D_IIN_IN_C_4_DELAY_IDX_13]] = m_n[IIN_IIN_IN_C_2];
    m_n[D_IIN_IN_C_4_DELAY_IDX_13] = (m_n[D_IIN_IN_C_4_DELAY_IDX_13] + 1) % 4;
    m_n[D_IIN_IN_C_4_DELAY_OUT_13] = m_n[D_IIN_IN_C_4_DELAY_STATE_0_13 + m_n[D_IIN_IN_C_4_DELAY_IDX_13]];
    csl_step_reduce(n[0], m_n[IIN_IIN_IN_V_2], 1);
    m_n[D_IIN_IN_V_4_DELAY_STATE_0_12 + m_n[D_IIN_IN_V_4_DELAY_IDX_12]] = m_n[IIN_IIN_IN_V_2];
    m_n[D_IIN_IN_V_4_DELAY_IDX_12] = (m_n[D_IIN_IN_V_4_DELAY_IDX_12] + 1) % 4;
    m_n[D_IIN_IN_V_4_DELAY_OUT_12] = m_n[D_IIN_IN_V_4_DELAY_STATE_0_12 + m_n[D_IIN_IN_V_4_DELAY_IDX_12]];
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_step_reduce(n[1], m_n[VCC_VCC_Q_1], 1);
    csl_step_reduce(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_reduce(n[3], m_n[SIN_SIN_0_4], 18);
    csl_step_reduce(n[4], m_n[IIN_IIN_0_2], 16);
    csl_step_reduce(n[5], m_n[CIN_CIN_0_5], 18);
    csl_step_reduce(n[6], m_n[QIN_QIN_0_3], 16);
    csl_step_shift_right(m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_ACC_PIPELINE_11], m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_ACC_PIPELINE_11], 1);
    csl_step_shift_right(m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_SUB_PIPELINE_11], m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_SUB_PIPELINE_11], 1);
    csl_step_shift_right(m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_NEG_PIPELINE_11], m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_NEG_PIPELINE_11], 1);
    m_n[U0_AS_MULT_Q_CMA_CMA_PROD_0_0_0_A_11] = m_n[U0_AS_MULT_Q_CMA_CMA_PROD_0_0_0_B_11];
    m_n[U0_AS_MULT_Q_CMA_CMA_PROD_0_1_0_A_11] = m_n[U0_AS_MULT_Q_CMA_CMA_PROD_0_1_0_B_11];
    csl_step_mul(m_n[U0_AS_MULT_Q_CMA_CMA_PROD_0_0_0_B_11], m_n[U0_AS_MULT_Q_CMA_CMA_REG_A_0_0_11], m_n[U0_AS_MULT_Q_CMA_CMA_REG_C_0_0_11]);
    csl_step_mul(m_n[U0_AS_MULT_Q_CMA_CMA_PROD_0_1_0_B_11], m_n[U0_AS_MULT_Q_CMA_CMA_REG_A_0_1_11], m_n[U0_AS_MULT_Q_CMA_CMA_REG_C_0_1_11]);
    if (n[1] != 0)
    {
        {
            csl_cma_add_params params;
            params.m_pipeline_depth = 1;
            params.m_systolic_block_count = 1;
            params.m_systolic_block_size = 2;
            params.m_n_mults = 2;
            params.m_sums_loc = U0_AS_MULT_Q_CMA_CMA_SUM_0_0_11;
            params.m_prod_pipeline_loc = U0_AS_MULT_Q_CMA_CMA_PROD_0_0_0_A_11;
            csl_step_cma_add(m_n, params, m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_SUB_PIPELINE_11], m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_NEG_PIPELINE_11], n[8]);
        }
    }
    csl_set(n[7], 0); // set constant
    csl_step_test_bit(n[9], m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_ACC_PIPELINE_11], 0);
    csl_mask_lower(n[10], n[9], 1);
    switch (n[10])
    {
    case 0:
        csl_set(n[7], n[7]);
        break;
    
    case 1:
        csl_set(n[7], m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_ACC_PIPELINE_11]);
        break;
    
    default:
        csl_set(n[7], 0);
        break;
    }
    if (n[1] != 0)
    {
        csl_step_add(m_n[U0_AS_MULT_Q_CMA_CMA_SUM_0_0_11], m_n[U0_AS_MULT_Q_CMA_CMA_SUM_0_0_11], n[7]);
    }
    if (n[0] != 0)
    {
        m_n[U0_AS_MULT_Q_CMA_CMA_REG_A_0_0_11] = n[3];
    }
    if (n[0] != 0)
    {
        m_n[U0_AS_MULT_Q_CMA_CMA_REG_C_0_0_11] = n[4];
    }
    if (n[0] != 0)
    {
        csl_step_set_bit(m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_SUB_PIPELINE_11], n[2], 2);
    }
    if (n[0] != 0)
    {
        m_n[U0_AS_MULT_Q_CMA_CMA_REG_A_0_1_11] = n[5];
    }
    if (n[0] != 0)
    {
        m_n[U0_AS_MULT_Q_CMA_CMA_REG_C_0_1_11] = n[6];
    }
    if (n[0] != 0)
    {
        csl_step_set_bit(m_n[U0_AS_MULT_Q_CMA_CMA_CTRL_SUB_PIPELINE_11], n[2], 2);
    }
}

const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::GND_GND_Q_0 = 0;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_V_4_D_IIN_IN_V_4_Q_12 = 10;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_C_4_D_IIN_IN_C_4_Q_13 = 11;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_STATE_0_0_10 = 12;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_SUM_0_0_10 = 13;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_CTRL_ACC_PIPELINE_10 = 14;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_CTRL_SUB_PIPELINE_10 = 15;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_CTRL_NEG_PIPELINE_10 = 16;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_PROD_0_0_0_A_10 = 17;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_PROD_0_0_0_B_10 = 18;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_PROD_0_1_0_A_10 = 19;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::VCC_VCC_Q_1 = 1;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_PROD_0_1_0_B_10 = 20;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_REG_A_0_0_10 = 21;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_REG_A_0_1_10 = 22;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_REG_B_0_0_10 = 23;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_REG_B_0_1_10 = 24;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_REG_C_0_0_10 = 25;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_REG_C_0_1_10 = 26;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_REG_D_0_0_10 = 27;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_CMA_REG_D_0_1_10 = 28;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_C_4_DELAY_OUT_13 = 29;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::IIN_IIN_0_2 = 2;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_C_4_DELAY_IDX_13 = 30;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_C_4_DELAY_STATE_0_13 = 31;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_C_4_DELAY_STATE_1_13 = 32;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_C_4_DELAY_STATE_2_13 = 33;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_C_4_DELAY_STATE_3_13 = 34;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_V_4_DELAY_OUT_12 = 35;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_V_4_DELAY_IDX_12 = 36;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_V_4_DELAY_STATE_0_12 = 37;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_V_4_DELAY_STATE_1_12 = 38;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_V_4_DELAY_STATE_2_12 = 39;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::QIN_QIN_0_3 = 3;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::D_IIN_IN_V_4_DELAY_STATE_3_12 = 40;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::IOUT_OUT_V_8 = 41;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::IOUT_OUT_C_8 = 42;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::IOUT_0_8 = 43;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_STATE_0_0_11 = 44;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_SUM_0_0_11 = 45;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_CTRL_ACC_PIPELINE_11 = 46;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_CTRL_SUB_PIPELINE_11 = 47;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_CTRL_NEG_PIPELINE_11 = 48;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_PROD_0_0_0_A_11 = 49;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::IIN_IIN_IN_V_2 = 4;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_PROD_0_0_0_B_11 = 50;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_PROD_0_1_0_A_11 = 51;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_PROD_0_1_0_B_11 = 52;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_REG_A_0_0_11 = 53;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_REG_A_0_1_11 = 54;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_REG_B_0_0_11 = 55;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_REG_B_0_1_11 = 56;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_REG_C_0_0_11 = 57;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_REG_C_0_1_11 = 58;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_REG_D_0_0_11 = 59;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::IIN_IIN_IN_C_2 = 5;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_CMA_REG_D_0_1_11 = 60;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::QOUT_0_9 = 61;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::SIN_SIN_0_4 = 6;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::CIN_CIN_0_5 = 7;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_I_CMA_U0_AS_MULT_I_CMA_Q_10 = 8;
const size_t phase_comp_phase_comp_ComplexMixer_ComplexMixer::U0_AS_MULT_Q_CMA_U0_AS_MULT_Q_CMA_Q_11 = 9;

