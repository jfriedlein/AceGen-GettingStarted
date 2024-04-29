(* ::Package:: *)

BeginPackage["AceTensorFunctions`"];
Needs["AceGen`"];


devten::usage="Deviator of 2D";


ten2vec::usage="tensor2 to LS-Dyna Voigt vector";


vec2ten::usage="LS-Dyna Voigt vector to tensor2";


normL2::usage="L2-norm of a second order tensor";


Begin["`Private`"];


devten[A_] := A - Tr[A]/3 IdentityMatrix[3];


normL2[A_] := SMSSqrt[Tr[A . A]];


ten2vec[mat_,fact_] :={mat[[1,1]],mat[[2,2]],mat[[3,3]],fact mat[[1,2]],fact mat[[2,3]],fact mat[[3,1]]};


vec2ten[vec_, fact_] := {{vec[[1]],vec[[4]]/fact,vec[[6]]/fact},{vec[[4]]/fact,vec[[2]],vec[[5]]/fact},{vec[[6]]/fact,vec[[5]]/fact,vec[[3]]}};


End[];


EndPackage[];
