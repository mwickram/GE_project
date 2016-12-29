function neutral_niconel_CV

d1=load('m090413_1.dat');
d1=sgolayfilt(d1,1,7);
tf1=log10(d1(:,2));
d1(:,2)=1e3*d1(:,2);

d2=load('m090413_2.dat');
d2=sgolayfilt(d2,1,7);
tf2=log10(d2(:,2));
d2(:,2)=1e3*d2(:,2);

% %d3=load('m090413_3.dat');
% d3=d3(1:end,:);
% tf3=log10(d3(:,2));
% d3(:,2)=1e3*d3(:,2);
% 
% d4=load('m090413_4.dat');
% d4=d4(1:end,:);
% tf4=log10(d4(:,2));
% d4(:,2)=1e3*d4(:,2);

fc=14;
h=subplot(2,2,1);
set(h,'fontsize',fc)

g=plot(d1(1:107,1),d1(1:107,2),'-k',d1(107:end,1),d1(107:end,2),'-r');

title('Neutral NaNO_3 1 M')
ylabel('Current (mA)')
xlabel('Voltage (V)')
axis tight
legend('Forward','Reversed','location','best')

h=subplot(2,2,2);
set(h,'fontsize',fc)
g=plot(d1(:,1),d1(:,2),'-k',d2(:,1),d2(:,2),'-b');
axis tight
xlabel('Voltage (V)')
title('Two consecutive curves')

% h=subplot(2,2,4);
% set(h,'fontsize',fc)
% 
% g=plot(d1(:,1),tf1,'-k',d2(:,1),tf2,'-b');
% axis tight


print -r600 -dtiff neutral_nicol_CV.tiff