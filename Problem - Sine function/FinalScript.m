% made by :- Sandeep Gupta & Aditya Dhawan

% Range to find the maximum value
x1 = [-3.0,12.1];
x2 = [4.1,5.8];

% maximum value of function maxi
maxi = 0;
gen = 1;

% length of chromosome corresponding to first range
m1 = BinaryBits(x1(1,1),x1(1,2));
m2 = BinaryBits(x2(1,1),x2(1,2));

% total length
m = m1 + m2;

% Initial population
population = PopulationBits(m);

for termination = 1:1000
% intialsing value of fitness array - fvalue
fvalue = zeros(1,10);

% Caculating fitness corresponding to each value
for i = 1:10
    xvalue = Bin2Dec(population(i,:),m1,m2);
    
    % actual value of x1 and x2
    x = ADec(xvalue(1,1),x1(1,1),x1(1,2),m1);
    y = ADec(xvalue(1,2),x2(1,1),x2(1,2),m2);
    
    %fitness value
    fvalue(1,i) = FitnessFunction(x,y);
    
    if(fvalue(1,i) > maxi)
        maxi = fvalue(1,i);
        gen = termination;
        answer = [x,y];
    end
    
end

% sum of fitness function
s = 0;
s = sum(fvalue);

% Probablity of fitness values
% commulative probablity for roulette wheel
prob = zeros(1,10);

for i = 1:10
    if i == 1
        prob(1,i) = fvalue(1,i)/s;
    else
        prob(1,i) = prob(1,i-1)+fvalue(1,i)/s;
    end
end

% Selection for next generation
newgen = zeros(10,m);
g = rand(1,10);
for i = 1:10
    for j = 1:10
        if prob(1,j) >= g(1,i)
            newgen(i,:) = population(j,:);
            break;
        end
    end
end

population = newgen;

% Crossover - pc = 0.25
pc = 0.25;
crossp = rand(1,10);
count = 0;
j=0;
for i = 1:10
    if crossp(1,i) <= pc
        if(count == 0)
            j = i;
        end
        count=count+1;
        if(count == 2)
            [A,B] = crossover(population(1,i),population(1,j));
            population(1,i) = A;
            population(1,j) = B;
            count = 0;
        end
    end
end

% Mutation pm = 0.01

for i = 1:10
    population(1,i) = mutation(population(1,i),0.01);
end

end

disp(maxi);
disp(answer);
disp(gen);

