clear all;
% close all;
clc;

disp("Starting ...")

% material parameters
 cm = zeros(100,1);
 cm(9) = 1.625e5; % bulk modulus
 cm(10) = 7.5e4; % shear modulus

 cm(18) = 180; % initial yield stress
 cm(19) = 0;
 cm(20) = 0;
 cm(21) = 0;
 cm(22) = 1;
 cm(23) = 1;

 cm(25) = 1; % DVOL
 cm(26) = 1; % DDEV
 cm(27) = 1; % DPLA

 cm(28) = 0; % DP!
 cm(29) = 0; % DP!
 cm(30) = 2; % DEXPO

% history variables
 hsvn = zeros(9,1);

% deformation gradient
 F = eye(3);

load_max = 10;
n_steps = 100;

load_steps = linspace(0,load_max,n_steps);

CauchyStress_list = zeros(7,n_steps);

for i=1:n_steps
    F(1,1) = 1+load_steps(i);

    [PK2,Cauchy,hsvn1,tangent]=multiPD(F,cm,hsvn);
    Cauchy_vonMises = compute_vonMisesStress( Cauchy );
    CauchyStress_list(1:6,i) = Cauchy;
    CauchyCauchyStress_list_list(7,i) = Cauchy_vonMises;

    hsvn = hsvn1;
end


plot( load_steps, CauchyStress_list(2,:)/cm(18) )
hold on

disp("... finished.")

function vonMisesStress = compute_vonMisesStress( stress_vector )
 stress_tensor(1,1) = stress_vector(1);
 stress_tensor(2,2) = stress_vector(2);
 stress_tensor(3,3) = stress_vector(3);
 stress_tensor(1,2) = stress_vector(4);
 stress_tensor(2,3) = stress_vector(5);
 stress_tensor(3,1) = stress_vector(6);
 stress_tensor(2,1) = stress_tensor(1,2);
 stress_tensor(3,2) = stress_tensor(2,3);
 stress_tensor(1,3) = stress_tensor(3,1);

 vonMisesStress = sqrt(3/2)*norm(stress_tensor-1/3*trace(stress_tensor)*eye(3),"fro");
end

