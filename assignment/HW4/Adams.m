function [t, y] = Adams(Phi, t0, T, y0, n)
    h = (T - t0)/n;
    t(1) = t0;
    y(1) = y0;
    f = inline(Phi, 't', 'y');
    t(2) = t0 + h;
    k1 = f(t(1), y(1));
    ystar = y(1) + h * k1;
    k2 = f(t(2), ystar);
    y(2) = y(1) + 1/2 * h * (k1 + k2);
    for i = 3 : n + 1
       t(i) = t(i - 1) + h;
       y(i) = y(i - 1) + 1/2 * h * (3 * f(t(i - 1), y(i - 1))-f(t(i - 2), y(i - 2)));
    end
end

