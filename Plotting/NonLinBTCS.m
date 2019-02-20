function [C] = NonLinBTCS(L,T,Nx,Nt,C0,S,D,tol)
%% C = NonLinBTCS solve 1D reacion-diffusion equation of the form
% dC/dt = d/dx [D(C) dC/dx] + S(C) with zero-flux bounaries using
% Backward Euler discretisation in time and Central differences in space 
% with fixed-point iteration for the non-linear system solve at each step.
%
% E.g: for Fisher-KPP 
%    D = @(C) D0.*ones(size(C)); 
%    S(C) = @(C) lambda*C.*(1 - C)
%
% Parameters:
% L - length of spatial domain
% T - duration of time domain
% Nx - spatial discretisation resolution
% Nt - temporal discretisation resolution
% C0 - initial condition
% S - reaction function, possibly non-linear, must be vectorised
% D - diffusion function, possibly non-linear, must be vectorised
% f - dD/dC function, must be vectorised
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology
%
x = linspace(0,L,Nx);
t = linspace(0,T,Nt);

dx = x(2) - x(1)
dt = t(2) - t(1)

dt*max(D(C0)) < dx^2

C = zeros(Nx,Nt);

C(:,1) = C0;
for t=2:Nt
    
    b = C(:,t-1);
    Cp = C(:,t-1);
    Cn = G(dx,dt,Cp,S,D,b);
    while norm(Cn - Cp) > tol 
        Cp = Cn;
        Cn = G(dx,dt,Cp,S,D,b);
    end
    C(:,t) = Cn;
end

function [Xp] = G(dx,dt,X,S,D,b)
%% Function for fixed point iterations
Xp = zeros(size(X));
Xp(1) = X(2);
Xp(2:end-1) = 0.5*(dt/dx^2)*((D(X(2:end-1)) + D(X(3:end))).*(X(3:end) - X(2:end-1)) ...
                           - (D(X(2:end-1)) + D(X(1:end-2))).*(X(2:end-1) - X(1:end-2) )) ... 
                           + dt*S(X(2:end-1)) + b(2:end-1);
Xp(end) = X(end-1);
