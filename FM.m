clc;
clear all;
close all;
% modulation should be 1.5 multiply with the fc given ans correct all time

% car_amp=1;
% msg_amp=1;
fc=20;
fm=1;
t=0:.001:5;
carrier=sin(2*pi*fc*t);
msg=sin(2*pi*fm*t);
modulation=13;

signal=sin(2*pi*fc*t + modulation.*sin(2*pi*fm*t));
subplot(3,1,1);
plot(t,msg);

subplot(3,1,2);
plot(t,carrier);

subplot(3,1,3);
plot(t,signal);



% figure(2);
% x=abs(diff(signal));
% pkg load signal;
% [a,b]=butter(10,0.3);
% demod=filter(a,b,x);
% subplot(3,1,1);
% plot(t,demod);
