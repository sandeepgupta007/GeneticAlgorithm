function [ childA ] = mutation( A , prob)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:floor(prob*length(A)+1)
    r = randi([1,length(A)]);
    if A(1,r) == 1
        A(1,r) = 0;
    else
        A(1,r) = 1;
    end
end
childA = A;
end

