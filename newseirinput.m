function newseirinput()
clc, clear,close all hidden
beta=0.33;lamda=5.30;gamma=5.61;
options = odeset('RelTol',1e-9,'AbsTol',1e-9); 
[t,y]=ode45(@newseir,[0,12],[3000 0 0 0],options,beta,lamda,gamma);
figure(1)
plot(t,y(:,1));
%plot(t,y(:,1),t,y(:,2),t,y(:,3),t,y(:,4));
title('SEIR Ebola model');
xlabel('time (Months)');
ylabel('component of compartment');
%legend('susceptible','exposed','infectives','recoveries')
legend('Susceptible');

figure(2)
plot(t,y(:,2));
title('SEIR Ebola model');
xlabel('time (Months)');
ylabel('component of compartment');
legend('Exposed');

figure(3)
plot(t,y(:,3));
title('SEIR Ebola model');
xlabel('time (Months)');
ylabel('component of compartment');
legend('Infected');

figure(4)
plot(t,y(:,4));
title('SEIR Ebola model');
xlabel('time (Months)');
ylabel('component of compartment');
legend('Recoveries');