function [] = behavioral(OTIS_hypercube_input,...
    Description1,Data,Instate,OOO,L,n,...
    NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI)
    
%% Create Order working matrices
clear Working_matrix
Working_matrix=OTIS_hypercube_input;
    % Working_matrix(:,1) - D (dispersion)
    % Working_matrix(:,2) - Alpha (exchange coefficient hyporheic zone -
    % stream)
    % Working_matrix(:,3) - A_H (cross-sectional area hyporheic zone)
    % Working_matrix(:,4) - q_I (GW inflow)

    Working_matrix(:,5)=Data.nRMSE_N(:,1);     % nRMSE NaCl
    OWm_N=sortrows(Working_matrix,5);   % Hyperspace sorted depending on nRMSE value of NaCl
    Working_matrix(:,5)=Data.nRMSE_R290(:,1);  % nRMSE Rn at k600=290d^-1
    OWm_R290=sortrows(Working_matrix,5);   % Hyperspace sorted depending on nRMSE value of Rn
    Working_matrix(:,5)=Data.nRMSE_R206(:,1);  % nRMSE Rn at k600=206d^-1
    OWm_R206=sortrows(Working_matrix,5);   % Hyperspace sorted depending on nRMSE value of Rn


%% extract behavioral parameter sets
% Behavioral threshold, here top 1% of results
top1perc = n*0.01;
top1_N = OWm_N(1:top1perc,:);
top1_R290 = OWm_R290(1:top1perc,:);
top1_R206 = OWm_R206(1:top1perc,:);
top1_b_290 = intersect(top1_N(:,1:4),top1_R290(:,1:4),'rows');
top1_b_206 = intersect(top1_N(:,1:4),top1_R206(:,1:4),'rows');

%% compute breakthrough curves for top 1% of results
wbhandle=waitbar(0,'Building the top 1% BTC. Please wait.');

TEMP_BTC_N=zeros(length(NaCl_down(:,1)),top1perc);
TEMP_BTC_R290=zeros(top1perc,1);
TEMP_BTC_R206=zeros(top1perc,1);

for i = 1:top1perc         
%Run OTIS-R for i-th parameter set

% NaCl
Model_N=OTIS_run_N(Instate,i,top1_N,OOO.OSFLAG);
Sim_N = interp1(Model_N.ttime,Model_N.conc_Channel,NaCl_down(:,1));
TEMP_BTC_N(:,i)=Sim_N;
clear Model_N Sim_N

% Radon for k600=290d^-1
Instate.k2=OOO.k2_290;
Model_R=OTIS_run_R(Instate,i,top1_R290,OOO.OSFLAG);
Sim_R = interp1(Model_R.xdistance,Model_R.conc_Channel,L);
TEMP_BTC_R290(i)=Sim_R;
clear Model_R Sim_R

% Radon for k600=206d^-1
Instate.k2=OOO.k2_206;
Model_R=OTIS_run_R(Instate,i,top1_R206,OOO.OSFLAG);
Sim_R = interp1(Model_R.xdistance,Model_R.conc_Channel,L);
TEMP_BTC_R206(i)=Sim_R;
clear Model_R Sim_R

% progress with the waitbar
waitbar(i / top1perc)
end

close(wbhandle)

%% extract the non-behavioral parameter sets
low99perc=top1perc+1;
low99_N = OWm_N(low99perc:end,:);
low99_R290 = OWm_R290(low99perc:end,:);
low99_R206 = OWm_R206(low99perc:end,:);


save('Output_files_OTISR/OTIS_results.mat','Data','OOO',...
    'Description1','L','n','OWm_N','OWm_R290','OWm_R206',...
    'Instate','TEMP_BTC_N',...
    'TEMP_BTC_R290','TEMP_BTC_R206',...
    'NaCl_up','NaCl_down',...
    'Rn_up','Rn_down','Rn_down_95CI','top1_N','top1_R290','top1_R206',...
    'top1_b_290',...
    'top1_b_206','low99_N',...
    'low99_R290','low99_R206');


