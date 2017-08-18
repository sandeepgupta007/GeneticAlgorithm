function [ val ] = Bin2Dec( A )

% Binary to decimal conversion

val = 0;
for i=length(A):-1:1
    val=val+A(1,i)*(2^(length(A)-i));
end
end

