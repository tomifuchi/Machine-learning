function [best_poly, error_train, error_cv] = ...
    find_poly(X_train, y_train, X_cv, y_cv, lambda)
%find_lambda: Generate the train and validation errors needed to select best degree 
%
%   Input:
%   X_train, y_train of train set
%   X_cv, y_cv of cross-validation set
%   
%   Output:
%   error_train: cost of train set as train polynomial degree increase 
%   (Not needed but it's good for visualization)
%   error_cv: cost of cross-validation set as polynomial degree increase
%   best_poly: best polynomial degree that yields lowest error_cv

% Selected values of poly (Change if needed) 
poly_vec = [2 3 4 5]';

% You need to return these variables correctly.
error_train = zeros(length(poly_vec), 1);
error_val = zeros(length(poly_vec), 1);

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
%
% For Linear regression
%=======================

% train X y with a polynomial degree -> theta -> error_cv
temp_X_train = [];
temp_X_cv= [];

for i = 1:length(poly_vec)
	%Add polynomial degrees
	temp_X_train = polyFeatures(X_train,poly_vec(i));
	temp_X_cv = polyFeatures(X_train,poly_vec(i));
	
	op_theta = trainLinearReg(temp_X_train,y_train,lambda);
	error_train(i) = linearRegCostFunction(temp_X_train,y_train,op_theta, 0);
	error_cv(i)= linearRegCostFunction(temp_X_cv,y_cv,op_theta, 0);
end
% Get the min
[min idx] = min(error_cv,[],2);
best_poly=poly_vec(idx);

%Plot if needed
%plot(poly_vec, error_train, poly_vec, error_cv);
%legend('Train', 'Cross Validation');
%xlabel('Poly');
%ylabel('Error');

%print if needed
%fprintf('Poly\t\tTrain Error\tValidation Error\n');
%for i = 1:length(poly_vec)
%	fprintf(' %f\t%f\t%f\n', ...
%            poly_vec(i), error_train(i), error_cv(i));
%end
%fprintf('poly: %f with lowest cv cost: %f.\n', best_poly, error_cv(idx));

end
