function vars = solveGauss(A, b)
% Solves a system of linear equations using Gauss-Jordan elimination
%   A: coefficient matrix
%   b: independent values vector
[~, n] = size(A);   % gets number of variables
A_star = [A b];     % extended matrix, concatenates A and b
for i = 1:n         % for each row
    if A_star(i,i) == 0     % guardrail for 0 division
        disp("Diagonal elements cannot be 0. Please fix it.");
        break;
    end
    % Divide row i by corresponding diagonal element (turns element i,i into 1)
    A_star(i,:) = A_star(i,:) / A_star(i,i);
    for j = 1:n     % for all rows...
        if i ~= j   % ...that are not row i
            % turn elements in column i into 0
            A_star(j,:) = A_star(j,:) - A_star(i,:) * A_star(j,i);
        end
    end
end
% Coefficient matrix in identity form, last column holds the solution
vars = A_star(:,end);
end