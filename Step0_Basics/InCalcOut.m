%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           19 Apr 24 17:10:08 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-InCalcOut
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 6       Method: Automatic
% Subroutine                      : InCalcOut size: 59
% Total size of Mathematica  code : 59 subexpressions
% Total size of Matlab code      : 406 bytes 

%*********************** F U N C T I O N **************************
function[yOutput,DyDxOutput]=InCalcOut(xInput);
persistent v;
if size(v)<117
  v=zeros(117,'double');
end;
v(1)=xInput;
v(2)=25e0+1/v(1)+(v(1)*v(1))+sin(v(1));
yOutput=v(2);
DyDxOutput=-(1/Power(v(1),2))+2e0*v(1)+cos(v(1));
disp(sprintf("\n%s %f ","InCalcOut<< y=",v(2)));
disp(sprintf("\n%s %f ","InCalcOut<< error in derivative=",0));


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