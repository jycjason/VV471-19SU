function [sum] = Machins_Taylor_Pi(n)
    sum = 0;
    for i = 1 : n
        sum = sum + 4 * (-1)^(i + 1) / (2 * i - 1) * ((1/5)^(2 * i - 1) - (1/239)^(2 * i - 1)); 
    end
    sum = sum * 4;
end

