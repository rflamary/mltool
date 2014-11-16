function perf=perf_classif(ytrue,ypred)
% perf=performance(y,ypred)
% Returns a struct containing performances on data 
% ytrue with the predicted values ypred for binary 
% classification
%
% perf: 
%   perf.ACC    : accuracy
%   perf.AUC    : Area Under the ROC Curve
%   perf.M      : Confusion matrix [1,-1] class
%   perf.Kappa  : Cohen's Kappa
%   

perf=struct();

y=ytrue;
yp=sign(ypred);
n=length(y);

perf.ACC=mean(y==yp);

perf.AUC=svmroccurve(ypred,ytrue);


M=[sum((y==1).*(yp==1)),sum((y==1).*(yp==-1));
   sum((y==-1).*(yp==1)),sum((y==-1).*(yp==-1))];

perf.M=M;

pe=((M(1,1)+M(1,2))*(M(1,1)+M(2,1))+(M(2,2)+M(1,2))*(M(2,2)+M(2,1)))/n^2;


perf.Kappa=(perf.ACC-pe)/(1-pe);