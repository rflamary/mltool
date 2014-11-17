function [itrain,itest]=get_id_valid(n,valid,param)
% return index for train and test for validation
%
% Parameters:
%   n : number of samples
%   param : parameters for validation
%   valid : select the kind of validation 
%   'hold-out' : hold out
%       param= ratio of samples for train
%   'kfold' : K-fold cross-validation
%       param=K
%   'random' : random subsampling
%       param=[ratio of samples for train,nb sampling]
%   'loo-bootstrap' : leave_one-out bootstrap
%       param=[nb sampling]


switch valid
    
    case 'hold-out'
        ratio=param;
        nbt=round(ratio*n);
        
        itrain{1}=1:nbt;
        itest{1}=nbt+1:n;

    case {'kfold','k-fold'}
        k=param;
        idtemp=ceil((1:n)/n*k);
        for i=1:k
            itrain{i}=find(idtemp~=i);
            itest{i}=find(idtemp==i);           
        end
        
    case 'random'
        ratio=param(1);
        k=param(2);
        nbt=round(ratio*n);       
         
        for i=1:k
            id=randperm(n);
            itrain{i}=id(1:nbt);
            itest{i}=id(nbt+1:end);           
        end       
        
        
     case 'loo-bootstrap'
        
        k=param;
   
        for i=1:k
            idtrain=ceil(rand(n,1)*n);
            idtrain2=unique(idtrain);
            idtest=1:n;
            idtest(idtrain2)=[];
            itrain{i}=idtrain;
            itest{i}=idtest;           
        end              
        
    
   
    otherwise
        error('unknown validation method')
    
end

