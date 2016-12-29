function V_form

%v=vint;
%sr=r*Chd;
t=t=[0:1e-6:1e-3];
sr=0;
v=vint+sr*t;
%v=vint+exp(f*t);
%v=vint+(1/r+1/rf)*r*t.^2/Chd;
%v=vint+tripuls(2*pi*f*t,0.5,0.2);
%v=vint+(1/r+1/rf)*r*sin(2*pi*f*t);
%v=vint+amp*(1/r+1/rf)*r*square(2*pi*f*t,10);
%v=vint-amp*(1/r+1/rf)*r*cos(2*pi*f*t);
%v=-(1/r+1/rf)*r*sin(2*pi*f*t)+(1/r+1/rf)*r*cos(2*pi*f*t);
end
