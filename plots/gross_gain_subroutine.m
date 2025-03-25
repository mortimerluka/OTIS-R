function[R1_dQ_gross,R1_qI,R1_qout] = gross_gain_subroutine(R1,R1qI_est)

R1_dQ_gross.min=(R1.OOO.Q_down*0.9-R1.OOO.Q_up*1.1)/R1.L*1000;
R1_dQ_gross.max=(R1.OOO.Q_down*1.1-R1.OOO.Q_up*0.9)/R1.L*1000;
R1_dQ_gross.mean=(R1.OOO.Q_down-R1.OOO.Q_up)/R1.L*1000;

R1_qI.R290=[R1qI_est.CI95_R290(1),R1qI_est.mod_R290,R1qI_est.CI95_R290(2)]*1000; % min mode max
if R1_qI.R290(2)<R1_qI.R290(1)
    R1_qI.R290(1)=R1_qI.R290(2);
end
if R1_qI.R290(2)>R1_qI.R290(3)
    R1_qI.R290(3)=R1_qI.R290(2);
end
R1_qout.R290(1)=R1_qI.R290(1)-R1_dQ_gross.mean;
R1_qout.R290(2)=R1_qI.R290(2)-R1_dQ_gross.mean;
R1_qout.R290(3)=R1_qI.R290(3)-R1_dQ_gross.mean;
R1_qout.R290(R1_qout.R290<1e-16)=0;

R1_qI.R206=[R1qI_est.CI95_R206(1),R1qI_est.mod_R206,R1qI_est.CI95_R206(2)]*1000; % min mode max
if R1_qI.R206(2)<R1_qI.R206(1)
    R1_qI.R206(1)=R1_qI.R206(2);
end
if R1_qI.R206(2)>R1_qI.R206(3)
    R1_qI.R206(3)=R1_qI.R206(2);
end
R1_qout.R206(1)=R1_qI.R206(1)-R1_dQ_gross.mean;
R1_qout.R206(2)=R1_qI.R206(2)-R1_dQ_gross.mean;
R1_qout.R206(3)=R1_qI.R206(3)-R1_dQ_gross.mean;
R1_qout.R206(R1_qout.R206<1e-16)=0;