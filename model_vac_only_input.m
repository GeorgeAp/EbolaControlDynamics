function model_vac_only_input()
clc, clear,close all hidden
beta=0.112;epsilon=0.029;delta=0.083;rho=0.1;omega=0.073;sigma=1.7;kappa=0.90;meu=0.20;alpha=2.57;omegaI=0.10;omegaQ=0.50;psi=0.2;
options = odeset('RelTol',1e-9,'AbsTol',1e-9);
tspan=0:1:20;
[t,y]=ode45(@model_vac_only,tspan,[16 0 1 0],options,beta,epsilon,delta,rho,alpha,omega,sigma,omegaI,psi);%6000 0.047 0.026 0.012 0

plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4));
%plot(t,y(:,3));
title('SEIR Ebola model with vaccination as interventions');
xlabel('time (weeks)');
ylabel('Population(hundred thousands)');
legend('susceptible','exposed','infectives','recovered')