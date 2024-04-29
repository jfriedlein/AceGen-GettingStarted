%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           24 Apr 24 18:11:34 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-SMSIf_Nested
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 40      Method: Automatic
% Subroutine                      : IfConditions_Nested size: 220
% Total size of Mathematica  code : 220 subexpressions
% Total size of Matlab code      : 1032 bytes 

%*********************** F U N C T I O N **************************
function[y1Output,Dy1DxOutput,y2Output,Dy2DxOutput,y3Output,Dy3DxOutput]=IfConditions_Nested(xInput);
persistent v;
if size(v)<175
  v=zeros(175,'double');
end;
v(1)=xInput;
v(23)=cos(v(1));
v(5)=sin(v(1));
b3=v(1)>=0;
if(b3)
 v(26)=-(1/Power(v(1),2))+2e0*v(1)+v(23);
 v(11)=25e0+1/v(1)+(v(1)*v(1))+v(5);
 v(27)=v(26);
 v(6)=v(11);
else;
 b7=v(1)<-10e0;
 if(b7)
  v(39)=sqrt(v(1));
  v(28)=-9e0+v(23)+1/(2e0*v(39));
  v(14)=-9e0*v(1)+v(39)+v(5);
  v(29)=v(28);
  v(9)=v(14);
 else;
  v(30)=2e0*v(1);
  v(15)=(v(1)*v(1));
  v(29)=v(30);
  v(9)=v(15);
 end;
 v(27)=v(29);
 v(6)=v(9);
end;
if(b3)
 v(34)=v(26);
 v(12)=v(11);
else;
 if(b7)
  v(34)=v(28);
  v(12)=v(14);
 else;
  v(34)=v(30);
  v(12)=v(15);
 end;
end;
v(37)=0;
v(16)=0;
if(b3)
 v(37)=v(26);
 v(16)=v(11);
else;
 if(b7)
  v(37)=v(28);
  v(16)=v(14);
 else;
  v(37)=v(30);
  v(16)=v(15);
 end;
end;
y1Output=v(6);
Dy1DxOutput=v(27);
y2Output=v(12);
Dy2DxOutput=v(34);
y3Output=v(16);
Dy3DxOutput=v(37);


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