***********************************************************************
*
*     Subroutine PREPROC3         Called by: PREPROC, UPDATE, SETUP3
*
*     compute several parameter groups that are time-invariant given a
*     steady flow regime (note that for unsteady flow regimes, this
*     routine is called multiple times).  The parameter groups are used
*     to develop the A, B, and C vectors that comprise the tridiagonal
*     matrix.  After the vectors are computed, the tridiagonal
*     coefficient matrix is decomposed.  This leaves only the
*     substitution phase of the Thomas algorithm to be completed at
*     each timestep.
*
************************************************************************
      SUBROUTINE PREPROC3(IMAX,DELTAX,Q,AREA,DEPTH,DFACE,QLATIN,HPLUSF,
     &                    HPLUSB,HMULTF,HMULTB,HDIV,HDIVF,HADV,GAMMA,
     &                    BTERMS,AFACE,A,C,AWORK,BWORK,TIMEB,NSOLUTE,
     &                    LAM2DT,LHAT2DT,KD,TWOPLUS,AREA2,ALPHA,
     &                    LAMBDA,GASEX,SGROUP,BTERMSN,BN,TGROUP,GAMMAN,
     &                    IGROUP,QLATINN,CLATINN,AREAN,CLATIN)
      INCLUDE 'fmodules.inc'
*
*     subroutine arguments
*
      INTEGER*4 IMAX,NSOLUTE
      DOUBLE PRECISION TIMEB,DELTAX(*),Q(*),AREA(*),DEPTH(*),DFACE(*),
     &                 QLATIN(*),HPLUSF(*),HPLUSB(*),HMULTF(*),
     &                 HMULTB(*),HDIV(*),HDIVF(*),HADV(*),GAMMA(*),
     &                 AFACE(*),A(*),C(*),ALPHA(*),AREA2(*),GAMMAN(*),
     &                 QLATINN(*),AREAN(*)

      DOUBLE PRECISION LAM2DT(MAXSEG,*),AWORK(MAXSEG,*),BWORK(MAXSEG,*),
     &                 LHAT2DT(MAXSEG,*),KD(MAXSEG,*),TWOPLUS(MAXSEG,*),
     &                 LAMBDA(MAXSEG,*),SGROUP(MAXSEG,*),BN(MAXSEG,*),
     &                 TGROUP(MAXSEG,*),BTERMS(MAXSEG,*),
     &                 BTERMSN(MAXSEG,*),IGROUP(MAXSEG,*),
     &                 CLATIN(MAXSEG,*),CLATINN(MAXSEG,*),
     &                 GASEX(MAXSEG,*)
*
*     local variables
*
      INTEGER*4 I,J
      DOUBLE PRECISION ADVA,ADVB,ADVC,DISPA,DISPB,DISPC,LATB,STORB,
     &                 SORBB,DECAYB,GASEXB
      DOUBLE PRECISION AD(0:MAXSEG),TRANSB(MAXSEG)
*
*     argument passed to DECOMP
*
      DOUBLE PRECISION B(MAXSEG,MAXSOLUTE)
*
*     Compute the cross sectional area at the interface 
*     between segments one and two.
*
      AFACE(1) = HDIV(1) * AREA(2) +  HDIVF(1) * AREA(1) 
*
*     set coefficients for segment 1.  The coefficients are
*     developed on a term by term basis, so that changes to an 
*     individual term of the differential equation can be easily made.
*
      A(1) = 0.D0
*
*     contributions from the time term, 
*
*                 dC  
*                ---- 
*                 dt  
*
*
*     TIMEB -->  1 / TSTEPSEC where TSTEPSEC is the time step [/sec]
*                 --> remark: TSTEPSEC in [sec], not [/sec]?
*                note that TIMEB is passed directly into PREPROC3
*
*
*     contributions from the advection term,
*                                                 
*                 Q   dC  
*             -  --- ---- 
*                 A   dx  
*
*
      ADVB = .5D0 * Q(1) * HDIVF(1) / (AREA(1)*DELTAX(1))
      ADVC = .5D0 * Q(1) / (AREA(1) * HPLUSF(1))
*
*     contributions from the dispersion term,
*                                                 
*                 1   d        dc  
*             +  --- ---- (AD ----)
*                 A   dx       dx
*
*
      AD(1) = AFACE(1) * DFACE(1)
      AD(0) = AD(1)
      DISPB = (AD(1)/HPLUSF(1) + AD(0)/DELTAX(1)) / (AREA(1)*DELTAX(1))
      DISPC = - AD(1) / (AREA(1) * HMULTF(1))
*
*     contributions from the lateral inflow term,
*                                                 
*                 q
*             +  --- (Cl - C)  
*                 A
*
*
      LATB = QLATIN(1) / (AREA(1) + AREA(1))
*
*     compute GAMMA, the transient storage parameter group, and sum the
*     chemical-independent (transport) contributions to the B vector.
*
      GAMMA(1) =  AREA(1) * ALPHA(1) / (TIMEB * AREA2(1))
      TRANSB(1) = ADVB + DISPB + LATB
*
*     combine terms to create matrix coefficients
*
      C(1) = ADVC + DISPC
*
*     set coefficients for segments 2 through IMAX-1.  The coefficients
*     are developed on a term by term basis, so that changes to an 
*     individual term of the differential equation can be easily made.
*
      DO 10 I = 2,IMAX-1
*
*        compute the cross-sectional area at the interface
*        between segments I and I+1.
*
         AFACE(I) = HDIV(I) * AREA(I+1) + HDIVF(I) * AREA(I) 
*
*        contributions from the time term, 
*
*                    dC  
*                   ---- 
*                    dt  
*
*
*     TIMEB -->  1 / TSTEPSEC where TSTEPSEC is the time step [/sec]
*                note that TIMEB is passed directly into PREPROC3
*
*
*        contributions from the advection term,
*                                                 
*                    Q   dC  
*                -  --- ---- 
*                    A   dx  
*
*
         ADVA = - .5D0 * Q(I)/(AREA(I) * HPLUSB(I))
         ADVB = HADV(I) * Q(I) / AREA(I)
         ADVC = .5D0 * Q(I) / (AREA(I) * HPLUSF(I))
*
*        contributions from the dispersion term,
*                                                 
*                    1   d        dc  
*                +  --- ---- (AD ----)
*                    A   dx       dx
*
*
         AD(I) = AFACE(I) * DFACE(I)
         DISPA = - AD(I-1) / (AREA(I) * HMULTB(I))
         DISPB = (AD(I)/HPLUSF(I)+AD(I-1)/HPLUSB(I))/(AREA(I)*DELTAX(I))
         DISPC = - AD(I) / (AREA(I) * HMULTF(I))
*
*        contributions from the lateral inflow term,
*                                                 
*                    q
*                +  --- (Cl - C)  
*                    A
*
*
         LATB = QLATIN(I) / (AREA(I) + AREA(I))
*
*        compute GAMMA, the transient storage parameter group, and
*        sum the chemical-independent contributions to the B vector.
*
         GAMMA(I) = AREA(I) * ALPHA(I) / (TIMEB * AREA2(I))
         TRANSB(I) = ADVB + DISPB + LATB
*
*        combine terms to create matrix coefficients
*
         A(I) = ADVA + DISPA
         C(I) = ADVC + DISPC

 10   CONTINUE
*
*     Set coefficients for the last segment 
*
      I = IMAX
      C(I) = 0.D0
*
*     compute the cross-sectional area at the last interface.
*
      AFACE(I) =  AREA(I) 
*
*     contributions from the time term, 
*
*                 dC  
*                ---- 
*                 dt  
*
*
*     TIMEB -->  1 / TSTEPSEC where TSTEPSEC is the time step [/sec]
*                note that TIMEB is passed directly into PREPROC3
*
*
*     contributions from the advection term,
*                                                 
*                    Q   dC  
*                -  --- ---- 
*                    A   dx  
*
*
      ADVA = - .5D0 * Q(I) / (AREA(I)*HPLUSB(I))
      ADVB = - ADVA
*
*     contributions from the dispersion term,
*                                                 
*                 1   d        dc  
*             +  --- ---- (AD ----)
*                 A   dx       dx
*
*
      DISPA = - AD(I-1) / (AREA(I) * HMULTB(I))
      DISPB = - DISPA
*
*        contributions from the lateral inflow term,
*                                                 
*                    q
*                +  --- (Cl - C)  
*                    A
*
*
      LATB = QLATIN(I) / (AREA(I) + AREA(I))
*
*     compute GAMMA, the transient storage parameter group, and
*     sum the chemical-independent contributions to the B vector.
*
      GAMMA(I) = AREA(I) * ALPHA(I) / (TIMEB * AREA2(I))
      TRANSB(I) = ADVB + DISPB + LATB
*
*     combine terms and set matrix coefficients
*
      A(I) = ADVA + DISPA
*
*     The A and C vectors are now complete.  Some additional solute-
*     specific terms are now computed to develop the B vector(s).
*
      DO 30 J = 1,NSOLUTE
         DO 20 I = 1,IMAX
*
*           contributions from the transient storage term,
*
*                 +  alpha (Cs - C)
*
*
            TWOPLUS(I,J) = 2.D0 + GAMMA(I) + LAM2DT(I,J) + LHAT2DT(I,J)
            STORB = 0.5D0 * ALPHA(I) * (1.D0 - GAMMA(I) / TWOPLUS(I,J))
*
*           contributions from the decay term,
*
*                    -  lambda C
*
*
            DECAYB = 0.5D0 * LAMBDA(I,J)
*
*
*
*           contributions from the sorption term,
*                                                 
*                   
*                 -  rho * lambda^ (Kd C - C*)
*
*
            SORBB = SGROUP(I,J) * KD(I,J)
*
*
*           contributions from gas exchange term
*
*                 - k / d * C
*
            GASEXB = 0.5D0 * GASEX(I,J) / DEPTH(I)
*
*           combine terms to create B
*
            BTERMS(I,J) = TRANSB(I) + SORBB + DECAYB + GASEXB
            B(I,J) = TIMEB + BTERMS(I,J) + STORB
*
*           preprocess terms for use in CONSER/REACT
*
            BN(I,J) = TIMEB - BTERMSN(I,J)
     &                  - 0.5D0 * ALPHA(I)
     &                * (1.D0 - GAMMAN(I) / TWOPLUS(I,J))
            TGROUP(I,J) = 0.5D0 * ALPHA(I)*(4.D0+GAMMA(I)-GAMMAN(I))
     &                    / TWOPLUS(I,J)
            IGROUP(I,J) = .5D0*(QLATINN(I)*CLATINN(I,J)/AREAN(I) +
     &                     QLATIN(I)*CLATIN(I,J)/AREA(I))

 20      CONTINUE
*
*        decompose the matrix
*
         CALL DECOMP(IMAX,A,B,C,AWORK,BWORK,J)

 30   CONTINUE

      RETURN
      END
