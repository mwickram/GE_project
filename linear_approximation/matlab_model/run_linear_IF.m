function run_linear_IF



e0=0;
P=80;
T=0.0001;
Rf=3;%100
R=12;%2
Cd=6*10^-6;
Ntime=1000;
type=1;

[alpha1,beta1,t1,v,e,J0]=elec_chem(e0,P,T,Rf,R,Cd,Ntime,type);


J0
alpha1
beta1
q=trapz(t1,e)/Rf

subplot(2,2,1)

plot(t1,v)
ylabel('v')
%xlim([-0.00005 T])

subplot(2,2,2)

plot(t1,(v-e)/R)
ylabel('(v-e)/R')
xlabel('t')
%xlim([-0.00005 T])


subplot(2,2,3)

plot(t1,e)
ylabel('e')
xlabel('t')
%xlim([-0.00005 T])




