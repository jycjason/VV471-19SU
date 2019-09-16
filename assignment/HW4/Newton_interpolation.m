function [P] = Newton_interpolation(t, y, n, x)
    P = y(1);
    for i = 2 : n
        prod = divided_difference(1, i, y, t);
        for k = 1 : i - 1
            prod = prod * (x - t(k));
        end
        P = P + prod;
    end
end

function [x] = divided_difference(i, k, y, t)
    if k - i == 1
        x = (y(k) - y(i))/(t(k) - t(i));
    else
        x = (divided_difference(i + 1, k, y, t) - divided_difference(i, k - 1, y, t))/(t(k) - t(i));
    end
end

