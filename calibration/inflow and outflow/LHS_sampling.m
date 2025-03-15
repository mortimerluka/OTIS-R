
function [OTIS_hypercube_input] = LHS_sampling(L,dx,OOO,Description1,...
    dt,n,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI)

% preallocate OTIS_hypercube_input
clear OTIS_hypercube_input
OTIS_hypercube_input=zeros(n,4);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %                       
% %  _           _   _         _                                     _          
% % | |         | | (_)       | |                                   | |         
% % | |     __ _| |_ _ _ __   | |__  _   _ _ __   ___ _ __ ___ _   _| |__   ___ 
% % | |    / _` | __| | '_ \  | '_ \| | | | '_ \ / _ \ '__/ __| | | | '_ \ / _ \
% % | |___| (_| | |_| | | | | | | | | |_| | |_) |  __/ | | (__| |_| | |_) |  __/
% % |______\__,_|\__|_|_| |_| |_| |_|\__, | .__/ \___|_|  \___|\__,_|_.__/ \___|
% %                                   __/ | |                                   
% %                                  |___/|_|                                                          
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %                          

%% Latin Hypercube sampling considering D, As, Alpha and qI

% Let's build the latin hypercube
NN=n;

% parameter ranges sampled
Dmin=1e-5; % dispersion (independent of solute)
Dmax=10;
Alphamin=1e-5; % alpha NaCl
Alphamax=0.1;
A2min=1e-5; % cross-sectional storage area Radon         
A2max=100;
dQL = (OOO.Q_down-OOO.Q_up)/L;
if dQL > 1e-16
    qImin=dQL;
else
    qImin=1e-7;
end
qImax=1e-4;

min_ranges= [log10(Dmin); log10(Alphamin); log10(A2min); log10(qImin)];     % Min values acceptable for D, Alpha, A2, depth
max_ranges= [log10(Dmax); log10(Alphamax); log10(A2max); log10(qImax)];     % Max values acceptable for D, Alpha, A2, depth
p=length(min_ranges);         
 
slope=max_ranges-min_ranges;
offset=min_ranges;
SLOPE=ones(NN,p);
OFFSET=ones(NN,p);
for i=1:p
    SLOPE(:,i)=ones(NN,1).*slope(i);
    OFFSET(:,i)=ones(NN,1).*offset(i);
end
X_normalized = lhsdesign(NN,p);        % this one builds latin hypercube in [0 1] interval
X_scaled=SLOPE.*X_normalized+OFFSET;   % this one modify the [0 1] latin hypercube in the
                                       % latin hypercube of our parameters
OTIS_hypercube_input(:,1)=10.^X_scaled(:,1);    % DISP [m^2/s]
OTIS_hypercube_input(:,2)=10.^X_scaled(:,2);    % ALPHA [1/s] 
OTIS_hypercube_input(:,3)=10.^X_scaled(:,3);    % AREA TRANS STORAGE [m^2] 
OTIS_hypercube_input(:,4)=10.^X_scaled(:,4);    % GW inflow [m^3/s/m]


save('Output_files_OTISR/LHS_sampling.mat','OTIS_hypercube_input','OOO',...
    'L','dx','Description1','dt','n',...
    'NaCl_up','NaCl_down','Rn_up','Rn_down','Rn_down_95CI');

end

