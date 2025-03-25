% compute cdf

function [R1,R1_out] = cdf_calc(R1,R1_out)

% calculate qI
R1.top1_N(:,7) = (R1.top1_N(:,5)-R1.top1_N(:,4))/R1.L;
R1.top1_N_Qfix(:,7) = (R1.top1_N_Qfix(:,5)-R1.top1_N_Qfix(:,4))/R1.L;
R1.top1_R290(:,7) = (R1.top1_R290(:,5)-R1.top1_R290(:,4))/R1.L;
R1.top1_R290_Qfix(:,7) = (R1.top1_R290_Qfix(:,5)-R1.top1_R290_Qfix(:,4))/R1.L;
R1.top1_R206(:,7) = (R1.top1_R206(:,5)-R1.top1_R206(:,4))/R1.L;
R1.top1_R206_Qfix(:,7) = (R1.top1_R206_Qfix(:,5)-R1.top1_R206_Qfix(:,4))/R1.L;

R1.low99_N(:,7) = (R1.low99_N(:,5)-R1.low99_N(:,4))/R1.L;
R1.low99_N_Qfix(:,7) = (R1.low99_N_Qfix(:,5)-R1.low99_N_Qfix(:,4))/R1.L;
R1.low99_R290(:,7) = (R1.low99_R290(:,5)-R1.low99_R290(:,4))/R1.L;
R1.low99_R290_Qfix(:,7) = (R1.low99_R290_Qfix(:,5)-R1.low99_R290_Qfix(:,4))/R1.L;
R1.low99_R206(:,7) = (R1.low99_R206(:,5)-R1.low99_R206(:,4))/R1.L;
R1.low99_R206_Qfix(:,7) = (R1.low99_R206_Qfix(:,5)-R1.low99_R206_Qfix(:,4))/R1.L;


% compute behavioral cdfs
R1.cdf_N_top1 = mycdf_fixLHS(R1.top1_N);
R1.cdf_N_Qfix_top1 = mycdf_fixLHS(R1.top1_N_Qfix);
R1.cdf_R290_top1 = mycdf_fixLHS(R1.top1_R290);
R1.cdf_R206_top1 = mycdf_fixLHS(R1.top1_R206);
R1.cdf_R290_Qfix_top1 = mycdf_fixLHS(R1.top1_R290_Qfix);
R1.cdf_R206_Qfix_top1 = mycdf_fixLHS(R1.top1_R206_Qfix);


R1_out.cdf_N_top1 = mycdf_out(R1_out.top1_N);
R1_out.cdf_R290_top1 = mycdf_out(R1_out.top1_R290);
R1_out.cdf_R206_top1 = mycdf_out(R1_out.top1_R206);


% % compute non-behavioral cdfs
R1.cdf_N_low99 = mycdf_fixLHS(R1.low99_N);
R1.cdf_N_Qfix_low99 = mycdf_fixLHS(R1.low99_N_Qfix);
R1.cdf_R290_low99 = mycdf_fixLHS(R1.low99_R290);
R1.cdf_R206_low99 = mycdf_fixLHS(R1.low99_R206);
R1.cdf_R290_Qfix_low99 = mycdf_fixLHS(R1.low99_R290_Qfix);
R1.cdf_R206_Qfix_low99 = mycdf_fixLHS(R1.low99_R206_Qfix);

R1_out.cdf_N_low99 = mycdf_out(R1_out.low99_N);
R1_out.cdf_R290_low99 = mycdf_out(R1_out.low99_R290);
R1_out.cdf_R206_low99 = mycdf_out(R1_out.low99_R206);