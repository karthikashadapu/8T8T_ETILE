
#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "No argument provided. Please specify 'stp_enabled' or 'stp_disabled'."
    exit 1
fi

# Pass the argument to the Quartus TCL script
quartus_sh -t stp.tcl $1
quartus_sh --clean ../ag_esom_top.qpf
$QSYS_ROOTDIR/qsys-script --script=sysid.tcl --system-file=../../src/qsys/sys_manager.qsys --quartus-project=../ag_esom_top.qpf
$QSYS_ROOTDIR/qsys-script --script=../tcl/update_sysid.tcl --system-file=../../src/qsys/sys_manager.qsys --quartus-project=../ag_esom_top.qpf
$QSYS_ROOTDIR/qsys-generate ../../src/qsys/qsys_top.qsys --synthesis="VERILOG"  --quartus-project="../ag_esom_top.qpf" --rev=ag_esom_top 
quartus_sh --flow compile ../ag_esom_top.qpf



