function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

m=length(y);
n=size(X,2);
J = 0;m
grad = zeros(size(theta));
calc=0;
[J, grad] = costFunction(theta, X, y);
for i=2:n
  calc+=theta(i)^2;
  grad(i)=grad(i)+(lambda/m)*theta(i);
endfor
J=J+(lambda/(2*m))*calc;

% =============================================================

end
