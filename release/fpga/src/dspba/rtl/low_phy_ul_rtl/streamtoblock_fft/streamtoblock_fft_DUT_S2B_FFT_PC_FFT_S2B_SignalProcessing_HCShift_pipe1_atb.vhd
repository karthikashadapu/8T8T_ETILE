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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1_atb is
end;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1_atb is

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1 is
    port (
        in_1_v_in_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_ch_in_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_0_d_in1_tpl : in std_logic_vector(34 downto 0);  -- sfix35_en31
        in_3_1_d_in1_tpl : in std_logic_vector(34 downto 0);  -- sfix35_en31
        out_1_v_out_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_ch_out_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_0_d_out1_tpl : out std_logic_vector(34 downto 0);  -- sfix35_en31
        out_3_1_d_out1_tpl : out std_logic_vector(34 downto 0);  -- sfix35_en31
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1_stm is
    port (
        in_1_v_in_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_ch_in_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_0_d_in1_tpl_stm : out std_logic_vector(34 downto 0);
        in_3_1_d_in1_tpl_stm : out std_logic_vector(34 downto 0);
        out_1_v_out_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_ch_out_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_0_d_out1_tpl_stm : out std_logic_vector(34 downto 0);
        out_3_1_d_out1_tpl_stm : out std_logic_vector(34 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_v_in_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_ch_in_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_0_d_in1_tpl_stm : STD_LOGIC_VECTOR (34 downto 0);
signal in_3_1_d_in1_tpl_stm : STD_LOGIC_VECTOR (34 downto 0);
signal out_1_v_out_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_ch_out_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_0_d_out1_tpl_stm : STD_LOGIC_VECTOR (34 downto 0);
signal out_3_1_d_out1_tpl_stm : STD_LOGIC_VECTOR (34 downto 0);
signal in_1_v_in_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_ch_in_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_0_d_in1_tpl_dut : STD_LOGIC_VECTOR (34 downto 0);
signal in_3_1_d_in1_tpl_dut : STD_LOGIC_VECTOR (34 downto 0);
signal out_1_v_out_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_ch_out_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_0_d_out1_tpl_dut : STD_LOGIC_VECTOR (34 downto 0);
signal out_3_1_d_out1_tpl_dut : STD_LOGIC_VECTOR (34 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_vunroll_x : process (clk, areset, in_3_0_d_in1_tpl_dut, in_3_0_d_in1_tpl_stm, in_3_1_d_in1_tpl_dut, in_3_1_d_in1_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut_vunroll_x : process (clk, areset, out_3_0_d_out1_tpl_dut, out_3_0_d_out1_tpl_stm, out_3_1_d_out1_tpl_dut, out_3_1_d_out1_tpl_stm)
variable mismatch_out_1_v_out_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_ch_out_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_0_d_out1_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_1_d_out1_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_v_out_tpl := FALSE;
        mismatch_out_2_ch_out_tpl := FALSE;
        mismatch_out_3_0_d_out1_tpl := FALSE;
        mismatch_out_3_1_d_out1_tpl := FALSE;
        IF ( (out_1_v_out_tpl_dut /= out_1_v_out_tpl_stm)) THEN
            mismatch_out_1_v_out_tpl := TRUE;
            report "mismatch in out_1_v_out_tpl signal" severity Failure;
        END IF;
        IF ((out_1_v_out_tpl_dut = "1")) THEN
            IF ( (out_2_ch_out_tpl_dut /= out_2_ch_out_tpl_stm)) THEN
                mismatch_out_2_ch_out_tpl := TRUE;
                report "mismatch in out_2_ch_out_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_0_d_out1_tpl_dut /= out_3_0_d_out1_tpl_stm)) THEN
                mismatch_out_3_0_d_out1_tpl := TRUE;
                report "mismatch in out_3_0_d_out1_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_1_d_out1_tpl_dut /= out_3_1_d_out1_tpl_stm)) THEN
                mismatch_out_3_1_d_out1_tpl := TRUE;
                report "mismatch in out_3_1_d_out1_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_v_out_tpl = TRUE or mismatch_out_2_ch_out_tpl = TRUE or mismatch_out_3_0_d_out1_tpl = TRUE or mismatch_out_3_1_d_out1_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1 port map (
    in_1_v_in_tpl_stm,
    in_2_ch_in_tpl_stm,
    in_3_0_d_in1_tpl_stm,
    in_3_1_d_in1_tpl_stm,
    out_1_v_out_tpl_dut,
    out_2_ch_out_tpl_dut,
    out_3_0_d_out1_tpl_dut,
    out_3_1_d_out1_tpl_dut,
        clk,
        areset
);

sim : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_pipe1_stm port map (
    in_1_v_in_tpl_stm,
    in_2_ch_in_tpl_stm,
    in_3_0_d_in1_tpl_stm,
    in_3_1_d_in1_tpl_stm,
    out_1_v_out_tpl_stm,
    out_2_ch_out_tpl_stm,
    out_3_0_d_out1_tpl_stm,
    out_3_1_d_out1_tpl_stm,
        clk,
        areset
);

end normal;
