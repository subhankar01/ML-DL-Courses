function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
m=size(pval,1);
predictions=zeros(m,1);
stepsize = (max(pval) - min(pval)) / 1000;
display(yval);
display(pval);
for epsilon=min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
 
predicted_positive=0;
true_positive=0;
actual_positive=0;
true_neg=0;
false_positive=0;
false_neg=0;

   for i=1:m
     predictions(i)=(pval(i)<epsilon);
   end
      for i=1:m
        if(predictions(i)==1 && yval(i)==1)
           true_positive+=1;
        elseif(predictions(i)==1 && yval(i)==0)
           false_positive+=1;
        elseif(predictions(i)==0 && yval(i)==1)
           false_neg+=1;
        else
           true_neg+=1;
        endif
     end
     
    predicted_positive=true_positive+false_positive;
    actual_positive=true_positive+false_neg;
    P=true_positive/predicted_positive;  %precision
    R=true_positive/actual_positive; %recall
    F1=(2*P*R)/(P+R);
    
  %=============================================================
      if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
      end
end

end
