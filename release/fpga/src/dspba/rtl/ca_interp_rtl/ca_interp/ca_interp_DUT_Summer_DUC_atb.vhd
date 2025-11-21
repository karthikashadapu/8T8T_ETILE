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

-- VHDL created from standaloneTopLevel_ca_interp_DUT_Summer_DUC
-- VHDL created on Tue Jan  7 17:04:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_ca_interp_DUT_Summer_DUC_atb is
end;

architecture normal of standaloneTopLevel_ca_interp_DUT_Summer_DUC_atb is

component standaloneTopLevel_ca_interp_DUT_Summer_DUC is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        v_1_s : in std_logic_vector(0 downto 0);  -- ufix1
        c_1_s : in std_logic_vector(7 downto 0);  -- ufix8
        d_1_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_1_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_1_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_1_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_1_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_1_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_1_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_1_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        v_2_s : in std_logic_vector(0 downto 0);  -- ufix1
        c_2_s : in std_logic_vector(7 downto 0);  -- ufix8
        d_2_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_2_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_2_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_2_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_2_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_2_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_2_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        d_2_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        dout_0im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_0re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_1im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_1re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_2im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_2re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_3im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_3re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_4im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_4re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_5im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_5re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_6im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_6re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_7im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        dout_7re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_0im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_0re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_1im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_1re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_2im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_2re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_3im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_dout_3re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        summer_vout_s : out std_logic_vector(0 downto 0);  -- ufix1
        summer_cout_s : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_ca_interp_DUT_Summer_DUC_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        v_1_s_stm : out std_logic_vector(0 downto 0);
        c_1_s_stm : out std_logic_vector(7 downto 0);
        d_1_0im_stm : out std_logic_vector(15 downto 0);
        d_1_0re_stm : out std_logic_vector(15 downto 0);
        d_1_1im_stm : out std_logic_vector(15 downto 0);
        d_1_1re_stm : out std_logic_vector(15 downto 0);
        d_1_2im_stm : out std_logic_vector(15 downto 0);
        d_1_2re_stm : out std_logic_vector(15 downto 0);
        d_1_3im_stm : out std_logic_vector(15 downto 0);
        d_1_3re_stm : out std_logic_vector(15 downto 0);
        v_2_s_stm : out std_logic_vector(0 downto 0);
        c_2_s_stm : out std_logic_vector(7 downto 0);
        d_2_0im_stm : out std_logic_vector(15 downto 0);
        d_2_0re_stm : out std_logic_vector(15 downto 0);
        d_2_1im_stm : out std_logic_vector(15 downto 0);
        d_2_1re_stm : out std_logic_vector(15 downto 0);
        d_2_2im_stm : out std_logic_vector(15 downto 0);
        d_2_2re_stm : out std_logic_vector(15 downto 0);
        d_2_3im_stm : out std_logic_vector(15 downto 0);
        d_2_3re_stm : out std_logic_vector(15 downto 0);
        cout_s_stm : out std_logic_vector(7 downto 0);
        vout_s_stm : out std_logic_vector(0 downto 0);
        dout_0im_stm : out std_logic_vector(15 downto 0);
        dout_0re_stm : out std_logic_vector(15 downto 0);
        dout_1im_stm : out std_logic_vector(15 downto 0);
        dout_1re_stm : out std_logic_vector(15 downto 0);
        dout_2im_stm : out std_logic_vector(15 downto 0);
        dout_2re_stm : out std_logic_vector(15 downto 0);
        dout_3im_stm : out std_logic_vector(15 downto 0);
        dout_3re_stm : out std_logic_vector(15 downto 0);
        dout_4im_stm : out std_logic_vector(15 downto 0);
        dout_4re_stm : out std_logic_vector(15 downto 0);
        dout_5im_stm : out std_logic_vector(15 downto 0);
        dout_5re_stm : out std_logic_vector(15 downto 0);
        dout_6im_stm : out std_logic_vector(15 downto 0);
        dout_6re_stm : out std_logic_vector(15 downto 0);
        dout_7im_stm : out std_logic_vector(15 downto 0);
        dout_7re_stm : out std_logic_vector(15 downto 0);
        summer_dout_0im_stm : out std_logic_vector(15 downto 0);
        summer_dout_0re_stm : out std_logic_vector(15 downto 0);
        summer_dout_1im_stm : out std_logic_vector(15 downto 0);
        summer_dout_1re_stm : out std_logic_vector(15 downto 0);
        summer_dout_2im_stm : out std_logic_vector(15 downto 0);
        summer_dout_2re_stm : out std_logic_vector(15 downto 0);
        summer_dout_3im_stm : out std_logic_vector(15 downto 0);
        summer_dout_3re_stm : out std_logic_vector(15 downto 0);
        summer_vout_s_stm : out std_logic_vector(0 downto 0);
        summer_cout_s_stm : out std_logic_vector(7 downto 0);
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
signal busOut_waitrequest_stm : STD_LOGIC_VECTOR (0 downto 0);
signal v_1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal c_1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal d_1_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal v_2_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal c_2_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal d_2_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal dout_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_4im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_4re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_5im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_5re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_6im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_6re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_7im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal dout_7re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal summer_vout_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal summer_cout_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal v_1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal c_1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal d_1_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_1_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal v_2_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal c_2_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal d_2_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal d_2_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal dout_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_4im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_4re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_5im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_5re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_6im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_6re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_7im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal dout_7re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_dout_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal summer_vout_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal summer_cout_s_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkv_1_s : process (clk, areset, v_1_s_dut, v_1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkc_1_s : process (clk, areset, c_1_s_dut, c_1_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_1_0im : process (clk, areset, d_1_0im_dut, d_1_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_1_0re : process (clk, areset, d_1_0re_dut, d_1_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_1_1im : process (clk, areset, d_1_1im_dut, d_1_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_1_1re : process (clk, areset, d_1_1re_dut, d_1_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_1_2im : process (clk, areset, d_1_2im_dut, d_1_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_1_2re : process (clk, areset, d_1_2re_dut, d_1_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_1_3im : process (clk, areset, d_1_3im_dut, d_1_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_1_3re : process (clk, areset, d_1_3re_dut, d_1_3re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkv_2_s : process (clk, areset, v_2_s_dut, v_2_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkc_2_s : process (clk, areset, c_2_s_dut, c_2_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_2_0im : process (clk, areset, d_2_0im_dut, d_2_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_2_0re : process (clk, areset, d_2_0re_dut, d_2_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_2_1im : process (clk, areset, d_2_1im_dut, d_2_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_2_1re : process (clk, areset, d_2_1re_dut, d_2_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_2_2im : process (clk, areset, d_2_2im_dut, d_2_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_2_2re : process (clk, areset, d_2_2re_dut, d_2_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_2_3im : process (clk, areset, d_2_3im_dut, d_2_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkd_2_3re : process (clk, areset, d_2_3re_dut, d_2_3re_stm)
begin
END PROCESS;


-- General Purpose data out check
checkcout_s : process (clk, areset)
variable mismatch_cout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_cout_s := FALSE;
        IF ( (cout_s_dut /= cout_s_stm) and vout_s_dut = "1") THEN
            mismatch_cout_s := TRUE;
            report "Mismatch on device output pin cout_s" severity Warning;
        END IF;
        IF (mismatch_cout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkvout_s : process (clk, areset)
variable mismatch_vout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_vout_s := FALSE;
        IF ( (vout_s_dut /= vout_s_stm)) THEN
            mismatch_vout_s := TRUE;
            report "Mismatch on device output pin vout_s" severity Warning;
        END IF;
        IF (mismatch_vout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_0im : process (clk, areset)
variable mismatch_dout_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_0im := FALSE;
        IF ( (dout_0im_dut /= dout_0im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_0im := TRUE;
            report "Mismatch on device output pin dout_0im" severity Warning;
        END IF;
        IF (mismatch_dout_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_0re : process (clk, areset)
variable mismatch_dout_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_0re := FALSE;
        IF ( (dout_0re_dut /= dout_0re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_0re := TRUE;
            report "Mismatch on device output pin dout_0re" severity Warning;
        END IF;
        IF (mismatch_dout_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_1im : process (clk, areset)
variable mismatch_dout_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_1im := FALSE;
        IF ( (dout_1im_dut /= dout_1im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_1im := TRUE;
            report "Mismatch on device output pin dout_1im" severity Warning;
        END IF;
        IF (mismatch_dout_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_1re : process (clk, areset)
variable mismatch_dout_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_1re := FALSE;
        IF ( (dout_1re_dut /= dout_1re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_1re := TRUE;
            report "Mismatch on device output pin dout_1re" severity Warning;
        END IF;
        IF (mismatch_dout_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_2im : process (clk, areset)
variable mismatch_dout_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_2im := FALSE;
        IF ( (dout_2im_dut /= dout_2im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_2im := TRUE;
            report "Mismatch on device output pin dout_2im" severity Warning;
        END IF;
        IF (mismatch_dout_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_2re : process (clk, areset)
variable mismatch_dout_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_2re := FALSE;
        IF ( (dout_2re_dut /= dout_2re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_2re := TRUE;
            report "Mismatch on device output pin dout_2re" severity Warning;
        END IF;
        IF (mismatch_dout_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_3im : process (clk, areset)
variable mismatch_dout_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_3im := FALSE;
        IF ( (dout_3im_dut /= dout_3im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_3im := TRUE;
            report "Mismatch on device output pin dout_3im" severity Warning;
        END IF;
        IF (mismatch_dout_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_3re : process (clk, areset)
variable mismatch_dout_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_3re := FALSE;
        IF ( (dout_3re_dut /= dout_3re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_3re := TRUE;
            report "Mismatch on device output pin dout_3re" severity Warning;
        END IF;
        IF (mismatch_dout_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_4im : process (clk, areset)
variable mismatch_dout_4im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_4im := FALSE;
        IF ( (dout_4im_dut /= dout_4im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_4im := TRUE;
            report "Mismatch on device output pin dout_4im" severity Warning;
        END IF;
        IF (mismatch_dout_4im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_4re : process (clk, areset)
variable mismatch_dout_4re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_4re := FALSE;
        IF ( (dout_4re_dut /= dout_4re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_4re := TRUE;
            report "Mismatch on device output pin dout_4re" severity Warning;
        END IF;
        IF (mismatch_dout_4re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_5im : process (clk, areset)
variable mismatch_dout_5im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_5im := FALSE;
        IF ( (dout_5im_dut /= dout_5im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_5im := TRUE;
            report "Mismatch on device output pin dout_5im" severity Warning;
        END IF;
        IF (mismatch_dout_5im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_5re : process (clk, areset)
variable mismatch_dout_5re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_5re := FALSE;
        IF ( (dout_5re_dut /= dout_5re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_5re := TRUE;
            report "Mismatch on device output pin dout_5re" severity Warning;
        END IF;
        IF (mismatch_dout_5re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_6im : process (clk, areset)
variable mismatch_dout_6im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_6im := FALSE;
        IF ( (dout_6im_dut /= dout_6im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_6im := TRUE;
            report "Mismatch on device output pin dout_6im" severity Warning;
        END IF;
        IF (mismatch_dout_6im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_6re : process (clk, areset)
variable mismatch_dout_6re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_6re := FALSE;
        IF ( (dout_6re_dut /= dout_6re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_6re := TRUE;
            report "Mismatch on device output pin dout_6re" severity Warning;
        END IF;
        IF (mismatch_dout_6re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_7im : process (clk, areset)
variable mismatch_dout_7im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_7im := FALSE;
        IF ( (dout_7im_dut /= dout_7im_stm) and vout_s_dut = "1") THEN
            mismatch_dout_7im := TRUE;
            report "Mismatch on device output pin dout_7im" severity Warning;
        END IF;
        IF (mismatch_dout_7im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdout_7re : process (clk, areset)
variable mismatch_dout_7re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_dout_7re := FALSE;
        IF ( (dout_7re_dut /= dout_7re_stm) and vout_s_dut = "1") THEN
            mismatch_dout_7re := TRUE;
            report "Mismatch on device output pin dout_7re" severity Warning;
        END IF;
        IF (mismatch_dout_7re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_0im : process (clk, areset)
variable mismatch_summer_dout_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_0im := FALSE;
        IF ( (summer_dout_0im_dut /= summer_dout_0im_stm)) THEN
            mismatch_summer_dout_0im := TRUE;
            report "Mismatch on device output pin summer_dout_0im" severity Warning;
        END IF;
        IF (mismatch_summer_dout_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_0re : process (clk, areset)
variable mismatch_summer_dout_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_0re := FALSE;
        IF ( (summer_dout_0re_dut /= summer_dout_0re_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_dout_0re := TRUE;
            report "Mismatch on device output pin summer_dout_0re" severity Warning;
        END IF;
        IF (mismatch_summer_dout_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_1im : process (clk, areset)
variable mismatch_summer_dout_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_1im := FALSE;
        IF ( (summer_dout_1im_dut /= summer_dout_1im_stm)) THEN
            mismatch_summer_dout_1im := TRUE;
            report "Mismatch on device output pin summer_dout_1im" severity Warning;
        END IF;
        IF (mismatch_summer_dout_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_1re : process (clk, areset)
variable mismatch_summer_dout_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_1re := FALSE;
        IF ( (summer_dout_1re_dut /= summer_dout_1re_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_dout_1re := TRUE;
            report "Mismatch on device output pin summer_dout_1re" severity Warning;
        END IF;
        IF (mismatch_summer_dout_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_2im : process (clk, areset)
variable mismatch_summer_dout_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_2im := FALSE;
        IF ( (summer_dout_2im_dut /= summer_dout_2im_stm)) THEN
            mismatch_summer_dout_2im := TRUE;
            report "Mismatch on device output pin summer_dout_2im" severity Warning;
        END IF;
        IF (mismatch_summer_dout_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_2re : process (clk, areset)
variable mismatch_summer_dout_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_2re := FALSE;
        IF ( (summer_dout_2re_dut /= summer_dout_2re_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_dout_2re := TRUE;
            report "Mismatch on device output pin summer_dout_2re" severity Warning;
        END IF;
        IF (mismatch_summer_dout_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_3im : process (clk, areset)
variable mismatch_summer_dout_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_3im := FALSE;
        IF ( (summer_dout_3im_dut /= summer_dout_3im_stm)) THEN
            mismatch_summer_dout_3im := TRUE;
            report "Mismatch on device output pin summer_dout_3im" severity Warning;
        END IF;
        IF (mismatch_summer_dout_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in general purpose signal. Check the status of any associated valid signals." severity Warning;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_dout_3re : process (clk, areset)
variable mismatch_summer_dout_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_dout_3re := FALSE;
        IF ( (summer_dout_3re_dut /= summer_dout_3re_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_dout_3re := TRUE;
            report "Mismatch on device output pin summer_dout_3re" severity Warning;
        END IF;
        IF (mismatch_summer_dout_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_vout_s : process (clk, areset)
variable mismatch_summer_vout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_vout_s := FALSE;
        IF ( (summer_vout_s_dut /= summer_vout_s_stm)) THEN
            mismatch_summer_vout_s := TRUE;
            report "Mismatch on device output pin summer_vout_s" severity Warning;
        END IF;
        IF (mismatch_summer_vout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checksummer_cout_s : process (clk, areset)
variable mismatch_summer_cout_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_summer_cout_s := FALSE;
        IF ( (summer_cout_s_dut /= summer_cout_s_stm) and summer_vout_s_dut = "1") THEN
            mismatch_summer_cout_s := TRUE;
            report "Mismatch on device output pin summer_cout_s" severity Warning;
        END IF;
        IF (mismatch_summer_cout_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_ca_interp_DUT_Summer_DUC port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    v_1_s_stm,
    c_1_s_stm,
    d_1_0im_stm,
    d_1_0re_stm,
    d_1_1im_stm,
    d_1_1re_stm,
    d_1_2im_stm,
    d_1_2re_stm,
    d_1_3im_stm,
    d_1_3re_stm,
    v_2_s_stm,
    c_2_s_stm,
    d_2_0im_stm,
    d_2_0re_stm,
    d_2_1im_stm,
    d_2_1re_stm,
    d_2_2im_stm,
    d_2_2re_stm,
    d_2_3im_stm,
    d_2_3re_stm,
    cout_s_dut,
    vout_s_dut,
    dout_0im_dut,
    dout_0re_dut,
    dout_1im_dut,
    dout_1re_dut,
    dout_2im_dut,
    dout_2re_dut,
    dout_3im_dut,
    dout_3re_dut,
    dout_4im_dut,
    dout_4re_dut,
    dout_5im_dut,
    dout_5re_dut,
    dout_6im_dut,
    dout_6re_dut,
    dout_7im_dut,
    dout_7re_dut,
    summer_dout_0im_dut,
    summer_dout_0re_dut,
    summer_dout_1im_dut,
    summer_dout_1re_dut,
    summer_dout_2im_dut,
    summer_dout_2re_dut,
    summer_dout_3im_dut,
    summer_dout_3re_dut,
    summer_vout_s_dut,
    summer_cout_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_ca_interp_DUT_Summer_DUC_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    v_1_s_stm,
    c_1_s_stm,
    d_1_0im_stm,
    d_1_0re_stm,
    d_1_1im_stm,
    d_1_1re_stm,
    d_1_2im_stm,
    d_1_2re_stm,
    d_1_3im_stm,
    d_1_3re_stm,
    v_2_s_stm,
    c_2_s_stm,
    d_2_0im_stm,
    d_2_0re_stm,
    d_2_1im_stm,
    d_2_1re_stm,
    d_2_2im_stm,
    d_2_2re_stm,
    d_2_3im_stm,
    d_2_3re_stm,
    cout_s_stm,
    vout_s_stm,
    dout_0im_stm,
    dout_0re_stm,
    dout_1im_stm,
    dout_1re_stm,
    dout_2im_stm,
    dout_2re_stm,
    dout_3im_stm,
    dout_3re_stm,
    dout_4im_stm,
    dout_4re_stm,
    dout_5im_stm,
    dout_5re_stm,
    dout_6im_stm,
    dout_6re_stm,
    dout_7im_stm,
    dout_7re_stm,
    summer_dout_0im_stm,
    summer_dout_0re_stm,
    summer_dout_1im_stm,
    summer_dout_1re_stm,
    summer_dout_2im_stm,
    summer_dout_2re_stm,
    summer_dout_3im_stm,
    summer_dout_3re_stm,
    summer_vout_s_stm,
    summer_cout_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
