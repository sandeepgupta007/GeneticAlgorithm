function [ output ] = ADec(decimal,a,b,N)
 
% Actual value of decimal

output = a+ decimal*((b-a)/(2^N-1));
end

