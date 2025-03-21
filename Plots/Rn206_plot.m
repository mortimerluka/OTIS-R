
function f = Rn206_plot(R1,R1_out)
%%


f=figure;
tcl = tiledlayout(1,1,'TileSpacing','loose','Padding','compact');

nexttile(tcl);
swarmchart(ones(2000,1),R1.TEMP_BTC_R206,'filled','MarkerFaceColor','k',SizeData = 5);
hold on
swarmchart(ones(2000,1)+1,R1.TEMP_BTC_R206_Qfix,'filled','MarkerFaceColor','k',SizeData = 5);
swarmchart(ones(2000,1)+2,R1_out.TEMP_BTC_R206,'filled','MarkerFaceColor','k',SizeData = 5);
yline(R1.Rn_down,'k-',LineWidth=1)
yline([R1.Rn_down+R1.Rn_down_95CI,R1.Rn_down-R1.Rn_down_95CI],'k--',LineWidth=1)
xticks([1,2,3,4])
ylabel('^{222}Rn activity')
xticklabels([{'Q_{fix}'},{'Q_{LHS}'},{'Q_{out}'}])
ylim([R1.Rn_down-R1.Rn_down_95CI-8 R1.Rn_down+R1.Rn_down_95CI+8])
yticks([round(R1.Rn_down-R1.Rn_down_95CI), R1.Rn_down, round(R1.Rn_down+R1.Rn_down_95CI)])
set(gca,'TickDir','out');
set(gca, 'YMinorTick','off')
set(gca, 'XMinorTick','off')
ax = gca;
ax.LineWidth = 1.5;
box on


fontname(f,'Helvetica');
f.Units = 'centimeters';        % set figure units to cm
f.Position = [0 0 13.7 5.5];   % set figure size
f.PaperUnits = 'centimeters';   % set pdf printing paper units to cm
f.PaperSize = f.Position(3:4);  % assign to the pdf printing paper the size of the figure