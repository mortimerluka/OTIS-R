function Model_N=OTIS_run_N(Instate,i,OTIS_hypercube_input,OSFLAG)

% Modified from OTIS-MCAT (Ward et al., 2017)

PRTOPT  = Instate.PRTOPT;                          
PSTEP   = Instate.PSTEP(1);                
TSTEP   = Instate.TSTEP(1);                 
TSTART  = Instate.TSTART;                      
TFINAL  = Instate.TFINAL;                        
XSTART  = Instate.XSTART;                    
DSBOUND = Instate.DSBOUND;
NREACH  = Instate.NREACH;

NSEG    = Instate.NSEG;
RCHLEN  = Instate.RCHLEN;
DISP  = OTIS_hypercube_input(i,1);
ALPHA = OTIS_hypercube_input(i,2);
AREA2 = OTIS_hypercube_input(i,3);
NSOLUTE = Instate.NSOLUTE;
IDECAY  = Instate.IDECAY(1);
ISORB   = Instate.ISORB;
IGASEX  = Instate.IGASEX(1);
 
NPRINT  = Instate.NPRINT;
IOPT    = Instate.IOPT;
PRINTLOC= Instate.PRINTLOC;
 
NBOUND  = Instate.NBOUND_N;
IBOUND  = Instate.IBOUND_N;
USTIME_USBC = Instate.USTIME_USBC_N;
 
QSTEP   = Instate.QSTEP;

Q_up  = Instate.Qup;
Q_down = Instate.Qdown;

QSTART = Q_up;

q_I = OTIS_hypercube_input(i,4);
q_O=q_I-(Q_down-Q_up)/Instate.PRINTLOC;

QLATIN = q_I;
QLATOUT = q_O;
AREA  = mean([Q_up,Q_down])/Instate.v;
DEPTH = Instate.DEPTH;
CLATIN = Instate.CLATIN(1);

% Modify the PARAMS:INP file -> This comes directly from OTIS_Mcat
% Modified to work for OTISR

template=fopen('params_N.template', 'rt');
params=fopen('PARAMS.INP','wt');

for k=1:115
    tline = fgetl(template);
        if ~ischar(tline),   break,   end      
    switch k
        case 19
            fprintf(params, '%1i\n', PRTOPT);
        case 20
            fprintf(params, '%9f\n', PSTEP);
        case 21
            fprintf(params, '%9f\n', TSTEP);
        case 22
            fprintf(params, '%9f\n', TSTART);
        case 23
            fprintf(params, '%9f\n', TFINAL);
        case 24
            fprintf(params, '%9f\n', XSTART);
        case 25
            fprintf(params, '%9f\n', DSBOUND);
        case 26
            fprintf(params, '%1i\n', NREACH);
        case 41
            fprintf(params, '%5i%13i%13f%13f%13f\n', NSEG, RCHLEN, DISP, AREA2, ALPHA);
        case 53
            fprintf(params, '%5i%5i%5i%5i\n', NSOLUTE, IDECAY, ISORB, IGASEX);
        % case 63
        %     fprintf(params, '%13f%13f%13f\n', LAMBDA, LAMBDA2,PRODUCTION);
        % case 82
        %     fprintf(params, '%13f\n', GASEX);
        case 91
            fprintf(params, '%5i%5i\n', NPRINT, IOPT);
        case 95
            fprintf(params, '%f\n', PRINTLOC);
        case 109
            fprintf(params, '%5i%5i\n', NBOUND, IBOUND);
        case 113
            for h=1:height(USTIME_USBC)
                fprintf(params, '%13f%13f\n', USTIME_USBC(h,:));
            end
        otherwise    
            fprintf(params, '%s\n', tline);
    end
end

fclose(template);
fclose(params);    
 
% Modify the Q.INP text file
template=fopen('q_N.template','rt');
discharge=fopen('Q.INP','wt');

for k=1:31
    tline = fgetl(template);
        if ~ischar(tline),   break,   end      
    switch k
        case 13
            fprintf(discharge, '%5i\n', QSTEP);
        case 17
            fprintf(discharge, '%5f\n', QSTART);
        case 31
            fprintf(discharge, '%13f%13f%13f%13f%13f\n',QLATIN,QLATOUT,AREA,DEPTH,CLATIN);
        otherwise    
            fprintf(discharge, '%s\n', tline);
    end
end

fclose(template);
fclose(discharge);  


% Execute the OTISR software (it has to be in the same folder)

    %FOR A PC
    if OSFLAG==1
        !otisr_v3.exe
    end

    %FOR A UNIX/LINUX
    if OSFLAG==2
        !./otisrv3.out
    end

% % % % % % % % % % % % % % %     
% Load the OTIS output of the soluteout.out txt
% soluteout.out(:,1) time [hrs]
% soluteout.out(:,2) conc in the stream channel [g/m3]
% soluteout.out(:,3) conc in the TS zone [g/m3]
    %a=column #1: time in hrs
    %b=column #2: stream solute concentration 
    %c=column #3: transient storage zone concentration

[a, b] = textread('soluteout.out','%s %s') ;    
% [a, b, c] = textread('soluteout.out','%s %s %s') ;     % if we want TS  
% Pre-allocation of our BTC curves    
ttime =  zeros(1,length(a));
conc_Channel = zeros(1,length(b));
% conc_TS  = zeros(1,length(c));  
    
for pp = 1:length(a)
    atest = isstrprop(a{pp,1}, 'alpha');
    btest = isstrprop(b{pp,1}, 'alpha');
%     ctest = isstrprop(c{pp,1}, 'alpha');
    
    if sum(atest) > 0.0
        ttime(1,pp) = sscanf(a{pp,1}, '%13E');  
    else
        ttime(1,pp) = sscanf('0','%13E');
    end

    if sum(btest) > 0.0
        conc_Channel(1,pp) = sscanf(b{pp,1},'%13E');
    else
        conc_Channel(1,pp) = sscanf('0','%13E');
    end
    
%     if sum(ctest) > 0.0;
%         conc_TS(1,pp) = sscanf(c{pp,1},'%13E');
%     else
%         conc_TS(1,pp) = sscanf('0','%13E');
%     end
end    
    
Model_N.ttime=ttime;
Model_N.conc_Channel=conc_Channel;
% Model.conc_TS=conc_TS;
    
end

