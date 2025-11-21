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

-- VHDL created from standaloneTopLevel_dec_dly_comp_DUT_DUT
-- VHDL created on Tue Jan  7 17:06:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.dec_dly_comp_DUT_safe_path.all;

entity standaloneTopLevel_dec_dly_comp_DUT_DUT_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        In_v_s_stm : out std_logic_vector(0 downto 0);
        In_c_s_stm : out std_logic_vector(7 downto 0);
        In_d_0im_stm : out std_logic_vector(15 downto 0);
        In_d_0re_stm : out std_logic_vector(15 downto 0);
        In_d_1im_stm : out std_logic_vector(15 downto 0);
        In_d_1re_stm : out std_logic_vector(15 downto 0);
        In_d_2im_stm : out std_logic_vector(15 downto 0);
        In_d_2re_stm : out std_logic_vector(15 downto 0);
        In_d_3im_stm : out std_logic_vector(15 downto 0);
        In_d_3re_stm : out std_logic_vector(15 downto 0);
        In_d_4im_stm : out std_logic_vector(15 downto 0);
        In_d_4re_stm : out std_logic_vector(15 downto 0);
        In_d_5im_stm : out std_logic_vector(15 downto 0);
        In_d_5re_stm : out std_logic_vector(15 downto 0);
        In_d_6im_stm : out std_logic_vector(15 downto 0);
        In_d_6re_stm : out std_logic_vector(15 downto 0);
        In_d_7im_stm : out std_logic_vector(15 downto 0);
        In_d_7re_stm : out std_logic_vector(15 downto 0);
        q1_0im_stm : out std_logic_vector(31 downto 0);
        q1_0re_stm : out std_logic_vector(31 downto 0);
        q1_1im_stm : out std_logic_vector(31 downto 0);
        q1_1re_stm : out std_logic_vector(31 downto 0);
        q1_2im_stm : out std_logic_vector(31 downto 0);
        q1_2re_stm : out std_logic_vector(31 downto 0);
        q1_3im_stm : out std_logic_vector(31 downto 0);
        q1_3re_stm : out std_logic_vector(31 downto 0);
        q_v1_s_stm : out std_logic_vector(0 downto 0);
        q_c1_s_stm : out std_logic_vector(7 downto 0);
        q2_0im_stm : out std_logic_vector(31 downto 0);
        q2_0re_stm : out std_logic_vector(31 downto 0);
        q2_1im_stm : out std_logic_vector(31 downto 0);
        q2_1re_stm : out std_logic_vector(31 downto 0);
        q2_2im_stm : out std_logic_vector(31 downto 0);
        q2_2re_stm : out std_logic_vector(31 downto 0);
        q2_3im_stm : out std_logic_vector(31 downto 0);
        q2_3re_stm : out std_logic_vector(31 downto 0);
        q_v2_s_stm : out std_logic_vector(0 downto 0);
        q_c2_s_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end standaloneTopLevel_dec_dly_comp_DUT_DUT_stm;

architecture normal of standaloneTopLevel_dec_dly_comp_DUT_DUT_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal clk_In_v_s_stm_sig_stop : std_logic := '0';
    signal clk_In_c_s_stm_sig_stop : std_logic := '0';
    signal clk_In_d_0im_stm_sig_stop : std_logic := '0';
    signal clk_In_d_0re_stm_sig_stop : std_logic := '0';
    signal clk_In_d_1im_stm_sig_stop : std_logic := '0';
    signal clk_In_d_1re_stm_sig_stop : std_logic := '0';
    signal clk_In_d_2im_stm_sig_stop : std_logic := '0';
    signal clk_In_d_2re_stm_sig_stop : std_logic := '0';
    signal clk_In_d_3im_stm_sig_stop : std_logic := '0';
    signal clk_In_d_3re_stm_sig_stop : std_logic := '0';
    signal clk_In_d_4im_stm_sig_stop : std_logic := '0';
    signal clk_In_d_4re_stm_sig_stop : std_logic := '0';
    signal clk_In_d_5im_stm_sig_stop : std_logic := '0';
    signal clk_In_d_5re_stm_sig_stop : std_logic := '0';
    signal clk_In_d_6im_stm_sig_stop : std_logic := '0';
    signal clk_In_d_6re_stm_sig_stop : std_logic := '0';
    signal clk_In_d_7im_stm_sig_stop : std_logic := '0';
    signal clk_In_d_7re_stm_sig_stop : std_logic := '0';
    signal clk_q1_0im_stm_sig_stop : std_logic := '0';
    signal clk_q1_0re_stm_sig_stop : std_logic := '0';
    signal clk_q1_1im_stm_sig_stop : std_logic := '0';
    signal clk_q1_1re_stm_sig_stop : std_logic := '0';
    signal clk_q1_2im_stm_sig_stop : std_logic := '0';
    signal clk_q1_2re_stm_sig_stop : std_logic := '0';
    signal clk_q1_3im_stm_sig_stop : std_logic := '0';
    signal clk_q1_3re_stm_sig_stop : std_logic := '0';
    signal clk_q_v1_s_stm_sig_stop : std_logic := '0';
    signal clk_q_c1_s_stm_sig_stop : std_logic := '0';
    signal clk_q2_0im_stm_sig_stop : std_logic := '0';
    signal clk_q2_0re_stm_sig_stop : std_logic := '0';
    signal clk_q2_1im_stm_sig_stop : std_logic := '0';
    signal clk_q2_1re_stm_sig_stop : std_logic := '0';
    signal clk_q2_2im_stm_sig_stop : std_logic := '0';
    signal clk_q2_2re_stm_sig_stop : std_logic := '0';
    signal clk_q2_3im_stm_sig_stop : std_logic := '0';
    signal clk_q2_3re_stm_sig_stop : std_logic := '0';
    signal clk_q_v2_s_stm_sig_stop : std_logic := '0';
    signal clk_q_c2_s_stm_sig_stop : std_logic := '0';

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

        -- Driving gnd for busIn signals

        busIn_writedata_stm <= (others => '0');
        busIn_address_stm <= (others => '0');
        busIn_write_stm <= (others => '0');
        busIn_read_stm <= (others => '0');

        -- Generating stub busOut - no stimulus
        -- initialize all outputs to 0
        busOut_readdatavalid_stm <= (others => '0');
        busOut_readdata_stm <= (others => '0');
        busOut_waitrequest_stm <= (others => '0');

        -- Generating stimulus for In_v_s
        In_v_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_6_vin_dec_in_tpl_int_0 : Integer;
            variable in_6_vin_dec_in_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            In_v_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_v_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_v_s)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_v_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, in_6_vin_dec_in_tpl_int_0);
                    in_6_vin_dec_in_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_6_vin_dec_in_tpl_int_0, 1));
                    In_v_s_stm <= in_6_vin_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_c_s
        In_c_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_4_cin_dec_in_tpl_int_0 : Integer;
            variable in_4_cin_dec_in_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            In_c_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_c_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_c_s)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_c_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_4_cin_dec_in_tpl_int_0);
                    in_4_cin_dec_in_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_4_cin_dec_in_tpl_int_0, 8));
                    In_c_s_stm <= in_4_cin_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_0im
        In_d_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_0_imag_din_dec_in_tpl_int_0 : Integer;
            variable in_2_0_imag_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_0im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_0im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_0_imag_din_dec_in_tpl_int_0);
                    in_2_0_imag_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_0_imag_din_dec_in_tpl_int_0, 16));
                    In_d_0im_stm <= in_2_0_imag_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_0re
        In_d_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_0_real_din_dec_in_tpl_int_0 : Integer;
            variable in_2_0_real_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_0re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_0re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_0_real_din_dec_in_tpl_int_0);
                    in_2_0_real_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_0_real_din_dec_in_tpl_int_0, 16));
                    In_d_0re_stm <= in_2_0_real_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_1im
        In_d_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_1_imag_din_dec_in_tpl_int_0 : Integer;
            variable in_2_1_imag_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_1im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_1im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_1_imag_din_dec_in_tpl_int_0);
                    in_2_1_imag_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_1_imag_din_dec_in_tpl_int_0, 16));
                    In_d_1im_stm <= in_2_1_imag_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_1re
        In_d_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_1_real_din_dec_in_tpl_int_0 : Integer;
            variable in_2_1_real_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_1re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_1re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_1_real_din_dec_in_tpl_int_0);
                    in_2_1_real_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_1_real_din_dec_in_tpl_int_0, 16));
                    In_d_1re_stm <= in_2_1_real_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_2im
        In_d_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_2_imag_din_dec_in_tpl_int_0 : Integer;
            variable in_2_2_imag_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_2im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_2im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_2_imag_din_dec_in_tpl_int_0);
                    in_2_2_imag_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_2_imag_din_dec_in_tpl_int_0, 16));
                    In_d_2im_stm <= in_2_2_imag_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_2re
        In_d_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_2_real_din_dec_in_tpl_int_0 : Integer;
            variable in_2_2_real_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_2re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_2re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_2_real_din_dec_in_tpl_int_0);
                    in_2_2_real_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_2_real_din_dec_in_tpl_int_0, 16));
                    In_d_2re_stm <= in_2_2_real_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_3im
        In_d_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_3_imag_din_dec_in_tpl_int_0 : Integer;
            variable in_2_3_imag_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_3im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_3im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_3_imag_din_dec_in_tpl_int_0);
                    in_2_3_imag_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_3_imag_din_dec_in_tpl_int_0, 16));
                    In_d_3im_stm <= in_2_3_imag_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_3re
        In_d_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_3_real_din_dec_in_tpl_int_0 : Integer;
            variable in_2_3_real_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_3re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_3re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_3_real_din_dec_in_tpl_int_0);
                    in_2_3_real_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_3_real_din_dec_in_tpl_int_0, 16));
                    In_d_3re_stm <= in_2_3_real_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_4im
        In_d_4im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_4_imag_din_dec_in_tpl_int_0 : Integer;
            variable in_2_4_imag_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_4im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_4im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_4im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_4im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_4_imag_din_dec_in_tpl_int_0);
                    in_2_4_imag_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_4_imag_din_dec_in_tpl_int_0, 16));
                    In_d_4im_stm <= in_2_4_imag_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_4re
        In_d_4re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_4_real_din_dec_in_tpl_int_0 : Integer;
            variable in_2_4_real_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_4re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_4re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_4re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_4re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_4_real_din_dec_in_tpl_int_0);
                    in_2_4_real_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_4_real_din_dec_in_tpl_int_0, 16));
                    In_d_4re_stm <= in_2_4_real_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_5im
        In_d_5im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_5_imag_din_dec_in_tpl_int_0 : Integer;
            variable in_2_5_imag_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_5im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_5im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_5im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_5im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_5_imag_din_dec_in_tpl_int_0);
                    in_2_5_imag_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_5_imag_din_dec_in_tpl_int_0, 16));
                    In_d_5im_stm <= in_2_5_imag_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_5re
        In_d_5re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_5_real_din_dec_in_tpl_int_0 : Integer;
            variable in_2_5_real_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_5re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_5re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_5re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_5re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_5_real_din_dec_in_tpl_int_0);
                    in_2_5_real_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_5_real_din_dec_in_tpl_int_0, 16));
                    In_d_5re_stm <= in_2_5_real_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_6im
        In_d_6im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_6_imag_din_dec_in_tpl_int_0 : Integer;
            variable in_2_6_imag_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_6im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_6im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_6im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_6im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_6_imag_din_dec_in_tpl_int_0);
                    in_2_6_imag_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_6_imag_din_dec_in_tpl_int_0, 16));
                    In_d_6im_stm <= in_2_6_imag_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_6re
        In_d_6re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_6_real_din_dec_in_tpl_int_0 : Integer;
            variable in_2_6_real_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_6re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_6re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_6re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_6re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_6_real_din_dec_in_tpl_int_0);
                    in_2_6_real_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_6_real_din_dec_in_tpl_int_0, 16));
                    In_d_6re_stm <= in_2_6_real_din_dec_in_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_7im
        In_d_7im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_7_imag_din_dec_in_tpl_int_0 : Integer;
            variable in_2_7_imag_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_7im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_7im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_7im)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_7im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_7_imag_din_dec_in_tpl_int_0);
                    in_2_7_imag_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_7_imag_din_dec_in_tpl_int_0, 16));
                    In_d_7im_stm <= in_2_7_imag_din_dec_in_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In_d_7re
        In_d_7re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_By_Pass_Channel_In1_HB_Bypass_vunroll_cunroll_x.stm");
            variable in_2_7_real_din_dec_in_tpl_int_0 : Integer;
            variable in_2_7_real_din_dec_in_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In_d_7re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In_d_7re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to In_d_7re)
                IF (endfile(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x)) THEN
                    clk_In_d_7re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_In1_HB_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_2_7_real_din_dec_in_tpl_int_0);
                    in_2_7_real_din_dec_in_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_2_7_real_din_dec_in_tpl_int_0, 16));
                    In_d_7re_stm <= in_2_7_real_din_dec_in_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q1_0im
        q1_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_0_imag_altq_tpl_int_0 : Integer;
            variable out_1_0_imag_altq_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q1_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q1_0im)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q1_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_0_imag_altq_tpl_int_0);
                    out_1_0_imag_altq_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_0_imag_altq_tpl_int_0, 32));
                    q1_0im_stm <= out_1_0_imag_altq_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q1_0re
        q1_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_0_real_altq_tpl_int_0 : Integer;
            variable out_1_0_real_altq_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q1_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q1_0re)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q1_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_0_real_altq_tpl_int_0);
                    out_1_0_real_altq_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_0_real_altq_tpl_int_0, 32));
                    q1_0re_stm <= out_1_0_real_altq_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q1_1im
        q1_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_1_imag_altq_tpl_int_0 : Integer;
            variable out_1_1_imag_altq_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q1_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q1_1im)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q1_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_1_imag_altq_tpl_int_0);
                    out_1_1_imag_altq_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_1_imag_altq_tpl_int_0, 32));
                    q1_1im_stm <= out_1_1_imag_altq_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q1_1re
        q1_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_1_real_altq_tpl_int_0 : Integer;
            variable out_1_1_real_altq_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q1_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q1_1re)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q1_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_1_real_altq_tpl_int_0);
                    out_1_1_real_altq_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_1_real_altq_tpl_int_0, 32));
                    q1_1re_stm <= out_1_1_real_altq_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q1_2im
        q1_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_2_imag_altq_tpl_int_0 : Integer;
            variable out_1_2_imag_altq_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q1_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q1_2im)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q1_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_2_imag_altq_tpl_int_0);
                    out_1_2_imag_altq_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_2_imag_altq_tpl_int_0, 32));
                    q1_2im_stm <= out_1_2_imag_altq_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q1_2re
        q1_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_2_real_altq_tpl_int_0 : Integer;
            variable out_1_2_real_altq_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q1_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q1_2re)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q1_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_2_real_altq_tpl_int_0);
                    out_1_2_real_altq_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_2_real_altq_tpl_int_0, 32));
                    q1_2re_stm <= out_1_2_real_altq_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q1_3im
        q1_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_3_imag_altq_tpl_int_0 : Integer;
            variable out_1_3_imag_altq_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q1_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q1_3im)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q1_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_3_imag_altq_tpl_int_0);
                    out_1_3_imag_altq_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_3_imag_altq_tpl_int_0, 32));
                    q1_3im_stm <= out_1_3_imag_altq_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q1_3re
        q1_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_3_real_altq_tpl_int_0 : Integer;
            variable out_1_3_real_altq_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q1_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q1_3re)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q1_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_3_real_altq_tpl_int_0);
                    out_1_3_real_altq_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_3_real_altq_tpl_int_0, 32));
                    q1_3re_stm <= out_1_3_real_altq_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q_v1_s
        q_v1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_2_altv_tpl_int_0 : Integer;
            variable out_2_altv_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            q_v1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q_v1_s)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q_v1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, out_2_altv_tpl_int_0);
                    out_2_altv_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_2_altv_tpl_int_0, 1));
                    q_v1_s_stm <= out_2_altv_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q_c1_s
        q_c1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut_vunroll_cunroll_x.stm");
            variable out_3_altc_tpl_int_0 : Integer;
            variable out_3_altc_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            q_c1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q_c1_s)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_q_c1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_3_altc_tpl_int_0);
                    out_3_altc_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_3_altc_tpl_int_0, 8));
                    q_c1_s_stm <= out_3_altc_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q2_0im
        q2_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_0_imag_altq1_tpl_int_0 : Integer;
            variable out_4_0_imag_altq1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q2_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q2_0im)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q2_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_0_imag_altq1_tpl_int_0);
                    out_4_0_imag_altq1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_0_imag_altq1_tpl_int_0, 32));
                    q2_0im_stm <= out_4_0_imag_altq1_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q2_0re
        q2_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_0_real_altq1_tpl_int_0 : Integer;
            variable out_4_0_real_altq1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q2_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q2_0re)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q2_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_0_real_altq1_tpl_int_0);
                    out_4_0_real_altq1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_0_real_altq1_tpl_int_0, 32));
                    q2_0re_stm <= out_4_0_real_altq1_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q2_1im
        q2_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_1_imag_altq1_tpl_int_0 : Integer;
            variable out_4_1_imag_altq1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q2_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q2_1im)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q2_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_1_imag_altq1_tpl_int_0);
                    out_4_1_imag_altq1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_1_imag_altq1_tpl_int_0, 32));
                    q2_1im_stm <= out_4_1_imag_altq1_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q2_1re
        q2_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_1_real_altq1_tpl_int_0 : Integer;
            variable out_4_1_real_altq1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q2_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q2_1re)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q2_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_1_real_altq1_tpl_int_0);
                    out_4_1_real_altq1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_1_real_altq1_tpl_int_0, 32));
                    q2_1re_stm <= out_4_1_real_altq1_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q2_2im
        q2_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_2_imag_altq1_tpl_int_0 : Integer;
            variable out_4_2_imag_altq1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q2_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q2_2im)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q2_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_2_imag_altq1_tpl_int_0);
                    out_4_2_imag_altq1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_2_imag_altq1_tpl_int_0, 32));
                    q2_2im_stm <= out_4_2_imag_altq1_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q2_2re
        q2_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_2_real_altq1_tpl_int_0 : Integer;
            variable out_4_2_real_altq1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q2_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q2_2re)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q2_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_2_real_altq1_tpl_int_0);
                    out_4_2_real_altq1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_2_real_altq1_tpl_int_0, 32));
                    q2_2re_stm <= out_4_2_real_altq1_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q2_3im
        q2_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_3_imag_altq1_tpl_int_0 : Integer;
            variable out_4_3_imag_altq1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q2_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q2_3im)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q2_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_3_imag_altq1_tpl_int_0);
                    out_4_3_imag_altq1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_3_imag_altq1_tpl_int_0, 32));
                    q2_3im_stm <= out_4_3_imag_altq1_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q2_3re
        q2_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_3_real_altq1_tpl_int_0 : Integer;
            variable out_4_3_real_altq1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            q2_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q2_3re)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q2_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_3_real_altq1_tpl_int_0);
                    out_4_3_real_altq1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_3_real_altq1_tpl_int_0, 32));
                    q2_3re_stm <= out_4_3_real_altq1_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q_v2_s
        q_v2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_5_altqv1_tpl_int_0 : Integer;
            variable out_5_altqv1_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            q_v2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q_v2_s)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q_v2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, out_5_altqv1_tpl_int_0);
                    out_5_altqv1_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_5_altqv1_tpl_int_0, 1));
                    q_v2_s_stm <= out_5_altqv1_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for q_c2_s
        q_c2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Delay_Compensation_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_6_altc1_tpl_int_0 : Integer;
            variable out_6_altc1_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            q_c2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to q_c2_s)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_q_c2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_6_altc1_tpl_int_0);
                    out_6_altc1_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_6_altc1_tpl_int_0, 8));
                    q_c2_s_stm <= out_6_altc1_tpl_temp;
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_In_v_s_stm_sig_stop OR clk_In_c_s_stm_sig_stop OR clk_In_d_0im_stm_sig_stop OR clk_In_d_0re_stm_sig_stop OR clk_In_d_1im_stm_sig_stop OR clk_In_d_1re_stm_sig_stop OR clk_In_d_2im_stm_sig_stop OR clk_In_d_2re_stm_sig_stop OR clk_In_d_3im_stm_sig_stop OR clk_In_d_3re_stm_sig_stop OR clk_In_d_4im_stm_sig_stop OR clk_In_d_4re_stm_sig_stop OR clk_In_d_5im_stm_sig_stop OR clk_In_d_5re_stm_sig_stop OR clk_In_d_6im_stm_sig_stop OR clk_In_d_6re_stm_sig_stop OR clk_In_d_7im_stm_sig_stop OR clk_In_d_7re_stm_sig_stop OR clk_q1_0im_stm_sig_stop OR clk_q1_0re_stm_sig_stop OR clk_q1_1im_stm_sig_stop OR clk_q1_1re_stm_sig_stop OR clk_q1_2im_stm_sig_stop OR clk_q1_2re_stm_sig_stop OR clk_q1_3im_stm_sig_stop OR clk_q1_3re_stm_sig_stop OR clk_q_v1_s_stm_sig_stop OR clk_q_c1_s_stm_sig_stop OR clk_q2_0im_stm_sig_stop OR clk_q2_0re_stm_sig_stop OR clk_q2_1im_stm_sig_stop OR clk_q2_1re_stm_sig_stop OR clk_q2_2im_stm_sig_stop OR clk_q2_2re_stm_sig_stop OR clk_q2_3im_stm_sig_stop OR clk_q2_3re_stm_sig_stop OR clk_q_v2_s_stm_sig_stop OR clk_q_c2_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= '1';


    END normal;
