% Polar RZ

% modulation
% bits = input('prompt')
bits = [0 1 0 0 1 1 ];
voltage = 5;
bitrate = 1;
n = 1000; % sampling frequency
T = length(bits)/bitrate; % total time
N = n*length(bits);
dt = T/N; % time for each sample point
t = 0:dt:T;
x = zeros(1, length(t));

for i = 1:length(bits)
    if bits(i) == 1
      x((i-1)*n+1:(i-1)*n+n/2) = voltage;
    else
      x((i-1)*n+1:(i-1)*n+n/2) = -voltage;
    end
end

subplot(3, 1, 1);
plot(t, x, 'linewidth', 3);
ylim([-7, 7]);
xlabel('T');
ylabel('Amplitude');
title('Polar RZ');

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

disp('Polar RZ decoding');
disp(result)

% Biphase - Manchester

% modulation
% bits = input('prompt')
bits = [0 1 0 0 1 1 ];
voltage = 5;
bitrate = 1;
n = 1000; % sampling frequency
T = length(bits)/bitrate; % total time
N = n*length(bits);
dt = T/N; % time for each sample point
t = 0:dt:T;
x = zeros(1, length(t));

for i = 1:length(bits)
    if bits(i) == 0
      x((i-1)*n+1:(i-1)*n+n/2) = voltage;
      x((i-1)*n+n/2:i*n) = -voltage;
    else
      x((i-1)*n+1:(i-1)*n+n/2) = -voltage;
      x((i-1)*n+n/2:i*n) = voltage;
    end
end

subplot(3, 1, 2);
plot(t, x, 'linewidth', 3);
ylim([-7, 7]);
xlabel('T');
ylabel('Amplitude');
title('Manchester');

% demodulation
index = 0;

for i = 1:length(t)
  if t(i) > index
    index = index + 1;
    if x(i) > 0
      result(index) = 0;
    else
      result(index) = 1;
    end
  end
end

disp('Manchester decoding');
disp(result)

% Differential Manchester

% modulation
% bits = input('prompt')
bits =[0 1 0 0 1 1 ];
voltage = 5;
bitrate = 1;
n = 1000; % sampling frequency
T = length(bits)/bitrate; % total time
N = n*length(bits);
dt = T/N; % time for each sample point
t = 0:dt:T;
x = zeros(1, length(t));
lastbit = volt;

for i = 1:length(bits)
    if bits(i) == 0 %inversion
      x((i-1)*n+1:(i-1)*n+n/2) = -lastbit;
      x((i-1)*n+n/2:i*n) = lastbit;
      
    else
      x((i-1)*n+1:(i-1)*n+n/2) = lastbit;
      x((i-1)*n+n/2:i*n) = -lastbit;
      lastbit=-lastbit;
    end
end
subplot(3,1,3);
plot(t, x, 'linewidth', 3);
ylim([-7, 7]);
xlabel('T');
ylabel('Amplitude');
title('Differential Manchester');

% 
prev=volt;
ind=0;
for i=1:length(t)
    if t(i)>ind
        ind=ind+1;
        if x(i) ~= prev;
          result(ind) = 0;          
        else
          result(ind) = 1;
          prev = -prev;
    end
    end
end

disp(result);