clc;

wc = 0.4*pi; %cut-off frequency rad/sec
fs = 200; %sampling frequency in Hz
fc=wc/(2*pi); %cut-off frequency in Hz

wc_norm = fc/(fs/2); %cut-off frequency normalized
N=21; %window length

H_rect = fir1(N-1, wc_norm, rectwin(N)); %fir filter with rectangular window
H_hamm = fir1(N-1, wc_norm, hamming(N)); %fir filter with hamming window

%frequency responses
[h1,w1]=freqz(H_rect,N);
[h2,w2]=freqz(H_hamm,N);

figure;
plot(w1,abs(h1),w2,abs(h2));
legend('Rectangular', 'Hamming')
title('FIR windowed filters')