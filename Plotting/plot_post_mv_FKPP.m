% simple script for loading ABC prior predictions
% then computing ABC bivariate marginal posteriors
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology

%% loading the data
filename = cell(4,1)
filename{1} = '../results/BMB_perspect_ABC_sims_0.001subsample2/FKPP_pps_12_0.001.csv';
filename{2} = '../results/BMB_perspect_ABC_sims_0.001subsample2/FKPP_pps_16_0.001.csv';
filename{3} = '../results/BMB_perspect_ABC_sims_0.001subsample2/FKPP_pps_20_0.001.csv';
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
set(groot, 'defaulttextInterpreter','latex');
h1 = figure;
h2 = figure;
h3 = figure;
colourmap = [255,255,204;
            27,158,119;
            217,95,2;
            117,112,179]/255;

D = csvread(filename{1});
[h,ax] = ksdensitymatrix([],[],D(:,2:4),[0,0,0;3000,0.15,6e-3],100,{'D_0','\lambda','K'},'-',colourmap(2,:));
for i=2:3
D = csvread(filename{i});
[h,ax] = ksdensitymatrix(h,ax,D(:,2:4),[0,0,0;3000,0.15,6e-3],100,{'D_0','\lambda','K'},'-',colourmap(i+1,:));
end

