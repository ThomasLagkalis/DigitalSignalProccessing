%% Exercise 3
%% A
fs = 128; %Hz 
Ts = 1/fs;
N=128;
n = [1:N];
x = 10*cos(2*pi*20*(n*Ts)) - 4*sin(2*pi*40*(n*Ts)+5);
X = fft(x);
figure(4) 
f = [-fs/2:fs/N:fs/2-fs/N];
stem(f, fftshift(X))
axis([-44 44]);


%% B
phi = 10;
fs = 8000; %Hz
f0 = [100:125:475];
n = [-0.1:1/fs:0.1]; N = length(n);
f = [-fs/2:fs/N:fs/2-fs/N];
figure(5)
subplot(4,1,1)
x1 = sin(2*pi*f0(1)*n+phi);
X1 = fft(x1);
stem(f, abs(fftshift(X1)));axis([-700 700 0 1100])
title('f_0 = 100 Hz')
subplot(4,1,2)
x2 = sin(2*pi*f0(2)*n+phi);
X2 = fft(x2);
stem(f, abs(fftshift(X2)));axis([-700 700 0 1100])
title('f_0 = 225 Hz')
subplot(4,1,3)
x3 = sin(2*pi*f0(3)*n+phi);
X3 = fft(x3);
stem(f, abs(fftshift(X3)));axis([-700 700 0 1100])
title('f_0 = 350 Hz')
subplot(4,1,4)
x4 = sin(2*pi*f0(4)*n+phi);
X4 = fft(x4);
stem(f, abs(fftshift(X4)));axis([-700 700 0 1100])
title('f_0 = 475 Hz')

f0 = [7525:125:7900];
figure(6)
subplot(4,1,1)
x1 = sin(2*pi*f0(1)*n+phi);
X1 = fft(x1);
stem(f, abs(fftshift(X1)));axis([-700 700 0 1100])
title('f_0 = 7525 Hz')
subplot(4,1,2)
x2 = sin(2*pi*f0(2)*n+phi);
X2 = fft(x2);
stem(f, abs(fftshift(X2)));axis([-700 700 0 1100])
title('f_0 = 7650 Hz')
subplot(4,1,3)
x3 = sin(2*pi*f0(3)*n+phi);
X3 = fft(x3);
stem(f, abs(fftshift(X3)));axis([-700 700 0 1100])
title('f_0 = 7775 Hz')
subplot(4,1,4)
x4 = sin(2*pi*f0(4)*n+phi);
X4 = fft(x4);
stem(f, abs(fftshift(X4)));axis([-700 700 0 1100])
title('f_0 = 7900 Hz')


