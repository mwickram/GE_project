function ph_variation

k=205;
d1n=load('m090513_10.dat');%ph7.7
d1n=d1n(1:k,:);
tf1n=log10(d1n(:,2));
d1n(:,2)=1e3*d1n(:,2);


d13=load('m090513_1.dat');%pH3
d13=d13(1:end,:);
tf13=log10(d13(:,2));
d13(:,2)=1e3*d13(:,2);


k=210;
d19=load('m090413_5.dat');%pH9
d19=d19(1:k,:);
tf19=log10(d19(:,2));
d19(:,2)=1e3*d19(:,2);

h=subplot(2,2,1);

set(h,'fontsize',16)
g=plot(d13(:,1),d13(:,2),'-b',d1n(:,1),d1n(:,2),'-k',d19(:,1),d19(:,2),'-r');
xlabel('Votage (V)')
ylabel('Current (mA)')
legend('pH 3', '7.7', '9','location','best')

%%%%%%%%%%%%

d1n=load('m090513_14.dat');
d1n=d1n(1:345,:);
tf1n=log10(d1n(:,2));
d1n(:,2)=1e3*d1n(:,2);


d13=load('m090513_5.dat');
d13=d13(1:end-91,:);
tf13=log10(d13(:,2));
d13(:,2)=1e3*d13(:,2);


d19=load('m090413_9.dat');
d19=d19(1:end,:);
tf19=log10(d19(:,2));
d19(:,2)=1e3*d19(:,2);


h=subplot(2,2,2);

set(h,'fontsize',16)
g=plot(d13(:,1),d13(:,2),'-b',d1n(:,1),d1n(:,2),'-k',d19(:,1),d19(:,2),'-r');
xlabel('Votage (V)')
legend('pH 3', '7.7', '9','location','best')


print -r600 -dtiff ph_variation.tiff
