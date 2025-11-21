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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_atb is
end;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_atb is

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        in_1_fft_v_in_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_cin_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_imag_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_3_real_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_sync_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_nsc_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_6_size_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_7_SFNin_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        in_8_fft_gain_re_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_9_fft_gain_im_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_10_hcs_bypass_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_11_fft_shift_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_12_DC_SC_EN_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_13_ripple_comp_en_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_14_rc_bw_sel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_15_eAxc_tpl : in std_logic_vector(1 downto 0);  -- ufix2
        in_16_sym_metadata_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en15
        in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en15
        out_1_rxnat_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_rxnat_chout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_imag_rxnat_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en11
        out_3_real_rxnat_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en11
        out_4_rx_time_out_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        out_5_td_fft_in_v_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_6_td_fft_in_ch_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_7_imag_td_fft_in_d_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_7_real_td_fft_in_d_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_8_nsc_out_tpl : out std_logic_vector(15 downto 0);  -- ufix16
        out_9_size_out_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_10_td_time_out_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        out_11_fd_v_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_12_fd_c_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_13_imag_fd_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en12
        out_13_real_fd_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en12
        out_14_eAxC_tpl : out std_logic_vector(1 downto 0);  -- ufix2
        out_15_metadata_sym_out_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl : out std_logic_vector(11 downto 0);  -- ufix12
        out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl : out std_logic_vector(11 downto 0);  -- ufix12
        out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl : out std_logic_vector(15 downto 0);  -- ufix16_en15
        out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl : out std_logic_vector(15 downto 0);  -- ufix16_en15
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        in_1_fft_v_in_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_cin_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_imag_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_real_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_sync_tpl_stm : out std_logic_vector(0 downto 0);
        in_5_nsc_tpl_stm : out std_logic_vector(15 downto 0);
        in_6_size_tpl_stm : out std_logic_vector(3 downto 0);
        in_7_SFNin_tpl_stm : out std_logic_vector(63 downto 0);
        in_8_fft_gain_re_tpl_stm : out std_logic_vector(15 downto 0);
        in_9_fft_gain_im_tpl_stm : out std_logic_vector(15 downto 0);
        in_10_hcs_bypass_tpl_stm : out std_logic_vector(0 downto 0);
        in_11_fft_shift_tpl_stm : out std_logic_vector(3 downto 0);
        in_12_DC_SC_EN_tpl_stm : out std_logic_vector(0 downto 0);
        in_13_ripple_comp_en_tpl_stm : out std_logic_vector(0 downto 0);
        in_14_rc_bw_sel_tpl_stm : out std_logic_vector(0 downto 0);
        in_15_eAxc_tpl_stm : out std_logic_vector(1 downto 0);
        in_16_sym_metadata_tpl_stm : out std_logic_vector(63 downto 0);
        in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_rxnat_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_rxnat_chout_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_imag_rxnat_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_real_rxnat_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_rx_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_5_td_fft_in_v_tpl_stm : out std_logic_vector(0 downto 0);
        out_6_td_fft_in_ch_tpl_stm : out std_logic_vector(7 downto 0);
        out_7_imag_td_fft_in_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_7_real_td_fft_in_d_tpl_stm : out std_logic_vector(15 downto 0);
        out_8_nsc_out_tpl_stm : out std_logic_vector(15 downto 0);
        out_9_size_out_tpl_stm : out std_logic_vector(3 downto 0);
        out_10_td_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_11_fd_v_tpl_stm : out std_logic_vector(0 downto 0);
        out_12_fd_c_tpl_stm : out std_logic_vector(7 downto 0);
        out_13_imag_fd_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_13_real_fd_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_14_eAxC_tpl_stm : out std_logic_vector(1 downto 0);
        out_15_metadata_sym_out_tpl_stm : out std_logic_vector(63 downto 0);
        out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(11 downto 0);
        out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(11 downto 0);
        out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end component;

signal busIn_writedata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_stm : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_fft_v_in_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_cin_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_imag_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_real_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_sync_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_nsc_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_6_size_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_7_SFNin_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_8_fft_gain_re_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_9_fft_gain_im_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_10_hcs_bypass_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_11_fft_shift_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_12_DC_SC_EN_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_13_ripple_comp_en_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_14_rc_bw_sel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_15_eAxc_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_16_sym_metadata_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_rxnat_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_rxnat_chout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_imag_rxnat_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_real_rxnat_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_rx_time_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_5_td_fft_in_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_6_td_fft_in_ch_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_7_imag_td_fft_in_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_7_real_td_fft_in_d_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_8_nsc_out_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_9_size_out_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_10_td_time_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_11_fd_v_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_12_fd_c_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_13_imag_fd_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_13_real_fd_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_14_eAxC_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_15_metadata_sym_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_fft_v_in_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_cin_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_imag_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_real_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_sync_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_nsc_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_6_size_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_7_SFNin_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_8_fft_gain_re_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_9_fft_gain_im_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_10_hcs_bypass_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_11_fft_shift_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_12_DC_SC_EN_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_13_ripple_comp_en_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_14_rc_bw_sel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_15_eAxc_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal in_16_sym_metadata_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_rxnat_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_rxnat_chout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_imag_rxnat_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_real_rxnat_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_rx_time_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_5_td_fft_in_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_6_td_fft_in_ch_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_7_imag_td_fft_in_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_7_real_td_fft_in_d_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_8_nsc_out_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_9_size_out_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_10_td_time_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_11_fd_v_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_12_fd_c_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_13_imag_fd_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_13_real_fd_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_14_eAxC_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_15_metadata_sym_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkin_1_fft_v_in_tpl : process (clk, areset, in_1_fft_v_in_tpl_dut, in_1_fft_v_in_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_cin_tpl : process (clk, areset, in_2_cin_tpl_dut, in_2_cin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_imag_din_tpl : process (clk, areset, in_3_imag_din_tpl_dut, in_3_imag_din_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_real_din_tpl : process (clk, areset, in_3_real_din_tpl_dut, in_3_real_din_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_sync_tpl : process (clk, areset, in_4_sync_tpl_dut, in_4_sync_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_nsc_tpl : process (clk, areset, in_5_nsc_tpl_dut, in_5_nsc_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_6_size_tpl : process (clk, areset, in_6_size_tpl_dut, in_6_size_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_7_SFNin_tpl : process (clk, areset, in_7_SFNin_tpl_dut, in_7_SFNin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_8_fft_gain_re_tpl : process (clk, areset, in_8_fft_gain_re_tpl_dut, in_8_fft_gain_re_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_9_fft_gain_im_tpl : process (clk, areset, in_9_fft_gain_im_tpl_dut, in_9_fft_gain_im_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_10_hcs_bypass_tpl : process (clk, areset, in_10_hcs_bypass_tpl_dut, in_10_hcs_bypass_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_11_fft_shift_tpl : process (clk, areset, in_11_fft_shift_tpl_dut, in_11_fft_shift_tpl_stm)
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
checkin_15_eAxc_tpl : process (clk, areset, in_15_eAxc_tpl_dut, in_15_eAxc_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_16_sym_metadata_tpl : process (clk, areset, in_16_sym_metadata_tpl_dut, in_16_sym_metadata_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl : process (clk, areset, in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut, in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl : process (clk, areset, in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut, in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm)
begin
END PROCESS;


dut : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    in_1_fft_v_in_tpl_stm,
    in_2_cin_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_3_real_din_tpl_stm,
    in_4_sync_tpl_stm,
    in_5_nsc_tpl_stm,
    in_6_size_tpl_stm,
    in_7_SFNin_tpl_stm,
    in_8_fft_gain_re_tpl_stm,
    in_9_fft_gain_im_tpl_stm,
    in_10_hcs_bypass_tpl_stm,
    in_11_fft_shift_tpl_stm,
    in_12_DC_SC_EN_tpl_stm,
    in_13_ripple_comp_en_tpl_stm,
    in_14_rc_bw_sel_tpl_stm,
    in_15_eAxc_tpl_stm,
    in_16_sym_metadata_tpl_stm,
    in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm,
    in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm,
    out_1_rxnat_vout_tpl_dut,
    out_2_rxnat_chout_tpl_dut,
    out_3_imag_rxnat_dout_tpl_dut,
    out_3_real_rxnat_dout_tpl_dut,
    out_4_rx_time_out_tpl_dut,
    out_5_td_fft_in_v_tpl_dut,
    out_6_td_fft_in_ch_tpl_dut,
    out_7_imag_td_fft_in_d_tpl_dut,
    out_7_real_td_fft_in_d_tpl_dut,
    out_8_nsc_out_tpl_dut,
    out_9_size_out_tpl_dut,
    out_10_td_time_out_tpl_dut,
    out_11_fd_v_tpl_dut,
    out_12_fd_c_tpl_dut,
    out_13_imag_fd_q_tpl_dut,
    out_13_real_fd_q_tpl_dut,
    out_14_eAxC_tpl_dut,
    out_15_metadata_sym_out_tpl_dut,
    out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut,
    out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut,
    out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_dut,
    out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    in_1_fft_v_in_tpl_stm,
    in_2_cin_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_3_real_din_tpl_stm,
    in_4_sync_tpl_stm,
    in_5_nsc_tpl_stm,
    in_6_size_tpl_stm,
    in_7_SFNin_tpl_stm,
    in_8_fft_gain_re_tpl_stm,
    in_9_fft_gain_im_tpl_stm,
    in_10_hcs_bypass_tpl_stm,
    in_11_fft_shift_tpl_stm,
    in_12_DC_SC_EN_tpl_stm,
    in_13_ripple_comp_en_tpl_stm,
    in_14_rc_bw_sel_tpl_stm,
    in_15_eAxc_tpl_stm,
    in_16_sym_metadata_tpl_stm,
    in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm,
    in_sharedMemWireData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm,
    out_1_rxnat_vout_tpl_stm,
    out_2_rxnat_chout_tpl_stm,
    out_3_imag_rxnat_dout_tpl_stm,
    out_3_real_rxnat_dout_tpl_stm,
    out_4_rx_time_out_tpl_stm,
    out_5_td_fft_in_v_tpl_stm,
    out_6_td_fft_in_ch_tpl_stm,
    out_7_imag_td_fft_in_d_tpl_stm,
    out_7_real_td_fft_in_d_tpl_stm,
    out_8_nsc_out_tpl_stm,
    out_9_size_out_tpl_stm,
    out_10_td_time_out_tpl_stm,
    out_11_fd_v_tpl_stm,
    out_12_fd_c_tpl_stm,
    out_13_imag_fd_q_tpl_stm,
    out_13_real_fd_q_tpl_stm,
    out_14_eAxC_tpl_stm,
    out_15_metadata_sym_out_tpl_stm,
    out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm,
    out_sharedMemPortAddr_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm,
    out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_100MHz_x_tpl_stm,
    out_sharedMemPortData_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_BRandSCSelect1_Transpose_ripple_comp_LookupTable_60MHz_x_tpl_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
