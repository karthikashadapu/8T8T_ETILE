
namespace eval dxc_ss_top_duc_model_DUT_0 {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries duc_model_DUT_10           1
    dict set libraries dxc_ss_top_duc_model_DUT_0 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_rm.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm2.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm3.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm4.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm5.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm6.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm7.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm8.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm9.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm10.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm11.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm12.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm13.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm14.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm15.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm16.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm17.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm18.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm19.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm20.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm21.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm22.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm23.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm24.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm25.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm26.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm27.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm28.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm29.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm30.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm31.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm32.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm33.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm34.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm35.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm36.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm37.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm38.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm39.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm40.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm41.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm42.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm43.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm44.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm45.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm46.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm47.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm48.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm49.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm50.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm51.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm52.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm53.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm54.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm55.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm56.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm57.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm58.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm59.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm60.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm61.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm62.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm63.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im_u0_m0_wo0_cm64.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_rm.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm0.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm1.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm2.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm3.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm4.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm5.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm6.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm7.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm8.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm9.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm10.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm11.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm12.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm13.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm14.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm15.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm16.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm17.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm18.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm19.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm20.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm21.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm22.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm23.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm24.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm25.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm26.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm27.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm28.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm29.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm30.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm31.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm32.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm33.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm34.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm35.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm36.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm37.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm38.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm39.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm40.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm41.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm42.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm43.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm44.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm45.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm46.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm47.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm48.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm49.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm50.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm51.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm52.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm53.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm54.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm55.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm56.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm57.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm58.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm59.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm60.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm61.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm62.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm63.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re_u0_m0_wo0_cm64.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig_Lut_lutmem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_readbackMem.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_u0_sinTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_u0_cosTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_u1_sinTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_u1_cosTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_u2_sinTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_u2_cosTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_u3_sinTable.hex"]"
    lappend memory_files "[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO_u3_cosTable.hex"]"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/dspba_library_ver.sv"]\"  -work duc_model_DUT_10"                                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_safe_path_flat_ver.sv"]\"  -work duc_model_DUT_10"                                           
    lappend design_files "vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_safe_path_flat.vhd"]\"  -work duc_model_DUT_10"                                                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT.sv"]\"  -work duc_model_DUT_10"                                                              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/busFabric_duc_model_DUT_2ouiflr06j68696x6u0qu5xajz.sv"]\"  -work duc_model_DUT_10"                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC.sv"]\"  -work duc_model_DUT_10"                                                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1.sv"]\"  -work duc_model_DUT_10"                             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter.sv"]\"  -work duc_model_DUT_10"                 
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_Scale.sv"]\"  -work duc_model_DUT_10"           
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_Scale1.sv"]\"  -work duc_model_DUT_10"          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Im.sv"]\"  -work duc_model_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Chan_Filter_SingleRateFIR_Re.sv"]\"  -work duc_model_DUT_10"
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_Chan_Filter_lineup1_Filter_Reconfig.sv"]\"  -work duc_model_DUT_10"             
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1.sv"]\"  -work duc_model_DUT_10"                                  
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer.sv"]\"  -work duc_model_DUT_10"                     
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_ComplexMixer_Scale1.sv"]\"  -work duc_model_DUT_10"              
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_COMPLEX_MIXER1_Complex_NCO.sv"]\"  -work duc_model_DUT_10"                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1.sv"]\"  -work duc_model_DUT_10"                                          
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1.sv"]\"  -work duc_model_DUT_10"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_HB1_im.sv"]\"  -work duc_model_DUT_10"                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_HB1_re.sv"]\"  -work duc_model_DUT_10"                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_scale_HB1_im.sv"]\"  -work duc_model_DUT_10"                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB1_scale_HB1_re.sv"]\"  -work duc_model_DUT_10"                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2.sv"]\"  -work duc_model_DUT_10"                                      
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_HB2_im.sv"]\"  -work duc_model_DUT_10"                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_HB2_re.sv"]\"  -work duc_model_DUT_10"                               
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_scale_HB2_im.sv"]\"  -work duc_model_DUT_10"                         
    lappend design_files "vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../duc_model_DUT_10/sim/duc_model_DUT_ChanFilt_DUC_DUC_l1_HB2_scale_HB2_re.sv"]\"  -work duc_model_DUT_10"                         
    lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/dxc_ss_top_duc_model_DUT_0.v"]\"  -work dxc_ss_top_duc_model_DUT_0"                                                                    
    return $design_files
  }
  
  proc get_non_duplicate_elab_option {ELAB_OPTIONS NEW_ELAB_OPTION} {
    set IS_DUPLICATE [string first $NEW_ELAB_OPTION $ELAB_OPTIONS]
    if {$IS_DUPLICATE == -1} {
      return $NEW_ELAB_OPTION
    } else {
      return ""
    }
  }
  
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    append ELAB_OPTIONS { -t fs}
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
  proc get_dpi_libraries {QSYS_SIMDIR} {
    set libraries [dict create]
    
    return $libraries
  }
  
}
