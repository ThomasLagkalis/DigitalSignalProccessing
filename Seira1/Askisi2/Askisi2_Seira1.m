clear all; clc;

%% Exercise 2
t = [0:0.0001:0.5];
x = 5*cos(24*pi*t) - 2*sin(1.5*pi*t);
Ts1 = 1/48; % seconds
t1 = [0:Ts1:0.5];
x1 = 5*cos(24*pi*t1) - 2*sin(1.5*pi*t1);
Ts2 = 1/24; % seconds
t2 = [0:Ts2:0.5];
x2 = 5*cos(24*pi*t2) - 2*sin(1.5*pi*t2);
Ts3 = 1/12; % seconds
t3 = [0:Ts3:0.5];
x3 = 5*cos(24*pi*t3) - 2*sin(1.5*pi*t3);
A = 55;Ts = 1/A;tA = [0:Ts:0.5];
xA = 5*cos(24*pi*tA) - 2*sin(1.5*pi*tA);

figure(3)
subplot(4,1,1)
plot(t,x);hold on;
stem(t1, x1)
title('Sampling with T_s = 1/48')
subplot(4,1,2)
plot(t,x);hold on;
stem(t2, x2)
title('Sampling with T_s = 1/24')
subplot(4,1,3)
plot(t,x);hold on;
stem(t3, x3)
title('Sampling with T_s = 1/12')
subplot(4,1,4)
plot(t,x);hold on;
stem(tA, xA)
title('Sampling with T_s = 1/teamNumber where teamNumber = 55')