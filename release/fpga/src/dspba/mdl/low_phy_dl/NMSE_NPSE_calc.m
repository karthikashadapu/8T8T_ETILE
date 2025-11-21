function [NMSE,NPSE] = NMSE_NPSE_calc(x,y)
x=double(x);
y=double(y);
L=min(length(x),length(y));
t= mean((abs(x(1:L)-y(1:L))).^2)./mean(abs(x(1:L).^2));
NMSE= 10*log10(t);

if (NMSE> -20)
disp('NMSE Watchdog err')
end
t= max((abs(x(1:L)-y(1:L))).^2)./mean(abs(x(1:L).^2));
NPSE= 10*log10(t);



if (NPSE > -20)
disp('NPSE Watchdog err')
end

end