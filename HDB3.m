clc;
clear all;
close all;
bits=[1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0];
volt = 5;
bitrate = 1;
n = 1000; % sampling frequency
T = length(bits)/bitrate; % total time
N = n*length(bits);
dt = 1/n; % time for each sample point
t = 0:dt:T;
x = zeros(1, length(t));
counter=0;
lastbit=-volt;
cnt=0;
for i=1:length(bits)
    if bits(i)==0
        counter=counter+1;
        if counter==4
            counter=0;
            if mod(cnt,2)==0
                x((i-1-3)*n+1:(i-3)*n) = -lastbit;
                lastbit = -lastbit;
                x((i-1-2)*n+1:(i-2)*n) = 0;
                x((i-1-1)*n+1:(i-1)*n) = 0;
                %x((i-1-1)*n+1:(i-1)*n) = lastbit;
                x((i-1)*n+1:i*n) =lastbit; 
                cnt=0;
            else                
                x((i-1-3)*n+1:(i-3)*n) = 0
                x((i-1-2)*n+1:(i-2)*n) = 0;
                 x((i-1-1)*n+1:(i-1)*n) = 0;
                x((i-1)*n+1:i*n) =lastbit; 
                cnt=0; 
            end
        end
    else
        counter = 0;
        x((i-1)*n+1:i*n) = -lastbit;
        lastbit = -lastbit;
        cnt=cnt+1;
    end
       
end
plot(t, x, 'Linewidth', 3);
ylim([-7, 7]);
xlabel('t');
ylabel('Amplitude');
title('HDB3');

%decoding
index = 0;
lastbit =-volt;
res=zeros(1,T);
for i = 1:length(t)
  if t(i) > index
    index = index + 1;
    if x(i)~=0
        if lastbit==x(i)
            res(index-3:index) = 0;
            %index = index + 4;
        else           
            res(index) = 1;
            lastbit = -lastbit;
        end
    end
    
  end
end
disp('HDB3 output bit  :');
disp(res);




