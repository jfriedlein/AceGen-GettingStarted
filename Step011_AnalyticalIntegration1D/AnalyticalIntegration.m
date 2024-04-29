%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           19 Apr 24 17:12:46 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-AnalyticalIntegration
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 6       Method: Automatic
% Subroutine                      : AnalyticalIntegration size: 75
% Total size of Mathematica  code : 75 subexpressions
% Total size of Matlab code      : 520 bytes 

%*********************** F U N C T I O N **************************
function[yOutput,fydxOutput]=AnalyticalIntegration(xInput);
persistent v;
if size(v)<117
  v=zeros(117,'double');
end;
v(1)=xInput;
yOutput=25e0+1/v(1)+(v(1)*v(1))+sin(v(1));
v(3)=(82e0/3e0)+cos(1e0)-cos(2e0)+log(2e0);
fydxOutput=v(3);
disp(sprintf("\n%s %f ","AnalyticalIntegration<< y=",25e0+1/v(1)+(v(1)*v(1))+sin(v(1))));
disp(sprintf("\n%s %f ","AnalyticalIntegration<< error in integration=",(-82e0/3e0)+v(3)-cos(1e0) ...
 +cos(2e0)-log(2e0)));


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