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

-- VHDL created from prach_shortFormat_fftShift_prach_PRACH_CC
-- VHDL created on Wed Nov  6 19:28:33 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.prach_shortFormat_fftShift_prach_safe_path.all;

entity prach_shortFormat_fftShift_prach_PRACH_CC_stm is
    port (
        in_1_imag_din0_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_real_din0_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_vin0_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_chin0_tpl_stm : out std_logic_vector(7 downto 0);
        in_4_SFN_tpl_stm : out std_logic_vector(11 downto 0);
        in_5_SubFN_tpl_stm : out std_logic_vector(7 downto 0);
        in_6_SCSby15_tpl_stm : out std_logic_vector(1 downto 0);
        in_7_BWby10_tpl_stm : out std_logic_vector(7 downto 0);
        in_8_CPLen_cplane_tpl_stm : out std_logic_vector(22 downto 0);
        in_9_timeoffset_cplane_tpl_stm : out std_logic_vector(22 downto 0);
        in_10_numsym_cplane_tpl_stm : out std_logic_vector(3 downto 0);
        in_11_slotID_cplane_tpl_stm : out std_logic_vector(1 downto 0);
        in_12_startsym_cplane_tpl_stm : out std_logic_vector(3 downto 0);
        in_13_timerefin_cplane_tpl_stm : out std_logic_vector(28 downto 0);
        in_14_cur_slot_tpl_stm : out std_logic_vector(1 downto 0);
        in_15_SubFN_cplane_tpl_stm : out std_logic_vector(7 downto 0);
        in_16_cbar_mplane_sel_tpl_stm : out std_logic_vector(0 downto 0);
        in_17_time_offset_bias_tpl_stm : out std_logic_vector(22 downto 0);
        in_18_startsym_bias_tpl_stm : out std_logic_vector(22 downto 0);
        in_19_gain_in_re_tpl_stm : out std_logic_vector(15 downto 0);
        in_20_gain_in_im_tpl_stm : out std_logic_vector(15 downto 0);
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_stm : out std_logic_vector(2 downto 0);
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_stm : out std_logic_vector(0 downto 0);
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_stm : out std_logic_vector(0 downto 0);
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_stm : out std_logic_vector(7 downto 0);
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_stm : out std_logic_vector(11 downto 0);
        out_1_qv_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_qch_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_imag_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_real_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_qv139_tpl_stm : out std_logic_vector(0 downto 0);
        out_5_qFreqBinIdx_tpl_stm : out std_logic_vector(13 downto 0);
        out_6_fftShift_v_tpl_stm : out std_logic_vector(0 downto 0);
        out_7_fftShift_c_tpl_stm : out std_logic_vector(7 downto 0);
        out_8_imag_fftShift_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_8_real_fftShift_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_9_TimeReference_tpl_stm : out std_logic_vector(28 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end prach_shortFormat_fftShift_prach_PRACH_CC_stm;

architecture normal of prach_shortFormat_fftShift_prach_PRACH_CC_stm is

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

        -- Driving gnd for in_1_imag_din0_tpl signals

        in_1_imag_din0_tpl_stm <= (others => '0');
        -- Driving gnd for in_1_real_din0_tpl signals

        in_1_real_din0_tpl_stm <= (others => '0');
        -- Driving gnd for in_2_vin0_tpl signals

        in_2_vin0_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_chin0_tpl signals

        in_3_chin0_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_SFN_tpl signals

        in_4_SFN_tpl_stm <= (others => '0');
        -- Driving gnd for in_5_SubFN_tpl signals

        in_5_SubFN_tpl_stm <= (others => '0');
        -- Driving gnd for in_6_SCSby15_tpl signals

        in_6_SCSby15_tpl_stm <= (others => '0');
        -- Driving gnd for in_7_BWby10_tpl signals

        in_7_BWby10_tpl_stm <= (others => '0');
        -- Driving gnd for in_8_CPLen_cplane_tpl signals

        in_8_CPLen_cplane_tpl_stm <= (others => '0');
        -- Driving gnd for in_9_timeoffset_cplane_tpl signals

        in_9_timeoffset_cplane_tpl_stm <= (others => '0');
        -- Driving gnd for in_10_numsym_cplane_tpl signals

        in_10_numsym_cplane_tpl_stm <= (others => '0');
        -- Driving gnd for in_11_slotID_cplane_tpl signals

        in_11_slotID_cplane_tpl_stm <= (others => '0');
        -- Driving gnd for in_12_startsym_cplane_tpl signals

        in_12_startsym_cplane_tpl_stm <= (others => '0');
        -- Driving gnd for in_13_timerefin_cplane_tpl signals

        in_13_timerefin_cplane_tpl_stm <= (others => '0');
        -- Driving gnd for in_14_cur_slot_tpl signals

        in_14_cur_slot_tpl_stm <= (others => '0');
        -- Driving gnd for in_15_SubFN_cplane_tpl signals

        in_15_SubFN_cplane_tpl_stm <= (others => '0');
        -- Driving gnd for in_16_cbar_mplane_sel_tpl signals

        in_16_cbar_mplane_sel_tpl_stm <= (others => '0');
        -- Driving gnd for in_17_time_offset_bias_tpl signals

        in_17_time_offset_bias_tpl_stm <= (others => '0');
        -- Driving gnd for in_18_startsym_bias_tpl signals

        in_18_startsym_bias_tpl_stm <= (others => '0');
        -- Driving gnd for in_19_gain_in_re_tpl signals

        in_19_gain_in_re_tpl_stm <= (others => '0');
        -- Driving gnd for in_20_gain_in_im_tpl signals

        in_20_gain_in_im_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl signals

        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl signals

        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl signals

        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl signals

        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl signals

        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_stm <= (others => '0');
        -- Driving gnd for in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl signals

        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_qv_tpl signals

        out_1_qv_tpl_stm <= (others => '0');
        -- Driving gnd for out_2_qch_tpl signals

        out_2_qch_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_imag_q_tpl signals

        out_3_imag_q_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_real_q_tpl signals

        out_3_real_q_tpl_stm <= (others => '0');
        -- Driving gnd for out_4_qv139_tpl signals

        out_4_qv139_tpl_stm <= (others => '0');
        -- Driving gnd for out_5_qFreqBinIdx_tpl signals

        out_5_qFreqBinIdx_tpl_stm <= (others => '0');
        -- Driving gnd for out_6_fftShift_v_tpl signals

        out_6_fftShift_v_tpl_stm <= (others => '0');
        -- Driving gnd for out_7_fftShift_c_tpl signals

        out_7_fftShift_c_tpl_stm <= (others => '0');
        -- Driving gnd for out_8_imag_fftShift_d_tpl signals

        out_8_imag_fftShift_d_tpl_stm <= (others => '0');
        -- Driving gnd for out_8_real_fftShift_d_tpl signals

        out_8_real_fftShift_d_tpl_stm <= (others => '0');
        -- Driving gnd for out_9_TimeReference_tpl signals

        out_9_TimeReference_tpl_stm <= (others => '0');

    clk_stm_sig_stop <= '1';


    END normal;
