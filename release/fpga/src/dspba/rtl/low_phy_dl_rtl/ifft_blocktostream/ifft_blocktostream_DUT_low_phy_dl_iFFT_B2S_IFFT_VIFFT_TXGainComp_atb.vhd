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

-- VHDL created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_atb is
end;

architecture normal of ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_atb is

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp is
    port (
        in_1_vin_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_chin_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_real_din_tpl : in std_logic_vector(28 downto 0);  -- sfix29_en13
        in_3_imag_din_tpl : in std_logic_vector(28 downto 0);  -- sfix29_en13
        in_4_size_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_5_cplen_tpl : in std_logic_vector(10 downto 0);  -- ufix11
        in_6_ifft_gain_re_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_7_ifft_gain_im_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_8_ifft_shift_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_9_ifft_mux_const_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_10_muxsel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        out_1_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_chout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_real_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_3_imag_dout_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_4_size_out_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_5_cplen_out_tpl : out std_logic_vector(10 downto 0);  -- ufix11
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_stm is
    port (
        in_1_vin_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_chin_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_real_din_tpl_stm : out std_logic_vector(28 downto 0);
        in_3_imag_din_tpl_stm : out std_logic_vector(28 downto 0);
        in_4_size_tpl_stm : out std_logic_vector(3 downto 0);
        in_5_cplen_tpl_stm : out std_logic_vector(10 downto 0);
        in_6_ifft_gain_re_tpl_stm : out std_logic_vector(15 downto 0);
        in_7_ifft_gain_im_tpl_stm : out std_logic_vector(15 downto 0);
        in_8_ifft_shift_tpl_stm : out std_logic_vector(3 downto 0);
        in_9_ifft_mux_const_tpl_stm : out std_logic_vector(15 downto 0);
        in_10_muxsel_tpl_stm : out std_logic_vector(0 downto 0);
        out_1_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_chout_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_real_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_imag_dout_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_size_out_tpl_stm : out std_logic_vector(3 downto 0);
        out_5_cplen_out_tpl_stm : out std_logic_vector(10 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_vin_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_chin_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_din_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal in_3_imag_din_tpl_stm : STD_LOGIC_VECTOR (28 downto 0);
signal in_4_size_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_cplen_tpl_stm : STD_LOGIC_VECTOR (10 downto 0);
signal in_6_ifft_gain_re_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_ifft_gain_im_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_8_ifft_shift_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_9_ifft_mux_const_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_10_muxsel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_chout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_real_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_dout_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_size_out_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_5_cplen_out_tpl_stm : STD_LOGIC_VECTOR (10 downto 0);
signal in_1_vin_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_chin_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_din_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal in_3_imag_din_tpl_dut : STD_LOGIC_VECTOR (28 downto 0);
signal in_4_size_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_cplen_tpl_dut : STD_LOGIC_VECTOR (10 downto 0);
signal in_6_ifft_gain_re_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_ifft_gain_im_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_8_ifft_shift_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_9_ifft_mux_const_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_10_muxsel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_1_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_chout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_real_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_dout_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_size_out_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_5_cplen_out_tpl_dut : STD_LOGIC_VECTOR (10 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_cunroll_x : process (clk, areset, in_3_real_din_tpl_dut, in_3_real_din_tpl_stm, in_3_imag_din_tpl_dut, in_3_imag_din_tpl_stm, in_4_size_tpl_dut, in_4_size_tpl_stm, in_5_cplen_tpl_dut, in_5_cplen_tpl_stm, in_6_ifft_gain_re_tpl_dut, in_6_ifft_gain_re_tpl_stm, in_7_ifft_gain_im_tpl_dut, in_7_ifft_gain_im_tpl_stm, in_8_ifft_shift_tpl_dut, in_8_ifft_shift_tpl_stm, in_9_ifft_mux_const_tpl_dut, in_9_ifft_mux_const_tpl_stm, in_10_muxsel_tpl_dut, in_10_muxsel_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut_cunroll_x : process (clk, areset, out_3_real_dout_tpl_dut, out_3_real_dout_tpl_stm, out_3_imag_dout_tpl_dut, out_3_imag_dout_tpl_stm, out_4_size_out_tpl_dut, out_4_size_out_tpl_stm, out_5_cplen_out_tpl_dut, out_5_cplen_out_tpl_stm)
variable mismatch_out_1_vout_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_chout_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_real_dout_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_imag_dout_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_size_out_tpl : BOOLEAN := FALSE;
variable mismatch_out_5_cplen_out_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_vout_tpl := FALSE;
        mismatch_out_2_chout_tpl := FALSE;
        mismatch_out_3_real_dout_tpl := FALSE;
        mismatch_out_3_imag_dout_tpl := FALSE;
        mismatch_out_4_size_out_tpl := FALSE;
        mismatch_out_5_cplen_out_tpl := FALSE;
        IF ( (out_1_vout_tpl_dut /= out_1_vout_tpl_stm)) THEN
            mismatch_out_1_vout_tpl := TRUE;
            report "mismatch in out_1_vout_tpl signal" severity Failure;
        END IF;
        IF ((out_1_vout_tpl_dut = "1")) THEN
            IF ( (out_2_chout_tpl_dut /= out_2_chout_tpl_stm)) THEN
                mismatch_out_2_chout_tpl := TRUE;
                report "mismatch in out_2_chout_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_real_dout_tpl_dut /= out_3_real_dout_tpl_stm)) THEN
                mismatch_out_3_real_dout_tpl := TRUE;
                report "mismatch in out_3_real_dout_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_imag_dout_tpl_dut /= out_3_imag_dout_tpl_stm)) THEN
                mismatch_out_3_imag_dout_tpl := TRUE;
                report "mismatch in out_3_imag_dout_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_size_out_tpl_dut /= out_4_size_out_tpl_stm)) THEN
                mismatch_out_4_size_out_tpl := TRUE;
                report "mismatch in out_4_size_out_tpl signal" severity Warning;
            END IF;
            IF ( (out_5_cplen_out_tpl_dut /= out_5_cplen_out_tpl_stm)) THEN
                mismatch_out_5_cplen_out_tpl := TRUE;
                report "mismatch in out_5_cplen_out_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_vout_tpl = TRUE or mismatch_out_2_chout_tpl = TRUE or mismatch_out_3_real_dout_tpl = TRUE or mismatch_out_3_imag_dout_tpl = TRUE or mismatch_out_4_size_out_tpl = TRUE or mismatch_out_5_cplen_out_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp port map (
    in_1_vin_tpl_stm,
    in_2_chin_tpl_stm,
    in_3_real_din_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_4_size_tpl_stm,
    in_5_cplen_tpl_stm,
    in_6_ifft_gain_re_tpl_stm,
    in_7_ifft_gain_im_tpl_stm,
    in_8_ifft_shift_tpl_stm,
    in_9_ifft_mux_const_tpl_stm,
    in_10_muxsel_tpl_stm,
    out_1_vout_tpl_dut,
    out_2_chout_tpl_dut,
    out_3_real_dout_tpl_dut,
    out_3_imag_dout_tpl_dut,
    out_4_size_out_tpl_dut,
    out_5_cplen_out_tpl_dut,
        clk,
        areset
);

sim : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_VIFFT_TXGainComp_stm port map (
    in_1_vin_tpl_stm,
    in_2_chin_tpl_stm,
    in_3_real_din_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_4_size_tpl_stm,
    in_5_cplen_tpl_stm,
    in_6_ifft_gain_re_tpl_stm,
    in_7_ifft_gain_im_tpl_stm,
    in_8_ifft_shift_tpl_stm,
    in_9_ifft_mux_const_tpl_stm,
    in_10_muxsel_tpl_stm,
    out_1_vout_tpl_stm,
    out_2_chout_tpl_stm,
    out_3_real_dout_tpl_stm,
    out_3_imag_dout_tpl_stm,
    out_4_size_out_tpl_stm,
    out_5_cplen_out_tpl_stm,
        clk,
        areset
);

end normal;
