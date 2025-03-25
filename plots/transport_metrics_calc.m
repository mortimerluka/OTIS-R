% calculate transport metrics
function [R1,R2,R3,R4,R5,R1_out,R2_out,R3_out,R4_out,R5_out] = transport_metrics_calc(R1,R2,R3,R4,R5,R1_out,R2_out,R3_out,R4_out,R5_out)
% Reach 1
% stream cross sectional area
R1.A(:,1) = (R1.top1_N(:,4) + R1.top1_N(:,5))./(2*R1.OOO.v);
R1.A(:,2) = (R1.top1_N_Qfix(:,4) + R1.top1_N_Qfix(:,5))./(2*R1.OOO.v);
R1.A(:,3) = (R1.top1_R290(:,4) + R1.top1_R290(:,5))./(2*R1.OOO.v);
R1.A(:,4) = (R1.top1_R290_Qfix(:,4) + R1.top1_R290_Qfix(:,5))./(2*R1.OOO.v);
R1.A(:,5) = (R1.top1_R206(:,4) + R1.top1_R206(:,5))./(2*R1.OOO.v);
R1.A(:,6) = (R1.top1_R206_Qfix(:,4) + R1.top1_R206_Qfix(:,5))./(2*R1.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R1.q_H(:,1)=R1.top1_N(:,2).*R1.A(:,1);
R1.q_H(:,2)=R1.top1_N_Qfix(:,2).*R1.A(:,2);
R1.q_H(:,3)=R1.top1_R290(:,2).*R1.A(:,3);
R1.q_H(:,4)=R1.top1_R290_Qfix(:,2).*R1.A(:,4);
R1.q_H(:,5)=R1.top1_R206(:,2).*R1.A(:,5);
R1.q_H(:,6)=R1.top1_R206_Qfix(:,2).*R1.A(:,6);

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R1.L_S = (R1.A.*R1.OOO.v)./R1.q_H;

%average residence time of a water parcel in the hyporheic zone
R1.T_S(:,1) = (R1.top1_N(:,3)./R1.q_H(:,1))./3600; % in hr
R1.T_S(:,2) = (R1.top1_N_Qfix(:,3)./R1.q_H(:,2))./3600; % in hr
R1.T_S(:,3) = (R1.top1_R290(:,3)./R1.q_H(:,3))./3600; % in hr
R1.T_S(:,4) = (R1.top1_R290_Qfix(:,3)./R1.q_H(:,4))./3600; % in hr
R1.T_S(:,5) = (R1.top1_R206(:,3)./R1.q_H(:,5))./3600; % in hr
R1.T_S(:,6) = (R1.top1_R206_Qfix(:,3)./R1.q_H(:,6))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R1.q_S = R1.q_H.*R1.L;

%represents the fraction of median travel time due to transient storage
R1.F_med(:,1) = (1-exp(-R1.L./R1.L_S(:,1))).*R1.top1_N(:,3)./(R1.A(:,1)+R1.top1_N(:,3));
R1.F_med(:,2) = (1-exp(-R1.L./R1.L_S(:,2))).*R1.top1_N_Qfix(:,3)./(R1.A(:,2)+R1.top1_N_Qfix(:,3));
R1.F_med(:,3) = (1-exp(-R1.L./R1.L_S(:,3))).*R1.top1_R290(:,3)./(R1.A(:,3)+R1.top1_R290(:,3));
R1.F_med(:,4) = (1-exp(-R1.L./R1.L_S(:,4))).*R1.top1_R290_Qfix(:,3)./(R1.A(:,4)+R1.top1_R290_Qfix(:,3));
R1.F_med(:,5) = (1-exp(-R1.L./R1.L_S(:,5))).*R1.top1_R206(:,3)./(R1.A(:,5)+R1.top1_R206(:,3));
R1.F_med(:,6) = (1-exp(-R1.L./R1.L_S(:,6))).*R1.top1_R206_Qfix(:,3)./(R1.A(:,6)+R1.top1_R206_Qfix(:,3));

% Reach 2
% stream cross sectional area
R2.A(:,1) = (R2.top1_N(:,4) + R2.top1_N(:,5))./(2*R2.OOO.v);
R2.A(:,2) = (R2.top1_N_Qfix(:,4) + R2.top1_N_Qfix(:,5))./(2*R2.OOO.v);
R2.A(:,3) = (R2.top1_R290(:,4) + R2.top1_R290(:,5))./(2*R2.OOO.v);
R2.A(:,4) = (R2.top1_R290_Qfix(:,4) + R2.top1_R290_Qfix(:,5))./(2*R2.OOO.v);
R2.A(:,5) = (R2.top1_R206(:,4) + R2.top1_R206(:,5))./(2*R2.OOO.v);
R2.A(:,6) = (R2.top1_R206_Qfix(:,4) + R2.top1_R206_Qfix(:,5))./(2*R2.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R2.q_H(:,1)=R2.top1_N(:,2).*R2.A(:,1);
R2.q_H(:,2)=R2.top1_N_Qfix(:,2).*R2.A(:,2);
R2.q_H(:,3)=R2.top1_R290(:,2).*R2.A(:,3);
R2.q_H(:,4)=R2.top1_R290_Qfix(:,2).*R2.A(:,4);
R2.q_H(:,5)=R2.top1_R206(:,2).*R2.A(:,5);
R2.q_H(:,6)=R2.top1_R206_Qfix(:,2).*R2.A(:,6);

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R2.L_S = (R2.A.*R2.OOO.v)./R2.q_H;

%average residence time of a water parcel in the hyporheic zone
R2.T_S(:,1) = (R2.top1_N(:,3)./R2.q_H(:,1))./3600; % in hr
R2.T_S(:,2) = (R2.top1_N_Qfix(:,3)./R2.q_H(:,2))./3600; % in hr
R2.T_S(:,3) = (R2.top1_R290(:,3)./R2.q_H(:,3))./3600; % in hr
R2.T_S(:,4) = (R2.top1_R290_Qfix(:,3)./R2.q_H(:,4))./3600; % in hr
R2.T_S(:,5) = (R2.top1_R206(:,3)./R2.q_H(:,5))./3600; % in hr
R2.T_S(:,6) = (R2.top1_R206_Qfix(:,3)./R2.q_H(:,6))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R2.q_S = R2.q_H.*R2.L;

%represents the fraction of median travel time due to transient storage
R2.F_med(:,1) = (1-exp(-R2.L./R2.L_S(:,1))).*R2.top1_N(:,3)./(R2.A(:,1)+R2.top1_N(:,3));
R2.F_med(:,2) = (1-exp(-R2.L./R2.L_S(:,2))).*R2.top1_N_Qfix(:,3)./(R2.A(:,2)+R2.top1_N_Qfix(:,3));
R2.F_med(:,3) = (1-exp(-R2.L./R2.L_S(:,3))).*R2.top1_R290(:,3)./(R2.A(:,3)+R2.top1_R290(:,3));
R2.F_med(:,4) = (1-exp(-R2.L./R2.L_S(:,4))).*R2.top1_R290_Qfix(:,3)./(R2.A(:,4)+R2.top1_R290_Qfix(:,3));
R2.F_med(:,5) = (1-exp(-R2.L./R2.L_S(:,5))).*R2.top1_R206(:,3)./(R2.A(:,5)+R2.top1_R206(:,3));
R2.F_med(:,6) = (1-exp(-R2.L./R2.L_S(:,6))).*R2.top1_R206_Qfix(:,3)./(R2.A(:,6)+R2.top1_R206_Qfix(:,3));


% Reach 3
% stream cross sectional area
R3.A(:,1) = (R3.top1_N(:,4) + R3.top1_N(:,5))./(2*R3.OOO.v);
R3.A(:,2) = (R3.top1_N_Qfix(:,4) + R3.top1_N_Qfix(:,5))./(2*R3.OOO.v);
R3.A(:,3) = (R3.top1_R290(:,4) + R3.top1_R290(:,5))./(2*R3.OOO.v);
R3.A(:,4) = (R3.top1_R290_Qfix(:,4) + R3.top1_R290_Qfix(:,5))./(2*R3.OOO.v);
R3.A(:,5) = (R3.top1_R206(:,4) + R3.top1_R206(:,5))./(2*R3.OOO.v);
R3.A(:,6) = (R3.top1_R206_Qfix(:,4) + R3.top1_R206_Qfix(:,5))./(2*R3.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R3.q_H(:,1)=R3.top1_N(:,2).*R3.A(:,1);
R3.q_H(:,2)=R3.top1_N_Qfix(:,2).*R3.A(:,2);
R3.q_H(:,3)=R3.top1_R290(:,2).*R3.A(:,3);
R3.q_H(:,4)=R3.top1_R290_Qfix(:,2).*R3.A(:,4);
R3.q_H(:,5)=R3.top1_R206(:,2).*R3.A(:,5);
R3.q_H(:,6)=R3.top1_R206_Qfix(:,2).*R3.A(:,6);

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R3.L_S = (R3.A.*R3.OOO.v)./R3.q_H;

%average residence time of a water parcel in the hyporheic zone
R3.T_S(:,1) = (R3.top1_N(:,3)./R3.q_H(:,1))./3600; % in hr
R3.T_S(:,2) = (R3.top1_N_Qfix(:,3)./R3.q_H(:,2))./3600; % in hr
R3.T_S(:,3) = (R3.top1_R290(:,3)./R3.q_H(:,3))./3600; % in hr
R3.T_S(:,4) = (R3.top1_R290_Qfix(:,3)./R3.q_H(:,4))./3600; % in hr
R3.T_S(:,5) = (R3.top1_R206(:,3)./R3.q_H(:,5))./3600; % in hr
R3.T_S(:,6) = (R3.top1_R206_Qfix(:,3)./R3.q_H(:,6))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R3.q_S = R3.q_H.*R3.L;

%represents the fraction of median travel time due to transient storage
R3.F_med(:,1) = (1-exp(-R3.L./R3.L_S(:,1))).*R3.top1_N(:,3)./(R3.A(:,1)+R3.top1_N(:,3));
R3.F_med(:,2) = (1-exp(-R3.L./R3.L_S(:,2))).*R3.top1_N_Qfix(:,3)./(R3.A(:,2)+R3.top1_N_Qfix(:,3));
R3.F_med(:,3) = (1-exp(-R3.L./R3.L_S(:,3))).*R3.top1_R290(:,3)./(R3.A(:,3)+R3.top1_R290(:,3));
R3.F_med(:,4) = (1-exp(-R3.L./R3.L_S(:,4))).*R3.top1_R290_Qfix(:,3)./(R3.A(:,4)+R3.top1_R290_Qfix(:,3));
R3.F_med(:,5) = (1-exp(-R3.L./R3.L_S(:,5))).*R3.top1_R206(:,3)./(R3.A(:,5)+R3.top1_R206(:,3));
R3.F_med(:,6) = (1-exp(-R3.L./R3.L_S(:,6))).*R3.top1_R206_Qfix(:,3)./(R3.A(:,6)+R3.top1_R206_Qfix(:,3));



% Reach 4
% stream cross sectional area
R4.A(:,1) = (R4.top1_N(:,4) + R4.top1_N(:,5))./(2*R4.OOO.v);
R4.A(:,2) = (R4.top1_N_Qfix(:,4) + R4.top1_N_Qfix(:,5))./(2*R4.OOO.v);
R4.A(:,3) = (R4.top1_R290(:,4) + R4.top1_R290(:,5))./(2*R4.OOO.v);
R4.A(:,4) = (R4.top1_R290_Qfix(:,4) + R4.top1_R290_Qfix(:,5))./(2*R4.OOO.v);
R4.A(:,5) = (R4.top1_R206(:,4) + R4.top1_R206(:,5))./(2*R4.OOO.v);
R4.A(:,6) = (R4.top1_R206_Qfix(:,4) + R4.top1_R206_Qfix(:,5))./(2*R4.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R4.q_H(:,1)=R4.top1_N(:,2).*R4.A(:,1);
R4.q_H(:,2)=R4.top1_N_Qfix(:,2).*R4.A(:,2);
R4.q_H(:,3)=R4.top1_R290(:,2).*R4.A(:,3);
R4.q_H(:,4)=R4.top1_R290_Qfix(:,2).*R4.A(:,4);
R4.q_H(:,5)=R4.top1_R206(:,2).*R4.A(:,5);
R4.q_H(:,6)=R4.top1_R206_Qfix(:,2).*R4.A(:,6);

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R4.L_S = (R4.A.*R4.OOO.v)./R4.q_H;

%average residence time of a water parcel in the hyporheic zone
R4.T_S(:,1) = (R4.top1_N(:,3)./R4.q_H(:,1))./3600; % in hr
R4.T_S(:,2) = (R4.top1_N_Qfix(:,3)./R4.q_H(:,2))./3600; % in hr
R4.T_S(:,3) = (R4.top1_R290(:,3)./R4.q_H(:,3))./3600; % in hr
R4.T_S(:,4) = (R4.top1_R290_Qfix(:,3)./R4.q_H(:,4))./3600; % in hr
R4.T_S(:,5) = (R4.top1_R206(:,3)./R4.q_H(:,5))./3600; % in hr
R4.T_S(:,6) = (R4.top1_R206_Qfix(:,3)./R4.q_H(:,6))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R4.q_S = R4.q_H.*R4.L;

%represents the fraction of median travel time due to transient storage
R4.F_med(:,1) = (1-exp(-R4.L./R4.L_S(:,1))).*R4.top1_N(:,3)./(R4.A(:,1)+R4.top1_N(:,3));
R4.F_med(:,2) = (1-exp(-R4.L./R4.L_S(:,2))).*R4.top1_N_Qfix(:,3)./(R4.A(:,2)+R4.top1_N_Qfix(:,3));
R4.F_med(:,3) = (1-exp(-R4.L./R4.L_S(:,3))).*R4.top1_R290(:,3)./(R4.A(:,3)+R4.top1_R290(:,3));
R4.F_med(:,4) = (1-exp(-R4.L./R4.L_S(:,4))).*R4.top1_R290_Qfix(:,3)./(R4.A(:,4)+R4.top1_R290_Qfix(:,3));
R4.F_med(:,5) = (1-exp(-R4.L./R4.L_S(:,5))).*R4.top1_R206(:,3)./(R4.A(:,5)+R4.top1_R206(:,3));
R4.F_med(:,6) = (1-exp(-R4.L./R4.L_S(:,6))).*R4.top1_R206_Qfix(:,3)./(R4.A(:,6)+R4.top1_R206_Qfix(:,3));


% Reach 5
% stream cross sectional area
R5.A(:,1) = (R5.top1_N(:,4) + R5.top1_N(:,5))./(2*R5.OOO.v);
R5.A(:,2) = (R5.top1_N_Qfix(:,4) + R5.top1_N_Qfix(:,5))./(2*R5.OOO.v);
R5.A(:,3) = (R5.top1_R290(:,4) + R5.top1_R290(:,5))./(2*R5.OOO.v);
R5.A(:,4) = (R5.top1_R290_Qfix(:,4) + R5.top1_R290_Qfix(:,5))./(2*R5.OOO.v);
R5.A(:,5) = (R5.top1_R206(:,4) + R5.top1_R206(:,5))./(2*R5.OOO.v);
R5.A(:,6) = (R5.top1_R206_Qfix(:,4) + R5.top1_R206_Qfix(:,5))./(2*R5.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R5.q_H(:,1)=R5.top1_N(:,2).*R5.A(:,1);
R5.q_H(:,2)=R5.top1_N_Qfix(:,2).*R5.A(:,2);
R5.q_H(:,3)=R5.top1_R290(:,2).*R5.A(:,3);
R5.q_H(:,4)=R5.top1_R290_Qfix(:,2).*R5.A(:,4);
R5.q_H(:,5)=R5.top1_R206(:,2).*R5.A(:,5);
R5.q_H(:,6)=R5.top1_R206_Qfix(:,2).*R5.A(:,6);

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R5.L_S = (R5.A.*R5.OOO.v)./R5.q_H;

%average residence time of a water parcel in the hyporheic zone
R5.T_S(:,1) = (R5.top1_N(:,3)./R5.q_H(:,1))./3600; % in hr
R5.T_S(:,2) = (R5.top1_N_Qfix(:,3)./R5.q_H(:,2))./3600; % in hr
R5.T_S(:,3) = (R5.top1_R290(:,3)./R5.q_H(:,3))./3600; % in hr
R5.T_S(:,4) = (R5.top1_R290_Qfix(:,3)./R5.q_H(:,4))./3600; % in hr
R5.T_S(:,5) = (R5.top1_R206(:,3)./R5.q_H(:,5))./3600; % in hr
R5.T_S(:,6) = (R5.top1_R206_Qfix(:,3)./R5.q_H(:,6))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R5.q_S = R5.q_H.*R5.L;

%represents the fraction of median travel time due to transient storage
R5.F_med(:,1) = (1-exp(-R5.L./R5.L_S(:,1))).*R5.top1_N(:,3)./(R5.A(:,1)+R5.top1_N(:,3));
R5.F_med(:,2) = (1-exp(-R5.L./R5.L_S(:,2))).*R5.top1_N_Qfix(:,3)./(R5.A(:,2)+R5.top1_N_Qfix(:,3));
R5.F_med(:,3) = (1-exp(-R5.L./R5.L_S(:,3))).*R5.top1_R290(:,3)./(R5.A(:,3)+R5.top1_R290(:,3));
R5.F_med(:,4) = (1-exp(-R5.L./R5.L_S(:,4))).*R5.top1_R290_Qfix(:,3)./(R5.A(:,4)+R5.top1_R290_Qfix(:,3));
R5.F_med(:,5) = (1-exp(-R5.L./R5.L_S(:,5))).*R5.top1_R206(:,3)./(R5.A(:,5)+R5.top1_R206(:,3));
R5.F_med(:,6) = (1-exp(-R5.L./R5.L_S(:,6))).*R5.top1_R206_Qfix(:,3)./(R5.A(:,6)+R5.top1_R206_Qfix(:,3));


% Reach 1 with outflow
% stream cross sectional area
R1_out.A = (R1_out.OOO.Q_up + R1_out.OOO.Q_down)./(2*R1_out.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R1_out.q_H(:,1)=R1_out.top1_N(:,2).*R1_out.A;
R1_out.q_H(:,2)=R1_out.top1_R290(:,2).*R1_out.A;
R1_out.q_H(:,3)=R1_out.top1_R206(:,2).*R1_out.A;

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R1_out.L_S = (R1_out.A.*R1_out.OOO.v)./R1_out.q_H;

%average residence time of a water parcel in the hyporheic zone
R1_out.T_S(:,1) = (R1_out.top1_N(:,3)./R1_out.q_H(:,1))./3600; % in hr
R1_out.T_S(:,2) = (R1_out.top1_R290(:,3)./R1_out.q_H(:,2))./3600; % in hr
R1_out.T_S(:,3) = (R1_out.top1_R206(:,3)./R1_out.q_H(:,3))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R1_out.q_S = R1_out.q_H.*R1_out.L;

%represents the fraction of median travel time due to transient storage
R1_out.F_med(:,1) = (1-exp(-R1_out.L./R1_out.L_S(:,1))).*R1_out.top1_N(:,3)./(R1_out.A+R1_out.top1_N(:,3));
R1_out.F_med(:,2) = (1-exp(-R1_out.L./R1_out.L_S(:,2))).*R1_out.top1_R290(:,3)./(R1_out.A+R1_out.top1_R290(:,3));
R1_out.F_med(:,3) = (1-exp(-R1_out.L./R1_out.L_S(:,3))).*R1_out.top1_R206(:,3)./(R1_out.A+R1_out.top1_R206(:,3));


% Reach 2 with outflow
% stream cross sectional area
R2_out.A = (R2_out.OOO.Q_up + R2_out.OOO.Q_down)./(2*R2_out.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R2_out.q_H(:,1)=R2_out.top1_N(:,2).*R2_out.A;
R2_out.q_H(:,2)=R2_out.top1_R290(:,2).*R2_out.A;
R2_out.q_H(:,3)=R2_out.top1_R206(:,2).*R2_out.A;

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R2_out.L_S = (R2_out.A.*R2_out.OOO.v)./R2_out.q_H;

%average residence time of a water parcel in the hyporheic zone
R2_out.T_S(:,1) = (R2_out.top1_N(:,3)./R2_out.q_H(:,1))./3600; % in hr
R2_out.T_S(:,2) = (R2_out.top1_R290(:,3)./R2_out.q_H(:,2))./3600; % in hr
R2_out.T_S(:,3) = (R2_out.top1_R206(:,3)./R2_out.q_H(:,3))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R2_out.q_S = R2_out.q_H.*R2_out.L;

%represents the fraction of median travel time due to transient storage
R2_out.F_med(:,1) = (1-exp(-R2_out.L./R2_out.L_S(:,1))).*R2_out.top1_N(:,3)./(R2_out.A+R2_out.top1_N(:,3));
R2_out.F_med(:,2) = (1-exp(-R2_out.L./R2_out.L_S(:,2))).*R2_out.top1_R290(:,3)./(R2_out.A+R2_out.top1_R290(:,3));
R2_out.F_med(:,3) = (1-exp(-R2_out.L./R2_out.L_S(:,3))).*R2_out.top1_R206(:,3)./(R2_out.A+R2_out.top1_R206(:,3));


% Reach 3 with outflow
% stream cross sectional area
R3_out.A = (R3_out.OOO.Q_up + R3_out.OOO.Q_down)./(2*R3_out.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R3_out.q_H(:,1)=R3_out.top1_N(:,2).*R3_out.A;
R3_out.q_H(:,2)=R3_out.top1_R290(:,2).*R3_out.A;
R3_out.q_H(:,3)=R3_out.top1_R206(:,2).*R3_out.A;

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R3_out.L_S = (R3_out.A.*R3_out.OOO.v)./R3_out.q_H;

%average residence time of a water parcel in the hyporheic zone
R3_out.T_S(:,1) = (R3_out.top1_N(:,3)./R3_out.q_H(:,1))./3600; % in hr
R3_out.T_S(:,2) = (R3_out.top1_R290(:,3)./R3_out.q_H(:,2))./3600; % in hr
R3_out.T_S(:,3) = (R3_out.top1_R206(:,3)./R3_out.q_H(:,3))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R3_out.q_S = R3_out.q_H.*R3_out.L;

%represents the fraction of median travel time due to transient storage
R3_out.F_med(:,1) = (1-exp(-R3_out.L./R3_out.L_S(:,1))).*R3_out.top1_N(:,3)./(R3_out.A+R3_out.top1_N(:,3));
R3_out.F_med(:,2) = (1-exp(-R3_out.L./R3_out.L_S(:,2))).*R3_out.top1_R290(:,3)./(R3_out.A+R3_out.top1_R290(:,3));
R3_out.F_med(:,3) = (1-exp(-R3_out.L./R3_out.L_S(:,3))).*R3_out.top1_R206(:,3)./(R3_out.A+R3_out.top1_R206(:,3));


% Reach 4 with outflow
% stream cross sectional area
R4_out.A = (R4_out.OOO.Q_up + R4_out.OOO.Q_down)./(2*R4_out.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R4_out.q_H(:,1)=R4_out.top1_N(:,2).*R4_out.A;
R4_out.q_H(:,2)=R4_out.top1_R290(:,2).*R4_out.A;
R4_out.q_H(:,3)=R4_out.top1_R206(:,2).*R4_out.A;

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R4_out.L_S = (R4_out.A.*R4_out.OOO.v)./R4_out.q_H;

%average residence time of a water parcel in the hyporheic zone
R4_out.T_S(:,1) = (R4_out.top1_N(:,3)./R4_out.q_H(:,1))./3600; % in hr
R4_out.T_S(:,2) = (R4_out.top1_R290(:,3)./R4_out.q_H(:,2))./3600; % in hr
R4_out.T_S(:,3) = (R4_out.top1_R206(:,3)./R4_out.q_H(:,3))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R4_out.q_S = R4_out.q_H.*R4_out.L;

%represents the fraction of median travel time due to transient storage
R4_out.F_med(:,1) = (1-exp(-R4_out.L./R4_out.L_S(:,1))).*R4_out.top1_N(:,3)./(R4_out.A+R4_out.top1_N(:,3));
R4_out.F_med(:,2) = (1-exp(-R4_out.L./R4_out.L_S(:,2))).*R4_out.top1_R290(:,3)./(R4_out.A+R4_out.top1_R290(:,3));
R4_out.F_med(:,3) = (1-exp(-R4_out.L./R4_out.L_S(:,3))).*R4_out.top1_R206(:,3)./(R4_out.A+R4_out.top1_R206(:,3));



% Reach 5 with outflow
% stream cross sectional area
R5_out.A = (R5_out.OOO.Q_up + R5_out.OOO.Q_down)./(2*R5_out.OOO.v);

% hyporheic exchange rate (qH=alpha*A)
R5_out.q_H(:,1)=R5_out.top1_N(:,2).*R5_out.A;
R5_out.q_H(:,2)=R5_out.top1_R290(:,2).*R5_out.A;
R5_out.q_H(:,3)=R5_out.top1_R206(:,2).*R5_out.A;

%the average distance a water parcel travels in the stream before entering 
% the hyporheic zone
R5_out.L_S = (R5_out.A.*R5_out.OOO.v)./R5_out.q_H;

%average residence time of a water parcel in the hyporheic zone
R5_out.T_S(:,1) = (R5_out.top1_N(:,3)./R5_out.q_H(:,1))./3600; % in hr
R5_out.T_S(:,2) = (R5_out.top1_R290(:,3)./R5_out.q_H(:,2))./3600; % in hr
R5_out.T_S(:,3) = (R5_out.top1_R206(:,3)./R5_out.q_H(:,3))./3600; % in hr

%total water flux through the hyporheic zone for the stream reach
R5_out.q_S = R5_out.q_H.*R5_out.L;

%represents the fraction of median travel time due to transient storage
R5_out.F_med(:,1) = (1-exp(-R5_out.L./R5_out.L_S(:,1))).*R5_out.top1_N(:,3)./(R5_out.A+R5_out.top1_N(:,3));
R5_out.F_med(:,2) = (1-exp(-R5_out.L./R5_out.L_S(:,2))).*R5_out.top1_R290(:,3)./(R5_out.A+R5_out.top1_R290(:,3));
R5_out.F_med(:,3) = (1-exp(-R5_out.L./R5_out.L_S(:,3))).*R5_out.top1_R206(:,3)./(R5_out.A+R5_out.top1_R206(:,3));

