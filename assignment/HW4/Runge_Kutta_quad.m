function [t, y] = Runge_Kutta_quad(Phi, t0, T, y0, n)
    h = (T - t0)/n;
    t(1) = t0;
    y(1) = y0;
    f = inline(Phi, 't', 'y');
    for i = 2 : n + 1
       t(i) = t(i - 1) + h;
       k1 = f(t(i - 1), y(i - 1));
       k2 = f(t(i - 1) + h/2, y(i - 1) + h/2 * k1);
       k3 = f(t(i - 1) + h/2, y(i - 1) + h/2 * k2);
       k4 = f(t(i - 1) + h, y(i - 1) + h * k3);
       y(i) = y(i - 1) + h/6 * (k1 + k2 + k3 + k4);
    end
end
