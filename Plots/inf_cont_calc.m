% calculate information content (reach 1)

function [inf_fix,inf_LHS,inf_out,qI_est] = inf_cont_calc(R1,R1_out)

nbins=15;
%% Qfix

% D
stepsize = (log10(10)+5)/nbins;
edges = 10.^(-5:stepsize:log10(10));

% calculate pdfs
[fD_N,xD] = histcounts(R1.top1_N_Qfix(:,1),edges,'Normalization','probability');
XD = zeros(size(fD_N));
for i=(1:(length(xD)-1))
    XD(i)=mean([xD(i),xD(i+1)]);
end
[fD_R290,~] = histcounts(R1.top1_R290_Qfix(:,1),edges,'Normalization','probability');
[fD_b_290,~] = histcounts(R1.top1_b_290_Qfix(:,1),edges,'Normalization','probability');
[fD_R206,~] = histcounts(R1.top1_R206_Qfix(:,1),edges,'Normalization','probability');
[fD_b_206,~] = histcounts(R1.top1_b_206_Qfix(:,1),edges,'Normalization','probability');


% alpha
stepsize = (-1+5)/nbins;
edges = 10.^(-5:stepsize:-1);

% calculate pdfs
[falph_N,xalph] = histcounts(R1.top1_N_Qfix(:,2),edges,'Normalization','probability');
Xalph = zeros(size(falph_N));
for i=(1:(length(xalph)-1))
    Xalph(i)=mean([xalph(i),xalph(i+1)]);
end
[falph_R290,~] = histcounts(R1.top1_R290_Qfix(:,2),edges,'Normalization','probability');
[falph_b_290,~] = histcounts(R1.top1_b_290_Qfix(:,2),edges,'Normalization','probability');
[falph_R206,~] = histcounts(R1.top1_R206_Qfix(:,2),edges,'Normalization','probability');
[falph_b_206,~] = histcounts(R1.top1_b_206_Qfix(:,2),edges,'Normalization','probability');


% AH
stepsize = (log10(100)+5)/nbins;
edges = 10.^(-5:stepsize:log10(100));

% calculate pdfs
[fAH_N,xAH] = histcounts(R1.top1_N_Qfix(:,3),edges,'Normalization','probability');
XAH = zeros(size(fAH_N));
for i=(1:(length(xAH)-1))
    XAH(i)=mean([xAH(i),xAH(i+1)]);
end
[fAH_R290,~] = histcounts(R1.top1_R290_Qfix(:,3),edges,'Normalization','probability');
[fAH_b_290,~] = histcounts(R1.top1_b_290_Qfix(:,3),edges,'Normalization','probability');
[fAH_R206,~] = histcounts(R1.top1_R206_Qfix(:,3),edges,'Normalization','probability');
[fAH_b_206,~] = histcounts(R1.top1_b_206_Qfix(:,3),edges,'Normalization','probability');


% Calculate information content
% calculate probabilities of prior distribution
gD = zeros(size(XD))+(1/nbins);
galph = zeros(size(Xalph))+(1/nbins);
gAH = zeros(size(XAH))+(1/nbins);

% calculate Shannon entropy and kullback leibler divergence
inf_fix.H.D_g = -sum((gD.*log2(gD)),"omitnan");
inf_fix.H.D_N = -sum((fD_N.*log2(fD_N)),"omitnan");
inf_fix.H.D_R290 = -sum((fD_R290.*log2(fD_R290)),"omitnan");
if isempty(R1.top1_b_290_Qfix)
    inf_fix.H.D_b_290 = NaN;
else
    inf_fix.H.D_b_290 = -sum((fD_b_290.*log2(fD_b_290)),"omitnan");
end
inf_fix.H.D_R206 = -sum((fD_R206.*log2(fD_R206)),"omitnan");
if isempty(R1.top1_b_206_Qfix)
    inf_fix.H.D_b_206 = NaN;
else
    inf_fix.H.D_b_206 = -sum((fD_b_206.*log2(fD_b_206)),"omitnan");
end
inf_fix.DKL.D_N = sum((fD_N.*log2(fD_N./gD)),"omitnan");
inf_fix.DKL.D_R290 = sum((fD_R290.*log2(fD_R290./gD)),"omitnan");
if isempty(R1.top1_b_290_Qfix)
    inf_fix.DKL.D_b_290=NaN;
else
    inf_fix.DKL.D_b_290 = sum((fD_b_290.*log2(fD_b_290./gD)),"omitnan");
end
inf_fix.DKL.D_R206 = sum((fD_R206.*log2(fD_R206./gD)),"omitnan");
if isempty(R1.top1_b_206_Qfix)
    inf_fix.DKL.D_b_206=NaN;
else
    inf_fix.DKL.D_b_206 = sum((fD_b_206.*log2(fD_b_206./gD)),"omitnan");
end

inf_fix.H.alph_g = -sum((galph.*log2(galph)),"omitnan");
inf_fix.H.alph_N = -sum((falph_N.*log2(falph_N)),"omitnan");
inf_fix.H.alph_R290 = -sum((falph_R290.*log2(falph_R290)),"omitnan");
if isempty(R1.top1_b_290_Qfix)
    inf_fix.H.alph_b_290 = NaN;
else
    inf_fix.H.alph_b_290 = -sum((falph_b_290.*log2(falph_b_290)),"omitnan");
end
inf_fix.H.alph_R206 = -sum((falph_R206.*log2(falph_R206)),"omitnan");
if isempty(R1.top1_b_206_Qfix)
    inf_fix.H.alph_b_206 = NaN;
else
    inf_fix.H.alph_b_206 = -sum((falph_b_206.*log2(falph_b_206)),"omitnan");
end
inf_fix.DKL.alph_N = sum((falph_N.*log2(falph_N./galph)),"omitnan");
inf_fix.DKL.alph_R290 = sum((falph_R290.*log2(falph_R290./galph)),"omitnan");
if isempty(R1.top1_b_290_Qfix)
    inf_fix.DKL.alph_b_290=NaN;
else
    inf_fix.DKL.alph_b_290 = sum((falph_b_290.*log2(falph_b_290./galph)),"omitnan");
end
inf_fix.DKL.alph_R206 = sum((falph_R206.*log2(falph_R206./galph)),"omitnan");
if isempty(R1.top1_b_206_Qfix)
    inf_fix.DKL.alph_b_206=NaN;
else
    inf_fix.DKL.alph_b_206 = sum((falph_b_206.*log2(falph_b_206./galph)),"omitnan");
end

inf_fix.H.AH_g = -sum((gAH.*log2(gAH)),"omitnan");
inf_fix.H.AH_N = -sum((fAH_N.*log2(fAH_N)),"omitnan");
inf_fix.H.AH_R290 = -sum((fAH_R290.*log2(fAH_R290)),"omitnan");
if isempty(R1.top1_b_290_Qfix)
    inf_fix.H.AH_b_290 = NaN;
else
    inf_fix.H.AH_b_290 = -sum((fAH_b_290.*log2(fAH_b_290)),"omitnan");
end
inf_fix.H.AH_R206 = -sum((fAH_R206.*log2(fAH_R206)),"omitnan");
if isempty(R1.top1_b_206_Qfix)
    inf_fix.H.AH_b_206 = NaN;
else
    inf_fix.H.AH_b_206 = -sum((fAH_b_206.*log2(fAH_b_206)),"omitnan");
end
inf_fix.DKL.AH_N = sum((fAH_N.*log2(fAH_N./gAH)),"omitnan");
inf_fix.DKL.AH_R290 = sum((fAH_R290.*log2(fAH_R290./gAH)),"omitnan");
if isempty(R1.top1_b_290_Qfix)
    inf_fix.DKL.AH_b_290=NaN;
else
    inf_fix.DKL.AH_b_290 = sum((fAH_b_290.*log2(fAH_b_290./gAH)),"omitnan");
end
inf_fix.DKL.AH_R206 = sum((fAH_R206.*log2(fAH_R206./gAH)),"omitnan");
if isempty(R1.top1_b_206_Qfix)
    inf_fix.DKL.AH_b_206=NaN;
else
    inf_fix.DKL.AH_b_206 = sum((fAH_b_206.*log2(fAH_b_206./gAH)),"omitnan");
end

% save f, X, g
inf_fix.XD = XD;
inf_fix.fD_N = fD_N;
inf_fix.fD_R290 = fD_R290;
inf_fix.fD_R206 = fD_R206;
inf_fix.gD = gD;

inf_fix.Xalph = Xalph;
inf_fix.falph_N = falph_N;
inf_fix.falph_R290 = falph_R290;
inf_fix.falph_R206 = falph_R206;
inf_fix.galph = galph;

inf_fix.XAH = XAH;
inf_fix.fAH_N = fAH_N;
inf_fix.fAH_R290 = fAH_R290;
inf_fix.fAH_R206 = fAH_R206;
inf_fix.gAH = gAH;


%% QLHS

% D
stepsize = (log10(10)+5)/nbins;
edges = 10.^(-5:stepsize:log10(10));

% calculate pdfs
[fD_N,xD] = histcounts(R1.top1_N(:,1),edges,'Normalization','probability');
XD = zeros(size(fD_N));
for i=(1:(length(xD)-1))
    XD(i)=mean([xD(i),xD(i+1)]);
end
[fD_R290,~] = histcounts(R1.top1_R290(:,1),edges,'Normalization','probability');
[fD_b_290,~] = histcounts(R1.top1_b_290(:,1),edges,'Normalization','probability');
[fD_R206,~] = histcounts(R1.top1_R206(:,1),edges,'Normalization','probability');
[fD_b_206,~] = histcounts(R1.top1_b_206(:,1),edges,'Normalization','probability');


% alpha
stepsize = (-1+5)/nbins;
edges = 10.^(-5:stepsize:-1);

% calculate pdfs
[falph_N,xalph] = histcounts(R1.top1_N(:,2),edges,'Normalization','probability');
Xalph = zeros(size(falph_N));
for i=(1:(length(xalph)-1))
    Xalph(i)=mean([xalph(i),xalph(i+1)]);
end
[falph_R290,~] = histcounts(R1.top1_R290(:,2),edges,'Normalization','probability');
[falph_b_290,~] = histcounts(R1.top1_b_290(:,2),edges,'Normalization','probability');
[falph_R206,~] = histcounts(R1.top1_R206(:,2),edges,'Normalization','probability');
[falph_b_206,~] = histcounts(R1.top1_b_206(:,2),edges,'Normalization','probability');


% AH
stepsize = (log10(100)+5)/nbins;
edges = 10.^(-5:stepsize:log10(100));

% calculate pdfs
[fAH_N,xAH] = histcounts(R1.top1_N(:,3),edges,'Normalization','probability');
XAH = zeros(size(fAH_N));
for i=(1:(length(xAH)-1))
    XAH(i)=mean([xAH(i),xAH(i+1)]);
end
[fAH_R290,~] = histcounts(R1.top1_R290(:,3),edges,'Normalization','probability');
[fAH_b_290,~] = histcounts(R1.top1_b_290(:,3),edges,'Normalization','probability');
[fAH_R206,~] = histcounts(R1.top1_R206(:,3),edges,'Normalization','probability');
[fAH_b_206,~] = histcounts(R1.top1_b_206(:,3),edges,'Normalization','probability');


% Calculate information content
% calculate probabilities of prior distribution
gD = zeros(size(XD))+(1/nbins);
galph = zeros(size(Xalph))+(1/nbins);
gAH = zeros(size(XAH))+(1/nbins);

% calculate Shannon entropy and kullback leibler divergence
inf_LHS.H.D_g = -sum((gD.*log2(gD)),"omitnan");
inf_LHS.H.D_N = -sum((fD_N.*log2(fD_N)),"omitnan");
inf_LHS.H.D_R290 = -sum((fD_R290.*log2(fD_R290)),"omitnan");
if isempty(R1.top1_b_290)
    inf_LHS.H.D_b_290 = NaN;
else
    inf_LHS.H.D_b_290 = -sum((fD_b_290.*log2(fD_b_290)),"omitnan");
end
inf_LHS.H.D_R206 = -sum((fD_R206.*log2(fD_R206)),"omitnan");
if isempty(R1.top1_b_206)
    inf_LHS.H.D_b_206 = NaN;
else
    inf_LHS.H.D_b_206 = -sum((fD_b_206.*log2(fD_b_206)),"omitnan");
end
inf_LHS.DKL.D_N = sum((fD_N.*log2(fD_N./gD)),"omitnan");
inf_LHS.DKL.D_R290 = sum((fD_R290.*log2(fD_R290./gD)),"omitnan");
if isempty(R1.top1_b_290)
    inf_LHS.DKL.D_b_290=NaN;
else
    inf_LHS.DKL.D_b_290 = sum((fD_b_290.*log2(fD_b_290./gD)),"omitnan");
end
inf_LHS.DKL.D_R206 = sum((fD_R206.*log2(fD_R206./gD)),"omitnan");
if isempty(R1.top1_b_206)
    inf_LHS.DKL.D_b_206=NaN;
else
    inf_LHS.DKL.D_b_206 = sum((fD_b_206.*log2(fD_b_206./gD)),"omitnan");
end

inf_LHS.H.alph_g = -sum((galph.*log2(galph)),"omitnan");
inf_LHS.H.alph_N = -sum((falph_N.*log2(falph_N)),"omitnan");
inf_LHS.H.alph_R290 = -sum((falph_R290.*log2(falph_R290)),"omitnan");
if isempty(R1.top1_b_290)
    inf_LHS.H.alph_b_290 = NaN;
else
    inf_LHS.H.alph_b_290 = -sum((falph_b_290.*log2(falph_b_290)),"omitnan");
end
inf_LHS.H.alph_R206 = -sum((falph_R206.*log2(falph_R206)),"omitnan");
if isempty(R1.top1_b_206)
    inf_LHS.H.alph_b_206 = NaN;
else
    inf_LHS.H.alph_b_206 = -sum((falph_b_206.*log2(falph_b_206)),"omitnan");
end
inf_LHS.DKL.alph_N = sum((falph_N.*log2(falph_N./galph)),"omitnan");
inf_LHS.DKL.alph_R290 = sum((falph_R290.*log2(falph_R290./galph)),"omitnan");
if isempty(R1.top1_b_290)
    inf_LHS.DKL.alph_b_290=NaN;
else
    inf_LHS.DKL.alph_b_290 = sum((falph_b_290.*log2(falph_b_290./galph)),"omitnan");
end
inf_LHS.DKL.alph_R206 = sum((falph_R206.*log2(falph_R206./galph)),"omitnan");
if isempty(R1.top1_b_206)
    inf_LHS.DKL.alph_b_206=NaN;
else
    inf_LHS.DKL.alph_b_206 = sum((falph_b_206.*log2(falph_b_206./galph)),"omitnan");
end

inf_LHS.H.AH_g = -sum((gAH.*log2(gAH)),"omitnan");
inf_LHS.H.AH_N = -sum((fAH_N.*log2(fAH_N)),"omitnan");
inf_LHS.H.AH_R290 = -sum((fAH_R290.*log2(fAH_R290)),"omitnan");
if isempty(R1.top1_b_290)
    inf_LHS.H.AH_b_290 = NaN;
else
    inf_LHS.H.AH_b_290 = -sum((fAH_b_290.*log2(fAH_b_290)),"omitnan");
end
inf_LHS.H.AH_R206 = -sum((fAH_R206.*log2(fAH_R206)),"omitnan");
if isempty(R1.top1_b_206)
    inf_LHS.H.AH_b_206 = NaN;
else
    inf_LHS.H.AH_b_206 = -sum((fAH_b_206.*log2(fAH_b_206)),"omitnan");
end
inf_LHS.DKL.AH_N = sum((fAH_N.*log2(fAH_N./gAH)),"omitnan");
inf_LHS.DKL.AH_R290 = sum((fAH_R290.*log2(fAH_R290./gAH)),"omitnan");
if isempty(R1.top1_b_290)
    inf_LHS.DKL.AH_b_290=NaN;
else
    inf_LHS.DKL.AH_b_290 = sum((fAH_b_290.*log2(fAH_b_290./gAH)),"omitnan");
end
inf_LHS.DKL.AH_R206 = sum((fAH_R206.*log2(fAH_R206./gAH)),"omitnan");
if isempty(R1.top1_b_206)
    inf_LHS.DKL.AH_b_206=NaN;
else
    inf_LHS.DKL.AH_b_206 = sum((fAH_b_206.*log2(fAH_b_206./gAH)),"omitnan");
end

% save f, X, g
inf_LHS.XD = XD;
inf_LHS.fD_N = fD_N;
inf_LHS.fD_R290 = fD_R290;
inf_LHS.fD_R206 = fD_R206;
inf_LHS.gD = gD;

inf_LHS.Xalph = Xalph;
inf_LHS.falph_N = falph_N;
inf_LHS.falph_R290 = falph_R290;
inf_LHS.falph_R206 = falph_R206;
inf_LHS.galph = galph;

inf_LHS.XAH = XAH;
inf_LHS.fAH_N = fAH_N;
inf_LHS.fAH_R290 = fAH_R290;
inf_LHS.fAH_R206 = fAH_R206;
inf_LHS.gAH = gAH;

%% Qout

% D
stepsize = (log10(10)+5)/nbins;
edges = 10.^(-5:stepsize:log10(10));

% calculate pdfs
[fD_N,xD] = histcounts(R1_out.top1_N(:,1),edges,'Normalization','probability');
XD = zeros(size(fD_N));
for i=(1:(length(xD)-1))
    XD(i)=mean([xD(i),xD(i+1)]);
end
[fD_R290,~] = histcounts(R1_out.top1_R290(:,1),edges,'Normalization','probability');
[fD_b_290,~] = histcounts(R1_out.top1_b_290(:,1),edges,'Normalization','probability');
[fD_R206,~] = histcounts(R1_out.top1_R206(:,1),edges,'Normalization','probability');
[fD_b_206,~] = histcounts(R1_out.top1_b_206(:,1),edges,'Normalization','probability');


% alpha
stepsize = (-1+5)/nbins;
edges = 10.^(-5:stepsize:-1);

% calculate pdfs
[falph_N,xalph] = histcounts(R1_out.top1_N(:,2),edges,'Normalization','probability');
Xalph = zeros(size(falph_N));
for i=(1:(length(xalph)-1))
    Xalph(i)=mean([xalph(i),xalph(i+1)]);
end
[falph_R290,~] = histcounts(R1_out.top1_R290(:,2),edges,'Normalization','probability');
[falph_b_290,~] = histcounts(R1_out.top1_b_290(:,2),edges,'Normalization','probability');
[falph_R206,~] = histcounts(R1_out.top1_R206(:,2),edges,'Normalization','probability');
[falph_b_206,~] = histcounts(R1_out.top1_b_206(:,2),edges,'Normalization','probability');


% AH
stepsize = (log10(100)+5)/nbins;
edges = 10.^(-5:stepsize:log10(100));

% calculate pdfs
[fAH_N,xAH] = histcounts(R1_out.top1_N(:,3),edges,'Normalization','probability');
XAH = zeros(size(fAH_N));
for i=(1:(length(xAH)-1))
    XAH(i)=mean([xAH(i),xAH(i+1)]);
end
[fAH_R290,~] = histcounts(R1_out.top1_R290(:,3),edges,'Normalization','probability');
[fAH_b_290,~] = histcounts(R1_out.top1_b_290(:,3),edges,'Normalization','probability');
[fAH_R206,~] = histcounts(R1_out.top1_R206(:,3),edges,'Normalization','probability');
[fAH_b_206,~] = histcounts(R1_out.top1_b_206(:,3),edges,'Normalization','probability');


% qI
stepsize = (-4+7)/nbins;
edges = 10.^(-7:stepsize:-4);

% calculate pdfs
[fqI_N,xqI] = histcounts(R1_out.top1_N(:,4),edges,'Normalization','probability');
XqI = zeros(size(fqI_N));
for i=(1:(length(xqI)-1))
    XqI(i)=mean([xqI(i),xqI(i+1)]);
end
[fqI_R290,~] = histcounts(R1_out.top1_R290(:,4),edges,'Normalization','probability');
[fqI_b_290,~] = histcounts(R1_out.top1_b_290(:,4),edges,'Normalization','probability');
[fqI_R206,~] = histcounts(R1_out.top1_R206(:,4),edges,'Normalization','probability');
[fqI_b_206,~] = histcounts(R1_out.top1_b_206(:,4),edges,'Normalization','probability');


% Calculate information content
% calculate probabilities of prior distribution
gD = zeros(size(XD))+(1/nbins);
galph = zeros(size(Xalph))+(1/nbins);
gAH = zeros(size(XAH))+(1/nbins);
gqI = zeros(size(XqI))+(1/nbins);

% calculate Shannon entropy and kullback leibler divergence
inf_out.H.D_g = -sum((gD.*log2(gD)),"omitnan");
inf_out.H.D_N = -sum((fD_N.*log2(fD_N)),"omitnan");
inf_out.H.D_R290 = -sum((fD_R290.*log2(fD_R290)),"omitnan");
if isempty(R1_out.top1_b_290)
    inf_out.H.D_b_290 = NaN;
else
    inf_out.H.D_b_290 = -sum((fD_b_290.*log2(fD_b_290)),"omitnan");
end
inf_out.H.D_R206 = -sum((fD_R206.*log2(fD_R206)),"omitnan");
if isempty(R1_out.top1_b_206)
    inf_out.H.D_b_206 = NaN;
else
    inf_out.H.D_b_206 = -sum((fD_b_206.*log2(fD_b_206)),"omitnan");
end
inf_out.DKL.D_N = sum((fD_N.*log2(fD_N./gD)),"omitnan");
inf_out.DKL.D_R290 = sum((fD_R290.*log2(fD_R290./gD)),"omitnan");
if isempty(R1_out.top1_b_290)
    inf_out.DKL.D_b_290=NaN;
else
    inf_out.DKL.D_b_290 = sum((fD_b_290.*log2(fD_b_290./gD)),"omitnan");
end
inf_out.DKL.D_R206 = sum((fD_R206.*log2(fD_R206./gD)),"omitnan");
if isempty(R1_out.top1_b_206)
    inf_out.DKL.D_b_206=NaN;
else
    inf_out.DKL.D_b_206 = sum((fD_b_206.*log2(fD_b_206./gD)),"omitnan");
end

inf_out.H.alph_g = -sum((galph.*log2(galph)),"omitnan");
inf_out.H.alph_N = -sum((falph_N.*log2(falph_N)),"omitnan");
inf_out.H.alph_R290 = -sum((falph_R290.*log2(falph_R290)),"omitnan");
if isempty(R1_out.top1_b_290)
    inf_out.H.alph_b_290 = NaN;
else
    inf_out.H.alph_b_290 = -sum((falph_b_290.*log2(falph_b_290)),"omitnan");
end
inf_out.H.alph_R206 = -sum((falph_R206.*log2(falph_R206)),"omitnan");
if isempty(R1_out.top1_b_206)
    inf_out.H.alph_b_206 = NaN;
else
    inf_out.H.alph_b_206 = -sum((falph_b_206.*log2(falph_b_206)),"omitnan");
end
inf_out.DKL.alph_N = sum((falph_N.*log2(falph_N./galph)),"omitnan");
inf_out.DKL.alph_R290 = sum((falph_R290.*log2(falph_R290./galph)),"omitnan");
if isempty(R1_out.top1_b_290)
    inf_out.DKL.alph_b_290=NaN;
else
    inf_out.DKL.alph_b_290 = sum((falph_b_290.*log2(falph_b_290./galph)),"omitnan");
end
inf_out.DKL.alph_R206 = sum((falph_R206.*log2(falph_R206./galph)),"omitnan");
if isempty(R1_out.top1_b_206)
    inf_out.DKL.alph_b_206=NaN;
else
    inf_out.DKL.alph_b_206 = sum((falph_b_206.*log2(falph_b_206./galph)),"omitnan");
end

inf_out.H.AH_g = -sum((gAH.*log2(gAH)),"omitnan");
inf_out.H.AH_N = -sum((fAH_N.*log2(fAH_N)),"omitnan");
inf_out.H.AH_R290 = -sum((fAH_R290.*log2(fAH_R290)),"omitnan");
if isempty(R1_out.top1_b_290)
    inf_out.H.AH_b_290 = NaN;
else
    inf_out.H.AH_b_290 = -sum((fAH_b_290.*log2(fAH_b_290)),"omitnan");
end
inf_out.H.AH_R206 = -sum((fAH_R206.*log2(fAH_R206)),"omitnan");
if isempty(R1_out.top1_b_206)
    inf_out.H.AH_b_206 = NaN;
else
    inf_out.H.AH_b_206 = -sum((fAH_b_206.*log2(fAH_b_206)),"omitnan");
end
inf_out.DKL.AH_N = sum((fAH_N.*log2(fAH_N./gAH)),"omitnan");
inf_out.DKL.AH_R290 = sum((fAH_R290.*log2(fAH_R290./gAH)),"omitnan");
if isempty(R1_out.top1_b_290)
    inf_out.DKL.AH_b_290=NaN;
else
    inf_out.DKL.AH_b_290 = sum((fAH_b_290.*log2(fAH_b_290./gAH)),"omitnan");
end
inf_out.DKL.AH_R206 = sum((fAH_R206.*log2(fAH_R206./gAH)),"omitnan");
if isempty(R1_out.top1_b_206)
    inf_out.DKL.AH_b_206=NaN;
else
    inf_out.DKL.AH_b_206 = sum((fAH_b_206.*log2(fAH_b_206./gAH)),"omitnan");
end

inf_out.H.qI_g = -sum((gqI.*log2(gqI)),"omitnan");
inf_out.H.qI_N = -sum((fqI_N.*log2(fqI_N)),"omitnan");
inf_out.H.qI_R290 = -sum((fqI_R290.*log2(fqI_R290)),"omitnan");
if isempty(R1_out.top1_b_290)
    inf_out.H.qI_b_290 = NaN;
else
    inf_out.H.qI_b_290 = -sum((fqI_b_290.*log2(fqI_b_290)),"omitnan");
end
inf_out.H.qI_R206 = -sum((fqI_R206.*log2(fqI_R206)),"omitnan");
if isempty(R1_out.top1_b_206)
    inf_out.H.qI_b_206 = NaN;
else
    inf_out.H.qI_b_206 = -sum((fqI_b_206.*log2(fqI_b_206)),"omitnan");
end
inf_out.DKL.qI_N = sum((fqI_N.*log2(fqI_N./gqI)),"omitnan");
inf_out.DKL.qI_R290 = sum((fqI_R290.*log2(fqI_R290./gqI)),"omitnan");
if isempty(R1_out.top1_b_290)
    inf_out.DKL.qI_b_290=NaN;
else
    inf_out.DKL.qI_b_290 = sum((fqI_b_290.*log2(fqI_b_290./gqI)),"omitnan");
end
inf_out.DKL.qI_R206 = sum((fqI_R206.*log2(fqI_R206./gqI)),"omitnan");
if isempty(R1_out.top1_b_206)
    inf_out.DKL.qI_b_206=NaN;
else
    inf_out.DKL.qI_b_206 = sum((fqI_b_206.*log2(fqI_b_206./gqI)),"omitnan");
end


% save f, X, g
inf_out.XD = XD;
inf_out.fD_N = fD_N;
inf_out.fD_R290 = fD_R290;
inf_out.fD_b_290 = fD_b_290;
inf_out.fD_R206 = fD_R206;
inf_out.fD_b_206 = fD_b_206;
inf_out.gD = gD;

inf_out.Xalph = Xalph;
inf_out.falph_N = falph_N;
inf_out.falph_R290 = falph_R290;
inf_out.falph_b_290 = falph_b_290;
inf_out.falph_R206 = falph_R206;
inf_out.falph_b_206 = falph_b_206;
inf_out.galph = galph;

inf_out.XAH = XAH;
inf_out.fAH_N = fAH_N;
inf_out.fAH_R290 = fAH_R290;
inf_out.fAH_b_290 = fAH_b_290;
inf_out.fAH_R206 = fAH_R206;
inf_out.fAH_b_206 = fAH_b_206;
inf_out.gAH = gAH;

inf_out.XqI = XqI;
inf_out.fqI_N = fqI_N;
inf_out.fqI_R290 = fqI_R290;
inf_out.fqI_b_290 = fqI_b_290;
inf_out.fqI_R206 = fqI_R206;
inf_out.fqI_b_206 = fqI_b_206;
inf_out.gqI = gqI;

% extract most likely value (highest bin), min and max for qI from Qout
% I would use the b_290 and b_206 cases as these are the cases that are
% constraint by both tracers --> AH small enough for chloride
ind_mod = find(fqI_R290==max(fqI_R290));
qI_est.mod_R290 = XqI(ind_mod);
ind_mod = find(fqI_b_290==max(fqI_b_290));
qI_est.mod_R290_b = XqI(ind_mod);
ind_mod = find(fqI_R206==max(fqI_R206));
qI_est.mod_R206 = XqI(ind_mod);
ind_mod = find(fqI_b_206==max(fqI_b_206));
qI_est.mod_R206_b = XqI(ind_mod);

qI_est.min_R290 = min(R1_out.top1_R290(:,4));
qI_est.min_R290_b = min(R1_out.top1_b_290(:,4));
qI_est.min_R206 = min(R1_out.top1_R206(:,4));
qI_est.min_R206_b = min(R1_out.top1_b_206(:,4));

qI_est.max_R290 = max(R1_out.top1_R290(:,4));
qI_est.max_R290_b = max(R1_out.top1_b_290(:,4));
qI_est.max_R206 = max(R1_out.top1_R206(:,4));
qI_est.max_R206_b = max(R1_out.top1_b_206(:,4));

qI_est.CI95_R290 = prctile(R1_out.top1_R290(:,4),[5,95]);
qI_est.CI95_b_290 = prctile(R1_out.top1_b_290(:,4),[5,95]);
qI_est.CI95_R206 = prctile(R1_out.top1_R206(:,4),[5,95]);
qI_est.CI95_b_206 = prctile(R1_out.top1_b_206(:,4),[5,95]);


% % plot
% f=figure;
% 
% % D
% subplot(2,4,1)
% semilogx([1e-5,XD,10],[0,fD_N,0],'Color','b',LineWidth=1.5);
% hold on
% semilogx([1e-5,XD,10],[0,fD_R290,0],'Color','r',LineWidth=1.5);
% semilogx([1e-5,XD,10],[0,fD_b_290,0],'Color','k',LineWidth=1.5);
% xlim([10^(-5) 10])
% xticks([10^(-4) 1])
% xticklabels([10^(-4) 1])
% xlabel('D')
% ylabel('PDF (k high)')
% set(gca,'TickDir','out');
% ax = gca;
% ax.LineWidth = 1;
% box on
% 
% subplot(2,4,5)
% semilogx([1e-5,XD,10],[0,fD_N,0],'Color','b',LineWidth=1.5);
% hold on
% semilogx([1e-5,XD,10],[0,fD_R206,0],'Color','r',LineWidth=1.5)
% semilogx([1e-5,XD,10],[0,fD_b_206,0],'Color','k',LineWidth=1.5)
% xlim([10^(-5) 10])
% xticks([10^(-4) 1])
% xticklabels([10^(-4) 1])
% xlabel('D')
% ylabel('PDF (k low)')
% set(gca,'TickDir','out');
% ax = gca;
% ax.LineWidth = 1;
% box on
% 
% 
% % alph
% subplot(2,4,2)
% semilogx([1e-5,Xalph,1e-1],[0,falph_N,0],'Color','b',LineWidth=1.5);
% hold on
% semilogx([1e-5,Xalph,1e-1],[0,falph_R290,0],'Color','r',LineWidth=1.5);
% semilogx([1e-5,Xalph,1e-1],[0,falph_b_290,0],'Color','k',LineWidth=1.5);
% xlim([10^(-5) 10^(-1)])
% xticks([10^(-4) 10^(-2)])
% xticklabels([10^(-4) 10^(-2)])
% xlabel('\alpha')
% set(gca,'TickDir','out');
% ax = gca;
% ax.LineWidth = 1;
% box on
% 
% subplot(2,4,6)
% semilogx([1e-5,Xalph,1e-1],[0,falph_N,0],'Color','b',LineWidth=1.5);
% hold on
% semilogx([1e-5,Xalph,1e-1],[0,falph_R206,0],'Color','r',LineWidth=1.5)
% semilogx([1e-5,Xalph,1e-1],[0,falph_b_206,0],'Color','k',LineWidth=1.5)
% xlim([10^(-5) 10^(-1)])
% xticks([10^(-4) 10^(-2)])
% xticklabels([10^(-4) 10^(-2)])
% xlabel('\alpha')
% set(gca,'TickDir','out');
% ax = gca;
% ax.LineWidth = 1;
% box on
% 
% 
% % AH
% subplot(2,4,3)
% semilogx([xAH(1),XAH,xAH(end)],[0,fAH_N,0],'Color','b',LineWidth=1.5);
% hold on
% semilogx([xAH(1),XAH,xAH(end)],[0,fAH_R290,0],'Color','r',LineWidth=1.5);
% semilogx([xAH(1),XAH,xAH(end)],[0,fAH_b_290,0],'Color','k',LineWidth=1.5);
% xlim([10^(-5) 100])
% xticks([10^(-4) 10])
% xticklabels([10^(-4) 10])
% xlabel('A_H')
% set(gca,'TickDir','out');
% ax = gca;
% ax.LineWidth = 1;
% box on
% 
% subplot(2,4,7)
% semilogx([xAH(1),XAH,xAH(end)],[0,fAH_N,0],'Color','b',LineWidth=1.5);
% hold on
% semilogx([xAH(1),XAH,xAH(end)],[0,fAH_R206,0],'Color','r',LineWidth=1.5)
% semilogx([xAH(1),XAH,xAH(end)],[0,fAH_b_206,0],'Color','k',LineWidth=1.5)
% xlim([10^(-5) 100])
% xticks([10^(-4) 10])
% xticklabels([10^(-4) 10])
% xlabel('A_H')
% set(gca,'TickDir','out');
% ax = gca;
% ax.LineWidth = 1;
% box on
% 
% 
% % qI
% subplot(2,4,4)
% semilogx([xqI(1),XqI,xqI(end)],[0,fqI_N,0],'Color','b',LineWidth=1.5);
% hold on
% semilogx([xqI(1),XqI,xqI(end)],[0,fqI_R290,0],'Color','r',LineWidth=1.5);
% semilogx([xqI(1),XqI,xqI(end)],[0,fqI_b_290,0],'Color','k',LineWidth=1.5);
% xlim([10^(-7) 10^(-4)])
% xticks([10^(-6) 10^(-3)])
% xticklabels([10^(-6) 10^(-3)])
% xlabel('q_I')
% set(gca,'TickDir','out');
% ax = gca;
% ax.LineWidth = 1;
% box on
% 
% subplot(2,4,8)
% semilogx([xqI(1),XqI,xqI(end)],[0,fqI_N,0],'Color','b',LineWidth=1.5);
% hold on
% semilogx([xqI(1),XqI,xqI(end)],[0,fqI_R206,0],'Color','r',LineWidth=1.5)
% semilogx([xqI(1),XqI,xqI(end)],[0,fqI_b_206,0],'Color','k',LineWidth=1.5)
% xlim([10^(-7) 10^(-4)])
% xticks([10^(-6) 10^(-3)])
% xticklabels([10^(-6) 10^(-3)])
% xlabel('q_I')
% set(gca,'TickDir','out');
% ax = gca;
% ax.LineWidth = 1;
% box on