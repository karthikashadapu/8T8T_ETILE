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

-- VHDL created from dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re
-- VHDL created on Tue Jan  7 17:06:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb is
end;

architecture normal of dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_atb is

component dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xIn_1 : in std_logic_vector(15 downto 0);  -- sfix16
        xIn_2 : in std_logic_vector(15 downto 0);  -- sfix16
        xIn_3 : in std_logic_vector(15 downto 0);  -- sfix16
        xIn_4 : in std_logic_vector(15 downto 0);  -- sfix16
        xIn_5 : in std_logic_vector(15 downto 0);  -- sfix16
        xIn_6 : in std_logic_vector(15 downto 0);  -- sfix16
        xIn_7 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(38 downto 0);  -- sfix39
        xOut_1 : out std_logic_vector(38 downto 0);  -- sfix39
        xOut_2 : out std_logic_vector(38 downto 0);  -- sfix39
        xOut_3 : out std_logic_vector(38 downto 0);  -- sfix39
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_stm is
    port (
        xIn_v_stm : out std_logic_vector(0 downto 0);
        xIn_c_stm : out std_logic_vector(7 downto 0);
        xIn_0_stm : out std_logic_vector(15 downto 0);
        xIn_1_stm : out std_logic_vector(15 downto 0);
        xIn_2_stm : out std_logic_vector(15 downto 0);
        xIn_3_stm : out std_logic_vector(15 downto 0);
        xIn_4_stm : out std_logic_vector(15 downto 0);
        xIn_5_stm : out std_logic_vector(15 downto 0);
        xIn_6_stm : out std_logic_vector(15 downto 0);
        xIn_7_stm : out std_logic_vector(15 downto 0);
        xOut_v_stm : out std_logic_vector(0 downto 0);
        xOut_c_stm : out std_logic_vector(7 downto 0);
        xOut_0_stm : out std_logic_vector(38 downto 0);
        xOut_1_stm : out std_logic_vector(38 downto 0);
        xOut_2_stm : out std_logic_vector(38 downto 0);
        xOut_3_stm : out std_logic_vector(38 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal xIn_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_0_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_1_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_2_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_3_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_4_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_5_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_6_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_7_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xOut_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xOut_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal xOut_0_stm : STD_LOGIC_VECTOR (38 downto 0);
signal xOut_1_stm : STD_LOGIC_VECTOR (38 downto 0);
signal xOut_2_stm : STD_LOGIC_VECTOR (38 downto 0);
signal xOut_3_stm : STD_LOGIC_VECTOR (38 downto 0);
signal xIn_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_0_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_1_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_2_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_3_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_4_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_5_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_6_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_7_dut : STD_LOGIC_VECTOR (15 downto 0);
signal xOut_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xOut_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal xOut_0_dut : STD_LOGIC_VECTOR (38 downto 0);
signal xOut_1_dut : STD_LOGIC_VECTOR (38 downto 0);
signal xOut_2_dut : STD_LOGIC_VECTOR (38 downto 0);
signal xOut_3_dut : STD_LOGIC_VECTOR (38 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkxIn : process (clk, areset, xIn_0_dut, xIn_0_stm, xIn_1_dut, xIn_1_stm, xIn_2_dut, xIn_2_stm, xIn_3_dut, xIn_3_stm, xIn_4_dut, xIn_4_stm, xIn_5_dut, xIn_5_stm, xIn_6_dut, xIn_6_stm, xIn_7_dut, xIn_7_stm)
begin
END PROCESS;


-- Channelized data out check
checkxOut : process (clk, areset, xOut_0_dut, xOut_0_stm, xOut_1_dut, xOut_1_stm, xOut_2_dut, xOut_2_stm, xOut_3_dut, xOut_3_stm)
variable mismatch_xOut_v : BOOLEAN := FALSE;
variable mismatch_xOut_c : BOOLEAN := FALSE;
variable mismatch_xOut_0 : BOOLEAN := FALSE;
variable mismatch_xOut_1 : BOOLEAN := FALSE;
variable mismatch_xOut_2 : BOOLEAN := FALSE;
variable mismatch_xOut_3 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_xOut_v := FALSE;
        mismatch_xOut_c := FALSE;
        mismatch_xOut_0 := FALSE;
        mismatch_xOut_1 := FALSE;
        mismatch_xOut_2 := FALSE;
        mismatch_xOut_3 := FALSE;
        IF ( (xOut_v_dut /= xOut_v_stm)) THEN
            mismatch_xOut_v := TRUE;
            report "mismatch in xOut_v signal" severity Failure;
        END IF;
        IF ((xOut_v_dut = "1")) THEN
            IF ( (xOut_c_dut /= xOut_c_stm)) THEN
                mismatch_xOut_c := TRUE;
                report "mismatch in xOut_c signal" severity Warning;
            END IF;
            IF ( (xOut_0_dut /= xOut_0_stm)) THEN
                mismatch_xOut_0 := TRUE;
                report "mismatch in xOut_0 signal" severity Warning;
            END IF;
            IF ( (xOut_1_dut /= xOut_1_stm)) THEN
                mismatch_xOut_1 := TRUE;
                report "mismatch in xOut_1 signal" severity Warning;
            END IF;
            IF ( (xOut_2_dut /= xOut_2_stm)) THEN
                mismatch_xOut_2 := TRUE;
                report "mismatch in xOut_2 signal" severity Warning;
            END IF;
            IF ( (xOut_3_dut /= xOut_3_stm)) THEN
                mismatch_xOut_3 := TRUE;
                report "mismatch in xOut_3 signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_xOut_v = TRUE or mismatch_xOut_c = TRUE or mismatch_xOut_0 = TRUE or mismatch_xOut_1 = TRUE or mismatch_xOut_2 = TRUE or mismatch_xOut_3 = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_0_stm,
    xIn_1_stm,
    xIn_2_stm,
    xIn_3_stm,
    xIn_4_stm,
    xIn_5_stm,
    xIn_6_stm,
    xIn_7_stm,
    xOut_v_dut,
    xOut_c_dut,
    xOut_0_dut,
    xOut_1_dut,
    xOut_2_dut,
    xOut_3_dut,
        clk,
        areset
);

sim : dec_dly_comp_DUT_DUT_Polyphase_Decimator_HB3_re_stm port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_0_stm,
    xIn_1_stm,
    xIn_2_stm,
    xIn_3_stm,
    xIn_4_stm,
    xIn_5_stm,
    xIn_6_stm,
    xIn_7_stm,
    xOut_v_stm,
    xOut_c_stm,
    xOut_0_stm,
    xOut_1_stm,
    xOut_2_stm,
    xOut_3_stm,
        clk,
        areset
);

end normal;
