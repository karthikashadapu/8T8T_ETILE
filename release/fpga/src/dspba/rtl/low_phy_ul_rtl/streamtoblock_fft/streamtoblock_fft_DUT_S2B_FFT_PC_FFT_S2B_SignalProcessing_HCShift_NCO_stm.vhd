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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO
-- VHDL created on Thu Jun 12 21:29:58 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.streamtoblock_fft_DUT_safe_path.all;

entity streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_stm is
    port (
        xIn_v_stm : out std_logic_vector(0 downto 0);
        xIn_c_stm : out std_logic_vector(7 downto 0);
        xIn_p_0_stm : out std_logic_vector(29 downto 0);
        xIn_s_0_stm : out std_logic_vector(0 downto 0);
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        ncoOut_v_stm : out std_logic_vector(0 downto 0);
        ncoOut_c_stm : out std_logic_vector(7 downto 0);
        sinOut_0_stm : out std_logic_vector(17 downto 0);
        cosOut_0_stm : out std_logic_vector(17 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_stm;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal clk_xIn_stm_sig_stop : std_logic := '0';
    signal bus_clk_busIn_stm_sig_stop : std_logic := '0';
    signal bus_clk_busOut_stm_sig_stop : std_logic := '0';
    signal clk_ncoOut_stm_sig_stop : std_logic := '0';

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


        -- Generating stimulus for xIn
        xIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_xIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_xIn.stm");
            variable xIn_v_int_0 : Integer;
            variable xIn_v_temp : std_logic_vector(0 downto 0);
            variable xIn_c_int_0 : Integer;
            variable xIn_c_temp : std_logic_vector(7 downto 0);
            variable xIn_p_0_int_0 : Integer;
            variable xIn_p_0_temp : std_logic_vector(29 downto 0);
            variable xIn_s_0_int_0 : Integer;
            variable xIn_s_0_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            xIn_v_stm <= (others => '0');
            xIn_c_stm <= (others => '0');
            xIn_p_0_stm <= (others => '0');
            xIn_s_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                xIn_v_stm <= (others => '0');
                xIn_c_stm <= (others => '0');
                xIn_p_0_stm <= (others => '0');
                xIn_s_0_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_xIn)) THEN
                    clk_xIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_xIn, L);
                    
                    read(L, xIn_v_int_0);
                    xIn_v_temp(0 downto 0) := std_logic_vector(to_unsigned(xIn_v_int_0, 1));
                    xIn_v_stm <= xIn_v_temp;
                    read(L, xIn_c_int_0);
                    xIn_c_temp(7 downto 0) := std_logic_vector(to_unsigned(xIn_c_int_0, 8));
                    xIn_c_stm <= xIn_c_temp;
                    read(L, xIn_p_0_int_0);
                    xIn_p_0_temp(29 downto 0) := std_logic_vector(to_unsigned(xIn_p_0_int_0, 30));
                    xIn_p_0_stm <= xIn_p_0_temp;
                    read(L, xIn_s_0_int_0);
                    xIn_s_0_temp(0 downto 0) := std_logic_vector(to_unsigned(xIn_s_0_int_0, 1));
                    xIn_s_0_stm <= xIn_s_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for busIn
        busIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_busIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_busIn.stm");
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

        -- Generating stimulus for busOut
        busOut_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_busOut : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_busOut.stm");
            variable busOut_readdatavalid_int_0 : Integer;
            variable busOut_readdatavalid_temp : std_logic_vector(0 downto 0);
            variable busOut_readdata_int_0 : Integer;
            variable busOut_readdata_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            busOut_readdatavalid_stm <= (others => '0');
            busOut_readdata_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_busOut)) THEN
                    bus_clk_busOut_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_busOut, L);
                    
                    read(L, busOut_readdatavalid_int_0);
                    busOut_readdatavalid_temp(0 downto 0) := std_logic_vector(to_unsigned(busOut_readdatavalid_int_0, 1));
                    busOut_readdatavalid_stm <= busOut_readdatavalid_temp;
                    read(L, busOut_readdata_int_0);
                    busOut_readdata_temp(31 downto 0) := std_logic_vector(to_signed(busOut_readdata_int_0, 32));
                    busOut_readdata_stm <= busOut_readdata_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until bus_clk_stm_sig'EVENT and bus_clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for ncoOut
        ncoOut_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ncoOut : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_FFT_S2B_SignalProcessing_HCShift_NCO_ncoOut.stm");
            variable ncoOut_v_int_0 : Integer;
            variable ncoOut_v_temp : std_logic_vector(0 downto 0);
            variable ncoOut_c_int_0 : Integer;
            variable ncoOut_c_temp : std_logic_vector(7 downto 0);
            variable sinOut_0_int_0 : Integer;
            variable sinOut_0_temp : std_logic_vector(17 downto 0);
            variable cosOut_0_int_0 : Integer;
            variable cosOut_0_temp : std_logic_vector(17 downto 0);

        begin
            -- initialize all outputs to 0
            ncoOut_v_stm <= (others => '0');
            ncoOut_c_stm <= (others => '0');
            sinOut_0_stm <= (others => '0');
            cosOut_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_ncoOut)) THEN
                    clk_ncoOut_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ncoOut, L);
                    
                    read(L, ncoOut_v_int_0);
                    ncoOut_v_temp(0 downto 0) := std_logic_vector(to_unsigned(ncoOut_v_int_0, 1));
                    ncoOut_v_stm <= ncoOut_v_temp;
                    read(L, ncoOut_c_int_0);
                    ncoOut_c_temp(7 downto 0) := std_logic_vector(to_unsigned(ncoOut_c_int_0, 8));
                    ncoOut_c_stm <= ncoOut_c_temp;
                    read(L, sinOut_0_int_0);
                    sinOut_0_temp(17 downto 0) := std_logic_vector(to_unsigned(sinOut_0_int_0, 18));
                    sinOut_0_stm <= sinOut_0_temp;
                    read(L, cosOut_0_int_0);
                    cosOut_0_temp(17 downto 0) := std_logic_vector(to_unsigned(cosOut_0_int_0, 18));
                    cosOut_0_stm <= cosOut_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_xIn_stm_sig_stop OR clk_ncoOut_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= bus_clk_busIn_stm_sig_stop OR bus_clk_busOut_stm_sig_stop OR '0';


    END normal;
