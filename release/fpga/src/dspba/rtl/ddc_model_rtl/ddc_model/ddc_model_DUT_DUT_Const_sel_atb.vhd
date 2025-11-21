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

-- VHDL created from ddc_model_DUT_DUT_Const_sel
-- VHDL created on Thu Jan  9 15:36:33 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ddc_model_DUT_DUT_Const_sel_atb is
end;

architecture normal of ddc_model_DUT_DUT_Const_sel_atb is

component ddc_model_DUT_DUT_Const_sel is
    port (
        in_3_vin_d1_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_4_cin_d1_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_0_real_din_d1_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_1_0_imag_din_d1_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_1_1_real_din_d1_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_1_1_imag_din_d1_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_1_2_real_din_d1_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_1_2_imag_din_d1_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_1_3_real_din_d1_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_1_3_imag_din_d1_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_5_mux_sel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_0_real_din_d2_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_2_0_imag_din_d2_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_2_1_real_din_d2_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_2_1_imag_din_d2_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_2_2_real_din_d2_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_2_2_imag_din_d2_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_2_3_real_din_d2_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        in_2_3_imag_din_d2_tpl : in std_logic_vector(31 downto 0);  -- sfix32_en27
        out_2_vin_a1_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_cin_a1_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_0_real_din_a1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_0_imag_din_a1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_1_real_din_a1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_1_imag_din_a1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_2_real_din_a1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_2_imag_din_a1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_3_real_din_a1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_3_imag_din_a1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ddc_model_DUT_DUT_Const_sel_stm is
    port (
        in_3_vin_d1_tpl_stm : out std_logic_vector(0 downto 0);
        in_4_cin_d1_tpl_stm : out std_logic_vector(7 downto 0);
        in_1_0_real_din_d1_tpl_stm : out std_logic_vector(31 downto 0);
        in_1_0_imag_din_d1_tpl_stm : out std_logic_vector(31 downto 0);
        in_1_1_real_din_d1_tpl_stm : out std_logic_vector(31 downto 0);
        in_1_1_imag_din_d1_tpl_stm : out std_logic_vector(31 downto 0);
        in_1_2_real_din_d1_tpl_stm : out std_logic_vector(31 downto 0);
        in_1_2_imag_din_d1_tpl_stm : out std_logic_vector(31 downto 0);
        in_1_3_real_din_d1_tpl_stm : out std_logic_vector(31 downto 0);
        in_1_3_imag_din_d1_tpl_stm : out std_logic_vector(31 downto 0);
        in_5_mux_sel_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_0_real_din_d2_tpl_stm : out std_logic_vector(31 downto 0);
        in_2_0_imag_din_d2_tpl_stm : out std_logic_vector(31 downto 0);
        in_2_1_real_din_d2_tpl_stm : out std_logic_vector(31 downto 0);
        in_2_1_imag_din_d2_tpl_stm : out std_logic_vector(31 downto 0);
        in_2_2_real_din_d2_tpl_stm : out std_logic_vector(31 downto 0);
        in_2_2_imag_din_d2_tpl_stm : out std_logic_vector(31 downto 0);
        in_2_3_real_din_d2_tpl_stm : out std_logic_vector(31 downto 0);
        in_2_3_imag_din_d2_tpl_stm : out std_logic_vector(31 downto 0);
        out_2_vin_a1_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_cin_a1_tpl_stm : out std_logic_vector(7 downto 0);
        out_1_0_real_din_a1_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_0_imag_din_a1_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_1_real_din_a1_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_1_imag_din_a1_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_2_real_din_a1_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_2_imag_din_a1_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_3_real_din_a1_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_3_imag_din_a1_tpl_stm : out std_logic_vector(31 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_3_vin_d1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_4_cin_d1_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_0_real_din_d1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_0_imag_din_d1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_1_real_din_d1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_1_imag_din_d1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_2_real_din_d1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_2_imag_din_d1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_3_real_din_d1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_3_imag_din_d1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_5_mux_sel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_0_real_din_d2_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_0_imag_din_d2_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_1_real_din_d2_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_1_imag_din_d2_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_2_real_din_d2_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_2_imag_din_d2_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_3_real_din_d2_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_3_imag_din_d2_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_2_vin_a1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cin_a1_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_0_real_din_a1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_0_imag_din_a1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_1_real_din_a1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_1_imag_din_a1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_2_real_din_a1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_2_imag_din_a1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_3_real_din_a1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_3_imag_din_a1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_3_vin_d1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_4_cin_d1_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_0_real_din_d1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_0_imag_din_d1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_1_real_din_d1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_1_imag_din_d1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_2_real_din_d1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_2_imag_din_d1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_3_real_din_d1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_3_imag_din_d1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_5_mux_sel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_0_real_din_d2_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_0_imag_din_d2_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_1_real_din_d2_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_1_imag_din_d2_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_2_real_din_d2_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_2_imag_din_d2_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_3_real_din_d2_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_2_3_imag_din_d2_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_2_vin_a1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cin_a1_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_0_real_din_a1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_0_imag_din_a1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_1_real_din_a1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_1_imag_din_a1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_2_real_din_a1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_2_imag_din_a1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_3_real_din_a1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_3_imag_din_a1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannel_In_HB_Bypass_vunroll_cunroll_x : process (clk, areset, in_1_0_real_din_d1_tpl_dut, in_1_0_real_din_d1_tpl_stm, in_1_0_imag_din_d1_tpl_dut, in_1_0_imag_din_d1_tpl_stm, in_1_1_real_din_d1_tpl_dut, in_1_1_real_din_d1_tpl_stm, in_1_1_imag_din_d1_tpl_dut, in_1_1_imag_din_d1_tpl_stm, in_1_2_real_din_d1_tpl_dut, in_1_2_real_din_d1_tpl_stm, in_1_2_imag_din_d1_tpl_dut, in_1_2_imag_din_d1_tpl_stm, in_1_3_real_din_d1_tpl_dut, in_1_3_real_din_d1_tpl_stm, in_1_3_imag_din_d1_tpl_dut, in_1_3_imag_din_d1_tpl_stm, in_5_mux_sel_tpl_dut, in_5_mux_sel_tpl_stm, in_2_0_real_din_d2_tpl_dut, in_2_0_real_din_d2_tpl_stm, in_2_0_imag_din_d2_tpl_dut, in_2_0_imag_din_d2_tpl_stm, in_2_1_real_din_d2_tpl_dut, in_2_1_real_din_d2_tpl_stm, in_2_1_imag_din_d2_tpl_dut, in_2_1_imag_din_d2_tpl_stm, in_2_2_real_din_d2_tpl_dut, in_2_2_real_din_d2_tpl_stm, in_2_2_imag_din_d2_tpl_dut, in_2_2_imag_din_d2_tpl_stm, in_2_3_real_din_d2_tpl_dut, in_2_3_real_din_d2_tpl_stm, in_2_3_imag_din_d2_tpl_dut, in_2_3_imag_din_d2_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannel_out_HC_Bypass_vunroll_cunroll_x : process (clk, areset, out_1_0_real_din_a1_tpl_dut, out_1_0_real_din_a1_tpl_stm, out_1_0_imag_din_a1_tpl_dut, out_1_0_imag_din_a1_tpl_stm, out_1_1_real_din_a1_tpl_dut, out_1_1_real_din_a1_tpl_stm, out_1_1_imag_din_a1_tpl_dut, out_1_1_imag_din_a1_tpl_stm, out_1_2_real_din_a1_tpl_dut, out_1_2_real_din_a1_tpl_stm, out_1_2_imag_din_a1_tpl_dut, out_1_2_imag_din_a1_tpl_stm, out_1_3_real_din_a1_tpl_dut, out_1_3_real_din_a1_tpl_stm, out_1_3_imag_din_a1_tpl_dut, out_1_3_imag_din_a1_tpl_stm)
variable mismatch_out_2_vin_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_cin_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_0_real_din_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_0_imag_din_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_1_real_din_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_1_imag_din_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_2_real_din_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_2_imag_din_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_3_real_din_a1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_3_imag_din_a1_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_2_vin_a1_tpl := FALSE;
        mismatch_out_3_cin_a1_tpl := FALSE;
        mismatch_out_1_0_real_din_a1_tpl := FALSE;
        mismatch_out_1_0_imag_din_a1_tpl := FALSE;
        mismatch_out_1_1_real_din_a1_tpl := FALSE;
        mismatch_out_1_1_imag_din_a1_tpl := FALSE;
        mismatch_out_1_2_real_din_a1_tpl := FALSE;
        mismatch_out_1_2_imag_din_a1_tpl := FALSE;
        mismatch_out_1_3_real_din_a1_tpl := FALSE;
        mismatch_out_1_3_imag_din_a1_tpl := FALSE;
        IF ( (out_2_vin_a1_tpl_dut /= out_2_vin_a1_tpl_stm)) THEN
            mismatch_out_2_vin_a1_tpl := TRUE;
            report "mismatch in out_2_vin_a1_tpl signal" severity Failure;
        END IF;
        IF ((out_2_vin_a1_tpl_dut = "1")) THEN
            IF ( (out_3_cin_a1_tpl_dut /= out_3_cin_a1_tpl_stm)) THEN
                mismatch_out_3_cin_a1_tpl := TRUE;
                report "mismatch in out_3_cin_a1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_0_real_din_a1_tpl_dut /= out_1_0_real_din_a1_tpl_stm)) THEN
                mismatch_out_1_0_real_din_a1_tpl := TRUE;
                report "mismatch in out_1_0_real_din_a1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_0_imag_din_a1_tpl_dut /= out_1_0_imag_din_a1_tpl_stm)) THEN
                mismatch_out_1_0_imag_din_a1_tpl := TRUE;
                report "mismatch in out_1_0_imag_din_a1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_1_real_din_a1_tpl_dut /= out_1_1_real_din_a1_tpl_stm)) THEN
                mismatch_out_1_1_real_din_a1_tpl := TRUE;
                report "mismatch in out_1_1_real_din_a1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_1_imag_din_a1_tpl_dut /= out_1_1_imag_din_a1_tpl_stm)) THEN
                mismatch_out_1_1_imag_din_a1_tpl := TRUE;
                report "mismatch in out_1_1_imag_din_a1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_2_real_din_a1_tpl_dut /= out_1_2_real_din_a1_tpl_stm)) THEN
                mismatch_out_1_2_real_din_a1_tpl := TRUE;
                report "mismatch in out_1_2_real_din_a1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_2_imag_din_a1_tpl_dut /= out_1_2_imag_din_a1_tpl_stm)) THEN
                mismatch_out_1_2_imag_din_a1_tpl := TRUE;
                report "mismatch in out_1_2_imag_din_a1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_3_real_din_a1_tpl_dut /= out_1_3_real_din_a1_tpl_stm)) THEN
                mismatch_out_1_3_real_din_a1_tpl := TRUE;
                report "mismatch in out_1_3_real_din_a1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_3_imag_din_a1_tpl_dut /= out_1_3_imag_din_a1_tpl_stm)) THEN
                mismatch_out_1_3_imag_din_a1_tpl := TRUE;
                report "mismatch in out_1_3_imag_din_a1_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_2_vin_a1_tpl = TRUE or mismatch_out_3_cin_a1_tpl = TRUE or mismatch_out_1_0_real_din_a1_tpl = TRUE or mismatch_out_1_0_imag_din_a1_tpl = TRUE or mismatch_out_1_1_real_din_a1_tpl = TRUE or mismatch_out_1_1_imag_din_a1_tpl = TRUE or mismatch_out_1_2_real_din_a1_tpl = TRUE or mismatch_out_1_2_imag_din_a1_tpl = TRUE or mismatch_out_1_3_real_din_a1_tpl = TRUE or mismatch_out_1_3_imag_din_a1_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : ddc_model_DUT_DUT_Const_sel port map (
    in_3_vin_d1_tpl_stm,
    in_4_cin_d1_tpl_stm,
    in_1_0_real_din_d1_tpl_stm,
    in_1_0_imag_din_d1_tpl_stm,
    in_1_1_real_din_d1_tpl_stm,
    in_1_1_imag_din_d1_tpl_stm,
    in_1_2_real_din_d1_tpl_stm,
    in_1_2_imag_din_d1_tpl_stm,
    in_1_3_real_din_d1_tpl_stm,
    in_1_3_imag_din_d1_tpl_stm,
    in_5_mux_sel_tpl_stm,
    in_2_0_real_din_d2_tpl_stm,
    in_2_0_imag_din_d2_tpl_stm,
    in_2_1_real_din_d2_tpl_stm,
    in_2_1_imag_din_d2_tpl_stm,
    in_2_2_real_din_d2_tpl_stm,
    in_2_2_imag_din_d2_tpl_stm,
    in_2_3_real_din_d2_tpl_stm,
    in_2_3_imag_din_d2_tpl_stm,
    out_2_vin_a1_tpl_dut,
    out_3_cin_a1_tpl_dut,
    out_1_0_real_din_a1_tpl_dut,
    out_1_0_imag_din_a1_tpl_dut,
    out_1_1_real_din_a1_tpl_dut,
    out_1_1_imag_din_a1_tpl_dut,
    out_1_2_real_din_a1_tpl_dut,
    out_1_2_imag_din_a1_tpl_dut,
    out_1_3_real_din_a1_tpl_dut,
    out_1_3_imag_din_a1_tpl_dut,
        clk,
        areset
);

sim : ddc_model_DUT_DUT_Const_sel_stm port map (
    in_3_vin_d1_tpl_stm,
    in_4_cin_d1_tpl_stm,
    in_1_0_real_din_d1_tpl_stm,
    in_1_0_imag_din_d1_tpl_stm,
    in_1_1_real_din_d1_tpl_stm,
    in_1_1_imag_din_d1_tpl_stm,
    in_1_2_real_din_d1_tpl_stm,
    in_1_2_imag_din_d1_tpl_stm,
    in_1_3_real_din_d1_tpl_stm,
    in_1_3_imag_din_d1_tpl_stm,
    in_5_mux_sel_tpl_stm,
    in_2_0_real_din_d2_tpl_stm,
    in_2_0_imag_din_d2_tpl_stm,
    in_2_1_real_din_d2_tpl_stm,
    in_2_1_imag_din_d2_tpl_stm,
    in_2_2_real_din_d2_tpl_stm,
    in_2_2_imag_din_d2_tpl_stm,
    in_2_3_real_din_d2_tpl_stm,
    in_2_3_imag_din_d2_tpl_stm,
    out_2_vin_a1_tpl_stm,
    out_3_cin_a1_tpl_stm,
    out_1_0_real_din_a1_tpl_stm,
    out_1_0_imag_din_a1_tpl_stm,
    out_1_1_real_din_a1_tpl_stm,
    out_1_1_imag_din_a1_tpl_stm,
    out_1_2_real_din_a1_tpl_stm,
    out_1_2_imag_din_a1_tpl_stm,
    out_1_3_real_din_a1_tpl_stm,
    out_1_3_imag_din_a1_tpl_stm,
        clk,
        areset
);

end normal;
