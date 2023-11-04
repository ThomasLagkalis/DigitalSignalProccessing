clear all; clc;

n1 = [-10:10];
n2 = [0:20];

u = (n1>=0);
r = n2.*(n2>=0);

figure();
subplot(4, 1,1);
stem(n1, u);
title("U signal");

subplot(4, 1 ,2);
stem(n2,r);
title("R signal")

result_custom = myconv(u,r);
nconv = [n1(1)+n2(1):n1(end)+n2(end)];
subplot(4, 1,3);
stem(nconv, result_custom);
title("My convolution")

result_conv = conv(u,r);
subplot(4, 1,4);
stem(nconv, result_conv);
title("conv function")

%checking if results are correct
if(isequal(result_conv, result_custom)==1)
  disp("Convolution results are equal")
else
  disp("Convolution results are not equal")
endif

%%end a


u_ft = fft(u, length(nconv));
r_ft = fft(r, length(nconv));

result_ft = u_ft.*r_ft;

abs_diff = abs(result_custom - ifft(result_ft)) %differences between the results (for f.t.)
disp("There are some really small differences because of numerical operations between functions")

figure(2)
subplot(2, 1, 1)
stem(nconv,ifft(result_ft))
title('Inverse fourier transform of the product in frequency')
subplot(2, 1, 2)
stem(nconv, result_conv)
title('Convolution of two signals using conv()')