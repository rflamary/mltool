
clear all
close all
addpath(genpath('..'))

%% Dataset generation

d=2;
n=50;
noise=.5;

y=[ones(n/2,1);-ones(n/2,1)];
x=[1+noise*randn(n/2,2);-1+noise*randn(n/2,2)];


%% Dataset 2D visu

figure(1)

plot(x(y==1,1),x(y==1,2),'+r')
hold on
plot(x(y==-1,1),x(y==-1,2),'x')
hold off
title('Toy 2D example')
legend('Class +1','Class -1','Location','SouthEast')

%% LDA classifier + visu

lambda=1e-0;
[w,w0]=ldaclass(x,y,lambda)

ypred=x*w+w0;

ACC_app=mean(sign(ypred)==y)


% plot discriminant function
xc=linspace(-2.5,2.5);
yc=(-w0-xc*w(1))/w(2);

figure(2)
plot(x(y==1,1),x(y==1,2),'+r')
hold on
plot(x(y==-1,1),x(y==-1,2),'x')
plot(xc,yc,'k')
hold off
title('Toy 2D example')
legend('Class +1','Class -1','LDA decision function','Location','SouthEast')

