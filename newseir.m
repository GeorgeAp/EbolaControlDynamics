function dy=newseir(t,y,beta,gamma,lamda)
dy=zeros(4,1);
dy(1)= -beta*y(1)*y(3);
dy(2)= beta*y(1)*y(3)-lamda*y(2);
dy(3)= lamda*y(2)-gamma*y(3);
dy(4)= gamma*y(3);