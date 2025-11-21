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

-- VHDL created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_atb is
end;

architecture normal of ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_atb is

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S is
    port (
        in_1_imag_data1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_real_data1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_2_valid_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_channel1_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_4_size1_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_5_cplen1_tpl : in std_logic_vector(10 downto 0);  -- ufix11
        in_6_nsc1_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        in_7_ifft_gain_re_l1_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_8_ifft_gain_im_l1_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_9_ifft_shift_l1_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_10_ifft_mux_const_l1_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_11_muxsel_l1_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_12_DC_SC_EN_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_13_ripple_comp_en_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_14_rc_bw_sel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_15_time_in_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en15
        in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en15
        out_1_vout1_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_cout1_tpl : out std_logic_vector(1 downto 0);  -- ufix2
        out_3_imag_dout1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_3_real_dout1_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_4_imag_td_ifft_out_d_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_4_real_td_ifft_out_d_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_5_td_ifft_out_ch_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_6_td_ifft_out_v_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_7_ifft_size_out_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_8_ifft_nprb_out_tpl : out std_logic_vector(11 downto 0);  -- ufix12
        out_9_ifft_cp_out_tpl : out std_logic_vector(10 downto 0);  -- ufix11
        out_10_fd_data_v_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_11_fd_data_c_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_12_imag_fd_data_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_12_real_fd_data_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_13_fd_time_out_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl : out std_logic_vector(11 downto 0);  -- ufix12
        out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl : out std_logic_vector(11 downto 0);  -- ufix12
        out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl : out std_logic_vector(15 downto 0);  -- ufix16_en15
        out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl : out std_logic_vector(15 downto 0);  -- ufix16_en15
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_stm is
    port (
        in_1_imag_data1_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_real_data1_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_valid_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_channel1_tpl_stm : out std_logic_vector(7 downto 0);
        in_4_size1_tpl_stm : out std_logic_vector(3 downto 0);
        in_5_cplen1_tpl_stm : out std_logic_vector(10 downto 0);
        in_6_nsc1_tpl_stm : out std_logic_vector(11 downto 0);
        in_7_ifft_gain_re_l1_tpl_stm : out std_logic_vector(15 downto 0);
        in_8_ifft_gain_im_l1_tpl_stm : out std_logic_vector(15 downto 0);
        in_9_ifft_shift_l1_tpl_stm : out std_logic_vector(3 downto 0);
        in_10_ifft_mux_const_l1_tpl_stm : out std_logic_vector(15 downto 0);
        in_11_muxsel_l1_tpl_stm : out std_logic_vector(0 downto 0);
        in_12_DC_SC_EN_tpl_stm : out std_logic_vector(0 downto 0);
        in_13_ripple_comp_en_tpl_stm : out std_logic_vector(0 downto 0);
        in_14_rc_bw_sel_tpl_stm : out std_logic_vector(0 downto 0);
        in_15_time_in_tpl_stm : out std_logic_vector(63 downto 0);
        in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_vout1_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_cout1_tpl_stm : out std_logic_vector(1 downto 0);
        out_3_imag_dout1_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_real_dout1_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_imag_td_ifft_out_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_real_td_ifft_out_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_5_td_ifft_out_ch_tpl_stm : out std_logic_vector(7 downto 0);
        out_6_td_ifft_out_v_tpl_stm : out std_logic_vector(0 downto 0);
        out_7_ifft_size_out_tpl_stm : out std_logic_vector(3 downto 0);
        out_8_ifft_nprb_out_tpl_stm : out std_logic_vector(11 downto 0);
        out_9_ifft_cp_out_tpl_stm : out std_logic_vector(10 downto 0);
        out_10_fd_data_v_tpl_stm : out std_logic_vector(0 downto 0);
        out_11_fd_data_c_tpl_stm : out std_logic_vector(7 downto 0);
        out_12_imag_fd_data_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_12_real_fd_data_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_13_fd_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(11 downto 0);
        out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(11 downto 0);
        out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_imag_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_real_data1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_valid_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_channel1_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_size1_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_cplen1_tpl_stm : STD_LOGIC_VECTOR (10 downto 0);
signal in_6_nsc1_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_7_ifft_gain_re_l1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_8_ifft_gain_im_l1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_9_ifft_shift_l1_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_10_ifft_mux_const_l1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_11_muxsel_l1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_12_DC_SC_EN_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_13_ripple_comp_en_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_14_rc_bw_sel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_15_time_in_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_vout1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_cout1_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_3_imag_dout1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_real_dout1_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_imag_td_ifft_out_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_real_td_ifft_out_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_5_td_ifft_out_ch_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_6_td_ifft_out_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_7_ifft_size_out_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_8_ifft_nprb_out_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_9_ifft_cp_out_tpl_stm : STD_LOGIC_VECTOR (10 downto 0);
signal out_10_fd_data_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_11_fd_data_c_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_12_imag_fd_data_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_12_real_fd_data_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_13_fd_time_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_imag_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_real_data1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_valid_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_channel1_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_size1_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_cplen1_tpl_dut : STD_LOGIC_VECTOR (10 downto 0);
signal in_6_nsc1_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_7_ifft_gain_re_l1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_8_ifft_gain_im_l1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_9_ifft_shift_l1_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_10_ifft_mux_const_l1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_11_muxsel_l1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_12_DC_SC_EN_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_13_ripple_comp_en_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_14_rc_bw_sel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_15_time_in_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_vout1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_cout1_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_3_imag_dout1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_real_dout1_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_imag_td_ifft_out_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_real_td_ifft_out_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_5_td_ifft_out_ch_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_6_td_ifft_out_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_7_ifft_size_out_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_8_ifft_nprb_out_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_9_ifft_cp_out_tpl_dut : STD_LOGIC_VECTOR (10 downto 0);
signal out_10_fd_data_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_11_fd_data_c_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_12_imag_fd_data_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_12_real_fd_data_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_13_fd_time_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkin_1_imag_data1_tpl : process (clk, areset, in_1_imag_data1_tpl_dut, in_1_imag_data1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_real_data1_tpl : process (clk, areset, in_1_real_data1_tpl_dut, in_1_real_data1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_valid_tpl : process (clk, areset, in_2_valid_tpl_dut, in_2_valid_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_channel1_tpl : process (clk, areset, in_3_channel1_tpl_dut, in_3_channel1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_size1_tpl : process (clk, areset, in_4_size1_tpl_dut, in_4_size1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_cplen1_tpl : process (clk, areset, in_5_cplen1_tpl_dut, in_5_cplen1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_6_nsc1_tpl : process (clk, areset, in_6_nsc1_tpl_dut, in_6_nsc1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_7_ifft_gain_re_l1_tpl : process (clk, areset, in_7_ifft_gain_re_l1_tpl_dut, in_7_ifft_gain_re_l1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_8_ifft_gain_im_l1_tpl : process (clk, areset, in_8_ifft_gain_im_l1_tpl_dut, in_8_ifft_gain_im_l1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_9_ifft_shift_l1_tpl : process (clk, areset, in_9_ifft_shift_l1_tpl_dut, in_9_ifft_shift_l1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_10_ifft_mux_const_l1_tpl : process (clk, areset, in_10_ifft_mux_const_l1_tpl_dut, in_10_ifft_mux_const_l1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_11_muxsel_l1_tpl : process (clk, areset, in_11_muxsel_l1_tpl_dut, in_11_muxsel_l1_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_12_DC_SC_EN_tpl : process (clk, areset, in_12_DC_SC_EN_tpl_dut, in_12_DC_SC_EN_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_13_ripple_comp_en_tpl : process (clk, areset, in_13_ripple_comp_en_tpl_dut, in_13_ripple_comp_en_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_14_rc_bw_sel_tpl : process (clk, areset, in_14_rc_bw_sel_tpl_dut, in_14_rc_bw_sel_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_15_time_in_tpl : process (clk, areset, in_15_time_in_tpl_dut, in_15_time_in_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl : process (clk, areset, in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut, in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl : process (clk, areset, in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut, in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm)
begin
END PROCESS;


dut : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S port map (
    in_1_imag_data1_tpl_stm,
    in_1_real_data1_tpl_stm,
    in_2_valid_tpl_stm,
    in_3_channel1_tpl_stm,
    in_4_size1_tpl_stm,
    in_5_cplen1_tpl_stm,
    in_6_nsc1_tpl_stm,
    in_7_ifft_gain_re_l1_tpl_stm,
    in_8_ifft_gain_im_l1_tpl_stm,
    in_9_ifft_shift_l1_tpl_stm,
    in_10_ifft_mux_const_l1_tpl_stm,
    in_11_muxsel_l1_tpl_stm,
    in_12_DC_SC_EN_tpl_stm,
    in_13_ripple_comp_en_tpl_stm,
    in_14_rc_bw_sel_tpl_stm,
    in_15_time_in_tpl_stm,
    in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm,
    in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm,
    out_1_vout1_tpl_dut,
    out_2_cout1_tpl_dut,
    out_3_imag_dout1_tpl_dut,
    out_3_real_dout1_tpl_dut,
    out_4_imag_td_ifft_out_d_tpl_dut,
    out_4_real_td_ifft_out_d_tpl_dut,
    out_5_td_ifft_out_ch_tpl_dut,
    out_6_td_ifft_out_v_tpl_dut,
    out_7_ifft_size_out_tpl_dut,
    out_8_ifft_nprb_out_tpl_dut,
    out_9_ifft_cp_out_tpl_dut,
    out_10_fd_data_v_tpl_dut,
    out_11_fd_data_c_tpl_dut,
    out_12_imag_fd_data_q_tpl_dut,
    out_12_real_fd_data_q_tpl_dut,
    out_13_fd_time_out_tpl_dut,
    out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut,
    out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut,
    out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut,
    out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut,
        clk,
        areset
);

sim : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_stm port map (
    in_1_imag_data1_tpl_stm,
    in_1_real_data1_tpl_stm,
    in_2_valid_tpl_stm,
    in_3_channel1_tpl_stm,
    in_4_size1_tpl_stm,
    in_5_cplen1_tpl_stm,
    in_6_nsc1_tpl_stm,
    in_7_ifft_gain_re_l1_tpl_stm,
    in_8_ifft_gain_im_l1_tpl_stm,
    in_9_ifft_shift_l1_tpl_stm,
    in_10_ifft_mux_const_l1_tpl_stm,
    in_11_muxsel_l1_tpl_stm,
    in_12_DC_SC_EN_tpl_stm,
    in_13_ripple_comp_en_tpl_stm,
    in_14_rc_bw_sel_tpl_stm,
    in_15_time_in_tpl_stm,
    in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm,
    in_sharedMemWireData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm,
    out_1_vout1_tpl_stm,
    out_2_cout1_tpl_stm,
    out_3_imag_dout1_tpl_stm,
    out_3_real_dout1_tpl_stm,
    out_4_imag_td_ifft_out_d_tpl_stm,
    out_4_real_td_ifft_out_d_tpl_stm,
    out_5_td_ifft_out_ch_tpl_stm,
    out_6_td_ifft_out_v_tpl_stm,
    out_7_ifft_size_out_tpl_stm,
    out_8_ifft_nprb_out_tpl_stm,
    out_9_ifft_cp_out_tpl_stm,
    out_10_fd_data_v_tpl_stm,
    out_11_fd_data_c_tpl_stm,
    out_12_imag_fd_data_q_tpl_stm,
    out_12_real_fd_data_q_tpl_stm,
    out_13_fd_time_out_tpl_stm,
    out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm,
    out_sharedMemPortAddr_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm,
    out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm,
    out_sharedMemPortData_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_BRandSCMap_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm,
        clk,
        areset
);

end normal;
