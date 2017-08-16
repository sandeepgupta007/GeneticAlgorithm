function [ c ] = BinaryBits( x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a = (y-x)*10000;
b = log2(a);
c = floor(b)+1;
end


