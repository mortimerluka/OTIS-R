************************************************************************
*
*     Subroutine HEADER              Called by: MAININIT
*
*     Open file for input echoing (echo.out) & print model info
*
************************************************************************
      SUBROUTINE HEADER(MODDESC)
*
*     dimensional parameters and logical devices
*
      INCLUDE 'fmodules.inc'
      INCLUDE 'lda.inc'
*
*     model descriptive string
*
      CHARACTER*(*) MODDESC
*
*     local variables
*
      CHARACTER*9 DATEBUF
      CHARACTER*8 TIMEBUF
      CHARACTER*30 VERSION
      DATA VERSION /'Version: MOD40 (Feb. 1998)'/

 1000 FORMAT(//,10X,A51,/,22X,A30,/,22X,26('-'),///,10X,
     &       'Runtime Information',/,10X,19('-'),/,10X,
     &       'Date and Time :  ',A9,' ',A8)
*
*     Open output file for run information and input echoing
*
      OPEN (UNIT=LDECHO,FILE='echo.out',STATUS='UNKNOWN')
*
*     Write Info to file
*
      CALL DATE_AND_TIME(DATE=DATEBUF,TIME=TIMEBUF)
      WRITE(LDECHO,1000) MODDESC,VERSION,DATEBUF,TIMEBUF

      RETURN
      END
