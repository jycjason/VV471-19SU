function [res] = Lagrange_interpolation(c)
    res = 0;
    x = [-5, -1, 0, 1, 3, 5, 10, 12];
    f = [781, 5, 1, 1, 61, 521, 9091, 19141];
    for i = 1 : 8
        l(i) = f(i);
        for j = 1 : 8
           if j ~= i
               l(i) = l(i) * (c - x(j))/(x(i) - x(j));
           end
        end
        res = res + l(i);
    end
end

