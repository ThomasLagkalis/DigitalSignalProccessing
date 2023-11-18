clear all; clc;

%% Ex1

% B subquestion

num = [0 0.2 0]; %coeffients of z in numerator (bigger >> smaller)
den = [1 -0.7 -0.18]; %coefficients of in denumerator
Ts = 1/100; %sampling period

tf(num, den, Ts)

zeros = roots(num)
poles = roots(den)

figure(1);
zplane(zeros, poles); title('z-plane with poles and zeros of H')

% D subquestion

W = [-pi: pi/128:pi]; %plot purposes (freqz) number of points in frequency response
figure(2);
freqz(num, den, W); title('frequency response of H');

% E subquestion

den = [ 1 -1.7 -0.1 0.8]; %adding extra pole
figure(3);
freqz(num, den, W);title('frequency response of H with added pole');
