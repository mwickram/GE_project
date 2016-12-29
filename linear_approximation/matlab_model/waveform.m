function waveform

t = [0:0.0001:2*pi];

y_sin = sin(t);
%plot(t,y_sin);axis([0 2*pi -1 1]);

f = 1/(2*pi);
y_pulse_1 = (-sign(t-0.1/f)-sign(t-0.5/f)+sign(t-0.6/f)+1)/2;

y_pulse_2 = (-sign(t-0.1/f)-sign(t-0.25/f)+sign(t-0.35/f)+1)/2;

y_square_1 = 1/(2^0.5)*(-sign(t-0.5/f)-sign(t-0.5/f)+sign(t-1/f)+1)/2;

y_square_2 = (-sign(t-0.25/f)-0.5*sign(t-0.25/f)+0.25*sign(t-1/f)+1)/2.25;

subplot(2,2,1);
plot(t,y_square_1);axis([0 2*pi -1 1]);

subplot(2,2,2);
plot(t,y_pulse_2);axis([0 2*pi -1 1]);

subplot(2,2,3);
plot(t,y_square_1);axis([0 2*pi -1 1]);

subplot(2,2,4);
plot(t,y_square_2);axis([0 2*pi -1 1.5]);

print -dpng sin.png