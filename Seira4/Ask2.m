clc;

N1 = 21; %first window length
N2 = 41; %second window length
wc = 0.5*pi; %cut-off frequency rad/sec
fs = 100; %sampling frequency in Hz
fc=wc/(2*pi); %cut-off frequency in Hz
wc_norm = fc/(fs/2); %cut-off frequency normalized

H_hamm = fir1(N1-1, wc_norm, hamming(N1)); %fir filter with hamming window
H_hamm2 = fir1(N2-1, wc_norm, hamming(N2)); 

H_hann = fir1(N1-1, wc_norm, hann(N1)); %fir filter with hanning window
H_hann2 = fir1(N2-1, wc_norm, hann(N2));

%frequency responses
[h1,w1]=freqz(H_hamm,N1);
[h2,w2]=freqz(H_hamm,N2);

[hann1,wann1]=freqz(H_hann,N1);
[hann2,wann2]=freqz(H_hann,N2);

figure;
subplot(1,2,1);
plot(w1, abs(h1), Color="red");
xlabel('Frequency (rad/sec)');
ylabel('Magnitude');
title('Hamming: N=21');
subplot(1,2,2);
plot(w2, abs(h2));
xlabel('Frequency (rad/sec)');
ylabel('Magnitude');
title('Hamming: N=41');

figure;
subplot(1,2,1);
plot(wann1, abs(hann1), Color="#77AC30");
xlabel('Frequency (rad/sec)');
ylabel('Magnitude');
title('Hanning: N=21');
subplot(1,2,2);
plot(wann2, abs(hann2), Color="#A2142F");
xlabel('Frequency (rad/sec)');
ylabel('Magnitude');
title('Hanning: N=41');

