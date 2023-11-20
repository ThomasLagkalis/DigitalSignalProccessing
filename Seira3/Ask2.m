clear all; clc;
%%% a subquestion %%%
N = 2;      %order
samples = 256; %samples for plot
wc = 2;     %cuttof angular frequency rad/sec 
d_ripple = 3; %passband ripple in dB
Ts = 0.2;   %sampling period
fs = 1/Ts;  %sampling frequency
fmax = fs/2;
fc = wc/(2*pi);%cutoff frequency hz
fc_dig = fc/(fs/2); %normalize frequency 

[num1 , den1] = cheby1(N, d_ripple, fc_dig, "high", "z"); %fc_dig*2*pi because we want rad/sec
[hd, wd]=freqz(num1, den1, samples); %hd frequency response , wd angular frequency response

w = [0:1/(samples-1):1]; %normalized
figure();
plot(w, mag2db(abs(hd)), "Color", "b", "LineStyle","--", "LineWidth",0.7);
title("Frequency response in dB for 256 samples order 2");
ylabel("dB");
xlabel("radians per sample");
hold on;
%%% b subquestion %%%
N2= 16;
[num2 , den2] = cheby1(N2, d_ripple, fc_dig, "high", "z");
[hd2, wd2]=freqz(num2, den2, samples);
plot(w, mag2db(abs(hd2)), "Color", "r", "LineWidth", 1.2);
title("Frequency response in dB for 256 samples order 16");
ylabel("dB");
xlabel("radians per sample");

