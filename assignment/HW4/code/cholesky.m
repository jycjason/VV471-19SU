function C = cholesky(A)

n = length(A);
C = zeros(n);
for j = 1:n
    C(j, j) = sqrt(A(j, j));
    for i = j + 1:n
        C(i, j) = A(i, j) / C(j, j);
        for k = j:i
            A(i, k) = A(i, k) - C(i, j) * C(k, j);
        end
    end
end