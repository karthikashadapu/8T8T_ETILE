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
use work.dspba_sim_library_package.all;
entity prach_shortFormat_fftShift_prach_PRACH_CC_atb is
end;

architecture normal of prach_shortFormat_fftShift_prach_PRACH_CC_atb is

component prach_shortFormat_fftShift_prach_PRACH_CC is
    port (
        in_1_imag_din0_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_1_real_din0_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_2_vin0_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_chin0_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_4_SFN_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        in_5_SubFN_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_6_SCSby15_tpl : in std_logic_vector(1 downto 0);  -- ufix2
        in_7_BWby10_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_8_CPLen_cplane_tpl : in std_logic_vector(22 downto 0);  -- ufix23
        in_9_timeoffset_cplane_tpl : in std_logic_vector(22 downto 0);  -- ufix23
        in_10_numsym_cplane_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_11_slotID_cplane_tpl : in std_logic_vector(1 downto 0);  -- ufix2
        in_12_startsym_cplane_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_13_timerefin_cplane_tpl : in std_logic_vector(28 downto 0);  -- ufix29
        in_14_cur_slot_tpl : in std_logic_vector(1 downto 0);  -- ufix2
        in_15_SubFN_cplane_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_16_cbar_mplane_sel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_17_time_offset_bias_tpl : in std_logic_vector(22 downto 0);  -- ufix23
        in_18_startsym_bias_tpl : in std_logic_vector(22 downto 0);  -- ufix23
        in_19_gain_in_re_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_20_gain_in_im_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl : in std_logic_vector(2 downto 0);  -- ufix3
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        out_1_qv_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qch_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_imag_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en15
        out_3_real_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en15
        out_4_qv139_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_5_qFreqBinIdx_tpl : out std_logic_vector(13 downto 0);  -- sfix14
        out_6_fftShift_v_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_7_fftShift_c_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_8_imag_fftShift_d_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en15
        out_8_real_fftShift_d_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en15
        out_9_TimeReference_tpl : out std_logic_vector(28 downto 0);  -- ufix29
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component prach_shortFormat_fftShift_prach_PRACH_CC_stm is
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
end component;

signal in_1_imag_din0_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_real_din0_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_vin0_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_chin0_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_SFN_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_5_SubFN_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_6_SCSby15_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_7_BWby10_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_8_CPLen_cplane_tpl_stm : STD_LOGIC_VECTOR (22 downto 0);
signal in_9_timeoffset_cplane_tpl_stm : STD_LOGIC_VECTOR (22 downto 0);
signal in_10_numsym_cplane_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_11_slotID_cplane_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_12_startsym_cplane_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_13_timerefin_cplane_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal in_14_cur_slot_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_15_SubFN_cplane_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_16_cbar_mplane_sel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_17_time_offset_bias_tpl_stm : STD_LOGIC_VECTOR (22 downto 0);
signal in_18_startsym_bias_tpl_stm : STD_LOGIC_VECTOR (22 downto 0);
signal in_19_gain_in_re_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_20_gain_in_im_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_stm : STD_LOGIC_VECTOR (2 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_1_qv_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qch_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_imag_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_real_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_qv139_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_qFreqBinIdx_tpl_stm : STD_LOGIC_VECTOR (13 downto 0);
signal out_6_fftShift_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_7_fftShift_c_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_8_imag_fftShift_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_8_real_fftShift_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_9_TimeReference_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal in_1_imag_din0_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_real_din0_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_vin0_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_chin0_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_SFN_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_5_SubFN_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_6_SCSby15_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal in_7_BWby10_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_8_CPLen_cplane_tpl_dut : STD_LOGIC_VECTOR (22 downto 0);
signal in_9_timeoffset_cplane_tpl_dut : STD_LOGIC_VECTOR (22 downto 0);
signal in_10_numsym_cplane_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_11_slotID_cplane_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal in_12_startsym_cplane_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_13_timerefin_cplane_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal in_14_cur_slot_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal in_15_SubFN_cplane_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_16_cbar_mplane_sel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_17_time_offset_bias_tpl_dut : STD_LOGIC_VECTOR (22 downto 0);
signal in_18_startsym_bias_tpl_dut : STD_LOGIC_VECTOR (22 downto 0);
signal in_19_gain_in_re_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_20_gain_in_im_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_dut : STD_LOGIC_VECTOR (2 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_1_qv_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qch_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_imag_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_real_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_qv139_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_qFreqBinIdx_tpl_dut : STD_LOGIC_VECTOR (13 downto 0);
signal out_6_fftShift_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_7_fftShift_c_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_8_imag_fftShift_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_8_real_fftShift_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_9_TimeReference_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_1_imag_din0_tpl : process (clk, areset, in_1_imag_din0_tpl_dut, in_1_imag_din0_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_real_din0_tpl : process (clk, areset, in_1_real_din0_tpl_dut, in_1_real_din0_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_vin0_tpl : process (clk, areset, in_2_vin0_tpl_dut, in_2_vin0_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_chin0_tpl : process (clk, areset, in_3_chin0_tpl_dut, in_3_chin0_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_SFN_tpl : process (clk, areset, in_4_SFN_tpl_dut, in_4_SFN_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_SubFN_tpl : process (clk, areset, in_5_SubFN_tpl_dut, in_5_SubFN_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_6_SCSby15_tpl : process (clk, areset, in_6_SCSby15_tpl_dut, in_6_SCSby15_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_7_BWby10_tpl : process (clk, areset, in_7_BWby10_tpl_dut, in_7_BWby10_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_8_CPLen_cplane_tpl : process (clk, areset, in_8_CPLen_cplane_tpl_dut, in_8_CPLen_cplane_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_9_timeoffset_cplane_tpl : process (clk, areset, in_9_timeoffset_cplane_tpl_dut, in_9_timeoffset_cplane_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_10_numsym_cplane_tpl : process (clk, areset, in_10_numsym_cplane_tpl_dut, in_10_numsym_cplane_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_11_slotID_cplane_tpl : process (clk, areset, in_11_slotID_cplane_tpl_dut, in_11_slotID_cplane_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_12_startsym_cplane_tpl : process (clk, areset, in_12_startsym_cplane_tpl_dut, in_12_startsym_cplane_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_13_timerefin_cplane_tpl : process (clk, areset, in_13_timerefin_cplane_tpl_dut, in_13_timerefin_cplane_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_14_cur_slot_tpl : process (clk, areset, in_14_cur_slot_tpl_dut, in_14_cur_slot_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_15_SubFN_cplane_tpl : process (clk, areset, in_15_SubFN_cplane_tpl_dut, in_15_SubFN_cplane_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_16_cbar_mplane_sel_tpl : process (clk, areset, in_16_cbar_mplane_sel_tpl_dut, in_16_cbar_mplane_sel_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_17_time_offset_bias_tpl : process (clk, areset, in_17_time_offset_bias_tpl_dut, in_17_time_offset_bias_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_18_startsym_bias_tpl : process (clk, areset, in_18_startsym_bias_tpl_dut, in_18_startsym_bias_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_19_gain_in_re_tpl : process (clk, areset, in_19_gain_in_re_tpl_dut, in_19_gain_in_re_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_20_gain_in_im_tpl : process (clk, areset, in_20_gain_in_im_tpl_dut, in_20_gain_in_im_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl : process (clk, areset, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_dut, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl : process (clk, areset, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_dut, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl : process (clk, areset, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_dut, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl : process (clk, areset, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_dut, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl : process (clk, areset, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_dut, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl : process (clk, areset, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_dut, in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_stm)
begin
END PROCESS;


dut : prach_shortFormat_fftShift_prach_PRACH_CC port map (
    in_1_imag_din0_tpl_stm,
    in_1_real_din0_tpl_stm,
    in_2_vin0_tpl_stm,
    in_3_chin0_tpl_stm,
    in_4_SFN_tpl_stm,
    in_5_SubFN_tpl_stm,
    in_6_SCSby15_tpl_stm,
    in_7_BWby10_tpl_stm,
    in_8_CPLen_cplane_tpl_stm,
    in_9_timeoffset_cplane_tpl_stm,
    in_10_numsym_cplane_tpl_stm,
    in_11_slotID_cplane_tpl_stm,
    in_12_startsym_cplane_tpl_stm,
    in_13_timerefin_cplane_tpl_stm,
    in_14_cur_slot_tpl_stm,
    in_15_SubFN_cplane_tpl_stm,
    in_16_cbar_mplane_sel_tpl_stm,
    in_17_time_offset_bias_tpl_stm,
    in_18_startsym_bias_tpl_stm,
    in_19_gain_in_re_tpl_stm,
    in_20_gain_in_im_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_stm,
    out_1_qv_tpl_dut,
    out_2_qch_tpl_dut,
    out_3_imag_q_tpl_dut,
    out_3_real_q_tpl_dut,
    out_4_qv139_tpl_dut,
    out_5_qFreqBinIdx_tpl_dut,
    out_6_fftShift_v_tpl_dut,
    out_7_fftShift_c_tpl_dut,
    out_8_imag_fftShift_d_tpl_dut,
    out_8_real_fftShift_d_tpl_dut,
    out_9_TimeReference_tpl_dut,
        clk,
        areset
);

sim : prach_shortFormat_fftShift_prach_PRACH_CC_stm port map (
    in_1_imag_din0_tpl_stm,
    in_1_real_din0_tpl_stm,
    in_2_vin0_tpl_stm,
    in_3_chin0_tpl_stm,
    in_4_SFN_tpl_stm,
    in_5_SubFN_tpl_stm,
    in_6_SCSby15_tpl_stm,
    in_7_BWby10_tpl_stm,
    in_8_CPLen_cplane_tpl_stm,
    in_9_timeoffset_cplane_tpl_stm,
    in_10_numsym_cplane_tpl_stm,
    in_11_slotID_cplane_tpl_stm,
    in_12_startsym_cplane_tpl_stm,
    in_13_timerefin_cplane_tpl_stm,
    in_14_cur_slot_tpl_stm,
    in_15_SubFN_cplane_tpl_stm,
    in_16_cbar_mplane_sel_tpl_stm,
    in_17_time_offset_bias_tpl_stm,
    in_18_startsym_bias_tpl_stm,
    in_19_gain_in_re_tpl_stm,
    in_20_gain_in_im_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField1_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField2_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField3_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ControlDecode_RegField4_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_ScaleOutputAndCheck_RegField2_x_tpl_stm,
    in_AMMregisterWireData_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_prach_shortFormat_fftShift_prach_PRACH_CC_ScaleAndSelect_gen_139_valids_RegField1_x_tpl_stm,
    out_1_qv_tpl_stm,
    out_2_qch_tpl_stm,
    out_3_imag_q_tpl_stm,
    out_3_real_q_tpl_stm,
    out_4_qv139_tpl_stm,
    out_5_qFreqBinIdx_tpl_stm,
    out_6_fftShift_v_tpl_stm,
    out_7_fftShift_c_tpl_stm,
    out_8_imag_fftShift_d_tpl_stm,
    out_8_real_fftShift_d_tpl_stm,
    out_9_TimeReference_tpl_stm,
        clk,
        areset
);

end normal;
