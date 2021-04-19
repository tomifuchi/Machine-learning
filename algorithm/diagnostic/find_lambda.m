function [best_lambda , error_train, error_cv] = ...
    find_lambda(X_train, y_train, X_cv, y_cv, num_label, lambda_vec=[0:0.25:1])
%find_lambda: Generate the train and validation errors needed to select best lambda
%
%   Input:
%   X_train, y_train of train set
%   X_cv, y_cv of cross-validation set
%   
%   Output:
%   error_train: cost of train set as train lambda increase 
%   (Not needed but it's good for visualization)
%   error_cv: cost of cross-validation set as lambda increase
%   best_lambda: best lamda that lamdbathat yields lowest error_cv

% Selected values of lambda (Change if needed) 
% Strategy , binary search, define a big range, then zoom in slowly.
%lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.13 0.14 0.15 0.16 0.17 0.18 0.19 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

% Find size
m = size(X_train,1);

% X and y for training set
% X_cv and y_cvfor cross-validation set
% 
% Different algorithm change train and cost fnnction,keep argument.
% 
% The format for train should be
% train...(X,y,initial_theta,lambda)
% and cost function

% train X y with a lambda -> theta -> error_cv
for i = 1:length(lambda_vec)
	fprintf('\nLambda: %f (%i/%i)\n',lambda_vec(i), i, length(lambda_vec));
	fprintf('========================\n');
	op_theta = oneVsAll(X_train, y_train, num_label, lambda_vec(i));

	%Flip op theta
	op_theta = op_theta';

	error_train(i) = lrCostFunction(op_theta, X_train, y_train, 0);
	error_cv(i) = lrCostFunction(op_theta, X_cv, y_cv, 0);

	[min_cost idx] = min(error_cv,[],2);
	best_lambda = lambda_vec(idx);
	fprintf('train_cost: %f\n',error_train(i));
	fprintf('cross_cost: %f\n',error_cv(i));
	fprintf('best_lambda: %f, min cross_cost: %f\n', best_lambda, min_cost);
end
%% Get the min
%[min idx] = min(error_cv,[],2);
%best_lambda = lambda_vec(idx);

%Plot if needed
plot(lambda_vec, error_train, lambda_vec, error_cv);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

%print if needed
fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_cv(i));
end
fprintf('Lambda: %f with lowest cv cost: %f.\n', best_lambda, error_cv(idx));

end
