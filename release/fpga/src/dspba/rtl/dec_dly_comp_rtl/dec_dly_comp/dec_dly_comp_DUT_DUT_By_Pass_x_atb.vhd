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

-- VHDL created from standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x
-- VHDL created on Tue Jan  7 17:06:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.dspba_sim_library_package.all;
entity standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb is
end;

architecture normal of standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_atb is

component standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x is
    port (
        busIn_writedata : in std_logic_vector(31 downto 0);  -- ufix32
        busIn_address : in std_logic_vector(13 downto 0);  -- ufix14
        busIn_write : in std_logic_vector(0 downto 0);  -- ufix1
        busIn_read : in std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdatavalid : out std_logic_vector(0 downto 0);  -- ufix1
        busOut_readdata : out std_logic_vector(31 downto 0);  -- ufix32
        busOut_waitrequest : out std_logic_vector(0 downto 0);  -- ufix1
        din_dec_out_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_out_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_out_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_out_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_out_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_out_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_out_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_out_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_0im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_0re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_1im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_1re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_2im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_2re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_3im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_3re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_4im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_4re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_5im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_5re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_6im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_6re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_7im : in std_logic_vector(15 downto 0);  -- sfix16_en14
        din_dec_in_7re : in std_logic_vector(15 downto 0);  -- sfix16_en14
        vin_dec_out_s : in std_logic_vector(0 downto 0);  -- ufix1
        cin_dec_in_s : in std_logic_vector(7 downto 0);  -- ufix8
        cin_dec_out_s : in std_logic_vector(7 downto 0);  -- ufix8
        vin_dec_in_s : in std_logic_vector(0 downto 0);  -- ufix1
        din_a1_0im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_0re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_1im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_1re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_2im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_2re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_3im : out std_logic_vector(15 downto 0);  -- sfix16_en14
        din_a1_3re : out std_logic_vector(15 downto 0);  -- sfix16_en14
        vin_a1_s : out std_logic_vector(0 downto 0);  -- ufix1
        cin_a1_s : out std_logic_vector(7 downto 0);  -- ufix8
        clk : in std_logic;
        areset : in std_logic;
        bus_clk : in std_logic;
        bus_areset : in std_logic
    );
end component;

component standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        din_dec_out_0im_stm : out std_logic_vector(15 downto 0);
        din_dec_out_0re_stm : out std_logic_vector(15 downto 0);
        din_dec_out_1im_stm : out std_logic_vector(15 downto 0);
        din_dec_out_1re_stm : out std_logic_vector(15 downto 0);
        din_dec_out_2im_stm : out std_logic_vector(15 downto 0);
        din_dec_out_2re_stm : out std_logic_vector(15 downto 0);
        din_dec_out_3im_stm : out std_logic_vector(15 downto 0);
        din_dec_out_3re_stm : out std_logic_vector(15 downto 0);
        din_dec_in_0im_stm : out std_logic_vector(15 downto 0);
        din_dec_in_0re_stm : out std_logic_vector(15 downto 0);
        din_dec_in_1im_stm : out std_logic_vector(15 downto 0);
        din_dec_in_1re_stm : out std_logic_vector(15 downto 0);
        din_dec_in_2im_stm : out std_logic_vector(15 downto 0);
        din_dec_in_2re_stm : out std_logic_vector(15 downto 0);
        din_dec_in_3im_stm : out std_logic_vector(15 downto 0);
        din_dec_in_3re_stm : out std_logic_vector(15 downto 0);
        din_dec_in_4im_stm : out std_logic_vector(15 downto 0);
        din_dec_in_4re_stm : out std_logic_vector(15 downto 0);
        din_dec_in_5im_stm : out std_logic_vector(15 downto 0);
        din_dec_in_5re_stm : out std_logic_vector(15 downto 0);
        din_dec_in_6im_stm : out std_logic_vector(15 downto 0);
        din_dec_in_6re_stm : out std_logic_vector(15 downto 0);
        din_dec_in_7im_stm : out std_logic_vector(15 downto 0);
        din_dec_in_7re_stm : out std_logic_vector(15 downto 0);
        vin_dec_out_s_stm : out std_logic_vector(0 downto 0);
        cin_dec_in_s_stm : out std_logic_vector(7 downto 0);
        cin_dec_out_s_stm : out std_logic_vector(7 downto 0);
        vin_dec_in_s_stm : out std_logic_vector(0 downto 0);
        din_a1_0im_stm : out std_logic_vector(15 downto 0);
        din_a1_0re_stm : out std_logic_vector(15 downto 0);
        din_a1_1im_stm : out std_logic_vector(15 downto 0);
        din_a1_1re_stm : out std_logic_vector(15 downto 0);
        din_a1_2im_stm : out std_logic_vector(15 downto 0);
        din_a1_2re_stm : out std_logic_vector(15 downto 0);
        din_a1_3im_stm : out std_logic_vector(15 downto 0);
        din_a1_3re_stm : out std_logic_vector(15 downto 0);
        vin_a1_s_stm : out std_logic_vector(0 downto 0);
        cin_a1_s_stm : out std_logic_vector(7 downto 0);
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
signal din_dec_out_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_4im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_4re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_5im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_5re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_6im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_6re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_7im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_7re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal vin_dec_out_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cin_dec_in_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal cin_dec_out_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal vin_dec_in_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal din_a1_0im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_0re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_1im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_1re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_2im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_2re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_3im_stm : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_3re_stm : STD_LOGIC_VECTOR (15 downto 0);
signal vin_a1_s_stm : STD_LOGIC_VECTOR (0 downto 0);
signal cin_a1_s_stm : STD_LOGIC_VECTOR (7 downto 0);
signal busIn_writedata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busIn_address_dut : STD_LOGIC_VECTOR (13 downto 0);
signal busIn_write_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busIn_read_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdatavalid_dut : STD_LOGIC_VECTOR (0 downto 0);
signal busOut_readdata_dut : STD_LOGIC_VECTOR (31 downto 0);
signal busOut_waitrequest_dut : STD_LOGIC_VECTOR (0 downto 0);
signal din_dec_out_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_out_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_4im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_4re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_5im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_5re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_6im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_6re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_7im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_dec_in_7re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal vin_dec_out_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cin_dec_in_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal cin_dec_out_s_dut : STD_LOGIC_VECTOR (7 downto 0);
signal vin_dec_in_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal din_a1_0im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_0re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_1im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_1re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_2im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_2re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_3im_dut : STD_LOGIC_VECTOR (15 downto 0);
signal din_a1_3re_dut : STD_LOGIC_VECTOR (15 downto 0);
signal vin_a1_s_dut : STD_LOGIC_VECTOR (0 downto 0);
signal cin_a1_s_dut : STD_LOGIC_VECTOR (7 downto 0);
        signal clk : std_logic;
        signal areset : std_logic;
        signal bus_clk : std_logic;
        signal bus_areset : std_logic;

begin

-- Bus data out
-- General Purpose data in real output
checkdin_dec_out_0im : process (clk, areset, din_dec_out_0im_dut, din_dec_out_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_out_0re : process (clk, areset, din_dec_out_0re_dut, din_dec_out_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_out_1im : process (clk, areset, din_dec_out_1im_dut, din_dec_out_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_out_1re : process (clk, areset, din_dec_out_1re_dut, din_dec_out_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_out_2im : process (clk, areset, din_dec_out_2im_dut, din_dec_out_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_out_2re : process (clk, areset, din_dec_out_2re_dut, din_dec_out_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_out_3im : process (clk, areset, din_dec_out_3im_dut, din_dec_out_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_out_3re : process (clk, areset, din_dec_out_3re_dut, din_dec_out_3re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_0im : process (clk, areset, din_dec_in_0im_dut, din_dec_in_0im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_0re : process (clk, areset, din_dec_in_0re_dut, din_dec_in_0re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_1im : process (clk, areset, din_dec_in_1im_dut, din_dec_in_1im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_1re : process (clk, areset, din_dec_in_1re_dut, din_dec_in_1re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_2im : process (clk, areset, din_dec_in_2im_dut, din_dec_in_2im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_2re : process (clk, areset, din_dec_in_2re_dut, din_dec_in_2re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_3im : process (clk, areset, din_dec_in_3im_dut, din_dec_in_3im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_3re : process (clk, areset, din_dec_in_3re_dut, din_dec_in_3re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_4im : process (clk, areset, din_dec_in_4im_dut, din_dec_in_4im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_4re : process (clk, areset, din_dec_in_4re_dut, din_dec_in_4re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_5im : process (clk, areset, din_dec_in_5im_dut, din_dec_in_5im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_5re : process (clk, areset, din_dec_in_5re_dut, din_dec_in_5re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_6im : process (clk, areset, din_dec_in_6im_dut, din_dec_in_6im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_6re : process (clk, areset, din_dec_in_6re_dut, din_dec_in_6re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_7im : process (clk, areset, din_dec_in_7im_dut, din_dec_in_7im_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkdin_dec_in_7re : process (clk, areset, din_dec_in_7re_dut, din_dec_in_7re_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkvin_dec_out_s : process (clk, areset, vin_dec_out_s_dut, vin_dec_out_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcin_dec_in_s : process (clk, areset, cin_dec_in_s_dut, cin_dec_in_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkcin_dec_out_s : process (clk, areset, cin_dec_out_s_dut, cin_dec_out_s_stm)
begin
END PROCESS;


-- General Purpose data in real output
checkvin_dec_in_s : process (clk, areset, vin_dec_in_s_dut, vin_dec_in_s_stm)
begin
END PROCESS;


-- General Purpose data out check
checkdin_a1_0im : process (clk, areset)
variable mismatch_din_a1_0im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_din_a1_0im := FALSE;
        IF ( (din_a1_0im_dut /= din_a1_0im_stm) and vin_a1_s_dut = "1") THEN
            mismatch_din_a1_0im := TRUE;
            report "Mismatch on device output pin din_a1_0im" severity Warning;
        END IF;
        IF (mismatch_din_a1_0im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdin_a1_0re : process (clk, areset)
variable mismatch_din_a1_0re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_din_a1_0re := FALSE;
        IF ( (din_a1_0re_dut /= din_a1_0re_stm) and vin_a1_s_dut = "1") THEN
            mismatch_din_a1_0re := TRUE;
            report "Mismatch on device output pin din_a1_0re" severity Warning;
        END IF;
        IF (mismatch_din_a1_0re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdin_a1_1im : process (clk, areset)
variable mismatch_din_a1_1im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_din_a1_1im := FALSE;
        IF ( (din_a1_1im_dut /= din_a1_1im_stm) and vin_a1_s_dut = "1") THEN
            mismatch_din_a1_1im := TRUE;
            report "Mismatch on device output pin din_a1_1im" severity Warning;
        END IF;
        IF (mismatch_din_a1_1im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdin_a1_1re : process (clk, areset)
variable mismatch_din_a1_1re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_din_a1_1re := FALSE;
        IF ( (din_a1_1re_dut /= din_a1_1re_stm) and vin_a1_s_dut = "1") THEN
            mismatch_din_a1_1re := TRUE;
            report "Mismatch on device output pin din_a1_1re" severity Warning;
        END IF;
        IF (mismatch_din_a1_1re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdin_a1_2im : process (clk, areset)
variable mismatch_din_a1_2im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_din_a1_2im := FALSE;
        IF ( (din_a1_2im_dut /= din_a1_2im_stm) and vin_a1_s_dut = "1") THEN
            mismatch_din_a1_2im := TRUE;
            report "Mismatch on device output pin din_a1_2im" severity Warning;
        END IF;
        IF (mismatch_din_a1_2im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdin_a1_2re : process (clk, areset)
variable mismatch_din_a1_2re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_din_a1_2re := FALSE;
        IF ( (din_a1_2re_dut /= din_a1_2re_stm) and vin_a1_s_dut = "1") THEN
            mismatch_din_a1_2re := TRUE;
            report "Mismatch on device output pin din_a1_2re" severity Warning;
        END IF;
        IF (mismatch_din_a1_2re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdin_a1_3im : process (clk, areset)
variable mismatch_din_a1_3im : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_din_a1_3im := FALSE;
        IF ( (din_a1_3im_dut /= din_a1_3im_stm) and vin_a1_s_dut = "1") THEN
            mismatch_din_a1_3im := TRUE;
            report "Mismatch on device output pin din_a1_3im" severity Warning;
        END IF;
        IF (mismatch_din_a1_3im = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkdin_a1_3re : process (clk, areset)
variable mismatch_din_a1_3re : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_din_a1_3re := FALSE;
        IF ( (din_a1_3re_dut /= din_a1_3re_stm) and vin_a1_s_dut = "1") THEN
            mismatch_din_a1_3re := TRUE;
            report "Mismatch on device output pin din_a1_3re" severity Warning;
        END IF;
        IF (mismatch_din_a1_3re = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkvin_a1_s : process (clk, areset)
variable mismatch_vin_a1_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_vin_a1_s := FALSE;
        IF ( (vin_a1_s_dut /= vin_a1_s_stm)) THEN
            mismatch_vin_a1_s := TRUE;
            report "Mismatch on device output pin vin_a1_s" severity Warning;
        END IF;
        IF (mismatch_vin_a1_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


-- General Purpose data out check
checkcin_a1_s : process (clk, areset)
variable mismatch_cin_a1_s : BOOLEAN := FALSE;
variable ok : BOOLEAN := TRUE;
begin
    IF ((areset = '1')) THEN
        -- do nothing during reset
    ELSIF (clk'EVENT AND clk = '0') THEN -- falling clock edge to avoid transitions
        ok := TRUE;
        mismatch_cin_a1_s := FALSE;
        IF ( (cin_a1_s_dut /= cin_a1_s_stm) and vin_a1_s_dut = "1") THEN
            mismatch_cin_a1_s := TRUE;
            report "Mismatch on device output pin cin_a1_s" severity Warning;
        END IF;
        IF (mismatch_cin_a1_s = TRUE) THEN
            ok := FALSE;
        END IF;
        assert (ok)
        report "mismatch in device level signal." severity Failure;
    END IF;
END PROCESS;


dut : standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_dut,
    busOut_readdata_dut,
    busOut_waitrequest_dut,
    din_dec_out_0im_stm,
    din_dec_out_0re_stm,
    din_dec_out_1im_stm,
    din_dec_out_1re_stm,
    din_dec_out_2im_stm,
    din_dec_out_2re_stm,
    din_dec_out_3im_stm,
    din_dec_out_3re_stm,
    din_dec_in_0im_stm,
    din_dec_in_0re_stm,
    din_dec_in_1im_stm,
    din_dec_in_1re_stm,
    din_dec_in_2im_stm,
    din_dec_in_2re_stm,
    din_dec_in_3im_stm,
    din_dec_in_3re_stm,
    din_dec_in_4im_stm,
    din_dec_in_4re_stm,
    din_dec_in_5im_stm,
    din_dec_in_5re_stm,
    din_dec_in_6im_stm,
    din_dec_in_6re_stm,
    din_dec_in_7im_stm,
    din_dec_in_7re_stm,
    vin_dec_out_s_stm,
    cin_dec_in_s_stm,
    cin_dec_out_s_stm,
    vin_dec_in_s_stm,
    din_a1_0im_dut,
    din_a1_0re_dut,
    din_a1_1im_dut,
    din_a1_1re_dut,
    din_a1_2im_dut,
    din_a1_2re_dut,
    din_a1_3im_dut,
    din_a1_3re_dut,
    vin_a1_s_dut,
    cin_a1_s_dut,
        clk,
        areset,
        bus_clk,
        bus_areset
);

sim : standaloneTopLevel_dec_dly_comp_DUT_DUT_By_Pass_x_stm port map (
    busIn_writedata_stm,
    busIn_address_stm,
    busIn_write_stm,
    busIn_read_stm,
    busOut_readdatavalid_stm,
    busOut_readdata_stm,
    busOut_waitrequest_stm,
    din_dec_out_0im_stm,
    din_dec_out_0re_stm,
    din_dec_out_1im_stm,
    din_dec_out_1re_stm,
    din_dec_out_2im_stm,
    din_dec_out_2re_stm,
    din_dec_out_3im_stm,
    din_dec_out_3re_stm,
    din_dec_in_0im_stm,
    din_dec_in_0re_stm,
    din_dec_in_1im_stm,
    din_dec_in_1re_stm,
    din_dec_in_2im_stm,
    din_dec_in_2re_stm,
    din_dec_in_3im_stm,
    din_dec_in_3re_stm,
    din_dec_in_4im_stm,
    din_dec_in_4re_stm,
    din_dec_in_5im_stm,
    din_dec_in_5re_stm,
    din_dec_in_6im_stm,
    din_dec_in_6re_stm,
    din_dec_in_7im_stm,
    din_dec_in_7re_stm,
    vin_dec_out_s_stm,
    cin_dec_in_s_stm,
    cin_dec_out_s_stm,
    vin_dec_in_s_stm,
    din_a1_0im_stm,
    din_a1_0re_stm,
    din_a1_1im_stm,
    din_a1_1re_stm,
    din_a1_2im_stm,
    din_a1_2re_stm,
    din_a1_3im_stm,
    din_a1_3re_stm,
    vin_a1_s_stm,
    cin_a1_s_stm,
        clk,
        areset,
        bus_clk,
        bus_areset
);

end normal;
