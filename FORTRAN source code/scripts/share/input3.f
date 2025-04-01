************************************************************************
*
*     Subroutine INPUT3               Called by: INPUT
*
*     input the number of solutes and the flags indicating the type of
*     chemistry being considered.
*
************************************************************************
      SUBROUTINE INPUT3(NSOLUTE,IDECAY,ISORB,IGASEX)
*
*     dimensional parameters and logical devices
*
      INCLUDE 'fmodules.inc'
      INCLUDE 'lda.inc'
*
*     subroutine arguments
*
      INTEGER*4 NSOLUTE,IDECAY,ISORB,IGASEX
*
*     local variables
*
      CHARACTER*500 BUFFER
*
*     input Format Statements
*
 1000 FORMAT(4I5)
*
*     Output Format Statements
*
 2000 FORMAT(///,10X,'Number of Solutes: ',I3)
 2020 FORMAT(10X,'Decay Option     : ',I3)
 2040 FORMAT(10X,'Sorption Option  : ',I3)
 2060 FORMAT(10X,'Gas ex. Option   : ',I3)
*
*     Read the number of solutes, decay flag, sorption flag and 
*     gas exchange flag
*
      CALL GETLINE(LDPARAM,BUFFER)
      READ (BUFFER,1000) NSOLUTE,IDECAY,ISORB,IGASEX
      WRITE (LDECHO,2000) NSOLUTE
      WRITE (LDECHO,2020) IDECAY
      WRITE (LDECHO,2040) ISORB
      WRITE (LDECHO,2060) IGASEX
*
*     error check
*
      IF (NSOLUTE .GT. MAXSOLUTE) CALL ERROR(4,NSOLUTE,MAXSOLUTE)
      IF (IDECAY .LT. 0 .OR. IDECAY .GT. 1) CALL ERROR3(4,IDECAY)
      IF (ISORB .LT. 0 .OR. ISORB .GT. 1) CALL ERROR3(5,ISORB)
      IF (IGASEX .LT. 0 .OR. IGASEX .GT. 1) CALL ERROR3(6,IGASEX)
 
      RETURN
      END
