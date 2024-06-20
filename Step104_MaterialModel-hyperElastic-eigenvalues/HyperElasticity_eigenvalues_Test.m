clear,clc;

%% Build a deformation gradient
% Either well defined:
% deformationGradient = eye(3);
% deformationGradient(1,1) = 1.1;

% Or as a random but admissible matrix:
for i=1:10
    deformationGradient = rand(3);
    if ( det(deformationGradient)>0 )
        break;
    end
    if ( i>=10 )
        error('Failed to find random admissible deformation gradient')
    end
end

%% Material parameters
% Number of Ogden parts (max 5)
 Np = 1;
% shear modulus 1
 shearMod_mu1 = 80769;
% Ogden exponent alpha 1
 alpha1 = 2;
listOfMaterialParameters = [Np, alpha1, shearMod_mu1, 0, 0, 0, 0, 0, 0, 0, 0 ];

% Example for two Ogden parts
%listOfMaterialParameters = [2, alpha1, alpha2, shearMod_mu1, shearMod_mu2, 0, 0, 0, 0, 0, 0 ];

%% Call AceGen-generated function to compute Cauchy stress and Lagrangian elasticity tangent
[CauchyStress,Tangent] = HyperElasticity_eigenvalues(deformationGradient,listOfMaterialParameters);