************************************************************************
*
*     Subroutine MAINRUN        Called by: MAIN Program 
*
*     call the dynamic simulation routine and output results.
*
************************************************************************
      SUBROUTINE MAINRUN(IMAX,NPRINT,PINDEX,WT,IPRINT,DELTAX,Q,USTIME,
     &                   USCONC,USCONCN,AREA,DSBOUND,QLATIN,CLATIN,TIME,
     &                   TFINAL,TSTEP,CONC,CONC2,QSTEP,PRTOPT,NSOLUTE,
     &                   LAMBDA,CHEM,NFLOW,QINDEX,QWT,STOPTYPE,JBOUND,
     &                   TIMEB,TSTOP,QSTOP,DFACE,HPLUSF,HPLUSB,HMULTF,
     &                   HMULTB,HDIV,HDIVF,HADV,GAMMA,BTERMS,AFACE,A,C,
     &                   AWORK,BWORK,LAM2DT,DSDIST,USDIST,QINVAL,CLVAL,
     &                   AVALUE,QVALUE,IBOUND,USBC,NBOUND,BCSTOP,
     &                   SGROUP2,SGROUP,LHATDT,SORB,LHAT2DT,KD,ISORB,
     &                   CLATINN,QN,AREAN,QLATINN,GAMMAN,AFACEN,AN,CN,
     &                   BTERMSN,TWOPLUS,AREA2,ALPHA,BN,TGROUP,IGROUP,
     &                   DEPTH,GASEX,DVALUE,PRODUCTION,PRODDT)
      INCLUDE 'fmodules.inc'
*
*     subroutine arguments
*
      INTEGER*4 IMAX,NPRINT,IPRINT,NSOLUTE,PRTOPT,NFLOW,JBOUND,IBOUND,
     &          NBOUND,ISORB
      INTEGER*4 PINDEX(*),QINDEX(*)
      DOUBLE PRECISION DSBOUND,TIME,TFINAL,TSTEP,QSTEP,TIMEB,TSTOP,
     &                 QSTOP,BCSTOP
      DOUBLE PRECISION DELTAX(*),Q(*),USTIME(*),AREA(*),QLATIN(*),WT(*),
     &                 QWT(*),DSDIST(*),USDIST(*),QINVAL(*),DFACE(*),
     &                 HPLUSF(*),HPLUSB(*),HMULTF(*),HMULTB(*),HDIV(*),
     &                 HDIVF(*),HADV(*),GAMMA(*),AFACE(*),A(*),C(*),
     &                 LAM2DT(*),AVALUE(*),QVALUE(*),USCONCN(*),QN(*),
     &                 AREAN(*),QLATINN(*),AFACEN(*),GAMMAN(*),AN(*),
     &                 CN(*),AREA2(*),ALPHA(*),DEPTH(*),DVALUE(*),
     &                 PRODDT(*)
      DOUBLE PRECISION USCONC(MAXBOUND,*),CLATIN(MAXSEG,*),
     &                 CONC(MAXSEG,*),CONC2(MAXSEG,*),
     &                 LAMBDA(MAXSEG,*),CLVAL(MAXFLOWLOC+1,*),
     &                 AWORK(MAXSEG,*),BWORK(MAXSEG,*),
     &                 USBC(MAXBOUND,*),SGROUP2(MAXSEG,*),
     &                 SGROUP(MAXSEG,*),LHATDT(MAXSEG,*),SORB(MAXSEG,*),
     &                 LHAT2DT(MAXSEG,*),KD(MAXSEG,*),CLATINN(MAXSEG,*),
     &                 TWOPLUS(MAXSEG,*),BN(MAXSEG,*),TGROUP(MAXSEG,*),
     &                 BTERMS(MAXSEG,*),BTERMSN(MAXSEG,*),
     &                 IGROUP(MAXSEG,*),GASEX(MAXSEG,*),
     &                 PRODUCTION(MAXSEG,*)
      CHARACTER*(*) CHEM,STOPTYPE
*
*     local variables
*
      INTEGER*4 J,NCALLS
*
*     arguments passed to OUTPUT
*
      INTEGER*4 JSOLUTE
      DOUBLE PRECISION CNC(MAXPRINT),CNC2(MAXPRINT)
*
*     if this is a steady-state run simply return
*
      IF (CHEM .EQ. 'Steady-State') RETURN
*
*     compute the required number of calls to the dynamic solution
*     routine.  Each call advances the solution (in time) to the next
*     output point.
*
      NCALLS = INT((INT((TFINAL - TIME)/TSTEP) + 1) / IPRINT) + 1
*
*     begin the time loop
*
      DO 20 J = 1, NCALLS

         CALL DYNAMIC(IMAX,IPRINT,DELTAX,Q,USTIME,USCONC,USCONCN,AREA,
     &                DSBOUND,QLATIN,CLATIN,TIME,TSTEP,CONC,CONC2,QSTEP,
     &                NSOLUTE,LAMBDA,QVALUE,AVALUE,QWT,QINDEX,NFLOW,
     &                QINVAL,CLVAL,CHEM,DSDIST,USDIST,STOPTYPE,JBOUND,
     &                TIMEB,TSTOP,QSTOP,DFACE,HPLUSF,HPLUSB,HMULTF,
     &                HMULTB,HDIV,HDIVF,HADV,GAMMA,BTERMS,AFACE,A,C,
     &                AWORK,BWORK,LAM2DT,IBOUND,USBC,NBOUND,BCSTOP,
     &                SGROUP2,SGROUP,LHATDT,SORB,LHAT2DT,KD,CLATINN,QN,
     &                AREAN,QLATINN,GAMMAN,AFACEN,AN,CN,BTERMSN,TWOPLUS,
     &                AREA2,ALPHA,BN,TGROUP,IGROUP,DEPTH,GASEX,DVALUE,
     &                PRODUCTION,PRODDT)

         DO 10 JSOLUTE = 1, NSOLUTE
            CALL OUTPUT(NPRINT,PINDEX,CONC,CONC2,TIME,WT,JSOLUTE,PRTOPT,
     &                  CNC,CNC2,ISORB,SORB)
*             CALL OUTPUTQC(NPRINT,PINDEX,CONC,TIME,WT,JSOLUTE,CNC,Q)
 10      CONTINUE

 20   CONTINUE

      RETURN
      END


