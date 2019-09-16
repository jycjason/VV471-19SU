function [x] = Gauss_Solver(A, b)
    [n, m] = size(b);
    e(1) = 0; f(1) = A(1, 1); g(1) = A(1, 2);
    e(n) = A(n, n-1); f(n) = A(n, n); g(n) = 0;
    for i = 2 : n - 1
        e(i) = A(i, i-1); f(i) = A(i, i); g(i) = A(i, i+1);
    end
    for i = 2 : n
        q = e(i)/f(i-1);
        f(i) = f(i) - q * g(i-1);
        for k = 1 : m
           b(i, k) = b(i, k) - q * b(i - 1, k); 
        end
    end
    for k = 1 : m
       x(n, k) = b(n, k)/f(n);
       for i = n - 1 : -1 : 1
          x(i, k) = (b(i, k) - g(i) * x(i+1, k))/f(i); 
       end
    end
end

