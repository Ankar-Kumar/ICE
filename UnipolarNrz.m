clc;
clear all;
close all
% Unipolar NRZ   + hole 1 - hole 0

% modulation
% bits = input('prompt')
bits = [1,0, 1, 1, 0, 0, 1];
voltage = 5;
bitrate = 1;
n = 1000; % sampling frequency
T = length(bits);

dt = 1/n;
t = 0:dt:T;
x = zeros(1, length(t));
disp(length(t));
for i = 1:length(bits)
    if bits(i) == 1
      x((i-1)*n+1:i*n) = voltage;
    end
end

plot(t, x, 'linewidth', 3);
ylim([-2, 7]);
xlabel('T');
ylabel('Amplitude');
title('Unipolar NRZ');


% demodulation

index = 0;
for i = 1:length(t)
  if t(i) > index
    index = index + 1;
    result(index) = x(i)/voltage;
  end
end

disp('Unipolar NRZ decoding');
disp(result)
