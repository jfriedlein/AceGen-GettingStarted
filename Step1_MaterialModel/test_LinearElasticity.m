% Testing the LinearElasticity function with an input deformation gradient
% and exemplary material parameters

clear,clc

deformationGradient = [ 1.5 0 0;
                        0   1 0;
                        0   0 1 ];
listOfMaterialParameters = [ 833.333333333334, 384.615384615385 ];

[CauchyStressVEC,Tangent]=LinearElasticity(deformationGradient,listOfMaterialParameters);
