% create dotty plot for AH and qI for R1


function f = dotty_plot(R1,R1_out)

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
tclsMpar1(1)=tiledlayout(tcl_par(1),1,25,'TileSpacing','loose');
tclsMpar1(1).Layout.TileSpan = [1 1];
tclsMpar1(1).Layout.Tile = 1; 
tclsMpar1(2)=tiledlayout(tcl_par(1),1,25,'TileSpacing','loose');
tclsMpar1(2).Layout.TileSpan = [1 1];
tclsMpar1(2).Layout.Tile = 2; 
tclsMpar1(3)=tiledlayout(tcl_par(1),1,25,'TileSpacing','loose');
tclsMpar1(3).Layout.TileSpan = [1 1];
tclsMpar1(3).Layout.Tile = 3; 

tclpar1(1) = tiledlayout(tclsMpar1(1),1,1,'TileSpacing','compact');
tclpar1(1).Layout.TileSpan = [1 9];
tclpar1(1).Layout.Tile = 1; 
tclpar1(2) = tiledlayout(tclsMpar1(1),1,2,'TileSpacing','compact');
tclpar1(2).Layout.TileSpan = [1 16];
tclpar1(2).Layout.Tile = 10; 
tclpar1(3) = tiledlayout(tclsMpar1(2),1,1,'TileSpacing','compact');
tclpar1(3).Layout.TileSpan = [1 9];
tclpar1(3).Layout.Tile = 1; 
tclpar1(4) = tiledlayout(tclsMpar1(2),1,2,'TileSpacing','compact');
tclpar1(4).Layout.TileSpan = [1 16];
tclpar1(4).Layout.Tile = 10; 
tclpar1(5) = tiledlayout(tclsMpar1(3),1,1,'TileSpacing','compact');
tclpar1(5).Layout.TileSpan = [1 9];
tclpar1(5).Layout.Tile = 1; 
tclpar1(6) = tiledlayout(tclsMpar1(3),1,2,'TileSpacing','compact');
tclpar1(6).Layout.TileSpan = [1 16];
tclpar1(6).Layout.Tile = 10; 

% for qI
tclsMpar2(1)=tiledlayout(tcl_par(2),1,25,'TileSpacing','loose');
tclsMpar2(1).Layout.TileSpan = [1 1];
tclsMpar2(1).Layout.Tile = 1; 
tclsMpar2(2)=tiledlayout(tcl_par(2),1,25,'TileSpacing','loose');
tclsMpar2(2).Layout.TileSpan = [1 1];
tclsMpar2(2).Layout.Tile = 2; 

tclpar2(1) = tiledlayout(tclsMpar2(1),1,1,'TileSpacing','compact');
tclpar2(1).Layout.TileSpan = [1 9];
tclpar2(1).Layout.Tile = 1; 
tclpar2(2) = tiledlayout(tclsMpar2(1),1,2,'TileSpacing','compact');
tclpar2(2).Layout.TileSpan = [1 16];
tclpar2(2).Layout.Tile = 10; 
tclpar2(3) = tiledlayout(tclsMpar2(2),1,1,'TileSpacing','compact');
tclpar2(3).Layout.TileSpan = [1 9];
tclpar2(3).Layout.Tile = 1; 
tclpar2(4) = tiledlayout(tclsMpar2(2),1,2,'TileSpacing','compact');
tclpar2(4).Layout.TileSpan = [1 16];
tclpar2(4).Layout.Tile = 10; 

%%%%%%%%%%%%%%%%%%%%%%%

% ATS

% Chloride Q fix
nexttile(tclpar1(1));
plot(log10(R1.top1_N_Qfix(:,3)),R1.top1_N_Qfix(:,6),'.','Color',[0.4,0.4,0.4]);
ax1(1) = gca;
ax1(1).LineWidth = 1;
ylim([0 0.2])
yticks([0.05 0.15])
yticklabels({'0.05','0.15'})
ax1(1).TickLength = [0.05, 0.05];
ax1(1).YAxis.MinorTick = 'on'; 
ax1(1).YAxis.MinorTickValues = [0 0.1 0.2]; 
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels([])
ax1(1).XAxis.MinorTick = 'on'; 
ax1(1).XAxis.MinorTickValues = [-5,-4,-2,0,2]; 
set(gca,'TickDir','out');
title({'\color[rgb]{1,1,1}a_{b} \color[rgb]{0,0,0}NaCl \color[rgb]{1,1,1}a^{b}',''},'FontWeight','bold')
box on
hold off 

% Radon Qfix
nexttile(tclpar1(2));
plot(log10(R1.top1_R290_Qfix(:,3)),log10(R1.top1_R290_Qfix(:,6)),'.','Color',[0.4,0.4,0.4]);
ax1(2) = gca;
ax1(2).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels({'   10^{-5}','   10^{-2}'})
ax1(2).TickLength = [0.05, 0.05];
ax1(2).YAxis.MinorTick = 'on'; 
ax1(2).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels([])
ax1(2).XAxis.MinorTick = 'on'; 
ax1(2).XAxis.MinorTickValues = [-5,-4,-2,0,2];  
title({'^{222}Rn, k_{high}',''},'FontWeight','bold')
box on
hold off 

nexttile(tclpar1(2));
plot(log10(R1.top1_R206_Qfix(:,3)),log10(R1.top1_R206_Qfix(:,6)),'.','Color',[0.4,0.4,0.4]);
ax1(3) = gca;
ax1(3).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels([])
ax1(3).TickLength = [0.05, 0.05];
ax1(3).YAxis.MinorTick = 'on'; 
ax1(3).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels([])
ax1(3).XAxis.MinorTick = 'on'; 
ax1(3).XAxis.MinorTickValues = [-5,-4,-2,0,2];  
title({'^{222}Rn, k_{low}',''},'FontWeight','bold')
ylabel({'Q_{fix}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off 




% Chloride Q LHS
nexttile(tclpar1(3));
plot(log10(R1.top1_N(:,3)),R1.top1_N(:,6),'.','Color',[0.4,0.4,0.4]);
ylim([0 max(R1.top1_N(:,6))])
ylim([0 0.2])
yticks([0.05 0.15])
yticklabels({'0.05','0.15'})
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
ax1(4) = gca;
ax1(4).LineWidth = 1;
ax1(4).TickLength = [0.05, 0.05];
ax1(4).YAxis.MinorTick = 'on'; 
ax1(4).YAxis.MinorTickValues = [0 0.1 0.2]; 
ax1(4).XAxis.MinorTick = 'on'; 
ax1(4).XAxis.MinorTickValues = [-5,-4,-2,0,2]; 
box on
hold off 


% Radon QLHS
nexttile(tclpar1(4));
plot(log10(R1.top1_R290(:,3)),log10(R1.top1_R290(:,6)),'.','Color',[0.4,0.4,0.4]);
ax1(5) = gca;
ax1(5).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels({'   10^{-5}','   10^{-2}'})
ax1(5).TickLength = [0.05, 0.05];
ax1(5).YAxis.MinorTick = 'on'; 
ax1(5).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels([])
ax1(5).XAxis.MinorTick = 'on'; 
ax1(5).XAxis.MinorTickValues = [-5,-4,-2,0,2];  
box on
hold off 

nexttile(tclpar1(4));
plot(log10(R1.top1_R206(:,3)),log10(R1.top1_R206(:,6)),'.','Color',[0.4,0.4,0.4]);
ax1(6) = gca;
ax1(6).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels([])
ax1(6).TickLength = [0.05, 0.05];
ax1(6).YAxis.MinorTick = 'on'; 
ax1(6).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels([])
ax1(6).XAxis.MinorTick = 'on'; 
ax1(6).XAxis.MinorTickValues = [-5,-4,-2,0,2];  
ylabel({'Q_{LHS}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off  



% Chloride Q out
nexttile(tclpar1(5));
plot(log10(R1_out.top1_N(:,3)),R1_out.top1_N(:,5),'.','Color',[0.4,0.4,0.4]);
ylim([0 max(R1_out.top1_N(:,5))])
ylim([0 0.2])
yticks([0.05 0.15])
yticklabels({'0.05','0.15'})
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels({'10^{-3}','10^{-1}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}10\color[rgb]{1,1,1}a^b'})
set(gca,'TickDir','out');
ax1(7) = gca;
ax1(7).LineWidth = 1;
ax1(7).TickLength = [0.05, 0.05];
ax1(7).YAxis.MinorTick = 'on'; 
ax1(7).YAxis.MinorTickValues = [0 0.1 0.2]; 
ax1(7).XAxis.MinorTick = 'on'; 
ax1(7).XAxis.MinorTickValues = [-5,-4,-2,0,2];  
box on
hold off 


% Radon Qout
nexttile(tclpar1(6));
plot(log10(R1_out.top1_R290(:,3)),log10(R1_out.top1_R290(:,5)),'.','Color',[0.4,0.4,0.4]);
ax1(8) = gca;
ax1(8).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels({'   10^{-5}','   10^{-2}'})
ax1(8).TickLength = [0.05, 0.05];
ax1(8).YAxis.MinorTick = 'on'; 
ax1(8).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels({'10^{-3}','10^{-1}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}10\color[rgb]{1,1,1}a^b'})
ax1(8).XAxis.MinorTick = 'on'; 
ax1(8).XAxis.MinorTickValues = [-5,-4,-2,0,2];  
box on
hold off 

nexttile(tclpar1(6));
plot(log10(R1_out.top1_R206(:,3)),log10(R1_out.top1_R206(:,5)),'.','Color',[0.4,0.4,0.4]);
ax1(9) = gca;
ax1(9).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels([])
ax1(9).TickLength = [0.05, 0.05];
ax1(9).YAxis.MinorTick = 'on'; 
ax1(9).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-5 2])
xticks([-3 -1 1])
xtickangle(0)
xticklabels({'10^{-3}','10^{-1}','\color[rgb]{1,1,1}a^b\color[rgb]{0,0,0}10\color[rgb]{1,1,1}a^b'})
ax1(9).XAxis.MinorTick = 'on'; 
ax1(9).XAxis.MinorTickValues = [-5,-4,-2,0,2];  
ylabel({'Q_{out}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off 

xlabel(tclpar1(5),{'A_{TS} [m^2]',''})
xlabel(tclpar1(6),{'A_{TS} [m^2]',''})
ylabel(tcl_par(1),{'nRMSE [-]'})


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% q_I
qI_QLHS.N = (R1.top1_N(:,5)-R1.top1_N(:,4))/R1.L;
qI_QLHS.R290 = (R1.top1_R290(:,5)-R1.top1_R290(:,4))/R1.L;
qI_QLHS.R206 = (R1.top1_R206(:,5)-R1.top1_R206(:,4))/R1.L;

% Chloride Q LHS
nexttile(tclpar2(1));
plot(log10(qI_QLHS.N),R1.top1_N(:,6),'.','Color',[0.4,0.4,0.4]);
ylim([0 max(R1.top1_N(:,6))])
ylim([0 0.2])
yticks([0.05 0.15])
yticklabels({'0.05','0.15'})
xlim([-7 -4])
xticks([-6 -5])
xtickangle(0)
xticklabels([])
set(gca,'TickDir','out');
ax2(1) = gca;
ax2(1).LineWidth = 1;
ax2(1).TickLength = [0.05, 0.05];
ax2(1).YAxis.MinorTick = 'on'; 
ax2(1).YAxis.MinorTickValues = [0 0.1 0.2]; 
ax2(1).XAxis.MinorTick = 'on'; 
ax2(1).XAxis.MinorTickValues = [-7,-4]; 
box on
hold off 


% Radon QLHS
nexttile(tclpar2(2));
plot(log10(qI_QLHS.R290),log10(R1.top1_R290(:,6)),'.','Color',[0.4,0.4,0.4]);
ax2(2) = gca;
ax2(2).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels({'   10^{-5}','   10^{-2}'})
ax2(2).TickLength = [0.05, 0.05];
ax2(2).YAxis.MinorTick = 'on'; 
ax2(2).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-7 -4])
xticks([-6 -5])
xtickangle(0)
xticklabels([])
ax2(2).XAxis.MinorTick = 'on'; 
ax2(2).XAxis.MinorTickValues = [-7,-4]; 
box on
hold off 

nexttile(tclpar2(2));
plot(log10(qI_QLHS.R206),log10(R1.top1_R206(:,6)),'.','Color',[0.4,0.4,0.4]);
ax2(3) = gca;
ax2(3).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels([])
ax2(3).TickLength = [0.05, 0.05];
ax2(3).YAxis.MinorTick = 'on'; 
ax2(3).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-7 -4])
xticks([-6 -5])
xtickangle(0)
xticklabels([])
ax2(3).XAxis.MinorTick = 'on'; 
ax2(3).XAxis.MinorTickValues = [-7,-4]; 
ylabel({'Q_{LHS}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off  



% Chloride Q out
nexttile(tclpar2(3));
plot(log10(R1_out.top1_N(:,4)),R1_out.top1_N(:,5),'.','Color',[0.4,0.4,0.4]);
ylim([0 max(R1_out.top1_N(:,5))])
ylim([0 0.2])
yticks([0.05 0.15])
yticklabels({'0.05','0.15'})
xlim([-7 -4])
xticks([-6 -5])
xtickangle(0)
xticklabels({'10^{-6}','10^{-5}'})
set(gca,'TickDir','out');
ax2(4) = gca;
ax2(4).LineWidth = 1;
ax2(4).TickLength = [0.05, 0.05];
ax2(4).YAxis.MinorTick = 'on'; 
ax2(4).YAxis.MinorTickValues = [0 0.1 0.2]; 
ax2(4).XAxis.MinorTick = 'on'; 
ax2(4).XAxis.MinorTickValues = [-7,-4]; 
box on
hold off 


% Radon Qout
nexttile(tclpar2(4));
plot(log10(R1_out.top1_R290(:,4)),log10(R1_out.top1_R290(:,5)),'.','Color',[0.4,0.4,0.4]);
ax2(5) = gca;
ax2(5).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels({'   10^{-5}','   10^{-2}'})
ax2(5).TickLength = [0.05, 0.05];
ax2(5).YAxis.MinorTick = 'on'; 
ax2(5).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-7 -4])
xticks([-6 -5])
xtickangle(0)
xticklabels({'10^{-6}','10^{-5}'})
ax2(5).XAxis.MinorTick = 'on'; 
ax2(5).XAxis.MinorTickValues = [-7,-4];  
box on
hold off 

nexttile(tclpar2(4));
plot(log10(R1_out.top1_R206(:,4)),log10(R1_out.top1_R206(:,5)),'.','Color',[0.4,0.4,0.4]);
ax2(6) = gca;
ax2(6).LineWidth = 1;
set(gca,'TickDir','out');
ylim([-6 -1])
yticks([-5 -2])
yticklabels([])
ax2(6).TickLength = [0.05, 0.05];
ax2(6).YAxis.MinorTick = 'on'; 
ax2(6).YAxis.MinorTickValues = [-6 -4 -3 -1]; 
xlim([-7 -4])
xticks([-6 -5])
xtickangle(0)
xticklabels({'10^{-6}','10^{-5}'})
ax2(6).XAxis.MinorTick = 'on'; 
ax2(6).XAxis.MinorTickValues = [-7,-4]; 
ylabel({'Q_{out}',''},'FontWeight','bold','Rotation',270)
set(gca,'YAxisLocation','right')
box on
hold off 

xlabel(tclpar2(3),'q_I [m^3 s^{-1} m^{-1}]')
xlabel(tclpar2(4),'q_I [m^3 s^{-1} m^{-1}]')
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

