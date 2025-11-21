function [histograms] = plot_histograms(yms_out,thresholds,cont,numOFDMsymbols,numBins,numAxC,numSymbols,plot_hist)
% Define constants
% numSymbols = 28;
%% Build histograms for each OFDM symbol
if (cont)
     while true
         histograms = zeros(numSymbols, numBins, numAxC);  % Histograms for 28 symbols
         for axc = 1:numAxC
            for symbol = 1:numOFDMsymbols
                % Map the symbol index to 1 to 14
                mappedSymbol = mod(symbol - 1, numSymbols) + 1;

                % Perform histogram update based on the mapped symbol index
                if yms_out(symbol, axc) <= thresholds(1)
                    histograms(mappedSymbol, 1, axc) = histograms(mappedSymbol, 1, axc) + 1;
                elseif yms_out(symbol, axc) >= thresholds(numBins)
                    histograms(mappedSymbol, numBins, axc) = histograms(mappedSymbol, numBins, axc) + 1;
                else
                    for bin_idx = 2:numBins
                        if yms_out(symbol, axc) > thresholds(bin_idx-1) && yms_out(symbol, axc) <= thresholds(bin_idx)
                            histograms(mappedSymbol, bin_idx, axc) = histograms(mappedSymbol, bin_idx, axc) + 1;
                            break;  % Exit loop once the correct bin is found
                        end
                    end
                end
            end
         end
        close all;
        % %% Plot histograms
        % Plot for each axis channel
        % Create a figure for each axis channel
        for axc = 1:numAxC
            figure; % Create a new figure for each axis channel

            % Define X and Y
            [X, Y] = meshgrid(1:numSymbols, 1:numBins); % X is symbol index, Y is bin index

            % Extract histogram data for this axis channel
            Z = squeeze(histograms(:, 1:numBins, axc)).';  % Extract the relevant data slice

            % Create the surface plot
            surf(X, Y, Z);

            % Add labels and title
            xlabel('OFDM Symbol XLABLE');
            ylabel('Bin Index YLABLE');
            zlabel('Histograms ZLABLE');
            title(sprintf('3D Plot of Frequency vs. Bin Index for OFDM Symbols (AxC %d)', (axc)));
            % Add color coding
            colormap(jet); % Choose a color map, e.g., 'jet', 'hot', 'cool', etc.
            colorbar;      % Add a color bar to indicate the mapping of colors to values

            % Optional: adjust view angle for better visualization
            view(3); % Standard 3D view

            % Optional: enhance the plot appearance
            shading interp; % Smooth shading
            grid on;         % Add grid lines
        end
        % After 'LT' iterations, repeat the process (the while loop keeps it running)
        disp(['Completed ', num2str(numOFDMsymbols), ' compile time. Restarting??...']);
        % Condition to break out of the loop
        user_input = input('Do you want to exit the loop? (y/n): ', 's');
        if strcmp(user_input, 'y')
            disp('Exiting the loop.');
            break;  % Breaks out of the loop
        end
     end
else
    histograms = zeros(numSymbols, numBins, numAxC);  % Histograms for 28 symbols
    for axc = 1:numAxC
        for symbol = 1:numOFDMsymbols
            % Map the symbol index to 1 to 14
            mappedSymbol = mod(symbol - 1, numSymbols) + 1;
            % Perform histogram update based on the mapped symbol index
            if yms_out(symbol, axc) <= thresholds(1)
                histograms(mappedSymbol, 1, axc) = histograms(mappedSymbol, 1, axc) + 1;
            elseif yms_out(symbol, axc) >= thresholds(numBins)
                histograms(mappedSymbol, numBins, axc) = histograms(mappedSymbol, numBins, axc) + 1;
            else
                for bin_idx = 2:numBins
                    if yms_out(symbol, axc) > thresholds(bin_idx-1) && yms_out(symbol, axc) <= thresholds(bin_idx)
                        histograms(mappedSymbol, bin_idx, axc) = histograms(mappedSymbol, bin_idx, axc) + 1;
                        break;  % Exit loop once the correct bin is found
                    end
                end
            end
        end
    end
end
% %% Plot histograms
% Plot for each axis channel
% Create a figure for each axis channel
if(plot_hist)
    close all;
    for axc = 1:numAxC
        figure; % Create a new figure for each axis channel

        % Define X and Y
        [X, Y] = meshgrid(1:numSymbols, 1:numBins); % X is symbol index, Y is bin index

        % Extract histogram data for this axis channel
        Z = squeeze(histograms(:, 1:numBins, axc)).';  % Extract the relevant data slice

        % Create the surface plot
        surf(X, Y, Z);

        % Add labels and title
        xlabel('OFDM Symbol XLABLE');
        ylabel('Bin Index YLABLE');
        zlabel('Histograms ZLABLE');
        title(sprintf('3D Plot of Frequency vs. Bin Index for OFDM Symbols (AxC %d)', (axc)));
        % Add color coding
        colormap(jet); % Choose a color map, e.g., 'jet', 'hot', 'cool', etc.
        colorbar;      % Add a color bar to indicate the mapping of colors to values

        % Optional: adjust view angle for better visualization
        view(3); % Standard 3D view

        % Optional: enhance the plot appearance
        shading interp; % Smooth shading
        grid on;         % Add grid lines
    end
end
% After 'LT' iterations, repeat the process (the while loop keeps it running)
disp(['Completed ', num2str(numOFDMsymbols), ' compile time.']);
