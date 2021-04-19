function [X] = raw2data(X_raw,pattern)
%X is cell array
%pattern is cell array

	m = size(X_raw,1); %m sample
	n = size(pattern); %n features

	X = zeros(m,n); %m x n

	%O(n^2)
	for i = 1 : m
		for j = 1 : n
			%Strictly match with word in pattern, case insenstive
			if(regexpi(X_raw{i},strcat("\\<",pattern{j},"\\>")))
				X(i,j) = 1;
			end
		endfor
	endfor
end
