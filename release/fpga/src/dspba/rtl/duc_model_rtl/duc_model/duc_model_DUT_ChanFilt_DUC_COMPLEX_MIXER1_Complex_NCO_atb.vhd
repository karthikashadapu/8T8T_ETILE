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

-- VHDL created from duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO
-- VHDL created on Thu Jan  9 15:34:39 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb is
end;

architecture normal of duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_atb is

component duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- ufix1
        xIn_c : in std_logic_vector(7 downto 0);  -- ufix8
        xIn_p_0 : in std_logic_vector(31 downto 0);  -- ufix32
        xIn_p_1 : in std_logic_vector(31 downto 0);  -- ufix32
        xIn_p_2 : in std_logic_vector(31 downto 0);  -- ufix32
        xIn_p_3 : in std_logic_vector(31 downto 0);  -- ufix32
        xIn_s_0 : in std_logic_vector(0 downto 0);  -- ufix1
        xIn_s_1 : in std_logic_vector(0 downto 0);  -- ufix1
        xIn_s_2 : in std_logic_vector(0 downto 0);  -- ufix1
        xIn_s_3 : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        ncoOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        ncoOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        sinOut_0 : out std_logic_vector(15 downto 0);  -- sfix16
        sinOut_1 : out std_logic_vector(15 downto 0);  -- sfix16
        sinOut_2 : out std_logic_vector(15 downto 0);  -- sfix16
        sinOut_3 : out std_logic_vector(15 downto 0);  -- sfix16
        cosOut_0 : out std_logic_vector(15 downto 0);  -- sfix16
        cosOut_1 : out std_logic_vector(15 downto 0);  -- sfix16
        cosOut_2 : out std_logic_vector(15 downto 0);  -- sfix16
        cosOut_3 : out std_logic_vector(15 downto 0);  -- sfix16
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_stm is
    port (
        xIn_v_stm : out std_logic_vector(0 downto 0);
        xIn_c_stm : out std_logic_vector(7 downto 0);
        xIn_p_0_stm : out std_logic_vector(31 downto 0);
        xIn_p_1_stm : out std_logic_vector(31 downto 0);
        xIn_p_2_stm : out std_logic_vector(31 downto 0);
        xIn_p_3_stm : out std_logic_vector(31 downto 0);
        xIn_s_0_stm : out std_logic_vector(0 downto 0);
        xIn_s_1_stm : out std_logic_vector(0 downto 0);
        xIn_s_2_stm : out std_logic_vector(0 downto 0);
        xIn_s_3_stm : out std_logic_vector(0 downto 0);
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        ncoOut_v_stm : out std_logic_vector(0 downto 0);
        ncoOut_c_stm : out std_logic_vector(7 downto 0);
        sinOut_0_stm : out std_logic_vector(15 downto 0);
        sinOut_1_stm : out std_logic_vector(15 downto 0);
        sinOut_2_stm : out std_logic_vector(15 downto 0);
        sinOut_3_stm : out std_logic_vector(15 downto 0);
        cosOut_0_stm : out std_logic_vector(15 downto 0);
        cosOut_1_stm : out std_logic_vector(15 downto 0);
        cosOut_2_stm : out std_logic_vector(15 downto 0);
        cosOut_3_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end component;

signal xIn_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_p_0_stm : STD_LOGIC_VECTOR (31 downto 0);
signal xIn_p_1_stm : STD_LOGIC_VECTOR (31 downto 0);
signal xIn_p_2_stm : STD_LOGIC_VECTOR (31 downto 0);
signal xIn_p_3_stm : STD_LOGIC_VECTOR (31 downto 0);
signal xIn_s_0_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_s_1_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_s_2_stm : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_s_3_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_writedata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_stm : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_stm : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_stm : STD_LOGIC_VECTOR (31 downto 0);
signal ncoOut_v_stm : STD_LOGIC_VECTOR (0 downto 0);
signal ncoOut_c_stm : STD_LOGIC_VECTOR (7 downto 0);
signal sinOut_0_stm : STD_LOGIC_VECTOR (15 downto 0);
signal sinOut_1_stm : STD_LOGIC_VECTOR (15 downto 0);
signal sinOut_2_stm : STD_LOGIC_VECTOR (15 downto 0);
signal sinOut_3_stm : STD_LOGIC_VECTOR (15 downto 0);
signal cosOut_0_stm : STD_LOGIC_VECTOR (15 downto 0);
signal cosOut_1_stm : STD_LOGIC_VECTOR (15 downto 0);
signal cosOut_2_stm : STD_LOGIC_VECTOR (15 downto 0);
signal cosOut_3_stm : STD_LOGIC_VECTOR (15 downto 0);
signal xIn_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal xIn_p_0_dut : STD_LOGIC_VECTOR (31 downto 0);
signal xIn_p_1_dut : STD_LOGIC_VECTOR (31 downto 0);
signal xIn_p_2_dut : STD_LOGIC_VECTOR (31 downto 0);
signal xIn_p_3_dut : STD_LOGIC_VECTOR (31 downto 0);
signal xIn_s_0_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_s_1_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_s_2_dut : STD_LOGIC_VECTOR (0 downto 0);
signal xIn_s_3_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal ncoOut_v_dut : STD_LOGIC_VECTOR (0 downto 0);
signal ncoOut_c_dut : STD_LOGIC_VECTOR (7 downto 0);
signal sinOut_0_dut : STD_LOGIC_VECTOR (15 downto 0);
signal sinOut_1_dut : STD_LOGIC_VECTOR (15 downto 0);
signal sinOut_2_dut : STD_LOGIC_VECTOR (15 downto 0);
signal sinOut_3_dut : STD_LOGIC_VECTOR (15 downto 0);
signal cosOut_0_dut : STD_LOGIC_VECTOR (15 downto 0);
signal cosOut_1_dut : STD_LOGIC_VECTOR (15 downto 0);
signal cosOut_2_dut : STD_LOGIC_VECTOR (15 downto 0);
signal cosOut_3_dut : STD_LOGIC_VECTOR (15 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Channelized data in real output
checkxIn : process (clk, areset, xIn_p_0_dut, xIn_p_0_stm, xIn_p_1_dut, xIn_p_1_stm, xIn_p_2_dut, xIn_p_2_stm, xIn_p_3_dut, xIn_p_3_stm, xIn_s_0_dut, xIn_s_0_stm, xIn_s_1_dut, xIn_s_1_stm, xIn_s_2_dut, xIn_s_2_stm, xIn_s_3_dut, xIn_s_3_stm)
begin
END PROCESS;


-- Channelized data out check
checkncoOut : process (clk, areset, sinOut_0_dut, sinOut_0_stm, sinOut_1_dut, sinOut_1_stm, sinOut_2_dut, sinOut_2_stm, sinOut_3_dut, sinOut_3_stm, cosOut_0_dut, cosOut_0_stm, cosOut_1_dut, cosOut_1_stm, cosOut_2_dut, cosOut_2_stm, cosOut_3_dut, cosOut_3_stm)
variable mismatch_ncoOut_v : BOOLEAN := FALSE;
variable mismatch_ncoOut_c : BOOLEAN := FALSE;
variable mismatch_sinOut_0 : BOOLEAN := FALSE;
variable mismatch_sinOut_1 : BOOLEAN := FALSE;
variable mismatch_sinOut_2 : BOOLEAN := FALSE;
variable mismatch_sinOut_3 : BOOLEAN := FALSE;
variable mismatch_cosOut_0 : BOOLEAN := FALSE;
variable mismatch_cosOut_1 : BOOLEAN := FALSE;
variable mismatch_cosOut_2 : BOOLEAN := FALSE;
variable mismatch_cosOut_3 : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_ncoOut_v := FALSE;
        mismatch_ncoOut_c := FALSE;
        mismatch_sinOut_0 := FALSE;
        mismatch_sinOut_1 := FALSE;
        mismatch_sinOut_2 := FALSE;
        mismatch_sinOut_3 := FALSE;
        mismatch_cosOut_0 := FALSE;
        mismatch_cosOut_1 := FALSE;
        mismatch_cosOut_2 := FALSE;
        mismatch_cosOut_3 := FALSE;
        IF ( (ncoOut_v_dut /= ncoOut_v_stm)) THEN
            mismatch_ncoOut_v := TRUE;
            report "mismatch in ncoOut_v signal" severity Failure;
        END IF;
        IF ((ncoOut_v_dut = "1")) THEN
            IF ( (ncoOut_c_dut /= ncoOut_c_stm)) THEN
                mismatch_ncoOut_c := TRUE;
                report "mismatch in ncoOut_c signal" severity Warning;
            END IF;
            IF ( (sinOut_0_dut /= sinOut_0_stm)) THEN
                mismatch_sinOut_0 := TRUE;
                report "mismatch in sinOut_0 signal" severity Warning;
            END IF;
            IF ( (sinOut_1_dut /= sinOut_1_stm)) THEN
                mismatch_sinOut_1 := TRUE;
                report "mismatch in sinOut_1 signal" severity Warning;
            END IF;
            IF ( (sinOut_2_dut /= sinOut_2_stm)) THEN
                mismatch_sinOut_2 := TRUE;
                report "mismatch in sinOut_2 signal" severity Warning;
            END IF;
            IF ( (sinOut_3_dut /= sinOut_3_stm)) THEN
                mismatch_sinOut_3 := TRUE;
                report "mismatch in sinOut_3 signal" severity Warning;
            END IF;
            IF ( (cosOut_0_dut /= cosOut_0_stm)) THEN
                mismatch_cosOut_0 := TRUE;
                report "mismatch in cosOut_0 signal" severity Warning;
            END IF;
            IF ( (cosOut_1_dut /= cosOut_1_stm)) THEN
                mismatch_cosOut_1 := TRUE;
                report "mismatch in cosOut_1 signal" severity Warning;
            END IF;
            IF ( (cosOut_2_dut /= cosOut_2_stm)) THEN
                mismatch_cosOut_2 := TRUE;
                report "mismatch in cosOut_2 signal" severity Warning;
            END IF;
            IF ( (cosOut_3_dut /= cosOut_3_stm)) THEN
                mismatch_cosOut_3 := TRUE;
                report "mismatch in cosOut_3 signal" severity Warning;
            END IF;
        END IF;
        IF (mismatch_ncoOut_v = TRUE or mismatch_ncoOut_c = TRUE or mismatch_sinOut_0 = TRUE or mismatch_sinOut_1 = TRUE or mismatch_sinOut_2 = TRUE or mismatch_sinOut_3 = TRUE or mismatch_cosOut_0 = TRUE or mismatch_cosOut_1 = TRUE or mismatch_cosOut_2 = TRUE or mismatch_cosOut_3 = TRUE) THEN
            ok := FALSE;
        END IF;
        IF (ok = FALSE) THEN
            report "Mismatch detected" severity Failure;
        END IF;
    END IF;
END PROCESS;


dut : duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_p_0_stm,
    xIn_p_1_stm,
    xIn_p_2_stm,
    xIn_p_3_stm,
    xIn_s_0_stm,
    xIn_s_1_stm,
    xIn_s_2_stm,
    xIn_s_3_stm,
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    ncoOut_v_dut,
    ncoOut_c_dut,
    sinOut_0_dut,
    sinOut_1_dut,
    sinOut_2_dut,
    sinOut_3_dut,
    cosOut_0_dut,
    cosOut_1_dut,
    cosOut_2_dut,
    cosOut_3_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_stm port map (
    xIn_v_stm,
    xIn_c_stm,
    xIn_p_0_stm,
    xIn_p_1_stm,
    xIn_p_2_stm,
    xIn_p_3_stm,
    xIn_s_0_stm,
    xIn_s_1_stm,
    xIn_s_2_stm,
    xIn_s_3_stm,
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    ncoOut_v_stm,
    ncoOut_c_stm,
    sinOut_0_stm,
    sinOut_1_stm,
    sinOut_2_stm,
    sinOut_3_stm,
    cosOut_0_stm,
    cosOut_1_stm,
    cosOut_2_stm,
    cosOut_3_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
