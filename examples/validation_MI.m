
clear all
close all
addpath(genpath('..'))

%% Loading dataset

dataset='MI';
subject=3;
[xapp,yapp,xtest,ytest]=get_dataset(dataset,subject);

%xapp=xapp(:,[1 6]);
%xtest=xtest(:,[1 6]);



%% test classification


lambda=1;

% classsifier on training data
[w,w0]=ldaclass(xapp,yapp,lambda);
ypred_test=xtest*w+w0;

perf_test=perf_classif(ytest,ypred_test)


%% Validation for estimating performance


lambda=100;

estim=@(x,y) ldaclass(x,y,lambda);
valid='random';
param=[.7, 100];
perf_type='ACC'



[perf,perf_list]=valid_classif(xapp,yapp,estim,perf_type,valid,param);
perf


