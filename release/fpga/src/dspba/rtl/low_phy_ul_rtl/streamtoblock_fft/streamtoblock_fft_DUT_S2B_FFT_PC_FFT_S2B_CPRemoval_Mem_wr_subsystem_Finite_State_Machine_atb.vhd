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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_atb is
end;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_atb is

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine is
    port (
        in_1_go_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_Valid_in_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_Cmp1_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_4_Cmp2_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_ena_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        out_1_S2B_cnt2E_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_S2B_cnt1E_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_S2B_We_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_4_S2B_latch_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_5_S2B_waitdone_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_stm is
    port (
        in_1_go_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_Valid_in_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_Cmp1_tpl_stm : out std_logic_vector(0 downto 0);
        in_4_Cmp2_tpl_stm : out std_logic_vector(0 downto 0);
        in_5_ena_tpl_stm : out std_logic_vector(0 downto 0);
        out_1_S2B_cnt2E_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_S2B_cnt1E_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_S2B_We_tpl_stm : out std_logic_vector(0 downto 0);
        out_4_S2B_latch_tpl_stm : out std_logic_vector(0 downto 0);
        out_5_S2B_waitdone_tpl_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_go_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_Valid_in_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_Cmp1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_4_Cmp2_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_ena_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_S2B_cnt2E_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_S2B_cnt1E_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_S2B_We_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_4_S2B_latch_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_S2B_waitdone_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_1_go_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_Valid_in_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_Cmp1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_4_Cmp2_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_ena_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_S2B_cnt2E_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_S2B_cnt1E_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_S2B_We_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_4_S2B_latch_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_S2B_waitdone_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checksignalIn_0 : process (clk, areset, in_1_go_tpl_dut, in_1_go_tpl_stm, in_2_Valid_in_tpl_dut, in_2_Valid_in_tpl_stm, in_3_Cmp1_tpl_dut, in_3_Cmp1_tpl_stm, in_4_Cmp2_tpl_dut, in_4_Cmp2_tpl_stm, in_5_ena_tpl_dut, in_5_ena_tpl_stm)
begin
END PROCESS;


-- General Purpose data out check
checksignalOut_19 : process (clk, areset)
variable mismatch_out_1_S2B_cnt2E_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_S2B_cnt1E_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_S2B_We_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_S2B_latch_tpl : BOOLEAN := FALSE;
variable mismatch_out_5_S2B_waitdone_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_S2B_cnt2E_tpl := FALSE;
        mismatch_out_2_S2B_cnt1E_tpl := FALSE;
        mismatch_out_3_S2B_We_tpl := FALSE;
        mismatch_out_4_S2B_latch_tpl := FALSE;
        mismatch_out_5_S2B_waitdone_tpl := FALSE;
        IF ( (out_1_S2B_cnt2E_tpl_dut /= out_1_S2B_cnt2E_tpl_stm)) THEN
            mismatch_out_1_S2B_cnt2E_tpl := TRUE;
            report "Mismatch on device output pin out_1_S2B_cnt2E_tpl" severity Warning;
        END IF;
        IF ( (out_2_S2B_cnt1E_tpl_dut /= out_2_S2B_cnt1E_tpl_stm)) THEN
            mismatch_out_2_S2B_cnt1E_tpl := TRUE;
            report "Mismatch on device output pin out_2_S2B_cnt1E_tpl" severity Warning;
        END IF;
        IF ( (out_3_S2B_We_tpl_dut /= out_3_S2B_We_tpl_stm)) THEN
            mismatch_out_3_S2B_We_tpl := TRUE;
            report "Mismatch on device output pin out_3_S2B_We_tpl" severity Warning;
        END IF;
        IF ( (out_4_S2B_latch_tpl_dut /= out_4_S2B_latch_tpl_stm)) THEN
            mismatch_out_4_S2B_latch_tpl := TRUE;
            report "Mismatch on device output pin out_4_S2B_latch_tpl" severity Warning;
        END IF;
        IF ( (out_5_S2B_waitdone_tpl_dut /= out_5_S2B_waitdone_tpl_stm)) THEN
            mismatch_out_5_S2B_waitdone_tpl := TRUE;
            report "Mismatch on device output pin out_5_S2B_waitdone_tpl" severity Warning;
        END IF;
        IF (mismatch_out_1_S2B_cnt2E_tpl = TRUE or mismatch_out_2_S2B_cnt1E_tpl = TRUE or mismatch_out_3_S2B_We_tpl = TRUE or mismatch_out_4_S2B_latch_tpl = TRUE or mismatch_out_5_S2B_waitdone_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


dut : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine port map (
    in_1_go_tpl_stm,
    in_2_Valid_in_tpl_stm,
    in_3_Cmp1_tpl_stm,
    in_4_Cmp2_tpl_stm,
    in_5_ena_tpl_stm,
    out_1_S2B_cnt2E_tpl_dut,
    out_2_S2B_cnt1E_tpl_dut,
    out_3_S2B_We_tpl_dut,
    out_4_S2B_latch_tpl_dut,
    out_5_S2B_waitdone_tpl_dut,
        clk,
        areset
);

sim : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_CPRemoval_Mem_wr_subsystem_Finite_State_Machine_stm port map (
    in_1_go_tpl_stm,
    in_2_Valid_in_tpl_stm,
    in_3_Cmp1_tpl_stm,
    in_4_Cmp2_tpl_stm,
    in_5_ena_tpl_stm,
    out_1_S2B_cnt2E_tpl_stm,
    out_2_S2B_cnt1E_tpl_stm,
    out_3_S2B_We_tpl_stm,
    out_4_S2B_latch_tpl_stm,
    out_5_S2B_waitdone_tpl_stm,
        clk,
        areset
);

end normal;
