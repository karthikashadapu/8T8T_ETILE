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

-- VHDL created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_atb is
end;

architecture normal of ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_atb is

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst is
    port (
        in_1_vin_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_chin_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_real_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_3_imag_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_FFTSize_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_5_cplen_tpl : in std_logic_vector(10 downto 0);  -- ufix11
        in_6_nprb_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        out_3_real_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_3_imag_q_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_2_cout_tpl : out std_logic_vector(1 downto 0);  -- ufix2
        out_1_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_stm is
    port (
        in_1_vin_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_chin_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_real_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_imag_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_FFTSize_tpl_stm : out std_logic_vector(3 downto 0);
        in_5_cplen_tpl_stm : out std_logic_vector(10 downto 0);
        in_6_nprb_tpl_stm : out std_logic_vector(11 downto 0);
        out_3_real_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_imag_q_tpl_stm : out std_logic_vector(15 downto 0);
        out_2_cout_tpl_stm : out std_logic_vector(1 downto 0);
        out_1_vout_tpl_stm : out std_logic_vector(0 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_vin_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_chin_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_imag_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_FFTSize_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_cplen_tpl_stm : STD_LOGIC_VECTOR (10 downto 0);
signal in_6_nprb_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_3_real_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_q_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_cout_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_1_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_1_vin_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_chin_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_imag_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_FFTSize_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_cplen_tpl_dut : STD_LOGIC_VECTOR (10 downto 0);
signal in_6_nprb_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_3_real_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_q_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_2_cout_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_1_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- General Purpose data in real output
checkGPIn_cunroll_x : process (clk, areset, in_1_vin_tpl_dut, in_1_vin_tpl_stm, in_2_chin_tpl_dut, in_2_chin_tpl_stm, in_3_real_din_tpl_dut, in_3_real_din_tpl_stm, in_3_imag_din_tpl_dut, in_3_imag_din_tpl_stm, in_4_FFTSize_tpl_dut, in_4_FFTSize_tpl_stm, in_5_cplen_tpl_dut, in_5_cplen_tpl_stm, in_6_nprb_tpl_dut, in_6_nprb_tpl_stm)
begin
END PROCESS;


-- General Purpose data out check
checkGPOut_cunroll_x : process (clk, areset)
variable mismatch_out_3_real_q_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_imag_q_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_cout_tpl : BOOLEAN := FALSE;
variable mismatch_out_1_vout_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_3_real_q_tpl := FALSE;
        mismatch_out_3_imag_q_tpl := FALSE;
        mismatch_out_2_cout_tpl := FALSE;
        mismatch_out_1_vout_tpl := FALSE;
        IF ( (out_3_real_q_tpl_dut /= out_3_real_q_tpl_stm)) THEN
            mismatch_out_3_real_q_tpl := TRUE;
            report "Mismatch on device output pin out_3_real_q_tpl" severity Warning;
        END IF;
        IF ( (out_3_imag_q_tpl_dut /= out_3_imag_q_tpl_stm)) THEN
            mismatch_out_3_imag_q_tpl := TRUE;
            report "Mismatch on device output pin out_3_imag_q_tpl" severity Warning;
        END IF;
        IF ( (out_2_cout_tpl_dut /= out_2_cout_tpl_stm)) THEN
            mismatch_out_2_cout_tpl := TRUE;
            report "Mismatch on device output pin out_2_cout_tpl" severity Warning;
        END IF;
        IF ( (out_1_vout_tpl_dut /= out_1_vout_tpl_stm)) THEN
            mismatch_out_1_vout_tpl := TRUE;
            report "Mismatch on device output pin out_1_vout_tpl" severity Warning;
        END IF;
        IF (mismatch_out_3_real_q_tpl = TRUE or mismatch_out_3_imag_q_tpl = TRUE or mismatch_out_2_cout_tpl = TRUE or mismatch_out_1_vout_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


dut : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst port map (
    in_1_vin_tpl_stm,
    in_2_chin_tpl_stm,
    in_3_real_din_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_4_FFTSize_tpl_stm,
    in_5_cplen_tpl_stm,
    in_6_nprb_tpl_stm,
    out_3_real_q_tpl_dut,
    out_3_imag_q_tpl_dut,
    out_2_cout_tpl_dut,
    out_1_vout_tpl_dut,
        clk,
        areset
);

sim : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_B2S_B2S_Inst_stm port map (
    in_1_vin_tpl_stm,
    in_2_chin_tpl_stm,
    in_3_real_din_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_4_FFTSize_tpl_stm,
    in_5_cplen_tpl_stm,
    in_6_nprb_tpl_stm,
    out_3_real_q_tpl_stm,
    out_3_imag_q_tpl_stm,
    out_2_cout_tpl_stm,
    out_1_vout_tpl_stm,
        clk,
        areset
);

end normal;
