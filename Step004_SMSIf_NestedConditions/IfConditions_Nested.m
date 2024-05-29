%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           29 May 24 16:47:19 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-SMSIf_Nested
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 47      Method: Automatic
% Subroutine                      : IfConditions_Nested size: 287
% Total size of Mathematica  code : 287 subexpressions
% Total size of Matlab code      : 1297 bytes 

%*********************** F U N C T I O N **************************
function[y1Output,Dy1DxOutput,y2Output,Dy2DxOutput,y3Output,Dy3DxOutput,y4Output,Dy4DxOutput]=IfConditions_Nested(xInput);
persistent v;
if size(v)<189
  v=zeros(189,'double');
end;
v(1)=xInput;
b5=v(1)<-10e0;
b2=v(1)>=0;
if(b2)
 v(27)=-(1/Power(v(1),2))+2e0*v(1)+cos(v(1));
 v(9)=25e0+1/v(1)+(v(1)*v(1))+sin(v(1));
 v(28)=v(27);
 v(4)=v(9);
else;
 if(b5)
  v(42)=sqrt(-v(1));
  v(29)=-9e0-1/(2e0*v(42))+cos(v(1));
  v(12)=-9e0*v(1)+v(42)+sin(v(1));
  v(30)=v(29);
  v(7)=v(12);
 else;
  v(31)=2e0*v(1);
  v(13)=(v(1)*v(1));
  v(30)=v(31);
  v(7)=v(13);
 end;
 v(28)=v(30);
 v(4)=v(7);
end;
if(b2)
 v(34)=v(27);
 v(10)=v(9);
else;
 if(b5)
  v(34)=v(29);
  v(10)=v(12);
 else;
  v(34)=v(31);
  v(10)=v(13);
 end;
end;
v(37)=0;
v(14)=0;
if(b2)
 v(37)=v(27);
 v(14)=v(9);
else;
 if(b5)
  v(37)=v(29);
  v(14)=v(12);
 else;
  v(37)=v(31);
  v(14)=v(13);
 end;
end;
if(b2)
 v(40)=v(27);
 v(22)=v(9);
else;
end;
if(b5)
 v(43)=sqrt(-v(1));
 v(40)=-9e0-1/(2e0*v(43))+cos(v(1));
 v(22)=-9e0*v(1)+v(43)+sin(v(1));
else;
end;
if(v(1)<0 && v(1)>=-10e0)
 v(40)=2e0*v(1);
 v(22)=(v(1)*v(1));
else;
end;
y1Output=v(4);
Dy1DxOutput=v(28);
y2Output=v(10);
Dy2DxOutput=v(34);
y3Output=v(14);
Dy3DxOutput=v(37);
y4Output=v(22);
Dy4DxOutput=v(40);


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