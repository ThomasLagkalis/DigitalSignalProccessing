clear all;clc;

%% Ex 2

% A

num = [4 -3.5 0];
den = [1 -2.5 1];

[R, P, K] = residuez (num, den);
syms z;
syms H [1 length(R)];

%H(z) = R(1)/(z-P(1)) + R(2)/(z-P(2));
for i=1:length(R)
    H(i) = R(i)*z/(z-P(i));
end

pretty(sum(H))

% B

pretty(iztrans(sum(H)))