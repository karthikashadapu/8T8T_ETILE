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

-- VHDL created from ddc_model_DUT_DUT_DDC_l1_x_HB1
-- VHDL created on Thu Jan  9 15:36:33 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ddc_model_DUT_DUT_DDC_l1_x_HB1_atb is
end;

architecture normal of ddc_model_DUT_DUT_DDC_l1_x_HB1_atb is

component ddc_model_DUT_DUT_DDC_l1_x_HB1 is
    port (
        out_1_imag_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_real_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_2_qv_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_qc_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        in_1_0_imag_d_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_0_real_d_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_1_imag_d_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_1_real_d_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_2_v_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_c_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ddc_model_DUT_DUT_DDC_l1_x_HB1_stm is
    port (
        out_1_imag_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_real_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_qv_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_qc_tpl_stm : out std_logic_vector(7 downto 0);
        in_1_0_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_0_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_1_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_1_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_v_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_c_tpl_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal out_1_imag_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_qv_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_qc_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_0_imag_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_0_real_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_imag_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_real_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_c_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_imag_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_qv_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_qc_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_0_imag_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_0_real_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_imag_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_real_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_c_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_1_0_imag_d_tpl : process (clk, areset, in_1_0_imag_d_tpl_dut, in_1_0_imag_d_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_0_real_d_tpl : process (clk, areset, in_1_0_real_d_tpl_dut, in_1_0_real_d_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_1_imag_d_tpl : process (clk, areset, in_1_1_imag_d_tpl_dut, in_1_1_imag_d_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_1_real_d_tpl : process (clk, areset, in_1_1_real_d_tpl_dut, in_1_1_real_d_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_v_tpl : process (clk, areset, in_2_v_tpl_dut, in_2_v_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_c_tpl : process (clk, areset, in_3_c_tpl_dut, in_3_c_tpl_stm)
begin
END PROCESS;


dut : ddc_model_DUT_DUT_DDC_l1_x_HB1 port map (
    out_1_imag_q_tpl_dut,
    out_1_real_q_tpl_dut,
    out_2_qv_tpl_dut,
    out_3_qc_tpl_dut,
    in_1_0_imag_d_tpl_stm,
    in_1_0_real_d_tpl_stm,
    in_1_1_imag_d_tpl_stm,
    in_1_1_real_d_tpl_stm,
    in_2_v_tpl_stm,
    in_3_c_tpl_stm,
        clk,
        areset
);

sim : ddc_model_DUT_DUT_DDC_l1_x_HB1_stm port map (
    out_1_imag_q_tpl_stm,
    out_1_real_q_tpl_stm,
    out_2_qv_tpl_stm,
    out_3_qc_tpl_stm,
    in_1_0_imag_d_tpl_stm,
    in_1_0_real_d_tpl_stm,
    in_1_1_imag_d_tpl_stm,
    in_1_1_real_d_tpl_stm,
    in_2_v_tpl_stm,
    in_3_c_tpl_stm,
        clk,
        areset
);

end normal;
