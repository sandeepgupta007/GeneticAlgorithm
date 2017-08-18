function [ value ] = FitnessFunction( x1,x2 )

% calculating fitness of each parent

value = 21.5 + x1*sin(4*pi*x1) + x2*sin(20*pi*x2);
end

