function [w,w0]=ldaclass(X,Y,lambda)

if nargin<3
    lambda=0;
end

lambda=lambda;

Xp=X(Y==1,:);
Xn=X(Y==-1,:);

CVp=cov(Xp);
CVn=cov(Xn);

mp=mean(Xp);
mn=mean(Xn);

w=(CVp+CVn+lambda*eye(size(X,2)))\(mp-mn)';

w0=-(mp+mn)*w/2;