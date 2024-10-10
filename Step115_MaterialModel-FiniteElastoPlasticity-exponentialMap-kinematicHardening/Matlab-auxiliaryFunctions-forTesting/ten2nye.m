% Ten 2 Nye
function [A_voigt] = ten2nye(A,fact)
A_voigt = [A(1,1);A(2,2);A(3,3);fact*A(1,2);fact*A(1,3);fact*A(2,3)];
end

