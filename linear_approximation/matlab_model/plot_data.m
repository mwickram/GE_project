function plot_data


d=load('m071013_1.dat');

t=d(:,1);
v=d(:,2);
e=d(:,3);
rf=100;

dt=d(2);

area_v=trapz(t,v)
power=trapz(t,v.^2)/max(t)
charge=trapz(t,e/rf)



subplot(2,2,1)

plot(t,v,'-k','linewidth',2)
ylabel('V')
axis tight
%ylim([-0.02 2.05])
%xlim([0 1.02])
title(['v\times  t =',num2str(area_v)])

subplot(2,2,2)

plot(t,e)
ylabel('e')
xlabel('t')
axis tight
%ylim([e(1) e(end)*1.05])

subplot(2,2,3)

plot(t,v.^2)
ylabel('V^2')
xlabel('t')
axis tight
%xlim([0 1.01])
%ylim([-0.05 4.1])


title(['P =',(num2str(power))])


i0=1e-6;
f=2/8.314/273;
IF=i0*(exp(0.5*f*e)-exp(-0.5*f*e));

subplot(2,2,4)
plot(t,e/rf)
ylabel('I_f')
xlabel('t')
axis tight
%ylim([e(1) e(end)/rf*1.05])

title(['q =',num2str(charge)])



print -r300 -dtiff fig.tiff


%figure(2)

%plot(e,IF)
end