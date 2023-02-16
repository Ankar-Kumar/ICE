clc;
clear all;
close all;

bits=[0 1 0 0 1 0];
volt=5;
bitrate=1;
len=length(bits);
n=1000;
totoll=n*len;
dt=1/n;
t=0:dt:len;
x=zeros(1,length(t));

lastbit=-volt;
for i=1:len
    if bits(i)==1
        x((i-1)*n+1:i*n)=-lastbit;
        lastbit=-lastbit;
    end
end
plot(t,x);
ylim([-7,7]);
xlabel('T');
ylabel('amplitude');
title('Bipolar Ami');

index=0;
for i=1:length(t)
    if t(i)>index
        index=index+1;
        result(index)=abs(x(i)/volt);
    end
end
disp(result);



