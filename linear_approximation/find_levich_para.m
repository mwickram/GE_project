function find_levich_para(bo)


ko=bo(1);
%D=bo(2);
data=load('m080312_7.dat');
data=data(1:25,:);
iexp=data(:,3);
pot=data(:,2);
ovp=pot-0.220;
b=nlinfit(iexp,ovp,@levich_fit,[ko])


ifit=rd_plot(b,ovp);

plot(ovp,iexp,'o',ovp,ifit/1000,'-r')


