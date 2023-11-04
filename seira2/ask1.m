clear all; clc;


%% Ex1

% B

num = [0.2 0];
den = [1 -0.7 -0.18];
Ts = 1/100;

tf(num, den, Ts)

zeros = roots(num)
poles = roots(den)

figure(1);
zplane(zeros, poles); title('z-plane with poles and zeros of H')

% D

W = [-pi: pi/128:pi];
figure(2);
freqz(num, den, W);title('frequency response of H');

% E

den = [ 1 -1.7 -0.1 0.8];
figure(3);
freqz(num, den, W);title('frequency response of H with added pole');
