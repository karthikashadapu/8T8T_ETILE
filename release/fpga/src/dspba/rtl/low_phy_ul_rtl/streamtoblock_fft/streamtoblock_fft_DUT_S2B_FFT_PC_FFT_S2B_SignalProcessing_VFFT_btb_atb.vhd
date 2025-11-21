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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_atb is
end;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_atb is

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb is
    port (
        in_1_v_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_c_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_sop_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_6_size_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_4_real_d_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_imag_d_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_5_nsc_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_7_time_in_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        in_8_eAxC_no_tpl : in std_logic_vector(1 downto 0);  -- ufix2
        in_9_sym_metadata_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        out_1_qv_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_qsop_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_qeop_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_5_qsize_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_6_real_q_tpl : out std_logic_vector(28 downto 0);  -- sfix29_en15
        out_6_imag_q_tpl : out std_logic_vector(28 downto 0);  -- sfix29_en15
        out_7_qnsc_tpl : out std_logic_vector(15 downto 0);  -- ufix16
        out_8_time_out_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        out_9_eAxC_tpl : out std_logic_vector(1 downto 0);  -- ufix2
        out_10_metadata_sym_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_stm is
    port (
        in_1_v_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_c_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_sop_tpl_stm : out std_logic_vector(0 downto 0);
        in_6_size_tpl_stm : out std_logic_vector(3 downto 0);
        in_4_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_5_nsc_tpl_stm : out std_logic_vector(15 downto 0);
        in_7_time_in_tpl_stm : out std_logic_vector(63 downto 0);
        in_8_eAxC_no_tpl_stm : out std_logic_vector(1 downto 0);
        in_9_sym_metadata_tpl_stm : out std_logic_vector(63 downto 0);
        out_1_qv_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_qc_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_qsop_tpl_stm : out std_logic_vector(0 downto 0);
        out_4_qeop_tpl_stm : out std_logic_vector(0 downto 0);
        out_5_qsize_tpl_stm : out std_logic_vector(3 downto 0);
        out_6_real_q_tpl_stm : out std_logic_vector(28 downto 0);
        out_6_imag_q_tpl_stm : out std_logic_vector(28 downto 0);
        out_7_qnsc_tpl_stm : out std_logic_vector(15 downto 0);
        out_8_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_9_eAxC_tpl_stm : out std_logic_vector(1 downto 0);
        out_10_metadata_sym_tpl_stm : out std_logic_vector(63 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_sop_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_6_size_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_4_real_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_imag_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_5_nsc_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_time_in_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_8_eAxC_no_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_9_sym_metadata_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_1_qv_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_qsop_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_4_qeop_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_qsize_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_6_real_q_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal out_6_imag_q_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal out_7_qnsc_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_8_time_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_9_eAxC_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_10_metadata_sym_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_1_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_sop_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_6_size_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_4_real_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_imag_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_5_nsc_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_time_in_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_8_eAxC_no_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal in_9_sym_metadata_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_1_qv_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_qsop_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_4_qeop_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_qsize_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_6_real_q_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal out_6_imag_q_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal out_7_qnsc_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_8_time_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_9_eAxC_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_10_metadata_sym_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkchannel_FFT1_in_cunroll_x : process (clk, areset, in_3_sop_tpl_dut, in_3_sop_tpl_stm, in_6_size_tpl_dut, in_6_size_tpl_stm, in_4_real_d_tpl_dut, in_4_real_d_tpl_stm, in_4_imag_d_tpl_dut, in_4_imag_d_tpl_stm, in_5_nsc_tpl_dut, in_5_nsc_tpl_stm, in_7_time_in_tpl_dut, in_7_time_in_tpl_stm, in_8_eAxC_no_tpl_dut, in_8_eAxC_no_tpl_stm, in_9_sym_metadata_tpl_dut, in_9_sym_metadata_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkchannel_FFT1_out_cunroll_x : process (clk, areset, out_3_qsop_tpl_dut, out_3_qsop_tpl_stm, out_4_qeop_tpl_dut, out_4_qeop_tpl_stm, out_5_qsize_tpl_dut, out_5_qsize_tpl_stm, out_6_real_q_tpl_dut, out_6_real_q_tpl_stm, out_6_imag_q_tpl_dut, out_6_imag_q_tpl_stm, out_7_qnsc_tpl_dut, out_7_qnsc_tpl_stm, out_8_time_out_tpl_dut, out_8_time_out_tpl_stm, out_9_eAxC_tpl_dut, out_9_eAxC_tpl_stm, out_10_metadata_sym_tpl_dut, out_10_metadata_sym_tpl_stm)
variable mismatch_out_1_qv_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_qc_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_qsop_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_qeop_tpl : BOOLEAN := FALSE;
variable mismatch_out_5_qsize_tpl : BOOLEAN := FALSE;
variable mismatch_out_6_real_q_tpl : BOOLEAN := FALSE;
variable mismatch_out_6_imag_q_tpl : BOOLEAN := FALSE;
variable mismatch_out_7_qnsc_tpl : BOOLEAN := FALSE;
variable mismatch_out_8_time_out_tpl : BOOLEAN := FALSE;
variable mismatch_out_9_eAxC_tpl : BOOLEAN := FALSE;
variable mismatch_out_10_metadata_sym_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_qv_tpl := FALSE;
        mismatch_out_2_qc_tpl := FALSE;
        mismatch_out_3_qsop_tpl := FALSE;
        mismatch_out_4_qeop_tpl := FALSE;
        mismatch_out_5_qsize_tpl := FALSE;
        mismatch_out_6_real_q_tpl := FALSE;
        mismatch_out_6_imag_q_tpl := FALSE;
        mismatch_out_7_qnsc_tpl := FALSE;
        mismatch_out_8_time_out_tpl := FALSE;
        mismatch_out_9_eAxC_tpl := FALSE;
        mismatch_out_10_metadata_sym_tpl := FALSE;
        IF ( (out_1_qv_tpl_dut /= out_1_qv_tpl_stm)) THEN
            mismatch_out_1_qv_tpl := TRUE;
            report "mismatch in out_1_qv_tpl signal" severity Failure;
        END IF;
        IF ((out_1_qv_tpl_dut = "1")) THEN
            IF ( (out_2_qc_tpl_dut /= out_2_qc_tpl_stm)) THEN
                mismatch_out_2_qc_tpl := TRUE;
                report "mismatch in out_2_qc_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_qsop_tpl_dut /= out_3_qsop_tpl_stm)) THEN
                mismatch_out_3_qsop_tpl := TRUE;
                report "mismatch in out_3_qsop_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_qeop_tpl_dut /= out_4_qeop_tpl_stm)) THEN
                mismatch_out_4_qeop_tpl := TRUE;
                report "mismatch in out_4_qeop_tpl signal" severity Warning;
            END IF;
            IF ( (out_5_qsize_tpl_dut /= out_5_qsize_tpl_stm)) THEN
                mismatch_out_5_qsize_tpl := TRUE;
                report "mismatch in out_5_qsize_tpl signal" severity Warning;
            END IF;
            IF ( (out_6_real_q_tpl_dut /= out_6_real_q_tpl_stm)) THEN
                mismatch_out_6_real_q_tpl := TRUE;
                report "mismatch in out_6_real_q_tpl signal" severity Warning;
            END IF;
            IF ( (out_6_imag_q_tpl_dut /= out_6_imag_q_tpl_stm)) THEN
                mismatch_out_6_imag_q_tpl := TRUE;
                report "mismatch in out_6_imag_q_tpl signal" severity Warning;
            END IF;
            IF ( (out_7_qnsc_tpl_dut /= out_7_qnsc_tpl_stm)) THEN
                mismatch_out_7_qnsc_tpl := TRUE;
                report "mismatch in out_7_qnsc_tpl signal" severity Warning;
            END IF;
            IF ( (out_8_time_out_tpl_dut /= out_8_time_out_tpl_stm)) THEN
                mismatch_out_8_time_out_tpl := TRUE;
                report "mismatch in out_8_time_out_tpl signal" severity Warning;
            END IF;
            IF ( (out_9_eAxC_tpl_dut /= out_9_eAxC_tpl_stm)) THEN
                mismatch_out_9_eAxC_tpl := TRUE;
                report "mismatch in out_9_eAxC_tpl signal" severity Warning;
            END IF;
            IF ( (out_10_metadata_sym_tpl_dut /= out_10_metadata_sym_tpl_stm)) THEN
                mismatch_out_10_metadata_sym_tpl := TRUE;
                report "mismatch in out_10_metadata_sym_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_qv_tpl = TRUE or mismatch_out_2_qc_tpl = TRUE or mismatch_out_3_qsop_tpl = TRUE or mismatch_out_4_qeop_tpl = TRUE or mismatch_out_5_qsize_tpl = TRUE or mismatch_out_6_real_q_tpl = TRUE or mismatch_out_6_imag_q_tpl = TRUE or mismatch_out_7_qnsc_tpl = TRUE or mismatch_out_8_time_out_tpl = TRUE or mismatch_out_9_eAxC_tpl = TRUE or mismatch_out_10_metadata_sym_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb port map (
    in_1_v_tpl_stm,
    in_2_c_tpl_stm,
    in_3_sop_tpl_stm,
    in_6_size_tpl_stm,
    in_4_real_d_tpl_stm,
    in_4_imag_d_tpl_stm,
    in_5_nsc_tpl_stm,
    in_7_time_in_tpl_stm,
    in_8_eAxC_no_tpl_stm,
    in_9_sym_metadata_tpl_stm,
    out_1_qv_tpl_dut,
    out_2_qc_tpl_dut,
    out_3_qsop_tpl_dut,
    out_4_qeop_tpl_dut,
    out_5_qsize_tpl_dut,
    out_6_real_q_tpl_dut,
    out_6_imag_q_tpl_dut,
    out_7_qnsc_tpl_dut,
    out_8_time_out_tpl_dut,
    out_9_eAxC_tpl_dut,
    out_10_metadata_sym_tpl_dut,
        clk,
        areset
);

sim : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_VFFT_btb_stm port map (
    in_1_v_tpl_stm,
    in_2_c_tpl_stm,
    in_3_sop_tpl_stm,
    in_6_size_tpl_stm,
    in_4_real_d_tpl_stm,
    in_4_imag_d_tpl_stm,
    in_5_nsc_tpl_stm,
    in_7_time_in_tpl_stm,
    in_8_eAxC_no_tpl_stm,
    in_9_sym_metadata_tpl_stm,
    out_1_qv_tpl_stm,
    out_2_qc_tpl_stm,
    out_3_qsop_tpl_stm,
    out_4_qeop_tpl_stm,
    out_5_qsize_tpl_stm,
    out_6_real_q_tpl_stm,
    out_6_imag_q_tpl_stm,
    out_7_qnsc_tpl_stm,
    out_8_time_out_tpl_stm,
    out_9_eAxC_tpl_stm,
    out_10_metadata_sym_tpl_stm,
        clk,
        areset
);

end normal;
