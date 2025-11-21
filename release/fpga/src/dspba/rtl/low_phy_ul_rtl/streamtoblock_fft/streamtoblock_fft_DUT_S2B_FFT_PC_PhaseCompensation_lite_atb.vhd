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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_atb is
end;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_atb is

component streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite is
    port (
        in_1_v_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_c_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_imag_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en11
        in_3_real_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en11
        in_4_CP_EN1_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_fft_size_tpl : in std_logic_vector(63 downto 0);  -- float64_m52
        in_6_CPLen_tpl : in std_logic_vector(63 downto 0);  -- float64_m52
        in_7_nsc_tpl : in std_logic_vector(63 downto 0);  -- float64_m52
        in_8_eAxC_tpl : in std_logic_vector(1 downto 0);  -- ufix2
        in_9_sym_metadata_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        in_10_timerefin_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl : in std_logic_vector(31 downto 0);  -- ufix32
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl : in std_logic_vector(31 downto 0);  -- ufix32
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        out_1_imag_dout1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en11
        out_1_real_dout1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en11
        out_2_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_cout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_4_fft_size_out_tpl : out std_logic_vector(63 downto 0);  -- float64_m52
        out_5_CPLenout_tpl : out std_logic_vector(63 downto 0);  -- float64_m52
        out_6_nsc_out_tpl : out std_logic_vector(63 downto 0);  -- float64_m52
        out_7_eAxCout_tpl : out std_logic_vector(1 downto 0);  -- ufix2
        out_8_sym_metadataout_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        out_9_timeref_out_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        out_10_eop_eAxC_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_11_eop_sym_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_12_sop_eAxC_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_13_sop_sym_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_stm is
    port (
        in_1_v_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_c_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_imag_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_real_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_CP_EN1_tpl_stm : out std_logic_vector(0 downto 0);
        in_5_fft_size_tpl_stm : out std_logic_vector(63 downto 0);
        in_6_CPLen_tpl_stm : out std_logic_vector(63 downto 0);
        in_7_nsc_tpl_stm : out std_logic_vector(63 downto 0);
        in_8_eAxC_tpl_stm : out std_logic_vector(1 downto 0);
        in_9_sym_metadata_tpl_stm : out std_logic_vector(63 downto 0);
        in_10_timerefin_tpl_stm : out std_logic_vector(63 downto 0);
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm : out std_logic_vector(31 downto 0);
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm : out std_logic_vector(0 downto 0);
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm : out std_logic_vector(31 downto 0);
        in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm : out std_logic_vector(0 downto 0);
        out_1_imag_dout1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_real_dout1_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_cout_tpl_stm : out std_logic_vector(7 downto 0);
        out_4_fft_size_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_5_CPLenout_tpl_stm : out std_logic_vector(63 downto 0);
        out_6_nsc_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_7_eAxCout_tpl_stm : out std_logic_vector(1 downto 0);
        out_8_sym_metadataout_tpl_stm : out std_logic_vector(63 downto 0);
        out_9_timeref_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_10_eop_eAxC_tpl_stm : out std_logic_vector(0 downto 0);
        out_11_eop_sym_tpl_stm : out std_logic_vector(0 downto 0);
        out_12_sop_eAxC_tpl_stm : out std_logic_vector(0 downto 0);
        out_13_sop_sym_tpl_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_imag_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_real_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_CP_EN1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_fft_size_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_6_CPLen_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_7_nsc_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_8_eAxC_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_9_sym_metadata_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_10_timerefin_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_imag_dout1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_dout1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_fft_size_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_5_CPLenout_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_6_nsc_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_7_eAxCout_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_8_sym_metadataout_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_9_timeref_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_10_eop_eAxC_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_11_eop_sym_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_12_sop_eAxC_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_13_sop_sym_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_1_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_c_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_imag_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_real_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_CP_EN1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_fft_size_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_6_CPLen_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_7_nsc_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_8_eAxC_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal in_9_sym_metadata_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_10_timerefin_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_imag_dout1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_dout1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_fft_size_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_5_CPLenout_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_6_nsc_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_7_eAxCout_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_8_sym_metadataout_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_9_timeref_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_10_eop_eAxC_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_11_eop_sym_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_12_sop_eAxC_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_13_sop_sym_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_1_v_tpl : process (clk, areset, in_1_v_tpl_dut, in_1_v_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_c_tpl : process (clk, areset, in_2_c_tpl_dut, in_2_c_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_imag_d1_tpl : process (clk, areset, in_3_imag_d1_tpl_dut, in_3_imag_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_real_d1_tpl : process (clk, areset, in_3_real_d1_tpl_dut, in_3_real_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_CP_EN1_tpl : process (clk, areset, in_4_CP_EN1_tpl_dut, in_4_CP_EN1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_fft_size_tpl : process (clk, areset, in_5_fft_size_tpl_dut, in_5_fft_size_tpl_stm)
variable in_5_fft_size_tpl_real : REAL := 0.0;
variable in_5_fft_size_tpl_stm_real : REAL := 0.0;
begin
 in_5_fft_size_tpl_real := vIEEE_2_real(in_5_fft_size_tpl_dut, 11, 52, false);
 in_5_fft_size_tpl_stm_real := vIEEE_2_real(in_5_fft_size_tpl_stm, 11, 52, false);
END PROCESS;


-- General Purpose data in real output
checkin_6_CPLen_tpl : process (clk, areset, in_6_CPLen_tpl_dut, in_6_CPLen_tpl_stm)
variable in_6_CPLen_tpl_real : REAL := 0.0;
variable in_6_CPLen_tpl_stm_real : REAL := 0.0;
begin
 in_6_CPLen_tpl_real := vIEEE_2_real(in_6_CPLen_tpl_dut, 11, 52, false);
 in_6_CPLen_tpl_stm_real := vIEEE_2_real(in_6_CPLen_tpl_stm, 11, 52, false);
END PROCESS;


-- General Purpose data in real output
checkin_7_nsc_tpl : process (clk, areset, in_7_nsc_tpl_dut, in_7_nsc_tpl_stm)
variable in_7_nsc_tpl_real : REAL := 0.0;
variable in_7_nsc_tpl_stm_real : REAL := 0.0;
begin
 in_7_nsc_tpl_real := vIEEE_2_real(in_7_nsc_tpl_dut, 11, 52, false);
 in_7_nsc_tpl_stm_real := vIEEE_2_real(in_7_nsc_tpl_stm, 11, 52, false);
END PROCESS;


-- General Purpose data in real output
checkin_8_eAxC_tpl : process (clk, areset, in_8_eAxC_tpl_dut, in_8_eAxC_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_9_sym_metadata_tpl : process (clk, areset, in_9_sym_metadata_tpl_dut, in_9_sym_metadata_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_10_timerefin_tpl : process (clk, areset, in_10_timerefin_tpl_dut, in_10_timerefin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl : process (clk, areset, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_dut, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl : process (clk, areset, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_dut, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl : process (clk, areset, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_dut, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl : process (clk, areset, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_dut, in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm)
begin
END PROCESS;


dut : streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite port map (
    in_1_v_tpl_stm,
    in_2_c_tpl_stm,
    in_3_imag_d1_tpl_stm,
    in_3_real_d1_tpl_stm,
    in_4_CP_EN1_tpl_stm,
    in_5_fft_size_tpl_stm,
    in_6_CPLen_tpl_stm,
    in_7_nsc_tpl_stm,
    in_8_eAxC_tpl_stm,
    in_9_sym_metadata_tpl_stm,
    in_10_timerefin_tpl_stm,
    in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm,
    in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm,
    in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm,
    in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm,
    out_1_imag_dout1_tpl_dut,
    out_1_real_dout1_tpl_dut,
    out_2_vout_tpl_dut,
    out_3_cout_tpl_dut,
    out_4_fft_size_out_tpl_dut,
    out_5_CPLenout_tpl_dut,
    out_6_nsc_out_tpl_dut,
    out_7_eAxCout_tpl_dut,
    out_8_sym_metadataout_tpl_dut,
    out_9_timeref_out_tpl_dut,
    out_10_eop_eAxC_tpl_dut,
    out_11_eop_sym_tpl_dut,
    out_12_sop_eAxC_tpl_dut,
    out_13_sop_sym_tpl_dut,
        clk,
        areset
);

sim : streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_stm port map (
    in_1_v_tpl_stm,
    in_2_c_tpl_stm,
    in_3_imag_d1_tpl_stm,
    in_3_real_d1_tpl_stm,
    in_4_CP_EN1_tpl_stm,
    in_5_fft_size_tpl_stm,
    in_6_CPLen_tpl_stm,
    in_7_nsc_tpl_stm,
    in_8_eAxC_tpl_stm,
    in_9_sym_metadata_tpl_stm,
    in_10_timerefin_tpl_stm,
    in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm,
    in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm,
    in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm,
    in_AMMregisterWireData_streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm,
    out_1_imag_dout1_tpl_stm,
    out_1_real_dout1_tpl_stm,
    out_2_vout_tpl_stm,
    out_3_cout_tpl_stm,
    out_4_fft_size_out_tpl_stm,
    out_5_CPLenout_tpl_stm,
    out_6_nsc_out_tpl_stm,
    out_7_eAxCout_tpl_stm,
    out_8_sym_metadataout_tpl_stm,
    out_9_timeref_out_tpl_stm,
    out_10_eop_eAxC_tpl_stm,
    out_11_eop_sym_tpl_stm,
    out_12_sop_eAxC_tpl_stm,
    out_13_sop_sym_tpl_stm,
        clk,
        areset
);

end normal;
