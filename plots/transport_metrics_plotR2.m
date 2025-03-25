% plot transport metrics plot only TS

function f = transport_metrics_plotR2(R1,R1_out)
%%
f=figure;
tclMain=tiledlayout(3,3,'TileSpacing','loose','Padding','compact');

tclsM(1)=tiledlayout(tclMain,1,3,'TileSpacing','compact');
tclsM(1).Layout.TileSpan = [1 3];
tclsM(1).Layout.Tile = 1; 
tclsM(2)=tiledlayout(tclMain,1,3,'TileSpacing','compact');
tclsM(2).Layout.TileSpan = [1 3];
tclsM(2).Layout.Tile = 4; 
tclsM(3)=tiledlayout(tclMain,1,3,'TileSpacing','compact');
tclsM(3).Layout.TileSpan = [1 3];
tclsM(3).Layout.Tile = 7; 


% Chloride Q fix
nexttile(tclsM(1));
violin_perc(log10(R1.T_S(:,2)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels({'10^{-6}','10^{-3}','10^{0}','10^{3}','10^{6}'})
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9];
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
title({'\color[rgb]{1,1,1}a_{b} \color[rgb]{0,0,0}NaCl \color[rgb]{1,1,1}a^{b}',''},'FontWeight','bold')
hold off 


% Radon Qfix
nexttile(tclsM(1));
violin_perc(log10(R1.T_S(:,4)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9];
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
title({'^{222}Rn, k_{high}',''},'FontWeight','bold')
arrow([1,max(log10(R1.T_S(:,4)))+2.5],[1,max(log10(R1.T_S(:,4)))+4.5],'Length',4,'Width',1,'TipAngle',45)
hold off


nexttile(tclsM(1));
violin_perc(log10(R1.T_S(:,6)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9]; 
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
title({'^{222}Rn, k_{low}',''},'FontWeight','bold')
ylabel({'Q_{fix}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
arrow([1,max(log10(R1.T_S(:,6)))+2.5],[1,max(log10(R1.T_S(:,6)))+4.5],'Length',4,'Width',1,'TipAngle',45)
hold off 


% Chloride Q LHS
nexttile(tclsM(2));
violin_perc(log10(R1.T_S(:,1)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels({'10^{-6}','10^{-3}','10^{0}','10^{3}','10^{6}'})
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9];
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
hold off 


% Radon QLHS
nexttile(tclsM(2));
violin_perc(log10(R1.T_S(:,3)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9];
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
arrow([1,max(log10(R1.T_S(:,3)))+2.5],[1,max(log10(R1.T_S(:,3)))+4.5],'Length',4,'Width',1,'TipAngle',45)
hold off

nexttile(tclsM(2));
violin_perc(log10(R1.T_S(:,5)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9]; 
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
ylabel({'Q_{LHS}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
arrow([1,max(log10(R1.T_S(:,5)))+2.5],[1,max(log10(R1.T_S(:,5)))+4.5],'Length',4,'Width',1,'TipAngle',45)
hold off 




% Chloride Q out
nexttile(tclsM(3));
violin_perc(log10(R1_out.T_S(:,1)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels({'10^{-6}','10^{-3}','10^{0}','10^{3}','10^{6}'})
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9];
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
hold off 


% Radon Qout
nexttile(tclsM(3));
violin_perc(log10(R1_out.T_S(:,2)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9];
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
text(1,log10(max(R1_out.T_S(:,2)))+3.5,'o','HorizontalAlignment','center','FontWeight','bold')
hold off


nexttile(tclsM(3));
violin_perc(log10(R1_out.T_S(:,3)),1,'facecolor','k','facealpha',0.2,'mc',[],'medc','k');
lgd = findobj('type', 'legend');
delete(lgd)
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim([-9 9])
yticks([-6 -3 0 3 6])
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-9 -8 -7 -5 -4 -2 -1 1 2 4 5 7 8 9]; 
xticks([])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
ylabel({'Q_{out}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
text(1,log10(max(R1_out.T_S(:,3)))+3.5,'o','HorizontalAlignment','center','FontWeight','bold')
hold off 

ylabel(tclMain,{'T_S [hr]'})


annotation('rectangle',[0.0 0.01 0.91 0.9],'LineWidth',0.75)


fontname(f,'Helvetica');
f.Units = 'centimeters';        % set figure units to cm
f.Position = [0 0 13.7 14.0];   % set figure size
f.PaperUnits = 'centimeters';   % set pdf printing paper units to cm
f.PaperSize = f.Position(3:4);  % assign to the pdf printing paper the size of the figure
fontsize(f,12,'points');        % set fontsize 

