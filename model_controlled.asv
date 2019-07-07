function dy=model_controlled(t,y,beta,epsilon,delta,kappa,rho,meu,alpha,omega,sigma,omegaI,omegaQ)
%%quarantined
%beta=0.160;epsilon=0.489;delta=0.1830;rho=0.500;kappa=0.197;meu=0.500;
% Beta is the transmission rate due to infective
% Epsilon is transmission rate due to unsafe burial
% Delta is the average incubation period
% Kappa probability of infective been quarantined
% Rho is the rate of removal of unquarantined infectives
% Meu is the rate of removal of quarantined infectives
% Alpha is the rate of recovery 
%%
dy=zeros(5,1);
dy(1)=-beta*y(1)*y(3)-epsilon*y(1)*y(5)-omega*y(1)+alpha*y(5)+sigma;
dy(2)=beta*y(1)*y(3)+epsilon*y(1)*y(5)-delta*y(2)-omega*y(2);
dy(3)=delta*y(2)-(kappa+rho+omegaI)*y(3);
dy(4)=kappa*y(3)-meu*y(4)-omegaQ*y(4);
dy(5)=rho*y(3)+meu*y(4)-alpha*y(5);