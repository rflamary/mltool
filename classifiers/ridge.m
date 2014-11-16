function [w,w0]=ridge(X,Y,lambda)
% [w,w0]=ridge(X,Y,lambda)
% Linear ridge regression
% Input:
%   X : (n x d) training example
%   Y : (n) binary (-1,1) training labels
%   lambda : (optional) quadratic regularization parameter
%
% Output: pred func f(x)=x'*w+w0
%   w (d) : weight for each variable
%   w0  : classifier bias

if nargin<3
    lambda=1e-8;
end

X1=[X ones(size(X,1),1)];

alpha=(X1'*X1+lambda*eye(size(X,2)+1))\X1'*Y;

w=alpha(1:end-1);

w0=alpha(end);