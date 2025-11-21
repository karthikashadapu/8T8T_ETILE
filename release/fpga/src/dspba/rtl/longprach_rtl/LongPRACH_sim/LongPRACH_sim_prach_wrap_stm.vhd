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

-- VHDL created from LongPRACH_sim_prach_wrap
-- VHDL created on Fri Dec  6 17:01:04 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use std.TextIO.all;
USE work.LongPRACH_sim_prach_wrap_safe_path.all;

entity LongPRACH_sim_prach_wrap_stm is
    port (
        busIn_writedata_stm : out std_logic_vector(31 downto 0);
        busIn_address_stm : out std_logic_vector(1 downto 0);
        busIn_write_stm : out std_logic_vector(0 downto 0);
        busIn_read_stm : out std_logic_vector(0 downto 0);
        busOut_readdatavalid_stm : out std_logic_vector(0 downto 0);
        busOut_readdata_stm : out std_logic_vector(31 downto 0);
        busOut_waitrequest_stm : out std_logic_vector(0 downto 0);
        vin0_s_stm : out std_logic_vector(0 downto 0);
        chin0_s_stm : out std_logic_vector(7 downto 0);
        din0_im_stm : out std_logic_vector(15 downto 0);
        din0_re_stm : out std_logic_vector(15 downto 0);
        RFN_s_stm : out std_logic_vector(11 downto 0);
        subframe_s_stm : out std_logic_vector(7 downto 0);
        prach_cfg_idx_s_stm : out std_logic_vector(15 downto 0);
        cp_len_s_stm : out std_logic_vector(20 downto 0);
        offset_s_stm : out std_logic_vector(20 downto 0);
        c_m_plane_sel_s_stm : out std_logic_vector(0 downto 0);
        prach_tech_s_stm : out std_logic_vector(0 downto 0);
        filt_flush_en_s_stm : out std_logic_vector(0 downto 0);
        start_sym_s_stm : out std_logic_vector(3 downto 0);
        SubFrame_cplane_s_stm : out std_logic_vector(7 downto 0);
        gain_re_s_stm : out std_logic_vector(15 downto 0);
        gain_im_s_stm : out std_logic_vector(15 downto 0);
        ch0_info_s_stm : out std_logic_vector(15 downto 0);
        ch1_info_s_stm : out std_logic_vector(15 downto 0);
        ch2_info_s_stm : out std_logic_vector(15 downto 0);
        ch3_info_s_stm : out std_logic_vector(15 downto 0);
        RFN_cplane_s_stm : out std_logic_vector(11 downto 0);
        dout_im_stm : out std_logic_vector(15 downto 0);
        dout_re_stm : out std_logic_vector(15 downto 0);
        vout_s_stm : out std_logic_vector(0 downto 0);
        cout_s_stm : out std_logic_vector(7 downto 0);
        TimeReference_s_stm : out std_logic_vector(31 downto 0);
        version_info_s_stm : out std_logic_vector(31 downto 0);
        ch_info_s_stm : out std_logic_vector(15 downto 0);
        clk : out std_logic;
        areset : out std_logic;
        bus_clk : out std_logic;
        bus_areset : out std_logic
    );
end LongPRACH_sim_prach_wrap_stm;

architecture normal of LongPRACH_sim_prach_wrap_stm is

    signal clk_stm_sig : std_logic := '0';
    signal clk_stm_sig_stop : std_logic := '0';
    signal bus_clk_stm_sig : std_logic := '0';
    signal bus_clk_stm_sig_stop : std_logic := '0';
    signal areset_stm_sig : std_logic := '1';
    signal bus_areset_stm_sig : std_logic := '1';
    signal clk_vin0_s_stm_sig_stop : std_logic := '0';
    signal clk_chin0_s_stm_sig_stop : std_logic := '0';
    signal clk_din0_im_stm_sig_stop : std_logic := '0';
    signal clk_din0_re_stm_sig_stop : std_logic := '0';
    signal clk_RFN_s_stm_sig_stop : std_logic := '0';
    signal clk_subframe_s_stm_sig_stop : std_logic := '0';
    signal clk_prach_cfg_idx_s_stm_sig_stop : std_logic := '0';
    signal clk_cp_len_s_stm_sig_stop : std_logic := '0';
    signal clk_offset_s_stm_sig_stop : std_logic := '0';
    signal clk_c_m_plane_sel_s_stm_sig_stop : std_logic := '0';
    signal clk_prach_tech_s_stm_sig_stop : std_logic := '0';
    signal clk_filt_flush_en_s_stm_sig_stop : std_logic := '0';
    signal clk_start_sym_s_stm_sig_stop : std_logic := '0';
    signal clk_SubFrame_cplane_s_stm_sig_stop : std_logic := '0';
    signal clk_gain_re_s_stm_sig_stop : std_logic := '0';
    signal clk_gain_im_s_stm_sig_stop : std_logic := '0';
    signal clk_ch0_info_s_stm_sig_stop : std_logic := '0';
    signal clk_ch1_info_s_stm_sig_stop : std_logic := '0';
    signal clk_ch2_info_s_stm_sig_stop : std_logic := '0';
    signal clk_ch3_info_s_stm_sig_stop : std_logic := '0';
    signal clk_RFN_cplane_s_stm_sig_stop : std_logic := '0';
    signal clk_dout_im_stm_sig_stop : std_logic := '0';
    signal clk_dout_re_stm_sig_stop : std_logic := '0';
    signal clk_vout_s_stm_sig_stop : std_logic := '0';
    signal clk_cout_s_stm_sig_stop : std_logic := '0';
    signal clk_TimeReference_s_stm_sig_stop : std_logic := '0';
    signal clk_ch_info_s_stm_sig_stop : std_logic := '0';

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

        -- Generating stimulus for vin0_s
        vin0_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_2_vin0_tpl_int_0 : Integer;
            variable in_2_vin0_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vin0_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                vin0_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to vin0_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_vin0_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, in_2_vin0_tpl_int_0);
                    in_2_vin0_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_2_vin0_tpl_int_0, 1));
                    vin0_s_stm <= in_2_vin0_tpl_temp;
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

        -- Generating stimulus for chin0_s
        chin0_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_3_chin0_tpl_int_0 : Integer;
            variable in_3_chin0_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            chin0_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                chin0_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to chin0_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_chin0_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, in_3_chin0_tpl_int_0);
                    in_3_chin0_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_3_chin0_tpl_int_0, 8));
                    chin0_s_stm <= in_3_chin0_tpl_temp;
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

        -- Generating stimulus for din0_im
        din0_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_1_imag_din0_tpl_int_0 : Integer;
            variable in_1_imag_din0_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din0_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din0_im_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din0_im)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_din0_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_imag_din0_tpl_int_0);
                    in_1_imag_din0_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_imag_din0_tpl_int_0, 16));
                    din0_im_stm <= in_1_imag_din0_tpl_temp;
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

        -- Generating stimulus for din0_re
        din0_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_1_real_din0_tpl_int_0 : Integer;
            variable in_1_real_din0_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            din0_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                din0_re_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to din0_re)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_din0_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_1_real_din0_tpl_int_0);
                    in_1_real_din0_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_1_real_din0_tpl_int_0, 16));
                    din0_re_stm <= in_1_real_din0_tpl_temp;
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

        -- Generating stimulus for RFN_s
        RFN_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_4_SFN_tpl_int_0 : Integer;
            variable in_4_SFN_tpl_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            RFN_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                RFN_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to RFN_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_RFN_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_4_SFN_tpl_int_0);
                    in_4_SFN_tpl_temp(11 downto 0) := std_logic_vector(to_unsigned(in_4_SFN_tpl_int_0, 12));
                    RFN_s_stm <= in_4_SFN_tpl_temp;
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

        -- Generating stimulus for subframe_s
        subframe_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_5_SubFrame_tpl_int_0 : Integer;
            variable in_5_SubFrame_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            subframe_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                subframe_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to subframe_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_subframe_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_5_SubFrame_tpl_int_0);
                    in_5_SubFrame_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_5_SubFrame_tpl_int_0, 8));
                    subframe_s_stm <= in_5_SubFrame_tpl_temp;
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

        -- Generating stimulus for prach_cfg_idx_s
        prach_cfg_idx_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_6_prach_config_index_tpl_int_0 : Integer;
            variable in_6_prach_config_index_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            prach_cfg_idx_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                prach_cfg_idx_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to prach_cfg_idx_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_prach_cfg_idx_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_6_prach_config_index_tpl_int_0);
                    in_6_prach_config_index_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_6_prach_config_index_tpl_int_0, 16));
                    prach_cfg_idx_s_stm <= in_6_prach_config_index_tpl_temp;
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

        -- Generating stimulus for cp_len_s
        cp_len_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_7_cp_len_tpl_int_0 : Integer;
            variable in_7_cp_len_tpl_temp : std_logic_vector(20 downto 0);

        begin
            -- initialize all outputs to 0
            cp_len_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                cp_len_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to cp_len_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_cp_len_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_7_cp_len_tpl_int_0);
                    in_7_cp_len_tpl_temp(20 downto 0) := std_logic_vector(to_unsigned(in_7_cp_len_tpl_int_0, 21));
                    cp_len_s_stm <= in_7_cp_len_tpl_temp;
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

        -- Generating stimulus for offset_s
        offset_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_8_offset_tpl_int_0 : Integer;
            variable in_8_offset_tpl_temp : std_logic_vector(20 downto 0);

        begin
            -- initialize all outputs to 0
            offset_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                offset_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to offset_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_offset_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_8_offset_tpl_int_0);
                    in_8_offset_tpl_temp(20 downto 0) := std_logic_vector(to_unsigned(in_8_offset_tpl_int_0, 21));
                    offset_s_stm <= in_8_offset_tpl_temp;
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

        -- Generating stimulus for c_m_plane_sel_s
        c_m_plane_sel_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_9_c_m_plane_sel_tpl_int_0 : Integer;
            variable in_9_c_m_plane_sel_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            c_m_plane_sel_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                c_m_plane_sel_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to c_m_plane_sel_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_c_m_plane_sel_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_9_c_m_plane_sel_tpl_int_0);
                    in_9_c_m_plane_sel_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_9_c_m_plane_sel_tpl_int_0, 1));
                    c_m_plane_sel_s_stm <= in_9_c_m_plane_sel_tpl_temp;
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

        -- Generating stimulus for prach_tech_s
        prach_tech_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_10_prach_tech_tpl_int_0 : Integer;
            variable in_10_prach_tech_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            prach_tech_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                prach_tech_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to prach_tech_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_prach_tech_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_10_prach_tech_tpl_int_0);
                    in_10_prach_tech_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_10_prach_tech_tpl_int_0, 1));
                    prach_tech_s_stm <= in_10_prach_tech_tpl_temp;
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

        -- Generating stimulus for filt_flush_en_s
        filt_flush_en_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_CP_REM0000_ChannelIn_cunroll_x.stm");
            variable in_6_filt_flush_en_tpl_int_0 : Integer;
            variable in_6_filt_flush_en_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            filt_flush_en_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                filt_flush_en_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to filt_flush_en_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_filt_flush_en_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_6_filt_flush_en_tpl_int_0);
                    in_6_filt_flush_en_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(in_6_filt_flush_en_tpl_int_0, 1));
                    filt_flush_en_s_stm <= in_6_filt_flush_en_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for start_sym_s
        start_sym_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_15_start_sym_tpl_int_0 : Integer;
            variable in_15_start_sym_tpl_temp : std_logic_vector(3 downto 0);

        begin
            -- initialize all outputs to 0
            start_sym_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                start_sym_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to start_sym_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_start_sym_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_15_start_sym_tpl_int_0);
                    in_15_start_sym_tpl_temp(3 downto 0) := std_logic_vector(to_unsigned(in_15_start_sym_tpl_int_0, 4));
                    start_sym_s_stm <= in_15_start_sym_tpl_temp;
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

        -- Generating stimulus for SubFrame_cplane_s
        SubFrame_cplane_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_16_Subframe_cplane_tpl_int_0 : Integer;
            variable in_16_Subframe_cplane_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            SubFrame_cplane_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                SubFrame_cplane_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to SubFrame_cplane_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_SubFrame_cplane_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_16_Subframe_cplane_tpl_int_0);
                    in_16_Subframe_cplane_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(in_16_Subframe_cplane_tpl_int_0, 8));
                    SubFrame_cplane_s_stm <= in_16_Subframe_cplane_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for gain_re_s
        gain_re_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FF0001_ChannelIn_cunroll_x.stm");
            variable in_4_real_gain_tpl_int_0 : Integer;
            variable in_4_real_gain_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            gain_re_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                gain_re_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to gain_re_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_gain_re_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_real_gain_tpl_int_0);
                    in_4_real_gain_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_real_gain_tpl_int_0, 16));
                    gain_re_s_stm <= in_4_real_gain_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for gain_im_s
        gain_im_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_S2B_FF0001_ChannelIn_cunroll_x.stm");
            variable in_4_imag_gain_tpl_int_0 : Integer;
            variable in_4_imag_gain_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            gain_im_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                gain_im_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to gain_im_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_gain_im_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_4_imag_gain_tpl_int_0);
                    in_4_imag_gain_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_4_imag_gain_tpl_int_0, 16));
                    gain_im_s_stm <= in_4_imag_gain_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for ch0_info_s
        ch0_info_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_ChannelIn_cunroll_x.stm");
            variable in_7_ch0_info_tpl_int_0 : Integer;
            variable in_7_ch0_info_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ch0_info_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ch0_info_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ch0_info_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ch0_info_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_7_ch0_info_tpl_int_0);
                    in_7_ch0_info_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_7_ch0_info_tpl_int_0, 16));
                    ch0_info_s_stm <= in_7_ch0_info_tpl_temp;
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

        -- Generating stimulus for ch1_info_s
        ch1_info_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_ChannelIn_cunroll_x.stm");
            variable in_8_ch1_info_tpl_int_0 : Integer;
            variable in_8_ch1_info_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ch1_info_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ch1_info_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ch1_info_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ch1_info_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_8_ch1_info_tpl_int_0);
                    in_8_ch1_info_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_8_ch1_info_tpl_int_0, 16));
                    ch1_info_s_stm <= in_8_ch1_info_tpl_temp;
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

        -- Generating stimulus for ch2_info_s
        ch2_info_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_ChannelIn_cunroll_x.stm");
            variable in_9_ch2_info_tpl_int_0 : Integer;
            variable in_9_ch2_info_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ch2_info_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ch2_info_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ch2_info_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ch2_info_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, in_9_ch2_info_tpl_int_0);
                    in_9_ch2_info_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_9_ch2_info_tpl_int_0, 16));
                    ch2_info_s_stm <= in_9_ch2_info_tpl_temp;
                    read(L, dummy_int);

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for ch3_info_s
        ch3_info_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SELECT_ChannelIn_cunroll_x.stm");
            variable in_10_ch3_info_tpl_int_0 : Integer;
            variable in_10_ch3_info_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ch3_info_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                ch3_info_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to ch3_info_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_ch3_info_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_10_ch3_info_tpl_int_0);
                    in_10_ch3_info_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(in_10_ch3_info_tpl_int_0, 16));
                    ch3_info_s_stm <= in_10_ch3_info_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for RFN_cplane_s
        RFN_cplane_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelIn_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_MUX_ConfigId_ChannelIn_cunroll_x.stm");
            variable in_17_SFN_cplane_tpl_int_0 : Integer;
            variable in_17_SFN_cplane_tpl_temp : std_logic_vector(11 downto 0);

        begin
            -- initialize all outputs to 0
            RFN_cplane_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            for tick in 1 to 1023 loop
            
                wait for 2034 ps; -- additional reset delay
                
                RFN_cplane_s_stm <= (others => '0');
            end loop;
            while true loop
            
                -- (ports connected to RFN_cplane_s)
                IF (endfile(data_file_ChannelIn_cunroll_x)) THEN
                    clk_RFN_cplane_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelIn_cunroll_x, L);
                    
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
                    read(L, in_17_SFN_cplane_tpl_int_0);
                    in_17_SFN_cplane_tpl_temp(11 downto 0) := std_logic_vector(to_unsigned(in_17_SFN_cplane_tpl_int_0, 12));
                    RFN_cplane_s_stm <= in_17_SFN_cplane_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

        -- Generating stimulus for dout_im
        dout_im_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SE0000ChannelOut_cunroll_x.stm");
            variable out_1_imag_dout_tpl_int_0 : Integer;
            variable out_1_imag_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_im_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_im)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_dout_im_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_imag_dout_tpl_int_0);
                    out_1_imag_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_imag_dout_tpl_int_0, 16));
                    dout_im_stm <= out_1_imag_dout_tpl_temp;
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

        -- Generating stimulus for dout_re
        dout_re_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SE0000ChannelOut_cunroll_x.stm");
            variable out_1_real_dout_tpl_int_0 : Integer;
            variable out_1_real_dout_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            dout_re_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to dout_re)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_dout_re_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_1_real_dout_tpl_int_0);
                    out_1_real_dout_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_1_real_dout_tpl_int_0, 16));
                    dout_re_stm <= out_1_real_dout_tpl_temp;
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

        -- Generating stimulus for vout_s
        vout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SE0000ChannelOut_cunroll_x.stm");
            variable out_2_vout_tpl_int_0 : Integer;
            variable out_2_vout_tpl_temp : std_logic_vector(0 downto 0);

        begin
            -- initialize all outputs to 0
            vout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to vout_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_vout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, out_2_vout_tpl_int_0);
                    out_2_vout_tpl_temp(0 downto 0) := std_logic_vector(to_unsigned(out_2_vout_tpl_int_0, 1));
                    vout_s_stm <= out_2_vout_tpl_temp;
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

        -- Generating stimulus for cout_s
        cout_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SE0000ChannelOut_cunroll_x.stm");
            variable out_3_cout_tpl_int_0 : Integer;
            variable out_3_cout_tpl_temp : std_logic_vector(7 downto 0);

        begin
            -- initialize all outputs to 0
            cout_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to cout_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_cout_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, out_3_cout_tpl_int_0);
                    out_3_cout_tpl_temp(7 downto 0) := std_logic_vector(to_unsigned(out_3_cout_tpl_int_0, 8));
                    cout_s_stm <= out_3_cout_tpl_temp;
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

        -- Generating stimulus for TimeReference_s
        TimeReference_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_GPOut : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_Timeref_capture_fifo_GPOut.stm");
            variable out_1_time_ref_out_tpl_int_0 : Integer;
            variable out_1_time_ref_out_tpl_temp : std_logic_vector(31 downto 0);

        begin
            -- initialize all outputs to 0
            TimeReference_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to TimeReference_s)
                IF (endfile(data_file_GPOut)) THEN
                    clk_TimeReference_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_GPOut, L);
                    
                    read(L, out_1_time_ref_out_tpl_int_0);
                    out_1_time_ref_out_tpl_temp(31 downto 0) := std_logic_vector(to_signed(out_1_time_ref_out_tpl_int_0, 32));
                    TimeReference_s_stm <= out_1_time_ref_out_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;
        -- Driving gnd for version_info_s signals

        version_info_s_stm <= (others => '0');

        -- Generating stimulus for ch_info_s
        ch_info_s_stm_init_p: process

            variable L : line;
            variable dummy_int : Integer;
            file data_file_ChannelOut_cunroll_x : text open read_mode is safe_path("LongPRACH_sim/LongPRACH_sim_prach_wrap_LongPRACH_DUT_Longprach_C_M_plane_LongPRACH_core_SYM_SE0000ChannelOut_cunroll_x.stm");
            variable out_5_ch_info_tpl_int_0 : Integer;
            variable out_5_ch_info_tpl_temp : std_logic_vector(15 downto 0);

        begin
            -- initialize all outputs to 0
            ch_info_s_stm <= (others => '0');

            wait for 201 ps; -- wait delay
            
            wait for 1023*2034 ps; -- additional reset delay
            
            while true loop
            
                -- (ports connected to ch_info_s)
                IF (endfile(data_file_ChannelOut_cunroll_x)) THEN
                    clk_ch_info_s_stm_sig_stop <= '1';
                    wait;
                ELSE
                    readline(data_file_ChannelOut_cunroll_x, L);
                    
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, dummy_int);
                    read(L, out_5_ch_info_tpl_int_0);
                    out_5_ch_info_tpl_temp(15 downto 0) := std_logic_vector(to_unsigned(out_5_ch_info_tpl_int_0, 16));
                    ch_info_s_stm <= out_5_ch_info_tpl_temp;

                    deallocate(L);
                END IF;
                -- -- wait for rising edge to pass (assert signals just after rising edge)
                wait until clk_stm_sig'EVENT and clk_stm_sig = '1';
                wait for 1 ps; -- wait delay
                
                end loop;
            wait;
        END PROCESS;

    clk_stm_sig_stop <= clk_vin0_s_stm_sig_stop OR clk_chin0_s_stm_sig_stop OR clk_din0_im_stm_sig_stop OR clk_din0_re_stm_sig_stop OR clk_RFN_s_stm_sig_stop OR clk_subframe_s_stm_sig_stop OR clk_prach_cfg_idx_s_stm_sig_stop OR clk_cp_len_s_stm_sig_stop OR clk_offset_s_stm_sig_stop OR clk_c_m_plane_sel_s_stm_sig_stop OR clk_prach_tech_s_stm_sig_stop OR clk_filt_flush_en_s_stm_sig_stop OR clk_start_sym_s_stm_sig_stop OR clk_SubFrame_cplane_s_stm_sig_stop OR clk_gain_re_s_stm_sig_stop OR clk_gain_im_s_stm_sig_stop OR clk_ch0_info_s_stm_sig_stop OR clk_ch1_info_s_stm_sig_stop OR clk_ch2_info_s_stm_sig_stop OR clk_ch3_info_s_stm_sig_stop OR clk_RFN_cplane_s_stm_sig_stop OR clk_dout_im_stm_sig_stop OR clk_dout_re_stm_sig_stop OR clk_vout_s_stm_sig_stop OR clk_cout_s_stm_sig_stop OR clk_TimeReference_s_stm_sig_stop OR clk_ch_info_s_stm_sig_stop OR '0';
    bus_clk_stm_sig_stop <= '1';


    END normal;
