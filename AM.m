clc;
clear;
close all;

%  Amplitude modulation

Am=2;
Ac=4;
fm=5;
fc=100;

t = 0:0.001:1; %upto 1000 samples
msg = Am*sin(2*pi*fm*t)

subplot(3,1,1);
plot(t,msg,'y');
hold on;
xlabel('Time');
ylabel('Amplitude');
title('Message ');

carrier = Ac*sin(2*pi*fc*t);
subplot(3,1,2);
plot(t,carrier);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');

y = (Ac+msg).*carrier;
subplot(3,1,3);
plot(t,y,'r');
xlabel('Time');
ylabel('Amplitude');
title('FM Signal');
% figure(2)
demod=(y./carrier)-Ac;
% subplot(3,1,1);
% plot(t,demod,'r');

