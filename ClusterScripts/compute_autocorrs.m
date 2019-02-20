%% compute Markov chain marginal auto-correlation functions
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology
%

% read the MCMC data
path = '../full_ABC_inference_experiments/test_unif_prior_GPF/test4_mcmc/GPF_pps_*/sim.chkpnt';
mcmc_files = dir(path);

% append a field for the ACF array
mcmc_files(1).ACF = [];

for i=1:length(mcmc_files)
    % read the MCMC data
    D = csvread([mcmc_files(i).folder,'/',mcmc_files(i).name]);
    [N,M] = size(D);
    k = M - 3;
    mcmc_files(i).ACF = zeros(N,k);

    for j=1:k
        mcmc_files(i).ACF(:,j) = autocorr(D(:,j+1),N-1);
    end
    fprintf('%s %g %g %g %g\n',mcmc_files(i).folder,mcmc_files(i).ACF(end,:))
end

save('autocorr.mat','mcmc_files','-v7.3');
