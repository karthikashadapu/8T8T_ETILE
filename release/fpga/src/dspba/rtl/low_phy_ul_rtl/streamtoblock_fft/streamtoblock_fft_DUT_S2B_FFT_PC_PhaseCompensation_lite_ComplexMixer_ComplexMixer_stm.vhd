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

-- VHDL created from streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer
-- VHDL created on Thu Jun 12 21:29:58 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.streamtoblock_fft_DUT_safe_path.all;

entity streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_stm is
    port (
        In_v_stm : out std_logic_vector(0 downto 0);
        In_c_stm : out std_logic_vector(7 downto 0);
        iIn_0_stm : out std_logic_vector(15 downto 0);
        qIn_0_stm : out std_logic_vector(15 downto 0);
        sIn_0_stm : out std_logic_vector(17 downto 0);
        cIn_0_stm : out std_logic_vector(17 downto 0);
        qOut_0_stm : out std_logic_vector(34 downto 0);
        Out_v_stm : out std_logic_vector(0 downto 0);
        Out_c_stm : out std_logic_vector(7 downto 0);
        iOut_0_stm : out std_logic_vector(34 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_stm;

architecture normal of streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal clk_iIn_stm_sig_stop : std_logic := '0';
    signal clk_qIn_stm_sig_stop : std_logic := '0';
    signal clk_sIn_stm_sig_stop : std_logic := '0';
    signal clk_cIn_stm_sig_stop : std_logic := '0';
    signal clk_qOut_stm_sig_stop : std_logic := '0';
    signal clk_iOut_stm_sig_stop : std_logic := '0';

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

    areset <= areset_stm_sig;
    areset_process: process begin
        areset_stm_sig <= '1';
        wait for 1525 ps;
        wait for 1023*2034 ps; -- additional reset delay
        areset_stm_sig <= '0';
        wait;
    end process;


        -- Generating stimulus for iIn
        iIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_iIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_iIn.stm");
            variable In_v_int_0 : Integer;
            variable In_v_temp : std_logic_vector(0 downto 0);
            variable In_c_int_0 : Integer;
            variable In_c_temp : std_logic_vector(7 downto 0);
            variable iIn_0_int_0 : Integer;
            variable iIn_0_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_v_stm <= (others => '0');
            In_c_stm <= (others => '0');
            iIn_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_v_stm <= (others => '0');
                In_c_stm <= (others => '0');
                iIn_0_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_iIn)) THEN
                    clk_iIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_iIn, L);
                    
                    read(L, In_v_int_0);
                    In_v_temp(0 downto 0) := std_logic_vector(to_unsigned(In_v_int_0, 1));
                    In_v_stm <= In_v_temp;
                    read(L, In_c_int_0);
                    In_c_temp(7 downto 0) := std_logic_vector(to_unsigned(In_c_int_0, 8));
                    In_c_stm <= In_c_temp;
                    read(L, iIn_0_int_0);
                    iIn_0_temp(15 downto 0) := std_logic_vector(to_unsigned(iIn_0_int_0, 16));
                    iIn_0_stm <= iIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for qIn
        qIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_qIn.stm");
            variable qIn_0_int_0 : Integer;
            variable qIn_0_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            qIn_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                qIn_0_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_qIn)) THEN
                    clk_qIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qIn, L);
                    
                    read(L, qIn_0_int_0);
                    qIn_0_temp(15 downto 0) := std_logic_vector(to_unsigned(qIn_0_int_0, 16));
                    qIn_0_stm <= qIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for sIn
        sIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_sIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_sIn.stm");
            variable sIn_0_int_0 : Integer;
            variable sIn_0_temp : std_logic_vector(17 downto 0);

        begin
            -- initialize all outputs to 0
            sIn_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                sIn_0_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_sIn)) THEN
                    clk_sIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_sIn, L);
                    
                    read(L, sIn_0_int_0);
                    sIn_0_temp(17 downto 0) := std_logic_vector(to_unsigned(sIn_0_int_0, 18));
                    sIn_0_stm <= sIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for cIn
        cIn_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_cIn : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_cIn.stm");
            variable cIn_0_int_0 : Integer;
            variable cIn_0_temp : std_logic_vector(17 downto 0);

        begin
            -- initialize all outputs to 0
            cIn_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                cIn_0_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_cIn)) THEN
                    clk_cIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_cIn, L);
                    
                    read(L, cIn_0_int_0);
                    cIn_0_temp(17 downto 0) := std_logic_vector(to_unsigned(cIn_0_int_0, 18));
                    cIn_0_stm <= cIn_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for qOut
        qOut_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_qOut.stm");
            variable qOut_0_int_0 : Integer;
            variable qOut_0_int_1 : Integer;
            variable qOut_0_temp : std_logic_vector(34 downto 0);

        begin
            -- initialize all outputs to 0
            qOut_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_qOut)) THEN
                    clk_qOut_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, qOut_0_int_0);
                    qOut_0_temp(31 downto 0) := std_logic_vector(to_signed(qOut_0_int_0, 32));
                    read(L, qOut_0_int_1);
                    qOut_0_temp(34 downto 32) := std_logic_vector(to_unsigned(qOut_0_int_1, 3));
                    qOut_0_stm <= qOut_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for iOut
        iOut_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_iOut : text open read_mode is safe_path("streamtoblock_fft/streamtoblock_fft_DUT_S2B_FFT_PC_PhaseCompensation_lite_ComplexMixer_ComplexMixer_iOut.stm");
            variable Out_v_int_0 : Integer;
            variable Out_v_temp : std_logic_vector(0 downto 0);
            variable Out_c_int_0 : Integer;
            variable Out_c_temp : std_logic_vector(7 downto 0);
            variable iOut_0_int_0 : Integer;
            variable iOut_0_int_1 : Integer;
            variable iOut_0_temp : std_logic_vector(34 downto 0);

        begin
            -- initialize all outputs to 0
            Out_v_stm <= (others => '0');
            Out_c_stm <= (others => '0');
            iOut_0_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                IF (endfile(data_file_iOut)) THEN
                    clk_iOut_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_iOut, L);
                    
                    read(L, Out_v_int_0);
                    Out_v_temp(0 downto 0) := std_logic_vector(to_unsigned(Out_v_int_0, 1));
                    Out_v_stm <= Out_v_temp;
                    read(L, Out_c_int_0);
                    Out_c_temp(7 downto 0) := std_logic_vector(to_unsigned(Out_c_int_0, 8));
                    Out_c_stm <= Out_c_temp;
                    read(L, iOut_0_int_0);
                    iOut_0_temp(31 downto 0) := std_logic_vector(to_signed(iOut_0_int_0, 32));
                    read(L, iOut_0_int_1);
                    iOut_0_temp(34 downto 32) := std_logic_vector(to_unsigned(iOut_0_int_1, 3));
                    iOut_0_stm <= iOut_0_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_iIn_stm_sig_stop OR clk_qIn_stm_sig_stop OR clk_sIn_stm_sig_stop OR clk_cIn_stm_sig_stop OR clk_qOut_stm_sig_stop OR clk_iOut_stm_sig_stop OR '0';


    END normal;
