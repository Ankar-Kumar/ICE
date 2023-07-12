%   FSk
clc;
clear all;
close all;
am=2;
fm=1;
volt=2;
bits = [1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1];
n= 1000;

T = length(bits);
t = 0:1/n:T;
f2=3;
sig1=am*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t,sig1);
ylim([-7 7]);

sig2=am*sin(2*pi*f2*t);
subplot(4,1,2);
plot(t,sig2);
ylim([-7 7]);

x=zeros(1,length(t));
for i = 1:length(bits)
  if bits(i) == 1
    x((i-1)*n+1:i*n)  = volt;
 end
end

subplot(4,1,3);
plot(t, x, 'linewidth', 3);
ylim([-3, 3]);


res=zeros(1,length(t));
for i=1:T
    if bits(i) == 1
         res((i-1)*n+1:i*n)  = sig1((i-1)*n+1:i*n);
    else 
        res((i-1)*n+1:i*n)  = sig2((i-1)*n+1:i*n);
    end
end
subplot(4,1,4);
plot(t,res);

%demodulation
index=0;
result=zeros(1,T);
for i=1:length(t)
    if(t(i)>index)
        index=index+1;
        if res((index-1)*n+1:index*n) == sig1((index-1)*n+1:index*n)
            result(index)=1;
        end
    end
end

disp(result);




