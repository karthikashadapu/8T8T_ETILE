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

-- VHDL created from dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation
-- VHDL created on Tue Jan  7 17:06:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb is
end;

architecture normal of dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_atb is

component dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation is
    port (
        in_1_0_imag_din_a1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_0_real_din_a1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_1_imag_din_a1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_1_real_din_a1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_2_imag_din_a1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_2_real_din_a1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_3_imag_din_a1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_3_real_din_a1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_2_vin_a1_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_cin_a1_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en13
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en13
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en13
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en13
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        out_1_0_imag_altq_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_0_real_altq_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_1_imag_altq_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_1_real_altq_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_2_imag_altq_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_2_real_altq_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_3_imag_altq_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_1_3_real_altq_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_2_altv_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_altc_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_4_0_imag_altq1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_4_0_real_altq1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_4_1_imag_altq1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_4_1_real_altq1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_4_2_imag_altq1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_4_2_real_altq1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_4_3_imag_altq1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_4_3_real_altq1_tpl : out std_logic_vector(31 downto 0);  -- sfix32_en27
        out_5_altv1_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_6_altc1_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_stm is
    port (
        in_1_0_imag_din_a1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_0_real_din_a1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_1_imag_din_a1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_1_real_din_a1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_2_imag_din_a1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_2_real_din_a1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_3_imag_din_a1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_3_real_din_a1_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_vin_a1_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_cin_a1_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl_stm : out std_logic_vector(7 downto 0);
        out_1_0_imag_altq_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_0_real_altq_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_1_imag_altq_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_1_real_altq_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_2_imag_altq_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_2_real_altq_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_3_imag_altq_tpl_stm : out std_logic_vector(31 downto 0);
        out_1_3_real_altq_tpl_stm : out std_logic_vector(31 downto 0);
        out_2_altv_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_altc_tpl_stm : out std_logic_vector(7 downto 0);
        out_4_0_imag_altq1_tpl_stm : out std_logic_vector(31 downto 0);
        out_4_0_real_altq1_tpl_stm : out std_logic_vector(31 downto 0);
        out_4_1_imag_altq1_tpl_stm : out std_logic_vector(31 downto 0);
        out_4_1_real_altq1_tpl_stm : out std_logic_vector(31 downto 0);
        out_4_2_imag_altq1_tpl_stm : out std_logic_vector(31 downto 0);
        out_4_2_real_altq1_tpl_stm : out std_logic_vector(31 downto 0);
        out_4_3_imag_altq1_tpl_stm : out std_logic_vector(31 downto 0);
        out_4_3_real_altq1_tpl_stm : out std_logic_vector(31 downto 0);
        out_5_altv1_tpl_stm : out std_logic_vector(0 downto 0);
        out_6_altc1_tpl_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_0_imag_din_a1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_0_real_din_a1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_imag_din_a1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_real_din_a1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_2_imag_din_a1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_2_real_din_a1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_3_imag_din_a1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_3_real_din_a1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_vin_a1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_cin_a1_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_0_imag_altq_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_0_real_altq_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_1_imag_altq_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_1_real_altq_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_2_imag_altq_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_2_real_altq_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_3_imag_altq_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_3_real_altq_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_2_altv_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_altc_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_0_imag_altq1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_0_real_altq1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_1_imag_altq1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_1_real_altq1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_2_imag_altq1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_2_real_altq1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_3_imag_altq1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_3_real_altq1_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_5_altv1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_6_altc1_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_0_imag_din_a1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_0_real_din_a1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_imag_din_a1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_real_din_a1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_2_imag_din_a1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_2_real_din_a1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_3_imag_din_a1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_3_real_din_a1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_vin_a1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_cin_a1_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_0_imag_altq_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_0_real_altq_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_1_imag_altq_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_1_real_altq_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_2_imag_altq_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_2_real_altq_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_3_imag_altq_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_1_3_real_altq_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_2_altv_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_altc_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_0_imag_altq1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_0_real_altq1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_1_imag_altq1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_1_real_altq1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_2_imag_altq1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_2_real_altq1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_3_imag_altq1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_4_3_real_altq1_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_5_altv1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_6_altc1_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_1_0_imag_din_a1_tpl : process (clk, areset, in_1_0_imag_din_a1_tpl_dut, in_1_0_imag_din_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_0_real_din_a1_tpl : process (clk, areset, in_1_0_real_din_a1_tpl_dut, in_1_0_real_din_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_1_imag_din_a1_tpl : process (clk, areset, in_1_1_imag_din_a1_tpl_dut, in_1_1_imag_din_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_1_real_din_a1_tpl : process (clk, areset, in_1_1_real_din_a1_tpl_dut, in_1_1_real_din_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_2_imag_din_a1_tpl : process (clk, areset, in_1_2_imag_din_a1_tpl_dut, in_1_2_imag_din_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_2_real_din_a1_tpl : process (clk, areset, in_1_2_real_din_a1_tpl_dut, in_1_2_real_din_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_3_imag_din_a1_tpl : process (clk, areset, in_1_3_imag_din_a1_tpl_dut, in_1_3_imag_din_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_3_real_din_a1_tpl : process (clk, areset, in_1_3_real_din_a1_tpl_dut, in_1_3_real_din_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_vin_a1_tpl : process (clk, areset, in_2_vin_a1_tpl_dut, in_2_vin_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_cin_a1_tpl : process (clk, areset, in_3_cin_a1_tpl_dut, in_3_cin_a1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl : process (clk, areset, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl_dut, in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl_stm)
begin
END PROCESS;


dut : dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation port map (
    in_1_0_imag_din_a1_tpl_stm,
    in_1_0_real_din_a1_tpl_stm,
    in_1_1_imag_din_a1_tpl_stm,
    in_1_1_real_din_a1_tpl_stm,
    in_1_2_imag_din_a1_tpl_stm,
    in_1_2_real_din_a1_tpl_stm,
    in_1_3_imag_din_a1_tpl_stm,
    in_1_3_real_din_a1_tpl_stm,
    in_2_vin_a1_tpl_stm,
    in_3_cin_a1_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl_stm,
    out_1_0_imag_altq_tpl_dut,
    out_1_0_real_altq_tpl_dut,
    out_1_1_imag_altq_tpl_dut,
    out_1_1_real_altq_tpl_dut,
    out_1_2_imag_altq_tpl_dut,
    out_1_2_real_altq_tpl_dut,
    out_1_3_imag_altq_tpl_dut,
    out_1_3_real_altq_tpl_dut,
    out_2_altv_tpl_dut,
    out_3_altc_tpl_dut,
    out_4_0_imag_altq1_tpl_dut,
    out_4_0_real_altq1_tpl_dut,
    out_4_1_imag_altq1_tpl_dut,
    out_4_1_real_altq1_tpl_dut,
    out_4_2_imag_altq1_tpl_dut,
    out_4_2_real_altq1_tpl_dut,
    out_4_3_imag_altq1_tpl_dut,
    out_4_3_real_altq1_tpl_dut,
    out_5_altv1_tpl_dut,
    out_6_altc1_tpl_dut,
        clk,
        areset
);

sim : dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_stm port map (
    in_1_0_imag_din_a1_tpl_stm,
    in_1_0_real_din_a1_tpl_stm,
    in_1_1_imag_din_a1_tpl_stm,
    in_1_1_real_din_a1_tpl_stm,
    in_1_2_imag_din_a1_tpl_stm,
    in_1_2_real_din_a1_tpl_stm,
    in_1_3_imag_din_a1_tpl_stm,
    in_1_3_real_din_a1_tpl_stm,
    in_2_vin_a1_tpl_stm,
    in_3_cin_a1_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField1_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField2_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_RegField3_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField1_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField2_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField3_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField4_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField6_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField7_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField8_x_tpl_stm,
    in_AMMregisterWireData_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_RegField9_x_tpl_stm,
    out_1_0_imag_altq_tpl_stm,
    out_1_0_real_altq_tpl_stm,
    out_1_1_imag_altq_tpl_stm,
    out_1_1_real_altq_tpl_stm,
    out_1_2_imag_altq_tpl_stm,
    out_1_2_real_altq_tpl_stm,
    out_1_3_imag_altq_tpl_stm,
    out_1_3_real_altq_tpl_stm,
    out_2_altv_tpl_stm,
    out_3_altc_tpl_stm,
    out_4_0_imag_altq1_tpl_stm,
    out_4_0_real_altq1_tpl_stm,
    out_4_1_imag_altq1_tpl_stm,
    out_4_1_real_altq1_tpl_stm,
    out_4_2_imag_altq1_tpl_stm,
    out_4_2_real_altq1_tpl_stm,
    out_4_3_imag_altq1_tpl_stm,
    out_4_3_real_altq1_tpl_stm,
    out_5_altv1_tpl_stm,
    out_6_altc1_tpl_stm,
        clk,
        areset
);

end normal;
