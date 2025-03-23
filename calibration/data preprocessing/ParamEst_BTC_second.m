function [v,Q_up,Q_down,qI,qI_95min,qI_95max,A,A_95min,A_95max,Mrec,fMrec] = ParamEst_BTC_second(CL_up_up,CL_up_down,CL_down_down,L,m_up,m_down)

% peak arrival time
tpeak_up = CL_up_up(CL_up_up(:,3)==max(CL_up_up(:,3)),2); % s
tpeak_down = CL_up_down(CL_up_down(:,3)==max(CL_up_down(:,3)),2); % s
if length(tpeak_up)>1
    tpeak_up=mean(tpeak_up);
end

if length(tpeak_down)>1
    tpeak_down=mean(tpeak_down);
end

% stream velocity
tdiff = tpeak_down-tpeak_up; % s
v = L/tdiff; % m/s

% area under BTCs [m^3]
ts=CL_up_up(3,2)-CL_up_up(2,2);       % Time step in s
CL_t_up=CL_up_up(:,3).*ts;   % (g*s)/m^3
S_up=sum(CL_t_up);    % sum of concentration in (g*s)/m^3

ts=CL_down_down(3,2)-CL_down_down(2,2);       % Time step in s
CL_t_down=CL_down_down(:,3).*ts;   % (g*s)/m^3
S_down=sum(CL_t_down);    % sum of concentration in (g*s)/m^3

% discharge
Q_up = m_up/S_up; % m^3/s
Q_down = m_down/S_down; % m^3/s

% inflow/outflow
qI = (Q_down-Q_up)/L;

% discharge uncertainties upstream discharge
Q_up_95min = Q_up-Q_up*0.1;
Q_up_95max = Q_up+Q_up*0.1;
Q_down_95min = Q_down-Q_down*0.1;
Q_down_95max = Q_down+Q_down*0.1;

% inflow/outflow minimum/maximum
qI_95min = (Q_down_95min-Q_up_95max)/L;
qI_95max = (Q_down_95max-Q_up_95min)/L;

% mean stream area
A = mean([Q_up,Q_down])/v;
A_95min = mean([Q_up_95min,Q_down_95min])/v;
A_95max = mean([Q_up_95max,Q_down_95max])/v;

% recovered mass downstream from upstream injection (after Ward 2023)
ts=CL_up_down(3,2)-CL_up_down(2,2);       % Time step in s
CL_t_up_down=CL_up_down(:,3).*ts;   % (g*s)/m^3
S_up_down=sum(CL_t_up_down);    % sum of concentration in (g*s)/m^3
Mrec = Q_down*S_up_down;
fMrec = Mrec/m_up;
