% plot 2D scatter

function f = scatter2D_plot(R1,R1_out,col,xlimits)
%%
f=figure;
tclMain=tiledlayout(7,100,'TileSpacing','loose','Padding','compact');

tclsM(1)=tiledlayout(tclMain,2,1,'TileSpacing','none','TileIndexing','columnmajor');
tclsM(1).Layout.TileSpan = [6 22];
tclsM(1).Layout.Tile = 1; 
tclsM(2)=tiledlayout(tclMain,2,2,'TileSpacing','none','TileIndexing','columnmajor');
tclsM(2).Layout.TileSpan = [6 39];
tclsM(2).Layout.Tile = 23; 
tclsM(3)=tiledlayout(tclMain,2,2,'TileSpacing','none','TileIndexing','columnmajor');
tclsM(3).Layout.TileSpan = [6 39];
tclsM(3).Layout.Tile = 62; 


% ticklabels
tickM.alpha = [1e-4,1e-3,1e-2];
tickm.alpha = [1e-5,1e-1];
tickM.AH = [1e-3,1e-1,1e1];
tickm.AH = [1e-5,1e-4,1e-2,1e0,1e2];
tickM.qI = [1e-6,1e-5];
tickm.qI = [1e-7,1e-4];

% yticklabels for spacing
ytickfake = {'\color[rgb]{1,1,1}1'};


% Q fix
nexttile(tclsM(1));
scatter(R1.top1_N_Qfix(:,3),R1.top1_N_Qfix(:,2),5,'filled','MarkerFaceColor',col.N,'MarkerEdgeColor',col.N,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
hold on
scatter(R1.top1_R290_Qfix(:,3),R1.top1_R290_Qfix(:,2),5,'filled','MarkerFaceColor',col.R290,'MarkerEdgeColor',col.R290,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1.top1_R206_Qfix(:,3),R1.top1_R206_Qfix(:,2),5,'filled','MarkerFaceColor',col.R206,'MarkerEdgeColor',col.R206,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1.top1_b_290_Qfix(:,3),R1.top1_b_290_Qfix(:,2),'x','MarkerEdgeColor',col.R290,LineWidth=2);
scatter(R1.top1_b_206_Qfix(:,3),R1.top1_b_206_Qfix(:,2),'x','MarkerEdgeColor',col.R206,LineWidth=2);
set(gca,'Xscale','log','Yscale','log')
ax1(1) = gca;
ax1(1).LineWidth = 1;
ylim(xlimits.alpha)
yticks(tickM.alpha)
ax1(1).TickLength = [0.05, 0.05];
ax1(1).YAxis.MinorTick = 'on'; 
ax1(1).YAxis.MinorTickValues = tickm.alpha;
xlim(xlimits.AH)
xticks(tickM.AH)
xtickangle(0)
xticklabels([])
ax1(1).XAxis.MinorTick = 'on'; 
ax1(1).XAxis.MinorTickValues = tickm.AH; 
set(gca,'TickDir','out');
ylabel('\alpha [s^{-1}]')
box on
hold off 

nexttile(tclsM(1));
l(1)=scatter(nan,nan,5,'filled','MarkerFaceColor',col.N,'MarkerEdgeColor',col.N);
hold on
l(2)=scatter(nan,nan,5,'filled','MarkerFaceColor',col.R290,'MarkerEdgeColor',col.R290);
l(3)=scatter(nan,nan,5,'filled','MarkerFaceColor',col.R206,'MarkerEdgeColor',col.R206);
set(gca,'Xscale','log','Yscale','log')
ax1(2) = gca;
ax1(2).LineWidth = 1;
ylim(xlimits.qI)
yticks(tickM.qI)
ax1(2).TickLength = [0.05, 0.05];
ax1(2).YAxis.MinorTick = 'on'; 
ax1(2).YAxis.MinorTickValues = tickm.qI;
xlim(xlimits.AH)
xticks(tickM.AH)
xtickangle(0)
ax1(2).XAxis.MinorTick = 'on'; 
ax1(2).XAxis.MinorTickValues = tickm.AH; 
set(gca,'TickDir','out');
ylabel('qI [m^3 s^{-1} m^{-1}]')
xlabel('A_H [m^2]')
box on

title(tclsM(1),{'Q_{fix}',''},'FontWeight','bold')


% Q LHS
nexttile(tclsM(2));
scatter(R1.top1_N(:,3),R1.top1_N(:,2),5,'filled','MarkerFaceColor',col.N,'MarkerEdgeColor',col.N,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
hold on
scatter(R1.top1_R290(:,3),R1.top1_R290(:,2),5,'filled','MarkerFaceColor',col.R290,'MarkerEdgeColor',col.R290,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1.top1_R206(:,3),R1.top1_R206(:,2),5,'filled','MarkerFaceColor',col.R206,'MarkerEdgeColor',col.R206,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1.top1_b_290(:,3),R1.top1_b_290(:,2),'x','MarkerEdgeColor',col.R290,LineWidth=2);
scatter(R1.top1_b_206(:,3),R1.top1_b_206(:,2),'x','MarkerEdgeColor',col.R206,LineWidth=2);
set(gca,'Xscale','log','Yscale','log')
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim(xlimits.alpha)
yticks(tickM.alpha)
yticklabels(ytickfake)
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = tickm.alpha;
xlim(xlimits.AH)
xticks(tickM.AH)
xtickangle(0)
xticklabels([])
ax1(3).XAxis.MinorTick = 'on'; 
ax1(3).XAxis.MinorTickValues = tickm.AH; 
set(gca,'TickDir','out');
box on
hold off 

qI_QLHS.N = (R1.top1_N(:,5)-R1.top1_N(:,4))/R1.L;
qI_QLHS.R290 = (R1.top1_R290(:,5)-R1.top1_R290(:,4))/R1.L;
qI_QLHS.R206 = (R1.top1_R206(:,5)-R1.top1_R206(:,4))/R1.L;
qI_QLHS.b_290 = (R1.top1_b_290(:,5)-R1.top1_b_290(:,4))/R1.L;
qI_QLHS.b_206 = (R1.top1_b_206(:,5)-R1.top1_b_206(:,4))/R1.L;

nexttile(tclsM(2));
scatter(R1.top1_N(:,3),qI_QLHS.N,5,'filled','MarkerFaceColor',col.N,'MarkerEdgeColor',col.N,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
hold on
scatter(R1.top1_R290(:,3),qI_QLHS.R290,5,'filled','MarkerFaceColor',col.R290,'MarkerEdgeColor',col.R290,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1.top1_R206(:,3),qI_QLHS.R206,5,'filled','MarkerFaceColor',col.R206,'MarkerEdgeColor',col.R206,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1.top1_b_290(:,3),qI_QLHS.b_290,'x','MarkerEdgeColor',col.R290,LineWidth=2);
scatter(R1.top1_b_206(:,3),qI_QLHS.b_206,'x','MarkerEdgeColor',col.R206,LineWidth=2);
set(gca,'Xscale','log','Yscale','log')
ax1(4) = gca;
ax1(4).LineWidth = 1;
ylim(xlimits.qI)
yticks(tickM.qI)
yticklabels([])
ax1(4).TickLength = [0.05, 0.05];
ax1(4).YAxis.MinorTick = 'on'; 
ax1(4).YAxis.MinorTickValues = tickm.qI;
xlim(xlimits.AH)
xticks(tickM.AH)
xtickangle(0)
ax1(4).XAxis.MinorTick = 'on'; 
ax1(4).XAxis.MinorTickValues = tickm.AH; 
set(gca,'TickDir','out');
xlabel('A_H [m^2]')
box on

nexttile(tclsM(2));
set(gca,'Xscale','log','Yscale','log')
ax1(5) = gca;
ax1(5).LineWidth = 1;
ylim(xlimits.alpha)
yticks(tickM.alpha)
yticklabels([])
ax1(5).TickLength = [0.05, 0.05];
ax1(5).YAxis.MinorTick = 'on'; 
ax1(5).YAxis.MinorTickValues = tickm.alpha;
xlim(xlimits.alpha)
xticks(tickM.alpha)
xtickangle(0)
xticklabels([])
ax1(5).XAxis.MinorTick = 'on'; 
ax1(5).XAxis.MinorTickValues = tickm.alpha; 
set(gca,'TickDir','out');
box on

nexttile(tclsM(2));
scatter(R1.top1_N(:,2),qI_QLHS.N,5,'filled','MarkerFaceColor',col.N,'MarkerEdgeColor',col.N,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
hold on
scatter(R1.top1_R290(:,2),qI_QLHS.R290,5,'filled','MarkerFaceColor',col.R290,'MarkerEdgeColor',col.R290,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1.top1_R206(:,2),qI_QLHS.R206,5,'filled','MarkerFaceColor',col.R206,'MarkerEdgeColor',col.R206,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1.top1_b_290(:,2),qI_QLHS.b_290,'x','MarkerEdgeColor',col.R290,LineWidth=2);
scatter(R1.top1_b_206(:,2),qI_QLHS.b_206,'x','MarkerEdgeColor',col.R206,LineWidth=2);
set(gca,'Xscale','log','Yscale','log')
ax1(6) = gca;
ax1(6).LineWidth = 1;
ylim(xlimits.qI)
yticks(tickM.qI)
yticklabels([])
ax1(6).TickLength = [0.05, 0.05];
ax1(6).YAxis.MinorTick = 'on'; 
ax1(6).YAxis.MinorTickValues = tickm.qI;
xlim(xlimits.alpha)
xticks(tickM.alpha)
xtickangle(0)
ax1(6).XAxis.MinorTick = 'on'; 
ax1(6).XAxis.MinorTickValues = tickm.alpha; 
xlabel('\alpha [s^{-1}]')
set(gca,'TickDir','out');
box on

title(tclsM(2),{'Q_{LHS}',''},'FontWeight','bold')


% Q out
nexttile(tclsM(3));
scatter(R1_out.top1_N(:,3),R1_out.top1_N(:,2),5,'filled','MarkerFaceColor',col.N,'MarkerEdgeColor',col.N,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
hold on
scatter(R1_out.top1_R290(:,3),R1_out.top1_R290(:,2),5,'filled','MarkerFaceColor',col.R290,'MarkerEdgeColor',col.R290,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1_out.top1_R206(:,3),R1_out.top1_R206(:,2),5,'filled','MarkerFaceColor',col.R206,'MarkerEdgeColor',col.R206,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1_out.top1_b_290(:,3),R1_out.top1_b_290(:,2),'x','MarkerEdgeColor',col.R290,LineWidth=2);
scatter(R1_out.top1_b_206(:,3),R1_out.top1_b_206(:,2),'x','MarkerEdgeColor',col.R206,LineWidth=2);
set(gca,'Xscale','log','Yscale','log')
ax1(7) = gca;
ax1(7).LineWidth = 1;
ylim(xlimits.alpha)
yticks(tickM.alpha)
yticklabels([])
ax1(7).TickLength = [0.05, 0.05];
ax1(7).YAxis.MinorTick = 'on'; 
ax1(7).YAxis.MinorTickValues = tickm.alpha;
xlim(xlimits.AH)
xticks(tickM.AH)
xtickangle(0)
xticklabels([])
ax1(7).XAxis.MinorTick = 'on'; 
ax1(7).XAxis.MinorTickValues = tickm.AH; 
set(gca,'TickDir','out');
box on
hold off 

nexttile(tclsM(3));
scatter(R1_out.top1_N(:,3),R1_out.top1_N(:,4),5,'filled','MarkerFaceColor',col.N,'MarkerEdgeColor',col.N,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
hold on
scatter(R1_out.top1_R290(:,3),R1_out.top1_R290(:,4),5,'filled','MarkerFaceColor',col.R290,'MarkerEdgeColor',col.R290,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1_out.top1_R206(:,3),R1_out.top1_R206(:,4),5,'filled','MarkerFaceColor',col.R206,'MarkerEdgeColor',col.R206,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1_out.top1_b_290(:,3),R1_out.top1_b_290(:,4),'x','MarkerEdgeColor',col.R290,LineWidth=2);
scatter(R1_out.top1_b_206(:,3),R1_out.top1_b_206(:,4),'x','MarkerEdgeColor',col.R206,LineWidth=2);
set(gca,'Xscale','log','Yscale','log')
ax1(8) = gca;
ax1(8).LineWidth = 1;
ylim(xlimits.qI)
yticks(tickM.qI)
yticklabels([])
ax1(8).TickLength = [0.05, 0.05];
ax1(8).YAxis.MinorTick = 'on'; 
ax1(8).YAxis.MinorTickValues = tickm.qI;
xlim(xlimits.AH)
xticks(tickM.AH)
xtickangle(0)
ax1(8).XAxis.MinorTick = 'on'; 
ax1(8).XAxis.MinorTickValues = tickm.AH; 
set(gca,'TickDir','out');
xlabel('A_H [m^2]')
box on

nexttile(tclsM(3));
set(gca,'Xscale','log','Yscale','log')
ax1(9) = gca;
ax1(9).LineWidth = 1;
ylim(xlimits.alpha)
yticks(tickM.alpha)
yticklabels([])
ax1(9).TickLength = [0.05, 0.05];
ax1(9).YAxis.MinorTick = 'on'; 
ax1(9).YAxis.MinorTickValues = tickm.alpha;
xlim(xlimits.alpha)
xticks(tickM.alpha)
xtickangle(0)
xticklabels([])
ax1(9).XAxis.MinorTick = 'on'; 
ax1(9).XAxis.MinorTickValues = tickm.alpha; 
set(gca,'TickDir','out');
box on

nexttile(tclsM(3));
scatter(R1_out.top1_N(:,2),R1_out.top1_N(:,4),5,'filled','MarkerFaceColor',col.N,'MarkerEdgeColor',col.N,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
hold on
scatter(R1_out.top1_R290(:,2),R1_out.top1_R290(:,4),5,'filled','MarkerFaceColor',col.R290,'MarkerEdgeColor',col.R290,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1_out.top1_R206(:,2),R1_out.top1_R206(:,4),5,'filled','MarkerFaceColor',col.R206,'MarkerEdgeColor',col.R206,'MarkerFaceAlpha',0.1,'MarkerEdgeAlpha',0.1)
scatter(R1_out.top1_b_290(:,2),R1_out.top1_b_290(:,4),'x','MarkerEdgeColor',col.R290,LineWidth=2);
scatter(R1_out.top1_b_206(:,2),R1_out.top1_b_206(:,4),'x','MarkerEdgeColor',col.R206,LineWidth=2);
set(gca,'Xscale','log','Yscale','log')
ax1(10) = gca;
ax1(10).LineWidth = 1;
ylim(xlimits.qI)
yticks(tickM.qI)
yticklabels([])
ax1(10).TickLength = [0.05, 0.05];
ax1(10).YAxis.MinorTick = 'on'; 
ax1(10).YAxis.MinorTickValues = tickm.qI;
xlim(xlimits.alpha)
xticks(tickM.alpha)
xtickangle(0)
ax1(10).XAxis.MinorTick = 'on'; 
ax1(10).XAxis.MinorTickValues = tickm.alpha; 
xlabel('\alpha [s^{-1}]')
set(gca,'TickDir','out');
box on

title(tclsM(3),{'Q_{out}',''},'FontWeight','bold')


nexttile(tclMain,[1,100]);
h=plot(nan(5,2));
ax_leg=gca;
axis off;


leg=legend(ax_leg,l,'NaCl','^{222}Rn k_{high}','^{222}Rn k_{low}');
leg.Layout.Tile = 'south';
leg.Orientation='horizontal';
set(leg,'Box','off')


fontsize(f,12,'points');        % set fontsize 
fontsize(leg,10,'points')       % set legend font size

for i=1:10
    ax1(i).FontSize = 10;
end

fontname(f,'Helvetica');
f.Units = 'centimeters';        % set figure units to cm
f.Position = [0 0 18.0 10.0];   % set figure size
f.PaperUnits = 'centimeters';   % set pdf printing paper units to cm
f.PaperSize = f.Position(3:4);  % assign to the pdf printing paper the size of the figure

