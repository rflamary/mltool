function [xapp,yapp,xtest,ytest]=get_dataset(dataset,options)
%  [xapp,yapp,xtest,ytest]=get_dataset(dataset)
% 
% Input:
%  dataset : type of dataset defalt='M1'
%       - 'MI': motor imagery
%           options : subject number (1->9)



if nargin<2
    options=1;
end

switch dataset
    
    case 'MI'
        load('MI_train')
        load('MI_test')
        
        xapp=featureTrainSet{options};
        yapp=xapp(:,end);
        xapp=xapp(:,1:end-1);
        
        yapp=(yapp==2)-(yapp==1);
    
        xtest=featureTestSet{options};
        ytest=xtest(:,end);
        xtest=xtest(:,1:end-1);    
        
        ytest=(ytest==2)-(ytest==1);
    
    otherwise 
        error('unknown dataset')
end
