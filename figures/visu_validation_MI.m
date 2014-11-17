
clear all
close all
addpath(genpath('..'))

%% Loading dataset

dataset='MI';
subject=8;
[xapp,yapp,xtest,ytest]=get_dataset(dataset,subject);

%xapp=xapp(:,[1 6]);
%xtest=xtest(:,[1 6]);



%% validation parameters

lambda_list=logspace(-2,2,20);
nbl=length(lambda_list);

%hold out/random
ratio=.6;

% kfold param
K=5;

% random/loo-bootstrap
nbloop=100;

seed=1
rand('seed',seed)

perf_type='ACC'

for i=1:nbl
    
    lambda=lambda_list(i);
    estim=@(x,y) ldaclass(x,y,lambda);
    
    % hold-out
    loss_holdout(i)=valid_classif(xapp,yapp,estim,perf_type,'hold-out',ratio);
    
    % kfold
    loss_kfold(i)=valid_classif(xapp,yapp,estim,perf_type,'kfold',K);   

    % random
    loss_random(i)=valid_classif(xapp,yapp,estim,perf_type,'random',[ratio,nbloop]);     
 
    % loo-bootstrap
    loss_loob(i)=valid_classif(xapp,yapp,estim,perf_type,'loo-bootstrap',nbloop);        
    
    % model and true loss
    [w,w0]=ldaclass(xapp,yapp,lambda);
    ypred_test=xtest*w+w0;
    perf_test=perf_classif(ytest,ypred_test);
    
    true_loss(i)=perf_test.(perf_type);
    
    
    
end


%%
lw=2;
fs=16;

figure(1)
clf()
set(gcf,'defaulttextinterpreter','latex');
semilogx(lambda_list,true_loss)
hold on
plot(lambda_list,loss_holdout,'r')
plot(lambda_list,loss_kfold,'g')
plot(lambda_list,loss_random,'m')
plot(lambda_list,loss_loob,'c')
hold off
ylim([.9 1])
title('Validation en Imagerie Motrice','FontSize',fs)

l=legend('Perf r\''eelle en test ','Hold-out','Valid. K-fold','\''Echant. al\''eatoire','LOO-Bootstrap','Location','Southeast');
set(l,'FontSize',fs,'interpreter','latex')
xlabel(['$\lambda$'],'FontSize',fs)
ylabel(['TBR'],'FontSize',fs)
print('-depsc','visu_valid_MI.eps')



