clear all; clc;
%%% a subquestion %%%

%%% filter from Ask1.m %%%
fs = 10000;
Ts = 1/fs;
Wp = 2*pi*3000; % Frequency passband rad/s
Ws = 2*pi*4000; % Frequency stopband rad/s
delta_p = 3;  % Ripple 3 db
delta_s = 30;   % Attenuation

[N, Wc] = buttord(Wp, Ws, delta_p, delta_s, 's');
[z, p, k] = buttap(N);
[num1, den1] = zp2tf(z, p, k);
[num2, den2] = lp2lp(num1, den1, Wc);
[NUMz,DENz] = bilinear(num2,den2,fs);
%%%%%%

samples = linspace(0, 499, 500); %works like discrete time domain
x1=1+cos(1000*samples*Ts)+cos(1600*samples*Ts)+cos(30000*samples*Ts); %signal x sampled
figure();
stem(samples, x1);
xlabel("n");
ylabel("x(n)");

x_filtered = filter(NUMz, DENz, x1);
figure();
stem(samples, x_filtered);


