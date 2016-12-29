function ph9_niconel

k=210;
d1=load('m090413_5.dat');
length(d1)
d1=d1(1:k,:);
tf1=log10(d1(:,2));
d1(:,2)=1e3*d1(:,2);

d2=load('m090413_6.dat');
d2=d2(1:k,:);
tf2=log10(d2(:,2));
d2(:,2)=1e3*d2(:,2);

d3=load('m090413_7.dat');
d3=d3(1:k,:);
tf3=log10(d3(:,2));
d3(:,2)=1e3*d3(:,2);

d4=load('m090413_8.dat');
d4=d4(1:k,:);
tf4=log10(d4(:,2));
d4(:,2)=1e3*d4(:,2);

fc=14;
h=subplot(2,2,1);
set(h,'fontsize',fc)

g=plot(d1(:,1),d1(:,2),'-k',d2(:,1),d2(:,2),'-b',...
    d3(:,1),d3(:,2),'r',d4(:,1),d4(:,2),'g');
axis tight
xlim([0.5 1.5]);
title('pH=9 NaNO_3 1 M')
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

d1=load('m090413_9.dat');
d1=d1(1:end,:);
tf1=log10(d1(:,2));
d1(:,2)=1e3*d1(:,2);

d2=load('m090413_10.dat');
%d2=d2(1:k,:);
tf2=log10(d2(:,2));
d2(:,2)=1e3*d2(:,2);

d3=load('m090413_11.dat');
%d3=d3(1:k,:);
tf3=log10(d3(:,2));
d3(:,2)=1e3*d3(:,2);

d4=load('m090413_12.dat');
d4=d4(1:end-100,:);
tf4=log10(d4(:,2));
d4(:,2)=1e3*d4(:,2);

h=subplot(2,2,3);
set(h,'fontsize',fc)

g=plot(d1(:,1),d1(:,2),'-k',d2(:,1),d2(:,2),'-b',...
    d3(:,1),d3(:,2),'r',d4(:,1),d4(:,2),'g');
axis tight
%xlim([0.5 1.5]);
xlabel('Voltage (V)')
ylabel('Current (mA)')

%legend('0 rpm','500','1500','3000','location','best')

% subplot(2,2,4)
% 
% g=plot(d1(:,1),tf1,'-k',d2(:,1),tf2,'-b',...
%  d3(:,1),tf3,'r',d4(:,1),tf4,'g');
% 
% xlabel('Voltage (V)')
% ylabel('Log_1_0 (I)')
print -r600 -dtiff pH9_nicol.tiff

