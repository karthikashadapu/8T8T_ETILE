#include "csl.h"

#ifdef CSL_USE_MPFR
#ifdef CSL_USE_MPIR
void csl_float_pack_bits_default(mpfr_t &ref, int wExp, int wFrac, mpz_t &z0, bool subnormalsToZero)
{
    int bias = (1 << (wExp - 1)) - 1;

    mpz_t z1;
    mpz_init(z1);

    bool nan = mpfr_nan_p(ref);
    bool inf = mpfr_inf_p(ref);
    int sgn = mpfr_sgn(ref);
    if (nan)
    {
        mpz_set_ui(z1, (1 << (wExp + 1)) - 1);
        mpz_mul_2exp(z0, z1, wFrac);
        mpz_add_ui(z0, z0, 3);
    }
    else if (sgn == 0)
    {
        mpz_set_ui(z0, 0);
        if (mpfr_signbit(ref))
        {
            mpz_setbit(z0, wExp + wFrac);
        }
    }
    else if (!inf)
    {
        mp_exp_t ex = mpfr_get_z_exp(z0, ref);
        ex = ex + bias + wFrac;
        if (ex <= 0)
        {
            if (subnormalsToZero)
            {
                mpz_set_ui(z0, 0);
            }
            else
            {
                mpz_abs(z0, z0);

                mpfr_t y1;
                mpfr_init2(y1, 1 + wFrac);
                mpfr_set_z(y1, z0, GMP_RNDN);
                mpfr_div_2exp(y1, y1, 1 - ex, GMP_RNDN);
                mpfr_rint(y1, y1, GMP_RNDN);
                mpfr_get_z(z0, y1, GMP_RNDN);
                mpfr_clear(y1);
            }
            if (sgn < 0)
            {
                mpz_setbit(z0, wExp + wFrac);
            }
        }
        else if (ex < ((1 << wExp) - 1))
        {
            if (sgn < 0)
            {
                mpz_neg(z0, z0);
                mpz_setbit(z0, wExp + wFrac);
            }
            mpz_clrbit(z0, wFrac);
            mpz_set_ui(z1, ex);
            mpz_mul_2exp(z1, z1, wFrac);
            mpz_ior(z0, z0, z1);
        }
        else
        {
            inf = true;
        }
    }

    if (inf)
    {
        mpz_set_ui(z1, (1 << wExp) - 1);
        mpz_mul_2exp(z0, z1, wFrac);
        if (sgn < 0)
        {
            mpz_setbit(z0, wExp + wFrac);
        }
    }

    mpz_clear(z1);
}
#endif

void csl_flush_bad_values(int exponentWidth, mpfr_t &o)
{
    if (mpfr_regular_p(o))
    {
        const int64_t exponentMax = csl_bit_mask_i64(exponentWidth);
        const int64_t exponentBias = csl_bit_mask_i64(exponentWidth - 1);
        const int64_t exponentAdjust = exponentBias - 1;
        const int64_t adjustedExponent = mpfr_get_exp(o) + exponentAdjust;

        if (exponentMax <= adjustedExponent)
        {
            const int mpfrSign = mpfr_sgn(o);
            mpfr_set_inf(o, mpfrSign);
        }
        else if (adjustedExponent <= 0)
        {
            const int mpfrSign = mpfr_sgn(o);
            mpfr_set_zero(o, mpfrSign);
        }
    }
}

void csl_mult_fp16_extend(mpfr_t &o, mpfr_t &a, mpfr_t &b)
{
    // 2^-14
    const double smallest_normal = 6.103515625e-5;
    const double in0 = mpfr_get_d(a, MPFR_RNDN);
    const double in1 = mpfr_get_d(b, MPFR_RNDN);
    const bool in0_denorm = (fabs(in0) < smallest_normal);
    const bool in1_denorm = (fabs(in1) < smallest_normal);
    const bool extra_test = (in0_denorm || in1_denorm) && !(mpfr_zero_p(a) || mpfr_zero_p(b));

    if (extra_test)
    {
        // 10 fraction bits + 1 implicit (hidden) bit
        const int out_prec = 11;

        mpfr_t in0_man, in1_man, man_prod, cst_rnd_n;
        mpfr_inits2(out_prec, in0_man, in1_man, cst_rnd_n, (mpfr_ptr)0);
        mpfr_init2(man_prod, 2 * out_prec);

        const int in0_exp = mpfr_get_exp(a);
        const int in1_exp = mpfr_get_exp(b);

        mpfr_set(in0_man, a, MPFR_RNDN);
        mpfr_set(in1_man, b, MPFR_RNDN);
        // For aligning denormalized operands. Smallest normal on half is 1.0 2^-14 but in MPFR this is 0.5 2^-13.
        mpfr_set_exp(in0_man, 1 + (in0_denorm ? (in0_exp + 13) : 0));
        mpfr_set_exp(in1_man, 1 + (in1_denorm ? (in1_exp + 13) : 0));

        mpfr_mul(man_prod, in0_man, in1_man, MPFR_RNDN);
        mpfr_abs(man_prod, man_prod, MPFR_RNDN);

        mpfr_set_si(cst_rnd_n, 1, MPFR_RNDN);
        // -11 is mantissa_width (10) + 1 bit
        mpfr_mul_2si(cst_rnd_n, cst_rnd_n, -11, MPFR_RNDN);
        mpfr_si_sub(cst_rnd_n, 1, cst_rnd_n, MPFR_RNDN);

        if (mpfr_cmp(man_prod, cst_rnd_n) < 0)
        {
            mpfr_mul(o, a, b, MPFR_RNDZ);
        }
        else
        {
            if (mpfr_cmp_si(man_prod, 1) >= 1)
            {
                mpfr_mul(o, a, b, MPFR_RNDN);
            }
            else
            {
                mpfr_mul(o, a, b, MPFR_RNDZ);
                if (mpfr_cmp_si(o, 0) > 0)
                {
                    mpfr_nextabove(o);
                }
                else
                {
                    mpfr_nextbelow(o);
                }
            }
        }
        mpfr_clears(in0_man, in1_man, cst_rnd_n, (mpfr_ptr)0);
    }
    else
    {
        mpfr_mul(o, a, b, MPFR_RNDN);
    }
}

CSL_INLINE int64_t csl_extract_field(int64_t src, int offset, int width)
{
    return ((src >> offset) & csl_bit_mask_i64(width));
}

void csl_transfer_fp(int exponentWidth, int mantissaWidth, csl_mp_float &dst, const csl_mp_int &src)
{
    const int64_t exponentMax = csl_bit_mask_i64(exponentWidth);
    const int64_t exponentBias = csl_bit_mask_i64(exponentWidth - 1);

    const int64_t srcInt = static_cast<int64_t>(mpz_get_si(src.m_value));
    const int64_t srcSignField = csl_extract_field(srcInt, exponentWidth + mantissaWidth, 1);
    const int64_t srcExponentField = csl_extract_field(srcInt, mantissaWidth, exponentWidth);
    const int64_t srcMantissaField = csl_extract_field(srcInt, 0, mantissaWidth);

    const int64_t mpfrSign = (srcSignField == 0) ? 1 : -1;

    if (srcExponentField == exponentMax)
    {
        if (srcMantissaField == 0)
        {
            mpfr_set_inf(dst.m_value, static_cast<int>(mpfrSign));
        }
        else
        {
            mpfr_set_nan(dst.m_value);
        }
    }
    else if (srcExponentField == 0)
    {
        if (srcMantissaField == 0)
        {
            mpfr_set_zero(dst.m_value, static_cast<int>(mpfrSign));
        }
        else
        {
            const int64_t srcSignedMantissa = mpfrSign * srcMantissaField;
            const int64_t exponentAdjust = (exponentBias - 1) + mantissaWidth;
            mpfr_set_si_2exp(dst.m_value, static_cast<long>(srcSignedMantissa),
                             static_cast<mpfr_exp_t>(srcExponentField - exponentAdjust), MPFR_RNDN);
        }
    }
    else
    {
        const int64_t srcFullMantissa = srcMantissaField + csl_pow2(mantissaWidth);
        const int64_t srcSignedMantissa = mpfrSign * srcFullMantissa;
        const int64_t exponentAdjust = exponentBias + mantissaWidth;
        mpfr_set_si_2exp(dst.m_value, static_cast<long>(srcSignedMantissa),
                         static_cast<mpfr_exp_t>(srcExponentField - exponentAdjust), MPFR_RNDN);
    }
}
#endif

#ifdef CSL_USE_MPFR
csl_fp32 csl_fp_mul_impl(const csl_fp32 &x, const csl_fp32 &y)
{
    // single precision, 24-bit mantissa
    csl_mp_float mp_x(24);
    csl_mp_float mp_y(24);

    // use MPFR for single precision multiply to handle subtlety when rounding close to a subnormal
    mpfr_set_d(mp_x.m_value, static_cast<double>(x.value.f), GMP_RNDN);
    mpfr_set_d(mp_y.m_value, static_cast<double>(y.value.f), GMP_RNDN);
    mpfr_mul(mp_x.m_value, mp_x.m_value, mp_y.m_value, GMP_RNDN);

    // single precision exponent
    const int expWidth = 8;
    const int eMinNormal = 2 - (1 << (expWidth - 1)) + 1;
    const int eMaxNormal = (1 << (expWidth - 1)) - 1 + 1;
    // non-zero for negative
    int signX = mpfr_signbit(mp_x.m_value);
    int currentExp = mpfr_get_exp(mp_x.m_value);
    if (currentExp < eMinNormal)
    {
        // flush subnormals to zero
        mpfr_set_zero(mp_x.m_value, (signX == 0) ? 1 : -1);
    }
    else if (currentExp > eMaxNormal)
    {
        // overflow to infinity
        mpfr_set_inf(mp_x.m_value, (signX == 0) ? 1 : -1);
    }

    float q = static_cast<float>(mpfr_get_d(mp_x.m_value, GMP_RNDN));
    csl_flush_signed_nan(q);
    return csl_fp32(q);
}
#endif

#ifdef CSL_USE_MPIR
void csl_dual_mem_get_word(int index, int size, int byteWidth, csl_mp_int *store, csl_mp_int &word, int64_t uaddr,
                           int wordSize)
{
    int addr = static_cast<int>(uaddr);
    const int memBase = index * size;
    const int byteAddr = addr * wordSize;

    if (!csl_dual_mem_is_valid_address(size, byteAddr))
    {
        mpz_set_si(word.data(), 0xcdcdcdcd);
    }
    else if (wordSize == 1)
    {
        word = store[memBase + byteAddr];
    }
    else
    {
        // Little-endian i.e. LS byte (processed last here)
        // is stored at the lowest address address
        mpz_set_ui(word.data(), 0);
        csl_mp_int temp;
        for (int i = wordSize; --i;)
        {
            const csl_mp_int &byte = store[memBase + byteAddr + i];
            temp = csl_mask_lower(byte, byteWidth);
            word = csl_ld_exp(word, byteWidth);
            mpz_ior(word.data(), word.data(), temp.data());
        }
    }
}
#endif

void csl_dual_mem_get_word(int index, int size, int byteWidth, int64_t *store, int64_t &word, int64_t uaddr,
                           int wordSize)
{
    int addr = static_cast<int>(uaddr);
    const int memBase = index * size;
    const int byteAddr = addr * wordSize;

    if (!csl_dual_mem_is_valid_address(size, byteAddr))
    {
        word = 0xcdcdcdcd;
    }
    else if (wordSize == 1)
    {
        word = store[memBase + byteAddr];
    }
    else
    {
        // Little-endian i.e. LS byte (processed last here)
        // is stored at the lowest address address
        word = 0;
        int64_t temp;
        for (int i = wordSize; --i;)
        {
            const int64_t &byte = store[memBase + byteAddr + i];
            temp = csl_mask_lower(byte, byteWidth);
            word = csl_ld_exp(word, byteWidth);
            word |= temp;
        }
    }
}

#ifdef CSL_USE_MPIR

void csl_dual_mem_put_word(int index, int size, int byteWidth, csl_mp_int *store, const csl_mp_int &word, int64_t uaddr,
                           int wordSize)
{
    int addr = static_cast<int>(uaddr);
    const int memBase = index * size;
    const int byteAddr = addr * wordSize;

    if (!csl_dual_mem_is_valid_address(size, byteAddr))
    {
        // silently ignore the write
    }
    else if (wordSize == 1)
    {
        store[memBase + byteAddr] = word;
    }
    else
    {
        // Little-endian i.e. LS byte (processed first here) is stored at the lowest address
        csl_mp_int tmp = word;
        for (int i = 0; i < wordSize; ++i)
        {
            csl_mp_int &byte = store[memBase + byteAddr + i];
            byte = csl_mask_lower(tmp, byteWidth);
            tmp = csl_ld_exp(tmp, byteWidth);
        }
    }
}

#endif

void csl_dual_mem_put_word(int index, int size, int byteWidth, int64_t *store, const int64_t &word, int64_t uaddr,
                           int wordSize)
{
    int addr = static_cast<int>(uaddr);
    const int memBase = index * size;
    const int byteAddr = addr * wordSize;

    if (!csl_dual_mem_is_valid_address(size, byteAddr))
    {
        // silently ignore the write
    }
    else if (wordSize == 1)
    {
        store[memBase + byteAddr] = word;
    }
    else
    {
        // Little-endian i.e. LS byte (processed first here)
        // is stored at the lowest address
        int64_t tmp = word;
        for (int i = 0; i < wordSize; ++i)
        {
            int64_t &byte = store[memBase + byteAddr + i];
            byte = csl_mask_lower(tmp, byteWidth);
            tmp = csl_ld_exp(tmp, byteWidth);
        }
    }
}

/** Generated steps begin */

#ifdef CSL_USE_MPFR

void csl_step_fp_acc(int64_t &iacc, int64_t control, int64_t &iq, int64_t ix)
{
    csl_fp32 x(ix);

    csl_mp_float mp_acc(24);
    if (control == 0)
    {
        // acc = x
        mpfr_set_d(mp_acc.m_value, static_cast<double>(x.value.f), GMP_RNDN);
    }
    else
    {
        csl_mp_float mp_x(24);
        mpfr_set_d(mp_x.m_value, static_cast<double>(x.value.f), GMP_RNDN);

        csl_fp32 acc(iacc);
        mpfr_set_d(mp_acc.m_value, static_cast<double>(acc.value.f), GMP_RNDN);

        // acc = acc + x
        mpfr_add(mp_acc.m_value, mp_acc.m_value, mp_x.m_value, GMP_RNDN);
    }
    float v = static_cast<float>(mpfr_get_d(mp_acc.m_value, GMP_RNDN));
    int v_int;
    csl_memcpy(&v_int, &v, sizeof(v));
    iacc = v_int;

    // set output
    iq = csl_to_i64(iacc);
}

#endif // CSL_USE_MPFR
// --------------------------------

#ifdef CSL_USE_MPFR

void csl_step_fp_mult_acc(int64_t &iacc, int64_t control, int64_t &iq, int64_t ix, int64_t iy)
{
    csl_fp32 x(ix);
    csl_fp32 y(iy);

    // x = x*y
    csl_mp_float mp_x(24);
    csl_mp_float mp_y(24);
    csl_mp_float mp_acc(24);
    mpfr_set_d(mp_x.m_value, static_cast<double>(x.value.f), GMP_RNDN);
    mpfr_set_d(mp_y.m_value, static_cast<double>(y.value.f), GMP_RNDN);
    mpfr_mul(mp_x.m_value, mp_x.m_value, mp_y.m_value, GMP_RNDN);

    if (control == 0)
    {
        // acc = (x*y)
        mpfr_set(mp_acc.m_value, mp_x.m_value, GMP_RNDN);
    }
    else
    {
        csl_fp32 acc(iacc);
        mpfr_set_d(mp_acc.m_value, static_cast<double>(acc.value.f), GMP_RNDN);
        // acc = acc + (x*y)
        mpfr_add(mp_acc.m_value, mp_acc.m_value, mp_x.m_value, GMP_RNDN);
    }
    float v = static_cast<float>(mpfr_get_d(mp_acc.m_value, GMP_RNDN));
    int v_int;
    csl_memcpy(&v_int, &v, sizeof(v));
    iacc = v_int;

    // set output
    iq = csl_to_i64(iacc);
}

#endif // CSL_USE_MPFR
// --------------------------------

void csl_step_loadable_counter(int64_t &state_counter, int64_t &state_mod, int64_t &state_inc, int64_t &iq,
                               int64_t ienable, int64_t iload, int64_t load_count, int64_t load_mod, int64_t load_inc)
{
    const bool enable = ienable != 0;
    const bool load = iload != 0;

    if (load)
    {
        state_counter = load_count;
        state_mod = load_mod;
        state_inc = (load_inc < 0) ? load_inc + load_mod : load_inc;
    }
    else if (enable)
    {
        // Modulo zero is undefined - just like divide by zero. The hardware will count as
        // if there is no modulo however, and we will do the same. Currently we don't issue
        // a warning.
        state_counter += state_inc;
        if (state_mod != 0)
        {
            state_counter %= state_mod;
        }
    }

    iq = state_counter;
}

// --------------------------------

void csl_step_enable_generator(const csl_enable_gen_params &params, int64_t valid, int64_t enable_in,
                               int64_t &enable_out, int64_t &count, int64_t &en_count, int64_t &zero_force_count,
                               int64_t &enable, int64_t &enable_zero_forcing_sequencer)
{
    bool lastCycle = false;
    bool forceDisable = false;

    // count enabled cycles so we know whether we're on the last enabled cycle
    if (enable != 0)
    {
        en_count++;
        if (en_count == params.m_compute_cycle_length)
        {
            en_count = 0;
            lastCycle = true;
        }
    }

    // the accumulator
    if (valid != 0)
    {
        count += params.m_valid_inc;
    }

    if (enable != 0)
    {
        count += params.m_ena_inc;
        if (lastCycle && (params.m_compute_cycle_length > 1))
        {
            count += params.m_last_enable_inc;
        }
    }

    if (params.m_use_sequencer_disable)
    {
        if (enable_zero_forcing_sequencer != 0)
        {
            ++zero_force_count;
            if (zero_force_count == params.m_num_forced_zeros)
            {
                enable_zero_forcing_sequencer = 0;
            }
        }

        if (lastCycle)
        {
            enable_zero_forcing_sequencer = 1;
            zero_force_count = 0;
        }

        forceDisable = zero_force_count != 0;
    }
    else if (params.m_use_delay_disable)
    {
        forceDisable = lastCycle;
    }

    // update the enable value
    enable = ((count < 0) && (!forceDisable) && (enable_in != 0)) ? 1 : 0;

    // latency not modeled at this level, copy current value to output
    enable_out = enable;
}

// --------------------------------

void csl_step_cma_add(int64_t *store, const csl_cma_add_params &params, int64_t sub_ctrl, int64_t neg_ctrl,
                      int64_t &block_sum)
{
    bool subCtrlValue = csl_test_bit(0, sub_ctrl);
    bool negCtrlValue = csl_test_bit(0, neg_ctrl);

    for (int k = 0, i = 0; i < params.m_systolic_block_count; ++i)
    {
        const int multsInBlock = csl_min(params.m_systolic_block_size, params.m_n_mults - k);
        block_sum = 0;

        if (subCtrlValue)
        {
            block_sum =
                store[params.m_prod_pipeline_loc + params.m_pipeline_depth + 1] - store[params.m_prod_pipeline_loc];
            k += 2;
        }
        else
        {
            for (int j = 0; j < multsInBlock; ++j)
            {
                block_sum += store[params.m_prod_pipeline_loc + (k * (params.m_pipeline_depth + 1))];
                k++;
            }
        }

        const int i1 = i + 1;
        if (params.m_systolic_block_count <= i1)
        {
            store[params.m_sums_loc + i] = block_sum;
        }
        else
        {
            if (negCtrlValue)
            {
                store[params.m_sums_loc + i] = store[params.m_sums_loc + i1] - block_sum;
            }
            else
            {
                store[params.m_sums_loc + i] = store[params.m_sums_loc + i1] + block_sum;
            }
        }
    }
}

// --------------------------------

void csl_step_fifo(int64_t *store, const csl_fifo_params &params, int64_t &data, int64_t writeEn, int64_t readEn,
                   int64_t flush)
{
    const int baseIndex = params.m_base_index;
    const int readPtrIndex = baseIndex + 4 + params.m_depth;
    const int writePtrIndex = baseIndex + 5 + params.m_depth;
    const int userSclr = params.m_user_sclr;

    int64_t readPtr64, writePtr64;
    csl_set(readPtr64, store[readPtrIndex]);
    csl_set(writePtr64, store[writePtrIndex]);
    int readPtr = static_cast<int>(readPtr64);
    int writePtr = static_cast<int>(writePtr64);

    const int twiceDepth = 2 * params.m_depth;
    // (mod 2n) so that full and empty queue states can be disambiguated
    // in both of these cases
    //               mod(writePtr - readPtr,   m_depth) == 0
    // but if empty, mod(writePtr - readPtr, 2*m_depth) == 0
    // and if full,  mod(writePtr - readPtr, 2*m_depth) == m_depth

    int count = ((writePtr - readPtr) % twiceDepth + twiceDepth) % twiceDepth;

    // update state independent of input signals
    int writePtrDelayed;
    int countDelayed;
    bool clearing = userSclr && flush != 0;

    // update state according to input operands
    if (clearing)
    {
        // Operation during SCLR

        // Flush input is high - clear FIFO state
        int frameSize =
            7 + params.m_depth + params.m_write_latency; // room for FIFO + circular Buffer + state variables

        for (int i = 0; i < frameSize; ++i)
        {
            // delayed write pipeline -> set zero across the whole frame
            store[baseIndex + i] = 0;
        }

        // Flush the FIFO by resetting the address counters
        readPtr = baseIndex; // Pointers to the start
        writePtr = baseIndex;
        writePtrDelayed = baseIndex;
        countDelayed = 0; // Counters to zero
        count = 0;

        store[readPtrIndex] = readPtr;   // Reset read pointer
        store[writePtrIndex] = writePtr; // Reset write pointer
    }
    else
    {
        // Normal operation

        // update state independent of input signals (other than sclr)
        for (int i = params.m_write_latency; i > 0; --i)
        {
            // delayed write pipeline
            store[writePtrIndex + i] = store[writePtrIndex + i - 1];
        }

        if (writeEn != 0)
        {
            if (count == params.m_depth)
            {
                // Warn on write when full
                csl_warning("FIFO_WRITE_WHILE_FULL");
            }
            if (count < params.m_depth)
            {
                // enqueue (write enable is high) in circular buffer
                store[baseIndex + 4 + (writePtr % params.m_depth)] = data;
                writePtr = (writePtr + 1) % twiceDepth;
                ++count;
                store[writePtrIndex] = writePtr;
            }
        }

        int64_t writePtrDelayed64;
        csl_set(writePtrDelayed64, store[writePtrIndex + params.m_write_latency]);
        writePtrDelayed = static_cast<int>(writePtrDelayed64);
        countDelayed = ((writePtrDelayed - readPtr) % twiceDepth + twiceDepth) % twiceDepth;

        const int maxCountIdx = baseIndex + 6 + params.m_depth + params.m_write_latency;
        int64_t maxCount;
        csl_set(maxCount, store[maxCountIdx]);
        if (count > maxCount)
        {
            store[maxCountIdx] = count;
        }

        if (readEn != 0)
        {
            // dequeue (read enable is high) from circular buffer
            if (countDelayed > 0)
            {
                readPtr = (readPtr + 1) % twiceDepth;
                --countDelayed;
                --count;
                store[readPtrIndex] = readPtr;
            }
            else
            {
                // Warn on read when empty
                csl_warning("FIFO_READACK_VALID_LOW");
            }
        }
    }

    // output register update
    bool valid = countDelayed > 0;
    store[baseIndex + 0] = valid ? 1 : 0;
    store[baseIndex + 1] = (count >= params.m_fill_threshold) ? 1 : 0;
    store[baseIndex + 2] = (count >= params.m_full_threshold) ? 1 : 0;

    if (countDelayed > 0)
    {
        // update data output register
        store[baseIndex + 3] = store[baseIndex + 4 + (readPtr % params.m_depth)];
    }
}

// --------------------------------

#ifdef CSL_USE_MPIR

#ifdef CSL_USE_MPFR

void csl_step_fp_acc(csl_mp_int &iacc, int64_t control, int64_t &iq, int64_t ix)
{
    csl_fp32 x(ix);

    csl_mp_float mp_acc(24);
    if (control == 0)
    {
        // acc = x
        mpfr_set_d(mp_acc.m_value, static_cast<double>(x.value.f), GMP_RNDN);
    }
    else
    {
        csl_mp_float mp_x(24);
        mpfr_set_d(mp_x.m_value, static_cast<double>(x.value.f), GMP_RNDN);

        csl_fp32 acc(iacc);
        mpfr_set_d(mp_acc.m_value, static_cast<double>(acc.value.f), GMP_RNDN);

        // acc = acc + x
        mpfr_add(mp_acc.m_value, mp_acc.m_value, mp_x.m_value, GMP_RNDN);
    }
    float v = static_cast<float>(mpfr_get_d(mp_acc.m_value, GMP_RNDN));
    int v_int;
    csl_memcpy(&v_int, &v, sizeof(v));
    iacc = v_int;

    // set output
    iq = csl_to_i64(iacc);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

void csl_step_fp_mult_acc(csl_mp_int &iacc, int64_t control, int64_t &iq, int64_t ix, int64_t iy)
{
    csl_fp32 x(ix);
    csl_fp32 y(iy);

    // x = x*y
    csl_mp_float mp_x(24);
    csl_mp_float mp_y(24);
    csl_mp_float mp_acc(24);
    mpfr_set_d(mp_x.m_value, static_cast<double>(x.value.f), GMP_RNDN);
    mpfr_set_d(mp_y.m_value, static_cast<double>(y.value.f), GMP_RNDN);
    mpfr_mul(mp_x.m_value, mp_x.m_value, mp_y.m_value, GMP_RNDN);

    if (control == 0)
    {
        // acc = (x*y)
        mpfr_set(mp_acc.m_value, mp_x.m_value, GMP_RNDN);
    }
    else
    {
        csl_fp32 acc(iacc);
        mpfr_set_d(mp_acc.m_value, static_cast<double>(acc.value.f), GMP_RNDN);
        // acc = acc + (x*y)
        mpfr_add(mp_acc.m_value, mp_acc.m_value, mp_x.m_value, GMP_RNDN);
    }
    float v = static_cast<float>(mpfr_get_d(mp_acc.m_value, GMP_RNDN));
    int v_int;
    csl_memcpy(&v_int, &v, sizeof(v));
    iacc = v_int;

    // set output
    iq = csl_to_i64(iacc);
}

#endif // CSL_USE_MPFR
void csl_step_loadable_counter(csl_mp_int &state_counter, csl_mp_int &state_mod, csl_mp_int &state_inc, csl_mp_int &iq,
                               const csl_mp_int &ienable, const csl_mp_int &iload, const csl_mp_int &load_count,
                               const csl_mp_int &load_mod, const csl_mp_int &load_inc)
{
    const bool enable = ienable != 0;
    const bool load = iload != 0;

    if (load)
    {
        state_counter = load_count;
        state_mod = load_mod;
        state_inc = (load_inc < 0) ? load_inc + load_mod : load_inc;
    }
    else if (enable)
    {
        // Modulo zero is undefined - just like divide by zero. The hardware will count as
        // if there is no modulo however, and we will do the same. Currently we don't issue
        // a warning.
        state_counter += state_inc;
        if (state_mod != 0)
        {
            state_counter %= state_mod;
        }
    }

    iq = state_counter;
}

void csl_step_cma_add(csl_mp_int *store, const csl_cma_add_params &params, int64_t sub_ctrl, int64_t neg_ctrl,
                      csl_mp_int &block_sum)
{
    bool subCtrlValue = csl_test_bit(0, sub_ctrl);
    bool negCtrlValue = csl_test_bit(0, neg_ctrl);

    for (int k = 0, i = 0; i < params.m_systolic_block_count; ++i)
    {
        const int multsInBlock = csl_min(params.m_systolic_block_size, params.m_n_mults - k);
        block_sum = 0;

        if (subCtrlValue)
        {
            block_sum =
                store[params.m_prod_pipeline_loc + params.m_pipeline_depth + 1] - store[params.m_prod_pipeline_loc];
            k += 2;
        }
        else
        {
            for (int j = 0; j < multsInBlock; ++j)
            {
                block_sum += store[params.m_prod_pipeline_loc + (k * (params.m_pipeline_depth + 1))];
                k++;
            }
        }

        const int i1 = i + 1;
        if (params.m_systolic_block_count <= i1)
        {
            store[params.m_sums_loc + i] = block_sum;
        }
        else
        {
            if (negCtrlValue)
            {
                store[params.m_sums_loc + i] = store[params.m_sums_loc + i1] - block_sum;
            }
            else
            {
                store[params.m_sums_loc + i] = store[params.m_sums_loc + i1] + block_sum;
            }
        }
    }
}

void csl_step_fifo(csl_mp_int *store, const csl_fifo_params &params, csl_mp_int &data, int64_t writeEn, int64_t readEn,
                   int64_t flush)
{
    const int baseIndex = params.m_base_index;
    const int readPtrIndex = baseIndex + 4 + params.m_depth;
    const int writePtrIndex = baseIndex + 5 + params.m_depth;
    const int userSclr = params.m_user_sclr;

    int64_t readPtr64, writePtr64;
    csl_set(readPtr64, store[readPtrIndex]);
    csl_set(writePtr64, store[writePtrIndex]);
    int readPtr = static_cast<int>(readPtr64);
    int writePtr = static_cast<int>(writePtr64);

    const int twiceDepth = 2 * params.m_depth;
    // (mod 2n) so that full and empty queue states can be disambiguated
    // in both of these cases
    //               mod(writePtr - readPtr,   m_depth) == 0
    // but if empty, mod(writePtr - readPtr, 2*m_depth) == 0
    // and if full,  mod(writePtr - readPtr, 2*m_depth) == m_depth

    int count = ((writePtr - readPtr) % twiceDepth + twiceDepth) % twiceDepth;

    // update state independent of input signals
    int writePtrDelayed;
    int countDelayed;
    bool clearing = userSclr && flush != 0;

    // update state according to input operands
    if (clearing)
    {
        // Operation during SCLR

        // Flush input is high - clear FIFO state
        int frameSize =
            7 + params.m_depth + params.m_write_latency; // room for FIFO + circular Buffer + state variables

        for (int i = 0; i < frameSize; ++i)
        {
            // delayed write pipeline -> set zero across the whole frame
            store[baseIndex + i] = 0;
        }

        // Flush the FIFO by resetting the address counters
        readPtr = baseIndex; // Pointers to the start
        writePtr = baseIndex;
        writePtrDelayed = baseIndex;
        countDelayed = 0; // Counters to zero
        count = 0;

        store[readPtrIndex] = readPtr;   // Reset read pointer
        store[writePtrIndex] = writePtr; // Reset write pointer
    }
    else
    {
        // Normal operation

        // update state independent of input signals (other than sclr)
        for (int i = params.m_write_latency; i > 0; --i)
        {
            // delayed write pipeline
            store[writePtrIndex + i] = store[writePtrIndex + i - 1];
        }

        if (writeEn != 0)
        {
            if (count == params.m_depth)
            {
                // Warn on write when full
                csl_warning("FIFO_WRITE_WHILE_FULL");
            }
            if (count < params.m_depth)
            {
                // enqueue (write enable is high) in circular buffer
                store[baseIndex + 4 + (writePtr % params.m_depth)] = data;
                writePtr = (writePtr + 1) % twiceDepth;
                ++count;
                store[writePtrIndex] = writePtr;
            }
        }

        int64_t writePtrDelayed64;
        csl_set(writePtrDelayed64, store[writePtrIndex + params.m_write_latency]);
        writePtrDelayed = static_cast<int>(writePtrDelayed64);
        countDelayed = ((writePtrDelayed - readPtr) % twiceDepth + twiceDepth) % twiceDepth;

        const int maxCountIdx = baseIndex + 6 + params.m_depth + params.m_write_latency;
        int64_t maxCount;
        csl_set(maxCount, store[maxCountIdx]);
        if (count > maxCount)
        {
            store[maxCountIdx] = count;
        }

        if (readEn != 0)
        {
            // dequeue (read enable is high) from circular buffer
            if (countDelayed > 0)
            {
                readPtr = (readPtr + 1) % twiceDepth;
                --countDelayed;
                --count;
                store[readPtrIndex] = readPtr;
            }
            else
            {
                // Warn on read when empty
                csl_warning("FIFO_READACK_VALID_LOW");
            }
        }
    }

    // output register update
    bool valid = countDelayed > 0;
    store[baseIndex + 0] = valid ? 1 : 0;
    store[baseIndex + 1] = (count >= params.m_fill_threshold) ? 1 : 0;
    store[baseIndex + 2] = (count >= params.m_full_threshold) ? 1 : 0;

    if (countDelayed > 0)
    {
        // update data output register
        store[baseIndex + 3] = store[baseIndex + 4 + (readPtr % params.m_depth)];
    }
}

#endif // CSL_USE_MPIR

/** Generated steps end */