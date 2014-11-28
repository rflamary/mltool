
clear all
close all
addpath(genpath('..'))

%% Loading dataset

dataset='P300';
[xapp,yapp,xtest,ytest]=get_dataset(dataset);

%xapp=xapp(:,[1 6]);
%xtest=xtest(:,[1 6]);



%% LDA classifier + visu

lambda=1e0;
[w,w0]=ldaclass(xapp,yapp,lambda)

ypred_app=xapp*w+w0;
ypred_test=xtest*w+w0;

ACC_app=mean(sign(ypred_app)==yapp)
ACC_test=mean(sign(ypred_test)==ytest)

[AUC,tpr,fpr,b]=svmroccurve(ypred_test,ytest);
AUC

%% SVM classifier + visu

lambda=1e3;
[w2,w02]=lsvmclass(xapp,yapp,lambda)

ypred_app=xapp*w2+w02;
ypred_test=xtest*w2+w02;

ACC2_app=mean(sign(ypred_app)==yapp)
ACC2_test=mean(sign(ypred_test)==ytest)

[AUC2,tpr2,fpr2,b2]=svmroccurve(ypred_test,ytest);
%% plot discriminant function

lw=2;
fs=16;

figure(2)
set(gcf,'defaulttextinterpreter','latex');
plot(fpr,tpr)
hold on
plot(fpr2,tpr2,'r')
%plot(xapp(yapp==-1,1),xapp(yapp==-1,2),'')
%ylim([9 12.5])
plot([0 1],[0 1],'k')
hold off
title('Classification P300 Speller','FontSize',fs)

l=legend(['LDA, AUC=' num2str(AUC,3) '  \hspace{2mm}'],['SVM, AUC=' num2str(AUC2,3) '  '],'Classif. al\''eatoire','Location','SouthEast');
set(l,'FontSize',fs,'interpreter','latex')
xlabel(['FPR'],'FontSize',fs)
ylabel(['TPR'],'FontSize',fs)
print('-depsc','visu_AUC_P300.eps')


