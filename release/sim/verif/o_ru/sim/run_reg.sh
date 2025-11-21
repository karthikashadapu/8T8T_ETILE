# Script to count the total number of testcases , pass count and fail count


total_cnt=`ls o_ru_tc*_sim.log | wc -l`
echo "TOTAL NO OF TESTCASES:$total_cnt" 

pass_cnt=`grep "UVM_ERROR :    0" -r o_ru_tc*.log | wc -l`
echo "NO OF TESTCASES PASSED:$pass_cnt"

fail_cnt=`grep "UVM_ERROR :    *[1-99]" -r o_ru_tc*.log | wc -l`
echo "NO OF TESTCASES FAILED:$fail_cnt"
