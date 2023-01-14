      SUBROUTINE PPBZC1(IGEO,GEO,NI,ND)
*
************************************************************************
*  
*  Purpose: To convert a single segment polynomial curve to Bezier
*           over [0,1]. Output in array GEO in IGES 126 format. For
*           exact details of the input and output specification see
*           the files INPVDAC.TXT and OUTIGS126.TXT respectively.
*         
*
*  Author: P.A Sherar
*
*  Date: 3/8/90
*
*  Modification History:
*
*      Date      Author      Reason
*
************************************************************************
*
      IMPLICIT NONE
*
*  Constants:
*
      INCLUDE '(BZAPPROX)'
*
*  Arguments:
*                                          Description
*
*    Input:
*                                          curve coeffs.
      DOUBLE PRECISION GEO(MXORD*4+2*MXORD+2)
*                                          integer data for curve
      INTEGER IGEO(5)
*
*    Output:
*                                          Size of arrays IGEO, GEO
      INTEGER NI,ND
*     BEZIER CONTROL POINTS IN GEO
*
*  Local Variables:
*
*                                          curve coeffs.
      DOUBLE PRECISION B(3,MXORD)
*                                          curve coeffs.
      DOUBLE PRECISION A(3,MXORD)
*                                          Temporary store
      DOUBLE PRECISION TEMP
*                                          Poly to Bezier conversion matrix
      DOUBLE PRECISION PPBZ(0:MXDEG,0:MXDEG)
*                                          Integer counters
      INTEGER I,J,K,INC
*                                          Degree/ order of curve
      INTEGER DEG,DEG1
*
*  External Functions:
*                                          Combinatorial coeff.
      EXTERNAL COMB
      DOUBLE PRECISION COMB
*
*  Subroutines:
*
**** END of Specifications ****
C
C... Orders, degrees
C
      DEG1=IGEO(1)
      DEG=DEG1-1
C
C... Integer data
C
      IGEO(1)=DEG1
      IGEO(2)=2*DEG1
      IGEO(3)=DEG1
      IGEO(4)=1
C
C... copy into array A
C
      INC=1
      DO 10 J=1,3
        DO 20 I=1,DEG1
          A(J,I)=GEO(INC)
          INC=INC+1
 20     CONTINUE
 10   CONTINUE
C
C... Compute conversion matrix
C
      DO 40 I=0,DEG
        DO 50 J=0,I
          PPBZ(I,J)=COMB(I,J)/COMB(DEG,J)
 50     CONTINUE
 40   CONTINUE
C
C... Convert coeffs.
C
      DO 60 K=1,3
        DO 70 I=1,DEG1
          TEMP=0.D0
          DO 80 J=1,I
            TEMP = TEMP + PPBZ(I-1,J-1) * A(K,J)
 80       CONTINUE
          B(K,I) = TEMP
 70     CONTINUE
 60   CONTINUE
C
C... copy into array GEO
C... knots
C
      INC=1
      DO 160 I=1,DEG1
        GEO(INC)=0.D0
        INC=INC+1
 160  CONTINUE
      DO 170 I=1,DEG1
        GEO(INC)=1.D0
        INC=INC+1
 170  CONTINUE
C
C... breakpoints
C
      GEO(INC)=0.D0
      GEO(INC+1)=1.D0
      INC=INC+2
C
C... weights
C
      DO 200 I=1,DEG1
        GEO(INC)=1.D0
        INC=INC+1
 200  CONTINUE
C
C... control points
C
      DO 220 J=1,DEG1
        DO 230 K=1,3
          GEO(INC)=A(K,J)
          INC=INC+1
 230    CONTINUE
 220  CONTINUE
C
C... Parametric limits
C
      GEO(INC)=0.D0
      GEO(INC+1)=1.D0
C
C... size of arrays IGEO, GEO
C
      NI=5
      ND=INC+1
      END
