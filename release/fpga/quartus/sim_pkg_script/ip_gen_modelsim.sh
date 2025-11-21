#quartus_sh --clean -c ghrd_agfb027r24c2e3vr2 ghrd_agfb027r24c2e3vr2
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/ecpri_oran_top/ecpri_oran_top_avst_axist_bridge_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/ecpri_oran_top/ecpri_oran_top_timing_adapter_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/qsys_top_sc_fifo_0.ip --simulation verilog --simulator modelsim

quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/oc_ram_16i_16o_4kd_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/oc_ram_16i_16o_1kd_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/oc_ram_32i_32o_64d_dc.ip --simulation verilog --simulator modelsim

quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/dxc_ss_top/dxc_ss_top_ca_interp_DUT_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/dxc_ss_top/dxc_ss_top_ddc_model_DUT_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/dxc_ss_top/dxc_ss_top_dec_dly_comp_DUT_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/dxc_ss_top/dxc_ss_top_duc_model_DUT_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/lphy_ss_top/lphy_ss_top_LongPRACH_prach_wrap_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/lphy_ss_top/lphy_ss_top_ifft_blocktostream_DUT_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/lphy_ss_top/lphy_ss_top_prach_shortFormat_fftShift_prach_0.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/qsys/ip/lphy_ss_top/lphy_ss_top_streamtoblock_fft_DUT_0.ip --simulation verilog --simulator modelsim

quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ecpri_hwtcl_top.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/fh_compress_hwtcl_top.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/oran_hwtcl_top.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ram_48i_48o_36d_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ram_128i_32o_3276d_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ram_32i_32o_122kd_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ram_32i_32o_122kd_dc_long.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ff_64i_64o_4096kd.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ff_32i_128o_8d_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ff_8i_8o_64d_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ff_128i_128o_2048d_sc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ff_32i_128o_64d_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ram_128i_128o_128d_sc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ram_128i_128o_2d_sc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/rom_8i_56o_256d_sc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/storeandforward_fifo_prach.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/storeandforward_fifo_pusch.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/timingadapter.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/timingadapter.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ff_64i_64o_512d_dc.ip --simulation verilog --simulator modelsim
quartus_ipgenerate ../ag_esom_top -c ag_esom_top --generate_ip_file --ip_file=../src/ip/intel/ram_32i_32o_1024d_sc.ip --simulation verilog --simulator modelsim

