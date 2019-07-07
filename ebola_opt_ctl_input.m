function ebola_opt_ctl_input()
clc, clear,close all hidden
    
beta=0.112;epsilon=0.029;delta=0.083;rho=0.1;omega=0.073;sigma=1.7;meu=0.20;alpha=2.57;omegaI=0.10;omegaQ=0.50;
T=20;S0=16;E0=0;I0=1;Q0=0;R0=0;c1=0.6;c2=0.4;
% M=[1:21]';
y1=ebola_opt_ctl(beta,epsilon,delta,rho,omega,sigma,meu,alpha,omegaI,omegaQ,T,S0,E0,I0,Q0,R0,c1,c2);

options = odeset('RelTol',1e-9,'AbsTol',1e-9);
t0 = 0;
y0 = [S0,E0,I0,R0];
[t y] = ode45(@ebola_vac_qua,[t0 T],y0,options);
disp('  ')
% figure(1)
% plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4));
% %plot(t,y(:,3));
% title('SEIQR Ebola model with quarantine and vaccination as interventions');
% xlabel('time (weeks)');
% ylabel('Population(hundred thousands)');
% legend('susceptible','exposed','infectives','quarantined','recovered')
% 
figure(1)
plot(y1(1,:),y1(2,:),y1(1,:),y1(3,:),y1(1,:),y1(4,:),y1(1,:),y1(5,:),y1(1,:),y1(6,:))
xlabel('time (weeks)');
ylabel('Population(hundred thousands)')
legend('susceptible','exposed','infectives','quarantined','recovered')

figure(2)
plot(t,y(:,1),y1(1,:),y1(2,:))
xlabel('time (weeks)');
ylabel('Susceptible(hundred thousands)')
legend('Without Optimal Control','Optimal Control')

figure(3)
plot(t,y(:,3),y1(1,:),y1(4,:))
xlabel('time (weeks)');
ylabel('Infected(hundred thousands)')
legend('Without Optimal Control','Optimal Control')

figure(4)
plot(y1(1,:),y1(7,:),y1(1,:),y1(8,:))
xlabel('time (weeks)');
ylabel('Controls')
legend('u1(t)','u2(t)')