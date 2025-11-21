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

-- VHDL created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT_atb is
end;

architecture normal of ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT_atb is

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT is
    port (
        in_1_v_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_c_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_size_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_4_real_d_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en13
        in_4_imag_d_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en13
        out_1_qv_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qc_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_qsize_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_4_real_q_tpl : out std_logic_vector(28 downto 0);  -- sfix29_en13
        out_4_imag_q_tpl : out std_logic_vector(28 downto 0);  -- sfix29_en13
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT_stm is
    port (
        in_1_v_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_c_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_size_tpl_stm : out std_logic_vector(3 downto 0);
        in_4_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_qv_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_qc_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_qsize_tpl_stm : out std_logic_vector(3 downto 0);
        out_4_real_q_tpl_stm : out std_logic_vector(28 downto 0);
        out_4_imag_q_tpl_stm : out std_logic_vector(28 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_size_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_4_real_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_imag_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_qv_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_qsize_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_4_real_q_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal out_4_imag_q_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal in_1_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_size_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_4_real_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_imag_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_qv_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qc_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_qsize_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_4_real_q_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal out_4_imag_q_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_cunroll_x : process (clk, areset, in_3_size_tpl_dut, in_3_size_tpl_stm, in_4_real_d_tpl_dut, in_4_real_d_tpl_stm, in_4_imag_d_tpl_dut, in_4_imag_d_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut1_cunroll_x : process (clk, areset, out_3_qsize_tpl_dut, out_3_qsize_tpl_stm, out_4_real_q_tpl_dut, out_4_real_q_tpl_stm, out_4_imag_q_tpl_dut, out_4_imag_q_tpl_stm)
variable mismatch_out_1_qv_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_qc_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_qsize_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_real_q_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_imag_q_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_qv_tpl := FALSE;
        mismatch_out_2_qc_tpl := FALSE;
        mismatch_out_3_qsize_tpl := FALSE;
        mismatch_out_4_real_q_tpl := FALSE;
        mismatch_out_4_imag_q_tpl := FALSE;
        IF ( (out_1_qv_tpl_dut /= out_1_qv_tpl_stm)) THEN
            mismatch_out_1_qv_tpl := TRUE;
            report "mismatch in out_1_qv_tpl signal" severity Failure;
        END IF;
        IF ((out_1_qv_tpl_dut = "1")) THEN
            IF ( (out_2_qc_tpl_dut /= out_2_qc_tpl_stm)) THEN
                mismatch_out_2_qc_tpl := TRUE;
                report "mismatch in out_2_qc_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_qsize_tpl_dut /= out_3_qsize_tpl_stm)) THEN
                mismatch_out_3_qsize_tpl := TRUE;
                report "mismatch in out_3_qsize_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_real_q_tpl_dut /= out_4_real_q_tpl_stm)) THEN
                mismatch_out_4_real_q_tpl := TRUE;
                report "mismatch in out_4_real_q_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_imag_q_tpl_dut /= out_4_imag_q_tpl_stm)) THEN
                mismatch_out_4_imag_q_tpl := TRUE;
                report "mismatch in out_4_imag_q_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_qv_tpl = TRUE or mismatch_out_2_qc_tpl = TRUE or mismatch_out_3_qsize_tpl = TRUE or mismatch_out_4_real_q_tpl = TRUE or mismatch_out_4_imag_q_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT port map (
    in_1_v_tpl_stm,
    in_2_c_tpl_stm,
    in_3_size_tpl_stm,
    in_4_real_d_tpl_stm,
    in_4_imag_d_tpl_stm,
    out_1_qv_tpl_dut,
    out_2_qc_tpl_dut,
    out_3_qsize_tpl_dut,
    out_4_real_q_tpl_dut,
    out_4_imag_q_tpl_dut,
        clk,
        areset
);

sim : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_VFFT_stm port map (
    in_1_v_tpl_stm,
    in_2_c_tpl_stm,
    in_3_size_tpl_stm,
    in_4_real_d_tpl_stm,
    in_4_imag_d_tpl_stm,
    out_1_qv_tpl_stm,
    out_2_qc_tpl_stm,
    out_3_qsize_tpl_stm,
    out_4_real_q_tpl_stm,
    out_4_imag_q_tpl_stm,
        clk,
        areset
);

end normal;
