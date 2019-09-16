function [A,fy, y, C,B] = hw4_ex7(n, a, b)
    y = 1 : 0.0001 : 3;
    [A,B,C, x] = Coefficient(n, a, b);
    fy = 0;
    for i = 2 : n + 1
        fy = fy + C(i-1,1)*(y <= x(i+1)).*(y > x(i-1)).* (y - x(i-1)).* (x(i+1) - y)/(x(i) - x(i-1))/(x(i+1) - x(i));
    end
end

function [A,B,C,x] = Coefficient(n, a, b)
    h = (b - a)/(n + 3);
    for i = 1 : n + 2
        x(i) = i * h + a;
    end
    for i = 2 : n + 1
        B(i - 1 ,1) = (5/6*(x(i+1)^4-x(i-1)^4)-5/3*x(i-1)*x(i+1)*(x(i+1)^2-x(i-1)^2))/(x(i)-x(i-1))/(x(i+1)-x(i));
        for j = i : n + 1 
            if i == j
                A(i - 1, i - 1) = (x(i+1)^4 - x(i-1)^4)/(x(i) - x(i-1))^2/(x(i+1)-x(i))^2;
            elseif j - i == 1 
                A(i - 1, j - 1) = (x(i+1)^4-x(i)^4)/(x(i)-x(i-1))/(x(i+1)-x(i))^2/(x(i+2)-x(i+1));
            else
                A(i - 1, j - 1) = 0;
            end
        end
    end
    for i = 1 : n 
        for j = 1 : i - 1
            A(i, j) = A(j, i);
        end
    end
    C = A \ B;
end

