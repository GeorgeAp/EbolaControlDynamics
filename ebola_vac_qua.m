function dy=ebola_vac_qua(t,y)
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
beta=0.112;epsilon=0.029;delta=0.083;rho=0.1;omega=0.073;sigma=1.7;kappa=0.90;meu=0.20;alpha=2.57;omegaI=0.10;omegaQ=0.50;psi=0.7353;
%%
% dy=zeros(5,1);
% dy(1)=-beta*y(1)*y(3)-epsilon*y(1)*y(5)-omega*y(1)+alpha*y(5)-psi*y(1)+sigma;
% dy(2)=beta*y(1)*y(3)+epsilon*y(1)*y(5)-delta*y(2)-omega*y(2)-psi*y(2);
% dy(3)=delta*y(2)-(kappa+rho+omegaI)*y(3);
% dy(4)=kappa*y(3)-meu*y(4)-omegaQ*y(4);
% dy(5)=rho*y(3)+meu*y(4)-alpha*y(5)+psi*y(2)+psi*y(1);
dy=zeros(4,1);
dy(1)=-beta*y(1)*y(3)-epsilon*y(1)*y(4)-omega*y(1)+sigma;
dy(2)=beta*y(1)*y(3)+epsilon*y(1)*y(4)-delta*y(2)-omega*y(2);
dy(3)=delta*y(2)-rho*y(3);
dy(4)=rho*y(3);