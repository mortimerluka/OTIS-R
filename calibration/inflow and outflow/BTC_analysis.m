% Code name: BTC_analysis  
% Author: Mortimer Luka Bacher (modified after Bonnano et al (2022) and Ward et al (2017))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%% Reach 1
clear variables
close all
clc
% load NaCl data
mydir  = pwd;
Folder = fullfile(mydir,'NaCl BTCs');
load(fullfile(Folder,'NaClReach1.mat'));
load(fullfile(Folder,'NaClReach1_Flow.mat'));
clear mydir Folder

NaCl_down = CL1_up_down; % downstream NaCl BTC [g/m^3] (calibrated against)
NaCl_up = CL1_up_up; % upstream NaCl BTC (used as upstream b.c.)

L = L1; % reach length [m]
OOO.Q_up = Q1_up; % upstream discharge [m^3/s]
OOO.Q_down = Q1_down; % downstream discharge [m^3/s]
OOO.v = v1; % stream velocity [m/s]

% load Rn data
% Import Rn Data [Bq/m3]
load('Radon_data.mat');

Rn_down = Rn1; % radon activity [Bq/m^3] at downstream boundary
Rn_down_95CI = Rn1_95CI; % 95% CI of downstream ardon activity
Rn_up = Rn2; % radon activity at upstream boundary

n=200000; % number of sampled parameter sets

Description1='Reach 1';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dt=5;          % Time step to be used in the calculation [s]
dx=0.5;        % Spatial step to be used in the calculation [m] 
%
OOO.PRTOPT=1;   % Format of solute output files (1=main channel only, 2=main channel and storage zone)
%               % change OTIS_run accordingly if PRTOPT=2
%               
% Discharge parameters
OOO.CLATIN=[0,Rn_GW_mean]; % lateral inflow C_I for the reach (same unit as conc./activity)
% reactive parameters 
OOO.LAMBDA=[0,2.08E-6];  % in-stream first order decay [s^-1]
OOO.LAMBDA2=[0,2.08E-6]; % storage zone first order decay [s^-1]
OOO.PRODUCTION=OOO.LAMBDA.*OOO.CLATIN; % production in storage zone [for radon: Bq/(m3 s)]

OOO.OSFLAG=2; % equal to 1 for Windows; Equal to 2 for UNIX/LINUX 
              % requires compilation of system compatible OTIS-R code

%% Gas exchange
Tmeas = 17.8; % measured temperature
Sc_Rn = 2939-173.87*Tmeas+4.532*Tmeas^2-0.0468*Tmeas^3; % Schmidt number for radon

% gas exchange coefficient in sec^-1
OOO.k2_290 = ((Sc_Rn/600)^(-0.5)*290)/86400; % for k600=290d^-1
OOO.k2_206 = ((Sc_Rn/600)^(-0.5)*206)/86400; % for k600=206d^-1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Output Folder

if exist('Output_files_OTISR','dir')==0
               mkdir('Output_files_OTISR')
end

%% Check courant condition
Courant=(OOO.v*dt)/dx;
if Courant>1
        msg = 'Courant>1. Increase dx or decrease dt.';
        error(msg)
end

%% sample parameter sets
tic
[~] = LHS_sampling(L,dx,OOO,Description1,...
    dt,n,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% run Model with sampled parameter sets and calculate Obj Fun
clear variables
load('Output_files_OTISR/LHS_sampling.mat')
tic
[~,~] = OTIS_MonteCarlo(L,dx,OOO,Description1,...
    dt,OTIS_hypercube_input,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% calculate top results
clear variables
load('Output_files_OTISR/OTIS_results_MC.mat')
tic
behavioral(OTIS_hypercube_input,...
    Description1,Data,Instate,OOO,L,n,...
    NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% rename folder for reach 5

movefile Output_files_OTISR R1Output_files_OTISR_Outflow_narrowAH




%% Reach 5
clear variables
close all
clc
% load NaCl data
mydir  = pwd;
Folder = fullfile(mydir,'NaCl BTCs');
load(fullfile(Folder,'NaClReach5.mat'));
load(fullfile(Folder,'NaClReach5_Flow.mat'));
clear mydir Folder

NaCl_down = CL5_up_down; % downstream NaCl BTC [g/m^3] (calibrated against)
NaCl_up = CL5_up_up; % upstream NaCl BTC (used as upstream b.c.)

L = L5; % reach length [m]
OOO.Q_up = Q5_up; % upstream discharge [m^3/s]
OOO.Q_down = Q5_down; % downstream discharge [m^3/s]
OOO.v = v5; % stream velocity [m/s]

% load Rn data
% Import Rn Data [Bq/m3]
load('Radon_data.mat');

Rn_down = Rn5; % radon activity [Bq/m^3] at downstream boundary
Rn_down_95CI = Rn5_95CI; % 95% CI of downstream ardon activity
Rn_up = Rn6; % radon activity at upstream boundary

n=200000; % number of sampled parameter sets

Description1='Reach 5';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dt=5;          % Time step to be used in the calculation [s]
dx=0.5;        % Spatial step to be used in the calculation [m] 
%
OOO.PRTOPT=1;   % Format of solute output files (1=main channel only, 2=main channel and storage zone)
%               % change OTIS_run accordingly if PRTOPT=2
%               
% Discharge parameters
OOO.CLATIN=[0,Rn_GW_mean]; % lateral inflow C_I for the reach (same unit as conc./activity)
% reactive parameters 
OOO.LAMBDA=[0,2.08E-6];  % in-stream first order decay [s^-1]
OOO.LAMBDA2=[0,2.08E-6]; % storage zone first order decay [s^-1]
OOO.PRODUCTION=OOO.LAMBDA.*OOO.CLATIN; % production in storage zone [for radon: Bq/(m3 s)]

OOO.OSFLAG=2; % equal to 1 for Windows; Equal to 2 for UNIX/LINUX 
              % requires compilation of system compatible OTIS-R code

%% Gas exchange
Tmeas = 17.8; % measured temperature
Sc_Rn = 2939-173.87*Tmeas+4.532*Tmeas^2-0.0468*Tmeas^3; % Schmidt number for radon

% gas exchange coefficient in sec^-1
OOO.k2_290 = ((Sc_Rn/600)^(-0.5)*290)/86400; % for k600=290d^-1
OOO.k2_206 = ((Sc_Rn/600)^(-0.5)*206)/86400; % for k600=206d^-1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Output Folder

if exist('Output_files_OTISR','dir')==0
               mkdir('Output_files_OTISR')
end

%% Check courant condition
Courant=(OOO.v*dt)/dx;
if Courant>1
        msg = 'Courant>1. Increase dx or decrease dt.';
        error(msg)
end

%% sample parameter sets
tic
[~] = LHS_sampling(L,dx,OOO,Description1,...
    dt,n,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% run Model with sampled parameter sets and calculate Obj Fun
clear variables
load('Output_files_OTISR/LHS_sampling.mat')
tic
[~,~] = OTIS_MonteCarlo(L,dx,OOO,Description1,...
    dt,OTIS_hypercube_input,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% calculate top results
clear variables
load('Output_files_OTISR/OTIS_results_MC.mat')
tic
behavioral(OTIS_hypercube_input,...
    Description1,Data,Instate,OOO,L,n,...
    NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% rename folder for reach 5

movefile Output_files_OTISR R5Output_files_OTISR_Outflow


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% Reach 3
clear variables
close all
clc
% load NaCl data
mydir  = pwd;
Folder = fullfile(mydir,'NaCl BTCs');
load(fullfile(Folder,'NaClReach3.mat'));
load(fullfile(Folder,'NaClReach3_Flow.mat'));
clear mydir Folder

NaCl_down = CL3_up_down; % downstream NaCl BTC [g/m^3] (calibrated against)
NaCl_up = CL3_up_up; % upstream NaCl BTC (used as upstream b.c.)

L = L3; % reach length [m]
OOO.Q_up = Q3_up; % upstream discharge [m^3/s]
OOO.Q_down = Q3_down; % downstream discharge [m^3/s]
OOO.v = v3; % stream velocity [m/s]

% load Rn data
% Import Rn Data [Bq/m3]
load('Radon_data.mat');

Rn_down = Rn3; % radon activity [Bq/m^3] at downstream boundary
Rn_down_95CI = Rn3_95CI; % 95% CI of downstream ardon activity
Rn_up = Rn4; % radon activity at upstream boundary

n=200000; % number of sampled parameter sets

Description1='Reach 3';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dt=5;          % Time step to be used in the calculation [s]
dx=0.5;        % Spatial step to be used in the calculation [m] 
%
OOO.PRTOPT=1;   % Format of solute output files (1=main channel only, 2=main channel and storage zone)
%               % change OTIS_run accordingly if PRTOPT=2
%               
% Discharge parameters
OOO.CLATIN=[0,Rn_GW_mean]; % lateral inflow C_I for the reach (same unit as conc./activity)
% reactive parameters 
OOO.LAMBDA=[0,2.08E-6];  % in-stream first order decay [s^-1]
OOO.LAMBDA2=[0,2.08E-6]; % storage zone first order decay [s^-1]
OOO.PRODUCTION=OOO.LAMBDA.*OOO.CLATIN; % production in storage zone [for radon: Bq/(m3 s)]

OOO.OSFLAG=2; % equal to 1 for Windows; Equal to 2 for UNIX/LINUX 
              % requires compilation of system compatible OTIS-R code

%% Gas exchange
Tmeas = 17.8; % measured temperature
Sc_Rn = 2939-173.87*Tmeas+4.532*Tmeas^2-0.0468*Tmeas^3; % Schmidt number for radon

% gas exchange coefficient in sec^-1
OOO.k2_290 = ((Sc_Rn/600)^(-0.5)*290)/86400; % for k600=290d^-1
OOO.k2_206 = ((Sc_Rn/600)^(-0.5)*206)/86400; % for k600=206d^-1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Output Folder

if exist('Output_files_OTISR','dir')==0
               mkdir('Output_files_OTISR')
end

%% Check courant condition
Courant=(OOO.v*dt)/dx;
if Courant>1
        msg = 'Courant>1. Increase dx or decrease dt.';
        error(msg)
end

%% sample parameter sets
tic
[~] = LHS_sampling(L,dx,OOO,Description1,...
    dt,n,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% run Model with sampled parameter sets and calculate Obj Fun
clear variables
load('Output_files_OTISR/LHS_sampling.mat')
tic
[~,~] = OTIS_MonteCarlo(L,dx,OOO,Description1,...
    dt,OTIS_hypercube_input,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% calculate top results
clear variables
load('Output_files_OTISR/OTIS_results_MC.mat')
tic
behavioral(OTIS_hypercube_input,...
    Description1,Data,Instate,OOO,L,n,...
    NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% rename folder for reach 3

movefile Output_files_OTISR R3Output_files_OTISR_Outflow




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% Reach 4
clear variables
close all
clc
% load NaCl data
mydir  = pwd;
Folder = fullfile(mydir,'NaCl BTCs');
load(fullfile(Folder,'NaClReach4.mat'));
load(fullfile(Folder,'NaClReach4_Flow.mat'));
clear mydir Folder

NaCl_down = CL4_up_down; % downstream NaCl BTC [g/m^3] (calibrated against)
NaCl_up = CL4_up_up; % upstream NaCl BTC (used as upstream b.c.)

L = L4; % reach length [m]
OOO.Q_up = Q4_up; % upstream discharge [m^3/s]
OOO.Q_down = Q4_down; % downstream discharge [m^3/s]
OOO.v = v4; % stream velocity [m/s]

% load Rn data
% Import Rn Data [Bq/m3]
load('Radon_data.mat');

Rn_down = Rn4; % radon activity [Bq/m^3] at downstream boundary
Rn_down_95CI = Rn4_95CI; % 95% CI of downstream ardon activity
Rn_up = Rn5; % radon activity at upstream boundary

n=200000; % number of sampled parameter sets

Description1='Reach 4';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dt=5;          % Time step to be used in the calculation [s]
dx=0.5;        % Spatial step to be used in the calculation [m] 
%
OOO.PRTOPT=1;   % Format of solute output files (1=main channel only, 2=main channel and storage zone)
%               % change OTIS_run accordingly if PRTOPT=2
%               
% Discharge parameters
OOO.CLATIN=[0,Rn_GW_mean]; % lateral inflow C_I for the reach (same unit as conc./activity)
% reactive parameters 
OOO.LAMBDA=[0,2.08E-6];  % in-stream first order decay [s^-1]
OOO.LAMBDA2=[0,2.08E-6]; % storage zone first order decay [s^-1]
OOO.PRODUCTION=OOO.LAMBDA.*OOO.CLATIN; % production in storage zone [for radon: Bq/(m3 s)]

OOO.OSFLAG=2; % equal to 1 for Windows; Equal to 2 for UNIX/LINUX 
              % requires compilation of system compatible OTIS-R code

%% Gas exchange
Tmeas = 17.8; % measured temperature
Sc_Rn = 2939-173.87*Tmeas+4.532*Tmeas^2-0.0468*Tmeas^3; % Schmidt number for radon

% gas exchange coefficient in sec^-1
OOO.k2_290 = ((Sc_Rn/600)^(-0.5)*290)/86400; % for k600=290d^-1
OOO.k2_206 = ((Sc_Rn/600)^(-0.5)*206)/86400; % for k600=206d^-1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Output Folder

if exist('Output_files_OTISR','dir')==0
               mkdir('Output_files_OTISR')
end

%% Check courant condition
Courant=(OOO.v*dt)/dx;
if Courant>1
        msg = 'Courant>1. Increase dx or decrease dt.';
        error(msg)
end

%% sample parameter sets
tic
[~] = LHS_sampling(L,dx,OOO,Description1,...
    dt,n,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% run Model with sampled parameter sets and calculate Obj Fun
clear variables
load('Output_files_OTISR/LHS_sampling.mat')
tic
[~,~] = OTIS_MonteCarlo(L,dx,OOO,Description1,...
    dt,OTIS_hypercube_input,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% calculate top results
clear variables
load('Output_files_OTISR/OTIS_results_MC.mat')
tic
behavioral(OTIS_hypercube_input,...
    Description1,Data,Instate,OOO,L,n,...
    NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% rename folder for reach 4

movefile Output_files_OTISR R4Output_files_OTISR_Outflow




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%% Reach 2
clear variables
close all
clc
% load NaCl data
mydir  = pwd;
Folder = fullfile(mydir,'NaCl BTCs');
load(fullfile(Folder,'NaClReach2.mat'));
load(fullfile(Folder,'NaClReach2_Flow.mat'));
clear mydir Folder

NaCl_down = CL2_up_down; % downstream NaCl BTC [g/m^3] (calibrated against)
NaCl_up = CL2_up_up; % upstream NaCl BTC (used as upstream b.c.)

L = L2; % reach length [m]
OOO.Q_up = Q2_up; % upstream discharge [m^3/s]
OOO.Q_down = Q2_down; % downstream discharge [m^3/s]
OOO.v = v2; % stream velocity [m/s]

% load Rn data
% Import Rn Data [Bq/m3]
load('Radon_data.mat');

Rn_down = Rn2; % radon activity [Bq/m^3] at downstream boundary
Rn_down_95CI = Rn2_95CI; % 95% CI of downstream ardon activity
Rn_up = Rn3; % radon activity at upstream boundary

n=200000; % number of sampled parameter sets

Description1='Reach 2';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dt=5;          % Time step to be used in the calculation [s]
dx=0.5;        % Spatial step to be used in the calculation [m] 
%
OOO.PRTOPT=1;   % Format of solute output files (1=main channel only, 2=main channel and storage zone)
%               % change OTIS_run accordingly if PRTOPT=2
%               
% Discharge parameters
OOO.CLATIN=[0,Rn_GW_mean]; % lateral inflow C_I for the reach (same unit as conc./activity)
% reactive parameters 
OOO.LAMBDA=[0,2.08E-6];  % in-stream first order decay [s^-1]
OOO.LAMBDA2=[0,2.08E-6]; % storage zone first order decay [s^-1]
OOO.PRODUCTION=OOO.LAMBDA.*OOO.CLATIN; % production in storage zone [for radon: Bq/(m3 s)]

OOO.OSFLAG=2; % equal to 1 for Windows; Equal to 2 for UNIX/LINUX 
              % requires compilation of system compatible OTIS-R code

%% Gas exchange
Tmeas = 17.8; % measured temperature
Sc_Rn = 2939-173.87*Tmeas+4.532*Tmeas^2-0.0468*Tmeas^3; % Schmidt number for radon

% gas exchange coefficient in sec^-1
OOO.k2_290 = ((Sc_Rn/600)^(-0.5)*290)/86400; % for k600=290d^-1
OOO.k2_206 = ((Sc_Rn/600)^(-0.5)*206)/86400; % for k600=206d^-1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Output Folder

if exist('Output_files_OTISR','dir')==0
               mkdir('Output_files_OTISR')
end

%% Check courant condition
Courant=(OOO.v*dt)/dx;
if Courant>1
        msg = 'Courant>1. Increase dx or decrease dt.';
        error(msg)
end

%% sample parameter sets
tic
[~] = LHS_sampling(L,dx,OOO,Description1,...
    dt,n,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% run Model with sampled parameter sets and calculate Obj Fun
clear variables
load('Output_files_OTISR/LHS_sampling.mat')
tic
[~,~] = OTIS_MonteCarlo(L,dx,OOO,Description1,...
    dt,OTIS_hypercube_input,NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% calculate top results
clear variables
load('Output_files_OTISR/OTIS_results_MC.mat')
tic
behavioral(OTIS_hypercube_input,...
    Description1,Data,Instate,OOO,L,n,...
    NaCl_up,NaCl_down,Rn_up,Rn_down,Rn_down_95CI);
toc
%% rename folder for reach 2

movefile Output_files_OTISR R2Output_files_OTISR_Outflow