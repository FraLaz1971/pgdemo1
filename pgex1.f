
      SUBROUTINE PGEX1
C-----------------------------------------------------------------------
C This example illustrates the use of PGENV, PGLAB, PGPT, PGLINE.
C-----------------------------------------------------------------------
      INTEGER I
      REAL XS(5),YS(5), XR(100), YR(100)
      DATA XS/1.,2.,3.,4.,5./
      DATA YS/1.,4.,9.,16.,25./
C
C Call PGENV to specify the range of the axes and to draw a box, and
C PGLAB to label it. The x-axis runs from 0 to 10, and y from 0 to 20.
C
      CALL PGENV(0.,10.,0.,20.,0,1)
      CALL PGLAB('(x)', '(y)', 'PGPLOT Example 1:  y = x\u2')
C
C Mark five points (coordinates in arrays XS and YS), using symbol
C number 9.
C
      CALL PGPT(5,XS,YS,9)
C
C Compute the function at 60 points, and use PGLINE to draw it.
C
      DO 10 I=1,60
          XR(I) = 0.1*I
          YR(I) = XR(I)**2
10    CONTINUE
      CALL PGLINE(60,XR,YR)
C-----------------------------------------------------------------------
      END
