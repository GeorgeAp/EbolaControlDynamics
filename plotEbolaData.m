[v,T,vT]=xlsread('plotEbolaDataNoControl.xlsx');
% 'xlsx' for exell 2007
%v: Double
%T and vT : cell
%use v containing numbers 
t=v(:,1);y=v(:,2);
c=smooth(y);
yy=reshape(c,25,1);
%if u have to plot second column depending on first:
plot(t,yy)
% we use moving average to smoothen the data