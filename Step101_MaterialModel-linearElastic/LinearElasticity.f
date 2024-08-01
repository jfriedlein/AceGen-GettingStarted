!**************************************************************
!* AceGen    7.505 Linux (16 Aug 22)                          *
!*           Co. J. Korelc  2020           1 Aug 24 15:57:52  *
!**************************************************************
! User     : Full professional version
! Notebook : AceGen-LinearElasticity
! Evaluation time                 : 1 s     Mode  : Optimal
! Number of formulae              : 21      Method: Automatic
! Subroutine                      : LinearElasticity size: 1026
! Total size of Mathematica  code : 1026 subexpressions
! Total size of Fortran code      : 3714 bytes

!******************* S U B R O U T I N E **********************
      SUBROUTINE LinearElasticity(deformationGradient
     &,listOfMaterialParameters,CauchyStressVEC,Tangent)
      IMPLICIT NONE
      include 'sms.h'
      DOUBLE PRECISION v(144),deformationGradient(3,3)
     &,listOfMaterialParameters(2),CauchyStressVEC(6),Tangent(3,3,3,3
     &)
      v(10)=listOfMaterialParameters(1)
      v(11)=listOfMaterialParameters(2)
      v(34)=2d0*v(11)
      v(29)=v(10)+(-2d0/3d0)*v(11)
      v(28)=v(10)+(4d0/3d0)*v(11)
      v(12)=(-1d0)+deformationGradient(1,1)
      v(15)=(-1d0)+deformationGradient(2,2)
      v(17)=(-1d0)+deformationGradient(3,3)
      v(18)=v(12)+v(15)+v(17)
      v(23)=v(10)*v(18)
      v(22)=(-1d0/3d0)*v(18)
      v(19)=v(23)+(v(12)+v(22))*v(34)
      v(20)=(deformationGradient(1,2)+deformationGradient(2,1))*v(11)
      v(21)=(deformationGradient(1,3)+deformationGradient(3,1))*v(11)
      v(24)=v(23)+(v(15)+v(22))*v(34)
      v(25)=(deformationGradient(2,3)+deformationGradient(3,2))*v(11)
      v(26)=v(23)+(v(17)+v(22))*v(34)
      CauchyStressVEC(1)=v(19)
      CauchyStressVEC(2)=v(24)
      CauchyStressVEC(3)=v(26)
      CauchyStressVEC(4)=v(20)
      CauchyStressVEC(5)=v(25)
      CauchyStressVEC(6)=v(21)
      Tangent(1,1,1,1)=v(28)
      Tangent(1,1,1,2)=0d0
      Tangent(1,1,1,3)=0d0
      Tangent(1,1,2,1)=0d0
      Tangent(1,1,2,2)=v(29)
      Tangent(1,1,2,3)=0d0
      Tangent(1,1,3,1)=0d0
      Tangent(1,1,3,2)=0d0
      Tangent(1,1,3,3)=v(29)
      Tangent(1,2,1,1)=0d0
      Tangent(1,2,1,2)=v(11)
      Tangent(1,2,1,3)=0d0
      Tangent(1,2,2,1)=v(11)
      Tangent(1,2,2,2)=0d0
      Tangent(1,2,2,3)=0d0
      Tangent(1,2,3,1)=0d0
      Tangent(1,2,3,2)=0d0
      Tangent(1,2,3,3)=0d0
      Tangent(1,3,1,1)=0d0
      Tangent(1,3,1,2)=0d0
      Tangent(1,3,1,3)=v(11)
      Tangent(1,3,2,1)=0d0
      Tangent(1,3,2,2)=0d0
      Tangent(1,3,2,3)=0d0
      Tangent(1,3,3,1)=v(11)
      Tangent(1,3,3,2)=0d0
      Tangent(1,3,3,3)=0d0
      Tangent(2,1,1,1)=0d0
      Tangent(2,1,1,2)=v(11)
      Tangent(2,1,1,3)=0d0
      Tangent(2,1,2,1)=v(11)
      Tangent(2,1,2,2)=0d0
      Tangent(2,1,2,3)=0d0
      Tangent(2,1,3,1)=0d0
      Tangent(2,1,3,2)=0d0
      Tangent(2,1,3,3)=0d0
      Tangent(2,2,1,1)=v(29)
      Tangent(2,2,1,2)=0d0
      Tangent(2,2,1,3)=0d0
      Tangent(2,2,2,1)=0d0
      Tangent(2,2,2,2)=v(28)
      Tangent(2,2,2,3)=0d0
      Tangent(2,2,3,1)=0d0
      Tangent(2,2,3,2)=0d0
      Tangent(2,2,3,3)=v(29)
      Tangent(2,3,1,1)=0d0
      Tangent(2,3,1,2)=0d0
      Tangent(2,3,1,3)=0d0
      Tangent(2,3,2,1)=0d0
      Tangent(2,3,2,2)=0d0
      Tangent(2,3,2,3)=v(11)
      Tangent(2,3,3,1)=0d0
      Tangent(2,3,3,2)=v(11)
      Tangent(2,3,3,3)=0d0
      Tangent(3,1,1,1)=0d0
      Tangent(3,1,1,2)=0d0
      Tangent(3,1,1,3)=v(11)
      Tangent(3,1,2,1)=0d0
      Tangent(3,1,2,2)=0d0
      Tangent(3,1,2,3)=0d0
      Tangent(3,1,3,1)=v(11)
      Tangent(3,1,3,2)=0d0
      Tangent(3,1,3,3)=0d0
      Tangent(3,2,1,1)=0d0
      Tangent(3,2,1,2)=0d0
      Tangent(3,2,1,3)=0d0
      Tangent(3,2,2,1)=0d0
      Tangent(3,2,2,2)=0d0
      Tangent(3,2,2,3)=v(11)
      Tangent(3,2,3,1)=0d0
      Tangent(3,2,3,2)=v(11)
      Tangent(3,2,3,3)=0d0
      Tangent(3,3,1,1)=v(29)
      Tangent(3,3,1,2)=0d0
      Tangent(3,3,1,3)=0d0
      Tangent(3,3,2,1)=0d0
      Tangent(3,3,2,2)=v(29)
      Tangent(3,3,2,3)=0d0
      Tangent(3,3,3,1)=0d0
      Tangent(3,3,3,2)=0d0
      Tangent(3,3,3,3)=v(28)
      write(*,'(a,x,g11.5,x,g11.5,x,g11.5,x,g11.5,x,g11.5,x,g11.5)'
     &)"LinearElasticity<< stressVEC=",v(19),v(24),v(26),v(20),v(25)
     &,v(21)
      write(*,'(a,x,g11.5)')"LinearElasticity<< error in tangent="
     &,0d0
      END
