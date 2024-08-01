%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           1 Aug 24 15:58:08  *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-LinearElasticity
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 21      Method: Automatic
% Subroutine                      : LinearElasticity size: 1026
% Total size of Mathematica  code : 1026 subexpressions
% Total size of Matlab code      : 2889 bytes 

%*********************** F U N C T I O N **************************
function[CauchyStressVEC,Tangent]=LinearElasticity(deformationGradient,listOfMaterialParameters);
persistent v;
if size(v)<144
  v=zeros(144,'double');
end;
v(10)=listOfMaterialParameters(1);
v(11)=listOfMaterialParameters(2);
v(34)=2e0*v(11);
v(29)=v(10)+(-2e0/3e0)*v(11);
v(28)=v(10)+(4e0/3e0)*v(11);
v(12)=-1e0+deformationGradient(1,1);
v(15)=-1e0+deformationGradient(2,2);
v(17)=-1e0+deformationGradient(3,3);
v(18)=v(12)+v(15)+v(17);
v(23)=v(10)*v(18);
v(22)=(-1e0/3e0)*v(18);
v(19)=v(23)+(v(12)+v(22))*v(34);
v(20)=(deformationGradient(1,2)+deformationGradient(2,1))*v(11);
v(21)=(deformationGradient(1,3)+deformationGradient(3,1))*v(11);
v(24)=v(23)+(v(15)+v(22))*v(34);
v(25)=(deformationGradient(2,3)+deformationGradient(3,2))*v(11);
v(26)=v(23)+(v(17)+v(22))*v(34);
CauchyStressVEC(1)=v(19);
CauchyStressVEC(2)=v(24);
CauchyStressVEC(3)=v(26);
CauchyStressVEC(4)=v(20);
CauchyStressVEC(5)=v(25);
CauchyStressVEC(6)=v(21);
Tangent(1,1,1,1)=v(28);
Tangent(1,1,1,2)=0;
Tangent(1,1,1,3)=0;
Tangent(1,1,2,1)=0;
Tangent(1,1,2,2)=v(29);
Tangent(1,1,2,3)=0;
Tangent(1,1,3,1)=0;
Tangent(1,1,3,2)=0;
Tangent(1,1,3,3)=v(29);
Tangent(1,2,1,1)=0;
Tangent(1,2,1,2)=v(11);
Tangent(1,2,1,3)=0;
Tangent(1,2,2,1)=v(11);
Tangent(1,2,2,2)=0;
Tangent(1,2,2,3)=0;
Tangent(1,2,3,1)=0;
Tangent(1,2,3,2)=0;
Tangent(1,2,3,3)=0;
Tangent(1,3,1,1)=0;
Tangent(1,3,1,2)=0;
Tangent(1,3,1,3)=v(11);
Tangent(1,3,2,1)=0;
Tangent(1,3,2,2)=0;
Tangent(1,3,2,3)=0;
Tangent(1,3,3,1)=v(11);
Tangent(1,3,3,2)=0;
Tangent(1,3,3,3)=0;
Tangent(2,1,1,1)=0;
Tangent(2,1,1,2)=v(11);
Tangent(2,1,1,3)=0;
Tangent(2,1,2,1)=v(11);
Tangent(2,1,2,2)=0;
Tangent(2,1,2,3)=0;
Tangent(2,1,3,1)=0;
Tangent(2,1,3,2)=0;
Tangent(2,1,3,3)=0;
Tangent(2,2,1,1)=v(29);
Tangent(2,2,1,2)=0;
Tangent(2,2,1,3)=0;
Tangent(2,2,2,1)=0;
Tangent(2,2,2,2)=v(28);
Tangent(2,2,2,3)=0;
Tangent(2,2,3,1)=0;
Tangent(2,2,3,2)=0;
Tangent(2,2,3,3)=v(29);
Tangent(2,3,1,1)=0;
Tangent(2,3,1,2)=0;
Tangent(2,3,1,3)=0;
Tangent(2,3,2,1)=0;
Tangent(2,3,2,2)=0;
Tangent(2,3,2,3)=v(11);
Tangent(2,3,3,1)=0;
Tangent(2,3,3,2)=v(11);
Tangent(2,3,3,3)=0;
Tangent(3,1,1,1)=0;
Tangent(3,1,1,2)=0;
Tangent(3,1,1,3)=v(11);
Tangent(3,1,2,1)=0;
Tangent(3,1,2,2)=0;
Tangent(3,1,2,3)=0;
Tangent(3,1,3,1)=v(11);
Tangent(3,1,3,2)=0;
Tangent(3,1,3,3)=0;
Tangent(3,2,1,1)=0;
Tangent(3,2,1,2)=0;
Tangent(3,2,1,3)=0;
Tangent(3,2,2,1)=0;
Tangent(3,2,2,2)=0;
Tangent(3,2,2,3)=v(11);
Tangent(3,2,3,1)=0;
Tangent(3,2,3,2)=v(11);
Tangent(3,2,3,3)=0;
Tangent(3,3,1,1)=v(29);
Tangent(3,3,1,2)=0;
Tangent(3,3,1,3)=0;
Tangent(3,3,2,1)=0;
Tangent(3,3,2,2)=v(29);
Tangent(3,3,2,3)=0;
Tangent(3,3,3,1)=0;
Tangent(3,3,3,2)=0;
Tangent(3,3,3,3)=v(28);
disp(sprintf("\n%s %f %f %f %f %f %f ","LinearElasticity<< stressVEC=",v(19),v(24),v(26),v(20),v(25 ...
 ),v(21)));
disp(sprintf("\n%s %f ","LinearElasticity<< error in tangent=",0));


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