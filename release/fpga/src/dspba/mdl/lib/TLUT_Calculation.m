% clc;
% close all;
% clear all;
T_abs_start=00.0;
Fs=122.88e6;
Ts=1/Fs;


CPLen = [ 352 288 288 288 288  288 288 288 288 288 288 288 288 288 ];

SymNo = 0;
SlotNo = 0;
SubFrameNo = 0;
FrameNo=0;

SymNoMax = 14;
SlotNoMax =1;
SubFrameNoMax = 10;
FrameNoMax=011;
n=0;
itr =10*14;

 SymNo = 0;
for i=1:itr
    t_now=T_abs_start+(n*Ts);
    t_cp = t_now+ CPLen(SymNo+1)*Ts;
   
    TLUT(i) = t_cp*1e9;
        n=n+4096+CPLen(SymNo+1);
        SymNo=SymNo+1;

            if (SymNo==SymNoMax)
                SymNo=0;
                SlotNo=SlotNo+1;

                     if (SlotNo==SlotNoMax)
                            SlotNo=0;
                          SubFrameNo=  SubFrameNoMax+1;

                                     if (SubFrameNo==SubFrameNoMax)
                                                SubFrameNo=0;
                                                FrameNo=FrameNo+1;
                                     end
                     end
            end


end
format long
y=mod(1*2*pi*2.35567*TLUT,2*pi);
lut = TLUT(1:14)