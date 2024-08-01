/*************************************************************
* AceGen    7.505 Linux (16 Aug 22)                          *
*           Co. J. Korelc  2020           1 Aug 24 15:58:02  *
**************************************************************
User     : Full professional version
Notebook : AceGen-LinearElasticity
Evaluation time                 : 1 s     Mode  : Optimal
Number of formulae              : 21      Method: Automatic
Subroutine                      : LinearElasticity size: 1026
Total size of Mathematica  code : 1026 subexpressions
Total size of C code            : 3330 bytes */
#include "sms.h"

/******************* S U B R O U T I N E *********************/
void LinearElasticity(double deformationGradient[3][3]
     ,double listOfMaterialParameters[2],double CauchyStressVEC[6]
     ,double Tangent[3][3][3][3])
{
double v[144];
v[10]=listOfMaterialParameters[0];
v[11]=listOfMaterialParameters[1];
v[34]=2e0*v[11];
v[29]=v[10]+(-2e0/3e0)*v[11];
v[28]=v[10]+(4e0/3e0)*v[11];
v[12]=-1e0+deformationGradient[0][0];
v[15]=-1e0+deformationGradient[1][1];
v[17]=-1e0+deformationGradient[2][2];
v[18]=v[12]+v[15]+v[17];
v[23]=v[10]*v[18];
v[22]=(-1e0/3e0)*v[18];
v[19]=v[23]+(v[12]+v[22])*v[34];
v[20]=(deformationGradient[0][1]+deformationGradient[1][0])*v[11];
v[21]=(deformationGradient[0][2]+deformationGradient[2][0])*v[11];
v[24]=v[23]+(v[15]+v[22])*v[34];
v[25]=(deformationGradient[1][2]+deformationGradient[2][1])*v[11];
v[26]=v[23]+(v[17]+v[22])*v[34];
CauchyStressVEC[0]=v[19];
CauchyStressVEC[1]=v[24];
CauchyStressVEC[2]=v[26];
CauchyStressVEC[3]=v[20];
CauchyStressVEC[4]=v[25];
CauchyStressVEC[5]=v[21];
Tangent[0][0][0][0]=v[28];
Tangent[0][0][0][1]=0e0;
Tangent[0][0][0][2]=0e0;
Tangent[0][0][1][0]=0e0;
Tangent[0][0][1][1]=v[29];
Tangent[0][0][1][2]=0e0;
Tangent[0][0][2][0]=0e0;
Tangent[0][0][2][1]=0e0;
Tangent[0][0][2][2]=v[29];
Tangent[0][1][0][0]=0e0;
Tangent[0][1][0][1]=v[11];
Tangent[0][1][0][2]=0e0;
Tangent[0][1][1][0]=v[11];
Tangent[0][1][1][1]=0e0;
Tangent[0][1][1][2]=0e0;
Tangent[0][1][2][0]=0e0;
Tangent[0][1][2][1]=0e0;
Tangent[0][1][2][2]=0e0;
Tangent[0][2][0][0]=0e0;
Tangent[0][2][0][1]=0e0;
Tangent[0][2][0][2]=v[11];
Tangent[0][2][1][0]=0e0;
Tangent[0][2][1][1]=0e0;
Tangent[0][2][1][2]=0e0;
Tangent[0][2][2][0]=v[11];
Tangent[0][2][2][1]=0e0;
Tangent[0][2][2][2]=0e0;
Tangent[1][0][0][0]=0e0;
Tangent[1][0][0][1]=v[11];
Tangent[1][0][0][2]=0e0;
Tangent[1][0][1][0]=v[11];
Tangent[1][0][1][1]=0e0;
Tangent[1][0][1][2]=0e0;
Tangent[1][0][2][0]=0e0;
Tangent[1][0][2][1]=0e0;
Tangent[1][0][2][2]=0e0;
Tangent[1][1][0][0]=v[29];
Tangent[1][1][0][1]=0e0;
Tangent[1][1][0][2]=0e0;
Tangent[1][1][1][0]=0e0;
Tangent[1][1][1][1]=v[28];
Tangent[1][1][1][2]=0e0;
Tangent[1][1][2][0]=0e0;
Tangent[1][1][2][1]=0e0;
Tangent[1][1][2][2]=v[29];
Tangent[1][2][0][0]=0e0;
Tangent[1][2][0][1]=0e0;
Tangent[1][2][0][2]=0e0;
Tangent[1][2][1][0]=0e0;
Tangent[1][2][1][1]=0e0;
Tangent[1][2][1][2]=v[11];
Tangent[1][2][2][0]=0e0;
Tangent[1][2][2][1]=v[11];
Tangent[1][2][2][2]=0e0;
Tangent[2][0][0][0]=0e0;
Tangent[2][0][0][1]=0e0;
Tangent[2][0][0][2]=v[11];
Tangent[2][0][1][0]=0e0;
Tangent[2][0][1][1]=0e0;
Tangent[2][0][1][2]=0e0;
Tangent[2][0][2][0]=v[11];
Tangent[2][0][2][1]=0e0;
Tangent[2][0][2][2]=0e0;
Tangent[2][1][0][0]=0e0;
Tangent[2][1][0][1]=0e0;
Tangent[2][1][0][2]=0e0;
Tangent[2][1][1][0]=0e0;
Tangent[2][1][1][1]=0e0;
Tangent[2][1][1][2]=v[11];
Tangent[2][1][2][0]=0e0;
Tangent[2][1][2][1]=v[11];
Tangent[2][1][2][2]=0e0;
Tangent[2][2][0][0]=v[29];
Tangent[2][2][0][1]=0e0;
Tangent[2][2][0][2]=0e0;
Tangent[2][2][1][0]=0e0;
Tangent[2][2][1][1]=v[29];
Tangent[2][2][1][2]=0e0;
Tangent[2][2][2][0]=0e0;
Tangent[2][2][2][1]=0e0;
Tangent[2][2][2][2]=v[28];
printf("\n%s %g %g %g %g %g %g ","LinearElasticity<< stressVEC=",(double)(v[19]),(double)(v[24]),
 (double)(v[26]),(double)(v[20]),(double)(v[25]),(double)(v[21]));
printf("\n%s %g ","LinearElasticity<< error in tangent=",(double)(0e0));
};
