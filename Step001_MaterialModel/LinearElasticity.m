%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           29 Apr 24 13:50:34 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-LinearElasticity
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 21      Method: Automatic
% Subroutine                      : LinearElasticity size: 1020
% Total size of Mathematica  code : 1020 subexpressions
% Total size of Matlab code      : 2885 bytes 

%*********************** F U N C T I O N **************************
function[CauchyStressVEC,Tangent]=LinearElasticity(deformationGradient,listOfMaterialParameters);
persistent v;
if size(v)<152
  v=zeros(152,'double');
end;
v(10)=listOfMaterialParameters(1);
v(11)=listOfMaterialParameters(2);
v(39)=2e0*v(11);
v(38)=v(10)+(-2e0/3e0)*v(11);
v(37)=v(10)+(4e0/3e0)*v(11);
v(12)=-1e0+deformationGradient(1,1);
v(17)=-1e0+deformationGradient(2,2);
v(23)=-1e0+deformationGradient(3,3);
v(24)=v(12)+v(17)+v(23);
v(30)=v(10)*v(24);
v(29)=(-1e0/3e0)*v(24);
v(25)=v(30)+(v(12)+v(29))*v(39);
v(26)=(deformationGradient(1,2)+deformationGradient(2,1))*v(11);
v(31)=v(30)+(v(17)+v(29))*v(39);
v(32)=(deformationGradient(2,3)+deformationGradient(3,2))*v(11);
v(33)=(deformationGradient(1,3)+deformationGradient(3,1))*v(11);
v(35)=v(30)+(v(23)+v(29))*v(39);
CauchyStressVEC(1)=v(25);
CauchyStressVEC(2)=v(31);
CauchyStressVEC(3)=v(35);
CauchyStressVEC(4)=v(26);
CauchyStressVEC(5)=v(32);
CauchyStressVEC(6)=v(33);
Tangent(1,1,1,1)=v(37);
Tangent(1,1,1,2)=0;
Tangent(1,1,1,3)=0;
Tangent(1,1,2,1)=0;
Tangent(1,1,2,2)=v(38);
Tangent(1,1,2,3)=0;
Tangent(1,1,3,1)=0;
Tangent(1,1,3,2)=0;
Tangent(1,1,3,3)=v(38);
Tangent(1,2,1,1)=0;
Tangent(1,2,1,2)=v(39);
Tangent(1,2,1,3)=0;
Tangent(1,2,2,1)=0;
Tangent(1,2,2,2)=0;
Tangent(1,2,2,3)=0;
Tangent(1,2,3,1)=0;
Tangent(1,2,3,2)=0;
Tangent(1,2,3,3)=0;
Tangent(1,3,1,1)=0;
Tangent(1,3,1,2)=0;
Tangent(1,3,1,3)=v(39);
Tangent(1,3,2,1)=0;
Tangent(1,3,2,2)=0;
Tangent(1,3,2,3)=0;
Tangent(1,3,3,1)=0;
Tangent(1,3,3,2)=0;
Tangent(1,3,3,3)=0;
Tangent(2,1,1,1)=0;
Tangent(2,1,1,2)=0;
Tangent(2,1,1,3)=0;
Tangent(2,1,2,1)=v(39);
Tangent(2,1,2,2)=0;
Tangent(2,1,2,3)=0;
Tangent(2,1,3,1)=0;
Tangent(2,1,3,2)=0;
Tangent(2,1,3,3)=0;
Tangent(2,2,1,1)=v(38);
Tangent(2,2,1,2)=0;
Tangent(2,2,1,3)=0;
Tangent(2,2,2,1)=0;
Tangent(2,2,2,2)=v(37);
Tangent(2,2,2,3)=0;
Tangent(2,2,3,1)=0;
Tangent(2,2,3,2)=0;
Tangent(2,2,3,3)=v(38);
Tangent(2,3,1,1)=0;
Tangent(2,3,1,2)=0;
Tangent(2,3,1,3)=0;
Tangent(2,3,2,1)=0;
Tangent(2,3,2,2)=0;
Tangent(2,3,2,3)=v(39);
Tangent(2,3,3,1)=0;
Tangent(2,3,3,2)=0;
Tangent(2,3,3,3)=0;
Tangent(3,1,1,1)=0;
Tangent(3,1,1,2)=0;
Tangent(3,1,1,3)=0;
Tangent(3,1,2,1)=0;
Tangent(3,1,2,2)=0;
Tangent(3,1,2,3)=0;
Tangent(3,1,3,1)=v(39);
Tangent(3,1,3,2)=0;
Tangent(3,1,3,3)=0;
Tangent(3,2,1,1)=0;
Tangent(3,2,1,2)=0;
Tangent(3,2,1,3)=0;
Tangent(3,2,2,1)=0;
Tangent(3,2,2,2)=0;
Tangent(3,2,2,3)=0;
Tangent(3,2,3,1)=0;
Tangent(3,2,3,2)=v(39);
Tangent(3,2,3,3)=0;
Tangent(3,3,1,1)=v(38);
Tangent(3,3,1,2)=0;
Tangent(3,3,1,3)=0;
Tangent(3,3,2,1)=0;
Tangent(3,3,2,2)=v(38);
Tangent(3,3,2,3)=0;
Tangent(3,3,3,1)=0;
Tangent(3,3,3,2)=0;
Tangent(3,3,3,3)=v(37);
disp(sprintf("\n%s %f %f %f %f %f %f ","LinearElasticity<< stressVEC=",v(25),v(31),v(35),v(26),v(32 ...
 ),v(33)));
disp(sprintf("\n%s %f ","LinearElasticity<< error in tangent=",-12e0*v(11)+6e0*v(39)));


function [x]=SMSKDelta(i,j)
if (i==j) , x=1; else x=0; end;
end
function [x]=SMSDeltaPart(a,i,j,k)
l=round(i/j);
if (mod(i,j) ~= 0 | l>k) , x=0; else x=a(l); end;
end
function [x]=Power(a,b)
x=a^b;
end
function [x]=SMSTernaryOperator(a,b,c)
if (c) , x=a; else x=b; end;
end
end