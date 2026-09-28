function x_k1 = solveJacobi(A, b, t)
% Solves a system of linear equations using Jacobi's method
%   A: coefficient matrix
%   b: independent values vector
%   t: threshold
[~, n] = size(A);
x_k = zeros(n,1);
D = diag(diag(A));
UL = A - D;
% J = D-1 * b
J = D \ b;
% W = D-1 * UL
W = D \ UL;
conv = false;
while ~conv
    x_k1 = J - W * x_k;
    if abs(x_k - x_k1) <= t
        conv = true;
    end
    x_k = x_k1;
end
end