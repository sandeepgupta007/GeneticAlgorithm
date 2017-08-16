function [ output ] = Bin2Dec( Arr,N , M)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
x1 = 0;
for i = N:-1:1
    x1 = x1+Arr(1,i)*(2^(N-i));
end

x2 = 0;
for i = N+M:-1:N+1
    x2 = x2+Arr(1,i)*(2^(N+M-i));
end
output = [x1,x2];
end