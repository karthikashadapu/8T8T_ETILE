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

-- VHDL created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core
-- VHDL created on Fri Dec  6 17:01:04 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_atb is
end;

architecture normal of LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_atb is

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(1 downto 0);  -- ufix2
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        in_1_imag_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_1_real_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_2_vin_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_3_cin_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_4_TimeRef_tpl : in std_logic_vector(31 downto 0);  -- ufix32
        in_5_cp_start_tpl : in std_logic_vector(21 downto 0);  -- ufix22
        in_6_gt_end_tpl : in std_logic_vector(22 downto 0);  -- ufix23
        in_7_prach_outstart_tpl : in std_logic_vector(6 downto 0);  -- ufix7
        in_8_prach_outend_tpl : in std_logic_vector(9 downto 0);  -- ufix10
        in_9_filt_flush_en_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_10_imag_gainin_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_10_real_gainin_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_11_ch0_info_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_12_ch1_info_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_13_ch2_info_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_14_ch3_info_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        out_1_imag_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en8
        out_1_real_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en8
        out_2_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_3_cout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_4_TimeReference_tpl : out std_logic_vector(31 downto 0);  -- ufix32
        out_5_ch_info_tpl : out std_logic_vector(15 downto 0);  -- ufix16
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(1 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        in_1_imag_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_1_real_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_2_vin_tpl_stm : out std_logic_vector(0 downto 0);
        in_3_cin_tpl_stm : out std_logic_vector(7 downto 0);
        in_4_TimeRef_tpl_stm : out std_logic_vector(31 downto 0);
        in_5_cp_start_tpl_stm : out std_logic_vector(21 downto 0);
        in_6_gt_end_tpl_stm : out std_logic_vector(22 downto 0);
        in_7_prach_outstart_tpl_stm : out std_logic_vector(6 downto 0);
        in_8_prach_outend_tpl_stm : out std_logic_vector(9 downto 0);
        in_9_filt_flush_en_tpl_stm : out std_logic_vector(0 downto 0);
        in_10_imag_gainin_tpl_stm : out std_logic_vector(15 downto 0);
        in_10_real_gainin_tpl_stm : out std_logic_vector(15 downto 0);
        in_11_ch0_info_tpl_stm : out std_logic_vector(15 downto 0);
        in_12_ch1_info_tpl_stm : out std_logic_vector(15 downto 0);
        in_13_ch2_info_tpl_stm : out std_logic_vector(15 downto 0);
        in_14_ch3_info_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_imag_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_1_real_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_3_cout_tpl_stm : out std_logic_vector(7 downto 0);
        out_4_TimeReference_tpl_stm : out std_logic_vector(31 downto 0);
        out_5_ch_info_tpl_stm : out std_logic_vector(15 downto 0);
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
signal in_1_imag_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_real_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_vin_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_cin_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_TimeRef_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal in_5_cp_start_tpl_stm : STD_LOGIC_VECTOR (21 downto 0);
signal in_6_gt_end_tpl_stm : STD_LOGIC_VECTOR (22 downto 0);
signal in_7_prach_outstart_tpl_stm : STD_LOGIC_VECTOR (6 downto 0);
signal in_8_prach_outend_tpl_stm : STD_LOGIC_VECTOR (9 downto 0);
signal in_9_filt_flush_en_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_10_imag_gainin_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_10_real_gainin_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_11_ch0_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_12_ch1_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_13_ch2_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_14_ch3_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_TimeReference_tpl_stm : STD_LOGIC_VECTOR (31 downto 0);
signal out_5_ch_info_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (1 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_imag_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_1_real_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_2_vin_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_3_cin_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_4_TimeRef_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_5_cp_start_tpl_dut : STD_LOGIC_VECTOR (21 downto 0);
signal in_6_gt_end_tpl_dut : STD_LOGIC_VECTOR (22 downto 0);
signal in_7_prach_outstart_tpl_dut : STD_LOGIC_VECTOR (6 downto 0);
signal in_8_prach_outend_tpl_dut : STD_LOGIC_VECTOR (9 downto 0);
signal in_9_filt_flush_en_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_10_imag_gainin_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_10_real_gainin_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_11_ch0_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_12_ch1_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_13_ch2_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_14_ch3_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_imag_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_1_real_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_3_cout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_4_TimeReference_tpl_dut : STD_LOGIC_VECTOR (31 downto 0);
signal out_5_ch_info_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkin_1_imag_din_tpl : process (clk, areset, in_1_imag_din_tpl_dut, in_1_imag_din_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_1_real_din_tpl : process (clk, areset, in_1_real_din_tpl_dut, in_1_real_din_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_2_vin_tpl : process (clk, areset, in_2_vin_tpl_dut, in_2_vin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_3_cin_tpl : process (clk, areset, in_3_cin_tpl_dut, in_3_cin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_4_TimeRef_tpl : process (clk, areset, in_4_TimeRef_tpl_dut, in_4_TimeRef_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_5_cp_start_tpl : process (clk, areset, in_5_cp_start_tpl_dut, in_5_cp_start_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_6_gt_end_tpl : process (clk, areset, in_6_gt_end_tpl_dut, in_6_gt_end_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_7_prach_outstart_tpl : process (clk, areset, in_7_prach_outstart_tpl_dut, in_7_prach_outstart_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_8_prach_outend_tpl : process (clk, areset, in_8_prach_outend_tpl_dut, in_8_prach_outend_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_9_filt_flush_en_tpl : process (clk, areset, in_9_filt_flush_en_tpl_dut, in_9_filt_flush_en_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_10_imag_gainin_tpl : process (clk, areset, in_10_imag_gainin_tpl_dut, in_10_imag_gainin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_10_real_gainin_tpl : process (clk, areset, in_10_real_gainin_tpl_dut, in_10_real_gainin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_11_ch0_info_tpl : process (clk, areset, in_11_ch0_info_tpl_dut, in_11_ch0_info_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_12_ch1_info_tpl : process (clk, areset, in_12_ch1_info_tpl_dut, in_12_ch1_info_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_13_ch2_info_tpl : process (clk, areset, in_13_ch2_info_tpl_dut, in_13_ch2_info_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_14_ch3_info_tpl : process (clk, areset, in_14_ch3_info_tpl_dut, in_14_ch3_info_tpl_stm)
begin
END PROCESS;


dut : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    in_1_imag_din_tpl_stm,
    in_1_real_din_tpl_stm,
    in_2_vin_tpl_stm,
    in_3_cin_tpl_stm,
    in_4_TimeRef_tpl_stm,
    in_5_cp_start_tpl_stm,
    in_6_gt_end_tpl_stm,
    in_7_prach_outstart_tpl_stm,
    in_8_prach_outend_tpl_stm,
    in_9_filt_flush_en_tpl_stm,
    in_10_imag_gainin_tpl_stm,
    in_10_real_gainin_tpl_stm,
    in_11_ch0_info_tpl_stm,
    in_12_ch1_info_tpl_stm,
    in_13_ch2_info_tpl_stm,
    in_14_ch3_info_tpl_stm,
    out_1_imag_dout_tpl_dut,
    out_1_real_dout_tpl_dut,
    out_2_vout_tpl_dut,
    out_3_cout_tpl_dut,
    out_4_TimeReference_tpl_dut,
    out_5_ch_info_tpl_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    in_1_imag_din_tpl_stm,
    in_1_real_din_tpl_stm,
    in_2_vin_tpl_stm,
    in_3_cin_tpl_stm,
    in_4_TimeRef_tpl_stm,
    in_5_cp_start_tpl_stm,
    in_6_gt_end_tpl_stm,
    in_7_prach_outstart_tpl_stm,
    in_8_prach_outend_tpl_stm,
    in_9_filt_flush_en_tpl_stm,
    in_10_imag_gainin_tpl_stm,
    in_10_real_gainin_tpl_stm,
    in_11_ch0_info_tpl_stm,
    in_12_ch1_info_tpl_stm,
    in_13_ch2_info_tpl_stm,
    in_14_ch3_info_tpl_stm,
    out_1_imag_dout_tpl_stm,
    out_1_real_dout_tpl_stm,
    out_2_vout_tpl_stm,
    out_3_cout_tpl_stm,
    out_4_TimeReference_tpl_stm,
    out_5_ch_info_tpl_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
