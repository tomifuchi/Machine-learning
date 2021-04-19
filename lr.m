%Edit and run this routine when needed.
%Presummed 
%X_train y_train, X_cv y_cv, X_test y_test is set up
graphics_toolkit('gnuplot');


num_label = 1; %Predict it's a spam

%Strip the numbering if not needed at the moment
%This is available for further feature engineering purposes. See what the algorithm is missing
%Then using these numbering you can find the email that the algorithm missed. Then go back
%redesign, the features.
if (numbered == 1)
  numbered = 0;
  X_set1 = X_set1(:,2:end);
  X_set1_train = X_set1_train(:,2:end);
  X_set1_cv = X_set1_cv(:,2:end);
  X_set1_test = X_set1_test(:,2:end);
  
  X_set2 = X_set2(:,2:end);
  X_set2_train = X_set2_train(:,2:end);
  X_set2_cv = X_set2_cv(:,2:end);
  X_set2_test = X_set2_test(:,2:end);

  X_set3 = X_set3(:,2:end);
  X_set3_train = X_set3_train(:,2:end);
  X_set3_cv = X_set3_cv(:,2:end);
  X_set3_test = X_set3_test(:,2:end);

  X_set4 = X_set4(:,2:end);
  X_set4_train = X_set4_train(:,2:end);
  X_set4_cv = X_set4_cv(:,2:end);
  X_set4_test = X_set4_test(:,2:end);
  fprintf("cleared");
endif

%In total of diversify set is 300 elements
%first 100 of set 4 2 1 
  X_diversifed = [X_set4(1:100,:);X_set2(1:100,:);X_set1(1:100,:)]; 
  y_diversifed= [y_set4(1:100);y_set2(1:100);y_set1(1:100)];

%Configurations
%Set 1 is 0.3
%Set 2 is 0.6
%Set 3 is 1.25
%Set 4 is 0.4
best_lambda = 0.4; %Around 0.3 is best on average find_lambda runs
%Step
interval = 1;

%Find best lambda
%==================
%[best_lambda , error_train, error_cv] = ...
%    find_lambda(X_set4_train, y_set4_train, X_set4_cv, y_set4_cv, num_label,...
%    [0.1 0.2 0.3 0.4 0.5]);

%%Learning curve
%%================
%%Learning curve diagnosing, we can loop through to find best lambda
%	[error_train, error_cv] = learningCurve(X_set2_train,y_set2_train, X_set2_cv, y_set2_cv,...
%	num_label,best_lambda, interval);

%F1 score
%Set 3 vs all 
%Set 1: 0.439915
%Set 2: 0.4411

%Set 1 vs all
%Set 2: 0.3785
%Set 3: 0.874131

%Set 2 vs all
%Set 1: 0.2921
%Set 3: 0.876715

%Set 3 and set2
%Set 1: 0.41

%Set 3 and 1
%Set 2: 0.657354

%Set 1 and set 2
%set 3: 0.9016

threshold = 0.30; %threshold for h_theta, 24% seems to strike a balance
%%Getting the best theta
	[theta] = oneVsAll(X_diversifed, y_diversifed, num_label, best_lambda);

	%Against set 1
	fprintf("\nAgaisnt set 1\n");
	fprintf("================\n");
	y_predict = predictOneVsAll(theta, X_set1, num_label, threshold);
	accuracy(y_predict, y_set1);
	fprintf("General cost is: %f\n",lrCostFunction(theta', X_set1, y_set1, 0.3));
	fprintf("--------------------\n");

	%Against set 2
	fprintf("\nAgaisnt set 2\n");
	fprintf("================\n");
	y_predict = predictOneVsAll(theta, X_set2, num_label, threshold);
	accuracy(y_predict, y_set2);
	fprintf("General cost is: %f\n",lrCostFunction(theta', X_set2, y_set2, 0.66));
	fprintf("--------------------\n");

	%Against set 3
	fprintf("\nAgaisnt set 3\n");
	fprintf("================\n");
	y_predict = predictOneVsAll(theta, X_set3, num_label, threshold);
	accuracy(y_predict, y_set3);
	fprintf("General cost is: %f\n",lrCostFunction(theta', X_set3, y_set3, 1.25));
	fprintf("--------------------\n");

	%Against set 4
	fprintf("\nAgaisnt set 4\n");
	fprintf("================\n");
	y_predict = predictOneVsAll(theta, X_set4, num_label, threshold);
	accuracy(y_predict, y_set4);
	fprintf("General cost is: %f\n",lrCostFunction(theta', X_set4, y_set4, 0.4));
	fprintf("--------------------\n");
