function [lambda] = eignvalue(A)
    [n, ~] = size(A);
    while 1
        [Q, R] = HHQR(A);
        A1 = R * Q;
        sum = 0;
        for i = 2 : n
            for j = 1 : i - 1
                sum = sum + abs(A1(i,j));
            end
        end
        if sum < 1e-5
            break;
        end
        A = A1;
    end
    lambda = diag(A);
end

function [Q, R] = HHQR(A)
    n = size(A, 1);
    I = eye(n);
    Q = I;
    R = A; 
    for j = 1 : 1 : (n - 1) 
        a2 = R(j : n, j);
        c = sign(R(j, j)) * norm(a2);
        v(1 : (j - 1),1) = zeros(j - 1  , 1);
        v(j : n, 1) = a2;        
        v = v - c * I(:, j);     
        H = I - 2 * (v * v')/(v' * v);    
        R = H * R; 
        Q = Q * H;    
    end
end

