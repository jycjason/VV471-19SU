function [root] = bisection(a, b)
% required a < b
    f = @(x)-1/x*4.67+exp(x)*4.67/(exp(x)-1)-2.71828;
    r = (a + b)/2;
    if (b - a < 0.0001)
        root = r;
    elseif (f(a) * f(b) < 0)
        root = bisection(a, r);
    else
        root = bisection(r, b);
    end
end

