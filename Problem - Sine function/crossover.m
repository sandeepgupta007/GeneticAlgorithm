function [ A,B ] = crossover( parentA , parentB)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
l = length(parentA);
r = randi([1,l]);
for i=1:r
    temp = parentA(1,i);
    parentA(1,i) = parentB(1,i);
    parentB(1,i) = temp;
end
A = parentA;
B = parentB;
end
