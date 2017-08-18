function [ childA ] = mutation( A , prob)

% Mutation of parent using probablity 0f 0.01 in general

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

