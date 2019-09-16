N = 100;
rng(471) ;
X = randn(N) ;
A = transpose(X) * X;
lambda = sort(eignvalue(A));
eignvalue = sort(eig(A));
error = max(lambda - eignvalue);