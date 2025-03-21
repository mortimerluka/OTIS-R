% create dotty plot for AH and qI for R1


function f = pdf_R1(R1inf_fix,R1inf_LHS,R1inf_out,R1,xlimits)

%%

f=figure;

tclMain=tiledlayout(100,1,'TileSpacing','loose','Padding','tight');

tcl_par(1)=tiledlayout(tclMain,3,1,'TileSpacing','loose');
tcl_par(1).Layout.TileSpan = [55 1];
tcl_par(1).Layout.Tile = 1; 
tcl_par(2)=tiledlayout(tclMain,2,1,'TileSpacing','loose');
tcl_par(2).Layout.TileSpan = [45 1];
tcl_par(2).Layout.Tile = 56; 

% for ATS
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


%%%%%%%%%%%%%%%%%%%%%%%

% ATS

% Chloride Q fix
ylimits = [0 0.9];
ytickpos = [0.2 0.5 0.8];

nexttile(tclsMpar1(1));
semilogx([1e-5,R1inf_fix.XAH,100],[0,R1inf_fix.fAH_N,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(1) = gca;
ax1(1).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.2','0.5','0.8'})
ax1(1).TickLength = [0.05, 0.05];
ax1(1).YAxis.MinorTick = 'on'; 
ax1(1).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.6 0.7 0.9]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels([])
ax1(1).XAxis.MinorTick = 'on'; 
ax1(1).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
title({'\color[rgb]{1,1,1}a_{b} \color[rgb]{0,0,0}NaCl \color[rgb]{1,1,1}a^{b}',''},'FontWeight','bold')
box on
hold off 


% Radon Qfix
nexttile(tclsMpar1(1));
semilogx([1e-5,R1inf_fix.XAH,100],[0,R1inf_fix.fAH_R290,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(2) = gca;
ax1(2).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(2).TickLength = [0.05, 0.05];
ax1(2).YAxis.MinorTick = 'on'; 
ax1(2).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.6 0.7 0.9]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels([])
ax1(2).XAxis.MinorTick = 'on'; 
ax1(2).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
title({'^{222}Rn, k_{high}',''},'FontWeight','bold')
box on
hold off 

nexttile(tclsMpar1(1));
semilogx([1e-5,R1inf_fix.XAH,100],[0,R1inf_fix.fAH_R206,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(3) = gca;
ax1(3).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [0 0.1 0.3 0.4 0.6 0.7 0.9]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels([])
ax1(3).XAxis.MinorTick = 'on'; 
ax1(3).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
title({'^{222}Rn, k_{low}',''},'FontWeight','bold')
ylabel({'Q_{fix}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off 




% Chloride Q LHS
ylimits = [0 0.6];
ytickpos = [0.1 0.3 0.5];

nexttile(tclsMpar1(2));
semilogx([1e-5,R1inf_LHS.XAH,100],[0,R1inf_LHS.fAH_N,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(4) = gca;
ax1(4).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.1','0.3','0.5'})
ax1(4).TickLength = [0.05, 0.05];
ax1(4).YAxis.MinorTick = 'on'; 
ax1(4).YAxis.MinorTickValues = [0 0.2 0.4 0.6]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels([])
ax1(4).XAxis.MinorTick = 'on'; 
ax1(4).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
box on
hold off 


% Radon QLHS
nexttile(tclsMpar1(2));
semilogx([1e-5,R1inf_LHS.XAH,100],[0,R1inf_LHS.fAH_R290,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(5) = gca;
ax1(5).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(5).TickLength = [0.05, 0.05];
ax1(5).YAxis.MinorTick = 'on'; 
ax1(5).YAxis.MinorTickValues = [0 0.2 0.4 0.6]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels([])
ax1(5).XAxis.MinorTick = 'on'; 
ax1(5).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
box on
hold off 

nexttile(tclsMpar1(2));
semilogx([1e-5,R1inf_LHS.XAH,100],[0,R1inf_LHS.fAH_R206,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(6) = gca;
ax1(6).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(6).TickLength = [0.05, 0.05];
ax1(6).YAxis.MinorTick = 'on'; 
ax1(6).YAxis.MinorTickValues = [0 0.2 0.4 0.6]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels([])
ax1(6).XAxis.MinorTick = 'on'; 
ax1(6).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
ylabel({'Q_{LHS}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off  



% Chloride Q out
ylimits = [0 0.5];
ytickpos = [0.1 0.2 0.3 0.4];

nexttile(tclsMpar1(3));
semilogx([1e-5,R1inf_out.XAH,100],[0,R1inf_out.fAH_N,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(7) = gca;
ax1(7).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels({'0.1','0.2','0.3','0.4'})
ax1(7).TickLength = [0.05, 0.05];
ax1(7).YAxis.MinorTick = 'on'; 
ax1(7).YAxis.MinorTickValues = [0 0.5]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels({'10^{-3}','10^{-1}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}10\color[rgb]{1,1,1}a^b'})
ax1(7).XAxis.MinorTick = 'on'; 
ax1(7).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
xlabel({'A_{TS} [m^2]',''})
box on
hold off 


% Radon Qout
nexttile(tclsMpar1(3));
semilogx([1e-5,R1inf_out.XAH,100],[0,R1inf_out.fAH_R290,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(8) = gca;
ax1(8).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(8).TickLength = [0.05, 0.05];
ax1(8).YAxis.MinorTick = 'on'; 
ax1(8).YAxis.MinorTickValues = [0 0.5]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels({'10^{-3}','10^{-1}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}10\color[rgb]{1,1,1}a^b'})
ax1(8).XAxis.MinorTick = 'on'; 
ax1(8).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
xlabel({'A_{TS} [m^2]',''})
box on
hold off 

nexttile(tclsMpar1(3));
semilogx([1e-5,R1inf_out.XAH,100],[0,R1inf_out.fAH_R206,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax1(9) = gca;
ax1(9).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax1(9).TickLength = [0.05, 0.05];
ax1(9).YAxis.MinorTick = 'on'; 
ax1(9).YAxis.MinorTickValues = [0 0.5]; 
xlim(xlimits.AH)
xticks([1e-3 1e-1 1e1])
xtickangle(0)
xticklabels({'10^{-3}','10^{-1}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}10\color[rgb]{1,1,1}a^b'})
ax1(9).XAxis.MinorTick = 'on'; 
ax1(9).XAxis.MinorTickValues = [1e-5,1e-4,1e-2,1e0,1e2]; 
set(gca,'TickDir','out');
ylabel({'Q_{out}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
xlabel({'A_{TS} [m^2]',''})
box on
hold off 


ylabel(tcl_par(1),{'nRMSE [-]'})


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% q_I

% calculate qI pdf for Q LHS
nbins=15;
stepsize = (-4+7)/nbins;
edges = 10.^(-7:stepsize:-4);

R1.top1_N(:,7) = (R1.top1_N(:,5)-R1.top1_N(:,4))/R1.L;
R1.top1_R290(:,7) = (R1.top1_R290(:,5)-R1.top1_R290(:,4))/R1.L;
R1.top1_R206(:,7) = (R1.top1_R206(:,5)-R1.top1_R206(:,4))/R1.L;

[R1inf_LHS.fqI_N,xqI] = histcounts(R1.top1_N(:,7),edges,'Normalization','probability');
R1inf_LHS.XqI = zeros(size(R1inf_LHS.fqI_N));
for i=(1:(length(xqI)-1))
    R1inf_LHS.XqI(i)=mean([xqI(i),xqI(i+1)]);
end
[R1inf_LHS.fqI_R290,~] = histcounts(R1.top1_R290(:,7),edges,'Normalization','probability');
[R1inf_LHS.fqI_R206,~] = histcounts(R1.top1_R206(:,7),edges,'Normalization','probability');



% Chloride Q LHS
ylimits = [0 0.4];
ytickpos = [0.1 0.2 0.3];
yticklab = {'0.1','0.2','0.3'};
ytickmin = [0 0.4];


nexttile(tclsMpar2(1));
semilogx([1e-7,R1inf_LHS.XqI,1e-4],[0,R1inf_LHS.fqI_N,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax2(1) = gca;
ax2(1).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels(yticklab)
ax2(1).TickLength = [0.05, 0.05];
ax2(1).YAxis.MinorTick = 'on'; 
ax2(1).YAxis.MinorTickValues = ytickmin; 
xlim(xlimits.qI)
xticks([1e-6 1e-5])
xtickangle(0)
xticklabels([])
ax2(1).XAxis.MinorTick = 'on'; 
ax2(1).XAxis.MinorTickValues = [1e-7,1e-4]; 
set(gca,'TickDir','out');
box on
hold off 


% Radon QLHS
nexttile(tclsMpar2(1));
semilogx([1e-7,R1inf_LHS.XqI,1e-4],[0,R1inf_LHS.fqI_R290,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax2(2) = gca;
ax2(2).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(2).TickLength = [0.05, 0.05];
ax2(2).YAxis.MinorTick = 'on'; 
ax2(2).YAxis.MinorTickValues = ytickmin; 
xlim(xlimits.qI)
xticks([1e-6 1e-5])
xtickangle(0)
xticklabels([])
ax2(2).XAxis.MinorTick = 'on'; 
ax2(2).XAxis.MinorTickValues = [1e-7,1e-4]; 
set(gca,'TickDir','out');
box on
hold off 

nexttile(tclsMpar2(1));
semilogx([1e-7,R1inf_LHS.XqI,1e-4],[0,R1inf_LHS.fqI_R206,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax2(3) = gca;
ax2(3).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(3).TickLength = [0.05, 0.05];
ax2(3).YAxis.MinorTick = 'on'; 
ax2(3).YAxis.MinorTickValues = ytickmin; 
xlim(xlimits.qI)
xticks([1e-6 1e-5])
xtickangle(0)
xticklabels([])
ax2(3).XAxis.MinorTick = 'on'; 
ax2(3).XAxis.MinorTickValues = [1e-7,1e-4]; 
set(gca,'TickDir','out');
ylabel({'Q_{LHS}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off  



% Chloride Q out
ylimits = [0 0.7];
ytickpos = [0.2 0.4 0.6];
yticklab = {'0.2','0.4','0.6'};
ytickmin = [0 0.1 0.3 0.5 0.7];

nexttile(tclsMpar2(2));
semilogx([1e-7,R1inf_out.XqI,1e-4],[0,R1inf_out.fqI_N,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax2(4) = gca;
ax2(4).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels(yticklab)
ax2(4).TickLength = [0.05, 0.05];
ax2(4).YAxis.MinorTick = 'on'; 
ax2(4).YAxis.MinorTickValues = ytickmin; 
xlim(xlimits.qI)
xticks([1e-6 1e-5])
xtickangle(0)
xticklabels({'10^{-6}','10^{-5}'})
ax2(4).XAxis.MinorTick = 'on'; 
ax2(4).XAxis.MinorTickValues = [1e-7,1e-4]; 
set(gca,'TickDir','out');
xlabel('q_I [m^3 s^{-1} m^{-1}]')
box on
hold off 


% Radon Qout
nexttile(tclsMpar2(2));
semilogx([1e-7,R1inf_out.XqI,1e-4],[0,R1inf_out.fqI_R290,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax2(5) = gca;
ax2(5).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(5).TickLength = [0.05, 0.05];
ax2(5).YAxis.MinorTick = 'on'; 
ax2(5).YAxis.MinorTickValues = ytickmin; 
xlim(xlimits.qI)
xticks([1e-6 1e-5])
xtickangle(0)
xticklabels({'10^{-6}','10^{-5}'})
ax2(5).XAxis.MinorTick = 'on'; 
ax2(5).XAxis.MinorTickValues = [1e-7,1e-4]; 
set(gca,'TickDir','out');
xlabel('q_I [m^3 s^{-1} m^{-1}]')
box on
hold off 

nexttile(tclsMpar2(2));
semilogx([1e-7,R1inf_out.XqI,1e-4],[0,R1inf_out.fqI_R206,0],'Color',[0.4,0.4,0.4],LineWidth=1.5);
ax2(6) = gca;
ax2(6).LineWidth = 1;
ylim(ylimits)
yticks(ytickpos)
yticklabels([])
ax2(6).TickLength = [0.05, 0.05];
ax2(6).YAxis.MinorTick = 'on'; 
ax2(6).YAxis.MinorTickValues = ytickmin; 
xlim(xlimits.qI)
xticks([1e-6 1e-5])
xtickangle(0)
xticklabels({'10^{-6}','10^{-5}'})
ax2(6).XAxis.MinorTick = 'on'; 
ax2(6).XAxis.MinorTickValues = [1e-7,1e-4]; 
set(gca,'TickDir','out');
xlabel('q_I [m^3 s^{-1} m^{-1}]')
ylabel({'Q_{out}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off 


ylabel(tcl_par(2),{'nRMSE [-]'})




fontsize(f,12,'points');        % set fontsize 

annotation('rectangle',[0.0 0.00 0.91 0.4],'LineWidth',0.75)
annotation('rectangle',[0.0 0.415 0.91 0.51],'LineWidth',0.75)
annotation('textbox',[0.0 0.34 0.01 0.1],'String','(b)','FontWeight','bold','VerticalAlignment','bottom','EdgeColor','none','FontSize',14)
annotation('textbox',[0.0 0.87 0.01 0.1],'String','(a)','FontWeight','bold','VerticalAlignment','bottom','EdgeColor','none','FontSize',14)

for i=1:9
    ax1(i).FontSize = 10;
end

for i=1:6
    ax2(i).FontSize = 10;
end

fontname(f,'Helvetica');
f.Units = 'centimeters';        % set figure units to cm
% f.Position = [0 0 18.0 22.0];   % set figure size
f.Position = [0 0 13.7 14.0];   % set figure size
f.PaperUnits = 'centimeters';   % set pdf printing paper units to cm
f.PaperSize = f.Position(3:4);  % assign to the pdf printing paper the size of the figure

