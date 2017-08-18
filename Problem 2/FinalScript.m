% made by :- Sandeep Gupta & Aditya Dhawan

% Range to find the maximum value
x1 = [1,16];

% maximum value of function maxi
maxi = 0;
gen = 1;

% total length
m = 6;

% Initial population
population = Population(m);

for termination = 1:10000
% intialsing value of fitness array - fvalue
    fvalue = zeros(1,10);

    % Caculating fitness corresponding to each value
    for i = 1:10
        xvalue = Bin2Dec(population(i,:));

        % actual value of x1 and x2
        x = ADec(xvalue,x1(1,1),x1(1,2),m);

        %fitness value
        fvalue(1,i) = fitness(x);

        if(fvalue(1,i) > maxi)
            maxi = fvalue(1,i);
            gen = termination;
            answer = x;
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

    % Crossover - pc = 0.30
    pc = 0.30;
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
                [A,B] = crossover(population(i,:),population(j,:));
                population(i,:) = A;
                population(j,:) = B;
                count = 0;
            end
        end
    end

    % Mutation pm = 0.01

    for i = 1:10
        population(i,:) = mutation(population(i,:),0.01);
    end

end

fprintf('Maximum Value %d \n \n',maxi);
fprintf('x = %d \n \n',answer(1,1));
fprintf('Generation (Maximum value occured) - %d \n \n',gen);

