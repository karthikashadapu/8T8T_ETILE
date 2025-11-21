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

-- VHDL created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT
-- VHDL created on Fri Dec  6 17:01:04 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_atb is
end;

architecture normal of LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_atb is

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT is
    port (
        in_1_imag_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_1_real_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_2_vin_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_cin_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_4_resetin_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_imag_gainin_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_5_real_gainin_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        out_1_imag_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en8
        out_1_real_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en8
        out_2_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_cout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_stm is
    port (
        in_1_imag_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_real_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_vin_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_cin_tpl_stm : out std_logic_vector(7 downto 0);
        in_4_resetin_tpl_stm : out std_logic_vector(0 downto 0);
        in_5_imag_gainin_tpl_stm : out std_logic_vector(15 downto 0);
        in_5_real_gainin_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_imag_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_real_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_cout_tpl_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_imag_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_real_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_vin_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_cin_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_resetin_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_imag_gainin_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_5_real_gainin_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_imag_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_real_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_vin_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_cin_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_resetin_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_imag_gainin_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_5_real_gainin_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_1_imag_din_tpl : process (clk, areset, in_1_imag_din_tpl_dut, in_1_imag_din_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_real_din_tpl : process (clk, areset, in_1_real_din_tpl_dut, in_1_real_din_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_vin_tpl : process (clk, areset, in_2_vin_tpl_dut, in_2_vin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_cin_tpl : process (clk, areset, in_3_cin_tpl_dut, in_3_cin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_resetin_tpl : process (clk, areset, in_4_resetin_tpl_dut, in_4_resetin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_imag_gainin_tpl : process (clk, areset, in_5_imag_gainin_tpl_dut, in_5_imag_gainin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_real_gainin_tpl : process (clk, areset, in_5_real_gainin_tpl_dut, in_5_real_gainin_tpl_stm)
begin
END PROCESS;


dut : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT port map (
    in_1_imag_din_tpl_stm,
    in_1_real_din_tpl_stm,
    in_2_vin_tpl_stm,
    in_3_cin_tpl_stm,
    in_4_resetin_tpl_stm,
    in_5_imag_gainin_tpl_stm,
    in_5_real_gainin_tpl_stm,
    out_1_imag_dout_tpl_dut,
    out_1_real_dout_tpl_dut,
    out_2_vout_tpl_dut,
    out_3_cout_tpl_dut,
        clk,
        areset
);

sim : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FFT_stm port map (
    in_1_imag_din_tpl_stm,
    in_1_real_din_tpl_stm,
    in_2_vin_tpl_stm,
    in_3_cin_tpl_stm,
    in_4_resetin_tpl_stm,
    in_5_imag_gainin_tpl_stm,
    in_5_real_gainin_tpl_stm,
    out_1_imag_dout_tpl_stm,
    out_1_real_dout_tpl_stm,
    out_2_vout_tpl_stm,
    out_3_cout_tpl_stm,
        clk,
        areset
);

end normal;
