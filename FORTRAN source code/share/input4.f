************************************************************************
*
*     Subroutine INPUT4               Called by: INPUT
*
*     read the first-order decay rates.
*
************************************************************************
      SUBROUTINE INPUT4(NREACH,LASTSEG,NSOLUTE,LAMBDA,LAMBDA2,
     &                  PRODUCTION)
*
*     dimensional parameters and logical devices
*
      INCLUDE 'fmodules.inc'
      INCLUDE 'lda.inc'
*
*     subroutine arguments
*
      INTEGER*4 NREACH,NSOLUTE,LASTSEG(0:MAXREACH)
      DOUBLE PRECISION LAMBDA(MAXSEG,*),LAMBDA2(MAXSEG,*),
     &                 PRODUCTION(MAXSEG,*)
*
*     local variables
*
      INTEGER*4 I,I2,I3,J
      CHARACTER*500 BUFFER
*
*     input Format Statements
*
 1000 FORMAT(3D13.5)
*
*     Output Format Statements
*
 2040 FORMAT(//,10X,'Decay Parameters, Solute #',I3,/,10X,53('-'),/,
     &25X,'Decay Coefficient',/,10X,
     &'Reach        Channel       Storage       Production',
     &/,10X,'No.         [/second]     [/second]    [conc./second]',/,
     &10X,53('-'))
 2060 FORMAT(10X,I5,7X,1P,E9.3,5X,E9.3,7X,E9.3)
*
*     Read the main channel and storage zone decay coefficients for each
*     reach and solute.  Fill vectors with reach values.
*
      DO 30 J=1,NSOLUTE
         I = 1
         DO 20 I2 = 1,NREACH
            CALL GETLINE(LDPARAM,BUFFER)
            READ(BUFFER,1000) LAMBDA(I,J),LAMBDA2(I,J),PRODUCTION(I,J)
            DO 10 I3 = I+1,LASTSEG(I2)
               LAMBDA(I3,J) = LAMBDA(I,J)
               LAMBDA2(I3,J) = LAMBDA2(I,J)
               PRODUCTION(I3,J) = PRODUCTION(I,J)
 10         CONTINUE
            I = LASTSEG(I2) + 1
 20      CONTINUE
 30   CONTINUE
*
*     echo decay coefficients
*
      DO 50 J = 1,NSOLUTE
         WRITE(LDECHO,2040) J
         I = 1
         DO 40 I2 = 1, NREACH
            WRITE(LDECHO,2060) I2,LAMBDA(I,J),LAMBDA2(I,J),
     &                         PRODUCTION(I,J)
            I = LASTSEG(I2) + 1
 40      CONTINUE
 50   CONTINUE
 
      RETURN
      END
