%  plots analytic solution of Generalise Porous Fisher for point density 
% initial conditons
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology
L = 3200; % (mu m)
Nx = 10000
%D_0 = 1030; % (mu m^2/h)
%D_0 = 1800; % (mu m^2/h)
D_0 = 6700; % (mu m^2/h)
K = 1.7e-3; % (cells/mu m^2)
C_0 = 0.0152;
x = linspace(-L,L,Nx);
t = 24:24:120;
[X,T] = ndgrid(x,t);
figure;
[C] = GPF_AnalyticSol(X,T,D_0,K,C_0,2);
plot(X,C,'-b');
hold on;
ylabel('cell density (cells/\mum^2)');
xlabel('position (\mum)')
plot([0,0],[0,1.2*max(C(:))],'-k');
