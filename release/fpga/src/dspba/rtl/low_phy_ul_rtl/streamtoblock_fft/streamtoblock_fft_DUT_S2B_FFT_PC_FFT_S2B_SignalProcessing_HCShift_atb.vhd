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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift
-- VHDL created on Thu Jun 12 21:29:54 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_atb is
end;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_atb is

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        in_1_vin_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_2_cin_tpl : in std_logic_vector(7 downto 0);  -- ufix8
        in_3_imag_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_3_real_din_tpl : in std_logic_vector(15 downto 0);  -- sfix16_en14
        in_4_sync_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_5_size_tpl : in std_logic_vector(3 downto 0);  -- ufix4
        in_6_nsc_tpl : in std_logic_vector(15 downto 0);  -- ufix16
        in_7_hcs_bypass_tpl : in std_logic_vector(0 downto 0);  -- ufix1
        in_8_SFNin_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        in_9_eAxC_tpl : in std_logic_vector(1 downto 0);  -- ufix2
        in_10_sym_metadata_tpl : in std_logic_vector(63 downto 0);  -- ufix64
        out_1_vout_tpl : out std_logic_vector(0 downto 0);  -- ufix1
        out_2_cout_tpl : out std_logic_vector(7 downto 0);  -- ufix8
        out_3_imag_dout_tpl : out std_logic_vector(16 downto 0);  -- sfix17_en15
        out_3_real_dout_tpl : out std_logic_vector(16 downto 0);  -- sfix17_en15
        out_4_nsc_out_tpl : out std_logic_vector(15 downto 0);  -- ufix16
        out_5_size_out_tpl : out std_logic_vector(3 downto 0);  -- ufix4
        out_6_SFNout_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        out_7_eAxC_out_tpl : out std_logic_vector(1 downto 0);  -- ufix2
        out_8_sym_metadataout_tpl : out std_logic_vector(63 downto 0);  -- ufix64
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        in_1_vin_tpl_stm : out std_logic_vector(0 downto 0);
        in_2_cin_tpl_stm : out std_logic_vector(7 downto 0);
        in_3_imag_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_3_real_din_tpl_stm : out std_logic_vector(15 downto 0);
        in_4_sync_tpl_stm : out std_logic_vector(0 downto 0);
        in_5_size_tpl_stm : out std_logic_vector(3 downto 0);
        in_6_nsc_tpl_stm : out std_logic_vector(15 downto 0);
        in_7_hcs_bypass_tpl_stm : out std_logic_vector(0 downto 0);
        in_8_SFNin_tpl_stm : out std_logic_vector(63 downto 0);
        in_9_eAxC_tpl_stm : out std_logic_vector(1 downto 0);
        in_10_sym_metadata_tpl_stm : out std_logic_vector(63 downto 0);
        out_1_vout_tpl_stm : out std_logic_vector(0 downto 0);
        out_2_cout_tpl_stm : out std_logic_vector(7 downto 0);
        out_3_imag_dout_tpl_stm : out std_logic_vector(16 downto 0);
        out_3_real_dout_tpl_stm : out std_logic_vector(16 downto 0);
        out_4_nsc_out_tpl_stm : out std_logic_vector(15 downto 0);
        out_5_size_out_tpl_stm : out std_logic_vector(3 downto 0);
        out_6_SFNout_tpl_stm : out std_logic_vector(63 downto 0);
        out_7_eAxC_out_tpl_stm : out std_logic_vector(1 downto 0);
        out_8_sym_metadataout_tpl_stm : out std_logic_vector(63 downto 0);
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
signal in_1_vin_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_cin_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_imag_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_real_din_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_sync_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_size_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal in_6_nsc_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_hcs_bypass_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal in_8_SFNin_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal in_9_eAxC_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal in_10_sym_metadata_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_1_vout_tpl_stm : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_cout_tpl_stm : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_imag_dout_tpl_stm : STD_LOGIC_VECTOR (16 downto 0);
signal out_3_real_dout_tpl_stm : STD_LOGIC_VECTOR (16 downto 0);
signal out_4_nsc_out_tpl_stm : STD_LOGIC_VECTOR (15 downto 0);
signal out_5_size_out_tpl_stm : STD_LOGIC_VECTOR (3 downto 0);
signal out_6_SFNout_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal out_7_eAxC_out_tpl_stm : STD_LOGIC_VECTOR (1 downto 0);
signal out_8_sym_metadataout_tpl_stm : STD_LOGIC_VECTOR (63 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal in_1_vin_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_2_cin_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal in_3_imag_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_3_real_din_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_4_sync_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_5_size_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal in_6_nsc_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal in_7_hcs_bypass_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal in_8_SFNin_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal in_9_eAxC_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal in_10_sym_metadata_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_1_vout_tpl_dut : STD_LOGIC_VECTOR (0 downto 0);
signal out_2_cout_tpl_dut : STD_LOGIC_VECTOR (7 downto 0);
signal out_3_imag_dout_tpl_dut : STD_LOGIC_VECTOR (16 downto 0);
signal out_3_real_dout_tpl_dut : STD_LOGIC_VECTOR (16 downto 0);
signal out_4_nsc_out_tpl_dut : STD_LOGIC_VECTOR (15 downto 0);
signal out_5_size_out_tpl_dut : STD_LOGIC_VECTOR (3 downto 0);
signal out_6_SFNout_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
signal out_7_eAxC_out_tpl_dut : STD_LOGIC_VECTOR (1 downto 0);
signal out_8_sym_metadataout_tpl_dut : STD_LOGIC_VECTOR (63 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkin_1_vin_tpl : process (clk, areset, in_1_vin_tpl_dut, in_1_vin_tpl_stm)
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
checkin_5_size_tpl : process (clk, areset, in_5_size_tpl_dut, in_5_size_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_6_nsc_tpl : process (clk, areset, in_6_nsc_tpl_dut, in_6_nsc_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_7_hcs_bypass_tpl : process (clk, areset, in_7_hcs_bypass_tpl_dut, in_7_hcs_bypass_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_8_SFNin_tpl : process (clk, areset, in_8_SFNin_tpl_dut, in_8_SFNin_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_9_eAxC_tpl : process (clk, areset, in_9_eAxC_tpl_dut, in_9_eAxC_tpl_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkin_10_sym_metadata_tpl : process (clk, areset, in_10_sym_metadata_tpl_dut, in_10_sym_metadata_tpl_stm)
begin
END PROCESS;


dut : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    in_1_vin_tpl_stm,
    in_2_cin_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_3_real_din_tpl_stm,
    in_4_sync_tpl_stm,
    in_5_size_tpl_stm,
    in_6_nsc_tpl_stm,
    in_7_hcs_bypass_tpl_stm,
    in_8_SFNin_tpl_stm,
    in_9_eAxC_tpl_stm,
    in_10_sym_metadata_tpl_stm,
    out_1_vout_tpl_dut,
    out_2_cout_tpl_dut,
    out_3_imag_dout_tpl_dut,
    out_3_real_dout_tpl_dut,
    out_4_nsc_out_tpl_dut,
    out_5_size_out_tpl_dut,
    out_6_SFNout_tpl_dut,
    out_7_eAxC_out_tpl_dut,
    out_8_sym_metadataout_tpl_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    in_1_vin_tpl_stm,
    in_2_cin_tpl_stm,
    in_3_imag_din_tpl_stm,
    in_3_real_din_tpl_stm,
    in_4_sync_tpl_stm,
    in_5_size_tpl_stm,
    in_6_nsc_tpl_stm,
    in_7_hcs_bypass_tpl_stm,
    in_8_SFNin_tpl_stm,
    in_9_eAxC_tpl_stm,
    in_10_sym_metadata_tpl_stm,
    out_1_vout_tpl_stm,
    out_2_cout_tpl_stm,
    out_3_imag_dout_tpl_stm,
    out_3_real_dout_tpl_stm,
    out_4_nsc_out_tpl_stm,
    out_5_size_out_tpl_stm,
    out_6_SFNout_tpl_stm,
    out_7_eAxC_out_tpl_stm,
    out_8_sym_metadataout_tpl_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
