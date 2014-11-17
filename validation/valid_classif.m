function [perf,perf_list]=valid_classif(x,y,estim,perf_type,valid,param)
% perf=valid_classif(x,y,estim,perf,valid,param)
% Perfom validation and return the average performance for a given 
% classifier estim and validation method valid
%
% Parameters:
%   x,y : binary classification data
%   estim : [w,w0]=estim(x,y) that returns a linear model
%   perf_type  : string the select the performance returned by perf_classif.m
%   valid,param : validation and param of function get_id_valid

n=length(y);

[itrain,itest]=get_id_valid(n,valid,param);
nbloop=length(itrain);

perf_list=zeros(nbloop,1);

% validation loop
for i=1:nbloop
   xapp=x(itrain{i},:);
   yapp=y(itrain{i},:);
   xtest=x(itest{i},:);
   ytest=y(itest{i},:);    
   
   [w,w0]=estim(xapp,yapp);
   
   ypred=xtest*w+w0;
   
   perf_temp=perf_classif(ytest,ypred);
   
   perf_list(i)=perf_temp.(perf_type);
   
   
end

perf=mean(perf_list);



