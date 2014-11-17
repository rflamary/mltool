function perf=perf_reg(ytrue,ypred)
% perf=performance(y,ypred)
% Returns a struct containing performances on data 
% ytrue with the predicted values ypred for continuous
% prediction
%
% perf: 
%   perf.MSE    : mrean square error
%   perf.corr   : correlation coefficient
%   perf.MAE    : means absolute error
%   

perf=struct();


perf.MSE=mean((ytrue-ypred).^2);

perf.corr=ytrue'*ypred/(norm(ytrue)*norm(ypred));

perf.MAE=mean(abs(ytrue-ypred));
