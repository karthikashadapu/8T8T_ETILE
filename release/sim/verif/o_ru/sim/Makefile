
#############################################################################
# Common Variables
#############################################################################
NCSIM ?= 0
QUESTASIM ?= 0
#----------
# Paths
#----------
export REMOTE_BASE_DIR ?=

ifeq ($(REMOTE_BASE_DIR),)
  export BASE_DIR := ./
else
  export BASE_DIR := $(REMOTE_BASE_DIR)
endif

##ADD PATH to PROJECT DIR EXAMPLE: $(abspath $(BASE_DIR)/../../../)
export ROOT_DIR               := $(abspath $(BASE_DIR)/../../../../fpga)
export COMPILE_DIR            := ./
export SIM_HOME               := ./
export QSYS_SIMDIR            := $(ROOT_DIR)

QUARTUS_INSTALL_DIR=$(QUARTUS_ROOTDIR)
## Includes RTL directory and files
##include $(RTL_HOME)/Makefile

## ADD PATH TO SIMULATION DIR   EXAMPLE: $(ROOT_DIR)/jesd204c/verif/simulation
TB_HOME                := ./
UVM_LIB_HOME           := $(ROOT_DIR)/uvm_lib
AVSTS_VIP= ../../../vip/avsts
AVMM_VIP=../../../vip/avmm

AVSTS_UVC_HOME          := $(AVSTS_VIP)/avsts_uvc
AVMM_UVC_HOME         := $(AVMM_VIP)/avmm_uvc
CLK_UVC_HOME           := ../../libraries/o_ru_clk_uvc


#----------
# Directories
#----------
UNISIM_LIB_DIR := ./UNISIM_lib

O_RU_IF := \
$(AVSTS_UVC_HOME)/interface/avsts_if.sv \
$(AVMM_UVC_HOME)/interface/avmm_if.sv \
$(CLK_UVC_HOME)/interface/o_ru_clk_if.sv

#RAL_PCK           := ../o_ru_tb_files/Top_Subsystem_mmap_urm.svh
O_RU_CONFIG         := ../o_ru_tb_files/o_ru_config_pkg.sv
TB_STRUCT_PCK     := ../o_ru_tb_files/o_ru_tbstruct.sv
AVSTS_PCK         := $(AVSTS_UVC_HOME)/packages/avsts_pkg.sv
AVMM_PCK        := $(AVMM_UVC_HOME)/packages/avmm_pkg.sv
CLK_PCK           := $(CLK_UVC_HOME)/packages/o_ru_clk_pkg.sv

O_RU_O_RU_TOP_ENV_PCK	:= ../o_ru_env/o_ru_top_env_pkg.sv
O_RU_TEST_PCK       := ../o_ru_tests/o_ru_test_pkg.sv
O_RU_SRC_TB_VIF         := ../o_ru_tb_files/o_ru_vif.sv
O_RU_SRC_TB         := ../o_ru_tb_files/top.sv
O_RU_O_RU_SCB_PCK	:= ../o_ru_scb/o_ru_scb_pkg.sv
UVM_HOME := /mnt/media/Tools/Cadence/XCELIUM2209/tools.lnx86/methodology/UVM/CDNS-1.2/sv
UVM_INC_HOME := /mnt/media/Tools/Cadence/XCELIUM2209/tools.lnx86/methodology/UVM/CDNS-1.2/sv

CMODEL_PCAP  := \
	../o_ru_c_model/pcap_parse.c \
	../o_ru_c_model/BPF_comp_decomp.c

IFFT_C_MODEL := \
	../o_ru_c_model/ifft_cmodel

IFFT_PHASE_COMP_C_MODEL := \
	../o_ru_c_model/phase_comp_cmodel

FFT_C_MODEL := \
	../o_ru_c_model/fft_cmodel

FFT_PHASE_COMP_C_MODEL := \
	../o_ru_c_model/phase_comp_fft_cmodel

RTL_FILE_LIST         := ./ip_file_list.f
XCL_RTL_FILE_LIST     := ./ip_file_list_xcl.f
VHD_FILE_LIST         := ./ip_file_list_vhd.f

COMP_FILES :=  \
$(RAL_PCK)    \
$(AVSTS_PCK)    \
$(AVMM_PCK)    \
$(O_RU_CONFIG)   \
$(TB_STRUCT_PCK)   \
$(CLK_PCK)     \
$(O_RU_IF)       \
$(O_RU_O_RU_SCB_PCK)       \
$(O_RU_O_RU_TOP_ENV_PCK)       \
$(O_RU_TEST_PCK) \
$(O_RU_SRC_TB_VIF) \
$(O_RU_SRC_TB)   

DATE= $(shell date +"%m-%d-%Y-%T")
#############################################################################
# Common Options
#############################################################################
WAVE ?= 1
GUI ?= 0
REG_DOC ?=  
COV ?= 0
J ?= 0
SEED ?= 1
EVENTS ?= 1
DISABLE_REF ?= 0
PRINT_TOPOLOGY ?= 0
ENABLE_PERF ?= 0

SYM_NUM = 0
SF_NUM = 0
DFE_LPBK_EN = 0
IFFT_FFT_LPBK_EN = 0
ECPRI_ORAN_SS_EN = 0
UL_INJ = 0
LONG_SHORT_PRACH = 0
CC2_DIS = 0
#############################################################################
# UVM Options
#############################################################################
UVM_VERBOSITY           ?= UVM_LOW
UVM_TESTNAME            ?= o_ru_simple_test
UVM_VERSION             ?= 1.2
UVM_MAX_QUIT_COUNT      ?= 1
FEAT_NAME = $(UVM_TESTNAME)

DEFINES      += +define+SYM_NUM=$(SYM_NUM)
DEFINES      += +define+SF_NUM=$(SF_NUM)
DEFINES      += +define+IFFT_FFT_LPBK_EN=$(IFFT_FFT_LPBK_EN)
DEFINES      += +define+ECPRI_ORAN_SS_EN=$(ECPRI_ORAN_SS_EN)

ifeq ($(IFFT_FFT_LPBK_EN), 1)
  DEFINES      += +define+IFFT_FFT_LOOPBACK
endif

ifeq ($(LONG_SHORT_PRACH), 1)
  DEFINES      += +define+SHORT_PRACH_FORMAT
  DEFINES      += +define+LONG_SHORT_PRACH=0
else
  DEFINES      += +define+LONG_SHORT_PRACH=1
endif

ifeq ($(ECPRI_ORAN_SS_EN), 1)
  DEFINES      += +define+ECPRI_ORAN_SS
endif

ifeq ($(CC2_DIS), 0)
  DEFINES      += +define+NUM_CC_TWO
else
  DEFINES      += +define+NUM_CC_ONE
endif

ifeq ($(DFE_LPBK_EN), 0)
ifeq ($(IFFT_FFT_LPBK_EN), 0)
ifeq ($(ECPRI_ORAN_SS_EN), 0)
  DEFINES      += +define+UL_INJ=1
  DEFINES      += +define+DFE_LPBK_EN=1
else
  DEFINES      += +define+UL_INJ=0
  DEFINES      += +define+DFE_LPBK_EN=$(DFE_LPBK_EN)
endif
else
  DEFINES      += +define+UL_INJ=0
  DEFINES      += +define+DFE_LPBK_EN=$(DFE_LPBK_EN)
endif
else
  DEFINES      += +define+UL_INJ=0
  DEFINES      += +define+DFE_LPBK_EN=$(DFE_LPBK_EN)
endif
#############################################################################
# VCS Options
#############################################################################
ifeq ($(WAVE), 1)
  DEBUG_ARGS := -debug_access+r
endif

ifeq ($(GUI), 1)
  DEBUG_ARGS := -debug_access+all
endif

UVM_ARGS := -ntb_opts uvm-$(UVM_VERSION)

ifeq ($(WAVE), 1)
VCS_FLAGS = +warn=all -cm_dir $(SIM_HOME)/coverage_db/coverage  -cm line+cond+tgl+fsm+assert -cm_hier $(SIM_HOME)/phipps_peak.cmhier -cm_fsmcfg $(SIM_HOME)/gmii.fsmcfg -assert enable_hier +lint=all,noVCDE,noNS -check -ntb_opts check -ntb_opts uvm-1.2 \
-full64 -sverilog -licqueue -lca -Mdir=csrc -debug_access+all +vcs+vcdpluson \
-timescale=1ps/1ps
endif
ifeq ($(WAVE), 0)
VCS_FLAGS = +warn=all -cm_dir $(SIM_HOME)/coverage_db/coverage  -cm line+cond+tgl+fsm+assert -cm_hier $(SIM_HOME)/phipps_peak.cmhier -cm_fsmcfg $(SIM_HOME)/gmii.fsmcfg -assert enable_hier +lint=all,noVCDE,noNS -check -ntb_opts check -ntb_opts uvm-1.2 \
-full64 -sverilog -licqueue -lca -Mdir=csrc \
-timescale=1ps/1ps
endif

INC_DEBUG_ARGS    := -access +rwc +lint=TFIPC-L -TIMESCALE 1ps/1fs

VLOGAN_ARGS := \
  $(DEBUG_ARGS)                                              \
  +lint=TFIPC-L                                              \
  +lint=PCWM                                                 \
  -sverilog                                                  \
  -timescale=1ps/1ps                                         \
  -assert enable_hier                                        \
  -cm  line+cond+fsm+tgl+assert                              \
  -cm_dir  $(SIM_HOME)/coverage_db/coverage                  \
  -cm_hier  $(SIM_HOME)/gmii.cmhier                         \
  -cm_fsmcfg $(SIM_HOME)/gmii.fsmcfg                        \
  +incdir+../o_ru_tb_files                                       \
  +incdir+../o_ru_tests                                        \
  +incdir+$(AVSTS_UVC_HOME)/interface                        \
  +incdir+$(AVMM_UVC_HOME)/interface                        \
  +incdir+$(CLK_UVC_HOME)/interface                          \
  +incdir+$(AVSTS_UVC_HOME)/packages                         \
  +incdir+$(AVMM_UVC_HOME)/packages                         \
  +incdir+$(CLK_UVC_HOME)/packages                           
  

VLOG_ARGS := -sv                                              \
  +incdir+../o_ru_tb_files                                       \
  +incdir+../o_ru_tests                                        \
  +incdir+$(AVSTS_UVC_HOME)/interface                        \
  +incdir+$(AVMM_UVC_HOME)/interface                        \
  +incdir+$(CLK_UVC_HOME)/interface                          \
  +incdir+$(AVSTS_UVC_HOME)/packages                         \
  +incdir+$(AVMM_UVC_HOME)/packages                         \
  +incdir+$(CLK_UVC_HOME)/packages                           

VSIM_ARGS :=  \
  -L work \
  -t 1fs \
  -G SEED=$(SEED) \
  -sv_seed $(SEED) \
  +UVM_TESTNAME=$(UVM_TESTNAME) \
  -wlf phipps_peak.wlf \
  -voptargs="+acc=npr" \
  -do "do run.do $(WAVE) $(QUARTUS_INSTALL_DIR) $(COV)"

NCVERILOG_ARGS :=-sv								\
	-LINEDEBUG \
  +incdir+$(UVM_HOME)/src                                          \
  +incdir+../o_ru_tb_files                                       \
  +incdir+../o_ru_tests                                        \
  +incdir+$(AVSTS_UVC_HOME)/interface                        \
  +incdir+$(AVMM_UVC_HOME)/interface                        \
  +incdir+$(CLK_UVC_HOME)/interface                          \
  +incdir+$(AVSTS_UVC_HOME)/packages                         \
  +incdir+$(AVMM_UVC_HOME)/packages                         \
  +incdir+$(CLK_UVC_HOME)/packages                           
 

SIMV_ARGS := -licqueue +vcs+flush+all -assert verbose -assert finish_maxfail=1 +ntb_random_seed=$(SEED) \
              +UVM_MAX_QUIT_COUNT=$(UVM_MAX_QUIT_COUNT),YES +UVM_NO_RELNOTES +UVM_TESTNAME=$(UVM_TESTNAME) +UVM_VERBOSITY=$(UVM_VERBOSITY) \
              +uvm_set_cxil_defaultlibonfig_int=uvm_test_top,events,$(EVENTS) \
              +uvm_set_config_int=uvm_test_top,disable_ref,$(DISABLE_REF) \
              +uvm_set_config_int=uvm_test_top,print_topology,$(PRINT_TOPOLOGY) \
              -vpd_file o_ru_$(FEAT_NAME)_$(SEED).vpd

INC_ARGS :=   +UVM_MAX_QUIT_COUNT=$(UVM_MAX_QUIT_COUNT),YES +UVM_NO_RELNOTES +UVM_VERBOSITY=$(UVM_VERBOSITY) \
				 +UVM_OBJECTION_TRACE=$(UVM_OBJECTION_TRACE)  \
				 +UVM_PHASE_TRACE=$(UVM_PHASE_TRACE)  \
              +uvm_set_config_int=uvm_test_top,events,$(EVENTS) \
              +uvm_set_config_int=uvm_test_top,disable_ref,$(DISABLE_REF) \
              +uvm_set_config_int=uvm_test_top,print_topology,$(PRINT_TOPOLOGY) \

QUES_ARGS :=   +UVM_MAX_QUIT_COUNT=$(UVM_MAX_QUIT_COUNT),YES +UVM_NO_RELNOTES +UVM_VERBOSITY=$(UVM_VERBOSITY) \
				 +UVM_OBJECTION_TRACE=$(UVM_OBJECTION_TRACE)  \
				 +UVM_PHASE_TRACE=$(UVM_PHASE_TRACE)  \
              +uvm_set_config_int=uvm_test_top,events,$(EVENTS) \
              +uvm_set_config_int=uvm_test_top,disable_ref,$(DISABLE_REF) \
              +uvm_set_config_int=uvm_test_top,print_topology,$(PRINT_TOPOLOGY) \

ifneq ($(J), 0)
  SIMV_ARGS := $(SIMV_ARGS) -j$(J)
endif

ifeq ($(COV), 1)
  SIMV_ARGS := $(SIMV_ARGS) -cm_name $(UVM_TESTNAME)_$(SEED) -cm line+cond+fsm+tgl+assert -cm_dir $(SIM_HOME)/coverage_db/coverage 
  VLOG_ARGS := $(VLOG_ARGS) +cover +fcover +uvm_set_config_int=uvm_test_top,enable_cov,1 
  VSIM_ARGS := $(VSIM_ARGS) -coverage -cvgperinstance -ucdbfile $(UVM_TESTNAME).ucdb 
endif

ifeq ($(COV), 1)
  SIMV_ARGS := $(SIMV_ARGS) -cm line+cond+tgl+fsm+branch+assert +uvm_set_config_int=uvm_test_top,enable_cov,1
  INC_ARGS := $(INC_ARGS) -coverage all +uvm_set_config_int=uvm_test_top,enable_cov,1 
else
  SIMV_ARGS := $(SIMV_ARGS) +uvm_set_config_int=uvm_test_top,enable_cov,0
  INC_ARGS := $(INC_ARGS)  +uvm_set_config_int=uvm_test_top,enable_cov,0
  VLOG_ARGS := $(VLOG_ARGS)  +uvm_set_config_int=uvm_test_top,enable_cov,0
endif

ifeq ($(GUI), 1)
  SIMV_ARGS := $(SIMV_ARGS) -gui 
  INC_SIM_ARGS := $(INC_SIM_ARGS) +gui
else
  VSIM_ARGS := $(VSIM_ARGS) -batch -onfinish exit
  ifeq ($(WAVE), 1)
    SIMV_ARGS := $(SIMV_ARGS)  +vcs+vcdpluson
    VSIM_ARGS := $(VSIM_ARGS) -voptargs=+acc  
  endif
  INC_SIM_ARGS := $(INC_SIM_ARGS) -input nc_sim.tcl  +xm64bit -licqueue
endif
VLOGAN_ARGS += $(DEFINES)
NCVERILOG_ARGS += $(DEFINES)
VLOG_ARGS += $(DEFINES)

ifeq ($(NCSIM), 1)
COMP_FILES :=  \
$(COMP_FILES)
endif

ifeq ($(QUESTASIM), 1)
COMP_FILES :=  \
$(COMP_FILES)

endif

CMODEL_PCAP := \
$(CMODEL_PCAP)

#############################################################################
# TESTS
#############################################################################
REGR_TESTS:= \
o_ru_simple_reg_test \
o_ru_simple_test \
o_ru_reg_test \
o_ru_rnd_test



#############################################################################
# Targets
#############################################################################
.PHONY: all
all: clean comp_tb sim
rerun: comp sim


.PHONY: comp_tb
comp_tb: 
	mkdir -p ./comp_libs
	mkdir -p ./comp_libs/work
	gcc -shared -fPIC -g -o pcap.so $(CMODEL_PCAP) -l pcap
	vsim work.o_ru_top_tb -sv_lib pcap
	vlogan -full64 -sverilog +define+UVM_PACKER_MAX_BYTES=10000 +define+UVM_VERDI_NO_PORT_RECORDING $(UVM_ARGS) -l comp_uvm.log
	vlogan -full64 -licqueue $(UVM_ARGS) $(VLOGAN_ARGS) $(COMP_FILES) -l comp.log
	vcs $(VCS_FLAGS) work.top -o simv -l elab.log
 
.PHONY: comp
comp: 
	mkdir -p ./comp_libs
	mkdir -p ./comp_libs/work
	gcc -shared -fPIC -g -o pcap.so $(CMODEL_PCAP) -l pcap
	vlogan -full64 -cm line+cond_tgl+fsm+assert -sverilog +define+UVM_PACKER_MAX_BYTES=10000 +define+UVM_VERDI_NO_PORT_RECORDING $(UVM_ARGS) -l comp_uvm.log
	vlogan -full64 -licqueue $(VLOGAN_ARGS) $(COMP_FILES) -l comp.log

elab:
       
	vcs $(VCS_FLAGS) work.top -o simv -l elab.log 

.PHONY: sim
sim: 
	bash -c "./simv $(SIMV_ARGS) | tee o_ru_$(FEAT_NAME)_$(SEED).log 2>&1" 

.PHONY: sim_reg
sim_reg: comp_tb
	bash -c "./simv $(SIMV_ARGS) | tee o_ru_$(FEAT_NAME)__$(SEED).log 2>&1"

#############################################################################
# xcelium simulation
#############################################################################
.PHONY: comp_lib_inc
comp_lib_inc:
	cd ../../../../fpga/quartus/sim_pkg_script/; \
		bash -c "./sim_pkg_gen.sh"
	bash -c "./setup_cmodel.sh"
	bash -c "./setup_hexfiles.sh"
	gcc -fPIC -g -shared -o libdpi.so -I/`ncroot`/tools/inca/include $(QUARTUS_INSTALL_DIR)/eda/sim_lib/simsf_dpi.cpp	
	xmvlog -sv -f lib_files.f 
	xmvhdl -v93 -f lib_files_vhd.f 

.PHONY: comp_inc
comp_inc:
	gcc -shared -fPIC -g -o pcap.so $(CMODEL_PCAP) -l pcap
	cp cplane_prach_fdv.mif cplane_pusch_fdv.mif prach_data_in_long.mif prach_data_in_short.mif map_table.mif dl_blanking.mif ../../../  
	c++  -std=c++11 -D_CRT_SECURE_NO_WARNINGS -Dmylibrary_EXPORTS -I$(IFFT_C_MODEL)/. -fPIC -o $(IFFT_C_MODEL)/build/CMakeFiles/fp_ifft.dir/atb/atb_app.cpp.o -c $(IFFT_C_MODEL)/atb/atb_app.cpp
	c++ -fPIC   -shared -Wl,-soname,libfp_ifft.so -o libfp_ifft.so $(IFFT_C_MODEL)/build/CMakeFiles/fp_ifft.dir/support/csl_io.cpp.o $(IFFT_C_MODEL)/build/CMakeFiles/fp_ifft.dir/atb/atb_app.cpp.o $(IFFT_C_MODEL)/build/libcommon_lib.a
	c++  -std=c++11 -D_CRT_SECURE_NO_WARNINGS -Dmylibrary_EXPORTS -I$(IFFT_PHASE_COMP_C_MODEL)/. -fPIC -o $(IFFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp.dir/atb/atb_app.cpp.o -c $(IFFT_PHASE_COMP_C_MODEL)/atb/atb_app.cpp
	c++ -fPIC   -shared -Wl,-soname,libfp_phase_comp.so -o libfp_phase_comp.so $(IFFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp.dir/support/csl_io.cpp.o $(IFFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp.dir/atb/atb_app.cpp.o $(IFFT_PHASE_COMP_C_MODEL)/build/libcommon_lib.a
	c++  -std=c++11 -D_CRT_SECURE_NO_WARNINGS -Dmylibrary_EXPORTS -I$(FFT_C_MODEL)/. -fPIC -o $(FFT_C_MODEL)/build/CMakeFiles/fp_fft.dir/atb/atb_app.cpp.o -c $(FFT_C_MODEL)/atb/atb_app.cpp
	c++ -fPIC   -shared -Wl,-soname,libfp_fft.so -o libfp_fft.so $(FFT_C_MODEL)/build/CMakeFiles/fp_fft.dir/support/csl_io.cpp.o $(FFT_C_MODEL)/build/CMakeFiles/fp_fft.dir/atb/atb_app.cpp.o  $(FFT_C_MODEL)/build/libcommon_lib.a
	c++  -std=c++11 -D_CRT_SECURE_NO_WARNINGS -Dmylibrary_EXPORTS -I$(FFT_PHASE_COMP_C_MODEL)/.  -fPIC   -o $(FFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp_fft.dir/atb/atb_app.cpp.o -c $(FFT_PHASE_COMP_C_MODEL)/atb/atb_app.cpp
	c++ -fPIC   -shared -Wl,-soname,libfp_phase_comp_fft.so -o libfp_phase_comp_fft.so $(FFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp_fft.dir/support/csl_io.cpp.o $(FFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp_fft.dir/atb/atb_app.cpp.o  $(FFT_PHASE_COMP_C_MODEL)/build/libcommon_lib.a
	xmvhdl -v93 -f $(VHD_FILE_LIST) -LOGFILE o_ru_$(FEAT_NAME)_$(SEED)_comp_vhd.log 
	xmvlog -sv -64bit $(NCVERILOG_ARGS) -f $(XCL_RTL_FILE_LIST) -LOGFILE o_ru_$(FEAT_NAME)_$(SEED)_comp_rtl.log
	xmvlog -sv -64bit $(NCVERILOG_ARGS) $(UVM_HOME)/src/uvm.sv $(COMP_FILES) -LOGFILE o_ru_$(FEAT_NAME)_$(SEED)_comp_tb.log

.PHONY: elab_inc
elab_inc:
	xmelab +xm64bit $(INC_ARGS) $(INC_DEBUG_ARGS) -V200X top -LOGFILE o_ru_$(FEAT_NAME)_$(SEED)_elab.log
 
.PHONY: sim_inc
sim_inc:
	xmsim -status $(INC_ARGS) $(INC_SIM_ARGS) top +UVM_TESTNAME=$(UVM_TESTNAME) -LOGFILE o_ru_$(FEAT_NAME)_$(SEED)_$(DFE_LPBK_EN)_$(IFFT_FFT_LPBK_EN)_sim.log -sv_lib $(UVM_HOME)/../additions/sv/lib/64bit/libuvmdpi.so -sv_lib pcap -sv_lib libfp_phase_comp -sv_lib libfp_ifft -sv_lib libfp_fft -sv_lib libfp_phase_comp_fft

.PHONY: run_inc
run_inc: comp_inc elab_inc sim_inc


.PHONY: comp_lib
comp_lib:
	cd ../../../../fpga/quartus/sim_pkg_script/; \
		bash -c "./sim_pkg_gen.sh"
	bash -c "./setup_cmodel.sh"
	bash -c "./setup_hexfiles.sh"
	vlib work
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_primitives.v
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/220model.v                       
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/sgate.v                          
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_mf.v                      
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_lnsim.sv                  
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/tennm_atoms.sv                   
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/mentor/tennm_atoms_ncrypt.sv                
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/fmica_atoms_ncrypt.sv            
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/tennm_hssi_atoms.sv              
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/tennm_hssi_atoms_ncrypt.sv       
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/ctfb_hssi_atoms.sv               
	vlog $(VLOG_ARGS) -suppress 7070,2244,2388,12003 $(QUARTUS_INSTALL_DIR)/eda/sim_lib/ctfb_hssi_atoms_ncrypt.sv        
	vlog $(VLOG_ARGS) -suppress 7070,2244,2388,12003 $(QUARTUS_INSTALL_DIR)/eda/sim_lib/ctfb_hssi_atoms2_ncrypt.sv       
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_syn_attributes.vhd               
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_standard_functions.vhd           
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/alt_dspbuilder_package.vhd              
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_europa_support_lib.vhd           
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_primitives_components.vhd        
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_primitives.vhd                   
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/220pack.vhd                             
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/220model.vhd                            
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/sgate_pack.vhd                          
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/sgate.vhd                               
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_mf_components.vhd                
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_mf.vhd                           
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv      
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/altera_lnsim_components.vhd        
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/tennm_atoms.vhd                             
	vcom $(QUARTUS_INSTALL_DIR)/eda/sim_lib/tennm_components.vhd                        
	vlog $(VLOG_ARGS) $(QUARTUS_INSTALL_DIR)/eda/sim_lib/simsf_dpi.cpp

.PHONY: comp_ques
comp_ques: comp_ques_tb ques_sim 

.PHONY: comp_ques_tb
comp_ques_tb:
	gcc -shared -fPIC -g -o pcap.so $(CMODEL_PCAP) -l pcap
	cp cplane_prach_fdv.mif cplane_pusch_fdv.mif prach_data_in_long.mif prach_data_in_short.mif map_table.mif dl_blanking.mif ../../../  
	c++  -std=c++11 -D_CRT_SECURE_NO_WARNINGS -Dmylibrary_EXPORTS -I$(IFFT_C_MODEL)/. -fPIC -o $(IFFT_C_MODEL)/build/CMakeFiles/fp_ifft.dir/atb/atb_app.cpp.o -c $(IFFT_C_MODEL)/atb/atb_app.cpp
	c++ -fPIC   -shared -Wl,-soname,libfp_ifft.so -o libfp_ifft.so $(IFFT_C_MODEL)/build/CMakeFiles/fp_ifft.dir/support/csl_io.cpp.o $(IFFT_C_MODEL)/build/CMakeFiles/fp_ifft.dir/atb/atb_app.cpp.o $(IFFT_C_MODEL)/build/libcommon_lib.a
	c++  -std=c++11 -D_CRT_SECURE_NO_WARNINGS -Dmylibrary_EXPORTS -I$(IFFT_PHASE_COMP_C_MODEL)/. -fPIC -o $(IFFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp.dir/atb/atb_app.cpp.o -c $(IFFT_PHASE_COMP_C_MODEL)/atb/atb_app.cpp
	c++ -fPIC   -shared -Wl,-soname,libfp_phase_comp.so -o libfp_phase_comp.so $(IFFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp.dir/support/csl_io.cpp.o $(IFFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp.dir/atb/atb_app.cpp.o $(IFFT_PHASE_COMP_C_MODEL)/build/libcommon_lib.a
	c++  -std=c++11 -D_CRT_SECURE_NO_WARNINGS -Dmylibrary_EXPORTS -I$(FFT_C_MODEL)/. -fPIC -o $(FFT_C_MODEL)/build/CMakeFiles/fp_fft.dir/atb/atb_app.cpp.o -c $(FFT_C_MODEL)/atb/atb_app.cpp
	c++ -fPIC   -shared -Wl,-soname,libfp_fft.so -o libfp_fft.so $(FFT_C_MODEL)/build/CMakeFiles/fp_fft.dir/support/csl_io.cpp.o $(FFT_C_MODEL)/build/CMakeFiles/fp_fft.dir/atb/atb_app.cpp.o  $(FFT_C_MODEL)/build/libcommon_lib.a
	c++  -std=c++11 -D_CRT_SECURE_NO_WARNINGS -Dmylibrary_EXPORTS -I$(FFT_PHASE_COMP_C_MODEL)/.  -fPIC   -o $(FFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp_fft.dir/atb/atb_app.cpp.o -c $(FFT_PHASE_COMP_C_MODEL)/atb/atb_app.cpp
	c++ -fPIC   -shared -Wl,-soname,libfp_phase_comp_fft.so -o libfp_phase_comp_fft.so $(FFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp_fft.dir/support/csl_io.cpp.o $(FFT_PHASE_COMP_C_MODEL)/build/CMakeFiles/fp_phase_comp_fft.dir/atb/atb_app.cpp.o  $(FFT_PHASE_COMP_C_MODEL)/build/libcommon_lib.a
	vcom -f $(VHD_FILE_LIST) -logfile o_ru_$(FEAT_NAME)_$(SEED)_comp_vhd.log 
	vlog $(VLOG_ARGS) -f $(RTL_FILE_LIST) -logfile o_ru_$(FEAT_NAME)_$(SEED)_comp_rtl.log  
	vlog $(VLOG_ARGS) $(COMP_FILES) -logfile o_ru_$(FEAT_NAME)_$(SEED)_comp_tb.log  

.PHONY: ques_sim
ques_sim:
	vsim $(VSIM_ARGS) $(QUES_ARGS) work.top -sv_lib pcap -sv_lib libfp_phase_comp -sv_lib libfp_ifft -sv_lib libfp_fft -sv_lib libfp_phase_comp_fft -logfile o_ru_$(FEAT_NAME)_$(SEED)_$(DFE_LPBK_EN)_$(IFFT_FFT_LPBK_EN)_sim.log 
.PHONY: clean
clean:
	rm -rf \
	*_comp_*.log \
	*_elab*.log \
	csrc \
        simv.dai* \
        temp.* \
        .vlogansetup.args \
        ucli.key \
        vc_hdrs.h \
        64 \
        AN.DB \
        tr_db.log \
        inter.vpd \
        DVEfiles \
        .inter.vpd.uvm \
        uvmp_IQSW.hvp \
        UNISIM_lib
.PHONY: clean_all
clean_all: clean
	rm -rf \
	*.log \
	*.history \
	*.vpd \
	comp_libs \
	coverage_db \
	cov_work \
	waves.* \
	.fsm.* \
	urgReport \
	simv*


.PHONY: test
test:
	@echo $(DATE)
	@sleep 2 
	@echo $(DATE)

#############################################################################
# Make Help 
#############################################################################
.PHONY: help
help:
	@echo "--------------MAKE HELP ---------------------"
	@echo "  Following MAKE commands are available:"
	@echo " all         : Run all"
	@echo "               Removes all compiled units, compiles RTL files and TB files "
	@echo " rtl         : Compiles RTL files only "
	@echo " comp        : Compiles the Testbench files only"
	@echo " sim         : Runs the simulation in batch or gui mode "
	@echo " regr_comp   : Regression compiled "
	@echo " regr_run    : Regression run all tests added to REGR_TESTS will be executed "
	@echo " regr_report : Create regression report "
	@echo " regr_clean  : Regression clean, remove all regression runs "
	@echo " dve_cov     : Open DVE for vPlan and coverage debug "
	@echo " clean       : Clean all compiled files except regression"
	@echo " clean_all   : Clean all compiled and regression runs"
	@echo " " 
	@echo "  Following MAKE command parameters are available:"
	@echo "  UVM_TESTNAME="
	@echo "  UVM_VERBOSITY=[UVM_DEBUG|UVM_FULL|UVM_HIGH|UVM_LOW|UVM_MEDIUM|UVM_NONE]"
	@echo "  GUI=[0|1]"
	@echo "--------------MAKE HELP ---------------------"


