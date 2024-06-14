%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           24 Apr 24 17:47:55 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-SMSIf
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 26      Method: Automatic
% Subroutine                      : IfConditions size: 145
% Total size of Mathematica  code : 145 subexpressions
% Total size of Matlab code      : 688 bytes 

%*********************** F U N C T I O N **************************
function[y1Output,Dy1DxOutput,y2Output,Dy2DxOutput,y3Output,Dy3DxOutput]=IfConditions(xInput);
persistent v;
if size(v)<146
  v=zeros(146,'double');
end;
v(1)=xInput;
v(13)=2e0*v(1);
v(5)=(v(1)*v(1));
b2=v(1)>=0;
if(b2)
 v(14)=-(1/Power(v(1),2))+v(13)+cos(v(1));
 v(7)=25e0+1/v(1)+v(5)+sin(v(1));
 v(15)=v(14);
 v(4)=v(7);
else;
 v(15)=v(13);
 v(4)=v(5);
end;
if(b2)
 v(18)=v(14);
 v(8)=v(7);
else;
 v(18)=v(13);
 v(8)=v(5);
end;
v(21)=0;
v(9)=0;
if(b2)
 v(21)=v(14);
 v(9)=v(7);
else;
 v(21)=v(13);
 v(9)=v(5);
end;
y1Output=v(4);
Dy1DxOutput=v(15);
y2Output=v(8);
Dy2DxOutput=v(18);
y3Output=v(9);
Dy3DxOutput=v(21);


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