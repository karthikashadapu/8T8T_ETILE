function [] = display_constellation(a1,a2,b,c)

    data_a1 = a1(b==1); %b is used when input a is not starting from valid edge
    data_a2 = a2(b==1);

    c=c(101);

    tiledlayout(2,4);
    
    nexttile
    data1 = data_a1(1:c);
    s1 = scatter(real(data1),imag(data1),'.');
    title('AxC 1')
    fontsize(12,"points");
    grid on;

    nexttile
    data1 = data_a1(c+1:c*2);
    s2 = scatter(real(data1),imag(data1),'.');
    title('AxC 3')
    fontsize(12,"points");
    grid on;

    nexttile
    data1 = data_a1(2*c+1:c*3);
    s3 = scatter(real(data1),imag(data1),'.');
    title('AxC 5')
    fontsize(12,"points");
    grid on;

    nexttile
    data1 = data_a1(3*c+1:c*4);
    s4 = scatter(real(data1),imag(data1),'.');
    title('AxC 7')
    fontsize(12,"points");
    grid on;
    
    nexttile
    data2 = data_a2(1:c);
    s1 = scatter(real(data2),imag(data2),'.');
    title('AxC 2')
    fontsize(12,"points");
    grid on;

    nexttile
    data2 = data_a2(c+1:c*2);
    s2 = scatter(real(data2),imag(data2),'.');
    title('AxC 4')
    fontsize(12,"points");
    grid on;

    nexttile
    data2 = data_a2(2*c+1:c*3);
    s3 = scatter(real(data2),imag(data2),'.');
    title('AxC 6')
    fontsize(12,"points");
    grid on;

    nexttile
    data2 = data_a2(3*c+1:c*4);
    s4 = scatter(real(data2),imag(data2),'.');
    title('AxC 8')
    fontsize(12,"points");
    grid on;

    sgt = sgtitle('Output Constellation','Color',[0 .2 .2]);
    sgt.FontSize = 20;
end