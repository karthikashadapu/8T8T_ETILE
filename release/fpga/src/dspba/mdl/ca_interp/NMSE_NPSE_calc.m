function [NMSE,NPSE] = NMSE_NPSE_calc(x,y)
x=double(x);
y=double(y);
L=min(length(x),length(y));
% T1 = x(1:L);
% T2 = y(1:L);

% Calculate the number of rows to keep from y
num_rows_to_keep = L;% size(x, 1);
% Truncate y to match the size of x
x_truncated = x(1:num_rows_to_keep, :);
% Now y_truncated will have the same size as x, with the remaining data removed

% t= mean((abs(x(1:L)-y(1:L))).^2)./mean(abs(x(1:L).^2));

t= mean((abs(x_truncated-y)).^2)./mean(abs(x_truncated.^2));
if (t == 0)
    t = 10^-15;
end
NMSE= 10*log10(t);

if (NMSE> -20)
disp('NMSE Watchdog err')
end
% t= max((abs(x(1:L)-y(1:L))).^2)./mean(abs(x(1:L).^2));
t= max((abs(x_truncated-y)).^2)./mean(abs(x_truncated.^2));

if (t == 0)
    t = 10^-15;
end
NPSE= 10*log10(t);



if (NPSE > -20)
disp('NPSE Watchdog err')
end

end