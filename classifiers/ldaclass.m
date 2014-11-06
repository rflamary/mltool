function [w,w0]=ldaclass(X,Y,lambda)
% [w,w0]=ldaclass(X,Y,lambda)
% LDA linear classifier
% Input:
%   X : (n x d) training example
%   Y : (n) binary (-1,1) training labels
%   lambda : (optional) quadratic regularization parameter
%
% Output: pred func f(x)=x'*w+w0
%   w (d) : normal to hyperplane vector
%   w0  : classifier bias

if nargin<3
    lambda=0;
end

Xp=X(Y==1,:);
Xn=X(Y==-1,:);

CVp=cov(Xp);
CVn=cov(Xn);

mp=mean(Xp);
mn=mean(Xn);

w=(CVp+CVn+lambda*eye(size(X,2)))\(mp-mn)';

w0=-(mp+mn)*w/2;