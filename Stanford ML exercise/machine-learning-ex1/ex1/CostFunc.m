% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

m=length(y);
prediction=X*theta;
squared_err=(prediction-y).^2;
J=(1/(2*m))*sum(squared_err);






% =========================================================================

end
