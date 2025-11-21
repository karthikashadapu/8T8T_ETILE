clear all;
close all;


%% %%%%%%%%%%%%%% Test Vector 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% FR1, TDD, ConfigIdx255, SCspacing30, ZC53, Preamble47, BW80 %%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prach = nrPRACHConfig('FrequencyRange','FR1','DuplexMode','TDD','ConfigurationIndex',132,'SubcarrierSpacing',30,'SequenceIndex',53, ...
    'PreambleIndex', 53,'RBOffset',11,'ZeroCorrelationZone', 1, 'ActivePRACHSlot', 1 ,'FrequencyIndex', 0, 'TimeIndex',0,'NPRACHSlot',0);
waveconfig.PRACH.Config = prach;
waveconfig.NumSubframes = 160;

waveconfig.Carriers = nrCarrierConfig;
% waveconfig.Carriers
%               NCellID: 1
%     SubcarrierSpacing: 30
%          CyclicPrefix: 'normal'
%             NSizeGrid: 52
%            NStartGrid: 0
%                 NSlot: 0            
%                NFrame: 0
% 
%    Read-only properties:
%        SymbolsPerSlot: 14
%      SlotsPerSubframe: 2
%         SlotsPerFrame: 20


BW = 20; %MHz 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
waveconfig.Carriers.NSizeGrid = 51; % need to change according to BW (3GPP TS 138104 Table 5.3.2-1)

waveconfig.Carriers.SubcarrierSpacing = prach.SubcarrierSpacing;
[waveform,gridset] = hNRPRACHWaveformGenerator(waveconfig);

switch BW
    case 10
        SamplePerSubF = 15360;
    case 20
        SamplePerSubF = 30720;
    case 30
        SamplePerSubF = 30720;
    case 40
        SamplePerSubF = 61440;
    case 50
        SamplePerSubF = 61440;  
    case 60
        SamplePerSubF = 122880;
    case 70
        SamplePerSubF = 122880;
    case 80
        SamplePerSubF = 122880;
    case 90
        SamplePerSubF = 122880;
    case 100
        SamplePerSubF = 122880;
end

% Subframe to Send for PRACH testing:
SFN = 1; %waveconfig.NumSubframes 0 .. 15; Needs to be changed accoriding to selected Config Index Table 6.3.3.2-3, TS 138 211 
SubF = 9; % 0 .. 9; Needs to be changed accoriding to selected Config Index Table 6.3.3.2-3, TS 138 211 
waveform = waveform(10*SFN*SamplePerSubF + SubF*SamplePerSubF+1 : 10*SFN*SamplePerSubF + (SubF+1)*SamplePerSubF);
cd TestVectors
fileID = fopen('testVector5.txt','w');
fprintf(fileID, '%% Text Vector Description: FR1, TDD \n');
fprintf(fileID,'%12s','% Configuration Index:');
fprintf(fileID,'%10.0f \n',prach.ConfigurationIndex); 
fprintf(fileID,'%12s','% Subcarrier Spacing, KHz:');
fprintf(fileID,'%10.0f \n',prach.SubcarrierSpacing); 
fprintf(fileID,'%12s','% Preamble Index:');
fprintf(fileID,'%10.0f \n',prach.PreambleIndex); 
fprintf(fileID,'%12s','% Frequency Offset:');
fprintf(fileID,'%10.0f \n',prach.RBOffset); 
fprintf(fileID,'%12s','% BW and nPRB:');
fprintf(fileID,'%10.0f %10.0f \n \n',BW, waveconfig.Carriers.NSizeGrid); 
fprintf(fileID,'%12s %12s\n','% real(waveform)','imag(waveform)');
fprintf(fileID,'%12.10f %12.10f\n',real(waveform), imag(waveform));
fclose(fileID);