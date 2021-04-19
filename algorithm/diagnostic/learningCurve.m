function [error_train, error_cv, error_m] = ...
	learningCurve(X_train, y_train, X_cv, y_cv, num_label, lambda, interval=1)
% Learning curve Generates the train and cross validation set errors needed 
%
%   Input:
%   X_train, y_train of train set
%   X_cv, y_cv of cross-validation set
%   lambda: Regularization term
%   interval: step when going through m (Default is 1)
%   
%   m in practice can sometimes set into larger interval

%   Output:
%   error_train: cost of train set as train set size increase
%   error_cv: cost of cross-validation set as train set size increase

% Number of training examples
m = size(X_train, 1);

% You need to return these values correctly
error_train = [];
error_cv = [];

error_i = 0;
error_m = [];
% X and y for training set
% X_cv and y_cvfor cross-validation set
for i = 1:interval:m
	error_i +=1;
	fprintf('\nTraining size: %i/%i\n',i,m);
	fprintf('========================\n');
	op_theta = oneVsAll(X_train(1:i,:),y_train(1:i),num_label,lambda);
	op_theta = op_theta'; %Cost function requires this

	%error of train and cv
	error_train(error_i) = lrCostFunction(op_theta, X_train(1:i,:),y_train(1:i), 0);
	error_cv(error_i)= lrCostFunction(op_theta, X_cv,y_cv, 0);
	fprintf('train_cost: %f\n',error_train(error_i));
	fprintf('cross_cost: %f\n',error_cv(error_i));

	error_m = [error_m i];
endfor

%%%%Plot if needed
plot(error_m, error_train, error_m, error_cv);
title('Learning curve for mail is a spam');
legend('Train', 'Cross Validation');
xlabel('Number of training examples');
ylabel('Error');

%%%Print if needed
fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:error_i
    fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_cv(i));
end

end
