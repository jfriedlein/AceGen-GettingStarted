%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           29 May 24 14:40:38 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-SMSDo
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 22      Method: Automatic
% Subroutine                      : SMSDo_Loops size: 213
% Total size of Mathematica  code : 213 subexpressions
% Total size of Matlab code      : 1068 bytes 

%*********************** F U N C T I O N **************************
function[convergedValue,convergenceHistory]=SMSDo_Loops(displacement,parameter);
persistent v;
if size(v)<159
  v=zeros(159,'double');
end;
v(25)=0;
v(1)=displacement;
for i3=1:1:20;
 v(5)=-parameter+v(1);
 v(21)=(v(5)*v(5));
 v(33)=600e0*v(21);
 v(14)=2e0+v(33);
 v(6)=-5e0+2e0*v(1)+200e0*Power(v(5),3);
 v(34)=-600e0*(v(21)-(2e0*v(5)*v(6))/v(14));
 disp(sprintf("\n%s %f %s %f %s %f %s %f ","iteration i_NR=",i3,": W=",100e0-5e0*v(1)+(v(1)*v(1)) ...
  +50e0*Power(v(5),4),"; R=",v(6),"; SMSAbs[R]=",abs(v(6))));
 convergenceHistory(i3,1)=v(1);
 convergenceHistory(i3,2)=abs(v(6));
 if(i3>=20)
  disp(sprintf("\n%s ","failed"));
  break;
 else;
 end;
 v(25)=(v(25)*v(33)+(-1e0+v(25))*v(34))/v(14);
 v(1)=v(1)-v(6)/v(14);
 if(abs(v(6))<0.1e-7)
  disp(sprintf("\n%s ","converged"));
  v(18)=0;
  v(18)=(v(18)*v(33)+(-1e0+v(18))*v(34))/v(14);
  disp(sprintf("\n%s %f ","du/dparameter_in =",v(18)));
  break;
 else;
 end;
end;
disp(sprintf("\n%s %f ","du/dparameter_out=",v(25)));
convergedValue=v(1);


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