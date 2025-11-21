// (C) 2001-2024 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// example macro calling:

//`define special_handling_for_ptp_simulation(ptp_mux_ip_instance_hpath, eth_ip_instance_hpath, eth_ip_sip_instance_hpath, tile_atom_hpath, aib_id, one_hot_selector) \
// special_handling_for_ptp_simulation( <ptp_mux not required>,
//                                      basic_avl_tb_top.eth_f_hw.IP_INST[0].hw_ip_top.dut.eth_f_0,
//                                      basic_avl_tb_top.eth_f_hw.IP_INST[0].hw_ip_top.dut.eth_f_0.sip_inst,
//                                      basic_avl_tb_top.eth_f_hw_auto_tiles.z1577a_x0_y0_n0.z1577a.z1577a_inst,
//                                      23, 
//                                      dr_ptp_ip_one_hot_selector)
// dr_ptp_ip_one_hot_selector is expected to have rising/falling edge to trigger/release force.
// PTP DEFINE MACRO BEGINS
`define special_handling_for_ptp_simulation_force_mr(ptp_hip_path,ptp_hip_ch,eth_sip_hpath,sip_port) \
    force ptp_hip_path.tx_mac.ptp_tx.am_exit_adj_ld[ptp_hip_ch]        = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_tx_tam_adj_load[sip_port];     \
    force ptp_hip_path.tx_mac.ptp_tx.am_exit_adj   [ptp_hip_ch][31:0]  = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_tx_tam_adj[sip_port];          \
    force ptp_hip_path.tx_mac.ptp_tx.am_exit_tod_ld[ptp_hip_ch]        = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_tx_tam_load[sip_port];         \
    force ptp_hip_path.tx_mac.ptp_tx.am_exit_tod   [ptp_hip_ch][95:0]  = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_tx_tam[sip_port];              \
    force ptp_hip_path.rx_mac.ptp_rx.am_exit_adj_ld[ptp_hip_ch]        = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_rx_tam_adj_load[sip_port];     \
    force ptp_hip_path.rx_mac.ptp_rx.am_exit_adj   [ptp_hip_ch][31:0]  = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_rx_tam_adj[sip_port];          \
    force ptp_hip_path.rx_mac.ptp_rx.am_exit_tod_ld[ptp_hip_ch]        = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_rx_tam_load[sip_port];         \
    force ptp_hip_path.rx_mac.ptp_rx.am_exit_tod   [ptp_hip_ch][95:0]  = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_rx_tam[sip_port];           

`define special_handling_for_ptp_simulation_force(ptp_hip_path,ptp_hip_ch,eth_sip_hpath) \
    force ptp_hip_path.tx_mac.ptp_tx.am_exit_adj_ld[ptp_hip_ch]        = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_tx_tam_adj_load[0];     \
    force ptp_hip_path.tx_mac.ptp_tx.am_exit_adj   [ptp_hip_ch][31:0]  = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_tx_tam_adj[0];          \
    force ptp_hip_path.tx_mac.ptp_tx.am_exit_tod_ld[ptp_hip_ch]        = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_tx_tam_load[0];         \
    force ptp_hip_path.tx_mac.ptp_tx.am_exit_tod   [ptp_hip_ch][95:0]  = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_tx_tam[0];              \
    force ptp_hip_path.rx_mac.ptp_rx.am_exit_adj_ld[ptp_hip_ch]        = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_rx_tam_adj_load[0];     \
    force ptp_hip_path.rx_mac.ptp_rx.am_exit_adj   [ptp_hip_ch][31:0]  = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_rx_tam_adj[0];          \
    force ptp_hip_path.rx_mac.ptp_rx.am_exit_tod_ld[ptp_hip_ch]        = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_rx_tam_load[0];         \
    force ptp_hip_path.rx_mac.ptp_rx.am_exit_tod   [ptp_hip_ch][95:0]  = eth_sip_hpath.PTP_SOFT_GEN.soft_ptp.sim_rx_tam[0];              

`define special_handling_for_ptp_simulation_release(ptp_hip_path,ptp_hip_ch) \
   release ptp_hip_path.tx_mac.ptp_tx.am_exit_adj_ld[ptp_hip_ch]      ;   \
   release ptp_hip_path.tx_mac.ptp_tx.am_exit_adj   [ptp_hip_ch][31:0];   \
   release ptp_hip_path.tx_mac.ptp_tx.am_exit_tod_ld[ptp_hip_ch]      ;   \
   release ptp_hip_path.tx_mac.ptp_tx.am_exit_tod   [ptp_hip_ch][95:0];   \
   release ptp_hip_path.rx_mac.ptp_rx.am_exit_adj_ld[ptp_hip_ch]      ;   \
   release ptp_hip_path.rx_mac.ptp_rx.am_exit_adj   [ptp_hip_ch][31:0];   \
   release ptp_hip_path.rx_mac.ptp_rx.am_exit_tod_ld[ptp_hip_ch]      ;   \
   release ptp_hip_path.rx_mac.ptp_rx.am_exit_tod   [ptp_hip_ch][95:0];

`define special_handling_for_ptp_simulation_mr(eth_ip_instance_hpath, eth_ip_sip_instance_hpath, tile_atom_hpath, aib_id, one_hot_selector) \
    // For PTP channel base at AIB23: 25g/50g,100g/200g,400g \
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 23) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk1.ehip_mac_50g_0,0,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk1.ehip_mac_50g_0,1,eth_ip_sip_instance_hpath, 0)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,0,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,1,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,2,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,3,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,4,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,5,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,6,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,7,eth_ip_sip_instance_hpath, 0)\
            // 400g hip reg \
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,0,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,1,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,2,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,3,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,4,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,5,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,6,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,7,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,8,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,9,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,10,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,11,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,12,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,13,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,14,eth_ip_sip_instance_hpath, 0)\
            `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,15,eth_ip_sip_instance_hpath, 0)\
        end\
        else begin \
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk1.ehip_mac_50g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk1.ehip_mac_50g_0,1)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,7)\
            // 400g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,7)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,8)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,9)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,10)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,11)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,12)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,13)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,14)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,15)\
        end \
    end // aib23 \
    // For PTP channel base at AIB22: 25g\
    if ( // UMR3 10/25GE-1 or BMR2 25GE-1\
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 22) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 1 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,1,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "25G-1") begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,1,eth_ip_sip_instance_hpath, 0)\
            end\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,1)\
        end\
    end // aib22 \
    // For PTP channel base at AIB20: 25g\
    if ( // UMR3 10/25GE-1 or BMR2 25GE-1 \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 20) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 3 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,0,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,1,eth_ip_sip_instance_hpath, 3)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "25G-1") begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,1,eth_ip_sip_instance_hpath, 0)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,1)\
        end\
    end // aib20 \
    // For PTP channel base at AIB18: 25g\
    if ( // UMR3 10/25GE-1 or BMR2 25GE-1\
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 18) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 1 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,1,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "25G-1") begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,1,eth_ip_sip_instance_hpath, 0)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,1)\
        end\
    end // aib18 \
    // For PTP channel base at AIB16: 25g\
    if ( // UMR3 10/25GE-1 or BMR2 25GE-1\
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 16) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 3 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,0,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,1,eth_ip_sip_instance_hpath, 3)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "25G-1") begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,1,eth_ip_sip_instance_hpath, 0)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,1)\
        end\
    end // aib16 \
    // For PTP channel base at AIB14: 25g\
    if ( // UMR3 10/25GE-1 or BMR2 25GE-1\
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 14) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 1 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,1,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "25G-1") begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,1,eth_ip_sip_instance_hpath, 0)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,1)\
        end\
    end // aib14 \
    // For PTP channel base at AIB12: 25g\
    if ( // UMR3 10/25GE-1 or BMR2 25GE-1\
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 12) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 3 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,0,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,1,eth_ip_sip_instance_hpath, 3)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "25G-1") begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,1,eth_ip_sip_instance_hpath, 0)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,1)\
        end\
    end// aib12 \
    // For PTP channel base at AIB10: 25g\
    if ( // UMR3 10/25GE-1 or BMR2 25GE-1\
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 10) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 1 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,1,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "25G-1") begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,1,eth_ip_sip_instance_hpath, 0)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,1)\
        end\
    end// aib10 \
    // For PTP channel base at AIB08: 25g\
    if ( // UMR3 10/25GE-1 or BMR2 25GE-1\
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 8) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 3 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,0,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,1,eth_ip_sip_instance_hpath, 3)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "25G-1") begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,1,eth_ip_sip_instance_hpath, 0)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,1)\
        end\
    end// aib08 \
    // For PTP channel base at AIB21: 25g,50g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 21) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if ((eth_ip_instance_hpath.RCFG_GRP == "25G-1") || (eth_ip_instance_hpath.RCFG_GRP == "50G-1")) begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,1,eth_ip_sip_instance_hpath, 0)\
            end else if ((eth_ip_instance_hpath.RCFG_GRP == "100G-2") || (eth_ip_instance_hpath.RCFG_GRP == "200G-4")) begin // port 1 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,1,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 2 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,1,eth_ip_sip_instance_hpath, 2)\
            end\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,1)\
        end\
    end // aib21 \
    // For PTP channel base at AIB17: 25g,50g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 17) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if ((eth_ip_instance_hpath.RCFG_GRP == "25G-1") || (eth_ip_instance_hpath.RCFG_GRP == "50G-1")) begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,1,eth_ip_sip_instance_hpath, 0)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "100G-2") begin // port 1 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,1,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 2 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,1,eth_ip_sip_instance_hpath, 2)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "200G-4") begin // port 3 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,0,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,1,eth_ip_sip_instance_hpath, 3)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,1)\
        end\
    end // aib17 \
    // For PTP channel base at AIB13: 25g,50g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 13) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if ((eth_ip_instance_hpath.RCFG_GRP == "25G-1") || (eth_ip_instance_hpath.RCFG_GRP == "50G-1")) begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,1,eth_ip_sip_instance_hpath, 0)\
            end else if ((eth_ip_instance_hpath.RCFG_GRP == "100G-2") || (eth_ip_instance_hpath.RCFG_GRP == "200G-4")) begin // port 1 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,1,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 2 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,1,eth_ip_sip_instance_hpath, 2)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,1)\
        end\
    end // aib13 \
    // For PTP channel base at AIB09: 25g,50g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 9) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            if ((eth_ip_instance_hpath.RCFG_GRP == "25G-1") || (eth_ip_instance_hpath.RCFG_GRP == "50G-1")) begin // port 0 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,1,eth_ip_sip_instance_hpath, 0)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "100G-2") begin // port 1 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,1,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "100G-4") begin // port 2 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,1,eth_ip_sip_instance_hpath, 2)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "200G-4") begin // port 3 \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,0,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,1,eth_ip_sip_instance_hpath, 3)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,1)\
        end\
    end // aib09 \
    // For PTP channel base at AIB19: 25g,50g,100g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 19) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25GE-1/50GE-1/100G-4/100G-2/100G-1 \
            if ((eth_ip_instance_hpath.RCFG_GRP == "25G-1") || (eth_ip_instance_hpath.RCFG_GRP == "50G-1") || (eth_ip_instance_hpath.RCFG_GRP == "100G-4") || (eth_ip_instance_hpath.RCFG_GRP == "100G-2") || (eth_ip_instance_hpath.RCFG_GRP == "100G-1")) begin // port 0 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,1,eth_ip_sip_instance_hpath, 0)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,1,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,2,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,3,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,4,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,5,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,6,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,7,eth_ip_sip_instance_hpath, 0)\
            end else if ((eth_ip_instance_hpath.RCFG_GRP == "400G-8") || (eth_ip_instance_hpath.RCFG_GRP == "400G-4") || (eth_ip_instance_hpath.RCFG_GRP == "200G-2")) begin // port 1 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,1,eth_ip_sip_instance_hpath, 1)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,1,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,2,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,3,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,4,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,5,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,6,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,7,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "200G-4") begin // port 2 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,1,eth_ip_sip_instance_hpath, 2)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,1,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,2,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,3,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,4,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,5,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,6,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,7,eth_ip_sip_instance_hpath, 2)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,1)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,7)\
        end\
    end // aib19 \
    // For PTP channel base at AIB11: 25g,50g,100g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 11) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25GE-1/50GE-1/100G-4/100G-2/100G-1 \
            if ((eth_ip_instance_hpath.RCFG_GRP == "25G-1") || (eth_ip_instance_hpath.RCFG_GRP == "50G-1") || (eth_ip_instance_hpath.RCFG_GRP == "100G-4") || (eth_ip_instance_hpath.RCFG_GRP == "100G-2") || (eth_ip_instance_hpath.RCFG_GRP == "100G-1")) begin // port 0 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,1,eth_ip_sip_instance_hpath, 0)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,1,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,2,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,3,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,4,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,5,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,6,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,7,eth_ip_sip_instance_hpath, 0)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "200G-2") begin // port 1 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,1,eth_ip_sip_instance_hpath, 1)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,0,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,1,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,2,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,3,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,4,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,5,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,6,eth_ip_sip_instance_hpath, 1)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,7,eth_ip_sip_instance_hpath, 1)\
            end else if (eth_ip_instance_hpath.RCFG_GRP == "200G-4") begin // port 2 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,1,eth_ip_sip_instance_hpath, 2)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,1,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,2,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,3,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,4,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,5,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,6,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,7,eth_ip_sip_instance_hpath, 2)\
            end else if ((eth_ip_instance_hpath.RCFG_GRP == "400G-8") || (eth_ip_instance_hpath.RCFG_GRP == "400G-4")) begin // port 3 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,0,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,1,eth_ip_sip_instance_hpath, 3)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,0,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,1,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,2,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,3,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,4,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,5,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,6,eth_ip_sip_instance_hpath, 3)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,7,eth_ip_sip_instance_hpath, 3)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,1)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,7)\
        end\
    end // aib11 \
    // For PTP channel base at AIB15: 25g,50g,100g,200g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    (aib_id == 15) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25GE-1/50GE-1/100G-4/100G-2/100G-1/200G-2/200G-4 \
            if ((eth_ip_instance_hpath.RCFG_GRP == "25G-1") || (eth_ip_instance_hpath.RCFG_GRP == "50G-1") || (eth_ip_instance_hpath.RCFG_GRP == "100G-4") || (eth_ip_instance_hpath.RCFG_GRP == "200G-4") || (eth_ip_instance_hpath.RCFG_GRP == "100G-2") || (eth_ip_instance_hpath.RCFG_GRP == "100G-1") || (eth_ip_instance_hpath.RCFG_GRP == "200G-2")) begin // port 0 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,1,eth_ip_sip_instance_hpath, 0)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,0,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,1,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,2,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,3,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,4,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,5,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,6,eth_ip_sip_instance_hpath, 0)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,7,eth_ip_sip_instance_hpath, 0)\
            end else if ((eth_ip_instance_hpath.RCFG_GRP == "400G-8") || (eth_ip_instance_hpath.RCFG_GRP == "400G-4")) begin // port 2 \
                // 25g/50g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,1,eth_ip_sip_instance_hpath, 2)\
                // 100g/200g hip reg \
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,0,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,1,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,2,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,3,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,4,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,5,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,6,eth_ip_sip_instance_hpath, 2)\
                `special_handling_for_ptp_simulation_force_mr(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,7,eth_ip_sip_instance_hpath, 2)\
            end \
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,1)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,7)\
        end\
    end // aib15 \
// end

`define special_handling_for_ptp_simulation_sr(eth_ip_instance_hpath, eth_ip_sip_instance_hpath, tile_atom_hpath, aib_id, one_hot_selector) \
`ifndef ALTERA_RESERVED_QIS \
    // For PTP channel base at AIB23: 25g/50g,100g/200g,400g \
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE != "40G")) && \
    (aib_id == 23) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk1.ehip_mac_50g_0,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk1.ehip_mac_50g_0,1,eth_ip_sip_instance_hpath)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,1,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,2,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,3,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,4,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,5,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,6,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,7,eth_ip_sip_instance_hpath)\
            // 400g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,1,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,2,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,3,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,4,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,5,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,6,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,7,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,8,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,9,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,10,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,11,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,12,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,13,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,14,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,15,eth_ip_sip_instance_hpath)\
        end\
        else begin \
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk1.ehip_mac_50g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk1.ehip_mac_50g_0,1)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk1.ehip_mac_200g_0,7)\
            // 400g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,7)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,8)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,9)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,10)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,11)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,12)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,13)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,14)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_400g_0.genblk1.ehip_mac_400g_0,15)\
        end \
    end // aib23 \
    // For PTP channel base at AIB22: 25g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G")) && \
    (aib_id == 22) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk1.ehip_mac_50g_0,1)\
        end\
    end // aib22 \
    // For PTP channel base at AIB20: 25g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G")) && \
    (aib_id == 20) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk2.ehip_mac_50g_1,1)\
        end\
    end // aib20 \
    // For PTP channel base at AIB18: 25g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G")) && \
    (aib_id == 18) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk3.ehip_mac_50g_2,1)\
        end\
    end // aib18 \
    // For PTP channel base at AIB16: 25g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G")) && \
    (aib_id == 16) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk4.ehip_mac_50g_3,1)\
        end\
    end // aib16 \
    // For PTP channel base at AIB14: 25g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G")) && \
    (aib_id == 14) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk5.ehip_mac_50g_4,1)\
        end\
    end // aib14 \
    // For PTP channel base at AIB12: 25g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G")) && \
    (aib_id == 12) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk6.ehip_mac_50g_5,1)\
        end\
    end // aib12 \
    // For PTP channel base at AIB10: 25g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G")) && \
    (aib_id == 10) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk7.ehip_mac_50g_6,1)\
        end\
    end // aib10 \
    // For PTP channel base at AIB08: 25g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G")) && \
    (aib_id == 8) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_1.genblk8.ehip_mac_50g_7,1)\
        end\
    end // aib08 \
    // For PTP channel base at AIB21: 25g,50g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G") || (eth_ip_instance_hpath.EHIP_RATE == "50G")) && \
    (aib_id == 21) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk2.ehip_mac_50g_1,1)\
        end\
    end // aib21 \
    // For PTP channel base at AIB17: 25g,50g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G") || (eth_ip_instance_hpath.EHIP_RATE == "50G")) && \
    (aib_id == 17) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk4.ehip_mac_50g_3,1)\
        end\
    end // aib17 \
    // For PTP channel base at AIB13: 25g,50g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G") || (eth_ip_instance_hpath.EHIP_RATE == "50G")) && \
    (aib_id == 13) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk6.ehip_mac_50g_5,1)\
        end\
    end // aib13 \
    // For PTP channel base at AIB09: 25g,50g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G") || (eth_ip_instance_hpath.EHIP_RATE == "50G")) && \
    (aib_id == 9) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,1,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk8.ehip_mac_50g_7,1)\
        end\
    end // aib09 \
    // For PTP channel base at AIB19: 25g,50g,100g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G") || (eth_ip_instance_hpath.EHIP_RATE == "50G") || (eth_ip_instance_hpath.EHIP_RATE == "100G")) && \
    (aib_id == 19) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,1,eth_ip_sip_instance_hpath)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,1,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,2,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,3,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,4,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,5,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,6,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,7,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk3.ehip_mac_50g_2,1)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk1.ehip_mac_200g_0,7)\
        end\
    end // aib19 \
    // For PTP channel base at AIB11: 25g,50g,100g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G") || (eth_ip_instance_hpath.EHIP_RATE == "50G") || (eth_ip_instance_hpath.EHIP_RATE == "100G")) && \
    (aib_id == 11) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,1,eth_ip_sip_instance_hpath)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,1,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,2,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,3,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,4,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,5,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,6,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,7,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk7.ehip_mac_50g_6,1)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_1.genblk2.ehip_mac_200g_1,7)\
        end\
    end // aib11 \
    // For PTP channel base at AIB15: 25g,50g,100g,200g\
    if ( \
    (eth_ip_instance_hpath.ENABLE_PTP == 1'b1)   && \
    ((eth_ip_instance_hpath.EHIP_RATE == "10G") || (eth_ip_instance_hpath.EHIP_RATE == "25G") || (eth_ip_instance_hpath.EHIP_RATE == "50G") || (eth_ip_instance_hpath.EHIP_RATE == "100G") || (eth_ip_instance_hpath.EHIP_RATE == "200G")) && \
    (aib_id == 15) \
    ) begin \
        if (one_hot_selector == 1) begin\
            #6000ps;\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,1,eth_ip_sip_instance_hpath)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,0,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,1,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,2,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,3,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,4,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,5,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,6,eth_ip_sip_instance_hpath)\
            `special_handling_for_ptp_simulation_force(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,7,eth_ip_sip_instance_hpath)\
        end\
        else begin\
            // 25g/50g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar1.ehip_par_50g_0.genblk5.ehip_mac_50g_4,1)\
            // 100g/200g hip reg \
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,0)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,1)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,2)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,3)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,4)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,5)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,6)\
            `special_handling_for_ptp_simulation_release(tile_atom_hpath.u_e400g_top.u_e4hip_top.gdr_e4hip_mac.gdr_ehip_mac.gdr_e4hip_macpar0.ehip_par_200g_0.genblk2.ehip_mac_200g_1,7)\
        end\
    end // aib15 \
`endif // ifndef ALTERA_RESERVED_QIS

`define special_handling_for_ptp_simulation(ptp_mux_ip_instance_hpath, eth_ip_instance_hpath, eth_ip_sip_instance_hpath, tile_atom_hpath, aib_id, one_hot_selector) \
`ifndef ALTERA_RESERVED_QIS \
    `ifndef SKIP_SIM_MODEL_LOG2_MRK \
        always @ (one_hot_selector) begin \
            #6000ps;\
            if (eth_ip_instance_hpath.PTP_MRIP_DEBUG == 0)\
                `special_handling_for_ptp_simulation_sr (eth_ip_instance_hpath, eth_ip_sip_instance_hpath, tile_atom_hpath.z1577a.z1577a_inst, aib_id, one_hot_selector)\
            else if (eth_ip_instance_hpath.PTP_MRIP_DEBUG == 1)\
                `special_handling_for_ptp_simulation_mr (eth_ip_instance_hpath, eth_ip_sip_instance_hpath, tile_atom_hpath.z1577a.z1577a_inst, aib_id, one_hot_selector)\
            end \
    `endif // ifndef SKIP_SIM_MODEL_LOG2MRK  \
`endif // ifndef ALTERA_RESERVED_QIS
// PTP DEFINE MACRO ENDS
`ifdef QUESTA_INTEL_OEM
`pragma questa_oem_00 "iuBeK6jR69XRNHgPOXANQcgjB4WcZGkPF3FM4twIZ3EvsrAtxQsYS6Hpi5XGvIMMcH9N6DPm/kmHi0wPOQiuTHVVVxmr9OiPO/RVoCdNzGMPvFnw/zRMf5njlvSl/Ap+x6pvul8+7XHuyLyqwObdmDkbCQayz2DnxYXZjjt2proJ3XfkjECmKOX4nN4VQ1AR4UGhbU0fMVSMpGQjFTDlax90AVVn6m/PSOsKahRUPX+8EHjPkFhYvqDRenYopJYDLRKpkjdL0aHHCKgiC/MzHEk7Q4Lk8DVoVCJHBOKa4W4iVeyPXEopMijXtguJ+984iThg6+kOExMhS85LlYXKEojtDcxQRhSlPsBtTAlDWOmJsgZ2CjuLmg978u+O3tzltTugVJ2R8+Sc0Ndsc3sb6bBvOBN0EMFsMwLolsCwLb/+xuW4b3as/jezFhJfoDzgd/pWYbUGU4wTb6dN775o/bpocNRxcAkcgDlib5SQRRSXOHIKQF+bdNgRnOpyNjU4IaHonEGlczfsfjyjyR3RtbA01e0uupYEURSPs8E5GdnPmDjzO78p8hVKpOFJApOOyr+b3dUgoIZX9M4TBu1d/Rb36asvSjAhuLgZ3FgD5oTasnfCN9De92y2Nf9SvfhOrcAIVYIqd+imFyqEDitxrQDrkD6NhML7ZgE0Vbg7VwUki2Oe0MsYIAReeUO7gyeqH0sHZ4eV0igikUF3y26t/jlk+f9N8qnwJFDjb30Qprx6SusXI/IgWPitzq9wsCOM1Ts1hQhQPDXjfB+wLXin5L0H6iMko+ssE8CiaWlHR3+2sYcf37fy0ZvwkpzsCnuKMjiYRpB2fWpN3xxQv2qm408WiBNc65bqiyujgGP3xKlqGbWNJcBhET4Di3R80NcBerjOE2vPu23OfPcsZSReYIWHfGifRaQTLhFSTBOYjgyRvZSGr08L4M3DJHEYdhBGlk/H323Nb/jSVLwaHXOmf76sk09nAkuB0hbBrqv+X2/B3lrlCLxtnxKStrV510YA"
`endif