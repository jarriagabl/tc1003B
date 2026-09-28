function vars = solveGauss(A, b)
% Solves a system of linear equations using Gauss-Jordan elimination
%   A: coefficient matrix
%   b: independent values vector
[~, n] = size(A);
A_star = [A b];
for i = 1:n
    if A_star(i,i) == 0
        disp("Cannot have 0s in diagonal. Please rearrange matrix A.");
        break;
    end
    A_star(i,:) = A_star(i,:) / A_star(i,i)
    for j = 1:n
        if i ~= j
            A_star(j,:) = A_star(j,:) - A_star(i,:) * A_star(j,i)
        end
    end
end
vars = A_star(:,end);
end