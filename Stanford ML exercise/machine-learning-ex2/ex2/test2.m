X=[1 1;1 2;1 3];
y=[1;1];
theta=[1;1];
lambda=2;
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
