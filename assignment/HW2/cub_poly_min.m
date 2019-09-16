function [min] = cub_poly_min(a, b)
% required a < b
    f = @(x)exp(x) + 2 * x + x^2/2;
    g = @(x)exp(x) + 2 + x;
    alpha = ((b - a) * (g(a) + g(b)) + 2 * (f(a) - f(b)))/(b - a)^3;
    beta = -((b - a) * (2 * g(a) + g(b)) + 3 * (f(a) - f(b)))/(b - a)^2;
    gamma = g(a);
    c = a + (-beta + sqrt(beta^2 - 3 * alpha * gamma))/(3 * alpha);
    if (b - a < 0.000001)
        min = c;
    elseif (g(c) < 0)
        min = cub_poly_min(c, b);
    else
        min = cub_poly_min(a, c);
    end
end
