clear all; clc;
%%% a subquestion %%%

%%% filter from Ask1.m %%%
fs = 10000;
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

samples = linspace(0, 499, 500);                                      %works like discrete time domain
x1=1+cos(1000*samples*Ts)+cos(1600*samples*Ts)+cos(30000*samples*Ts); %signal x sampled
figure();
stem(samples, x1);
xlabel("n");
ylabel("x(n)");
title("Original x signal");

x_filtered = filter(NUMz, DENz, x1);
figure();
stem(samples, x_filtered);
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
figure();
stem(samples, x_filtered);
title("Filtered with att. band 50 db")
xlabel("n")
ylabel("x_{filtered}(n)")

figure();
stem(samples, (x_filtered2-x_filtered).^2);
title("Square difference between attenuation bands")

%%% b subquestion %%%
Ts = 0.2;           %sampling period
fs = 1/Ts;          %sampling frequency
x2 = 1 + cos(1.5*samples*Ts) + cos(5*samples*Ts);

N2= 16;
wc = 2;             %cuttof angular frequency rad/sec 
fc = wc/(2*pi);     %cutoff frequency hz
d_ripple = 3;       %passband ripple in dB
fc_dig = fc/(fs/2); %normalize frequency 
[num2 , den2] = cheby1(N2, d_ripple, fc_dig, "high", "z");

figure();
stem(samples, x2);
xlabel("n")
ylabel("x2(n)")
title("Unfiltered x2 signal")

x2_filtered = filter(num2, den2, x2);
figure();
stem(samples, x2_filtered);
xlabel("n")
ylabel("x2_{filtered}(n)")
title("Filtered x2 signal")





