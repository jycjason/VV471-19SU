function [Prod] = Strassen_method(M, N)
%calculate smartix product of M,N by Strassen's method
[row_M,col_M] = size(M);
[row_N,col_N] = size(N);
if (col_M ~= row_N)
    error("false dimension");
end
if (row_M == 1 && col_M == 1 && col_N == 1)
    Prod = M * N;
    return;
end
max_d = max(max(row_M, col_M), col_N);
k = ceil(log(max_d)/log(2));
n = 2^k;
if (row_M ~= n || col_M ~= n) %reform M if necessary
    M(n, n) = 0;
end
if (row_N ~= n || col_N ~= n) %reform N if necessary
    N(n, n) = 0;
end
A = M(1:n/2,1:n/2);
B = M(1:n/2,n/2+1:n);
C = M(n/2+1:n,1:n/2);
D = M(n/2+1:n,n/2+1:n);
E = N(1:n/2,1:n/2);
F = N(1:n/2,n/2+1:n);
G = N(n/2+1:n,1:n/2);
H = N(n/2+1:n,n/2+1:n);
P1 = Strassen_method(A + D, E + H);
P2 = Strassen_method(C + D, E);
P3 = Strassen_method(A, F - H);
P4 = Strassen_method(D, G - E);
P5 = Strassen_method(A + B, H);
P6 = Strassen_method(C - A, E + F);
P7 = Strassen_method(B - D, G + H);
Prod(1:n/2,1:n/2) = P1 + P4 - P5 +P7;
Prod(1:n/2,n/2+1:n) = P3 + P5;
Prod(n/2+1:n,1:n/2) = P2 + P4;
Prod(n/2+1:n,n/2+1:n) = P1 - P2 + P3 + P6;
end

