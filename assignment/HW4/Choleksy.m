function [x] = Choleksy(a, b)
    [n, m] = size(b); c(n, n) = 0;
    for j = 1 : n
        c(j, j) = sqrt(a(j, j));
        for i = j + 1 : n
            c(i, j) = a(i, j)/c(j, j);
            for k = j : i
                a(i, k) = a(i, k) - c(i, j) * c(k, j);
            end
        end
    end
    x(n, m) = 0; y(n, m) = 0;
    for i = 1 : n
       for j = 1 : i - 1
           for k = 1 : m
              b(i, k) = b(i, k) - c(i, j) * y(j, k); 
           end
       end
       for k = 1 : m
          y(i, k) = b(i, k)/c(i, i); 
       end
    end
    for i = n : -1 : 1
       for j = i + 1 : n
           for k = 1 : m
              y(i, k) = y(i, k) - c(j, i) * x(j, k); 
           end    
       end
       for k = 1 : m
          x(i, k) = y(i, k)/c(i, i); 
       end   
    end
end

