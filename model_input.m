function model_input()
clc, clear,close all hidden
beta=0.410;epsilon=0.049;delta=0.083;rho=0.1;omega=0.073;sigma=1.7;kappa=0.50;meu=0.20;alpha=2.57;omegaI=0.10;omegaQ=0.50;
options = odeset('RelTol',1e-9,'AbsTol',1e-9);
tspan=0:1:20;
[t,y]=ode45(@model_controlled,tspan,[16 0 1 0 0],options,beta,epsilon,delta,kappa,rho,meu,alpha,omega,sigma,omegaI,omegaQ);%6000 0.047 0.026 0.012 0

plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4),t,y(:,5));
%plot(t,y(:,3));
title('SEIQR Ebola model with quarantine as intervention');
xlabel('time (weeks)');
ylabel('Population(hundred thousands)');
legend('susceptible','exposed','infectives','quarantined','recovered')
% figure(1)
% plot(t,y(:,1));
% %plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4));
% %plot(t,y(:,3));
% title('SEIQR Ebola model');
% xlabel('time (months)');
% ylabel('cummulative cases');
% %legend('susceptible','exposed','infectives','recoveries')
% legend('Susceptible')
% %axis([0 12 0 600])
% 
% figure(2)
% plot(t,y(:,2));
% xlabel('time (months)');
% ylabel('cummulative cases');
% title('SEIQR Ebola model');
% legend('Exposed')

% figure(3)
% plot(t,y(:,3));
% title('SEIQR Ebola model');
% xlabel('time (months)');
% ylabel('cummulative cases');
% %legend('Infected')
% 
% hold on
% % 
% [v,T,vT]=xlsread('plotEbolaDataNoControl.xlsx');
% % 'xlsx' for exell 2007
% %v: Double
% %T and vT : cell
% %use v containing numbers 
% t=v(:,1);y=v(:,2);
% % we use moving average to smoothen the data
% c=smooth(y);
% yy=reshape(c,25,1);
% %if u have to plot second column depending on first:
% plot(t,yy)

%for Sierre Leone plot use [1100 0 1 0 0] and tspan=0:1:35; and beta=0.0003;epsilon=0.0048
%for Liberia use [800 0 1 0 0] and tspan=0:1:27; and beta=0.0003;epsilon=0.0048