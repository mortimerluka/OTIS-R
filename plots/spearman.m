% spearman rank correlation

function [cor,p_cor] = spearman(R1,R1_out)

% Q fix
[cor.N_Qfix,p_cor.N_Qfix] = corr(R1.top1_N_Qfix(:,1:3),'Type','Spearman');
[cor.R290_Qfix,p_cor.R290_Qfix] = corr(R1.top1_R290_Qfix(:,1:3),'Type','Spearman');
[cor.R206_Qfix,p_cor.R206_Qfix] = corr(R1.top1_R206_Qfix(:,1:3),'Type','Spearman');

% Q LHS

R1.qI_N = (R1.top1_N(:,5)-R1.top1_N(:,4))./R1.L;
R1.qI_N(R1.qI_N<1e-16)=0;
R1.qI_R290 = (R1.top1_R290(:,5)-R1.top1_R290(:,4))./R1.L;
R1.qI_R290(R1.qI_R290<1e-16)=0;
R1.qI_R206 = (R1.top1_R206(:,5)-R1.top1_R206(:,4))./R1.L;
R1.qI_R206(R1.qI_R206<1e-16)=0;

[cor.N_QLHS,p_cor.N_QLHS] = corr([R1.top1_N(:,1:3),R1.qI_N],'Type','Spearman');
[cor.R290_QLHS,p_cor.R290_QLHS] = corr([R1.top1_R290(:,1:3),R1.qI_R290],'Type','Spearman');
[cor.R206_QLHS,p_cor.R206_QLHS] = corr([R1.top1_R206(:,1:3),R1.qI_R206],'Type','Spearman');

% Q out
[cor.N_Qout,p_cor.N_Qout] = corr(R1_out.top1_N(:,1:4),'Type','Spearman');
[cor.R290_Qout,p_cor.R290_Qout] = corr(R1_out.top1_R290(:,1:4),'Type','Spearman');
[cor.R206_Qout,p_cor.R206_Qout] = corr(R1_out.top1_R206(:,1:4),'Type','Spearman');