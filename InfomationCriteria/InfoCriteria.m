% script for computing information crieria
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology
%


%% file and param list
filelist = {'../full_ABC_inference_experiments/test_unif_prior_FKPP/test2/FKPP_pps_12',...
    '../full_ABC_inference_experiments/test_unif_prior_FKPP/test2/FKPP_pps_16',...
    '../full_ABC_inference_experiments/test_unif_prior_FKPP/test2/FKPP_pps_20',...
    '../full_ABC_inference_experiments/test_unif_prior_FKPP/test2/FKPP_MULTDATA_pps',...
    '../full_ABC_inference_experiments/test_unif_prior_PF/test2/PF_pps_12',...
    '../full_ABC_inference_experiments/test_unif_prior_PF/test2/PF_pps_16',...
    '../full_ABC_inference_experiments/test_unif_prior_PF/test2/PF_pps_20',...
    '../full_ABC_inference_experiments/test_unif_prior_PF/test2/PF_MULTDATA_pps',...
    '../full_ABC_inference_experiments/test_unif_prior_GPF/test4_mcmc/GPF_pps_12',...
    '../full_ABC_inference_experiments/test_unif_prior_GPF/test4_mcmc/GPF_pps_16',...
    '../full_ABC_inference_experiments/test_unif_prior_GPF/test4_mcmc/GPF_pps_20',...
    '../full_ABC_inference_experiments/test_unif_prior_GPF/test4_mcmc/GPF_MULTDATA_pps'};

nparamslist = [3,3,3,3,3,3,3,3,4,4,4,4];
percentlist = [0.001*ones(1,12)];
mnames = {'FKPP_12','FKPP_16','FKPP_20','FKPP_All','PF_12','PF_16','PF_20','PF_All','GPF_12','GPF_16','GPF_20','GPF_All'};
D_avg = zeros(12,1);
D_theta = zeros(12,1);
p_D1 = zeros(12,1);
DIC = zeros(12,1);
AIC = zeros(12,1);
BIC = zeros(12,1);
Nx = 38;
Nt = 4;
d = Nx*Nt;

sig = 1e-4;
for i=1:12
    
    dat = csvread([filelist{i},'.csv']);
    rho = dat(:,nparamslist(i)+2);
    K = nparamslist(i);
    rho(isnan(rho) | isinf(rho) | rho == 0) = [];

    % Monte Carlo estimate of expected deviance
    P = exp((-0.5/(sig*sig))*rho);
    D = d*(2*log(sig) + log(2*pi)) + (1/(sig*sig))*rho;
    D_avg(i) = sum(D(:).*P(:))/sum(P(:));

    % the deviance of the best-fit
    rho_m = min(rho(:));
    D_theta(i) = d*(2*log(sig) + log(2*pi)) + (1/(sig*sig))*rho_m;
    logMLE(i) = -d*(2*log(sig) + log(2*pi))/2 - (1/(2*sig*sig))*rho_m;
    % effective Model parameters ()
    p_D1(i) = D_avg(i) - D_theta(i);
    % information criteria
    DIC(i) = D_avg(i) + p_D1(i);
    AIC(i) = 2*K - 2*logMLE(i);
    BIC(i) = K*log(d) - 2*logMLE(i);
    disp(['computed D_avg = ',num2str(D_avg(i)),' and D_theta = ',num2str(D_theta(i)), 'p_D = ',num2str(p_D1(i)), ' for ',mnames{i}]);
    [D_theta,D_avg,p_D1,DIC,BIC,AIC]
end


T = table(D_avg,D_theta,p_D1,DIC,BIC,AIC,'RowNames',mnames)
save('infocrit_withMultDat22_fixed.mat');
quit

