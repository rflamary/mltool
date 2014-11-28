function   [C,metric]=ConfusionMatrix(ypred,ytrue,classcode)
%  [C,metric]=ConfusionMatrix(ypred,ytrue,classcode)
%
%  ypred and ytrue -1, 1
%  if classcode = 1 -1
%
%  TP FN
%  FP TN


C=zeros(2);
N=length(classcode);
for i=1:N
    for j=1:N
        C(i,j)=  length(  find(ypred==classcode(j) & ytrue == classcode(i)));
    end;
end;
nbpos=sum(ytrue==1);
nbneg=sum(ytrue==-1);
c=nbneg/nbpos;
if N==2
    metric.detection=C(1,1)/sum(C(1,:));

    if sum(C(:,1))~=0
        metric.precision=C(1,1)/(C(1,1)+C(2,1));
    else
        metric.precision=NaN;
    end;
    metric.recall=C(1,1)/(C(1,1)+C(1,2));
    metric.fmeasure=2*C(1,1)/(C(1,1)+C(2,1)+nbpos);
    metric.wracc=(4*c)/(1+c)^2*(C(1,1)-C(2,1));
else
    for i=1:N
        metric.accuracybyclass(i)=C(i,i)/sum(C(i,:));
        metric.falsedetectionbyclass(i)=(sum(C(:,i))-C(i,i))/sum(C(:,i));
    end
        
end
metric.accuracy=sum(diag(C))/sum(sum(C));