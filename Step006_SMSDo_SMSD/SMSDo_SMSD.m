%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           29 May 24 15:24:05 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-SMSDo_SMSD
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 17      Method: Automatic
% Subroutine                      : SMSDo_SMSD size: 181
% Total size of Mathematica  code : 181 subexpressions
% Total size of Matlab code      : 940 bytes 

%*********************** F U N C T I O N **************************
function[convergedValue,convergenceHistory]=SMSDo_SMSD(displacement,parameter);
persistent v;
if size(v)<148
  v=zeros(148,'double');
end;
v(20)=0;
v(1)=displacement;
for i3=1:1:20;
 v(5)=-parameter+v(1);
 v(23)=(v(5)*v(5));
 v(18)=2e0+600e0*v(23);
 v(6)=-5e0+2e0*v(1)+200e0*Power(v(5),3);
 disp(sprintf("\n%s %f %s %f %s %f %s %f ","iteration i_NR=",i3,": W=",100e0-5e0*v(1)+(v(1)*v(1)) ...
  +50e0*Power(v(5),4),"; R=",v(6),"; SMSAbs[R]=",abs(v(6))));
 convergenceHistory(i3,1)=v(1);
 convergenceHistory(i3,2)=abs(v(6));
 if(abs(v(6))<0.1e-7)
  disp(sprintf("\n%s ","converged"));
  break;
 else;
 end;
 if(i3>=20)
  disp(sprintf("\n%s ","failed"));
  break;
 else;
 end;
 v(20)=(1e0-2e0/v(18))*v(20)-(600e0*(-1e0+v(20))*(v(18)*v(23)-2e0*v(5)*v(6)))/Power(v(18),2);
 v(1)=v(1)-v(6)/v(18);
end;
convergedValue=v(1);
disp(sprintf("\n%s %f ","du/dparameter_out=",v(20)));


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