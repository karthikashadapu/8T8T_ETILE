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

-- VHDL created from duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter
-- VHDL created on Thu Jan  9 15:34:39 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.duc_model_DUT_safe_path.all;

entity duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        in_1_imag_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_real_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_vin_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_chin_tpl_stm : out std_logic_vector(7 downto 0);
        in_4_CoefBank_tpl_stm : out std_logic_vector(0 downto 0);
        out_1_imag_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_real_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_qv_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_qc_tpl_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_stm;

architecture normal of duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';

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

    bus_clk <= bus_clk_stm_sig;
    bus_clk_process: process 
    begin
        wait for 200 ps;
        bus_clk_stm_sig <= not bus_clk_stm_sig;
        wait for 4800 ps;
        if (bus_clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk bus_clk" severity NOTE;
            wait;
        end if;
        wait for 200 ps;
        bus_clk_stm_sig <= not bus_clk_stm_sig;
        wait for 4800 ps;
        if (bus_clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk bus_clk" severity NOTE;
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

    bus_areset <= bus_areset_stm_sig;
    bus_areset_process: process begin
        bus_areset_stm_sig <= '1';
        wait for 7500 ps;
        wait for 1023*2034 ps; -- additional reset delay
        bus_areset_stm_sig <= '0';
        wait;
    end process;

        -- Driving gnd for busIn signals

        busIn_writedata_stm <= (others => '0');
        busIn_address_stm <= (others => '0');
        busIn_write_stm <= (others => '0');
        busIn_read_stm <= (others => '0');

        -- Generating stub busOut - no stimulus
        -- initialize all outputs to 0
        busOut_readdatavalid_stm <= (others => '0');
        busOut_readdata_stm <= (others => '0');
        -- Driving gnd for in_1_imag_din_tpl signals

        in_1_imag_din_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_real_din_tpl signals

        in_1_real_din_tpl_stm <= (others => '0');
        -- Driving gnd for in_2_vin_tpl signals

        in_2_vin_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_chin_tpl signals

        in_3_chin_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_CoefBank_tpl signals

        in_4_CoefBank_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_imag_q_tpl signals

        out_1_imag_q_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_real_q_tpl signals

        out_1_real_q_tpl_stm <= (others => '0');
        -- Driving gnd for out_2_qv_tpl signals

        out_2_qv_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_qc_tpl signals

        out_3_qc_tpl_stm <= (others => '0');

    clk_stm_sig_stop <= '1';
    bus_clk_stm_sig_stop <= '1';


    END normal;
