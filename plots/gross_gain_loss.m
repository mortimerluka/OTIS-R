% Illustrate inflow/outflow based on estimation with Rn in Qout

function f = gross_gain_loss(R1,R1qI_est,R2,R2qI_est,R3,R3qI_est,R4,R4qI_est,R5,R5qI_est)

%%

col.R290 = [186,184,108,255]/255; %"#BAB86C"; 
col.R206 = [26,75,118,255]/255; %"#1A4B76"; 
col.R290_out = [186,184,108,60]/255; %"#BAB86C"; 
col.R206_out = [26,75,118,60]/255; %"#1A4B76"; 
col.R290_in = [186,184,108,150]/255; %"#BAB86C"; 
col.R206_in = [26,75,118,150]/255; %"#1A4B76"; 


[R1_dQ_gross,R1_qI,R1_qout] = gross_gain_subroutine(R1,R1qI_est);
[R2_dQ_gross,R2_qI,R2_qout] = gross_gain_subroutine(R2,R2qI_est);
[R3_dQ_gross,R3_qI,R3_qout] = gross_gain_subroutine(R3,R3qI_est);
[R4_dQ_gross,R4_qI,R4_qout] = gross_gain_subroutine(R4,R4qI_est);
[R5_dQ_gross,R5_qI,R5_qout] = gross_gain_subroutine(R5,R5qI_est);


f=figure;

% gross
yyaxis left

% reach 1
% mode
plot([0.82,0.82],[0,R1_qI.R290(2)],'-','Color',col.R290_in,'LineWidth',10)
hold on
plot([0.82,0.82],[0,-R1_qout.R290(2)],'-','Color',col.R290_out,'LineWidth',10)
plot([1.0,1.0],[0,R1_qI.R206(2)],'-','Color',col.R206_in,'LineWidth',10)
plot([1.0,1.0],[0,-R1_qout.R206(2)],'-','Color',col.R206_out,'LineWidth',10)

% 95% CI
plot([0.82,0.82],[R1_qI.R290(1),R1_qI.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([0.82,0.82],[-R1_qout.R290(1),-R1_qout.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([1.0,1.0],[R1_qI.R206(1),R1_qI.R206(3)],'-','Color',col.R206,'LineWidth',2)
plot([1.0,1.0],[-R1_qout.R206(1),-R1_qout.R206(3)],'-','Color',col.R206,'LineWidth',2)

% reach 2
% mode
plot([1.82,1.82],[0,R2_qI.R290(2)],'-','Color',col.R290_in,'LineWidth',10)
plot([1.82,1.82],[0,-R2_qout.R290(2)],'-','Color',col.R290_out,'LineWidth',10)
plot([2.0,2.0],[0,R2_qI.R206(2)],'-','Color',col.R206_in,'LineWidth',10)
plot([2.0,2.0],[0,-R2_qout.R206(2)],'-','Color',col.R206_out,'LineWidth',10)

% 95% CI
plot([1.82,1.82],[R2_qI.R290(1),R2_qI.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([1.82,1.82],[-R2_qout.R290(1),-R2_qout.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([2.0,2.0],[R2_qI.R206(1),R2_qI.R206(3)],'-','Color',col.R206,'LineWidth',2)
plot([2.0,2.0],[-R2_qout.R206(1),-R2_qout.R206(3)],'-','Color',col.R206,'LineWidth',2)

% reach 3
% mode
plot([2.82,2.82],[0,R3_qI.R290(2)],'-','Color',col.R290_in,'LineWidth',10)
plot([2.82,2.82],[0,-R3_qout.R290(2)],'-','Color',col.R290_out,'LineWidth',10)
plot([3.0,3.0],[0,R3_qI.R206(2)],'-','Color',col.R206_in,'LineWidth',10)
plot([3.0,3.0],[0,-R3_qout.R206(2)],'-','Color',col.R206_out,'LineWidth',10)

% 95% CI
plot([2.82,2.82],[R3_qI.R290(1),R3_qI.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([2.82,2.82],[-R3_qout.R290(1),-R3_qout.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([3.0,3.0],[R3_qI.R206(1),R3_qI.R206(3)],'-','Color',col.R206,'LineWidth',2)
plot([3.0,3.0],[-R3_qout.R206(1),-R3_qout.R206(3)],'-','Color',col.R206,'LineWidth',2)

% reach 4
% mode
plot([3.82,3.82],[0,R4_qI.R290(2)],'-','Color',col.R290_in,'LineWidth',10)
plot([3.82,3.82],[0,-R4_qout.R290(2)],'-','Color',col.R290_out,'LineWidth',10)
plot([4.0,4.0],[0,R4_qI.R206(2)],'-','Color',col.R206_in,'LineWidth',10)
plot([4.0,4.0],[0,-R4_qout.R206(2)],'-','Color',col.R206_out,'LineWidth',10)

% 95% CI
plot([3.82,3.82],[R4_qI.R290(1),R4_qI.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([3.82,3.82],[-R4_qout.R290(1),-R4_qout.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([4.0,4.0],[R4_qI.R206(1),R4_qI.R206(3)],'-','Color',col.R206,'LineWidth',2)
plot([4.0,4.0],[-R4_qout.R206(1),-R4_qout.R206(3)],'-','Color',col.R206,'LineWidth',2)

% reach 5
% mode
plot([4.82,4.82],[0,R5_qI.R290(2)],'-','Color',col.R290_in,'LineWidth',10)
plot([4.82,4.82],[0,-R5_qout.R290(2)],'-','Color',col.R290_out,'LineWidth',10)
plot([5.0,5.0],[0,R5_qI.R206(2)],'-','Color',col.R206_in,'LineWidth',10)
plot([5.0,5.0],[0,-R5_qout.R206(2)],'-','Color',col.R206_out,'LineWidth',10)

% 95% CI
plot([4.82,4.82],[R5_qI.R290(1),R5_qI.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([4.82,4.82],[-R5_qout.R290(1),-R5_qout.R290(3)],'-','Color',col.R290,'LineWidth',2)
plot([5.0,5.0],[R5_qI.R206(1),R5_qI.R206(3)],'-','Color',col.R206,'LineWidth',2)
plot([5.0,5.0],[-R5_qout.R206(1),-R5_qout.R206(3)],'-','Color',col.R206,'LineWidth',2)

yline(0)
xlim([0.5,5.5])
xticks([1,2,3,4,5])
xlabel('Reach no.')
ylabel('gross water fluxes [L s^{-1} m^{-1}]')
ylim([-0.05,0.05])
yticks([-0.05, -0.02, 0, 0.02, 0.05])

yyaxis right
plot([1.18,1.19],[R1_dQ_gross.min,R1_dQ_gross.max],'-','Color',[0 0 0 0.5],'LineWidth',10)
plot([1.1,1.27],[R1_dQ_gross.mean,R1_dQ_gross.mean],'k-','LineWidth',2)

plot([2.18,2.19],[R2_dQ_gross.min,R2_dQ_gross.max],'-','Color',[0 0 0 0.5],'LineWidth',10)
plot([2.1,2.27],[R2_dQ_gross.mean,R2_dQ_gross.mean],'k-','LineWidth',2)

plot([3.18,3.19],[R3_dQ_gross.min,R3_dQ_gross.max],'-','Color',[0 0 0 0.5],'LineWidth',10)
plot([3.1,3.27],[R3_dQ_gross.mean,R3_dQ_gross.mean],'k-','LineWidth',2)

plot([4.18,4.19],[R4_dQ_gross.min,R4_dQ_gross.max],'-','Color',[0 0 0 0.5],'LineWidth',10)
plot([4.1,4.27],[R4_dQ_gross.mean,R4_dQ_gross.mean],'k-','LineWidth',2)

plot([5.18,5.19],[R5_dQ_gross.min,R5_dQ_gross.max],'-','Color',[0 0 0 0.5],'LineWidth',10)
plot([5.1,5.27],[R5_dQ_gross.mean,R5_dQ_gross.mean],'k-','LineWidth',2)


ylabel('\DeltaQ per stream length [L s^{-1} m^{-1}]')
ylim([-0.05,0.05])
yticks([-0.05, -0.02, 0, 0.02, 0.05])
Ax=gca;

Ax.YAxis(2).Color = 'black';
Ax.YAxis(1).Color = 'black';

set(gca,'TickDir','out');
box on
ax1 = gca;
ax1.LineWidth = 1;

fontsize(f,12,'points');        % set fontsize 
ax1.FontSize = 10;
fontname(f,'Helvetica');
f.Units = 'centimeters';        % set figure units to cm
% f.Position = [0 0 18.0 22.0];   % set figure size
f.Position = [0 0 13.7 7.0];   % set figure size
f.PaperUnits = 'centimeters';   % set pdf printing paper units to cm
f.PaperSize = f.Position(3:4);  % assign to the pdf printing paper the size of the figure


