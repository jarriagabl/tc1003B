function x_k1 = solveJacobi(A, b, t)
% Solves a system of linear equations using Jacobi's method
%   A: coefficient matrix
%   b: independent values vector
%   t: threshold
[~, n] = size(A);   % Gets number of variables

x_k = zeros(n,1);   % Starting solution (vector of 0s)

D = diag(diag(A));  % n x n matrix holding only diagonal values of A
UL = A - D;         % n x n matrix holding only non-diagonal values of A

J = D \ b;          % Precalculate J = D-1*b
W = D \ UL;         % Precalculate W = D-1*UL

conv = false;
while ~conv
    x_k1 = J - W * x_k;     % New values for x_k1 = J - Wx_k
    
    % Check if diff between prev and current solutions is less than threshold
    if abs(x_k - x_k1) <= t
        conv = true;    % if true, convergence has been reached
    end
    x_k = x_k1;         % Update values for next iteration
end