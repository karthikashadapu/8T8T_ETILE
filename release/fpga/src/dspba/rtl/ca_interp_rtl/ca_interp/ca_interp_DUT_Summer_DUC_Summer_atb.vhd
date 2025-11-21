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

-- VHDL created from ca_interp_DUT_Summer_DUC_Summer
-- VHDL created on Tue Jan  7 17:04:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ca_interp_DUT_Summer_DUC_Summer_atb is
end;

architecture normal of ca_interp_DUT_Summer_DUC_Summer_atb is

component ca_interp_DUT_Summer_DUC_Summer is
    port (
        in_1_0_imag_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_0_real_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_1_imag_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_1_real_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_2_imag_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_2_real_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_3_imag_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_3_real_d1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_2_v1_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_c1_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_4_0_imag_d2_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_0_real_d2_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_1_imag_d2_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_1_real_d2_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_2_imag_d2_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_2_real_d2_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_3_imag_d2_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_3_real_d2_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_5_v2_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_6_c2_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en13
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en13
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en13
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en13
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        out_1_0_imag_alt_data1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_0_real_alt_data1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_1_imag_alt_data1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_1_real_alt_data1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_2_imag_alt_data1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_2_real_alt_data1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_3_imag_alt_data1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_3_real_alt_data1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_2_alt_v1_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_alt_c1_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ca_interp_DUT_Summer_DUC_Summer_stm is
    port (
        in_1_0_imag_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_0_real_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_1_imag_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_1_real_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_2_imag_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_2_real_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_3_imag_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_3_real_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_v1_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_c1_tpl_stm : out std_logic_vector(7 downto 0);
        in_4_0_imag_d2_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_0_real_d2_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_1_imag_d2_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_1_real_d2_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_2_imag_d2_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_2_real_d2_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_3_imag_d2_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_3_real_d2_tpl_stm : out std_logic_vector(15 downto 0);
        in_5_v2_tpl_stm : out std_logic_vector(0 downto 0);
        in_6_c2_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_stm : out std_logic_vector(7 downto 0);
        out_1_0_imag_alt_data1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_0_real_alt_data1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_1_imag_alt_data1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_1_real_alt_data1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_2_imag_alt_data1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_2_real_alt_data1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_3_imag_alt_data1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_3_real_alt_data1_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_alt_v1_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_alt_c1_tpl_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_0_imag_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_0_real_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_imag_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_real_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_2_imag_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_2_real_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_3_imag_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_3_real_d1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_v1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_c1_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_0_imag_d2_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_0_real_d2_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_1_imag_d2_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_1_real_d2_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_2_imag_d2_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_2_real_d2_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_3_imag_d2_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_3_real_d2_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_5_v2_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_6_c2_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_0_imag_alt_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_0_real_alt_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_1_imag_alt_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_1_real_alt_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_2_imag_alt_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_2_real_alt_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_3_imag_alt_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_3_real_alt_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_alt_v1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_alt_c1_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_0_imag_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_0_real_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_imag_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_1_real_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_2_imag_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_2_real_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_3_imag_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_3_real_d1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_v1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_c1_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_0_imag_d2_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_0_real_d2_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_1_imag_d2_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_1_real_d2_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_2_imag_d2_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_2_real_d2_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_3_imag_d2_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_3_real_d2_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_5_v2_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_6_c2_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_0_imag_alt_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_0_real_alt_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_1_imag_alt_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_1_real_alt_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_2_imag_alt_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_2_real_alt_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_3_imag_alt_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_3_real_alt_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_alt_v1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_alt_c1_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_1_0_imag_d1_tpl : process (clk, areset, in_1_0_imag_d1_tpl_dut, in_1_0_imag_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_0_real_d1_tpl : process (clk, areset, in_1_0_real_d1_tpl_dut, in_1_0_real_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_1_imag_d1_tpl : process (clk, areset, in_1_1_imag_d1_tpl_dut, in_1_1_imag_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_1_real_d1_tpl : process (clk, areset, in_1_1_real_d1_tpl_dut, in_1_1_real_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_2_imag_d1_tpl : process (clk, areset, in_1_2_imag_d1_tpl_dut, in_1_2_imag_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_2_real_d1_tpl : process (clk, areset, in_1_2_real_d1_tpl_dut, in_1_2_real_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_3_imag_d1_tpl : process (clk, areset, in_1_3_imag_d1_tpl_dut, in_1_3_imag_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_3_real_d1_tpl : process (clk, areset, in_1_3_real_d1_tpl_dut, in_1_3_real_d1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_v1_tpl : process (clk, areset, in_2_v1_tpl_dut, in_2_v1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_c1_tpl : process (clk, areset, in_3_c1_tpl_dut, in_3_c1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_0_imag_d2_tpl : process (clk, areset, in_4_0_imag_d2_tpl_dut, in_4_0_imag_d2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_0_real_d2_tpl : process (clk, areset, in_4_0_real_d2_tpl_dut, in_4_0_real_d2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_1_imag_d2_tpl : process (clk, areset, in_4_1_imag_d2_tpl_dut, in_4_1_imag_d2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_1_real_d2_tpl : process (clk, areset, in_4_1_real_d2_tpl_dut, in_4_1_real_d2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_2_imag_d2_tpl : process (clk, areset, in_4_2_imag_d2_tpl_dut, in_4_2_imag_d2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_2_real_d2_tpl : process (clk, areset, in_4_2_real_d2_tpl_dut, in_4_2_real_d2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_3_imag_d2_tpl : process (clk, areset, in_4_3_imag_d2_tpl_dut, in_4_3_imag_d2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_3_real_d2_tpl : process (clk, areset, in_4_3_real_d2_tpl_dut, in_4_3_real_d2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_v2_tpl : process (clk, areset, in_5_v2_tpl_dut, in_5_v2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_6_c2_tpl : process (clk, areset, in_6_c2_tpl_dut, in_6_c2_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl : process (clk, areset, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_dut, in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_stm)
begin
END PROCESS;


dut : ca_interp_DUT_Summer_DUC_Summer port map (
    in_1_0_imag_d1_tpl_stm,
    in_1_0_real_d1_tpl_stm,
    in_1_1_imag_d1_tpl_stm,
    in_1_1_real_d1_tpl_stm,
    in_1_2_imag_d1_tpl_stm,
    in_1_2_real_d1_tpl_stm,
    in_1_3_imag_d1_tpl_stm,
    in_1_3_real_d1_tpl_stm,
    in_2_v1_tpl_stm,
    in_3_c1_tpl_stm,
    in_4_0_imag_d2_tpl_stm,
    in_4_0_real_d2_tpl_stm,
    in_4_1_imag_d2_tpl_stm,
    in_4_1_real_d2_tpl_stm,
    in_4_2_imag_d2_tpl_stm,
    in_4_2_real_d2_tpl_stm,
    in_4_3_imag_d2_tpl_stm,
    in_4_3_real_d2_tpl_stm,
    in_5_v2_tpl_stm,
    in_6_c2_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_stm,
    out_1_0_imag_alt_data1_tpl_dut,
    out_1_0_real_alt_data1_tpl_dut,
    out_1_1_imag_alt_data1_tpl_dut,
    out_1_1_real_alt_data1_tpl_dut,
    out_1_2_imag_alt_data1_tpl_dut,
    out_1_2_real_alt_data1_tpl_dut,
    out_1_3_imag_alt_data1_tpl_dut,
    out_1_3_real_alt_data1_tpl_dut,
    out_2_alt_v1_tpl_dut,
    out_3_alt_c1_tpl_dut,
        clk,
        areset
);

sim : ca_interp_DUT_Summer_DUC_Summer_stm port map (
    in_1_0_imag_d1_tpl_stm,
    in_1_0_real_d1_tpl_stm,
    in_1_1_imag_d1_tpl_stm,
    in_1_1_real_d1_tpl_stm,
    in_1_2_imag_d1_tpl_stm,
    in_1_2_real_d1_tpl_stm,
    in_1_3_imag_d1_tpl_stm,
    in_1_3_real_d1_tpl_stm,
    in_2_v1_tpl_stm,
    in_3_c1_tpl_stm,
    in_4_0_imag_d2_tpl_stm,
    in_4_0_real_d2_tpl_stm,
    in_4_1_imag_d2_tpl_stm,
    in_4_1_real_d2_tpl_stm,
    in_4_2_imag_d2_tpl_stm,
    in_4_2_real_d2_tpl_stm,
    in_4_3_imag_d2_tpl_stm,
    in_4_3_real_d2_tpl_stm,
    in_5_v2_tpl_stm,
    in_6_c2_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_stm,
    in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_stm,
    out_1_0_imag_alt_data1_tpl_stm,
    out_1_0_real_alt_data1_tpl_stm,
    out_1_1_imag_alt_data1_tpl_stm,
    out_1_1_real_alt_data1_tpl_stm,
    out_1_2_imag_alt_data1_tpl_stm,
    out_1_2_real_alt_data1_tpl_stm,
    out_1_3_imag_alt_data1_tpl_stm,
    out_1_3_real_alt_data1_tpl_stm,
    out_2_alt_v1_tpl_stm,
    out_3_alt_c1_tpl_stm,
        clk,
        areset
);

end normal;
