*KEYWORD
$
$ mP-Hiso-D:
$ - multiplicative plasticity
$ - isotropic plastic hardening
$ - coupled damage (with softening)
$
$ ########################## MATERIAL PARAMETERS ###############################
$
*PARAMETER
$#   prmr1      val1     prmr2      val2     prmr3      val3     prmr4      val4
R  DENSITY   7.85e-9
$ ELASTICITY: ------
$ Bulk modulus
R  BulkMod   1.625e5
$ Shear modulus
R ShearMod     7.5e4
$ PLASTICITY: ------
$ Initial yield stress
R  IYS          180
$ Power-law hardening modulus
R  LHM          100.
$ Exponential yield stress increment
R  YSI            0.
$ Saturation rate coefficient
R  SRC            0.
$ Saturation exponent
R  SExpo          1.
$ Power-law exponent
R  PowExpo        1.
$ DAMAGE: ----------
R DVOL            1.
R DDEV            1.
R DPLA            1.
R DP1           100.
R DP2           0.01
R DExpo           1.
$
$ ###################### USER MATERIAL MODEL CARD ##############################
$
*MAT_USER_DEFINED_MATERIAL_MODELS_TITLE
UMAT - multiPD
$#     mid        ro        mt       lmc       nhv    iortho     ibulk        ig
         1  &DENSITY        43        32        30         0         9        10
$#   ivect     ifail    itherm    ihyper      ieos      lmca    unused    unused
         0         0         0         1         0         0
$
$ UMAT - CONTROL and SETTINGS:
$#      p1        p2        p3        p4        p5        p6        p7        p8
$   unused    unused    unused    unused debugging    unused    unused    unused
                                                 3
$
$ ELASTICITY:
$#      p1        p2        p3        p4        p5        p6        p7        p8
$  BulkMod  ShearMod    unused    unused    unused    unused    unused    unused
  &BulkMod &ShearMod         0         0         0         0         0         0
$
$ PLASTICITY - isotropic hardening:
$#      p1        p2        p3        p4        p5        p6        p7        p8
                &IYS      &LHM      &YSI      &SRC    &SExpo  &PowExpo
$
$ DAMAGE - SETTINGS:
$#      p1        p2        p3        p4        p5        p6        p7        p8
     &DVOL     &DDEV     &DPLA      &DP1      &DP2    &DExpo
$
*DATABASE_EXTENT_BINARY
$#   neiph     neips    maxint    strflg    sigflg    epsflg    rltflg    engflg
        39        39         3         0         1         1         1         1
$#  cmpflg    ieverp    beamip     dcomp      shge     stssz    n3thdt   ialemat
         0         0         0         1         1         1         2         1
$# nintsld   pkp_sen      sclp     hydro     msscl     therm    intout    nodout
         0         0       1.0         0         0         0STRESS
$#    dtdt    resplt     neipb     quadr     cubic
         0         0         0         0         0
*END
