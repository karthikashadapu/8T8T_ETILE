./ip_gen_modelsim.sh
cd ../../src/qsys/
$QSYS_ROOTDIR/qsys-generate phipps_peak.qsys --simulation="VERILOG"  --quartus-project="../../quartus/ag_esom_top.qpf" --rev=ag_esom_top --clear-output-directory
cd ../..
