clearvars;
N = [100, 1000];

for i = 1:length(N)
    disp("-------");
    n = N(i);
    z = [2, 1, zeros(1, n - 2)];
    A = toeplitz(z, z);
    b = ones(n, 1);
    e = [0, diag(A, -1)'];
    f = diag(A);
    g = [diag(A, 1)', 0];
	tic;
    x2 = solve_cholesky(A, b);
    toc;
    tic;
    x3 = A \ b;
    toc;
end