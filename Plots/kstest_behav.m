function [R1,R1_out] = kstest_behav(R1,R1_out)

% Qfix
[~,R1.KStest_Qfix.D_p(1),R1.KStest_Qfix.D_K(1)] = kstest2(R1.top1_N_Qfix(:,1),R1.low99_N_Qfix(:,1));
[~,R1.KStest_Qfix.D_p(2),R1.KStest_Qfix.D_K(2)] = kstest2(R1.top1_R290_Qfix(:,1),R1.low99_R290_Qfix(:,1));
[~,R1.KStest_Qfix.D_p(3),R1.KStest_Qfix.D_K(3)] = kstest2(R1.top1_R206_Qfix(:,1),R1.low99_R206_Qfix(:,1));

[~,R1.KStest_Qfix.alph_p(1),R1.KStest_Qfix.alph_K(1)] = kstest2(R1.top1_N_Qfix(:,2),R1.low99_N_Qfix(:,2));
[~,R1.KStest_Qfix.alph_p(2),R1.KStest_Qfix.alph_K(2)] = kstest2(R1.top1_R290_Qfix(:,2),R1.low99_R290_Qfix(:,2));
[~,R1.KStest_Qfix.alph_p(3),R1.KStest_Qfix.alph_K(3)] = kstest2(R1.top1_R206_Qfix(:,2),R1.low99_R206_Qfix(:,2));

[~,R1.KStest_Qfix.AH_p(1),R1.KStest_Qfix.AH_K(1)] = kstest2(R1.top1_N_Qfix(:,3),R1.low99_N_Qfix(:,3));
[~,R1.KStest_Qfix.AH_p(2),R1.KStest_Qfix.AH_K(2)] = kstest2(R1.top1_R290_Qfix(:,3),R1.low99_R290_Qfix(:,3));
[~,R1.KStest_Qfix.AH_p(3),R1.KStest_Qfix.AH_K(3)] = kstest2(R1.top1_R206_Qfix(:,3),R1.low99_R206_Qfix(:,3));

% QLHS
[~,R1.KStest_QLHS.D_p(1),R1.KStest_QLHS.D_K(1)] = kstest2(R1.top1_N(:,1),R1.low99_N(:,1));
[~,R1.KStest_QLHS.D_p(2),R1.KStest_QLHS.D_K(2)] = kstest2(R1.top1_R290(:,1),R1.low99_R290(:,1));
[~,R1.KStest_QLHS.D_p(3),R1.KStest_QLHS.D_K(3)] = kstest2(R1.top1_R206(:,1),R1.low99_R206(:,1));

[~,R1.KStest_QLHS.alph_p(1),R1.KStest_QLHS.alph_K(1)] = kstest2(R1.top1_N(:,2),R1.low99_N(:,2));
[~,R1.KStest_QLHS.alph_p(2),R1.KStest_QLHS.alph_K(2)] = kstest2(R1.top1_R290(:,2),R1.low99_R290(:,2));
[~,R1.KStest_QLHS.alph_p(3),R1.KStest_QLHS.alph_K(3)] = kstest2(R1.top1_R206(:,2),R1.low99_R206(:,2));

[~,R1.KStest_QLHS.AH_p(1),R1.KStest_QLHS.AH_K(1)] = kstest2(R1.top1_N(:,3),R1.low99_N(:,3));
[~,R1.KStest_QLHS.AH_p(2),R1.KStest_QLHS.AH_K(2)] = kstest2(R1.top1_R290(:,3),R1.low99_R290(:,3));
[~,R1.KStest_QLHS.AH_p(3),R1.KStest_QLHS.AH_K(3)] = kstest2(R1.top1_R206(:,3),R1.low99_R206(:,3));

% Qout
[~,R1_out.KStest_Qout.D_p(1),R1_out.KStest_Qout.D_K(1)] = kstest2(R1_out.top1_N(:,1),R1_out.low99_N(:,1));
[~,R1_out.KStest_Qout.D_p(2),R1_out.KStest_Qout.D_K(2)] = kstest2(R1_out.top1_R290(:,1),R1_out.low99_R290(:,1));
[~,R1_out.KStest_Qout.D_p(3),R1_out.KStest_Qout.D_K(3)] = kstest2(R1_out.top1_R206(:,1),R1_out.low99_R206(:,1));

[~,R1_out.KStest_Qout.alph_p(1),R1_out.KStest_Qout.alph_K(1)] = kstest2(R1_out.top1_N(:,2),R1_out.low99_N(:,2));
[~,R1_out.KStest_Qout.alph_p(2),R1_out.KStest_Qout.alph_K(2)] = kstest2(R1_out.top1_R290(:,2),R1_out.low99_R290(:,2));
[~,R1_out.KStest_Qout.alph_p(3),R1_out.KStest_Qout.alph_K(3)] = kstest2(R1_out.top1_R206(:,2),R1_out.low99_R206(:,2));

[~,R1_out.KStest_Qout.AH_p(1),R1_out.KStest_Qout.AH_K(1)] = kstest2(R1_out.top1_N(:,3),R1_out.low99_N(:,3));
[~,R1_out.KStest_Qout.AH_p(2),R1_out.KStest_Qout.AH_K(2)] = kstest2(R1_out.top1_R290(:,3),R1_out.low99_R290(:,3));
[~,R1_out.KStest_Qout.AH_p(3),R1_out.KStest_Qout.AH_K(3)] = kstest2(R1_out.top1_R206(:,3),R1_out.low99_R206(:,3));

[~,R1_out.KStest_Qout.qI_p(1),R1_out.KStest_Qout.qI_K(1)] = kstest2(R1_out.top1_N(:,4),R1_out.low99_N(:,4));
[~,R1_out.KStest_Qout.qI_p(2),R1_out.KStest_Qout.qI_K(2)] = kstest2(R1_out.top1_R290(:,4),R1_out.low99_R290(:,4));
[~,R1_out.KStest_Qout.qI_p(3),R1_out.KStest_Qout.qI_K(3)] = kstest2(R1_out.top1_R206(:,4),R1_out.low99_R206(:,4));



