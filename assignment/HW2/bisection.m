function [root] = bisection(a, b)
% required a < b
    r = (a + b)/2;
    f = @(x)cos(1/x)/x^2*((x-2*pi)^2+pi)+2*(x-2*pi)*sin(1/x);
    if (b - a < 0.0001)
        root = r;
    elseif (f(a) * f(r) < 0)
        root = bisection(a, r);
    else
        root = bisection(r, b);
    end
end

