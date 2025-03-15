%%% Radon data Oak Creek


%% Groundwater endmember concentration

Rn_GW = [7385,6115,7712,6859,6006,5698,5807,6750,8565,7077,6442];
Rn_GW_mean = mean(Rn_GW);
Rn_GW_std = std(Rn_GW);

%% measured concentrations along the stream

Rn1_meas = [243,297,324];
Rn1 = mean(Rn1_meas);
Rn2 = 285;
Rn3_meas = [291,288];
Rn3 = mean(Rn3_meas);
Rn4_meas = [354,320];
Rn4 = mean(Rn4_meas);
Rn5 = 325;

%% time seires SS6

load('Radon_timeseries_SS6.mat');
Rn6_meas = M.("Rn_water [Bq/m³]");
clear M

Rn6 = mean(Rn6_meas);       % mean of sampling site 6
Rn6_std = std(Rn6_meas);    % standard deviation of SS6
Rn6_95CI = 2*Rn6_std;       % 95% confidence interval of SS6
CI95 = Rn6_95CI/Rn6;        % 95% CI percentage

%% 95% CI for all sampling sites

Rn1_95CI = Rn1*CI95;
Rn2_95CI = Rn2*CI95;
Rn3_95CI = Rn3*CI95;
Rn4_95CI = Rn4*CI95;
Rn5_95CI = Rn5*CI95;

%% save all mean and 95% CI
% save([pwd,'/Radon_data.mat'],'Rn_GW_mean','Rn1','Rn2','Rn3','Rn4','Rn5','Rn6',...
    % 'Rn1_95CI','Rn2_95CI','Rn3_95CI','Rn4_95CI','Rn5_95CI','Rn6_95CI');
