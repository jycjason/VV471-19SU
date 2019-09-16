function x = solve_cholesky(A, b)

n = length(b);
C = cholesky(A);
% forward substitution;
b(1) = b(1) / C(1, 1);
for i = 2:n
    for j = 1:i - 1
        b(i) = b(i) - b(j) * C(i, j);
    end
    b(i) = b(i) / C(i, i);
end
% backward substitution;
b(n) = b(n) / C(n, n);
for i = n - 1:-1:1
    for j = i + 1:n
        b(i) = b(i) - b(j) * C(j, i);
    end
    b(i) = b(i) / C(i, i);
end

x = b;