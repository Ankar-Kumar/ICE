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
tmp=0;
lastbit=-volt;
for i=1:len
    if bits(i)==1 
        if  tmp~=0
           x((i-1)*n+1:i*n)=0;
           tmp=0;
        else
           x((i-1)*n+1:i*n)=-lastbit;
            tmp=-lastbit;
            lastbit=-lastbit;
          
        end
    else
        x((i-1)*n+1:i*n)=tmp;
    end
end
plot(t,x);
ylim([-7,7]);
xlabel('T');
ylabel('amplitude');
title('Bipolar Ami');

index=0;
lastbit =- volt;
tmp=0;
for i=1:length(t)
    if t(i)>index
        index=index+1;
        if x(i)==tmp
           res(index)=0;
        else
            res(index)=1;
            if abs(tmp)==volt
                tmp=0;
            else
               tmp=-lastbit;
               lastbit=-lastbit;
            end
        end
    end
end

disp(res);



