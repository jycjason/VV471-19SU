for i = 1 : 3
    N = 10 * 10^i;
    z = [2 1 zeros(1, N - 2 )] ;
	A = toeplitz(z, z);
	b = ones(N, 1);
    disp("For N = " + N + ", Tridiagonal method: ");
    tic; Gauss_Solver(A, b); toc;
    disp("For N = " + N + ", Choleksy method: ")
    tic; Choleksy(A, b); toc;
    disp("For N = " + N + ", Backslash method: ")
    tic; A\b; toc;
end

    