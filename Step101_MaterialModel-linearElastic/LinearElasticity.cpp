/*************************************************************
* AceGen    7.505 Linux (16 Aug 22)                          *
*           Co. J. Korelc  2020           29 Apr 24 13:50:18 *
**************************************************************
User     : Full professional version
Notebook : AceGen-LinearElasticity
Evaluation time                 : 1 s     Mode  : Optimal
Number of formulae              : 21      Method: Automatic
Subroutine                      : LinearElasticity size: 1020
Total size of Mathematica  code : 1020 subexpressions
Total size of C code            : 3336 bytes */
#include "sms.h"

/******************* S U B R O U T I N E *********************/
void LinearElasticity(double deformationGradient[3][3]
     ,double listOfMaterialParameters[2],double CauchyStressVEC[6]
     ,double Tangent[3][3][3][3])
{
double v[152];
v[10]=listOfMaterialParameters[0];
v[11]=listOfMaterialParameters[1];
v[39]=2e0*v[11];
v[38]=v[10]+(-2e0/3e0)*v[11];
v[37]=v[10]+(4e0/3e0)*v[11];
v[12]=-1e0+deformationGradient[0][0];
v[17]=-1e0+deformationGradient[1][1];
v[23]=-1e0+deformationGradient[2][2];
v[24]=v[12]+v[17]+v[23];
v[30]=v[10]*v[24];
v[29]=(-1e0/3e0)*v[24];
v[25]=v[30]+(v[12]+v[29])*v[39];
v[26]=(deformationGradient[0][1]+deformationGradient[1][0])*v[11];
v[31]=v[30]+(v[17]+v[29])*v[39];
v[32]=(deformationGradient[1][2]+deformationGradient[2][1])*v[11];
v[33]=(deformationGradient[0][2]+deformationGradient[2][0])*v[11];
v[35]=v[30]+(v[23]+v[29])*v[39];
CauchyStressVEC[0]=v[25];
CauchyStressVEC[1]=v[31];
CauchyStressVEC[2]=v[35];
CauchyStressVEC[3]=v[26];
CauchyStressVEC[4]=v[32];
CauchyStressVEC[5]=v[33];
Tangent[0][0][0][0]=v[37];
Tangent[0][0][0][1]=0e0;
Tangent[0][0][0][2]=0e0;
Tangent[0][0][1][0]=0e0;
Tangent[0][0][1][1]=v[38];
Tangent[0][0][1][2]=0e0;
Tangent[0][0][2][0]=0e0;
Tangent[0][0][2][1]=0e0;
Tangent[0][0][2][2]=v[38];
Tangent[0][1][0][0]=0e0;
Tangent[0][1][0][1]=v[39];
Tangent[0][1][0][2]=0e0;
Tangent[0][1][1][0]=0e0;
Tangent[0][1][1][1]=0e0;
Tangent[0][1][1][2]=0e0;
Tangent[0][1][2][0]=0e0;
Tangent[0][1][2][1]=0e0;
Tangent[0][1][2][2]=0e0;
Tangent[0][2][0][0]=0e0;
Tangent[0][2][0][1]=0e0;
Tangent[0][2][0][2]=v[39];
Tangent[0][2][1][0]=0e0;
Tangent[0][2][1][1]=0e0;
Tangent[0][2][1][2]=0e0;
Tangent[0][2][2][0]=0e0;
Tangent[0][2][2][1]=0e0;
Tangent[0][2][2][2]=0e0;
Tangent[1][0][0][0]=0e0;
Tangent[1][0][0][1]=0e0;
Tangent[1][0][0][2]=0e0;
Tangent[1][0][1][0]=v[39];
Tangent[1][0][1][1]=0e0;
Tangent[1][0][1][2]=0e0;
Tangent[1][0][2][0]=0e0;
Tangent[1][0][2][1]=0e0;
Tangent[1][0][2][2]=0e0;
Tangent[1][1][0][0]=v[38];
Tangent[1][1][0][1]=0e0;
Tangent[1][1][0][2]=0e0;
Tangent[1][1][1][0]=0e0;
Tangent[1][1][1][1]=v[37];
Tangent[1][1][1][2]=0e0;
Tangent[1][1][2][0]=0e0;
Tangent[1][1][2][1]=0e0;
Tangent[1][1][2][2]=v[38];
Tangent[1][2][0][0]=0e0;
Tangent[1][2][0][1]=0e0;
Tangent[1][2][0][2]=0e0;
Tangent[1][2][1][0]=0e0;
Tangent[1][2][1][1]=0e0;
Tangent[1][2][1][2]=v[39];
Tangent[1][2][2][0]=0e0;
Tangent[1][2][2][1]=0e0;
Tangent[1][2][2][2]=0e0;
Tangent[2][0][0][0]=0e0;
Tangent[2][0][0][1]=0e0;
Tangent[2][0][0][2]=0e0;
Tangent[2][0][1][0]=0e0;
Tangent[2][0][1][1]=0e0;
Tangent[2][0][1][2]=0e0;
Tangent[2][0][2][0]=v[39];
Tangent[2][0][2][1]=0e0;
Tangent[2][0][2][2]=0e0;
Tangent[2][1][0][0]=0e0;
Tangent[2][1][0][1]=0e0;
Tangent[2][1][0][2]=0e0;
Tangent[2][1][1][0]=0e0;
Tangent[2][1][1][1]=0e0;
Tangent[2][1][1][2]=0e0;
Tangent[2][1][2][0]=0e0;
Tangent[2][1][2][1]=v[39];
Tangent[2][1][2][2]=0e0;
Tangent[2][2][0][0]=v[38];
Tangent[2][2][0][1]=0e0;
Tangent[2][2][0][2]=0e0;
Tangent[2][2][1][0]=0e0;
Tangent[2][2][1][1]=v[38];
Tangent[2][2][1][2]=0e0;
Tangent[2][2][2][0]=0e0;
Tangent[2][2][2][1]=0e0;
Tangent[2][2][2][2]=v[37];
printf("\n%s %g %g %g %g %g %g ","LinearElasticity<< stressVEC=",(double)(v[25]),(double)(v[31]),
 (double)(v[35]),(double)(v[26]),(double)(v[32]),(double)(v[33]));
printf("\n%s %g ","LinearElasticity<< error in tangent=",(double)(-12e0*v[11]+6e0*v[39]));
};
