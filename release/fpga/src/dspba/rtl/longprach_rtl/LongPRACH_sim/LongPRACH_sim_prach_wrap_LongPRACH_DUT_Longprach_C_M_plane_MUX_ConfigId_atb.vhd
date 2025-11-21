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

-- VHDL created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId
-- VHDL created on Fri Dec  6 17:01:04 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb is
end;

architecture normal of LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_atb is

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId is
    port (
        in_2_vin0_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_chin0_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_1_real_din0_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_imag_din0_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_7_cp_len_tpl : in std_logic_vector(20 downto 0);  -- ufix21
        in_8_offset_tpl : in std_logic_vector(20 downto 0);  -- ufix21
        in_9_c_m_plane_sel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_10_prach_tech_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_11_prcah_sym_start_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_12_prcah_sym_end_tpl : in std_logic_vector(18 downto 0);  -- ufix19
        in_13_prach_out_start_tpl : in std_logic_vector(6 downto 0);  -- ufix7
        in_14_prach_out_end_tpl : in std_logic_vector(9 downto 0);  -- ufix10
        in_5_SubFrame_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_6_prach_config_index_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_4_SFN_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        in_15_start_sym_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_16_Subframe_cplane_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_17_SFN_cplane_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        out_2_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_cout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_1_real_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_1_imag_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_4_TimeReference_tpl : out std_logic_vector(31 downto 0);  -- ufix32
        out_5_cp_start_tpl : out std_logic_vector(21 downto 0);  -- ufix22
        out_6_gt_end_tpl : out std_logic_vector(22 downto 0);  -- ufix23
        out_7_prach_outstart_tpl : out std_logic_vector(6 downto 0);  -- ufix7
        out_8_prach_outend_tpl : out std_logic_vector(9 downto 0);  -- ufix10
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_stm is
    port (
        in_2_vin0_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_chin0_tpl_stm : out std_logic_vector(7 downto 0);
        in_1_real_din0_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_imag_din0_tpl_stm : out std_logic_vector(15 downto 0);
        in_7_cp_len_tpl_stm : out std_logic_vector(20 downto 0);
        in_8_offset_tpl_stm : out std_logic_vector(20 downto 0);
        in_9_c_m_plane_sel_tpl_stm : out std_logic_vector(0 downto 0);
        in_10_prach_tech_tpl_stm : out std_logic_vector(0 downto 0);
        in_11_prcah_sym_start_tpl_stm : out std_logic_vector(15 downto 0);
        in_12_prcah_sym_end_tpl_stm : out std_logic_vector(18 downto 0);
        in_13_prach_out_start_tpl_stm : out std_logic_vector(6 downto 0);
        in_14_prach_out_end_tpl_stm : out std_logic_vector(9 downto 0);
        in_5_SubFrame_tpl_stm : out std_logic_vector(7 downto 0);
        in_6_prach_config_index_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_SFN_tpl_stm : out std_logic_vector(11 downto 0);
        in_15_start_sym_tpl_stm : out std_logic_vector(3 downto 0);
        in_16_Subframe_cplane_tpl_stm : out std_logic_vector(7 downto 0);
        in_17_SFN_cplane_tpl_stm : out std_logic_vector(11 downto 0);
        out_2_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_cout_tpl_stm : out std_logic_vector(7 downto 0);
        out_1_real_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_imag_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_TimeReference_tpl_stm : out std_logic_vector(31 downto 0);
        out_5_cp_start_tpl_stm : out std_logic_vector(21 downto 0);
        out_6_gt_end_tpl_stm : out std_logic_vector(22 downto 0);
        out_7_prach_outstart_tpl_stm : out std_logic_vector(6 downto 0);
        out_8_prach_outend_tpl_stm : out std_logic_vector(9 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_2_vin0_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_chin0_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_real_din0_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_imag_din0_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_cp_len_tpl_stm : STD_LOGIC_VECTOR (20 downto 0);
signal in_8_offset_tpl_stm : STD_LOGIC_VECTOR (20 downto 0);
signal in_9_c_m_plane_sel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_10_prach_tech_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_11_prcah_sym_start_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_12_prcah_sym_end_tpl_stm : STD_LOGIC_VECTOR (18 downto 0);
signal in_13_prach_out_start_tpl_stm : STD_LOGIC_VECTOR (6 downto 0);
signal in_14_prach_out_end_tpl_stm : STD_LOGIC_VECTOR (9 downto 0);
signal in_5_SubFrame_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_6_prach_config_index_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_SFN_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_15_start_sym_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_16_Subframe_cplane_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_17_SFN_cplane_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_2_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_real_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_TimeReference_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_5_cp_start_tpl_stm : STD_LOGIC_VECTOR (21 downto 0);
signal out_6_gt_end_tpl_stm : STD_LOGIC_VECTOR (22 downto 0);
signal out_7_prach_outstart_tpl_stm : STD_LOGIC_VECTOR (6 downto 0);
signal out_8_prach_outend_tpl_stm : STD_LOGIC_VECTOR (9 downto 0);
signal in_2_vin0_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_chin0_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_1_real_din0_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_imag_din0_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_cp_len_tpl_dut : STD_LOGIC_VECTOR (20 downto 0);
signal in_8_offset_tpl_dut : STD_LOGIC_VECTOR (20 downto 0);
signal in_9_c_m_plane_sel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_10_prach_tech_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_11_prcah_sym_start_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_12_prcah_sym_end_tpl_dut : STD_LOGIC_VECTOR (18 downto 0);
signal in_13_prach_out_start_tpl_dut : STD_LOGIC_VECTOR (6 downto 0);
signal in_14_prach_out_end_tpl_dut : STD_LOGIC_VECTOR (9 downto 0);
signal in_5_SubFrame_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_6_prach_config_index_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_SFN_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_15_start_sym_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_16_Subframe_cplane_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_17_SFN_cplane_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_2_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_1_real_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_TimeReference_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_5_cp_start_tpl_dut : STD_LOGIC_VECTOR (21 downto 0);
signal out_6_gt_end_tpl_dut : STD_LOGIC_VECTOR (22 downto 0);
signal out_7_prach_outstart_tpl_dut : STD_LOGIC_VECTOR (6 downto 0);
signal out_8_prach_outend_tpl_dut : STD_LOGIC_VECTOR (9 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_cunroll_x : process (clk, areset, in_1_real_din0_tpl_dut, in_1_real_din0_tpl_stm, in_1_imag_din0_tpl_dut, in_1_imag_din0_tpl_stm, in_7_cp_len_tpl_dut, in_7_cp_len_tpl_stm, in_8_offset_tpl_dut, in_8_offset_tpl_stm, in_9_c_m_plane_sel_tpl_dut, in_9_c_m_plane_sel_tpl_stm, in_10_prach_tech_tpl_dut, in_10_prach_tech_tpl_stm, in_11_prcah_sym_start_tpl_dut, in_11_prcah_sym_start_tpl_stm, in_12_prcah_sym_end_tpl_dut, in_12_prcah_sym_end_tpl_stm, in_13_prach_out_start_tpl_dut, in_13_prach_out_start_tpl_stm, in_14_prach_out_end_tpl_dut, in_14_prach_out_end_tpl_stm, in_5_SubFrame_tpl_dut, in_5_SubFrame_tpl_stm, in_6_prach_config_index_tpl_dut, in_6_prach_config_index_tpl_stm, in_4_SFN_tpl_dut, in_4_SFN_tpl_stm, in_15_start_sym_tpl_dut, in_15_start_sym_tpl_stm, in_16_Subframe_cplane_tpl_dut, in_16_Subframe_cplane_tpl_stm, in_17_SFN_cplane_tpl_dut, in_17_SFN_cplane_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut_cunroll_x : process (clk, areset, out_1_real_dout_tpl_dut, out_1_real_dout_tpl_stm, out_1_imag_dout_tpl_dut, out_1_imag_dout_tpl_stm, out_4_TimeReference_tpl_dut, out_4_TimeReference_tpl_stm, out_5_cp_start_tpl_dut, out_5_cp_start_tpl_stm, out_6_gt_end_tpl_dut, out_6_gt_end_tpl_stm, out_7_prach_outstart_tpl_dut, out_7_prach_outstart_tpl_stm, out_8_prach_outend_tpl_dut, out_8_prach_outend_tpl_stm)
variable mismatch_out_2_vout_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_cout_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_real_dout_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_imag_dout_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_TimeReference_tpl : BOOLEAN := FALSE;
variable mismatch_out_5_cp_start_tpl : BOOLEAN := FALSE;
variable mismatch_out_6_gt_end_tpl : BOOLEAN := FALSE;
variable mismatch_out_7_prach_outstart_tpl : BOOLEAN := FALSE;
variable mismatch_out_8_prach_outend_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_2_vout_tpl := FALSE;
        mismatch_out_3_cout_tpl := FALSE;
        mismatch_out_1_real_dout_tpl := FALSE;
        mismatch_out_1_imag_dout_tpl := FALSE;
        mismatch_out_4_TimeReference_tpl := FALSE;
        mismatch_out_5_cp_start_tpl := FALSE;
        mismatch_out_6_gt_end_tpl := FALSE;
        mismatch_out_7_prach_outstart_tpl := FALSE;
        mismatch_out_8_prach_outend_tpl := FALSE;
        IF ( (out_2_vout_tpl_dut /= out_2_vout_tpl_stm)) THEN
            mismatch_out_2_vout_tpl := TRUE;
            report "mismatch in out_2_vout_tpl signal" severity Failure;
        END IF;
        IF ((out_2_vout_tpl_dut = "1")) THEN
            IF ( (out_3_cout_tpl_dut /= out_3_cout_tpl_stm)) THEN
                mismatch_out_3_cout_tpl := TRUE;
                report "mismatch in out_3_cout_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_real_dout_tpl_dut /= out_1_real_dout_tpl_stm)) THEN
                mismatch_out_1_real_dout_tpl := TRUE;
                report "mismatch in out_1_real_dout_tpl signal" severity Warning;
            END IF;
            IF ( (out_1_imag_dout_tpl_dut /= out_1_imag_dout_tpl_stm)) THEN
                mismatch_out_1_imag_dout_tpl := TRUE;
                report "mismatch in out_1_imag_dout_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_TimeReference_tpl_dut /= out_4_TimeReference_tpl_stm)) THEN
                mismatch_out_4_TimeReference_tpl := TRUE;
                report "mismatch in out_4_TimeReference_tpl signal" severity Warning;
            END IF;
            IF ( (out_5_cp_start_tpl_dut /= out_5_cp_start_tpl_stm)) THEN
                mismatch_out_5_cp_start_tpl := TRUE;
                report "mismatch in out_5_cp_start_tpl signal" severity Warning;
            END IF;
            IF ( (out_6_gt_end_tpl_dut /= out_6_gt_end_tpl_stm)) THEN
                mismatch_out_6_gt_end_tpl := TRUE;
                report "mismatch in out_6_gt_end_tpl signal" severity Warning;
            END IF;
            IF ( (out_7_prach_outstart_tpl_dut /= out_7_prach_outstart_tpl_stm)) THEN
                mismatch_out_7_prach_outstart_tpl := TRUE;
                report "mismatch in out_7_prach_outstart_tpl signal" severity Warning;
            END IF;
            IF ( (out_8_prach_outend_tpl_dut /= out_8_prach_outend_tpl_stm)) THEN
                mismatch_out_8_prach_outend_tpl := TRUE;
                report "mismatch in out_8_prach_outend_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_2_vout_tpl = TRUE or mismatch_out_3_cout_tpl = TRUE or mismatch_out_1_real_dout_tpl = TRUE or mismatch_out_1_imag_dout_tpl = TRUE or mismatch_out_4_TimeReference_tpl = TRUE or mismatch_out_5_cp_start_tpl = TRUE or mismatch_out_6_gt_end_tpl = TRUE or mismatch_out_7_prach_outstart_tpl = TRUE or mismatch_out_8_prach_outend_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId port map (
    in_2_vin0_tpl_stm,
    in_3_chin0_tpl_stm,
    in_1_real_din0_tpl_stm,
    in_1_imag_din0_tpl_stm,
    in_7_cp_len_tpl_stm,
    in_8_offset_tpl_stm,
    in_9_c_m_plane_sel_tpl_stm,
    in_10_prach_tech_tpl_stm,
    in_11_prcah_sym_start_tpl_stm,
    in_12_prcah_sym_end_tpl_stm,
    in_13_prach_out_start_tpl_stm,
    in_14_prach_out_end_tpl_stm,
    in_5_SubFrame_tpl_stm,
    in_6_prach_config_index_tpl_stm,
    in_4_SFN_tpl_stm,
    in_15_start_sym_tpl_stm,
    in_16_Subframe_cplane_tpl_stm,
    in_17_SFN_cplane_tpl_stm,
    out_2_vout_tpl_dut,
    out_3_cout_tpl_dut,
    out_1_real_dout_tpl_dut,
    out_1_imag_dout_tpl_dut,
    out_4_TimeReference_tpl_dut,
    out_5_cp_start_tpl_dut,
    out_6_gt_end_tpl_dut,
    out_7_prach_outstart_tpl_dut,
    out_8_prach_outend_tpl_dut,
        clk,
        areset
);

sim : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_stm port map (
    in_2_vin0_tpl_stm,
    in_3_chin0_tpl_stm,
    in_1_real_din0_tpl_stm,
    in_1_imag_din0_tpl_stm,
    in_7_cp_len_tpl_stm,
    in_8_offset_tpl_stm,
    in_9_c_m_plane_sel_tpl_stm,
    in_10_prach_tech_tpl_stm,
    in_11_prcah_sym_start_tpl_stm,
    in_12_prcah_sym_end_tpl_stm,
    in_13_prach_out_start_tpl_stm,
    in_14_prach_out_end_tpl_stm,
    in_5_SubFrame_tpl_stm,
    in_6_prach_config_index_tpl_stm,
    in_4_SFN_tpl_stm,
    in_15_start_sym_tpl_stm,
    in_16_Subframe_cplane_tpl_stm,
    in_17_SFN_cplane_tpl_stm,
    out_2_vout_tpl_stm,
    out_3_cout_tpl_stm,
    out_1_real_dout_tpl_stm,
    out_1_imag_dout_tpl_stm,
    out_4_TimeReference_tpl_stm,
    out_5_cp_start_tpl_stm,
    out_6_gt_end_tpl_stm,
    out_7_prach_outstart_tpl_stm,
    out_8_prach_outend_tpl_stm,
        clk,
        areset
);

end normal;
