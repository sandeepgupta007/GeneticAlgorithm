function [ output ] = ADec(decimal,a,b,N)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
output = a+ decimal*((b-a)/(2^N-1));
end

