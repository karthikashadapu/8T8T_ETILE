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

-- VHDL created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane
-- VHDL created on Fri Dec  6 17:01:04 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_atb is
end;

architecture normal of LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_atb is

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(1 downto 0);  -- ufix2
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        in_1_vin0_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_chin0_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_imag_din0_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_3_real_din0_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_RFN_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        in_5_SubFrame_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_6_prach_cfg_idx_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_7_cp_len_tpl : in std_logic_vector(20 downto 0);  -- ufix21
        in_8_offset_tpl : in std_logic_vector(20 downto 0);  -- ufix21
        in_9_c_m_plane_sel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_10_prach_tech_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_11_prach_sym_start_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_12_prach_sym_end_tpl : in std_logic_vector(18 downto 0);  -- ufix19
        in_13_prach_out_start_tpl : in std_logic_vector(6 downto 0);  -- ufix7
        in_14_prach_out_end_tpl : in std_logic_vector(9 downto 0);  -- ufix10
        in_15_filt_flush_en_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_16_start_sym_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_17_SubFrame_cplane_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_18_gain_re_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_19_gain_im_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_20_ch0_info_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_21_ch1_info_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_22_ch2_info_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_23_ch3_info_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_24_RFN_cplane_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        out_1_imag_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en8
        out_1_real_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en8
        out_2_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_cout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_4_TimeReference_tpl : out std_logic_vector(31 downto 0);  -- ufix32
        out_5_version_info_tpl : out std_logic_vector(31 downto 0);  -- ufix32
        out_6_ch_info_tpl : out std_logic_vector(15 downto 0);  -- ufix16
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(1 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        in_1_vin0_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_chin0_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_imag_din0_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_real_din0_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_RFN_tpl_stm : out std_logic_vector(11 downto 0);
        in_5_SubFrame_tpl_stm : out std_logic_vector(7 downto 0);
        in_6_prach_cfg_idx_tpl_stm : out std_logic_vector(15 downto 0);
        in_7_cp_len_tpl_stm : out std_logic_vector(20 downto 0);
        in_8_offset_tpl_stm : out std_logic_vector(20 downto 0);
        in_9_c_m_plane_sel_tpl_stm : out std_logic_vector(0 downto 0);
        in_10_prach_tech_tpl_stm : out std_logic_vector(0 downto 0);
        in_11_prach_sym_start_tpl_stm : out std_logic_vector(15 downto 0);
        in_12_prach_sym_end_tpl_stm : out std_logic_vector(18 downto 0);
        in_13_prach_out_start_tpl_stm : out std_logic_vector(6 downto 0);
        in_14_prach_out_end_tpl_stm : out std_logic_vector(9 downto 0);
        in_15_filt_flush_en_tpl_stm : out std_logic_vector(0 downto 0);
        in_16_start_sym_tpl_stm : out std_logic_vector(3 downto 0);
        in_17_SubFrame_cplane_tpl_stm : out std_logic_vector(7 downto 0);
        in_18_gain_re_tpl_stm : out std_logic_vector(15 downto 0);
        in_19_gain_im_tpl_stm : out std_logic_vector(15 downto 0);
        in_20_ch0_info_tpl_stm : out std_logic_vector(15 downto 0);
        in_21_ch1_info_tpl_stm : out std_logic_vector(15 downto 0);
        in_22_ch2_info_tpl_stm : out std_logic_vector(15 downto 0);
        in_23_ch3_info_tpl_stm : out std_logic_vector(15 downto 0);
        in_24_RFN_cplane_tpl_stm : out std_logic_vector(11 downto 0);
        out_1_imag_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_real_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_cout_tpl_stm : out std_logic_vector(7 downto 0);
        out_4_TimeReference_tpl_stm : out std_logic_vector(31 downto 0);
        out_5_version_info_tpl_stm : out std_logic_vector(31 downto 0);
        out_6_ch_info_tpl_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end component;

signal busIn_writedata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_stm : STD_LOGIC_VECTOR (1 downto 0);
signal busIn_write_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_vin0_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_chin0_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_imag_din0_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_real_din0_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_RFN_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_5_SubFrame_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_6_prach_cfg_idx_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_cp_len_tpl_stm : STD_LOGIC_VECTOR (20 downto 0);
signal in_8_offset_tpl_stm : STD_LOGIC_VECTOR (20 downto 0);
signal in_9_c_m_plane_sel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_10_prach_tech_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_11_prach_sym_start_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_12_prach_sym_end_tpl_stm : STD_LOGIC_VECTOR (18 downto 0);
signal in_13_prach_out_start_tpl_stm : STD_LOGIC_VECTOR (6 downto 0);
signal in_14_prach_out_end_tpl_stm : STD_LOGIC_VECTOR (9 downto 0);
signal in_15_filt_flush_en_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_16_start_sym_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_17_SubFrame_cplane_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_18_gain_re_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_19_gain_im_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_20_ch0_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_21_ch1_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_22_ch2_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_23_ch3_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_24_RFN_cplane_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_1_imag_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_TimeReference_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_5_version_info_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_6_ch_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (1 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_vin0_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_chin0_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_imag_din0_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_real_din0_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_RFN_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_5_SubFrame_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_6_prach_cfg_idx_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_cp_len_tpl_dut : STD_LOGIC_VECTOR (20 downto 0);
signal in_8_offset_tpl_dut : STD_LOGIC_VECTOR (20 downto 0);
signal in_9_c_m_plane_sel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_10_prach_tech_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_11_prach_sym_start_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_12_prach_sym_end_tpl_dut : STD_LOGIC_VECTOR (18 downto 0);
signal in_13_prach_out_start_tpl_dut : STD_LOGIC_VECTOR (6 downto 0);
signal in_14_prach_out_end_tpl_dut : STD_LOGIC_VECTOR (9 downto 0);
signal in_15_filt_flush_en_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_16_start_sym_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_17_SubFrame_cplane_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_18_gain_re_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_19_gain_im_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_20_ch0_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_21_ch1_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_22_ch2_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_23_ch3_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_24_RFN_cplane_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_1_imag_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_TimeReference_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_5_version_info_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_6_ch_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkin_1_vin0_tpl : process (clk, areset, in_1_vin0_tpl_dut, in_1_vin0_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_chin0_tpl : process (clk, areset, in_2_chin0_tpl_dut, in_2_chin0_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_imag_din0_tpl : process (clk, areset, in_3_imag_din0_tpl_dut, in_3_imag_din0_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_real_din0_tpl : process (clk, areset, in_3_real_din0_tpl_dut, in_3_real_din0_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_RFN_tpl : process (clk, areset, in_4_RFN_tpl_dut, in_4_RFN_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_SubFrame_tpl : process (clk, areset, in_5_SubFrame_tpl_dut, in_5_SubFrame_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_6_prach_cfg_idx_tpl : process (clk, areset, in_6_prach_cfg_idx_tpl_dut, in_6_prach_cfg_idx_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_7_cp_len_tpl : process (clk, areset, in_7_cp_len_tpl_dut, in_7_cp_len_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_8_offset_tpl : process (clk, areset, in_8_offset_tpl_dut, in_8_offset_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_9_c_m_plane_sel_tpl : process (clk, areset, in_9_c_m_plane_sel_tpl_dut, in_9_c_m_plane_sel_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_10_prach_tech_tpl : process (clk, areset, in_10_prach_tech_tpl_dut, in_10_prach_tech_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_11_prach_sym_start_tpl : process (clk, areset, in_11_prach_sym_start_tpl_dut, in_11_prach_sym_start_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_12_prach_sym_end_tpl : process (clk, areset, in_12_prach_sym_end_tpl_dut, in_12_prach_sym_end_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_13_prach_out_start_tpl : process (clk, areset, in_13_prach_out_start_tpl_dut, in_13_prach_out_start_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_14_prach_out_end_tpl : process (clk, areset, in_14_prach_out_end_tpl_dut, in_14_prach_out_end_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_15_filt_flush_en_tpl : process (clk, areset, in_15_filt_flush_en_tpl_dut, in_15_filt_flush_en_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_16_start_sym_tpl : process (clk, areset, in_16_start_sym_tpl_dut, in_16_start_sym_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_17_SubFrame_cplane_tpl : process (clk, areset, in_17_SubFrame_cplane_tpl_dut, in_17_SubFrame_cplane_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_18_gain_re_tpl : process (clk, areset, in_18_gain_re_tpl_dut, in_18_gain_re_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_19_gain_im_tpl : process (clk, areset, in_19_gain_im_tpl_dut, in_19_gain_im_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_20_ch0_info_tpl : process (clk, areset, in_20_ch0_info_tpl_dut, in_20_ch0_info_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_21_ch1_info_tpl : process (clk, areset, in_21_ch1_info_tpl_dut, in_21_ch1_info_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_22_ch2_info_tpl : process (clk, areset, in_22_ch2_info_tpl_dut, in_22_ch2_info_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_23_ch3_info_tpl : process (clk, areset, in_23_ch3_info_tpl_dut, in_23_ch3_info_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_24_RFN_cplane_tpl : process (clk, areset, in_24_RFN_cplane_tpl_dut, in_24_RFN_cplane_tpl_stm)
begin
END PROCESS;


dut : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    in_1_vin0_tpl_stm,
    in_2_chin0_tpl_stm,
    in_3_imag_din0_tpl_stm,
    in_3_real_din0_tpl_stm,
    in_4_RFN_tpl_stm,
    in_5_SubFrame_tpl_stm,
    in_6_prach_cfg_idx_tpl_stm,
    in_7_cp_len_tpl_stm,
    in_8_offset_tpl_stm,
    in_9_c_m_plane_sel_tpl_stm,
    in_10_prach_tech_tpl_stm,
    in_11_prach_sym_start_tpl_stm,
    in_12_prach_sym_end_tpl_stm,
    in_13_prach_out_start_tpl_stm,
    in_14_prach_out_end_tpl_stm,
    in_15_filt_flush_en_tpl_stm,
    in_16_start_sym_tpl_stm,
    in_17_SubFrame_cplane_tpl_stm,
    in_18_gain_re_tpl_stm,
    in_19_gain_im_tpl_stm,
    in_20_ch0_info_tpl_stm,
    in_21_ch1_info_tpl_stm,
    in_22_ch2_info_tpl_stm,
    in_23_ch3_info_tpl_stm,
    in_24_RFN_cplane_tpl_stm,
    out_1_imag_dout_tpl_dut,
    out_1_real_dout_tpl_dut,
    out_2_vout_tpl_dut,
    out_3_cout_tpl_dut,
    out_4_TimeReference_tpl_dut,
    out_5_version_info_tpl_dut,
    out_6_ch_info_tpl_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    in_1_vin0_tpl_stm,
    in_2_chin0_tpl_stm,
    in_3_imag_din0_tpl_stm,
    in_3_real_din0_tpl_stm,
    in_4_RFN_tpl_stm,
    in_5_SubFrame_tpl_stm,
    in_6_prach_cfg_idx_tpl_stm,
    in_7_cp_len_tpl_stm,
    in_8_offset_tpl_stm,
    in_9_c_m_plane_sel_tpl_stm,
    in_10_prach_tech_tpl_stm,
    in_11_prach_sym_start_tpl_stm,
    in_12_prach_sym_end_tpl_stm,
    in_13_prach_out_start_tpl_stm,
    in_14_prach_out_end_tpl_stm,
    in_15_filt_flush_en_tpl_stm,
    in_16_start_sym_tpl_stm,
    in_17_SubFrame_cplane_tpl_stm,
    in_18_gain_re_tpl_stm,
    in_19_gain_im_tpl_stm,
    in_20_ch0_info_tpl_stm,
    in_21_ch1_info_tpl_stm,
    in_22_ch2_info_tpl_stm,
    in_23_ch3_info_tpl_stm,
    in_24_RFN_cplane_tpl_stm,
    out_1_imag_dout_tpl_stm,
    out_1_real_dout_tpl_stm,
    out_2_vout_tpl_stm,
    out_3_cout_tpl_stm,
    out_4_TimeReference_tpl_stm,
    out_5_version_info_tpl_stm,
    out_6_ch_info_tpl_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
