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

-- VHDL created from ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch
-- VHDL created on Thu Jun 12 21:17:48 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb is
end;

architecture normal of ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_atb is

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch is
    port (
        in_1_valid_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_ch_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_real_data_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_3_imag_data_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_FFTSize_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_5_NSubCarr_tpl : in std_logic_vector(11 downto 0);  -- ufix12
        in_6_cplen_tpl : in std_logic_vector(10 downto 0);  -- ufix11
        in_7_DC_SC_EN1_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_8_iftgain_real_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_9_ifftgain_imag_tpl : in std_logic_vector(15 downto 0);  -- ufix16_en14
        in_10_ifftshift_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_11_ifft_mux_const_data_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en15
        in_12_muxsel_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_13_time_in_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        out_1_qvalid_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_qchannel_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_real_qdata_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_3_imag_qdata_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en14
        out_4_qfftsize_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_5_q_nprb_tpl : out std_logic_vector(11 downto 0);  -- ufix12
        out_6_qcplen_tpl : out std_logic_vector(10 downto 0);  -- ufix11
        out_7_q_dc_sc_en_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_8_qfft_gain_real_tpl : out std_logic_vector(15 downto 0);  -- ufix16_en14
        out_9_qf_ift_gain_imag_tpl : out std_logic_vector(15 downto 0);  -- ufix16_en14
        out_10_q_ifftshift_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_11_q_ifft_mux_const_data_tpl : out std_logic_vector(15 downto 0);  -- sfix16_en15
        out_12_q_muxsel_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_13_time_out_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        clk : in std_logic;
        areset : in std_logic
    );
end component;

component ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_stm is
    port (
        in_1_valid_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_ch_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_real_data_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_imag_data_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_FFTSize_tpl_stm : out std_logic_vector(3 downto 0);
        in_5_NSubCarr_tpl_stm : out std_logic_vector(11 downto 0);
        in_6_cplen_tpl_stm : out std_logic_vector(10 downto 0);
        in_7_DC_SC_EN1_tpl_stm : out std_logic_vector(0 downto 0);
        in_8_iftgain_real_tpl_stm : out std_logic_vector(15 downto 0);
        in_9_ifftgain_imag_tpl_stm : out std_logic_vector(15 downto 0);
        in_10_ifftshift_tpl_stm : out std_logic_vector(3 downto 0);
        in_11_ifft_mux_const_data_tpl_stm : out std_logic_vector(15 downto 0);
        in_12_muxsel_tpl_stm : out std_logic_vector(0 downto 0);
        in_13_time_in_tpl_stm : out std_logic_vector(63 downto 0);
        out_1_qvalid_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_qchannel_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_real_qdata_tpl_stm : out std_logic_vector(15 downto 0);
        out_3_imag_qdata_tpl_stm : out std_logic_vector(15 downto 0);
        out_4_qfftsize_tpl_stm : out std_logic_vector(3 downto 0);
        out_5_q_nprb_tpl_stm : out std_logic_vector(11 downto 0);
        out_6_qcplen_tpl_stm : out std_logic_vector(10 downto 0);
        out_7_q_dc_sc_en_tpl_stm : out std_logic_vector(0 downto 0);
        out_8_qfft_gain_real_tpl_stm : out std_logic_vector(15 downto 0);
        out_9_qf_ift_gain_imag_tpl_stm : out std_logic_vector(15 downto 0);
        out_10_q_ifftshift_tpl_stm : out std_logic_vector(3 downto 0);
        out_11_q_ifft_mux_const_data_tpl_stm : out std_logic_vector(15 downto 0);
        out_12_q_muxsel_tpl_stm : out std_logic_vector(0 downto 0);
        out_13_time_out_tpl_stm : out std_logic_vector(63 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end component;

signal in_1_valid_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_ch_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_data_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_imag_data_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_FFTSize_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_NSubCarr_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal in_6_cplen_tpl_stm : STD_LOGIC_VECTOR (10 downto 0);
signal in_7_DC_SC_EN1_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_8_iftgain_real_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_9_ifftgain_imag_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_10_ifftshift_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_11_ifft_mux_const_data_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_12_muxsel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_13_time_in_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_1_qvalid_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qchannel_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_real_qdata_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_qdata_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_qfftsize_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_5_q_nprb_tpl_stm : STD_LOGIC_VECTOR (11 downto 0);
signal out_6_qcplen_tpl_stm : STD_LOGIC_VECTOR (10 downto 0);
signal out_7_q_dc_sc_en_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_8_qfft_gain_real_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_9_qf_ift_gain_imag_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_10_q_ifftshift_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_11_q_ifft_mux_const_data_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_12_q_muxsel_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_13_time_out_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_1_valid_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_ch_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_real_data_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_imag_data_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_FFTSize_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_5_NSubCarr_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal in_6_cplen_tpl_dut : STD_LOGIC_VECTOR (10 downto 0);
signal in_7_DC_SC_EN1_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_8_iftgain_real_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_9_ifftgain_imag_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_10_ifftshift_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_11_ifft_mux_const_data_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_12_muxsel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_13_time_in_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_1_qvalid_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_qchannel_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_real_qdata_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_3_imag_qdata_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_4_qfftsize_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_5_q_nprb_tpl_dut : STD_LOGIC_VECTOR (11 downto 0);
signal out_6_qcplen_tpl_dut : STD_LOGIC_VECTOR (10 downto 0);
signal out_7_q_dc_sc_en_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_8_qfft_gain_real_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_9_qf_ift_gain_imag_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_10_q_ifftshift_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_11_q_ifft_mux_const_data_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_12_q_muxsel_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_13_time_out_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;

begin

-- Channelized data in real output
checkChannelIn_cunroll_x : process (clk, areset, in_3_real_data_tpl_dut, in_3_real_data_tpl_stm, in_3_imag_data_tpl_dut, in_3_imag_data_tpl_stm, in_4_FFTSize_tpl_dut, in_4_FFTSize_tpl_stm, in_5_NSubCarr_tpl_dut, in_5_NSubCarr_tpl_stm, in_6_cplen_tpl_dut, in_6_cplen_tpl_stm, in_7_DC_SC_EN1_tpl_dut, in_7_DC_SC_EN1_tpl_stm, in_8_iftgain_real_tpl_dut, in_8_iftgain_real_tpl_stm, in_9_ifftgain_imag_tpl_dut, in_9_ifftgain_imag_tpl_stm, in_10_ifftshift_tpl_dut, in_10_ifftshift_tpl_stm, in_11_ifft_mux_const_data_tpl_dut, in_11_ifft_mux_const_data_tpl_stm, in_12_muxsel_tpl_dut, in_12_muxsel_tpl_stm, in_13_time_in_tpl_dut, in_13_time_in_tpl_stm)
begin
END PROCESS;


-- Channelized data out check
checkChannelOut_cunroll_x : process (clk, areset, out_3_real_qdata_tpl_dut, out_3_real_qdata_tpl_stm, out_3_imag_qdata_tpl_dut, out_3_imag_qdata_tpl_stm, out_4_qfftsize_tpl_dut, out_4_qfftsize_tpl_stm, out_5_q_nprb_tpl_dut, out_5_q_nprb_tpl_stm, out_6_qcplen_tpl_dut, out_6_qcplen_tpl_stm, out_7_q_dc_sc_en_tpl_dut, out_7_q_dc_sc_en_tpl_stm, out_8_qfft_gain_real_tpl_dut, out_8_qfft_gain_real_tpl_stm, out_9_qf_ift_gain_imag_tpl_dut, out_9_qf_ift_gain_imag_tpl_stm, out_10_q_ifftshift_tpl_dut, out_10_q_ifftshift_tpl_stm, out_11_q_ifft_mux_const_data_tpl_dut, out_11_q_ifft_mux_const_data_tpl_stm, out_12_q_muxsel_tpl_dut, out_12_q_muxsel_tpl_stm, out_13_time_out_tpl_dut, out_13_time_out_tpl_stm)
variable mismatch_out_1_qvalid_tpl : BOOLEAN := FALSE;
variable mismatch_out_2_qchannel_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_real_qdata_tpl : BOOLEAN := FALSE;
variable mismatch_out_3_imag_qdata_tpl : BOOLEAN := FALSE;
variable mismatch_out_4_qfftsize_tpl : BOOLEAN := FALSE;
variable mismatch_out_5_q_nprb_tpl : BOOLEAN := FALSE;
variable mismatch_out_6_qcplen_tpl : BOOLEAN := FALSE;
variable mismatch_out_7_q_dc_sc_en_tpl : BOOLEAN := FALSE;
variable mismatch_out_8_qfft_gain_real_tpl : BOOLEAN := FALSE;
variable mismatch_out_9_qf_ift_gain_imag_tpl : BOOLEAN := FALSE;
variable mismatch_out_10_q_ifftshift_tpl : BOOLEAN := FALSE;
variable mismatch_out_11_q_ifft_mux_const_data_tpl : BOOLEAN := FALSE;
variable mismatch_out_12_q_muxsel_tpl : BOOLEAN := FALSE;
variable mismatch_out_13_time_out_tpl : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_out_1_qvalid_tpl := FALSE;
        mismatch_out_2_qchannel_tpl := FALSE;
        mismatch_out_3_real_qdata_tpl := FALSE;
        mismatch_out_3_imag_qdata_tpl := FALSE;
        mismatch_out_4_qfftsize_tpl := FALSE;
        mismatch_out_5_q_nprb_tpl := FALSE;
        mismatch_out_6_qcplen_tpl := FALSE;
        mismatch_out_7_q_dc_sc_en_tpl := FALSE;
        mismatch_out_8_qfft_gain_real_tpl := FALSE;
        mismatch_out_9_qf_ift_gain_imag_tpl := FALSE;
        mismatch_out_10_q_ifftshift_tpl := FALSE;
        mismatch_out_11_q_ifft_mux_const_data_tpl := FALSE;
        mismatch_out_12_q_muxsel_tpl := FALSE;
        mismatch_out_13_time_out_tpl := FALSE;
        IF ( (out_1_qvalid_tpl_dut /= out_1_qvalid_tpl_stm)) THEN
            mismatch_out_1_qvalid_tpl := TRUE;
            report "mismatch in out_1_qvalid_tpl signal" severity Failure;
        END IF;
        IF ((out_1_qvalid_tpl_dut = "1")) THEN
            IF ( (out_2_qchannel_tpl_dut /= out_2_qchannel_tpl_stm)) THEN
                mismatch_out_2_qchannel_tpl := TRUE;
                report "mismatch in out_2_qchannel_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_real_qdata_tpl_dut /= out_3_real_qdata_tpl_stm)) THEN
                mismatch_out_3_real_qdata_tpl := TRUE;
                report "mismatch in out_3_real_qdata_tpl signal" severity Warning;
            END IF;
            IF ( (out_3_imag_qdata_tpl_dut /= out_3_imag_qdata_tpl_stm)) THEN
                mismatch_out_3_imag_qdata_tpl := TRUE;
                report "mismatch in out_3_imag_qdata_tpl signal" severity Warning;
            END IF;
            IF ( (out_4_qfftsize_tpl_dut /= out_4_qfftsize_tpl_stm)) THEN
                mismatch_out_4_qfftsize_tpl := TRUE;
                report "mismatch in out_4_qfftsize_tpl signal" severity Warning;
            END IF;
            IF ( (out_5_q_nprb_tpl_dut /= out_5_q_nprb_tpl_stm)) THEN
                mismatch_out_5_q_nprb_tpl := TRUE;
                report "mismatch in out_5_q_nprb_tpl signal" severity Warning;
            END IF;
            IF ( (out_6_qcplen_tpl_dut /= out_6_qcplen_tpl_stm)) THEN
                mismatch_out_6_qcplen_tpl := TRUE;
                report "mismatch in out_6_qcplen_tpl signal" severity Warning;
            END IF;
            IF ( (out_7_q_dc_sc_en_tpl_dut /= out_7_q_dc_sc_en_tpl_stm)) THEN
                mismatch_out_7_q_dc_sc_en_tpl := TRUE;
                report "mismatch in out_7_q_dc_sc_en_tpl signal" severity Warning;
            END IF;
            IF ( (out_8_qfft_gain_real_tpl_dut /= out_8_qfft_gain_real_tpl_stm)) THEN
                mismatch_out_8_qfft_gain_real_tpl := TRUE;
                report "mismatch in out_8_qfft_gain_real_tpl signal" severity Warning;
            END IF;
            IF ( (out_9_qf_ift_gain_imag_tpl_dut /= out_9_qf_ift_gain_imag_tpl_stm)) THEN
                mismatch_out_9_qf_ift_gain_imag_tpl := TRUE;
                report "mismatch in out_9_qf_ift_gain_imag_tpl signal" severity Warning;
            END IF;
            IF ( (out_10_q_ifftshift_tpl_dut /= out_10_q_ifftshift_tpl_stm)) THEN
                mismatch_out_10_q_ifftshift_tpl := TRUE;
                report "mismatch in out_10_q_ifftshift_tpl signal" severity Warning;
            END IF;
            IF ( (out_11_q_ifft_mux_const_data_tpl_dut /= out_11_q_ifft_mux_const_data_tpl_stm)) THEN
                mismatch_out_11_q_ifft_mux_const_data_tpl := TRUE;
                report "mismatch in out_11_q_ifft_mux_const_data_tpl signal" severity Warning;
            END IF;
            IF ( (out_12_q_muxsel_tpl_dut /= out_12_q_muxsel_tpl_stm)) THEN
                mismatch_out_12_q_muxsel_tpl := TRUE;
                report "mismatch in out_12_q_muxsel_tpl signal" severity Warning;
            END IF;
            IF ( (out_13_time_out_tpl_dut /= out_13_time_out_tpl_stm)) THEN
                mismatch_out_13_time_out_tpl := TRUE;
                report "mismatch in out_13_time_out_tpl signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_out_1_qvalid_tpl = TRUE or mismatch_out_2_qchannel_tpl = TRUE or mismatch_out_3_real_qdata_tpl = TRUE or mismatch_out_3_imag_qdata_tpl = TRUE or mismatch_out_4_qfftsize_tpl = TRUE or mismatch_out_5_q_nprb_tpl = TRUE or mismatch_out_6_qcplen_tpl = TRUE or mismatch_out_7_q_dc_sc_en_tpl = TRUE or mismatch_out_8_qfft_gain_real_tpl = TRUE or mismatch_out_9_qf_ift_gain_imag_tpl = TRUE or mismatch_out_10_q_ifftshift_tpl = TRUE or mismatch_out_11_q_ifft_mux_const_data_tpl = TRUE or mismatch_out_12_q_muxsel_tpl = TRUE or mismatch_out_13_time_out_tpl = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch port map (
    in_1_valid_tpl_stm,
    in_2_ch_tpl_stm,
    in_3_real_data_tpl_stm,
    in_3_imag_data_tpl_stm,
    in_4_FFTSize_tpl_stm,
    in_5_NSubCarr_tpl_stm,
    in_6_cplen_tpl_stm,
    in_7_DC_SC_EN1_tpl_stm,
    in_8_iftgain_real_tpl_stm,
    in_9_ifftgain_imag_tpl_stm,
    in_10_ifftshift_tpl_stm,
    in_11_ifft_mux_const_data_tpl_stm,
    in_12_muxsel_tpl_stm,
    in_13_time_in_tpl_stm,
    out_1_qvalid_tpl_dut,
    out_2_qchannel_tpl_dut,
    out_3_real_qdata_tpl_dut,
    out_3_imag_qdata_tpl_dut,
    out_4_qfftsize_tpl_dut,
    out_5_q_nprb_tpl_dut,
    out_6_qcplen_tpl_dut,
    out_7_q_dc_sc_en_tpl_dut,
    out_8_qfft_gain_real_tpl_dut,
    out_9_qf_ift_gain_imag_tpl_dut,
    out_10_q_ifftshift_tpl_dut,
    out_11_q_ifft_mux_const_data_tpl_dut,
    out_12_q_muxsel_tpl_dut,
    out_13_time_out_tpl_dut,
        clk,
        areset
);

sim : ifft_blocktostream_DUT_low_phy_dl_iFFT_B2S_IFFT_Input_signal_latch_stm port map (
    in_1_valid_tpl_stm,
    in_2_ch_tpl_stm,
    in_3_real_data_tpl_stm,
    in_3_imag_data_tpl_stm,
    in_4_FFTSize_tpl_stm,
    in_5_NSubCarr_tpl_stm,
    in_6_cplen_tpl_stm,
    in_7_DC_SC_EN1_tpl_stm,
    in_8_iftgain_real_tpl_stm,
    in_9_ifftgain_imag_tpl_stm,
    in_10_ifftshift_tpl_stm,
    in_11_ifft_mux_const_data_tpl_stm,
    in_12_muxsel_tpl_stm,
    in_13_time_in_tpl_stm,
    out_1_qvalid_tpl_stm,
    out_2_qchannel_tpl_stm,
    out_3_real_qdata_tpl_stm,
    out_3_imag_qdata_tpl_stm,
    out_4_qfftsize_tpl_stm,
    out_5_q_nprb_tpl_stm,
    out_6_qcplen_tpl_stm,
    out_7_q_dc_sc_en_tpl_stm,
    out_8_qfft_gain_real_tpl_stm,
    out_9_qf_ift_gain_imag_tpl_stm,
    out_10_q_ifftshift_tpl_stm,
    out_11_q_ifft_mux_const_data_tpl_stm,
    out_12_q_muxsel_tpl_stm,
    out_13_time_out_tpl_stm,
        clk,
        areset
);

end normal;
