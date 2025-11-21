function [] = func_data_log(CC_run, DSPBA_version, description, DSPBA_b2b_tc_name, NumSym, block, cc_cnt, NMSE)

if(CC_run==2)
    switch block
        case 'version'
            tic;
            fileID = fopen('b2b_2cc_log.txt','w');
            fprintf(fileID,'-------------------------------------------------\nDSPBA_b2b_version: %1.1f\n-------------------------------------------------\n',DSPBA_version);  
            fprintf(fileID,'Version description: %s\n\n',description);  
            fprintf(fileID,'Simulation Started for 2CC...\n\n');  
        case 'SIM Vectors'
            fileID = fopen('b2b_2cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\nVector generation done\n-------------------------------------------------\n');
            fprintf(fileID,'Testcase selected: %s\n', DSPBA_b2b_tc_name);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n\n',toc/60);
        case 'Symbol select'
            fileID = fopen('b2b_2cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\nSimulation length selected\n-------------------------------------------------\n');
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'Number of Symbols: %d \n\n',NumSym);
        case 'iFFT'
            fileID = fopen('b2b_2cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s CC%d simulated\n-------------------------------------------------\n',block, cc_cnt);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: %3.4f\n\n',block, NMSE);
        case 'DUC'
            fileID = fopen('b2b_2cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s CC%d simulated\n-------------------------------------------------\n',block, cc_cnt);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: [%3.4f %3.4f %3.4f %3.4f]\n\n',block, NMSE);
        case 'ca_interp'
            fileID = fopen('b2b_2cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s simulated\n-------------------------------------------------\n',block);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: [%3.4f %3.4f %3.4f %3.4f %3.4f %3.4f %3.4f %3.4f]\n\n',block, NMSE);
        case 'dec_dly'
            fileID = fopen('b2b_2cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s simulated\n-------------------------------------------------\n',block);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: [%3.4f %3.4f %3.4f %3.4f]\n\n',block, NMSE);
        case 'DDC'
            fileID = fopen('b2b_2cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s CC%d simulated\n-------------------------------------------------\n',block, cc_cnt);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: %3.4f\n\n',block, NMSE);
        case 'FFT'
            fileID = fopen('b2b_2cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s CC%d simulated\n-------------------------------------------------\n',block, cc_cnt);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: %3.4f\n\n',block, NMSE);
        otherwise
            disp("Incorrect use of log function")
    end
    fclose(fileID);
elseif(CC_run==1)
    switch block
        case 'version'
            tic;
            fileID = fopen('b2b_1cc_log.txt','w');
            fprintf(fileID,'-------------------------------------------------\nDSPBA_b2b_version: %1.1f\n-------------------------------------------------\n',DSPBA_version);  
            fprintf(fileID,'Version description: %s\n\n',description);    
            fprintf(fileID,'Simulation Started for 1 CC...\n\n');  
        case 'SIM Vectors'
            fileID = fopen('b2b_1cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\nVector generation done\n-------------------------------------------------\n');
            fprintf(fileID,'Testcase selected: %s\n', DSPBA_b2b_tc_name);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n\n',toc/60);
        case 'Symbol select'
            fileID = fopen('b2b_1cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\nSimulation length selected\n-------------------------------------------------\n');
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'Number of Symbols: %d \n\n',NumSym);
        case 'iFFT'
            fileID = fopen('b2b_1cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s CC%d simulated\n-------------------------------------------------\n',block, cc_cnt);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: %3.4f\n\n',block, NMSE);
        case 'DUC'
            fileID = fopen('b2b_1cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s CC%d simulated\n-------------------------------------------------\n',block, cc_cnt);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: [%3.4f %3.4f %3.4f %3.4f]\n\n',block, NMSE);
        case 'ca_interp'
            fileID = fopen('b2b_1cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s simulated\n-------------------------------------------------\n',block);
            
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: [%3.4f %3.4f %3.4f %3.4f %3.4f %3.4f %3.4f %3.4f]\n\n',block, NMSE);
        case 'dec_dly'
            fileID = fopen('b2b_1cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s simulated\n-------------------------------------------------\n',block);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: [%3.4f %3.4f %3.4f %3.4f]\n\n',block, NMSE);
        case 'DDC'
            fileID = fopen('b2b_1cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s CC%d simulated\n-------------------------------------------------\n',block, cc_cnt);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: %3.4f\n\n',block, NMSE);
        case 'FFT'
            fileID = fopen('b2b_1cc_log.txt','a');
            fprintf(fileID,'-------------------------------------------------\n%s CC%d simulated\n-------------------------------------------------\n',block, cc_cnt);
            fprintf(fileID,'Time Elapsed: %4.1f mins\n',toc/60);
            fprintf(fileID,'%s NMSE: %3.4f\n\n',block, NMSE);
        otherwise
            disp("Incorrect use of log function")
    end
    fclose(fileID);
else
    disp("Wrong CC number");
end

end