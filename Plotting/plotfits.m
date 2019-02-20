% Plotting data obtained from Least-squares against scratch assay density 
% profiles with 20,000 cells initially.
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology
%
FKPP_data = csvread('../results/BMB_forwardprob_fit/FKPP_lsqfit.csv')
PF_data = csvread('../results/BMB_forwardprob_fit/PF_lsqfit.csv')
GPF_data = csvread('../results/BMB_forwardprob_fit/GPF_lsqfit.csv')
D = csvread('../data/fbs20000.csv')
set(groot, 'defaultAxesTickLabelInterpreter','latex'); set(groot, 'defaultLegendInterpreter','latex');
set(groot, 'defaulttextInterpreter','latex');
%%
colourmap = [0,0,0;27,158,119;217,95,2;117,112,179;231,41,138]/255;
figure;
plot(D(1,2:39),D(2,2:39)','-o','color',colourmap(1,:));
hold on
for i=2:5
    plot(D(1,2:39),D(i+1,2:39)','-o','color',colourmap(i,:));
end
legend('0 [h]','12 [h]','24 [h]', '36 [h]','48 [h]')
ytickformat('%3.1f')
xlabel('position [$\mu$m]');
xlim([0,1875])
ylabel('cell density [cells/$\mu$m$^2$]')

figure;
plot(D(1,2:39),D(2,2:39)','o','color',colourmap(1,:));
hold on
for i=2:5
    plot(D(1,2:39),D(i+1,2:39)','o','color',colourmap(i,:));
end
for i=1:5
    plot(linspace(0,1875,186),FKPP_data(i+1,2:end)','-','color',colourmap(i,:));
end
ytickformat('%3.1f')
xlabel('position [$\mu$m]');
xlim([0,1875])
ylabel('cell density [cells/$\mu$m$^2$]')
figure;
plot(D(1,2:39),D(2,2:39)','o','color',colourmap(1,:));
hold on
for i=2:5
    plot(D(1,2:39),D(i+1,2:39)','o','color',colourmap(i,:));
end
for i=1:5
    plot(linspace(0,1875,186),PF_data(i+1,2:end)','-','color',colourmap(i,:));
end
ytickformat('%3.1f')
xlabel('position [$\mu$m]');
xlim([0,1875])
ylabel('cell density [cells/$\mu$m$^2$]')
%%
figure;
plot(D(1,2:39),D(2,2:39)','o','color',colourmap(1,:));
hold on
for i=2:5
    plot(D(1,2:39),D(i+1,2:39)','o','color',colourmap(i,:));
end
for i=1:5
    plot(linspace(0,1875,186),GPF_data(i+1,2:end)','-','color',colourmap(i,:));
end
ytickformat('%3.1f')
xlabel('position [$\mu$m]');
xlim([0,1875])
ylabel('cell density [cells/$\mu$m$^2$]')
