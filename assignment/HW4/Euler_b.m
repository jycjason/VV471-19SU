function [t, y] = Euler_b(Phi, t0, T, y0, n)
    f = inline(Phi, 't', 'y');
    h = (T - t0)/n;
    t(1) = t0;
    y(1) = y0;
    for i = 2 : n + 1
       t(i) = t(i - 1) + h;
       y(i) = y(i - 1)/(1 - f(t(i), h));
    end
end

