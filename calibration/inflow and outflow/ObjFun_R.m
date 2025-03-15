function nRMSE = ObjFun_R(Rn_down,Rn_sim)

N=1;       % number of observations
C_peak=max(Rn_down);     % Concentration peak

clear nRMSE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Objective function -> RMSE and nRMSE
ssd=(Rn_sim-Rn_down)^2;   % squared differences (simulated vs observed)


RMSE=(ssd/N)^(1/2);    % Root mean squared error for every simulated BTC
nRMSE=RMSE/C_peak;          % normalized RMSE

end
