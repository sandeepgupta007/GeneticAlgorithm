function [ c ] = BinaryBits( x,y )

% number of bits required in a chromosome

a = (y-x)*10000;
b = log2(a);
c = floor(b)+1;
end


