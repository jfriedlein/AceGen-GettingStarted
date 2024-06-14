%**************************************************************
%* AceGen    7.505 Linux (16 Aug 22)                          *
%*           Co. J. Korelc  2020           14 Jun 24 13:00:28 *
%**************************************************************
% User     : Full professional version
% Notebook : AceGen-SMSDo
% Evaluation time                 : 1 s     Mode  : Optimal
% Number of formulae              : 4       Method: Automatic
% Subroutine                      : SMSDo_Basics size: 26
% Total size of Mathematica  code : 26 subexpressions
% Total size of Matlab code      : 233 bytes 

%*********************** F U N C T I O N **************************
function[x,f,n]=SMSDo_Basics(x,f,n);
persistent v;
if size(v)<137
  v=zeros(137,'double');
end;
i2=n;
v(5)=1e0;
for i6=1:1:i2;
 v(5)=v(5)+Power(x,i6);
end;
f=v(5);


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