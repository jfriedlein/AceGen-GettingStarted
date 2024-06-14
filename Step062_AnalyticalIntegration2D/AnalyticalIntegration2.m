%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           26 Apr 24 15:31:30 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-AnalyticalIntegration2
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 5       Method: Automatic
% Subroutine                      : AnalyticalIntegration2 size: 50
% Total size of Mathematica  code : 50 subexpressions
% Total size of Matlab code      : 474 bytes 

%*********************** F U N C T I O N **************************
function[yOutput,fydxOutput]=AnalyticalIntegration2(xInput);
persistent v;
if size(v)<118
  v=zeros(118,'double');
end;
yOutput=27e0+sin(1e0);
v(4)=(581e0/12e0)+cos(1e0)-cos(2e0)+log(2e0);
fydxOutput=v(4);
disp(sprintf("\n%s %f ","AnalyticalIntegration2<< y=",27e0+sin(1e0)));
disp(sprintf("\n%s %f ","AnalyticalIntegration2<< error in integration=",(-581e0/12e0)+v(4)-cos(1e0 ...
 )+cos(2e0)-log(2e0)));


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