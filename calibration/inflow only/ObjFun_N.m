function nRMSE = ObjFun_N(BTC_meas,BTC_sim)

N=length(BTC_meas(:,1));       % number of observations
C_peak=max(BTC_meas(:,2));     % Concentration peak

clear nRMSE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Objective function -> RMSE and nRMSE
ssd=(BTC_sim-BTC_meas(:,2)).^2;   % squared differences (simulated vs observed)

RMSE=(sum(ssd)/N)^(1/2);    % Root mean squared error for every simulated BTC
nRMSE=RMSE/C_peak;          % normalized RMSE
