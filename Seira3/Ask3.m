clear all; clc;
%%% a subquestion %%%

%%% filter from Ask1.m %%%
fs = 10000;
N=500;
f = [-fs/2:fs/N:fs/2-fs/N]; % For frequency respones
Ts = 1/fs;
Wp = 2*pi*3000;     % Frequency passband rad/s
Ws = 2*pi*4000;     % Frequency stopband rad/s
delta_p = 3;        % Ripple 3 db
delta_s = 30;       % Attenuation

[N, Wc] = buttord(Wp, Ws, delta_p, delta_s, 's');
[z, p, k] = buttap(N);
[num1, den1] = zp2tf(z, p, k);
[num2, den2] = lp2lp(num1, den1, Wc);
[NUMz,DENz] = bilinear(num2,den2,fs);
%%%%%%

samples = linspace(0, 499, 500);    %works like discrete time domain
x1=1+cos(1000*samples*Ts)+cos(1600*samples*Ts)+cos(30000*samples*Ts); %signal x sampled
figure(1);
subplot(2, 1, 1)
stem(samples, x1);
xlabel("n");
ylabel("x(n)");
title("Original x signal on time domain");
X1 = fft(x1);
subplot(2, 1, 2)
stem(f, fftshift(X1));
xlabel("F");
ylabel("x(F)");
title("Original x signal on frequency domain");

x_filtered = filter(NUMz, DENz, x1);
figure(2);
subplot(2, 1, 1);
stem(samples, x_filtered);
title("Filtered with att. band 30 db");
xlabel("n")
ylabel("x_{filtered}(n)")
X_filtered = fft(x_filtered);
subplot(2, 1, 2)
stem(f, fftshift(X_filtered))
title("Filtered with att. band 30 db")
xlabel("n")
ylabel("x_{filtered}(n)")

% repeat the process for different attenuation band
delta_s = 50;
[N, Wc] = buttord(Wp, Ws, delta_p, delta_s, 's');
[z, p, k] = buttap(N);
[num1, den1] = zp2tf(z, p, k);
[num2, den2] = lp2lp(num1, den1, Wc);
[NUMz,DENz] = bilinear(num2,den2,fs);


x_filtered2 = filter(NUMz, DENz, x1);
figure(3);
subplot(2, 1, 1)
stem(samples, x_filtered);
title("Filtered with att. band 50 db")
xlabel("n")
ylabel("x_{filtered}(n)")
X_filtered2 = fft(x_filtered);
subplot(2, 1, 2)
stem(f, fftshift(X_filtered2));
title("Filtered with att. band 30 db")
xlabel("n")
ylabel("x_{filtered}(n)")

figure(4);
stem(samples, (x_filtered2-x_filtered).^2);
title("Square difference between attenuation bands")

%%% b subquestion %%%
Ts = 0.02;           %sampling period
fs = 1/Ts;          %sampling frequency
x2 = 1 + cos(1.5*samples*Ts) + cos(5*samples*Ts);

N2= 16;
wc = 2;             %cuttof angular frequency rad/sec 
fc = wc/(2*pi);     %cutoff frequency hz
d_ripple = 3;       %passband ripple in dB
fc_dig = fc/(fs/2); %normalize frequency 
[num2 , den2] = cheby1(N2, d_ripple, fc_dig, "high", "z");

figure(5);
subplot(2, 1, 1)
stem(samples, x2);
axis([0 250 min(x2)-0.7 max(x2)+0.7])
xlabel("n")
ylabel("x2(n)")
title("Unfiltered x2 signal time dοmain")
X2 = abs(fft(x2));
subplot(2, 1, 2)
stem(f, fftshift(X2));
xlabel("F")
ylabel("X2(F)")
title("Unfiltered x2 signal frequency domain")
X2 = fft(x2);


x2_filtered = filter(num2, den2, x2);
figure(6);
subplot(2, 1, 1)
stem(samples, x2_filtered);
xlabel("n")
ylabel("x2_{filtered}(n)")
title("Filtered x2 signal")
axis([0 250 min(x2_filtered)-0.7 max(x2_filtered)+0.7])


title("Filtered x2 signal time domain")
X2_filtered = abs(fft(x2_filtered));
subplot(2, 1, 2)
stem(f, fftshift(X2_filtered));
xlabel("F")
ylabel("x2_{filtered}(F)")
title("Filtered x2 signal frequency domain")

