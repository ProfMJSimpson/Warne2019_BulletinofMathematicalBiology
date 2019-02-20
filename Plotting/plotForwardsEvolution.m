% Script for plotting numerical solution of 1d reaction--diffusion equations
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology
close all;
%%% Fisher-KPP
L = 3200;
T = 120;
D_0 = 1030;
lambda = 0.064
K = 1.7e-3; 
Nx = 250;
Nt = 72000;
tol = 1e-6;

C0 = [0.7*ones(Nx/10,1)*K;zeros(Nx*9/10,1)];

D = @(x) D_0*ones(size(x));
S = @(x) lambda*x.*(1-x/K);

tic;
C_FKPP = NonLinBTCS(L,T,Nx,Nt,C0,S,D,tol);
toc;
%%% Generalised Porous Fisher
D_0 = 6700
lambda = 0.065
K = 1.7e-3; 
m = 2;

D = @(x) D_0*(x/K).^m;
S = @(x) lambda*x.*(1-x/K);

tic;
C_PF = NonLinBTCS(L,T,Nx,Nt,C0,S,D,tol);
toc;
%%
figure;
plot(linspace(-L,L,2*Nx),[C0(end:-1:1);C0],'-k');
hold on;
for t=14400:14400:Nt
    plot(linspace(-L,L,2*Nx),[C_PF(end:-1:1,t);C_PF(:,t)],'-b');
    axis([-L,L,0,2e-3])    
end
ylabel('cell density (cells/\mum^2)');
xlabel('position (\mum)')
plot(linspace(-L,L,Nx),K*ones(1,Nx),'--k');
