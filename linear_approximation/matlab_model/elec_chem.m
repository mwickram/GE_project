function [alpha1,beta1,t1,v,e,J0]=elec_chem(e0,P,T,Rf,R,Cd,Ntime,type)
% Apply this function as follows
% [alpha1,beta1,t1,v,J0]=elec_chem(e0,P,T,Rf,R,Cd,type)
% type==1  fixed end with e(T)=e0
% type==2  e(T) free
% e0: initial state, P: power, T time. Ntime: number of time nodes.
% i.e., Ntime=1000 means we sample 1000 nodess on [0,T]
% Example value of parameters
%e0=0;P=80;T=0.2; Rf=100; R=20;Cd=25*10^-4;
% the function returns in alpha1 and beta1 with can form the control
% v(t)=alpha1*exp(-at)+beta1
% v is the optimal control with respect to time t1.
% J0 is the minimum value of J=-Q

% system dynamics \dot{e}=ae+bv---------------------------------------
a=-(R+Rf)/(R*Rf*Cd);
b=1/(R*Cd);

Jmin=0;
%-------v(t)=alpha*exp(-at)+beta, solve for alpha and beta--------
syms al be;
if type==1
tp1=(1-exp(-(a+1)*T))/(a+1);tp2=(exp(-a*T)-1)*e0/b;
S=solve(al*tp1+be*(1-exp(-T))-tp2,be^2*T+2*al*be*(1-exp(-a*T))/a+al^2*(1-exp(-2*a*T))/(2*a)-P*T); 
Sn=double([S.al S.be]);
elseif type==2
S=solve(al*exp(-a*T)+be,be^2*T+2*al*be*(1-exp(-a*T))/a+al^2*(1-exp(-2*a*T))/(2*a)-P*T); 
Sn=double([S.al S.be]);    
else
    disp('invalid type!');
end

for j=1:2
    alpha1=Sn(j,1);beta1=Sn(j,2);
%Ntime=1000;  % # of time node
t1=linspace(0,T,Ntime);
zz=0;
for i=1:Ntime
    v(i)=Sn(j,1)*exp(-a*t1(i))+Sn(j,2);
    zz=zz+v(i)^2*T/Ntime;
    e(i)=exp(a*t1(i))*(e0+b*(Sn(j,1)*(1-exp(-(a+1)*t1(i)))/(a+1)+Sn(j,2)*(1-exp(-t1(i)))));
end
if j==1
V11=v;
end

% plot control v and state e if needed------------------------
% subplot (2,1,1)
% plot(t1,v);
% legend('v(t)');
% subplot (2,1,2)
% plot(t1,e);
% legend('e(t)');

%---------compute the objective function -----------
syms t;
e_sym=exp(a*t)*(e0+b*(Sn(j,1)*(1-exp(-(a+1)*t))/(a+1)+Sn(j,2)*(1-exp(-t))));
J=double(-1/(T*Rf)*int(e_sym,0,T));
if j==1
Jmin=J;
end
J0=J;
if Jmin<J
    alpha1=Sn(1,1);beta1=Sn(1,2);
    J0=Jmin;
    v=V11;
end
end
return

