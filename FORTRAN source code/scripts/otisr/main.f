************************************************************************
*
*     OTISR: One-dimensional Transport with Inflow and Storage - Radon
*     -------------------------------------------------------
*     
*
************************************************************************
*
*     Version: OTISR         Okt. 2023
*
*     Author: Mortimer Bacher
*
************************************************************************
*     Based on: OTIS (One-dimensional Transport with Inflow and Storage)
*
*     Reference
*     ---------
*     Runkel, R.L., 1998, One dimensional transport with inflow and
*       storage (OTIS): A solute transport model for streams and rivers:
*       U.S. Geological Survey Water-Resources Investigation Report
*       98-4018. xx p.
*
*     Homepage:  http://webserver.cr.usgs.gov/otis/home.html
*     ---------
*
*     Author
*     ------
*     R.L. Runkel
*     U.S. Geological Survey
*     Mail Stop 415
*     Denver Federal Center
*     Lakewood, CO 80225
*     Internet: runkel@usgs.gov
*
*     OTIS is a mathematical simulation model used to characterize the
*     fate and transport of water-borne solutes in streams and rivers.
*     The governing equation underlying the model is the advection-
*     dispersion equation with additional terms to account for transient
*     storage, lateral inflow, first-order decay and sorption. This
*     equation and the associated equations describing transient
*     storage and sorption are solved using a Crank-Nicolson finite
*     difference solution.
*
*     The OTIS solute transport model, data, and documentation are made
*     available by the U.S. Geological Survey (USGS) to be used in the
*     public interest and the advancement of science. You may, without
*     any fee or cost, use, copy, modify, or distribute this software,
*     and any derivative works thereof, and its supporting
*     documentation, SUBJECT TO the USGS software User's Rights Notice
*     (http://water.usgs.gov/software/software_notice.html)
*
************************************************************************
*
*                            SEGMENTATION
*
************************************************************************
*
*
*
*     |<--- Hi-1 --->|<---- Hi ---->|<--- Hi+1 --->|
*     ______________________________________________
*     |              |              |              |
*     |     Ci-1     |      Ci      |     Ci+1     |
*     |     Qi-1     |      Qi      |     Qi+1     | 
*     |     Ai-1     |      Ai      |     Ai+1     |
*     |              |              |              |              
*     ----------------------------------------------
*                  DFACEi         DFACEi+1
*                  AFACEi         AFACEi+1
*
*     where:
*
*           A = AREA
*           C = CONC, CONC2, or SORB
*           H = DELTAX
*
*     as defined below.
*
*
************************************************************************
*
*                      DICTIONARY - INPUT VARIABLES
*
************************************************************************
*
*     Required Input Data
*     -------------------
*     TITLE      simulation title
*     PRTOPT     print option
*     TSTEP      time step interval [hr]
*     PSTEP      print step interval [hr]
*     TSTART     starting time [hr]
*     TFINAL     final time [hr]
*     XSTART     starting distance at upstream boundary [L]
*     DSBOUND    downstream boundary condition (flux) [mass/L^2-s]
*     NREACH     number of reaches
*
*     Required Reach Parameters (One value for each reach)
*     ----------------------------------------------------
*     NSEG       number of segments
*     RCHLEN     length of reach [L]
*     DISP       dispersion coefficient [L^2/s]
*     AREA2      storage zone cross-sectional area [L^2]
*     ALPHA      exchange coefficient [/s]
*
*     Required Print Information
*     --------------------------
*     NPRINT     number of print locations
*     IOPT       interpolation option
*     PRTLOC     distance at which results are printed [L]
*
*     Required Chemical Information
*     -----------------------------
*     NSOLUTE    number of solutes to simulate
*     IDECAY     decay flag (=0 no decay; =1 first-order decay)
*     ISORB      sorption flag (=0 no sorption; =1 Kd sorption)
*     IGASEX     gas exchange flag (=0 no gas exchange; =1 gas exchange)
*                (own addition)
*
*     First-Order Decay Rate Information (Required for IDECAY=1)
*     ----------------------------------------------------------
*     LAMBDA     decay coefficient for the main channel [/s]
*     LAMBDA2    decay coefficient for the storage zone [/s]
*     PRODUCTION production coefficient for the storage zone [mass/s]
*                (own addition)
*
*     Gas exchange Information (Required for IGASEX=1)
*     ------------------------------------------------
*     GASEX      gas exchange velocity [L/s] (own addition)
*
*     Kd Sorption Information (Required for ISORB=1)
*     ----------------------------------------------
*     LAMHAT     sorption rate coefficient for the main channel [/sec]
*     LAMHAT2    sorption rate coefficient for the storage zone [/sec]
*     RHO        mass of accessibile sediment/volume water [mass/L^3]
*     KD         distribution coefficient [L^3/mass]
*     CSBACK     background storage zone solute concentration [mass/L^3]
*
*     Required Chemical and Upstream Boundary Condition Information
*     -------------------------------------------------------------
*     NBOUND     number of different upstream boundary conditions
*     IBOUND     boundary condition option
*     USTIME     time at which upstream boundary condition goes
*                into effect [hr]
*     USBC       upstream boundary condition
*
*     Required Flow and Area Information
*     ----------------------------------
*     QSTEP      time interval between changes in flow (0=steady flow)
*     QSTART     volumetric flowrate at upstream boundary [L^3/s]
*     QLATIN     lateral inflow rate [L^3/s-L]
*     QLATOUT    lateral outflow rate [L^3/s-L]
*     AREA       main channel cross-sectional area [L^2]
*     CLATIN     concentration of lateral inflow [mass/L^3]
*     DEPTH      depth of main channel [L] (own addition)
*
*     Information for Unsteady Flow Regimes (QSTEP > 0)
*     -------------------------------------------------
*     NFLOW      number of locations at which Q and AREA are specified
*     FLOWLOC    distance at which Q and AREA are specified [L]
*     QVALUE     flowrates at specified distances
*     QINVAL     lateral inflow rate at specified distances
*     AVALUE     areas at specified distances
*     DVALUE     depth at specified distances
*     CLVAL      concentration of lateral inflows at specified distances
*
************************************************************************
*
*                      DICTIONARY - PROGRAM VARIABLES
*
************************************************************************
*
*     State Variables
*     ---------------
*     CONC       concentration in main channel [mass/L^3]
*     CONC2      concentration in storage zone [mass/L^3]
*     SORB       streambed sediment concentration [mass/mass]
*
*     System definition and hydrology
*     -------------------------------
*     AFACE      cross sectional area @ interface of segments I,I+1
*     DFACE      dispersion coefficient @ interface of segments I,I+1
*     DELTAX     segment length [L]
*     IMAX       number of segments
*     LASTSEG    last segment in each reach
*     DIST       distance corresponding to segment centroid
*     Q          volumetric flowrate [L^3/s]
*     QINDEX     flow location used for interpolation (when QSTEP > 0)
*     QWT        weight used to interpolate between QINDEX and QINDEX+1
*     DSDIST     distance to the nearest downstream flow location/DELTAX
*     USDIST     distance to the nearest upstream flow location / DELTAX 
*
*     Matrix Solution
*     ---------------
*     A          upper diagonal of the tridiagonal matrix
*     B          main diagonal of the tridiagonal matrix
*     C          lower diagonal of the tridiagonal matrix
*     D          constant vector
*     AWORK      work vector corresponding to A
*     BWORK      work vector corresponding to B
*
*     Parameter Groups - Time invariant (H = DELTAX)
*     ----------------------------------------------
*     HPLUSF     H(i) + H(i+1)
*     HPLUSB     H(i) + H(i-1)
*     HMULTF     H(i) [ H(i) + H(i+1) ]
*     HMULTB     H(i) [ H(i) + H(i-1) ]
*     HDIV       H(i) / [ H(i) + H(i+1) ]
*     HDIVF      H(i+1) / [ H(i) + H(i+1) ]
*     HADV       0.5/H(i) { H(i+1)/[H(i+1)+H(i)] - H(i-1)/[H(i-1)+H(i)]}
*     LAM2DT     storage zone decay coefficient times the timestep
*     LHATDT     main channel sorption rate times the timestep
*     LHAT2DT    storage zone sorption rate times the timestep
*     RHOLAM     mass of access. sediment times the m.c. sorption rate
*     SGROUP     sorption parameter group
*     SGROUP2    sorption parameter group
*
*     Parameter Groups - Time invariant given steady flow
*     ---------------------------------------------------
*     BN         group related to the main diagonal vector, B
*     BTERMS     group related to the main diagonal vector, B
*     GAMMA      group introduced by storage zone equation
*     IGROUP     inflow group 
*     TGROUP     transient storage group
*     TWOPLUS    2 + .....
*
*     Boundary Conditions & Flow Changes
*     ----------------------------------
*     BCSTOP     time at which the boundary conditions change
*     JBOUND     index of the current boundary condition
*     STOPTYPE   indicates whether the next TSTOP is due to a change
*                in the boundary conditions or the flow variables.
*     TSTOP      time at which the boundary condition or flow variables
*                change
*     USCONC     concentration at the upstream boundary
*     QSTOP      time at which the flow variables change
*
*     Program Variables - Misc.
*     -------------------------
*     TIMEB      inverse of the time step [/sec]
*     TIME       time [hr]
*     CHEM       type of chemistry considered (reactive or conservative)
*     IPRINT     number of iterations between printing of results
*     PINDEX     segments for which results are printed
*     WT         weight used to interpolate between PINDEX and PINDEX+1
*
*     Program Variables - time level 'N'
*     ----------------------------------
*     The following variables contain values of associated with the
*     previous timestep, time level 'N'.  Their counterparts at time
*     level 'N+1' are defined above:
*     
*     AFACEN,AN,AREAN,BTERMSN,CLATINN,CN,GAMMAN,QLATINN,QN,USCONCN
*
*     i.e. CLATINN is the lateral inflow concentration at time N, while
*     CLATIN is corresponding concentration at time N+1.
*
************************************************************************
*
*                      INCLUDE FILES
*
*************************************************************************
*   
*     Maximum Dimensions (set via PARAMETER statements in fmodules.inc)
*     -----------------------------------------------------------------
*     MAXSEG     maximum number of segments
*     MAXBOUND   maximum number of upstream boundary conditions
*     MAXREACH   maximum number of reaches
*     MAXPRINT   maximum number of print locations
*     MAXSOLUTE  maximum number of solutes
*     MAXFLOWLOC maximum number of flow locations (unsteady flow)
*
*     Logical Devices (as defined in lda.inc)
*     ---------------------------------------
*     LDCTRL     input control information (I/O filenames)
*     LDPARAM    input file for chemical and physical parameters
*     LDFLOW     input file for flow, lateral inflow, and areas
*     LDECHO     output data and time, echo input parameters
*     LDFILES    output files, one file per solute
*     LDSORB     sorption output files (ISORB=1), one file per solute
*
************************************************************************

      PROGRAM MAIN
*
*     dimensional parameters
*
      INCLUDE 'fmodules.inc'
*
*     other variables
*
      INTEGER*4 IMAX,NPRINT,IPRINT,NSOLUTE,PRTOPT,NFLOW,JBOUND,IBOUND,
     &          NBOUND,ISORB
      INTEGER*4 PINDEX(MAXPRINT),QINDEX(MAXSEG)
      DOUBLE PRECISION DSBOUND,TSTART,TFINAL,TSTEP,QSTEP,TIMEB,TSTOP,
     &                 QSTOP,BCSTOP
      DOUBLE PRECISION DELTAX(MAXSEG),Q(MAXSEG),USTIME(MAXBOUND+1),
     &                 AREA(MAXSEG),QLATIN(MAXSEG),WT(MAXPRINT),
     &                 QVALUE(MAXFLOWLOC),AVALUE(MAXFLOWLOC),
     &                 QWT(MAXSEG),DSDIST(MAXSEG),USDIST(MAXSEG),
     &                 DFACE(MAXSEG),HPLUSF(MAXSEG),HPLUSB(MAXSEG),
     &                 HMULTF(MAXSEG),HMULTB(MAXSEG),HDIV(MAXSEG),
     &                 HDIVF(MAXSEG),HADV(MAXSEG),GAMMA(MAXSEG),
     &                 AFACE(MAXSEG),A(MAXSEG),C(MAXSEG),
     &                 QINVAL(MAXFLOWLOC+1),USCONCN(MAXSOLUTE),QN(2),
     &                 AREAN(MAXSEG),QLATINN(MAXSEG),AFACEN(2),
     &                 GAMMAN(MAXSEG),AN(MAXSEG),CN(MAXSEG),
     &                 AREA2(MAXSEG),ALPHA(MAXSEG),DEPTH(MAXSEG),
     &                 DVALUE(MAXFLOWLOC)
      DOUBLE PRECISION USCONC(MAXBOUND,MAXSOLUTE),
     &                 CLATIN(MAXSEG,MAXSOLUTE),CONC(MAXSEG,MAXSOLUTE),
     &                 CONC2(MAXSEG,MAXSOLUTE),
     &                 CLVAL(MAXFLOWLOC+1,MAXSOLUTE),
     &                 LAMBDA(MAXSEG,MAXSOLUTE),
     &                 LAM2DT(MAXSEG,MAXSOLUTE),
     &                 AWORK(MAXSEG,MAXSOLUTE),BWORK(MAXSEG,MAXSOLUTE),
     &                 USBC(MAXBOUND,MAXSOLUTE),
     &                 SGROUP2(MAXSEG,MAXSOLUTE),
     &                 SGROUP(MAXSEG,MAXSOLUTE),
     &                 LHATDT(MAXSEG,MAXSOLUTE),SORB(MAXSEG,MAXSOLUTE),
     &                 LHAT2DT(MAXSEG,MAXSOLUTE),KD(MAXSEG,MAXSOLUTE),
     &                 CLATINN(MAXSEG,MAXSOLUTE),
     &                 TWOPLUS(MAXSEG,MAXSOLUTE),BN(MAXSEG,MAXSOLUTE),
     &                 TGROUP(MAXSEG,MAXSOLUTE),
     &                 BTERMS(MAXSEG,MAXSOLUTE),
     &                 BTERMSN(MAXSEG,MAXSOLUTE),
     &                 IGROUP(MAXSEG,MAXSOLUTE),
     &                 GASEX(MAXSEG,MAXSOLUTE),
     &                 PRODUCTION(MAXSEG,MAXSOLUTE),
     &                 PRODDT(MAXSEG,MAXSOLUTE)
      CHARACTER*12 CHEM,STOPTYPE
*
*     Obtain input parameters, initialize variables, and preprocess.
*     If the steady-state option has been invoked, output results
*
      CALL MAININIT(IMAX,NPRINT,PINDEX,WT,IPRINT,DELTAX,Q,USTIME,USCONC,
     &              USCONCN,AREA,DSBOUND,QLATIN,CLATIN,TSTART,TFINAL,
     &              TSTEP,CONC,CONC2,QSTEP,PRTOPT,NSOLUTE,LAMBDA,CHEM,
     &              NFLOW,QINDEX,QWT,STOPTYPE,JBOUND,TIMEB,TSTOP,QSTOP,
     &              DFACE,HPLUSF,HPLUSB,HMULTF,HMULTB,HDIV,HDIVF,HADV,
     &              GAMMA,BTERMS,AFACE,A,C,AWORK,BWORK,LAM2DT,DSDIST,
     &              USDIST,QINVAL,CLVAL,AVALUE,QVALUE,IBOUND,USBC,
     &              NBOUND,BCSTOP,SGROUP2,SGROUP,LHATDT,SORB,LHAT2DT,KD,
     &              ISORB,CLATINN,QN,AREAN,QLATINN,GAMMAN,AFACEN,AN,CN,
     &              BTERMSN,TWOPLUS,AREA2,ALPHA,BN,TGROUP,IGROUP,DEPTH,
     &              GASEX,DVALUE,PRODUCTION,PRODDT)
*
*     perform the dynamic simulation
*
      CALL MAINRUN(IMAX,NPRINT,PINDEX,WT,IPRINT,DELTAX,Q,USTIME,USCONC,
     &             USCONCN,AREA,DSBOUND,QLATIN,CLATIN,TSTART,TFINAL,
     &             TSTEP,CONC,CONC2,QSTEP,PRTOPT,NSOLUTE,LAMBDA,CHEM,
     &             NFLOW,QINDEX,QWT,STOPTYPE,JBOUND,TIMEB,TSTOP,QSTOP,
     &             DFACE,HPLUSF,HPLUSB,HMULTF,HMULTB,HDIV,HDIVF,HADV,
     &             GAMMA,BTERMS,AFACE,A,C,AWORK,BWORK,LAM2DT,DSDIST,
     &             USDIST,QINVAL,CLVAL,AVALUE,QVALUE,IBOUND,USBC,NBOUND,
     &             BCSTOP,SGROUP2,SGROUP,LHATDT,SORB,LHAT2DT,KD,ISORB,
     &             CLATINN,QN,AREAN,QLATINN,GAMMAN,AFACEN,AN,CN,BTERMSN,
     &             TWOPLUS,AREA2,ALPHA,BN,TGROUP,IGROUP,DEPTH,
     %             GASEX,DVALUE,PRODUCTION,PRODDT)
*
*     close files
*
      CALL CLOSEF(NSOLUTE,ISORB)

      STOP
      END




