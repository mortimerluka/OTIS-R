function [v,Q_up,Q_down,qI,qI_min,qI_max,A] = ParamEst_BTC_hour(CL_up_up,CL_up_down,CL_down_down,L,m_up,m_down)

% peak arrival time
tpeak_up = CL_up_up(CL_up_up(:,2)==max(CL_up_up(:,2)),1); % hr
tpeak_down = CL_up_down(CL_up_down(:,2)==max(CL_up_down(:,2)),1); % hr
if length(tpeak_up)>1
    tpeak_up=mean(tpeak_up);
end

if length(tpeak_down)>1
    tpeak_down=mean(tpeak_down);
end

% stream velocity
tdiff = tpeak_down-tpeak_up; % hr
tdiff_s = tdiff.*3600;
v = L/tdiff_s; % m/s

% area under BTCs [m^3]
ts=CL_up_up(3,1)-CL_up_up(2,1);       % Time step in hr
CL_t_up=CL_up_up(:,2).*ts;   % (g*hr)/m^3
S_up=sum(CL_t_up)*3600;    % sum of concentration in (g*s)/m^3

ts=CL_down_down(3,1)-CL_down_down(2,1);       % Time step in hr
CL_t_down=CL_down_down(:,2).*ts;   % (g*hr)/m^3
S_down=sum(CL_t_down)*3600;    % sum of concentration in (g*s)/m^3

% discharge
Q_up = m_up/S_up; % m^3/s
Q_down = m_down/S_down; % m^3/s

% inflow/outflow
qI = (Q_down-Q_up)/L;

% discharge uncertainties upstream discharge
Q_up_min = Q_up-Q_up*0.1;
Q_up_max = Q_up+Q_up*0.1;
Q_down_min = Q_down-Q_down*0.1;
Q_down_max = Q_down+Q_down*0.1;

% inflow/outflow minimum/maximum
qI_min = (Q_down_min-Q_up_max)/L;
qI_max = (Q_down_max-Q_up_min)/L;

% mean stream area
A = mean([Q_up,Q_down])/v;
