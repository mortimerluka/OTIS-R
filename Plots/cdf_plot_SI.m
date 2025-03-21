% create dotty plot for AH and qI for R1


function f = cdf_plot_SI(R1,R1_out,xlimits)

%%

f=figure;

tclMain=tiledlayout(2,1,'TileSpacing','loose','Padding','tight');

tcl_par(1)=tiledlayout(tclMain,3,1,'TileSpacing','loose');
tcl_par(1).Layout.TileSpan = [1 1];
tcl_par(1).Layout.Tile = 1; 
tcl_par(2)=tiledlayout(tclMain,3,1,'TileSpacing','loose');
tcl_par(2).Layout.TileSpan = [1 1];
tcl_par(2).Layout.Tile = 2; 

% for D
tclsMpar1(1)=tiledlayout(tcl_par(1),1,3,'TileSpacing','compact');
tclsMpar1(1).Layout.TileSpan = [1 1];
tclsMpar1(1).Layout.Tile = 1; 
tclsMpar1(2)=tiledlayout(tcl_par(1),1,3,'TileSpacing','compact');
tclsMpar1(2).Layout.TileSpan = [1 1];
tclsMpar1(2).Layout.Tile = 2; 
tclsMpar1(3)=tiledlayout(tcl_par(1),1,3,'TileSpacing','compact');
tclsMpar1(3).Layout.TileSpan = [1 1];
tclsMpar1(3).Layout.Tile = 3; 

% for qI
tclsMpar2(1)=tiledlayout(tcl_par(2),1,3,'TileSpacing','compact');
tclsMpar2(1).Layout.TileSpan = [1 1];
tclsMpar2(1).Layout.Tile = 1; 
tclsMpar2(2)=tiledlayout(tcl_par(2),1,3,'TileSpacing','compact');
tclsMpar2(2).Layout.TileSpan = [1 1];
tclsMpar2(2).Layout.Tile = 2; 
tclsMpar2(3)=tiledlayout(tcl_par(2),1,3,'TileSpacing','compact');
tclsMpar2(3).Layout.TileSpan = [1 1];
tclsMpar2(3).Layout.Tile = 3; 


%%%%%%%%%%%%%%%%%%%%%%%
ylimits = [0 1];
ytickpos = [0.2 0.5 0.8];

% D

% Chloride Q fix
nexttile(tclsMpar1(1));
semilogx(R1.cdf_N_Qfix_top1(:,1),R1.cdf_N_Qfix_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_N_Qfix_low99(:,1),R1.cdf_N_Qfix_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax1(1) = gca;
ax1(1).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.2','0.5','0.8'})
ax1(1).TickLength = [0.05, 0.05];
ax1(1).YAxis.MinorTick = 'on'; 
ax1(1).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels([])
ax1(1).XAxis.MinorTick = 'on'; 
ax1(1).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
set(gca,'TickDir','out');
title({'\color[rgb]{1,1,1}a_{b} \color[rgb]{0,0,0}NaCl \color[rgb]{1,1,1}a^{b}',''},'FontWeight','bold')
box on
hold off 


% Radon Qfix
nexttile(tclsMpar1(1));
semilogx(R1.cdf_R290_Qfix_top1(:,1),R1.cdf_R290_Qfix_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_R290_Qfix_low99(:,1),R1.cdf_R290_Qfix_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax1(2) = gca;
ax1(2).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(2).TickLength = [0.05, 0.05];
ax1(2).YAxis.MinorTick = 'on'; 
ax1(2).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels([])
ax1(2).XAxis.MinorTick = 'on'; 
ax1(2).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
title({'^{222}Rn, k_{high}',''},'FontWeight','bold')
box on
hold off 

nexttile(tclsMpar1(1));
semilogx(R1.cdf_R206_Qfix_top1(:,1),R1.cdf_R206_Qfix_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_R206_Qfix_low99(:,1),R1.cdf_R206_Qfix_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax1(3) = gca;
ax1(3).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels([])
ax1(3).XAxis.MinorTick = 'on'; 
ax1(3).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
title({'^{222}Rn, k_{low}',''},'FontWeight','bold')
ylabel({'Q_{fix}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off 




% Chloride Q LHS
nexttile(tclsMpar1(2));
semilogx(R1.cdf_N_top1(:,1),R1.cdf_N_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_N_low99(:,1),R1.cdf_N_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.2','0.5','0.8'})
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
ax1(4) = gca;
ax1(4).LineWidth = 1;
ax1(4).TickLength = [0.05, 0.05];
ax1(4).YAxis.MinorTick = 'on'; 
ax1(4).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
ax1(4).XAxis.MinorTick = 'on'; 
ax1(4).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
box on
hold off 


% Radon QLHS
nexttile(tclsMpar1(2));
semilogx(R1.cdf_R290_top1(:,1),R1.cdf_R290_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_R290_low99(:,1),R1.cdf_R290_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax1(5) = gca;
ax1(5).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(5).TickLength = [0.05, 0.05];
ax1(5).YAxis.MinorTick = 'on'; 
ax1(5).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels([])
ax1(5).XAxis.MinorTick = 'on'; 
ax1(5).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
box on
hold off 

nexttile(tclsMpar1(2));
semilogx(R1.cdf_R206_top1(:,1),R1.cdf_R206_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_R206_low99(:,1),R1.cdf_R206_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax1(6) = gca;
ax1(6).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(6).TickLength = [0.05, 0.05];
ax1(6).YAxis.MinorTick = 'on'; 
ax1(6).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels([])
ax1(6).XAxis.MinorTick = 'on'; 
ax1(6).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
ylabel({'Q_{LHS}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off  



% Chloride Q out
nexttile(tclsMpar1(3));
semilogx(R1_out.cdf_N_top1(:,1),R1_out.cdf_N_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1_out.cdf_N_low99(:,1),R1_out.cdf_N_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.2','0.5','0.8'})
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels({'10^{-4}','10^{-2}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}1\color[rgb]{1,1,1}a^b'})
set(gca,'TickDir','out');
ax1(7) = gca;
ax1(7).LineWidth = 1;
ax1(7).TickLength = [0.05, 0.05];
ax1(7).YAxis.MinorTick = 'on'; 
ax1(7).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
ax1(7).XAxis.MinorTick = 'on'; 
ax1(7).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
xlabel({'D [m^2 s^{-1}]',''})
box on
hold off 


% Radon Qout
nexttile(tclsMpar1(3));
semilogx(R1_out.cdf_R290_top1(:,1),R1_out.cdf_R290_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1_out.cdf_R290_low99(:,1),R1_out.cdf_R290_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax1(8) = gca;
ax1(8).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(8).TickLength = [0.05, 0.05];
ax1(8).YAxis.MinorTick = 'on'; 
ax1(8).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels({'10^{-4}','10^{-2}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}1\color[rgb]{1,1,1}a^b'})
ax1(8).XAxis.MinorTick = 'on'; 
ax1(8).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
xlabel({'D [m^2 s^{-1}]',''})
box on
hold off 

nexttile(tclsMpar1(3));
semilogx(R1_out.cdf_R206_top1(:,1),R1_out.cdf_R206_top1(:,2),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1_out.cdf_R206_low99(:,1),R1_out.cdf_R206_low99(:,2),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax1(9) = gca;
ax1(9).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(9).TickLength = [0.05, 0.05];
ax1(9).YAxis.MinorTick = 'on'; 
ax1(9).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.D)
xticks([1e-4 1e-2 1e0])
xtickangle(0)
xticklabels({'10^{-4}','10^{-2}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}1\color[rgb]{1,1,1}a^b'})
ax1(9).XAxis.MinorTick = 'on'; 
ax1(9).XAxis.MinorTickValues = [1e-5,1e-3,1e-1,1e1]; 
ylabel({'Q_{out}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
xlabel({'D [m^2 s^{-1}]',''})
box on
hold off 


ylabel(tcl_par(1),{'CDF [-]'})


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% alpha


% Chloride Q fix
nexttile(tclsMpar2(1));
semilogx(R1.cdf_N_Qfix_top1(:,3),R1.cdf_N_Qfix_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_N_Qfix_low99(:,3),R1.cdf_N_Qfix_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax2(1) = gca;
ax2(1).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.2','0.5','0.8'})
ax2(1).TickLength = [0.05, 0.05];
ax2(1).YAxis.MinorTick = 'on'; 
ax2(1).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels([])
ax2(1).XAxis.MinorTick = 'on'; 
ax2(1).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
set(gca,'TickDir','out');
box on
hold off 


% Radon Qfix
nexttile(tclsMpar2(1));
semilogx(R1.cdf_R290_Qfix_top1(:,3),R1.cdf_R290_Qfix_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_R290_Qfix_low99(:,3),R1.cdf_R290_Qfix_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax2(2) = gca;
ax2(2).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(2).TickLength = [0.05, 0.05];
ax2(2).YAxis.MinorTick = 'on'; 
ax2(2).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels([])
ax2(2).XAxis.MinorTick = 'on'; 
ax2(2).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
box on
hold off 

nexttile(tclsMpar2(1));
semilogx(R1.cdf_R206_Qfix_top1(:,3),R1.cdf_R206_Qfix_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_R206_Qfix_low99(:,3),R1.cdf_R206_Qfix_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax2(3) = gca;
ax2(3).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(3).TickLength = [0.05, 0.05];
ax2(3).YAxis.MinorTick = 'on'; 
ax2(3).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels([])
ax2(3).XAxis.MinorTick = 'on'; 
ax2(3).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
ylabel({'Q_{fix}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off 




% Chloride Q LHS
nexttile(tclsMpar2(2));
semilogx(R1.cdf_N_top1(:,3),R1.cdf_N_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_N_low99(:,3),R1.cdf_N_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.2','0.5','0.8'})
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
ax2(4) = gca;
ax2(4).LineWidth = 1;
ax2(4).TickLength = [0.05, 0.05];
ax2(4).YAxis.MinorTick = 'on'; 
ax2(4).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
ax2(4).XAxis.MinorTick = 'on'; 
ax2(4).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
box on
hold off 


% Radon QLHS
nexttile(tclsMpar2(2));
semilogx(R1.cdf_R290_top1(:,3),R1.cdf_R290_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_R290_low99(:,3),R1.cdf_R290_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax2(5) = gca;
ax2(5).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(5).TickLength = [0.05, 0.05];
ax2(5).YAxis.MinorTick = 'on'; 
ax2(5).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels([])
ax2(5).XAxis.MinorTick = 'on'; 
ax2(5).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
box on
hold off 

nexttile(tclsMpar2(2));
semilogx(R1.cdf_R206_top1(:,3),R1.cdf_R206_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1.cdf_R206_low99(:,3),R1.cdf_R206_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax2(6) = gca;
ax2(6).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(6).TickLength = [0.05, 0.05];
ax2(6).YAxis.MinorTick = 'on'; 
ax2(6).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels([])
ax2(6).XAxis.MinorTick = 'on'; 
ax2(6).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
ylabel({'Q_{LHS}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off  



% Chloride Q out
nexttile(tclsMpar2(3));
semilogx(R1_out.cdf_N_top1(:,3),R1_out.cdf_N_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1_out.cdf_N_low99(:,3),R1_out.cdf_N_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.2','0.5','0.8'})
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels({'10^{-4}','10^{-2}'})
set(gca,'TickDir','out');
ax2(7) = gca;
ax2(7).LineWidth = 1;
ax2(7).TickLength = [0.05, 0.05];
ax2(7).YAxis.MinorTick = 'on'; 
ax2(7).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
ax2(7).XAxis.MinorTick = 'on'; 
ax2(7).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
xlabel({'\alpha [s^{-1}]',''})
box on
hold off 


% Radon Qout
nexttile(tclsMpar2(3));
semilogx(R1_out.cdf_R290_top1(:,3),R1_out.cdf_R290_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1_out.cdf_R290_low99(:,3),R1_out.cdf_R290_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax2(8) = gca;
ax2(8).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(8).TickLength = [0.05, 0.05];
ax2(8).YAxis.MinorTick = 'on'; 
ax2(8).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels({'10^{-4}','10^{-2}'})
ax2(8).XAxis.MinorTick = 'on'; 
ax2(8).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
xlabel({'\alpha [s^{-1}]',''})
box on
hold off 

nexttile(tclsMpar2(3));
semilogx(R1_out.cdf_R206_top1(:,3),R1_out.cdf_R206_top1(:,4),'-','Color',[0.4,0.4,0.4],'LineWidth',2);
hold on
semilogx(R1_out.cdf_R206_low99(:,3),R1_out.cdf_R206_low99(:,4),':','Color',[0.4,0.4,0.4],'LineWidth',2);
ax2(9) = gca;
ax2(9).LineWidth = 1;
set(gca,'TickDir','out');
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(9).TickLength = [0.05, 0.05];
ax2(9).YAxis.MinorTick = 'on'; 
ax2(9).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.5 0.6 0.7 0.9 1]; 
xlim(xlimits.alpha)
xticks([1e-4 1e-2])
xtickangle(0)
xticklabels({'10^{-4}','10^{-2}'})
ax2(9).XAxis.MinorTick = 'on'; 
ax2(9).XAxis.MinorTickValues = [1e-5,1e-3,1e-1]; 
ylabel({'Q_{out}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
xlabel({'\alpha [s^{-1}]',''})
box on
hold off 


ylabel(tcl_par(2),{'CDF [-]'})




fontsize(f,12,'points');        % set fontsize 

annotation('rectangle',[0.0 0.00 0.91 0.47],'LineWidth',0.75)
annotation('rectangle',[0.0 0.48 0.91 0.45],'LineWidth',0.75)
annotation('textbox',[0.0 0.41 0.01 0.1],'String','(b)','FontWeight','bold','VerticalAlignment','bottom','EdgeColor','none','FontSize',14)
annotation('textbox',[0.0 0.87 0.01 0.1],'String','(a)','FontWeight','bold','VerticalAlignment','bottom','EdgeColor','none','FontSize',14)

for i=1:9
    ax1(i).FontSize = 10;
    ax2(i).FontSize = 10;
end

fontname(f,'Helvetica');
f.Units = 'centimeters';        % set figure units to cm
% f.Position = [0 0 18.0 22.0];   % set figure size
f.Position = [0 0 13.7 16.0];   % set figure size
f.PaperUnits = 'centimeters';   % set pdf printing paper units to cm
f.PaperSize = f.Position(3:4);  % assign to the pdf printing paper the size of the figure

