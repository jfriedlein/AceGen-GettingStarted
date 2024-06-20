clear,clc;

% deformationGradient = eye(3);
% deformationGradient(1,1) = 1.1;

for i=1:10
    deformationGradient = 10*rand(3);
    if ( det(deformationGradient)>0 )
        break;
    end
    if ( i>=10 )
        error('Failed to find random admissible deformation gradient')
    end
end

E = 2.10E+05;
nu = 0.3;
lambda = 121153.846153846;
mu = 80769.2307692308;
kappa = 175000;


listOfMaterialParameters = [kappa, mu];

[CauchyStressVEC,Tangent] = HyperElasticity_PF(deformationGradient,listOfMaterialParameters);