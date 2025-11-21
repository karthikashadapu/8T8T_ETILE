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

-- VHDL created from ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3
-- VHDL created on Tue Jan  7 17:04:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3_atb is
end;

architecture normal of ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3_atb is

component ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3 is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(32 downto 0);  -- sfix33
        xIn_1 : in std_logic_vector(32 downto 0);  -- sfix33
        xIn_2 : in std_logic_vector(32 downto 0);  -- sfix33
        xIn_3 : in std_logic_vector(32 downto 0);  -- sfix33
        gain_i : in std_logic_vector(0 downto 0);  -- sfix1
        qOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        qOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        qOut_0 : out std_logic_vector(15 downto 0);  -- sfix16
        qOut_1 : out std_logic_vector(15 downto 0);  -- sfix16
        qOut_2 : out std_logic_vector(15 downto 0);  -- sfix16
        qOut_3 : out std_logic_vector(15 downto 0);  -- sfix16
        eOut_0 : out std_logic_vector(0 downto 0);  -- sfix1
        eOut_1 : out std_logic_vector(0 downto 0);  -- sfix1
        eOut_2 : out std_logic_vector(0 downto 0);  -- sfix1
        eOut_3 : out std_logic_vector(0 downto 0);  -- sfix1
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3_stm is
    port (
        xIn_v_stm : out std_logic_vector(0 downto 0);
        xIn_c_stm : out std_logic_vector(7 downto 0);
        xIn_0_stm : out std_logic_vector(32 downto 0);
        xIn_1_stm : out std_logic_vector(32 downto 0);
        xIn_2_stm : out std_logic_vector(32 downto 0);
        xIn_3_stm : out std_logic_vector(32 downto 0);
        gain_i_stm : out std_logic_vector(0 downto 0);
        qOut_v_stm : out std_logic_vector(0 downto 0);
        qOut_c_stm : out std_logic_vector(7 downto 0);
        qOut_0_stm : out std_logic_vector(15 downto 0);
        qOut_1_stm : out std_logic_vector(15 downto 0);
        qOut_2_stm : out std_logic_vector(15 downto 0);
        qOut_3_stm : out std_logic_vector(15 downto 0);
        eOut_0_stm : out std_logic_vector(0 downto 0);
        eOut_1_stm : out std_logic_vector(0 downto 0);
        eOut_2_stm : out std_logic_vector(0 downto 0);
        eOut_3_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal xIn_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_0_stm : STD_LOGIC_VECTOR (32 downto 0);
signal xIn_1_stm : STD_LOGIC_VECTOR (32 downto 0);
signal xIn_2_stm : STD_LOGIC_VECTOR (32 downto 0);
signal xIn_3_stm : STD_LOGIC_VECTOR (32 downto 0);
signal gain_i_stm : STD_LOGIC_VECTOR (0 downto 0);
signal qOut_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal qOut_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal qOut_0_stm : STD_LOGIC_VECTOR (15 downto 0);
signal qOut_1_stm : STD_LOGIC_VECTOR (15 downto 0);
signal qOut_2_stm : STD_LOGIC_VECTOR (15 downto 0);
signal qOut_3_stm : STD_LOGIC_VECTOR (15 downto 0);
signal eOut_0_stm : STD_LOGIC_VECTOR (0 downto 0);
signal eOut_1_stm : STD_LOGIC_VECTOR (0 downto 0);
signal eOut_2_stm : STD_LOGIC_VECTOR (0 downto 0);
signal eOut_3_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_0_dut : STD_LOGIC_VECTOR (32 downto 0);
signal xIn_1_dut : STD_LOGIC_VECTOR (32 downto 0);
signal xIn_2_dut : STD_LOGIC_VECTOR (32 downto 0);
signal xIn_3_dut : STD_LOGIC_VECTOR (32 downto 0);
signal gain_i_dut : STD_LOGIC_VECTOR (0 downto 0);
signal qOut_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal qOut_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal qOut_0_dut : STD_LOGIC_VECTOR (15 downto 0);
signal qOut_1_dut : STD_LOGIC_VECTOR (15 downto 0);
signal qOut_2_dut : STD_LOGIC_VECTOR (15 downto 0);
signal qOut_3_dut : STD_LOGIC_VECTOR (15 downto 0);
signal eOut_0_dut : STD_LOGIC_VECTOR (0 downto 0);
signal eOut_1_dut : STD_LOGIC_VECTOR (0 downto 0);
signal eOut_2_dut : STD_LOGIC_VECTOR (0 downto 0);
signal eOut_3_dut : STD_LOGIC_VECTOR (0 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkxIn : process (clk, areset, xIn_0_dut, xIn_0_stm, xIn_1_dut, xIn_1_stm, xIn_2_dut, xIn_2_stm, xIn_3_dut, xIn_3_stm, gain_i_dut, gain_i_stm)
begin
END PROCESS;


-- Channelized data out check
checkqOut : process (clk, areset, qOut_0_dut, qOut_0_stm, qOut_1_dut, qOut_1_stm, qOut_2_dut, qOut_2_stm, qOut_3_dut, qOut_3_stm, eOut_0_dut, eOut_0_stm, eOut_1_dut, eOut_1_stm, eOut_2_dut, eOut_2_stm, eOut_3_dut, eOut_3_stm)
variable mismatch_qOut_v : BOOLEAN := FALSE;
variable mismatch_qOut_c : BOOLEAN := FALSE;
variable mismatch_qOut_0 : BOOLEAN := FALSE;
variable mismatch_qOut_1 : BOOLEAN := FALSE;
variable mismatch_qOut_2 : BOOLEAN := FALSE;
variable mismatch_qOut_3 : BOOLEAN := FALSE;
variable mismatch_eOut_0 : BOOLEAN := FALSE;
variable mismatch_eOut_1 : BOOLEAN := FALSE;
variable mismatch_eOut_2 : BOOLEAN := FALSE;
variable mismatch_eOut_3 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_qOut_v := FALSE;
        mismatch_qOut_c := FALSE;
        mismatch_qOut_0 := FALSE;
        mismatch_qOut_1 := FALSE;
        mismatch_qOut_2 := FALSE;
        mismatch_qOut_3 := FALSE;
        mismatch_eOut_0 := FALSE;
        mismatch_eOut_1 := FALSE;
        mismatch_eOut_2 := FALSE;
        mismatch_eOut_3 := FALSE;
        IF ( (qOut_v_dut /= qOut_v_stm)) THEN
            mismatch_qOut_v := TRUE;
            report "mismatch in qOut_v signal" severity Failure;
        END IF;
        IF ((qOut_v_dut = "1")) THEN
            IF ( (qOut_c_dut /= qOut_c_stm)) THEN
                mismatch_qOut_c := TRUE;
                report "mismatch in qOut_c signal" severity Warning;
            END IF;
            IF ( (qOut_0_dut /= qOut_0_stm)) THEN
                mismatch_qOut_0 := TRUE;
                report "mismatch in qOut_0 signal" severity Warning;
            END IF;
            IF ( (qOut_1_dut /= qOut_1_stm)) THEN
                mismatch_qOut_1 := TRUE;
                report "mismatch in qOut_1 signal" severity Warning;
            END IF;
            IF ( (qOut_2_dut /= qOut_2_stm)) THEN
                mismatch_qOut_2 := TRUE;
                report "mismatch in qOut_2 signal" severity Warning;
            END IF;
            IF ( (qOut_3_dut /= qOut_3_stm)) THEN
                mismatch_qOut_3 := TRUE;
                report "mismatch in qOut_3 signal" severity Warning;
            END IF;
            IF ( (eOut_0_dut /= eOut_0_stm)) THEN
                mismatch_eOut_0 := TRUE;
                report "mismatch in eOut_0 signal" severity Warning;
            END IF;
            IF ( (eOut_1_dut /= eOut_1_stm)) THEN
                mismatch_eOut_1 := TRUE;
                report "mismatch in eOut_1 signal" severity Warning;
            END IF;
            IF ( (eOut_2_dut /= eOut_2_stm)) THEN
                mismatch_eOut_2 := TRUE;
                report "mismatch in eOut_2 signal" severity Warning;
            END IF;
            IF ( (eOut_3_dut /= eOut_3_stm)) THEN
                mismatch_eOut_3 := TRUE;
                report "mismatch in eOut_3 signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_qOut_v = TRUE or mismatch_qOut_c = TRUE or mismatch_qOut_0 = TRUE or mismatch_qOut_1 = TRUE or mismatch_qOut_2 = TRUE or mismatch_qOut_3 = TRUE or mismatch_eOut_0 = TRUE or mismatch_eOut_1 = TRUE or mismatch_eOut_2 = TRUE or mismatch_eOut_3 = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3 port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_0_stm,
    xIn_1_stm,
    xIn_2_stm,
    xIn_3_stm,
    gain_i_stm,
    qOut_v_dut,
    qOut_c_dut,
    qOut_0_dut,
    qOut_1_dut,
    qOut_2_dut,
    qOut_3_dut,
    eOut_0_dut,
    eOut_1_dut,
    eOut_2_dut,
    eOut_3_dut,
        clk,
        areset
);

sim : ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3_stm port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_0_stm,
    xIn_1_stm,
    xIn_2_stm,
    xIn_3_stm,
    gain_i_stm,
    qOut_v_stm,
    qOut_c_stm,
    qOut_0_stm,
    qOut_1_stm,
    qOut_2_stm,
    qOut_3_stm,
    eOut_0_stm,
    eOut_1_stm,
    eOut_2_stm,
    eOut_3_stm,
        clk,
        areset
);

end normal;
