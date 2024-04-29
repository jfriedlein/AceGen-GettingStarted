!**************************************************************
!* AceGen    7.505 Linux (16 Aug 22)                          *
!*           Co. J. Korelc  2020           24 Apr 24 17:32:04 *
!**************************************************************
! User     : Full professional version
! Notebook : Q1X_2D_linElastic
! Evaluation time                 : 3 s     Mode  : Optimal
! Number of formulae              : 131     Method: Automatic
! Subroutine                      : Q1X_2D_linElastic size: 1295
! Total size of Mathematica  code : 1295 subexpressions
! Total size of Fortran code      : 6349 bytes

!******************* S U B R O U T I N E **********************
      SUBROUTINE Q1X_2D_linElastic(X,pe,cm,hsve,nhsv,ndtot,istif,ele
     &,force,stiff,hsveTemp)
      IMPLICIT NONE
      include 'sms.h'
      INTEGER nhsv,ndtot,istif,ele,i101,i104,i164,i230,i234
      LOGICAL b106,b135,b146,b161,b235,b236,b264
      DOUBLE PRECISION v(529),X(4,2),pe(ndtot),cm(*),hsve
     &(nhsv),force(ndtot),stiff(ndtot,ndtot),hsveTemp(nhsv)
      v(11)=cm(11)
      v(251)=2d0*v(11)
      v(219)=cm(10)+(-2d0/3d0)*v(11)
      i101=int(cm(3))
      v(229)=1d0/DBLE(i101)
      b235=istif.eq.1
      i104=ndtot
      IF(i104.ne.8) THEN
       write(*,'(a,x,a,x,g11.5,x,a,x,i5)')"Q1X_2D_linElastic"
     & ,"<< Hardcoded ndtot_AG=",8d0
     & ," does not equal provided ndtot=",i104
       call cstop("Error Termination")
      ELSE
      ENDIF
      v(109)=X(1,1)
      v(110)=X(1,2)
      v(111)=X(2,1)
      v(260)=v(109)-v(111)
      v(112)=X(2,2)
      v(258)=v(110)-v(112)
      v(113)=X(3,1)
      v(256)=v(111)-v(113)
      v(114)=X(3,2)
      v(254)=v(112)-v(114)
      v(115)=X(4,1)
      v(261)=v(113)-v(115)
      v(255)=v(109)-v(115)
      v(116)=X(4,2)
      v(259)=v(114)-v(116)
      v(253)=v(110)-v(116)
      v(125)=pe(1)
      v(126)=pe(2)
      v(127)=pe(3)
      v(128)=pe(4)
      v(129)=pe(5)
      v(130)=pe(6)
      v(131)=pe(7)
      v(132)=pe(8)
      IF(((-7d0)+nhsv)/i101.lt.0d0) THEN
       write(*,'(a,x,a,x,g11.5)')"Q1X_2D_linElastic"
     & ,"<< Provided nhsv insufficient for nhsv_per_QP=",0d0
       write(*,'(a,x,a,x,g11.5)')"Q1X_2D_linElastic"
     & ,"<< Choose at least nhsv=",7d0
       call cstop("Error Termination")
      ELSE
      ENDIF
      v(139)=0d0
      v(140)=0d0
      v(141)=0d0
      v(142)=0d0
      v(143)=0d0
      v(144)=0d0
      IF(i101.eq.4) THEN
       v(148)=(-0.5773502691896257d0)
       v(149)=0.5773502691896257d0
       v(150)=0.5773502691896257d0
       v(151)=(-0.5773502691896257d0)
       v(152)=(-0.5773502691896257d0)
       v(153)=(-0.5773502691896257d0)
       v(154)=0.5773502691896257d0
       v(155)=0.5773502691896257d0
       v(156)=1d0
       v(157)=1d0
       v(158)=1d0
       v(159)=1d0
      ELSE
       IF(i101.eq.1) THEN
        v(148)=0d0
        v(149)=0d0
        v(150)=0d0
        v(151)=0d0
        v(152)=0d0
        v(153)=0d0
        v(154)=0d0
        v(155)=0d0
        v(156)=4d0
        v(157)=0d0
        v(158)=0d0
        v(159)=0d0
       ELSE
        write(*,'(a,x,i5,x,a)')"quadrature_rule<< number of QPs "
     &  ,i101," not defined"
        call cstop("Error Termination")
       ENDIF
      ENDIF
      v(356)=v(156)
      v(357)=v(157)
      v(358)=v(158)
      v(359)=v(159)
      v(352)=v(152)
      v(353)=v(153)
      v(354)=v(154)
      v(355)=v(155)
      v(348)=v(148)
      v(349)=v(149)
      v(350)=v(150)
      v(351)=v(151)
      DO i164=1,i101
       v(165)=v(347+i164)
       v(181)=((-1d0)+v(165))/4d0
       v(182)=((-1d0)-v(165))/4d0
       v(187)=v(181)*v(253)+v(182)*v(254)
       v(185)=v(181)*v(255)+v(182)*v(256)
       v(166)=v(351+i164)
       v(183)=(1d0+v(166))/4d0
       v(180)=((-1d0)+v(166))/4d0
       v(186)=v(180)*v(258)+v(183)*v(259)
       v(184)=v(180)*v(260)+v(183)*v(261)
       v(167)=v(355+i164)
       v(188)=-(v(185)*v(186))+v(184)*v(187)
       v(189)=-(v(187)/v(188))
       v(203)=-(v(183)*v(189))
       v(195)=-(v(180)*v(189))
       v(190)=v(185)/v(188)
       v(206)=-(v(183)*v(190))
       v(197)=-(v(180)*v(190))
       v(191)=-(v(186)/v(188))
       v(204)=v(181)*v(191)
       v(199)=v(182)*v(191)
       v(192)=v(184)/v(188)
       v(207)=v(181)*v(192)
       v(201)=v(182)*v(192)
       v(193)=v(195)+v(204)
       v(194)=v(197)+v(207)
       v(196)=-v(195)+v(199)
       v(198)=-v(197)+v(201)
       v(200)=-v(199)+v(203)
       v(202)=-v(201)+v(206)
       v(205)=-v(203)-v(204)
       v(208)=-v(206)-v(207)
       v(391)=v(194)
       v(392)=v(193)
       v(393)=v(198)
       v(394)=v(196)
       v(395)=v(202)
       v(396)=v(200)
       v(397)=v(208)
       v(398)=v(205)
       v(213)=v(125)*v(193)+v(127)*v(196)+v(129)*v(200)+v(131)*v(205)
       v(216)=v(126)*v(194)+v(128)*v(198)+v(130)*v(202)+v(132)*v(208)
       v(225)=(v(213)+v(216))*v(219)
       v(222)=v(225)+v(213)*v(251)
       v(226)=v(225)+v(216)*v(251)
       v(375)=v(193)*v(222)
       v(376)=v(194)*v(226)
       v(377)=v(196)*v(222)
       v(378)=v(198)*v(226)
       v(379)=v(200)*v(222)
       v(380)=v(202)*v(226)
       v(381)=v(205)*v(222)
       v(382)=v(208)*v(226)
       v(223)=v(11)*(v(126)*v(193)+v(125)*v(194)+v(128)*v(196)+v(127
     & )*v(198)+v(130)*v(200)+v(129)*v(202)+v(132)*v(205)+v(131)*v
     & (208))
       v(139)=v(139)+v(222)*v(229)
       v(140)=v(140)+v(226)*v(229)
       v(141)=v(141)+v(225)*v(229)
       v(142)=v(142)+v(223)*v(229)
       v(143)=v(143)
       v(144)=v(144)
       IF(b235) THEN
        v(414)=v(193)
        v(415)=0d0
        v(416)=v(196)
        v(417)=0d0
        v(418)=v(200)
        v(419)=0d0
        v(420)=v(205)
        v(421)=0d0
        v(406)=0d0
        v(407)=v(194)
        v(408)=0d0
        v(409)=v(198)
        v(410)=0d0
        v(411)=v(202)
        v(412)=0d0
        v(413)=v(208)
       ELSE
       ENDIF
       DO i230=1,i104
        v(245)=v(390+i230)
        force(i230)=force(i230)+v(167)*v(188)*(v(223)*v(245)+v(374
     &  +i230))
        DO i234=1,i104
         IF(b235) THEN
          v(239)=v(188)*v(405+i230)
          v(240)=v(188)*v(413+i230)
          v(243)=v(219)*(v(239)+v(240))
          v(242)=v(243)+v(239)*v(251)
          v(244)=v(243)+v(240)*v(251)
          v(422)=v(193)*v(244)
          v(423)=v(194)*v(242)
          v(424)=v(196)*v(244)
          v(425)=v(198)*v(242)
          v(426)=v(200)*v(244)
          v(427)=v(202)*v(242)
          v(428)=v(205)*v(244)
          v(429)=v(208)*v(242)
          v(247)=v(11)*v(188)*v(245)*v(390+i234)+v(421+i234)
         ELSE
          v(247)=0d0
         ENDIF
         stiff(i230,i234)=stiff(i230,i234)+v(167)*v(247)
        ENDDO
       ENDDO
      ENDDO
      hsveTemp(1)=v(139)
      hsveTemp(2)=v(140)
      hsveTemp(3)=v(141)
      hsveTemp(4)=v(142)
      hsveTemp(5)=v(143)
      hsveTemp(6)=v(144)
      hsveTemp(7)=sqrt(((v(139)-v(140))**2+(v(140)-v(141))**2+(-v(139
     &)+v(141))**2)/2d0+3d0*((v(142)*v(142))+(v(143)*v(143))+(v(144
     &)*v(144))))
      END
