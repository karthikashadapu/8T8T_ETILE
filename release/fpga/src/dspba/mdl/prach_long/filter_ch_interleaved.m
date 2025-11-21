function [y,z,op_length] = filter_ch_interleaved(x,decimation, ch,b,ip_length,decimator_gain)
x=double(x);
decimator_shift =0;
op_length = ip_length/decimation;

process_length = ip_length/ch;

for i=1:ch
    k(i,:) = x(i:ch:ip_length);
    p(i,:) =  filter(b,1,k(i,:));
    q(i,:) = p(i,1:decimation:process_length);

    y(i:ch:op_length)=(2^decimator_shift)*decimator_gain*q(i,:);
    y=fi(y,1,16,15);
 z=1;%   z(i:ch:decimationprocesslength)= q(i,:) ;
end
