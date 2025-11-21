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
use std.TextIO.all;
USE work.ca_interp_DUT_safe_path.all;

entity ca_interp_DUT_Summer_DUC_Summer_stm is
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
end ca_interp_DUT_Summer_DUC_Summer_stm;

architecture normal of ca_interp_DUT_Summer_DUC_Summer_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';

    function str_to_stdvec(inp: string) return std_logic_vector is
        variable temp: std_logic_vector(inp'range) := (others => 'X');
    begin
        for i in inp'range loop
            IF ((inp(i) = '1')) THEN
                temp(i) := '1';
            elsif (inp(i) = '0') then
                temp(i) := '0';
            END IF;
            end loop;
            return temp;
        end function str_to_stdvec;
        

    begin

    clk <= clk_stm_sig;
    clk_process: process 
    begin
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 817 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 817 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
    end process;

    areset <= areset_stm_sig;
    areset_process: process begin
        areset_stm_sig <= '1';
        wait for 1525 ps;
        wait for 1023*2034 ps; -- additional reset delay
        areset_stm_sig <= '0';
        wait;
    end process;

        -- Driving gnd for in_1_0_imag_d1_tpl signals

        in_1_0_imag_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_0_real_d1_tpl signals

        in_1_0_real_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_1_imag_d1_tpl signals

        in_1_1_imag_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_1_real_d1_tpl signals

        in_1_1_real_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_2_imag_d1_tpl signals

        in_1_2_imag_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_2_real_d1_tpl signals

        in_1_2_real_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_3_imag_d1_tpl signals

        in_1_3_imag_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_3_real_d1_tpl signals

        in_1_3_real_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_2_v1_tpl signals

        in_2_v1_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_c1_tpl signals

        in_3_c1_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_0_imag_d2_tpl signals

        in_4_0_imag_d2_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_0_real_d2_tpl signals

        in_4_0_real_d2_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_1_imag_d2_tpl signals

        in_4_1_imag_d2_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_1_real_d2_tpl signals

        in_4_1_real_d2_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_2_imag_d2_tpl signals

        in_4_2_imag_d2_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_2_real_d2_tpl signals

        in_4_2_real_d2_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_3_imag_d2_tpl signals

        in_4_3_imag_d2_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_3_real_d2_tpl signals

        in_4_3_real_d2_tpl_stm <= (others => '0');
        -- Driving gnd for in_5_v2_tpl signals

        in_5_v2_tpl_stm <= (others => '0');
        -- Driving gnd for in_6_c2_tpl signals

        in_6_c2_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField1_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField2_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Carrier_Aggregation_and_Gain_RegField3_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField1_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField2_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField3_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField4_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField6_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField7_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField8_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl signals

        in_AMMregisterWireData_ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_RegField9_x_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_0_imag_alt_data1_tpl signals

        out_1_0_imag_alt_data1_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_0_real_alt_data1_tpl signals

        out_1_0_real_alt_data1_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_1_imag_alt_data1_tpl signals

        out_1_1_imag_alt_data1_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_1_real_alt_data1_tpl signals

        out_1_1_real_alt_data1_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_2_imag_alt_data1_tpl signals

        out_1_2_imag_alt_data1_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_2_real_alt_data1_tpl signals

        out_1_2_real_alt_data1_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_3_imag_alt_data1_tpl signals

        out_1_3_imag_alt_data1_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_3_real_alt_data1_tpl signals

        out_1_3_real_alt_data1_tpl_stm <= (others => '0');
        -- Driving gnd for out_2_alt_v1_tpl signals

        out_2_alt_v1_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_alt_c1_tpl signals

        out_3_alt_c1_tpl_stm <= (others => '0');

    clk_stm_sig_stop <= '1';


    END normal;
