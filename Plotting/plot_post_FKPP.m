% simple script for loading ABC prior predictions
% then computing ABC marginal posteriors
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

modes = zeros(3,3);
        
for i=1:3
    D = csvread(filename{i});
    
    figure(h1);
    pts = linspace(0,10000,1000);
    [pD,Di] = ksdensity(D(:,2),pts);
    plot(Di,pD,'-','color',colourmap(i+1,:),'LineWidth',2)
    xlim([0,10000])
    
    ytickformat('%3.1f')
    yticks([0,0.0005,0.001,0.0015])
    xticks([0,2500,5000,7500,10000])
    xlabel('$D_0$');
    ylabel('$p(D_0 | C_{obs})$')
    hold on
    [~,mD] = max(pD)
    modes(i,1) = Di(mD);

    figure(h2);
    pts = linspace(0,0.2,1000);
    [plambda,lambdai] = ksdensity(D(:,3),pts);
    plot(lambdai,plambda,'-','color',colourmap(i+1,:),'LineWidth',2)
    xlim([0,0.2])
    yticks([0,25,50,75,100])
    xticks([0,0.05,0.1,0.15,0.2])
    xtickformat('%3.2f')
    ylabel('$p(\lambda | C_{obs})$')
    xlabel('$\lambda$');
    hold on
    
    figure(h3);
    pts = linspace(1e-5,7e-3,1000);
    [pK,Ki] = ksdensity(D(:,4),pts);
    plot(Ki,pK,'-','color',colourmap(i+1,:),'LineWidth',2)
    xlim([0,6e-3])
    yticks([0,350,700,1050,1400])
    xticks([0,0.002,0.004,0.006])
    ylabel('$p(K | C_{obs})$')
    xlabel('$K$');
    hold on
    
end

legend({'12K Cells','16K Cells','20K Cells'})
