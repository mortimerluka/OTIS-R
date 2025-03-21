
function f = BTC_plot(R1,R1_out)
%%

% set values in BTC below 1e-16 to zero
R1.TEMP_BTC_N(R1.TEMP_BTC_N<1e-16)=0;
R1.TEMP_BTC_N_Qfix(R1.TEMP_BTC_N_Qfix<1e-16)=0;
R1_out.TEMP_BTC_N(R1_out.TEMP_BTC_N<1e-16)=0;

% calculate behavioral envelope
R1.Interp_curve_N=zeros(length(R1.TEMP_BTC_N(:,1)),6);
for i=1:1:length(R1.TEMP_BTC_N(:,1)) 
    R1.Interp_curve_N(i,1)=min(R1.TEMP_BTC_N(i,:));
    R1.Interp_curve_N(i,2)=max(R1.TEMP_BTC_N(i,:));   
    R1.Interp_curve_N(i,3)=min(R1.TEMP_BTC_N_Qfix(i,:));
    R1.Interp_curve_N(i,4)=max(R1.TEMP_BTC_N_Qfix(i,:));
    R1.Interp_curve_N(i,5)=min(R1_out.TEMP_BTC_N(i,:));
    R1.Interp_curve_N(i,6)=max(R1_out.TEMP_BTC_N(i,:));
end

f=figure;
tcl = tiledlayout(1,3,'TileSpacing','loose','Padding','compact');

nexttile(tcl);
plot(R1.NaCl_down(:,1),R1.NaCl_down(:,2),'r','LineWidth',2);
hold on
x2 = [R1.NaCl_down(:,1)', fliplr(R1.NaCl_down(:,1)')];
inBetween = [R1.Interp_curve_N(:,1)', fliplr(R1.Interp_curve_N(:,2)')];
fill(x2, inBetween,'k','EdgeColor','k','FaceAlpha',0.2,'LineWidth',1);
plot(R1.NaCl_down(:,1),R1.TEMP_BTC_N(:,1),'k--','LineWidth',1.5);
ylabel('NaCl concentration');
xlabel('time [hr]')
xlim([min(R1.NaCl_down(:,1)) max(R1.NaCl_down(:,1))])
set(gca,'TickDir','out');
set(gca, 'YMinorTick','off')
set(gca, 'XMinorTick','off')
ax = gca;
ax.LineWidth = 1.5;
box on

nexttile(tcl);
plot(R1.NaCl_down(:,1),R1.NaCl_down(:,2),'r','LineWidth',2);
hold on
inBetween = [R1.Interp_curve_N(:,3)', fliplr(R1.Interp_curve_N(:,4)')];
fill(x2, inBetween,'k','EdgeColor','k','FaceAlpha',0.2,'LineWidth',1);
plot(R1.NaCl_down(:,1),R1.TEMP_BTC_N_Qfix(:,1),'k--','LineWidth',1.5);
xlabel('time [hr]')
xlim([min(R1.NaCl_down(:,1)) max(R1.NaCl_down(:,1))])
set(gca,'TickDir','out');
set(gca, 'YMinorTick','off')
set(gca, 'XMinorTick','off')
ax = gca;
ax.LineWidth = 1.5;
box on

nexttile(tcl);
plot(R1.NaCl_down(:,1),R1.NaCl_down(:,2),'r','LineWidth',2);
hold on
inBetween = [R1.Interp_curve_N(:,5)', fliplr(R1.Interp_curve_N(:,6)')];
fill(x2, inBetween,'k','EdgeColor','k','FaceAlpha',0.2,'LineWidth',1);
plot(R1_out.NaCl_down(:,1),R1_out.TEMP_BTC_N(:,1),'k--','LineWidth',1.5);
xlabel('time [hr]')
xlim([min(R1_out.NaCl_down(:,1)) max(R1_out.NaCl_down(:,1))])
set(gca,'TickDir','out');
set(gca, 'YMinorTick','off')
set(gca, 'XMinorTick','off')
ax = gca;
ax.LineWidth = 1.5;
box on

fontname(f,'Helvetica');
f.Units = 'centimeters';        % set figure units to cm
f.Position = [0 0 13.7 5.0];   % set figure size
f.PaperUnits = 'centimeters';   % set pdf printing paper units to cm
f.PaperSize = f.Position(3:4);  % assign to the pdf printing paper the size of the figure