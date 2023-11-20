clear all;clc;

%% Ex 2

% A

num = [4 -3.5 0]; %coefficients of z in numerator
den = [1 -2.5 1]; %coefficients of z in denumerator

[R, P, K] = residuez (num, den); %finding residues poles and direct term of T.F.
syms z; %de
syms H [1 length(R)];

%H(z) = R(1)/(z-P(1)) + R(2)/(z-P(2));
for i=1:length(R)
    H(i) = R(i)*z/(z-P(i)); 
end

pretty(sum(H)) %printing in matlab console 

% B

pretty(iztrans(sum(H)))
