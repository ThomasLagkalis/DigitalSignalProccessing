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
[h2,w2]=freqz(H_hamm2,N2);

[hann1,wann1]=freqz(H_hann,N1);
[hann2,wann2]=freqz(H_hann2,N2);

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

N=100;
Fs=100;
Ts=1/Fs;
n = 1:N; %samples
x = sin(15*n*Ts) + 0.25*sin(200*n*Ts); %sampling x singal
f_axis=-Fs/2:Fs/N:Fs/2-Fs/N; % frequency axis
Xf=fftshift(fft(x)); % Fourier transform

%Just fft's of various filtered signals
fil1=filter(H_hamm,1,x);                              
XfFil1=fftshift(fft(fil1));
fil2=filter(H_hamm2,1,x);
XfFil2=fftshift(fft(fil2));
fil3=filter(H_hann,1,x);                                 
XfFil3=fftshift(fft(fil3));
fil4=filter(H_hann2,1,x);                                
XfFil4=fftshift(fft(fil4));

figure;
subplot(3,1,1);
plot(f_axis,abs(Xf));
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('The Fourier transform of x=sin(15*t)+0.25*sin(200*t)');
subplot(3,1,2);
plot(f_axis,abs(XfFil1));
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('The filtered Fourier transform of x=sin(15*t)+0.25*sin(200*t) using Hamming window, N=21');
subplot(3,1,3);
plot(f_axis,abs(XfFil2));
xlabel('Frequency(Hz)');
ylabel('Values of function');
title('The filtered Fourier transform of x=sin(15*t)+0.25*sin(200*t) using Hamming window, N=41');
figure;
subplot(3,1,1);
plot(f_axis,abs(Xf));
xlabel('Frequency(Hz)');
ylabel('Values of function');
title('The Fourier transform of x=sin(15*t)+0.25*sin(200*t)');
subplot(3,1,2);
plot(f_axis,abs(XfFil3));
xlabel('Frequency(Hz)');
ylabel('Values of function');
title('The filtered Fourier transform of x=sin(15*t)+0.25*sin(200*t) using Hanning window, N=21');
subplot(3,1,3);
plot(f_axis,abs(XfFil4));
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('The filtered Fourier transform of x=sin(15*t)+0.25*sin(200*t) using Hanning window, N=41');



