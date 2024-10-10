(* ::Package:: *)

BeginPackage["AceTensorFunctions`"];
Needs["AceGen`"];


devten::usage="Deviator of 2D";


devTenM::usage="Deviator of second order tensor in material configuration";


ten2nye::usage="Nye to 2D";


ten2vec::usage="tensor2 to LS-Dyna Voigt vector";


nye2ten::usage="Nye of 2D";


vec2ten::usage="LS-Dyna Voigt vector to tensor2";


transform6to4D::usage="Nye to 4D with minor symmetries";


transformLSD6to4D::usage="LSD Voigt 6x6 to 4D with minor symmetries";


transform9to4D::usage="Full matrix to 4D";


transform4Dto6::usage="Nye notation of 4D";


transform4DtoMat::usage="LS-Dyna Voigt vector notation of 4D";


transform4Dto9::usage="Full matrix notation of 4D";


transformStiffnesstoLSDes::usage="Transform fourth order stiffness tensor to the LSD 6x6 matrix es";


tangentTransform\[LetterSpace]dSdF\[LetterSpace]to\[LetterSpace]dSdC::usage="Transform dSdF fourth order tensor to dSdC";


doubledotr::usage="double contraction 4D 2D";


doubledotl::usage="double contraction 2D 4D";


doubledot4::usage="double contraction 4D 4D";


doubledot2::usage="double contraction 2D 2D";


normL2::usage="L2-norm of a second order tensor";


Begin["`Private`"];


devten[A_] := A - Tr[A]/3 IdentityMatrix[3];


(* [Federico, "Volumetric\[Dash]Distortional Decomposition of Deformation andElasticity Tensor"] *)
devTenM[A_,RCG_] := ( A - 1/3 doubledot2[A,RCG] SMSInverse[RCG] );


normL2[A_] := SMSSqrt[Tr[A . A]];


ten2nye[mat_,fact_] :={mat[[1,1]],mat[[2,2]],mat[[3,3]],fact mat[[1,2]],fact mat[[1,3]],fact mat[[2,3]]};


ten2vec[mat_,fact_] :={mat[[1,1]],mat[[2,2]],mat[[3,3]],fact mat[[1,2]],fact mat[[2,3]],fact mat[[3,1]]};


nye2ten[vec_, fact_] := {{vec[[1]],vec[[4]]/fact,vec[[5]]/fact},{vec[[4]]/fact,vec[[2]],vec[[6]]/fact},{vec[[5]]/fact,vec[[6]]/fact,vec[[3]]}};


vec2ten[vec_, fact_] := {{vec[[1]],vec[[4]]/fact,vec[[6]]/fact},{vec[[4]]/fact,vec[[2]],vec[[5]]/fact},{vec[[6]]/fact,vec[[5]]/fact,vec[[3]]}};


transform6to4D[A_] := (A4=ConstantArray[0,{3,3,3,3}];
(*first row*)
	A4 [[ 1,1,1,1 ]] =A [[ 1,1 ]] ;
	A4 [[ 1,1,2,2 ]] =A [[ 1,2 ]] ;
	A4 [[ 1,1,3,3 ]] =A [[ 1,3 ]] ;
	A4 [[ 1,1,1,2 ]] =A [[ 1,4 ]] ;
	A4 [[ 1,1,1,3 ]] =A [[ 1,5 ]] ;
	A4 [[ 1,1,2,3 ]] =A [[ 1,6 ]] ;
(*second row*)
	A4 [[ 2,2,1,1 ]] =A [[ 2,1 ]] ;
	A4 [[ 2,2,2,2 ]] =A [[ 2,2 ]] ;
	A4 [[ 2,2,3,3 ]] =A [[ 2,3 ]] ;
	A4 [[ 2,2,1,2 ]] =A [[ 2,4 ]] ;
	A4 [[ 2,2,1,3 ]] =A [[ 2,5 ]] ;
	A4 [[ 2,2,2,3 ]] =A [[ 2,6 ]] ;
(*third row*)
	A4 [[ 3,3,1,1 ]] =A [[ 3,1 ]] ;
	A4 [[ 3,3,2,2 ]] =A [[ 3,2 ]] ;
	A4 [[ 3,3,3,3 ]] =A [[ 3,3 ]] ;
	A4 [[ 3,3,1,2 ]] =A [[ 3,4 ]] ;
	A4 [[ 3,3,1,3 ]] =A [[ 3,5 ]] ;
	A4 [[ 3,3,2,3 ]] =A [[ 3,6 ]] ;
(*fourth row*)
	A4 [[ 1,2,1,1 ]] =A [[ 4,1 ]] ;
	A4 [[ 1,2,2,2 ]] =A [[ 4,2 ]] ;
	A4 [[ 1,2,3,3 ]] =A [[ 4,3 ]] ;
	A4 [[ 1,2,1,2 ]] =A [[ 4,4 ]] ;
	A4 [[ 1,2,1,3 ]] =A [[ 4,5 ]] ;
	A4 [[ 1,2,2,3 ]] =A [[ 4,6 ]] ;
(*fifth row*)
	A4 [[ 1,3,1,1 ]] =A [[ 5,1 ]] ;
	A4 [[ 1,3,2,2 ]] =A [[ 5,2 ]] ;
	A4 [[ 1,3,3,3 ]] =A [[ 5,3 ]] ;
	A4 [[ 1,3,1,2 ]] =A [[ 5,4 ]] ;
	A4 [[ 1,3,1,3 ]] =A [[ 5,5 ]] ;
	A4 [[ 1,3,2,3 ]] =A [[ 5,6 ]] ;
(*six row*)
	A4 [[ 2,3,1,1 ]] =A [[ 6,1 ]] ;
	A4 [[ 2,3,2,2 ]] =A [[ 6,2 ]] ;
	A4 [[ 2,3,3,3 ]] =A [[ 6,3 ]] ;
	A4 [[ 2,3,1,2 ]] =A [[ 6,4 ]] ;
	A4 [[ 2,3,1,3 ]] =A [[ 6,5 ]] ;
	A4 [[ 2,3,2,3 ]] =A [[ 6,6 ]] ;
(*Exploit minor symmetries*)
Do[{
Do[{
Do[{
Do[{
A4[[ b,a,c,d]]   =A4 [[ a,b,c,d]] ;
A4[[ a,b,d,c]]   =A4 [[ a,b,c,d]] ;
},{d,3}]
},{c,3}]
},{b,3}]
},{a,3}];
A4);


transformLSD6to4D[A_] := (A4=ConstantArray[0,{3,3,3,3}];
(*first row*)
	A4 [[ 1,1,1,1 ]] =A [[ 1,1 ]] ;
	A4 [[ 1,1,2,2 ]] =A [[ 1,2 ]] ;
	A4 [[ 1,1,3,3 ]] =A [[ 1,3 ]] ;
	A4 [[ 1,1,1,2 ]] =A [[ 1,4 ]] ;
	A4 [[ 1,1,1,3 ]] =A [[ 1,5 ]] ;
	A4 [[ 1,1,2,3 ]] =A [[ 1,5 ]] ;
(*second row*)
	A4 [[ 2,2,1,1 ]] =A [[ 2,1 ]] ;
	A4 [[ 2,2,2,2 ]] =A [[ 2,2 ]] ;
	A4 [[ 2,2,3,3 ]] =A [[ 2,3 ]] ;
	A4 [[ 2,2,1,2 ]] =A [[ 2,4 ]] ;
	A4 [[ 2,2,1,3 ]] =A [[ 2,6 ]] ;
	A4 [[ 2,2,2,3 ]] =A [[ 2,5 ]] ;
(*third row*)
	A4 [[ 3,3,1,1 ]] =A [[ 3,1 ]] ;
	A4 [[ 3,3,2,2 ]] =A [[ 3,2 ]] ;
	A4 [[ 3,3,3,3 ]] =A [[ 3,3 ]] ;
	A4 [[ 3,3,1,2 ]] =A [[ 3,4 ]] ;
	A4 [[ 3,3,1,3 ]] =A [[ 3,6 ]] ;
	A4 [[ 3,3,2,3 ]] =A [[ 3,5 ]] ;
(*fourth row*)
	A4 [[ 1,2,1,1 ]] =A [[ 4,1 ]] ;
	A4 [[ 1,2,2,2 ]] =A [[ 4,2 ]] ;
	A4 [[ 1,2,3,3 ]] =A [[ 4,3 ]] ;
	A4 [[ 1,2,1,2 ]] =A [[ 4,4 ]] ;
	A4 [[ 1,2,1,3 ]] =A [[ 4,6 ]] ;
	A4 [[ 1,2,2,3 ]] =A [[ 4,5 ]] ;
(*fifth row*)
	A4 [[ 1,3,1,1 ]] =A [[ 6,1 ]] ;
	A4 [[ 1,3,2,2 ]] =A [[ 6,2 ]] ;
	A4 [[ 1,3,3,3 ]] =A [[ 6,3 ]] ;
	A4 [[ 1,3,1,2 ]] =A [[ 6,4 ]] ;
	A4 [[ 1,3,1,3 ]] =A [[ 6,6 ]] ;
	A4 [[ 1,3,2,3 ]] =A [[ 6,5 ]] ;
(*six row*)
	A4 [[ 2,3,1,1 ]] =A [[ 5,1 ]] ;
	A4 [[ 2,3,2,2 ]] =A [[ 5,2 ]] ;
	A4 [[ 2,3,3,3 ]] =A [[ 5,3 ]] ;
	A4 [[ 2,3,1,2 ]] =A [[ 5,4 ]] ;
	A4 [[ 2,3,1,3 ]] =A [[ 5,6 ]] ;
	A4 [[ 2,3,2,3 ]] =A [[ 5,5 ]] ;
(*Exploit minor symmetries*)
Do[{
Do[{
Do[{
Do[{
A4[[ b,a,c,d]]   =A4 [[ a,b,c,d]] ;
A4[[ a,b,d,c]]   =A4 [[ a,b,c,d]] ;
},{d,3}]
},{c,3}]
},{b,3}]
},{a,3}];
A4);


transform9to4D[A_] := (A4=ConstantArray[0,{3,3,3,3}];
(*first row*)
	A4 [[ 1,1,1,1 ]] =A [[ 1,1 ]] ;
	A4 [[ 1,1,2,2 ]] =A [[ 1,2 ]] ;
	A4 [[ 1,1,3,3 ]] =A [[ 1,3 ]] ;
	A4 [[ 1,1,1,2 ]] =A [[ 1,4 ]] ;
	A4 [[ 1,1,2,3 ]] =A [[ 1,5 ]] ;
	A4 [[ 1,1,3,1 ]] =A [[ 1,6 ]] ;
	A4 [[ 1,1,1,3 ]] =A [[ 1,7 ]] ;
	A4 [[ 1,1,2,1 ]] =A [[ 1,8 ]] ;
	A4 [[ 1,1,3,2 ]] =A [[ 1,9 ]] ;
(*second row*)
	A4 [[ 2,2,1,1 ]] =A [[ 2,1 ]] ;
	A4 [[ 2,2,2,2 ]] =A [[ 2,2 ]] ;
	A4 [[ 2,2,3,3 ]] =A [[ 2,3 ]] ;
	A4 [[ 2,2,1,2 ]] =A [[ 2,4 ]] ;
	A4 [[ 2,2,2,3 ]] =A [[ 2,5 ]] ;
	A4 [[ 2,2,3,1 ]] =A [[ 2,6 ]] ;
	A4 [[ 2,2,1,3 ]] =A [[ 2,7 ]] ;
	A4 [[ 2,2,2,1 ]] =A [[ 2,8 ]] ;
	A4 [[ 2,2,3,2 ]] =A [[ 2,9 ]] ;
(*third row*)
	A4 [[ 3,3,1,1 ]] =A [[ 3,1 ]] ;
	A4 [[ 3,3,2,2 ]] =A [[ 3,2 ]] ;
	A4 [[ 3,3,3,3 ]] =A [[ 3,3 ]] ;
	A4 [[ 3,3,1,2 ]] =A [[ 3,4 ]] ;
	A4 [[ 3,3,2,3 ]] =A [[ 3,5 ]] ;
	A4 [[ 3,3,3,1 ]] =A [[ 3,6 ]] ;
	A4 [[ 3,3,1,3 ]] =A [[ 3,7 ]] ;
	A4 [[ 3,3,2,1 ]] =A [[ 3,8 ]] ;
	A4 [[ 3,3,3,2 ]] =A [[ 3,9 ]] ;
(*fourth row*)
	A4 [[ 1,2,1,1 ]] =A [[ 4,1 ]] ;
	A4 [[ 1,2,2,2 ]] =A [[ 4,2 ]] ;
	A4 [[ 1,2,3,3 ]] =A [[ 4,3 ]] ;
	A4 [[ 1,2,1,2 ]] =A [[ 4,4 ]] ;
	A4 [[ 1,2,2,3 ]] =A [[ 4,5 ]] ;
	A4 [[ 1,2,3,1 ]] =A [[ 4,6 ]] ;
	A4 [[ 1,2,1,3 ]] =A [[ 4,7 ]] ;
	A4 [[ 1,2,2,1 ]] =A [[ 4,8 ]] ;
	A4 [[ 1,2,3,2 ]] =A [[ 4,9 ]] ;
(*fifth row*)
	A4 [[ 2,3,1,1 ]] =A [[ 5,1 ]] ;
	A4 [[ 2,3,2,2 ]] =A [[ 5,2 ]] ;
	A4 [[ 2,3,3,3 ]] =A [[ 5,3 ]] ;
	A4 [[ 2,3,1,2 ]] =A [[ 5,4 ]] ;
	A4 [[ 2,3,2,3 ]] =A [[ 5,5 ]] ;
	A4 [[ 2,3,3,1 ]] =A [[ 5,6 ]] ;
	A4 [[ 2,3,1,3 ]] =A [[ 5,7 ]] ;
	A4 [[ 2,3,2,1 ]] =A [[ 5,8 ]] ;
	A4 [[ 2,3,3,2 ]] =A [[ 5,9 ]] ;
(*six row*)
	A4 [[ 3,1,1,1 ]] =A [[ 6,1 ]] ;
	A4 [[ 3,1,2,2 ]] =A [[ 6,2]] ;
	A4 [[ 3,1,3,3 ]] =A [[ 6,3 ]] ;
	A4 [[ 3,1,1,2 ]] =A [[ 6,4 ]] ;
	A4 [[ 3,1,2,3 ]] =A [[ 6,5 ]] ;
	A4 [[ 3,1,3,1 ]] =A [[ 6,6 ]] ;
	A4 [[ 3,1,1,3 ]] =A [[ 6,7 ]] ;
	A4 [[ 3,1,2,1 ]] =A [[ 6,8 ]] ;
	A4 [[ 3,1,3,2 ]] =A [[ 6,9 ]] ;
(*seven row*)
	A4 [[ 1,3,1,1 ]] =A [[ 7,1 ]] ;
	A4 [[ 1,3,2,2 ]] =A [[ 7,2]] ;
	A4 [[ 1,3,3,3 ]] =A [[ 7,3 ]] ;
	A4 [[ 1,3,1,2 ]] =A [[ 7,4 ]] ;
	A4 [[ 1,3,2,3 ]] =A [[ 7,5 ]] ;
	A4 [[ 1,3,3,1 ]] =A [[ 7,6 ]] ;
	A4 [[ 1,3,1,3 ]] =A [[ 7,7 ]] ;
	A4 [[ 1,3,2,1 ]] =A [[ 7,8 ]] ;
	A4 [[ 1,3,3,2 ]] =A [[ 7,9 ]] ;
(*eight row*)
	A4 [[ 2,1,1,1 ]] =A [[ 8,1 ]] ;
	A4 [[ 2,1,2,2 ]] =A [[ 8,2]] ;
	A4 [[ 2,1,3,3 ]] =A [[ 8,3 ]] ;
	A4 [[ 2,1,1,2 ]] =A [[ 8,4 ]] ;
	A4 [[ 2,1,2,3 ]] =A [[ 8,5 ]] ;
	A4 [[ 2,1,3,1 ]] =A [[ 8,6 ]] ;
	A4 [[ 2,1,1,3 ]] =A [[ 8,7 ]] ;
	A4 [[ 2,1,2,1 ]] =A [[ 8,8 ]] ;
	A4 [[ 2,1,3,2 ]] =A [[ 8,9 ]] ;
(*nine row*)
	A4 [[ 3,2,1,1 ]] =A [[ 9,1 ]] ;
	A4 [[ 3,2,2,2 ]] =A [[ 9,2]] ;
	A4 [[ 3,2,3,3 ]] =A [[ 9,3 ]] ;
	A4 [[ 3,2,1,2 ]] =A [[ 9,4 ]] ;
	A4 [[ 3,2,2,3 ]] =A [[ 9,5 ]] ;
	A4 [[ 3,2,3,1 ]] =A [[ 9,6 ]] ;
	A4 [[ 3,2,1,3 ]] =A [[ 9,7 ]] ;
	A4 [[ 3,2,2,1 ]] =A [[ 9,8 ]] ;
	A4 [[ 3,2,3,2 ]] =A [[ 9,9 ]] ;
A4);


transform4Dto6[A_] := {{A [[ 1,1,1,1 ]] ,A [[ 1,1,2,2 ]] ,A [[ 1,1,3,3 ]] ,A [[ 1,1,1,2 ]] ,A [[ 1,1,1,3 ]] ,A [[ 1,1,2,3 ]]},
{A [[ 2,2,1,1 ]] ,A [[ 2,2,2,2 ]] ,A [[ 2,2,3,3 ]] ,A [[ 2,2,1,2 ]] ,A [[ 2,2,1,3 ]] ,A [[ 2,2,2,3 ]]},
{A [[ 3,3,1,1 ]] ,A [[ 3,3,2,2 ]] ,A [[ 3,3,3,3 ]] ,A [[ 3,3,1,2 ]] ,A [[ 3,3,1,3 ]] ,A [[ 3,3,2,3 ]]},
{A [[ 1,2,1,1 ]] ,A [[ 1,2,2,2 ]] ,A [[ 1,2,3,3 ]] ,A [[ 1,2,1,2 ]] ,A [[ 1,2,1,3 ]] ,A [[ 1,2,2,3 ]]},
{A [[ 1,3,1,1 ]] ,A [[ 1,3,2,2 ]] ,A [[ 1,3,3,3 ]] ,A [[ 1,3,1,2 ]] ,A [[ 1,3,1,3 ]] ,A [[ 1,3,2,3 ]]},
{A [[ 2,3,1,1 ]] ,A [[ 2,3,2,2 ]] ,A [[ 2,3,3,3 ]] ,A [[ 2,3,1,2 ]] ,A [[ 2,3,1,3 ]] ,A [[ 2,3,2,3 ]]}};


transform4DtoMat[A_] := {{A [[ 1,1,1,1 ]] ,A [[ 1,1,2,2 ]] ,A [[ 1,1,3,3 ]] ,A [[ 1,1,1,2 ]] ,A [[ 1,1,2,3 ]] ,A [[ 1,1,3,1 ]]},
{A [[ 2,2,1,1 ]] ,A [[ 2,2,2,2 ]] ,A [[ 2,2,3,3 ]] ,A [[ 2,2,1,2 ]] ,A [[ 2,2,2,3 ]] ,A [[ 2,2,3,1 ]]},
{A [[ 3,3,1,1 ]] ,A [[ 3,3,2,2 ]] ,A [[ 3,3,3,3 ]] ,A [[ 3,3,1,2 ]] ,A [[ 3,3,2,3 ]] ,A [[ 3,3,3,1 ]]},
{A [[ 1,2,1,1 ]] ,A [[ 1,2,2,2 ]] ,A [[ 1,2,3,3 ]] ,A [[ 1,2,1,2 ]] ,A [[ 1,2,2,3 ]] ,A [[ 1,2,3,1 ]]},
{A [[ 2,3,1,1 ]] ,A [[ 2,3,2,2 ]] ,A [[ 2,3,3,3 ]] ,A [[ 2,3,1,2 ]] ,A [[ 2,3,2,3 ]] ,A [[ 2,3,3,1 ]]},
{A [[ 3,1,1,1 ]] ,A [[ 3,1,2,2 ]] ,A [[ 3,1,3,3 ]] ,A [[ 3,1,1,2 ]] ,A [[ 3,1,2,3 ]] ,A [[ 3,1,3,1 ]]}};


transform4Dto9[A_] :={ {A [[ 1,1,1,1 ]] ,A [[ 1,1,2,2 ]] ,A [[ 1,1,3,3 ]] ,A [[ 1,1,1,2 ]] ,A [[ 1,1,2,3 ]] ,A [[ 1,1,3,1 ]] ,A [[ 1,1,1,3 ]] ,A [[ 1,1,2,1 ]] ,A [[ 1,1,3,2 ]]},
 {A [[ 2,2,1,1 ]] ,A [[ 2,2,2,2 ]] ,A [[ 2,2,3,3 ]] ,A [[ 2,2,1,2 ]] ,A [[ 2,2,2,3 ]] ,A [[ 2,2,3,1 ]] ,A [[ 2,2,1,3 ]] ,A [[ 2,2,2,1 ]] ,A [[ 2,2,3,2 ]]},
{A [[ 3,3,1,1 ]] ,A [[ 3,3,2,2 ]] ,A [[ 3,3,3,3 ]] ,A [[ 3,3,1,2 ]] ,A [[ 3,3,2,3 ]] ,A [[ 3,3,3,1 ]] ,A [[ 3,3,1,3 ]] ,A [[ 3,3,2,1 ]] ,A [[ 3,3,3,2 ]]},
{A [[ 1,2,1,1 ]] ,A [[ 1,2,2,2 ]] ,A [[ 1,2,3,3 ]] ,A [[ 1,2,1,2 ]] ,A [[ 1,2,2,3 ]] ,A [[ 1,2,3,1 ]] ,A [[ 1,2,1,3 ]] ,A [[ 1,2,2,1 ]] ,A [[ 1,2,3,2 ]]},
{A [[ 2,3,1,1 ]] ,A [[ 2,3,2,2 ]] ,A [[ 2,3,3,3 ]] ,A [[ 2,3,1,2 ]] ,A [[ 2,3,2,3 ]] ,A [[ 2,3,3,1 ]] ,A [[ 2,3,1,3 ]] ,A [[ 2,3,2,1 ]] ,A [[ 2,3,3,2 ]]},
{A [[ 3,1,1,1 ]] ,A [[ 3,1,2,2 ]] ,A [[ 3,1,3,3 ]] ,A [[ 3,1,1,2 ]] ,A [[ 3,1,2,3 ]] ,A [[ 3,1,3,1 ]] ,A [[ 3,1,1,3 ]] ,A [[ 3,1,2,1 ]] ,A [[ 3,1,3,2 ]]},
{A [[ 1,3,1,1 ]] ,A [[ 1,3,2,2 ]] ,A [[ 1,3,3,3 ]] ,A [[ 1,3,1,2 ]] ,A [[ 1,3,2,3 ]] ,A [[ 1,3,3,1 ]] ,A [[ 1,3,1,3 ]] ,A [[ 1,3,2,1 ]] ,A [[ 1,3,3,2 ]]},
{A [[ 2,1,1,1 ]] ,A [[ 2,1,2,2 ]] ,A [[ 2,1,3,3 ]] ,A [[ 2,1,1,2 ]] ,A [[ 2,1,2,3 ]] ,A [[ 2,1,3,1 ]] ,A [[ 2,1,1,3 ]] ,A [[ 2,1,2,1 ]] ,A [[ 2,1,3,2 ]]},
{A [[ 3,2,1,1 ]] ,A [[ 3,2,2,2 ]] ,A [[ 3,2,3,3 ]] ,A [[ 3,2,1,2 ]] ,A [[ 3,2,2,3 ]] ,A [[ 3,2,3,1 ]] ,A [[ 3,2,1,3 ]] ,A [[ 3,2,2,1 ]] ,A [[ 3,2,3,2 ]]} };


transformStiffnesstoLSDes[tangentOut_] := (es=ConstantArray[0,{6,6}];
(* Transforming the dsigmadb to the 6x6 matrix es *) 
scaleT\[LetterSpace]14=1/2;
scaleT\[LetterSpace]44=1;
(* Fill first three rows *)
es [[ 1,1 ]] =tangentOut [[ 1,1,1,1 ]] ;
es [[ 1,2 ]] =tangentOut [[ 1,1,2,2 ]] ;
es [[ 1,3 ]] =tangentOut [[ 1,1,3,3 ]] ;
es [[ 1,5 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,1,2,3 ]] ;
es [[ 1,6 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,1,1,3 ]] ;
es [[ 1,4 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,1,1,2 ]] ;

es [[ 2,1 ]] =tangentOut [[ 2,2,1,1 ]] ;
es [[ 2,2 ]] =tangentOut [[ 2,2,2,2 ]] ;
es [[ 2,3 ]] =tangentOut [[ 2,2,3,3 ]] ;
es [[ 2,5 ]] =scaleT\[LetterSpace]14*tangentOut [[ 2,2,2,3 ]] ;
es [[ 2,6 ]] =scaleT\[LetterSpace]14*tangentOut [[ 2,2,1,3 ]] ;
es [[ 2,4 ]] =scaleT\[LetterSpace]14*tangentOut [[ 2,2,1,2 ]] ;

es [[ 3,1 ]] =tangentOut [[ 3,3,1,1 ]] ;
es [[ 3,2 ]] =tangentOut [[ 3,3,2,2 ]] ;
es [[ 3,3 ]] =tangentOut [[ 3,3,3,3 ]] ;
es [[ 3,5 ]] =scaleT\[LetterSpace]14*tangentOut [[ 3,3,2,3 ]] ;
es [[ 3,6 ]] =scaleT\[LetterSpace]14*tangentOut [[ 3,3,1,3 ]] ;
es [[ 3,4 ]] =scaleT\[LetterSpace]14*tangentOut [[ 3,3,1,2 ]] ;

(*Fill fourth row*)
es [[ 4,1 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,2,1,1 ]] ;
es [[ 4,2 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,2,2,2 ]] ;
es [[ 4,3 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,2,3,3 ]] ;
es [[ 4,5 ]] =scaleT\[LetterSpace]44*tangentOut [[ 1,2,2,3 ]] ;
es [[ 4,6 ]] =scaleT\[LetterSpace]44*tangentOut [[ 1,2,1,3 ]] ;
es [[ 4,4 ]] =scaleT\[LetterSpace]44*tangentOut [[ 1,2,1,2 ]] ;

(* Fill fifth row*)
es [[ 5,1 ]] =scaleT\[LetterSpace]14*tangentOut [[ 2,3,1,1 ]] ;
es [[ 5,2 ]] =scaleT\[LetterSpace]14*tangentOut [[ 2,3,2,2 ]] ;
es [[ 5,3 ]] =scaleT\[LetterSpace]14*tangentOut [[ 2,3,3,3 ]] ;
es [[ 5,5 ]] =scaleT\[LetterSpace]44*tangentOut [[ 2,3,2,3 ]] ;
es [[ 5,6 ]] =scaleT\[LetterSpace]44*tangentOut [[ 2,3,1,3 ]] ;
es [[ 5,4 ]] =scaleT\[LetterSpace]44*tangentOut [[ 2,3,1,2 ]] ;

(* Fill sixth row*)
es [[ 6,1 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,3,1,1 ]] ;
es [[ 6,2 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,3,2,2 ]] ;
es [[ 6,3 ]] =scaleT\[LetterSpace]14*tangentOut [[ 1,3,3,3 ]] ;
es [[ 6,5 ]] =scaleT\[LetterSpace]44*tangentOut [[ 1,3,2,3 ]] ;
es [[ 6,6 ]] =scaleT\[LetterSpace]44*tangentOut [[ 1,3,1,3 ]] ;
es [[ 6,4 ]] =scaleT\[LetterSpace]44*tangentOut [[ 1,3,1,2 ]] ;
es);


tangentTransform\[LetterSpace]dSdF\[LetterSpace]to\[LetterSpace]dSdC[dSdF_,F_] := (
	F\[LetterSpace]inv \[DoubleRightTee] SMSInverse[F];
    dSdC \[DoubleRightTee] 1/2* Table[Sum[dSdF[[I,J,k,L]] * F\[LetterSpace]inv[[K,k]],{k,3}],{I,3},{J,3},{K,3},{L,3}];
    (* Enforce minor symmetries *) 
    (* @note The resulting fourth order tensor has no perfect/numerical major symmetry, enforcing this major symmetry would deteriorate the convergence *)
    Return[ transform6to4D[transform4Dto6[dSdC]] ];
);


doubledotr[B_,C_] := (A=ConstantArray[0,{3,3}];
Do[{
Do[{
Do[{
Do[{
A [[ i,j ]] = A [[ i,j ]] + B [[ i,j,k,l ]] C [[ k,l ]] 
},{l,3}]
},{k,3}]
},{j,3}]
},{i,3}];
A);


doubledotl[C_,B_] := (A=ConstantArray[0,{3,3}];
Do[{
Do[{
Do[{
Do[{
A [[ i,j ]] = A [[ i,j ]] + B [[ k,l,i,j ]] C [[ k,l ]] 
},{l,3}]
},{k,3}]
},{j,3}]
},{i,3}];
A);


doubledot4[B_,C_] := (A=ConstantArray[0,{3,3,3,3}];
Do[{
Do[{
Do[{
Do[{
Do[{
Do[{
A [[ i,j,k,l]]   =A [[ i,j,k,l]] +B [[ i,j,a,b ]] C [[ a,b,k,l ]] 
},{b,3}]
},{a,3}]
},{l,3}]
},{k,3}]
},{j,3}]
},{i,3}];
A);


doubledot2[B_,C_] := (A=0;
Do[{
Do[{
A = A +B [[ i,j ]] C [[ i,j ]] 
},{j,3}]
},{i,3}];
A);


End[];


EndPackage[];
