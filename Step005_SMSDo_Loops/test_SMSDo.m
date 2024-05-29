clear,clc;
close all;

displacement=0.;
parameter=1;

[update,convergenceHistory]=SMSDo_Loops(displacement,parameter);

update

% Plot evolution of displacement and residual during iteration process
figure(1)
xlabel("displacement")
ylabel("residual abs(R)")
hold on
plot(convergenceHistory(:,1),convergenceHistory(:,2),'--x')

% Plot convergence to check quadratic rate of convergence
figure(2)
semilogy(convergenceHistory(:,2)/convergenceHistory(1,2),'-x')
xlabel("iterations")
ylabel("normalised residual abs(R)")
grid on
