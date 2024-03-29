% Polar NRZ-I

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
x = zeros(1, length(t));
lastbit = voltage; %let last bit positive
 
for i = 1:length(bits)
    if bits(i) == 1
      x((i-1)*n+1:i*n) = -lastbit;
      lastbit = -lastbit;
    else
      x((i-1)*n+1:i*n) = lastbit;
    end
end

subplot(2, 1, 2);
plot(t, x, 'linewidth', 3);
ylim([-7, 7]);
xlabel('T');
ylabel('Amplitude');
title('Polar NRZ-I');

% demodulation
index = 0;
lastbit = voltage;

for i = 1:length(t)
  if t(i) > index
    index = index + 1;
    if x(i) == lastbit
        result(index) = 0;      
    else
      result(index) = 1;
      lastbit = -lastbit;
    end
  end
end

disp('Polar NRZ-I decoding');
disp(result)
