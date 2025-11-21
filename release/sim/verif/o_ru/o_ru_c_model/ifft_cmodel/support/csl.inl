CSL_INLINE int64_t csl_safe_sub(int64_t a, int64_t b)
{
    // casting to u64 works around inlining issue in gcc8.x and gcc9.x
    return (int64_t)(a - (uint64_t)b);
}

CSL_INLINE uint64_t csl_bit_mask_u64(size_t amount)
{
    return (amount < 64) ? (1ull << amount) - 1 : 0xFFFFFFFFFFFFFFFFull;
}

CSL_INLINE int64_t csl_bit_mask_i64(size_t amount)
{
    return (amount < 64) ? (1ll << amount) - 1 : 0xFFFFFFFFFFFFFFFFll;
}

CSL_INLINE void csl_mask_lower(int64_t &iq, int64_t value, size_t width)
{
    iq = value & csl_bit_mask_i64(width);
}

CSL_INLINE int64_t csl_mask_lower(int64_t value, size_t width)
{
    int64_t result;
    result = value & csl_bit_mask_i64(width);
    return result;
}

CSL_INLINE bool csl_test_bit(size_t bitPosition, int64_t value)
{
    if (bitPosition > 63)
    {
        // sign extend
        return value < 0;
    }
    else
    {
        uint64_t mask = (1ull << bitPosition);
        uint64_t result = (value & mask);
        return result != 0;
    }
}

CSL_INLINE void csl_mask(int64_t &iq, int64_t v, size_t bitWidth)
{
    iq = v & csl_bit_mask_i64(bitWidth);
}

CSL_INLINE void csl_set_upper(int64_t &value, size_t bitWidth)
{
    value = ~value;
    csl_mask_lower(value, value, bitWidth);
    value = ~value;
}

CSL_INLINE void csl_not(int64_t &result, int64_t value, int bitWidth)
{
    result = value;
    for (int i = 0; i < bitWidth; ++i)
    {
        result ^= 1ll << i;
    }
}

CSL_INLINE void csl_boolean_complement(int64_t &iq, int64_t v)
{
    iq = ~v & 1;
}

CSL_INLINE void csl_set_bit(int64_t &result, size_t position, bool clear)
{
    if (!clear)
    {
        result |= 1ull << position;
    }
    else
    {
        result &= ~(1ull << position);
    }
}

CSL_INLINE float csl_flush_subnormals(float f)
{
    if (fabs(f) < 1.17549435082229e-38f)
    {
        // scaling by 0.0f preserves the sign bit
        return f * 0.0f;
    }
    return f;
}

CSL_INLINE void csl_flush_signed_nan(float &f)
{
    if (isnan(f))
    {
        uint32_t mask = ((uint32_t)1 << 31) - 1;
        uint32_t xPostMask = mask & (*((uint32_t *)(&f)));
        csl_memcpy(&f, &xPostMask, sizeof(float));
    }
}

CSL_INLINE void csl_set(int64_t &dst, int64_t src)
{
    dst = src;
}

CSL_INLINE uint64_t csl_to_u64(int64_t value)
{
    return static_cast<uint64_t>(value);
}

CSL_INLINE int64_t csl_ld_exp(int64_t value, int exp2)
{
    if (exp2 < 0)
    {
        exp2 = -exp2;
        if (exp2 > 63)
        {
            return 0;
        }
        return value >> exp2;
    }
    else
    {
        if (exp2 > 63)
        {
            // saturate if not 0
            return (value == 0) ? 0 : ~0;
        }
        return value << exp2;
    }
}

CSL_INLINE bool csl_dual_mem_is_valid_address(int size, int addr)
{
    return ((addr >= 0) && (addr < static_cast<int>(size)));
}

#ifdef CSL_USE_MPIR

CSL_INLINE csl_mp_int csl_safe_sub(csl_mp_int a, int64_t b)
{
    return a - b;
}

CSL_INLINE csl_mp_int csl_safe_sub(int64_t a, csl_mp_int b)
{
    return a - b;
}

CSL_INLINE csl_mp_int csl_safe_sub(csl_mp_int a, csl_mp_int b)
{
    return a - b;
}

CSL_INLINE void csl_dual_mem_get_word(int index, int size, int byteWidth, int64_t *store, int64_t &word,
                                      const csl_mp_int &addr, int wordSize)
{
    csl_dual_mem_get_word(index, size, byteWidth, store, word, csl_to_i64(addr), wordSize);
}

CSL_INLINE void csl_dual_mem_put_word(int index, int size, int byteWidth, csl_mp_int *store, const csl_mp_int &word,
                                      const csl_mp_int &addr, int wordSize)
{
    csl_dual_mem_put_word(index, size, byteWidth, store, word, csl_to_i64(addr), wordSize);
}

CSL_INLINE void csl_dual_mem_put_word(int index, int size, int byteWidth, int64_t *store, const int64_t &word,
                                      const csl_mp_int &addr, int wordSize)
{
    csl_dual_mem_put_word(index, size, byteWidth, store, word, csl_to_i64(addr), wordSize);
}

CSL_INLINE void csl_dual_mem_get_word(int index, int size, int byteWidth, csl_mp_int *store, csl_mp_int &word,
                                      const csl_mp_int &addr, int wordSize)
{
    csl_dual_mem_get_word(index, size, byteWidth, store, word, csl_to_i64(addr), wordSize);
}

CSL_INLINE csl_mp_int &csl_mp_int::operator=(const char *s)
{
    size_t n = s ? csl_strlen(s) : 0;
    int radix = 10;
    if ((n > 0) && (s[0] == '0'))
    {
        if ((n > 1) && ((s[1] == 'x') || (s[1] == 'X')))
        {
            radix = 16;
            s += 2;
            n -= 2;
        }
        else
        {
            radix = 8;
            n -= 1;
        }
    }
    if (n > 0)
    {
        if (mpz_set_str(m_value, s, radix) != 0)
        {
            mpz_set_ui(m_value, 0);
        }
    }
    else
    {
        mpz_set_ui(m_value, 0);
    }
    return *this;
}

CSL_INLINE csl_mp_int &csl_mp_int::operator=(uint64_t i)
{
#if defined(_MSC_VER)
    uint64_t mask = csl_bit_mask_u64(32);
    mpz_set_ui(m_value, 0);
    mpz_t lower;
    mpz_init_set_ui(lower, 0);
    unsigned long shift = 0;
    while (i)
    {
        mpz_set_ui(lower, static_cast<unsigned long>(i & mask));
        if (shift > 0)
        {
            mpz_mul_2exp(lower, lower, shift);
        }
        mpz_add(m_value, m_value, lower);
        shift += 32;
        i >>= 32;
    }
    mpz_clear(lower);
    return *this;
#else
    mpz_set_ui(m_value, i);
    return *this;
#endif
}

CSL_INLINE csl_mp_int &csl_mp_int::operator=(int64_t i)
{
    bool neg = i < 0;
    *this = (uint64_t)csl_abs(i);
    if (neg)
    {
        mpz_neg(m_value, m_value);
    }
    return *this;
}

CSL_INLINE csl_mp_int &csl_mp_int::operator=(int32_t i)
{
    mpz_set_si(m_value, i);
    return *this;
}

CSL_INLINE csl_mp_int &csl_mp_int::operator=(uint32_t i)
{
    mpz_set_ui(m_value, i);
    return *this;
}

CSL_INLINE csl_mp_int &csl_mp_int::operator=(const mpz_t val)
{
    mpz_set(this->m_value, val);
    return *this;
}

CSL_INLINE csl_mp_int &csl_mp_int::operator=(const mpf_t val)
{
    mpz_set_f(this->m_value, val);
    return *this;
}

CSL_INLINE csl_mp_int &csl_mp_int::operator=(const csl_mp_int &other)
{
    if (this->m_value != other.m_value)
    {
        if (this->m_value[0]._mp_d)
        {
            mpz_set(this->m_value, other.m_value);
        }
        else
        {
            mpz_init_set(this->m_value, other.m_value);
        }
    }
    return *this;
}

CSL_INLINE csl_mp_int::csl_mp_int(uint64_t v)
{
    mpz_init(this->m_value);
    *this = v;
}

CSL_INLINE csl_mp_int::csl_mp_int(int64_t v)
{
    mpz_init(this->m_value);
    *this = v;
}

CSL_INLINE csl_mp_int::csl_mp_int(uint32_t v)
{
    mpz_init_set_ui(this->m_value, v);
}

CSL_INLINE csl_mp_int::csl_mp_int(int32_t v)
{
    mpz_init_set_si(this->m_value, v);
}

CSL_INLINE csl_mp_int::csl_mp_int(const char *str)
{
    mpz_init(this->m_value);
    *this = str;
}

CSL_INLINE csl_mp_int::csl_mp_int(const csl_mp_int &other)
{
    if (other.m_value[0]._mp_d)
    {
        mpz_init_set(this->m_value, other.m_value);
    }
    else
    {
        mpz_init(this->m_value);
    }
}

CSL_INLINE csl_mp_int::csl_mp_int()
{
    mpz_init(this->m_value);
}

CSL_INLINE csl_mp_int::~csl_mp_int()
{
    if (this->m_value[0]._mp_d)
    {
        mpz_clear(this->m_value);
    }
}

CSL_INLINE const csl_mp_int &csl_mp_int::backend() const
{
    return *this;
}

CSL_INLINE csl_mp_int &csl_mp_int::backend()
{
    return *this;
}

CSL_INLINE const mpz_t &csl_mp_int::data() const
{
    return m_value;
}

CSL_INLINE mpz_t &csl_mp_int::data()
{
    return m_value;
}

CSL_INLINE void csl_mp_int::str(char *dst, size_t maxSize) const
{
    // mpz_get_str assumes the storage location is large enough,
    // so only invoke it if it actually is.
    if (maxSize >= (mpz_sizeinbase(m_value, 2) + 2))
    {
        mpz_get_str(dst, 10, m_value);
    }
    else
    {
        csl_warning("csl_mp_int::str(): dst array was too small for output");
    }
}

CSL_INLINE void csl_mp_int::str_bin(char *dst, size_t maxSize) const
{
    // mpz_get_str assumes the storage location is large enough,
    // so only invoke it if it actually is.
    if (maxSize >= (mpz_sizeinbase(m_value, 2) + 2))
    {
        mpz_get_str(dst, 2, m_value);
    }
    else
    {
        csl_warning("csl_mp_int::str_bin(): dst array was too small for output");
    }
}

CSL_INLINE void csl_mp_int::set_from_uint_array(const uint32_t *array, size_t n, size_t bit_width)
{
    *this = 0;
    for (int32_t i = static_cast<int32_t>(n) - 1; i >= 0; --i)
    {
        *this += array[i];
        if (i != 0)
        {
            *this <<= 32;
        }
    }

    // flip if necessary
    if (bit_width > 1)
    {
        if (csl_test_bit(bit_width - 1, *this))
        {
            csl_mp_int a2 = csl_mask_lower(*this, bit_width - 1);
            const csl_mp_int mp1 = csl_mp_int(1);
            csl_mp_int t = csl_ld_exp(mp1, static_cast<int32_t>(bit_width - 1));
            *this = a2 - t;
        }
    }
}

CSL_INLINE void csl_mp_int::get_as_uint_array(uint32_t *arr, size_t n) const
{
    csl_mp_int curr = *this;
    for (size_t i = 0; i < n; ++i)
    {
        uint64_t v = mpz_get_ui(curr.m_value);
        csl_memcpy(&arr[i], &v, sizeof(uint32_t));
        curr >>= 32;
    }
}

CSL_INLINE csl_mp_int operator+(const csl_mp_int &rhs)
{
    csl_mp_int result = rhs;
    mpz_set(result.data(), result.data());
    return result;
}

CSL_INLINE csl_mp_int operator-(const csl_mp_int &rhs)
{
    csl_mp_int result = rhs;
    mpz_neg(result.data(), result.data());
    return result;
}

CSL_INLINE csl_mp_int operator~(const csl_mp_int &rhs)
{
    csl_mp_int result = rhs;
    mpz_com(result.data(), result.data());
    return result;
}

CSL_INLINE bool operator==(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    return mpz_cmp(rhs.data(), lhs.data()) == 0;
}

CSL_INLINE bool operator==(const csl_mp_int &rhs, const int lhs)
{
    return mpz_cmp_si(rhs.data(), lhs) == 0;
}

CSL_INLINE bool operator==(const csl_mp_int &rhs, const unsigned int lhs)
{
    return mpz_cmp_ui(rhs.data(), lhs) == 0;
}

CSL_INLINE bool operator==(const csl_mp_int &rhs, const int64_t lhs)
{
    return mpz_cmp_si(rhs.data(), lhs) == 0;
}

CSL_INLINE bool operator==(const int64_t rhs, const csl_mp_int &lhs)
{
    return mpz_cmp_si(lhs.data(), rhs) == 0;
}

CSL_INLINE csl_mp_int &operator%=(csl_mp_int &rhs, const csl_mp_int &lhs)
{
    mpz_mod(rhs.data(), rhs.data(), lhs.data());
    return rhs;
}

CSL_INLINE csl_mp_int operator%(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    csl_mp_int result;
    mpz_mod(result.data(), rhs.data(), lhs.data());
    return result;
}

CSL_INLINE csl_mp_int &operator+=(csl_mp_int &rhs, const csl_mp_int &lhs)
{
    mpz_add(rhs.data(), rhs.data(), lhs.data());
    return rhs;
}

CSL_INLINE csl_mp_int operator+(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    csl_mp_int result;
    mpz_add(result.data(), rhs.data(), lhs.data());
    return result;
}

CSL_INLINE csl_mp_int &operator-=(csl_mp_int &rhs, const csl_mp_int &lhs)
{
    mpz_sub(rhs.data(), rhs.data(), lhs.data());
    return rhs;
}

CSL_INLINE csl_mp_int operator-(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    csl_mp_int result;
    mpz_sub(result.data(), rhs.data(), lhs.data());
    return result;
}

CSL_INLINE csl_mp_int &operator*=(csl_mp_int &rhs, const csl_mp_int &lhs)
{
    mpz_mul(rhs.data(), rhs.data(), lhs.data());
    return rhs;
}

CSL_INLINE csl_mp_int operator*(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    csl_mp_int result;
    mpz_mul(result.data(), rhs.data(), lhs.data());
    return result;
}

CSL_INLINE csl_mp_int &operator|=(csl_mp_int &rhs, const csl_mp_int &lhs)
{
    mpz_ior(rhs.data(), rhs.data(), lhs.data());
    return rhs;
}

CSL_INLINE csl_mp_int operator|(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    csl_mp_int result;
    mpz_ior(result.data(), rhs.data(), lhs.data());
    return result;
}

CSL_INLINE csl_mp_int &operator&=(csl_mp_int &rhs, const csl_mp_int &lhs)
{
    mpz_and(rhs.data(), rhs.data(), lhs.data());
    return rhs;
}

CSL_INLINE csl_mp_int operator&(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    csl_mp_int result;
    mpz_and(result.data(), rhs.data(), lhs.data());
    return result;
}

CSL_INLINE csl_mp_int &operator^=(csl_mp_int &rhs, const csl_mp_int &lhs)
{
    mpz_xor(rhs.data(), rhs.data(), lhs.data());
    return rhs;
}

CSL_INLINE csl_mp_int operator^(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    csl_mp_int result;
    mpz_xor(result.data(), rhs.data(), lhs.data());
    return result;
}

CSL_INLINE csl_mp_int &operator<<=(csl_mp_int &num, const mp_bitcnt_t amount)
{
    if (amount > 0)
    {
        mpz_mul_2exp(num.data(), num.data(), amount);
    }
    return num;
}

CSL_INLINE csl_mp_int operator<<(const csl_mp_int &num, const mp_bitcnt_t amount)
{
    if (amount > 0)
    {
        csl_mp_int result;
        mpz_mul_2exp(result.data(), num.data(), amount);
        return result;
    }
    return num;
}

CSL_INLINE csl_mp_int &operator>>=(csl_mp_int &num, const mp_bitcnt_t amount)
{
    if (amount > 0)
    {
        mpz_fdiv_q_2exp(num.data(), num.data(), amount);
    }
    return num;
}

CSL_INLINE csl_mp_int operator>>(const csl_mp_int &num, const mp_bitcnt_t amount)
{
    if (amount > 0)
    {
        csl_mp_int result;
        mpz_fdiv_q_2exp(result.data(), num.data(), amount);
        return result;
    }
    return num;
}

CSL_INLINE bool operator!=(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    return mpz_cmp(rhs.data(), lhs.data()) != 0;
}

CSL_INLINE bool operator!=(const csl_mp_int &rhs, int64_t lhs)
{
    return rhs != csl_mp_int(lhs);
}

CSL_INLINE bool operator!=(const csl_mp_int &rhs, const uint64_t lhs)
{
    return rhs != csl_mp_int(lhs);
}

CSL_INLINE bool operator!=(const csl_mp_int &rhs, const int lhs)
{
    return mpz_cmp_si(rhs.data(), lhs) != 0;
}

CSL_INLINE bool operator!=(const csl_mp_int &rhs, const unsigned int lhs)
{
    return mpz_cmp_ui(rhs.data(), lhs) != 0;
}

CSL_INLINE bool operator<(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    return mpz_cmp(rhs.data(), lhs.data()) < 0;
}

CSL_INLINE bool operator>(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    return mpz_cmp(rhs.data(), lhs.data()) > 0;
}

CSL_INLINE bool operator<=(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    return !(mpz_cmp(rhs.data(), lhs.data()) > 0);
}

CSL_INLINE bool operator>=(const csl_mp_int &rhs, const csl_mp_int &lhs)
{
    return !(mpz_cmp(rhs.data(), lhs.data()) < 0);
}

CSL_INLINE bool operator<(const csl_mp_int &rhs, const int lhs)
{
    return mpz_cmp_si(rhs.data(), lhs) < 0;
}

CSL_INLINE bool operator>(const csl_mp_int &rhs, const int lhs)
{
    return mpz_cmp_si(rhs.data(), lhs) > 0;
}

CSL_INLINE bool operator<=(const csl_mp_int &rhs, const int lhs)
{
    return !(mpz_cmp_si(rhs.data(), lhs) > 0);
}

CSL_INLINE bool operator>=(const csl_mp_int &rhs, const int lhs)
{
    return !(mpz_cmp_si(rhs.data(), lhs) < 0);
}

CSL_INLINE bool operator<(const csl_mp_int &rhs, const unsigned int lhs)
{
    return mpz_cmp_ui(rhs.data(), lhs) < 0;
}

CSL_INLINE bool operator>(const csl_mp_int &rhs, const unsigned int lhs)
{
    return mpz_cmp_ui(rhs.data(), lhs) > 0;
}

CSL_INLINE bool operator<=(const csl_mp_int &rhs, const unsigned int lhs)
{
    return !(mpz_cmp_ui(rhs.data(), lhs) > 0);
}

CSL_INLINE bool operator>=(const csl_mp_int &rhs, const unsigned int lhs)
{
    return !(mpz_cmp_ui(rhs.data(), lhs) < 0);
}

CSL_INLINE csl_mp_int csl_bit_mask_mp_int(size_t amount)
{
    return (csl_mp_int(uint64_t(1)) << amount) - csl_mp_int(uint64_t(1));
}

CSL_INLINE void csl_mask(csl_mp_int &iq, const csl_mp_int &v, size_t bitWidth)
{
    mpz_fdiv_r_2exp(iq.backend().data(), v.backend().data(), bitWidth);
}

CSL_INLINE void csl_set(int64_t &dst, const csl_mp_int &src)
{
    dst = csl_to_i64(src);
}
CSL_INLINE void csl_set(csl_mp_int &dst, int64_t src)
{
    dst = src;
}
CSL_INLINE void csl_set(csl_mp_int &dst, const csl_mp_int &src)
{
    dst = src;
}

CSL_INLINE void csl_mask_lower(csl_mp_int &iq, int64_t value, size_t width)
{
    mpz_fdiv_r_2exp(iq.backend().data(), csl_mp_int(value).backend().data(), width);
}

CSL_INLINE void csl_mask_lower(csl_mp_int &iq, const csl_mp_int &value, size_t width)
{
    mpz_fdiv_r_2exp(iq.backend().data(), value.backend().data(), width);
}

CSL_INLINE void csl_mask_lower(int64_t &iq, const csl_mp_int &value, size_t width)
{
    csl_mp_int r;
    mpz_fdiv_r_2exp(r.backend().data(), value.backend().data(), width);
    csl_set(iq, r);
}

CSL_INLINE csl_mp_int csl_mask_lower(const csl_mp_int &value, size_t width)
{
    csl_mp_int result = 0;
    mpz_fdiv_r_2exp(result.backend().data(), value.backend().data(), width);
    return result;
}

CSL_INLINE bool csl_test_bit(size_t bitPosition, const csl_mp_int &value)
{
    return mpz_tstbit(value.backend().data(), bitPosition) != 0;
}

CSL_INLINE csl_mp_int csl_ld_exp(const csl_mp_int &value, int exp2)
{
    csl_mp_int result;
    if (exp2 < 0)
    {
        mpz_fdiv_q_2exp(result.backend().data(), value.backend().data(), -exp2);
    }
    else
    {
        mpz_mul_2exp(result.backend().data(), value.backend().data(), exp2);
    }
    return result;
}

CSL_INLINE int64_t csl_abs(int64_t value)
{
    int64_t shr = value >> 63;
    return (value ^ shr) - shr;
}

CSL_INLINE int64_t csl_pow2(int64_t value)
{
    return (((int64_t)1) << value);
}

CSL_INLINE size_t csl_strlen(const char *str)
{
    const char *curr;
    for (curr = str; *curr; ++curr)
        ;
    return (curr - str);
}

CSL_INLINE void csl_ld_exp(csl_mp_int &result, const csl_mp_int &value, int exp2)
{
    result = csl_ld_exp(value, exp2);
}

CSL_INLINE void csl_set_upper(csl_mp_int &value, size_t bitWidth)
{
    mpz_com(value.backend().data(), value.backend().data());
    csl_mask_lower(value, value, bitWidth);
    mpz_com(value.backend().data(), value.backend().data());
}

CSL_INLINE void csl_not(csl_mp_int &result, const csl_mp_int &value, int bitWidth)
{
    mpz_set(result.backend().data(), value.backend().data());
    for (int i = 0; i < bitWidth; ++i)
    {
        mpz_combit(result.backend().data(), i);
    }
}

CSL_INLINE csl_mp_int csl_not(const csl_mp_int &value, int bitWidth)
{
    csl_mp_int result;
    mpz_set(result.backend().data(), value.backend().data());
    for (int i = 0; i < bitWidth; ++i)
    {
        mpz_combit(result.backend().data(), i);
    }
    return result;
}

CSL_INLINE void csl_boolean_complement(csl_mp_int &iq, const csl_mp_int &v)
{
    iq = ~v & 1;
}

CSL_INLINE void csl_set_bit(csl_mp_int &result, size_t position, bool clear)
{
    if (!clear)
    {
        mpz_setbit(result.backend().data(), position);
    }
    else
    {
        mpz_clrbit(result.backend().data(), position);
    }
}

#endif

#ifdef CSL_USE_MPFR
CSL_INLINE void csl_set(int64_t &dst, csl_fp32 src)
{
    csl_set(dst, static_cast<int64_t>(src.value.i));
}

CSL_INLINE void csl_set(csl_mp_float &dst, int64_t src)
{
    csl_fp32 tmp(src);
    mpfr_set_d(dst.m_value, static_cast<double>(tmp.value.f), MPFR_RNDN);
}

CSL_INLINE void csl_set(csl_mp_float &dst, const csl_mp_int &src)
{
    csl_fp32 tmp(src);
    mpfr_set_d(dst.m_value, static_cast<double>(tmp.value.f), MPFR_RNDN);
}

CSL_INLINE csl_mp_float &csl_mp_float::operator=(const csl_mp_float &x)
{
    mpfr_set(m_value, x.m_value, GMP_RNDN);
    return *this;
}

CSL_INLINE csl_mp_float::csl_mp_float(csl_mp_float_init_token)
{
    mpfr_init(m_value);
}

CSL_INLINE csl_mp_float::csl_mp_float(mp_prec_t precision)
{
    mpfr_init2(m_value, precision);
}

CSL_INLINE csl_mp_float::~csl_mp_float()
{
    mpfr_clear(m_value);
}

CSL_INLINE csl_fp32::csl_fp32(float f)
{
    value.f = f;
    value.f = csl_flush_subnormals(value.f);
    csl_flush_signed_nan(value.f);
}

CSL_INLINE csl_fp32::csl_fp32(const csl_mp_int &in)
{
    value.i = csl_to_u32(in);
    value.f = csl_flush_subnormals(value.f);
    csl_flush_signed_nan(value.f);
}

CSL_INLINE csl_fp32::csl_fp32(int64_t in)
{
    value.i = (unsigned int)(in);
    value.f = csl_flush_subnormals(value.f);
    csl_flush_signed_nan(value.f);
}

#endif

/** Generated steps begin */

#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_add(int64_t &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f + csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
// --------------------------------

#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_sub(int64_t &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f - csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
// --------------------------------

#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_mul(int64_t &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, csl_fp_mul_impl(csl_fp32(ia), csl_fp32(ib)).value.i);
}

#endif // CSL_USE_MPFR
// --------------------------------

CSL_INLINE void csl_step_add(int64_t &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, ia + ib);
}

// --------------------------------

CSL_INLINE void csl_step_mul(int64_t &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, ia * ib);
}

// --------------------------------

CSL_INLINE void csl_step_sub(int64_t &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, ia - ib);
}

// --------------------------------

CSL_INLINE void csl_step_addsub(int64_t ctrl, int64_t &iq, int64_t ia, int64_t ib)
{
    if (ctrl != int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

// --------------------------------

CSL_INLINE void csl_step_subadd(int64_t ctrl, int64_t &iq, int64_t ia, int64_t ib)
{
    if (ctrl == int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

// --------------------------------

CSL_INLINE void csl_step_const(int64_t &iq, int64_t ia)
{
    csl_set(iq, ia);
}

// --------------------------------

CSL_INLINE void csl_step_and(int64_t &iq, int64_t ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia & ib);
}

// --------------------------------

CSL_INLINE void csl_step_or(int64_t &iq, int64_t ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia | ib);
}

// --------------------------------

CSL_INLINE void csl_step_xor(int64_t &iq, int64_t ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia ^ ib);
}

// --------------------------------

CSL_INLINE void csl_step_nand(int64_t &iq, int64_t ia, int64_t ib, int bitWidth)
{
    csl_step_and(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

// --------------------------------

CSL_INLINE void csl_step_nor(int64_t &iq, int64_t ia, int64_t ib, int bitWidth)
{
    csl_step_or(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

// --------------------------------

CSL_INLINE void csl_step_nxor(int64_t &iq, int64_t ia, int64_t ib, int bitWidth)
{
    csl_step_xor(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

// --------------------------------

CSL_INLINE void csl_step_reducing_or(int64_t &iq, int64_t ia)
{
    csl_set(iq, (ia == 0) ? 0 : 1);
}

// --------------------------------

CSL_INLINE void csl_step_reducing_nor(int64_t &iq, int64_t ia)
{
    csl_step_reducing_or(iq, ia);
    csl_boolean_complement(iq, iq);
}

// --------------------------------

CSL_INLINE void csl_step_reducing_and(int64_t &iq, int64_t ia, size_t bitWidth, bool isSigned)
{
    (void)isSigned;
    uint64_t uia = *reinterpret_cast<const uint64_t *>(&ia);
    uint64_t mask = csl_bit_mask_u64(bitWidth);
    csl_set(iq, (mask & uia) == mask);
}

// --------------------------------

// --------------------------------

CSL_INLINE void csl_step_ld_exp(int64_t &iq, int64_t ia, int64_t ib, bool reverse)
{
    int exp = static_cast<int>(ib);
    csl_set(iq, csl_ld_exp(ia, reverse ? -exp : exp));
}

// --------------------------------

// --------------------------------

CSL_INLINE void csl_step_equal(int64_t &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, (ia == ib) ? 1 : 0);
}

// --------------------------------

CSL_INLINE void csl_step_nequal(int64_t &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, (ia != ib) ? 1 : 0);
}

// --------------------------------

CSL_INLINE void csl_step_reducing_nand(int64_t &iq, int64_t ia, size_t bitWidth, bool isSigned)
{
    csl_step_reducing_and(iq, ia, bitWidth, isSigned);
    csl_boolean_complement(iq, iq);
}

// --------------------------------

CSL_INLINE void csl_step_reducing_xor(int64_t &iq, int64_t ia, size_t bitWidth)
{
    bool result = csl_test_bit(0, ia);
    for (unsigned int i = 1; i < bitWidth; ++i)
    {
        result = result ^ csl_test_bit(i, ia);
    }
    csl_set(iq, result ? 1 : 0);
}

// --------------------------------

CSL_INLINE void csl_step_reducing_nxor(int64_t &iq, int64_t ia, size_t bitWidth)
{
    csl_step_reducing_xor(iq, ia, bitWidth);
    csl_boolean_complement(iq, iq);
}

// --------------------------------

CSL_INLINE void csl_step_bit_extract(int64_t &iq, int64_t ia, size_t width, bool signExtend, int bitPos)
{
    int64_t result = csl_ld_exp(ia, -bitPos);
    if (signExtend && csl_test_bit(width - 1, result))
    {
        csl_set_upper(result, width - 1);
    }
    else
    {
        result = csl_mask_lower(result, width);
    }
    csl_set(iq, result);
}

// --------------------------------

CSL_INLINE void csl_step_biased_round(int64_t &iq, int64_t ia, int bit)
{
    const int64_t half = csl_ld_exp(int64_t(1), bit - 1);
    csl_set(iq, csl_ld_exp(ia + half, -bit));
}

// --------------------------------

CSL_INLINE void csl_step_unbiased_round(int64_t &iq, int64_t ia, int bit)
{
    const int64_t half = csl_ld_exp(int64_t(1), bit - 1);

    int64_t fracMask = csl_mask_lower(ia, bit);
    if (fracMask == half)
    {
        int64_t q = csl_ld_exp(ia, -bit);
        if (csl_test_bit(0, q))
        {
            q += 1;
        }
        csl_set(iq, q);
    }
    else
    {
        csl_step_biased_round(iq, ia, bit);
    }
}

// --------------------------------

CSL_INLINE void csl_step_bit_reverse(int64_t &iq, int64_t ia, size_t bitWidth)
{
    csl_set(iq, 0);
    for (size_t i = 0; i < bitWidth; ++i)
    {
        if (csl_test_bit(i, ia))
        {
            csl_set_bit(iq, bitWidth - 1 - i, false);
        }
    }
}

// --------------------------------

CSL_INLINE void csl_step_sign_bit(int64_t &iq, int64_t ia, size_t bitWidth)
{
    csl_set(iq, (csl_test_bit(bitWidth - 1, ia) == true) ? 1 : 0);
}

// --------------------------------

CSL_INLINE void csl_step_nsign_bit(int64_t &iq, int64_t ia, size_t bitWidth)
{
    csl_set(iq, (csl_test_bit(bitWidth - 1, ia) == false) ? 1 : 0);
}

// --------------------------------

CSL_INLINE void csl_step_shift_right(int64_t &iq, int64_t ia, size_t amount)
{
    csl_set(iq, ia >> amount);
}

// --------------------------------

CSL_INLINE void csl_step_shift_left(int64_t &iq, int64_t ia, size_t amount)
{
    csl_set(iq, ia << amount);
}

// --------------------------------

// --------------------------------

CSL_INLINE void csl_step_test_bit(int64_t &iq, int64_t ia, size_t bitposition)
{
    csl_set(iq, csl_test_bit(bitposition, ia) ? 1 : 0);
}

// --------------------------------

CSL_INLINE void csl_step_set_bit(int64_t &iq, int64_t ia, size_t bitposition)
{
    csl_set_bit(iq, bitposition, ia == 0);
}

// --------------------------------

CSL_INLINE void csl_step_not(int64_t &iq, int64_t ia, int bitWidth)
{
    int64_t result;
    csl_not(result, ia, bitWidth);
    csl_set(iq, result);
}

// --------------------------------

CSL_INLINE void csl_step_not_signed(int64_t &iq, int64_t ia, int bitWidth)
{
    int64_t result;
    csl_not(result, ia, bitWidth);
    csl_set(iq, result);
    if (csl_test_bit(static_cast<size_t>(bitWidth) - 1, iq))
    {
        csl_set_upper(iq, static_cast<size_t>(bitWidth));
    }
    else
    {
        iq = csl_mask_lower(iq, static_cast<size_t>(bitWidth));
    }
}

// --------------------------------

CSL_INLINE void csl_step_sequencer(int64_t &state, int64_t &iq, int64_t ia, size_t offset, int64_t mod, int64_t cross)
{
    (void)offset;
    const bool enable = ia != 0;
    if (enable)
    {
        state += 1;
        state %= mod;
    }
    iq = state >= int64_t(cross) ? 1 : 0;
}

// --------------------------------

CSL_INLINE void csl_step_reduce(int64_t &iq, int64_t ia, size_t bitWidth)
{
    // test sign bit
    if (csl_test_bit(bitWidth - 1, ia) != 0)
    {
        csl_mask_lower(iq, ia, bitWidth - 1);
        int64_t b = csl_ld_exp(int64_t(1), (int)(bitWidth - 1));
        csl_set(iq, csl_safe_sub(iq, b));
    }
    else
    {
        csl_mask_lower(iq, ia, bitWidth - 1);
    }
}

// --------------------------------

CSL_INLINE void csl_step_counter(int64_t &counter, int64_t &iq, int64_t ia, size_t offset, int64_t inc, int64_t mod)
{
    const bool enable = ia != 0;
    if (enable)
    {
        counter += inc;
        counter %= mod;
    }
    csl_set(iq, counter + offset);
}

// --------------------------------

CSL_INLINE void csl_step_bit_combine(int64_t &iq, int64_t ia, int64_t ib, size_t num_bits, size_t index, size_t bitPos,
                                     size_t nextBitPos)
{
    if (index == 0)
    {
        csl_set(iq, ia | ib);
    }
    else
    {
        int64_t shiftedB = csl_ld_exp(int64_t(ib), static_cast<int>(bitPos));
        if (index < num_bits - 1)
        {
            // avoid masking out sign of last element
            shiftedB = csl_mask_lower(shiftedB, nextBitPos);
        }
        if (index == 1)
        {
            // mask 1st element during this iteration, as index = 0 can sometimes be skipped
            csl_set(iq, csl_mask_lower(ia, bitPos));
            csl_set(iq, iq | shiftedB);
        }
        else
        {
            csl_set(iq, ia | shiftedB);
        }
    }
}

// --------------------------------

CSL_INLINE bool csl_get_lookup_value(const int64_t *values, const int64_t n, int64_t key, int64_t &out)
{
    if ((key >= 0) && (key < n))
    {
        out = values[key];
        return true;
    }
    out = 0;
    return false;
}

// --------------------------------

CSL_INLINE bool csl_get_sparse_lookup_value(const int64_t *values, const unsigned char *exists, const int64_t n,
                                            int64_t key, int64_t &out)
{
    if (exists[key] && (key > 0) && (key < n))
    {
        out = values[key];
        return true;
    }
    out = 0;
    return false;
}

// --------------------------------

CSL_INLINE bool csl_get_sorted_lookup_value(const int64_t *keys, const int64_t *values, const int64_t n, int64_t key,
                                            int64_t &out)
{
    int64_t l = 0;
    int64_t r = n - 1;
    while (l <= r)
    {
        int64_t curr = l + (r - l) / 2;
        if (keys[curr] == key)
        {
            out = values[curr];
            return true;
        }
        if (keys[curr] < key)
        {
            l = curr + 1;
        }
        else
        {
            r = curr - 1;
        }
    }
    out = int64_t(0);
    return false;
}

// --------------------------------

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
}

// --------------------------------

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

// --------------------------------

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
}

// --------------------------------

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

// --------------------------------

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

// --------------------------------

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

// --------------------------------

// --------------------------------

CSL_INLINE void csl_step_decode(int64_t &iq0, int64_t ia, int64_t ib, int32_t low, int32_t high, int32_t decode)
{
    int64_t tmpA = csl_ld_exp(ia, -low);
    csl_mask_lower(tmpA, high - low + 1);
    bool hit = tmpA == decode;
    csl_set(iq0, hit ? ib : 0);
}

// --------------------------------

CSL_INLINE void csl_step_decode(int64_t &iq0, int64_t &iq1, int64_t ia, int64_t ib, int32_t low, int32_t high,
                                int32_t decode)
{
    int64_t tmpA = csl_ld_exp(ia, -low);
    csl_mask_lower(tmpA, high - low + 1);
    bool hit = tmpA == decode;
    csl_set(iq0, hit ? ib : 0);
    csl_set(iq1, hit ? 1 : 0);
}

// --------------------------------

#ifdef CSL_USE_MPIR

#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_add(int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f + csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_add(int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f + csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_add(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f + csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_add(csl_mp_int &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f + csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_add(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f + csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_add(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f + csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_add(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f + csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_sub(int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f - csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_sub(int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f - csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_sub(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f - csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_sub(csl_mp_int &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f - csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_sub(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f - csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_sub(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f - csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_sub(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp32(csl_fp32(ia).value.f - csl_fp32(ib).value.f).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_mul(int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp_mul_impl(csl_fp32(ia), csl_fp32(ib)).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_mul(int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, csl_fp_mul_impl(csl_fp32(ia), csl_fp32(ib)).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_mul(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp_mul_impl(csl_fp32(ia), csl_fp32(ib)).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_mul(csl_mp_int &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, csl_fp_mul_impl(csl_fp32(ia), csl_fp32(ib)).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_mul(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp_mul_impl(csl_fp32(ia), csl_fp32(ib)).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_mul(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, csl_fp_mul_impl(csl_fp32(ia), csl_fp32(ib)).value.i);
}

#endif // CSL_USE_MPFR
#ifdef CSL_USE_MPFR

CSL_INLINE void csl_step_fp_mul(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, csl_fp_mul_impl(csl_fp32(ia), csl_fp32(ib)).value.i);
}

#endif // CSL_USE_MPFR
CSL_INLINE void csl_step_add(int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, ia + ib);
}

CSL_INLINE void csl_step_add(int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, ia + ib);
}

CSL_INLINE void csl_step_add(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, ia + ib);
}

CSL_INLINE void csl_step_add(csl_mp_int &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, ia + ib);
}

CSL_INLINE void csl_step_add(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, ia + ib);
}

CSL_INLINE void csl_step_add(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, ia + ib);
}

CSL_INLINE void csl_step_add(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, ia + ib);
}

CSL_INLINE void csl_step_mul(int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, ia * ib);
}

CSL_INLINE void csl_step_mul(int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, ia * ib);
}

CSL_INLINE void csl_step_mul(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, ia * ib);
}

CSL_INLINE void csl_step_mul(csl_mp_int &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, ia * ib);
}

CSL_INLINE void csl_step_mul(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, ia * ib);
}

CSL_INLINE void csl_step_mul(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, ia * ib);
}

CSL_INLINE void csl_step_mul(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, ia * ib);
}

CSL_INLINE void csl_step_sub(int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, ia - ib);
}

CSL_INLINE void csl_step_sub(int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, ia - ib);
}

CSL_INLINE void csl_step_sub(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, ia - ib);
}

CSL_INLINE void csl_step_sub(csl_mp_int &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, ia - ib);
}

CSL_INLINE void csl_step_sub(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, ia - ib);
}

CSL_INLINE void csl_step_sub(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, ia - ib);
}

CSL_INLINE void csl_step_sub(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, ia - ib);
}

CSL_INLINE void csl_step_addsub(int64_t ctrl, int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    if (ctrl != int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(int64_t ctrl, int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    if (ctrl != int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(int64_t ctrl, int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    if (ctrl != int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(int64_t ctrl, csl_mp_int &iq, int64_t ia, int64_t ib)
{
    if (ctrl != int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(int64_t ctrl, csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    if (ctrl != int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(int64_t ctrl, csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    if (ctrl != int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(int64_t ctrl, csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    if (ctrl != int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(const csl_mp_int &ctrl, int64_t &iq, int64_t ia, int64_t ib)
{
    if (ctrl != csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(const csl_mp_int &ctrl, int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    if (ctrl != csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(const csl_mp_int &ctrl, int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    if (ctrl != csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(const csl_mp_int &ctrl, int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    if (ctrl != csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(const csl_mp_int &ctrl, csl_mp_int &iq, int64_t ia, int64_t ib)
{
    if (ctrl != csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(const csl_mp_int &ctrl, csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    if (ctrl != csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(const csl_mp_int &ctrl, csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    if (ctrl != csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_addsub(const csl_mp_int &ctrl, csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    if (ctrl != csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(int64_t ctrl, int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    if (ctrl == int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(int64_t ctrl, int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    if (ctrl == int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(int64_t ctrl, int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    if (ctrl == int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(int64_t ctrl, csl_mp_int &iq, int64_t ia, int64_t ib)
{
    if (ctrl == int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(int64_t ctrl, csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    if (ctrl == int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(int64_t ctrl, csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    if (ctrl == int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(int64_t ctrl, csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    if (ctrl == int64_t(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(const csl_mp_int &ctrl, int64_t &iq, int64_t ia, int64_t ib)
{
    if (ctrl == csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(const csl_mp_int &ctrl, int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    if (ctrl == csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(const csl_mp_int &ctrl, int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    if (ctrl == csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(const csl_mp_int &ctrl, int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    if (ctrl == csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(const csl_mp_int &ctrl, csl_mp_int &iq, int64_t ia, int64_t ib)
{
    if (ctrl == csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(const csl_mp_int &ctrl, csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    if (ctrl == csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(const csl_mp_int &ctrl, csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    if (ctrl == csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_subadd(const csl_mp_int &ctrl, csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    if (ctrl == csl_mp_int(0))
    {
        csl_step_add(iq, ia, ib);
    }
    else
    {
        csl_step_sub(iq, ia, ib);
    }
}

CSL_INLINE void csl_step_const(int64_t &iq, const csl_mp_int &ia)
{
    csl_set(iq, ia);
}

CSL_INLINE void csl_step_const(csl_mp_int &iq, int64_t ia)
{
    csl_set(iq, ia);
}

CSL_INLINE void csl_step_const(csl_mp_int &iq, const csl_mp_int &ia)
{
    csl_set(iq, ia);
}

CSL_INLINE void csl_step_and(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia & ib);
}

CSL_INLINE void csl_step_and(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia & ib);
}

CSL_INLINE void csl_step_and(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia & ib);
}

CSL_INLINE void csl_step_and(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia & ib);
}

CSL_INLINE void csl_step_and(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia & ib);
}

CSL_INLINE void csl_step_and(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia & ib);
}

CSL_INLINE void csl_step_and(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia & ib);
}

CSL_INLINE void csl_step_or(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia | ib);
}

CSL_INLINE void csl_step_or(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia | ib);
}

CSL_INLINE void csl_step_or(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia | ib);
}

CSL_INLINE void csl_step_or(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia | ib);
}

CSL_INLINE void csl_step_or(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia | ib);
}

CSL_INLINE void csl_step_or(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia | ib);
}

CSL_INLINE void csl_step_or(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia | ib);
}

CSL_INLINE void csl_step_xor(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia ^ ib);
}

CSL_INLINE void csl_step_xor(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia ^ ib);
}

CSL_INLINE void csl_step_xor(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia ^ ib);
}

CSL_INLINE void csl_step_xor(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia ^ ib);
}

CSL_INLINE void csl_step_xor(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia ^ ib);
}

CSL_INLINE void csl_step_xor(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia ^ ib);
}

CSL_INLINE void csl_step_xor(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    (void)bitWidth;
    csl_set(iq, ia ^ ib);
}

CSL_INLINE void csl_step_nand(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_and(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nand(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    csl_step_and(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nand(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_and(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nand(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth)
{
    csl_step_and(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nand(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_and(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nand(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    csl_step_and(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nand(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_and(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nor(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_or(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nor(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    csl_step_or(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nor(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_or(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nor(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth)
{
    csl_step_or(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nor(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_or(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nor(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    csl_step_or(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nor(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_or(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nxor(int64_t &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_xor(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nxor(int64_t &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    csl_step_xor(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nxor(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_xor(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nxor(csl_mp_int &iq, int64_t ia, int64_t ib, int bitWidth)
{
    csl_step_xor(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nxor(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_xor(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nxor(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, int bitWidth)
{
    csl_step_xor(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_nxor(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, int bitWidth)
{
    csl_step_xor(iq, ia, ib, bitWidth);
    csl_not(iq, iq, bitWidth);
}

CSL_INLINE void csl_step_reducing_or(int64_t &iq, const csl_mp_int &ia)
{
    csl_set(iq, (ia == 0) ? 0 : 1);
}

CSL_INLINE void csl_step_reducing_or(csl_mp_int &iq, int64_t ia)
{
    csl_set(iq, (ia == 0) ? 0 : 1);
}

CSL_INLINE void csl_step_reducing_or(csl_mp_int &iq, const csl_mp_int &ia)
{
    csl_set(iq, (ia == 0) ? 0 : 1);
}

CSL_INLINE void csl_step_reducing_nor(int64_t &iq, const csl_mp_int &ia)
{
    csl_step_reducing_or(iq, ia);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_reducing_nor(csl_mp_int &iq, int64_t ia)
{
    csl_step_reducing_or(iq, ia);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_reducing_nor(csl_mp_int &iq, const csl_mp_int &ia)
{
    csl_step_reducing_or(iq, ia);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_reducing_and(csl_mp_int &iq, int64_t ia, size_t bitWidth, bool isSigned)
{
    (void)isSigned;
    uint64_t uia = *reinterpret_cast<const uint64_t *>(&ia);
    uint64_t mask = csl_bit_mask_u64(bitWidth);
    csl_set(iq, (mask & uia) == mask);
}

CSL_INLINE void csl_step_reducing_and(int64_t &iq, const csl_mp_int &ia, size_t bitWidth, bool isSigned)
{
    bool result = false;
    if (isSigned)
    {
        result = (ia == -1);
    }
    else
    {
        csl_mp_int q = ia + 1;
        // is adding 1 causes nth-bit carry, then all n bits were set
        result = csl_test_bit(bitWidth, q) && !csl_test_bit(bitWidth, ia);
    }
    csl_set(iq, result ? 1 : 0);
}

CSL_INLINE void csl_step_reducing_and(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth, bool isSigned)
{
    bool result = false;
    if (isSigned)
    {
        result = (ia == -1);
    }
    else
    {
        csl_mp_int q = ia + 1;
        // is adding 1 causes nth-bit carry, then all n bits were set
        result = csl_test_bit(bitWidth, q) && !csl_test_bit(bitWidth, ia);
    }
    csl_set(iq, result ? 1 : 0);
}

CSL_INLINE void csl_step_ld_exp(int64_t &iq, const csl_mp_int &ia, int64_t ib, bool reverse)
{
    int exp = static_cast<int>(ib);
    csl_set(iq, csl_ld_exp(ia, reverse ? -exp : exp));
}

CSL_INLINE void csl_step_ld_exp(csl_mp_int &iq, int64_t ia, int64_t ib, bool reverse)
{
    int exp = static_cast<int>(ib);
    csl_set(iq, csl_ld_exp(ia, reverse ? -exp : exp));
}

CSL_INLINE void csl_step_ld_exp(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, bool reverse)
{
    int exp = static_cast<int>(ib);
    csl_set(iq, csl_ld_exp(ia, reverse ? -exp : exp));
}

CSL_INLINE void csl_step_ld_exp(int64_t &iq, int64_t ia, const csl_mp_int &ib, bool reverse)
{
    int ibi = csl_to_i32(ib);
    csl_set(iq, csl_ld_exp(ia, reverse ? (-ibi) : ibi));
}

CSL_INLINE void csl_step_ld_exp(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, bool reverse)
{
    int ibi = csl_to_i32(ib);
    csl_set(iq, csl_ld_exp(ia, reverse ? (-ibi) : ibi));
}

CSL_INLINE void csl_step_ld_exp(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, bool reverse)
{
    int ibi = csl_to_i32(ib);
    csl_set(iq, csl_ld_exp(ia, reverse ? (-ibi) : ibi));
}

CSL_INLINE void csl_step_ld_exp(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, bool reverse)
{
    int ibi = csl_to_i32(ib);
    csl_set(iq, csl_ld_exp(ia, reverse ? (-ibi) : ibi));
}

CSL_INLINE void csl_step_equal(int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, (ia == ib) ? 1 : 0);
}

CSL_INLINE void csl_step_equal(int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, (ia == ib) ? 1 : 0);
}

CSL_INLINE void csl_step_equal(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, (ia == ib) ? 1 : 0);
}

CSL_INLINE void csl_step_equal(csl_mp_int &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, (ia == ib) ? 1 : 0);
}

CSL_INLINE void csl_step_equal(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, (ia == ib) ? 1 : 0);
}

CSL_INLINE void csl_step_equal(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, (ia == ib) ? 1 : 0);
}

CSL_INLINE void csl_step_equal(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, (ia == ib) ? 1 : 0);
}

CSL_INLINE void csl_step_nequal(int64_t &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, (ia != ib) ? 1 : 0);
}

CSL_INLINE void csl_step_nequal(int64_t &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, (ia != ib) ? 1 : 0);
}

CSL_INLINE void csl_step_nequal(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, (ia != ib) ? 1 : 0);
}

CSL_INLINE void csl_step_nequal(csl_mp_int &iq, int64_t ia, int64_t ib)
{
    csl_set(iq, (ia != ib) ? 1 : 0);
}

CSL_INLINE void csl_step_nequal(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib)
{
    csl_set(iq, (ia != ib) ? 1 : 0);
}

CSL_INLINE void csl_step_nequal(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib)
{
    csl_set(iq, (ia != ib) ? 1 : 0);
}

CSL_INLINE void csl_step_nequal(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib)
{
    csl_set(iq, (ia != ib) ? 1 : 0);
}

CSL_INLINE void csl_step_reducing_nand(int64_t &iq, const csl_mp_int &ia, size_t bitWidth, bool isSigned)
{
    csl_step_reducing_and(iq, ia, bitWidth, isSigned);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_reducing_nand(csl_mp_int &iq, int64_t ia, size_t bitWidth, bool isSigned)
{
    csl_step_reducing_and(iq, ia, bitWidth, isSigned);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_reducing_nand(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth, bool isSigned)
{
    csl_step_reducing_and(iq, ia, bitWidth, isSigned);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_reducing_xor(int64_t &iq, const csl_mp_int &ia, size_t bitWidth)
{
    bool result = csl_test_bit(0, ia);
    for (unsigned int i = 1; i < bitWidth; ++i)
    {
        result = result ^ csl_test_bit(i, ia);
    }
    csl_set(iq, result ? 1 : 0);
}

CSL_INLINE void csl_step_reducing_xor(csl_mp_int &iq, int64_t ia, size_t bitWidth)
{
    bool result = csl_test_bit(0, ia);
    for (unsigned int i = 1; i < bitWidth; ++i)
    {
        result = result ^ csl_test_bit(i, ia);
    }
    csl_set(iq, result ? 1 : 0);
}

CSL_INLINE void csl_step_reducing_xor(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth)
{
    bool result = csl_test_bit(0, ia);
    for (unsigned int i = 1; i < bitWidth; ++i)
    {
        result = result ^ csl_test_bit(i, ia);
    }
    csl_set(iq, result ? 1 : 0);
}

CSL_INLINE void csl_step_reducing_nxor(int64_t &iq, const csl_mp_int &ia, size_t bitWidth)
{
    csl_step_reducing_xor(iq, ia, bitWidth);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_reducing_nxor(csl_mp_int &iq, int64_t ia, size_t bitWidth)
{
    csl_step_reducing_xor(iq, ia, bitWidth);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_reducing_nxor(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth)
{
    csl_step_reducing_xor(iq, ia, bitWidth);
    csl_boolean_complement(iq, iq);
}

CSL_INLINE void csl_step_bit_extract(int64_t &iq, const csl_mp_int &ia, size_t width, bool signExtend, int bitPos)
{
    csl_mp_int result = csl_ld_exp(ia, -bitPos);
    if (signExtend && csl_test_bit(width - 1, result))
    {
        csl_set_upper(result, width - 1);
    }
    else
    {
        result = csl_mask_lower(result, width);
    }
    csl_set(iq, result);
}

CSL_INLINE void csl_step_bit_extract(csl_mp_int &iq, int64_t ia, size_t width, bool signExtend, int bitPos)
{
    int64_t result = csl_ld_exp(ia, -bitPos);
    if (signExtend && csl_test_bit(width - 1, result))
    {
        csl_set_upper(result, width - 1);
    }
    else
    {
        result = csl_mask_lower(result, width);
    }
    csl_set(iq, result);
}

CSL_INLINE void csl_step_bit_extract(csl_mp_int &iq, const csl_mp_int &ia, size_t width, bool signExtend, int bitPos)
{
    csl_mp_int result = csl_ld_exp(ia, -bitPos);
    if (signExtend && csl_test_bit(width - 1, result))
    {
        csl_set_upper(result, width - 1);
    }
    else
    {
        result = csl_mask_lower(result, width);
    }
    csl_set(iq, result);
}

CSL_INLINE void csl_step_biased_round(int64_t &iq, const csl_mp_int &ia, int bit)
{
    const csl_mp_int half = csl_ld_exp(csl_mp_int(1), bit - 1);
    csl_set(iq, csl_ld_exp(ia + half, -bit));
}

CSL_INLINE void csl_step_biased_round(csl_mp_int &iq, int64_t ia, int bit)
{
    const int64_t half = csl_ld_exp(int64_t(1), bit - 1);
    csl_set(iq, csl_ld_exp(ia + half, -bit));
}

CSL_INLINE void csl_step_biased_round(csl_mp_int &iq, const csl_mp_int &ia, int bit)
{
    const csl_mp_int half = csl_ld_exp(csl_mp_int(1), bit - 1);
    csl_set(iq, csl_ld_exp(ia + half, -bit));
}

CSL_INLINE void csl_step_unbiased_round(int64_t &iq, const csl_mp_int &ia, int bit)
{
    const csl_mp_int half = csl_ld_exp(csl_mp_int(1), bit - 1);

    csl_mp_int fracMask = csl_mask_lower(ia, bit);
    if (fracMask == half)
    {
        csl_mp_int q = csl_ld_exp(ia, -bit);
        if (csl_test_bit(0, q))
        {
            q += 1;
        }
        csl_set(iq, q);
    }
    else
    {
        csl_step_biased_round(iq, ia, bit);
    }
}

CSL_INLINE void csl_step_unbiased_round(csl_mp_int &iq, int64_t ia, int bit)
{
    const int64_t half = csl_ld_exp(int64_t(1), bit - 1);

    int64_t fracMask = csl_mask_lower(ia, bit);
    if (fracMask == half)
    {
        int64_t q = csl_ld_exp(ia, -bit);
        if (csl_test_bit(0, q))
        {
            q += 1;
        }
        csl_set(iq, q);
    }
    else
    {
        csl_step_biased_round(iq, ia, bit);
    }
}

CSL_INLINE void csl_step_unbiased_round(csl_mp_int &iq, const csl_mp_int &ia, int bit)
{
    const csl_mp_int half = csl_ld_exp(csl_mp_int(1), bit - 1);

    csl_mp_int fracMask = csl_mask_lower(ia, bit);
    if (fracMask == half)
    {
        csl_mp_int q = csl_ld_exp(ia, -bit);
        if (csl_test_bit(0, q))
        {
            q += 1;
        }
        csl_set(iq, q);
    }
    else
    {
        csl_step_biased_round(iq, ia, bit);
    }
}

CSL_INLINE void csl_step_bit_reverse(int64_t &iq, const csl_mp_int &ia, size_t bitWidth)
{
    csl_set(iq, 0);
    for (size_t i = 0; i < bitWidth; ++i)
    {
        if (csl_test_bit(i, ia))
        {
            csl_set_bit(iq, bitWidth - 1 - i, false);
        }
    }
}

CSL_INLINE void csl_step_bit_reverse(csl_mp_int &iq, int64_t ia, size_t bitWidth)
{
    csl_set(iq, 0);
    for (size_t i = 0; i < bitWidth; ++i)
    {
        if (csl_test_bit(i, ia))
        {
            csl_set_bit(iq, bitWidth - 1 - i, false);
        }
    }
}

CSL_INLINE void csl_step_bit_reverse(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth)
{
    csl_set(iq, 0);
    for (size_t i = 0; i < bitWidth; ++i)
    {
        if (csl_test_bit(i, ia))
        {
            csl_set_bit(iq, bitWidth - 1 - i, false);
        }
    }
}

CSL_INLINE void csl_step_sign_bit(int64_t &iq, const csl_mp_int &ia, size_t bitWidth)
{
    csl_set(iq, (csl_test_bit(bitWidth - 1, ia) == true) ? 1 : 0);
}

CSL_INLINE void csl_step_sign_bit(csl_mp_int &iq, int64_t ia, size_t bitWidth)
{
    csl_set(iq, (csl_test_bit(bitWidth - 1, ia) == true) ? 1 : 0);
}

CSL_INLINE void csl_step_sign_bit(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth)
{
    csl_set(iq, (csl_test_bit(bitWidth - 1, ia) == true) ? 1 : 0);
}

CSL_INLINE void csl_step_nsign_bit(int64_t &iq, const csl_mp_int &ia, size_t bitWidth)
{
    csl_set(iq, (csl_test_bit(bitWidth - 1, ia) == false) ? 1 : 0);
}

CSL_INLINE void csl_step_nsign_bit(csl_mp_int &iq, int64_t ia, size_t bitWidth)
{
    csl_set(iq, (csl_test_bit(bitWidth - 1, ia) == false) ? 1 : 0);
}

CSL_INLINE void csl_step_nsign_bit(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth)
{
    csl_set(iq, (csl_test_bit(bitWidth - 1, ia) == false) ? 1 : 0);
}

CSL_INLINE void csl_step_shift_right(int64_t &iq, const csl_mp_int &ia, size_t amount)
{
    csl_set(iq, ia >> amount);
}

CSL_INLINE void csl_step_shift_right(csl_mp_int &iq, int64_t ia, size_t amount)
{
    csl_set(iq, ia >> amount);
}

CSL_INLINE void csl_step_shift_right(csl_mp_int &iq, const csl_mp_int &ia, size_t amount)
{
    csl_set(iq, ia >> amount);
}

CSL_INLINE void csl_step_shift_left(int64_t &iq, const csl_mp_int &ia, size_t amount)
{
    csl_set(iq, ia << amount);
}

CSL_INLINE void csl_step_shift_left(csl_mp_int &iq, int64_t ia, size_t amount)
{
    csl_set(iq, csl_mp_int(ia) << amount);
}

CSL_INLINE void csl_step_shift_left(csl_mp_int &iq, const csl_mp_int &ia, size_t amount)
{
    csl_set(iq, csl_mp_int(ia) << amount);
}

CSL_INLINE void csl_step_test_bit(int64_t &iq, const csl_mp_int &ia, size_t bitposition)
{
    csl_set(iq, csl_test_bit(bitposition, ia) ? 1 : 0);
}

CSL_INLINE void csl_step_test_bit(csl_mp_int &iq, int64_t ia, size_t bitposition)
{
    csl_set(iq, csl_test_bit(bitposition, ia) ? 1 : 0);
}

CSL_INLINE void csl_step_test_bit(csl_mp_int &iq, const csl_mp_int &ia, size_t bitposition)
{
    csl_set(iq, csl_test_bit(bitposition, ia) ? 1 : 0);
}

CSL_INLINE void csl_step_set_bit(int64_t &iq, const csl_mp_int &ia, size_t bitposition)
{
    csl_set_bit(iq, bitposition, ia == 0);
}

CSL_INLINE void csl_step_set_bit(csl_mp_int &iq, int64_t ia, size_t bitposition)
{
    csl_set_bit(iq, bitposition, ia == 0);
}

CSL_INLINE void csl_step_set_bit(csl_mp_int &iq, const csl_mp_int &ia, size_t bitposition)
{
    csl_set_bit(iq, bitposition, ia == 0);
}

CSL_INLINE void csl_step_not(int64_t &iq, const csl_mp_int &ia, int bitWidth)
{
    csl_mp_int result;
    csl_not(result, ia, bitWidth);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_not(csl_mp_int &iq, int64_t ia, int bitWidth)
{
    int64_t result;
    csl_not(result, ia, bitWidth);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_not(csl_mp_int &iq, const csl_mp_int &ia, int bitWidth)
{
    csl_mp_int result;
    csl_not(result, ia, bitWidth);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_not_signed(int64_t &iq, const csl_mp_int &ia, int bitWidth)
{
    csl_mp_int result;
    csl_not(result, ia, bitWidth);
    csl_set(iq, result);
    if (csl_test_bit(static_cast<size_t>(bitWidth) - 1, iq))
    {
        csl_set_upper(iq, static_cast<size_t>(bitWidth));
    }
    else
    {
        iq = csl_mask_lower(iq, static_cast<size_t>(bitWidth));
    }
}

CSL_INLINE void csl_step_not_signed(csl_mp_int &iq, int64_t ia, int bitWidth)
{
    int64_t result;
    csl_not(result, ia, bitWidth);
    csl_set(iq, result);
    if (csl_test_bit(static_cast<size_t>(bitWidth) - 1, iq))
    {
        csl_set_upper(iq, static_cast<size_t>(bitWidth));
    }
    else
    {
        iq = csl_mask_lower(iq, static_cast<size_t>(bitWidth));
    }
}

CSL_INLINE void csl_step_not_signed(csl_mp_int &iq, const csl_mp_int &ia, int bitWidth)
{
    csl_mp_int result;
    csl_not(result, ia, bitWidth);
    csl_set(iq, result);
    if (csl_test_bit(static_cast<size_t>(bitWidth) - 1, iq))
    {
        csl_set_upper(iq, static_cast<size_t>(bitWidth));
    }
    else
    {
        iq = csl_mask_lower(iq, static_cast<size_t>(bitWidth));
    }
}

CSL_INLINE void csl_step_sequencer(csl_mp_int &state, csl_mp_int &iq, const csl_mp_int &ia, size_t offset, int64_t mod,
                                   int64_t cross)
{
    (void)offset;
    const bool enable = ia != 0;
    if (enable)
    {
        state += 1;
        state %= mod;
    }
    iq = state >= csl_mp_int(cross) ? 1 : 0;
}

CSL_INLINE void csl_step_reduce(int64_t &iq, const csl_mp_int &ia, size_t bitWidth)
{
    // test sign bit
    if (csl_test_bit(bitWidth - 1, ia) != 0)
    {
        csl_mask_lower(iq, ia, bitWidth - 1);
        int64_t b = csl_ld_exp(int64_t(1), (int)(bitWidth - 1));
        csl_set(iq, csl_safe_sub(iq, b));
    }
    else
    {
        csl_mask_lower(iq, ia, bitWidth - 1);
    }
}

CSL_INLINE void csl_step_reduce(csl_mp_int &iq, int64_t ia, size_t bitWidth)
{
    // test sign bit
    if (csl_test_bit(bitWidth - 1, ia) != 0)
    {
        csl_mask_lower(iq, ia, bitWidth - 1);
        csl_mp_int b = csl_ld_exp(csl_mp_int(1), (int)(bitWidth - 1));
        csl_set(iq, csl_safe_sub(iq, b));
    }
    else
    {
        csl_mask_lower(iq, ia, bitWidth - 1);
    }
}

CSL_INLINE void csl_step_reduce(csl_mp_int &iq, const csl_mp_int &ia, size_t bitWidth)
{
    // test sign bit
    if (csl_test_bit(bitWidth - 1, ia) != 0)
    {
        csl_mask_lower(iq, ia, bitWidth - 1);
        csl_mp_int b = csl_ld_exp(csl_mp_int(1), (int)(bitWidth - 1));
        csl_set(iq, csl_safe_sub(iq, b));
    }
    else
    {
        csl_mask_lower(iq, ia, bitWidth - 1);
    }
}

CSL_INLINE void csl_step_counter(int64_t &counter, int64_t &iq, const csl_mp_int &ia, size_t offset, int64_t inc,
                                 int64_t mod)
{
    const bool enable = ia != 0;
    if (enable)
    {
        counter += inc;
        counter %= mod;
    }
    csl_set(iq, counter + offset);
}

CSL_INLINE void csl_step_counter(int64_t &counter, csl_mp_int &iq, int64_t ia, size_t offset, int64_t inc, int64_t mod)
{
    const bool enable = ia != 0;
    if (enable)
    {
        counter += inc;
        counter %= mod;
    }
    csl_set(iq, counter + offset);
}

CSL_INLINE void csl_step_counter(int64_t &counter, csl_mp_int &iq, const csl_mp_int &ia, size_t offset, int64_t inc,
                                 int64_t mod)
{
    const bool enable = ia != 0;
    if (enable)
    {
        counter += inc;
        counter %= mod;
    }
    csl_set(iq, counter + offset);
}

CSL_INLINE void csl_step_counter(csl_mp_int &counter, int64_t &iq, int64_t ia, size_t offset, int64_t inc, int64_t mod)
{
    const bool enable = ia != 0;
    if (enable)
    {
        counter += inc;
        counter %= mod;
    }
    csl_set(iq, counter + offset);
}

CSL_INLINE void csl_step_counter(csl_mp_int &counter, int64_t &iq, const csl_mp_int &ia, size_t offset, int64_t inc,
                                 int64_t mod)
{
    const bool enable = ia != 0;
    if (enable)
    {
        counter += inc;
        counter %= mod;
    }
    csl_set(iq, counter + offset);
}

CSL_INLINE void csl_step_counter(csl_mp_int &counter, csl_mp_int &iq, int64_t ia, size_t offset, int64_t inc,
                                 int64_t mod)
{
    const bool enable = ia != 0;
    if (enable)
    {
        counter += inc;
        counter %= mod;
    }
    csl_set(iq, counter + offset);
}

CSL_INLINE void csl_step_counter(csl_mp_int &counter, csl_mp_int &iq, const csl_mp_int &ia, size_t offset, int64_t inc,
                                 int64_t mod)
{
    const bool enable = ia != 0;
    if (enable)
    {
        counter += inc;
        counter %= mod;
    }
    csl_set(iq, counter + offset);
}

CSL_INLINE void csl_step_bit_combine(int64_t &iq, int64_t ia, const csl_mp_int &ib, size_t num_bits, size_t index,
                                     size_t bitPos, size_t nextBitPos)
{
    if (index == 0)
    {
        csl_set(iq, ia | ib);
    }
    else
    {
        csl_mp_int shiftedB = csl_ld_exp(csl_mp_int(ib), static_cast<int>(bitPos));
        if (index < num_bits - 1)
        {
            // avoid masking out sign of last element
            shiftedB = csl_mask_lower(shiftedB, nextBitPos);
        }
        if (index == 1)
        {
            // mask 1st element during this iteration, as index = 0 can sometimes be skipped
            csl_set(iq, csl_mask_lower(ia, bitPos));
            csl_set(iq, iq | shiftedB);
        }
        else
        {
            csl_set(iq, ia | shiftedB);
        }
    }
}

CSL_INLINE void csl_step_bit_combine(int64_t &iq, const csl_mp_int &ia, int64_t ib, size_t num_bits, size_t index,
                                     size_t bitPos, size_t nextBitPos)
{
    if (index == 0)
    {
        csl_set(iq, ia | ib);
    }
    else
    {
        csl_mp_int shiftedB = csl_ld_exp(csl_mp_int(ib), static_cast<int>(bitPos));
        if (index < num_bits - 1)
        {
            // avoid masking out sign of last element
            shiftedB = csl_mask_lower(shiftedB, nextBitPos);
        }
        if (index == 1)
        {
            // mask 1st element during this iteration, as index = 0 can sometimes be skipped
            csl_set(iq, csl_mask_lower(ia, bitPos));
            csl_set(iq, iq | shiftedB);
        }
        else
        {
            csl_set(iq, ia | shiftedB);
        }
    }
}

CSL_INLINE void csl_step_bit_combine(int64_t &iq, const csl_mp_int &ia, const csl_mp_int &ib, size_t num_bits,
                                     size_t index, size_t bitPos, size_t nextBitPos)
{
    if (index == 0)
    {
        csl_set(iq, ia | ib);
    }
    else
    {
        csl_mp_int shiftedB = csl_ld_exp(csl_mp_int(ib), static_cast<int>(bitPos));
        if (index < num_bits - 1)
        {
            // avoid masking out sign of last element
            shiftedB = csl_mask_lower(shiftedB, nextBitPos);
        }
        if (index == 1)
        {
            // mask 1st element during this iteration, as index = 0 can sometimes be skipped
            csl_set(iq, csl_mask_lower(ia, bitPos));
            csl_set(iq, iq | shiftedB);
        }
        else
        {
            csl_set(iq, ia | shiftedB);
        }
    }
}

CSL_INLINE void csl_step_bit_combine(csl_mp_int &iq, int64_t ia, int64_t ib, size_t num_bits, size_t index,
                                     size_t bitPos, size_t nextBitPos)
{
    if (index == 0)
    {
        csl_set(iq, ia | ib);
    }
    else
    {
        csl_mp_int shiftedB = csl_ld_exp(csl_mp_int(ib), static_cast<int>(bitPos));
        if (index < num_bits - 1)
        {
            // avoid masking out sign of last element
            shiftedB = csl_mask_lower(shiftedB, nextBitPos);
        }
        if (index == 1)
        {
            // mask 1st element during this iteration, as index = 0 can sometimes be skipped
            csl_set(iq, csl_mask_lower(ia, bitPos));
            csl_set(iq, iq | shiftedB);
        }
        else
        {
            csl_set(iq, ia | shiftedB);
        }
    }
}

CSL_INLINE void csl_step_bit_combine(csl_mp_int &iq, int64_t ia, const csl_mp_int &ib, size_t num_bits, size_t index,
                                     size_t bitPos, size_t nextBitPos)
{
    if (index == 0)
    {
        csl_set(iq, ia | ib);
    }
    else
    {
        csl_mp_int shiftedB = csl_ld_exp(csl_mp_int(ib), static_cast<int>(bitPos));
        if (index < num_bits - 1)
        {
            // avoid masking out sign of last element
            shiftedB = csl_mask_lower(shiftedB, nextBitPos);
        }
        if (index == 1)
        {
            // mask 1st element during this iteration, as index = 0 can sometimes be skipped
            csl_set(iq, csl_mask_lower(ia, bitPos));
            csl_set(iq, iq | shiftedB);
        }
        else
        {
            csl_set(iq, ia | shiftedB);
        }
    }
}

CSL_INLINE void csl_step_bit_combine(csl_mp_int &iq, const csl_mp_int &ia, int64_t ib, size_t num_bits, size_t index,
                                     size_t bitPos, size_t nextBitPos)
{
    if (index == 0)
    {
        csl_set(iq, ia | ib);
    }
    else
    {
        csl_mp_int shiftedB = csl_ld_exp(csl_mp_int(ib), static_cast<int>(bitPos));
        if (index < num_bits - 1)
        {
            // avoid masking out sign of last element
            shiftedB = csl_mask_lower(shiftedB, nextBitPos);
        }
        if (index == 1)
        {
            // mask 1st element during this iteration, as index = 0 can sometimes be skipped
            csl_set(iq, csl_mask_lower(ia, bitPos));
            csl_set(iq, iq | shiftedB);
        }
        else
        {
            csl_set(iq, ia | shiftedB);
        }
    }
}

CSL_INLINE void csl_step_bit_combine(csl_mp_int &iq, const csl_mp_int &ia, const csl_mp_int &ib, size_t num_bits,
                                     size_t index, size_t bitPos, size_t nextBitPos)
{
    if (index == 0)
    {
        csl_set(iq, ia | ib);
    }
    else
    {
        csl_mp_int shiftedB = csl_ld_exp(csl_mp_int(ib), static_cast<int>(bitPos));
        if (index < num_bits - 1)
        {
            // avoid masking out sign of last element
            shiftedB = csl_mask_lower(shiftedB, nextBitPos);
        }
        if (index == 1)
        {
            // mask 1st element during this iteration, as index = 0 can sometimes be skipped
            csl_set(iq, csl_mask_lower(ia, bitPos));
            csl_set(iq, iq | shiftedB);
        }
        else
        {
            csl_set(iq, ia | shiftedB);
        }
    }
}

CSL_INLINE bool csl_get_lookup_value(const csl_mp_int *values, const int64_t n, int64_t key, csl_mp_int &out)
{
    if ((key >= 0) && (key < n))
    {
        out = values[key];
        return true;
    }
    out = 0;
    return false;
}

CSL_INLINE bool csl_get_sparse_lookup_value(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                            int64_t key, csl_mp_int &out)
{
    if (exists[key] && (key > 0) && (key < n))
    {
        out = values[key];
        return true;
    }
    out = 0;
    return false;
}

CSL_INLINE bool csl_get_sorted_lookup_value(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t key,
                                            csl_mp_int &out)
{
    int64_t l = 0;
    int64_t r = n - 1;
    while (l <= r)
    {
        int64_t curr = l + (r - l) / 2;
        if (keys[curr] == key)
        {
            out = values[curr];
            return true;
        }
        if (keys[curr] < key)
        {
            l = curr + 1;
        }
        else
        {
            r = curr - 1;
        }
    }
    out = csl_mp_int(0);
    return false;
}

CSL_INLINE bool csl_get_sorted_lookup_value(const csl_mp_int *keys, const int64_t *values, const int64_t n,
                                            const csl_mp_int &key, int64_t &out)
{
    int64_t l = 0;
    int64_t r = n - 1;
    while (l <= r)
    {
        int64_t curr = l + (r - l) / 2;
        if (keys[curr] == key)
        {
            out = values[curr];
            return true;
        }
        if (keys[curr] < key)
        {
            l = curr + 1;
        }
        else
        {
            r = curr - 1;
        }
    }
    out = int64_t(0);
    return false;
}

CSL_INLINE bool csl_get_sorted_lookup_value(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n,
                                            const csl_mp_int &key, csl_mp_int &out)
{
    int64_t l = 0;
    int64_t r = n - 1;
    while (l <= r)
    {
        int64_t curr = l + (r - l) / 2;
        if (keys[curr] == key)
        {
            out = values[curr];
            return true;
        }
        if (keys[curr] < key)
        {
            l = curr + 1;
        }
        else
        {
            r = curr - 1;
        }
    }
    out = csl_mp_int(0);
    return false;
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const int64_t *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, int64_t &iq,
                                csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup(const csl_mp_int *values, const int64_t n, const uint64_t offset, csl_mp_int &iq,
                                csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_lookup_value(values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const int64_t *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, csl_mp_int &ivalid,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    int64_t result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, int64_t &iq, csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sparse(const csl_mp_int *values, const unsigned char *exists, const int64_t n,
                                       const uint64_t offset, csl_mp_int &iq, csl_mp_int &ivalid,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in) - offset;
    csl_mp_int result;
    bool valid = csl_get_sparse_lookup_value(values, exists, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                                       int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n,
                                       csl_mp_int &iq, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n,
                                       csl_mp_int &iq, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, int64_t &iq,
                                       csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const int64_t *values, const int64_t n, csl_mp_int &iq,
                                       csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    int64_t result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                                       int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                                       csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                                       int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const int64_t *keys, const csl_mp_int *values, const int64_t n, csl_mp_int &iq,
                                       csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n, int64_t &iq,
                                       csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n,
                                       csl_mp_int &iq, int64_t &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n,
                                       csl_mp_int &iq, csl_mp_int &ivalid, int64_t ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n,
                                       csl_mp_int &iq, int64_t &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_lookup_sorted(const csl_mp_int *keys, const csl_mp_int *values, const int64_t n,
                                       csl_mp_int &iq, csl_mp_int &ivalid, const csl_mp_int &ia_in)
{
    uint64_t ia = csl_to_u64(ia_in);
    csl_mp_int result;
    bool valid = csl_get_sorted_lookup_value(keys, values, n, ia, result);
    csl_set(iq, result);
    csl_set(ivalid, valid ? 1 : 0);
}

CSL_INLINE void csl_step_decode(csl_mp_int &iq0, const csl_mp_int &ia, const csl_mp_int &ib, int32_t low, int32_t high,
                                int32_t decode)
{
    csl_mp_int tmpA = csl_ld_exp(ia, -low);
    csl_mask_lower(tmpA, high - low + 1);
    bool hit = tmpA == decode;
    csl_set(iq0, hit ? ib : 0);
}

CSL_INLINE void csl_step_decode(csl_mp_int &iq0, csl_mp_int &iq1, const csl_mp_int &ia, const csl_mp_int &ib,
                                int32_t low, int32_t high, int32_t decode)
{
    csl_mp_int tmpA = csl_ld_exp(ia, -low);
    csl_mask_lower(tmpA, high - low + 1);
    bool hit = tmpA == decode;
    csl_set(iq0, hit ? ib : 0);
    csl_set(iq1, hit ? 1 : 0);
}

#endif // CSL_USE_MPIR

/** Generated steps end */
