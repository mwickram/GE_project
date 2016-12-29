function run_ode_db(v0)

global Chd
global rf
global r
global A
global v


Chd=1e-6; 
rf=1000;
r=20;
A=1;
vint=v0;

ocp=0;
e0=ocp;
c0=1e-6;
in_con=[e0 c0];
options=odeset('Abstol',1e-6,'reltol',1e-6);


f=1000;
%t=[0:1e-6:1e-4];
amp=1;
t=[0:1e-6:1e-3];%for constant vo

%v=vint;
%sr=r*Chd;
sr=0;
v=vint+sr*t;
%v=vint+exp(f*t);
%v=vint+(1/r+1/rf)*r*t.^2/Chd;
%v=vint+tripuls(2*pi*f*t,0.5,0.2);
%v=vint+(1/r+1/rf)*r*sin(2*pi*f*t);
%v=vint+amp*(1/r+1/rf)*r*square(2*pi*f*t,10);
%v=vint-amp*(1/r+1/rf)*r*cos(2*pi*f*t);

%v=-(1/r+1/rf)*r*sin(2*pi*f*t)+(1/r+1/rf)*r*cos(2*pi*f*t);


[t,ynew]=ode45(@db_potential2,t,in_con,options);

data(:,1)=t;
data(:,2)=v;%v
data(:,3)=ynew(:,1);%e
data(:,4)=ynew(:,2);

save  -ascii m071013_1.dat data;

plot_data
