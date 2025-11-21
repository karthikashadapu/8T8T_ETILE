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

-- VHDL created from LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5
-- VHDL created on Fri Dec  6 17:01:04 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_atb is
end;

architecture normal of LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_atb is

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5 is
    port (
        in_1_vin_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_chin_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_real_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_3_imag_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_cp_start_tpl : in std_logic_vector(21 downto 0);  -- ufix22
        in_5_gt_end_tpl : in std_logic_vector(22 downto 0);  -- ufix23
        in_6_filt_flush_en_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        out_1_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_cout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_real_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_3_imag_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_4_filt_flush_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_5_sync_out_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_stm is
    port (
        in_1_vin_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_chin_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_real_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_imag_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_cp_start_tpl_stm : out std_logic_vector(21 downto 0);
        in_5_gt_end_tpl_stm : out std_logic_vector(22 downto 0);
        in_6_filt_flush_en_tpl_stm : out std_logic_vector(0 downto 0);
        out_1_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_cout_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_real_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_imag_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_filt_flush_tpl_stm : out std_logic_vector(0 downto 0);
        out_5_sync_out_tpl_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_vin_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_chin_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_imag_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_cp_start_tpl_stm : STD_LOGIC_VECTOR (21 downto 0);
signal in_5_gt_end_tpl_stm : STD_LOGIC_VECTOR (22 downto 0);
signal in_6_filt_flush_en_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_cout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_real_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_filt_flush_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_sync_out_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_1_vin_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_chin_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_imag_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_cp_start_tpl_dut : STD_LOGIC_VECTOR (21 downto 0);
signal in_5_gt_end_tpl_dut : STD_LOGIC_VECTOR (22 downto 0);
signal in_6_filt_flush_en_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_cout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_real_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_filt_flush_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_5_sync_out_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_cunroll_x : process (clk, areset, in_3_real_din_tpl_dut, in_3_real_din_tpl_stm, in_3_imag_din_tpl_dut, in_3_imag_din_tpl_stm, in_4_cp_start_tpl_dut, in_4_cp_start_tpl_stm, in_5_gt_end_tpl_dut, in_5_gt_end_tpl_stm, in_6_filt_flush_en_tpl_dut, in_6_filt_flush_en_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut_cunroll_x : process (clk, areset, out_3_real_dout_tpl_dut, out_3_real_dout_tpl_stm, out_3_imag_dout_tpl_dut, out_3_imag_dout_tpl_stm, out_4_filt_flush_tpl_dut, out_4_filt_flush_tpl_stm, out_5_sync_out_tpl_dut, out_5_sync_out_tpl_stm)
variable mismatch_out_1_vout_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_cout_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_real_dout_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_imag_dout_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_filt_flush_tpl : BOOLEAN := FALSE;
variable mismatch_out_5_sync_out_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_vout_tpl := FALSE;
        mismatch_out_2_cout_tpl := FALSE;
        mismatch_out_3_real_dout_tpl := FALSE;
        mismatch_out_3_imag_dout_tpl := FALSE;
        mismatch_out_4_filt_flush_tpl := FALSE;
        mismatch_out_5_sync_out_tpl := FALSE;
        IF ( (out_1_vout_tpl_dut /= out_1_vout_tpl_stm)) THEN
            mismatch_out_1_vout_tpl := TRUE;
            report "mismatch in out_1_vout_tpl signal" severity Failure;
        END IF;
        IF ((out_1_vout_tpl_dut = "1")) THEN
            IF ( (out_2_cout_tpl_dut /= out_2_cout_tpl_stm)) THEN
                mismatch_out_2_cout_tpl := TRUE;
                report "mismatch in out_2_cout_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_real_dout_tpl_dut /= out_3_real_dout_tpl_stm)) THEN
                mismatch_out_3_real_dout_tpl := TRUE;
                report "mismatch in out_3_real_dout_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_imag_dout_tpl_dut /= out_3_imag_dout_tpl_stm)) THEN
                mismatch_out_3_imag_dout_tpl := TRUE;
                report "mismatch in out_3_imag_dout_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_filt_flush_tpl_dut /= out_4_filt_flush_tpl_stm)) THEN
                mismatch_out_4_filt_flush_tpl := TRUE;
                report "mismatch in out_4_filt_flush_tpl signal" severity Warning;
            END IF;
            IF ( (out_5_sync_out_tpl_dut /= out_5_sync_out_tpl_stm)) THEN
                mismatch_out_5_sync_out_tpl := TRUE;
                report "mismatch in out_5_sync_out_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_vout_tpl = TRUE or mismatch_out_2_cout_tpl = TRUE or mismatch_out_3_real_dout_tpl = TRUE or mismatch_out_3_imag_dout_tpl = TRUE or mismatch_out_4_filt_flush_tpl = TRUE or mismatch_out_5_sync_out_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5 port map (
    in_1_vin_tpl_stm,
    in_2_chin_tpl_stm,
    in_3_real_din_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_4_cp_start_tpl_stm,
    in_5_gt_end_tpl_stm,
    in_6_filt_flush_en_tpl_stm,
    out_1_vout_tpl_dut,
    out_2_cout_tpl_dut,
    out_3_real_dout_tpl_dut,
    out_3_imag_dout_tpl_dut,
    out_4_filt_flush_tpl_dut,
    out_5_sync_out_tpl_dut,
        clk,
        areset
);

sim : LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REMOVAL_RemoveCP5_stm port map (
    in_1_vin_tpl_stm,
    in_2_chin_tpl_stm,
    in_3_real_din_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_4_cp_start_tpl_stm,
    in_5_gt_end_tpl_stm,
    in_6_filt_flush_en_tpl_stm,
    out_1_vout_tpl_stm,
    out_2_cout_tpl_stm,
    out_3_real_dout_tpl_stm,
    out_3_imag_dout_tpl_stm,
    out_4_filt_flush_tpl_stm,
    out_5_sync_out_tpl_stm,
        clk,
        areset
);

end normal;
