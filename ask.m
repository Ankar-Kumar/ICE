clc;
clear all;
close all;

bits=[1 0 1 1 0];
n= 1000;

T = length(bits);
t = 0:1/n:T;
x=zeros(1,length(t));
for i = 1:length(bits)
  if bits(i) == 1
    x((i-1)*n+1:i*n)  = 1;
 end
end

subplot(3,1,1);
plot(t, x, 'linewidth', 3);
ylim([-3, 3]);


a = 5;
f = 3;

sig = a * sin ( 2* pi * f * t);
subplot(3,1,2);
plot(t, sig);

% Modulation
m = x.*sig;
subplot(3,1,3);
plot(t, m);

index=0;
res=zeros(1,T);
for i=1:length(t)
    if t(i)>index
        index=index+1;
        if m(i)~=0
            res(index)=1;
        end
    end
end
disp('modulated bits');
disp(res);
