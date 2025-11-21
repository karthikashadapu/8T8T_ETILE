
function [] = display_msgbox(section,val)

s = length(val);
h = 25*(s-1)+70;
if(val==1)
    f=msgbox(section,"Vector generation","help");
else
    if(val<-30)
        f=msgbox(sprintf('\n TEST PASSED | NMSE : %f  (dB)',val),section,"help");
    else
        f=msgbox(sprintf('\n TEST FAILED | NMSE : %f  (dB)',val),section,"error");
    end 
end

th = findall(f,'Type','Text'); % Get handle to text within msgbox
th.FontSize = 16;
set(f, 'Position', [100 200 350 h]);

end