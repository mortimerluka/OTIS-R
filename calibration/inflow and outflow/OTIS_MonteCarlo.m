function [OTIS_hypercube_input,Data] = OTIS_MonteCarlo(L,dx,OOO,Description1,...
    dt,OTIS_hypercube_input,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI)

OSFLAG=OOO.OSFLAG;

%%%%% Recall the PARAMS.INP format
% #------------------------------
% OTIS Parameter Estimation Input
% #---------------------------------------------------------
% #  PRTOPT					Format of solute output files (1=main channel only, 2=main channel and storage zone)
% #  PSTEP  [hours]			Time interval at which results are printed (check solution integration time step)
% #  TSTEP  [hours]			Integration time step (0=steady state solution, >0=time variable solution)
% #  TSTART [hour]			Simulation start time
% #  TFINAL [hour]			Simulation end time
% #  XSTART [L]				Stream distance at upstream boundary (usaully 0)
% #  DSBOUND [(L/sec)mg/L]	Downstream boundary condition describes conc. gradient at dowstream boundary (usually 0)
% #  NREACH					Number of modeled reachesPrint Option = PRTOPT


dt_h=dt/3600; % convert time step from sec in hours

Instate.PRTOPT=OOO.PRTOPT;  % 1=only stream; 2=stream and TS
Instate.PSTEP=[dt_h,0]; % Print time step in hours
Instate.TSTEP=[dt_h,0]; % calculation time step in hours
Instate.TSTART=0;
Instate.TFINAL=NaCl_down((length(NaCl_down(:,1))),1)*2; % Double the end time
Instate.XSTART=0;
Instate.DSBOUND=0;
Instate.NREACH=1;

% OTIS format for Print information
% #                 Print Information
% #                 for I = 1, NPRINT 
% #
% #  NPRINT		Number of locations along the stream where output is desired
% #  IOPT		Interpolation option for print locations (1=linear interpolation used, 0=nearest upstream segment value used)
% #  PRINTLOC 	Downstream distance to a given print location, repeated NPRINT times (max of 30)   
% #                            

Instate.NPRINT=1;       % We have 1 location
Instate.IOPT=0;
Instate.PRINTLOC=L;     % reach length

% OTIS format for Physical properties
% #              Physical Parameters
% #               for I = 1, NREACH
% # 
% #  NSEG				Number of x-sectional segments within the reach. Max of 5000 (RCLEN/2 seems to work well)
% #  RCHLEN(m)			Reach length   
% #  DISP(m^2/sec)	Dispersion
% #  AREA2(m^2)		Transient storage zone area (must be a non-zero value) 
% #  ALPHA(sec-1)		Transient storage exchange coefficient 

Instate.RCHLEN=round(Instate.PRINTLOC*2.2);
% Make the simulated reach twice(+) as long as your actual reach of
% interest - this keep the d/s boundary condition from having an impact
% on the reach that you are interested in -- common practice in OTIS

%set number of segments for a given reach length and spatial step
Instate.NSEG=round(Instate.RCHLEN/dx);

% OTIS format for Solute properties
% #        Number of Solutes and flags for decay and sorption
% #
% #  NSOLUTE  	Number of solutes (max of 3 for OTIS, 1 for OTIS-P)
% #  IDECAY 	Decay option (0 = OFF)
% #  ISORB 		Sorption option (0 = OFF)
% #  IGASEX     Gas exchange option (0 = OFF)

Instate.NSOLUTE=1;

% Set Decay   
Instate.IDECAY=[0,1];

% Set Sorption 
Instate.ISORB=0;

% Set gas exchange
Instate.IGASEX=[0,1];

% OTIS format for the Boundary conditions
% #         Time-Variable Upstream Boundary Conditions
% #                 for I = 1, NBOUND
% #
% #  NBOUND					Define total number of upstream boundary time steps (max of 200) 
% #  IBOUND					Boundary condition option (1=concentration step profile, 2=flux step profile, 3=concentration continuous profile)
% #  USTIME(hour)				Define each time step (max of 200)    
% #  USBC(mg/l; mg/l m^3/sec) 	Solute concentration values corresponding to each USTIME (units depend on IBOUND)
% #

% NaCl upstream bc
% add zero at USBC at time of simulation start
BTC_up_NaCl = [[0.0,0.0]; NaCl_up];
% add zero at end of BTC if BTC_upstream ends before simulation end
if BTC_up_NaCl(end,1)<Instate.TFINAL
    BTC_up_NaCl=[BTC_up_NaCl;[Instate.TFINAL,0.0]];
end

Instate.NBOUND_N=length(BTC_up_NaCl(:,1));
Instate.IBOUND_N=3;

% Initiate upstream bc
Instate.USTIME_USBC_N=BTC_up_NaCl;

% Rn upstream bc
Instate.NBOUND_R=1;
Instate.IBOUND_R=1;

% Rn upstream conc. at time zero
Instate.USTIME_USBC_R=[0.0,Rn_up];

% Discharge properties
Instate.QSTEP=0.00;
Instate.Qup = OOO.Q_up; % needed for computation with fixed discharge
Instate.Qdown = OOO.Q_down; % needed for computation with fixed discharge

Instate.v=OOO.v;

% reactive properties
Instate.LAMBDA = OOO.LAMBDA;
Instate.LAMBDA2 = OOO.LAMBDA2;
Instate.PRODUCTION = OOO.PRODUCTION;

Instate.CLATIN = OOO.CLATIN;

Instate.DEPTH = 1; % arbitrary value for depth --> not needed for NaCl or Radon
 
n=length(OTIS_hypercube_input(:,1));
%%%   
% Preallocate the objective function for the computed BTC    
    Data.nRMSE_N = zeros(n,1);
    Data.nRMSE_R290 = zeros(n,1);
    Data.nRMSE_R206 = zeros(n,1);

% ged rid of ANYTHING you don't need that might slower the OTIS run
clearvars -except Data Description1 Instate OTIS_hypercube_input ...
    OSFLAG L n dt_h dx OOO dt NaCl_up NaCl_down Rn_up Rn_down Rn_down_95CI

% save the start conditions
save('Output_files_OTISR/Start.mat');

%load('Output_files_OTISR/Start.mat');

wbhandle=waitbar(0,'Completing LatinHypercube OTIS-R simulations. Please wait and cross your fingers.');

% And now the computational pain begins 
for i = 1:n             % i defines every run
    

    %%%%%%%%%%% NaCl %%%%%%%%%%%%%%%%%%%%

    % Run the forward model for parameter set i for NaCl
        Model_N = OTIS_run_N(Instate,i,OTIS_hypercube_input,OSFLAG);

    % Fit OBS the time of the observations with the modelled one
        Sim_N = interp1(Model_N.ttime,Model_N.conc_Channel,NaCl_down(:,1));
          
    % create a temporary file for the function BTC_analysis
        BTC_temp_N=Sim_N(:,1);
  
    % fix possible negative values in the computation
        for ppp=1:1:length(BTC_temp_N)
            if BTC_temp_N(ppp)<1e-16
                BTC_temp_N(ppp)=0.00;
            end
        end

    % Run the ObjFun function for NaCl
        Data.nRMSE_N(i) = ObjFun_N(NaCl_down,BTC_temp_N);
    
    clear Model_N Sim_N BTC_temp_N

    %%%%%%%%%%%%% Radon with k600=290d^-1 %%%%%%%%%

    Instate.k2=OOO.k2_290;
    % Run the forward model for parameter set i for NaCl
        Model_R = OTIS_run_R(Instate,i,OTIS_hypercube_input,OSFLAG);

    % Fit OBS the time of the observations with the modelled one
        Sim_R = interp1(Model_R.xdistance,Model_R.conc_Channel,L);
    
    % get rid of negative values
        if Sim_R<1e-16
            Sim_R=0.00;
        end

    % Run ObjFun function for Rn
        Data.nRMSE_R290(i) = ObjFun_R(Rn_down,Sim_R);
    
    clear Model_R Sim_R

    %%%%%%%%%%%%% Radon with k600=206d^-1 %%%%%%%%%

    Instate.k2=OOO.k2_206;
    % Run the forward model for parameter set i for NaCl
        Model_R = OTIS_run_R(Instate,i,OTIS_hypercube_input,OSFLAG);

    % Fit OBS the time of the observations with the modelled one
        Sim_R = interp1(Model_R.xdistance,Model_R.conc_Channel,L);
    
    % get rid of negative values
        if Sim_R<1e-16
            Sim_R=0.00;
        end

    % Run ObjFun function for Rn
        Data.nRMSE_R206(i) = ObjFun_R(Rn_down,Sim_R);

    clear Model_R Sim_R
        
    % progress with the waitbar
        waitbar(i / n) 
end    

close(wbhandle)

save('Output_files_OTISR/OTIS_results_MC.mat','OTIS_hypercube_input',...
    'Description1','Data','Instate','OSFLAG','n','OOO','dt','dx','L',...
   'NaCl_up','NaCl_down','Rn_up','Rn_down','Rn_down_95CI')

end

