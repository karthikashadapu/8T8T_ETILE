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

-- VHDL created from prach_shortFormat_fftShift_prach_PRACH_CC_gain
-- VHDL created on Wed Nov  6 19:28:33 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity prach_shortFormat_fftShift_prach_PRACH_CC_gain_atb is
end;

architecture normal of prach_shortFormat_fftShift_prach_PRACH_CC_gain_atb is

component prach_shortFormat_fftShift_prach_PRACH_CC_gain is
    port (
        in_2_data_valid_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_chin_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_real_data_in_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_1_imag_data_in_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_4_real_gain_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_4_imag_gain_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        out_2_valid_out_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_ch_no_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_real_data_out_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_imag_data_out_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component prach_shortFormat_fftShift_prach_PRACH_CC_gain_stm is
    port (
        in_2_data_valid_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_chin_tpl_stm : out std_logic_vector(7 downto 0);
        in_1_real_data_in_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_imag_data_in_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_real_gain_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_imag_gain_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_valid_out_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_ch_no_tpl_stm : out std_logic_vector(7 downto 0);
        out_1_real_data_out_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_imag_data_out_tpl_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_2_data_valid_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_chin_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_real_data_in_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_imag_data_in_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_real_gain_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_imag_gain_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_valid_out_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_ch_no_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_real_data_out_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_data_out_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_data_valid_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_chin_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_real_data_in_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_imag_data_in_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_real_gain_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_imag_gain_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_valid_out_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_ch_no_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_real_data_out_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_data_out_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_cunroll_x : process (clk, areset, in_1_real_data_in_tpl_dut, in_1_real_data_in_tpl_stm, in_1_imag_data_in_tpl_dut, in_1_imag_data_in_tpl_stm, in_4_real_gain_tpl_dut, in_4_real_gain_tpl_stm, in_4_imag_gain_tpl_dut, in_4_imag_gain_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut_cunroll_x : process (clk, areset, out_1_real_data_out_tpl_dut, out_1_real_data_out_tpl_stm, out_1_imag_data_out_tpl_dut, out_1_imag_data_out_tpl_stm)
variable mismatch_out_2_valid_out_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_ch_no_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_real_data_out_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_imag_data_out_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_2_valid_out_tpl := FALSE;
        mismatch_out_3_ch_no_tpl := FALSE;
        mismatch_out_1_real_data_out_tpl := FALSE;
        mismatch_out_1_imag_data_out_tpl := FALSE;
        IF ( (out_2_valid_out_tpl_dut /= out_2_valid_out_tpl_stm)) THEN
            mismatch_out_2_valid_out_tpl := TRUE;
            report "mismatch in out_2_valid_out_tpl signal" severity Failure;
        END IF;
        IF ((out_2_valid_out_tpl_dut = "1")) THEN
            IF ( (out_3_ch_no_tpl_dut /= out_3_ch_no_tpl_stm)) THEN
                mismatch_out_3_ch_no_tpl := TRUE;
                report "mismatch in out_3_ch_no_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_real_data_out_tpl_dut /= out_1_real_data_out_tpl_stm)) THEN
                mismatch_out_1_real_data_out_tpl := TRUE;
                report "mismatch in out_1_real_data_out_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_imag_data_out_tpl_dut /= out_1_imag_data_out_tpl_stm)) THEN
                mismatch_out_1_imag_data_out_tpl := TRUE;
                report "mismatch in out_1_imag_data_out_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_2_valid_out_tpl = TRUE or mismatch_out_3_ch_no_tpl = TRUE or mismatch_out_1_real_data_out_tpl = TRUE or mismatch_out_1_imag_data_out_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : prach_shortFormat_fftShift_prach_PRACH_CC_gain port map (
    in_2_data_valid_tpl_stm,
    in_3_chin_tpl_stm,
    in_1_real_data_in_tpl_stm,
    in_1_imag_data_in_tpl_stm,
    in_4_real_gain_tpl_stm,
    in_4_imag_gain_tpl_stm,
    out_2_valid_out_tpl_dut,
    out_3_ch_no_tpl_dut,
    out_1_real_data_out_tpl_dut,
    out_1_imag_data_out_tpl_dut,
        clk,
        areset
);

sim : prach_shortFormat_fftShift_prach_PRACH_CC_gain_stm port map (
    in_2_data_valid_tpl_stm,
    in_3_chin_tpl_stm,
    in_1_real_data_in_tpl_stm,
    in_1_imag_data_in_tpl_stm,
    in_4_real_gain_tpl_stm,
    in_4_imag_gain_tpl_stm,
    out_2_valid_out_tpl_stm,
    out_3_ch_no_tpl_stm,
    out_1_real_data_out_tpl_stm,
    out_1_imag_data_out_tpl_stm,
        clk,
        areset
);

end normal;
