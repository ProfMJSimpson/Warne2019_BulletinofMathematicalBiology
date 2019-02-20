% simple script for loading ABC prior predictions
% then computing ABC bivariate marginal posteriors
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology

%% loading the data
filename = cell(4,1)
filename{1} = '../results/GPF_MCMC_samples/GPF_pps_12.csv';
filename{2} = '../results/GPF_MCMC_samples/GPF_pps_16.csv';
filename{3} = '../results/GPF_MCMC_samples/GPF_pps_20.csv';
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
set(groot, 'defaulttextInterpreter','latex');
colourmap = [255,255,204;
            27,158,119;
            217,95,2;
            117,112,179]/255;

D = csvread(filename{1});
[h,ax] = ksdensitymatrix([],[],D(:,2:5),[0,0,0,-1;60000,0.1,6e-3,7],30,{'D_0','\lambda','K','r'},'-',colourmap(2,:));
for i=2:3
D = csvread(filename{i});
[h,ax] = ksdensitymatrix(h,ax,D(:,2:5),[0,0,0,-1;60000,0.1,6e-3,7],30,{'D_0','\lambda','K','r'},'-',colourmap(i+1,:));
end

