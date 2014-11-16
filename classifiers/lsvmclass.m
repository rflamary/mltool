function [w,w0,obj]=lsvmclass(X0,Y,lambda)
% [w,w0]=lsvmclass(X,Y,lambda)
% LDA linear classifier
% Input:
%   X : (n x d) training example
%   Y : (n) binary (-1,1) training labels
%   lambda : (optional) quadratic regularization parameter
%
% Output: pred func f(x)=x'*w+w0
%   w (d) : normal to hyperplane vector
%   w0  : classifier bias


global X;
X=X0;
if nargin<3
    lambda=1e-6;
end


[w, w0,obj]=primal_svm(1,Y,lambda); 
