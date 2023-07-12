clc;
clear all;
close all;

t=0:.001:1;
fc=30;
fm=1;

modulation=20;
msg=sin(2*pi*fm*t);
subplot(3,1,1);
plot(t,msg);

carr=sin(2*pi*fc*t);
subplot(3,1,2);
plot(t,carr);

mod=sin(2*pi*fc*t+modulation .*cos(2*pi*fm*t));
subplot(3,1,3);
plot(t,mod);