
clear all
close all
addpath(genpath('..'))

%% Loading dataset

dataset='MI';
subject=2;
[xapp,yapp,xtest,ytest]=get_dataset(dataset,subject);



%% Dataset visualization

figure(1)
i1=1;
i2=6;
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


