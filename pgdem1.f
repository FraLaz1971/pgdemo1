      PROGRAM PGDEM1
C-----------------------------------------------------------------------
C Demonstration program for PGPLOT. The main program opens the output
C device and calls a series of subroutines, one for each sample plot.
C-----------------------------------------------------------------------
      INTEGER PGOPEN
C
C Call PGOPEN to initiate PGPLOT and open the output device; PGOPEN
C will prompt the user to supply the device name and type. Always
C check the return code from PGOPEN.
C
      IF (PGOPEN('?') .LE. 0) STOP
C
C Print information about device.
C
      CALL PGEX0
C
C Call the demonstration subroutines (4,5 are put on one page)
C
      CALL PGEX1
C
C Finally, call PGCLOS to terminate things properly.
C
      CALL PGCLOS
C-----------------------------------------------------------------------
      END
