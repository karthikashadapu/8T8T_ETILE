// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 23.2 (Release Build #267b0de70b)
// Software model created on 2023-12-14 19:39:27
// ------------------------------------------------------------------------- 
#include "demo_ifft_IFFT_4K.h"

void demo_ifft_IFFT_4K::reset()
{
    csl_fill_n(m_n, 81, 0);
    m_demo_ifft_IFFT_4K_BitReverseCoreC_inst0.reset();
    m_demo_ifft_IFFT_4K_FFT_inst0.reset();
    csl_fill_n(m_io_cycle, 12, -1);
    csl_fill_n(m_segment_cycle, 6, -1);
    m_update_cycle = -1;
    m_n[SCALE1_REAL_HCMP_X_PIPELINE_STATE_0_8] = 1;
    m_n[SCALE1_REAL_LCMP_X_PIPELINE_STATE_0_10] = 1;
    m_n[SCALE1_IMAG_HCMP_X_PIPELINE_STATE_0_2] = 1;
    m_n[SCALE1_IMAG_LCMP_X_PIPELINE_STATE_0_4] = 1;
}

void demo_ifft_IFFT_4K::execute_segment_0()
{
    int64_t n[2] = { 0 };
    m_n[SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12] = m_n[SCALE1_REAL_MUX_X_PIPELINE_STATE_0_12];
    csl_step_reduce(n[0], m_n[SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12], 16);
    m_n[ZR_RE_ZR_RE_35] = n[0];
    m_n[SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6] = m_n[SCALE1_IMAG_MUX_X_PIPELINE_STATE_0_6];
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6], 16);
    m_n[ZR_IM_ZR_IM_34] = n[0];
    m_n[SCALE1_REAL_RND_X_ADD_SCALE1_REAL_RND_X_ADD_Q_237] = m_n[SCALE1_REAL_RND_X_ADD_PIPELINE_STATE_0_237];
    csl_step_reduce(n[0], m_n[SCALE1_REAL_RND_X_ADD_SCALE1_REAL_RND_X_ADD_Q_237], 33);
    csl_step_shift_right(m_n[SCALE1_REAL_RND_X_SHIFT_SCALE1_REAL_RND_X_SHIFT_Q_238], n[0], 1);
    csl_step_reduce(n[0], m_n[SCALE1_REAL_RND_X_SHIFT_SCALE1_REAL_RND_X_SHIFT_Q_238], 32);
    csl_step_bit_extract(m_n[SCALE1_REAL_SEL_X_SCALE1_REAL_SEL_X_B_27], n[0], 16, true, 0);
    csl_set(m_n[SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3], 32767); // set constant
    m_n[SCALE1_REAL_HCMP_X_SCALE1_REAL_HCMP_X_N_8] = m_n[SCALE1_REAL_HCMP_X_PIPELINE_STATE_0_8];
    csl_set(m_n[VCC_VCC_Q_1], 1); // set constant
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_REAL_HCMP_X_SCALE1_REAL_HCMP_X_N_8], 1);
    csl_step_not(m_n[DUPNAME_1_SCALE1_REAL_X_DUPNAME_1_SCALE1_REAL_X_Q_25], n[1], 1);
    csl_set(m_n[SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5], -32767); // set constant
    m_n[SCALE1_REAL_LCMP_X_SCALE1_REAL_LCMP_X_N_10] = m_n[SCALE1_REAL_LCMP_X_PIPELINE_STATE_0_10];
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_REAL_LCMP_X_SCALE1_REAL_LCMP_X_N_10], 1);
    csl_step_not(m_n[DUPNAME_0_SCALE1_REAL_X_DUPNAME_0_SCALE1_REAL_X_Q_23], n[1], 1);
    m_n[SCALE1_IMAG_RND_X_ADD_SCALE1_IMAG_RND_X_ADD_Q_232] = m_n[SCALE1_IMAG_RND_X_ADD_PIPELINE_STATE_0_232];
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_RND_X_ADD_SCALE1_IMAG_RND_X_ADD_Q_232], 33);
    csl_step_shift_right(m_n[SCALE1_IMAG_RND_X_SHIFT_SCALE1_IMAG_RND_X_SHIFT_Q_233], n[0], 1);
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_RND_X_SHIFT_SCALE1_IMAG_RND_X_SHIFT_Q_233], 32);
    csl_step_bit_extract(m_n[SCALE1_IMAG_SEL_X_SCALE1_IMAG_SEL_X_B_26], n[0], 16, true, 0);
    m_n[SCALE1_IMAG_HCMP_X_SCALE1_IMAG_HCMP_X_N_2] = m_n[SCALE1_IMAG_HCMP_X_PIPELINE_STATE_0_2];
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_IMAG_HCMP_X_SCALE1_IMAG_HCMP_X_N_2], 1);
    csl_step_not(m_n[DUPNAME_1_SCALE1_IMAG_X_DUPNAME_1_SCALE1_IMAG_X_Q_24], n[1], 1);
    m_n[SCALE1_IMAG_LCMP_X_SCALE1_IMAG_LCMP_X_N_4] = m_n[SCALE1_IMAG_LCMP_X_PIPELINE_STATE_0_4];
    csl_step_reduce(n[0], m_n[VCC_VCC_Q_1], 1);
    csl_mask_lower(n[1], m_n[SCALE1_IMAG_LCMP_X_SCALE1_IMAG_LCMP_X_N_4], 1);
    csl_step_not(m_n[DUPNAME_0_SCALE1_IMAG_X_DUPNAME_0_SCALE1_IMAG_X_Q_22], n[1], 1);
    csl_set(m_n[SCALE1_IMAG_RND_X_BIAS_SCALE1_IMAG_RND_X_BIAS_Q_230], 1); // set constant
    m_n[MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_Q_59] = m_n[MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_PIPELINE_STATE_0_59];
    csl_step_reduce(n[0], m_n[MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_Q_59], 45);
    csl_step_shift_right(m_n[SCALE1_REAL_RND_X_TRUNC_SCALE1_REAL_RND_X_TRUNC_Q_236], n[0], 13);
    csl_set(m_n[GND_GND_Q_0], 0); // set constant
    m_n[MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_Q_49] = m_n[MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_PIPELINE_STATE_0_49];
    csl_step_reduce(n[0], m_n[MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_Q_49], 45);
    csl_step_shift_right(m_n[SCALE1_IMAG_RND_X_TRUNC_SCALE1_IMAG_RND_X_TRUNC_Q_231], n[0], 13);
    csl_set(m_n[SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_Q_70], 0); // set constant
    csl_set(m_n[SR_TOPEXTENSION_UID72_MULT_IMAGMULT1_X_IM0_SR_TOPEXTENSION_UID72_MULT_IMAGMULT1_X_IM0_Q_71], 0); // set constant
}

void demo_ifft_IFFT_4K::execute_segment_1()
{
    
}

void demo_ifft_IFFT_4K::execute_segment_2()
{
    
}

void demo_ifft_IFFT_4K::execute_segment_3()
{
    
}

void demo_ifft_IFFT_4K::execute_segment_4()
{
    
}

void demo_ifft_IFFT_4K::execute_segment_5()
{
    int64_t n[4] = { 0 };
    csl_mask_lower(n[0], m_n[XV_S_XV_S_XV_S_28], 1);
    csl_mask_lower(n[1], m_n[XC_S_XC_S_XC_S_29], 8);
    csl_step_reduce(n[2], m_n[XR_IM_XR_IM_XR_IM_30], 16);
    csl_step_reduce(n[3], m_n[XR_RE_XR_RE_XR_RE_31], 16);
    // StepModelWrite
    {
        demo_ifft_IFFT_4K_BitReverseCoreC::io_struct_ChannelIn bbWriteStruct_0;
        csl_memcpy(&bbWriteStruct_0.port_in_1_v_tpl, &n[0], 1);
        csl_memcpy(&bbWriteStruct_0.port_in_2_c_tpl, &n[1], 1);
        csl_memcpy(&bbWriteStruct_0.port_in_3_imag_x_tpl, &n[2], 2);
        csl_memcpy(&bbWriteStruct_0.port_in_3_real_x_tpl, &n[3], 2);
        m_demo_ifft_IFFT_4K_BitReverseCoreC_inst0.write(bbWriteStruct_0);
    }
    // StepModelRead
    {
        demo_ifft_IFFT_4K_BitReverseCoreC::io_struct_ChannelOut bbReaderStruct_0;
        m_demo_ifft_IFFT_4K_BitReverseCoreC_inst0.read(bbReaderStruct_0);
        m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_16] = 0;
        csl_memcpy(&m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_16], &bbReaderStruct_0.port_out_1_qv_tpl, 1);
        m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_16] = 0;
        csl_memcpy(&m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_16], &bbReaderStruct_0.port_out_2_qc_tpl, 1);
        m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_16] = 0;
        csl_memcpy(&m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_16], &bbReaderStruct_0.port_out_3_imag_q_tpl, 2);
        m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_16] = 0;
        csl_memcpy(&m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_16], &bbReaderStruct_0.port_out_3_real_q_tpl, 2);
    }
    csl_step_reduce(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_16], 16);
    m_n[YR_RE_YR_RE_39] = n[0];
    csl_step_reduce(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_16], 16);
    m_n[YR_IM_YR_IM_38] = n[0];
    csl_mask_lower(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_16], 8);
    m_n[YC_S_YC_S_37] = n[0];
    csl_mask_lower(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_16], 1);
    m_n[YV_S_YV_S_36] = n[0];
    csl_mask_lower(n[0], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_16], 1);
    csl_mask_lower(n[1], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_16], 8);
    csl_step_reduce(n[2], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_16], 16);
    csl_step_reduce(n[3], m_n[BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_16], 16);
    // StepModelWrite
    {
        demo_ifft_IFFT_4K_FFT::io_struct_ChannelIn bbWriteStruct_1;
        csl_memcpy(&bbWriteStruct_1.port_in_1_v_tpl, &n[0], 1);
        csl_memcpy(&bbWriteStruct_1.port_in_2_c_tpl, &n[1], 1);
        csl_memcpy(&bbWriteStruct_1.port_in_3_imag_d_tpl, &n[2], 2);
        csl_memcpy(&bbWriteStruct_1.port_in_3_real_d_tpl, &n[3], 2);
        m_demo_ifft_IFFT_4K_FFT_inst0.write(bbWriteStruct_1);
    }
    // StepModelRead
    {
        demo_ifft_IFFT_4K_FFT::io_struct_ChannelOut1 bbReaderStruct_1;
        m_demo_ifft_IFFT_4K_FFT_inst0.read(bbReaderStruct_1);
        m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_17] = 0;
        csl_memcpy(&m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_17], &bbReaderStruct_1.port_out_1_qv_tpl, 1);
        m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_17] = 0;
        csl_memcpy(&m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_17], &bbReaderStruct_1.port_out_2_qc_tpl, 1);
        m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_17] = 0;
        csl_memcpy(&m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_17], &bbReaderStruct_1.port_out_3_imag_q_tpl, 4);
        m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_17] = 0;
        csl_memcpy(&m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_17], &bbReaderStruct_1.port_out_3_real_q_tpl, 4);
    }
    csl_mask_lower(n[0], m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_17], 8);
    m_n[ZC_S_ZC_S_33] = n[0];
    csl_mask_lower(n[0], m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_17], 1);
    m_n[ZV_S_ZV_S_32] = n[0];
    csl_step_reduce(n[0], m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_17], 29);
    csl_step_shift_right(m_n[SHIFT1_REAL_X_FS_SHIFT1_REAL_X_FS_Q_61], n[0], 12);
    csl_step_reduce(n[0], m_n[SHIFT1_REAL_X_FS_SHIFT1_REAL_X_FS_Q_61], 17);
    csl_step_bit_extract(m_n[MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_B_241], n[0], 18, true, 0);
    csl_step_bit_extract(m_n[MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_C_241], n[0], 11, true, 18);
    csl_step_reduce(n[0], m_n[MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_C_241], 11);
    csl_step_bit_extract(m_n[XMSB_UID202_MULT_REALMULT1_X_IM3_XMSB_UID202_MULT_REALMULT1_X_IM3_B_201], n[0], 1, true, 10);
    csl_step_reduce(n[0], m_n[XMSB_UID202_MULT_REALMULT1_X_IM3_XMSB_UID202_MULT_REALMULT1_X_IM3_B_201], 1);
    csl_step_reduce(n[1], m_n[XMSB_UID202_MULT_REALMULT1_X_IM3_XMSB_UID202_MULT_REALMULT1_X_IM3_B_201], 1);
    csl_step_reduce(n[2], m_n[XMSB_UID202_MULT_REALMULT1_X_IM3_XMSB_UID202_MULT_REALMULT1_X_IM3_B_201], 1);
    csl_step_bit_combine(m_n[SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_Q_203], n[0], n[1], 3, 1, 1, 2);
    csl_step_bit_combine(m_n[SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_Q_203], m_n[SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_Q_203], n[2], 3, 2, 2, 0);
    csl_step_reduce(n[0], m_n[SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_Q_70], 13);
    csl_step_reduce(n[1], m_n[MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_C_241], 11);
    csl_step_reduce(n[2], m_n[SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_Q_203], 3);
    csl_step_bit_combine(m_n[SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_Q_204], n[0], n[1], 3, 1, 13, 24);
    csl_step_bit_combine(m_n[SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_Q_204], m_n[SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_Q_204], n[2], 3, 2, 24, 0);
    csl_step_reduce(n[0], m_n[SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_Q_204], 27);
    csl_step_shift_left(m_n[MULT_REALMULT1_X_SUMS_ALIGN_1_MULT_REALMULT1_X_SUMS_ALIGN_1_Q_57], n[0], 18);
    csl_step_reduce(n[0], m_n[SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_Q_70], 13);
    csl_step_reduce(n[1], m_n[MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_B_241], 18);
    csl_step_reduce(n[2], m_n[SR_TOPEXTENSION_UID72_MULT_IMAGMULT1_X_IM0_SR_TOPEXTENSION_UID72_MULT_IMAGMULT1_X_IM0_Q_71], 3);
    csl_step_bit_combine(m_n[SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_Q_156], n[0], n[1], 3, 1, 13, 31);
    csl_step_bit_combine(m_n[SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_Q_156], m_n[SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_Q_156], n[2], 3, 2, 31, 0);
    csl_step_reduce(n[0], m_n[FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_17], 29);
    csl_step_shift_right(m_n[SHIFT1_IMAG_X_FS_SHIFT1_IMAG_X_FS_Q_60], n[0], 12);
    csl_step_reduce(n[0], m_n[SHIFT1_IMAG_X_FS_SHIFT1_IMAG_X_FS_Q_60], 17);
    csl_step_bit_extract(m_n[MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_B_240], n[0], 18, true, 0);
    csl_step_bit_extract(m_n[MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_C_240], n[0], 11, true, 18);
    csl_step_reduce(n[0], m_n[MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_C_240], 11);
    csl_step_bit_extract(m_n[XMSB_UID118_MULT_IMAGMULT1_X_IM3_XMSB_UID118_MULT_IMAGMULT1_X_IM3_B_117], n[0], 1, true, 10);
    csl_step_reduce(n[0], m_n[XMSB_UID118_MULT_IMAGMULT1_X_IM3_XMSB_UID118_MULT_IMAGMULT1_X_IM3_B_117], 1);
    csl_step_reduce(n[1], m_n[XMSB_UID118_MULT_IMAGMULT1_X_IM3_XMSB_UID118_MULT_IMAGMULT1_X_IM3_B_117], 1);
    csl_step_reduce(n[2], m_n[XMSB_UID118_MULT_IMAGMULT1_X_IM3_XMSB_UID118_MULT_IMAGMULT1_X_IM3_B_117], 1);
    csl_step_bit_combine(m_n[SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_Q_119], n[0], n[1], 3, 1, 1, 2);
    csl_step_bit_combine(m_n[SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_Q_119], m_n[SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_Q_119], n[2], 3, 2, 2, 0);
    csl_step_reduce(n[0], m_n[SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_Q_70], 13);
    csl_step_reduce(n[1], m_n[MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_C_240], 11);
    csl_step_reduce(n[2], m_n[SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_Q_119], 3);
    csl_step_bit_combine(m_n[SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_Q_120], n[0], n[1], 3, 1, 13, 24);
    csl_step_bit_combine(m_n[SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_Q_120], m_n[SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_Q_120], n[2], 3, 2, 24, 0);
    csl_step_reduce(n[0], m_n[SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_Q_120], 27);
    csl_step_shift_left(m_n[MULT_IMAGMULT1_X_SUMS_ALIGN_1_MULT_IMAGMULT1_X_SUMS_ALIGN_1_Q_47], n[0], 18);
    csl_step_reduce(n[0], m_n[SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_Q_70], 13);
    csl_step_reduce(n[1], m_n[MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_B_240], 18);
    csl_step_reduce(n[2], m_n[SR_TOPEXTENSION_UID72_MULT_IMAGMULT1_X_IM0_SR_TOPEXTENSION_UID72_MULT_IMAGMULT1_X_IM0_Q_71], 3);
    csl_step_bit_combine(m_n[SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_Q_72], n[0], n[1], 3, 1, 13, 31);
    csl_step_bit_combine(m_n[SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_Q_72], m_n[SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_Q_72], n[2], 3, 2, 31, 0);
}

void demo_ifft_IFFT_4K::execute_segment_update()
{
    int64_t n[7] = { 0 };
    csl_mask_lower(n[0], m_n[DUPNAME_0_SCALE1_REAL_X_DUPNAME_0_SCALE1_REAL_X_Q_23], 1);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5], 16);
    csl_mask_lower(n[2], m_n[DUPNAME_1_SCALE1_REAL_X_DUPNAME_1_SCALE1_REAL_X_Q_25], 1);
    csl_step_reduce(n[3], m_n[SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3], 16);
    csl_step_reduce(n[4], m_n[SCALE1_REAL_SEL_X_SCALE1_REAL_SEL_X_B_27], 16);
    csl_set(n[5], 1); // set constant
    csl_set(n[6], 0); // set constant
    { // Selector
        if (csl_to_i64(n[0]))
        {
            csl_set(m_n[SCALE1_REAL_MUX_X_PIPELINE_STATE_0_12], n[1]); // data
        }
        else if (csl_to_i64(n[2]))
        {
            csl_set(m_n[SCALE1_REAL_MUX_X_PIPELINE_STATE_0_12], n[3]); // data
        }
        else if (csl_to_i64(n[5]))
        {
            csl_set(m_n[SCALE1_REAL_MUX_X_PIPELINE_STATE_0_12], n[4]); // data
        }
    }
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
            csl_set(m_n[SCALE1_IMAG_MUX_X_PIPELINE_STATE_0_6], n[1]); // data
        }
        else if (csl_to_i64(n[2]))
        {
            csl_set(m_n[SCALE1_IMAG_MUX_X_PIPELINE_STATE_0_6], n[3]); // data
        }
        else if (csl_to_i64(n[5]))
        {
            csl_set(m_n[SCALE1_IMAG_MUX_X_PIPELINE_STATE_0_6], n[4]); // data
        }
    }
    csl_step_reduce(n[0], m_n[SCALE1_REAL_RND_X_TRUNC_SCALE1_REAL_RND_X_TRUNC_Q_236], 32);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_RND_X_BIAS_SCALE1_IMAG_RND_X_BIAS_Q_230], 2);
    csl_step_add(m_n[SCALE1_REAL_RND_X_ADD_PIPELINE_STATE_0_237], n[0], n[1]);
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3], 16);
    csl_step_reduce(n[1], m_n[SCALE1_REAL_RND_X_SHIFT_SCALE1_REAL_RND_X_SHIFT_Q_238], 32);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_REAL_HCMP_X_PIPELINE_OUTPUT_TEMP_8], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_REAL_HCMP_X_PIPELINE_STATE_0_8], m_n[SCALE1_REAL_HCMP_X_PIPELINE_OUTPUT_TEMP_8], 34);
    csl_step_reduce(n[0], m_n[SCALE1_REAL_RND_X_SHIFT_SCALE1_REAL_RND_X_SHIFT_Q_238], 32);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5], 16);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_REAL_LCMP_X_PIPELINE_OUTPUT_TEMP_10], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_REAL_LCMP_X_PIPELINE_STATE_0_10], m_n[SCALE1_REAL_LCMP_X_PIPELINE_OUTPUT_TEMP_10], 34);
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_RND_X_TRUNC_SCALE1_IMAG_RND_X_TRUNC_Q_231], 32);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_RND_X_BIAS_SCALE1_IMAG_RND_X_BIAS_Q_230], 2);
    csl_step_add(m_n[SCALE1_IMAG_RND_X_ADD_PIPELINE_STATE_0_232], n[0], n[1]);
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3], 16);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_RND_X_SHIFT_SCALE1_IMAG_RND_X_SHIFT_Q_233], 32);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_IMAG_HCMP_X_PIPELINE_OUTPUT_TEMP_2], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_IMAG_HCMP_X_PIPELINE_STATE_0_2], m_n[SCALE1_IMAG_HCMP_X_PIPELINE_OUTPUT_TEMP_2], 34);
    csl_step_reduce(n[0], m_n[SCALE1_IMAG_RND_X_SHIFT_SCALE1_IMAG_RND_X_SHIFT_Q_233], 32);
    csl_step_reduce(n[1], m_n[SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5], 16);
    csl_mask_lower(n[2], m_n[GND_GND_Q_0], 1);
    csl_step_add(n[3], n[1], n[2]);
    csl_step_sub(m_n[SCALE1_IMAG_LCMP_X_PIPELINE_OUTPUT_TEMP_4], n[0], n[3]);
    csl_step_nsign_bit(m_n[SCALE1_IMAG_LCMP_X_PIPELINE_STATE_0_4], m_n[SCALE1_IMAG_LCMP_X_PIPELINE_OUTPUT_TEMP_4], 34);
    csl_step_reduce(n[0], m_n[SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_Q_156], 34);
    csl_step_reduce(n[1], m_n[MULT_REALMULT1_X_SUMS_ALIGN_1_MULT_REALMULT1_X_SUMS_ALIGN_1_Q_57], 45);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    if (n[2] != 0)
    {
        csl_step_add(m_n[MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_PIPELINE_STATE_0_59], n[0], n[1]);
    }
    csl_step_reduce(n[0], m_n[SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_Q_72], 34);
    csl_step_reduce(n[1], m_n[MULT_IMAGMULT1_X_SUMS_ALIGN_1_MULT_IMAGMULT1_X_SUMS_ALIGN_1_Q_47], 45);
    csl_step_reduce(n[2], m_n[VCC_VCC_Q_1], 1);
    if (n[2] != 0)
    {
        csl_step_add(m_n[MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_PIPELINE_STATE_0_49], n[0], n[1]);
    }
}

const size_t demo_ifft_IFFT_4K::GND_GND_Q_0 = 0;
const size_t demo_ifft_IFFT_4K::BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_1_QV_TPL_16 = 10;
const size_t demo_ifft_IFFT_4K::BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_2_QC_TPL_16 = 11;
const size_t demo_ifft_IFFT_4K::BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_IMAG_Q_TPL_16 = 12;
const size_t demo_ifft_IFFT_4K::BITREVERSECOREC_CUNROLL_X_BITREVERSECOREC_CUNROLL_X_OUT_3_REAL_Q_TPL_16 = 13;
const size_t demo_ifft_IFFT_4K::FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_1_QV_TPL_17 = 14;
const size_t demo_ifft_IFFT_4K::FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_2_QC_TPL_17 = 15;
const size_t demo_ifft_IFFT_4K::FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_IMAG_Q_TPL_17 = 16;
const size_t demo_ifft_IFFT_4K::FFT_CUNROLL_X_FFT_CUNROLL_X_OUT_3_REAL_Q_TPL_17 = 17;
const size_t demo_ifft_IFFT_4K::SHIFT1_IMAG_X_FS_SHIFT1_IMAG_X_FS_Q_60 = 18;
const size_t demo_ifft_IFFT_4K::SHIFT1_REAL_X_FS_SHIFT1_REAL_X_FS_Q_61 = 19;
const size_t demo_ifft_IFFT_4K::VCC_VCC_Q_1 = 1;
const size_t demo_ifft_IFFT_4K::DUPNAME_0_SCALE1_IMAG_X_DUPNAME_0_SCALE1_IMAG_X_Q_22 = 20;
const size_t demo_ifft_IFFT_4K::DUPNAME_0_SCALE1_REAL_X_DUPNAME_0_SCALE1_REAL_X_Q_23 = 21;
const size_t demo_ifft_IFFT_4K::DUPNAME_1_SCALE1_IMAG_X_DUPNAME_1_SCALE1_IMAG_X_Q_24 = 22;
const size_t demo_ifft_IFFT_4K::DUPNAME_1_SCALE1_REAL_X_DUPNAME_1_SCALE1_REAL_X_Q_25 = 23;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_SEL_X_SCALE1_IMAG_SEL_X_B_26 = 24;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_SEL_X_SCALE1_REAL_SEL_X_B_27 = 25;
const size_t demo_ifft_IFFT_4K::XV_S_XV_S_XV_S_28 = 26;
const size_t demo_ifft_IFFT_4K::XC_S_XC_S_XC_S_29 = 27;
const size_t demo_ifft_IFFT_4K::XR_IM_XR_IM_XR_IM_30 = 28;
const size_t demo_ifft_IFFT_4K::XR_RE_XR_RE_XR_RE_31 = 29;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_HCMP_X_SCALE1_IMAG_HCMP_X_N_2 = 2;
const size_t demo_ifft_IFFT_4K::MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_B_240 = 30;
const size_t demo_ifft_IFFT_4K::MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_MULT_IMAGMULT1_X_BS1_BIT_SELECT_MERGED_C_240 = 31;
const size_t demo_ifft_IFFT_4K::MULT_IMAGMULT1_X_SUMS_ALIGN_1_MULT_IMAGMULT1_X_SUMS_ALIGN_1_Q_47 = 32;
const size_t demo_ifft_IFFT_4K::MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_Q_49 = 33;
const size_t demo_ifft_IFFT_4K::MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_B_241 = 34;
const size_t demo_ifft_IFFT_4K::MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_MULT_REALMULT1_X_BS1_BIT_SELECT_MERGED_C_241 = 35;
const size_t demo_ifft_IFFT_4K::MULT_REALMULT1_X_SUMS_ALIGN_1_MULT_REALMULT1_X_SUMS_ALIGN_1_Q_57 = 36;
const size_t demo_ifft_IFFT_4K::MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_Q_59 = 37;
const size_t demo_ifft_IFFT_4K::SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_SR_BOTTOMEXTENSION_UID71_MULT_IMAGMULT1_X_IM0_Q_70 = 38;
const size_t demo_ifft_IFFT_4K::SR_TOPEXTENSION_UID72_MULT_IMAGMULT1_X_IM0_SR_TOPEXTENSION_UID72_MULT_IMAGMULT1_X_IM0_Q_71 = 39;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_HCONST_X_SCALE1_IMAG_HCONST_X_Q_3 = 3;
const size_t demo_ifft_IFFT_4K::SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID73_MULT_IMAGMULT1_X_IM0_Q_72 = 40;
const size_t demo_ifft_IFFT_4K::XMSB_UID118_MULT_IMAGMULT1_X_IM3_XMSB_UID118_MULT_IMAGMULT1_X_IM3_B_117 = 41;
const size_t demo_ifft_IFFT_4K::SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_SR_TOPEXTENSION_UID120_MULT_IMAGMULT1_X_IM3_Q_119 = 42;
const size_t demo_ifft_IFFT_4K::SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID121_MULT_IMAGMULT1_X_IM3_Q_120 = 43;
const size_t demo_ifft_IFFT_4K::SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_SR_MERGEDSIGNALTMB_UID157_MULT_REALMULT1_X_IM0_Q_156 = 44;
const size_t demo_ifft_IFFT_4K::XMSB_UID202_MULT_REALMULT1_X_IM3_XMSB_UID202_MULT_REALMULT1_X_IM3_B_201 = 45;
const size_t demo_ifft_IFFT_4K::SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_SR_TOPEXTENSION_UID204_MULT_REALMULT1_X_IM3_Q_203 = 46;
const size_t demo_ifft_IFFT_4K::SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_SR_MERGEDSIGNALTMB_UID205_MULT_REALMULT1_X_IM3_Q_204 = 47;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_RND_X_SHIFT_SCALE1_IMAG_RND_X_SHIFT_Q_233 = 48;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_RND_X_BIAS_SCALE1_IMAG_RND_X_BIAS_Q_230 = 49;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_LCMP_X_SCALE1_IMAG_LCMP_X_N_4 = 4;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_RND_X_TRUNC_SCALE1_IMAG_RND_X_TRUNC_Q_231 = 50;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_RND_X_ADD_SCALE1_IMAG_RND_X_ADD_Q_232 = 51;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_RND_X_SHIFT_SCALE1_REAL_RND_X_SHIFT_Q_238 = 52;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_RND_X_TRUNC_SCALE1_REAL_RND_X_TRUNC_Q_236 = 53;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_RND_X_ADD_SCALE1_REAL_RND_X_ADD_Q_237 = 54;
const size_t demo_ifft_IFFT_4K::YR_RE_YR_RE_39 = 55;
const size_t demo_ifft_IFFT_4K::YR_IM_YR_IM_38 = 56;
const size_t demo_ifft_IFFT_4K::YC_S_YC_S_37 = 57;
const size_t demo_ifft_IFFT_4K::YV_S_YV_S_36 = 58;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_MUX_X_PIPELINE_STATE_0_12 = 59;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_LCONST_X_SCALE1_IMAG_LCONST_X_Q_5 = 5;
const size_t demo_ifft_IFFT_4K::ZR_RE_ZR_RE_35 = 60;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_MUX_X_PIPELINE_STATE_0_6 = 61;
const size_t demo_ifft_IFFT_4K::ZR_IM_ZR_IM_34 = 62;
const size_t demo_ifft_IFFT_4K::ZC_S_ZC_S_33 = 63;
const size_t demo_ifft_IFFT_4K::ZV_S_ZV_S_32 = 64;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_RND_X_ADD_PIPELINE_STATE_0_237 = 65;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_RND_X_ADD_PIPELINE_OUTPUT_TEMP_237 = 66;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_HCMP_X_PIPELINE_STATE_0_8 = 67;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_HCMP_X_PIPELINE_OUTPUT_TEMP_8 = 68;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_LCMP_X_PIPELINE_STATE_0_10 = 69;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_MUX_X_SCALE1_IMAG_MUX_X_Q_6 = 6;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_LCMP_X_PIPELINE_OUTPUT_TEMP_10 = 70;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_RND_X_ADD_PIPELINE_STATE_0_232 = 71;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_RND_X_ADD_PIPELINE_OUTPUT_TEMP_232 = 72;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_HCMP_X_PIPELINE_STATE_0_2 = 73;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_HCMP_X_PIPELINE_OUTPUT_TEMP_2 = 74;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_LCMP_X_PIPELINE_STATE_0_4 = 75;
const size_t demo_ifft_IFFT_4K::SCALE1_IMAG_LCMP_X_PIPELINE_OUTPUT_TEMP_4 = 76;
const size_t demo_ifft_IFFT_4K::MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_PIPELINE_STATE_0_59 = 77;
const size_t demo_ifft_IFFT_4K::MULT_REALMULT1_X_SUMS_RESULT_ADD_0_0_PIPELINE_OUTPUT_TEMP_59 = 78;
const size_t demo_ifft_IFFT_4K::MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_PIPELINE_STATE_0_49 = 79;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_HCMP_X_SCALE1_REAL_HCMP_X_N_8 = 7;
const size_t demo_ifft_IFFT_4K::MULT_IMAGMULT1_X_SUMS_RESULT_ADD_0_0_PIPELINE_OUTPUT_TEMP_49 = 80;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_LCMP_X_SCALE1_REAL_LCMP_X_N_10 = 8;
const size_t demo_ifft_IFFT_4K::SCALE1_REAL_MUX_X_SCALE1_REAL_MUX_X_Q_12 = 9;

