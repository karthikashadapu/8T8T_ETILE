function [NMSE,NPSE] = NMSE_NPSE_calc(x,y)
x=double(x);
y=double(y);
L=min(length(x),length(y));

num_row_to_keep = L;
x_truncated = x(1:num_row_to_keep,:);
y_truncated = y(1:num_row_to_keep,:);


% t= mean((abs(x(1:L)-y(1:L))).^2)./mean(abs(x(1:L).^2));

t= mean((abs(x_truncated-y_truncated)).^2)./mean(abs(x_truncated.^2));
if (t == 0)
    t = 10^-15;
end
NMSE= 10*log10(t);

if (NMSE> -20)
disp('NMSE Watchdog err')
end

% t= max((abs(x(1:L)-y(1:L))).^2)./mean(abs(x(1:L).^2));
t= max((abs(x_truncated-y_truncated)).^2)./mean(abs(x_truncated.^2));
if (t == 0)
    t = 10^-15;
end
NPSE= 10*log10(t);



if (NPSE > -20)
disp('NPSE Watchdog err')
end

end