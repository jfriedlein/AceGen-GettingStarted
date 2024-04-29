!**************************************************************
!* AceGen    7.505 Linux (16 Aug 22)                          *
!*           Co. J. Korelc  2020           24 Apr 24 17:52:13 *
!**************************************************************
! User     : Full professional version
! Notebook : AceGen-SMSIf_Nested
! Evaluation time                 : 1 s     Mode  : Optimal
! Number of formulae              : 27      Method: Automatic
! Subroutine                      : IfConditions_Nested size: 179
! Total size of Mathematica  code : 179 subexpressions
! Total size of Fortran code      : 1114 bytes

!******************* S U B R O U T I N E **********************
      SUBROUTINE IfConditions_Nested(xInput,y1Output,Dy1DxOutput
     &,y2Output,Dy2DxOutput,y3Output,Dy3DxOutput)
      IMPLICIT NONE
      include 'sms.h'
      LOGICAL b2,b3,b6,b10,b16
      DOUBLE PRECISION v(147),xInput,y1Output,Dy1DxOutput
     &,y2Output,Dy2DxOutput,y3Output,Dy3DxOutput
      v(1)=xInput
      v(13)=2d0*v(1)
      v(5)=(v(1)*v(1))
      b2=v(1).ge.0d0
      IF(b2) THEN
       v(14)=-(1d0/v(1)**2)+v(13)+dcos(v(1))
       v(7)=25d0+1d0/v(1)+v(5)+dsin(v(1))
       v(15)=v(14)
       v(4)=v(7)
      ELSE
       b16=v(1).lt.(-10d0)
       v(15)=MERGE(DBLE(-99),v(13),b16)
       v(4)=MERGE((-99d0)*v(1),v(5),b16)
      ENDIF
      IF(b2) THEN
       v(19)=v(14)
       v(8)=v(7)
      ELSE
       v(19)=v(13)
       v(8)=v(5)
      ENDIF
      v(22)=0d0
      v(9)=0d0
      IF(b2) THEN
       v(22)=v(14)
       v(9)=v(7)
      ELSE
       v(22)=v(13)
       v(9)=v(5)
      ENDIF
      y1Output=v(4)
      Dy1DxOutput=v(15)
      y2Output=v(8)
      Dy2DxOutput=v(19)
      y3Output=v(9)
      Dy3DxOutput=v(22)
      END
