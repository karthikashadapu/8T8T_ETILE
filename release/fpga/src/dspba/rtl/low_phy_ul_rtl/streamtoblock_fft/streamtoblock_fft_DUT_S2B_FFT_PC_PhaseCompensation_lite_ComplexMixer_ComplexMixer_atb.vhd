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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_atb is
end;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_atb is

component streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer is
    port (
        In_v : in std_logic_vector(0 downto 0);  -- sfix1
        In_c : in std_logic_vector(7 downto 0);  -- sfix8
        iIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        qIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        sIn_0 : in std_logic_vector(17 downto 0);  -- sfix18
        cIn_0 : in std_logic_vector(17 downto 0);  -- sfix18
        qOut_0 : out std_logic_vector(34 downto 0);  -- sfix35
        Out_v : out std_logic_vector(0 downto 0);  -- ufix1
        Out_c : out std_logic_vector(7 downto 0);  -- ufix8
        iOut_0 : out std_logic_vector(34 downto 0);  -- sfix35
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_stm is
    port (
        In_v_stm : out std_logic_vector(0 downto 0);
        In_c_stm : out std_logic_vector(7 downto 0);
        iIn_0_stm : out std_logic_vector(15 downto 0);
        qIn_0_stm : out std_logic_vector(15 downto 0);
        sIn_0_stm : out std_logic_vector(17 downto 0);
        cIn_0_stm : out std_logic_vector(17 downto 0);
        qOut_0_stm : out std_logic_vector(34 downto 0);
        Out_v_stm : out std_logic_vector(0 downto 0);
        Out_c_stm : out std_logic_vector(7 downto 0);
        iOut_0_stm : out std_logic_vector(34 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal In_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal In_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal iIn_0_stm : STD_LOGIC_VECTOR (15 downto 0);
signal qIn_0_stm : STD_LOGIC_VECTOR (15 downto 0);
signal sIn_0_stm : STD_LOGIC_VECTOR (17 downto 0);
signal cIn_0_stm : STD_LOGIC_VECTOR (17 downto 0);
signal qOut_0_stm : STD_LOGIC_VECTOR (34 downto 0);
signal Out_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal Out_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal iOut_0_stm : STD_LOGIC_VECTOR (34 downto 0);
signal In_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal In_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal iIn_0_dut : STD_LOGIC_VECTOR (15 downto 0);
signal qIn_0_dut : STD_LOGIC_VECTOR (15 downto 0);
signal sIn_0_dut : STD_LOGIC_VECTOR (17 downto 0);
signal cIn_0_dut : STD_LOGIC_VECTOR (17 downto 0);
signal qOut_0_dut : STD_LOGIC_VECTOR (34 downto 0);
signal Out_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal Out_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal iOut_0_dut : STD_LOGIC_VECTOR (34 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkiIn : process (clk, areset, iIn_0_dut, iIn_0_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkqIn : process (clk, areset, qIn_0_dut, qIn_0_stm)
begin
END PROCESS;


-- General Purpose data in real output
checksIn : process (clk, areset, sIn_0_dut, sIn_0_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcIn : process (clk, areset, cIn_0_dut, cIn_0_stm)
begin
END PROCESS;


-- Channelized data out check
checkiOut : process (clk, areset, iOut_0_dut, iOut_0_stm)
variable mismatch_Out_v : BOOLEAN := FALSE;
variable mismatch_Out_c : BOOLEAN := FALSE;
variable mismatch_iOut_0 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_Out_v := FALSE;
        mismatch_Out_c := FALSE;
        mismatch_iOut_0 := FALSE;
        IF ( (Out_v_dut /= Out_v_stm)) THEN
            mismatch_Out_v := TRUE;
            report "mismatch in Out_v signal" severity Failure;
        END IF;
        IF ((Out_v_dut = "1")) THEN
            IF ( (Out_c_dut /= Out_c_stm)) THEN
                mismatch_Out_c := TRUE;
                report "mismatch in Out_c signal" severity Warning;
            END IF;
            IF ( (iOut_0_dut /= iOut_0_stm)) THEN
                mismatch_iOut_0 := TRUE;
                report "mismatch in iOut_0 signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_Out_v = TRUE or mismatch_Out_c = TRUE or mismatch_iOut_0 = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer port map (
    In_v_stm,
    In_c_stm,
    iIn_0_stm,
    qIn_0_stm,
    sIn_0_stm,
    cIn_0_stm,
    qOut_0_dut,
    Out_v_dut,
    Out_c_dut,
    iOut_0_dut,
        clk,
        areset
);

sim : streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_stm port map (
    In_v_stm,
    In_c_stm,
    iIn_0_stm,
    qIn_0_stm,
    sIn_0_stm,
    cIn_0_stm,
    qOut_0_stm,
    Out_v_stm,
    Out_c_stm,
    iOut_0_stm,
        clk,
        areset
);

end normal;
