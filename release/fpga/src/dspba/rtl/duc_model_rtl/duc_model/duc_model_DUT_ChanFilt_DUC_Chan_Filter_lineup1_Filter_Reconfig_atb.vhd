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

-- VHDL created from duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig
-- VHDL created on Thu Jan  9 15:34:39 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb is
end;

architecture normal of duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_atb is

component duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig is
    port (
        in_2_In3_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_In6_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_real_In1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_imag_In1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_BW_CC1_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        out_2_Out4_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_Out6_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_real_Out1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_imag_Out1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_4_CoefBankSel_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_stm is
    port (
        in_2_In3_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_In6_tpl_stm : out std_logic_vector(7 downto 0);
        in_1_real_In1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_imag_In1_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_BW_CC1_tpl_stm : out std_logic_vector(7 downto 0);
        out_2_Out4_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_Out6_tpl_stm : out std_logic_vector(7 downto 0);
        out_1_real_Out1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_imag_Out1_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_CoefBankSel_tpl_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_2_In3_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_In6_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_real_In1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_imag_In1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_BW_CC1_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_2_Out4_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_Out6_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_real_Out1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_Out1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_CoefBankSel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_In3_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_In6_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_real_In1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_imag_In1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_BW_CC1_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_2_Out4_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_Out6_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_real_Out1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_Out1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_CoefBankSel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_cunroll_x : process (clk, areset, in_1_real_In1_tpl_dut, in_1_real_In1_tpl_stm, in_1_imag_In1_tpl_dut, in_1_imag_In1_tpl_stm, in_4_BW_CC1_tpl_dut, in_4_BW_CC1_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut_cunroll_x : process (clk, areset, out_1_real_Out1_tpl_dut, out_1_real_Out1_tpl_stm, out_1_imag_Out1_tpl_dut, out_1_imag_Out1_tpl_stm, out_4_CoefBankSel_tpl_dut, out_4_CoefBankSel_tpl_stm)
variable mismatch_out_2_Out4_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_Out6_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_real_Out1_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_imag_Out1_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_CoefBankSel_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_2_Out4_tpl := FALSE;
        mismatch_out_3_Out6_tpl := FALSE;
        mismatch_out_1_real_Out1_tpl := FALSE;
        mismatch_out_1_imag_Out1_tpl := FALSE;
        mismatch_out_4_CoefBankSel_tpl := FALSE;
        IF ( (out_2_Out4_tpl_dut /= out_2_Out4_tpl_stm)) THEN
            mismatch_out_2_Out4_tpl := TRUE;
            report "mismatch in out_2_Out4_tpl signal" severity Failure;
        END IF;
        IF ((out_2_Out4_tpl_dut = "1")) THEN
            IF ( (out_3_Out6_tpl_dut /= out_3_Out6_tpl_stm)) THEN
                mismatch_out_3_Out6_tpl := TRUE;
                report "mismatch in out_3_Out6_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_real_Out1_tpl_dut /= out_1_real_Out1_tpl_stm)) THEN
                mismatch_out_1_real_Out1_tpl := TRUE;
                report "mismatch in out_1_real_Out1_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_imag_Out1_tpl_dut /= out_1_imag_Out1_tpl_stm)) THEN
                mismatch_out_1_imag_Out1_tpl := TRUE;
                report "mismatch in out_1_imag_Out1_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_CoefBankSel_tpl_dut /= out_4_CoefBankSel_tpl_stm)) THEN
                mismatch_out_4_CoefBankSel_tpl := TRUE;
                report "mismatch in out_4_CoefBankSel_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_2_Out4_tpl = TRUE or mismatch_out_3_Out6_tpl = TRUE or mismatch_out_1_real_Out1_tpl = TRUE or mismatch_out_1_imag_Out1_tpl = TRUE or mismatch_out_4_CoefBankSel_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig port map (
    in_2_In3_tpl_stm,
    in_3_In6_tpl_stm,
    in_1_real_In1_tpl_stm,
    in_1_imag_In1_tpl_stm,
    in_4_BW_CC1_tpl_stm,
    out_2_Out4_tpl_dut,
    out_3_Out6_tpl_dut,
    out_1_real_Out1_tpl_dut,
    out_1_imag_Out1_tpl_dut,
    out_4_CoefBankSel_tpl_dut,
        clk,
        areset
);

sim : duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_stm port map (
    in_2_In3_tpl_stm,
    in_3_In6_tpl_stm,
    in_1_real_In1_tpl_stm,
    in_1_imag_In1_tpl_stm,
    in_4_BW_CC1_tpl_stm,
    out_2_Out4_tpl_stm,
    out_3_Out6_tpl_stm,
    out_1_real_Out1_tpl_stm,
    out_1_imag_Out1_tpl_stm,
    out_4_CoefBankSel_tpl_stm,
        clk,
        areset
);

end normal;
