************************************************************************
*
*     Subroutine INPUTGAS               Called by: INPUT
*
*     read the gas exchange velocity.
*
************************************************************************
      SUBROUTINE INPUTGAS(NREACH,LASTSEG,NSOLUTE,GASEX)
*
*     dimensional parameters and logical devices
*
      INCLUDE 'fmodules.inc'
      INCLUDE 'lda.inc'
*
*     subroutine arguments
*
      INTEGER*4 NREACH,NSOLUTE,LASTSEG(0:MAXREACH)
      DOUBLE PRECISION GASEX(MAXSEG,*)
*
*     local variables
*
      INTEGER*4 I,I2,I3,J
      CHARACTER*500 BUFFER
*
*     input Format Statements
*
 1000 FORMAT(1D13.5)
*
*     Output Format Statements
*
 2040 FORMAT(//,10X,'Gas exchange parameter, Solute #',I3,/,10X,35('-'),
     &/,10X,'Reach       Gas exchange velocity',/,10X,
     &'No.         [/second]',/,10X,35('-'))
 2060 FORMAT(10X,I5,7X,1P,E9.3)
*
*     Read the gas exchange velocity for each
*     reach and solute.  Fill vectors with reach values.
*
      DO 30 J=1,NSOLUTE
         I = 1
         DO 20 I2 = 1,NREACH
            CALL GETLINE(LDPARAM,BUFFER)
            READ(BUFFER,1000) GASEX(I,J)
            DO 10 I3 = I+1,LASTSEG(I2)
               GASEX(I3,J) = GASEX(I,J)
 10         CONTINUE
            I = LASTSEG(I2) + 1
 20      CONTINUE
 30   CONTINUE
*
*     echo gas exchange coefficients
*
      DO 50 J = 1,NSOLUTE
         WRITE(LDECHO,2040) J
         I = 1
         DO 40 I2 = 1, NREACH
            WRITE(LDECHO,2060) I2,GASEX(I,J)
            I = LASTSEG(I2) + 1
 40      CONTINUE
 50   CONTINUE

      RETURN
      END
