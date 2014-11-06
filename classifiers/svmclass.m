function [xsup,w,d,pos]=svmclass(x,y,c)
% USAGE [xsup,w,b,pos,timeps,alpha,obj]=svmclass(x,y,c)
%
% Support vector machine for CLASSIFICATION
% This routine classify the training set with a support vector machine
% using quadratic programming algorithm (active constraints method)
%
% INPUT
%
% Training set
%      x  		: input data 
%      y  		: output data
% parameters
%		c		: Bound on the lagrangian multipliers     
%	

[n un] = size(y);



%----------------------------------------------------------------------
%      monqp(H,b,c) solves the quadratic programming problem:
% 
%    min 0.5*x'Hx - d'x   subject to:  A'x = b  and  0 <= x <= c 
%     x    
%----------------------------------------------------------------------


ps= x *(x)';
H =ps.*(y*y'); 
e = ones(size(y));   
A=y;
b=0;
lambda=1e-8;
verbose=0;
[alpha , lambda , pos] = monqp(H,e,A,b,c,lambda,verbose);         

alphaall=zeros(size(e));
alphaall(pos)=alpha;

xsup = x(pos,:);
ysup = y(pos);
w = (alpha.*ysup);
d = lambda;

