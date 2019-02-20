function [C] = GPF_AnalyticSol(X,T,D,K,C_0,r)
%% [C] = GPF_AnalyticSol(X,T,D,K,C_0,r)
% Computes the Analytic solution to the Generalised Porous Fisher equation for
% the special case of zero proliferation and a delta function initial condition
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology
T_end = max(T(:));
C = zeros(size(X));
if r == 0 % special case, Fickian diffusion
    C = C_0*exp(-(X.^2)./(4*D*T))./(2*sqrt(pi*D*T));
else
    r_0 = C_0*gamma(1/r + 3/2)/(sqrt(pi)*K*gamma(1/r + 1));
    t_0 = ((r_0^2)*r)/(2*D*(r + 2));
    lambda_T = (T/t_0).^(1/(2 + r));
    I = (abs(X) <= r_0*lambda_T);
    C(I) = K*((lambda_T(I)).^(-1)).*(1 - (X(I) ./ (r_0*lambda_T(I))).^2).^(1/r);
end
