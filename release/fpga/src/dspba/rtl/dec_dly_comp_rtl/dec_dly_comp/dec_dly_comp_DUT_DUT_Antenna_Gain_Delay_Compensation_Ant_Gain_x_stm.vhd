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

-- VHDL created from standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x
-- VHDL created on Tue Jan  7 17:06:25 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.dec_dly_comp_DUT_safe_path.all;

entity standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        In1_s_stm : out std_logic_vector(0 downto 0);
        In2_s_stm : out std_logic_vector(7 downto 0);
        In3_0im_stm : out std_logic_vector(15 downto 0);
        In3_0re_stm : out std_logic_vector(15 downto 0);
        In3_1im_stm : out std_logic_vector(15 downto 0);
        In3_1re_stm : out std_logic_vector(15 downto 0);
        In3_2im_stm : out std_logic_vector(15 downto 0);
        In3_2re_stm : out std_logic_vector(15 downto 0);
        In3_3im_stm : out std_logic_vector(15 downto 0);
        In3_3re_stm : out std_logic_vector(15 downto 0);
        dout1_0im_stm : out std_logic_vector(31 downto 0);
        dout1_0re_stm : out std_logic_vector(31 downto 0);
        dout1_1im_stm : out std_logic_vector(31 downto 0);
        dout1_1re_stm : out std_logic_vector(31 downto 0);
        dout1_2im_stm : out std_logic_vector(31 downto 0);
        dout1_2re_stm : out std_logic_vector(31 downto 0);
        dout1_3im_stm : out std_logic_vector(31 downto 0);
        dout1_3re_stm : out std_logic_vector(31 downto 0);
        vout1_s_stm : out std_logic_vector(0 downto 0);
        cout1_s_stm : out std_logic_vector(7 downto 0);
        dout2_0im_stm : out std_logic_vector(31 downto 0);
        dout2_0re_stm : out std_logic_vector(31 downto 0);
        dout2_1im_stm : out std_logic_vector(31 downto 0);
        dout2_1re_stm : out std_logic_vector(31 downto 0);
        dout2_2im_stm : out std_logic_vector(31 downto 0);
        dout2_2re_stm : out std_logic_vector(31 downto 0);
        dout2_3im_stm : out std_logic_vector(31 downto 0);
        dout2_3re_stm : out std_logic_vector(31 downto 0);
        vout2_s_stm : out std_logic_vector(0 downto 0);
        cout2_s_stm : out std_logic_vector(7 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_stm;

architecture normal of standaloneTopLevel_dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_x_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal clk_In1_s_stm_sig_stop : std_logic := '0';
    signal clk_In2_s_stm_sig_stop : std_logic := '0';
    signal clk_In3_0im_stm_sig_stop : std_logic := '0';
    signal clk_In3_0re_stm_sig_stop : std_logic := '0';
    signal clk_In3_1im_stm_sig_stop : std_logic := '0';
    signal clk_In3_1re_stm_sig_stop : std_logic := '0';
    signal clk_In3_2im_stm_sig_stop : std_logic := '0';
    signal clk_In3_2re_stm_sig_stop : std_logic := '0';
    signal clk_In3_3im_stm_sig_stop : std_logic := '0';
    signal clk_In3_3re_stm_sig_stop : std_logic := '0';
    signal clk_dout1_0im_stm_sig_stop : std_logic := '0';
    signal clk_dout1_0re_stm_sig_stop : std_logic := '0';
    signal clk_dout1_1im_stm_sig_stop : std_logic := '0';
    signal clk_dout1_1re_stm_sig_stop : std_logic := '0';
    signal clk_dout1_2im_stm_sig_stop : std_logic := '0';
    signal clk_dout1_2re_stm_sig_stop : std_logic := '0';
    signal clk_dout1_3im_stm_sig_stop : std_logic := '0';
    signal clk_dout1_3re_stm_sig_stop : std_logic := '0';
    signal clk_vout1_s_stm_sig_stop : std_logic := '0';
    signal clk_cout1_s_stm_sig_stop : std_logic := '0';
    signal clk_dout2_0im_stm_sig_stop : std_logic := '0';
    signal clk_dout2_0re_stm_sig_stop : std_logic := '0';
    signal clk_dout2_1im_stm_sig_stop : std_logic := '0';
    signal clk_dout2_1re_stm_sig_stop : std_logic := '0';
    signal clk_dout2_2im_stm_sig_stop : std_logic := '0';
    signal clk_dout2_2re_stm_sig_stop : std_logic := '0';
    signal clk_dout2_3im_stm_sig_stop : std_logic := '0';
    signal clk_dout2_3re_stm_sig_stop : std_logic := '0';
    signal clk_vout2_s_stm_sig_stop : std_logic := '0';
    signal clk_cout2_s_stm_sig_stop : std_logic := '0';

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

        -- Generating stimulus for In1_s
        In1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_In1_tpl_int_0 : Integer;
            variable in_1_In1_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            In1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In1_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In1_s)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, in_1_In1_tpl_int_0);
                    in_1_In1_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_1_In1_tpl_int_0, 1));
                    In1_s_stm <= in_1_In1_tpl_temp;
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

        -- Generating stimulus for In2_s
        In2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_2_In2_tpl_int_0 : Integer;
            variable in_2_In2_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            In2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In2_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In2_s)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_2_In2_tpl_int_0);
                    in_2_In2_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_2_In2_tpl_int_0, 8));
                    In2_s_stm <= in_2_In2_tpl_temp;
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

        -- Generating stimulus for In3_0im
        In3_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_0_imag_In3_tpl_int_0 : Integer;
            variable in_3_0_imag_In3_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In3_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In3_0im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In3_0im)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In3_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_0_imag_In3_tpl_int_0);
                    in_3_0_imag_In3_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_0_imag_In3_tpl_int_0, 16));
                    In3_0im_stm <= in_3_0_imag_In3_tpl_temp;
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

        -- Generating stimulus for In3_0re
        In3_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_0_real_In3_tpl_int_0 : Integer;
            variable in_3_0_real_In3_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In3_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In3_0re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In3_0re)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In3_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_0_real_In3_tpl_int_0);
                    in_3_0_real_In3_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_0_real_In3_tpl_int_0, 16));
                    In3_0re_stm <= in_3_0_real_In3_tpl_temp;
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

        -- Generating stimulus for In3_1im
        In3_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_1_imag_In3_tpl_int_0 : Integer;
            variable in_3_1_imag_In3_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In3_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In3_1im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In3_1im)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In3_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_1_imag_In3_tpl_int_0);
                    in_3_1_imag_In3_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_1_imag_In3_tpl_int_0, 16));
                    In3_1im_stm <= in_3_1_imag_In3_tpl_temp;
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

        -- Generating stimulus for In3_1re
        In3_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_1_real_In3_tpl_int_0 : Integer;
            variable in_3_1_real_In3_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In3_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In3_1re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In3_1re)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In3_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_1_real_In3_tpl_int_0);
                    in_3_1_real_In3_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_1_real_In3_tpl_int_0, 16));
                    In3_1re_stm <= in_3_1_real_In3_tpl_temp;
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

        -- Generating stimulus for In3_2im
        In3_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_2_imag_In3_tpl_int_0 : Integer;
            variable in_3_2_imag_In3_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In3_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In3_2im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In3_2im)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In3_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_2_imag_In3_tpl_int_0);
                    in_3_2_imag_In3_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_2_imag_In3_tpl_int_0, 16));
                    In3_2im_stm <= in_3_2_imag_In3_tpl_temp;
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

        -- Generating stimulus for In3_2re
        In3_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_2_real_In3_tpl_int_0 : Integer;
            variable in_3_2_real_In3_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In3_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In3_2re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In3_2re)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In3_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_2_real_In3_tpl_int_0);
                    in_3_2_real_In3_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_2_real_In3_tpl_int_0, 16));
                    In3_2re_stm <= in_3_2_real_In3_tpl_temp;
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

        -- Generating stimulus for In3_3im
        In3_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_3_imag_In3_tpl_int_0 : Integer;
            variable in_3_3_imag_In3_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In3_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In3_3im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In3_3im)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In3_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_3_imag_In3_tpl_int_0);
                    in_3_3_imag_In3_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_3_imag_In3_tpl_int_0, 16));
                    In3_3im_stm <= in_3_3_imag_In3_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for In3_3re
        In3_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_3_real_In3_tpl_int_0 : Integer;
            variable in_3_3_real_In3_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            In3_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                In3_3re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to In3_3re)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_In3_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_3_3_real_In3_tpl_int_0);
                    in_3_3_real_In3_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_3_3_real_In3_tpl_int_0, 16));
                    In3_3re_stm <= in_3_3_real_In3_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout1_0im
        dout1_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_0_imag_dout1_tpl_int_0 : Integer;
            variable out_1_0_imag_dout1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_0im)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_dout1_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_0_imag_dout1_tpl_int_0);
                    out_1_0_imag_dout1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_0_imag_dout1_tpl_int_0, 32));
                    dout1_0im_stm <= out_1_0_imag_dout1_tpl_temp;
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

        -- Generating stimulus for dout1_0re
        dout1_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_0_real_dout1_tpl_int_0 : Integer;
            variable out_1_0_real_dout1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_0re)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_dout1_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_0_real_dout1_tpl_int_0);
                    out_1_0_real_dout1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_0_real_dout1_tpl_int_0, 32));
                    dout1_0re_stm <= out_1_0_real_dout1_tpl_temp;
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

        -- Generating stimulus for dout1_1im
        dout1_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_1_imag_dout1_tpl_int_0 : Integer;
            variable out_1_1_imag_dout1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_1im)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_dout1_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_1_imag_dout1_tpl_int_0);
                    out_1_1_imag_dout1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_1_imag_dout1_tpl_int_0, 32));
                    dout1_1im_stm <= out_1_1_imag_dout1_tpl_temp;
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

        -- Generating stimulus for dout1_1re
        dout1_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_1_real_dout1_tpl_int_0 : Integer;
            variable out_1_1_real_dout1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_1re)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_dout1_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_1_real_dout1_tpl_int_0);
                    out_1_1_real_dout1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_1_real_dout1_tpl_int_0, 32));
                    dout1_1re_stm <= out_1_1_real_dout1_tpl_temp;
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

        -- Generating stimulus for dout1_2im
        dout1_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_2_imag_dout1_tpl_int_0 : Integer;
            variable out_1_2_imag_dout1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_2im)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_dout1_2im_stm_sig_stop <= '1';
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
                    read(L, out_1_2_imag_dout1_tpl_int_0);
                    out_1_2_imag_dout1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_2_imag_dout1_tpl_int_0, 32));
                    dout1_2im_stm <= out_1_2_imag_dout1_tpl_temp;
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

        -- Generating stimulus for dout1_2re
        dout1_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_2_real_dout1_tpl_int_0 : Integer;
            variable out_1_2_real_dout1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_2re)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_dout1_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_2_real_dout1_tpl_int_0);
                    out_1_2_real_dout1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_2_real_dout1_tpl_int_0, 32));
                    dout1_2re_stm <= out_1_2_real_dout1_tpl_temp;
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

        -- Generating stimulus for dout1_3im
        dout1_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_3_imag_dout1_tpl_int_0 : Integer;
            variable out_1_3_imag_dout1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_3im)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_dout1_3im_stm_sig_stop <= '1';
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
                    read(L, out_1_3_imag_dout1_tpl_int_0);
                    out_1_3_imag_dout1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_3_imag_dout1_tpl_int_0, 32));
                    dout1_3im_stm <= out_1_3_imag_dout1_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout1_3re
        dout1_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_1_3_real_dout1_tpl_int_0 : Integer;
            variable out_1_3_real_dout1_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout1_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout1_3re)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_dout1_3re_stm_sig_stop <= '1';
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
                    read(L, out_1_3_real_dout1_tpl_int_0);
                    out_1_3_real_dout1_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_3_real_dout1_tpl_int_0, 32));
                    dout1_3re_stm <= out_1_3_real_dout1_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for vout1_s
        vout1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_2_vout1_tpl_int_0 : Integer;
            variable out_2_vout1_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vout1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to vout1_s)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_vout1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, out_2_vout1_tpl_int_0);
                    out_2_vout1_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_2_vout1_tpl_int_0, 1));
                    vout1_s_stm <= out_2_vout1_tpl_temp;
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

        -- Generating stimulus for cout1_s
        cout1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut_vunroll_cunroll_x.stm");
            variable out_3_cout1_tpl_int_0 : Integer;
            variable out_3_cout1_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            cout1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to cout1_s)
                IF (endfile(data_file_ChannelOut_vunroll_cunroll_x)) THEN
                    clk_cout1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_3_cout1_tpl_int_0);
                    out_3_cout1_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_3_cout1_tpl_int_0, 8));
                    cout1_s_stm <= out_3_cout1_tpl_temp;
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

        -- Generating stimulus for dout2_0im
        dout2_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_0_imag_dout2_tpl_int_0 : Integer;
            variable out_4_0_imag_dout2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_0im)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_dout2_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_0_imag_dout2_tpl_int_0);
                    out_4_0_imag_dout2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_0_imag_dout2_tpl_int_0, 32));
                    dout2_0im_stm <= out_4_0_imag_dout2_tpl_temp;
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

        -- Generating stimulus for dout2_0re
        dout2_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_0_real_dout2_tpl_int_0 : Integer;
            variable out_4_0_real_dout2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_0re)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_dout2_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_0_real_dout2_tpl_int_0);
                    out_4_0_real_dout2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_0_real_dout2_tpl_int_0, 32));
                    dout2_0re_stm <= out_4_0_real_dout2_tpl_temp;
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

        -- Generating stimulus for dout2_1im
        dout2_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_1_imag_dout2_tpl_int_0 : Integer;
            variable out_4_1_imag_dout2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_1im)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_dout2_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_1_imag_dout2_tpl_int_0);
                    out_4_1_imag_dout2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_1_imag_dout2_tpl_int_0, 32));
                    dout2_1im_stm <= out_4_1_imag_dout2_tpl_temp;
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

        -- Generating stimulus for dout2_1re
        dout2_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_1_real_dout2_tpl_int_0 : Integer;
            variable out_4_1_real_dout2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_1re)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_dout2_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_1_real_dout2_tpl_int_0);
                    out_4_1_real_dout2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_1_real_dout2_tpl_int_0, 32));
                    dout2_1re_stm <= out_4_1_real_dout2_tpl_temp;
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

        -- Generating stimulus for dout2_2im
        dout2_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_2_imag_dout2_tpl_int_0 : Integer;
            variable out_4_2_imag_dout2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_2im)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_dout2_2im_stm_sig_stop <= '1';
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
                    read(L, out_4_2_imag_dout2_tpl_int_0);
                    out_4_2_imag_dout2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_2_imag_dout2_tpl_int_0, 32));
                    dout2_2im_stm <= out_4_2_imag_dout2_tpl_temp;
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

        -- Generating stimulus for dout2_2re
        dout2_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_2_real_dout2_tpl_int_0 : Integer;
            variable out_4_2_real_dout2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_2re)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_dout2_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_4_2_real_dout2_tpl_int_0);
                    out_4_2_real_dout2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_2_real_dout2_tpl_int_0, 32));
                    dout2_2re_stm <= out_4_2_real_dout2_tpl_temp;
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

        -- Generating stimulus for dout2_3im
        dout2_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_3_imag_dout2_tpl_int_0 : Integer;
            variable out_4_3_imag_dout2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_3im)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_dout2_3im_stm_sig_stop <= '1';
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
                    read(L, out_4_3_imag_dout2_tpl_int_0);
                    out_4_3_imag_dout2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_3_imag_dout2_tpl_int_0, 32));
                    dout2_3im_stm <= out_4_3_imag_dout2_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout2_3re
        dout2_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_4_3_real_dout2_tpl_int_0 : Integer;
            variable out_4_3_real_dout2_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            dout2_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout2_3re)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_dout2_3re_stm_sig_stop <= '1';
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
                    read(L, out_4_3_real_dout2_tpl_int_0);
                    out_4_3_real_dout2_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_4_3_real_dout2_tpl_int_0, 32));
                    dout2_3re_stm <= out_4_3_real_dout2_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for vout2_s
        vout2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_5_vout2_tpl_int_0 : Integer;
            variable out_5_vout2_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vout2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to vout2_s)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_vout2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, out_5_vout2_tpl_int_0);
                    out_5_vout2_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_5_vout2_tpl_int_0, 1));
                    vout2_s_stm <= out_5_vout2_tpl_temp;
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

        -- Generating stimulus for cout2_s
        cout2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut1_vunroll_cunroll_x : text open read_mode is safe_path("dec_dly_comp/dec_dly_comp_DUT_DUT_Antenna_Gain_Delay_Compensation_Ant_Gain_ChannelOut1_vunroll_cunroll_x.stm");
            variable out_6_cout2_tpl_int_0 : Integer;
            variable out_6_cout2_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            cout2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to cout2_s)
                IF (endfile(data_file_ChannelOut1_vunroll_cunroll_x)) THEN
                    clk_cout2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_6_cout2_tpl_int_0);
                    out_6_cout2_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_6_cout2_tpl_int_0, 8));
                    cout2_s_stm <= out_6_cout2_tpl_temp;
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

    clk_stm_sig_stop <= clk_In1_s_stm_sig_stop OR clk_In2_s_stm_sig_stop OR clk_In3_0im_stm_sig_stop OR clk_In3_0re_stm_sig_stop OR clk_In3_1im_stm_sig_stop OR clk_In3_1re_stm_sig_stop OR clk_In3_2im_stm_sig_stop OR clk_In3_2re_stm_sig_stop OR clk_In3_3im_stm_sig_stop OR clk_In3_3re_stm_sig_stop OR clk_dout1_0im_stm_sig_stop OR clk_dout1_0re_stm_sig_stop OR clk_dout1_1im_stm_sig_stop OR clk_dout1_1re_stm_sig_stop OR clk_dout1_2im_stm_sig_stop OR clk_dout1_2re_stm_sig_stop OR clk_dout1_3im_stm_sig_stop OR clk_dout1_3re_stm_sig_stop OR clk_vout1_s_stm_sig_stop OR clk_cout1_s_stm_sig_stop OR clk_dout2_0im_stm_sig_stop OR clk_dout2_0re_stm_sig_stop OR clk_dout2_1im_stm_sig_stop OR clk_dout2_1re_stm_sig_stop OR clk_dout2_2im_stm_sig_stop OR clk_dout2_2re_stm_sig_stop OR clk_dout2_3im_stm_sig_stop OR clk_dout2_3re_stm_sig_stop OR clk_vout2_s_stm_sig_stop OR clk_cout2_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= '1';


    END normal;
