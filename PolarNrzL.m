clc;
clear all;
close all

% Polar NRZ-L

% modulation
% bits = input('prompt')
bits = [1 1 0 0 1 1 1 0];
voltage = 5;
bitrate = 1;
n = 1000; % sampling frequency
T = length(bits)/bitrate; % total time
N = n*length(bits);
dt = T/N; % time for each sample point
t = 0:dt:T;
x = -voltage * ones(1, length(t));
disp(x)
for i = 1:length(bits)
    if bits(i) == 1
      x((i-1)*n+1:i*n) = voltage;
    end
end

subplot(2, 1, 1);
plot(t, x, 'linewidth', 3);
ylim([-7, 7]);
xlabel('T');
ylabel('Amplitude');
title('Polar NRZ-L');

% demodulation
index = 0;

for i = 1:length(t)
  if t(i) > index
    index = index + 1;
    if x(i) > 0
      result(index) = 1;
    else
      result(index) = 0;
    end
  end
end

disp('Polar NRZ-L decoding');
disp(result)
