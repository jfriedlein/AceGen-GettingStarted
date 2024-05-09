%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           9 May 24 16:06:59  *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-SetDelayed
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 5       Method: Automatic
% Subroutine                      : SetDelayed size: 44
% Total size of Mathematica  code : 44 subexpressions
% Total size of Matlab code      : 361 bytes 

%*********************** F U N C T I O N **************************
function[yOutput,DyDxOutput]=SetDelayed(xInput);
persistent v;
if size(v)<116
  v=zeros(116,'double');
end;
v(1)=xInput;
v(2)=30e0+1/v(1)-9e0*v(1)+2e0*(v(1)*v(1))+sin(v(1));
disp(sprintf("\n%s %f ","ya=",v(2)));
disp(sprintf("\n%s %f ","yb=",v(2)));
disp(sprintf("\n%s %f ","yc=",1e0+v(2)));


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