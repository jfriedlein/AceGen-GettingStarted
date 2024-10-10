clear all;
close all;
clc;

addpath("Matlab-auxiliaryFunctions-forTesting/")

%==========================================================================
% Based on:
% "Uniaxial tension test with isotropic damage" by Hagen Holthusen (holthusen@ifam.rwth-aachen.de)
%
% Combined stress/strain driven concept:
% we prescribe the strain component in loading direction and solve the
% remaining strain components by the condition that all stress except in
% loading direction have to be zero for an uniaxial tension test
%
%==========================================================================

%% Loading settings
strain_end  = 0.5;

% Choose either uniaxial tension/compression or simple shear
% Uniaxial tension/compression (two cycles)
flag        = 1;        % ( =1 Uniaxial tension / =0 Shearing )
t           = linspace(0,100,300); % Start_Time , End_Time , number of steps

% Simple shear
% flag        = 0;        % ( =1 Uniaxial tension / =0 Shearing )
% t           = linspace(0,100,300); % Start_Time , End_Time , number of steps

cyclic      = true;
n_max_iterations = 10;

%% Material parameters
disp("Initialising material parameters and history variables ...")

shearMod_mu = 80000;
lame_lambda = 119999 + 2/3;
yield_stress = 300;
c_KH = 1900;
b_KH = 17/2;
Q_IH = 400;
beta_IH = 5/2;

% Set up the list of material parameters (ordering as in "cm_associations" in AceGen-notebook)
cm=zeros(48,1);

% debugging output level (0: no output, 2: only if iterations fail, 3: some about for each call, 5: a lot)
cm(5) = 2; 

cm(10) = lame_lambda + 2/3*shearMod_mu;
cm(11) = shearMod_mu;
cm(18) = yield_stress;
cm(20) = Q_IH;
cm(21) = beta_IH;
cm(22) = 1;
cm(26) = c_KH;
cm(27) = b_KH;


%% Initial fields
% solution fields
F = zeros(3,3,length(t));
PK2 = zeros(3,3,length(t));
Cauchy = zeros(3,3,length(t));

nhsv=13;
h0  = zeros(nhsv,length(t));
h1  = zeros(nhsv,length(t));

disp("... finished initialising material parameters and history variables.")

%% Prepare loading
if ( cyclic )
    % Cyclic strain increase
    if flag % tension
        % @note The min-max values of the cylic loading were guessed from
        % the figures in Vladimirov et al 2008
        strain_ext = interp1( [t(1) 1/8*t(end) 3/8*t(end)  5/8*t(end)   7/8*t(end)  8/8*t(end) ], ...
                              [0    0.665 -0.23 0.665 -0.23 0] ...
                              ,t);
    else % shear
%         strain_ext = interp1( [t(1) 2/2*t(end)], ...
%                               [0    1.52] ...
%                               ,t);
        strain_ext = interp1( [t(1) 1/4*t(end) 3/4*t(end) 4/4*t(end)], ...
                              [0    1.52          -1.52          0        ] ...
                              ,t);
    end
else
    % Linear strain increase
    strain_ext = interp1([t(1) t(end)],[0 strain_end],t);
end

%% Stress/strain driven
% Define the strain for each (pseudo-) timestep
if flag
    F(1,1,:)  =   1+strain_ext;
    F(2,2,:) = 1;
    F(3,3,:) = 1;
    pvec        =   2:6;
else
    F(1,2,:)  = strain_ext;
    F(1,1,:) = 1;
    F(2,2,:) = 1;
    F(3,3,:) = 1;
    pvec        = [1 2 3 5 6];
end

%% Loop over all (pseudo-) timesteps
disp("Looping over time steps ...")
for n=1:length(t) - 1
    
    % Define the residual:
    % An uniaxial/shearing stress/strain state in each (pseudo-) timestep is
    % required
    r = @(stress) (ten2nye(stress,1) - ten2nye(zeros(3),1));
    
    % Initialise the solution vector
    if flag
        % Keep the old contraction to reduce the initial error
        F11 = F(1,1,n+1);
        F(:,:,n+1) = F(:,:,n);
        F(1,1,n+1) = F11;
        x = ten2nye(F(:,:,n+1),2);
    else
        x = ten2nye(F(:,:,n+1),2);
    end
        
    % Time interval
    dt = t(n+1) - t(n);
    
    % Global Newton-Raphson to solve the remaining strain components
    for m=1:n_max_iterations
        
        if flag==1
            F(1,1,n+1) = x(1);
        end

        F(2,2,n+1) = x(2);
        F(3,3,n+1) = x(3);

        % Calculate stress and tangent in each step
        [PK2_V,sig,h1(:,n+1),dPK2dF]=Pmulti_expM_HisokinAF(F(:,:,n+1),cm,h0(:,n));
        PK2(1,1,n+1) = PK2_V(1);
        PK2(2,2,n+1) = PK2_V(2);
        PK2(3,3,n+1) = PK2_V(3);
        PK2(1,2,n+1) = PK2_V(4);
        PK2(2,1,n+1) = PK2_V(4);
        clear PK2_V;
        Cauchy(1,1,n+1) = sig(1);
        Cauchy(2,2,n+1) = sig(2);
        Cauchy(3,3,n+1) = sig(3);
        Cauchy(1,2,n+1) = sig(4);
        Cauchy(2,1,n+1) = sig(4);
        clear sig;
        res = r(PK2(:,:,n+1));
        
        % check residual
        if ( norm(res(pvec)) <= 01e-08 || flag==0 )
            if flag
                F(1,1,n+1) = 1+strain_ext(n+1);
            else
                F(1,2,:) = strain_ext;
            end
            break
        elseif m>=n_max_iterations
            error('Global Newton Raphson does not converge!');
        end
        
        % Compute the increment for the strain
        % since the component x(1)=GLS(1,1) or x(4) = GLS(1,2)/GLS(2,1) is fixed 
        % for each step, solve the reduced system of equations
        x(pvec) = x(pvec) - dPK2dF(pvec,pvec) \ res(pvec);
    end
    % Restore the history variables
    h0(:,n+1) = h1(:,n+1);
end

disp("... finished looping over time steps.")

%% Post-process the results
lnV = zeros(3,3,length(t));

% Loop over all (pseudo-) timesteps
for n=1:length(t)
    [~, ~, V] = poldecomp(F(:,:,n));
    lnV(:,:,n) = logm(V);
    clear V;
end

%% Plot
if flag
    figure(1)
    hold on
    % Plot the results by Vladimirov et al. 2008
    if ( cyclic )
        axis([-0.3 0.6 -1000 1000])
        plot_image('Fig2a-sigma11_lnV11.png',[-0.3 0.6],[1000,-1000])
        plot([0 0],[0 0],'k')
        legendAppend("Vladimirov et al. 2008")
    end
    plot(squeeze(lnV(1,1,:)),squeeze(Cauchy(1,1,:)))
    legendAppend("Step120")
    xlabel('Logarithmic strain lnV_{11}')
    ylabel('Cauchy stress sigma_{11}')
else
    figure(1)
    hold on
    % Plot the results by Vladimirov et al. 2008
    if ( cyclic )
        axis([-0.3 0.6 -1000 1000])
        plot_image('Fig2b-sigma12_lnV12.png',[-0.6 0.6],[600,-600])
        plot([0 0],[0 0],'k')
        legendAppend("Vladimirov et al. 2008")
    end
    plot(squeeze(lnV(1,2,:)),squeeze(Cauchy(1,2,:)));
    legendAppend("Step120")
    xlabel('lnV_{12}')
    ylabel('Cauchy_{12}')
    axis([-0.6 0.6 -600 600])

%     figure(2)
%     plot(squeeze(F(1,2,:)),squeeze(Cauchy(1,2,:)));
%     xlabel('F_{12}')
%     ylabel('Cauchy_{12}')
%     % axis([-0.6 0.6 -600 600])
%     axis([0 2 -600 600])
% 
%     disp("principal stress errors:")
%     prinStress = eig(squeeze(Cauchy(:,:,end)));
%     (prinStress(3)-549.5068)/(677.3260986)
%     (prinStress(2)-1.2518)/(677.3260986)
%     (prinStress(1)--547.0013)/(677.3260986)
end