function itot=levich_fit(bo,ovp)


ko=bo(1);
%D=bo(2);
n=1;
F=96490;
R=8.314;
T=298;
A=pi*(0.5/2)^2;%cm2
rot_rat=2*pi*500/60;%angular fre 
scr=10e-3;%V/s
Co=20e-6;%mmol/cm3
%iL=1.14e-3;

D=4.511e-6;
%iL=0.62*n*F*A*D^(2/3)*rot_rat^(1/2)*scr^(-1/6)*Co;

kf=ko*exp(0.5*F*ovp/R/T);
%ik=F*A*kf*Co;
%itot=ik*iL./(ik+iL);

itot=F*A*kf*Co./(1+kf/(0.62*n*F*A*D^(2/3)*rot_rat^(1/2)*scr^(-1/6)));