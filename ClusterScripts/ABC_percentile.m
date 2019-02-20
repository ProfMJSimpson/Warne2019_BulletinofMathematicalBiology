function ABC_percentile(filename,nparam,perct)
% simple script for loading ABC prior predictions
% then computing an ABC posterior based on a given percentile
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology
%

%% loading the data, filename supplied by user
D = csvread([filename,'.csv']);
%% get quatiles, nparam supplied by user
rho = D(:,nparam+2);
[rho_sorted,I]= sort(rho,'ascend');
%J = find(rho_sorted < 3e-6)
D = D(I,:);

csvwrite([filename,'_',num2str(perct),'.csv'],D(1:ceil(perct*length(I)),:));
