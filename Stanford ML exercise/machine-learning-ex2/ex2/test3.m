X=[1 1;1 2;1 3];
m = size(X, 1); 
p=zeros(m,1);
g=zeros(m,1);
g=sigmoid(X*theta);
if g>=0.5
  p=1;
else
  p=0;
endif