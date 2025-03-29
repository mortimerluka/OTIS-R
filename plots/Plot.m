% Create plots

close all
clear variables
clc


if exist('Plots','dir')==0
               mkdir('Plots')
end

%% load all results
R1=load('R1Output_files_OTISR/OTIS_results.mat');
R2=load('R2Output_files_OTISR/OTIS_results.mat');
R3=load('R3Output_files_OTISR/OTIS_results.mat');
R4=load('R4Output_files_OTISR/OTIS_results.mat');
R5=load('R5Output_files_OTISR/OTIS_results.mat');

R1_out=load('R1Output_files_OTISR_Outflow/OTIS_results.mat');
R2_out=load('R2Output_files_OTISR_Outflow/OTIS_results.mat');
R3_out=load('R3Output_files_OTISR_Outflow/OTIS_results.mat');
R4_out=load('R4Output_files_OTISR_Outflow/OTIS_results.mat');
R5_out=load('R5Output_files_OTISR_Outflow/OTIS_results.mat');

%% Overview

% for R1 to R5

    % 1 - D (dispersion)
    % 2 - Alpha (exchange coefficient hyporheic zone - stream)
    % 3 - A_H (cross-sectional area hyporheic zone)
    % 4 - Q_up (upstream discharge)
    % 5 - Q_down (downstream discharge)

    % 6 - respective nRMSE

% for R1_out

    % 1 - D
    % 2 - alpha
    % 3 - A_H
    % 4 - q_I

    % 5 - respective nRMSE

%% xlimits for plots
xlimits.D = [10^(-5) 10];
xlimits.alpha = [10^(-5) 10^(-1)];
xlimits.AH = [10^(-5) 100];
xlimits.qI = [10^(-7) 10^(-4)];

%% Colours
% col.N = [68,119,170]/255;
% col.R290 = [34,136,51]/255;
% col.R206 = [170,51,119]/255;

col.N = [252,137,172]/255; %"#FC89AC"; 
col.R290 = [186,184,108]/255; %"#BAB86C"; 
col.R206 = [26,75,118]/255; %"#1A4B76"; 
%"#2B6CC4"

%% Parameter vs. nRMSE (dotty)

f=dotty_plot(R1,R1_out);
print(f,[pwd '/Plots/dotty_reach1'],'-vector','-dpdf');
close (f)


f=dotty_plot(R2,R2_out);
print(f,[pwd '/Plots/dotty_reach2'],'-vector','-dpdf');
close (f)

f=dotty_plot(R3,R3_out);
print(f,[pwd '/Plots/dotty_reach3'],'-vector','-dpdf');
close (f)

f=dotty_plot(R4,R4_out);
print(f,[pwd '/Plots/dotty_reach4'],'-vector','-dpdf');
close (f)

f=dotty_plot(R5,R5_out);
print(f,[pwd '/Plots/dotty_reach5'],'-vector','-dpdf');
close (f)

% CDF

% calculate cdf
[R1,R1_out] = cdf_calc(R1,R1_out);
[R2,R2_out] = cdf_calc(R2,R2_out);
[R3,R3_out] = cdf_calc(R3,R3_out);
[R4,R4_out] = cdf_calc(R4,R4_out);
[R5,R5_out] = cdf_calc(R5,R5_out);

% plot
f=cdf_plot(R1,R1_out,xlimits);
print(f,[pwd '/Plots/cdf_reach1'],'-vector','-dpdf');
close (f)

f=cdf_plot(R2,R2_out,xlimits);
print(f,[pwd '/Plots/cdf_reach2'],'-vector','-dpdf');
close (f)

f=cdf_plot(R3,R3_out,xlimits);
print(f,[pwd '/Plots/cdf_reach3'],'-vector','-dpdf');
close (f)

f=cdf_plot(R4,R4_out,xlimits);
print(f,[pwd '/Plots/cdf_reach4'],'-vector','-dpdf');
close (f)

f=cdf_plot(R5,R5_out,xlimits);
print(f,[pwd '/Plots/cdf_reach5'],'-vector','-dpdf');
close (f)

f = cdf_plot_SI(R1,R1_out,xlimits);
print(f,[pwd '/Plots/cdf_reach1_D_alph'],'-vector','-dpdf');
close (f)

f = cdf_plot_SI(R2,R2_out,xlimits);
print(f,[pwd '/Plots/cdf_reach2_D_alph'],'-vector','-dpdf');
close (f)

f = cdf_plot_SI(R3,R3_out,xlimits);
print(f,[pwd '/Plots/cdf_reach3_D_alph'],'-vector','-dpdf');
close (f)

f = cdf_plot_SI(R4,R4_out,xlimits);
print(f,[pwd '/Plots/cdf_reach4_D_alph'],'-vector','-dpdf');
close (f)

f = cdf_plot_SI(R5,R5_out,xlimits);
print(f,[pwd '/Plots/cdf_reach5_D_alph'],'-vector','-dpdf');
close (f)

% KS test for behavioral vs.non-behavioral parameter sets

[R1,R1_out] = kstest_behav(R1,R1_out);

[R2,R2_out] = kstest_behav(R2,R2_out);

[R3,R3_out] = kstest_behav(R3,R3_out);

[R4,R4_out] = kstest_behav(R4,R4_out);

[R5,R5_out] = kstest_behav(R5,R5_out);

% calculate information content (and groos gain/loss)

% reach 1
[R1inf_fix,R1inf_LHS,R1inf_out,R1qI_est] = inf_cont_calc(R1,R1_out);

% reach 2
[R2inf_fix,R2inf_LHS,R2inf_out,R2qI_est] = inf_cont_calc(R2,R2_out);

% reach 3
[R3inf_fix,R3inf_LHS,R3inf_out,R3qI_est] = inf_cont_calc(R3,R3_out);

% reach 4
[R4inf_fix,R4inf_LHS,R4inf_out,R4qI_est] = inf_cont_calc(R4,R4_out);

% reach 5
[R5inf_fix,R5inf_LHS,R5inf_out,R5qI_est] = inf_cont_calc(R5,R5_out);

% PDF

% plot pdf
% reach 1 with individual axis limits
f=pdf_R1(R1inf_fix,R1inf_LHS,R1inf_out,R1,xlimits);
print(f,[pwd '/Plots/pdf_reach1_main'],'-vector','-dpdf');
close (f)

% all reaches with the same axis limits
f=pdf_plot(R1inf_fix,R1inf_LHS,R1inf_out,R1,xlimits);
print(f,[pwd '/Plots/pdf_reach1'],'-vector','-dpdf');
close (f)

f=pdf_plot(R2inf_fix,R2inf_LHS,R2inf_out,R2,xlimits);
print(f,[pwd '/Plots/pdf_reach2'],'-vector','-dpdf');
close (f)

f=pdf_plot(R3inf_fix,R3inf_LHS,R3inf_out,R3,xlimits);
print(f,[pwd '/Plots/pdf_reach3'],'-vector','-dpdf');
close (f)

f=pdf_plot(R4inf_fix,R4inf_LHS,R4inf_out,R4,xlimits);
print(f,[pwd '/Plots/pdf_reach4'],'-vector','-dpdf');
close (f)

f=pdf_plot(R5inf_fix,R5inf_LHS,R5inf_out,R5,xlimits);
print(f,[pwd '/Plots/pdf_reach5'],'-vector','-dpdf');
close (f)

f = pdf_plot_SI(R1inf_fix,R1inf_LHS,R1inf_out,xlimits);
print(f,[pwd '/Plots/pdf_reach1_D_alph'],'-vector','-dpdf');
close (f)

f = pdf_plot_SI(R2inf_fix,R2inf_LHS,R2inf_out,xlimits);
print(f,[pwd '/Plots/pdf_reach2_D_alph'],'-vector','-dpdf');
close (f)

f = pdf_plot_SI(R3inf_fix,R3inf_LHS,R3inf_out,xlimits);
print(f,[pwd '/Plots/pdf_reach3_D_alph'],'-vector','-dpdf');
close (f)

f = pdf_plot_SI(R4inf_fix,R4inf_LHS,R4inf_out,xlimits);
print(f,[pwd '/Plots/pdf_reach4_D_alph'],'-vector','-dpdf');
close (f)

f = pdf_plot_SI(R5inf_fix,R5inf_LHS,R5inf_out,xlimits);
print(f,[pwd '/Plots/pdf_reach5_D_alph'],'-vector','-dpdf');
close (f)

% 2D

f=scatter2D_plot(R1,R1_out,col,xlimits);
% print(f,[pwd '/Plots/scatter2D_reach1'],'-vector','-dpdf');
print(f,[pwd '/Plots/scatter2D_reach1'],'-image','-dpdf','-r500');
close (f)

f=scatter2D_plot(R2,R2_out,col,xlimits);
% print(f,[pwd '/Plots/scatter2D_reach2'],'-vector','-dpdf');
print(f,[pwd '/Plots/scatter2D_reach2'],'-image','-dpdf','-r500');
close (f)

f=scatter2D_plot(R3,R3_out,col,xlimits);
% print(f,[pwd '/Plots/scatter2D_reach3'],'-vector','-dpdf');
print(f,[pwd '/Plots/scatter2D_reach3'],'-image','-dpdf','-r500');
close (f)

f=scatter2D_plot(R4,R4_out,col,xlimits);
% print(f,[pwd '/Plots/scatter2D_reach4'],'-vector','-dpdf');
print(f,[pwd '/Plots/scatter2D_reach4'],'-image','-dpdf','-r500');
close (f)

f=scatter2D_plot(R5,R5_out,col,xlimits);
% print(f,[pwd '/Plots/scatter2D_reach5'],'-vector','-dpdf');
print(f,[pwd '/Plots/scatter2D_reach5'],'-image','-dpdf','-r500');
close (f)


%% Spearman rank correlation

[R1.cor,R1.p_cor] = spearman(R1,R1_out);
[R2.cor,R2.p_cor] = spearman(R2,R2_out);
[R3.cor,R3.p_cor] = spearman(R3,R3_out);
[R4.cor,R4.p_cor] = spearman(R4,R4_out);
[R5.cor,R5.p_cor] = spearman(R5,R5_out);

%% transport metrics calculations

% calculate transport metrics
[R1,R2,R3,R4,R5,R1_out,R2_out,R3_out,R4_out,R5_out] = transport_metrics_calc(R1,R2,R3,R4,R5,R1_out,R2_out,R3_out,R4_out,R5_out);

% transport metrics Wilcoxon rank sum test
[R1,R2,R3,R4,R5,R1_out,R2_out,R3_out,R4_out,R5_out] = wilcoxonRank_TS(R1,R2,R3,R4,R5,R1_out,R2_out,R3_out,R4_out,R5_out);

%% plot transport metrics plot
f=transport_metrics_plotR1(R1,R1_out);
print(f,[pwd '/Plots/TS_reach1'],'-vector','-dpdf');
close (f)

f=transport_metrics_plotR2(R2,R2_out);
print(f,[pwd '/Plots/TS_reach2'],'-vector','-dpdf');
close (f)

f=transport_metrics_plotR3(R3,R3_out);
print(f,[pwd '/Plots/TS_reach3'],'-vector','-dpdf');
close (f)

f=transport_metrics_plotR4(R4,R4_out);
print(f,[pwd '/Plots/TS_reach4'],'-vector','-dpdf');
close (f)

f=transport_metrics_plotR5(R5,R5_out);
print(f,[pwd '/Plots/TS_reach5'],'-vector','-dpdf');
close (f)


%% gross/ net gain/loss

f = gross_gain_loss(R1,R1qI_est,R2,R2qI_est,R3,R3qI_est,R4,R4qI_est,R5,R5qI_est);
print(f,[pwd '/Plots/gain_loss'],'-vector','-dpdf');
close (f)

%% BTC NaCl

f = BTC_plot(R1,R1_out);
print(f,[pwd '/Plots/BTC_NaCl_reach1'],'-vector','-dpdf');
close (f)

f = BTC_plot(R2,R2_out);
print(f,[pwd '/Plots/BTC_NaCl_reach2'],'-vector','-dpdf');
close (f)

f = BTC_plot(R3,R3_out);
print(f,[pwd '/Plots/BTC_NaCl_reach3'],'-vector','-dpdf');
close (f)

f = BTC_plot(R4,R4_out);
print(f,[pwd '/Plots/BTC_NaCl_reach4'],'-vector','-dpdf');
close (f)

f = BTC_plot(R5,R5_out);
print(f,[pwd '/Plots/BTC_NaCl_reach5'],'-vector','-dpdf');
close (f)

%% Activity Rn

f = Rn290_plot(R1,R1_out);
print(f,[pwd '/Plots/Rn290_act_reach1'],'-vector','-dpdf');
close (f)

f = Rn290_plot(R2,R2_out);
print(f,[pwd '/Plots/Rn290_act_reach2'],'-vector','-dpdf');
close (f)

f = Rn290_plot(R3,R3_out);
print(f,[pwd '/Plots/Rn290_act_reach3'],'-vector','-dpdf');
close (f)

f = Rn290_plot(R4,R4_out);
print(f,[pwd '/Plots/Rn290_act_reach4'],'-vector','-dpdf');
close (f)

f = Rn290_plot(R5,R5_out);
print(f,[pwd '/Plots/Rn290_act_reach5'],'-vector','-dpdf');
close (f)

f = Rn206_plot(R1,R1_out);
print(f,[pwd '/Plots/Rn206_act_reach1'],'-vector','-dpdf');
close (f)

f = Rn206_plot(R2,R2_out);
print(f,[pwd '/Plots/Rn206_act_reach2'],'-vector','-dpdf');
close (f)

f = Rn206_plot(R3,R3_out);
print(f,[pwd '/Plots/Rn206_act_reach3'],'-vector','-dpdf');
close (f)

f = Rn206_plot(R4,R4_out);
print(f,[pwd '/Plots/Rn206_act_reach4'],'-vector','-dpdf');
close (f)

f = Rn206_plot(R5,R5_out);
print(f,[pwd '/Plots/Rn206_act_reach5'],'-vector','-dpdf');
close (f)

