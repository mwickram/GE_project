function ph3_niconel_m090913

%k=200;
d1=load('m090913_5.dat');%0
d1=d1(1:end,:);
tf1=log10(d1(:,2));
d1(:,2)=1e3*d1(:,2);

d2=load('m090913_3.dat');%500
d2=d2(1:end,:);
tf2=log10(d2(:,2));
d2(:,2)=1e3*d2(:,2);

d3=load('m090913_1.dat');%1500
d3=d3(1:end,:);
tf3=log10(d3(:,2));
d3(:,2)=1e3*d3(:,2);

d4=load('m090913_2.dat');%3000
d4=d4(1:end,:);
tf4=log10(d4(:,2));
d4(:,2)=1e3*d4(:,2);

fc=14;

h=subplot(2,2,1);
set(h,'fontsize',fc)

g=plot(d1(:,1),d1(:,2),'-k',d2(:,1),d2(:,2),'-b',...
    d3(:,1),d3(:,2),'r',d4(:,1),d4(:,2),'g');

axis tight
title('pH=3 NaNO_3 1 M')
ylabel('Current (mA)')

legend('0 rpm','500','1500','3000','location','best')

h=subplot(2,2,2);

set(h,'fontsize',fc)

g=plot(d1(:,1),tf1,'-k',d2(:,1),tf2,'-b',...
 d3(:,1),tf3,'r',d4(:,1),tf4,'g');
axis tight
xlabel('Voltage (V)')
ylabel('Log_1_0 (Current)')
%%%%%%%%%%%%%%%%%%%%%

h=subplot(2,2,3);

g=plot(d1(:,1),d1(:,2),'-k',d2(:,1),d2(:,2),'-b',...
    d3(:,1),d3(:,2),'r',d4(:,1),d4(:,2),'g');
xlim([0 5])



print -r600 -dtiff pH3_nicol.tiff
