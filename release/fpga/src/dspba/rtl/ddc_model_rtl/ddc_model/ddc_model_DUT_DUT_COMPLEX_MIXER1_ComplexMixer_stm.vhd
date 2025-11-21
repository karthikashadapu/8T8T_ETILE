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

-- VHDL created from ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer
-- VHDL created on Thu Jan  9 15:36:35 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.ddc_model_DUT_safe_path.all;

entity ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_stm is
    port (
        In_v_stm : out std_logic_vector(0 downto 0);
        In_c_stm : out std_logic_vector(7 downto 0);
        iIn_0_stm : out std_logic_vector(31 downto 0);
        iIn_1_stm : out std_logic_vector(31 downto 0);
        iIn_2_stm : out std_logic_vector(31 downto 0);
        iIn_3_stm : out std_logic_vector(31 downto 0);
        qIn_0_stm : out std_logic_vector(31 downto 0);
        qIn_1_stm : out std_logic_vector(31 downto 0);
        qIn_2_stm : out std_logic_vector(31 downto 0);
        qIn_3_stm : out std_logic_vector(31 downto 0);
        sIn_0_stm : out std_logic_vector(15 downto 0);
        sIn_1_stm : out std_logic_vector(15 downto 0);
        sIn_2_stm : out std_logic_vector(15 downto 0);
        sIn_3_stm : out std_logic_vector(15 downto 0);
        cIn_0_stm : out std_logic_vector(15 downto 0);
        cIn_1_stm : out std_logic_vector(15 downto 0);
        cIn_2_stm : out std_logic_vector(15 downto 0);
        cIn_3_stm : out std_logic_vector(15 downto 0);
        qOut_0_stm : out std_logic_vector(48 downto 0);
        qOut_1_stm : out std_logic_vector(48 downto 0);
        qOut_2_stm : out std_logic_vector(48 downto 0);
        qOut_3_stm : out std_logic_vector(48 downto 0);
        Out_v_stm : out std_logic_vector(0 downto 0);
        Out_c_stm : out std_logic_vector(7 downto 0);
        iOut_0_stm : out std_logic_vector(48 downto 0);
        iOut_1_stm : out std_logic_vector(48 downto 0);
        iOut_2_stm : out std_logic_vector(48 downto 0);
        iOut_3_stm : out std_logic_vector(48 downto 0);
        clk : out std_logic;
        areset : out std_logic
    );
end ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_stm;

architecture normal of ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_stm is

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
            file data_file_iIn : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_iIn.stm");
            variable In_v_int_0 : Integer;
            variable In_v_temp : std_logic_vector(0 downto 0);
            variable In_c_int_0 : Integer;
            variable In_c_temp : std_logic_vector(7 downto 0);
            variable iIn_0_int_0 : Integer;
            variable iIn_0_temp : std_logic_vector(31 downto 0);
            variable iIn_1_int_0 : Integer;
            variable iIn_1_temp : std_logic_vector(31 downto 0);
            variable iIn_2_int_0 : Integer;
            variable iIn_2_temp : std_logic_vector(31 downto 0);
            variable iIn_3_int_0 : Integer;
            variable iIn_3_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            In_v_stm <= (others => '0');
            In_c_stm <= (others => '0');
            iIn_0_stm <= (others => '0');
            iIn_1_stm <= (others => '0');
            iIn_2_stm <= (others => '0');
            iIn_3_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_v_stm <= (others => '0');
                In_c_stm <= (others => '0');
                iIn_0_stm <= (others => '0');
                iIn_1_stm <= (others => '0');
                iIn_2_stm <= (others => '0');
                iIn_3_stm <= (others => '0');
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
                    iIn_0_temp(31 downto 0) := std_logic_vector(to_signed(iIn_0_int_0, 32));
                    iIn_0_stm <= iIn_0_temp;
                    read(L, iIn_1_int_0);
                    iIn_1_temp(31 downto 0) := std_logic_vector(to_signed(iIn_1_int_0, 32));
                    iIn_1_stm <= iIn_1_temp;
                    read(L, iIn_2_int_0);
                    iIn_2_temp(31 downto 0) := std_logic_vector(to_signed(iIn_2_int_0, 32));
                    iIn_2_stm <= iIn_2_temp;
                    read(L, iIn_3_int_0);
                    iIn_3_temp(31 downto 0) := std_logic_vector(to_signed(iIn_3_int_0, 32));
                    iIn_3_stm <= iIn_3_temp;

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
            file data_file_qIn : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_qIn.stm");
            variable qIn_0_int_0 : Integer;
            variable qIn_0_temp : std_logic_vector(31 downto 0);
            variable qIn_1_int_0 : Integer;
            variable qIn_1_temp : std_logic_vector(31 downto 0);
            variable qIn_2_int_0 : Integer;
            variable qIn_2_temp : std_logic_vector(31 downto 0);
            variable qIn_3_int_0 : Integer;
            variable qIn_3_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            qIn_0_stm <= (others => '0');
            qIn_1_stm <= (others => '0');
            qIn_2_stm <= (others => '0');
            qIn_3_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                qIn_0_stm <= (others => '0');
                qIn_1_stm <= (others => '0');
                qIn_2_stm <= (others => '0');
                qIn_3_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_qIn)) THEN
                    clk_qIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qIn, L);
                    
                    read(L, qIn_0_int_0);
                    qIn_0_temp(31 downto 0) := std_logic_vector(to_signed(qIn_0_int_0, 32));
                    qIn_0_stm <= qIn_0_temp;
                    read(L, qIn_1_int_0);
                    qIn_1_temp(31 downto 0) := std_logic_vector(to_signed(qIn_1_int_0, 32));
                    qIn_1_stm <= qIn_1_temp;
                    read(L, qIn_2_int_0);
                    qIn_2_temp(31 downto 0) := std_logic_vector(to_signed(qIn_2_int_0, 32));
                    qIn_2_stm <= qIn_2_temp;
                    read(L, qIn_3_int_0);
                    qIn_3_temp(31 downto 0) := std_logic_vector(to_signed(qIn_3_int_0, 32));
                    qIn_3_stm <= qIn_3_temp;

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
            file data_file_sIn : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_sIn.stm");
            variable sIn_0_int_0 : Integer;
            variable sIn_0_temp : std_logic_vector(15 downto 0);
            variable sIn_1_int_0 : Integer;
            variable sIn_1_temp : std_logic_vector(15 downto 0);
            variable sIn_2_int_0 : Integer;
            variable sIn_2_temp : std_logic_vector(15 downto 0);
            variable sIn_3_int_0 : Integer;
            variable sIn_3_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            sIn_0_stm <= (others => '0');
            sIn_1_stm <= (others => '0');
            sIn_2_stm <= (others => '0');
            sIn_3_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                sIn_0_stm <= (others => '0');
                sIn_1_stm <= (others => '0');
                sIn_2_stm <= (others => '0');
                sIn_3_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_sIn)) THEN
                    clk_sIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_sIn, L);
                    
                    read(L, sIn_0_int_0);
                    sIn_0_temp(15 downto 0) := std_logic_vector(to_unsigned(sIn_0_int_0, 16));
                    sIn_0_stm <= sIn_0_temp;
                    read(L, sIn_1_int_0);
                    sIn_1_temp(15 downto 0) := std_logic_vector(to_unsigned(sIn_1_int_0, 16));
                    sIn_1_stm <= sIn_1_temp;
                    read(L, sIn_2_int_0);
                    sIn_2_temp(15 downto 0) := std_logic_vector(to_unsigned(sIn_2_int_0, 16));
                    sIn_2_stm <= sIn_2_temp;
                    read(L, sIn_3_int_0);
                    sIn_3_temp(15 downto 0) := std_logic_vector(to_unsigned(sIn_3_int_0, 16));
                    sIn_3_stm <= sIn_3_temp;

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
            file data_file_cIn : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_cIn.stm");
            variable cIn_0_int_0 : Integer;
            variable cIn_0_temp : std_logic_vector(15 downto 0);
            variable cIn_1_int_0 : Integer;
            variable cIn_1_temp : std_logic_vector(15 downto 0);
            variable cIn_2_int_0 : Integer;
            variable cIn_2_temp : std_logic_vector(15 downto 0);
            variable cIn_3_int_0 : Integer;
            variable cIn_3_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            cIn_0_stm <= (others => '0');
            cIn_1_stm <= (others => '0');
            cIn_2_stm <= (others => '0');
            cIn_3_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                cIn_0_stm <= (others => '0');
                cIn_1_stm <= (others => '0');
                cIn_2_stm <= (others => '0');
                cIn_3_stm <= (others => '0');
            end loop;
            while true loop
            
                IF (endfile(data_file_cIn)) THEN
                    clk_cIn_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_cIn, L);
                    
                    read(L, cIn_0_int_0);
                    cIn_0_temp(15 downto 0) := std_logic_vector(to_unsigned(cIn_0_int_0, 16));
                    cIn_0_stm <= cIn_0_temp;
                    read(L, cIn_1_int_0);
                    cIn_1_temp(15 downto 0) := std_logic_vector(to_unsigned(cIn_1_int_0, 16));
                    cIn_1_stm <= cIn_1_temp;
                    read(L, cIn_2_int_0);
                    cIn_2_temp(15 downto 0) := std_logic_vector(to_unsigned(cIn_2_int_0, 16));
                    cIn_2_stm <= cIn_2_temp;
                    read(L, cIn_3_int_0);
                    cIn_3_temp(15 downto 0) := std_logic_vector(to_unsigned(cIn_3_int_0, 16));
                    cIn_3_stm <= cIn_3_temp;

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
            file data_file_qOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_qOut.stm");
            variable qOut_0_int_0 : Integer;
            variable qOut_0_int_1 : Integer;
            variable qOut_0_temp : std_logic_vector(48 downto 0);
            variable qOut_1_int_0 : Integer;
            variable qOut_1_int_1 : Integer;
            variable qOut_1_temp : std_logic_vector(48 downto 0);
            variable qOut_2_int_0 : Integer;
            variable qOut_2_int_1 : Integer;
            variable qOut_2_temp : std_logic_vector(48 downto 0);
            variable qOut_3_int_0 : Integer;
            variable qOut_3_int_1 : Integer;
            variable qOut_3_temp : std_logic_vector(48 downto 0);

        begin
            -- initialize all outputs to 0
            qOut_0_stm <= (others => '0');
            qOut_1_stm <= (others => '0');
            qOut_2_stm <= (others => '0');
            qOut_3_stm <= (others => '0');

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
                    qOut_0_temp(48 downto 32) := std_logic_vector(to_unsigned(qOut_0_int_1, 17));
                    qOut_0_stm <= qOut_0_temp;
                    read(L, qOut_1_int_0);
                    qOut_1_temp(31 downto 0) := std_logic_vector(to_signed(qOut_1_int_0, 32));
                    read(L, qOut_1_int_1);
                    qOut_1_temp(48 downto 32) := std_logic_vector(to_unsigned(qOut_1_int_1, 17));
                    qOut_1_stm <= qOut_1_temp;
                    read(L, qOut_2_int_0);
                    qOut_2_temp(31 downto 0) := std_logic_vector(to_signed(qOut_2_int_0, 32));
                    read(L, qOut_2_int_1);
                    qOut_2_temp(48 downto 32) := std_logic_vector(to_unsigned(qOut_2_int_1, 17));
                    qOut_2_stm <= qOut_2_temp;
                    read(L, qOut_3_int_0);
                    qOut_3_temp(31 downto 0) := std_logic_vector(to_signed(qOut_3_int_0, 32));
                    read(L, qOut_3_int_1);
                    qOut_3_temp(48 downto 32) := std_logic_vector(to_unsigned(qOut_3_int_1, 17));
                    qOut_3_stm <= qOut_3_temp;

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
            file data_file_iOut : text open read_mode is safe_path("ddc_model/ddc_model_DUT_DUT_COMPLEX_MIXER1_ComplexMixer_iOut.stm");
            variable Out_v_int_0 : Integer;
            variable Out_v_temp : std_logic_vector(0 downto 0);
            variable Out_c_int_0 : Integer;
            variable Out_c_temp : std_logic_vector(7 downto 0);
            variable iOut_0_int_0 : Integer;
            variable iOut_0_int_1 : Integer;
            variable iOut_0_temp : std_logic_vector(48 downto 0);
            variable iOut_1_int_0 : Integer;
            variable iOut_1_int_1 : Integer;
            variable iOut_1_temp : std_logic_vector(48 downto 0);
            variable iOut_2_int_0 : Integer;
            variable iOut_2_int_1 : Integer;
            variable iOut_2_temp : std_logic_vector(48 downto 0);
            variable iOut_3_int_0 : Integer;
            variable iOut_3_int_1 : Integer;
            variable iOut_3_temp : std_logic_vector(48 downto 0);

        begin
            -- initialize all outputs to 0
            Out_v_stm <= (others => '0');
            Out_c_stm <= (others => '0');
            iOut_0_stm <= (others => '0');
            iOut_1_stm <= (others => '0');
            iOut_2_stm <= (others => '0');
            iOut_3_stm <= (others => '0');

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
                    iOut_0_temp(48 downto 32) := std_logic_vector(to_unsigned(iOut_0_int_1, 17));
                    iOut_0_stm <= iOut_0_temp;
                    read(L, iOut_1_int_0);
                    iOut_1_temp(31 downto 0) := std_logic_vector(to_signed(iOut_1_int_0, 32));
                    read(L, iOut_1_int_1);
                    iOut_1_temp(48 downto 32) := std_logic_vector(to_unsigned(iOut_1_int_1, 17));
                    iOut_1_stm <= iOut_1_temp;
                    read(L, iOut_2_int_0);
                    iOut_2_temp(31 downto 0) := std_logic_vector(to_signed(iOut_2_int_0, 32));
                    read(L, iOut_2_int_1);
                    iOut_2_temp(48 downto 32) := std_logic_vector(to_unsigned(iOut_2_int_1, 17));
                    iOut_2_stm <= iOut_2_temp;
                    read(L, iOut_3_int_0);
                    iOut_3_temp(31 downto 0) := std_logic_vector(to_signed(iOut_3_int_0, 32));
                    read(L, iOut_3_int_1);
                    iOut_3_temp(48 downto 32) := std_logic_vector(to_unsigned(iOut_3_int_1, 17));
                    iOut_3_stm <= iOut_3_temp;

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
