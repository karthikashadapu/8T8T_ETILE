-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 23.3 (Release Build #f9894c94f4)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2023 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection
-- VHDL created on Wed Nov  6 19:28:33 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_atb is
end;

architecture normal of prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_atb is

component prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection is
    port (
        in_1_valid_m_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_c_m_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_real_din_m_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_3_imag_din_m_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_4_fftsize_m_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_5_sop_m_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_6_bwby10_m_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_7_tref_m_tpl : in std_logic_vector(28 downto 0);  -- ufix29
        in_8_NFFT_m_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_9_cplen_m_tpl : in std_logic_vector(22 downto 0);  -- ufix23
        in_10_cbar_mplane_sel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_11_valid_c_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_12_c_c_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_13_real_din_c_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_13_imag_din_c_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_14_fftsize_c_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_15_sop_c_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_16_bwby10_c_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_17_tref_c_tpl : in std_logic_vector(28 downto 0);  -- ufix29
        in_18_NFFT_c_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_19_cplen_c_tpl : in std_logic_vector(25 downto 0);  -- ufix26
        out_1_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_cout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_real_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en15
        out_3_imag_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en15
        out_4_qFFTSize_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_5_qSOP_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_6_qBWby10_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_7_T_ref_tpl : out std_logic_vector(28 downto 0);  -- ufix29
        out_8_qNFFT_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_9_CPLen_tpl : out std_logic_vector(25 downto 0);  -- ufix26
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_stm is
    port (
        in_1_valid_m_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_c_m_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_real_din_m_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_imag_din_m_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_fftsize_m_tpl_stm : out std_logic_vector(3 downto 0);
        in_5_sop_m_tpl_stm : out std_logic_vector(0 downto 0);
        in_6_bwby10_m_tpl_stm : out std_logic_vector(7 downto 0);
        in_7_tref_m_tpl_stm : out std_logic_vector(28 downto 0);
        in_8_NFFT_m_tpl_stm : out std_logic_vector(3 downto 0);
        in_9_cplen_m_tpl_stm : out std_logic_vector(22 downto 0);
        in_10_cbar_mplane_sel_tpl_stm : out std_logic_vector(0 downto 0);
        in_11_valid_c_tpl_stm : out std_logic_vector(0 downto 0);
        in_12_c_c_tpl_stm : out std_logic_vector(7 downto 0);
        in_13_real_din_c_tpl_stm : out std_logic_vector(15 downto 0);
        in_13_imag_din_c_tpl_stm : out std_logic_vector(15 downto 0);
        in_14_fftsize_c_tpl_stm : out std_logic_vector(3 downto 0);
        in_15_sop_c_tpl_stm : out std_logic_vector(0 downto 0);
        in_16_bwby10_c_tpl_stm : out std_logic_vector(3 downto 0);
        in_17_tref_c_tpl_stm : out std_logic_vector(28 downto 0);
        in_18_NFFT_c_tpl_stm : out std_logic_vector(3 downto 0);
        in_19_cplen_c_tpl_stm : out std_logic_vector(25 downto 0);
        out_1_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_cout_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_real_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_imag_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_qFFTSize_tpl_stm : out std_logic_vector(3 downto 0);
        out_5_qSOP_tpl_stm : out std_logic_vector(0 downto 0);
        out_6_qBWby10_tpl_stm : out std_logic_vector(7 downto 0);
        out_7_T_ref_tpl_stm : out std_logic_vector(28 downto 0);
        out_8_qNFFT_tpl_stm : out std_logic_vector(3 downto 0);
        out_9_CPLen_tpl_stm : out std_logic_vector(25 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_valid_m_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_m_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_din_m_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_imag_din_m_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_fftsize_m_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_sop_m_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_6_bwby10_m_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_7_tref_m_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal in_8_NFFT_m_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_9_cplen_m_tpl_stm : STD_LOGIC_VECTOR (22 downto 0);
signal in_10_cbar_mplane_sel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_11_valid_c_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_12_c_c_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_13_real_din_c_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_13_imag_din_c_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_14_fftsize_c_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_15_sop_c_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_16_bwby10_c_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_17_tref_c_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal in_18_NFFT_c_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_19_cplen_c_tpl_stm : STD_LOGIC_VECTOR (25 downto 0);
signal out_1_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_cout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_real_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_qFFTSize_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_5_qSOP_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_6_qBWby10_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_7_T_ref_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal out_8_qNFFT_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_9_CPLen_tpl_stm : STD_LOGIC_VECTOR (25 downto 0);
signal in_1_valid_m_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_m_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_din_m_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_imag_din_m_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_fftsize_m_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_sop_m_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_6_bwby10_m_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_7_tref_m_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal in_8_NFFT_m_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_9_cplen_m_tpl_dut : STD_LOGIC_VECTOR (22 downto 0);
signal in_10_cbar_mplane_sel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_11_valid_c_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_12_c_c_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_13_real_din_c_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_13_imag_din_c_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_14_fftsize_c_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_15_sop_c_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_16_bwby10_c_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_17_tref_c_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal in_18_NFFT_c_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_19_cplen_c_tpl_dut : STD_LOGIC_VECTOR (25 downto 0);
signal out_1_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_cout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_real_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_qFFTSize_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_5_qSOP_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_6_qBWby10_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_7_T_ref_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal out_8_qNFFT_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_9_CPLen_tpl_dut : STD_LOGIC_VECTOR (25 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_cunroll_x : process (clk, areset, in_3_real_din_m_tpl_dut, in_3_real_din_m_tpl_stm, in_3_imag_din_m_tpl_dut, in_3_imag_din_m_tpl_stm, in_4_fftsize_m_tpl_dut, in_4_fftsize_m_tpl_stm, in_5_sop_m_tpl_dut, in_5_sop_m_tpl_stm, in_6_bwby10_m_tpl_dut, in_6_bwby10_m_tpl_stm, in_7_tref_m_tpl_dut, in_7_tref_m_tpl_stm, in_8_NFFT_m_tpl_dut, in_8_NFFT_m_tpl_stm, in_9_cplen_m_tpl_dut, in_9_cplen_m_tpl_stm, in_10_cbar_mplane_sel_tpl_dut, in_10_cbar_mplane_sel_tpl_stm, in_11_valid_c_tpl_dut, in_11_valid_c_tpl_stm, in_12_c_c_tpl_dut, in_12_c_c_tpl_stm, in_13_real_din_c_tpl_dut, in_13_real_din_c_tpl_stm, in_13_imag_din_c_tpl_dut, in_13_imag_din_c_tpl_stm, in_14_fftsize_c_tpl_dut, in_14_fftsize_c_tpl_stm, in_15_sop_c_tpl_dut, in_15_sop_c_tpl_stm, in_16_bwby10_c_tpl_dut, in_16_bwby10_c_tpl_stm, in_17_tref_c_tpl_dut, in_17_tref_c_tpl_stm, in_18_NFFT_c_tpl_dut, in_18_NFFT_c_tpl_stm, in_19_cplen_c_tpl_dut, in_19_cplen_c_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut_cunroll_x : process (clk, areset, out_3_real_dout_tpl_dut, out_3_real_dout_tpl_stm, out_3_imag_dout_tpl_dut, out_3_imag_dout_tpl_stm, out_4_qFFTSize_tpl_dut, out_4_qFFTSize_tpl_stm, out_5_qSOP_tpl_dut, out_5_qSOP_tpl_stm, out_6_qBWby10_tpl_dut, out_6_qBWby10_tpl_stm, out_7_T_ref_tpl_dut, out_7_T_ref_tpl_stm, out_8_qNFFT_tpl_dut, out_8_qNFFT_tpl_stm, out_9_CPLen_tpl_dut, out_9_CPLen_tpl_stm)
variable mismatch_out_1_vout_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_cout_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_real_dout_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_imag_dout_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_qFFTSize_tpl : BOOLEAN := FALSE;
variable mismatch_out_5_qSOP_tpl : BOOLEAN := FALSE;
variable mismatch_out_6_qBWby10_tpl : BOOLEAN := FALSE;
variable mismatch_out_7_T_ref_tpl : BOOLEAN := FALSE;
variable mismatch_out_8_qNFFT_tpl : BOOLEAN := FALSE;
variable mismatch_out_9_CPLen_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_vout_tpl := FALSE;
        mismatch_out_2_cout_tpl := FALSE;
        mismatch_out_3_real_dout_tpl := FALSE;
        mismatch_out_3_imag_dout_tpl := FALSE;
        mismatch_out_4_qFFTSize_tpl := FALSE;
        mismatch_out_5_qSOP_tpl := FALSE;
        mismatch_out_6_qBWby10_tpl := FALSE;
        mismatch_out_7_T_ref_tpl := FALSE;
        mismatch_out_8_qNFFT_tpl := FALSE;
        mismatch_out_9_CPLen_tpl := FALSE;
        IF ( (out_1_vout_tpl_dut /= out_1_vout_tpl_stm)) THEN
            mismatch_out_1_vout_tpl := TRUE;
            report "mismatch in out_1_vout_tpl signal" severity Failure;
        END IF;
        IF ((out_1_vout_tpl_dut = "1")) THEN
            IF ( (out_2_cout_tpl_dut /= out_2_cout_tpl_stm)) THEN
                mismatch_out_2_cout_tpl := TRUE;
                report "mismatch in out_2_cout_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_real_dout_tpl_dut /= out_3_real_dout_tpl_stm)) THEN
                mismatch_out_3_real_dout_tpl := TRUE;
                report "mismatch in out_3_real_dout_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_imag_dout_tpl_dut /= out_3_imag_dout_tpl_stm)) THEN
                mismatch_out_3_imag_dout_tpl := TRUE;
                report "mismatch in out_3_imag_dout_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_qFFTSize_tpl_dut /= out_4_qFFTSize_tpl_stm)) THEN
                mismatch_out_4_qFFTSize_tpl := TRUE;
                report "mismatch in out_4_qFFTSize_tpl signal" severity Warning;
            END IF;
            IF ( (out_5_qSOP_tpl_dut /= out_5_qSOP_tpl_stm)) THEN
                mismatch_out_5_qSOP_tpl := TRUE;
                report "mismatch in out_5_qSOP_tpl signal" severity Warning;
            END IF;
            IF ( (out_6_qBWby10_tpl_dut /= out_6_qBWby10_tpl_stm)) THEN
                mismatch_out_6_qBWby10_tpl := TRUE;
                report "mismatch in out_6_qBWby10_tpl signal" severity Warning;
            END IF;
            IF ( (out_7_T_ref_tpl_dut /= out_7_T_ref_tpl_stm)) THEN
                mismatch_out_7_T_ref_tpl := TRUE;
                report "mismatch in out_7_T_ref_tpl signal" severity Warning;
            END IF;
            IF ( (out_8_qNFFT_tpl_dut /= out_8_qNFFT_tpl_stm)) THEN
                mismatch_out_8_qNFFT_tpl := TRUE;
                report "mismatch in out_8_qNFFT_tpl signal" severity Warning;
            END IF;
            IF ( (out_9_CPLen_tpl_dut /= out_9_CPLen_tpl_stm)) THEN
                mismatch_out_9_CPLen_tpl := TRUE;
                report "mismatch in out_9_CPLen_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_vout_tpl = TRUE or mismatch_out_2_cout_tpl = TRUE or mismatch_out_3_real_dout_tpl = TRUE or mismatch_out_3_imag_dout_tpl = TRUE or mismatch_out_4_qFFTSize_tpl = TRUE or mismatch_out_5_qSOP_tpl = TRUE or mismatch_out_6_qBWby10_tpl = TRUE or mismatch_out_7_T_ref_tpl = TRUE or mismatch_out_8_qNFFT_tpl = TRUE or mismatch_out_9_CPLen_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection port map (
    in_1_valid_m_tpl_stm,
    in_2_c_m_tpl_stm,
    in_3_real_din_m_tpl_stm,
    in_3_imag_din_m_tpl_stm,
    in_4_fftsize_m_tpl_stm,
    in_5_sop_m_tpl_stm,
    in_6_bwby10_m_tpl_stm,
    in_7_tref_m_tpl_stm,
    in_8_NFFT_m_tpl_stm,
    in_9_cplen_m_tpl_stm,
    in_10_cbar_mplane_sel_tpl_stm,
    in_11_valid_c_tpl_stm,
    in_12_c_c_tpl_stm,
    in_13_real_din_c_tpl_stm,
    in_13_imag_din_c_tpl_stm,
    in_14_fftsize_c_tpl_stm,
    in_15_sop_c_tpl_stm,
    in_16_bwby10_c_tpl_stm,
    in_17_tref_c_tpl_stm,
    in_18_NFFT_c_tpl_stm,
    in_19_cplen_c_tpl_stm,
    out_1_vout_tpl_dut,
    out_2_cout_tpl_dut,
    out_3_real_dout_tpl_dut,
    out_3_imag_dout_tpl_dut,
    out_4_qFFTSize_tpl_dut,
    out_5_qSOP_tpl_dut,
    out_6_qBWby10_tpl_dut,
    out_7_T_ref_tpl_dut,
    out_8_qNFFT_tpl_dut,
    out_9_CPLen_tpl_dut,
        clk,
        areset
);

sim : prach_shortFormat_fftShift_prach_PRACH_CC_Cbar_mplane_selection_stm port map (
    in_1_valid_m_tpl_stm,
    in_2_c_m_tpl_stm,
    in_3_real_din_m_tpl_stm,
    in_3_imag_din_m_tpl_stm,
    in_4_fftsize_m_tpl_stm,
    in_5_sop_m_tpl_stm,
    in_6_bwby10_m_tpl_stm,
    in_7_tref_m_tpl_stm,
    in_8_NFFT_m_tpl_stm,
    in_9_cplen_m_tpl_stm,
    in_10_cbar_mplane_sel_tpl_stm,
    in_11_valid_c_tpl_stm,
    in_12_c_c_tpl_stm,
    in_13_real_din_c_tpl_stm,
    in_13_imag_din_c_tpl_stm,
    in_14_fftsize_c_tpl_stm,
    in_15_sop_c_tpl_stm,
    in_16_bwby10_c_tpl_stm,
    in_17_tref_c_tpl_stm,
    in_18_NFFT_c_tpl_stm,
    in_19_cplen_c_tpl_stm,
    out_1_vout_tpl_stm,
    out_2_cout_tpl_stm,
    out_3_real_dout_tpl_stm,
    out_3_imag_dout_tpl_stm,
    out_4_qFFTSize_tpl_stm,
    out_5_qSOP_tpl_stm,
    out_6_qBWby10_tpl_stm,
    out_7_T_ref_tpl_stm,
    out_8_qNFFT_tpl_stm,
    out_9_CPLen_tpl_stm,
        clk,
        areset
);

end normal;
