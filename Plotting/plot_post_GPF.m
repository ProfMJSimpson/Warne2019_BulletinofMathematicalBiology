% simple script for loading ABC prior predictions
% then computing ABC marginal posteriors
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
h1 = figure;
h2 = figure;
h3 = figure;
h4 = figure;
colourmap = [255,255,204;
            27,158,119;
            217,95,2;
            117,112,179]/255;
for i=1:3
    D = csvread(filename{i});
    
    figure(h1)
    pts = linspace(0,70000,5000);
    [pD,Di] = ksdensity(D(:,2),pts);
    plot(Di,pD,'-','color',colourmap(i+1,:),'LineWidth',2)
    xlim([0,60000])
    ytickformat('%3.1f')
    yticks([0,0.00005,0.0001,0.00015])
    xticks([0,20000,40000,60000])
    xlabel('$D_0$');
    ylabel('$p(D_0 | C_{obs})$')
    hold on
    
    figure(h2)
    pts = linspace(0,0.2,1000);
    [plambda,lambdai] = ksdensity(D(:,3),pts);
    plot(lambdai,plambda,'-','color',colourmap(i+1,:),'LineWidth',2)
    xlim([0,0.2])
    yticks([0,50,100,150])
    xticks([0,0.05,0.1,0.15,0.2])
    xtickformat('%3.2f')
    xlabel('$\lambda$');
    ylabel('$p(\lambda | C_{obs})$')
    hold on
    
    figure(h3)
    pts = linspace(0,7e-3,1000);
    [pK,Ki] = ksdensity(D(:,4),pts);
    plot(Ki,pK,'-','color',colourmap(i+1,:),'LineWidth',2)
    xlim([0,6e-3])
    yticks([0,1000,2000,3000])
    xticks([0,0.002,0.004,0.006])
    xlabel('$K$');
    ylabel('$p(K | C_{obs})$')
    hold on
    
    figure(h4)
    pts = linspace(-1,8,1000);
    [pr,ri] = ksdensity(D(:,5),pts);
    plot(ri,pr,'-','color',colourmap(i+1,:),'LineWidth',2)
    xlim([-1,8])
    yticks([0,0.25,0.50,0.75,1.0])
    xticks([-1,0,1,3,5,7])
    ytickformat('%3.2f')
    xlabel('$r$');
    ylabel('$p(r | C_{obs})$')
    hold on
    
end

legend({'12K Cells','16K Cells','20K Cells'})
