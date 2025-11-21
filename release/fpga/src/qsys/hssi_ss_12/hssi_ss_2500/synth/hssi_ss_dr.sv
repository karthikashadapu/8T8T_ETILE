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






module hssi_ss_dr #(
    parameter DISABLE_DR_CPU    = 0,
    parameter SIM_MODE          = 0,
    parameter SIM_FAST_EN = 0
) (
    input                                  i_reconfig_clk               ,
    input                                  i_reconfig_reset             ,
    input                                  i_csr_rst_in                 ,
    input                                  i_ss_rst_done                ,
    //
    input       [3:0]                      i_cpu_cmd_type               ,
    input                                  i_cpu_cmd_start              ,
    input       [1:0]                      i_xcvr_reg_byte_no           ,
    input       [31:0]                     i_cpu_command                ,
    input       [31:0]                     i_cpu_wr_data                ,
    output                                 o_cpu_cmd_complete           ,
    output                                 o_cpu_cmd_error              ,
    output      [31:0]                     o_cpu_rd_data                ,
    output      [5:0]                      o_cpu_p0_port_profile,
    output      [19:0]                     o_cpu_p0_port_params,
    output      [5:0]                      o_cpu_p1_port_profile,
    output      [19:0]                     o_cpu_p1_port_params,
    output      [5:0]                      o_cpu_p2_port_profile,
    output      [19:0]                     o_cpu_p2_port_params,
    output      [5:0]                      o_cpu_p3_port_profile,
    output      [19:0]                     o_cpu_p3_port_params,
    output      [5:0]                      o_cpu_p4_port_profile,
    output      [19:0]                     o_cpu_p4_port_params,
    output      [5:0]                      o_cpu_p5_port_profile,
    output      [19:0]                     o_cpu_p5_port_params,
    output      [5:0]                      o_cpu_p6_port_profile,
    output      [19:0]                     o_cpu_p6_port_params,
    output      [5:0]                      o_cpu_p7_port_profile,
    output      [19:0]                     o_cpu_p7_port_params,
    output      [5:0]                      o_cpu_p8_port_profile,
    output      [19:0]                     o_cpu_p8_port_params,
    output      [5:0]                      o_cpu_p9_port_profile,
    output      [19:0]                     o_cpu_p9_port_params,
    output      [5:0]                      o_cpu_p10_port_profile,
    output      [19:0]                     o_cpu_p10_port_params,
    output      [5:0]                      o_cpu_p11_port_profile,
    output      [19:0]                     o_cpu_p11_port_params,
    output      [5:0]                      o_cpu_p12_port_profile,
    output      [19:0]                     o_cpu_p12_port_params,
    output      [5:0]                      o_cpu_p13_port_profile,
    output      [19:0]                     o_cpu_p13_port_params,
    output      [5:0]                      o_cpu_p14_port_profile,
    output      [19:0]                     o_cpu_p14_port_params,
    output      [5:0]                      o_cpu_p15_port_profile,
    output      [19:0]                     o_cpu_p15_port_params,

    output                                 o_p0_pio_axi_st_bridge_rst_n,
    output                                 o_p0_pio_ehip_tx_rst_n,
    output                                 o_p0_pio_ehip_rx_rst_n,
    output                                 o_p0_pio_ereset_n,
    input       [16-1:0]           i_xcvr_ready                 ,
    input       [16-1:0]           i_tx_pma_ready               ,
    input       [16-1:0]           i_rx_pma_ready               ,
    output      [16-1:0]           o_load_recipe_error          ,
    output      [16-1:0]           o_xcvr_cal_error             ,
    input       [16-1:0]           i_hotplug_paused_fm          ,
    output      [16-1:0]           o_hotplug_disable_fm         ,
    output      [16-1:0]           o_hotplug_lpbk_en_fm         ,
    // nios recon16-1g, user-facing side
    output      [25:0]                     o_cpu_reconfig_addr          ,
    output                                 o_cpu_reconfig_read          ,
    output                                 o_cpu_reconfig_write         ,
    output      [3:0]                      o_cpu_reconfig_byteenable    ,
    output      [31:0]                     o_cpu_reconfig_writedata     ,
    input       [31:0]                     i_cpu_reconfig_readdata      ,
    input                                  i_cpu_reconfig_readdata_valid,
    input                                  i_cpu_reconfig_waitrequest    
);
 
 
    reg cpu_reconfig_read_d1;
    reg cpu_reconfig_write_d1;
    wire [1:0] dummy;
    wire p0_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p0_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p0_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p0_pio_ereset_n;              // PIO_3 from NIOS
    wire p0_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p0_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p0_base_profile = 2'd0;
    wire [3:0] o_cpu_p0_curr_profile;
    assign o_cpu_p0_port_profile = {o_cpu_p0_base_profile, o_cpu_p0_curr_profile};
    wire p1_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p1_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p1_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p1_pio_ereset_n;              // PIO_3 from NIOS
    wire p1_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p1_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p1_base_profile = 2'd0;
    wire [3:0] o_cpu_p1_curr_profile;
    assign o_cpu_p1_port_profile = {o_cpu_p1_base_profile, o_cpu_p1_curr_profile};
    wire p2_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p2_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p2_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p2_pio_ereset_n;              // PIO_3 from NIOS
    wire p2_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p2_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p2_base_profile = 2'd0;
    wire [3:0] o_cpu_p2_curr_profile;
    assign o_cpu_p2_port_profile = {o_cpu_p2_base_profile, o_cpu_p2_curr_profile};
    wire p3_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p3_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p3_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p3_pio_ereset_n;              // PIO_3 from NIOS
    wire p3_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p3_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p3_base_profile = 2'd0;
    wire [3:0] o_cpu_p3_curr_profile;
    assign o_cpu_p3_port_profile = {o_cpu_p3_base_profile, o_cpu_p3_curr_profile};
    wire p4_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p4_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p4_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p4_pio_ereset_n;              // PIO_3 from NIOS
    wire p4_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p4_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p4_base_profile = 2'd0;
    wire [3:0] o_cpu_p4_curr_profile;
    assign o_cpu_p4_port_profile = {o_cpu_p4_base_profile, o_cpu_p4_curr_profile};
    wire p5_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p5_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p5_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p5_pio_ereset_n;              // PIO_3 from NIOS
    wire p5_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p5_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p5_base_profile = 2'd0;
    wire [3:0] o_cpu_p5_curr_profile;
    assign o_cpu_p5_port_profile = {o_cpu_p5_base_profile, o_cpu_p5_curr_profile};
    wire p6_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p6_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p6_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p6_pio_ereset_n;              // PIO_3 from NIOS
    wire p6_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p6_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p6_base_profile = 2'd0;
    wire [3:0] o_cpu_p6_curr_profile;
    assign o_cpu_p6_port_profile = {o_cpu_p6_base_profile, o_cpu_p6_curr_profile};
    wire p7_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p7_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p7_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p7_pio_ereset_n;              // PIO_3 from NIOS
    wire p7_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p7_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p7_base_profile = 2'd0;
    wire [3:0] o_cpu_p7_curr_profile;
    assign o_cpu_p7_port_profile = {o_cpu_p7_base_profile, o_cpu_p7_curr_profile};
    wire p8_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p8_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p8_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p8_pio_ereset_n;              // PIO_3 from NIOS
    wire p8_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p8_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p8_base_profile = 2'd0;
    wire [3:0] o_cpu_p8_curr_profile;
    assign o_cpu_p8_port_profile = {o_cpu_p8_base_profile, o_cpu_p8_curr_profile};
    wire p9_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p9_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p9_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p9_pio_ereset_n;              // PIO_3 from NIOS
    wire p9_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p9_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p9_base_profile = 2'd0;
    wire [3:0] o_cpu_p9_curr_profile;
    assign o_cpu_p9_port_profile = {o_cpu_p9_base_profile, o_cpu_p9_curr_profile};
    wire p10_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p10_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p10_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p10_pio_ereset_n;              // PIO_3 from NIOS
    wire p10_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p10_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p10_base_profile = 2'd0;
    wire [3:0] o_cpu_p10_curr_profile;
    assign o_cpu_p10_port_profile = {o_cpu_p10_base_profile, o_cpu_p10_curr_profile};
    wire p11_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p11_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p11_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p11_pio_ereset_n;              // PIO_3 from NIOS
    wire p11_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p11_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p11_base_profile = 2'd0;
    wire [3:0] o_cpu_p11_curr_profile;
    assign o_cpu_p11_port_profile = {o_cpu_p11_base_profile, o_cpu_p11_curr_profile};
    wire p12_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p12_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p12_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p12_pio_ereset_n;              // PIO_3 from NIOS
    wire p12_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p12_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p12_base_profile = 2'd0;
    wire [3:0] o_cpu_p12_curr_profile;
    assign o_cpu_p12_port_profile = {o_cpu_p12_base_profile, o_cpu_p12_curr_profile};
    wire p13_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p13_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p13_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p13_pio_ereset_n;              // PIO_3 from NIOS
    wire p13_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p13_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p13_base_profile = 2'd0;
    wire [3:0] o_cpu_p13_curr_profile;
    assign o_cpu_p13_port_profile = {o_cpu_p13_base_profile, o_cpu_p13_curr_profile};
    wire p14_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p14_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p14_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p14_pio_ereset_n;              // PIO_3 from NIOS
    wire p14_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p14_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p14_base_profile = 2'd0;
    wire [3:0] o_cpu_p14_curr_profile;
    assign o_cpu_p14_port_profile = {o_cpu_p14_base_profile, o_cpu_p14_curr_profile};
    wire p15_pio_axi_st_bridge_rst_n;   // PIO_0 from NIOS
    wire p15_pio_ehip_tx_rst_n;         // PIO_1 from NIOS
    wire p15_pio_ehip_rx_rst_n;         // PIO_2 from NIOS
    wire p15_pio_ereset_n;              // PIO_3 from NIOS
    wire p15_pio_ehip_tx_rst_ack_n;         // tx reset ack from EHIP 
    wire p15_pio_ehip_rx_rst_ack_n;         // rx reset ack from EHIPPIO_6 from NIOS
    wire [1:0] o_cpu_p15_base_profile = 2'd0;
    wire [3:0] o_cpu_p15_curr_profile;
    assign o_cpu_p15_port_profile = {o_cpu_p15_base_profile, o_cpu_p15_curr_profile};
    wire sim_mode;
    wire sim_fast_en;
 
     assign sim_mode = (SIM_MODE == 1) ? 1'b1 : 1'b0;
     assign sim_fast_en = {SIM_FAST_EN == 1} ? 1'b1 : 1'b0;
       
    generate
        if(DISABLE_DR_CPU == 0) begin : internal_cpu
            hssi_ss_dr_cpu TRAINING_CPU (
                .clk_clk                     (i_reconfig_clk                                                 ),
                .reset_reset                 (i_csr_rst_in                                                   ),
                .cpu_cmd_type_export         ({7'b0,sim_fast_en, sim_mode, i_xcvr_reg_byte_no, i_ss_rst_done, i_cpu_cmd_type}  ),
                .cpu_cmd_export          (i_cpu_command                                                  ),
                .cpu_wr_data_export          (i_cpu_wr_data                                                  ),
                .cpu_cmd_start_export        (i_cpu_cmd_start                                                ),
                .cpu_cmd_complete_export     ({dummy[1:0], o_cpu_cmd_error, o_cpu_cmd_complete}              ),
                .cpu_rd_data_export          (o_cpu_rd_data                                                  ),
                //.nios_intr_in                (nios_intr_in),
                .cpu_port_dr_en_export       (16'd0                                           ),
                .cpu_p0_base_profile_export(o_cpu_p0_base_profile                          ),
                .cpu_p0_curr_profile_export(o_cpu_p0_curr_profile                          ),
                .cpu_p0_port_params_export (o_cpu_p0_port_params                           ),
                .cpu_p0_reset_pio_export({o_p0_pio_ereset_n, o_p0_pio_ehip_rx_rst_n, 
                                                   o_p0_pio_ehip_tx_rst_n, o_p0_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p1_base_profile_export(o_cpu_p1_base_profile                          ),
                .cpu_p1_curr_profile_export(o_cpu_p1_curr_profile                          ),
                .cpu_p1_port_params_export (o_cpu_p1_port_params                           ),
                .cpu_p1_reset_pio_export({o_p1_pio_ereset_n, o_p1_pio_ehip_rx_rst_n, 
                                                   o_p1_pio_ehip_tx_rst_n, o_p1_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p2_base_profile_export(o_cpu_p2_base_profile                          ),
                .cpu_p2_curr_profile_export(o_cpu_p2_curr_profile                          ),
                .cpu_p2_port_params_export (o_cpu_p2_port_params                           ),
                .cpu_p2_reset_pio_export({o_p2_pio_ereset_n, o_p2_pio_ehip_rx_rst_n, 
                                                   o_p2_pio_ehip_tx_rst_n, o_p2_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p3_base_profile_export(o_cpu_p3_base_profile                          ),
                .cpu_p3_curr_profile_export(o_cpu_p3_curr_profile                          ),
                .cpu_p3_port_params_export (o_cpu_p3_port_params                           ),
                .cpu_p3_reset_pio_export({o_p3_pio_ereset_n, o_p3_pio_ehip_rx_rst_n, 
                                                   o_p3_pio_ehip_tx_rst_n, o_p3_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p4_base_profile_export(o_cpu_p4_base_profile                          ),
                .cpu_p4_curr_profile_export(o_cpu_p4_curr_profile                          ),
                .cpu_p4_port_params_export (o_cpu_p4_port_params                           ),
                .cpu_p4_reset_pio_export({o_p4_pio_ereset_n, o_p4_pio_ehip_rx_rst_n, 
                                                   o_p4_pio_ehip_tx_rst_n, o_p4_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p5_base_profile_export(o_cpu_p5_base_profile                          ),
                .cpu_p5_curr_profile_export(o_cpu_p5_curr_profile                          ),
                .cpu_p5_port_params_export (o_cpu_p5_port_params                           ),
                .cpu_p5_reset_pio_export({o_p5_pio_ereset_n, o_p5_pio_ehip_rx_rst_n, 
                                                   o_p5_pio_ehip_tx_rst_n, o_p5_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p6_base_profile_export(o_cpu_p6_base_profile                          ),
                .cpu_p6_curr_profile_export(o_cpu_p6_curr_profile                          ),
                .cpu_p6_port_params_export (o_cpu_p6_port_params                           ),
                .cpu_p6_reset_pio_export({o_p6_pio_ereset_n, o_p6_pio_ehip_rx_rst_n, 
                                                   o_p6_pio_ehip_tx_rst_n, o_p6_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p7_base_profile_export(o_cpu_p7_base_profile                          ),
                .cpu_p7_curr_profile_export(o_cpu_p7_curr_profile                          ),
                .cpu_p7_port_params_export (o_cpu_p7_port_params                           ),
                .cpu_p7_reset_pio_export({o_p7_pio_ereset_n, o_p7_pio_ehip_rx_rst_n, 
                                                   o_p7_pio_ehip_tx_rst_n, o_p7_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p8_base_profile_export(o_cpu_p8_base_profile                          ),
                .cpu_p8_curr_profile_export(o_cpu_p8_curr_profile                          ),
                .cpu_p8_port_params_export (o_cpu_p8_port_params                           ),
                .cpu_p8_reset_pio_export({o_p8_pio_ereset_n, o_p8_pio_ehip_rx_rst_n, 
                                                   o_p8_pio_ehip_tx_rst_n, o_p8_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p9_base_profile_export(o_cpu_p9_base_profile                          ),
                .cpu_p9_curr_profile_export(o_cpu_p9_curr_profile                          ),
                .cpu_p9_port_params_export (o_cpu_p9_port_params                           ),
                .cpu_p9_reset_pio_export({o_p9_pio_ereset_n, o_p9_pio_ehip_rx_rst_n, 
                                                   o_p9_pio_ehip_tx_rst_n, o_p9_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p10_base_profile_export(o_cpu_p10_base_profile                          ),
                .cpu_p10_curr_profile_export(o_cpu_p10_curr_profile                          ),
                .cpu_p10_port_params_export (o_cpu_p10_port_params                           ),
                .cpu_p10_reset_pio_export({o_p10_pio_ereset_n, o_p10_pio_ehip_rx_rst_n, 
                                                   o_p10_pio_ehip_tx_rst_n, o_p10_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p11_base_profile_export(o_cpu_p11_base_profile                          ),
                .cpu_p11_curr_profile_export(o_cpu_p11_curr_profile                          ),
                .cpu_p11_port_params_export (o_cpu_p11_port_params                           ),
                .cpu_p11_reset_pio_export({o_p11_pio_ereset_n, o_p11_pio_ehip_rx_rst_n, 
                                                   o_p11_pio_ehip_tx_rst_n, o_p11_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p12_base_profile_export(o_cpu_p12_base_profile                          ),
                .cpu_p12_curr_profile_export(o_cpu_p12_curr_profile                          ),
                .cpu_p12_port_params_export (o_cpu_p12_port_params                           ),
                .cpu_p12_reset_pio_export({o_p12_pio_ereset_n, o_p12_pio_ehip_rx_rst_n, 
                                                   o_p12_pio_ehip_tx_rst_n, o_p12_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p13_base_profile_export(o_cpu_p13_base_profile                          ),
                .cpu_p13_curr_profile_export(o_cpu_p13_curr_profile                          ),
                .cpu_p13_port_params_export (o_cpu_p13_port_params                           ),
                .cpu_p13_reset_pio_export({o_p13_pio_ereset_n, o_p13_pio_ehip_rx_rst_n, 
                                                   o_p13_pio_ehip_tx_rst_n, o_p13_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p14_base_profile_export(o_cpu_p14_base_profile                          ),
                .cpu_p14_curr_profile_export(o_cpu_p14_curr_profile                          ),
                .cpu_p14_port_params_export (o_cpu_p14_port_params                           ),
                .cpu_p14_reset_pio_export({o_p14_pio_ereset_n, o_p14_pio_ehip_rx_rst_n, 
                                                   o_p14_pio_ehip_tx_rst_n, o_p14_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                .cpu_p15_base_profile_export(o_cpu_p15_base_profile                          ),
                .cpu_p15_curr_profile_export(o_cpu_p15_curr_profile                          ),
                .cpu_p15_port_params_export (o_cpu_p15_port_params                           ),
                .cpu_p15_reset_pio_export({o_p15_pio_ereset_n, o_p15_pio_ehip_rx_rst_n, 
                                                   o_p15_pio_ehip_tx_rst_n, o_p15_pio_axi_st_bridge_rst_n}),   // PIO_0 from NIOS
                //
                .cpu_load_recipe_enable_export (16'd0                              ),
                .cpu_anlt_vsr_en_export        (16'd0                                 ),
                .cpu_xcvr_ready_export         (i_xcvr_ready                                                 ),
                .cpu_load_recipe_error_export  (o_load_recipe_error                                          ),
                .cpu_xcvr_cal_error_export     (o_xcvr_cal_error                                             ),
                .cpu_tx_pma_ready_export       (i_tx_pma_ready                                               ),
                .cpu_rx_pma_ready_export       (i_rx_pma_ready                                               ),
                .cpu_hotplug_paused_export     (i_hotplug_paused_fm                                          ),
                .cpu_hotplug_disable_export    ({o_hotplug_lpbk_en_fm[16-1:0], o_hotplug_disable_fm[16-1:0]} ),
                .cpu_qhip_enable_export        (16'd1                                     ),
                .cpu_qhip_num_channels_export  (32'd0                                       ),
                .cpu_xcvr_channel_enable_export(16'd1                             ),
                     //
                .cpu_reconfig_waitrequest    (i_cpu_reconfig_waitrequest                                     ),
                .cpu_reconfig_readdata       (i_cpu_reconfig_readdata                                        ),
                .cpu_reconfig_readdatavalid  (i_cpu_reconfig_readdata_valid                                  ),
                .cpu_reconfig_burstcount     (                                                               ), //unconnected
                .cpu_reconfig_writedata      (o_cpu_reconfig_writedata                                       ),
                .cpu_reconfig_address        (o_cpu_reconfig_addr                                            ),
                .cpu_reconfig_write          (o_cpu_reconfig_write                                           ),
                .cpu_reconfig_read           (o_cpu_reconfig_read                                            ),
                .cpu_reconfig_byteenable     (o_cpu_reconfig_byteenable                                      ), 
                .cpu_reconfig_debugaccess    (                                                               )  //unconnected
            );

          assign o_p16_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p16_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p16_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p16_pio_ereset_n                = 1'b1; 
          assign o_p17_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p17_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p17_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p17_pio_ereset_n                = 1'b1; 
          assign o_p18_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p18_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p18_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p18_pio_ereset_n                = 1'b1; 
          assign o_p19_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p19_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p19_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p19_pio_ereset_n                = 1'b1; 
          assign o_p20_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p20_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p20_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p20_pio_ereset_n                = 1'b1; 
          assign o_p21_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p21_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p21_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p21_pio_ereset_n                = 1'b1; 
          assign o_p22_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p22_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p22_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p22_pio_ereset_n                = 1'b1; 
          assign o_p23_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p23_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p23_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p23_pio_ereset_n                = 1'b1; 
          assign o_p24_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p24_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p24_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p24_pio_ereset_n                = 1'b1; 
          assign o_p25_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p25_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p25_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p25_pio_ereset_n                = 1'b1; 
          assign o_p26_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p26_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p26_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p26_pio_ereset_n                = 1'b1; 
          assign o_p27_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p27_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p27_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p27_pio_ereset_n                = 1'b1; 
          assign o_p28_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p28_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p28_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p28_pio_ereset_n                = 1'b1; 
          assign o_p29_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p29_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p29_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p29_pio_ereset_n                = 1'b1; 
          assign o_p30_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p30_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p30_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p30_pio_ereset_n                = 1'b1; 
          assign o_p31_pio_axi_st_bridge_rst_n     = 1'b1; 
          assign o_p31_pio_ehip_tx_rst_n           = 1'b1; 
          assign o_p31_pio_ehip_rx_rst_n           = 1'b1; 
          assign o_p31_pio_ereset_n                = 1'b1; 

        end
        else begin : external_cpu
          assign o_cpu_reconfig_addr = 'd0;
          assign o_cpu_reconfig_read = 'd0;
          assign o_cpu_reconfig_write = 'd0;
          assign o_cpu_reconfig_writedata = 'd0;
        end
    endgenerate
 
    always @(posedge i_reconfig_clk)
    begin
      cpu_reconfig_read_d1 <= o_cpu_reconfig_read;
      cpu_reconfig_write_d1 <= o_cpu_reconfig_write;
    end
    // ECC status logic
endmodule

