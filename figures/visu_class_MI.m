
clear all
close all
addpath(genpath('..'))

%% Loading dataset

dataset='MI';
subject=1;
[xapp,yapp,xtest,ytest]=get_dataset(dataset,subject);

xapp=xapp(:,[1 6]);
xtest=xtest(:,[1 6]);

%% Dataset visualization

figure(1)
i1=1;
i2=2;
plot(xapp(yapp==1,i1),xapp(yapp==1,i2),'+r')
hold on
plot(xapp(yapp==-1,i1),xapp(yapp==-1,i2),'x')
hold off
title('MI dataset training')
legend('Class +1','Class -1')
xlabel(['feature ' num2str(i1)])
ylabel(['feature ' num2str(i2)])


%% LDA classifier + visu

lambda=1e2;
[w,w0]=ldaclass(xapp,yapp,lambda)

ypred_app=xapp*w+w0;
ypred_test=xtest*w+w0;

ACC_app=mean(sign(ypred_app)==yapp)
ACC_test=mean(sign(ypred_test)==ytest)

%% SVM classifier + visu

lambda=1e2;
[w2,w02]=lsvmclass(xapp,yapp,lambda)

ypred_app=xapp*w2+w02;
ypred_test=xtest*w2+w02;

ACC2_app=mean(sign(ypred_app)==yapp)
ACC2_test=mean(sign(ypred_test)==ytest)


%% plot discriminant function

lw=2;
fs=16;


xc=linspace(9.5,13);
yc=(-w0-xc*w(1))/w(2);
yc2=(-w02-xc*w2(1))/w2(2);

figure(2)
set(gcf,'defaulttextinterpreter','latex');
plot(xapp(yapp==1,1),xapp(yapp==1,2),'+r')
hold on
plot(xapp(yapp==-1,1),xapp(yapp==-1,2),'x')
ylim([9 12.5])
plot(xc,yc,'k')
plot(xc,yc2,'g')
hold off
title('Classification Imagerie Motrice','FontSize',fs)

l=legend('Classe +1 ','Classe -1 ','f(x) LDA','f(x) SVM','Location','NorthEast');
set(l,'FontSize',fs,'interpreter','latex')
xlabel(['CSP 1'],'FontSize',fs)
ylabel(['CSP 2'],'FontSize',fs)
print('-depsc','visu_class_MI.eps')


