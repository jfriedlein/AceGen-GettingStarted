!**************************************************************
!* AceGen    7.505 Linux (16 Aug 22)                          *
!*           Co. J. Korelc  2020           29 Apr 24 13:50:25 *
!**************************************************************
! User     : Full professional version
! Notebook : AceGen-LinearElasticity
! Evaluation time                 : 1 s     Mode  : Optimal
! Number of formulae              : 21      Method: Automatic
! Subroutine                      : LinearElasticity size: 1020
! Total size of Mathematica  code : 1020 subexpressions
! Total size of Fortran code      : 3722 bytes

!******************* S U B R O U T I N E **********************
      SUBROUTINE LinearElasticity(deformationGradient
     &,listOfMaterialParameters,CauchyStressVEC,Tangent)
      IMPLICIT NONE
      include 'sms.h'
      DOUBLE PRECISION v(152),deformationGradient(3,3)
     &,listOfMaterialParameters(2),CauchyStressVEC(6),Tangent(3,3,3,3
     &)
      v(10)=listOfMaterialParameters(1)
      v(11)=listOfMaterialParameters(2)
      v(39)=2d0*v(11)
      v(38)=v(10)+(-2d0/3d0)*v(11)
      v(37)=v(10)+(4d0/3d0)*v(11)
      v(12)=(-1d0)+deformationGradient(1,1)
      v(17)=(-1d0)+deformationGradient(2,2)
      v(23)=(-1d0)+deformationGradient(3,3)
      v(24)=v(12)+v(17)+v(23)
      v(30)=v(10)*v(24)
      v(29)=(-1d0/3d0)*v(24)
      v(25)=v(30)+(v(12)+v(29))*v(39)
      v(26)=(deformationGradient(1,2)+deformationGradient(2,1))*v(11)
      v(31)=v(30)+(v(17)+v(29))*v(39)
      v(32)=(deformationGradient(2,3)+deformationGradient(3,2))*v(11)
      v(33)=(deformationGradient(1,3)+deformationGradient(3,1))*v(11)
      v(35)=v(30)+(v(23)+v(29))*v(39)
      CauchyStressVEC(1)=v(25)
      CauchyStressVEC(2)=v(31)
      CauchyStressVEC(3)=v(35)
      CauchyStressVEC(4)=v(26)
      CauchyStressVEC(5)=v(32)
      CauchyStressVEC(6)=v(33)
      Tangent(1,1,1,1)=v(37)
      Tangent(1,1,1,2)=0d0
      Tangent(1,1,1,3)=0d0
      Tangent(1,1,2,1)=0d0
      Tangent(1,1,2,2)=v(38)
      Tangent(1,1,2,3)=0d0
      Tangent(1,1,3,1)=0d0
      Tangent(1,1,3,2)=0d0
      Tangent(1,1,3,3)=v(38)
      Tangent(1,2,1,1)=0d0
      Tangent(1,2,1,2)=v(39)
      Tangent(1,2,1,3)=0d0
      Tangent(1,2,2,1)=0d0
      Tangent(1,2,2,2)=0d0
      Tangent(1,2,2,3)=0d0
      Tangent(1,2,3,1)=0d0
      Tangent(1,2,3,2)=0d0
      Tangent(1,2,3,3)=0d0
      Tangent(1,3,1,1)=0d0
      Tangent(1,3,1,2)=0d0
      Tangent(1,3,1,3)=v(39)
      Tangent(1,3,2,1)=0d0
      Tangent(1,3,2,2)=0d0
      Tangent(1,3,2,3)=0d0
      Tangent(1,3,3,1)=0d0
      Tangent(1,3,3,2)=0d0
      Tangent(1,3,3,3)=0d0
      Tangent(2,1,1,1)=0d0
      Tangent(2,1,1,2)=0d0
      Tangent(2,1,1,3)=0d0
      Tangent(2,1,2,1)=v(39)
      Tangent(2,1,2,2)=0d0
      Tangent(2,1,2,3)=0d0
      Tangent(2,1,3,1)=0d0
      Tangent(2,1,3,2)=0d0
      Tangent(2,1,3,3)=0d0
      Tangent(2,2,1,1)=v(38)
      Tangent(2,2,1,2)=0d0
      Tangent(2,2,1,3)=0d0
      Tangent(2,2,2,1)=0d0
      Tangent(2,2,2,2)=v(37)
      Tangent(2,2,2,3)=0d0
      Tangent(2,2,3,1)=0d0
      Tangent(2,2,3,2)=0d0
      Tangent(2,2,3,3)=v(38)
      Tangent(2,3,1,1)=0d0
      Tangent(2,3,1,2)=0d0
      Tangent(2,3,1,3)=0d0
      Tangent(2,3,2,1)=0d0
      Tangent(2,3,2,2)=0d0
      Tangent(2,3,2,3)=v(39)
      Tangent(2,3,3,1)=0d0
      Tangent(2,3,3,2)=0d0
      Tangent(2,3,3,3)=0d0
      Tangent(3,1,1,1)=0d0
      Tangent(3,1,1,2)=0d0
      Tangent(3,1,1,3)=0d0
      Tangent(3,1,2,1)=0d0
      Tangent(3,1,2,2)=0d0
      Tangent(3,1,2,3)=0d0
      Tangent(3,1,3,1)=v(39)
      Tangent(3,1,3,2)=0d0
      Tangent(3,1,3,3)=0d0
      Tangent(3,2,1,1)=0d0
      Tangent(3,2,1,2)=0d0
      Tangent(3,2,1,3)=0d0
      Tangent(3,2,2,1)=0d0
      Tangent(3,2,2,2)=0d0
      Tangent(3,2,2,3)=0d0
      Tangent(3,2,3,1)=0d0
      Tangent(3,2,3,2)=v(39)
      Tangent(3,2,3,3)=0d0
      Tangent(3,3,1,1)=v(38)
      Tangent(3,3,1,2)=0d0
      Tangent(3,3,1,3)=0d0
      Tangent(3,3,2,1)=0d0
      Tangent(3,3,2,2)=v(38)
      Tangent(3,3,2,3)=0d0
      Tangent(3,3,3,1)=0d0
      Tangent(3,3,3,2)=0d0
      Tangent(3,3,3,3)=v(37)
      write(*,'(a,x,g11.5,x,g11.5,x,g11.5,x,g11.5,x,g11.5,x,g11.5)'
     &)"LinearElasticity<< stressVEC=",v(25),v(31),v(35),v(26),v(32)
     &,v(33)
      write(*,'(a,x,g11.5)')"LinearElasticity<< error in tangent=",(
     &-12d0)*v(11)+6d0*v(39)
      END
