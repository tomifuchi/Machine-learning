function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. Besure to flip
%   the theta if it's mullple variable.

% Initialize some useful values
m = length(y); % number of training examples

% Add ones to the X matrix
X = [ones(m,1) X];

J = 0;
grad = zeros(size(theta));

h_theta = [];
%With any y either 1 or zero
h_theta = sigmoid(X*theta);%Hypothesis to a vector
cost = -y'*log(h_theta) - (1-y)'*log(1 - h_theta);
J = ((1/m) * cost) + (lambda/(2*m))*sum(theta(2:end).^2);
grad = ( (1/m) *  ((h_theta - y)'*X)')  + (lambda/m)*[0;theta(2:end)] ;%1/m Forgetabahit!!!


% =============================================================

grad = grad(:);

end
