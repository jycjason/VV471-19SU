function [t, y] = Taylor_sec(phi, phi_t, phi_y, t0, T, y0, n)
    Phi = inline(phi, 't', 'y');
    Phi_t = inline(phi_t, 't', 'y');
    Phi_y = inline(phi_y, 't', 'y');
    t(1) = t0;
    y(1) = y0;
    h = (T - t0)/n;
    for i = 2 : n + 1
       t(i) = t(i - 1) + h;
       p = Phi(t(i - 1), y(i - 1));
       pt = Phi_t(t(i - 1), y(i - 1));
       py = Phi_y(t(i - 1), y(i - 1));
       y(i) = y(i - 1) + h * p + 1/2 * h * h * (pt + py * p);
    end
end

