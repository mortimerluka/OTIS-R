%%% Oak Creek NaCl Data overview

close all
clear all
clc

%% EC to Cl- conc. for Divers

% slope
m1=0.6447; %Diver2 (SS1)
m2=0.5837; %Diver1 (SS2)
m3=0.5923; %Diver SS3
m4=0.5478; %Diver SS4
m5=0.5729; %Diver SS5
m6=0.5329; %Diver SS6

% length
L1=80.5;
L2=67;
L3=140;
L4=92;
L5=112;


mydir  = pwd;
Folder = fullfile(mydir,'NaCl BTCs');

%% Reach 1:

% measured EC
EC1_meas_up_up = readmatrix('Reach_1.xlsx','Sheet','Data','Range','J5:J5996'); % "measured" Cl up inj, up meas (mS/cm), diver 1
EC1_meas_up_down = readmatrix('Reach_1.xlsx','Sheet','Data','Range','N5:N5996'); % "measured" Cl up inj, down meas (mS/cm), diver 2
EC1_meas_down_down = readmatrix('Reach_1.xlsx','Sheet','Data','Range','E5:E1361'); % "measured" Cl down inj, down meas (mS/cm), diver 2

% injected mass (g of Cl-)
m_up1=readmatrix('Reach_1.xlsx','Sheet','Data','Range','F5:F5')*0.6067;
m_down1=readmatrix('Reach_1.xlsx','Sheet','Data','Range','A5:A5')*0.6067;
% 
% % background EC
% bEC1_up_up=readmatrix('Reach_1.xlsx','Sheet','Data','Range','H5:H5');
% bEC1_up_down=readmatrix('Reach_1.xlsx','Sheet','Data','Range','L5:L5');
% bEC1_down_down=readmatrix('Reach_1.xlsx','Sheet','Data','Range','C5:C5');
% 
% % time
% t1_start_up=readmatrix('Reach_1.xlsx','Sheet','Data','Range','I5:I5'); % start time upstream injection
% t1_start_down=readmatrix('Reach_1.xlsx','Sheet','Data','Range','D5:D5'); % start time downstream injection
% ts1 = 5; %time step set during experiment (s)
% ts1_d = ts1/(3600*24); %time step set during experiment (d)
% time1_real_up = (t1_start_up:ts1_d:(length(EC1_meas_up_up)-1)*ts1_d+t1_start_up)'; % time for upstream injection
% time1_real_down = (t1_start_down:ts1_d:(length(EC1_meas_down_down)-1)*ts1_d+t1_start_down)'; % time for downstream injection
% time1_sec_up = (0:ts1:(length(EC1_meas_up_up)-1)*ts1)'; % time in sec after start of experiment (upstream)
% time1_sec_down = (0:ts1:(length(EC1_meas_down_down)-1)*ts1)'; % time in sec after start of experiment (downstream)
% 
% % EC --> Conc. (of Cl- in g/m3)
% CL1_meas_up_up = (m2.*EC1_meas_up_up - m2*bEC1_up_up).*0.6067.*1000;
% CL1_meas_up_down = (m1.*EC1_meas_up_down - m1*bEC1_up_down).*0.6067.*1000;
% CL1_meas_down_down = (m1.*EC1_meas_down_down - m1*bEC1_down_down).*0.6067.*1000;
% 
% % convert NaN values and valuues smaller 0 in BTC to zero
% CL1_meas_up_up(isnan(CL1_meas_up_up)|CL1_meas_up_up<0)=0;
% CL1_meas_up_down(isnan(CL1_meas_up_down)|CL1_meas_up_down<0)=0;
% CL1_meas_down_down(isnan(CL1_meas_down_down)|CL1_meas_down_down<0)=0;
% 
% % conversion of BTCs (time in hr)
% CL1_up_up = conversion(time1_sec_up,CL1_meas_up_up);
% CL1_up_down = conversion(time1_sec_up,CL1_meas_up_down);
% CL1_down_down = conversion(time1_sec_down,CL1_meas_down_down);
% 
% % add time column (s) to measured concentration
% CL1_meas_up_up = [time1_real_up,time1_sec_up,CL1_meas_up_up];
% CL1_meas_up_down = [time1_real_up,time1_sec_up,CL1_meas_up_down];
% CL1_meas_down_down = [time1_real_down,time1_sec_down,CL1_meas_down_down];
% 
% save(fullfile(Folder,'NaClReach1.mat'),'L1','m_up1','m_down1','CL1_down_down','CL1_up_down','CL1_up_up','CL1_meas_down_down','CL1_meas_up_down','CL1_meas_up_up');
% 
% load(fullfile(Folder,'NaClReach1.mat'));
% 
% % calculate flow from measured BTCs
% [v1,Q1_up,Q1_down,qI1,qI1_min,qI1_max,A1,A1min,A1max,Mrec1,fMrec1] = ParamEst_BTC_second(CL1_meas_up_up,CL1_meas_up_down,CL1_meas_down_down,L1,m_up1,m_down1);
% save(fullfile(Folder,'NaClReach1_Flow.mat'),'v1','Q1_up','Q1_down','qI1','A1','A1min','A1max','qI1_min','qI1_max','Mrec1','fMrec1');
% writecell(['v [m/s]',num2cell(v1);'Q_up [m3/s]',num2cell(Q1_up);'Q_down [m3/s]',num2cell(Q1_down);'A [m2]',num2cell(A1);'q_I [m3/(m s)]',num2cell(qI1);'qI_min',num2cell(qI1_min);'qI_max',num2cell(qI1_max);'Mrec_up_down',num2cell(Mrec1);'fMrec_up_down',num2cell(fMrec1)],fullfile(Folder,'NaClReach1_Flow.xlsx'))

% % calculate flow from OTIS input BTCs for comparison
% [v1_O,Q1_O_up,Q1_O_down,qI1_O,qI1_O_min,qI1_O_max,A1_O] = ParamEst_BTC_hour(CL1_up_up,CL1_up_down,CL1_down_down,L1,m_up1,m_down1);
% 
% % Plot
% f = figure('WindowState', 'maximized');
% subplot(2,3,1)
% plot(datetime(CL1_meas_up_up(:,1),"ConvertFrom","excel"),CL1_meas_up_up(:,3),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL1_meas_up_up(1,1),"ConvertFrom","excel"),datetime(CL1_meas_up_up(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,2)
% plot(datetime(CL1_meas_up_down(:,1),"ConvertFrom","excel"),CL1_meas_up_down(:,3),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL1_meas_up_down(1,1),"ConvertFrom","excel"),datetime(CL1_meas_up_down(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,3)
% plot(datetime(CL1_meas_down_down(:,1),"ConvertFrom","excel"),CL1_meas_down_down(:,3),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL1_meas_down_down(1,1),"ConvertFrom","excel"),datetime(CL1_meas_down_down(end,1),"ConvertFrom","excel")])
% title('Measured: downstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,4)
% plot(CL1_up_up(:,1),CL1_up_up(:,2),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL1_meas_up_up(1,2)/3600,CL1_meas_up_up(end,2)/3600])
% title('OTIS input: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,5)
% plot(CL1_up_down(:,1),CL1_up_down(:,2),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL1_meas_up_down(1,2)/3600,CL1_meas_up_down(end,2)/3600])
% title('OTIS input: BTC upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,6)
% plot(CL1_down_down(:,1),CL1_down_down(:,2),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL1_meas_down_down(1,2)/3600,CL1_meas_down_down(end,2)/3600])
% title('OTIS input: downstream inj., downstream meas.','FontSize',14)
% 
% sgtitle("NaCl BTCs reach 1 (L = "+L1+"m)",'FontSize',14)
% 
% saveas(f,fullfile(Folder,'NaClReach1.tif'));
% close(f)

%% Reach 2:

% EC2_meas_up_up = readmatrix('Reach_2.xlsx','Sheet','Data','Range','J5:J3944'); % "measured" Cl up inj, up meas (mS/cm), diver 1
% EC2_meas_up_down = readmatrix('Reach_2.xlsx','Sheet','Data','Range','N5:N3944'); % "measured" Cl up inj, down meas (mS/cm), diver 2
% EC2_meas_down_down = readmatrix('Reach_2.xlsx','Sheet','Data','Range','E5:E648'); % "measured" Cl down inj, down meas (mS/cm), diver 2
% 
% % injected mass (g of Cl-)
% m_up2=readmatrix('Reach_2.xlsx','Sheet','Data','Range','F5:F5')*0.6067;
% m_down2=readmatrix('Reach_2.xlsx','Sheet','Data','Range','A5:A5')*0.6067;
% 
% % background EC
% bEC2_up_up=readmatrix('Reach_2.xlsx','Sheet','Data','Range','H5:H5');
% bEC2_up_down=readmatrix('Reach_2.xlsx','Sheet','Data','Range','L5:L5');
% bEC2_down_down=readmatrix('Reach_2.xlsx','Sheet','Data','Range','C5:C5');
% 
% % time
% t2_start_up=readmatrix('Reach_2.xlsx','Sheet','Data','Range','I5:I5'); % start time upstream injection
% t2_start_down=readmatrix('Reach_2.xlsx','Sheet','Data','Range','D5:D5'); % start time downstream injection
% ts2 = 5; %time step set during experiment (s)
% ts2_d = 5/(3600*24); % time step set during experiment (d)
% time2_real_up = (t2_start_up:ts2_d:(length(EC2_meas_up_up)-1)*ts2_d+t2_start_up)'; % time for upstream injection
% time2_real_down = (t2_start_down:ts2_d:(length(EC2_meas_down_down)-1)*ts2_d+t2_start_down)'; % time for downstream injection
% time2_sec_up = (0:ts2:(length(EC2_meas_up_up)-1)*ts2)'; % time in sec after start of experiment (upstream)
% time2_sec_down = (0:ts2:(length(EC2_meas_down_down)-1)*ts2)'; % time in sec after start of experiment (downstream)
% 
% % EC --> Conc. (of Cl- in g/m3)
% CL2_meas_up_up = (m3.*EC2_meas_up_up - m3*bEC2_up_up).*0.6067.*1000;
% CL2_meas_up_down = (m2.*EC2_meas_up_down - m2*bEC2_up_down).*0.6067.*1000;
% CL2_meas_down_down = (m2.*EC2_meas_down_down - m2*bEC2_down_down).*0.6067.*1000;
% 
% % convert NaN values and values smaller 0 in BTC to zero
% CL2_meas_up_up(isnan(CL2_meas_up_up)|CL2_meas_up_up<0)=0;
% CL2_meas_up_down(isnan(CL2_meas_up_down)|CL2_meas_up_down<0)=0;
% CL2_meas_down_down(isnan(CL2_meas_down_down)|CL2_meas_down_down<0)=0;
% 
% % conversion of BTCs (time in hr)
% CL2_up_up = conversion(time2_sec_up,CL2_meas_up_up);
% CL2_up_down = conversion(time2_sec_up,CL2_meas_up_down);
% CL2_down_down = conversion(time2_sec_down,CL2_meas_down_down);
% 
% % add time column (s) to measured concentration
% CL2_meas_up_up = [time2_real_up,time2_sec_up,CL2_meas_up_up];
% CL2_meas_up_down = [time2_real_up,time2_sec_up,CL2_meas_up_down];
% CL2_meas_down_down = [time2_real_down,time2_sec_down,CL2_meas_down_down];
% 
% save(fullfile(Folder,'NaClReach2.mat'),'L2','m_up2','m_down2','CL2_down_down','CL2_up_down','CL2_up_up','CL2_meas_down_down','CL2_meas_up_down','CL2_meas_up_up');
% 
% load(fullfile(Folder,'NaClReach2.mat'));
% 
% % calculate flow from measured BTCs
% [v2,Q2_up,Q2_down,qI2,qI2_min,qI2_max,A2,A2min,A2max,Mrec2,fMrec2] = ParamEst_BTC_second(CL2_meas_up_up,CL2_meas_up_down,CL2_meas_down_down,L2,m_up2,m_down2);
% save(fullfile(Folder,'NaClReach2_Flow.mat'),'v2','Q2_up','Q2_down','qI2','A2','A2min','A2max','qI2_min','qI2_max','Mrec2','fMrec2');
% writecell(['v [m/s]',num2cell(v2);'Q_up [m3/s]',num2cell(Q2_up);'Q_down [m3/s]',num2cell(Q2_down);'A [m2]',num2cell(A2);'q_I [m3/(m s)]',num2cell(qI2);'qI_min',num2cell(qI2_min);'qI_max',num2cell(qI2_max);'Mrec_up_down',num2cell(Mrec2);'fMrec_up_down',num2cell(fMrec2)],fullfile(Folder,'NaClReach2_Flow.xlsx'))
% 
% % calculate flow from OTIS input BTCs for comparison
% [v2_O,Q2_O_up,Q2_O_down,qI2_O,qI2_O_min,qI2_O_max,A2_O] = ParamEst_BTC_hour(CL2_up_up,CL2_up_down,CL2_down_down,L2,m_up2,m_down2);
% 
% % Plot
% f = figure('WindowState', 'maximized');
% subplot(2,3,1)
% plot(datetime(CL2_meas_up_up(:,1),"ConvertFrom","excel"),CL2_meas_up_up(:,3),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL2_meas_up_up(1,1),"ConvertFrom","excel"),datetime(CL2_meas_up_up(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,2)
% plot(datetime(CL2_meas_up_down(:,1),"ConvertFrom","excel"),CL2_meas_up_down(:,3),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL2_meas_up_down(1,1),"ConvertFrom","excel"),datetime(CL2_meas_up_down(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,3)
% plot(datetime(CL2_meas_down_down(:,1),"ConvertFrom","excel"),CL2_meas_down_down(:,3),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL2_meas_down_down(1,1),"ConvertFrom","excel"),datetime(CL2_meas_down_down(end,1),"ConvertFrom","excel")])
% title('Measured: downstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,4)
% plot(CL2_up_up(:,1),CL2_up_up(:,2),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL2_meas_up_up(1,2)/3600,CL2_meas_up_up(end,2)/3600])
% title('OTIS input: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,5)
% plot(CL2_up_down(:,1),CL2_up_down(:,2),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL2_meas_up_down(1,2)/3600,CL2_meas_up_down(end,2)/3600])
% title('OTIS input: BTC upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,6)
% plot(CL2_down_down(:,1),CL2_down_down(:,2),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL2_meas_down_down(1,2)/3600,CL2_meas_down_down(end,2)/3600])
% title('OTIS input: downstream inj., downstream meas.','FontSize',14)
% 
% sgtitle("NaCl BTCs reach 2 (L = "+L2+"m)",'FontSize',14)
% 
% saveas(f,fullfile(Folder,'NaClReach2.tif'));
% close(f)

%% Reach 3:

% EC3_meas_up_up = readmatrix('Reach_3.xlsx','Sheet','Data','Range','J5:J3640'); % "measured" Cl up inj, up meas (mS/cm), diver 1
% EC3_meas_up_down = readmatrix('Reach_3.xlsx','Sheet','Data','Range','N5:N3640'); % "measured" Cl up inj, down meas (mS/cm), diver 2
% EC3_meas_down_down = readmatrix('Reach_3.xlsx','Sheet','Data','Range','E5:E3944'); % "measured" Cl down inj, down meas (mS/cm), diver 2
% 
% % injected mass (g of Cl-)
% m_up3=readmatrix('Reach_3.xlsx','Sheet','Data','Range','F5:F5')*0.6067;
% m_down3=readmatrix('Reach_3.xlsx','Sheet','Data','Range','A5:A5')*0.6067;
% 
% % background EC
% bEC3_up_up=readmatrix('Reach_3.xlsx','Sheet','Data','Range','H5:H5');
% bEC3_up_down=readmatrix('Reach_3.xlsx','Sheet','Data','Range','L5:L5');
% bEC3_down_down=readmatrix('Reach_3.xlsx','Sheet','Data','Range','C5:C5');
% 
% % time
% t3_start_up=readmatrix('Reach_3.xlsx','Sheet','Data','Range','I5:I5'); % start time upstream injection
% t3_start_down=readmatrix('Reach_3.xlsx','Sheet','Data','Range','D5:D5'); % start time downstream injection
% ts3 = 5; %time step set during experiment (s)
% ts3_d = 5/(3600*24); % time step set during experiment (d)
% time3_real_up = (t3_start_up:ts3_d:(length(EC3_meas_up_up)-1)*ts3_d+t3_start_up)'; % time for upstream injection
% time3_real_down = (t3_start_down:ts3_d:(length(EC3_meas_down_down)-1)*ts3_d+t3_start_down)'; % time for downstream injection
% time3_sec_up = (0:ts3:(length(EC3_meas_up_up)-1)*ts3)'; % time in sec after start of experiment (upstream)
% time3_sec_down = (0:ts3:(length(EC3_meas_down_down)-1)*ts3)'; % time in sec after start of experiment (downstream)
% 
% % EC --> Conc. (of Cl- in g/m3)
% CL3_meas_up_up = (m4.*EC3_meas_up_up - m4*bEC3_up_up).*0.6067.*1000;
% CL3_meas_up_down = (m3.*EC3_meas_up_down - m3*bEC3_up_down).*0.6067.*1000;
% CL3_meas_down_down = (m3.*EC3_meas_down_down - m3*bEC3_down_down).*0.6067.*1000;
% 
% % convert NaN values and values smaller 0 in BTC to zero
% CL3_meas_up_up(isnan(CL3_meas_up_up)|CL3_meas_up_up<0)=0;
% CL3_meas_up_down(isnan(CL3_meas_up_down)|CL3_meas_up_down<0)=0;
% CL3_meas_down_down(isnan(CL3_meas_down_down)|CL3_meas_down_down<0)=0;
% 
% % conversion of BTCs (time in hr)
% CL3_up_up = conversion(time3_sec_up,CL3_meas_up_up);
% CL3_up_down = conversion(time3_sec_up,CL3_meas_up_down);
% CL3_down_down = conversion(time3_sec_down,CL3_meas_down_down);
% 
% % add time column (s) to measured concentration
% CL3_meas_up_up = [time3_real_up,time3_sec_up,CL3_meas_up_up];
% CL3_meas_up_down = [time3_real_up,time3_sec_up,CL3_meas_up_down];
% CL3_meas_down_down = [time3_real_down,time3_sec_down,CL3_meas_down_down];
% 
% save(fullfile(Folder,'NaClReach3.mat'),'L3','m_up3','m_down3','CL3_down_down','CL3_up_down','CL3_up_up','CL3_meas_down_down','CL3_meas_up_down','CL3_meas_up_up');
% 
% load(fullfile(Folder,'NaClReach3.mat'));
% 
% % calculate flow from measured BTCs
% [v3,Q3_up,Q3_down,qI3,qI3_min,qI3_max,A3,A3min,A3max,Mrec3,fMrec3] = ParamEst_BTC_second(CL3_meas_up_up,CL3_meas_up_down,CL3_meas_down_down,L3,m_up3,m_down3);
% save(fullfile(Folder,'NaClReach3_Flow.mat'),'v3','Q3_up','Q3_down','qI3','A3','A3min','A3max','qI3_min','qI3_max','Mrec3','fMrec3');
% writecell(['v [m/s]',num2cell(v3);'Q_up [m3/s]',num2cell(Q3_up);'Q_down [m3/s]',num2cell(Q3_down);'A [m2]',num2cell(A3);'q_I [m3/(m s)]',num2cell(qI3);'qI_min',num2cell(qI3_min);'qI_max',num2cell(qI3_max);'Mrec_up_down',num2cell(Mrec3);'fMrec_up_down',num2cell(fMrec3)],fullfile(Folder,'NaClReach3_Flow.xlsx'))
% 
% % calculate flow from OTIS input BTCs for comparison
% [v3_O,Q3_O_up,Q3_O_down,qI3_O,qI3_O_min,qI3_O_max,A3_O] = ParamEst_BTC_hour(CL3_up_up,CL3_up_down,CL3_down_down,L3,m_up3,m_down3);
% 
% %Plot
% f = figure('WindowState', 'maximized');
% subplot(2,3,1)
% plot(datetime(CL3_meas_up_up(:,1),"ConvertFrom","excel"),CL3_meas_up_up(:,3),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL3_meas_up_up(1,1),"ConvertFrom","excel"),datetime(CL3_meas_up_up(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,2)
% plot(datetime(CL3_meas_up_down(:,1),"ConvertFrom","excel"),CL3_meas_up_down(:,3),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL3_meas_up_down(1,1),"ConvertFrom","excel"),datetime(CL3_meas_up_down(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,3)
% plot(datetime(CL3_meas_down_down(:,1),"ConvertFrom","excel"),CL3_meas_down_down(:,3),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL3_meas_down_down(1,1),"ConvertFrom","excel"),datetime(CL3_meas_down_down(end,1),"ConvertFrom","excel")])
% title('Measured: downstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,4)
% plot(CL3_up_up(:,1),CL3_up_up(:,2),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL3_meas_up_up(1,2)/3600,CL3_meas_up_up(end,2)/3600])
% title('OTIS input: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,5)
% plot(CL3_up_down(:,1),CL3_up_down(:,2),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL3_meas_up_down(1,2)/3600,CL3_meas_up_down(end,2)/3600])
% title('OTIS input: BTC upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,6)
% plot(CL3_down_down(:,1),CL3_down_down(:,2),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL3_meas_down_down(1,2)/3600,CL3_meas_down_down(end,2)/3600])
% title('OTIS input: downstream inj., downstream meas.','FontSize',14)
% 
% sgtitle("NaCl BTCs reach 3 (L = "+L3+"m)",'FontSize',14)
% 
% saveas(f,fullfile(Folder,'NaClReach3.tif'));
% close(f)
 
%% Reach 4:

% EC4_meas_up_up = readmatrix('Reach_4.xlsx','Sheet','Data','Range','J5:J5734'); % "measured" Cl up inj, up meas (mS/cm), diver 1
% EC4_meas_up_down = readmatrix('Reach_4.xlsx','Sheet','Data','Range','N5:N5734'); % "measured" Cl up inj, down meas (mS/cm), diver 2
% EC4_meas_down_down = readmatrix('Reach_4.xlsx','Sheet','Data','Range','E5:E1292'); % "measured" Cl down inj, down meas (mS/cm), diver 2
% 
% % injected mass (g of Cl-)
% m_up4=readmatrix('Reach_4.xlsx','Sheet','Data','Range','F5:F5')*0.6067;
% m_down4=readmatrix('Reach_4.xlsx','Sheet','Data','Range','A5:A5')*0.6067;
% 
% % background EC
% bEC4_up_up=readmatrix('Reach_4.xlsx','Sheet','Data','Range','H5:H5');
% bEC4_up_down=readmatrix('Reach_4.xlsx','Sheet','Data','Range','L5:L5');
% bEC4_down_down=readmatrix('Reach_4.xlsx','Sheet','Data','Range','C5:C5');
% 
% % time
% t4_start_up=readmatrix('Reach_4.xlsx','Sheet','Data','Range','I5:I5'); % start time upstream injection
% t4_start_down=readmatrix('Reach_4.xlsx','Sheet','Data','Range','D5:D5'); % start time downstream injection
% ts4 = 5; %time step set during experiment (s)
% ts4_d = 5/(3600*24); % time step set during experiment (d)
% time4_real_up = (t4_start_up:ts4_d:(length(EC4_meas_up_up)-1)*ts4_d+t4_start_up)'; % time for upstream injection
% time4_real_down = (t4_start_down:ts4_d:(length(EC4_meas_down_down)-1)*ts4_d+t4_start_down)'; % time for downstream injection
% time4_sec_up = (0:ts4:(length(EC4_meas_up_up)-1)*ts4)'; % time in sec after start of experiment (upstream)
% time4_sec_down = (0:ts4:(length(EC4_meas_down_down)-1)*ts4)'; % time in sec after start of experiment (downstream)
% 
% % EC --> Conc. (of Cl- in g/m3)
% CL4_meas_up_up = (m5.*EC4_meas_up_up - m5*bEC4_up_up).*0.6067.*1000;
% CL4_meas_up_down = (m4.*EC4_meas_up_down - m4*bEC4_up_down).*0.6067.*1000;
% CL4_meas_down_down = (m4.*EC4_meas_down_down - m4*bEC4_down_down).*0.6067.*1000;
% 
% % convert NaN values and values smaller 0 in BTC to zero
% CL4_meas_up_up(isnan(CL4_meas_up_up)|CL4_meas_up_up<0)=0;
% CL4_meas_up_down(isnan(CL4_meas_up_down)|CL4_meas_up_down<0)=0;
% CL4_meas_down_down(isnan(CL4_meas_down_down)|CL4_meas_down_down<0)=0;
% 
% % conversion of BTCs (time in hr)
% CL4_up_up = conversion(time4_sec_up,CL4_meas_up_up);
% CL4_up_down = conversion(time4_sec_up,CL4_meas_up_down);
% CL4_down_down = conversion(time4_sec_down,CL4_meas_down_down);
% 
% % add time column (s) to measured concentration
% CL4_meas_up_up = [time4_real_up,time4_sec_up,CL4_meas_up_up];
% CL4_meas_up_down = [time4_real_up,time4_sec_up,CL4_meas_up_down];
% CL4_meas_down_down = [time4_real_down,time4_sec_down,CL4_meas_down_down];
% 
% save(fullfile(Folder,'NaClReach4.mat'),'L4','m_up4','m_down4','CL4_down_down','CL4_up_down','CL4_up_up','CL4_meas_down_down','CL4_meas_up_down','CL4_meas_up_up');
% 
% load(fullfile(Folder,'NaClReach4.mat'));
% 
% % calculate flow from measured BTCs
% [v4,Q4_up,Q4_down,qI4,qI4_min,qI4_max,A4,A4min,A4max,Mrec4,fMrec4] = ParamEst_BTC_second(CL4_meas_up_up,CL4_meas_up_down,CL4_meas_down_down,L4,m_up4,m_down4);
% save(fullfile(Folder,'NaClReach4_Flow.mat'),'v4','Q4_up','Q4_down','qI4','A4','A4min','A4max','qI4_min','qI4_max','Mrec4','fMrec4');
% writecell(['v [m/s]',num2cell(v4);'Q_up [m3/s]',num2cell(Q4_up);'Q_down [m3/s]',num2cell(Q4_down);'A [m2]',num2cell(A4);'q_I [m3/(m s)]',num2cell(qI4);'qI_min',num2cell(qI4_min);'qI_max',num2cell(qI4_max);'Mrec_up_down',num2cell(Mrec4);'fMrec_up_down',num2cell(fMrec4)],fullfile(Folder,'NaClReach4_Flow.xlsx'))
% 
% % calculate flow from OTIS input BTCs for comparison
% [v4_O,Q4_O_up,Q4_O_down,qI4_O,qI4_O_min,qI4_O_max,A4_O] = ParamEst_BTC_hour(CL4_up_up,CL4_up_down,CL4_down_down,L4,m_up4,m_down4);
% 
% % Plot
% f = figure('WindowState', 'maximized');
% subplot(2,3,1)
% plot(datetime(CL4_meas_up_up(:,1),"ConvertFrom","excel"),CL4_meas_up_up(:,3),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL4_meas_up_up(1,1),"ConvertFrom","excel"),datetime(CL4_meas_up_up(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,2)
% plot(datetime(CL4_meas_up_down(:,1),"ConvertFrom","excel"),CL4_meas_up_down(:,3),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL4_meas_up_down(1,1),"ConvertFrom","excel"),datetime(CL4_meas_up_down(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,3)
% plot(datetime(CL4_meas_down_down(:,1),"ConvertFrom","excel"),CL4_meas_down_down(:,3),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL4_meas_down_down(1,1),"ConvertFrom","excel"),datetime(CL4_meas_down_down(end,1),"ConvertFrom","excel")])
% title('Measured: downstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,4)
% plot(CL4_up_up(:,1),CL4_up_up(:,2),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL4_meas_up_up(1,2)/3600,CL4_meas_up_up(end,2)/3600])
% title('OTIS input: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,5)
% plot(CL4_up_down(:,1),CL4_up_down(:,2),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL4_meas_up_down(1,2)/3600,CL4_meas_up_down(end,2)/3600])
% title('OTIS input: BTC upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,6)
% plot(CL4_down_down(:,1),CL4_down_down(:,2),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL4_meas_down_down(1,2)/3600,CL4_meas_down_down(end,2)/3600])
% title('OTIS input: downstream inj., downstream meas.','FontSize',14)
% 
% sgtitle("NaCl BTCs reach 4 (L = "+L4+"m)",'FontSize',14)
% 
% saveas(f,fullfile(Folder,'NaClReach4.tif'));
% close(f)

%% Reach 5:

% EC5_meas_up_up = readmatrix('Reach_5.xlsx','Sheet','Data','Range','J5:J1980'); % "measured" Cl up inj, up meas (mS/cm), diver 1
% EC5_meas_up_down = readmatrix('Reach_5.xlsx','Sheet','Data','Range','N5:N1980'); % "measured" Cl up inj, down meas (mS/cm), diver 2
% EC5_meas_down_down = readmatrix('Reach_5.xlsx','Sheet','Data','Range','E5:E5734'); % "measured" Cl down inj, down meas (mS/cm), diver 2
% 
% % injected mass (g of Cl-)
% m_up5=readmatrix('Reach_5.xlsx','Sheet','Data','Range','F5:F5')*0.6067;
% m_down5=readmatrix('Reach_5.xlsx','Sheet','Data','Range','A5:A5')*0.6067;
% 
% % background EC
% bEC5_up_up=readmatrix('Reach_5.xlsx','Sheet','Data','Range','H5:H5');
% bEC5_up_down=readmatrix('Reach_5.xlsx','Sheet','Data','Range','L5:L5');
% bEC5_down_down=readmatrix('Reach_5.xlsx','Sheet','Data','Range','C5:C5');
% 
% % time
% t5_start_up=readmatrix('Reach_5.xlsx','Sheet','Data','Range','I5:I5'); % start time upstream injection
% t5_start_down=readmatrix('Reach_5.xlsx','Sheet','Data','Range','D5:D5'); % start time downstream injection
% ts5 = 5; %time step set during experiment (s)
% ts5_d = 5/(3600*24); % time step set during experiment (d)
% time5_real_up = (t5_start_up:ts5_d:(length(EC5_meas_up_up)-1)*ts5_d+t5_start_up)'; % time for upstream injection
% time5_real_down = (t5_start_down:ts5_d:(length(EC5_meas_down_down)-1)*ts5_d+t5_start_down)'; % time for downstream injection
% time5_sec_up = (0:ts5:(length(EC5_meas_up_up)-1)*ts5)'; % time in sec after start of experiment (upstream)
% time5_sec_down = (0:ts5:(length(EC5_meas_down_down)-1)*ts5)'; % time in sec after start of experiment (downstream)
% 
% % EC --> Conc. (of Cl- in g/m3)
% CL5_meas_up_up = (m6.*EC5_meas_up_up - m6*bEC5_up_up).*0.6067.*1000;
% CL5_meas_up_down = (m5.*EC5_meas_up_down - m5*bEC5_up_down).*0.6067.*1000;
% CL5_meas_down_down = (m5.*EC5_meas_down_down - m5*bEC5_down_down).*0.6067.*1000;
% 
% % convert NaN values and values smaller 0 in BTC to zero
% CL5_meas_up_up(isnan(CL5_meas_up_up)|CL5_meas_up_up<0)=0;
% CL5_meas_up_down(isnan(CL5_meas_up_down)|CL5_meas_up_down<0)=0;
% CL5_meas_down_down(isnan(CL5_meas_down_down)|CL5_meas_down_down<0)=0;
% 
% % conversion of BTCs (time in hr)
% CL5_up_up = conversion(time5_sec_up,CL5_meas_up_up);
% CL5_up_down = conversion(time5_sec_up,CL5_meas_up_down);
% CL5_down_down = conversion(time5_sec_down,CL5_meas_down_down);
% 
% % add time column (s) to measured concentration
% CL5_meas_up_up = [time5_real_up,time5_sec_up,CL5_meas_up_up];
% CL5_meas_up_down = [time5_real_up,time5_sec_up,CL5_meas_up_down];
% CL5_meas_down_down = [time5_real_down,time5_sec_down,CL5_meas_down_down];
% 
% save(fullfile(Folder,'NaClReach5.mat'),'L5','m_up5','m_down5','CL5_down_down','CL5_up_down','CL5_up_up','CL5_meas_down_down','CL5_meas_up_down','CL5_meas_up_up');
% 
% load(fullfile(Folder,'NaClReach5.mat'));
% 
% % calculate flow from measured BTCs
% [v5,Q5_up,Q5_down,qI5,qI5_min,qI5_max,A5,A5min,A5max,Mrec5,fMrec5] = ParamEst_BTC_second(CL5_meas_up_up,CL5_meas_up_down,CL5_meas_down_down,L5,m_up5,m_down5);
% save(fullfile(Folder,'NaClReach5_Flow.mat'),'v5','Q5_up','Q5_down','qI5','A5','A5min','A5max','qI5_min','qI5_max','Mrec5','fMrec5');
% writecell(['v [m/s]',num2cell(v5);'Q_up [m3/s]',num2cell(Q5_up);'Q_down [m3/s]',num2cell(Q5_down);'A [m2]',num2cell(A5);'q_I [m3/(m s)]',num2cell(qI5);'qI_min',num2cell(qI5_min);'qI_max',num2cell(qI5_max);'Mrec_up_down',num2cell(Mrec5);'fMrec_up_down',num2cell(fMrec5)],fullfile(Folder,'NaClReach5_Flow.xlsx'))
% 
% % calculate flow from OTIS input BTCs for comparison
% [v5_O,Q5_O_up,Q5_O_down,qI5_O,qI5_O_min,qI5_O_max,A5_O] = ParamEst_BTC_hour(CL5_up_up,CL5_up_down,CL5_down_down,L5,m_up5,m_down5);

% % Plot
% f = figure('WindowState', 'maximized');
% subplot(2,3,1)
% plot(datetime(CL5_meas_up_up(:,1),"ConvertFrom","excel"),CL5_meas_up_up(:,3),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL5_meas_up_up(1,1),"ConvertFrom","excel"),datetime(CL5_meas_up_up(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,2)
% plot(datetime(CL5_meas_up_down(:,1),"ConvertFrom","excel"),CL5_meas_up_down(:,3),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL5_meas_up_down(1,1),"ConvertFrom","excel"),datetime(CL5_meas_up_down(end,1),"ConvertFrom","excel")])
% title('Measured: upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,3)
% plot(datetime(CL5_meas_down_down(:,1),"ConvertFrom","excel"),CL5_meas_down_down(:,3),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [s]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([datetime(CL5_meas_down_down(1,1),"ConvertFrom","excel"),datetime(CL5_meas_down_down(end,1),"ConvertFrom","excel")])
% title('Measured: downstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,4)
% plot(CL5_up_up(:,1),CL5_up_up(:,2),'k',DisplayName='upstream inj., upstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL5_meas_up_up(1,2)/3600,CL5_meas_up_up(end,2)/3600])
% title('OTIS input: upstream inj., upstream meas.','FontSize',14)
% 
% subplot(2,3,5)
% plot(CL5_up_down(:,1),CL5_up_down(:,2),'k',DisplayName='upstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL5_meas_up_down(1,2)/3600,CL5_meas_up_down(end,2)/3600])
% title('OTIS input: BTC upstream inj., downstream meas.','FontSize',14)
% 
% subplot(2,3,6)
% plot(CL5_down_down(:,1),CL5_down_down(:,2),'k',DisplayName='downstream inj., downstream meas.',LineWidth=2)
% xlabel('Time [hr]','FontSize',14)
% ylabel('Cl^- conc. [g/m^3]','FontSize',14)
% xlim([CL5_meas_down_down(1,2)/3600,CL5_meas_down_down(end,2)/3600])
% title('OTIS input: downstream inj., downstream meas.','FontSize',14)
% 
% sgtitle("NaCl BTCs reach 5 (L = "+L5+"m)",'FontSize',14)
% 
% saveas(f,fullfile(Folder,'NaClReach5.tif'));
% close(f)



