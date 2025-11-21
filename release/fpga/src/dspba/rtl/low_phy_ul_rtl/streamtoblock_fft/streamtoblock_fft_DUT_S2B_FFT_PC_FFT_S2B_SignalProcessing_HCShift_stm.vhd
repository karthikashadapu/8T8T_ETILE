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
use std.TextIO.all;
USE work.streamtoblock_fft_DUT_safe_path.all;

entity streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_stm is
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
end streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_stm;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal bus_clk_busIn_stm_sig_stop : std_logic := '0';

    function str_to_stdvec(inp: string) return std_logic_vector is
        variable temp: std_logic_vector(inp'range) := (others => 'X');
    begin
        for i in inp'range loop
            IF ((inp(i) = '1')) THEN
                temp(i) := '1';
            elsif (inp(i) = '0') then
                temp(i) := '0';
            END IF;
            end loop;
            return temp;
        end function str_to_stdvec;
        

    begin

    clk <= clk_stm_sig;
    clk_process: process 
    begin
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 817 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
        wait for 200 ps;
        clk_stm_sig <= not clk_stm_sig;
        wait for 817 ps;
        if (clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk clk" severity NOTE;
            wait;
        end if;
    end process;

    bus_clk <= bus_clk_stm_sig;
    bus_clk_process: process 
    begin
        wait for 200 ps;
        bus_clk_stm_sig <= not bus_clk_stm_sig;
        wait for 4800 ps;
        if (bus_clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk bus_clk" severity NOTE;
            wait;
        end if;
        wait for 200 ps;
        bus_clk_stm_sig <= not bus_clk_stm_sig;
        wait for 4800 ps;
        if (bus_clk_stm_sig_stop = '1') then
            assert (false)
            report "Arrived at end of stimulus data on clk bus_clk" severity NOTE;
            wait;
        end if;
    end process;

    areset <= areset_stm_sig;
    areset_process: process begin
        areset_stm_sig <= '1';
        wait for 1525 ps;
        wait for 1023*2034 ps; -- additional reset delay
        areset_stm_sig <= '0';
        wait;
    end process;

    bus_areset <= bus_areset_stm_sig;
    bus_areset_process: process begin
        bus_areset_stm_sig <= '1';
        wait for 7500 ps;
        wait for 1023*2034 ps; -- additional reset delay
        bus_areset_stm_sig <= '0';
        wait;
    end process;


        -- Generating stimulus for busIn
        busIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_busIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_busIn.stm");
            variable busIn_writedata_int_0 : Integer;
            variable busIn_writedata_temp : std_logic_vector(31 downto 0);
            variable busIn_address_int_0 : Integer;
            variable busIn_address_temp : std_logic_vector(13 downto 0);
            variable busIn_write_int_0 : Integer;
            variable busIn_write_temp : std_logic_vector(0 downto 0);
            variable busIn_read_int_0 : Integer;
            variable busIn_read_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            busIn_writedata_stm <= (others => '0');
            busIn_address_stm <= (others => '0');
            busIn_write_stm <= (others => '0');
            busIn_read_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_busIn)) THEN
                    bus_clk_busIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_busIn, L);
                    
                    read(L, busIn_writedata_int_0);
                    busIn_writedata_temp(31 downto 0) := std_logic_vector(to_signed(busIn_writedata_int_0, 32));
                    busIn_writedata_stm <= busIn_writedata_temp;
                    read(L, busIn_address_int_0);
                    busIn_address_temp(13 downto 0) := std_logic_vector(to_unsigned(busIn_address_int_0, 14));
                    busIn_address_stm <= busIn_address_temp;
                    read(L, busIn_write_int_0);
                    busIn_write_temp(0 downto 0) := std_logic_vector(to_unsigned(busIn_write_int_0, 1));
                    busIn_write_stm <= busIn_write_temp;
                    read(L, busIn_read_int_0);
                    busIn_read_temp(0 downto 0) := std_logic_vector(to_unsigned(busIn_read_int_0, 1));
                    busIn_read_stm <= busIn_read_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until bus_clk_stm_sig'EVENT and bus_clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stub busOut - no stimulus
        -- initialize all outputs to 0
        busOut_readdatavalid_stm <= (others => '0');
        busOut_readdata_stm <= (others => '0');
        -- Driving gnd for in_1_vin_tpl signals

        in_1_vin_tpl_stm <= (others => '0');
        -- Driving gnd for in_2_cin_tpl signals

        in_2_cin_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_imag_din_tpl signals

        in_3_imag_din_tpl_stm <= (others => '0');
        -- Driving gnd for in_3_real_din_tpl signals

        in_3_real_din_tpl_stm <= (others => '0');
        -- Driving gnd for in_4_sync_tpl signals

        in_4_sync_tpl_stm <= (others => '0');
        -- Driving gnd for in_5_size_tpl signals

        in_5_size_tpl_stm <= (others => '0');
        -- Driving gnd for in_6_nsc_tpl signals

        in_6_nsc_tpl_stm <= (others => '0');
        -- Driving gnd for in_7_hcs_bypass_tpl signals

        in_7_hcs_bypass_tpl_stm <= (others => '0');
        -- Driving gnd for in_8_SFNin_tpl signals

        in_8_SFNin_tpl_stm <= (others => '0');
        -- Driving gnd for in_9_eAxC_tpl signals

        in_9_eAxC_tpl_stm <= (others => '0');
        -- Driving gnd for in_10_sym_metadata_tpl signals

        in_10_sym_metadata_tpl_stm <= (others => '0');
        -- Driving gnd for out_1_vout_tpl signals

        out_1_vout_tpl_stm <= (others => '0');
        -- Driving gnd for out_2_cout_tpl signals

        out_2_cout_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_imag_dout_tpl signals

        out_3_imag_dout_tpl_stm <= (others => '0');
        -- Driving gnd for out_3_real_dout_tpl signals

        out_3_real_dout_tpl_stm <= (others => '0');
        -- Driving gnd for out_4_nsc_out_tpl signals

        out_4_nsc_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_5_size_out_tpl signals

        out_5_size_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_6_SFNout_tpl signals

        out_6_SFNout_tpl_stm <= (others => '0');
        -- Driving gnd for out_7_eAxC_out_tpl signals

        out_7_eAxC_out_tpl_stm <= (others => '0');
        -- Driving gnd for out_8_sym_metadataout_tpl signals

        out_8_sym_metadataout_tpl_stm <= (others => '0');

    clk_stm_sig_stop <= '1';
    bus_clk_stm_sig_stop <= bus_clk_busIn_stm_sig_stop OR '0';


    END normal;
