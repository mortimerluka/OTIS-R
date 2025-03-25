% Wilcoxon rank sum test to compare median of transport metrics from
% chloride and radon

function [R1,R2,R3,R4,R5,R1_out,R2_out,R3_out,R4_out,R5_out] = wilcoxonRank_TS(R1,R2,R3,R4,R5,R1_out,R2_out,R3_out,R4_out,R5_out)
%%
% simulations (r1,R2,R3,R4,R5)
% 1 - NaCl QLHS
% 2 - NaCl Qfix
% 3 - R290 QLHS
% 4 - R290 Qfix
% 5 - R206 QLHS
% 6 - R206 Qfix

% simulations (R1_out,R5_out)
% 1 - NaCl
% 2 - R290
% 3 - R206

% reach 1
R1.p_wilcox = NaN(4,1);
R1.p_wilcox(1) = ranksum(R1.T_S(:,1),R1.T_S(:,3)); % N against R290 QLHS
R1.p_wilcox(2) = ranksum(R1.T_S(:,1),R1.T_S(:,5)); % N against R206 QLHS
R1.p_wilcox(3) = ranksum(R1.T_S(:,2),R1.T_S(:,4)); % N against R290 Qfix
R1.p_wilcox(4) = ranksum(R1.T_S(:,2),R1.T_S(:,6)); % N against R206 Qfix

R1_out.p_wilcox = NaN(2,1);
R1_out.p_wilcox(1) = ranksum(R1_out.T_S(:,1),R1_out.T_S(:,2)); % N against R290 Qout
R1_out.p_wilcox(2) = ranksum(R1_out.T_S(:,1),R1_out.T_S(:,3)); % N against R206 Qout


% reach 2
R2.p_wilcox = NaN(4,1);
R2.p_wilcox(1) = ranksum(R2.T_S(:,1),R2.T_S(:,3)); % N against R290 QLHS
R2.p_wilcox(2) = ranksum(R2.T_S(:,1),R2.T_S(:,5)); % N against R206 QLHS
R2.p_wilcox(3) = ranksum(R2.T_S(:,2),R2.T_S(:,4)); % N against R290 Qfix
R2.p_wilcox(4) = ranksum(R2.T_S(:,2),R2.T_S(:,6)); % N against R206 Qfix

R2_out.p_wilcox = NaN(2,1);
R2_out.p_wilcox(1) = ranksum(R2_out.T_S(:,1),R2_out.T_S(:,2)); % N against R290 Qout
R2_out.p_wilcox(2) = ranksum(R2_out.T_S(:,1),R2_out.T_S(:,3)); % N against R206 Qout


% reach 3
R3.p_wilcox = NaN(4,1);
R3.p_wilcox(1) = ranksum(R3.T_S(:,1),R3.T_S(:,3)); % N against R290 QLHS
R3.p_wilcox(2) = ranksum(R3.T_S(:,1),R3.T_S(:,5)); % N against R206 QLHS
R3.p_wilcox(3) = ranksum(R3.T_S(:,2),R3.T_S(:,4)); % N against R290 Qfix
R3.p_wilcox(4) = ranksum(R3.T_S(:,2),R3.T_S(:,6)); % N against R206 Qfix

R3_out.p_wilcox = NaN(2,1);
R3_out.p_wilcox(1) = ranksum(R3_out.T_S(:,1),R3_out.T_S(:,2)); % N against R290 Qout
R3_out.p_wilcox(2) = ranksum(R3_out.T_S(:,1),R3_out.T_S(:,3)); % N against R206 Qout


% reach 4
R4.p_wilcox = NaN(4,1);
R4.p_wilcox(1) = ranksum(R4.T_S(:,1),R4.T_S(:,3)); % N against R290 QLHS
R4.p_wilcox(2) = ranksum(R4.T_S(:,1),R4.T_S(:,5)); % N against R206 QLHS
R4.p_wilcox(3) = ranksum(R4.T_S(:,2),R4.T_S(:,4)); % N against R290 Qfix
R4.p_wilcox(4) = ranksum(R4.T_S(:,2),R4.T_S(:,6)); % N against R206 Qfix

R4_out.p_wilcox = NaN(2,1);
R4_out.p_wilcox(1) = ranksum(R4_out.T_S(:,1),R4_out.T_S(:,2)); % N against R290 Qout
R4_out.p_wilcox(2) = ranksum(R4_out.T_S(:,1),R4_out.T_S(:,3)); % N against R206 Qout


% reach 5
R5.p_wilcox = NaN(4,1);
R5.p_wilcox(1) = ranksum(R5.T_S(:,1),R5.T_S(:,3)); % N against R290 QLHS
R5.p_wilcox(2) = ranksum(R5.T_S(:,1),R5.T_S(:,5)); % N against R206 QLHS
R5.p_wilcox(3) = ranksum(R5.T_S(:,2),R5.T_S(:,4)); % N against R290 Qfix
R5.p_wilcox(4) = ranksum(R5.T_S(:,2),R5.T_S(:,6)); % N against R206 Qfix

R5_out.p_wilcox = NaN(2,1);
R5_out.p_wilcox(1) = ranksum(R5_out.T_S(:,1),R5_out.T_S(:,2)); % N against R290 Qout
R5_out.p_wilcox(2) = ranksum(R5_out.T_S(:,1),R5_out.T_S(:,3)); % N against R206 Qout



