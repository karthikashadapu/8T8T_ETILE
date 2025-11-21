#include "csl_io.h"
#include <algorithm>
#include <sstream>

namespace
{
static const int64_t s_pow2mask[65] = {(((int64_t)1) << 0) - 1,
                                       (((int64_t)1) << 1) - 1,
                                       (((int64_t)1) << 2) - 1,
                                       (((int64_t)1) << 3) - 1,
                                       (((int64_t)1) << 4) - 1,
                                       (((int64_t)1) << 5) - 1,
                                       (((int64_t)1) << 6) - 1,
                                       (((int64_t)1) << 7) - 1,
                                       (((int64_t)1) << 8) - 1,
                                       (((int64_t)1) << 9) - 1,
                                       (((int64_t)1) << 10) - 1,
                                       (((int64_t)1) << 11) - 1,
                                       (((int64_t)1) << 12) - 1,
                                       (((int64_t)1) << 13) - 1,
                                       (((int64_t)1) << 14) - 1,
                                       (((int64_t)1) << 15) - 1,
                                       (((int64_t)1) << 16) - 1,
                                       (((int64_t)1) << 17) - 1,
                                       (((int64_t)1) << 18) - 1,
                                       (((int64_t)1) << 19) - 1,
                                       (((int64_t)1) << 20) - 1,
                                       (((int64_t)1) << 21) - 1,
                                       (((int64_t)1) << 22) - 1,
                                       (((int64_t)1) << 23) - 1,
                                       (((int64_t)1) << 24) - 1,
                                       (((int64_t)1) << 25) - 1,
                                       (((int64_t)1) << 26) - 1,
                                       (((int64_t)1) << 27) - 1,
                                       (((int64_t)1) << 28) - 1,
                                       (((int64_t)1) << 29) - 1,
                                       (((int64_t)1) << 30) - 1,
                                       (((int64_t)1) << 31) - 1,
                                       (((int64_t)1) << 32) - 1,
                                       (((int64_t)1) << 33) - 1,
                                       (((int64_t)1) << 34) - 1,
                                       (((int64_t)1) << 35) - 1,
                                       (((int64_t)1) << 36) - 1,
                                       (((int64_t)1) << 37) - 1,
                                       (((int64_t)1) << 38) - 1,
                                       (((int64_t)1) << 39) - 1,
                                       (((int64_t)1) << 40) - 1,
                                       (((int64_t)1) << 41) - 1,
                                       (((int64_t)1) << 42) - 1,
                                       (((int64_t)1) << 43) - 1,
                                       (((int64_t)1) << 44) - 1,
                                       (((int64_t)1) << 45) - 1,
                                       (((int64_t)1) << 46) - 1,
                                       (((int64_t)1) << 47) - 1,
                                       (((int64_t)1) << 48) - 1,
                                       (((int64_t)1) << 49) - 1,
                                       (((int64_t)1) << 50) - 1,
                                       (((int64_t)1) << 51) - 1,
                                       (((int64_t)1) << 52) - 1,
                                       (((int64_t)1) << 53) - 1,
                                       (((int64_t)1) << 54) - 1,
                                       (((int64_t)1) << 55) - 1,
                                       (((int64_t)1) << 56) - 1,
                                       (((int64_t)1) << 57) - 1,
                                       (((int64_t)1) << 58) - 1,
                                       (((int64_t)1) << 59) - 1,
                                       (((int64_t)1) << 60) - 1,
                                       (((int64_t)1) << 61) - 1,
                                       (((int64_t)1) << 62) - 1,
                                       (int64_t)0x7FFFFFFFFFFFFFFFLL,
                                       ~0};
}

#ifdef CSL_DEBUG_DUMP_ENABLED
void csl_dump_file::csl_header_writer::write(int64_t data)
{
    write(&data, sizeof(int64_t));
}

void csl_dump_file::csl_header_writer::write(size_t data)
{
    write(&data, sizeof(size_t));
}

void csl_dump_file::csl_header_writer::write(int data)
{
    write(&data, sizeof(int));
}

void csl_dump_file::csl_header_writer::write(const void *data, size_t length)
{
    if (m_data.size() < m_pos + length)
    {
        // avoid including <algorithm> just for a single std::max use.
        size_t a = m_pos + length;
        size_t b = m_data.size() * 2;
        size_t larger = a > b ? a : b;
        m_data.resize(larger);
    }
    csl_memcpy(m_data.data() + m_pos, data, length);
    m_pos += length;
}

void csl_dump_file::csl_header_writer::write_string(const std::string &data)
{
    write(data.c_str(), data.size());

    const uint8_t nullt = 0;
    write(&nullt, 1);
}

const size_t csl_dump_file::csl_header_writer::get_size() const
{
    return m_pos;
}

const uint8_t *csl_dump_file::csl_header_writer::get_data() const
{
    return m_data.data();
}

csl_dump_file::csl_dump_file()
{
}

csl_dump_file::~csl_dump_file()
{
    close();
}

void csl_dump_file::open(const std::string &file)
{
    m_file_name = file;
}

void csl_dump_file::close()
{
    if (m_file_name == "")
    {
        return;
    }

    csl_header_writer header;
    header.write(ID_DUMP);
    header.write(ID_ROWS);

    size_t rowCount = m_row_offsets.size();
    assert(m_row_offsets.size() == m_row_names.size());
    header.write(rowCount);
    for (size_t i = 0; i < rowCount; ++i)
    {
        header.write(m_row_offsets[i]);
    }
    for (size_t i = 0; i < rowCount; ++i)
    {
        header.write_string(m_row_names[i]);
    }

    header.write(ID_LOCS);
    header.write(m_location_info.size());
    for (auto &loc : m_location_info)
    {
        header.write(loc.first);
        header.write(loc.second.m_bit_width);
        header.write_string(loc.second.m_name);
    }

    std::ofstream f(m_file_name, std::ofstream::binary);
    f.write((const char *)header.get_data(), header.get_size());
    f.write((const char *)m_row_data.get_data(), m_row_data.get_size());
}

void csl_dump_file::set_location_info(size_t location, int bitWidth, const char *name)
{
    m_location_info[location] = {name, bitWidth};
}

void csl_dump_file::set_current_cycle(int64_t value)
{
    m_current_cycle = value;
}

void csl_dump_file::add_row(int64_t *nativeData, size_t nativeCount, csl_mp_int *wideData, size_t wideCount,
                            const char *step_name)
{
    if (m_file_name == "")
    {
        return;
    }

    m_row_offsets.push_back(m_row_data.get_size());
    m_row_names.push_back(step_name);

    m_row_data.write(ID_CYCL);
    m_row_data.write(m_current_cycle);

    m_row_data.write(ID_SEGS);
    m_row_data.write(size_t(0));

    m_row_data.write(ID_STEP);
    m_row_data.write(nativeCount + wideCount);
    m_row_data.write(ID_DATA);
    for (size_t i = 0; i < nativeCount; ++i)
    {
        m_row_data.write_string(std::to_string(nativeData[i]));
    }
#ifdef CSL_USE_MPIR
    for (size_t i = 0; i < wideCount; ++i)
    {
        char wide[2048];
        wideData[i].str(wide, 2048);
        m_row_data.write_string(wide);
    }
#endif
}

void csl_dump_file::add_row(int64_t *nativeData, size_t nativeCount, csl_mp_int *wideData, size_t wideCount,
                            const char *step_name, int64_t *seg_cycles, size_t seg_cycle_count, int64_t update_cycle)
{
    if (m_file_name == "")
    {
        return;
    }

    m_row_offsets.push_back(m_row_data.get_size());
    m_row_names.push_back(step_name);

    m_row_data.write(ID_CYCL);
    m_row_data.write(m_current_cycle);

    m_row_data.write(ID_SEGS);
    m_row_data.write(seg_cycle_count + 1);
    for (size_t i = 0; i < seg_cycle_count; ++i)
    {
        m_row_data.write(seg_cycles[i]);
    }
    m_row_data.write(update_cycle);

    m_row_data.write(ID_STEP);
    m_row_data.write(nativeCount + wideCount);
    m_row_data.write(ID_DATA);
    for (size_t i = 0; i < nativeCount; ++i)
    {
        m_row_data.write_string(std::to_string(nativeData[i]));
    }
#ifdef CSL_USE_MPIR
    for (size_t i = 0; i < wideCount; ++i)
    {
        char wide[2048];
        wideData[i].str(wide, 2048);
        m_row_data.write_string(wide);
    }
#endif
}

#endif // CSL_DEBUG_DUMP_ENABLED

std::string csl_to_binary(uint64_t a, unsigned width)
{
    std::string z(width, '\0');
    uint64_t pow2 = ((uint64_t)1) << (width - 1);
    for (unsigned i = 0; i < width; i++)
    {
        if (i > 0)
        {
            pow2 = pow2 >> 1;
        }
        if (a >= pow2)
        {
            z[i] = '1';
            a -= pow2;
        }
        else
        {
            z[i] = '0';
        }
    }
    return z;
}

namespace
{

bool csl_get_raw_stm_line(std::ifstream &file, std::vector<std::string> &values)
{
    values.clear();

    std::string line;
    if (std::getline(file, line))
    {
        std::istringstream iss(line);
        while (!iss.eof())
        {
            std::string value;
            iss >> value;
            if (value.size() > 0)
            {
                values.push_back(value);
            }
        }
        return values.size() > 0;
    }
    return false;
}

} // namespace

bool csl_compare_stm_files(const char *resultFileName, const char *referenceFileName)
{
    std::vector<std::string> refLine, resultLine;

    std::ifstream resultFile(resultFileName);
    std::ifstream referenceFile(referenceFileName);
    std::streamoff resultLines =
        std::count(std::istreambuf_iterator<char>(resultFile), std::istreambuf_iterator<char>(), '\n');
    std::streamoff refLines =
        std::count(std::istreambuf_iterator<char>(referenceFile), std::istreambuf_iterator<char>(), '\n');
    if (resultLines != refLines)
    {
        std::string err =
            csl_format("Line count mismatch between reference (%d) and result files (%d)", refLines, resultLines);
        csl_error(err.c_str());
    }

    resultFile.clear();
    resultFile.seekg(0);
    referenceFile.clear();
    referenceFile.seekg(0);
    size_t line = 0;
    while (csl_get_raw_stm_line(referenceFile, refLine) && csl_get_raw_stm_line(resultFile, resultLine))
    {
        if (refLine.size() != resultLine.size())
        {
            csl_error("Stimulus column count mismatch between reference and result files");
            return false;
        }
        for (size_t i = 0; i < refLine.size(); ++i)
        {
            if (refLine[i] != resultLine[i])
            {
                std::string err = csl_format("Mismatch on result line %d column %d. Expected <%s> but got <%s>.", line,
                                             i, refLine[i].c_str(), resultLine[i].c_str());
                csl_error(err.c_str());
                return false;
            }
        }
        refLine.clear();
        resultLine.clear();
        ++line;
    }
    return true;
}

bool csl_stimulus_file::get_u32(uint32_t &value)
{
    if (m_stm_file.is_open() && (m_line_position < m_current_line.size()))
    {
        char *last;
        int32_t intValue = strtol(m_current_line[m_line_position++].c_str(), &last, 10);
        csl_memcpy(&value, &intValue, sizeof(value));
        return true;
    }
    return false;
}

void csl_stimulus_file::reset_file()
{
    m_stm_file.clear();
    m_stm_file.seekg(0, std::ios::beg);
}

void csl_stimulus_file::discover_format()
{
    if (m_stm_format != UNKNOWN)
    {
        return;
    }

    if (m_stm_file.eof())
    {
        m_stm_format = SIGNED;
        return;
    }

    std::string line;
    while (std::getline(m_stm_file, line))
    {
        std::stringstream linesstream(line);
        std::string stringValue;
        // read in integer tokens from the stream
        while (linesstream >> stringValue)
        {
            if (stringValue.length() == 0)
            {
                continue;
            }

            // binary numbers are padded with 0s
            if ((stringValue.length() > 1) && (stringValue[0] == '0'))
            {
                m_stm_format = BINARY;
                reset_file();
                return;
            }

            if (stringValue.find_first_of("-23456789") != std::string::npos)
            {
                m_stm_format = SIGNED;
                reset_file();
                return;
            }
        }
    }
}

csl_stimulus_file::csl_stimulus_file(const std::string &fileName, StimulusFormat format)
    : m_line_position(0), m_stm_format(format)
{
    open(fileName, format);
}

csl_stimulus_file::csl_stimulus_file() : m_line_position(0), m_stm_format(UNKNOWN)
{
    m_line_position = 0;
}

csl_stimulus_file::~csl_stimulus_file()
{
    // close the file if it has been left open
    close();
}

void csl_stimulus_file::close()
{
    if (is_open())
    {
        m_stm_file.close();
    }
}

bool csl_stimulus_file::open(const std::string &fileName, StimulusFormat format)
{
    if (is_open())
    {
        close();
    }

    m_stm_format = format;
    m_stm_file.open(fileName.c_str(), std::ios::in);
    bool open = is_open();
    if (!open)
    {
        csl_fmt_warning("Could not open stimulus file (%s).\n", fileName.c_str());
    }
    else
    {
        discover_format();
    }
    return open;
}

bool csl_stimulus_file::is_open() const
{
    return m_stm_file.is_open();
}

bool csl_stimulus_file::is_line_fully_read() const
{
    return m_line_position == m_current_line.size();
}

bool csl_stimulus_file::next_line()
{
    if (m_stm_file.eof())
    {
        return false;
    }

    if (!is_line_fully_read())
    {
        csl_warning("Previous line was not fully read");
    }

    // clear current line
    m_line_position = 0;
    m_current_line.clear();

    // read a line into the vector
    std::string line;
    if (std::getline(m_stm_file, line))
    {
        std::stringstream linesstream(line);

        std::string value;
        // read in string tokens from the stream
        while (linesstream >> value)
        {
            m_current_line.push_back(value);
        }

        return true;
    }

    return false;
}

bool csl_stimulus_file::skip_lines(size_t n)
{
    bool success = true;
    for (size_t i = 0; i < n; ++i)
    {
        success &= skip_line();
    }
    return success;
}

bool csl_stimulus_file::skip_line()
{
    if (m_stm_file.eof())
    {
        return false;
    }

    if (!is_line_fully_read())
    {
        csl_warning("Previous line was not fully read");
    }

    // clear current line
    m_line_position = 0;
    m_current_line.clear();

    // read a line into the vector
    std::string line;
    if (std::getline(m_stm_file, line))
    {
        return true;
    }

    return false;
}

void csl_stimulus_file::skip(int count)
{
    int64_t dummy;
    for (int i = 0; i < count; ++i)
    {
        get(dummy, 32);
    }
}

#ifdef CSL_USE_MPIR
bool csl_stimulus_file::get(uint32_t *values, size_t bit_width, size_t capacity)
{
    for (size_t i = 0; i < capacity; ++i)
    {
        values[i] = 0;
    }

    if (bit_width <= 0)
    {
        return false;
    }

    if (m_stm_format == SIGNED)
    {
        for (size_t i = 0; i < capacity; ++i)
        {
            if (!get_u32(values[i]))
            {
                return false;
            }
        }
    }
    else
    {
        csl_error("Non-signed stimulus files currently unsupported for wrapper ATBs");
    }

    return false;
}

bool csl_stimulus_file::get(csl_mp_int &var, size_t bit_width)
{
    if (bit_width <= 0)
    {
        var = 0;
        return false;
    }

    var = 0;
    if (m_stm_format == SIGNED)
    {
        // as per getIntArb but no processing on the ints required
        int32_t num_ints = static_cast<int32_t>(((bit_width - 1) / 32) + 1);
        std::vector<uint32_t> values(num_ints);
        for (int32_t i = 0; i < num_ints; ++i)
        {
            if (!get_u32(values[i]))
            {
                var = 0;
                return false;
            }
        }
        var.set_from_uint_array(values.data(), values.size(), bit_width);
        return true;
    }
    else
    {
        if (m_stm_file.is_open() && (m_line_position < m_current_line.size()))
        {
            var = csl_mp_int(m_current_line[m_line_position++].c_str());
            return true;
        }
    }

    return false;
}
#endif

bool csl_stimulus_file::get(int64_t &value, size_t bit_width)
{
    if (bit_width <= 0)
    {
        value = 0ull;
        return false;
    }

    uint64_t result = 0;
    if (m_stm_file.is_open() && (m_line_position < m_current_line.size()))
    {
        if (m_stm_format == SIGNED)
        {
            uint32_t result_u32;
            get_u32(result_u32);
            result = result_u32;

            size_t count = 1 + ((bit_width - 1) / 32);
            if (count > 1)
            {
                if (m_line_position >= m_current_line.size())
                {
                    return false;
                }
                uint32_t v = 0;
                get_u32(v);
                result |= static_cast<uint64_t>(v) << 32;
            }

            csl_memcpy(&value, &result, sizeof(value));
            return true;
        }
        else if (m_stm_format == BINARY)
        {
            if (m_stm_file.is_open() && (m_line_position < m_current_line.size()))
            {
                char *last;
                int64_t intValue = strtoll(m_current_line[m_line_position++].c_str(), &last, 2);
                csl_memcpy(&value, &intValue, sizeof(value));
                return true;
            }
            return false;
        }
    }
    value = 0ull;
    return false;
}

bool csl_stimulus_file::get(int32_t &value, size_t bit_width)
{
    int64_t intValue = 0;
    bool result = get(intValue, bit_width);
    csl_memcpy(&value, &intValue, sizeof(int32_t));
    return result;
}

bool csl_stimulus_file::get(int16_t &value, size_t bit_width)
{
    int64_t intValue = 0;
    bool result = get(intValue, bit_width);
    csl_memcpy(&value, &intValue, sizeof(int16_t));
    return result;
}

bool csl_stimulus_file::get(int8_t &value, size_t bit_width)
{
    int64_t intValue = 0;
    bool result = get(intValue, bit_width);
    csl_memcpy(&value, &intValue, sizeof(int8_t));
    return result;
}

bool csl_stimulus_file::get(double &value)
{
    int64_t intValue = 0;
    bool result = get(intValue, 64);
    csl_memcpy(&value, &intValue, sizeof(double));
    return result;
}

bool csl_stimulus_file::get(float &value)
{
    int64_t intValue = 0;
    bool result = get(intValue, 32);
    csl_memcpy(&value, &intValue, sizeof(float));
    return result;
}

csl_output_stimulus_file::csl_output_stimulus_file(const char *filename)
{
    open(filename);
}

csl_output_stimulus_file::~csl_output_stimulus_file()
{
    if (m_file.is_open())
    {
        m_file.close();
    }
}

void csl_output_stimulus_file::open(const char *filename)
{
    if (m_file.is_open())
    {
        m_file.close();
    }
    m_file.open(filename);
    if (!m_file.is_open())
    {
        csl_fmt_error("Could not open file: %s", filename);
    }
}

void csl_output_stimulus_file::write_stm_data_impl(int64_t v, int64_t width)
{
#ifdef CSL_BINARY_STM_OUT
    x &= csl_bit_mask_i64(width);
    m_file << toBinary<width>(x) << " ";
#elif CSL_UNSPLIT_STM_OUT
    x &= csl_bit_mask_i64(width);
    m_file << x << " ";
#else
    for (int bit = 0; bit < width; bit += 32)
    {
        if (bit + 32 > width)
        {
            v &= s_pow2mask[width - bit];
        }
        m_file << (int)(v & 0xffffffff) << " ";
        v >>= 32;
    }
#endif
}

void csl_output_stimulus_file::write_stm_data(int64_t v, int64_t width)
{
    int64_t x = 0;
    csl_memcpy(&x, &v, sizeof(int64_t));
    write_stm_data_impl(x, width);
}

void csl_output_stimulus_file::write_stm_data(int32_t v, int64_t width)
{
    int64_t x = 0;
    csl_memcpy(&x, &v, sizeof(int32_t));
    write_stm_data_impl(x, width);
}

void csl_output_stimulus_file::write_stm_data(int16_t v, int64_t width)
{
    int64_t x = 0;
    csl_memcpy(&x, &v, sizeof(int16_t));
    write_stm_data_impl(x, width);
}

void csl_output_stimulus_file::write_stm_data(int8_t v, int64_t width)
{
    int64_t x = 0;
    csl_memcpy(&x, &v, sizeof(int8_t));
    write_stm_data_impl(x, width);
}

void csl_output_stimulus_file::write_stm_data(double v)
{
    int64_t x = 0;
    csl_memcpy(&x, &v, sizeof(double));
    write_stm_data_impl(x, 64);
}

void csl_output_stimulus_file::write_stm_data(float v)
{
    int64_t x = 0;
    csl_memcpy(&x, &v, sizeof(float));
    write_stm_data_impl(x, 32);
}

#ifdef CSL_USE_MPIR
void csl_output_stimulus_file::write_stm_data(csl_mp_int v, int64_t width)
{
#ifdef CSL_BINARY_STM_OUT
    (void)width;
    char value[1024];
    v.str_bin(value, 1024);
    m_file << value << " ";
#elif CSL_UNSPLIT_STM_OUT
    (void)width;
    char value[1024];
    v.str(value, 1024);
    m_file << value << " ";
#else
    static const csl_mp_int mask(int64_t(0xffffffffll));
    csl_mp_int maskedVal;
    for (int bit = 0; bit < width; bit += 32)
    {
        mpz_and(maskedVal.data(), v.data(), mask.data());
        int intValue = (int)static_cast<unsigned int>(mpz_get_ui(maskedVal.data()));
        if (width - bit <= 32)
        {
            intValue &= s_pow2mask[width - bit];
        }
        m_file << intValue << " ";
        mpz_fdiv_q_2exp(v.data(), v.data(), 32);
    }
#endif
}

void csl_output_stimulus_file::write_stm_data(const uint32_t *v, int64_t width, size_t count)
{
    for (size_t i = 0; i < count; ++i)
    {
        write_stm_data(static_cast<int64_t>(v[i]), (width < 32) ? width : 32);
        width -= 32;
    }
}
#endif

void csl_output_stimulus_file::next_line()
{
    m_file << std::endl;
    ++m_line_count;
}

size_t csl_output_stimulus_file::get_line_count() const
{
    return m_line_count;
}
