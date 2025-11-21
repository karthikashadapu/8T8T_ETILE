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

-- VHDL created from ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.ifft_blocktostream_DUT_safe_path.all;

entity ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_stm is
    port (
        in_1_v_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_c_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_imag_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_real_d1_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_CP_EN1_tpl_stm : out std_logic_vector(0 downto 0);
        in_5_fft_size_tpl_stm : out std_logic_vector(3 downto 0);
        in_6_CPLen_tpl_stm : out std_logic_vector(10 downto 0);
        in_7_nsc_tpl_stm : out std_logic_vector(11 downto 0);
        in_8_eAxC_tpl_stm : out std_logic_vector(0 downto 0);
        in_9_sym_metadata_tpl_stm : out std_logic_vector(0 downto 0);
        in_10_timerefin_tpl_stm : out std_logic_vector(63 downto 0);
        in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm : out std_logic_vector(31 downto 0);
        in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm : out std_logic_vector(0 downto 0);
        in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm : out std_logic_vector(31 downto 0);
        in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm : out std_logic_vector(0 downto 0);
        out_1_imag_dout1_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_real_dout1_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_cout_tpl_stm : out std_logic_vector(7 downto 0);
        out_4_fft_size_out_tpl_stm : out std_logic_vector(3 downto 0);
        out_5_CPLenout_tpl_stm : out std_logic_vector(10 downto 0);
        out_6_nsc_out_tpl_stm : out std_logic_vector(11 downto 0);
        out_7_eAxCout_tpl_stm : out std_logic_vector(0 downto 0);
        out_8_sym_metadataout_tpl_stm : out std_logic_vector(0 downto 0);
        out_9_timeref_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_10_eop_eAxC_tpl_stm : out std_logic_vector(0 downto 0);
        out_11_eop_sym_tpl_stm : out std_logic_vector(0 downto 0);
        out_12_sop_eAxC_tpl_stm : out std_logic_vector(0 downto 0);
        out_13_sop_sym_tpl_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_stm;

architecture normal of ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_stm is

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

        -- Driving gnd for in_1_v_tpl signals

        in_1_v_tpl_stm <= (others => '0');
        -- Driving gnd for in_2_c_tpl signals

        in_2_c_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_imag_d1_tpl signals

        in_3_imag_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_real_d1_tpl signals

        in_3_real_d1_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_CP_EN1_tpl signals

        in_4_CP_EN1_tpl_stm <= (others => '0');
        -- Driving gnd for in_5_fft_size_tpl signals

        in_5_fft_size_tpl_stm <= (others => '0');
        -- Driving gnd for in_6_CPLen_tpl signals

        in_6_CPLen_tpl_stm <= (others => '0');
        -- Driving gnd for in_7_nsc_tpl signals

        in_7_nsc_tpl_stm <= (others => '0');
        -- Driving gnd for in_8_eAxC_tpl signals

        in_8_eAxC_tpl_stm <= (others => '0');
        -- Driving gnd for in_9_sym_metadata_tpl signals

        in_9_sym_metadata_tpl_stm <= (others => '0');
        -- Driving gnd for in_10_timerefin_tpl signals

        in_10_timerefin_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl signals

        in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField1_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl signals

        in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField2_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl signals

        in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField3_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl signals

        in_AMMregisterWireData_ifft_blocktostream_DUT_low_phy_dl_PhaseCompensation_lite_PhasorGenerate_RegField4_x_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_imag_dout1_tpl signals

        out_1_imag_dout1_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_real_dout1_tpl signals

        out_1_real_dout1_tpl_stm <= (others => '0');
        -- Driving gnd for out_2_vout_tpl signals

        out_2_vout_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_cout_tpl signals

        out_3_cout_tpl_stm <= (others => '0');
        -- Driving gnd for out_4_fft_size_out_tpl signals

        out_4_fft_size_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_5_CPLenout_tpl signals

        out_5_CPLenout_tpl_stm <= (others => '0');
        -- Driving gnd for out_6_nsc_out_tpl signals

        out_6_nsc_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_7_eAxCout_tpl signals

        out_7_eAxCout_tpl_stm <= (others => '0');
        -- Driving gnd for out_8_sym_metadataout_tpl signals

        out_8_sym_metadataout_tpl_stm <= (others => '0');
        -- Driving gnd for out_9_timeref_out_tpl signals

        out_9_timeref_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_10_eop_eAxC_tpl signals

        out_10_eop_eAxC_tpl_stm <= (others => '0');
        -- Driving gnd for out_11_eop_sym_tpl signals

        out_11_eop_sym_tpl_stm <= (others => '0');
        -- Driving gnd for out_12_sop_eAxC_tpl signals

        out_12_sop_eAxC_tpl_stm <= (others => '0');
        -- Driving gnd for out_13_sop_sym_tpl signals

        out_13_sop_sym_tpl_stm <= (others => '0');

    clk_stm_sig_stop <= '1';


    END normal;
