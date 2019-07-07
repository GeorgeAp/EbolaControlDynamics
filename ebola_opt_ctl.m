function y = ebola_opt_ctl(beta,epsilon,delta,rho,meu,alpha,omega,sigma,omegaI,omegaQ,T,S0,E0,I0,Q0,R0,c1,c2)

con_delta = 0.1;
test =con_delta + 1;

M=100;
h=T/M;
t=linspace(0,T,M+1);

S=zeros(1,M+1);
E=zeros(1,M+1);
I=zeros(1,M+1);
Q=zeros(1,M+1);
R=zeros(1,M+1);

S(1)=S0;
E(1)=E0;
I(1)=I0;
Q(1)=Q0;
R(1)=R0;

p1=zeros(1,M+1);
p2=zeros(1,M+1);
p3=zeros(1,M+1);
p4=zeros(1,M+1);
p5=zeros(1,M+1);

u1=zeros(1,M+1)+0.5;
u2=zeros(1,M+1)+0.5;

while(test > con_delta)
oldu1 = u1;
oldu2 = u2;
% 
% oldS = S;
% oldE = E;
% oldI = I;
% oldQ = Q;
% oldR = R;
% 
% oldp1 = p1;
% oldp2 = p2;
% oldp3 = p3;
% oldp4 = p4;
% oldp5 = P5;

%state equations
    for i = 1:M
        m1=-beta*S(i)*I(i)-epsilon*S(i)*R(i)-omega*S(i)+alpha*R(i)-u1(i)*S(i)+sigma;
        m2=beta*S(i)*I(i)+epsilon*S(i)*R(i)-delta*E(i)-omega*E(i)-u1(i)*E(i);
        m3=delta*E(i)-(rho+omegaI)*I(i)-u2(i)*I(i);
        m4=u2(i)*I(i)-meu*Q(i)-omegaQ*Q(i);
        m5=rho*I(i)+meu*Q(i)-alpha*R(i)+u1(i)*E(i)+u1(i)*S(i);
        S(i+1)=S(i)+h*m1;
        E(i+1)=E(i)+h*m2;
        I(i+1)=I(i)+h*m3;
        Q(i+1)=Q(i)+h*m4;
        R(i+1)=R(i)+h*m5;
    end
    %adjoint equations
    for i=1:M
        j=M+1-i;
        m1=p1(j+1)*beta*I(j+1)+p1(j+1)*epsilon*R(j+1)+omega*p1(j+1)+u1(j+1)*p1(j+1)-p2(j+1)*beta*I(j+1)-p2(j+1)*epsilon*R(j+1)-p5(j+1)*u1(j+1);
        m2=delta*p2(j+1)+omega*p2(j+1)+p2(j+1)*u1(j+1)-p3(j+1)*delta-p5(j+1)*u1(j+1);
        m3=-1+beta*S(j+1)*p1(j+1)-beta*S(j+1)*p2(j+1)+p3(j+1)*rho+p3(j+1)*omegaI+p3(j+1)*u2(j+1)-p4(j+1)*u2(j+1)-p5(j+1)*rho;
        m4=(meu+omegaQ)*p4(j+1)-p5(j+1)*meu;
        m5=p1(j+1)*epsilon*S(j+1)-p1(j+1)*alpha-p2(j+1)*epsilon*S(j+1)+p5(j+1)*alpha;
        p1(j)=p1(j+1)-h*m1;
        p2(j)=p2(j+1)-h*m2;
        p3(j)=p3(j+1)-h*m3;
        p4(j)=p4(j+1)-h*m4;
        p5(j)=p5(j+1)-h*m5;
    end
    temp1=(S.*p1)./c1;
    temp2=(S.*p1)./c2;
    u_1 = min(1,max(0,temp1));
    u_2 = min(1,max(0,temp2));
    u1 = 0.5*(u_1 + oldu1);  
    u2 = 0.5*(u_2 + oldu2);
    
    test_1 = sum(abs(oldu1 - u1));
    test_2 = sum(abs(oldu2 - u2));
    test = min(test_1,test_2);
    
end
y(1,:)=t;
y(2,:)=S;
y(3,:)=E;
y(4,:)=I;
y(5,:)=Q;
y(6,:)=R;
y(7,:)=u1;
y(8,:)=u2;

    


    
    