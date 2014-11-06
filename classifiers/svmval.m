function [y]=svmvallight(x,xsup,w,b)

% USAGE
% [y]=svmval(x,xsup,w,b)
%
% svmval computes the prediction of a support vector machine
%       using the kernel function and its parameter for classification
%		  or regression
%
% INPUT
% x    : input data
% xsup : support vector list    
% w    : weight
% kernel : string containing the type of kernel
% kerneloption : setting parameter of kernel.
% b   : bias. this can be a column vector in case of semiparametric SVM
% span : span matrix for semiparametric SVM
%

 ps= x *(xsup)';
            y=ps*w + b;

