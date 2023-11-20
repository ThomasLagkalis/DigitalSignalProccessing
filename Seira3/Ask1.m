clear all; clc;

fs = 10000;
Wp = 2*pi*3000; % Frequency passband rad/s
Ws = 2*pi*4000; % Frequency stopband rad/s
delta_p = 3;  % Ripple 3 db
delta_s = 30;   % Attenuation

[N, Wc] = buttord(Wp, Ws, delta_p, delta_s, 's');
[z, p, k] = buttap(N);
[num1, den1] = zp2tf(z, p, k);
[num2, den2] = lp2lp(num1, den1, Wc);
n=2048; % samples    
f=0:fs/(n-1):fs/2;% frequency axis

% analog filter frequency response 
fr_analog=freqs(num2,den2,2*pi*f);
[NUMz,DENz] = bilinear(num2,den2,fs);   % converts the s-domain transfer function to a z-transform discrete
% digital filter frequency response
fr_digital=freqz(NUMz,DENz, f, fs);

subplot(1, 2, 1);
plot(f,mag2db(abs(fr_analog)),'--',f,mag2db(abs(fr_digital)));axis([0 5000 -300 10])

legend('Analog filter', 'Digital filter');
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Magnitude (dB)','FontSize',14);
title('Butterworth Lowpass Filter for attenuation = 30 db');


% Repeat the process for attenuation 50dB.
delta_s = 50;

[N, Wc] = buttord(Wp, Ws, delta_p, delta_s, 's');
[z, p, k] = buttap(N);
[num1, den1] = zp2tf(z, p, k);
[num2, den2] = lp2lp(num1, den1, Wc);
n=2048;                             % samples    
f=0:fs/(n-1):fs/2;% frequency axis

% analog filter frequency response 
fr_analog=freqs(num2,den2,2*pi*f);
[NUMz,DENz] = bilinear(num2,den2,fs);   % converts the s-domain transfer function to a z-transform discrete
% digital filter frequency response
fr_digital=freqz(NUMz,DENz, f, fs);

subplot(1, 2, 2)
plot(f,mag2db(abs(fr_analog)),'--',f,mag2db(abs(fr_digital)));axis([0 5000 -300 10])

legend('Analog filter', 'Digital filter');
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Magnitude (dB)','FontSize',14);
title('Butterworth Lowpass Filter for attenuation = 50 db');




