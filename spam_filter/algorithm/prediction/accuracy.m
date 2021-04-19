function [precision, accuracy, recall] = accuracy(y_predict, y)

	true_predict = sum(y_predict == y); %True positive + True negative
	false_predict = length(y_predict) - true_predict;%False positive + false negative

	true_positive = 0;
	false_positive = 0;
	true_negative = 0;
	false_negative = 0;

	for i = 1:length(y_predict)
		if(y_predict(i) == 1) 
			if(y(i) == 1)
				true_positive += 1;
			else
				false_positive += 1;
			end
		else
			if(y(i) == 0)
				true_negative += 1;
			else
				false_negative += 1;
			end
		end
	endfor
	%Sanity check
	%disp(isequal((true_positive+true_negative), true_predict));
	%disp(isequal((false_positive+false_negative), false_predict));

	accuracy = true_predict/(true_predict + false_predict);
	precision = true_positive/(true_positive + false_positive);
	recall = true_positive/(true_positive + false_negative);
	F1 = (2*precision*recall)/(precision+recall);

	fprintf("Accuracy: %f%% (%i out of %i)\n",accuracy*100,true_predict, length(y_predict));
	fprintf("Precision: %f%% (Predict 1's: %i and about %i is correct) \n",precision*100, true_positive + false_positive, true_positive);
	fprintf("Recall: %f%% (Got:%i correct out of actual 1's: %i)\n",recall*100, true_positive, true_positive + false_negative);
	fprintf("F1 score: %f\n",F1);
end	
