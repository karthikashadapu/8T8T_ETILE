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

-- VHDL created from ca_interp_DUT
-- VHDL created on Tue Jan  7 17:04:26 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.ca_interp_DUT_safe_path.all;

entity ca_interp_DUT_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(13 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        DUC_Valid_l1_s_stm : out std_logic_vector(0 downto 0);
        DUC_Chan_l1_s_stm : out std_logic_vector(7 downto 0);
        DUC_Data_l1_0im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_0re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_1im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_1re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_2im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_2re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_3im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l1_3re_stm : out std_logic_vector(15 downto 0);
        DUC_Valid_l2_s_stm : out std_logic_vector(0 downto 0);
        DUC_Chan_l2_s_stm : out std_logic_vector(7 downto 0);
        DUC_Data_l2_0im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_0re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_1im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_1re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_2im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_2re_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_3im_stm : out std_logic_vector(15 downto 0);
        DUC_Data_l2_3re_stm : out std_logic_vector(15 downto 0);
        DUC_Valid_Out_s_stm : out std_logic_vector(0 downto 0);
        DUC_Chan_Out_s_stm : out std_logic_vector(7 downto 0);
        DUC_Ant_Data_Out_0im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_0re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_1im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_1re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_2im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_2re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_3im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_3re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_4im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_4re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_5im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_5re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_6im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_6re_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_7im_stm : out std_logic_vector(15 downto 0);
        DUC_Ant_Data_Out_7re_stm : out std_logic_vector(15 downto 0);
        summer_vout_s_stm : out std_logic_vector(0 downto 0);
        summer_cout_s_stm : out std_logic_vector(7 downto 0);
        summer_dout_0im_stm : out std_logic_vector(15 downto 0);
        summer_dout_0re_stm : out std_logic_vector(15 downto 0);
        summer_dout_1im_stm : out std_logic_vector(15 downto 0);
        summer_dout_1re_stm : out std_logic_vector(15 downto 0);
        summer_dout_2im_stm : out std_logic_vector(15 downto 0);
        summer_dout_2re_stm : out std_logic_vector(15 downto 0);
        summer_dout_3im_stm : out std_logic_vector(15 downto 0);
        summer_dout_3re_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end ca_interp_DUT_stm;

architecture normal of ca_interp_DUT_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal clk_DUC_Valid_l1_s_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Chan_l1_s_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l1_0im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l1_0re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l1_1im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l1_1re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l1_2im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l1_2re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l1_3im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l1_3re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Valid_l2_s_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Chan_l2_s_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l2_0im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l2_0re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l2_1im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l2_1re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l2_2im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l2_2re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l2_3im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Data_l2_3re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Valid_Out_s_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Chan_Out_s_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_0im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_0re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_1im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_1re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_2im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_2re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_3im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_3re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_4im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_4re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_5im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_5re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_6im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_6re_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_7im_stm_sig_stop : std_logic := '0';
    signal clk_DUC_Ant_Data_Out_7re_stm_sig_stop : std_logic := '0';
    signal clk_summer_vout_s_stm_sig_stop : std_logic := '0';
    signal clk_summer_cout_s_stm_sig_stop : std_logic := '0';
    signal clk_summer_dout_0im_stm_sig_stop : std_logic := '0';
    signal clk_summer_dout_0re_stm_sig_stop : std_logic := '0';
    signal clk_summer_dout_1im_stm_sig_stop : std_logic := '0';
    signal clk_summer_dout_1re_stm_sig_stop : std_logic := '0';
    signal clk_summer_dout_2im_stm_sig_stop : std_logic := '0';
    signal clk_summer_dout_2re_stm_sig_stop : std_logic := '0';
    signal clk_summer_dout_3im_stm_sig_stop : std_logic := '0';
    signal clk_summer_dout_3re_stm_sig_stop : std_logic := '0';

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

        -- Generating stimulus for DUC_Valid_l1_s
        DUC_Valid_l1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_2_vin_a1_tpl_int_0 : Integer;
            variable in_2_vin_a1_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Valid_l1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Valid_l1_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Valid_l1_s)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Valid_l1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, in_2_vin_a1_tpl_int_0);
                    in_2_vin_a1_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_2_vin_a1_tpl_int_0, 1));
                    DUC_Valid_l1_s_stm <= in_2_vin_a1_tpl_temp;
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

        -- Generating stimulus for DUC_Chan_l1_s
        DUC_Chan_l1_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_3_cin_a1_tpl_int_0 : Integer;
            variable in_3_cin_a1_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Chan_l1_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Chan_l1_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Chan_l1_s)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Chan_l1_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_3_cin_a1_tpl_int_0);
                    in_3_cin_a1_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_3_cin_a1_tpl_int_0, 8));
                    DUC_Chan_l1_s_stm <= in_3_cin_a1_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l1_0im
        DUC_Data_l1_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_0_imag_din_a1_tpl_int_0 : Integer;
            variable in_1_0_imag_din_a1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l1_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l1_0im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l1_0im)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l1_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_0_imag_din_a1_tpl_int_0);
                    in_1_0_imag_din_a1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_0_imag_din_a1_tpl_int_0, 16));
                    DUC_Data_l1_0im_stm <= in_1_0_imag_din_a1_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l1_0re
        DUC_Data_l1_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_0_real_din_a1_tpl_int_0 : Integer;
            variable in_1_0_real_din_a1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l1_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l1_0re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l1_0re)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l1_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_0_real_din_a1_tpl_int_0);
                    in_1_0_real_din_a1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_0_real_din_a1_tpl_int_0, 16));
                    DUC_Data_l1_0re_stm <= in_1_0_real_din_a1_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l1_1im
        DUC_Data_l1_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_1_imag_din_a1_tpl_int_0 : Integer;
            variable in_1_1_imag_din_a1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l1_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l1_1im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l1_1im)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l1_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_1_imag_din_a1_tpl_int_0);
                    in_1_1_imag_din_a1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_1_imag_din_a1_tpl_int_0, 16));
                    DUC_Data_l1_1im_stm <= in_1_1_imag_din_a1_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l1_1re
        DUC_Data_l1_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_1_real_din_a1_tpl_int_0 : Integer;
            variable in_1_1_real_din_a1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l1_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l1_1re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l1_1re)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l1_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_1_real_din_a1_tpl_int_0);
                    in_1_1_real_din_a1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_1_real_din_a1_tpl_int_0, 16));
                    DUC_Data_l1_1re_stm <= in_1_1_real_din_a1_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l1_2im
        DUC_Data_l1_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_2_imag_din_a1_tpl_int_0 : Integer;
            variable in_1_2_imag_din_a1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l1_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l1_2im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l1_2im)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l1_2im_stm_sig_stop <= '1';
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
                    read(L, in_1_2_imag_din_a1_tpl_int_0);
                    in_1_2_imag_din_a1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_2_imag_din_a1_tpl_int_0, 16));
                    DUC_Data_l1_2im_stm <= in_1_2_imag_din_a1_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l1_2re
        DUC_Data_l1_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_2_real_din_a1_tpl_int_0 : Integer;
            variable in_1_2_real_din_a1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l1_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l1_2re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l1_2re)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l1_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_2_real_din_a1_tpl_int_0);
                    in_1_2_real_din_a1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_2_real_din_a1_tpl_int_0, 16));
                    DUC_Data_l1_2re_stm <= in_1_2_real_din_a1_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l1_3im
        DUC_Data_l1_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_3_imag_din_a1_tpl_int_0 : Integer;
            variable in_1_3_imag_din_a1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l1_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l1_3im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l1_3im)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l1_3im_stm_sig_stop <= '1';
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
                    read(L, in_1_3_imag_din_a1_tpl_int_0);
                    in_1_3_imag_din_a1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_3_imag_din_a1_tpl_int_0, 16));
                    DUC_Data_l1_3im_stm <= in_1_3_imag_din_a1_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DUC_Data_l1_3re
        DUC_Data_l1_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn_vunroll_cunroll_x.stm");
            variable in_1_3_real_din_a1_tpl_int_0 : Integer;
            variable in_1_3_real_din_a1_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l1_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l1_3re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l1_3re)
                IF (endfile(data_file_ChannelIn_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l1_3re_stm_sig_stop <= '1';
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
                    read(L, in_1_3_real_din_a1_tpl_int_0);
                    in_1_3_real_din_a1_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_3_real_din_a1_tpl_int_0, 16));
                    DUC_Data_l1_3re_stm <= in_1_3_real_din_a1_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DUC_Valid_l2_s
        DUC_Valid_l2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_5_vin_a2_tpl_int_0 : Integer;
            variable in_5_vin_a2_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Valid_l2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Valid_l2_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Valid_l2_s)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Valid_l2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, in_5_vin_a2_tpl_int_0);
                    in_5_vin_a2_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_5_vin_a2_tpl_int_0, 1));
                    DUC_Valid_l2_s_stm <= in_5_vin_a2_tpl_temp;
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

        -- Generating stimulus for DUC_Chan_l2_s
        DUC_Chan_l2_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_6_cin_a2_tpl_int_0 : Integer;
            variable in_6_cin_a2_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Chan_l2_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Chan_l2_s_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Chan_l2_s)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Chan_l2_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_6_cin_a2_tpl_int_0);
                    in_6_cin_a2_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_6_cin_a2_tpl_int_0, 8));
                    DUC_Chan_l2_s_stm <= in_6_cin_a2_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l2_0im
        DUC_Data_l2_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_4_0_imag_din_a2_tpl_int_0 : Integer;
            variable in_4_0_imag_din_a2_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l2_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l2_0im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l2_0im)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l2_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_0_imag_din_a2_tpl_int_0);
                    in_4_0_imag_din_a2_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_0_imag_din_a2_tpl_int_0, 16));
                    DUC_Data_l2_0im_stm <= in_4_0_imag_din_a2_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l2_0re
        DUC_Data_l2_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_4_0_real_din_a2_tpl_int_0 : Integer;
            variable in_4_0_real_din_a2_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l2_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l2_0re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l2_0re)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l2_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_0_real_din_a2_tpl_int_0);
                    in_4_0_real_din_a2_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_0_real_din_a2_tpl_int_0, 16));
                    DUC_Data_l2_0re_stm <= in_4_0_real_din_a2_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l2_1im
        DUC_Data_l2_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_4_1_imag_din_a2_tpl_int_0 : Integer;
            variable in_4_1_imag_din_a2_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l2_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l2_1im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l2_1im)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l2_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_1_imag_din_a2_tpl_int_0);
                    in_4_1_imag_din_a2_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_1_imag_din_a2_tpl_int_0, 16));
                    DUC_Data_l2_1im_stm <= in_4_1_imag_din_a2_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l2_1re
        DUC_Data_l2_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_4_1_real_din_a2_tpl_int_0 : Integer;
            variable in_4_1_real_din_a2_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l2_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l2_1re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l2_1re)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l2_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_1_real_din_a2_tpl_int_0);
                    in_4_1_real_din_a2_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_1_real_din_a2_tpl_int_0, 16));
                    DUC_Data_l2_1re_stm <= in_4_1_real_din_a2_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l2_2im
        DUC_Data_l2_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_4_2_imag_din_a2_tpl_int_0 : Integer;
            variable in_4_2_imag_din_a2_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l2_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l2_2im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l2_2im)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l2_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_2_imag_din_a2_tpl_int_0);
                    in_4_2_imag_din_a2_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_2_imag_din_a2_tpl_int_0, 16));
                    DUC_Data_l2_2im_stm <= in_4_2_imag_din_a2_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l2_2re
        DUC_Data_l2_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_4_2_real_din_a2_tpl_int_0 : Integer;
            variable in_4_2_real_din_a2_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l2_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l2_2re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l2_2re)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l2_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_2_real_din_a2_tpl_int_0);
                    in_4_2_real_din_a2_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_2_real_din_a2_tpl_int_0, 16));
                    DUC_Data_l2_2re_stm <= in_4_2_real_din_a2_tpl_temp;
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

        -- Generating stimulus for DUC_Data_l2_3im
        DUC_Data_l2_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_4_3_imag_din_a2_tpl_int_0 : Integer;
            variable in_4_3_imag_din_a2_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l2_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l2_3im_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l2_3im)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l2_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_3_imag_din_a2_tpl_int_0);
                    in_4_3_imag_din_a2_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_3_imag_din_a2_tpl_int_0, 16));
                    DUC_Data_l2_3im_stm <= in_4_3_imag_din_a2_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DUC_Data_l2_3re
        DUC_Data_l2_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn1_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_Delay_Compensation_ChannelIn1_vunroll_cunroll_x.stm");
            variable in_4_3_real_din_a2_tpl_int_0 : Integer;
            variable in_4_3_real_din_a2_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Data_l2_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                DUC_Data_l2_3re_stm <= (others => '0');
            end loop;
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Data_l2_3re)
                IF (endfile(data_file_ChannelIn1_vunroll_cunroll_x)) THEN
                    clk_DUC_Data_l2_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn1_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_3_real_din_a2_tpl_int_0);
                    in_4_3_real_din_a2_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_3_real_din_a2_tpl_int_0, 16));
                    DUC_Data_l2_3re_stm <= in_4_3_real_din_a2_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DUC_Valid_Out_s
        DUC_Valid_Out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_2_vout_tpl_int_0 : Integer;
            variable out_2_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Valid_Out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Valid_Out_s)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Valid_Out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, out_2_vout_tpl_int_0);
                    out_2_vout_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_2_vout_tpl_int_0, 1));
                    DUC_Valid_Out_s_stm <= out_2_vout_tpl_temp;
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

        -- Generating stimulus for DUC_Chan_Out_s
        DUC_Chan_Out_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_3_cout_tpl_int_0 : Integer;
            variable out_3_cout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Chan_Out_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Chan_Out_s)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Chan_Out_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_3_cout_tpl_int_0);
                    out_3_cout_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_3_cout_tpl_int_0, 8));
                    DUC_Chan_Out_s_stm <= out_3_cout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_0im
        DUC_Ant_Data_Out_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_0_imag_dout_tpl_int_0 : Integer;
            variable out_1_0_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_0im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_0_imag_dout_tpl_int_0);
                    out_1_0_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_0_imag_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_0im_stm <= out_1_0_imag_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_0re
        DUC_Ant_Data_Out_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_0_real_dout_tpl_int_0 : Integer;
            variable out_1_0_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_0re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_0_real_dout_tpl_int_0);
                    out_1_0_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_0_real_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_0re_stm <= out_1_0_real_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_1im
        DUC_Ant_Data_Out_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_1_imag_dout_tpl_int_0 : Integer;
            variable out_1_1_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_1im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_1_imag_dout_tpl_int_0);
                    out_1_1_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_1_imag_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_1im_stm <= out_1_1_imag_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_1re
        DUC_Ant_Data_Out_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_1_real_dout_tpl_int_0 : Integer;
            variable out_1_1_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_1re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_1_real_dout_tpl_int_0);
                    out_1_1_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_1_real_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_1re_stm <= out_1_1_real_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_2im
        DUC_Ant_Data_Out_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_2_imag_dout_tpl_int_0 : Integer;
            variable out_1_2_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_2im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_2_imag_dout_tpl_int_0);
                    out_1_2_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_2_imag_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_2im_stm <= out_1_2_imag_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_2re
        DUC_Ant_Data_Out_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_2_real_dout_tpl_int_0 : Integer;
            variable out_1_2_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_2re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_2_real_dout_tpl_int_0);
                    out_1_2_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_2_real_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_2re_stm <= out_1_2_real_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_3im
        DUC_Ant_Data_Out_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_3_imag_dout_tpl_int_0 : Integer;
            variable out_1_3_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_3im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_3_imag_dout_tpl_int_0);
                    out_1_3_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_3_imag_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_3im_stm <= out_1_3_imag_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_3re
        DUC_Ant_Data_Out_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_3_real_dout_tpl_int_0 : Integer;
            variable out_1_3_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_3re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_3_real_dout_tpl_int_0);
                    out_1_3_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_3_real_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_3re_stm <= out_1_3_real_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_4im
        DUC_Ant_Data_Out_4im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_4_imag_dout_tpl_int_0 : Integer;
            variable out_1_4_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_4im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_4im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_4im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_4_imag_dout_tpl_int_0);
                    out_1_4_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_4_imag_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_4im_stm <= out_1_4_imag_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_4re
        DUC_Ant_Data_Out_4re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_4_real_dout_tpl_int_0 : Integer;
            variable out_1_4_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_4re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_4re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_4re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_4_real_dout_tpl_int_0);
                    out_1_4_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_4_real_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_4re_stm <= out_1_4_real_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_5im
        DUC_Ant_Data_Out_5im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_5_imag_dout_tpl_int_0 : Integer;
            variable out_1_5_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_5im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_5im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_5im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_5_imag_dout_tpl_int_0);
                    out_1_5_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_5_imag_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_5im_stm <= out_1_5_imag_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_5re
        DUC_Ant_Data_Out_5re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_5_real_dout_tpl_int_0 : Integer;
            variable out_1_5_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_5re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_5re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_5re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_5_real_dout_tpl_int_0);
                    out_1_5_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_5_real_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_5re_stm <= out_1_5_real_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_6im
        DUC_Ant_Data_Out_6im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_6_imag_dout_tpl_int_0 : Integer;
            variable out_1_6_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_6im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_6im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_6im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_6_imag_dout_tpl_int_0);
                    out_1_6_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_6_imag_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_6im_stm <= out_1_6_imag_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_6re
        DUC_Ant_Data_Out_6re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_6_real_dout_tpl_int_0 : Integer;
            variable out_1_6_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_6re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_6re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_6re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_6_real_dout_tpl_int_0);
                    out_1_6_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_6_real_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_6re_stm <= out_1_6_real_dout_tpl_temp;
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

        -- Generating stimulus for DUC_Ant_Data_Out_7im
        DUC_Ant_Data_Out_7im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_7_imag_dout_tpl_int_0 : Integer;
            variable out_1_7_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_7im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_7im)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_7im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_7_imag_dout_tpl_int_0);
                    out_1_7_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_7_imag_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_7im_stm <= out_1_7_imag_dout_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for DUC_Ant_Data_Out_7re
        DUC_Ant_Data_Out_7re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_Channel_out_HC_Bypass_vunroll_cunroll_x : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Subsystem_Channel_out_HC_Bypass_vunroll_cunroll_x.stm");
            variable out_1_7_real_dout_tpl_int_0 : Integer;
            variable out_1_7_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            DUC_Ant_Data_Out_7re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to DUC_Ant_Data_Out_7re)
                IF (endfile(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x)) THEN
                    clk_DUC_Ant_Data_Out_7re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_Channel_out_HC_Bypass_vunroll_cunroll_x, L);
                    
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
                    read(L, out_1_7_real_dout_tpl_int_0);
                    out_1_7_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_7_real_dout_tpl_int_0, 16));
                    DUC_Ant_Data_Out_7re_stm <= out_1_7_real_dout_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for summer_vout_s
        summer_vout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2_qOut.stm");
            variable qOut_v_int_0 : Integer;
            variable qOut_v_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            summer_vout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_vout_s)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_vout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, qOut_v_int_0);
                    qOut_v_temp(0 downto 0) := std_logic_vector(to_unsigned(qOut_v_int_0, 1));
                    summer_vout_s_stm <= qOut_v_temp;
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

        -- Generating stimulus for summer_cout_s
        summer_cout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2_qOut.stm");
            variable qOut_c_int_0 : Integer;
            variable qOut_c_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            summer_cout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_cout_s)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_cout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, qOut_c_int_0);
                    qOut_c_temp(7 downto 0) := std_logic_vector(to_unsigned(qOut_c_int_0, 8));
                    summer_cout_s_stm <= qOut_c_temp;
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

        -- Generating stimulus for summer_dout_0im
        summer_dout_0im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3_qOut.stm");
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            summer_dout_0im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_dout_0im)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_dout_0im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 16));
                    summer_dout_0im_stm <= qOut_0_temp;
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

        -- Generating stimulus for summer_dout_0re
        summer_dout_0re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2_qOut.stm");
            variable qOut_0_int_0 : Integer;
            variable qOut_0_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            summer_dout_0re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_dout_0re)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_dout_0re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_0_int_0);
                    qOut_0_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_0_int_0, 16));
                    summer_dout_0re_stm <= qOut_0_temp;
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

        -- Generating stimulus for summer_dout_1im
        summer_dout_1im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3_qOut.stm");
            variable qOut_1_int_0 : Integer;
            variable qOut_1_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            summer_dout_1im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_dout_1im)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_dout_1im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_1_int_0);
                    qOut_1_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_1_int_0, 16));
                    summer_dout_1im_stm <= qOut_1_temp;
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

        -- Generating stimulus for summer_dout_1re
        summer_dout_1re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2_qOut.stm");
            variable qOut_1_int_0 : Integer;
            variable qOut_1_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            summer_dout_1re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_dout_1re)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_dout_1re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_1_int_0);
                    qOut_1_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_1_int_0, 16));
                    summer_dout_1re_stm <= qOut_1_temp;
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

        -- Generating stimulus for summer_dout_2im
        summer_dout_2im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3_qOut.stm");
            variable qOut_2_int_0 : Integer;
            variable qOut_2_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            summer_dout_2im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_dout_2im)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_dout_2im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_2_int_0);
                    qOut_2_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_2_int_0, 16));
                    summer_dout_2im_stm <= qOut_2_temp;
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

        -- Generating stimulus for summer_dout_2re
        summer_dout_2re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2_qOut.stm");
            variable qOut_2_int_0 : Integer;
            variable qOut_2_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            summer_dout_2re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_dout_2re)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_dout_2re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_2_int_0);
                    qOut_2_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_2_int_0, 16));
                    summer_dout_2re_stm <= qOut_2_temp;
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

        -- Generating stimulus for summer_dout_3im
        summer_dout_3im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer3_qOut.stm");
            variable qOut_3_int_0 : Integer;
            variable qOut_3_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            summer_dout_3im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_dout_3im)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_dout_3im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_3_int_0);
                    qOut_3_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_3_int_0, 16));
                    summer_dout_3im_stm <= qOut_3_temp;
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

        -- Generating stimulus for summer_dout_3re
        summer_dout_3re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_qOut : text open read_mode is safe_path("ca_interp/ca_interp_DUT_Summer_DUC_Summer_scale_Antenna_Summer2_qOut.stm");
            variable qOut_3_int_0 : Integer;
            variable qOut_3_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            summer_dout_3re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            -- Wait for system to be ready (pipelined reset).
            for tick in 1 to 2 loop
                wait for 2034 ps;
            end loop;
            
            while true loop
            
                -- (ports connected to summer_dout_3re)
                IF (endfile(data_file_qOut)) THEN
                    clk_summer_dout_3re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_qOut, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, qOut_3_int_0);
                    qOut_3_temp(15 downto 0) := std_logic_vector(to_unsigned(qOut_3_int_0, 16));
                    summer_dout_3re_stm <= qOut_3_temp;
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

    clk_stm_sig_stop <= clk_DUC_Valid_l1_s_stm_sig_stop OR clk_DUC_Chan_l1_s_stm_sig_stop OR clk_DUC_Data_l1_0im_stm_sig_stop OR clk_DUC_Data_l1_0re_stm_sig_stop OR clk_DUC_Data_l1_1im_stm_sig_stop OR clk_DUC_Data_l1_1re_stm_sig_stop OR clk_DUC_Data_l1_2im_stm_sig_stop OR clk_DUC_Data_l1_2re_stm_sig_stop OR clk_DUC_Data_l1_3im_stm_sig_stop OR clk_DUC_Data_l1_3re_stm_sig_stop OR clk_DUC_Valid_l2_s_stm_sig_stop OR clk_DUC_Chan_l2_s_stm_sig_stop OR clk_DUC_Data_l2_0im_stm_sig_stop OR clk_DUC_Data_l2_0re_stm_sig_stop OR clk_DUC_Data_l2_1im_stm_sig_stop OR clk_DUC_Data_l2_1re_stm_sig_stop OR clk_DUC_Data_l2_2im_stm_sig_stop OR clk_DUC_Data_l2_2re_stm_sig_stop OR clk_DUC_Data_l2_3im_stm_sig_stop OR clk_DUC_Data_l2_3re_stm_sig_stop OR clk_DUC_Valid_Out_s_stm_sig_stop OR clk_DUC_Chan_Out_s_stm_sig_stop OR clk_DUC_Ant_Data_Out_0im_stm_sig_stop OR clk_DUC_Ant_Data_Out_0re_stm_sig_stop OR clk_DUC_Ant_Data_Out_1im_stm_sig_stop OR clk_DUC_Ant_Data_Out_1re_stm_sig_stop OR clk_DUC_Ant_Data_Out_2im_stm_sig_stop OR clk_DUC_Ant_Data_Out_2re_stm_sig_stop OR clk_DUC_Ant_Data_Out_3im_stm_sig_stop OR clk_DUC_Ant_Data_Out_3re_stm_sig_stop OR clk_DUC_Ant_Data_Out_4im_stm_sig_stop OR clk_DUC_Ant_Data_Out_4re_stm_sig_stop OR clk_DUC_Ant_Data_Out_5im_stm_sig_stop OR clk_DUC_Ant_Data_Out_5re_stm_sig_stop OR clk_DUC_Ant_Data_Out_6im_stm_sig_stop OR clk_DUC_Ant_Data_Out_6re_stm_sig_stop OR clk_DUC_Ant_Data_Out_7im_stm_sig_stop OR clk_DUC_Ant_Data_Out_7re_stm_sig_stop OR clk_summer_vout_s_stm_sig_stop OR clk_summer_cout_s_stm_sig_stop OR clk_summer_dout_0im_stm_sig_stop OR clk_summer_dout_0re_stm_sig_stop OR clk_summer_dout_1im_stm_sig_stop OR clk_summer_dout_1re_stm_sig_stop OR clk_summer_dout_2im_stm_sig_stop OR clk_summer_dout_2re_stm_sig_stop OR clk_summer_dout_3im_stm_sig_stop OR clk_summer_dout_3re_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= '1';


    END normal;
