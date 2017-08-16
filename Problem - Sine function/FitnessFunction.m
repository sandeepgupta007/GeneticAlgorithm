function [ value ] = FitnessFunction( x1,x2 )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
value = 21.5 + x1*sin(4*pi*x1) + x2*sin(20*pi*x2);
end

