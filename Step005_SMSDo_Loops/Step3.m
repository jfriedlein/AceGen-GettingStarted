%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           9 May 24 17:20:00  *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-SMSDo
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 13      Method: Automatic
% Subroutine                      : Step3 size: 136
% Total size of Mathematica  code : 136 subexpressions
% Total size of Matlab code      : 777 bytes 

%*********************** F U N C T I O N **************************
function[convergedValue,convergenceHistory]=Step3(displacement,parameter);
persistent v;
if size(v)<140
  v=zeros(140,'double');
end;
v(3)=displacement;
for i4=1:1:20;
 v(6)=-parameter+v(3);
 v(7)=-5e0+2e0*v(3)+200e0*Power(v(6),3);
 disp(sprintf("\n%s %f %s %f %s %f %s %f ","iteration i_NR=",i4,": W=",100e0-5e0*v(3)+(v(3)*v(3)) ...
  +50e0*Power(v(6),4),"; R=",v(7),"; SMSAbs[R]=",abs(v(7))));
 convergenceHistory(i4,1)=v(3);
 convergenceHistory(i4,2)=abs(v(7));
 if(abs(v(7))<0.1e-7)
  convergedValue=v(3);
  disp(sprintf("\n%s ","converged"));
  break;
 else;
 end;
 if(i4>=20)
  convergedValue=v(3);
  disp(sprintf("\n%s ","failed"));
  break;
 else;
 end;
 v(3)=v(3)-v(7)/(2e0+600e0*(v(6)*v(6)));
end;


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