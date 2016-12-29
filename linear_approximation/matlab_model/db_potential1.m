function y=db_potential1(t,e0)



global Chd
%global rf
global r
global A
global v


e=e0;  
i0=10^-6;
f=2/8.314/273;


pot=v;

for k=1:length(pot)
    
IF=i0*(exp(0.5*f*e)-exp(-0.5*f*e));

y1=((pot(k)-e)/A/r-IF/A)/Chd;
y(:,1)=y1';

end
