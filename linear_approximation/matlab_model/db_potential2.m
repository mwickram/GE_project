function y=db_potential2(t,in_con)

global Chd
global rf
global r
global A
global v

e0=in_con(1);
c0=in_con(2);
e=e0;  
R=8.314;
T=295;
F=96490;
Cb=20e-6;
delta=0.0017;
ko=0.012;
D=4.511E-6;
c=c0;

pot=v;

for k=1:length(pot)
    
y1=((pot(k)-e)/A/r-e/rf/A)/Chd;
y(:,k)=y1'

end
