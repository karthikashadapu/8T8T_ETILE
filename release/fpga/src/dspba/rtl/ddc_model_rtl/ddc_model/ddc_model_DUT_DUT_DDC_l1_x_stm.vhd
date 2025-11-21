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

-- VHDL created from ddc_model_DUT_DUT_DDC_l1_x
-- VHDL created on Thu Jan  9 15:36:33 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.ddc_model_DUT_safe_path.all;

entity ddc_model_DUT_DUT_DDC_l1_x_stm is
    port (
        out_1_imag_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_real_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_qv_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_qc_tpl_stm : out std_logic_vector(7 downto 0);
        in_1_0_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_0_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_1_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_1_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_2_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_2_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_3_imag_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_3_real_d_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_v_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_c_tpl_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end ddc_model_DUT_DUT_DDC_l1_x_stm;

architecture normal of ddc_model_DUT_DUT_DDC_l1_x_stm is

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

        -- Driving gnd for out_1_imag_q_tpl signals

        out_1_imag_q_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_real_q_tpl signals

        out_1_real_q_tpl_stm <= (others => '0');
        -- Driving gnd for out_2_qv_tpl signals

        out_2_qv_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_qc_tpl signals

        out_3_qc_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_0_imag_d_tpl signals

        in_1_0_imag_d_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_0_real_d_tpl signals

        in_1_0_real_d_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_1_imag_d_tpl signals

        in_1_1_imag_d_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_1_real_d_tpl signals

        in_1_1_real_d_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_2_imag_d_tpl signals

        in_1_2_imag_d_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_2_real_d_tpl signals

        in_1_2_real_d_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_3_imag_d_tpl signals

        in_1_3_imag_d_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_3_real_d_tpl signals

        in_1_3_real_d_tpl_stm <= (others => '0');
        -- Driving gnd for in_2_v_tpl signals

        in_2_v_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_c_tpl signals

        in_3_c_tpl_stm <= (others => '0');

    clk_stm_sig_stop <= '1';


    END normal;
