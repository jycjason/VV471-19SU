function [t, y] = Runge_Kutta_mid(Phi, t0, T, y0, n)
    h = (T - t0)/n;
    t(1) = t0;
    y(1) = y0;
    f = inline(Phi, 't', 'y');
    for i = 2 : n + 1
       t(i) = t(i - 1) + h;
       k1 = f(t(i - 1), y(i - 1));
       ystar = y(i - 1) + h * k1;
       ymid = 1/2 * (y(i - 1) + ystar);
       tmid = t(i - 1) + h/2;
       y(i) = y(i - 1) + h * f(tmid, ymid);
    end
end

