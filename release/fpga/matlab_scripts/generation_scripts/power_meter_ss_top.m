function [stat_data, hist_data] = power_meter_ss_top(pwr_mtr_out, numAxC, longterm_int_symb,thresholds,cont,numBins,plot_hist)
    % Power meter Function to process data, compute statistics, and generate histograms
    % 
    % Inputs:
    %   pwr_mtr_out             - Output data for power meter in IFFT domain
    %   settings                - numAxC
    %   longterm_int_symb       - Length of long-term interval for symbols
    %   thresholds              - thresholds
    %   cont`                   - cont/single
    %   numBins                 - 32;% number of Bins in each Histogram
    %   plot_hist               - enable histogram plot
    %
    % Outputs:
    %   stat_data               - Final statistics data, including addresses and values
    %   hist_data               - Histogram data including addresses and values
    
    % Initialization
    numSymbols = 14;
   % numBins = 32;% number of Bins in each Histogram
    fft_size = 4096;
    pwr_mtr_in = [];
    
    % Initialize address and histogram data
    hist_ram_addr = [];
    histograms_1d = [];
    
    % Initialize matrices for data storage
    ymssmin = zeros(numSymbols, numAxC);
    ymssmax = zeros(numSymbols, numAxC);
    ymsstotal = zeros(numSymbols, numAxC);
    totalsmpl = zeros(numSymbols, numAxC);
    peakpwr = zeros(numSymbols, numAxC);
    
    % Initialize the 1D array for stats
    stat_ram_addr = [];
    stat_1d = [];
   
    % Collect the IFFT data
    for i = 0:numAxC-1
        pwr_mtr_in(:, i+1) = pwr_mtr_out(1:(fft_size*(longterm_int_symb)), i+1).';
    end
    [ymss, maxps] = pwr_meter(pwr_mtr_in, longterm_int_symb, numAxC);
    
    % Calculate total_samples for each column and symbol
    calc_samples = 4096 * (longterm_int_symb / numSymbols);
    step = (longterm_int_symb / numSymbols);
    
    % Loop to assign values from ymss1 to data
    for i = 1:numSymbols
        tp_str = numSymbols;
        tp_stp = (numSymbols*(step-1));
        ymssmin(i, :) = min(ymss(i:tp_str:i+tp_stp, :)) * 2^13;  % Indexing every 14th row starting from i
        ymssmax(i, :) = max(ymss(i:tp_str:i+tp_stp, :)) * 2^13;  % Indexing every 14th row starting from i
        ymsstotal(i, :) = sum(ymss(i:tp_str:i+tp_stp, :)) * 2^13;  % Indexing every 14th row starting from i
        totalsmpl(i, :) = calc_samples;
        peakpwr(i, :) = max(maxps(i:tp_str:i+tp_stp, :)) * 2^13;  % Indexing every 14th row starting from i
    end
    
    % Generate histograms
    histograms = plot_histograms(ymss, thresholds, cont, longterm_int_symb, numBins, numAxC, numSymbols, plot_hist);
    
    % Collect histogram addresses and values
    for axc = 1:numAxC
        for sym = 1:numSymbols
            for bin = 1:numBins
                ram_addr = (((sym-1) + ((axc-1) * 14)) * 32) + (bin-1);
                hist_ram_addr = [hist_ram_addr; ram_addr];
                histograms_1d = [histograms_1d; histograms(sym, bin, axc)];
            end
        end
    end
    hist_data = [hist_ram_addr, histograms_1d];
    
    % Loop over the columns and rows to compute statistics
    for col = 1:numAxC
        for row = 1:numSymbols
            for val = 1:8
                stat_addr = (((row-1) + ((col-1) * 14)) * 8) + (val-1);
                stat_ram_addr = [stat_ram_addr; stat_addr];
            end

            % Cast ymsstotal and totalsmpl to uint32 for bitwise operations
            ymsstotal_int = uint32(ymsstotal(row, col));
            totalsmpl_int = uint32(totalsmpl(row, col));
            mask = uint32(0xFFFF);  % 16-bit mask for LSB

            % Split ymsstotal(row, col) into LSB and MSB (16 bits)
            ymsstotal_lsb = uint16(bitand(ymsstotal_int, mask));  % LSB (lower 16 bits)
            ymsstotal_msb = uint16(bitshift(ymsstotal_int, -16));   % MSB (upper 16 bits)

            % Split totalsmpl(row, col) into LSB and MSB (16 bits)
            totalsmpl_lsb = uint16(bitand(totalsmpl_int, mask));  % LSB (lower 16 bits)
            totalsmpl_msb = uint16(bitshift(totalsmpl_int, -16));   % MSB (upper 16 bits)

            % Cast other variables to uint16
            ymssmin_int = uint16(ymssmin(row, col));
            ymssmax_int = uint16(ymssmax(row, col));
            peakpwr_int = uint16(peakpwr(row, col));

            % Append the statistics values for each combination of row and column
            stat_1d      = [stat_1d; 
                            ymssmin_int; 
                            ymssmax_int; 
                            ymsstotal_lsb; ymsstotal_msb;  % MSB and LSB of ymsstotal
                            totalsmpl_lsb; totalsmpl_msb;  % MSB and LSB of totalsmpl
                            peakpwr_int; 
                            0];
        end
    end

    % Combine statistics and addresses into a final output
    stat_data = [stat_ram_addr, stat_1d];

end
