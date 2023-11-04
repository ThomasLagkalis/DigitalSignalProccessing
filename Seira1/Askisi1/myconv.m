function [result] = myconv(signal1, signal2)

  length1 = length(signal1);
  length2 = length(signal2);

  result = [zeros(1, length1+length2-1)]; %zero padded

  %computing convolution
  for i=1:length1
    for j=1:length2
      result(i+j-1)+=signal1(i).*signal2(j);
    endfor
  endfor

