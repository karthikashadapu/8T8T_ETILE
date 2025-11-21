% load('tmwave_60MHz_BFP9.mat');

NRInput=[];
column = 1;
row = 1;

len = min(nnz(tmwave),Test_Bench_Run_Time);


for i = 1:len
    temp1 = tmwave(row,column);
    NRInput = [NRInput temp1];
    column = column+2;
    if(column==9)
        column = 1;
        row = row+1;
    end
end

NRInput=NRInput.';
% save('inputNR.mat','NRInput');