/**
 * This file contains functions and structs necessary for the
 * software model implementations.
 * ATB specific functionality is in csl_io.h.
 */
#if defined(CSL_USE_PRAGMA_ONCE)
#pragma once
#endif

#ifndef CSL_H
#define CSL_H

#ifdef CSL_DEBUG
#ifndef csl_assert
#include <assert.h>
#define csl_assert(condition)                                                                                          \
    if (!condition)                                                                                                    \
    {                                                                                                                  \
        csl_error("Assert failed: " #condition);                                                                       \
    };
#else
#define csl_assert(condition)
#endif
#endif

#include <math.h>
#include <stddef.h>
#include <stdint.h>
/** For memcpy only */
#include <string.h>

/**
 * Some versions of MSVC ignore 'inline' even where it is very beneficial
 * for software model performance. All functions not marked extern are intended
 * to be inlined, so use stronger inlining hints where possible.
 */
#ifndef CSL_INLINE
#if defined(_MSC_VER)
#define CSL_INLINE inline
#elif defined(__GNUC__)
#define CSL_INLINE inline
#else
#define CSL_INLINE inline
#endif
#endif

#ifdef CSL_USE_MPIR
#include "mpir.h"
#endif
#ifdef CSL_USE_MPFR
#include "mpfr.h"
#endif

/** Application must implement csl_error/csl_warning/csl_info */
extern void csl_error(const char *msg);
extern void csl_warning(const char *msg);
extern void csl_info(const char *msg);

/** Common functions, mostly bit manipulation */
uint64_t csl_bit_mask_u64(size_t amount);
int64_t csl_bit_mask_i64(size_t amount);
void csl_mask_lower(int64_t &iq, int64_t value, size_t width);
int64_t csl_mask_lower(int64_t value, size_t width);
bool csl_test_bit(size_t bitPosition, int64_t value);
void csl_mask(int64_t &iq, int64_t v, size_t bitWidth);
void csl_set_upper(int64_t &value, int bitWidth);
int64_t csl_not(int64_t value, int bitWidth);
void csl_not(int64_t &result, int64_t value, int bitWidth);
void csl_boolean_complement(int64_t &iq, int64_t v);
void csl_set_bit(int64_t &result, size_t position, bool clear);
float csl_flush_subnormals(float f);
void csl_flush_signed_nan(float &f);
void csl_set(int64_t &dst, int64_t src);
uint64_t csl_to_u64(int64_t value);
int64_t csl_ld_exp(int64_t value, int exp2);
int64_t csl_abs(int64_t value);
int64_t csl_pow2(int64_t value);
size_t csl_strlen(const char *str);
int64_t csl_safe_sub(int64_t a, int64_t b);

CSL_INLINE void *csl_memcpy(void *dst, const void *src, size_t len)
{
    return memcpy(dst, src, len);
}

template <class It, class T> It csl_fill_n(It first, size_t count, const T &value)
{
    for (size_t i = 0; i < count; i++)
    {
        *first++ = value;
    }
    return first;
}

template <class T> const T &csl_min(const T &a, const T &b)
{
    return (b < a) ? b : a;
}

template <class T, size_t N> T csl_checked_array_value(const T (&values)[N], int64_t index)
{
    return ((index < N) && (index >= 0)) ? values[index] : T(0);
}

/** Conversion functions **/
CSL_INLINE int64_t csl_to_i64(int64_t v)
{
    return v;
}

/** Arbitrary precision type wrappers **/
#ifdef CSL_USE_MPIR
class csl_mp_int
{
  public:
    csl_mp_int();
    csl_mp_int(const csl_mp_int &other);
    csl_mp_int(const char *str);
    csl_mp_int(int32_t v);
    csl_mp_int(uint32_t v);
    csl_mp_int(int64_t v);
    csl_mp_int(uint64_t v);
    ~csl_mp_int();

    csl_mp_int &backend();
    const csl_mp_int &backend() const;

    /** Get the underlying mpir type */
    mpz_t &data();
    const mpz_t &data() const;

    /**
     * Returns the value of mpz as a string,
     * e.g. returns "2" if the underlying value is 2
     */
    void str(char *dst, size_t maxSize) const;
    /**
     * Returns the binary value of mpz as a string,
     * e.g. returns "10" if the underlying value is 2
     */
    void str_bin(char *dst, size_t maxSize) const;
    /**
     * Sets the value from n integers, where the first element contains the LSB
     */
    void set_from_uint_array(const uint32_t *array, size_t n, size_t bit_width);
    /**
     * Gets the value of this mp int as an array of integers
     */
    void get_as_uint_array(uint32_t *array, size_t n) const;

    /** Operators */
    csl_mp_int &operator=(const csl_mp_int &other);
    csl_mp_int &operator=(const mpf_t val);
    csl_mp_int &operator=(const mpz_t val);
    csl_mp_int &operator=(uint32_t i);
    csl_mp_int &operator=(int32_t i);
    csl_mp_int &operator=(int64_t i);
    csl_mp_int &operator=(uint64_t i);
    csl_mp_int &operator=(const char *s);

  public:
    mpz_t m_value;
};

/** Conversion functions **/
CSL_INLINE int64_t csl_to_i64(const csl_mp_int &value)
{
    int64_t v = 0;
    size_t count = 1;
    mpz_export(&v, &count, 1, sizeof(int64_t), 0, 0, value.m_value);
    v *= mpz_sgn(value.m_value); // signedness
    return v;
}

CSL_INLINE uint64_t csl_to_u64(const csl_mp_int &value)
{
    uint64_t v = 0;
    size_t count = 1;
    mpz_export(&v, &count, 1, sizeof(uint64_t), 0, 0, value.m_value);
    return v;
}

CSL_INLINE int32_t csl_to_i32(const csl_mp_int &value)
{
    int32_t v = 0;
    size_t count = 1;
    mpz_export(&v, &count, 1, sizeof(int32_t), 0, 0, value.m_value);
    v *= mpz_sgn(value.m_value); // signedness
    return v;
}

CSL_INLINE uint32_t csl_to_u32(const csl_mp_int &value)
{
    uint32_t v = 0;
    size_t count = 1;
    mpz_export(&v, &count, 1, sizeof(uint32_t), 0, 0, value.m_value);
    return v;
}

/** Inline operators */
csl_mp_int operator+(const csl_mp_int &rhs);
csl_mp_int operator-(const csl_mp_int &rhs);
csl_mp_int operator~(const csl_mp_int &rhs);
bool operator==(const csl_mp_int &rhs, const csl_mp_int &lhs);
bool operator==(const csl_mp_int &rhs, const int lhs);
bool operator==(const csl_mp_int &rhs, const unsigned int lhs);
bool operator==(const csl_mp_int &rhs, const int64_t lhs);
bool operator==(const int64_t rhs, const csl_mp_int &lhs);
csl_mp_int &operator%=(csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int operator%(const csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int &operator+=(csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int operator+(const csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int &operator-=(csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int operator-(const csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int &operator*=(csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int operator*(const csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int &operator|=(csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int operator|(const csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int &operator&=(csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int operator&(const csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int &operator^=(csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int operator^(const csl_mp_int &rhs, const csl_mp_int &lhs);
csl_mp_int &operator<<=(csl_mp_int &num, const mp_bitcnt_t amount);
csl_mp_int operator<<(const csl_mp_int &num, const mp_bitcnt_t amount);
csl_mp_int &operator>>=(csl_mp_int &num, const mp_bitcnt_t amount);
csl_mp_int operator>>(const csl_mp_int &num, const mp_bitcnt_t amount);
bool operator!=(const csl_mp_int &rhs, const csl_mp_int &lhs);
bool operator!=(const csl_mp_int &rhs, int64_t lhs);
bool operator!=(const csl_mp_int &rhs, const uint64_t lhs);
bool operator!=(const csl_mp_int &rhs, const int lhs);
bool operator!=(const csl_mp_int &rhs, const unsigned int lhs);
bool operator<(const csl_mp_int &rhs, const csl_mp_int &lhs);
bool operator>(const csl_mp_int &rhs, const csl_mp_int &lhs);
bool operator<=(const csl_mp_int &rhs, const csl_mp_int &lhs);
bool operator>=(const csl_mp_int &rhs, const csl_mp_int &lhs);
bool operator<(const csl_mp_int &rhs, const int lhs);
bool operator>(const csl_mp_int &rhs, const int lhs);
bool operator<=(const csl_mp_int &rhs, const int lhs);
bool operator>=(const csl_mp_int &rhs, const int lhs);
bool operator<(const csl_mp_int &rhs, const unsigned int lhs);
bool operator>(const csl_mp_int &rhs, const unsigned int lhs);
bool operator<=(const csl_mp_int &rhs, const unsigned int lhs);
bool operator>=(const csl_mp_int &rhs, const unsigned int lhs);

/** common functions (arbitrary precision versions) */
csl_mp_int csl_bit_mask_mp_int(size_t amount);
uint64_t csl_to_u64(const csl_mp_int &value);
void csl_mask(csl_mp_int &iq, const csl_mp_int &v, size_t bitWidth);
void csl_set(int64_t &dst, const csl_mp_int &src);
void csl_set(csl_mp_int &dst, int64_t src);
void csl_set(csl_mp_int &dst, const csl_mp_int &src);
void csl_mask_lower(csl_mp_int &iq, int64_t value, size_t width);
void csl_mask_lower(csl_mp_int &iq, const csl_mp_int &value, size_t width);
void csl_mask_lower(int64_t &iq, const csl_mp_int &value, size_t width);
csl_mp_int csl_mask_lower(const csl_mp_int &value, size_t width);
bool csl_test_bit(size_t bitPosition, const csl_mp_int &value);
void csl_ld_exp(csl_mp_int &result, const csl_mp_int &value, int exp2);
csl_mp_int csl_ld_exp(const csl_mp_int &value, int exp2);
void csl_set_upper(csl_mp_int &value, int bitWidth);
void csl_not(csl_mp_int &result, const csl_mp_int &value, int bitWidth);
csl_mp_int csl_not(const csl_mp_int &value, int bitWidth);
void csl_boolean_complement(csl_mp_int &iq, const csl_mp_int &v);
void csl_set_bit(csl_mp_int &result, size_t position, bool clear);

#endif

#ifdef CSL_USE_MPFR
struct csl_mp_float_init_token
{
};

struct csl_mp_float
{
    mpfr_t m_value;

    csl_mp_float(mp_prec_t precision);
    csl_mp_float(csl_mp_float_init_token);
    ~csl_mp_float();

    csl_mp_float &operator=(const csl_mp_float &x);
};

class csl_fp32
{
  public:
    union {
        float f;
        unsigned int i;
    } value;

    csl_fp32(int64_t in);
#ifdef CSL_USE_MPIR
    csl_fp32(const csl_mp_int &in);
#endif
    csl_fp32(float f);
};

void csl_set(int64_t &dst, csl_fp32 src);
void csl_set(csl_mp_float &dst, int64_t src);
void csl_set(csl_mp_float &dst, const csl_mp_int &src);

extern void csl_flush_bad_values(int exponentWidth, mpfr_t &o);
extern void csl_mult_fp16_extend(mpfr_t &o, mpfr_t &a, mpfr_t &b);
extern void csl_transfer_fp(int exponentWidth, int mantissaWidth, csl_mp_float &dst, const csl_mp_int &src);
#ifdef CSL_USE_MPIR
extern void csl_float_pack_bits_default(mpfr_t &ref, int wExp, int wFrac, mpz_t &z0, bool subnormalsToZero);
#endif

#endif

struct csl_fifo_params
{
    int m_depth;          // number of words of data in FIFO
    int m_fill_threshold; // the number of words that must be in FIFO before filled is set high
    int m_full_threshold; // the number of words that are in FIFO before fullness flag is set
    int m_write_latency;
    int m_user_sclr;
    int m_base_index;
};

struct csl_enable_gen_params
{
    int m_decim;
    int m_interp;
    int m_n_chans;
    int m_compute_cycle_length;
    int m_adder_width;
    int m_valid_inc;
    int m_ena_inc;
    int m_last_enable_inc;
    int m_num_forced_zeros;
    bool m_use_sequencer_disable;
    bool m_use_delay_disable;
};

struct csl_cma_add_params
{
    int m_pipeline_depth;
    int m_systolic_block_count;
    int m_systolic_block_size;
    int m_n_mults;
    size_t m_sums_loc;
    size_t m_prod_pipeline_loc;
};

#ifdef CSL_USE_MPIR
csl_mp_int csl_safe_sub(csl_mp_int a, int64_t b);
csl_mp_int csl_safe_sub(int64_t a, csl_mp_int b);
csl_mp_int csl_safe_sub(csl_mp_int a, csl_mp_int b);
#endif

/** Step implementations start */
bool csl_dual_mem_is_valid_address(int size, int addr);
extern void csl_dual_mem_get_word(int index, int size, int byteWidth, int64_t *store, int64_t &word, int64_t uaddr,
                                  int wordSize);
extern void csl_dual_mem_put_word(int index, int size, int byteWidth, int64_t *store, const int64_t &word,
                                  int64_t uaddr, int wordSize);

#ifdef CSL_USE_MPIR
void csl_dual_mem_get_word(int index, int size, int byteWidth, csl_mp_int *store, csl_mp_int &word,
                           const csl_mp_int &addr, int wordSize);
extern void csl_dual_mem_get_word(int index, int size, int byteWidth, csl_mp_int *store, csl_mp_int &word,
                                  int64_t uaddr, int wordSize);
void csl_dual_mem_get_word(int index, int size, int byteWidth, int64_t *store, int64_t &word, const csl_mp_int &addr,
                           int wordSize);
extern void csl_dual_mem_put_word(int index, int size, int byteWidth, csl_mp_int *store, const csl_mp_int &word,
                                  int64_t uaddr, int wordSize);
void csl_dual_mem_put_word(int index, int size, int byteWidth, csl_mp_int *store, const csl_mp_int &word,
                           const csl_mp_int &addr, int wordSize);
void csl_dual_mem_put_word(int index, int size, int byteWidth, int64_t *store, const int64_t &word,
                           const csl_mp_int &addr, int wordSize);
#endif

#ifdef CSL_USE_MPFR
extern csl_fp32 csl_fp_mul_impl(const csl_fp32 &a, const csl_fp32 &b);
#endif

/**
 * Utility for buffering model outputs
 */
template <typename T, size_t N> struct csl_delay_correction
{
    csl_delay_correction()
    {
        reset();
    }

    void reset()
    {
        csl_fill_n(m_buffer, N, T(0));
        m_curr = T(0);
    }

    T delay(T value)
    {
        m_curr = m_buffer[m_offset];
        m_buffer[m_offset] = value;
        m_offset = (m_offset + 1) % N;
        return m_curr;
    }

    const T &get() const
    {
        return m_curr;
    }

    size_t m_offset = 0;
    T m_curr;
    T m_buffer[N];
};

/**
 * Utility for buffering model output arrays.
 * This is used for the arrays that wrap arbitrary size types in the
 * HLD library function wrappers.
 */
template <typename T, size_t N, size_t COUNT> struct csl_delay_correction_array
{
    csl_delay_correction_array()
    {
        reset();
    }

    void reset()
    {
        for (size_t i = 0; i < COUNT; ++i)
        {
            csl_fill_n(m_buffer[i], N, T(0));
        }
    }

    template <unsigned int ARR_COUNT> T *delay(const T (&values)[ARR_COUNT])
    {
        for (size_t i = 0; i < COUNT; ++i)
        {
            m_output[i] = m_buffer[i][m_offset];
            m_buffer[i][m_offset] = values[i];
        }
        m_offset = (m_offset + 1) % N;
        return m_output;
    }

    size_t m_offset = 0;
    T m_buffer[COUNT][N];
    T m_output[COUNT];
};

/** Generated steps begin */

// Revision: 2

void csl_step_fp_add(int64_t &iq, int64_t ia, int64_t ib);
void csl_step_fp_sub(int64_t &iq, int64_t ia, int64_t ib);
void csl_step_fp_mul(int64_t &iq, int64_t ia, int64_t ib);
void csl_step_add(int64_t &iq, int64_t ia, int64_t ib);
void csl_step_mul(int64_t &iq, int64_t ia, int64_t ib);
void csl_step_sub(int64_t &iq, int64_t ia, int64_t ib);
void csl_step_addsub(int64_t ctrl, int64_t &iq, int64_t ia, int64_t ib);
void csl_step_subadd(int64_t ctrl, int64_t &iq, int64_t ia, int64_t ib);
void csl_step_const(int64_t &iq, int64_t ia);
void csl_step_and(int64_t &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_or(int64_t &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_xor(int64_t &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_nand(int64_t &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_nor(int64_t &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_nxor(int64_t &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_reducing_or(int64_t &iq, int64_t ia);
void csl_step_reducing_nor(int64_t &iq, int64_t ia);
void csl_step_reducing_and(int64_t &iq, int64_t ia, size_t bitWidth, bool isSigned);
void csl_step_ld_exp(int64_t &iq, int64_t ia, int64_t ib, bool reverse);
void csl_step_equal(int64_t &iq, int64_t ia, int64_t ib);
void csl_step_nequal(int64_t &iq, int64_t ia, int64_t ib);
void csl_step_reducing_nand(int64_t &iq, int64_t ia, size_t bitWidth, bool isSigned);
void csl_step_reducing_xor(int64_t &iq, int64_t ia, size_t bitWidth);
void csl_step_reducing_nxor(int64_t &iq, int64_t ia, size_t bitWidth);
void csl_step_bit_extract(int64_t &iq, int64_t ia, size_t width, bool signExtend, int bitPos);
void csl_step_biased_round(int64_t &iq, int64_t ia, int bit);
void csl_step_unbiased_round(int64_t &iq, int64_t ia, int bit);
void csl_step_bit_reverse(int64_t &iq, int64_t ia, size_t bitWidth);
void csl_step_sign_bit(int64_t &iq, int64_t ia, size_t bitWidth);
void csl_step_nsign_bit(int64_t &iq, int64_t ia, size_t bitWidth);
void csl_step_shift_right(int64_t &iq, int64_t ia, size_t amount);
void csl_step_shift_left(int64_t &iq, int64_t ia, size_t amount);
void csl_step_test_bit(int64_t &iq, int64_t ia, size_t bitposition);
void csl_step_set_bit(int64_t &iq, int64_t ia, size_t bitposition);
void csl_step_not(int64_t &iq, int64_t ia, int bitWidth);
void csl_step_not_signed(int64_t &iq, int64_t ia, int bitWidth);
void csl_step_sequencer(int64_t &state, int64_t &iq, int64_t ia, size_t offset, int64_t mod, int64_t cross);
void csl_step_reduce(int64_t &iq, int64_t ia, size_t bitWidth);
void csl_step_counter(int64_t &counter, int64_t &iq, int64_t ia, size_t offset, int64_t inc, int64_t mod);
void csl_step_bit_combine(int64_t &iq, int64_t ia, int64_t ib, size_t num_bits, size_t index, size_t bitPos,
                          size_t nextBitPos);
bool csl_get_lookup_value(const int64_t *values, const int64_t n, int64_t key, int64_t &out);
bool csl_get_sparse_lookup_value(const int64_t *values, const unsigned char *exists, const int64_t n, int64_t key,
                                 int64_t &out);
bool csl_get_sorted_lookup_value(const int64_t *keys, const int64_t *values, const int64_t n, int64_t key,
                                 int64_t &out);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq, int64_t ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq, int64_t &ivalid,
                     int64_t ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            int64_t &iq, int64_t ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            int64_t &iq, int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq, int64_t &ivalid,
                            int64_t ia_in);
void csl_step_decode(int64_t &iq0, int64_t ia, int64_t ib, int32_t low, int32_t high, int32_t decode);
void csl_step_decode(int64_t &iq0, int64_t &iq1, int64_t ia, int64_t ib, int32_t low, int32_t high, int32_t decode);
extern void csl_step_fp_acc(int64_t &iacc, int64_t control, int64_t &iq, int64_t ix);
extern void csl_step_fp_mult_acc(int64_t &iacc, int64_t control, int64_t &iq, int64_t ix, int64_t iy);
extern void csl_step_loadable_counter(int64_t &state_counter, int64_t &state_mod, int64_t &state_inc, int64_t &iq,
                                      int64_t ienable, int64_t iload, int64_t load_count, int64_t load_mod,
                                      int64_t load_inc);
extern void csl_step_enable_generator(const csl_enable_gen_params &params, int64_t valid, int64_t enable_in,
                                      int64_t &enable_out, int64_t &count, int64_t &en_count, int64_t &zero_force_count,
                                      int64_t &enable, int64_t &enable_zero_forcing_sequencer);
extern void csl_step_cma_add(int64_t *store, const csl_cma_add_params &params, int64_t sub_ctrl, int64_t neg_ctrl,
                             int64_t &block_sum);
extern void csl_step_fifo(int64_t *store, const csl_fifo_params &params, int64_t &data, int64_t writeEn, int64_t readEn,
                          int64_t flush);

#ifdef CSL_USE_MPIR

void csl_step_fp_add(int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_fp_add(int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_fp_add(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_fp_add(csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_fp_add(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_fp_add(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_fp_add(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_fp_sub(int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_fp_sub(int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_fp_sub(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_fp_sub(csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_fp_sub(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_fp_sub(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_fp_sub(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_fp_mul(int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_fp_mul(int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_fp_mul(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_fp_mul(csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_fp_mul(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_fp_mul(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_fp_mul(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_add(int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_add(int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_add(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_add(csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_add(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_add(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_add(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_mul(int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_mul(int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_mul(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_mul(csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_mul(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_mul(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_mul(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_sub(int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_sub(int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_sub(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_sub(csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_sub(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_sub(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_sub(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_addsub(int64_t ctrl, int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_addsub(int64_t ctrl, int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_addsub(int64_t ctrl, int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_addsub(int64_t ctrl, csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_addsub(int64_t ctrl, csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_addsub(int64_t ctrl, csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_addsub(int64_t ctrl, csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_addsub(const csl_mp_int &ctrl, int64_t &iq, int64_t ia, int64_t ib);
void csl_step_addsub(const csl_mp_int &ctrl, int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_addsub(const csl_mp_int &ctrl, int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_addsub(const csl_mp_int &ctrl, int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_addsub(const csl_mp_int &ctrl, csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_addsub(const csl_mp_int &ctrl, csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_addsub(const csl_mp_int &ctrl, csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_addsub(const csl_mp_int &ctrl, csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_subadd(int64_t ctrl, int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_subadd(int64_t ctrl, int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_subadd(int64_t ctrl, int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_subadd(int64_t ctrl, csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_subadd(int64_t ctrl, csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_subadd(int64_t ctrl, csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_subadd(int64_t ctrl, csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_subadd(const csl_mp_int &ctrl, int64_t &iq, int64_t ia, int64_t ib);
void csl_step_subadd(const csl_mp_int &ctrl, int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_subadd(const csl_mp_int &ctrl, int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_subadd(const csl_mp_int &ctrl, int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_subadd(const csl_mp_int &ctrl, csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_subadd(const csl_mp_int &ctrl, csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_subadd(const csl_mp_int &ctrl, csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_subadd(const csl_mp_int &ctrl, csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_const(int64_t &iq, const csl_mp_int &ia);
void csl_step_const(csl_mp_int &iq, int64_t ia);
void csl_step_const(csl_mp_int &iq, const csl_mp_int &ia);
void csl_step_and(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_and(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_and(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_and(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_and(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_and(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_and(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_or(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_or(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_or(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_or(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_or(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_or(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_or(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_xor(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_xor(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_xor(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_xor(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_xor(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_xor(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_xor(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nand(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nand(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_nand(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nand(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_nand(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nand(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_nand(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nor(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nor(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_nor(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nor(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_nor(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nor(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_nor(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nxor(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nxor(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_nxor(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nxor(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth);
void csl_step_nxor(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth);
void csl_step_nxor(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth);
void csl_step_nxor(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth);
void csl_step_reducing_or(int64_t &iq, const csl_mp_int &ia);
void csl_step_reducing_or(csl_mp_int &iq, int64_t ia);
void csl_step_reducing_or(csl_mp_int &iq, const csl_mp_int &ia);
void csl_step_reducing_nor(int64_t &iq, const csl_mp_int &ia);
void csl_step_reducing_nor(csl_mp_int &iq, int64_t ia);
void csl_step_reducing_nor(csl_mp_int &iq, const csl_mp_int &ia);
void csl_step_reducing_and(csl_mp_int &iq, int64_t ia, size_t bitWidth, bool isSigned);
void csl_step_reducing_and(int64_t &iq, const csl_mp_int &ia, size_t bitWidth, bool isSigned);
void csl_step_reducing_and(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth, bool isSigned);
void csl_step_ld_exp(int64_t &iq, const csl_mp_int &ia, int64_t ib, bool reverse);
void csl_step_ld_exp(csl_mp_int &iq, int64_t ia, int64_t ib, bool reverse);
void csl_step_ld_exp(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, bool reverse);
void csl_step_ld_exp(int64_t &iq, int64_t ia, const csl_mp_int &ib, bool reverse);
void csl_step_ld_exp(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, bool reverse);
void csl_step_ld_exp(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, bool reverse);
void csl_step_ld_exp(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, bool reverse);
void csl_step_equal(int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_equal(int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_equal(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_equal(csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_equal(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_equal(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_equal(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_nequal(int64_t &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_nequal(int64_t &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_nequal(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_nequal(csl_mp_int &iq, int64_t ia, int64_t ib);
void csl_step_nequal(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib);
void csl_step_nequal(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib);
void csl_step_nequal(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib);
void csl_step_reducing_nand(int64_t &iq, const csl_mp_int &ia, size_t bitWidth, bool isSigned);
void csl_step_reducing_nand(csl_mp_int &iq, int64_t ia, size_t bitWidth, bool isSigned);
void csl_step_reducing_nand(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth, bool isSigned);
void csl_step_reducing_xor(int64_t &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_reducing_xor(csl_mp_int &iq, int64_t ia, size_t bitWidth);
void csl_step_reducing_xor(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_reducing_nxor(int64_t &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_reducing_nxor(csl_mp_int &iq, int64_t ia, size_t bitWidth);
void csl_step_reducing_nxor(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_bit_extract(int64_t &iq, const csl_mp_int &ia, size_t width, bool signExtend, int bitPos);
void csl_step_bit_extract(csl_mp_int &iq, int64_t ia, size_t width, bool signExtend, int bitPos);
void csl_step_bit_extract(csl_mp_int &iq, const csl_mp_int &ia, size_t width, bool signExtend, int bitPos);
void csl_step_biased_round(int64_t &iq, const csl_mp_int &ia, int bit);
void csl_step_biased_round(csl_mp_int &iq, int64_t ia, int bit);
void csl_step_biased_round(csl_mp_int &iq, const csl_mp_int &ia, int bit);
void csl_step_unbiased_round(int64_t &iq, const csl_mp_int &ia, int bit);
void csl_step_unbiased_round(csl_mp_int &iq, int64_t ia, int bit);
void csl_step_unbiased_round(csl_mp_int &iq, const csl_mp_int &ia, int bit);
void csl_step_bit_reverse(int64_t &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_bit_reverse(csl_mp_int &iq, int64_t ia, size_t bitWidth);
void csl_step_bit_reverse(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_sign_bit(int64_t &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_sign_bit(csl_mp_int &iq, int64_t ia, size_t bitWidth);
void csl_step_sign_bit(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_nsign_bit(int64_t &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_nsign_bit(csl_mp_int &iq, int64_t ia, size_t bitWidth);
void csl_step_nsign_bit(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_shift_right(int64_t &iq, const csl_mp_int &ia, size_t amount);
void csl_step_shift_right(csl_mp_int &iq, int64_t ia, size_t amount);
void csl_step_shift_right(csl_mp_int &iq, const csl_mp_int &ia, size_t amount);
void csl_step_shift_left(int64_t &iq, const csl_mp_int &ia, size_t amount);
void csl_step_shift_left(csl_mp_int &iq, int64_t ia, size_t amount);
void csl_step_shift_left(csl_mp_int &iq, const csl_mp_int &ia, size_t amount);
void csl_step_test_bit(int64_t &iq, const csl_mp_int &ia, size_t bitposition);
void csl_step_test_bit(csl_mp_int &iq, int64_t ia, size_t bitposition);
void csl_step_test_bit(csl_mp_int &iq, const csl_mp_int &ia, size_t bitposition);
void csl_step_set_bit(int64_t &iq, const csl_mp_int &ia, size_t bitposition);
void csl_step_set_bit(csl_mp_int &iq, int64_t ia, size_t bitposition);
void csl_step_set_bit(csl_mp_int &iq, const csl_mp_int &ia, size_t bitposition);
void csl_step_not(int64_t &iq, const csl_mp_int &ia, int bitWidth);
void csl_step_not(csl_mp_int &iq, int64_t ia, int bitWidth);
void csl_step_not(csl_mp_int &iq, const csl_mp_int &ia, int bitWidth);
void csl_step_not_signed(int64_t &iq, const csl_mp_int &ia, int bitWidth);
void csl_step_not_signed(csl_mp_int &iq, int64_t ia, int bitWidth);
void csl_step_not_signed(csl_mp_int &iq, const csl_mp_int &ia, int bitWidth);
void csl_step_sequencer(csl_mp_int &state, csl_mp_int &iq, const csl_mp_int &ia, size_t offset, int64_t mod,
                        int64_t cross);
void csl_step_reduce(int64_t &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_reduce(csl_mp_int &iq, int64_t ia, size_t bitWidth);
void csl_step_reduce(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth);
void csl_step_counter(int64_t &counter, int64_t &iq, const csl_mp_int &ia, size_t offset, int64_t inc, int64_t mod);
void csl_step_counter(int64_t &counter, csl_mp_int &iq, int64_t ia, size_t offset, int64_t inc, int64_t mod);
void csl_step_counter(int64_t &counter, csl_mp_int &iq, const csl_mp_int &ia, size_t offset, int64_t inc, int64_t mod);
void csl_step_counter(csl_mp_int &counter, int64_t &iq, int64_t ia, size_t offset, int64_t inc, int64_t mod);
void csl_step_counter(csl_mp_int &counter, int64_t &iq, const csl_mp_int &ia, size_t offset, int64_t inc, int64_t mod);
void csl_step_counter(csl_mp_int &counter, csl_mp_int &iq, int64_t ia, size_t offset, int64_t inc, int64_t mod);
void csl_step_counter(csl_mp_int &counter, csl_mp_int &iq, const csl_mp_int &ia, size_t offset, int64_t inc,
                      int64_t mod);
void csl_step_bit_combine(int64_t &iq, int64_t ia, const csl_mp_int &ib, size_t num_bits, size_t index, size_t bitPos,
                          size_t nextBitPos);
void csl_step_bit_combine(int64_t &iq, const csl_mp_int &ia, int64_t ib, size_t num_bits, size_t index, size_t bitPos,
                          size_t nextBitPos);
void csl_step_bit_combine(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, size_t num_bits, size_t index,
                          size_t bitPos, size_t nextBitPos);
void csl_step_bit_combine(csl_mp_int &iq, int64_t ia, int64_t ib, size_t num_bits, size_t index, size_t bitPos,
                          size_t nextBitPos);
void csl_step_bit_combine(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, size_t num_bits, size_t index,
                          size_t bitPos, size_t nextBitPos);
void csl_step_bit_combine(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, size_t num_bits, size_t index,
                          size_t bitPos, size_t nextBitPos);
void csl_step_bit_combine(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, size_t num_bits, size_t index,
                          size_t bitPos, size_t nextBitPos);
bool csl_get_lookup_value(const csl_mp_int *values, const int64_t n, int64_t key, csl_mp_int &out);
bool csl_get_sparse_lookup_value(const csl_mp_int *values, const unsigned char *exists, const int64_t n, int64_t key,
                                 csl_mp_int &out);
bool csl_get_sorted_lookup_value(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t key,
                                 csl_mp_int &out);
bool csl_get_sorted_lookup_value(const csl_mp_int *keys, const int64_t *values, const int64_t n, const csl_mp_int &key,
                                 int64_t &out);
bool csl_get_sorted_lookup_value(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n,
                                 const csl_mp_int &key, csl_mp_int &out);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq, int64_t ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq, int64_t ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq, int64_t ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq, csl_mp_int &ivalid,
                     int64_t ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq, int64_t &ivalid,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq, csl_mp_int &ivalid,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq, int64_t &ivalid,
                     int64_t ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq, csl_mp_int &ivalid,
                     int64_t ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq, int64_t &ivalid,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq, csl_mp_int &ivalid,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq, int64_t &ivalid,
                     int64_t ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq, csl_mp_int &ivalid,
                     int64_t ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq, int64_t &ivalid,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq, csl_mp_int &ivalid,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq, int64_t &ivalid,
                     int64_t ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                     csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq, int64_t &ivalid,
                     const csl_mp_int &ia_in);
void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                     csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, int64_t &iq, int64_t ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            int64_t &iq, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, int64_t &iq, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            csl_mp_int &iq, int64_t ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, csl_mp_int &iq, int64_t ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            csl_mp_int &iq, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, csl_mp_int &iq, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            int64_t &iq, csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            int64_t &iq, int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            int64_t &iq, csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            csl_mp_int &iq, int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            csl_mp_int &iq, csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            csl_mp_int &iq, int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n, const uint64_t offset,
                            csl_mp_int &iq, csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, int64_t &iq, int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, int64_t &iq, csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, int64_t &iq, int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, int64_t &iq, csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, csl_mp_int &iq, int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, csl_mp_int &iq, csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, csl_mp_int &iq, int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                            const uint64_t offset, csl_mp_int &iq, csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                            csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq, int64_t &ivalid,
                            const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                            csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                            int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                            csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                            int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                            csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                            csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                            csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            int64_t &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            csl_mp_int &ivalid, int64_t ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            int64_t &ivalid, const csl_mp_int &ia_in);
void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                            csl_mp_int &ivalid, const csl_mp_int &ia_in);
void csl_step_decode(csl_mp_int &iq0, const csl_mp_int &ia, const csl_mp_int &ib, int32_t low, int32_t high,
                     int32_t decode);
void csl_step_decode(csl_mp_int &iq0, csl_mp_int &iq1, const csl_mp_int &ia, const csl_mp_int &ib, int32_t low,
                     int32_t high, int32_t decode);
extern void csl_step_fp_acc(csl_mp_int &iacc, int64_t control, int64_t &iq, int64_t ix);
extern void csl_step_fp_mult_acc(csl_mp_int &iacc, int64_t control, int64_t &iq, int64_t ix, int64_t iy);
extern void csl_step_loadable_counter(csl_mp_int &state_counter, csl_mp_int &state_mod, csl_mp_int &state_inc,
                                      csl_mp_int &iq, const csl_mp_int &ienable, const csl_mp_int &iload,
                                      const csl_mp_int &load_count, const csl_mp_int &load_mod,
                                      const csl_mp_int &load_inc);
extern void csl_step_cma_add(csl_mp_int *store, const csl_cma_add_params &params, int64_t sub_ctrl, int64_t neg_ctrl,
                             csl_mp_int &block_sum);
extern void csl_step_fifo(csl_mp_int *store, const csl_fifo_params &params, csl_mp_int &data, int64_t writeEn,
                          int64_t readEn, int64_t flush);

#endif // CSL_USE_MPIR

/** Generated steps end */

#include "csl.inl"

#endif // CSL_H